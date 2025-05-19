Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12654C2D0CD
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 03:52:01 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web10.43437.1747626717179969754
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 May 2025 20:51:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HY8G5xZK;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2da73155e91so795118fac.0
        for <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 20:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747626716; x=1748231516; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3HOO1QaEO8sT35/Vz1e690s8F5+ChWZsx/hpuhsR4y8=;
        b=HY8G5xZKaMTufyfw/6WSIxiLFBa5zB1KNC18D/LiIYndVLAg/fa38EWptq3EVZr0tB
         2Q4nhlI+6VQ6haRQpxVDxbEagN61r+RVCvvfHOmK7b+wt3BeqXyoS3JKffBHcr0jt/Z4
         GLkKCT8Y+u+s8JvcXPXRN3IGFQEWWEVnjFyizw4ZS7rZRBuF9XejijQdkgzDzzJxKUMg
         //Xuc+QoHjlVvTWV0QTOwME8DGH4aHbUMFk8age4Y4yP5KUB4tXxrbe0z9YlBSqU8lqk
         aC3QTqHtlWEY7tJFcMd0G4A4RzOy6HTk/rwl4K/co5mrnb+M13RX2YBCzmtmYNZhJLbd
         PeCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747626716; x=1748231516;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3HOO1QaEO8sT35/Vz1e690s8F5+ChWZsx/hpuhsR4y8=;
        b=TIY6qmMD+r1n4UUOIfdd2wci08RwfYRJG5uMTpAEp9gbLNfXRB2HRU9jecKwweUzcW
         FB5P4Y/N22FWqj0eb8Xz5FmRo3ssvYD2w9OXmdQ2I2U2p8SwcwfyYqTqUPPPhiTtDP3p
         ZU+vmNLE73Z1HhSkrWk3DTMcaIu5E4OKTpTSUkL2/fkFbuobRmpQIfanO4TioKT/m7LH
         XOcFb65gtS4HCEQtifIMNRwooiNxfcVGcEBImzRYGNs64XN9uiie8WjXUg0jj4GiITTq
         2KoJCqaKpLg738jH6BBlNAT0q1JfsPdyRiqSSvKp74UIi0VcoITCL0BbC6pLrC3s0xP7
         C5+g==
X-Gm-Message-State: AOJu0YxIpVRWEey5NVko42IrWZ6MpZIcumrOFzm+ooiXpGA9Nm29T9RA
	3fSO5t6TVwhD2aoGSYzX2tuDWZKvwIEAhhDSgAwI7pI4YJWoiNrzZZjFW1KGrQJGDIM+WdHJUbc
	/Yv1uRoYzq7BeIPRuqJOL4z1vNGMnjPsGFb3Z
X-Gm-Gg: ASbGncsNDcKk/Iig8fjr8G4i5tbsUSdSKL3Rsy9ANTwxfJOVtzyh5DpiRqucKC9/ecF
	pCnEpwvehWThjvEImQ95DODTPPvp71BwTCpFKtE4MyAm4I31enC+RfyJE0jinJvoa3rKJCqi/0V
	YyeEusfHpFTpJadRFQj6lvJ2wf0a4iCZilgu3ZN2R7xklNxKyWzROH1P6ff5SHIRPH2u/dZY21t
	3/n
X-Google-Smtp-Source: AGHT+IFVsB4cXsx0f4DpL9joLe20LOUC6F1zj9D29SULc+3QURLnfZP+jvSntafOqUK6lndRraIKt9+s5TfyK/IqfdY=
X-Received: by 2002:a05:6871:8106:b0:2e0:15a3:38c9 with SMTP id
 586e51a60fabf-2e3c84d4e15mr6047006fac.27.1747626715990; Sun, 18 May 2025
 20:51:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250504-clang-merge-v7-0-165be7b96180@gmail.com>
 <20250504-clang-merge-v7-1-165be7b96180@gmail.com> <183F8D7C48CC0C39.12622@lists.openembedded.org>
 <OSRPR01MB1159788B7B2BFAB4EC00E08D49B9CA@OSRPR01MB11597.jpnprd01.prod.outlook.com>
In-Reply-To: <OSRPR01MB1159788B7B2BFAB4EC00E08D49B9CA@OSRPR01MB11597.jpnprd01.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 18 May 2025 20:51:44 -0700
X-Gm-Features: AX0GCFusZsK6S7wSjcqDTwAVmSOOnbAzWS2UK6EtlXvsvSNfnIAc3PiVe9EmrYU
Message-ID: <CAMKF1spZyUc4ndUfuJ+jR4aK8SENnCxDQm9Oc+KgAFZcgqMkUg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v7 1/8] clang: Merge llvm/clang family recipes
 from meta-clang
To: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: multipart/alternative; boundary="0000000000009b4fce0635750db7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 03:52:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216812

--0000000000009b4fce0635750db7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yeah I think we will have to consider it

On Sun, May 18, 2025 at 8:25=E2=80=AFPM Yiding Liu (Fujitsu) <liuyd.fnst@fu=
jitsu.com>
wrote:

