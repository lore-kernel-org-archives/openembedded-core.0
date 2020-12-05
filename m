Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.7784.1607192719696085734
 for <Openembedded-core@lists.openembedded.org>;
 Sat, 05 Dec 2020 10:25:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lnc+4EtE;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id 1so8796083qka.0
        for <Openembedded-core@lists.openembedded.org>; Sat, 05 Dec 2020 10:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0VbVskEDpwzkHo2Ch+4/iR5CeQRD3zmKnaRfBlqx0yg=;
        b=lnc+4EtENGOhXFnXCeAPcoiyhK/F8ywQyTkrRQKF/iqkIv3KXARYOvunnJk5zAl1Al
         ZpUPJgZQDVYCkDbzEn0Q380/nMbIQjmbNZ4ao5Shr5T4ay2IESCzpZTB3MFoVUjXnSjR
         mEU0DuLCUXWCbKGSIxiNUfm2jgCzlbv1R5zAUd0TTklV9vIAZUi6Xr9Lw0+BWx4iM+py
         Oh8EkU/SGKtzBAqVaLi2E92KkFhqt6uE1O+9Iodtnriw8GMPZbM5Wwof5uQzkNVKsULh
         IfyKE3/B2rDF/U5xQz7C5vumvMV7RvAI3O2oFkNwhJpetLJ/9bdVgTkJGpoPOAJH2KRE
         4STw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0VbVskEDpwzkHo2Ch+4/iR5CeQRD3zmKnaRfBlqx0yg=;
        b=onLYPxDkWnn1G5b6gTHalBXqMsHkKxWTiFKXkYlEmXPgEXjZ80+Il8FSUfnfoM6PfV
         4+F7fkXTsUL1D8K6NcuRmLFkRMmN2JsyRH6N48L83cTdl2FEgWANhtMKJzBdTvcCpZl/
         8Gje51htILWXuzHtwLTbulvOGrs7Qc3xQz+v9Kga+D8S9N4/Zgn75f2oU0+O4fHhVTta
         j20cprhp1uHAaAZ5JTz8HNhgPu4nOpy+PeXP+2JXal3tr+yXto9Zxl6UkWiHmBi2xkd2
         zgVTWl0j3uqxY67/aRsM0aOesyuSn4oWDOJ2uTIJKKNVWy0ND7ycs+7BSR66Q9fEb/1f
         FH6A==
X-Gm-Message-State: AOAM533Cz3fNeIrc/tHG0WGWnEv0YURL/TdfY4NsPQBNYVoF4/yUMpel
	Wkghz0v5VVzRSHwpegdJTJ/OS60Nn0tkJovW7PGCZIecrJMpyQ==
X-Google-Smtp-Source: ABdhPJznVL0sjfkxtdmCJjsnTaOsdF9EUbznFAmATu4V9h0X4GEFFkpWMrsFeW2qT/+/wM7BO1IpQ7krX2wL8iy1k7M=
X-Received: by 2002:a37:a484:: with SMTP id n126mr15932360qke.277.1607192718515;
 Sat, 05 Dec 2020 10:25:18 -0800 (PST)
MIME-Version: 1.0
References: <CANUMPcUV53punnV_5EArrkknXaTZWc=i_UunbJKHiFA_4HZdRw@mail.gmail.com>
 <CAMKF1sqyhT4GRypCoNs3cTvq3Jj7yCNa-Q7Jxv51z43nvDxuaA@mail.gmail.com> <1644478B44B2E620.7719@lists.openembedded.org>
In-Reply-To: <1644478B44B2E620.7719@lists.openembedded.org>
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
Date: Sat, 5 Dec 2020 23:55:07 +0530
Message-ID: <CANUMPcWeEhWrUhUAJx7CwxJ0-wodbpSy8Qv3xKW2=qm4jPpKWA@mail.gmail.com>
Subject: Re: [OE-core] Yocto rust build failure
To: Patches and discussions about the oe-core layer <Openembedded-core@lists.openembedded.org>
Cc: Khem Raj <raj.khem@gmail.com>, Randy MacLeod <rwmacleod@gmail.com>, umesh.kalappa0@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi,

Trying to compile rust ui test cases using armv7 poky toolchain .
Getting build error as shown below,

$ source ~/rust/armv7hf-sdk/environment-setup-armv7vet2hf-neon-poky-linux-gnueabi

$ export TARGET_CFLAGS="-march=armv7ve -mthumb -mfpu=neon
-mfloat-abi=hard -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat
-Wformat-security -Werror=format-security
--sysroot=/home/vinay/rust/armv7hf-sdk/sysroots/armv7vet2hf-neon-poky-linux-gnueabi"

