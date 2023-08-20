Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77675EE4996
	for <webhook@archiver.kernel.org>; Sun, 20 Aug 2023 06:30:06 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.24801.1692513002875681344
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Aug 2023 23:30:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout03.t-online.de (Postfix) with SMTP id B474CD43;
	Sun, 20 Aug 2023 08:29:55 +0200 (CEST)
Received: from [192.168.178.58] ([84.163.41.50]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qXbwf-4Ez4xk0; Sun, 20 Aug 2023 08:29:53 +0200
Date: Sun, 20 Aug 2023 08:29:47 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv2] gtk4: upgrade 4.10.5 -> 4.12.0
To: Khem Raj <raj.khem@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Message-Id: <NDFOZR.U3CV22ITZBOG1@t-online.de>
In-Reply-To: <CAMKF1srb01=gFUx8CFh7seoNuN7yDP4m9DQfu2GsCLtCMMw66Q@mail.gmail.com>
References: <20230815145218.1561896-1-f_l_k@t-online.de>
	<CAMKF1spOpBLBQ4ENJGdidsCHbX0faejtvrB7rWmwPFBQjP2ZJQ@mail.gmail.com>
	<IHIJZR.16XNVQ6SKCIP1@t-online.de>
	<CAMKF1srb01=gFUx8CFh7seoNuN7yDP4m9DQfu2GsCLtCMMw66Q@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-F41MF6y9dB8r9pj1D8PS"
X-TOI-EXPURGATEID: 150726::1692512993-366FC16C-232D22D8/0/0 CLEAN NORMAL
X-TOI-MSGID: 0526116c-ff18-4442-a184-6b5cba660b08
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Aug 2023 06:30:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186407

--=-F41MF6y9dB8r9pj1D8PS
Content-Type: text/plain; charset=us-ascii; format=flowed

On Sat, Aug 19 2023 at 10:24:37 PM -07:00:00, Khem Raj 
<raj.khem@gmail.com> wrote:
> while it is interesting that you are using OE based distro on your
> build host, its not a combination thats commonly tested

Yes, however I didn't expect it to be well tested. In fact I'm amazed 
in how well it works already. I can do all the stuff I really need on 
this machine.
Basically it is just used to improve the image itself which is a fun 
project and for gaming and that works great.

Here's the log for the failed do_configure task:

DEBUG: Executing python function extend_recipe_sysroot
NOTE: Direct dependencies are 
['/home/flk/poky/meta/recipes-devtools/cmake/cmake-native_3.26.4.bb:do_populate_sysroot', 
'/home/flk/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', 
'virtual:native:/home/flk/poky/meta-clang/recipes-devtools/clang/clang_git.bb:do_populate_sysroot', 
'virtual:native:/home/flk/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 
'virtual:native:/home/flk/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 
'virtual:native:/home/flk/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_populate_sysroot']
NOTE: Installed into sysroot: []
NOTE: Skipping as already exists in sysroot: ['cmake-native', 
'quilt-native', 'clang-native', 'ninja-native', 'patch-native', 
'python3-native', 'libtool-native', 'attr-native', 're2c-native', 
'zlib-native', 'libffi-native', 'bzip2-native', 'ncurses-native', 
'xz-native', 'openssl-native', 'libnsl2-native', 'libtirpc-native', 
'gdbm-native', 'expat-native', 'util-linux-libuuid-native', 
'libedit-native', 'sqlite3-native', 'binutils-native', 
'libxml2-native', 'swig-native', 'zstd-native', 'texinfo-dummy-native', 
'gettext-minimal-native', 'perl-native', 'gnu-config-native', 
'flex-native', 'libpcre2-native', 'make-native', 'm4-native']
DEBUG: Python function extend_recipe_sysroot finished
DEBUG: Executing shell function do_configure
CMake Warning:
  Ignoring extra path from command line:

   
"/home/flk/poky/build/tmp/work-shared/llvm-project-source-16.0.6-r0/git/llvm"