> Hi Khem Raj
>
> For your reference, paste the differences here.
> Looking forward to your reply.
>
> userland@pumpkin3:/mnt/test/build_auh$ diff
> tmp/work/core2-64-poky-linux/clang/20.1.4/image/usr/include/clang/Config/=
config.h
> tmp/work/core2-32-pokymllib32-linux/lib32-clang/20.1.4/image/usr/include/=
clang/Config/config.h
> 36c36
> < #define CLANG_INSTALL_LIBDIR_BASENAME "lib64"
> ---
> > #define CLANG_INSTALL_LIBDIR_BASENAME "lib"
> userland@pumpkin3:/mnt/test/build_auh$ diff
> tmp/work/core2-64-poky-linux/clang/20.1.4/image/usr/include/clang/Config/=
config.h
> tmp/work/core2-32-pokymllib32-linux/lib32-clang/20.1.4/image/usr/include/=
ll
> lld/    lldb/   llvm/   llvm-c/
> userland@pumpkin3:/mnt/test/build_auh$ diff
> tmp/work/core2-64-poky-linux/clang/20.1.4/image/usr/include/clang/Config/=
config.h
> tmp/work/core2-32-pokymllib32-linux/lib32-clang/20.1.4/image/usr/include/=
ll
> lld/    lldb/   llvm/   llvm-c/
> userland@pumpkin3:/mnt/test/build_auh$ diff
> tmp/work/core2-64-poky-linux/clang/20.1.4/image/usr/include/llvm/Config/l=
lvm-config.h
> tmp/work/core2-32-pokymllib32-linux/lib32-clang/20.1.4/image/usr/include/=
llvm/Config/llvm-config.h
> 22c22
> < #define LLVM_DEFAULT_TARGET_TRIPLE "x86_64-poky-linux"
> ---
> > #define LLVM_DEFAULT_TARGET_TRIPLE "i686-pokymllib32-linux"
> 31c31
> < #define LLVM_HOST_TRIPLE "x86_64-poky-linux"
> ---
> > #define LLVM_HOST_TRIPLE "i686-pokymllib32-linux"
>
> Thanks
>
> Liu Yiding
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org
> > <openembedded-core@lists.openembedded.org> On Behalf Of Yiding Liu
> (Fujitsu)
> > via lists.openembedded.org
> > Sent: 2025=E5=B9=B45=E6=9C=8815=E6=97=A5 8:59
> > To: raj.khem@gmail.com; openembedded-core@lists.openembedded.org
> > Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Subject: Re: [OE-core] [PATCH v7 1/8] clang: Merge llvm/clang family
> recipes
> > from meta-clang
> >
> > Hello Khem Raj
> >
> > Thank you for this series of patch set modifications.
> > But we still can reproduce this issue with latest master:
> >
> > Error: Transaction test error:
> >   file /usr/include/clang/Config/config.h conflicts between attempted
> installs of
> > lib32-clang-dev-20.1.4-r0.core2_32 and clang-dev-20.1.4-r0.core2_64
> >   file /usr/include/llvm/Config/llvm-config.h conflicts between attempt=
ed
> > installs of lib32-clang-dev-20.1.4-r0.core2_32 and
> clang-dev-20.1.4-r0.core2_64
> >
> >
> > reproduce steps:
> > 1. Add in local.conf the following lines:
> >
> >   MACHINE ?=3D "qemux86-64"
> >
> >   require conf/multilib.conf
> >
> >   MULTILIBS ?=3D "multilib:lib32"
> >
> >   DEFAULTTUNE:virtclass-multilib-lib32 ?=3D "core2-32"
> >
> > 2. add lib32-llvm-dev llvm-dev to core-image-minimal.bb
> >
> >   IMAGE_INSTALL =3D "packagegroup-core-boot ${CORE_IMAGE_EXTRA_INSTALL}
> > lib32-clang-dev clang-dev"
> >
> > 3. $ bitbake core-image-minimal
> >
> > Seems multilib_header patch (oe_multilib_header
> llvm/Config/llvm-config.h) is
> > still needed.
> >
> >
> > Liu Yiding
> >
> > > -----Original Message-----
> > > From: openembedded-core@lists.openembedded.org
> > > <openembedded-core@lists.openembedded.org> On Behalf Of Khem Raj via
> > > lists.openembedded.org
> > > Sent: 2025=E5=B9=B45=E6=9C=885=E6=97=A5 12:15
> > > To: openembedded-core@lists.openembedded.org
> > > Cc: Khem Raj <raj.khem@gmail.com>; Dmitry Baryshkov
> > > <dmitry.baryshkov@oss.qualcomm.com>
> > > Subject: [OE-core] [PATCH v7 1/8] clang: Merge llvm/clang family
> recipes from
> > > meta-clang
> > >
> > > This can ensure that meta-clang does not carry them and can rely on
> core layer
> > > while mesa can use them too.
> > >
> > > Omit time stamps in openmp from generated files to improve
> > > reproducibility
> > >
> > > fix the issue that:
> > > | file /usr/include/llvm/Config/llvm-config.h conflicts between
> attempted
> > installs
> > > of lib32-llvm-dev-20.1.2-r0.core2_32 and llvm-dev-20.1.2-r0.core2_64
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  .../clang/clang-cross-canadian_git.bb              |  36 ++
> > >  meta/recipes-devtools/clang/clang-cross_git.bb     |  39 ++
> > >  meta/recipes-devtools/clang/clang-crosssdk_git.bb  |  33 ++
> > >  ...ind-libunwind-headers-when-LIBCXXABI_LIBU.patch |  60 +++
> > >  ...er-rt-support-a-new-embedded-linux-target.patch | 309 +++++++++++=
++
> > >  ...-Simplify-cross-compilation.-Don-t-use-na.patch |  44 ++
> > >  ...LibraryInfo-Undefine-libc-functions-if-th.patch |  90 ++++
> > >  ...allow-env-override-of-exe-and-libdir-path.patch |  71 +++
> > >  ...-clang-driver-Check-sysroot-for-ldso-path.patch |  78 ++++
> > >  ...iver-tools.cpp-Add-lssp_nonshared-on-musl.patch |  32 ++
> > >  .../0008-clang-Prepend-trailing-to-sysroot.patch   |  39 ++
> > >  ...inside-the-target-sysroot-for-compiler-ru.patch |  41 ++
> > >  ...ang-Define-releative-gcc-installation-dir.patch | 123 ++++++
> > >  ...pthread-and-ldl-along-with-lunwind-for-st.patch |  35 ++
> > >  ..._EXECUTABLE-when-cross-compiling-for-nati.patch |  24 +
> > >  .../0013-Check-for-atomic-double-intrinsics.patch  |  34 ++
> > >  ...configure-for-packages-using-find_package.patch |   2 +-
> > >  ...esource-dir-location-for-cross-toolchains.patch |  50 +++
> > >  ...r-Add-dyld-prefix-when-checking-sysroot-f.patch |  79 ++++
> > >  .../0017-clang-Use-python3-in-python-scripts.patch |  35 ++
> > >  ...Insert-anchor-for-adding-OE-distro-vendor.patch | 167 +++++++
> > >  ...-Do-not-use-backtrace-APIs-on-non-glibc-l.patch |  68 +++
> > >  ...86-triple-for-non-debian-multiarch-linux-.patch |  28 ++
> > >  ...0021-libunwind-Added-unw_backtrace-method.patch |  56 +++
> > >  .../0022-lldb-Link-with-libatomic-on-x86.patch     |  33 ++
> > >  ...023-compiler-rt-Enable-__int128-for-ppc32.patch |  73 +++
> > >  ...-Do-not-use-cmake-infra-to-detect-libzstd.patch |  62 +++
> > >  ...ler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch |  46 ++
> > >  ...-Undef-_TIME_BITS-along-with-_FILE_OFFSET.patch |  43 ++
> > >  ...s-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch |  81 ++++
> > >  ...vm-Add-OE-specific-ABI-triple-for-N32-ABI.patch |  78 ++++
> > >  ...d-libunwind.pc.in-and-llvm-config-scripts.patch |  90 ++++
> > >  ...py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch |  92 ++++
> > >  ...r-rt-Do-not-pass-target-to-clang-compiler.patch |  29 ++
> > >  .../clang/clang/0032-Fix-build-on-ppc64-musl.patch |  97 ++++
> > >  ...d-a-build-option-to-disable-building-dexp.patch |  85 ++++
> > >  ...itter-sort-ClassInfo-lists-by-name-as-we.patch} |   4 +-
> > >  ...-remove-LLVM_LDFLAGS-from-ldflags-output.patch} |  12 +-
> > >  ...ot-emit-date-and-time-into-generate-files.patch |  37 ++
> > >  .../clang}/spirv-internal-build.patch              |   0
> > >  .../clang}/spirv-shared-library.patch              |   0
> > >  meta/recipes-devtools/clang/clang_git.bb           | 492
> > > +++++++++++++++++++++
> > >  meta/recipes-devtools/clang/common-clang.inc       |  24 +
> > >  meta/recipes-devtools/clang/common-source.inc      |  17 +
> > >  meta/recipes-devtools/clang/common.inc             |  83 ++++
> > >  .../clang/compiler-rt-sanitizers_git.bb            | 131 ++++++
> > >  meta/recipes-devtools/clang/compiler-rt_git.bb     | 121 +++++
> > >  meta/recipes-devtools/clang/libcxx_git.bb          | 115 +++++
> > >  meta/recipes-devtools/clang/llvm-project-source.bb |  12 +
> > >  .../recipes-devtools/clang/llvm-project-source.inc |  99 +++++
> > >  .../recipes-devtools/clang/nativesdk-clang-glue.bb |  36 ++
> > >  meta/recipes-devtools/clang/openmp_git.bb          |  65 +++
> > >  .../0007-llvm-allow-env-override-of-exe-path.patch |  36 --
> > >  meta/recipes-devtools/llvm/llvm/llvm-config        |  54 ---
> > >  meta/recipes-devtools/llvm/llvm_20.1.2.bb          | 233 ----------
> > >  55 files changed, 3620 insertions(+), 333 deletions(-)
> > >
> > > diff --git a/meta/recipes-devtools/clang/clang-cross-canadian_git.bb
> > > b/meta/recipes-devtools/clang/clang-cross-canadian_git.bb
> > > new file mode 100644
> > > index
> > >
> > 0000000000000000000000000000000000000000..456c0d61bc560ee131e06fd3
> > > 7eb434ab366b1861
> > > --- /dev/null
> > > +++ b/meta/recipes-devtools/clang/clang-cross-canadian_git.bb
> > > @@ -0,0 +1,36 @@
> > > +# Copyright (C) 2014 Khem Raj <raj.khem@gmail.com>
> > > +# Released under the MIT license (see COPYING.MIT for the terms)
> > > +
> > > +SUMMARY =3D "Clang/LLVM based C/C++ compiler (cross-canadian for
> > > ${TARGET_ARCH} target)"
> > > +HOMEPAGE =3D "http://clang.llvm.org/"
> > > +LIC_FILES_CHKSUM =3D
> > >
> > "file://${COMMON_LICENSE_DIR}/Apache-2.0-with-LLVM-exception;md5=3D0bcd
> > > 48c3bdfef0c9d9fd17726e4b7dab"
> > > +SECTION =3D "devel"
> > > +
> > > +PN =3D "clang-cross-canadian-${TRANSLATED_TARGET_ARCH}"
> > > +
> > > +require common-clang.inc
> > > +require common-source.inc
> > > +inherit cross-canadian
> > > +
> > > +DEPENDS +=3D "nativesdk-clang
> > > binutils-cross-canadian-${TRANSLATED_TARGET_ARCH}
> > > virtual/nativesdk-cross-binutils virtual/nativesdk-libc"
> > > +# We have to point gcc at a sysroot but we don't need to rebuild if
> this
> > changes
> > > +# e.g. we switch between different machines with different tunes.
> > > +EXTRA_OECONF_PATHS[vardepsexclude] =3D "TUNE_PKGARCH"
> > > +TARGET_ARCH[vardepsexclude] =3D "TUNE_ARCH"
> > > +
> > > +do_install() {
> > > +   install -d ${D}${bindir}
> > > +   for tool in clang clang++ clang-tidy lld ld.lld llvm-profdata \
> > > +           llvm-nm llvm-ar llvm-as llvm-ranlib llvm-strip llvm-objco=
py
> > > llvm-objdump llvm-readelf \
> > > +           llvm-addr2line llvm-dwp llvm-size llvm-strings llvm-cov
> > > +   do
> > > +           ln -sf ../$tool ${D}${bindir}/${TARGET_PREFIX}$tool
> > > +   done
> > > +}
> > > +SSTATE_SCAN_FILES +=3D "*-clang *-clang++ *-llvm-profdata *-llvm-ar =
\
> > > +                      *-llvm-ranlib *-llvm-nm *-lld *-ld.lld *-llvm-=
as
> > > *-llvm-strip \
> > > +                      *-llvm-objcopy *-llvm-objdump *-llvm-readelf
> > > *-llvm-addr2line \
> > > +                      *-llvm-dwp *-llvm-size *-llvm-strings
> *-llvm-cov"
> > > +do_install:append() {
> > > +   cross_canadian_bindirlinks
> > > +}
> > > diff --git a/meta/recipes-devtools/clang/clang-cross_git.bb
> > > b/meta/recipes-devtools/clang/clang-cross_git.bb
> > > new file mode 100644
> > > index
> > >
> > 0000000000000000000000000000000000000000..9b9b120a3d793f6dd989b566
> > > b3736934f1c0ff8d
> > > --- /dev/null
> > > +++ b/meta/recipes-devtools/clang/clang-cross_git.bb
> > > @@ -0,0 +1,39 @@
> > > +# Copyright (C) 2014 Khem Raj <raj.khem@gmail.com>
> > > +# Released under the MIT license (see COPYING.MIT for the terms)
> > > +
> > > +SUMMARY =3D "Cross compiler wrappers for LLVM based C/C++ compiler"
> > > +HOMEPAGE =3D "http://clang.llvm.org/"
> > > +LIC_FILES_CHKSUM =3D
> > >
> > "file://${COMMON_LICENSE_DIR}/Apache-2.0-with-LLVM-exception;md5=3D0bcd
> > > 48c3bdfef0c9d9fd17726e4b7dab"
> > > +SECTION =3D "devel"
> > > +
> > > +PN =3D "clang-cross-${TARGET_ARCH}"
> > > +
> > > +require common-clang.inc
> > > +require common-source.inc
> > > +inherit cross
> > > +DEPENDS +=3D "clang-native virtual/cross-binutils"
> > > +
> > > +#INHIBIT_PACKAGE_STRIP =3D "1"
> > > +INHIBIT_SYSROOT_STRIP =3D "1"
> > > +do_install() {
> > > +        install -d ${D}${bindir}
> > > +   for tool in clang-tidy lld ld.lld llvm-profdata \
> > > +            llvm-nm llvm-ar llvm-as llvm-ranlib llvm-strip
> llvm-objcopy
> > > llvm-objdump llvm-readelf \
> > > +            llvm-addr2line llvm-dwp llvm-size llvm-strings llvm-cov
> > > +   do
> > > +           ln -sf ../$tool ${D}${bindir}/${TARGET_PREFIX}$tool
> > > +   done
> > > +   install -m 0755 ${STAGING_BINDIR_NATIVE}/clang
> > > ${D}${bindir}/${TARGET_PREFIX}clang
> > > +   install -m 0755 ${STAGING_BINDIR_NATIVE}/clang
> > > ${D}${bindir}/${TARGET_PREFIX}clang++
> > > +}
> > > +SSTATE_SCAN_FILES +=3D "*-clang *-clang++ *-llvm-profdata *-lld
> *-ld.lld \
> > > +                      *-llvm-nm *-llvm-ar *-llvm-as *-llvm-ranlib
> > > *-llvm-strip \
> > > +                      *-llvm-objcopy *-llvm-objdump *-llvm-readelf
> > > *-llvm-addr2line \
> > > +                      *-llvm-dwp *-llvm-size *-llvm-strings
> *-llvm-cov"
> > > +
> > > +SYSROOT_PREPROCESS_FUNCS +=3D "clangcross_sysroot_preprocess"
> > > +
> > > +clangcross_sysroot_preprocess () {
> > > +        sysroot_stage_dir ${D}${bindir} ${SYSROOT_DESTDIR}${bindir}
> > > +}
> > > +PACKAGES =3D ""
> > > diff --git a/meta/recipes-devtools/clang/clang-crosssdk_git.bb
> > > b/meta/recipes-devtools/clang/clang-crosssdk_git.bb
> > > new file mode 100644
> > > index
> > >
> > 0000000000000000000000000000000000000000..47ac96f4f93688b216adc95f4
> > > 473b8c2dc3ec98b
> > > --- /dev/null
> > > +++ b/meta/recipes-devtools/clang/clang-crosssdk_git.bb
> > > @@ -0,0 +1,33 @@
> > > +# Copyright (C) 2014 Khem Raj <raj.khem@gmail.com>
> > > +# Released under the MIT license (see COPYING.MIT for the terms)
> > > +
> > > +SUMMARY =3D "SDK Cross compiler wrappers for LLVM based C/C++ compil=
er"
> > > +HOMEPAGE =3D "http://clang.llvm.org/"
> > > +LIC_FILES_CHKSUM =3D
> > >
> > "file://${COMMON_LICENSE_DIR}/Apache-2.0-with-LLVM-exception;md5=3D0bcd
> > > 48c3bdfef0c9d9fd17726e4b7dab"
> > > +SECTION =3D "devel"
> > > +
> > > +PN =3D "clang-crosssdk-${SDK_SYS}"
> > > +
> > > +require common-clang.inc
> > > +require common-source.inc
> > > +inherit crosssdk
> > > +DEPENDS +=3D "clang-native nativesdk-clang-glue
> > virtual/nativesdk-cross-binutils
> > > virtual/nativesdk-libc"
> > > +
> > > +do_install() {
> > > +    install -d ${D}${bindir}
> > > +   for tool in clang clang++ clang-tidy lld ld.lld llvm-profdata \
> > > +           llvm-nm llvm-ar llvm-as llvm-ranlib llvm-strip llvm-objco=
py
> > > llvm-objdump llvm-readelf \
> > > +           llvm-addr2line llvm-dwp llvm-size llvm-strings llvm-cov
> > > +   do
> > > +           ln -sf ../$tool ${D}${bindir}/${TARGET_PREFIX}$tool
> > > +   done
> > > +}
> > > +SSTATE_SCAN_FILES +=3D "*-clang *-clang++ *-llvm-profdata *-lld
> *-ld.lld \
> > > +                      *-llvm-nm *-llvm-ar *-llvm-as *-llvm-ranlib
> > > *-llvm-strip \
> > > +                      *-llvm-objcopy *-llvm-objdump *-llvm-readelf
> > > *-llvm-addr2line \
> > > +                      *-llvm-dwp *-llvm-size *-llvm-strings
> *-llvm-cov"
> > > +sysroot_stage_all () {
> > > +   sysroot_stage_dir ${D}${bindir} ${SYSROOT_DESTDIR}${bindir}
> > > +}
> > > +
> > > +PACKAGES =3D ""
> > > diff --git
> > >
> >
> a/meta/recipes-devtools/clang/clang/0001-libcxxabi-Find-libunwind-headers=
-w
> > > hen-LIBCXXABI_LIBU.patch
> > >
> >
> b/meta/recipes-devtools/clang/clang/0001-libcxxabi-Find-libunwind-headers=
-w
> > > hen-LIBCXXABI_LIBU.patch
> > > new file mode 100644
> > > index
> > >
> > 0000000000000000000000000000000000000000..21b033b498e5d66322493b8
> > > 4da6814d5712c0a8a
> > > --- /dev/null
> > > +++
> > >
> >
> b/meta/recipes-devtools/clang/clang/0001-libcxxabi-Find-libunwind-headers=
-w
> > > hen-LIBCXXABI_LIBU.patch
> > > @@ -0,0 +1,60 @@
> > > +From ec9babfa91931042e7aa771915e2f1d4dc8d15e0 Mon Sep 17 00:00:00
> > > 2001
> > > +From: Khem Raj <raj.khem@gmail.com>
> > > +Date: Sun, 27 Aug 2017 10:37:49 -0700
> > > +Subject: [PATCH] libcxxabi: Find libunwind headers when
> > > + LIBCXXABI_LIBUNWIND_INCLUDES is set
> > > +
> > > +Currently, when LIBCXXABI_LIBUNWIND_INCLUDES is set via CMake
> > > arguments
> > > +then it ends up not searching the specified dir and unwind.h is not
> found
> > > +especially for ARM targets
> > > +
> > > +This patch makes the searching synthesized directories and then set
> > > +LIBCXXABI_LIBUNWIND_INCLUDES if its there in environment
> > > +
> > > +Upstream-Status: Pending
> > > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > +---
> > > + libcxxabi/CMakeLists.txt | 15 ++++++++++-----
> > > + 1 file changed, 10 insertions(+), 5 deletions(-)
> > > +
> > > +diff --git a/libcxxabi/CMakeLists.txt b/libcxxabi/CMakeLists.txt
> > > +index 6dcfc51e5532..32478a62a058 100644
> > > +--- a/libcxxabi/CMakeLists.txt
> > > ++++ b/libcxxabi/CMakeLists.txt
> > > +@@ -465,7 +465,7 @@ set(LIBCXXABI_LIBUNWIND_PATH
> > > "${LIBCXXABI_LIBUNWIND_PATH}" CACHE PATH
> > > +     "Specify path to libunwind source." FORCE)
> > > +
> > > + if (LIBCXXABI_USE_LLVM_UNWINDER OR LLVM_NATIVE_ARCH MATCHES
> > > ARM)
> > > +-  find_path(LIBCXXABI_LIBUNWIND_INCLUDES_INTERNAL libunwind.h
> > > ++  find_path(LIBCXXABI_LIBUNWIND_INCLUDES libunwind.h
> > > +     PATHS ${LIBCXXABI_LIBUNWIND_INCLUDES}
> > > +           ${LIBCXXABI_LIBUNWIND_PATH}/include
> > > +           ${CMAKE_BINARY_DIR}/${LIBCXXABI_LIBUNWIND_INCLUDES}
> > > +@@ -476,18 +476,23 @@ if (LIBCXXABI_USE_LLVM_UNWINDER OR
> > > LLVM_NATIVE_ARCH MATCHES ARM)
> > > +     NO_CMAKE_FIND_ROOT_PATH
> > > +   )
> > > +
> > > +-  if (LIBCXXABI_LIBUNWIND_INCLUDES_INTERNAL STREQUAL
> > > "LIBCXXABI_LIBUNWIND_INCLUDES_INTERNAL-NOTFOUND")
> > > +-    set(LIBCXXABI_LIBUNWIND_INCLUDES_INTERNAL "")
> > > ++  if (LIBCXXABI_LIBUNWIND_INCLUDES STREQUAL
> > > "LIBCXXABI_LIBUNWIND_INCLUDES-NOTFOUND")
> > > ++    set(LIBCXXABI_LIBUNWIND_INCLUDES "")
> > > +   endif()
> > > + endif()
> > > +
> > > +-if (NOT "${LIBCXXABI_LIBUNWIND_INCLUDES_INTERNAL}" STREQUAL "")
> > > +-  include_directories("${LIBCXXABI_LIBUNWIND_INCLUDES_INTERNAL}")
> > > ++if (NOT "${LIBCXXABI_LIBUNWIND_INCLUDES}" STREQUAL "")
> > > ++  include_directories("${LIBCXXABI_LIBUNWIND_INCLUDES}")
> > > + endif()
> > > +
> > > + add_custom_target(cxxabi-test-depends
> > > +   COMMENT "Build dependencies required to run the libc++abi test
> suite.")
> > > +
> > > ++set(LIBCXXABI_LIBUNWIND_INCLUDES
> > > "${LIBCXXABI_LIBUNWIND_INCLUDES}" CACHE PATH
> > > ++    "Specify path to libunwind includes." FORCE)
> > > ++set(LIBCXXABI_LIBUNWIND_PATH "${LIBCXXABI_LIBUNWIND_PATH}"
> > CACHE
> > > PATH
> > > ++    "Specify path to libunwind source." FORCE)
> > > ++
> > > + # Add source code. This also contains all of the logic for deciding
> linker flags
> > > + # soname, etc...
> > > + add_subdirectory(include)
> > > diff --git
> > >
> > a/meta/recipes-devtools/clang/clang/0002-compiler-rt-support-a-new-embe=
dd
> > > ed-linux-target.patch
> > >
> > b/meta/recipes-devtools/clang/clang/0002-compiler-rt-support-a-new-embe=
dd
> > > ed-linux-target.patch
> > > new file mode 100644
> > > index
> > >
> > 0000000000000000000000000000000000000000..88cef402daad0b0470f8057e
> > > 55b2a71558c428d2
> > > --- /dev/null
> > > +++
> > >
> > b/meta/recipes-devtools/clang/clang/0002-compiler-rt-support-a-new-embe=
dd
> > > ed-linux-target.patch
> > > @@ -0,0 +1,309 @@
> > > +From 8cdfcfb9102c4008758bb844856e553d4fe4ae79 Mon Sep 17 00:00:00
> > > 2001
> > > +From: Khem Raj <raj.khem@gmail.com>
> > > +Date: Sun, 19 Apr 2015 15:16:23 -0700
> > > +Subject: [PATCH] compiler-rt: support a new embedded linux target
> > > +
> > > +Upstream-Status: Pending
> > > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > +---
> > > + .../make/platform/clang_linux_embedded.mk     | 286
> > > ++++++++++++++++++
> > > + .../clang_linux_embedded_test_input.c         |   0
> > > + 2 files changed, 286 insertions(+)
> > > + create mode 100644 compiler-rt/make/platform/clang_linux_embedded.m=
k
> > > + create mode 100644
> > > compiler-rt/make/platform/clang_linux_embedded_test_input.c
> > > +
> > > +diff --git a/compiler-rt/make/platform/clang_linux_embedded.mk
> > > b/compiler-rt/make/platform/clang_linux_embedded.mk
> > > +new file mode 100644
> > > +index 000000000000..d0a890075a1c
> > > +--- /dev/null
> > > ++++ b/compiler-rt/make/platform/clang_linux_embedded.mk
> > > +@@ -0,0 +1,286 @@
> > > ++# These are the functions which clang needs when it is targeting a
> previous
> > > ++# version of the OS. The issue is that the backend may use function=
s
> which
> > > were
> > > ++# not present in the libgcc that shipped on the platform. In such
> cases, we
> > link
> > > ++# with a version of the library which contains private_extern
> definitions of all
> > > ++# the extra functions which might be referenced.
> > > ++
> > > ++Description :=3D Static runtime libraries for embedded clang/Linux
> > > ++
> > > ++# A function that ensures we don't try to build for architectures
> that we
> > > ++# don't have working toolchains for.
> > > ++CheckArches =3D \
> > > ++  $(shell \
> > > ++    result=3D""; \
> > > ++    for arch in $(1); do \
> > > ++      if $(CC) -arch $$arch -c \
> > > ++    -integrated-as \
> > > ++    $(ProjSrcRoot)/make/platform/clang_linux_embedded_test_input.c =
\
> > > ++    -o /dev/null > /dev/null 2> /dev/null; then \
> > > ++        result=3D"$$result$$arch "; \
> > > ++      else \
> > > ++  printf 1>&2 \
> > > ++    "warning: clang_linux_embedded.mk: dropping arch '$$arch' from
> lib
> > > '$(2)'\n"; \
> > > ++      fi; \
> > > ++    done; \
> > > ++    echo $$result)
> > > ++
> > > ++XCRun =3D \
> > > ++  $(shell \
> > > ++    result=3D`xcrun -find $(1) 2> /dev/null`; \
> > > ++    if [ "$$?" !=3D "0" ]; then result=3D$(1); fi; \
> > > ++    echo $$result)
> > > ++
> > > ++###
> > > ++
> > > ++CC       :=3D $(call XCRun,clang)
> > > ++AR       :=3D $(call XCRun,ar)
> > > ++RANLIB   :=3D $(call XCRun,ranlib)
> > > ++STRIP    :=3D $(call XCRun,strip)
> > > ++LIPO     :=3D $(call XCRun,lipo)
> > > ++DSYMUTIL :=3D $(call XCRun,dsymutil)
> > > ++Configs :=3D
> > > ++UniversalArchs :=3D
> > > ++
> > > ++# Soft-float version of the runtime. No floating-point instructions
> will be used
> > > ++# and the ABI (out of necessity) passes floating values in normal
> registers:
> > > ++# non-VFP variant of the AAPCS.
> > > ++UniversalArchs.soft_static :=3D $(call CheckArches,arm armv7m armv7=
em
> > > armv7,soft_static)
> > > ++Configs +=3D $(if $(UniversalArchs.soft_static),soft_static)
> > > ++
> > > ++# Hard-float version of the runtime. On ARM VFP instructions and
> registers
> > are
> > > ++# allowed, and floating point values get passed in them. VFP varian=
t
> of the
> > > ++# AAPCS.
> > > ++UniversalArchs.hard_static :=3D $(call CheckArches,armv7em armv7 i3=
86
> > > x86_64,hard_static)
> > > ++Configs +=3D $(if $(UniversalArchs.hard_static),hard_static)
> > > ++
> > > ++UniversalArchs.soft_pic :=3D $(call CheckArches,armv6m armv7m armv7=
em
> > > armv7,soft_pic)
> > > ++Configs +=3D $(if $(UniversalArchs.soft_pic),soft_pic)
> > > ++
> > > ++UniversalArchs.hard_pic :=3D $(call CheckArches,armv7em armv7 i386
> > > x86_64,hard_pic)
> > > ++Configs +=3D $(if $(UniversalArchs.hard_pic),hard_pic)
> > > ++
> > > ++CFLAGS :=3D -Wall -Werror -Oz -fomit-frame-pointer -ffreestanding
> > > ++
> > > ++PIC_CFLAGS :=3D -fPIC
> > > ++STATIC_CFLAGS :=3D -static
> > > ++
> > > ++CFLAGS_SOFT :=3D -mfloat-abi=3Dsoft
> > > ++CFLAGS_HARD :=3D -mfloat-abi=3Dhard
> > > ++
> > > ++CFLAGS_I386  :=3D -march=3Dpentium
> > > ++
> > > ++CFLAGS.soft_static :=3D $(CFLAGS) $(STATIC_CFLAGS) $(CFLAGS_SOFT)
> > > ++CFLAGS.hard_static :=3D $(CFLAGS) $(STATIC_CFLAGS) $(CFLAGS_HARD)
> > > ++CFLAGS.soft_pic    :=3D $(CFLAGS) $(PIC_CFLAGS) $(CFLAGS_SOFT)
> > > ++CFLAGS.hard_pic    :=3D $(CFLAGS) $(PIC_CFLAGS) $(CFLAGS_HARD)
> > > ++
> > > ++CFLAGS.soft_static.armv7 :=3D $(CFLAGS.soft_static) $(CFLAGS_ARMV7)
> > > ++CFLAGS.hard_static.armv7 :=3D $(CFLAGS.hard_static) $(CFLAGS_ARMV7)
> > > ++CFLAGS.soft_pic.armv7    :=3D $(CFLAGS.soft_pic) $(CFLAGS_ARMV7)
> > > ++CFLAGS.hard_pic.armv7    :=3D $(CFLAGS.hard_pic) $(CFLAGS_ARMV7)
> > > ++
> > > ++# x86 platforms ignore -mfloat-abi options and complain about doing
> so.
> > > Despite
> > > ++# this they're hard-float.
> > > ++CFLAGS.hard_static.i386   :=3D $(CFLAGS) $(STATIC_CFLAGS)
> $(CFLAGS_I386)
> > > ++CFLAGS.hard_pic.i386      :=3D $(CFLAGS) $(PIC_CFLAGS) $(CFLAGS_I38=
6)
> > > ++CFLAGS.hard_static.x86_64 :=3D $(CFLAGS) $(STATIC_CFLAGS)
> > > ++CFLAGS.hard_pic.x86_64    :=3D $(CFLAGS) $(PIC_CFLAGS)
> > > ++
> > > ++# Functions not wanted:
> > > ++#   + eprintf is obsolete anyway
> > > ++#   + *vfp: designed for Thumb1 CPUs with VFPv2
> > > ++
> > > ++COMMON_FUNCTIONS :=3D \
> > > ++  absvdi2 \
> > > ++  absvsi2 \
> > > ++  addvdi3 \
> > > ++  addvsi3 \
> > > ++  ashldi3 \
> > > ++  ashrdi3 \
> > > ++  bswapdi2 \
> > > ++  bswapsi2 \
> > > ++  clzdi2 \
> > > ++  clzsi2 \
> > > ++  cmpdi2 \
> > > ++  ctzdi2 \
> > > ++  ctzsi2 \
> > > ++  divdc3 \
> > > ++  divdi3 \
> > > ++  divsc3 \
> > > ++  divmodsi4 \
> > > ++  udivmodsi4 \
> > > ++  do_global_dtors \
> > > ++  ffsdi2 \
> > > ++  fixdfdi \
> > > ++  fixsfdi \
> > > ++  fixunsdfdi \
> > > ++  fixunsdfsi \
> > > ++  fixunssfdi \
> > > ++  fixunssfsi \
> > > ++  floatdidf \
> > > ++  floatdisf \
> > > ++  floatundidf \
> > > ++  floatundisf \
> > > ++  gcc_bcmp \
> > > ++  lshrdi3 \
> > > ++  moddi3 \
> > > ++  muldc3 \
> > > ++  muldi3 \
> > > ++  mulsc3 \
> > > ++  mulvdi3 \
> > > ++  mulvsi3 \
> > > ++  negdi2 \
> > > ++  negvdi2 \
> > > ++  negvsi2 \
> > > ++  paritydi2 \
> > > ++  paritysi2 \
> > > ++  popcountdi2 \
> > > ++  popcountsi2 \
> > > ++  powidf2 \
> > > ++  powisf2 \
> > > ++  subvdi3 \
> > > ++  subvsi3 \
> > > ++  ucmpdi2 \
> > > ++  udiv_w_sdiv \
> > > ++  udivdi3 \
> > > ++  udivmoddi4 \
> > > ++  umoddi3 \
> > > ++  adddf3 \
> > > ++  addsf3 \
> > > ++  cmpdf2 \
> > > ++  cmpsf2 \
> > > ++  div0 \
> > > ++  divdf3 \
> > > ++  divsf3 \
> > > ++  divsi3 \
> > > ++  extendsfdf2 \
> > > ++  ffssi2 \
> > > ++  fixdfsi \
> > > ++  fixsfsi \
> > > ++  floatsidf \
> > > ++  floatsisf \
> > > ++  floatunsidf \
> > > ++  floatunsisf \
> > > ++  comparedf2 \
> > > ++  comparesf2 \
> > > ++  modsi3 \
> > > ++  muldf3 \
> > > ++  mulsf3 \
> > > ++  negdf2 \
> > > ++  negsf2 \
> > > ++  subdf3 \
> > > ++  subsf3 \
> > > ++  truncdfsf2 \
> > > ++  udivsi3 \
> > > ++  umodsi3 \
> > > ++  unorddf2 \
> > > ++  unordsf2
> > > ++
> > > ++ARM_FUNCTIONS :=3D \
> > > ++  aeabi_cdcmpeq \
> > > ++  aeabi_cdrcmple \
> > > ++  aeabi_cfcmpeq \
> > > ++  aeabi_cfrcmple \
> > > ++  aeabi_dcmpeq \
> > > ++  aeabi_dcmpge \
> > > ++  aeabi_dcmpgt \
> > > ++  aeabi_dcmple \
> > > ++  aeabi_dcmplt \
> > > ++  aeabi_drsub \
> > > ++  aeabi_fcmpeq \
> > > ++  aeabi_fcmpge \
> > > ++  aeabi_fcmpgt \
> > > ++  aeabi_fcmple \
> > > ++  aeabi_fcmplt \
> > > ++  aeabi_frsub \
> > > ++  aeabi_idivmod \
> > > ++  aeabi_uidivmod \
> > > ++
> > > ++# ARM Assembly implementation which requires Thumb2 (i.e. won't wor=
k
> on
> > > v6M).
> > > ++THUMB2_FUNCTIONS :=3D \
> > > ++  switch16 \
> > > ++  switch32 \
> > > ++  switch8 \
> > > ++  switchu8 \
> > > ++  sync_fetch_and_add_4 \
> > > ++  sync_fetch_and_sub_4 \
> > > ++  sync_fetch_and_and_4 \
> > > ++  sync_fetch_and_or_4 \
> > > ++  sync_fetch_and_xor_4 \
> > > ++  sync_fetch_and_nand_4 \
> > > ++  sync_fetch_and_max_4 \
> > > ++  sync_fetch_and_umax_4 \
> > > ++  sync_fetch_and_min_4 \
> > > ++  sync_fetch_and_umin_4 \
> > > ++  sync_fetch_and_add_8 \
> > > ++  sync_fetch_and_sub_8 \
> > > ++  sync_fetch_and_and_8 \
> > > ++  sync_fetch_and_or_8 \
> > > ++  sync_fetch_and_xor_8 \
> > > ++  sync_fetch_and_nand_8 \
> > > ++  sync_fetch_and_max_8 \
> > > ++  sync_fetch_and_umax_8 \
> > > ++  sync_fetch_and_min_8 \
> > > ++  sync_fetch_and_umin_8
> > > ++
> > > ++I386_FUNCTIONS :=3D  \
> > > ++  i686.get_pc_thunk.eax \
> > > ++  i686.get_pc_thunk.ebp \
> > > ++  i686.get_pc_thunk.ebx \
> > > ++  i686.get_pc_thunk.ecx \
> > > ++  i686.get_pc_thunk.edi \
> > > ++  i686.get_pc_thunk.edx \
> > > ++  i686.get_pc_thunk.esi
> > > ++
> > > ++# FIXME: Currently, compiler-rt is missing implementations for a
> number of
> > the
> > > ++# functions. Filter them out for now.
> > > ++MISSING_FUNCTIONS :=3D \
> > > ++  cmpdf2 cmpsf2 div0 \
> > > ++  ffssi2 \
> > > ++  udiv_w_sdiv unorddf2 unordsf2 bswapdi2 \
> > > ++  bswapsi2 \
> > > ++  gcc_bcmp \
> > > ++  do_global_dtors \
> > > ++  i686.get_pc_thunk.eax i686.get_pc_thunk.ebp i686.get_pc_thunk.ebx=
 \
> > > ++  i686.get_pc_thunk.ecx i686.get_pc_thunk.edi i686.get_pc_thunk.edx=
 \
> > > ++  i686.get_pc_thunk.esi \
> > > ++  aeabi_cdcmpeq aeabi_cdrcmple aeabi_cfcmpeq aeabi_cfrcmple
> > > aeabi_dcmpeq \
> > > ++  aeabi_dcmpge aeabi_dcmpgt aeabi_dcmple aeabi_dcmplt aeabi_drsub \
> > > ++  aeabi_fcmpeq \ aeabi_fcmpge aeabi_fcmpgt aeabi_fcmple aeabi_fcmpl=
t
> \
> > > ++  aeabi_frsub aeabi_idivmod aeabi_uidivmod
> > > ++
> > > ++FUNCTIONS_ARMV6M  :=3D $(COMMON_FUNCTIONS) $(ARM_FUNCTIONS)
> > > ++FUNCTIONS_ARM_ALL :=3D $(COMMON_FUNCTIONS) $(ARM_FUNCTIONS)
> > > $(THUMB2_FUNCTIONS)
> > > ++FUNCTIONS_I386    :=3D $(COMMON_FUNCTIONS) $(I386_FUNCTIONS)
> > > ++FUNCTIONS_X86_64  :=3D $(COMMON_FUNCTIONS)
> > > ++
> > > ++FUNCTIONS_ARMV6M :=3D \
> > > ++  $(filter-out $(MISSING_FUNCTIONS),$(FUNCTIONS_ARMV6M))
> > > ++FUNCTIONS_ARM_ALL :=3D \
> > > ++  $(filter-out $(MISSING_FUNCTIONS),$(FUNCTIONS_ARM_ALL))
> > > ++FUNCTIONS_I386 :=3D \
> > > ++  $(filter-out $(MISSING_FUNCTIONS),$(FUNCTIONS_I386))
> > > ++FUNCTIONS_X86_64 :=3D \
> > > ++  $(filter-out $(MISSING_FUNCTIONS),$(FUNCTIONS_X86_64))
> > > ++
> > > ++FUNCTIONS.soft_static.armv6m :=3D $(FUNCTIONS_ARMV6M)
> > > ++FUNCTIONS.soft_pic.armv6m    :=3D $(FUNCTIONS_ARMV6M)
> > > ++
> > > ++FUNCTIONS.soft_static.armv7m :=3D $(FUNCTIONS_ARM_ALL)
> > > ++FUNCTIONS.soft_pic.armv7m    :=3D $(FUNCTIONS_ARM_ALL)
> > > ++
> > > ++FUNCTIONS.soft_static.armv7em :=3D $(FUNCTIONS_ARM_ALL)
> > > ++FUNCTIONS.hard_static.armv7em :=3D $(FUNCTIONS_ARM_ALL)
> > > ++FUNCTIONS.soft_pic.armv7em    :=3D $(FUNCTIONS_ARM_ALL)
> > > ++FUNCTIONS.hard_pic.armv7em    :=3D $(FUNCTIONS_ARM_ALL)
> > > ++
> > > ++FUNCTIONS.soft_static.armv7 :=3D $(FUNCTIONS_ARM_ALL)
> > > ++FUNCTIONS.hard_static.armv7 :=3D $(FUNCTIONS_ARM_ALL)
> > > ++FUNCTIONS.soft_pic.armv7    :=3D $(FUNCTIONS_ARM_ALL)
> > > ++FUNCTIONS.hard_pic.armv7    :=3D $(FUNCTIONS_ARM_ALL)
> > > ++
> > > ++FUNCTIONS.hard_static.i386 :=3D $(FUNCTIONS_I386)
> > > ++FUNCTIONS.hard_pic.i386    :=3D $(FUNCTIONS_I386)
> > > ++
> > > ++FUNCTIONS.hard_static.x86_64 :=3D $(FUNCTIONS_X86_64)
> > > ++FUNCTIONS.hard_pic.x86_64    :=3D $(FUNCTIONS_X86_64)
> > > +diff --git
> a/compiler-rt/make/platform/clang_linux_embedded_test_input.c
> > > b/compiler-rt/make/platform/clang_linux_embedded_test_input.c
> > > +new file mode 100644
> > > +index 000000000000..e69de29bb2d1
> > > diff --git
> > >
> >
> a/meta/recipes-devtools/clang/clang/0003-compiler-rt-Simplify-cross-compi=
lati
> > > on.-Don-t-use-na.patch
> > >
> >
> b/meta/recipes-devtools/clang/clang/0003-compiler-rt-Simplify-cross-compi=
lati
> > > on.-Don-t-use-na.patch
> > > new file mode 100644
> > > index
> > >
> > 0000000000000000000000000000000000000000..a153624860873d0740bd71cc
> > > 1ae35744a530b44f
> > > --- /dev/null
> > > +++
> > >
> >
> b/meta/recipes-devtools/clang/clang/0003-compiler-rt-Simplify-cross-compi=
lati
> > > on.-Don-t-use-na.patch
> > > @@ -0,0 +1,44 @@
> > > +From c105a2efab08776d1f4df6b9b8d26d0f89d14b41 Mon Sep 17 00:00:00
> > > 2001
> > > +From: Khem Raj <raj.khem@gmail.com>
> > > +Date: Thu, 19 May 2016 23:11:45 -0700
> > > +Subject: [PATCH] compiler-rt: Simplify cross-compilation. Don't use
> > > + native-compiled llvm-config.
> > > +
> > > +    Note: AddLLVM.cmake does not expose the LLVM source directory.
> > > +    So if you want to run the test suite, you need to either:
> > > +
> > > +    1) set LLVM_MAIN_SRC_DIR explicitly (to find lit.py)
> > > +    2) change AddLLVM.cmake to point to an installed 'lit'.
> > > +    3) add_subdirectory(compiler-rt/test) from clang instead of
> compiler-rt.
> > > +
> > >
> > +
> https://us.codeaurora.org/patches/quic/llvm/50683/compiler-rt-cross-compi=
la
> > > tion.patch
> > > +
> > > +Upstream-Status: Pending
> > > +Signed-off-by: Greg Fitzgerald <gregf@codeaurora.org>
> > > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > +---
> > > + compiler-rt/CMakeLists.txt | 11 ++++++++++-
> > > + 1 file changed, 10 insertions(+), 1 deletion(-)
> > > +
> > > +diff --git a/compiler-rt/CMakeLists.txt b/compiler-rt/CMakeLists.txt
> > > +index 2c52788de56a..fe409704acc3 100644
> > > +--- a/compiler-rt/CMakeLists.txt
> > > ++++ b/compiler-rt/CMakeLists.txt
> > > +@@ -107,7 +107,16 @@ if (COMPILER_RT_STANDALONE_BUILD)
> > > +   set(CMAKE_CXX_EXTENSIONS NO)
> > > +
> > > +   if (NOT LLVM_RUNTIMES_BUILD)
> > > +-    load_llvm_config()
> > > ++    find_package(LLVM REQUIRED)
> > > ++    list(APPEND CMAKE_MODULE_PATH "${LLVM_CMAKE_DIR}")
> > > ++
> > > ++    # Variables that AddLLVM.cmake depends on (included by
> > > AddCompilerRT)
> > > ++    set(LLVM_TOOLS_BINARY_DIR "${LLVM_INSTALL_PREFIX}/bin")
> > > ++    set(LLVM_LIBRARY_DIR "${LLVM_INSTALL_PREFIX}/lib")
> > > ++
> > > ++    set(LLVM_LIBRARY_OUTPUT_INTDIR
> > > ++
> > > ${CMAKE_BINARY_DIR}/${CMAKE_CFG_INTDIR}/lib${LLVM_LIBDIR_SUFFIX})
> > > ++
> > > +   endif()
> > > +   if (TARGET intrinsics_gen)
> > > +     # Loading the llvm config causes this target to be imported so
> place it
> > > diff --git
> > >
> >
> a/meta/recipes-devtools/clang/clang/0004-llvm-TargetLibraryInfo-Undefine-=
libc
> > > -functions-if-th.patch
> > >
> >
> b/meta/recipes-devtools/clang/clang/0004-llvm-TargetLibraryInfo-Undefine-=
libc
> > > -functions-if-th.patch
> > > new file mode 100644
> > > index
> > >
> > 0000000000000000000000000000000000000000..c70f740222f4d3282c469139f
> > > 18f3cbfdab932b8
> > > --- /dev/null
> > > +++
> > >
> >
> b/meta/recipes-devtools/clang/clang/0004-llvm-TargetLibraryInfo-Undefine-=
libc
> > > -functions-if-th.patch
> > > @@ -0,0 +1,90 @@
> > > +From 388a70b4a8f828b7c58a0fb7bc3ee18001bc5f9b Mon Sep 17 00:00:00
> > > 2001
> > > +From: Khem Raj <raj.khem@gmail.com>
> > > +Date: Sat, 21 May 2016 00:33:20 +0000
> > > +Subject: [PATCH] llvm: TargetLibraryInfo: Undefine libc functions if
> they are
> > > + macros
> > > +
> > > +musl defines some functions as macros and not inline functions
> > > +if this is the case then make sure to undefine them
> > > +
> > > +Upstream-Status: Pending
> > > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > +---
> > > + .../llvm/Analysis/TargetLibraryInfo.def       | 22
> ++++++++++++++++++-
> > > + 1 file changed, 21 insertions(+), 1 deletion(-)
> > > +
> > > +diff --git a/llvm/include/llvm/Analysis/TargetLibraryInfo.def
> > > b/llvm/include/llvm/Analysis/TargetLibraryInfo.def
> > > +index db566b8ee610..578161f9c978 100644
> > > +--- a/llvm/include/llvm/Analysis/TargetLibraryInfo.def
> > > ++++ b/llvm/include/llvm/Analysis/TargetLibraryInfo.def
> > > +@@ -1467,6 +1467,9 @@ TLI_DEFINE_STRING_INTERNAL("fopen")
> > > + TLI_DEFINE_SIG_INTERNAL(Ptr, Ptr, Ptr)
> > > +
> > > + /// FILE *fopen64(const char *filename, const char *opentype)
> > > ++#ifdef fopen64
> > > ++#undef fopen64
> > > ++#endif
> > > + TLI_DEFINE_ENUM_INTERNAL(fopen64)
> > > + TLI_DEFINE_STRING_INTERNAL("fopen64")
> > > + TLI_DEFINE_SIG_INTERNAL(Ptr, Ptr, Ptr)
> > > +@@ -1545,7 +1548,9 @@ TLI_DEFINE_SIG_INTERNAL(Int, Ptr, Long, Int)
> > > + TLI_DEFINE_ENUM_INTERNAL(fseeko)
> > > + TLI_DEFINE_STRING_INTERNAL("fseeko")
> > > + TLI_DEFINE_SIG_INTERNAL(Int, Ptr, IntX, Int)
> > > +-
> > > ++#ifdef fseeko64
> > > ++#undef fseeko64
> > > ++#endif
> > > + /// int fseeko64(FILE *stream, off64_t offset, int whence)
> > > + TLI_DEFINE_ENUM_INTERNAL(fseeko64)
> > > + TLI_DEFINE_STRING_INTERNAL("fseeko64")
> > > +@@ -1562,6 +1567,9 @@ TLI_DEFINE_STRING_INTERNAL("fstat")
> > > + TLI_DEFINE_SIG_INTERNAL(Int, Int, Ptr)
> > > +
> > > + /// int fstat64(int filedes, struct stat64 *buf)
> > > ++#ifdef fstat64
> > > ++#undef fstat64
> > > ++#endif
> > > + TLI_DEFINE_ENUM_INTERNAL(fstat64)
> > > + TLI_DEFINE_STRING_INTERNAL("fstat64")
> > > + TLI_DEFINE_SIG_INTERNAL(Int, Int, Ptr)
> > > +@@ -1587,6 +1595,9 @@ TLI_DEFINE_STRING_INTERNAL("ftello")
> > > + TLI_DEFINE_SIG_INTERNAL(IntPlus, Ptr)
> > > +
> > > + /// off64_t ftello64(FILE *stream)
> > > ++#ifdef ftello64
> > > ++#undef ftello64
> > > ++#endif
> > > + TLI_DEFINE_ENUM_INTERNAL(ftello64)
> > > + TLI_DEFINE_STRING_INTERNAL("ftello64")
> > > + TLI_DEFINE_SIG_INTERNAL(Int64, Ptr)
> > > +@@ -1827,6 +1838,9 @@ TLI_DEFINE_STRING_INTERNAL("lstat")
> > > + TLI_DEFINE_SIG_INTERNAL(Int, Ptr, Ptr)
> > > +
> > > + /// int lstat64(const char *path, struct stat64 *buf);
> > > ++#ifdef lstat64
> > > ++#undef lstat64
> > > ++#endif
> > > + TLI_DEFINE_ENUM_INTERNAL(lstat64)
> > > + TLI_DEFINE_STRING_INTERNAL("lstat64")
> > > + TLI_DEFINE_SIG_INTERNAL(Int, Ptr, Ptr)
> > > +@@ -2334,6 +2348,9 @@ TLI_DEFINE_STRING_INTERNAL("stat")
> > > + TLI_DEFINE_SIG_INTERNAL(Int, Ptr, Ptr)
> > > +
> > > + /// int stat64(const char *path, struct stat64 *buf);
> > > ++#ifdef stat64
> > > ++#undef stat64
> > > ++#endif
> > > + TLI_DEFINE_ENUM_INTERNAL(stat64)
> > > + TLI_DEFINE_STRING_INTERNAL("stat64")
> > > + TLI_DEFINE_SIG_INTERNAL(Int, Ptr, Ptr)
> > > +@@ -2559,6 +2576,9 @@ TLI_DEFINE_STRING_INTERNAL("tmpfile")
> > > + TLI_DEFINE_SIG_INTERNAL(Ptr)
> > > +
> > > + /// FILE *tmpfile64(void)
> > > ++#ifdef tmpfile64
> > > ++#undef tmpfile64
> > > ++#endif
> > > + TLI_DEFINE_ENUM_INTERNAL(tmpfile64)
> > > + TLI_DEFINE_STRING_INTERNAL("tmpfile64")
> > > + TLI_DEFINE_SIG_INTERNAL(Ptr)
> > > diff --git
> > >
> >
> a/meta/recipes-devtools/clang/clang/0005-llvm-allow-env-override-of-exe-a=
nd-
> > > libdir-path.patch
> > >
> >
> b/meta/recipes-devtools/clang/clang/0005-llvm-allow-env-override-of-exe-a=
nd-
> > > libdir-path.patch
> > > new file mode 100644
> > > index
> > >
> > 0000000000000000000000000000000000000000..6d3f5293aab84056e9693b5d
> > > 2282166fd72b1ede
> > > --- /dev/null
> > > +++
> > >
> >
> b/meta/recipes-devtools/clang/clang/0005-llvm-allow-env-override-of-exe-a=
nd-
> > > libdir-path.patch

