Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TlkuC-0004TP-99
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 19:31:42 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 20 Dec 2012 10:16:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,326,1355126400"; d="scan'208";a="267870541"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.4])
	by fmsmga002.fm.intel.com with ESMTP; 20 Dec 2012 10:16:45 -0800
Message-ID: <50D3560D.3040508@linux.intel.com>
Date: Thu, 20 Dec 2012 10:16:45 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Tarek El-Sherbiny <tarek.elsherbiny@gmail.com>
References: <CAB3sqtZrp=zQCbEp-+Vs4wokeN7gZs7T+bqaa3Qn6E6DhrcxPQ@mail.gmail.com>
In-Reply-To: <CAB3sqtZrp=zQCbEp-+Vs4wokeN7gZs7T+bqaa3Qn6E6DhrcxPQ@mail.gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Building OpenCV is failling
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Dec 2012 18:31:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/20/2012 08:47 AM, Tarek El-Sherbiny wrote:
> Hello,
>
> I'm building the graphics components for Freescale i.MX6 and OpenCV
> is failing. The actual error is in Python !
>
In Python?  It looks like it's not finding libatlas, it seems like you 
might have some host contamination issue also, but I can't be sure right 
now from this snippet.

Sau!

> Is there a solution to this problem?
>
> Thanks
>
> | _configtest
> | unable to execute _configtest: Exec format error
> | failure.
> | removing: _configtest.c _configtest.o _configtest
> | building data_files sources
> | build_src: building npy-pkg config files
> | running build_py
> | copying numpy/version.py -> build/lib.linux-i686-2.7/numpy
> | copying build/src.linux-i686-2.7/numpy/__config__.py ->
> build/lib.linux-i686-2.7/numpy
> | copying build/src.linux-i686-2.7/numpy/distutils/__config__.py ->
> build/lib.linux-i686-2.7/numpy/distutils
> | running build_clib
> | customize UnixCCompiler
> | customize UnixCCompiler using build_clib
> | running build_ext
> | customize UnixCCompiler
> | customize UnixCCompiler using build_ext
> | customize GnuFCompiler
> | customize IntelFCompiler
> | customize LaheyFCompiler
> | customize PGroupFCompiler
> | customize AbsoftFCompiler
> | customize NAGFCompiler
> | customize VastFCompiler
> | customize GnuFCompiler
> | customize CompaqFCompiler
> | customize IntelItaniumFCompiler
> | customize IntelEM64TFCompiler
> | customize Gnu95FCompiler
> | customize G95FCompiler
> | don't know how to compile Fortran code on platform 'posix'
> | warning: build_ext: f77_compiler=None is not available.
> |
> | building 'numpy.core._dotblas' extension
> | compiling C sources
> | C compiler: arm-poky-linux-gnueabi-gcc -march=armv7-a
> -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a9
> --sysroot=/data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/nitrogen6x
> -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g
> -feliminate-unused-debug-types -fPIC
> |
> | compile options: '-DNO_ATLAS_INFO=2 -Inumpy/core/blasdot
> -I/usr/include -Inumpy/core/include
> -Ibuild/src.linux-i686-2.7/numpy/core/include/numpy
> -Inumpy/core/src/private -Inumpy/core/src -Inumpy/core
> -Inumpy/core/src/npymath -Inumpy/core/src/multiarray
> -Inumpy/core/src/umath -Inumpy/core/include
> -I/data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/nitrogen6x/usr/include/python2.7
> -Ibuild/src.linux-i686-2.7/numpy/core/src/multiarray
> -Ibuild/src.linux-i686-2.7/numpy/core/src/umath -c'
> | arm-poky-linux-gnueabi-gcc: numpy/core/blasdot/_dotblas.c
> | cc1: warning: include location "/usr/include" is unsafe for
> cross-compilation [-Wpoison-system-directories]
> | arm-poky-linux-gnueabi-gcc -march=armv7-a -mthumb-interwork
> -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a9
> --sysroot=/data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/nitrogen6x
> -shared -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -O2 -pipe -g
> -feliminate-unused-debug-types
> build/temp.linux-i686-2.7/numpy/core/blasdot/_dotblas.o -L/usr/lib
> -L/data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/nitrogen6x/usr/lib
> -Lbuild/temp.linux-i686-2.7 -lf77blas -lcblas -latlas -lpython2.7 -o
> build/lib.linux-i686-2.7/numpy/core/_dotblas.so
> |
> /data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-linux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
> warning: library search path "/usr/lib" is unsafe for cross-compilation
> |
> /data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-linux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
> skipping incompatible /usr/lib/libf77blas.so when searching for -lf77blas
> |
> /data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-linux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
> skipping incompatible /usr/lib/libf77blas.a when searching for -lf77blas
> |
> /data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-linux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
> cannot find -lf77blas
> |
> /data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-linux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
> skipping incompatible /usr/lib/libcblas.so when searching for -lcblas
> |
> /data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-linux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
> skipping incompatible /usr/lib/libcblas.a when searching for -lcblas
> |
> /data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-linux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
> cannot find -lcblas
> |
> /data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-linux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
> skipping incompatible /usr/lib/libatlas.so when searching for -latlas
> |
> /data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-linux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
> skipping incompatible /usr/lib/libatlas.a when searching for -latlas
> |
> /data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-linux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
> cannot find -latlas
> | collect2: error: ld returned 1 exit status
> |
> /data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-linux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
> warning: library search path "/usr/lib" is unsafe for cross-compilation
> |
> /data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-linux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
> skipping incompatible /usr/lib/libf77blas.so when searching for -lf77blas
> |
> /data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-linux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
> skipping incompatible /usr/lib/libf77blas.a when searching for -lf77blas
> |
> /data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-linux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
> cannot find -lf77blas
> |
> /data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-linux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
> skipping incompatible /usr/lib/libcblas.so when searching for -lcblas
> |
> /data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-linux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
> skipping incompatible /usr/lib/libcblas.a when searching for -lcblas
> |
> /data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-linux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
> cannot find -lcblas
> |
> /data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-linux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
> skipping incompatible /usr/lib/libatlas.so when searching for -latlas
> |
> /data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-linux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
> skipping incompatible /usr/lib/libatlas.a when searching for -latlas
> |
> /data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-linux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
> cannot find -latlas
> | collect2: error: ld returned 1 exit status
> | error: Command "arm-poky-linux-gnueabi-gcc -march=armv7-a
> -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a9
> --sysroot=/data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/nitrogen6x
> -shared -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -O2 -pipe -g
> -feliminate-unused-debug-types
> build/temp.linux-i686-2.7/numpy/core/blasdot/_dotblas.o -L/usr/lib
> -L/data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/nitrogen6x/usr/lib
> -Lbuild/temp.linux-i686-2.7 -lf77blas -lcblas -latlas -lpython2.7 -o
> build/lib.linux-i686-2.7/numpy/core/_dotblas.so" failed with exit status 1
> | ERROR: python setup.py build_ext execution failed.
> | ERROR: Function failed: do_compile (see
> /data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/python-numpy-1.4.1-r4/temp/log.do_compile.25197
> for further information)
> ERROR: Task 6
> (/data/extend_homes/telsherbiny/work/fsl-t1/sources/meta-openembedded/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
> <http://python-numpy_1.4.1.bb>, do_compile) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 996 tasks of which 994 didn't need to be
> rerun and 1 failed.
> No currently running tasks (726 of 1002)
>
> Summary: 1 task failed:
>
> /data/extend_homes/telsherbiny/work/fsl-t1/sources/meta-openembedded/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
> <http://python-numpy_1.4.1.bb>, do_compile
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