-- The C compiler identification is Clang 16.0.6
-- The CXX compiler identification is Clang 16.0.6
-- The ASM compiler identification is Clang with GNU-like command-line
-- Found assembler: 
/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/usr/bin/clang
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - failed
-- Check for working C compiler: 
/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/usr/bin/clang
-- Check for working C compiler: 
/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/usr/bin/clang 
- broken
CMake Error at 
/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/usr/share/cmake-3.26/Modules/CMakeTestCCompiler.cmake:67 
(message):
  The C compiler

    
"/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/usr/bin/clang"

  is not able to compile a simple test program.

  It fails with the following output:

    Change Dir: 
/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/build/CMakeFiles/CMakeScratch/TryCompile-bgcv7F

    Run Build Command(s):ninja -v cmTC_ae66c && [1/2] 
/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/usr/bin/clang 
-target x86_64-linux 
-isystem/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/usr/include 
-O2 -pipe -MD -MT CMakeFiles/cmTC_ae66c.dir/testCCompiler.c.o -MF 
CMakeFiles/cmTC_ae66c.dir/testCCompiler.c.o.d -o 
CMakeFiles/cmTC_ae66c.dir/testCCompiler.c.o -c 
/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/build/CMakeFiles/CMakeScratch/TryCompile-bgcv7F/testCCompiler.c
    [2/2] : && 
/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/usr/bin/clang 
-target x86_64-linux 
-isystem/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/usr/include 
-O2 -pipe -target x86_64-linux 
-isystem/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/usr/include 
-L/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/usr/lib 
-L/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/lib 
-Wl,--enable-new-dtags 
-Wl,-rpath-link,/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/usr/lib 
-Wl,-rpath-link,/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/lib 
-Wl,-rpath,/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/usr/lib 
-Wl,-rpath,/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/lib 
-Wl,-O1 -unwindlib=libgcc -rtlib=libgcc -stdlib=libstdc++ 
-Wl,--allow-shlib-undefined 
-Wl,--dynamic-linker=/home/flk/poky/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2 
-rtlib=libgcc --unwindlib=libgcc 
-L/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/usr/lib 
-L/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/lib 
-Wl,--enable-new-dtags 
-Wl,-rpath-link,/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/usr/lib 
-Wl,-rpath-link,/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/lib 
-Wl,-rpath,/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/usr/lib 
-Wl,-rpath,/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/lib 
-Wl,-O1 -unwindlib=libgcc -rtlib=libgcc -stdlib=libstdc++ 
-Wl,--allow-shlib-undefined 
-Wl,--dynamic-linker=/home/flk/poky/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2 
-rtlib=libgcc --unwindlib=libgcc 
CMakeFiles/cmTC_ae66c.dir/testCCompiler.c.o -o cmTC_ae66c && :
    FAILED: cmTC_ae66c
    : && 
/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/usr/bin/clang 
-target x86_64-linux 
-isystem/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/usr/include 
-O2 -pipe -target x86_64-linux 
-isystem/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/usr/include 
-L/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/usr/lib 
-L/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/lib 
-Wl,--enable-new-dtags 
-Wl,-rpath-link,/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/usr/lib 
-Wl,-rpath-link,/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/lib 
-Wl,-rpath,/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/usr/lib 
-Wl,-rpath,/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/lib 
-Wl,-O1 -unwindlib=libgcc -rtlib=libgcc -stdlib=libstdc++ 
-Wl,--allow-shlib-undefined 
-Wl,--dynamic-linker=/home/flk/poky/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2 
-rtlib=libgcc --unwindlib=libgcc 
-L/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/usr/lib 
-L/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/lib 
-Wl,--enable-new-dtags 
-Wl,-rpath-link,/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/usr/lib 
-Wl,-rpath-link,/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/lib 
-Wl,-rpath,/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/usr/lib 
-Wl,-rpath,/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/lib 
-Wl,-O1 -unwindlib=libgcc -rtlib=libgcc -stdlib=libstdc++ 
-Wl,--allow-shlib-undefined 
-Wl,--dynamic-linker=/home/flk/poky/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2 
-rtlib=libgcc --unwindlib=libgcc 
CMakeFiles/cmTC_ae66c.dir/testCCompiler.c.o -o cmTC_ae66c && :
    /home/flk/poky/build/tmp/hosttools/ld: cannot find crtbeginS.o: No 