--0000000000009b4fce0635750db7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Yeah I think we will have to consider it=C2=A0</div><div>=
<br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, May 18, 2025 at 8:25=E2=80=AFPM Yiding Liu (Fujitsu=
) &lt;<a href=3D"mailto:liuyd.fnst@fujitsu.com">liuyd.fnst@fujitsu.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex=
;border-left-color:rgb(204,204,204)">Hi Khem Raj<br>
<br>
For your reference, paste the differences here.<br>
Looking forward to your reply.<br>
<br>
userland@pumpkin3:/mnt/test/build_auh$ diff tmp/work/core2-64-poky-linux/cl=
ang/20.1.4/image/usr/include/clang/Config/config.h tmp/work/core2-32-pokyml=
lib32-linux/lib32-clang/20.1.4/image/usr/include/clang/Config/config.h<br>
36c36<br>
&lt; #define CLANG_INSTALL_LIBDIR_BASENAME &quot;lib64&quot;<br>
---<br>
&gt; #define CLANG_INSTALL_LIBDIR_BASENAME &quot;lib&quot;<br>
userland@pumpkin3:/mnt/test/build_auh$ diff tmp/work/core2-64-poky-linux/cl=
ang/20.1.4/image/usr/include/clang/Config/config.h tmp/work/core2-32-pokyml=
lib32-linux/lib32-clang/20.1.4/image/usr/include/ll<br>
lld/=C2=A0 =C2=A0 lldb/=C2=A0 =C2=A0llvm/=C2=A0 =C2=A0llvm-c/<br>
userland@pumpkin3:/mnt/test/build_auh$ diff tmp/work/core2-64-poky-linux/cl=
ang/20.1.4/image/usr/include/clang/Config/config.h tmp/work/core2-32-pokyml=
lib32-linux/lib32-clang/20.1.4/image/usr/include/ll<br>
lld/=C2=A0 =C2=A0 lldb/=C2=A0 =C2=A0llvm/=C2=A0 =C2=A0llvm-c/<br>
userland@pumpkin3:/mnt/test/build_auh$ diff tmp/work/core2-64-poky-linux/cl=
ang/20.1.4/image/usr/include/llvm/Config/llvm-config.h tmp/work/core2-32-po=
kymllib32-linux/lib32-clang/20.1.4/image/usr/include/llvm/Config/llvm-confi=
g.h<br>
22c22<br>
&lt; #define LLVM_DEFAULT_TARGET_TRIPLE &quot;x86_64-poky-linux&quot;<br>
---<br>
&gt; #define LLVM_DEFAULT_TARGET_TRIPLE &quot;i686-pokymllib32-linux&quot;<=
br>
31c31<br>
&lt; #define LLVM_HOST_TRIPLE &quot;x86_64-poky-linux&quot;<br>
---<br>
&gt; #define LLVM_HOST_TRIPLE &quot;i686-pokymllib32-linux&quot;<br>
<br>
Thanks<br>
<br>
Liu Yiding<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; &lt;<a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a>&gt; On Behalf Of Y=
iding Liu (Fujitsu)<br>
&gt; via <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" targe=
t=3D"_blank">lists.openembedded.org</a><br>
&gt; Sent: 2025=E5=B9=B45=E6=9C=8815=E6=97=A5 8:59<br>
&gt; To: <a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@g=
mail.com</a>; <a href=3D"mailto:openembedded-core@lists.openembedded.org" t=
arget=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Cc: Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry.baryshkov@oss.qualco=
mm.com" target=3D"_blank">dmitry.baryshkov@oss.qualcomm.com</a>&gt;<br>
&gt; Subject: Re: [OE-core] [PATCH v7 1/8] clang: Merge llvm/clang family r=
ecipes<br>
&gt; from meta-clang<br>
&gt; <br>
&gt; Hello Khem Raj<br>
&gt; <br>
&gt; Thank you for this series of patch set modifications.<br>
&gt; But we still can reproduce this issue with latest master:<br>
&gt; <br>
&gt; Error: Transaction test error:<br>
&gt;=C2=A0 =C2=A0file /usr/include/clang/Config/config.h conflicts between =
attempted installs of<br>
&gt; lib32-clang-dev-20.1.4-r0.core2_32 and clang-dev-20.1.4-r0.core2_64<br=
>
&gt;=C2=A0 =C2=A0file /usr/include/llvm/Config/llvm-config.h conflicts betw=
een attempted<br>
&gt; installs of lib32-clang-dev-20.1.4-r0.core2_32 and clang-dev-20.1.4-r0=
.core2_64<br>
&gt; <br>
&gt; <br>
&gt; reproduce steps:<br>
&gt; 1. Add in local.conf the following lines:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0MACHINE ?=3D &quot;qemux86-64&quot;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0require conf/multilib.conf<br>
&gt; <br>
&gt;=C2=A0 =C2=A0MULTILIBS ?=3D &quot;multilib:lib32&quot;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0DEFAULTTUNE:virtclass-multilib-lib32 ?=3D &quot;core2-32&q=
uot;<br>
&gt; <br>
&gt; 2. add lib32-llvm-dev llvm-dev to <a href=3D"http://core-image-minimal=
.bb" rel=3D"noreferrer" target=3D"_blank">core-image-minimal.bb</a><br>
&gt; <br>
&gt;=C2=A0 =C2=A0IMAGE_INSTALL =3D &quot;packagegroup-core-boot ${CORE_IMAG=
E_EXTRA_INSTALL}<br>
&gt; lib32-clang-dev clang-dev&quot;<br>
&gt; <br>
&gt; 3. $ bitbake core-image-minimal<br>
&gt; <br>
&gt; Seems multilib_header patch (oe_multilib_header llvm/Config/llvm-confi=
g.h) is<br>
&gt; still needed.<br>
&gt; <br>
&gt; <br>
&gt; Liu Yiding<br>
&gt; <br>
&gt; &gt; -----Original Message-----<br>
&gt; &gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org"=
 target=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; &gt; &lt;<a href=3D"mailto:openembedded-core@lists.openembedded.org" t=
