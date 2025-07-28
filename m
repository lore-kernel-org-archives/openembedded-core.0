Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B41E3C83F17
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 04:32:34 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web10.74187.1753677151160522815
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jul 2025 21:32:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OHZWSbuG;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-71841a48502so32350497b3.2
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Jul 2025 21:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753677150; x=1754281950; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQVYg3YaYZGhLH4mGajlIKTzY84JkghIB5pIqTqiL0s=;
        b=OHZWSbuG8cgjmrnDGctcQeHVhCVg7pk8EK6pUNybb0FH/oDJ3qEO3YTqw16wiDB/kv
         xhM/UaDZz6m7CsoOs64ODSHwu8BQhPguA2Zz/4ajwETS3Va/gejagAHoubleEVK6mzET
         ufJTJzmbxE/38SJ5VmoK6Iaqp3qdluTZQXwJMXLQmpKI5SN1imQZr5fiy+RP/wxsjS+v
         SIq/LpNjPw3x1jzs/ZdcpacWBeEbtuLINfwmw9t2YL4R4cfbHsKlUcmAcrFuXdco9QIE
         cbJ0K1LMmfCFJqNzsxD5sQmxwNEIMgoidAagNKHSdeP8GAOryX01QwCj6dlRjXcbMXi/
         iLew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753677150; x=1754281950;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JQVYg3YaYZGhLH4mGajlIKTzY84JkghIB5pIqTqiL0s=;
        b=CEjzSkDBcLs+jDBvzUmZfqnWDm3Se1Cv0Ly7CAzpGMvh9Nr0bWW6BStTx7fWWDXcbh
         G1QafLel6caDJAEcXIxYnPcANdDR1ZeryB3Qi/UMdrtRCqSgkvhmNgYnHy3Ew3afq4ZI
         1l6tv6tm/3I3aExkzwJPxjSrkLkCR493PMGIwIrG+6QrEg8FSDXt2NWiKrIYf7qfHOlT
         Zr7iw4jTghfOqduKG+yxvghS9JbCs9kjPDxVBTCUV+FBHyJu2tIe1PK2s0gfLlyl9dr3
         /21fZSg9075lVgJpwmL5pUo64eIa82WyJdtErvinGIUpvnkNwoCj+C2d98UtaoRhXjDW
         9okA==
X-Gm-Message-State: AOJu0YzEKKE1ZZ5QjcBiGHIBz2IwUJ/6lwGtp6Caw2X+EWl46FFsFrC1
	FxH+zh3t9HU1LdPTImCsbdqnqhggTUgTdCa6WlL0GzgUMKCTjRAmr+TVnyRuK86lUKbwBjBE8X1
	X7t4arAOgBEIEHwR1oYMi12vnhg8AjaE=
X-Gm-Gg: ASbGnctTAdZ5Td2IPRXG5F07rt3UGtX5D9TayCgfS/x6cxFbWWTtChPZbjw3CTFAaQ5
	DXJAa49SvQbZpTWJDIepraczabj/8za61Qx8/QEiQvgQx+peizQqPEaumkAjWI8OjvnMWKl85GP
	34IaknKK5FalGhnXamceYAB8fYD2e61F8cgA6IO98Iw4afqHjsgelqVerj0DemjqBULynhGDZeh
	OJCejf8XR7rfhVgJ5DJXTUqhsCNHR4dx0nMhfQe
X-Google-Smtp-Source: AGHT+IFQoK9xy6UIvaRuVcPqtfhY8gFnqz8N6ZxZCjYIYgclEtyuVLBoC3gX3HdoYQCeWClVCgUtuIuRii4wSuZotvQ=
X-Received: by 2002:a05:690c:6102:b0:71a:1607:e487 with SMTP id
 00721157ae682-71a1607e9d5mr39059497b3.25.1753677149916; Sun, 27 Jul 2025
 21:32:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250721132426.3321928-1-ross.burton@arm.com> <20250721132426.3321928-2-ross.burton@arm.com>
 <CAMKF1srWUTREYL4MVXNHsZ8wjL9AQscRSMECPNd1Fht1qbtZ6A@mail.gmail.com>
