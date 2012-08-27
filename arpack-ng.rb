require 'formula'

class ArpackNg < Formula
  homepage 'http://forge.scilab.org/index.php/p/arpack-ng'
  url 'http://forge.scilab.org/index.php/p/arpack-ng/downloads/get/arpack-ng_3.1.2.tar.gz'
  md5 '7644e234f219ec1a29849b6d7811a6b1'

  def install
    ENV['F77'] = 'ifort'
    ENV['FFLAGS'] = '-O3 -xhost'
    ENV['CC'] = 'icc'
    ENV['CFLAGS'] = '-O3 -xhost'

    configure_args = ["--disable-dependency-tracking", "--prefix=#{prefix}", "--enable-shared"]
    configure_args << "--with-blas=-mkl=parallel"
    configure_args << "--with-lapack=-mkl=parallel"
    configure_args << "--disable-static"

    system "./configure", *configure_args

    system "make install"
  end
end