arget=3D"_blank">openembedded-core@lists.openembedded.org</a>&gt; On Behalf=
 Of Khem Raj via<br>
&gt; &gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" targ=
et=3D"_blank">lists.openembedded.org</a><br>
&gt; &gt; Sent: 2025=E5=B9=B45=E6=9C=885=E6=97=A5 12:15<br>
&gt; &gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" t=
arget=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; &gt; Cc: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"=
_blank">raj.khem@gmail.com</a>&gt;; Dmitry Baryshkov<br>
&gt; &gt; &lt;<a href=3D"mailto:dmitry.baryshkov@oss.qualcomm.com" target=
=3D"_blank">dmitry.baryshkov@oss.qualcomm.com</a>&gt;<br>
&gt; &gt; Subject: [OE-core] [PATCH v7 1/8] clang: Merge llvm/clang family =
recipes from<br>
&gt; &gt; meta-clang<br>
&gt; &gt;<br>
&gt; &gt; This can ensure that meta-clang does not carry them and can rely =
on core layer<br>
&gt; &gt; while mesa can use them too.<br>
&gt; &gt;<br>
&gt; &gt; Omit time stamps in openmp from generated files to improve<br>
&gt; &gt; reproducibility<br>
&gt; &gt;<br>
&gt; &gt; fix the issue that:<br>
&gt; &gt; | file /usr/include/llvm/Config/llvm-config.h conflicts between a=
ttempted<br>
&gt; installs<br>
&gt; &gt; of lib32-llvm-dev-20.1.2-r0.core2_32 and llvm-dev-20.1.2-r0.core2=
_64<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry.bary=
shkov@oss.qualcomm.com" target=3D"_blank">dmitry.baryshkov@oss.qualcomm.com=
</a>&gt;<br>
&gt; &gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 .../clang/<a href=3D"http://clang-cross-canadian_git.bb" re=
l=3D"noreferrer" target=3D"_blank">clang-cross-canadian_git.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 36 ++<br>
&gt; &gt;=C2=A0 meta/recipes-devtools/clang/<a href=3D"http://clang-cross_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">clang-cross_git.bb</a>=C2=A0 =
=C2=A0 =C2=A0|=C2=A0 39 ++<br>
&gt; &gt;=C2=A0 meta/recipes-devtools/clang/<a href=3D"http://clang-crosssd=
k_git.bb" rel=3D"noreferrer" target=3D"_blank">clang-crosssdk_git.bb</a>=C2=
=A0 |=C2=A0 33 ++<br>
&gt; &gt;=C2=A0 ...ind-libunwind-headers-when-LIBCXXABI_LIBU.patch |=C2=A0 =
60 +++<br>
&gt; &gt;=C2=A0 ...er-rt-support-a-new-embedded-linux-target.patch | 309 ++=
+++++++++++<br>
&gt; &gt;=C2=A0 ...-Simplify-cross-compilation.-Don-t-use-na.patch |=C2=A0 =
44 ++<br>
&gt; &gt;=C2=A0 ...LibraryInfo-Undefine-libc-functions-if-th.patch |=C2=A0 =
90 ++++<br>
&gt; &gt;=C2=A0 ...allow-env-override-of-exe-and-libdir-path.patch |=C2=A0 =
71 +++<br>
&gt; &gt;=C2=A0 ...-clang-driver-Check-sysroot-for-ldso-path.patch |=C2=A0 =
78 ++++<br>
&gt; &gt;=C2=A0 ...iver-tools.cpp-Add-lssp_nonshared-on-musl.patch |=C2=A0 =
32 ++<br>
&gt; &gt;=C2=A0 .../0008-clang-Prepend-trailing-to-sysroot.patch=C2=A0 =C2=
=A0|=C2=A0 39 ++<br>
&gt; &gt;=C2=A0 ...inside-the-target-sysroot-for-compiler-ru.patch |=C2=A0 =
41 ++<br>
&gt; &gt;=C2=A0 ...ang-Define-releative-gcc-installation-dir.patch | 123 ++=
++++<br>
&gt; &gt;=C2=A0 ...pthread-and-ldl-along-with-lunwind-for-st.patch |=C2=A0 =
35 ++<br>
&gt; &gt;=C2=A0 ..._EXECUTABLE-when-cross-compiling-for-nati.patch |=C2=A0 =
24 +<br>
&gt; &gt;=C2=A0 .../0013-Check-for-atomic-double-intrinsics.patch=C2=A0 |=
=C2=A0 34 ++<br>
&gt; &gt;=C2=A0 ...configure-for-packages-using-find_package.patch |=C2=A0 =
=C2=A02 +-<br>
&gt; &gt;=C2=A0 ...esource-dir-location-for-cross-toolchains.patch |=C2=A0 =
50 +++<br>
&gt; &gt;=C2=A0 ...r-Add-dyld-prefix-when-checking-sysroot-f.patch |=C2=A0 =
79 ++++<br>
&gt; &gt;=C2=A0 .../0017-clang-Use-python3-in-python-scripts.patch |=C2=A0 =
35 ++<br>
&gt; &gt;=C2=A0 ...Insert-anchor-for-adding-OE-distro-vendor.patch | 167 ++=
+++++<br>
&gt; &gt;=C2=A0 ...-Do-not-use-backtrace-APIs-on-non-glibc-l.patch |=C2=A0 =
68 +++<br>
&gt; &gt;=C2=A0 ...86-triple-for-non-debian-multiarch-linux-.patch |=C2=A0 =
28 ++<br>
&gt; &gt;=C2=A0 ...0021-libunwind-Added-unw_backtrace-method.patch |=C2=A0 =
56 +++<br>
&gt; &gt;=C2=A0 .../0022-lldb-Link-with-libatomic-on-x86.patch=C2=A0 =C2=A0=
 =C2=A0|=C2=A0 33 ++<br>