In-Reply-To: <CAMKF1srWUTREYL4MVXNHsZ8wjL9AQscRSMECPNd1Fht1qbtZ6A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 27 Jul 2025 21:32:02 -0700
X-Gm-Features: Ac12FXzhEBx8w7CgvPllOpnPDtx6x-hvoLbGPQvdEHofG4MECh6RdEmqMeRC79M
Message-ID: <CAMKF1sozBknN-8W_z=LT2OS3-xAZskMKGRvuHkD7oKFRLEq3GA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 2/5] libclc: split out of clang
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Jul 2025 04:32:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220990

On Sun, Jul 27, 2025 at 2:01=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> On Mon, Jul 21, 2025 at 6:24=E2=80=AFAM Ross Burton via lists.openembedde=
d.org
> <ross.burton=3Darm.com@lists.openembedded.org> wrote:
> >
> > Split the libclc subproject out of the clang recipe and into a dedicate=
d
> > libclc recipe.
> >
> > This is useful because libclc is the OpenCL runtime library and as such
> > isn't target-specific and needs a native clang to build, not a target
> > libllvm.
> >
> > Verified that nothing is dropped by adding clang and libclc to an image
> > and verifying that the file list is the same before and after this
> > change.
> >
> > We need to patch the libclc CMakeLists to allow it to use an out-of-tre=
e
> > prepare_builtins binary, discussion is ongoing with upstream to resolve
> > this properly.
> >
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >  meta/conf/distro/include/maintainers.inc      |  1 +
> >  ...sting-prepare-builtins-in-standalone.patch | 57 +++++++++++++++++++
> >  meta/recipes-devtools/clang/clang_git.bb      | 17 ++----
> >  meta/recipes-devtools/clang/common.inc        |  1 +
> >  meta/recipes-devtools/clang/libclc_git.bb     | 43 ++++++++++++++
> >  5 files changed, 108 insertions(+), 11 deletions(-)
> >  create mode 100644 meta/recipes-devtools/clang/clang/0001-libclc-allow=
-existing-prepare-builtins-in-standalone.patch
> >  create mode 100644 meta/recipes-devtools/clang/libclc_git.bb
> >
> > diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distr=
o/include/maintainers.inc
> > index 6bfc2efb162..927aac16d6d 100644
> > --- a/meta/conf/distro/include/maintainers.inc
> > +++ b/meta/conf/distro/include/maintainers.inc
> > @@ -328,6 +328,7 @@ RECIPE_MAINTAINER:pn-libcap-ng =3D "Yi Zhao <yi.zha=
o@windriver.com>"
> >  RECIPE_MAINTAINER:pn-libcap-ng-python =3D "Yi Zhao <yi.zhao@windriver.=
com>"
> >  RECIPE_MAINTAINER:pn-libcgroup =3D "Unassigned <unassigned@yoctoprojec=
t.org>"
> >  RECIPE_MAINTAINER:pn-libcheck =3D "Yi Zhao <yi.zhao@windriver.com>"
> > +RECIPE_MAINTAINER:pn-libclc =3D "Khem Raj <raj.khem@gmail.com>"
> >  RECIPE_MAINTAINER:pn-libcomps =3D "Unassigned <unassigned@yoctoproject=
.org>"
> >  RECIPE_MAINTAINER:pn-libconvert-asn1-perl =3D "Tim Orling <tim.orling@=
konsulko.com>"
> >  RECIPE_MAINTAINER:pn-libcxx =3D "Khem Raj <raj.khem@gmail.com>"
> > diff --git a/meta/recipes-devtools/clang/clang/0001-libclc-allow-existi=
ng-prepare-builtins-in-standalone.patch b/meta/recipes-devtools/clang/clang=
/0001-libclc-allow-existing-prepare-builtins-in-standalone.patch
> > new file mode 100644
> > index 00000000000..46929798adb
> > --- /dev/null
> > +++ b/meta/recipes-devtools/clang/clang/0001-libclc-allow-existing-prep=
are-builtins-in-standalone.patch
> > @@ -0,0 +1,57 @@
> > +From 348f846b206780646430d6477c04b7793b669f34 Mon Sep 17 00:00:00 2001
> > +From: Ross Burton <ross.burton@arm.com>
> > +Date: Wed, 16 Jul 2025 23:24:21 +0100
> > +Subject: [PATCH] allow external prepare_builtins
> > +
> > +In standalone cross builds, libclc can't build a native prepare_builti=
ns.
> > +
> > +Hack the CMake to allow it to use an existing binary, which we build i=
n the recipe.
> > +
> > +Upstream-Status: Inappropriate [discussion for a proper fix in https:/=
/github.com/llvm/llvm-project/issues/149814]
> > +Signed-off-by: Ross Burton <ross.burton@arm.com>
> > +---
> > + libclc/CMakeLists.txt | 23 +++++++++++++++++------
> > + 1 file changed, 17 insertions(+), 6 deletions(-)
> > +
> > +diff --git a/libclc/CMakeLists.txt b/libclc/CMakeLists.txt
> > +index 43e213b385f5..d4a6d096169e 100644
> > +--- a/libclc/CMakeLists.txt
> > ++++ b/libclc/CMakeLists.txt
> > +@@ -181,17 +181,28 @@ set(LLVM_LINK_COMPONENTS
> > +   IRReader
> > +   Support
> > + )
> > ++
> > + if( LIBCLC_STANDALONE_BUILD )
> > +-  add_llvm_executable( prepare_builtins utils/prepare-builtins.cpp )
> > +-  set( prepare_builtins_exe prepare_builtins )
> > +-  set( prepare_builtins_target prepare_builtins )
> > ++  message("cross ${CMAKE_CROSSCOMPILING}")
> > ++  if(CMAKE_CROSSCOMPILING)
> > ++    find_program(PREPARE_BUILTINS prepare_builtins REQUIRED)
> > ++    message("found ${PREPARE_BUILTINS}")
> > ++    set( prepare_builtins_exe ${PREPARE_BUILTINS} )
> > ++  else()
> > ++    add_llvm_executable( prepare_builtins utils/prepare-builtins.cpp =
)
> > ++    set( prepare_builtins_exe prepare_builtins )
> > ++    set( prepare_builtins_target prepare_builtins )
> > ++    target_compile_definitions( prepare_builtins PRIVATE ${LLVM_VERSI=
ON_DEFINE} )
>
> prepare_builtins has to be aware of LLVM/Clang version that it is going t=
o link
> with, thats where it defines
>
> set( LLVM_VERSION_DEFINE
> "-DHAVE_LLVM=3D0x${LLVM_VERSION_MAJOR}0${LLVM_VERSION_MINOR}" )
>
> at the top fo the CMakefle.txt file, your patch will result in
> ignoring this and prepare_builtins might
> build with some version of llvm and might fail with other
>
> see
> https://github.com/llvm/llvm-project/blob/main/libclc/utils/prepare-built=
ins.cpp#L9
> https://github.com/llvm/llvm-project/blob/main/libclc/utils/prepare-built=
ins.cpp#L109
> https://github.com/llvm/llvm-project/blob/main/libclc/utils/prepare-built=
ins.cpp#L124
>
> There is version specific dependency
>
> We still need to add this define to the compiler cmdline regardless of
> CROSS_COMPILING or not.