such file or directory
    /home/flk/poky/build/tmp/hosttools/ld: cannot find -lgcc: No such 
file or directory
    /home/flk/poky/build/tmp/hosttools/ld: cannot find -lgcc: No such 
file or directory
    clang-16: error: linker command failed with exit code 1 (use -v to 
see invocation)
    ninja: build stopped: subcommand failed.





  CMake will not be able to correctly generate this project.
Call Stack (most recent call first):
  CMakeLists.txt:10 (project)


-- Configuring incomplete, errors occurred!
WARNING: 
/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/temp/run.do_configure.6240:171 
exit 1 from 'cmake -G 'Ninja' -DCMAKE_MAKE_PROGRAM=ninja 
$oecmake_sitefile 
/home/flk/poky/build/tmp/work-shared/llvm-project-source-16.0.6-r0/git/llvm 
-DCMAKE_INSTALL_PREFIX:PATH=/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/usr 
-DCMAKE_INSTALL_BINDIR:PATH=bin -DCMAKE_INSTALL_SBINDIR:PATH=sbin 
-DCMAKE_INSTALL_LIBEXECDIR:PATH=libexec 
-DCMAKE_INSTALL_SYSCONFDIR:PATH=/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/etc 
-DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=../com 
-DCMAKE_INSTALL_LOCALSTATEDIR:PATH=/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/var 
-DCMAKE_INSTALL_LIBDIR:PATH=lib -DCMAKE_INSTALL_INCLUDEDIR:PATH=include 
-DCMAKE_INSTALL_DATAROOTDIR:PATH=share 
-DPYTHON_EXECUTABLE:PATH=/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/usr/bin/python3-native/python3 
-DPython_EXECUTABLE:PATH=/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/usr/bin/python3-native/python3 
-DPython3_EXECUTABLE:PATH=/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/usr/bin/python3-native/python3 
-DLIB_SUFFIX= -DCMAKE_INSTALL_SO_NO_EXE=0 
-DCMAKE_TOOLCHAIN_FILE=/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/toolchain.cmake 
-DCMAKE_NO_SYSTEM_FROM_IMPORTED=1 -DCMAKE_EXPORT_NO_PACKAGE_REGISTRY=ON 
-DFETCHCONTENT_FULLY_DISCONNECTED=ON -DCMAKE_BUILD_TYPE=RelWithDebInfo 
-DLLVM_ENABLE_PER_TARGET_RUNTIME_DIR=OFF -DCMAKE_CROSSCOMPILING=ON 
-DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=ON -DLLVM_ENABLE_RTTI=ON 
-DLIBUNWIND_ENABLE_CROSS_UNWINDING=ON 
-DLIBCXX_ENABLE_STATIC_ABI_LIBRARY=ON -DLIBCXXABI_INCLUDE_TESTS=OFF 
-DLIBCXXABI_ENABLE_SHARED=ON 
-DLIBCXXABI_LIBCXX_INCLUDES=/home/flk/poky/build/tmp/work-shared/llvm-project-source-16.0.6-r0/git/libcxx/include 
-DLIBCXX_CXX_ABI=libcxxabi 
-DLIBCXX_CXX_ABI_INCLUDE_PATHS=/home/flk/poky/build/tmp/work-shared/llvm-project-source-16.0.6-r0/git/libcxxabi/include 
-DLIBCXX_CXX_ABI_LIBRARY_PATH=/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/build/lib 
-S 
/home/flk/poky/build/tmp/work-shared/llvm-project-source-16.0.6-r0/git/runtimes 
-DLLVM_ENABLE_RUNTIMES='libcxx;libcxxabi;libunwind' 
-DLLVM_LIBDIR_SUFFIX= -DCMAKE_BUILD_WITH_INSTALL_RPATH=ON 
-DLIBCXXABI_ENABLE_EXCEPTIONS=ON -DDLIBCXX_ENABLE_EXCEPTIONS=ON 
-DLIBCXXABI_USE_LLVM_UNWINDER=ON -DLIBCXXABI_ENABLE_STATIC_UNWINDER=ON 
-DLIBUNWIND_ENABLE_SHARED=ON -Wno-dev'
WARNING: Backtrace (BB generated script):
 #1: cmake_do_configure, 