&gt; &gt;=C2=A0 ...023-compiler-rt-Enable-__int128-for-ppc32.patch |=C2=A0 =
73 +++<br>
&gt; &gt;=C2=A0 ...-Do-not-use-cmake-infra-to-detect-libzstd.patch |=C2=A0 =
62 +++<br>
&gt; &gt;=C2=A0 ...ler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch |=C2=A0 =
46 ++<br>
&gt; &gt;=C2=A0 ...-Undef-_TIME_BITS-along-with-_FILE_OFFSET.patch |=C2=A0 =
43 ++<br>
&gt; &gt;=C2=A0 ...s-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch |=C2=A0 =
81 ++++<br>
&gt; &gt;=C2=A0 ...vm-Add-OE-specific-ABI-triple-for-N32-ABI.patch |=C2=A0 =
78 ++++<br>
&gt; &gt;=C2=A0 ...d-libunwind.pc.in-and-llvm-config-scripts.patch |=C2=A0 =
90 ++++<br>
&gt; &gt;=C2=A0 ...py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch |=C2=A0 =
92 ++++<br>
&gt; &gt;=C2=A0 ...r-rt-Do-not-pass-target-to-clang-compiler.patch |=C2=A0 =
29 ++<br>
&gt; &gt;=C2=A0 .../clang/clang/0032-Fix-build-on-ppc64-musl.patch |=C2=A0 =
97 ++++<br>
&gt; &gt;=C2=A0 ...d-a-build-option-to-disable-building-dexp.patch |=C2=A0 =
85 ++++<br>
&gt; &gt;=C2=A0 ...itter-sort-ClassInfo-lists-by-name-as-we.patch} |=C2=A0 =
=C2=A04 +-<br>
&gt; &gt;=C2=A0 ...-remove-LLVM_LDFLAGS-from-ldflags-output.patch} |=C2=A0 =
12 +-<br>
&gt; &gt;=C2=A0 ...ot-emit-date-and-time-into-generate-files.patch |=C2=A0 =
37 ++<br>
&gt; &gt;=C2=A0 .../clang}/spirv-internal-build.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A00<br>
&gt; &gt;=C2=A0 .../clang}/spirv-shared-library.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A00<br>
&gt; &gt;=C2=A0 meta/recipes-devtools/clang/<a href=3D"http://clang_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">clang_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 492<br>
&gt; &gt; +++++++++++++++++++++<br>
&gt; &gt;=C2=A0 meta/recipes-devtools/clang/common-clang.inc=C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 24 +<br>
&gt; &gt;=C2=A0 meta/recipes-devtools/clang/common-source.inc=C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 17 +<br>
&gt; &gt;=C2=A0 meta/recipes-devtools/clang/common.inc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 83 ++++<br>
&gt; &gt;=C2=A0 .../clang/<a href=3D"http://compiler-rt-sanitizers_git.bb" =
rel=3D"noreferrer" target=3D"_blank">compiler-rt-sanitizers_git.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 131 ++++++<br>
&gt; &gt;=C2=A0 meta/recipes-devtools/clang/<a href=3D"http://compiler-rt_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">compiler-rt_git.bb</a>=C2=A0 =
=C2=A0 =C2=A0| 121 +++++<br>
&gt; &gt;=C2=A0 meta/recipes-devtools/clang/<a href=3D"http://libcxx_git.bb=
" rel=3D"noreferrer" target=3D"_blank">libcxx_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 115 +++++<br>
&gt; &gt;=C2=A0 meta/recipes-devtools/clang/<a href=3D"http://llvm-project-=
source.bb" rel=3D"noreferrer" target=3D"_blank">llvm-project-source.bb</a> =
|=C2=A0 12 +<br>
&gt; &gt;=C2=A0 .../recipes-devtools/clang/llvm-project-source.inc |=C2=A0 =
99 +++++<br>
&gt; &gt;=C2=A0 .../recipes-devtools/clang/<a href=3D"http://nativesdk-clan=
g-glue.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-clang-glue.bb</a>=
 |=C2=A0 36 ++<br>