I think it is an issue when this patch is ported to llvm main branch
but I have fixed it

>
> > ++    # These were not properly reported in early LLVM and we don't nee=
d them
> > ++    target_compile_options( prepare_builtins PRIVATE -fno-rtti -fno-e=
xceptions )
> > ++  endif()
> > + else()
> > +   add_llvm_utility( prepare_builtins utils/prepare-builtins.cpp )
> > +   setup_host_tool( prepare_builtins PREPARE_BUILTINS prepare_builtins=
_exe prepare_builtins_target )
> > ++  target_compile_definitions( prepare_builtins PRIVATE ${LLVM_VERSION=
_DEFINE} )
> > ++  # These were not properly reported in early LLVM and we don't need =
them
> > ++  target_compile_options( prepare_builtins PRIVATE -fno-rtti -fno-exc=
eptions )
> > + endif()
> > +-target_compile_definitions( prepare_builtins PRIVATE ${LLVM_VERSION_D=
EFINE} )
> > +-# These were not properly reported in early LLVM and we don't need th=
em
> > +-target_compile_options( prepare_builtins PRIVATE -fno-rtti -fno-excep=
tions )
> > +
> > + # Setup arch devices
> > + set( r600--_devices cedar cypress barts cayman )
> > +--
> > +2.43.0
> > +
> > diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-de=
vtools/clang/clang_git.bb
> > index ed6e2d7da7f..884398dcaa3 100644
> > --- a/meta/recipes-devtools/clang/clang_git.bb
> > +++ b/meta/recipes-devtools/clang/clang_git.bb
> > @@ -130,7 +130,7 @@ HF[vardepvalue] =3D "${HF}"
> >
> >  # Ensure that LLVM_PROJECTS does not contain compiler runtime componen=
ts e.g. libcxx etc
> >  # they are enabled via LLVM_ENABLE_RUNTIMES
> > -LLVM_PROJECTS ?=3D "clang;clang-tools-extra;libclc;lld"
> > +LLVM_PROJECTS ?=3D "clang;clang-tools-extra;lld"
> >
> >  # linux hosts (.so) on Windows .pyd
> >  SOLIBSDEV:mingw32 =3D ".pyd"
> > @@ -191,7 +191,7 @@ EXTRA_OECMAKE:append:class-target =3D "\
> >
> >  DEPENDS =3D "binutils zlib zstd libffi libxml2 libxml2-native ninja-na=
tive swig-native spirv-tools-native llvm-tblgen-native"
> >  DEPENDS:append:class-nativesdk =3D " clang-crosssdk-${SDK_SYS} virtual=
/nativesdk-cross-binutils nativesdk-python3"
> > -DEPENDS:append:class-target =3D " clang-cross-${TARGET_ARCH} python3 $=
{@bb.utils.contains('TC_CXX_RUNTIME', 'llvm', 'compiler-rt libcxx', '', d)}=
 spirv-llvm-translator-native"