/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/temp/run.do_configure.6240, 
line 171
 #2: do_configure, 
/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/temp/run.do_configure.6240, 
line 150
 #3: main, 
/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/temp/run.do_configure.6240, 
line 207


--=-F41MF6y9dB8r9pj1D8PS
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">On Sat, Aug 19 2023 at 10:24:37 PM -07:=
00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type=3D"ci=
te"><div class=3D"plaintext" style=3D"white-space: break-spaces;">while it =
is interesting that you are using OE based distro on your
build host, its not a combination thats commonly tested</div></blockquote><=
div><br></div><div>Yes, however I didn't expect it to be well tested. In fa=
ct I'm amazed in how well it works already. I can do all the stuff I really=
 need on this machine.</div><div>Basically it is just used to improve the i=
mage itself which is a fun project and for gaming and that works great.</di=
v><div><br></div><div>Here's the log for the failed do_configure task:</div=
><div><br></div><div>DEBUG: Executing python function extend_recipe_sysroot=
</div><div>NOTE: Direct dependencies are ['/home/flk/poky/meta/recipes-devt=
ools/cmake/cmake-native_3.26.4.bb:do_populate_sysroot', '/home/flk/poky/met=
a/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', 'virtua=
l:native:/home/flk/poky/meta-clang/recipes-devtools/clang/clang_git.bb:do_p=
opulate_sysroot', 'virtual:native:/home/flk/poky/meta/recipes-devtools/ninj=
a/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/flk/poky/meta=
/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:nativ=
e:/home/flk/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_populate=
_sysroot']</div><div>NOTE: Installed into sysroot: []</div><div>NOTE: Skipp=
ing as already exists in sysroot: ['cmake-native', 'quilt-native', 'clang-n=
ative', 'ninja-native', 'patch-native', 'python3-native', 'libtool-native',=
 'attr-native', 're2c-native', 'zlib-native', 'libffi-native', 'bzip2-nativ=
e', 'ncurses-native', 'xz-native', 'openssl-native', 'libnsl2-native', 'lib=
tirpc-native', 'gdbm-native', 'expat-native', 'util-linux-libuuid-native', =
'libedit-native', 'sqlite3-native', 'binutils-native', 'libxml2-native', 's=
wig-native', 'zstd-native', 'texinfo-dummy-native', 'gettext-minimal-native=
', 'perl-native', 'gnu-config-native', 'flex-native', 'libpcre2-native', 'm=
ake-native', 'm4-native']</div><div>DEBUG: Python function extend_recipe_sy=
sroot finished</div><div>DEBUG: Executing shell function do_configure</div>=
<div>CMake Warning:</div><div>&nbsp; Ignoring extra path from command line:=
</div><div><br></div><div>&nbsp; &nbsp;"/home/flk/poky/build/tmp/work-share=
d/llvm-project-source-16.0.6-r0/git/llvm"</div><div><br></div><div><br></di=
v><div>-- The C compiler identification is Clang 16.0.6</div><div>-- The CX=
X compiler identification is Clang 16.0.6</div><div>-- The ASM compiler ide=
ntification is Clang with GNU-like command-line</div><div>-- Found assemble=
r: /home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-s=
ysroot-native/usr/bin/clang</div><div>-- Detecting C compiler ABI info</div=
><div>-- Detecting C compiler ABI info - failed</div><div>-- Check for work=
ing C compiler: /home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16=
.0.6/recipe-sysroot-native/usr/bin/clang</div><div>-- Check for working C c=
ompiler: /home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/re=
cipe-sysroot-native/usr/bin/clang - broken</div><div>CMake Error at /home/f=
lk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-nat=
ive/usr/share/cmake-3.26/Modules/CMakeTestCCompiler.cmake:67 (message):</di=
v><div>&nbsp; The C compiler</div><div><br></div><div>&nbsp; &nbsp; "/home/=
flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-na=
tive/usr/bin/clang"</div><div><br></div><div>&nbsp; is not able to compile =
a simple test program.</div><div><br></div><div>&nbsp; It fails with the fo=
llowing output:</div><div><br></div><div>&nbsp; &nbsp; Change Dir: /home/fl=
k/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/build/CMakeFiles/CM=
akeScratch/TryCompile-bgcv7F</div><div>&nbsp; &nbsp;&nbsp;</div><div>&nbsp;=
 &nbsp; Run Build Command(s):ninja -v cmTC_ae66c &amp;&amp; [1/2] /home/flk=
/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-nativ=
e/usr/bin/clang   -target x86_64-linux   -isystem/home/flk/poky/build/tmp/w=
ork/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/usr/include -O2=
 -pipe -MD -MT CMakeFiles/cmTC_ae66c.dir/testCCompiler.c.o -MF CMakeFiles/c=
mTC_ae66c.dir/testCCompiler.c.o.d -o CMakeFiles/cmTC_ae66c.dir/testCCompile=
r.c.o -c /home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/bu=
ild/CMakeFiles/CMakeScratch/TryCompile-bgcv7F/testCCompiler.c</div><div>&nb=
sp; &nbsp; [2/2] : &amp;&amp; /home/flk/poky/build/tmp/work/x86_64-linux/li=
bcxx-native/16.0.6/recipe-sysroot-native/usr/bin/clang -target x86_64-linux=
   -isystem/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/=
recipe-sysroot-native/usr/include -O2 -pipe -target x86_64-linux   -isystem=
/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysr=
oot-native/usr/include -L/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-=
native/16.0.6/recipe-sysroot-native/usr/lib                         -L/home=
/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-n=
ative/lib                         -Wl,--enable-new-dtags                   =
      -Wl,-rpath-link,/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-nat=
ive/16.0.6/recipe-sysroot-native/usr/lib                         -Wl,-rpath=
-link,/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recip=
e-sysroot-native/lib                         -Wl,-rpath,/home/flk/poky/buil=
d/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/usr/lib =
                        -Wl,-rpath,/home/flk/poky/build/tmp/work/x86_64-lin=
ux/libcxx-native/16.0.6/recipe-sysroot-native/lib                         -=
Wl,-O1 -unwindlib=3Dlibgcc -rtlib=3Dlibgcc -stdlib=3Dlibstdc++ -Wl,--allow-=
shlib-undefined -Wl,--dynamic-linker=3D/home/flk/poky/build/tmp/sysroots-un=
inative/x86_64-linux/lib/ld-linux-x86-64.so.2 -rtlib=3Dlibgcc --unwindlib=
=3Dlibgcc  -L/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.=
6/recipe-sysroot-native/usr/lib                         -L/home/flk/poky/bu=
ild/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/lib   =
                      -Wl,--enable-new-dtags                         -Wl,-r=
path-link,/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/r=
ecipe-sysroot-native/usr/lib                         -Wl,-rpath-link,/home/=
flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-na=
tive/lib                         -Wl,-rpath,/home/flk/poky/build/tmp/work/x=
86_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/usr/lib             =
            -Wl,-rpath,/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-na=
tive/16.0.6/recipe-sysroot-native/lib                         -Wl,-O1 -unwi=
ndlib=3Dlibgcc -rtlib=3Dlibgcc -stdlib=3Dlibstdc++ -Wl,--allow-shlib-undefi=
ned -Wl,--dynamic-linker=3D/home/flk/poky/build/tmp/sysroots-uninative/x86_=
64-linux/lib/ld-linux-x86-64.so.2 -rtlib=3Dlibgcc --unwindlib=3Dlibgcc CMak=
eFiles/cmTC_ae66c.dir/testCCompiler.c.o -o cmTC_ae66c   &amp;&amp; :</div><=
div>&nbsp; &nbsp; FAILED: cmTC_ae66c&nbsp;</div><div>&nbsp; &nbsp; : &amp;&=
amp; /home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe=
-sysroot-native/usr/bin/clang -target x86_64-linux   -isystem/home/flk/poky=
/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/usr=
/include -O2 -pipe -target x86_64-linux   -isystem/home/flk/poky/build/tmp/=
work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/usr/include -L=
/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysr=
oot-native/usr/lib                         -L/home/flk/poky/build/tmp/work/=
x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/lib                =
         -Wl,--enable-new-dtags                         -Wl,-rpath-link,/ho=
me/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot=
-native/usr/lib                         -Wl,-rpath-link,/home/flk/poky/buil=
d/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/lib     =
                    -Wl,-rpath,/home/flk/poky/build/tmp/work/x86_64-linux/l=
ibcxx-native/16.0.6/recipe-sysroot-native/usr/lib                         -=
Wl,-rpath,/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/r=
ecipe-sysroot-native/lib                         -Wl,-O1 -unwindlib=3Dlibgc=
c -rtlib=3Dlibgcc -stdlib=3Dlibstdc++ -Wl,--allow-shlib-undefined -Wl,--dyn=
amic-linker=3D/home/flk/poky/build/tmp/sysroots-uninative/x86_64-linux/lib/=
ld-linux-x86-64.so.2 -rtlib=3Dlibgcc --unwindlib=3Dlibgcc  -L/home/flk/poky=
/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/usr=
/lib                         -L/home/flk/poky/build/tmp/work/x86_64-linux/l=
ibcxx-native/16.0.6/recipe-sysroot-native/lib                         -Wl,-=
-enable-new-dtags                         -Wl,-rpath-link,/home/flk/poky/bu=
ild/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/usr/li=
b                         -Wl,-rpath-link,/home/flk/poky/build/tmp/work/x86=
_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/lib                   =
      -Wl,-rpath,/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/1=
6.0.6/recipe-sysroot-native/usr/lib                         -Wl,-rpath,/hom=
e/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-=
native/lib                         -Wl,-O1 -unwindlib=3Dlibgcc -rtlib=3Dlib=
gcc -stdlib=3Dlibstdc++ -Wl,--allow-shlib-undefined -Wl,--dynamic-linker=3D=
/home/flk/poky/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-6=
4.so.2 -rtlib=3Dlibgcc --unwindlib=3Dlibgcc CMakeFiles/cmTC_ae66c.dir/testC=
Compiler.c.o -o cmTC_ae66c   &amp;&amp; :</div><div>&nbsp; &nbsp; /home/flk=
/poky/build/tmp/hosttools/ld: cannot find crtbeginS.o: No such file or dire=
ctory</div><div>&nbsp; &nbsp; /home/flk/poky/build/tmp/hosttools/ld: cannot=
 find -lgcc: No such file or directory</div><div>&nbsp; &nbsp; /home/flk/po=
ky/build/tmp/hosttools/ld: cannot find -lgcc: No such file or directory</di=
v><div>&nbsp; &nbsp; clang-16: error: linker command failed with exit code =
1 (use -v to see invocation)</div><div>&nbsp; &nbsp; ninja: build stopped: =
subcommand failed.</div><div>&nbsp; &nbsp;&nbsp;</div><div>&nbsp; &nbsp;&nb=
sp;</div><div><br></div><div>&nbsp;&nbsp;</div><div><br></div><div>&nbsp; C=
Make will not be able to correctly generate this project.</div><div>Call St=
ack (most recent call first):</div><div>&nbsp; CMakeLists.txt:10 (project)<=
/div><div><br></div><div><br></div><div>-- Configuring incomplete, errors o=
ccurred!</div><div>WARNING: /home/flk/poky/build/tmp/work/x86_64-linux/libc=
xx-native/16.0.6/temp/run.do_configure.6240:171 exit 1 from 'cmake -G 'Ninj=
a' -DCMAKE_MAKE_PROGRAM=3Dninja $oecmake_sitefile /home/flk/poky/build/tmp/=
work-shared/llvm-project-source-16.0.6-r0/git/llvm -DCMAKE_INSTALL_PREFIX:P=
ATH=3D/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/recip=
e-sysroot-native/usr -DCMAKE_INSTALL_BINDIR:PATH=3Dbin -DCMAKE_INSTALL_SBIN=
DIR:PATH=3Dsbin -DCMAKE_INSTALL_LIBEXECDIR:PATH=3Dlibexec -DCMAKE_INSTALL_S=
YSCONFDIR:PATH=3D/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/1=
6.0.6/recipe-sysroot-native/etc -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=3D../co=
m -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=3D/home/flk/poky/build/tmp/work/x86_64=
-linux/libcxx-native/16.0.6/recipe-sysroot-native/var -DCMAKE_INSTALL_LIBDI=
R:PATH=3Dlib -DCMAKE_INSTALL_INCLUDEDIR:PATH=3Dinclude -DCMAKE_INSTALL_DATA=
ROOTDIR:PATH=3Dshare -DPYTHON_EXECUTABLE:PATH=3D/home/flk/poky/build/tmp/wo=
rk/x86_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/usr/bin/python3-=
native/python3 -DPython_EXECUTABLE:PATH=3D/home/flk/poky/build/tmp/work/x86=
_64-linux/libcxx-native/16.0.6/recipe-sysroot-native/usr/bin/python3-native=
/python3 -DPython3_EXECUTABLE:PATH=3D/home/flk/poky/build/tmp/work/x86_64-l=
inux/libcxx-native/16.0.6/recipe-sysroot-native/usr/bin/python3-native/pyth=
on3 -DLIB_SUFFIX=3D -DCMAKE_INSTALL_SO_NO_EXE=3D0 -DCMAKE_TOOLCHAIN_FILE=3D=
/home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/toolchain.c=
make -DCMAKE_NO_SYSTEM_FROM_IMPORTED=3D1 -DCMAKE_EXPORT_NO_PACKAGE_REGISTRY=
=3DON -DFETCHCONTENT_FULLY_DISCONNECTED=3DON -DCMAKE_BUILD_TYPE=3DRelWithDe=
bInfo -DLLVM_ENABLE_PER_TARGET_RUNTIME_DIR=3DOFF -DCMAKE_CROSSCOMPILING=3DO=
N -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=3DON -DLLVM_ENABLE_RTTI=3DON -DLIB=
UNWIND_ENABLE_CROSS_UNWINDING=3DON -DLIBCXX_ENABLE_STATIC_ABI_LIBRARY=3DON =
-DLIBCXXABI_INCLUDE_TESTS=3DOFF -DLIBCXXABI_ENABLE_SHARED=3DON -DLIBCXXABI_=
LIBCXX_INCLUDES=3D/home/flk/poky/build/tmp/work-shared/llvm-project-source-=
16.0.6-r0/git/libcxx/include -DLIBCXX_CXX_ABI=3Dlibcxxabi -DLIBCXX_CXX_ABI_=
INCLUDE_PATHS=3D/home/flk/poky/build/tmp/work-shared/llvm-project-source-16=
.0.6-r0/git/libcxxabi/include -DLIBCXX_CXX_ABI_LIBRARY_PATH=3D/home/flk/pok=
y/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/build/lib -S /home/flk/p=
oky/build/tmp/work-shared/llvm-project-source-16.0.6-r0/git/runtimes -DLLVM=
_ENABLE_RUNTIMES=3D'libcxx;libcxxabi;libunwind' -DLLVM_LIBDIR_SUFFIX=3D -DC=
MAKE_BUILD_WITH_INSTALL_RPATH=3DON -DLIBCXXABI_ENABLE_EXCEPTIONS=3DON -DDLI=
BCXX_ENABLE_EXCEPTIONS=3DON -DLIBCXXABI_USE_LLVM_UNWINDER=3DON -DLIBCXXABI_=
ENABLE_STATIC_UNWINDER=3DON -DLIBUNWIND_ENABLE_SHARED=3DON -Wno-dev'</div><=
div>WARNING: Backtrace (BB generated script):&nbsp;</div><div>&nbsp;#1: cma=
ke_do_configure, /home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/1=
6.0.6/temp/run.do_configure.6240, line 171</div><div>&nbsp;#2: do_configure=
, /home/flk/poky/build/tmp/work/x86_64-linux/libcxx-native/16.0.6/temp/run.=
do_configure.6240, line 150</div><div>&nbsp;#3: main, /home/flk/poky/build/=
tmp/work/x86_64-linux/libcxx-native/16.0.6/temp/run.do_configure.6240, line=
 207</div></div>
--=-F41MF6y9dB8r9pj1D8PS--