&gt; &gt;=C2=A0 meta/recipes-devtools/clang/<a href=3D"http://openmp_git.bb=
" rel=3D"noreferrer" target=3D"_blank">openmp_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 65 +++<br>
&gt; &gt;=C2=A0 .../0007-llvm-allow-env-override-of-exe-path.patch |=C2=A0 =
36 --<br>
&gt; &gt;=C2=A0 meta/recipes-devtools/llvm/llvm/llvm-config=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 54 ---<br>
&gt; &gt;=C2=A0 meta/recipes-devtools/llvm/<a href=3D"http://llvm_20.1.2.bb=
" rel=3D"noreferrer" target=3D"_blank">llvm_20.1.2.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 233 ----------<br>
&gt; &gt;=C2=A0 55 files changed, 3620 insertions(+), 333 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-devtools/clang/<a href=3D"http://clang-=
cross-canadian_git.bb" rel=3D"noreferrer" target=3D"_blank">clang-cross-can=
adian_git.bb</a><br>
&gt; &gt; b/meta/recipes-devtools/clang/<a href=3D"http://clang-cross-canad=
ian_git.bb" rel=3D"noreferrer" target=3D"_blank">clang-cross-canadian_git.b=
b</a><br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index<br>
&gt; &gt;<br>
&gt; 0000000000000000000000000000000000000000..456c0d61bc560ee131e06fd3<br>
&gt; &gt; 7eb434ab366b1861<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta/recipes-devtools/clang/<a href=3D"http://clang-cross-c=
anadian_git.bb" rel=3D"noreferrer" target=3D"_blank">clang-cross-canadian_g=
it.bb</a><br>
&gt; &gt; @@ -0,0 +1,36 @@<br>
&gt; &gt; +# Copyright (C) 2014 Khem Raj &lt;<a href=3D"mailto:raj.khem@gma=
il.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt; +# Released under the MIT license (see COPYING.MIT for the terms)=
<br>
&gt; &gt; +<br>
&gt; &gt; +SUMMARY =3D &quot;Clang/LLVM based C/C++ compiler (cross-canadia=
n for<br>
&gt; &gt; ${TARGET_ARCH} target)&quot;<br>
&gt; &gt; +HOMEPAGE =3D &quot;<a href=3D"http://clang.llvm.org/" rel=3D"nor=
eferrer" target=3D"_blank">http://clang.llvm.org/</a>&quot;<br>
&gt; &gt; +LIC_FILES_CHKSUM =3D<br>
&gt; &gt;<br>
&gt; &quot;file://${COMMON_LICENSE_DIR}/Apache-2.0-with-LLVM-exception;md5=
=3D0bcd<br>
&gt; &gt; 48c3bdfef0c9d9fd17726e4b7dab&quot;<br>
&gt; &gt; +SECTION =3D &quot;devel&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +PN =3D &quot;clang-cross-canadian-${TRANSLATED_TARGET_ARCH}&quot=
;<br>
&gt; &gt; +<br>
&gt; &gt; +require common-clang.inc<br>
&gt; &gt; +require common-source.inc<br>
&gt; &gt; +inherit cross-canadian<br>
&gt; &gt; +<br>
&gt; &gt; +DEPENDS +=3D &quot;nativesdk-clang<br>
&gt; &gt; binutils-cross-canadian-${TRANSLATED_TARGET_ARCH}<br>
&gt; &gt; virtual/nativesdk-cross-binutils virtual/nativesdk-libc&quot;<br>
&gt; &gt; +# We have to point gcc at a sysroot but we don&#39;t need to reb=
uild if this<br>
&gt; changes<br>
&gt; &gt; +# e.g. we switch between different machines with different tunes=
.<br>
&gt; &gt; +EXTRA_OECONF_PATHS[vardepsexclude] =3D &quot;TUNE_PKGARCH&quot;<=
br>
&gt; &gt; +TARGET_ARCH[vardepsexclude] =3D &quot;TUNE_ARCH&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +do_install() {<br>
&gt; &gt; +=C2=A0 =C2=A0install -d ${D}${bindir}<br>
&gt; &gt; +=C2=A0 =C2=A0for tool in clang clang++ clang-tidy lld ld.lld llv=
m-profdata \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0llvm-nm llvm-ar llvm-as=
 llvm-ranlib llvm-strip llvm-objcopy<br>
&gt; &gt; llvm-objdump llvm-readelf \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0llvm-addr2line llvm-dwp=
 llvm-size llvm-strings llvm-cov<br>
&gt; &gt; +=C2=A0 =C2=A0do<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ../$tool ${D}${b=
indir}/${TARGET_PREFIX}$tool<br>
&gt; &gt; +=C2=A0 =C2=A0done<br>
&gt; &gt; +}<br>
&gt; &gt; +SSTATE_SCAN_FILES +=3D &quot;*-clang *-clang++ *-llvm-profdata *=
-llvm-ar \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 *-llvm-ranlib *-llvm-nm *-lld *-ld.lld *-llvm-as<br>
&gt; &gt; *-llvm-strip \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 *-llvm-objcopy *-llvm-objdump *-llvm-readelf<br>
&gt; &gt; *-llvm-addr2line \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 *-llvm-dwp *-llvm-size *-llvm-strings *-llvm-cov&quot;<br>
&gt; &gt; +do_install:append() {<br>
&gt; &gt; +=C2=A0 =C2=A0cross_canadian_bindirlinks<br>
&gt; &gt; +}<br>
&gt; &gt; diff --git a/meta/recipes-devtools/clang/<a href=3D"http://clang-=
cross_git.bb" rel=3D"noreferrer" target=3D"_blank">clang-cross_git.bb</a><b=
r>
&gt; &gt; b/meta/recipes-devtools/clang/<a href=3D"http://clang-cross_git.b=
b" rel=3D"noreferrer" target=3D"_blank">clang-cross_git.bb</a><br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index<br>
&gt; &gt;<br>
&gt; 0000000000000000000000000000000000000000..9b9b120a3d793f6dd989b566<br>
&gt; &gt; b3736934f1c0ff8d<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta/recipes-devtools/clang/<a href=3D"http://clang-cross_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">clang-cross_git.bb</a><br>
&gt; &gt; @@ -0,0 +1,39 @@<br>
&gt; &gt; +# Copyright (C) 2014 Khem Raj &lt;<a href=3D"mailto:raj.khem@gma=
il.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt; +# Released under the MIT license (see COPYING.MIT for the terms)=
<br>
&gt; &gt; +<br>
&gt; &gt; +SUMMARY =3D &quot;Cross compiler wrappers for LLVM based C/C++ c=
ompiler&quot;<br>
&gt; &gt; +HOMEPAGE =3D &quot;<a href=3D"http://clang.llvm.org/" rel=3D"nor=
eferrer" target=3D"_blank">http://clang.llvm.org/</a>&quot;<br>
&gt; &gt; +LIC_FILES_CHKSUM =3D<br>
&gt; &gt;<br>
&gt; &quot;file://${COMMON_LICENSE_DIR}/Apache-2.0-with-LLVM-exception;md5=
=3D0bcd<br>
&gt; &gt; 48c3bdfef0c9d9fd17726e4b7dab&quot;<br>
&gt; &gt; +SECTION =3D &quot;devel&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +PN =3D &quot;clang-cross-${TARGET_ARCH}&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +require common-clang.inc<br>
&gt; &gt; +require common-source.inc<br>
&gt; &gt; +inherit cross<br>
&gt; &gt; +DEPENDS +=3D &quot;clang-native virtual/cross-binutils&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +#INHIBIT_PACKAGE_STRIP =3D &quot;1&quot;<br>
&gt; &gt; +INHIBIT_SYSROOT_STRIP =3D &quot;1&quot;<br>
&gt; &gt; +do_install() {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${bindir}<br>
&gt; &gt; +=C2=A0 =C2=A0for tool in clang-tidy lld ld.lld llvm-profdata \<b=
r>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 llvm-nm llvm-ar llvm-a=
s llvm-ranlib llvm-strip llvm-objcopy<br>
&gt; &gt; llvm-objdump llvm-readelf \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 llvm-addr2line llvm-dw=
p llvm-size llvm-strings llvm-cov<br>
&gt; &gt; +=C2=A0 =C2=A0do<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ../$tool ${D}${b=
indir}/${TARGET_PREFIX}$tool<br>
&gt; &gt; +=C2=A0 =C2=A0done<br>
&gt; &gt; +=C2=A0 =C2=A0install -m 0755 ${STAGING_BINDIR_NATIVE}/clang<br>
&gt; &gt; ${D}${bindir}/${TARGET_PREFIX}clang<br>
&gt; &gt; +=C2=A0 =C2=A0install -m 0755 ${STAGING_BINDIR_NATIVE}/clang<br>
&gt; &gt; ${D}${bindir}/${TARGET_PREFIX}clang++<br>
&gt; &gt; +}<br>
&gt; &gt; +SSTATE_SCAN_FILES +=3D &quot;*-clang *-clang++ *-llvm-profdata *=
-lld *-ld.lld \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 *-llvm-nm *-llvm-ar *-llvm-as *-llvm-ranlib<br>
&gt; &gt; *-llvm-strip \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 *-llvm-objcopy *-llvm-objdump *-llvm-readelf<br>
&gt; &gt; *-llvm-addr2line \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 *-llvm-dwp *-llvm-size *-llvm-strings *-llvm-cov&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +SYSROOT_PREPROCESS_FUNCS +=3D &quot;clangcross_sysroot_preproces=
s&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +clangcross_sysroot_preprocess () {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sysroot_stage_dir ${D}${bindir} ${SY=
SROOT_DESTDIR}${bindir}<br>
&gt; &gt; +}<br>
&gt; &gt; +PACKAGES =3D &quot;&quot;<br>
&gt; &gt; diff --git a/meta/recipes-devtools/clang/<a href=3D"http://clang-=
crosssdk_git.bb" rel=3D"noreferrer" target=3D"_blank">clang-crosssdk_git.bb=
</a><br>
&gt; &gt; b/meta/recipes-devtools/clang/<a href=3D"http://clang-crosssdk_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">clang-crosssdk_git.bb</a><br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index<br>
&gt; &gt;<br>
&gt; 0000000000000000000000000000000000000000..47ac96f4f93688b216adc95f4<br=
>
&gt; &gt; 473b8c2dc3ec98b<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta/recipes-devtools/clang/<a href=3D"http://clang-crosssd=
k_git.bb" rel=3D"noreferrer" target=3D"_blank">clang-crosssdk_git.bb</a><br=
>
&gt; &gt; @@ -0,0 +1,33 @@<br>
&gt; &gt; +# Copyright (C) 2014 Khem Raj &lt;<a href=3D"mailto:raj.khem@gma=
il.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt; +# Released under the MIT license (see COPYING.MIT for the terms)=
<br>
&gt; &gt; +<br>
&gt; &gt; +SUMMARY =3D &quot;SDK Cross compiler wrappers for LLVM based C/C=
++ compiler&quot;<br>
&gt; &gt; +HOMEPAGE =3D &quot;<a href=3D"http://clang.llvm.org/" rel=3D"nor=
eferrer" target=3D"_blank">http://clang.llvm.org/</a>&quot;<br>
&gt; &gt; +LIC_FILES_CHKSUM =3D<br>
&gt; &gt;<br>
&gt; &quot;file://${COMMON_LICENSE_DIR}/Apache-2.0-with-LLVM-exception;md5=
=3D0bcd<br>
&gt; &gt; 48c3bdfef0c9d9fd17726e4b7dab&quot;<br>
&gt; &gt; +SECTION =3D &quot;devel&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +PN =3D &quot;clang-crosssdk-${SDK_SYS}&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +require common-clang.inc<br>
&gt; &gt; +require common-source.inc<br>
&gt; &gt; +inherit crosssdk<br>
&gt; &gt; +DEPENDS +=3D &quot;clang-native nativesdk-clang-glue<br>
&gt; virtual/nativesdk-cross-binutils<br>
&gt; &gt; virtual/nativesdk-libc&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +do_install() {<br>
&gt; &gt; +=C2=A0 =C2=A0 install -d ${D}${bindir}<br>
&gt; &gt; +=C2=A0 =C2=A0for tool in clang clang++ clang-tidy lld ld.lld llv=
m-profdata \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0llvm-nm llvm-ar llvm-as=
 llvm-ranlib llvm-strip llvm-objcopy<br>
&gt; &gt; llvm-objdump llvm-readelf \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0llvm-addr2line llvm-dwp=
 llvm-size llvm-strings llvm-cov<br>
&gt; &gt; +=C2=A0 =C2=A0do<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ../$tool ${D}${b=
indir}/${TARGET_PREFIX}$tool<br>
&gt; &gt; +=C2=A0 =C2=A0done<br>
&gt; &gt; +}<br>
&gt; &gt; +SSTATE_SCAN_FILES +=3D &quot;*-clang *-clang++ *-llvm-profdata *=
-lld *-ld.lld \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 *-llvm-nm *-llvm-ar *-llvm-as *-llvm-ranlib<br>
&gt; &gt; *-llvm-strip \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 *-llvm-objcopy *-llvm-objdump *-llvm-readelf<br>
&gt; &gt; *-llvm-addr2line \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 *-llvm-dwp *-llvm-size *-llvm-strings *-llvm-cov&quot;<br>
&gt; &gt; +sysroot_stage_all () {<br>
&gt; &gt; +=C2=A0 =C2=A0sysroot_stage_dir ${D}${bindir} ${SYSROOT_DESTDIR}$=
{bindir}<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +PACKAGES =3D &quot;&quot;<br>
&gt; &gt; diff --git<br>
&gt; &gt;<br>
&gt; a/meta/recipes-devtools/clang/clang/0001-libcxxabi-Find-libunwind-head=
ers-w<br>
&gt; &gt; hen-LIBCXXABI_LIBU.patch<br>
&gt; &gt;<br>
&gt; b/meta/recipes-devtools/clang/clang/0001-libcxxabi-Find-libunwind-head=
ers-w<br>
&gt; &gt; hen-LIBCXXABI_LIBU.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index<br>
&gt; &gt;<br>
&gt; 0000000000000000000000000000000000000000..21b033b498e5d66322493b8<br>
&gt; &gt; 4da6814d5712c0a8a<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++<br>
&gt; &gt;<br>
&gt; b/meta/recipes-devtools/clang/clang/0001-libcxxabi-Find-libunwind-head=
ers-w<br>
&gt; &gt; hen-LIBCXXABI_LIBU.patch<br>
&gt; &gt; @@ -0,0 +1,60 @@<br>
&gt; &gt; +From ec9babfa91931042e7aa771915e2f1d4dc8d15e0 Mon Sep 17 00:00:0=
0<br>
&gt; &gt; 2001<br>
&gt; &gt; +From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt; +Date: Sun, 27 Aug 2017 10:37:49 -0700<br>
&gt; &gt; +Subject: [PATCH] libcxxabi: Find libunwind headers when<br>
&gt; &gt; + LIBCXXABI_LIBUNWIND_INCLUDES is set<br>
&gt; &gt; +<br>
&gt; &gt; +Currently, when LIBCXXABI_LIBUNWIND_INCLUDES is set via CMake<br=
>
&gt; &gt; arguments<br>
&gt; &gt; +then it ends up not searching the specified dir and unwind.h is =
not found<br>
&gt; &gt; +especially for ARM targets<br>
&gt; &gt; +<br>
&gt; &gt; +This patch makes the searching synthesized directories and then =
set<br>
&gt; &gt; +LIBCXXABI_LIBUNWIND_INCLUDES if its there in environment<br>
&gt; &gt; +<br>
&gt; &gt; +Upstream-Status: Pending<br>
&gt; &gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com=
" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt; +---<br>
&gt; &gt; + libcxxabi/CMakeLists.txt | 15 ++++++++++-----<br>
&gt; &gt; + 1 file changed, 10 insertions(+), 5 deletions(-)<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/libcxxabi/CMakeLists.txt b/libcxxabi/CMakeLists.txt=
<br>
&gt; &gt; +index 6dcfc51e5532..32478a62a058 100644<br>
&gt; &gt; +--- a/libcxxabi/CMakeLists.txt<br>
&gt; &gt; ++++ b/libcxxabi/CMakeLists.txt<br>
&gt; &gt; +@@ -465,7 +465,7 @@ set(LIBCXXABI_LIBUNWIND_PATH<br>
&gt; &gt; &quot;${LIBCXXABI_LIBUNWIND_PATH}&quot; CACHE PATH<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0&quot;Specify path to libunwind source.&quot=
; FORCE)<br>
&gt; &gt; +<br>
&gt; &gt; + if (LIBCXXABI_USE_LLVM_UNWINDER OR LLVM_NATIVE_ARCH MATCHES<br>
&gt; &gt; ARM)<br>
&gt; &gt; +-=C2=A0 find_path(LIBCXXABI_LIBUNWIND_INCLUDES_INTERNAL libunwin=
d.h<br>
&gt; &gt; ++=C2=A0 find_path(LIBCXXABI_LIBUNWIND_INCLUDES libunwind.h<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0PATHS ${LIBCXXABI_LIBUNWIND_INCLUDES}<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${LIBCXXABI_LIBUNWIND_P=
ATH}/include<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${CMAKE_BINARY_DIR}/${L=
IBCXXABI_LIBUNWIND_INCLUDES}<br>
&gt; &gt; +@@ -476,18 +476,23 @@ if (LIBCXXABI_USE_LLVM_UNWINDER OR<br>
&gt; &gt; LLVM_NATIVE_ARCH MATCHES ARM)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0NO_CMAKE_FIND_ROOT_PATH<br>
&gt; &gt; +=C2=A0 =C2=A0)<br>
&gt; &gt; +<br>
&gt; &gt; +-=C2=A0 if (LIBCXXABI_LIBUNWIND_INCLUDES_INTERNAL STREQUAL<br>
&gt; &gt; &quot;LIBCXXABI_LIBUNWIND_INCLUDES_INTERNAL-NOTFOUND&quot;)<br>
&gt; &gt; +-=C2=A0 =C2=A0 set(LIBCXXABI_LIBUNWIND_INCLUDES_INTERNAL &quot;&=
quot;)<br>
&gt; &gt; ++=C2=A0 if (LIBCXXABI_LIBUNWIND_INCLUDES STREQUAL<br>
&gt; &gt; &quot;LIBCXXABI_LIBUNWIND_INCLUDES-NOTFOUND&quot;)<br>
&gt; &gt; ++=C2=A0 =C2=A0 set(LIBCXXABI_LIBUNWIND_INCLUDES &quot;&quot;)<br=
>
&gt; &gt; +=C2=A0 =C2=A0endif()<br>
&gt; &gt; + endif()<br>
&gt; &gt; +<br>
&gt; &gt; +-if (NOT &quot;${LIBCXXABI_LIBUNWIND_INCLUDES_INTERNAL}&quot; ST=
REQUAL &quot;&quot;)<br>
&gt; &gt; +-=C2=A0 include_directories(&quot;${LIBCXXABI_LIBUNWIND_INCLUDES=
_INTERNAL}&quot;)<br>
&gt; &gt; ++if (NOT &quot;${LIBCXXABI_LIBUNWIND_INCLUDES}&quot; STREQUAL &q=
uot;&quot;)<br>
&gt; &gt; ++=C2=A0 include_directories(&quot;${LIBCXXABI_LIBUNWIND_INCLUDES=
}&quot;)<br>
&gt; &gt; + endif()<br>
&gt; &gt; +<br>
&gt; &gt; + add_custom_target(cxxabi-test-depends<br>
&gt; &gt; +=C2=A0 =C2=A0COMMENT &quot;Build dependencies required to run th=
e libc++abi test suite.&quot;)<br>
&gt; &gt; +<br>
&gt; &gt; ++set(LIBCXXABI_LIBUNWIND_INCLUDES<br>
&gt; &gt; &quot;${LIBCXXABI_LIBUNWIND_INCLUDES}&quot; CACHE PATH<br>
&gt; &gt; ++=C2=A0 =C2=A0 &quot;Specify path to libunwind includes.&quot; F=
ORCE)<br>
&gt; &gt; ++set(LIBCXXABI_LIBUNWIND_PATH &quot;${LIBCXXABI_LIBUNWIND_PATH}&=
quot;<br>
&gt; CACHE<br>
&gt; &gt; PATH<br>
&gt; &gt; ++=C2=A0 =C2=A0 &quot;Specify path to libunwind source.&quot; FOR=
CE)<br>
&gt; &gt; ++<br>
&gt; &gt; + # Add source code. This also contains all of the logic for deci=
ding linker flags<br>
&gt; &gt; + # soname, etc...<br>
&gt; &gt; + add_subdirectory(include)<br>
&gt; &gt; diff --git<br>
&gt; &gt;<br>
&gt; a/meta/recipes-devtools/clang/clang/0002-compiler-rt-support-a-new-emb=
edd<br>
&gt; &gt; ed-linux-target.patch<br>
&gt; &gt;<br>
&gt; b/meta/recipes-devtools/clang/clang/0002-compiler-rt-support-a-new-emb=
edd<br>
&gt; &gt; ed-linux-target.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index<br>
&gt; &gt;<br>
&gt; 0000000000000000000000000000000000000000..88cef402daad0b0470f8057e<br>
&gt; &gt; 55b2a71558c428d2<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++<br>
&gt; &gt;<br>
&gt; b/meta/recipes-devtools/clang/clang/0002-compiler-rt-support-a-new-emb=
edd<br>
&gt; &gt; ed-linux-target.patch<br>
&gt; &gt; @@ -0,0 +1,309 @@<br>
&gt; &gt; +From 8cdfcfb9102c4008758bb844856e553d4fe4ae79 Mon Sep 17 00:00:0=
0<br>
&gt; &gt; 2001<br>
&gt; &gt; +From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt; +Date: Sun, 19 Apr 2015 15:16:23 -0700<br>
&gt; &gt; +Subject: [PATCH] compiler-rt: support a new embedded linux targe=
t<br>
&gt; &gt; +<br>
&gt; &gt; +Upstream-Status: Pending<br>
&gt; &gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com=
" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt; +---<br>
&gt; &gt; + .../make/platform/<a href=3D"http://clang_linux_embedded.mk" re=
l=3D"noreferrer" target=3D"_blank">clang_linux_embedded.mk</a>=C2=A0 =C2=A0=
 =C2=A0| 286<br>
&gt; &gt; ++++++++++++++++++<br>
&gt; &gt; + .../clang_linux_embedded_test_input.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A00<br>
&gt; &gt; + 2 files changed, 286 insertions(+)<br>
&gt; &gt; + create mode 100644 compiler-rt/make/platform/<a href=3D"http://=
clang_linux_embedded.mk" rel=3D"noreferrer" target=3D"_blank">clang_linux_e=
mbedded.mk</a><br>
&gt; &gt; + create mode 100644<br>
&gt; &gt; compiler-rt/make/platform/clang_linux_embedded_test_input.c<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/compiler-rt/make/platform/<a href=3D"http://clang_l=
inux_embedded.mk" rel=3D"noreferrer" target=3D"_blank">clang_linux_embedded=
.mk</a><br>
&gt; &gt; b/compiler-rt/make/platform/<a href=3D"http://clang_linux_embedde=
d.mk" rel=3D"noreferrer" target=3D"_blank">clang_linux_embedded.mk</a><br>
&gt; &gt; +new file mode 100644<br>
&gt; &gt; +index 000000000000..d0a890075a1c<br>
&gt; &gt; +--- /dev/null<br>
&gt; &gt; ++++ b/compiler-rt/make/platform/<a href=3D"http://clang_linux_em=
bedded.mk" rel=3D"noreferrer" target=3D"_blank">clang_linux_embedded.mk</a>=
<br>
&gt; &gt; +@@ -0,0 +1,286 @@<br>
&gt; &gt; ++# These are the functions which clang needs when it is targetin=
g a previous<br>
&gt; &gt; ++# version of the OS. The issue is that the backend may use func=
tions which<br>
&gt; &gt; were<br>
&gt; &gt; ++# not present in the libgcc that shipped on the platform. In su=
ch cases, we<br>
&gt; link<br>
&gt; &gt; ++# with a version of the library which contains private_extern d=
efinitions of all<br>
&gt; &gt; ++# the extra functions which might be referenced.<br>
&gt; &gt; ++<br>
&gt; &gt; ++Description :=3D Static runtime libraries for embedded clang/Li=
nux<br>
&gt; &gt; ++<br>
&gt; &gt; ++# A function that ensures we don&#39;t try to build for archite=
ctures that we<br>
&gt; &gt; ++# don&#39;t have working toolchains for.<br>
&gt; &gt; ++CheckArches =3D \<br>
&gt; &gt; ++=C2=A0 $(shell \<br>
&gt; &gt; ++=C2=A0 =C2=A0 result=3D&quot;&quot;; \<br>
&gt; &gt; ++=C2=A0 =C2=A0 for arch in $(1); do \<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 if $(CC) -arch $$arch -c \<br>
&gt; &gt; ++=C2=A0 =C2=A0 -integrated-as \<br>
&gt; &gt; ++=C2=A0 =C2=A0 $(ProjSrcRoot)/make/platform/clang_linux_embedded=
_test_input.c \<br>
&gt; &gt; ++=C2=A0 =C2=A0 -o /dev/null &gt; /dev/null 2&gt; /dev/null; then=
 \<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 result=3D&quot;$$result$$arch &quot=
;; \<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 else \<br>
&gt; &gt; ++=C2=A0 printf 1&gt;&amp;2 \<br>
&gt; &gt; ++=C2=A0 =C2=A0 &quot;warning: <a href=3D"http://clang_linux_embe=
dded.mk" rel=3D"noreferrer" target=3D"_blank">clang_linux_embedded.mk</a>: =
dropping arch &#39;$$arch&#39; from lib<br>
&gt; &gt; &#39;$(2)&#39;\n&quot;; \<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 fi; \<br>
&gt; &gt; ++=C2=A0 =C2=A0 done; \<br>
&gt; &gt; ++=C2=A0 =C2=A0 echo $$result)<br>
&gt; &gt; ++<br>
&gt; &gt; ++XCRun =3D \<br>
&gt; &gt; ++=C2=A0 $(shell \<br>
&gt; &gt; ++=C2=A0 =C2=A0 result=3D`xcrun -find $(1) 2&gt; /dev/null`; \<br=
>
&gt; &gt; ++=C2=A0 =C2=A0 if [ &quot;$$?&quot; !=3D &quot;0&quot; ]; then r=
esult=3D$(1); fi; \<br>
&gt; &gt; ++=C2=A0 =C2=A0 echo $$result)<br>
&gt; &gt; ++<br>
&gt; &gt; ++###<br>
&gt; &gt; ++<br>
&gt; &gt; ++CC=C2=A0 =C2=A0 =C2=A0 =C2=A0:=3D $(call XCRun,clang)<br>
&gt; &gt; ++AR=C2=A0 =C2=A0 =C2=A0 =C2=A0:=3D $(call XCRun,ar)<br>
&gt; &gt; ++RANLIB=C2=A0 =C2=A0:=3D $(call XCRun,ranlib)<br>
&gt; &gt; ++STRIP=C2=A0 =C2=A0 :=3D $(call XCRun,strip)<br>
&gt; &gt; ++LIPO=C2=A0 =C2=A0 =C2=A0:=3D $(call XCRun,lipo)<br>
&gt; &gt; ++DSYMUTIL :=3D $(call XCRun,dsymutil)<br>
&gt; &gt; ++Configs :=3D<br>
&gt; &gt; ++UniversalArchs :=3D<br>
&gt; &gt; ++<br>
&gt; &gt; ++# Soft-float version of the runtime. No floating-point instruct=
ions will be used<br>
&gt; &gt; ++# and the ABI (out of necessity) passes floating values in norm=
al registers:<br>
&gt; &gt; ++# non-VFP variant of the AAPCS.<br>
&gt; &gt; ++UniversalArchs.soft_static :=3D $(call CheckArches,arm armv7m a=
rmv7em<br>
&gt; &gt; armv7,soft_static)<br>
&gt; &gt; ++Configs +=3D $(if $(UniversalArchs.soft_static),soft_static)<br=
>
&gt; &gt; ++<br>
&gt; &gt; ++# Hard-float version of the runtime. On ARM VFP instructions an=
d registers<br>
&gt; are<br>
&gt; &gt; ++# allowed, and floating point values get passed in them. VFP va=
riant of the<br>
&gt; &gt; ++# AAPCS.<br>
&gt; &gt; ++UniversalArchs.hard_static :=3D $(call CheckArches,armv7em armv=
7 i386<br>
&gt; &gt; x86_64,hard_static)<br>
&gt; &gt; ++Configs +=3D $(if $(UniversalArchs.hard_static),hard_static)<br=
>
&gt; &gt; ++<br>
&gt; &gt; ++UniversalArchs.soft_pic :=3D $(call CheckArches,armv6m armv7m a=
rmv7em<br>
&gt; &gt; armv7,soft_pic)<br>
&gt; &gt; ++Configs +=3D $(if $(UniversalArchs.soft_pic),soft_pic)<br>
&gt; &gt; ++<br>
&gt; &gt; ++UniversalArchs.hard_pic :=3D $(call CheckArches,armv7em armv7 i=
386<br>
&gt; &gt; x86_64,hard_pic)<br>
&gt; &gt; ++Configs +=3D $(if $(UniversalArchs.hard_pic),hard_pic)<br>
&gt; &gt; ++<br>
&gt; &gt; ++CFLAGS :=3D -Wall -Werror -Oz -fomit-frame-pointer -ffreestandi=
ng<br>
&gt; &gt; ++<br>
&gt; &gt; ++PIC_CFLAGS :=3D -fPIC<br>
&gt; &gt; ++STATIC_CFLAGS :=3D -static<br>
&gt; &gt; ++<br>
&gt; &gt; ++CFLAGS_SOFT :=3D -mfloat-abi=3Dsoft<br>
&gt; &gt; ++CFLAGS_HARD :=3D -mfloat-abi=3Dhard<br>
&gt; &gt; ++<br>
&gt; &gt; ++CFLAGS_I386=C2=A0 :=3D -march=3Dpentium<br>
&gt; &gt; ++<br>
&gt; &gt; ++CFLAGS.soft_static :=3D $(CFLAGS) $(STATIC_CFLAGS) $(CFLAGS_SOF=
T)<br>
&gt; &gt; ++CFLAGS.hard_static :=3D $(CFLAGS) $(STATIC_CFLAGS) $(CFLAGS_HAR=
D)<br>
&gt; &gt; ++CFLAGS.soft_pic=C2=A0 =C2=A0 :=3D $(CFLAGS) $(PIC_CFLAGS) $(CFL=
AGS_SOFT)<br>
&gt; &gt; ++CFLAGS.hard_pic=C2=A0 =C2=A0 :=3D $(CFLAGS) $(PIC_CFLAGS) $(CFL=
AGS_HARD)<br>
&gt; &gt; ++<br>
&gt; &gt; ++CFLAGS.soft_static.armv7 :=3D $(CFLAGS.soft_static) $(CFLAGS_AR=
MV7)<br>
&gt; &gt; ++CFLAGS.hard_static.armv7 :=3D $(CFLAGS.hard_static) $(CFLAGS_AR=
MV7)<br>
&gt; &gt; ++CFLAGS.soft_pic.armv7=C2=A0 =C2=A0 :=3D $(CFLAGS.soft_pic) $(CF=
LAGS_ARMV7)<br>
&gt; &gt; ++CFLAGS.hard_pic.armv7=C2=A0 =C2=A0 :=3D $(CFLAGS.hard_pic) $(CF=
LAGS_ARMV7)<br>
&gt; &gt; ++<br>
&gt; &gt; ++# x86 platforms ignore -mfloat-abi options and complain about d=
oing so.<br>
&gt; &gt; Despite<br>
&gt; &gt; ++# this they&#39;re hard-float.<br>
&gt; &gt; ++CFLAGS.hard_static.i386=C2=A0 =C2=A0:=3D $(CFLAGS) $(STATIC_CFL=
AGS) $(CFLAGS_I386)<br>
&gt; &gt; ++CFLAGS.hard_pic.i386=C2=A0 =C2=A0 =C2=A0 :=3D $(CFLAGS) $(PIC_C=
FLAGS) $(CFLAGS_I386)<br>
&gt; &gt; ++CFLAGS.hard_static.x86_64 :=3D $(CFLAGS) $(STATIC_CFLAGS)<br>
&gt; &gt; ++CFLAGS.hard_pic.x86_64=C2=A0 =C2=A0 :=3D $(CFLAGS) $(PIC_CFLAGS=
)<br>
&gt; &gt; ++<br>
&gt; &gt; ++# Functions not wanted:<br>
&gt; &gt; ++#=C2=A0 =C2=A0+ eprintf is obsolete anyway<br>
&gt; &gt; ++#=C2=A0 =C2=A0+ *vfp: designed for Thumb1 CPUs with VFPv2<br>
&gt; &gt; ++<br>
&gt; &gt; ++COMMON_FUNCTIONS :=3D \<br>
&gt; &gt; ++=C2=A0 absvdi2 \<br>
&gt; &gt; ++=C2=A0 absvsi2 \<br>
&gt; &gt; ++=C2=A0 addvdi3 \<br>
&gt; &gt; ++=C2=A0 addvsi3 \<br>
&gt; &gt; ++=C2=A0 ashldi3 \<br>
&gt; &gt; ++=C2=A0 ashrdi3 \<br>
&gt; &gt; ++=C2=A0 bswapdi2 \<br>
&gt; &gt; ++=C2=A0 bswapsi2 \<br>
&gt; &gt; ++=C2=A0 clzdi2 \<br>
&gt; &gt; ++=C2=A0 clzsi2 \<br>
&gt; &gt; ++=C2=A0 cmpdi2 \<br>
&gt; &gt; ++=C2=A0 ctzdi2 \<br>
&gt; &gt; ++=C2=A0 ctzsi2 \<br>
&gt; &gt; ++=C2=A0 divdc3 \<br>
&gt; &gt; ++=C2=A0 divdi3 \<br>
&gt; &gt; ++=C2=A0 divsc3 \<br>
&gt; &gt; ++=C2=A0 divmodsi4 \<br>
&gt; &gt; ++=C2=A0 udivmodsi4 \<br>
&gt; &gt; ++=C2=A0 do_global_dtors \<br>
&gt; &gt; ++=C2=A0 ffsdi2 \<br>
&gt; &gt; ++=C2=A0 fixdfdi \<br>
&gt; &gt; ++=C2=A0 fixsfdi \<br>
&gt; &gt; ++=C2=A0 fixunsdfdi \<br>
&gt; &gt; ++=C2=A0 fixunsdfsi \<br>
&gt; &gt; ++=C2=A0 fixunssfdi \<br>
&gt; &gt; ++=C2=A0 fixunssfsi \<br>
&gt; &gt; ++=C2=A0 floatdidf \<br>
&gt; &gt; ++=C2=A0 floatdisf \<br>
&gt; &gt; ++=C2=A0 floatundidf \<br>
&gt; &gt; ++=C2=A0 floatundisf \<br>
&gt; &gt; ++=C2=A0 gcc_bcmp \<br>
&gt; &gt; ++=C2=A0 lshrdi3 \<br>
&gt; &gt; ++=C2=A0 moddi3 \<br>
&gt; &gt; ++=C2=A0 muldc3 \<br>
&gt; &gt; ++=C2=A0 muldi3 \<br>
&gt; &gt; ++=C2=A0 mulsc3 \<br>
&gt; &gt; ++=C2=A0 mulvdi3 \<br>
&gt; &gt; ++=C2=A0 mulvsi3 \<br>
&gt; &gt; ++=C2=A0 negdi2 \<br>
&gt; &gt; ++=C2=A0 negvdi2 \<br>
&gt; &gt; ++=C2=A0 negvsi2 \<br>
&gt; &gt; ++=C2=A0 paritydi2 \<br>
&gt; &gt; ++=C2=A0 paritysi2 \<br>
&gt; &gt; ++=C2=A0 popcountdi2 \<br>
&gt; &gt; ++=C2=A0 popcountsi2 \<br>
&gt; &gt; ++=C2=A0 powidf2 \<br>
&gt; &gt; ++=C2=A0 powisf2 \<br>
&gt; &gt; ++=C2=A0 subvdi3 \<br>
&gt; &gt; ++=C2=A0 subvsi3 \<br>
&gt; &gt; ++=C2=A0 ucmpdi2 \<br>
&gt; &gt; ++=C2=A0 udiv_w_sdiv \<br>
&gt; &gt; ++=C2=A0 udivdi3 \<br>
&gt; &gt; ++=C2=A0 udivmoddi4 \<br>
&gt; &gt; ++=C2=A0 umoddi3 \<br>
&gt; &gt; ++=C2=A0 adddf3 \<br>
&gt; &gt; ++=C2=A0 addsf3 \<br>
&gt; &gt; ++=C2=A0 cmpdf2 \<br>
&gt; &gt; ++=C2=A0 cmpsf2 \<br>
&gt; &gt; ++=C2=A0 div0 \<br>
&gt; &gt; ++=C2=A0 divdf3 \<br>
&gt; &gt; ++=C2=A0 divsf3 \<br>
&gt; &gt; ++=C2=A0 divsi3 \<br>
&gt; &gt; ++=C2=A0 extendsfdf2 \<br>
&gt; &gt; ++=C2=A0 ffssi2 \<br>
&gt; &gt; ++=C2=A0 fixdfsi \<br>
&gt; &gt; ++=C2=A0 fixsfsi \<br>
&gt; &gt; ++=C2=A0 floatsidf \<br>
&gt; &gt; ++=C2=A0 floatsisf \<br>
&gt; &gt; ++=C2=A0 floatunsidf \<br>
&gt; &gt; ++=C2=A0 floatunsisf \<br>
&gt; &gt; ++=C2=A0 comparedf2 \<br>
&gt; &gt; ++=C2=A0 comparesf2 \<br>
&gt; &gt; ++=C2=A0 modsi3 \<br>
&gt; &gt; ++=C2=A0 muldf3 \<br>
&gt; &gt; ++=C2=A0 mulsf3 \<br>
&gt; &gt; ++=C2=A0 negdf2 \<br>
&gt; &gt; ++=C2=A0 negsf2 \<br>
&gt; &gt; ++=C2=A0 subdf3 \<br>
&gt; &gt; ++=C2=A0 subsf3 \<br>
&gt; &gt; ++=C2=A0 truncdfsf2 \<br>
&gt; &gt; ++=C2=A0 udivsi3 \<br>
&gt; &gt; ++=C2=A0 umodsi3 \<br>
&gt; &gt; ++=C2=A0 unorddf2 \<br>
&gt; &gt; ++=C2=A0 unordsf2<br>
&gt; &gt; ++<br>
&gt; &gt; ++ARM_FUNCTIONS :=3D \<br>
&gt; &gt; ++=C2=A0 aeabi_cdcmpeq \<br>
&gt; &gt; ++=C2=A0 aeabi_cdrcmple \<br>
&gt; &gt; ++=C2=A0 aeabi_cfcmpeq \<br>
&gt; &gt; ++=C2=A0 aeabi_cfrcmple \<br>
&gt; &gt; ++=C2=A0 aeabi_dcmpeq \<br>
&gt; &gt; ++=C2=A0 aeabi_dcmpge \<br>
&gt; &gt; ++=C2=A0 aeabi_dcmpgt \<br>
&gt; &gt; ++=C2=A0 aeabi_dcmple \<br>
&gt; &gt; ++=C2=A0 aeabi_dcmplt \<br>
&gt; &gt; ++=C2=A0 aeabi_drsub \<br>
&gt; &gt; ++=C2=A0 aeabi_fcmpeq \<br>
&gt; &gt; ++=C2=A0 aeabi_fcmpge \<br>
&gt; &gt; ++=C2=A0 aeabi_fcmpgt \<br>
&gt; &gt; ++=C2=A0 aeabi_fcmple \<br>
&gt; &gt; ++=C2=A0 aeabi_fcmplt \<br>
&gt; &gt; ++=C2=A0 aeabi_frsub \<br>
&gt; &gt; ++=C2=A0 aeabi_idivmod \<br>
&gt; &gt; ++=C2=A0 aeabi_uidivmod \<br>
&gt; &gt; ++<br>
&gt; &gt; ++# ARM Assembly implementation which requires Thumb2 (i.e. won&#=
39;t work on<br>
&gt; &gt; v6M).<br>
&gt; &gt; ++THUMB2_FUNCTIONS :=3D \<br>
&gt; &gt; ++=C2=A0 switch16 \<br>
&gt; &gt; ++=C2=A0 switch32 \<br>
&gt; &gt; ++=C2=A0 switch8 \<br>
&gt; &gt; ++=C2=A0 switchu8 \<br>
&gt; &gt; ++=C2=A0 sync_fetch_and_add_4 \<br>
&gt; &gt; ++=C2=A0 sync_fetch_and_sub_4 \<br>
&gt; &gt; ++=C2=A0 sync_fetch_and_and_4 \<br>
&gt; &gt; ++=C2=A0 sync_fetch_and_or_4 \<br>
&gt; &gt; ++=C2=A0 sync_fetch_and_xor_4 \<br>
&gt; &gt; ++=C2=A0 sync_fetch_and_nand_4 \<br>
&gt; &gt; ++=C2=A0 sync_fetch_and_max_4 \<br>
&gt; &gt; ++=C2=A0 sync_fetch_and_umax_4 \<br>
&gt; &gt; ++=C2=A0 sync_fetch_and_min_4 \<br>
&gt; &gt; ++=C2=A0 sync_fetch_and_umin_4 \<br>
&gt; &gt; ++=C2=A0 sync_fetch_and_add_8 \<br>
&gt; &gt; ++=C2=A0 sync_fetch_and_sub_8 \<br>
&gt; &gt; ++=C2=A0 sync_fetch_and_and_8 \<br>
&gt; &gt; ++=C2=A0 sync_fetch_and_or_8 \<br>
&gt; &gt; ++=C2=A0 sync_fetch_and_xor_8 \<br>
&gt; &gt; ++=C2=A0 sync_fetch_and_nand_8 \<br>
&gt; &gt; ++=C2=A0 sync_fetch_and_max_8 \<br>
&gt; &gt; ++=C2=A0 sync_fetch_and_umax_8 \<br>
&gt; &gt; ++=C2=A0 sync_fetch_and_min_8 \<br>
&gt; &gt; ++=C2=A0 sync_fetch_and_umin_8<br>
&gt; &gt; ++<br>
&gt; &gt; ++I386_FUNCTIONS :=3D=C2=A0 \<br>
&gt; &gt; ++=C2=A0 i686.get_pc_thunk.eax \<br>
&gt; &gt; ++=C2=A0 i686.get_pc_thunk.ebp \<br>
&gt; &gt; ++=C2=A0 i686.get_pc_thunk.ebx \<br>
&gt; &gt; ++=C2=A0 i686.get_pc_thunk.ecx \<br>
&gt; &gt; ++=C2=A0 i686.get_pc_thunk.edi \<br>
&gt; &gt; ++=C2=A0 i686.get_pc_thunk.edx \<br>
&gt; &gt; ++=C2=A0 i686.get_pc_thunk.esi<br>
&gt; &gt; ++<br>
&gt; &gt; ++# FIXME: Currently, compiler-rt is missing implementations for =
a number of<br>
&gt; the<br>
&gt; &gt; ++# functions. Filter them out for now.<br>
&gt; &gt; ++MISSING_FUNCTIONS :=3D \<br>
&gt; &gt; ++=C2=A0 cmpdf2 cmpsf2 div0 \<br>
&gt; &gt; ++=C2=A0 ffssi2 \<br>
&gt; &gt; ++=C2=A0 udiv_w_sdiv unorddf2 unordsf2 bswapdi2 \<br>
&gt; &gt; ++=C2=A0 bswapsi2 \<br>
&gt; &gt; ++=C2=A0 gcc_bcmp \<br>
&gt; &gt; ++=C2=A0 do_global_dtors \<br>
&gt; &gt; ++=C2=A0 i686.get_pc_thunk.eax i686.get_pc_thunk.ebp i686.get_pc_=
thunk.ebx \<br>
&gt; &gt; ++=C2=A0 i686.get_pc_thunk.ecx i686.get_pc_thunk.edi i686.get_pc_=
thunk.edx \<br>
&gt; &gt; ++=C2=A0 i686.get_pc_thunk.esi \<br>
&gt; &gt; ++=C2=A0 aeabi_cdcmpeq aeabi_cdrcmple aeabi_cfcmpeq aeabi_cfrcmpl=
e<br>
&gt; &gt; aeabi_dcmpeq \<br>
&gt; &gt; ++=C2=A0 aeabi_dcmpge aeabi_dcmpgt aeabi_dcmple aeabi_dcmplt aeab=
i_drsub \<br>
&gt; &gt; ++=C2=A0 aeabi_fcmpeq \ aeabi_fcmpge aeabi_fcmpgt aeabi_fcmple ae=
abi_fcmplt \<br>
&gt; &gt; ++=C2=A0 aeabi_frsub aeabi_idivmod aeabi_uidivmod<br>
&gt; &gt; ++<br>
&gt; &gt; ++FUNCTIONS_ARMV6M=C2=A0 :=3D $(COMMON_FUNCTIONS) $(ARM_FUNCTIONS=
)<br>
&gt; &gt; ++FUNCTIONS_ARM_ALL :=3D $(COMMON_FUNCTIONS) $(ARM_FUNCTIONS)<br>
&gt; &gt; $(THUMB2_FUNCTIONS)<br>
&gt; &gt; ++FUNCTIONS_I386=C2=A0 =C2=A0 :=3D $(COMMON_FUNCTIONS) $(I386_FUN=
CTIONS)<br>
&gt; &gt; ++FUNCTIONS_X86_64=C2=A0 :=3D $(COMMON_FUNCTIONS)<br>
&gt; &gt; ++<br>
&gt; &gt; ++FUNCTIONS_ARMV6M :=3D \<br>
&gt; &gt; ++=C2=A0 $(filter-out $(MISSING_FUNCTIONS),$(FUNCTIONS_ARMV6M))<b=
r>
&gt; &gt; ++FUNCTIONS_ARM_ALL :=3D \<br>
&gt; &gt; ++=C2=A0 $(filter-out $(MISSING_FUNCTIONS),$(FUNCTIONS_ARM_ALL))<=
br>
&gt; &gt; ++FUNCTIONS_I386 :=3D \<br>
&gt; &gt; ++=C2=A0 $(filter-out $(MISSING_FUNCTIONS),$(FUNCTIONS_I386))<br>
&gt; &gt; ++FUNCTIONS_X86_64 :=3D \<br>
&gt; &gt; ++=C2=A0 $(filter-out $(MISSING_FUNCTIONS),$(FUNCTIONS_X86_64))<b=
r>
&gt; &gt; ++<br>
&gt; &gt; ++FUNCTIONS.soft_static.armv6m :=3D $(FUNCTIONS_ARMV6M)<br>
&gt; &gt; ++FUNCTIONS.soft_pic.armv6m=C2=A0 =C2=A0 :=3D $(FUNCTIONS_ARMV6M)=
<br>
&gt; &gt; ++<br>
&gt; &gt; ++FUNCTIONS.soft_static.armv7m :=3D $(FUNCTIONS_ARM_ALL)<br>
&gt; &gt; ++FUNCTIONS.soft_pic.armv7m=C2=A0 =C2=A0 :=3D $(FUNCTIONS_ARM_ALL=
)<br>
&gt; &gt; ++<br>
&gt; &gt; ++FUNCTIONS.soft_static.armv7em :=3D $(FUNCTIONS_ARM_ALL)<br>
&gt; &gt; ++FUNCTIONS.hard_static.armv7em :=3D $(FUNCTIONS_ARM_ALL)<br>
&gt; &gt; ++FUNCTIONS.soft_pic.armv7em=C2=A0 =C2=A0 :=3D $(FUNCTIONS_ARM_AL=
L)<br>
&gt; &gt; ++FUNCTIONS.hard_pic.armv7em=C2=A0 =C2=A0 :=3D $(FUNCTIONS_ARM_AL=
L)<br>
&gt; &gt; ++<br>
&gt; &gt; ++FUNCTIONS.soft_static.armv7 :=3D $(FUNCTIONS_ARM_ALL)<br>
&gt; &gt; ++FUNCTIONS.hard_static.armv7 :=3D $(FUNCTIONS_ARM_ALL)<br>
&gt; &gt; ++FUNCTIONS.soft_pic.armv7=C2=A0 =C2=A0 :=3D $(FUNCTIONS_ARM_ALL)=
<br>
&gt; &gt; ++FUNCTIONS.hard_pic.armv7=C2=A0 =C2=A0 :=3D $(FUNCTIONS_ARM_ALL)=
<br>
&gt; &gt; ++<br>
&gt; &gt; ++FUNCTIONS.hard_static.i386 :=3D $(FUNCTIONS_I386)<br>
&gt; &gt; ++FUNCTIONS.hard_pic.i386=C2=A0 =C2=A0 :=3D $(FUNCTIONS_I386)<br>
&gt; &gt; ++<br>
&gt; &gt; ++FUNCTIONS.hard_static.x86_64 :=3D $(FUNCTIONS_X86_64)<br>
&gt; &gt; ++FUNCTIONS.hard_pic.x86_64=C2=A0 =C2=A0 :=3D $(FUNCTIONS_X86_64)=
<br>
&gt; &gt; +diff --git a/compiler-rt/make/platform/clang_linux_embedded_test=
_input.c<br>
&gt; &gt; b/compiler-rt/make/platform/clang_linux_embedded_test_input.c<br>
&gt; &gt; +new file mode 100644<br>
&gt; &gt; +index 000000000000..e69de29bb2d1<br>
&gt; &gt; diff --git<br>
&gt; &gt;<br>
&gt; a/meta/recipes-devtools/clang/clang/0003-compiler-rt-Simplify-cross-co=
mpilati<br>
&gt; &gt; on.-Don-t-use-na.patch<br>
&gt; &gt;<br>
&gt; b/meta/recipes-devtools/clang/clang/0003-compiler-rt-Simplify-cross-co=
mpilati<br>
&gt; &gt; on.-Don-t-use-na.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index<br>
&gt; &gt;<br>
&gt; 0000000000000000000000000000000000000000..a153624860873d0740bd71cc<br>
&gt; &gt; 1ae35744a530b44f<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++<br>
&gt; &gt;<br>
&gt; b/meta/recipes-devtools/clang/clang/0003-compiler-rt-Simplify-cross-co=
mpilati<br>
&gt; &gt; on.-Don-t-use-na.patch<br>
&gt; &gt; @@ -0,0 +1,44 @@<br>
&gt; &gt; +From c105a2efab08776d1f4df6b9b8d26d0f89d14b41 Mon Sep 17 00:00:0=
0<br>
&gt; &gt; 2001<br>
&gt; &gt; +From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt; +Date: Thu, 19 May 2016 23:11:45 -0700<br>
&gt; &gt; +Subject: [PATCH] compiler-rt: Simplify cross-compilation. Don&#3=
9;t use<br>
&gt; &gt; + native-compiled llvm-config.<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 Note: AddLLVM.cmake does not expose the LLVM sourc=
e directory.<br>
&gt; &gt; +=C2=A0 =C2=A0 So if you want to run the test suite, you need to =
either:<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 1) set LLVM_MAIN_SRC_DIR explicitly (to find lit.p=
y)<br>
&gt; &gt; +=C2=A0 =C2=A0 2) change AddLLVM.cmake to point to an installed &=
#39;lit&#39;.<br>
&gt; &gt; +=C2=A0 =C2=A0 3) add_subdirectory(compiler-rt/test) from clang i=
nstead of compiler-rt.<br>
&gt; &gt; +<br>
&gt; &gt;<br>
&gt; +<a href=3D"https://us.codeaurora.org/patches/quic/llvm/50683/compiler=
-rt-cross-compila" rel=3D"noreferrer" target=3D"_blank">https://us.codeauro=
ra.org/patches/quic/llvm/50683/compiler-rt-cross-compila</a><br>
&gt; &gt; tion.patch<br>
&gt; &gt; +<br>
&gt; &gt; +Upstream-Status: Pending<br>
&gt; &gt; +Signed-off-by: Greg Fitzgerald &lt;<a href=3D"mailto:gregf@codea=
urora.org" target=3D"_blank">gregf@codeaurora.org</a>&gt;<br>
&gt; &gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com=
" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt; +---<br>
&gt; &gt; + compiler-rt/CMakeLists.txt | 11 ++++++++++-<br>
&gt; &gt; + 1 file changed, 10 insertions(+), 1 deletion(-)<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/compiler-rt/CMakeLists.txt b/compiler-rt/CMakeLists=
.txt<br>
&gt; &gt; +index 2c52788de56a..fe409704acc3 100644<br>
&gt; &gt; +--- a/compiler-rt/CMakeLists.txt<br>
&gt; &gt; ++++ b/compiler-rt/CMakeLists.txt<br>
&gt; &gt; +@@ -107,7 +107,16 @@ if (COMPILER_RT_STANDALONE_BUILD)<br>
&gt; &gt; +=C2=A0 =C2=A0set(CMAKE_CXX_EXTENSIONS NO)<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0if (NOT LLVM_RUNTIMES_BUILD)<br>
&gt; &gt; +-=C2=A0 =C2=A0 load_llvm_config()<br>
&gt; &gt; ++=C2=A0 =C2=A0 find_package(LLVM REQUIRED)<br>
&gt; &gt; ++=C2=A0 =C2=A0 list(APPEND CMAKE_MODULE_PATH &quot;${LLVM_CMAKE_=
DIR}&quot;)<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 =C2=A0 # Variables that AddLLVM.cmake depends on (includ=
ed by<br>
&gt; &gt; AddCompilerRT)<br>
&gt; &gt; ++=C2=A0 =C2=A0 set(LLVM_TOOLS_BINARY_DIR &quot;${LLVM_INSTALL_PR=
EFIX}/bin&quot;)<br>
&gt; &gt; ++=C2=A0 =C2=A0 set(LLVM_LIBRARY_DIR &quot;${LLVM_INSTALL_PREFIX}=
/lib&quot;)<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 =C2=A0 set(LLVM_LIBRARY_OUTPUT_INTDIR<br>
&gt; &gt; ++<br>
&gt; &gt; ${CMAKE_BINARY_DIR}/${CMAKE_CFG_INTDIR}/lib${LLVM_LIBDIR_SUFFIX})=
<br>
&gt; &gt; ++<br>
&gt; &gt; +=C2=A0 =C2=A0endif()<br>
&gt; &gt; +=C2=A0 =C2=A0if (TARGET intrinsics_gen)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0# Loading the llvm config causes this target=
 to be imported so place it<br>