$ ./configure --target arm-unknown-linux-gnueabihf

$ ./x.py  test ui   --target arm-unknown-linux-gnueabihf

Build error:
===========================================
CMake Error at /home/vinay/rust/armv7hf-sdk/sysroots/x86_64-pokysdk-linux/usr/share/cmake-3.18/Modules/FindPackageHandleStandardArgs.cmake:165
(message):
  Could NOT find Threads (missing: Threads_FOUND)
Call Stack (most recent call first):
  /home/vinay/rust/armv7hf-sdk/sysroots/x86_64-pokysdk-linux/usr/share/cmake-3.18/Modules/FindPackageHandleStandardArgs.cmake:458
(_FPHSA_FAILURE_MESSAGE)
  /home/vinay/rust/armv7hf-sdk/sysroots/x86_64-pokysdk-linux/usr/share/cmake-3.18/Modules/FindThreads.cmake:234
(FIND_PACKAGE_HANDLE_STANDARD_ARGS)
  cmake/config-ix.cmake:114 (find_package)
  CMakeLists.txt:623 (include)


-- Configuring incomplete, errors occurred!
See also "/home/vinay/rust/build-sdk/tmp/work/x86_64-linux/rust-cross-x86_64/1.46.0-r0/rustc-1.46.0-src/build2/x86_64-unknown-linux-gnu/llvm/build/CMakeFiles/CMakeOutput.log".
See also "/home/vinay/rust/build-sdk/tmp/work/x86_64-linux/rust-cross-x86_64/1.46.0-r0/rustc-1.46.0-src/build2/x86_64-unknown-linux-gnu/llvm/build/CMakeFiles/CMakeError.log".
thread 'main' panicked at '
command did not execute successfully, got: exit code: 1
===========================================

$cat /home/vinay/rust/build-sdk/tmp/work/x86_64-linux/rust-cross-x86_64/1.46.0-r0/rustc-1.46.0-src/build2/x86_64-unknown-linux-gnu/llvm/build/CMakeFiles/CMakeError.log

===========================================
Run Build Command(s):/usr/bin/make cmTC_2a5d6/fast && /usr/bin/make
-f CMakeFiles/cmTC_2a5d6.dir/build.make
CMakeFiles/cmTC_2a5d6.dir/build
make[1]: Entering directory
'/home/vinay/rust/build-sdk/tmp/work/x86_64-linux/rust-cross-x86_64/1.46.0-r0/rustc-1.46.0-src/build2/x86_64-unknown-linux-gnu/llvm/build/CMakeFiles/CMakeTmp'
Building C object CMakeFiles/cmTC_2a5d6.dir/CheckIncludeFile.c.o
/usr/bin/cc --sysroot=/home/vinay/rust/armv7hf-sdk/sysroots/armv7vet2hf-neon-poky-linux-gnueabi
  -O2 -pipe -g -feliminate-unused-debug-types   -o
CMakeFiles/cmTC_2a5d6.dir/CheckIncludeFile.c.o -c
/home/vinay/rust/build-sdk/tmp/work/x86_64-linux/rust-cross-x86_64/1.46.0-r0/rustc-1.46.0-src/build2/x86_64-unknown-linux-gnu/llvm/build/CMakeFiles/CMakeTmp/CheckIncludeFile.c
In file included from
/home/vinay/rust/armv7hf-sdk/sysroots/armv7vet2hf-neon-poky-linux-gnueabi/usr/include/gnu/stubs.h:23:0,
                 from
/home/vinay/rust/armv7hf-sdk/sysroots/armv7vet2hf-neon-poky-linux-gnueabi/usr/include/features.h:489,
                 from
/home/vinay/rust/armv7hf-sdk/sysroots/armv7vet2hf-neon-poky-linux-gnueabi/usr/include/dlfcn.h:22,
                 from
/home/vinay/rust/build-sdk/tmp/work/x86_64-linux/rust-cross-x86_64/1.46.0-r0/rustc-1.46.0-src/build2/x86_64-unknown-linux-gnu/llvm/build/CMakeFiles/CMakeTmp/CheckIncludeFile.c:1:
/home/vinay/rust/armv7hf-sdk/sysroots/armv7vet2hf-neon-poky-linux-gnueabi/usr/include/gnu/stubs-32.h:7:11:
fatal error: gnu/stubs-soft.h: No such file or directory
 # include <gnu/stubs-soft.h>
           ^~~~~~~~~~~~~~~~~~
