Received: from mail-qc0-f181.google.com ([209.85.216.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tarek.elsherbiny@gmail.com>) id 1TljVb-0001jW-KH
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 18:02:13 +0100
Received: by mail-qc0-f181.google.com with SMTP id x40so1933383qcp.40
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2012 08:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=Dq4A6mc0ztX8yypKAWe9lVtyPD19+xAo0YDEpbr+rKs=;
	b=EKTUcLv5sKBwFn/TDe+IomF7BOT699uzVqIZKh41UGGDl+LcE7oNV6VUUgJn4+gd5p
	pOtiH/gBUZ8dNeStgDW0PMGtpDaPgljLYnU3mOVnicVXfNeIQ/EKi9cQ8HnbJdn0pRPP
	klvMVqhRFBJiWSSWKCpou8xarvdD90yKBfFjocsBTy/saERaCEKkpdAiaZc8TqQ7P64y
	NheC4ykbZVQMMwIWR/T6JgY4UIpI807r/ia8/xIcSyUjsGUrC7WI20CBhOOXXToGmXDN
	2yb34H7gEzDRr+Es4TJt2ZLnTFBEwf+cc8pBVKsSil+1MHMtk+T+Ux3LGcui0Iiu6wOx
	3UHw==
MIME-Version: 1.0
Received: by 10.224.184.143 with SMTP id ck15mr4992804qab.67.1356022046566;
	Thu, 20 Dec 2012 08:47:26 -0800 (PST)
Received: by 10.224.204.135 with HTTP; Thu, 20 Dec 2012 08:47:26 -0800 (PST)
Date: Thu, 20 Dec 2012 16:47:26 +0000
Message-ID: <CAB3sqtZrp=zQCbEp-+Vs4wokeN7gZs7T+bqaa3Qn6E6DhrcxPQ@mail.gmail.com>
From: Tarek El-Sherbiny <tarek.elsherbiny@gmail.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Building OpenCV is failling
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
X-List-Received-Date: Thu, 20 Dec 2012 17:02:13 -0000
Content-Type: multipart/alternative; boundary=20cf30334fb564aa7704d14b7c04

--20cf30334fb564aa7704d14b7c04
Content-Type: text/plain; charset=ISO-8859-1

Hello,

I'm building the graphics components for Freescale i.MX6 and OpenCV
is failing. The actual error is in Python !

Is there a solution to this problem?

Thanks

| _configtest
| unable to execute _configtest: Exec format error
| failure.
| removing: _configtest.c _configtest.o _configtest
| building data_files sources
| build_src: building npy-pkg config files
| running build_py
| copying numpy/version.py -> build/lib.linux-i686-2.7/numpy
| copying build/src.linux-i686-2.7/numpy/__config__.py ->
build/lib.linux-i686-2.7/numpy
| copying build/src.linux-i686-2.7/numpy/distutils/__config__.py ->
build/lib.linux-i686-2.7/numpy/distutils
| running build_clib
| customize UnixCCompiler
| customize UnixCCompiler using build_clib
| running build_ext
| customize UnixCCompiler
| customize UnixCCompiler using build_ext
| customize GnuFCompiler
| customize IntelFCompiler
| customize LaheyFCompiler
| customize PGroupFCompiler
| customize AbsoftFCompiler
| customize NAGFCompiler
| customize VastFCompiler
| customize GnuFCompiler
| customize CompaqFCompiler
| customize IntelItaniumFCompiler
| customize IntelEM64TFCompiler
| customize Gnu95FCompiler
| customize G95FCompiler
| don't know how to compile Fortran code on platform 'posix'
| warning: build_ext: f77_compiler=None is not available.
|
| building 'numpy.core._dotblas' extension
| compiling C sources
| C compiler: arm-poky-linux-gnueabi-gcc -march=armv7-a -mthumb-interwork
-mfloat-abi=softfp -mfpu=neon -mtune=cortex-a9
--sysroot=/data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/nitrogen6x
-DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g
-feliminate-unused-debug-types -fPIC
|
| compile options: '-DNO_ATLAS_INFO=2 -Inumpy/core/blasdot -I/usr/include
-Inumpy/core/include -Ibuild/src.linux-i686-2.7/numpy/core/include/numpy
-Inumpy/core/src/private -Inumpy/core/src -Inumpy/core
-Inumpy/core/src/npymath -Inumpy/core/src/multiarray -Inumpy/core/src/umath
-Inumpy/core/include
-I/data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/nitrogen6x/usr/include/python2.7
-Ibuild/src.linux-i686-2.7/numpy/core/src/multiarray
-Ibuild/src.linux-i686-2.7/numpy/core/src/umath -c'
| arm-poky-linux-gnueabi-gcc: numpy/core/blasdot/_dotblas.c
| cc1: warning: include location "/usr/include" is unsafe for
cross-compilation [-Wpoison-system-directories]
| arm-poky-linux-gnueabi-gcc -march=armv7-a -mthumb-interwork
-mfloat-abi=softfp -mfpu=neon -mtune=cortex-a9
--sysroot=/data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/nitrogen6x
-shared -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -O2 -pipe -g
-feliminate-unused-debug-types
build/temp.linux-i686-2.7/numpy/core/blasdot/_dotblas.o -L/usr/lib
-L/data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/nitrogen6x/usr/lib
-Lbuild/temp.linux-i686-2.7 -lf77blas -lcblas -latlas -lpython2.7 -o
build/lib.linux-i686-2.7/numpy/core/_dotblas.so
|
/data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-linux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
warning: library search path "/usr/lib" is unsafe for cross-compilation
|
/data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-linux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
skipping incompatible /usr/lib/libf77blas.so when searching for -lf77blas
|
/data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-linux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
skipping incompatible /usr/lib/libf77blas.a when searching for -lf77blas
|
/data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-linux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
cannot find -lf77blas
|
/data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-linux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
skipping incompatible /usr/lib/libcblas.so when searching for -lcblas
|
/data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-linux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
skipping incompatible /usr/lib/libcblas.a when searching for -lcblas
|
/data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-linux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
cannot find -lcblas
|
/data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-linux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
skipping incompatible /usr/lib/libatlas.so when searching for -latlas
|
/data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-linux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
skipping incompatible /usr/lib/libatlas.a when searching for -latlas
|
/data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-linux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
cannot find -latlas
| collect2: error: ld returned 1 exit status
|
/data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-linux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
warning: library search path "/usr/lib" is unsafe for cross-compilation
|
/data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-linux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
skipping incompatible /usr/lib/libf77blas.so when searching for -lf77blas
|
/data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-linux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
skipping incompatible /usr/lib/libf77blas.a when searching for -lf77blas
|
/data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-linux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
cannot find -lf77blas
|
/data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-linux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
skipping incompatible /usr/lib/libcblas.so when searching for -lcblas
|
/data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-linux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
skipping incompatible /usr/lib/libcblas.a when searching for -lcblas
|
/data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-linux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
cannot find -lcblas
|
/data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-linux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
skipping incompatible /usr/lib/libatlas.so when searching for -latlas
|
/data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-linux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
skipping incompatible /usr/lib/libatlas.a when searching for -latlas
|
/data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-linux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
cannot find -latlas
| collect2: error: ld returned 1 exit status
| error: Command "arm-poky-linux-gnueabi-gcc -march=armv7-a
-mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a9
--sysroot=/data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/nitrogen6x
-shared -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -O2 -pipe -g
-feliminate-unused-debug-types
build/temp.linux-i686-2.7/numpy/core/blasdot/_dotblas.o -L/usr/lib
-L/data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/nitrogen6x/usr/lib
-Lbuild/temp.linux-i686-2.7 -lf77blas -lcblas -latlas -lpython2.7 -o
build/lib.linux-i686-2.7/numpy/core/_dotblas.so" failed with exit status 1
| ERROR: python setup.py build_ext execution failed.
| ERROR: Function failed: do_compile (see
/data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/python-numpy-1.4.1-r4/temp/log.do_compile.25197
for further information)
ERROR: Task 6
(/data/extend_homes/telsherbiny/work/fsl-t1/sources/meta-openembedded/meta-oe/recipes-devtools/python/
python-numpy_1.4.1.bb, do_compile) failed with exit code '1'
NOTE: Tasks Summary: Attempted 996 tasks of which 994 didn't need to be
rerun and 1 failed.
No currently running tasks (726 of 1002)

Summary: 1 task failed:

/data/extend_homes/telsherbiny/work/fsl-t1/sources/meta-openembedded/meta-oe/recipes-devtools/python/
python-numpy_1.4.1.bb, do_compile
Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--20cf30334fb564aa7704d14b7c04
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div style>I&#39;m building the graph=
ics components for Freescale i.MX6 and OpenCV is=A0failing. The actual erro=
r is in Python !</div><div style><br></div><div style>Is there a solution t=
o this problem?</div>
<div style><br></div><div style>Thanks</div><div style><br></div><div style=
><div>| _configtest</div><div>| unable to execute _configtest: Exec format =
error</div><div>| failure.</div><div>| removing: _configtest.c _configtest.=
o _configtest</div>
<div>| building data_files sources</div><div>| build_src: building npy-pkg =
config files</div><div>| running build_py</div><div>| copying numpy/version=
.py -&gt; build/lib.linux-i686-2.7/numpy</div><div>| copying build/src.linu=
x-i686-2.7/numpy/__config__.py -&gt; build/lib.linux-i686-2.7/numpy</div>
<div>| copying build/src.linux-i686-2.7/numpy/distutils/__config__.py -&gt;=
 build/lib.linux-i686-2.7/numpy/distutils</div><div>| running build_clib</d=
iv><div>| customize UnixCCompiler</div><div>| customize UnixCCompiler using=
 build_clib</div>
<div>| running build_ext</div><div>| customize UnixCCompiler</div><div>| cu=
stomize UnixCCompiler using build_ext</div><div>| customize GnuFCompiler</d=
iv><div>| customize IntelFCompiler</div><div>| customize LaheyFCompiler</di=
v>
<div>| customize PGroupFCompiler</div><div>| customize AbsoftFCompiler</div=
><div>| customize NAGFCompiler</div><div>| customize VastFCompiler</div><di=
v>| customize GnuFCompiler</div><div>| customize CompaqFCompiler</div><div>
| customize IntelItaniumFCompiler</div><div>| customize IntelEM64TFCompiler=
</div><div>| customize Gnu95FCompiler</div><div>| customize G95FCompiler</d=
iv><div>| don&#39;t know how to compile Fortran code on platform &#39;posix=
&#39;</div>
<div>| warning: build_ext: f77_compiler=3DNone is not available.</div><div>=
|=A0</div><div>| building &#39;numpy.core._dotblas&#39; extension</div><div=
>| compiling C sources</div><div>| C compiler: arm-poky-linux-gnueabi-gcc -=
march=3Darmv7-a -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon -mtune=
=3Dcortex-a9 --sysroot=3D/data/extend_homes/telsherbiny/work/fsl-t1/build/t=
mp/sysroots/nitrogen6x -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe =
-g -feliminate-unused-debug-types -fPIC</div>
<div>|=A0</div><div>| compile options: &#39;-DNO_ATLAS_INFO=3D2 -Inumpy/cor=
e/blasdot -I/usr/include -Inumpy/core/include -Ibuild/src.linux-i686-2.7/nu=
mpy/core/include/numpy -Inumpy/core/src/private -Inumpy/core/src -Inumpy/co=
re -Inumpy/core/src/npymath -Inumpy/core/src/multiarray -Inumpy/core/src/um=
ath -Inumpy/core/include -I/data/extend_homes/telsherbiny/work/fsl-t1/build=
/tmp/sysroots/nitrogen6x/usr/include/python2.7 -Ibuild/src.linux-i686-2.7/n=
umpy/core/src/multiarray -Ibuild/src.linux-i686-2.7/numpy/core/src/umath -c=
&#39;</div>
<div>| arm-poky-linux-gnueabi-gcc: numpy/core/blasdot/_dotblas.c</div><div>=
| cc1: warning: include location &quot;/usr/include&quot; is unsafe for cro=
ss-compilation [-Wpoison-system-directories]</div><div>| arm-poky-linux-gnu=
eabi-gcc -march=3Darmv7-a -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dne=
on -mtune=3Dcortex-a9 --sysroot=3D/data/extend_homes/telsherbiny/work/fsl-t=
1/build/tmp/sysroots/nitrogen6x -shared -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,=
--as-needed -O2 -pipe -g -feliminate-unused-debug-types build/temp.linux-i6=
86-2.7/numpy/core/blasdot/_dotblas.o -L/usr/lib -L/data/extend_homes/telshe=
rbiny/work/fsl-t1/build/tmp/sysroots/nitrogen6x/usr/lib -Lbuild/temp.linux-=
i686-2.7 -lf77blas -lcblas -latlas -lpython2.7 -o build/lib.linux-i686-2.7/=
numpy/core/_dotblas.so</div>
<div>| /data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-l=
inux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnue=
abi/4.7.2/ld: warning: library search path &quot;/usr/lib&quot; is unsafe f=
or cross-compilation</div>
<div>| /data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-l=
inux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnue=
abi/4.7.2/ld: skipping incompatible /usr/lib/libf77blas.so when searching f=
or -lf77blas</div>
<div>| /data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-l=
inux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnue=
abi/4.7.2/ld: skipping incompatible /usr/lib/libf77blas.a when searching fo=
r -lf77blas</div>
<div>| /data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-l=
inux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnue=
abi/4.7.2/ld: cannot find -lf77blas</div><div>| /data/extend_homes/telsherb=
iny/work/fsl-t1/build/tmp/sysroots/i686-linux/usr/libexec/armv7a-vfp-neon-p=
oky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld: skipping incompatibl=
e /usr/lib/libcblas.so when searching for -lcblas</div>
<div>| /data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-l=
inux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnue=
abi/4.7.2/ld: skipping incompatible /usr/lib/libcblas.a when searching for =
-lcblas</div>
<div>| /data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-l=
inux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnue=
abi/4.7.2/ld: cannot find -lcblas</div><div>| /data/extend_homes/telsherbin=
y/work/fsl-t1/build/tmp/sysroots/i686-linux/usr/libexec/armv7a-vfp-neon-pok=
y-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld: skipping incompatible =
/usr/lib/libatlas.so when searching for -latlas</div>
<div>| /data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-l=
inux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnue=
abi/4.7.2/ld: skipping incompatible /usr/lib/libatlas.a when searching for =
-latlas</div>
<div>| /data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-l=
inux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnue=
abi/4.7.2/ld: cannot find -latlas</div><div>| collect2: error: ld returned =
1 exit status</div>
<div>| /data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-l=
inux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnue=
abi/4.7.2/ld: warning: library search path &quot;/usr/lib&quot; is unsafe f=
or cross-compilation</div>
<div>| /data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-l=
inux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnue=
abi/4.7.2/ld: skipping incompatible /usr/lib/libf77blas.so when searching f=
or -lf77blas</div>
<div>| /data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-l=
inux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnue=
abi/4.7.2/ld: skipping incompatible /usr/lib/libf77blas.a when searching fo=
r -lf77blas</div>
<div>| /data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-l=
inux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnue=
abi/4.7.2/ld: cannot find -lf77blas</div><div>| /data/extend_homes/telsherb=
iny/work/fsl-t1/build/tmp/sysroots/i686-linux/usr/libexec/armv7a-vfp-neon-p=
oky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld: skipping incompatibl=
e /usr/lib/libcblas.so when searching for -lcblas</div>
<div>| /data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-l=
inux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnue=
abi/4.7.2/ld: skipping incompatible /usr/lib/libcblas.a when searching for =
-lcblas</div>
<div>| /data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-l=
inux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnue=
abi/4.7.2/ld: cannot find -lcblas</div><div>| /data/extend_homes/telsherbin=
y/work/fsl-t1/build/tmp/sysroots/i686-linux/usr/libexec/armv7a-vfp-neon-pok=
y-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld: skipping incompatible =
/usr/lib/libatlas.so when searching for -latlas</div>
<div>| /data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-l=
inux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnue=
abi/4.7.2/ld: skipping incompatible /usr/lib/libatlas.a when searching for =
-latlas</div>
<div>| /data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/i686-l=
inux/usr/libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnue=
abi/4.7.2/ld: cannot find -latlas</div><div>| collect2: error: ld returned =
1 exit status</div>
<div>| error: Command &quot;arm-poky-linux-gnueabi-gcc -march=3Darmv7-a -mt=
humb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a9 --sysro=
ot=3D/data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/sysroots/nitrogen=
6x -shared -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -O2 -pipe -g -fel=
iminate-unused-debug-types build/temp.linux-i686-2.7/numpy/core/blasdot/_do=
tblas.o -L/usr/lib -L/data/extend_homes/telsherbiny/work/fsl-t1/build/tmp/s=
ysroots/nitrogen6x/usr/lib -Lbuild/temp.linux-i686-2.7 -lf77blas -lcblas -l=
atlas -lpython2.7 -o build/lib.linux-i686-2.7/numpy/core/_dotblas.so&quot; =
failed with exit status 1</div>
<div>| ERROR: python setup.py build_ext execution failed.</div><div>| ERROR=
: Function failed: do_compile (see /data/extend_homes/telsherbiny/work/fsl-=
t1/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/python-numpy-1.4.1-r4/=
temp/log.do_compile.25197 for further information)</div>
<div>ERROR: Task 6 (/data/extend_homes/telsherbiny/work/fsl-t1/sources/meta=
-openembedded/meta-oe/recipes-devtools/python/<a href=3D"http://python-nump=
y_1.4.1.bb">python-numpy_1.4.1.bb</a>, do_compile) failed with exit code &#=
39;1&#39;</div>
<div>NOTE: Tasks Summary: Attempted 996 tasks of which 994 didn&#39;t need =
to be rerun and 1 failed.</div><div>No currently running tasks (726 of 1002=
)</div><div><br></div><div>Summary: 1 task failed:</div><div>=A0 /data/exte=
nd_homes/telsherbiny/work/fsl-t1/sources/meta-openembedded/meta-oe/recipes-=
devtools/python/<a href=3D"http://python-numpy_1.4.1.bb">python-numpy_1.4.1=
.bb</a>, do_compile</div>
<div>Summary: There was 1 ERROR message shown, returning a non-zero exit co=
de.</div><div><br></div></div></div>

--20cf30334fb564aa7704d14b7c04--