> > +DEPENDS:append:class-target =3D " clang-cross-${TARGET_ARCH} python3 $=
{@bb.utils.contains('TC_CXX_RUNTIME', 'llvm', 'compiler-rt libcxx', '', d)}=
"
> >
> >  RRECOMMENDS:${PN} =3D "binutils"
> >  RRECOMMENDS:${PN}:append:class-target =3D "${@bb.utils.contains('TC_CX=
X_RUNTIME', 'llvm', ' libcxx-dev', '', d)}"
> > @@ -258,7 +258,6 @@ do_install:append:class-native () {
> >          install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clangd-indexer ${D}$=
{bindir}/clangd-indexer
> >      fi
> >      install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clang-tidy-confusable-ch=
ars-gen ${D}${bindir}/clang-tidy-confusable-chars-gen
> > -    install -Dm 0755 ${B}${BINPATHPREFIX}/bin/prepare_builtins ${D}${b=
indir}/prepare_builtins
> >
> >      for f in `find ${D}${bindir} -executable -type f -not -type l`; do
> >          test -n "`file -b $f|grep -i ELF`" && ${STRIP} $f
> > @@ -294,11 +293,11 @@ do_install:append:class-nativesdk () {
> >      fi
> >  }
> >
> > -PROVIDES:append:class-native =3D " llvm-native libclc-native"
> > -PROVIDES:append:class-target =3D " llvm libclc"
> > -PROVIDES:append:class-nativesdk =3D " nativesdk-llvm nativesdk-libclc"
> > +PROVIDES:append:class-native =3D " llvm-native"
> > +PROVIDES:append:class-target =3D " llvm"
> > +PROVIDES:append:class-nativesdk =3D " nativesdk-llvm"
> >
> > -PACKAGES =3D+ "${PN}-libllvm ${PN}-libclang-python ${PN}-libclang-cpp =
${PN}-tidy ${PN}-format ${PN}-tools ${PN}-clc \
> > +PACKAGES =3D+ "${PN}-libllvm ${PN}-libclang-python ${PN}-libclang-cpp =
${PN}-tidy ${PN}-format ${PN}-tools \
> >               libclang llvm-linker-tools"
> >
> >  BBCLASSEXTEND =3D "native nativesdk"
> > @@ -315,8 +314,6 @@ RDEPENDS:${PN}-tools +=3D "\
> >    perl-module-term-ansicolor \
> >  "
> >
> > -RPROVIDES:${PN}-clc =3D "${MLPREFIX}libclc"
> > -
> >  RRECOMMENDS:${PN}-tidy +=3D "${PN}-tools"
> >
> >  FILES:llvm-linker-tools =3D "${libdir}/LLVMgold* ${libdir}/libLTO.so.*=
 ${libdir}/LLVMPolly*"
> > @@ -383,8 +380,6 @@ FILES:${PN} +=3D "\
> >    ${nonarch_libdir}/${BPN}/*/include/ \
> >  "
> >
> > -FILES:${PN}-clc +=3D "${datadir}/clc"
> > -
> >  FILES:${PN}-libllvm =3D+ "\
> >    ${libdir}/libLLVM.so.${MAJOR_VER}.${MINOR_VER} \
> >    ${libdir}/libLLVM-${MAJOR_VER}.so \
> > diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devt=
ools/clang/common.inc
> > index d66f9059b2e..d6280c2fbe3 100644
> > --- a/meta/recipes-devtools/clang/common.inc
> > +++ b/meta/recipes-devtools/clang/common.inc
> > @@ -59,6 +59,7 @@ SRC_URI =3D "\
> >      file://0036-libunwind-Use-gcs-instead-of-gcs-target-attribute.patc=
h \
> >      file://0037-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.p=
atch \
> >      file://0038-compiler-rt-Hardcode-uptr-sptr-typedefs-on-Mips-Linu.p=
atch \
> > +    file://0001-libclc-allow-existing-prepare-builtins-in-standalone.p=
atch \
> >  "
> >  # Fallback to no-PIE if not set
> >  GCCPIE ??=3D ""
> > diff --git a/meta/recipes-devtools/clang/libclc_git.bb b/meta/recipes-d=
evtools/clang/libclc_git.bb
> > new file mode 100644
> > index 00000000000..ed31de503ae
> > --- /dev/null
> > +++ b/meta/recipes-devtools/clang/libclc_git.bb
> > @@ -0,0 +1,43 @@
> > +SUMMARY =3D "Implementation of the library requirements of the OpenCL =
C programming language."
> > +HOMEPAGE =3D "https://libclc.llvm.org"
> > +SECTION =3D "devel"
> > +
> > +require common-clang.inc
> > +require common-source.inc
> > +
> > +LIC_FILES_CHKSUM =3D "file://libclc/LICENSE.TXT;md5=3D7cc795f6cbb2d801=
d84336b83c8017db"
> > +
> > +inherit cmake pkgconfig
> > +
> > +# Depend explicitly on clang-native instead of using TOOLCHAIN as the =
build
> > +# objects from this recipe are build explicitly using clang for GPU ta=
rgets.
> > +# We could INHIBIT_DEFAULT_DEPS to avoid any other toolchain but then =
we need
> > +# to wrestle CMake to configure without a toolchain.
> > +DEPENDS +=3D "clang-native spirv-llvm-translator-native"
> > +
> > +OECMAKE_SOURCEPATH =3D "${S}/libclc"
> > +B_NATIVE =3D "${B}-native"
> > +
> > +# Semicolon-separated list of targets to build
> > +LIBCLC_TARGETS ?=3D "all"
> > +
> > +EXTRA_OECMAKE =3D "-DLIBCLC_TARGETS_TO_BUILD=3D${LIBCLC_TARGETS} \
> > +                 -DPREPARE_BUILTINS=3D${B_NATIVE}/prepare_builtins"
> > +
> > +# Need to build a native prepare_builtins binary in target builds. The=
 easiest
> > +# way to do this is with a second native cmake build tree.
> > +do_build_prepare_builtins() {
> > +    cmake --fresh -G Ninja \
> > +        -S ${OECMAKE_SOURCEPATH} -B ${B_NATIVE} \
> > +        -DCMAKE_TOOLCHAIN_FILE:FILEPATH=3D${WORKDIR}/toolchain-native.=
cmake \
> > +        -DLIBCLC_TARGETS_TO_BUILD=3D
> > +    cmake --build ${B_NATIVE} --target prepare_builtins
>
>
>
> > +}
> > +do_build_prepare_builtins:class-native() {
> > +    :
> > +}
> > +do_configure[prefuncs] +=3D "do_build_prepare_builtins"
> > +
> > +FILES:${PN} +=3D "${datadir}/clc"
> > +
> > +BBCLASSEXTEND =3D "native nativesdk"
> > --
> > 2.43.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#220688): https://lists.openembedded.org/g/openembed=
ded-core/message/220688
> > Mute This Topic: https://lists.openembedded.org/mt/114267851/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