compilation terminated.
===========================================

Regards,
Vinay

On Wed, Nov 4, 2020 at 4:03 PM Vinay Kumar via lists.openembedded.org
<vinay.m.engg=gmail.com@lists.openembedded.org> wrote:
>
> Hi Khem Raj,
>
> Thanks for the confimtion, Will work on your suggestions.
>
> Regards,
> Vinay
>
> On Wed, Nov 4, 2020 at 12:03 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Hi Vinay
> >
> > Currently, rust for the target is not buildable, you can however build
> > rust cross compiler and use it to cross-compile rust applications
> > which run on your target, but generating rust compiler itself which
> > will run on target is not currently supported in meta-rust
> >
> > On Tue, Nov 3, 2020 at 8:21 PM Vinay Kumar <vinay.m.engg@gmail.com> wrote:
> > >
> > > Hi,
> > >
> > > Trying to build yocto rust package using below branch,
> > >
> > > http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=rmacleod/rust-wip-sept-5
> > >
> > > Getting below list of errors while building yocto rust,
> > > =======================================================
> > > Command:
> > > $bitbake rust
> > >
> > > Build Configuration:
> > > BB_VERSION           = "1.47.0"
> > > BUILD_SYS            = "x86_64-linux"
> > > NATIVELSBSTRING      = "ubuntu-18.04"
> > > TARGET_SYS           = "arm-poky-linux-gnueabi"
> > > MACHINE              = "qemuarm"
> > > DISTRO               = "poky"
> > > DISTRO_VERSION       = "3.1+snapshot-20201029"
> > > TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
> > > TARGET_FPU           = "hard"
> > > meta
> > > meta-poky
> > > meta-yocto-bsp       =
> > > "rmacleod/rust-wip-sept-5:80e2aad495bd6f6e1c62b7af55677651131fa250"
> > >
> > >
> > > Error1:
> > >
> > > failed to execute command:
> > > "/home/build_arm_rust/tmp/work/armv7vet2hf-neon-poky-linux-gnueabi/rust/1.46.0-r0/recipe-sysroot/usr/lib/llvm-rust/bin/llvm-config"
> > > "--bindir"
> > > error: No such file or directory (os error 2)
> > >
> > >
> > > Fixed by below changes,
> > >
> > > --- a/meta/recipes-devtools/rust/rust.inc
> > > +++ b/meta/recipes-devtools/rust/rust.inc
> > > @@ -14,7 +14,7 @@ export RUST_TARGET_PATH="${WORKDIR}/targets/"
> > >
> > >  export FORCE_CRATE_HASH="${BB_TASKHASH}"
> > >
> > > -export YOCTO_ALTERNATE_EXE_PATH = "${STAGING_LIBDIR}/llvm-rust/bin/llvm-config"
> > > +export YOCTO_ALTERNATE_EXE_PATH =
> > > "${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-config"
> > >
> > >
> > > Error2:
> > >
> > > error: Error loading target specification: Could not find
> > > specification for target "arm-poky-linux-gnueabi". Use `--print
> > > target-list` for a list of built-in targets
> > >
> > > Fixed by updating "RUST_TARGET_PATH" in
> > > "build_arm_rust/tmp/work/armv7vet2hf-neon-poky-linux-gnueabi/rust/1.46.0-r0/temp/run.do_compilerun.do_compile"
> > > to "$STAGING_LIBDIR_NATIVE/rustlib" path where target specification
> > > exists.
> > >
> > >
> > > Error3:
> > >
> > > While building "librustc_privacy" getting below error.
> > >
> > > /home/build_arm_rust/tmp/work/armv7vet2hf-neon-poky-linux-gnueabi/rust/1.46.0-r0/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/../../libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/10.2.0/ld:
> > > /tmp/rustcLL5VLM/librustc_llvm-755d330643cd0fe0.rlib: member
> > > /tmp/rustcLL5VLM/librustc_llvm-755d330643cd0fe0.rlib(X86Disassembler.cpp.o)
> > > in archive is not an object
> > >           collect2: error: ld returned 1 exit status
> > >
> > > error: aborting due to previous error
> > >
> > > error: could not compile `rustc_driver`.
> > > To learn more, run the command again with --verbose.
> > >
> > > =======================================================
> > >
> > > Please let me know if any corrections are needed in the build procedure.
> > >
> > >
> > > Regards,
> > > Vinay
> > >
> > >
> > >
>
> 
>