&gt; &gt; diff --git<br>
&gt; &gt;<br>
&gt; a/meta/recipes-devtools/clang/clang/0004-llvm-TargetLibraryInfo-Undefi=
ne-libc<br>
&gt; &gt; -functions-if-th.patch<br>
&gt; &gt;<br>
&gt; b/meta/recipes-devtools/clang/clang/0004-llvm-TargetLibraryInfo-Undefi=
ne-libc<br>
&gt; &gt; -functions-if-th.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index<br>
&gt; &gt;<br>
&gt; 0000000000000000000000000000000000000000..c70f740222f4d3282c469139f<br=
>
&gt; &gt; 18f3cbfdab932b8<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++<br>
&gt; &gt;<br>
&gt; b/meta/recipes-devtools/clang/clang/0004-llvm-TargetLibraryInfo-Undefi=
ne-libc<br>
&gt; &gt; -functions-if-th.patch<br>
&gt; &gt; @@ -0,0 +1,90 @@<br>
&gt; &gt; +From 388a70b4a8f828b7c58a0fb7bc3ee18001bc5f9b Mon Sep 17 00:00:0=
0<br>
&gt; &gt; 2001<br>
&gt; &gt; +From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt; +Date: Sat, 21 May 2016 00:33:20 +0000<br>
&gt; &gt; +Subject: [PATCH] llvm: TargetLibraryInfo: Undefine libc function=
s if they are<br>
&gt; &gt; + macros<br>
&gt; &gt; +<br>
&gt; &gt; +musl defines some functions as macros and not inline functions<b=
r>
&gt; &gt; +if this is the case then make sure to undefine them<br>
&gt; &gt; +<br>
&gt; &gt; +Upstream-Status: Pending<br>
&gt; &gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com=
" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt; +---<br>
&gt; &gt; + .../llvm/Analysis/TargetLibraryInfo.def=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 22 ++++++++++++++++++-<br>
&gt; &gt; + 1 file changed, 21 insertions(+), 1 deletion(-)<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/llvm/include/llvm/Analysis/TargetLibraryInfo.def<br=
>
&gt; &gt; b/llvm/include/llvm/Analysis/TargetLibraryInfo.def<br>
&gt; &gt; +index db566b8ee610..578161f9c978 100644<br>
&gt; &gt; +--- a/llvm/include/llvm/Analysis/TargetLibraryInfo.def<br>
&gt; &gt; ++++ b/llvm/include/llvm/Analysis/TargetLibraryInfo.def<br>
&gt; &gt; +@@ -1467,6 +1467,9 @@ TLI_DEFINE_STRING_INTERNAL(&quot;fopen&quo=
t;)<br>
&gt; &gt; + TLI_DEFINE_SIG_INTERNAL(Ptr, Ptr, Ptr)<br>
&gt; &gt; +<br>
&gt; &gt; + /// FILE *fopen64(const char *filename, const char *opentype)<b=
r>
&gt; &gt; ++#ifdef fopen64<br>
&gt; &gt; ++#undef fopen64<br>
&gt; &gt; ++#endif<br>
&gt; &gt; + TLI_DEFINE_ENUM_INTERNAL(fopen64)<br>
&gt; &gt; + TLI_DEFINE_STRING_INTERNAL(&quot;fopen64&quot;)<br>
&gt; &gt; + TLI_DEFINE_SIG_INTERNAL(Ptr, Ptr, Ptr)<br>
&gt; &gt; +@@ -1545,7 +1548,9 @@ TLI_DEFINE_SIG_INTERNAL(Int, Ptr, Long, In=
t)<br>
&gt; &gt; + TLI_DEFINE_ENUM_INTERNAL(fseeko)<br>
&gt; &gt; + TLI_DEFINE_STRING_INTERNAL(&quot;fseeko&quot;)<br>
&gt; &gt; + TLI_DEFINE_SIG_INTERNAL(Int, Ptr, IntX, Int)<br>
&gt; &gt; +-<br>
&gt; &gt; ++#ifdef fseeko64<br>
&gt; &gt; ++#undef fseeko64<br>
&gt; &gt; ++#endif<br>
&gt; &gt; + /// int fseeko64(FILE *stream, off64_t offset, int whence)<br>
&gt; &gt; + TLI_DEFINE_ENUM_INTERNAL(fseeko64)<br>
&gt; &gt; + TLI_DEFINE_STRING_INTERNAL(&quot;fseeko64&quot;)<br>
&gt; &gt; +@@ -1562,6 +1567,9 @@ TLI_DEFINE_STRING_INTERNAL(&quot;fstat&quo=
t;)<br>
&gt; &gt; + TLI_DEFINE_SIG_INTERNAL(Int, Int, Ptr)<br>
&gt; &gt; +<br>
&gt; &gt; + /// int fstat64(int filedes, struct stat64 *buf)<br>
&gt; &gt; ++#ifdef fstat64<br>
&gt; &gt; ++#undef fstat64<br>
&gt; &gt; ++#endif<br>
&gt; &gt; + TLI_DEFINE_ENUM_INTERNAL(fstat64)<br>
&gt; &gt; + TLI_DEFINE_STRING_INTERNAL(&quot;fstat64&quot;)<br>
&gt; &gt; + TLI_DEFINE_SIG_INTERNAL(Int, Int, Ptr)<br>
&gt; &gt; +@@ -1587,6 +1595,9 @@ TLI_DEFINE_STRING_INTERNAL(&quot;ftello&qu=
ot;)<br>
&gt; &gt; + TLI_DEFINE_SIG_INTERNAL(IntPlus, Ptr)<br>
&gt; &gt; +<br>
&gt; &gt; + /// off64_t ftello64(FILE *stream)<br>
&gt; &gt; ++#ifdef ftello64<br>
&gt; &gt; ++#undef ftello64<br>
&gt; &gt; ++#endif<br>
&gt; &gt; + TLI_DEFINE_ENUM_INTERNAL(ftello64)<br>
&gt; &gt; + TLI_DEFINE_STRING_INTERNAL(&quot;ftello64&quot;)<br>
&gt; &gt; + TLI_DEFINE_SIG_INTERNAL(Int64, Ptr)<br>
&gt; &gt; +@@ -1827,6 +1838,9 @@ TLI_DEFINE_STRING_INTERNAL(&quot;lstat&quo=
t;)<br>
&gt; &gt; + TLI_DEFINE_SIG_INTERNAL(Int, Ptr, Ptr)<br>
&gt; &gt; +<br>
&gt; &gt; + /// int lstat64(const char *path, struct stat64 *buf);<br>
&gt; &gt; ++#ifdef lstat64<br>
&gt; &gt; ++#undef lstat64<br>
&gt; &gt; ++#endif<br>
&gt; &gt; + TLI_DEFINE_ENUM_INTERNAL(lstat64)<br>
&gt; &gt; + TLI_DEFINE_STRING_INTERNAL(&quot;lstat64&quot;)<br>
&gt; &gt; + TLI_DEFINE_SIG_INTERNAL(Int, Ptr, Ptr)<br>
&gt; &gt; +@@ -2334,6 +2348,9 @@ TLI_DEFINE_STRING_INTERNAL(&quot;stat&quot=
;)<br>
&gt; &gt; + TLI_DEFINE_SIG_INTERNAL(Int, Ptr, Ptr)<br>
&gt; &gt; +<br>
&gt; &gt; + /// int stat64(const char *path, struct stat64 *buf);<br>
&gt; &gt; ++#ifdef stat64<br>
&gt; &gt; ++#undef stat64<br>
&gt; &gt; ++#endif<br>
&gt; &gt; + TLI_DEFINE_ENUM_INTERNAL(stat64)<br>
&gt; &gt; + TLI_DEFINE_STRING_INTERNAL(&quot;stat64&quot;)<br>
&gt; &gt; + TLI_DEFINE_SIG_INTERNAL(Int, Ptr, Ptr)<br>
&gt; &gt; +@@ -2559,6 +2576,9 @@ TLI_DEFINE_STRING_INTERNAL(&quot;tmpfile&q=
uot;)<br>
&gt; &gt; + TLI_DEFINE_SIG_INTERNAL(Ptr)<br>
&gt; &gt; +<br>
&gt; &gt; + /// FILE *tmpfile64(void)<br>
&gt; &gt; ++#ifdef tmpfile64<br>
&gt; &gt; ++#undef tmpfile64<br>
&gt; &gt; ++#endif<br>
&gt; &gt; + TLI_DEFINE_ENUM_INTERNAL(tmpfile64)<br>
&gt; &gt; + TLI_DEFINE_STRING_INTERNAL(&quot;tmpfile64&quot;)<br>
&gt; &gt; + TLI_DEFINE_SIG_INTERNAL(Ptr)<br>
&gt; &gt; diff --git<br>
&gt; &gt;<br>
&gt; a/meta/recipes-devtools/clang/clang/0005-llvm-allow-env-override-of-ex=
e-and-<br>
&gt; &gt; libdir-path.patch<br>
&gt; &gt;<br>
&gt; b/meta/recipes-devtools/clang/clang/0005-llvm-allow-env-override-of-ex=
e-and-<br>
&gt; &gt; libdir-path.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index<br>
&gt; &gt;<br>
&gt; 0000000000000000000000000000000000000000..6d3f5293aab84056e9693b5d<br>
&gt; &gt; 2282166fd72b1ede<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++<br>
&gt; &gt;<br>
&gt; b/meta/recipes-devtools/clang/clang/0005-llvm-allow-env-override-of-ex=
e-and-<br>
&gt; &gt; libdir-path.patch</blockquote></div></div>

--0000000000009b4fce0635750db7--

