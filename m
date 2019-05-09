Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
	[209.85.222.175])
	by mail.openembedded.org (Postfix) with ESMTP id 3DFA26C227
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 May 2019 18:06:04 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id z6so1182793qkl.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 May 2019 11:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=e0DEALXeeb7BEXlScoRRJfEInyOAgSFlg7cO0zacPyY=;
	b=dihIjbY2GYlOg0OlaiKjewlI9lPnGmsgQ318KnJKDidqRt85mnwUumPn5ebrDv9WMo
	nTeS35i8mBWDLrzhEfpSCLNP6bAE1BxAXSoF0mKCqJLkpaoTbUJ5DA/dQuH2lsBLtMQq
	f89OqoF3yHMX/K7db2IpPi2IzD5/3qlzNa0hZnOuSEfOKqMRHIXzcVa985u1Jef5onQ/
	ahYTOJrEOwTqX8vRAahBr9YbdeJJ0dQuyd53Mt9uHG+onhh5wirs50t0XeENZaawh6Ki
	NVJSLUXqf9+SL11NMKD/3fVtvWmlC3jMFTuxpYq/t6cuyx5K6rCZlrWSo+NX1aRpyd8r
	6dZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=e0DEALXeeb7BEXlScoRRJfEInyOAgSFlg7cO0zacPyY=;
	b=FrCyCIhPgkV2IzW6UqBs1gaz/uucckCqVxIlW7NyGOLPohQZBDVQ6AT8MTpBwiOR5N
	wxBvLw4TSzIDqVqgWlzPz4uEhBDEj9z+1Gk5ZjgXzYnLm8bosQp1pE6GGCeNwRdcPTTP
	rF8+mUFMwjAkNcwju4botKstX35a5mkJde204LQE7uOqYqylAb0WWFlr+9OLyv+VP3RR
	pcoifowg8100MRmzod0+aTrWUK0J+TBOMDUlAnu+1bHaCxaxYGk8EHs6S/ijl+ozB8TQ
	/jZTIBngQZFkbRo3x55YFNy45vyiHKBSV9/7+tuRW6ms9CS5kS/3HbEGbl/OTo0jkEik
	mpLg==
X-Gm-Message-State: APjAAAWnc2Ia/6S1ROAto9Pe19+y0Yj+2tkp7JotuaqJLQ2+YUjQqipd
	LAKbmeND9hCwnaab++pLAfDciZxyluQ6HJwFlz0=
X-Google-Smtp-Source: APXvYqwGbUEzXpGrfj/mMntevUCk1ip7jWCFlRDl6YkqZp04z6Szpnpwj+2P18tuPk5J70lQeh6riECV5Hsdy6imnxY=
X-Received: by 2002:a37:5009:: with SMTP id e9mr4572958qkb.206.1557425163571; 
	Thu, 09 May 2019 11:06:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190507210338.17788-1-raj.khem@gmail.com>
	<4fba9588af56d66a633fde9dba8e1a4176ed234e.camel@intel.com>
In-Reply-To: <4fba9588af56d66a633fde9dba8e1a4176ed234e.camel@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 9 May 2019 11:05:36 -0700
Message-ID: <CAMKF1sqcCNx6M8Ve8YTzMDCGaZdvBU4LQYhxKgEcH2Q6FyeeCA@mail.gmail.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-9: Add recipes for gcc 9.1 release
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 May 2019 18:06:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 8, 2019 at 11:55 PM Mittal, Anuj <anuj.mittal@intel.com> wrote:
>
> This is probably causing selftest failure for fortran
> (test_toolchain_fortran):
>
> ERROR: libgfortran-9.1.0-r0 do_package: QA Issue: libgfortran:
> Files/directories were installed but not shipped in any package:
>   /usr/lib/gcc/x86_64-poky-linux/9.1.0/include
>   /usr/lib/gcc/x86_64-poky-linux/9.1.0/include/ISO_Fortran_binding.h
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/162/steps/7/logs/step2d
>

fortran is not in default set of languages to build so sent a separate
patch for this here.
https://patchwork.openembedded.org/patch/161101/

> Thanks,
>
> Anuj
>
> On Tue, 2019-05-07 at 14:03 -0700, Khem Raj wrote:
> > Add maintainer entry for gcc-source-9.1.0
> >
> > Delete entry for gcc-source-7.3.0
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/conf/distro/include/maintainers.inc      |   2 +-
> >  meta/recipes-devtools/gcc/gcc-9.1.inc         | 118 ++++++++
> >  ...0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch |  42 +++
> >  .../0002-gcc-poison-system-directories.patch  | 203 ++++++++++++++
> >  ...-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |  73 +++++
> >  .../gcc-9.1/0004-64-bit-multilib-hack.patch   | 119 ++++++++
> >  .../gcc/gcc-9.1/0005-optional-libstdc.patch   | 125 +++++++++
> >  ...gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch |  59 ++++
> >  .../gcc-9.1/0007-COLLECT_GCC_OPTIONS.patch    |  38 +++
> >  ...ts.h-in-B-instead-of-S-and-t-oe-in-B.patch |  96 +++++++
> >  .../0009-fortran-cross-compile-hack.patch     |  46 ++++
> >  .../gcc/gcc-9.1/0010-cpp-honor-sysroot.patch  |  54 ++++
> >  .../0011-MIPS64-Default-to-N64-ABI.patch      |  57 ++++
> >  ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch | 232 ++++++++++++++++
> >  ...gcc-Fix-argument-list-too-long-error.patch |  40 +++
> >  .../gcc/gcc-9.1/0014-Disable-sdt.patch        | 113 ++++++++
> >  .../gcc/gcc-9.1/0015-libtool.patch            |  42 +++
> >  ...s-fix-v4bx-to-linker-to-support-EABI.patch |  43 +++
> >  ...-config-files-from-B-instead-of-usin.patch | 102 +++++++
> >  ...ir-from-.la-which-usually-points-to-.patch |  31 +++
> >  .../gcc/gcc-9.1/0019-export-CPP.patch         |  53 ++++
> >  ...e-target-gcc-headers-can-be-included.patch |  98 +++++++
> >  ...ild-with-disable-dependency-tracking.patch |  54 ++++
> >  ...t-directory-during-relink-if-inst_pr.patch |  38 +++
> >  ...IR-replacement-instead-of-hardcoding.patch |  29 ++
> >  ...24-aarch64-Add-support-for-musl-ldso.patch |  28 ++
> >  ...-fix-libcc1-s-install-path-and-rpath.patch |  54 ++++
> >  ...le-sysroot-support-for-nativesdk-gcc.patch | 213 +++++++++++++++
> >  ...sroot-gcc-version-specific-dirs-with.patch | 102 +++++++
> >  ...ous-_FOR_BUILD-and-related-variables.patch | 137 ++++++++++
> >  ...029-nios2-Define-MUSL_DYNAMIC_LINKER.patch |  28 ++
> >  ...d-to-link-commandline-for-musl-targe.patch |  87 ++++++
> >  ...bgcc-Add-knob-to-use-ldbl-128-on-ppc.patch | 125 +++++++++
> >  ...using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch |  29 ++
> >  ...as-for-__cpu_indicator_init-instead-.patch |  86 ++++++
> >  .../0034-sync-gcc-stddef.h-with-musl.patch    |  91 ++++++
> >  ...-fault-in-precompiled-header-generat.patch |  60 ++++
> >  .../0036-Fix-for-testsuite-failure.patch      | 258
> > ++++++++++++++++++
> >  ...Re-introduce-spe-commandline-options.patch |  41 +++
> >  .../gcc/gcc-cross-canadian_9.1.bb             |   5 +
> >  meta/recipes-devtools/gcc/gcc-cross_9.1.bb    |   3 +
> >  meta/recipes-devtools/gcc/gcc-crosssdk_9.1.bb |   2 +
> >  meta/recipes-devtools/gcc/gcc-runtime_9.1.bb  |  12 +
> >  .../gcc/gcc-sanitizers_9.1.bb                 |   7 +
> >  meta/recipes-devtools/gcc/gcc-source_9.1.bb   |   4 +
> >  meta/recipes-devtools/gcc/gcc_9.1.bb          |  14 +
> >  .../gcc/libgcc-initial_9.1.bb                 |   5 +
> >  meta/recipes-devtools/gcc/libgcc_9.1.bb       |   5 +
> >  meta/recipes-devtools/gcc/libgfortran_9.1.bb  |   3 +
> >  49 files changed, 3305 insertions(+), 1 deletion(-)
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-9.1.inc
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-9.1/0001-gcc-4.3.1-
> > ARCH_FLAGS_FOR_TARGET.patch
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-9.1/0002-gcc-
> > poison-system-directories.patch
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-9.1/0003-gcc-4.3.3-
> > SYSROOT_CFLAGS_FOR_TARGET.patch
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-9.1/0004-64-bit-
> > multilib-hack.patch
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-9.1/0005-optional-
> > libstdc.patch
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-9.1/0006-gcc-
> > disable-MASK_RELAX_PIC_CALLS-bit.patch
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-9.1/0007-
> > COLLECT_GCC_OPTIONS.patch
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-9.1/0008-Use-the-
> > defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-9.1/0009-fortran-
> > cross-compile-hack.patch
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-9.1/0010-cpp-honor-
> > sysroot.patch
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-9.1/0011-MIPS64-
> > Default-to-N64-ABI.patch
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-9.1/0012-Define-
> > GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-9.1/0013-gcc-Fix-
> > argument-list-too-long-error.patch
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-9.1/0014-Disable-
> > sdt.patch
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-9.1/0015-
> > libtool.patch
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-9.1/0016-gcc-armv4-
> > pass-fix-v4bx-to-linker-to-support-EABI.patch
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-9.1/0017-Use-the-
> > multilib-config-files-from-B-instead-of-usin.patch
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-9.1/0018-Avoid-
> > using-libdir-from-.la-which-usually-points-to-.patch
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-9.1/0019-export-
> > CPP.patch
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-9.1/0020-Ensure-
> > target-gcc-headers-can-be-included.patch
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-9.1/0021-gcc-4.8-
> > won-t-build-with-disable-dependency-tracking.patch
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-9.1/0022-Don-t-
> > search-host-directory-during-relink-if-inst_pr.patch
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-9.1/0023-Use-
> > SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-9.1/0024-aarch64-
> > Add-support-for-musl-ldso.patch
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-9.1/0025-libcc1-
> > fix-libcc1-s-install-path-and-rpath.patch
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-9.1/0026-handle-
> > sysroot-support-for-nativesdk-gcc.patch
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-9.1/0027-Search-
> > target-sysroot-gcc-version-specific-dirs-with.patch
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-9.1/0028-Fix-
> > various-_FOR_BUILD-and-related-variables.patch
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-9.1/0029-nios2-
> > Define-MUSL_DYNAMIC_LINKER.patch
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-9.1/0030-Add-
> > ssp_nonshared-to-link-commandline-for-musl-targe.patch
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-9.1/0031-libgcc-
> > Add-knob-to-use-ldbl-128-on-ppc.patch
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-9.1/0032-Link-
> > libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-9.1/0033-libgcc_s-
> > Use-alias-for-__cpu_indicator_init-instead-.patch
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-9.1/0034-sync-gcc-
> > stddef.h-with-musl.patch
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-9.1/0035-fix-
> > segmentation-fault-in-precompiled-header-generat.patch
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-9.1/0036-Fix-for-
> > testsuite-failure.patch
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-9.1/0037-Re-
> > introduce-spe-commandline-options.patch
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-cross-
> > canadian_9.1.bb
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-cross_9.1.bb
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk_9.1.bb
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-runtime_9.1.bb
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-sanitizers_9.1.bb
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-source_9.1.bb
> >  create mode 100644 meta/recipes-devtools/gcc/gcc_9.1.bb
> >  create mode 100644 meta/recipes-devtools/gcc/libgcc-initial_9.1.bb
> >  create mode 100644 meta/recipes-devtools/gcc/libgcc_9.1.bb
> >  create mode 100644 meta/recipes-devtools/gcc/libgfortran_9.1.bb
> >
> > diff --git a/meta/conf/distro/include/maintainers.inc
> > b/meta/conf/distro/include/maintainers.inc
> > index 6adfcf8980..12207f3118 100644
> > --- a/meta/conf/distro/include/maintainers.inc
> > +++ b/meta/conf/distro/include/maintainers.inc
> > @@ -196,8 +196,8 @@ RECIPE_MAINTAINER_pn-gcc-crosssdk-${SDK_SYS} =
> > "Khem Raj <raj.khem@gmail.com>"
> >  RECIPE_MAINTAINER_pn-gcc-crosssdk-initial-${SDK_SYS} = "Khem Raj <
> > raj.khem@gmail.com>"
> >  RECIPE_MAINTAINER_pn-gcc-runtime = "Khem Raj <raj.khem@gmail.com>"
> >  RECIPE_MAINTAINER_pn-gcc-sanitizers = "Khem Raj <raj.khem@gmail.com>
> > "
> > -RECIPE_MAINTAINER_pn-gcc-source-7.3.0 = "Khem Raj <
> > raj.khem@gmail.com>"
> >  RECIPE_MAINTAINER_pn-gcc-source-8.3.0 = "Khem Raj <
> > raj.khem@gmail.com>"
> > +RECIPE_MAINTAINER_pn-gcc-source-9.1.0 = "Khem Raj <
> > raj.khem@gmail.com>"
> >  RECIPE_MAINTAINER_pn-gccmakedep = "Khem Raj <raj.khem@gmail.com>"
> >  RECIPE_MAINTAINER_pn-gconf = "Ross Burton <ross.burton@intel.com>"
> >  RECIPE_MAINTAINER_pn-gcr = "Alexander Kanavin <
> > alex.kanavin@gmail.com>"
> > diff --git a/meta/recipes-devtools/gcc/gcc-9.1.inc b/meta/recipes-
> > devtools/gcc/gcc-9.1.inc
> > new file mode 100644
> > index 0000000000..eb2538020c
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc-9.1.inc
> > @@ -0,0 +1,118 @@
> > +require gcc-common.inc
> > +
> > +# Third digit in PV should be incremented after a minor release
> > +
> > +PV = "9.1.0"
> > +
> > +# BINV should be incremented to a revision after a minor gcc release
> > +
> > +BINV = "9.1.0"
> > +
> > +FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-9.1:${FILE_DIRNAME}/gcc-
> > 9.1/backport:"
> > +
> > +DEPENDS =+ "mpfr gmp libmpc zlib flex-native"
> > +NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native flex-
> > native"
> > +
> > +LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
> > +
> > +LIC_FILES_CHKSUM = "\
> > +    file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
> > +    file://COPYING3;md5=d32239bcb673463ab874e80d47fae504 \
> > +    file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
> > +    file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
> > +    file://COPYING.RUNTIME;md5=fe60d87048567d4fe8c8a0ed2448bcc8 \
> > +"
> > +
> > +BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
> > +#RELEASE ?= "5a5ca2d"
> > +#BASEURI ?= "
> > https://repo.or.cz/official-gcc.git/snapshot/${RELEASE}.tar.gz;downloadfilename=gcc-${RELEASE}.tar.gz
> > "
> > +SRC_URI = "\
> > +           ${BASEURI} \
> > +           file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
> > +           file://0002-gcc-poison-system-directories.patch \
> > +           file://0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch \
> > +           file://0004-64-bit-multilib-hack.patch \
> > +           file://0005-optional-libstdc.patch \
> > +           file://0006-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch \
> > +           file://0007-COLLECT_GCC_OPTIONS.patch \
> > +           file://0008-Use-the-defaults.h-in-B-instead-of-S-and-t-
> > oe-in-B.patch \
> > +           file://0009-fortran-cross-compile-hack.patch \
> > +           file://0010-cpp-honor-sysroot.patch \
> > +           file://0011-MIPS64-Default-to-N64-ABI.patch \
> > +           file://0012-Define-GLIBC_DYNAMIC_LINKER-and-
> > UCLIBC_DYNAMIC_LINKE.patch \
> > +           file://0013-gcc-Fix-argument-list-too-long-error.patch \
> > +           file://0014-Disable-sdt.patch \
> > +           file://0015-libtool.patch \
> > +           file://0016-gcc-armv4-pass-fix-v4bx-to-linker-to-support-
> > EABI.patch \
> > +           file://0017-Use-the-multilib-config-files-from-B-instead-
> > of-usin.patch \
> > +           file://0018-Avoid-using-libdir-from-.la-which-usually-
> > points-to-.patch \
> > +           file://0019-export-CPP.patch \
> > +           file://0020-Ensure-target-gcc-headers-can-be-
> > included.patch \
> > +           file://0021-gcc-4.8-won-t-build-with-disable-dependency-
> > tracking.patch \
> > +           file://0022-Don-t-search-host-directory-during-relink-if-
> > inst_pr.patch \
> > +           file://0023-Use-SYSTEMLIBS_DIR-replacement-instead-of-
> > hardcoding.patch \
> > +           file://0024-aarch64-Add-support-for-musl-ldso.patch \
> > +           file://0025-libcc1-fix-libcc1-s-install-path-and-
> > rpath.patch \
> > +           file://0026-handle-sysroot-support-for-nativesdk-
> > gcc.patch \
> > +           file://0027-Search-target-sysroot-gcc-version-specific-
> > dirs-with.patch \
> > +           file://0028-Fix-various-_FOR_BUILD-and-related-
> > variables.patch \
> > +           file://0029-nios2-Define-MUSL_DYNAMIC_LINKER.patch \
> > +           file://0030-Add-ssp_nonshared-to-link-commandline-for-
> > musl-targe.patch \
> > +           file://0031-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
> > \
> > +           file://0032-Link-libgcc-using-LDFLAGS-not-just-
> > SHLIB_LDFLAGS.patch \
> > +           file://0033-libgcc_s-Use-alias-for-__cpu_indicator_init-
> > instead-.patch \
> > +           file://0034-sync-gcc-stddef.h-with-musl.patch \
> > +           file://0035-fix-segmentation-fault-in-precompiled-header-
> > generat.patch \
> > +           file://0036-Fix-for-testsuite-failure.patch \
> > +           file://0037-Re-introduce-spe-commandline-options.patch \
> > +"
> > +SRC_URI[md5sum] = "6069ae3737cf02bf2cb44a391ef0e937"
> > +SRC_URI[sha256sum] =
> > "79a66834e96a6050d8fe78db2c3b32fb285b230b855d0a66288235bc04b327a0"
> > +S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
> > +# For dev release snapshotting
> > +#S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/official-gcc-${RELEASE}"
> > +#B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
> > +
> > +# Language Overrides
> > +FORTRAN = ""
> > +JAVA = ""
> > +
> > +LTO = "--enable-lto"
> > +SSP ?= "--disable-libssp"
> > +SSP_mingw32 = "--enable-libssp"
> > +
> > +EXTRA_OECONF_BASE = "\
> > +    ${LTO} \
> > +    ${SSP} \
> > +    --enable-libitm \
> > +    --disable-bootstrap \
> > +    --disable-libmudflap \
> > +    --with-system-zlib \
> > +    ${@'--with-linker-hash-style=${LINKER_HASH_STYLE}' if
> > '${LINKER_HASH_STYLE}' else ''} \
> > +    --enable-linker-build-id \
> > +    --with-ppl=no \
> > +    --with-cloog=no \
> > +    --enable-checking=release \
> > +    --enable-cheaders=c_global \
> > +    --without-isl \
> > +"
> > +
> > +EXTRA_OECONF_INITIAL = "\
> > +    --disable-libmudflap \
> > +    --disable-libgomp \
> > +    --disable-libitm \
> > +    --disable-libquadmath \
> > +    --with-system-zlib \
> > +    --disable-lto \
> > +    --disable-plugin \
> > +    --enable-linker-build-id \
> > +    --enable-decimal-float=no \
> > +    --without-isl \
> > +    --disable-libssp \
> > +"
> > +
> > +EXTRA_OECONF_PATHS = "\
> > +    --with-gxx-include-dir=/not/exist{target_includedir}/c++/${BINV}
> > \
> > +    --with-sysroot=/not/exist \
> > +    --with-build-sysroot=${STAGING_DIR_TARGET} \
> > +"
> > diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0001-gcc-4.3.1-
> > ARCH_FLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc-9.1/0001-
> > gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
> > new file mode 100644
> > index 0000000000..33c910cc53
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc-9.1/0001-gcc-4.3.1-
> > ARCH_FLAGS_FOR_TARGET.patch
> > @@ -0,0 +1,42 @@
> > +From f1f6d84aadc4e3cde707b1ec8490f5dc46d4c8e0 Mon Sep 17 00:00:00
> > 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 08:37:11 +0400
> > +Subject: [PATCH 01/37] gcc-4.3.1: ARCH_FLAGS_FOR_TARGET
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Inappropriate [embedded specific]
> > +---
> > + configure    | 2 +-
> > + configure.ac | 2 +-
> > + 2 files changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/configure b/configure
> > +index adf4fda0f69..8a04eea4c71 100755
> > +--- a/configure
> > ++++ b/configure
> > +@@ -7602,7 +7602,7 @@ fi
> > + # for target_alias and gcc doesn't manage it consistently.
> > + target_configargs="--cache-file=./config.cache
> > ${target_configargs}"
> > +
> > +-FLAGS_FOR_TARGET=
> > ++FLAGS_FOR_TARGET="$ARCH_FLAGS_FOR_TARGET"
> > + case " $target_configdirs " in
> > +  *" newlib "*)
> > +   case " $target_configargs " in
> > +diff --git a/configure.ac b/configure.ac
> > +index 87f2aee0500..01b46b8bed4 100644
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -3118,7 +3118,7 @@ fi
> > + # for target_alias and gcc doesn't manage it consistently.
> > + target_configargs="--cache-file=./config.cache
> > ${target_configargs}"
> > +
> > +-FLAGS_FOR_TARGET=
> > ++FLAGS_FOR_TARGET="$ARCH_FLAGS_FOR_TARGET"
> > + case " $target_configdirs " in
> > +  *" newlib "*)
> > +   case " $target_configargs " in
> > +--
> > +2.20.1
> > +
> > diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0002-gcc-poison-
> > system-directories.patch b/meta/recipes-devtools/gcc/gcc-9.1/0002-
> > gcc-poison-system-directories.patch
> > new file mode 100644
> > index 0000000000..1231567410
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc-9.1/0002-gcc-poison-system-
> > directories.patch
> > @@ -0,0 +1,203 @@
> > +From 733ca3372e4125170d4531bcd33e48eeb36bfec0 Mon Sep 17 00:00:00
> > 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 08:59:00 +0400
> > +Subject: [PATCH 02/37] gcc: poison-system-directories
> > +
> > +Add /sw/include and /opt/include based on the original
> > +zecke-no-host-includes.patch patch.  The original patch checked for
> > +/usr/include, /sw/include and /opt/include and then triggered a
> > failure and
> > +aborted.
> > +
> > +Instead, we add the two missing items to the current scan.  If the
> > user
> > +wants this to be a failure, they can add "-Werror=poison-system-
> > directories".
> > +
> > +Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Pending
> > +---
> > + gcc/common.opt      |  4 ++++
> > + gcc/config.in       |  6 ++++++
> > + gcc/configure       | 16 ++++++++++++++++
> > + gcc/configure.ac    | 10 ++++++++++
> > + gcc/doc/invoke.texi |  9 +++++++++
> > + gcc/gcc.c           |  2 ++
> > + gcc/incpath.c       | 21 +++++++++++++++++++++
> > + 7 files changed, 68 insertions(+)
> > +
> > +diff --git a/gcc/common.opt b/gcc/common.opt
> > +index 9a5e9af06ca..211f2b2260e 100644
> > +--- a/gcc/common.opt
> > ++++ b/gcc/common.opt
> > +@@ -684,6 +684,10 @@ Wreturn-local-addr
> > + Common Var(warn_return_local_addr) Init(1) Warning
> > + Warn about returning a pointer/reference to a local or temporary
> > variable.
> > +
> > ++Wpoison-system-directories
> > ++Common Var(flag_poison_system_directories) Init(1) Warning
> > ++Warn for -I and -L options using system directories if cross
> > compiling
> > ++
> > + Wshadow
> > + Common Var(warn_shadow) Warning
> > + Warn when one variable shadows another.  Same as -Wshadow=global.
> > +diff --git a/gcc/config.in b/gcc/config.in
> > +index 48a533bf208..fc3043bbdfb 100644
> > +--- a/gcc/config.in
> > ++++ b/gcc/config.in
> > +@@ -200,6 +200,12 @@
> > + #endif
> > +
> > +
> > ++/* Define to warn for use of native system header directories */
> > ++#ifndef USED_FOR_TARGET
> > ++#undef ENABLE_POISON_SYSTEM_DIRECTORIES
> > ++#endif
> > ++
> > ++
> > + /* Define if you want all operations on RTL (the basic data
> > structure of the
> > +    optimizer and back end) to be checked for dynamic type safety at
> > runtime.
> > +    This is quite expensive. */
> > +diff --git a/gcc/configure b/gcc/configure
> > +index d6a48ef76e7..2e08396622e 100755
> > +--- a/gcc/configure
> > ++++ b/gcc/configure
> > +@@ -995,6 +995,7 @@ with_system_zlib
> > + enable_maintainer_mode
> > + enable_link_mutex
> > + enable_version_specific_runtime_libs
> > ++enable_poison_system_directories
> > + enable_plugin
> > + enable_host_shared
> > + enable_libquadmath_support
> > +@@ -1748,6 +1749,8 @@ Optional Features:
> > +   --enable-version-specific-runtime-libs
> > +                           specify that runtime libraries should be
> > installed
> > +                           in a compiler-specific directory
> > ++  --enable-poison-system-directories
> > ++                          warn for use of native system header
> > directories
> > +   --enable-plugin         enable plugin support
> > +   --enable-host-shared    build host code as shared libraries
> > +   --disable-libquadmath-support
> > +@@ -29717,6 +29720,19 @@ if test
> > "${enable_version_specific_runtime_libs+set}" = set; then :
> > + fi
> > +
> > +
> > ++# Check whether --enable-poison-system-directories was given.
> > ++if test "${enable_poison_system_directories+set}" = set; then :
> > ++  enableval=$enable_poison_system_directories;
> > ++else
> > ++  enable_poison_system_directories=no
> > ++fi
> > ++
> > ++if test "x${enable_poison_system_directories}" = "xyes"; then
> > ++
> > ++$as_echo "#define ENABLE_POISON_SYSTEM_DIRECTORIES 1" >>confdefs.h
> > ++
> > ++fi
> > ++
> > + # Substitute configuration variables
> > +
> > +
> > +diff --git a/gcc/configure.ac b/gcc/configure.ac
> > +index 78370352938..7d34911573e 100644
> > +--- a/gcc/configure.ac
> > ++++ b/gcc/configure.ac
> > +@@ -6375,6 +6375,16 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
> > +                 [specify that runtime libraries should be
> > +                  installed in a compiler-specific directory])])
> > +
> > ++AC_ARG_ENABLE([poison-system-directories],
> > ++             AS_HELP_STRING([--enable-poison-system-directories],
> > ++                            [warn for use of native system header
> > directories]),,
> > ++             [enable_poison_system_directories=no])
> > ++if test "x${enable_poison_system_directories}" = "xyes"; then
> > ++  AC_DEFINE([ENABLE_POISON_SYSTEM_DIRECTORIES],
> > ++           [1],
> > ++           [Define to warn for use of native system header
> > directories])
> > ++fi
> > ++
> > + # Substitute configuration variables
> > + AC_SUBST(subdirs)
> > + AC_SUBST(srcdir)
> > +diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
> > +index 99fd97404e1..001868e1509 100644
> > +--- a/gcc/doc/invoke.texi
> > ++++ b/gcc/doc/invoke.texi
> > +@@ -330,6 +330,7 @@ Objective-C and Objective-C++ Dialects}.
> > + -Wpacked  -Wpacked-bitfield-compat -Wpacked-not-aligned  -Wpadded
> > @gol
> > + -Wparentheses  -Wno-pedantic-ms-format @gol
> > + -Wplacement-new  -Wplacement-new=@var{n} @gol
> > ++-Wno-poison-system-directories @gol
> > + -Wpointer-arith  -Wpointer-compare  -Wno-pointer-to-int-cast @gol
> > + -Wno-pragmas  -Wno-prio-ctor-dtor  -Wredundant-decls @gol
> > + -Wrestrict  -Wno-return-local-addr @gol
> > +@@ -6254,6 +6255,14 @@ made up of data only and thus requires no
> > special treatment.  But, for
> > + most targets, it is made up of code and thus requires the stack to
> > be
> > + made executable in order for the program to work properly.
> > +
> > ++@item -Wno-poison-system-directories
> > ++@opindex Wno-poison-system-directories
> > ++Do not warn for @option{-I} or @option{-L} options using system
> > ++directories such as @file{/usr/include} when cross compiling.  This
> > ++option is intended for use in chroot environments when such
> > ++directories contain the correct headers and libraries for the
> > target
> > ++system rather than the host.
> > ++
> > + @item -Wfloat-equal
> > + @opindex Wfloat-equal
> > + @opindex Wno-float-equal
> > +diff --git a/gcc/gcc.c b/gcc/gcc.c
> > +index 797ed36616f..79c38d858d1 100644
> > +--- a/gcc/gcc.c
> > ++++ b/gcc/gcc.c
> > +@@ -1042,6 +1042,8 @@ proper position among the other output
> > files.  */
> > +    "%{fuse-ld=*:-fuse-ld=%*} " LINK_COMPRESS_DEBUG_SPEC \
> > +    "%X %{o*} %{e*} %{N} %{n} %{r}\
> > +     %{s} %{t} %{u*} %{z} %{Z}
> > %{!nostdlib:%{!r:%{!nostartfiles:%S}}} \
> > ++    %{Wno-poison-system-directories:--no-poison-system-directories}
> > \
> > ++    %{Werror=poison-system-directories:--error-poison-system-
> > directories} \
> > +     %{static|no-pie|static-pie:} %@{L*} %(mfwrap) %(link_libgcc) "
> > \
> > +     VTABLE_VERIFICATION_SPEC " " SANITIZER_EARLY_SPEC " %o "" \
> > +     %{fopenacc|fopenmp|%:gt(%{ftree-parallelize-loops=*:%*} 1):\
> > +diff --git a/gcc/incpath.c b/gcc/incpath.c
> > +index bcbe2082905..5752298bbf2 100644
> > +--- a/gcc/incpath.c
> > ++++ b/gcc/incpath.c
> > +@@ -26,6 +26,7 @@
> > + #include "intl.h"
> > + #include "incpath.h"
> > + #include "cppdefault.h"
> > ++#include "diagnostic-core.h"
> > +
> > + /* Microsoft Windows does not natively support inodes.
> > +    VMS has non-numeric inodes.  */
> > +@@ -393,6 +394,26 @@ merge_include_chains (const char *sysroot,
> > cpp_reader *pfile, int verbose)
> > +     }
> > +       fprintf (stderr, _("End of search list.\n"));
> > +     }
> > ++
> > ++#ifdef ENABLE_POISON_SYSTEM_DIRECTORIES
> > ++  if (flag_poison_system_directories)
> > ++    {
> > ++       struct cpp_dir *p;
> > ++
> > ++       for (p = heads[INC_QUOTE]; p; p = p->next)
> > ++         {
> > ++          if ((!strncmp (p->name, "/usr/include", 12))
> > ++              || (!strncmp (p->name, "/usr/local/include", 18))
> > ++              || (!strncmp (p->name, "/usr/X11R6/include", 18))
> > ++              || (!strncmp (p->name, "/sw/include", 11))
> > ++              || (!strncmp (p->name, "/opt/include", 12)))
> > ++            warning (OPT_Wpoison_system_directories,
> > ++                     "include location \"%s\" is unsafe for "
> > ++                     "cross-compilation",
> > ++                     p->name);
> > ++         }
> > ++    }
> > ++#endif
> > + }
> > +
> > + /* Use given -I paths for #include "..." but not #include <...>,
> > and
> > +--
> > +2.20.1
> > +
> > diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0003-gcc-4.3.3-
> > SYSROOT_CFLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc-
> > 9.1/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
> > new file mode 100644
> > index 0000000000..916c374e3e
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc-9.1/0003-gcc-4.3.3-
> > SYSROOT_CFLAGS_FOR_TARGET.patch
> > @@ -0,0 +1,73 @@
> > +From 320352cc741c89f1a9b2ee7929193d255e65f27a Mon Sep 17 00:00:00
> > 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:08:31 +0400
> > +Subject: [PATCH 03/37] gcc-4.3.3: SYSROOT_CFLAGS_FOR_TARGET
> > +
> > +Before committing, I noticed that PR/32161 was marked as a dup of
> > PR/32009, but my previous patch did not fix it.
> > +
> > +This alternative patch is better because it lets you just use
> > CFLAGS_FOR_TARGET to set the compilation flags for libgcc. Since
> > bootstrapped target libraries are never compiled with the native
> > compiler, it makes little sense to use different flags for stage1 and
> > later stages. And it also makes little sense to use a different
> > variable than CFLAGS_FOR_TARGET.
> > +
> > +Other changes I had to do include:
> > +
> > +- moving the creation of default CFLAGS_FOR_TARGET from Makefile.am
> > to configure.ac, because otherwise the BOOT_CFLAGS are substituted
> > into CFLAGS_FOR_TARGET (which is "-O2 -g $(CFLAGS)") via $(CFLAGS).
> > It is also cleaner this way though.
> > +
> > +- passing the right CFLAGS to configure scripts as exported
> > environment variables
> > +
> > +I also stopped passing LIBCFLAGS to configure scripts since they are
> > unused in the whole src tree. And I updated the documentation as H-P
> > reminded me to do.
> > +
> > +Bootstrapped/regtested i686-pc-linux-gnu, will commit to 4.4
> > shortly. Ok for 4.3?
> > +
> > +Signed-off-by: Paolo Bonzini  <bonzini@gnu.org>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Pending
> > +---
> > + configure | 32 ++++++++++++++++++++++++++++++++
> > + 1 file changed, 32 insertions(+)
> > +
> > +diff --git a/configure b/configure
> > +index 8a04eea4c71..3b0eed74847 100755
> > +--- a/configure
> > ++++ b/configure
> > +@@ -6863,6 +6863,38 @@ fi
> > +
> > +
> > +
> > ++# During gcc bootstrap, if we use some random cc for stage1 then
> > CFLAGS
> > ++# might be empty or "-g".  We don't require a C++ compiler, so
> > CXXFLAGS
> > ++# might also be empty (or "-g", if a non-GCC C++ compiler is in the
> > path).
> > ++# We want to ensure that TARGET libraries (which we know are built
> > with
> > ++# gcc) are built with "-O2 -g", so include those options when
> > setting
> > ++# CFLAGS_FOR_TARGET and CXXFLAGS_FOR_TARGET.
> > ++if test "x$CFLAGS_FOR_TARGET" = x; then
> > ++  CFLAGS_FOR_TARGET=$CFLAGS
> > ++  case " $CFLAGS " in
> > ++    *" -O2 "*) ;;
> > ++    *) CFLAGS_FOR_TARGET="-O2 $CFLAGS" ;;
> > ++  esac
> > ++  case " $CFLAGS " in
> > ++    *" -g "* | *" -g3 "*) ;;
> > ++    *) CFLAGS_FOR_TARGET="-g $CFLAGS" ;;
> > ++  esac
> > ++fi
> > ++
> > ++
> > ++if test "x$CXXFLAGS_FOR_TARGET" = x; then
> > ++  CXXFLAGS_FOR_TARGET=$CXXFLAGS
> > ++  case " $CXXFLAGS " in
> > ++    *" -O2 "*) ;;
> > ++    *) CXXFLAGS_FOR_TARGET="-O2 $CXXFLAGS" ;;
> > ++  esac
> > ++  case " $CXXFLAGS " in
> > ++    *" -g "* | *" -g3 "*) ;;
> > ++    *) CXXFLAGS_FOR_TARGET="-g $CXXFLAGS" ;;
> > ++  esac
> > ++fi
> > ++
> > ++
> > + # Handle --with-headers=XXX.  If the value is not "yes", the
> > contents of
> > + # the named directory are copied to $(tooldir)/sys-include.
> > + if test x"${with_headers}" != x && test x"${with_headers}" != xno ;
> > then
> > +--
> > +2.20.1
> > +
> > diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0004-64-bit-multilib-
> > hack.patch b/meta/recipes-devtools/gcc/gcc-9.1/0004-64-bit-multilib-
> > hack.patch
> > new file mode 100644
> > index 0000000000..137261b86c
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc-9.1/0004-64-bit-multilib-
> > hack.patch
> > @@ -0,0 +1,119 @@
> > +From 150d946082b3e21614d1cd0eb4752871495fe519 Mon Sep 17 00:00:00
> > 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:10:06 +0400
> > +Subject: [PATCH 04/37] 64-bit multilib hack.
> > +
> > +GCC has internal multilib handling code but it assumes a very
> > specific rigid directory
> > +layout. The build system implementation of multilib layout is very
> > generic and allows
> > +complete customisation of the library directories.
> > +
> > +This patch is a partial solution to allow any custom directories to
> > be passed into gcc
> > +and handled correctly. It forces gcc to use the base_libdir (which
> > is the current
> > +directory, "."). We need to do this for each multilib that is
> > configured as we don't
> > +know which compiler options may be being passed into the compiler.
> > Since we have a compiler
> > +per mulitlib at this point that isn't an issue.
> > +
> > +The one problem is the target compiler is only going to work for the
> > default multlilib at
> > +this point. Ideally we'd figure out which multilibs were being
> > enabled with which paths
> > +and be able to patch these entries with a complete set of correct
> > paths but this we
> > +don't have such code at this point. This is something the target gcc
> > recipe should do
> > +and override these platform defaults in its build config.
> > +
> > +Do same for riscv64 and aarch64
> > +
> > +RP 15/8/11
> > +
> > +Upstream-Status: Inappropriate[OE-Specific]
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
> > +Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> > +---
> > + gcc/config/aarch64/t-aarch64-linux |  8 ++++----
> > + gcc/config/i386/t-linux64          |  6 ++----
> > + gcc/config/mips/t-linux64          | 10 +++-------
> > + gcc/config/riscv/t-linux           |  6 ++++--
> > + gcc/config/rs6000/t-linux64        |  5 ++---
> > + 5 files changed, 15 insertions(+), 20 deletions(-)
> > +
> > +diff --git a/gcc/config/aarch64/t-aarch64-linux
> > b/gcc/config/aarch64/t-aarch64-linux
> > +index 5ad670ba2ce..e26019e7157 100644
> > +--- a/gcc/config/aarch64/t-aarch64-linux
> > ++++ b/gcc/config/aarch64/t-aarch64-linux
> > +@@ -21,8 +21,8 @@
> > + LIB1ASMSRC   = aarch64/lib1funcs.asm
> > + LIB1ASMFUNCS = _aarch64_sync_cache_range
> > +
> > +-AARCH_BE = $(if $(findstring TARGET_BIG_ENDIAN_DEFAULT=1,
> > $(tm_defines)),_be)
> > +-MULTILIB_OSDIRNAMES = mabi.lp64=../lib64$(call
> > if_multiarch,:aarch64$(AARCH_BE)-linux-gnu)
> > +-MULTIARCH_DIRNAME = $(call if_multiarch,aarch64$(AARCH_BE)-linux-
> > gnu)
> > ++#AARCH_BE = $(if $(findstring TARGET_BIG_ENDIAN_DEFAULT=1,
> > $(tm_defines)),_be)
> > ++#MULTILIB_OSDIRNAMES = mabi.lp64=../lib64$(call
> > if_multiarch,:aarch64$(AARCH_BE)-linux-gnu)
> > ++#MULTIARCH_DIRNAME = $(call if_multiarch,aarch64$(AARCH_BE)-linux-
> > gnu)
> > +
> > +-MULTILIB_OSDIRNAMES += mabi.ilp32=../libilp32$(call
> > if_multiarch,:aarch64$(AARCH_BE)-linux-gnu_ilp32)
> > ++#MULTILIB_OSDIRNAMES += mabi.ilp32=../libilp32$(call
> > if_multiarch,:aarch64$(AARCH_BE)-linux-gnu_ilp32)
> > +diff --git a/gcc/config/i386/t-linux64 b/gcc/config/i386/t-linux64
> > +index c686ab2f0d2..c82b60dadcd 100644
> > +--- a/gcc/config/i386/t-linux64
> > ++++ b/gcc/config/i386/t-linux64
> > +@@ -32,7 +32,5 @@
> > + #
> > + comma=,
> > + MULTILIB_OPTIONS    = $(subst $(comma),/,$(TM_MULTILIB_CONFIG))
> > +-MULTILIB_DIRNAMES   = $(patsubst m%, %, $(subst /,
> > ,$(MULTILIB_OPTIONS)))
> > +-MULTILIB_OSDIRNAMES = m64=../lib64$(call if_multiarch,:x86_64-
> > linux-gnu)
> > +-MULTILIB_OSDIRNAMES+= m32=$(if $(wildcard $(shell echo
> > $(SYSTEM_HEADER_DIR))/../../usr/lib32),../lib32,../lib)$(call
> > if_multiarch,:i386-linux-gnu)
> > +-MULTILIB_OSDIRNAMES+= mx32=../libx32$(call if_multiarch,:x86_64-
> > linux-gnux32)
> > ++MULTILIB_DIRNAMES = . .
> > ++MULTILIB_OSDIRNAMES = ../$(shell basename $(base_libdir))
> > ../$(shell basename $(base_libdir))
> > +diff --git a/gcc/config/mips/t-linux64 b/gcc/config/mips/t-linux64
> > +index 3a2ff700d7d..13ef19576b5 100644
> > +--- a/gcc/config/mips/t-linux64
> > ++++ b/gcc/config/mips/t-linux64
> > +@@ -17,10 +17,6 @@
> > + # <http://www.gnu.org/licenses/>;.
> > +
> > + MULTILIB_OPTIONS = mabi=n32/mabi=32/mabi=64
> > +-MULTILIB_DIRNAMES = n32 32 64
> > +-MIPS_EL = $(if $(filter %el, $(firstword $(subst -,
> > ,$(target)))),el)
> > +-MIPS_SOFT = $(if $(strip $(filter MASK_SOFT_FLOAT_ABI,
> > $(target_cpu_default)) $(filter soft, $(with_float))),soft)
> > +-MULTILIB_OSDIRNAMES = \
> > +-    ../lib32$(call if_multiarch,:mips64$(MIPS_EL)-linux-
> > gnuabin32$(MIPS_SOFT)) \
> > +-    ../lib$(call if_multiarch,:mips$(MIPS_EL)-linux-
> > gnu$(MIPS_SOFT)) \
> > +-    ../lib64$(call if_multiarch,:mips64$(MIPS_EL)-linux-
> > gnuabi64$(MIPS_SOFT))
> > ++MULTILIB_DIRNAMES = . . .
> > ++MULTILIB_OSDIRNAMES = ../$(shell basename $(base_libdir))
> > ../$(shell basename $(base_libdir)) ../$(shell basename
> > $(base_libdir))
> > ++
> > +diff --git a/gcc/config/riscv/t-linux b/gcc/config/riscv/t-linux
> > +index 216d2776a18..e4d817621fc 100644
> > +--- a/gcc/config/riscv/t-linux
> > ++++ b/gcc/config/riscv/t-linux
> > +@@ -1,3 +1,5 @@
> > + # Only XLEN and ABI affect Linux multilib dir names, e.g.
> > /lib32/ilp32d/
> > +-MULTILIB_DIRNAMES := $(patsubst rv32%,lib32,$(patsubst
> > rv64%,lib64,$(MULTILIB_DIRNAMES)))
> > +-MULTILIB_OSDIRNAMES := $(patsubst
> > lib%,../lib%,$(MULTILIB_DIRNAMES))
> > ++#MULTILIB_DIRNAMES := $(patsubst rv32%,lib32,$(patsubst
> > rv64%,lib64,$(MULTILIB_DIRNAMES)))
> > ++MULTILIB_DIRNAMES := . .
> > ++#MULTILIB_OSDIRNAMES := $(patsubst
> > lib%,../lib%,$(MULTILIB_DIRNAMES))
> > ++MULTILIB_OSDIRNAMES := ../$(shell basename $(base_libdir))
> > ../$(shell basename $(base_libdir))
> > +diff --git a/gcc/config/rs6000/t-linux64 b/gcc/config/rs6000/t-
> > linux64
> > +index f3c6e2be1d9..bd0393155fa 100644
> > +--- a/gcc/config/rs6000/t-linux64
> > ++++ b/gcc/config/rs6000/t-linux64
> > +@@ -26,10 +26,9 @@
> > + # MULTILIB_OSDIRNAMES according to what is found on the target.
> > +
> > + MULTILIB_OPTIONS    := m64/m32
> > +-MULTILIB_DIRNAMES   := 64 32
> > ++MULTILIB_DIRNAMES   := . .
> > + MULTILIB_EXTRA_OPTS :=
> > +-MULTILIB_OSDIRNAMES := m64=../lib64$(call if_multiarch,:powerpc64-
> > linux-gnu)
> > +-MULTILIB_OSDIRNAMES += m32=$(if $(wildcard $(shell echo
> > $(SYSTEM_HEADER_DIR))/../../usr/lib32),../lib32,../lib)$(call
> > if_multiarch,:powerpc-linux-gnu)
> > ++MULTILIB_OSDIRNAMES := ../$(shell basename $(base_libdir))
> > ../$(shell basename $(base_libdir))
> > +
> > + rs6000-linux.o: $(srcdir)/config/rs6000/rs6000-linux.c
> > +     $(COMPILE) $<
> > +--
> > +2.20.1
> > +
> > diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0005-optional-
> > libstdc.patch b/meta/recipes-devtools/gcc/gcc-9.1/0005-optional-
> > libstdc.patch
> > new file mode 100644
> > index 0000000000..d8e970a1aa
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc-9.1/0005-optional-libstdc.patch
> > @@ -0,0 +1,125 @@
> > +From a3323ea74f0793b35af4a4cdbe5e99fe21e4816b Mon Sep 17 00:00:00
> > 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:12:56 +0400
> > +Subject: [PATCH 05/37] optional libstdc
> > +
> > +gcc-runtime builds libstdc++ separately from gcc-cross-*. Its
> > configure tests using g++
> > +will not run correctly since by default the linker will try to link
> > against libstdc++
> > +which shouldn't exist yet. We need an option to disable -lstdc++
> > +option whilst leaving -lc, -lgcc and other automatic library
> > dependencies added by gcc
> > +driver. This patch adds such an option which only disables the
> > -lstdc++.
> > +
> > +A "standard" gcc build uses xgcc and hence avoids this. We should
> > ask upstream how to
> > +do this officially, the likely answer is don't build libstdc++
> > separately.
> > +
> > +RP 29/6/10
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Inappropriate [embedded specific]
> > +---
> > + gcc/c-family/c.opt  |  4 ++++
> > + gcc/cp/g++spec.c    |  1 +
> > + gcc/doc/invoke.texi | 32 +++++++++++++++++++++++++++++++-
> > + gcc/gcc.c           |  1 +
> > + 4 files changed, 37 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/gcc/c-family/c.opt b/gcc/c-family/c.opt
> > +index 88c72c51c21..a7029592aa3 100644
> > +--- a/gcc/c-family/c.opt
> > ++++ b/gcc/c-family/c.opt
> > +@@ -1948,6 +1948,10 @@ nostdinc++
> > + C++ ObjC++
> > + Do not search standard system include directories for C++.
> > +
> > ++nostdlib++
> > ++Driver
> > ++Do not link standard C++ runtime library
> > ++
> > + o
> > + C ObjC C++ ObjC++ Joined Separate
> > + ; Documented in common.opt
> > +diff --git a/gcc/cp/g++spec.c b/gcc/cp/g++spec.c
> > +index 6c4574a837d..0e2657f00ee 100644
> > +--- a/gcc/cp/g++spec.c
> > ++++ b/gcc/cp/g++spec.c
> > +@@ -137,6 +137,7 @@ lang_specific_driver (struct cl_decoded_option
> > **in_decoded_options,
> > +       switch (decoded_options[i].opt_index)
> > +     {
> > +     case OPT_nostdlib:
> > ++    case OPT_nostdlib__:
> > +     case OPT_nodefaultlibs:
> > +       library = -1;
> > +       break;
> > +diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
> > +index 001868e1509..4186c2616ab 100644
> > +--- a/gcc/doc/invoke.texi
> > ++++ b/gcc/doc/invoke.texi
> > +@@ -226,6 +226,9 @@ in the following sections.
> > + -fno-weak  -nostdinc++ @gol
> > + -fvisibility-inlines-hidden @gol
> > + -fvisibility-ms-compat @gol
> > ++-fvtable-verify=@r{[}std@r{|}preinit@r{|}none@r{]} @gol
> > ++-fvtv-counts -fvtv-debug @gol
> > ++-nostdlib++ @gol
> > + -fext-numeric-literals @gol
> > + -Wabi=@var{n}  -Wabi-tag  -Wconversion-null  -Wctor-dtor-privacy
> > @gol
> > + -Wdelete-non-virtual-dtor  -Wdeprecated-copy  -Wdeprecated-copy-
> > dtor @gol
> > +@@ -536,7 +539,7 @@ Objective-C and Objective-C++ Dialects}.
> > + -pie  -pthread  -r  -rdynamic @gol
> > + -s  -static  -static-pie  -static-libgcc  -static-libstdc++ @gol
> > + -static-libasan  -static-libtsan  -static-liblsan  -static-libubsan
> > @gol
> > +--shared  -shared-libgcc  -symbolic @gol
> > ++-shared  -shared-libgcc  -symbolic -nostdlib++ @gol
> > + -T @var{script}  -Wl,@var{option}  -Xlinker @var{option} @gol
> > + -u @var{symbol}  -z @var{keyword}}
> > +
> > +@@ -13259,6 +13262,33 @@ Specify that the program entry point is
> > @var{entry}.  The argument is
> > + interpreted by the linker; the GNU linker accepts either a symbol
> > name
> > + or an address.
> > +
> > ++@item -nostdlib++
> > ++@opindex nostdlib++
> > ++Do not use the standard system C++ runtime libraries when linking.
> > ++Only the libraries you specify will be passed to the linker.
> > ++
> > ++@cindex @option{-lgcc}, use with @option{-nostdlib}
> > ++@cindex @option{-nostdlib} and unresolved references
> > ++@cindex unresolved references and @option{-nostdlib}
> > ++@cindex @option{-lgcc}, use with @option{-nodefaultlibs}
> > ++@cindex @option{-nodefaultlibs} and unresolved references
> > ++@cindex unresolved references and @option{-nodefaultlibs}
> > ++One of the standard libraries bypassed by @option{-nostdlib} and
> > ++@option{-nodefaultlibs} is @file{libgcc.a}, a library of internal
> > subroutines
> > ++which GCC uses to overcome shortcomings of particular machines, or
> > special
> > ++needs for some languages.
> > ++(@xref{Interface,,Interfacing to GCC Output,gccint,GNU Compiler
> > ++Collection (GCC) Internals},
> > ++for more discussion of @file{libgcc.a}.)
> > ++In most cases, you need @file{libgcc.a} even when you want to avoid
> > ++other standard libraries.  In other words, when you specify
> > @option{-nostdlib}
> > ++or @option{-nodefaultlibs} you should usually specify @option{-
> > lgcc} as well.
> > ++This ensures that you have no unresolved references to internal GCC
> > ++library subroutines.
> > ++(An example of such an internal subroutine is @code{__main}, used
> > to ensure C++
> > ++constructors are called; @pxref{Collect2,,@code{collect2}, gccint,
> > ++GNU Compiler Collection (GCC) Internals}.)
> > ++
> > + @item -pie
> > + @opindex pie
> > + Produce a dynamically linked position independent executable on
> > targets
> > +diff --git a/gcc/gcc.c b/gcc/gcc.c
> > +index 79c38d858d1..308872aef5f 100644
> > +--- a/gcc/gcc.c
> > ++++ b/gcc/gcc.c
> > +@@ -1052,6 +1052,7 @@ proper position among the other output
> > files.  */
> > +     %(mflib) " STACK_SPLIT_SPEC "\
> > +     %{fprofile-arcs|fprofile-generate*|coverage:-lgcov} "
> > SANITIZER_SPEC " \
> > +     %{!nostdlib:%{!r:%{!nodefaultlibs:%(link_ssp)
> > %(link_gcc_c_sequence)}}}\
> > ++    %{!nostdlib++:}\
> > +     %{!nostdlib:%{!r:%{!nostartfiles:%E}}} %{T*}  \n%(post_link)
> > }}}}}}"
> > + #endif
> > +
> > +--
> > +2.20.1
> > +
> > diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0006-gcc-disable-
> > MASK_RELAX_PIC_CALLS-bit.patch b/meta/recipes-devtools/gcc/gcc-
> > 9.1/0006-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
> > new file mode 100644
> > index 0000000000..4a552d5169
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc-9.1/0006-gcc-disable-
> > MASK_RELAX_PIC_CALLS-bit.patch
> > @@ -0,0 +1,59 @@
> > +From ca3b3ac12d9b6e1065333dec89e7be2c733509d9 Mon Sep 17 00:00:00
> > 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:14:20 +0400
> > +Subject: [PATCH 06/37] gcc: disable MASK_RELAX_PIC_CALLS bit
> > +
> > +The new feature added after 4.3.3
> > +"
> > http://www.pubbs.net/200909/gcc/94048-patch-add-support-for-rmipsjalr.html
> > "
> > +will cause cc1plus eat up all the system memory when build webkit-
> > gtk.
> > +The function mips_get_pic_call_symbol keeps on recursively calling
> > itself.
> > +Disable this feature to walk aside the bug.
> > +
> > +Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Inappropriate [configuration]
> > +---
> > + gcc/configure    | 7 -------
> > + gcc/configure.ac | 7 -------
> > + 2 files changed, 14 deletions(-)
> > +
> > +diff --git a/gcc/configure b/gcc/configure
> > +index 2e08396622e..d36cb51bc2c 100755
> > +--- a/gcc/configure
> > ++++ b/gcc/configure
> > +@@ -27509,13 +27509,6 @@ $as_echo_n "checking assembler and linker
> > for explicit JALR relocation... " >&6;
> > +         rm -f conftest.*
> > +       fi
> > +     fi
> > +-    if test $gcc_cv_as_ld_jalr_reloc = yes; then
> > +-      if test x$target_cpu_default = x; then
> > +-        target_cpu_default=MASK_RELAX_PIC_CALLS
> > +-      else
> > +-        target_cpu_default="($target_cpu_default)|MASK_RELAX_PIC_CA
> > LLS"
> > +-      fi
> > +-    fi
> > +     { $as_echo "$as_me:${as_lineno-$LINENO}: result:
> > $gcc_cv_as_ld_jalr_reloc" >&5
> > + $as_echo "$gcc_cv_as_ld_jalr_reloc" >&6; }
> > +
> > +diff --git a/gcc/configure.ac b/gcc/configure.ac
> > +index 7d34911573e..dfa88c35f3f 100644
> > +--- a/gcc/configure.ac
> > ++++ b/gcc/configure.ac
> > +@@ -4816,13 +4816,6 @@ x:
> > +         rm -f conftest.*
> > +       fi
> > +     fi
> > +-    if test $gcc_cv_as_ld_jalr_reloc = yes; then
> > +-      if test x$target_cpu_default = x; then
> > +-        target_cpu_default=MASK_RELAX_PIC_CALLS
> > +-      else
> > +-        target_cpu_default="($target_cpu_default)|MASK_RELAX_PIC_CA
> > LLS"
> > +-      fi
> > +-    fi
> > +     AC_MSG_RESULT($gcc_cv_as_ld_jalr_reloc)
> > +
> > +     AC_CACHE_CHECK([linker for .eh_frame personality relaxation],
> > +--
> > +2.20.1
> > +
> > diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0007-
> > COLLECT_GCC_OPTIONS.patch b/meta/recipes-devtools/gcc/gcc-9.1/0007-
> > COLLECT_GCC_OPTIONS.patch
> > new file mode 100644
> > index 0000000000..a522ada448
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc-9.1/0007-
> > COLLECT_GCC_OPTIONS.patch
> > @@ -0,0 +1,38 @@
> > +From c7b8c2a6e81daaa50047c336c8ee90086aa4d4d5 Mon Sep 17 00:00:00
> > 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:16:28 +0400
> > +Subject: [PATCH 07/37] COLLECT_GCC_OPTIONS
> > +
> > +This patch adds --sysroot into COLLECT_GCC_OPTIONS which is used to
> > +invoke collect2.
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Pending
> > +---
> > + gcc/gcc.c | 9 +++++++++
> > + 1 file changed, 9 insertions(+)
> > +
> > +diff --git a/gcc/gcc.c b/gcc/gcc.c
> > +index 308872aef5f..30845e5b125 100644
> > +--- a/gcc/gcc.c
> > ++++ b/gcc/gcc.c
> > +@@ -4804,6 +4804,15 @@ set_collect_gcc_options (void)
> > +             sizeof ("COLLECT_GCC_OPTIONS=") - 1);
> > +
> > +   first_time = TRUE;
> > ++#ifdef HAVE_LD_SYSROOT
> > ++  if (target_system_root_changed && target_system_root)
> > ++    {
> > ++      obstack_grow (&collect_obstack, "'--sysroot=", sizeof("'
> > --sysroot=")-1);
> > ++      obstack_grow (&collect_obstack,
> > target_system_root,strlen(target_system_root));
> > ++      obstack_grow (&collect_obstack, "'", 1);
> > ++      first_time = FALSE;
> > ++    }
> > ++#endif
> > +   for (i = 0; (int) i < n_switches; i++)
> > +     {
> > +       const char *const *args;
> > +--
> > +2.20.1
> > +
> > diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0008-Use-the-
> > defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch b/meta/recipes-
> > devtools/gcc/gcc-9.1/0008-Use-the-defaults.h-in-B-instead-of-S-and-t-
> > oe-in-B.patch
> > new file mode 100644
> > index 0000000000..2ef94a0b85
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc-9.1/0008-Use-the-defaults.h-in-B-
> > instead-of-S-and-t-oe-in-B.patch
> > @@ -0,0 +1,96 @@
> > +From 2f65b8bbf9c7c4bc0b94bb7ba9f6a8eb8675c9ab Mon Sep 17 00:00:00
> > 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:17:25 +0400
> > +Subject: [PATCH 08/37] Use the defaults.h in ${B} instead of ${S},
> > and t-oe in
> > + ${B}
> > +
> > +Use the defaults.h in ${B} instead of ${S}, and t-oe in ${B}, so
> > that
> > +the source can be shared between gcc-cross-initial,
> > +gcc-cross-intermediate, gcc-cross, gcc-runtime, and also the sdk
> > build.
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Pending
> > +
> > +While compiling gcc-crosssdk-initial-x86_64 on some host, there is
> > +occasionally failure that test the existance of default.h doesn't
> > +work, the reason is tm_include_list='** defaults.h' rather than
> > +tm_include_list='** ./defaults.h'
> > +
> > +So we add the test condition for this situation.
> > +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > +---
> > + gcc/Makefile.in  | 2 +-
> > + gcc/configure    | 4 ++--
> > + gcc/configure.ac | 4 ++--
> > + gcc/mkconfig.sh  | 4 ++--
> > + 4 files changed, 7 insertions(+), 7 deletions(-)
> > +
> > +diff --git a/gcc/Makefile.in b/gcc/Makefile.in
> > +index 508c674cbdc..3ccff1614bb 100644
> > +--- a/gcc/Makefile.in
> > ++++ b/gcc/Makefile.in
> > +@@ -540,7 +540,7 @@ TARGET_SYSTEM_ROOT = @TARGET_SYSTEM_ROOT@
> > + TARGET_SYSTEM_ROOT_DEFINE = @TARGET_SYSTEM_ROOT_DEFINE@
> > +
> > + xmake_file=@xmake_file@
> > +-tmake_file=@tmake_file@
> > ++tmake_file=@tmake_file@ ./t-oe
> > + TM_ENDIAN_CONFIG=@TM_ENDIAN_CONFIG@
> > + TM_MULTILIB_CONFIG=@TM_MULTILIB_CONFIG@
> > + TM_MULTILIB_EXCEPTIONS_CONFIG=@TM_MULTILIB_EXCEPTIONS_CONFIG@
> > +diff --git a/gcc/configure b/gcc/configure
> > +index d36cb51bc2c..7acc7e487b0 100755
> > +--- a/gcc/configure
> > ++++ b/gcc/configure
> > +@@ -12341,8 +12341,8 @@ for f in $tm_file; do
> > +        tm_include_list="${tm_include_list} $f"
> > +        ;;
> > +     defaults.h )
> > +-       tm_file_list="${tm_file_list} \$(srcdir)/$f"
> > +-       tm_include_list="${tm_include_list} $f"
> > ++       tm_file_list="${tm_file_list} ./$f"
> > ++       tm_include_list="${tm_include_list} ./$f"
> > +        ;;
> > +     * )
> > +        tm_file_list="${tm_file_list} \$(srcdir)/config/$f"
> > +diff --git a/gcc/configure.ac b/gcc/configure.ac
> > +index dfa88c35f3f..f5d5e5c16a8 100644
> > +--- a/gcc/configure.ac
> > ++++ b/gcc/configure.ac
> > +@@ -1968,8 +1968,8 @@ for f in $tm_file; do
> > +        tm_include_list="${tm_include_list} $f"
> > +        ;;
> > +     defaults.h )
> > +-       tm_file_list="${tm_file_list} \$(srcdir)/$f"
> > +-       tm_include_list="${tm_include_list} $f"
> > ++       tm_file_list="${tm_file_list} ./$f"
> > ++       tm_include_list="${tm_include_list} ./$f"
> > +        ;;
> > +     * )
> > +        tm_file_list="${tm_file_list} \$(srcdir)/config/$f"
> > +diff --git a/gcc/mkconfig.sh b/gcc/mkconfig.sh
> > +index 308b87d0cc1..19068cbc24a 100644
> > +--- a/gcc/mkconfig.sh
> > ++++ b/gcc/mkconfig.sh
> > +@@ -77,7 +77,7 @@ if [ -n "$HEADERS" ]; then
> > +     if [ $# -ge 1 ]; then
> > +     echo '#ifdef IN_GCC' >> ${output}T
> > +     for file in "$@"; do
> > +-        if test x"$file" = x"defaults.h"; then
> > ++        if test x"$file" = x"./defaults.h" -o x"$file" =
> > x"defaults.h"; then
> > +             postpone_defaults_h="yes"
> > +         else
> > +             echo "# include \"$file\"" >> ${output}T
> > +@@ -106,7 +106,7 @@ esac
> > +
> > + # If we postponed including defaults.h, add the #include now.
> > + if test x"$postpone_defaults_h" = x"yes"; then
> > +-    echo "# include \"defaults.h\"" >> ${output}T
> > ++    echo "# include \"./defaults.h\"" >> ${output}T
> > + fi
> > +
> > + # Add multiple inclusion protection guard, part two.
> > +--
> > +2.20.1
> > +
> > diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0009-fortran-cross-
> > compile-hack.patch b/meta/recipes-devtools/gcc/gcc-9.1/0009-fortran-
> > cross-compile-hack.patch
> > new file mode 100644
> > index 0000000000..7959714636
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc-9.1/0009-fortran-cross-compile-
> > hack.patch
> > @@ -0,0 +1,46 @@
> > +From eda94df7d2389b6c36428e5687d5f0722d3375c3 Mon Sep 17 00:00:00
> > 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:20:01 +0400
> > +Subject: [PATCH 09/37] fortran cross-compile hack.
> > +
> > +* Fortran would have searched for arm-angstrom-gnueabi-gfortran but
> > would have used
> > +used gfortan. For gcc_4.2.2.bb we want to use the gfortran compiler
> > from our cross
> > +directory.
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Inappropriate [embedded specific]
> > +---
> > + libgfortran/configure    | 2 +-
> > + libgfortran/configure.ac | 2 +-
> > + 2 files changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/libgfortran/configure b/libgfortran/configure
> > +index 487d8c090e2..a02b49293ac 100755
> > +--- a/libgfortran/configure
> > ++++ b/libgfortran/configure
> > +@@ -13056,7 +13056,7 @@ esac
> > +
> > + # We need gfortran to compile parts of the library
> > + #AC_PROG_FC(gfortran)
> > +-FC="$GFORTRAN"
> > ++#FC="$GFORTRAN"
> > + ac_ext=${ac_fc_srcext-f}
> > + ac_compile='$FC -c $FCFLAGS $ac_fcflags_srcext conftest.$ac_ext
> > >&5'
> > + ac_link='$FC -o conftest$ac_exeext $FCFLAGS $LDFLAGS
> > $ac_fcflags_srcext conftest.$ac_ext $LIBS >&5'
> > +diff --git a/libgfortran/configure.ac b/libgfortran/configure.ac
> > +index c06db7b1a78..5b4b1b7f1f2 100644
> > +--- a/libgfortran/configure.ac
> > ++++ b/libgfortran/configure.ac
> > +@@ -250,7 +250,7 @@ AC_SUBST(enable_static)
> > +
> > + # We need gfortran to compile parts of the library
> > + #AC_PROG_FC(gfortran)
> > +-FC="$GFORTRAN"
> > ++#FC="$GFORTRAN"
> > + AC_PROG_FC(gfortran)
> > +
> > + # extra LD Flags which are required for targets
> > +--
> > +2.20.1
> > +
> > diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0010-cpp-honor-
> > sysroot.patch b/meta/recipes-devtools/gcc/gcc-9.1/0010-cpp-honor-
> > sysroot.patch
> > new file mode 100644
> > index 0000000000..b680e6fc38
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc-9.1/0010-cpp-honor-sysroot.patch
> > @@ -0,0 +1,54 @@
> > +From c2ec131f19d656fd916c45f51186633c789db6e9 Mon Sep 17 00:00:00
> > 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:22:00 +0400
> > +Subject: [PATCH 10/37] cpp: honor sysroot.
> > +
> > +Currently, if the gcc toolchain is relocated and installed from
> > sstate, then you try and compile
> > +preprocessed source (.i or .ii files), the compiler will try and
> > access the builtin sysroot location
> > +rather than the --sysroot option specified on the commandline. If
> > access to that directory is
> > +permission denied (unreadable), gcc will error.
> > +
> > +This happens when ccache is in use due to the fact it uses
> > preprocessed source files.
> > +
> > +The fix below adds %I to the cpp-output spec macro so the default
> > substitutions for -iprefix,
> > +-isystem, -isysroot happen and the correct sysroot is used.
> > +
> > +[YOCTO #2074]
> > +
> > +RP 2012/04/13
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Pending
> > +---
> > + gcc/cp/lang-specs.h | 2 +-
> > + gcc/gcc.c           | 2 +-
> > + 2 files changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/gcc/cp/lang-specs.h b/gcc/cp/lang-specs.h
> > +index c6e42eda283..e1ddf066467 100644
> > +--- a/gcc/cp/lang-specs.h
> > ++++ b/gcc/cp/lang-specs.h
> > +@@ -66,5 +66,5 @@ along with GCC; see the file COPYING3.  If not see
> > +   {".ii", "@c++-cpp-output", 0, 0, 0},
> > +   {"@c++-cpp-output",
> > +       "%{!E:%{!M:%{!MM:"
> > +-      "  cc1plus -fpreprocessed %i %(cc1_options) %2"
> > ++      "  cc1plus -fpreprocessed %i %I %(cc1_options) %2"
> > +       "  %{!fsyntax-only:%(invoke_as)}}}}", 0, 0, 0},
> > +diff --git a/gcc/gcc.c b/gcc/gcc.c
> > +index 30845e5b125..cef26c454d7 100644
> > +--- a/gcc/gcc.c
> > ++++ b/gcc/gcc.c
> > +@@ -1349,7 +1349,7 @@ static const struct compiler
> > default_compilers[] =
> > +                                        %W{o*:--output-
> > pch=%*}}%V}}}}}}}", 0, 0, 0},
> > +   {".i", "@cpp-output", 0, 0, 0},
> > +   {"@cpp-output",
> > +-   "%{!M:%{!MM:%{!E:cc1 -fpreprocessed %i %(cc1_options)
> > %{!fsyntax-only:%(invoke_as)}}}}", 0, 0, 0},
> > ++   "%{!M:%{!MM:%{!E:cc1 -fpreprocessed %i %I %(cc1_options)
> > %{!fsyntax-only:%(invoke_as)}}}}", 0, 0, 0},
> > +   {".s", "@assembler", 0, 0, 0},
> > +   {"@assembler",
> > +    "%{!M:%{!MM:%{!E:%{!S:as %(asm_debug) %(asm_options) %i %A
> > }}}}", 0, 0, 0},
> > +--
> > +2.20.1
> > +
> > diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0011-MIPS64-Default-
> > to-N64-ABI.patch b/meta/recipes-devtools/gcc/gcc-9.1/0011-MIPS64-
> > Default-to-N64-ABI.patch
> > new file mode 100644
> > index 0000000000..d59a31be10
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc-9.1/0011-MIPS64-Default-to-N64-
> > ABI.patch
> > @@ -0,0 +1,57 @@
> > +From 52b915732de89d8676868641af462df81211bb39 Mon Sep 17 00:00:00
> > 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:23:08 +0400
> > +Subject: [PATCH 11/37] MIPS64: Default to N64 ABI
> > +
> > +MIPS64 defaults to n32 ABI, this patch makes it
> > +so that it defaults to N64 ABI
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Inappropriate [OE config specific]
> > +---
> > + gcc/config.gcc | 10 +++++-----
> > + 1 file changed, 5 insertions(+), 5 deletions(-)
> > +
> > +diff --git a/gcc/config.gcc b/gcc/config.gcc
> > +index a189cb19f63..293ed8d585d 100644
> > +--- a/gcc/config.gcc
> > ++++ b/gcc/config.gcc
> > +@@ -2267,29 +2267,29 @@ mips*-*-linux*)
> > # Linux MIPS, either endian.
> > +                     default_mips_arch=mips32
> > +                     ;;
> > +             mips64el-st-linux-gnu)
> > +-                    default_mips_abi=n32
> > ++                    default_mips_abi=64
> > +                     tm_file="${tm_file} mips/st.h"
> > +                     tmake_file="${tmake_file} mips/t-st"
> > +                     enable_mips_multilibs="yes"
> > +                     ;;
> > +             mips64octeon*-*-linux*)
> > +-                    default_mips_abi=n32
> > ++                    default_mips_abi=64
> > +                     tm_defines="${tm_defines}
> > MIPS_CPU_STRING_DEFAULT=\\\"octeon\\\""
> > +                     target_cpu_default=MASK_SOFT_FLOAT_ABI
> > +                     enable_mips_multilibs="yes"
> > +                     ;;
> > +             mipsisa64r6*-*-linux*)
> > +-                    default_mips_abi=n32
> > ++                    default_mips_abi=64
> > +                     default_mips_arch=mips64r6
> > +                     enable_mips_multilibs="yes"
> > +                     ;;
> > +             mipsisa64r2*-*-linux*)
> > +-                    default_mips_abi=n32
> > ++                    default_mips_abi=64
> > +                     default_mips_arch=mips64r2
> > +                     enable_mips_multilibs="yes"
> > +                     ;;
> > +             mips64*-*-linux* | mipsisa64*-*-linux*)
> > +-                    default_mips_abi=n32
> > ++                    default_mips_abi=64
> > +                     enable_mips_multilibs="yes"
> > +                     ;;
> > +     esac
> > +--
> > +2.20.1
> > +
> > diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0012-Define-
> > GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-
> > devtools/gcc/gcc-9.1/0012-Define-GLIBC_DYNAMIC_LINKER-and-
> > UCLIBC_DYNAMIC_LINKE.patch
> > new file mode 100644
> > index 0000000000..f23a314c13
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc-9.1/0012-Define-
> > GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> > @@ -0,0 +1,232 @@
> > +From 492f008dce784749e39e1c396aeea6fa1d977374 Mon Sep 17 00:00:00
> > 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:24:50 +0400
> > +Subject: [PATCH 12/37] Define GLIBC_DYNAMIC_LINKER and
> > UCLIBC_DYNAMIC_LINKER
> > + relative to SYSTEMLIBS_DIR
> > +
> > +This patch defines GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
> > +relative to SYSTEMLIBS_DIR which can be set in generated headers
> > +This breaks the assumption of hardcoded multilib in gcc
> > +Change is only for the supported architectures in OE including
> > +SH, sparc, alpha for possible future support (if any)
> > +
> > +Removes the do_headerfix task in metadata
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Inappropriate [OE configuration]
> > +---
> > + gcc/config/alpha/linux-elf.h |  4 ++--
> > + gcc/config/arm/linux-eabi.h  |  4 ++--
> > + gcc/config/arm/linux-elf.h   |  2 +-
> > + gcc/config/i386/linux.h      |  2 +-
> > + gcc/config/i386/linux64.h    |  6 +++---
> > + gcc/config/linux.h           |  8 ++++----
> > + gcc/config/mips/linux.h      | 12 ++++++------
> > + gcc/config/rs6000/linux64.h  | 15 +++++----------
> > + gcc/config/sh/linux.h        |  2 +-
> > + gcc/config/sparc/linux.h     |  2 +-
> > + gcc/config/sparc/linux64.h   |  4 ++--
> > + 11 files changed, 28 insertions(+), 33 deletions(-)
> > +
> > +diff --git a/gcc/config/alpha/linux-elf.h b/gcc/config/alpha/linux-
> > elf.h
> > +index 824861befec..6afacce3292 100644
> > +--- a/gcc/config/alpha/linux-elf.h
> > ++++ b/gcc/config/alpha/linux-elf.h
> > +@@ -23,8 +23,8 @@ along with GCC; see the file COPYING3.  If not see
> > + #define EXTRA_SPECS \
> > + { "elf_dynamic_linker", ELF_DYNAMIC_LINKER },
> > +
> > +-#define GLIBC_DYNAMIC_LINKER        "/lib/ld-linux.so.2"
> > +-#define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
> > ++#define GLIBC_DYNAMIC_LINKER        SYSTEMLIBS_DIR "ld-linux.so.2"
> > ++#define UCLIBC_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-uClibc.so.0"
> > + #if DEFAULT_LIBC == LIBC_UCLIBC
> > + #define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
> > + #elif DEFAULT_LIBC == LIBC_GLIBC
> > +diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-
> > eabi.h
> > +index 66ec0ea3980..e4ade2e2ab0 100644
> > +--- a/gcc/config/arm/linux-eabi.h
> > ++++ b/gcc/config/arm/linux-eabi.h
> > +@@ -65,8 +65,8 @@
> > +    GLIBC_DYNAMIC_LINKER_DEFAULT and TARGET_DEFAULT_FLOAT_ABI.  */
> > +
> > + #undef  GLIBC_DYNAMIC_LINKER
> > +-#define GLIBC_DYNAMIC_LINKER_SOFT_FLOAT "/lib/ld-linux.so.3"
> > +-#define GLIBC_DYNAMIC_LINKER_HARD_FLOAT "/lib/ld-linux-armhf.so.3"
> > ++#define GLIBC_DYNAMIC_LINKER_SOFT_FLOAT SYSTEMLIBS_DIR "ld-
> > linux.so.3"
> > ++#define GLIBC_DYNAMIC_LINKER_HARD_FLOAT SYSTEMLIBS_DIR "ld-linux-
> > armhf.so.3"
> > + #define GLIBC_DYNAMIC_LINKER_DEFAULT
> > GLIBC_DYNAMIC_LINKER_SOFT_FLOAT
> > +
> > + #define GLIBC_DYNAMIC_LINKER \
> > +diff --git a/gcc/config/arm/linux-elf.h b/gcc/config/arm/linux-elf.h
> > +index 9a360defd21..98f6e960b64 100644
> > +--- a/gcc/config/arm/linux-elf.h
> > ++++ b/gcc/config/arm/linux-elf.h
> > +@@ -60,7 +60,7 @@
> > +
> > + #define LIBGCC_SPEC "%{mfloat-abi=soft*:-lfloat} -lgcc"
> > +
> > +-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
> > ++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
> > +
> > + #define LINUX_TARGET_LINK_SPEC  "%{h*} \
> > +    %{static:-Bstatic} \
> > +diff --git a/gcc/config/i386/linux.h b/gcc/config/i386/linux.h
> > +index 9a6e2d99896..31efbb73016 100644
> > +--- a/gcc/config/i386/linux.h
> > ++++ b/gcc/config/i386/linux.h
> > +@@ -20,7 +20,7 @@ along with GCC; see the file COPYING3.  If not see
> > + <http://www.gnu.org/licenses/>;.  */
> > +
> > + #define GNU_USER_LINK_EMULATION "elf_i386"
> > +-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
> > ++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
> > +
> > + #undef MUSL_DYNAMIC_LINKER
> > + #define MUSL_DYNAMIC_LINKER "/lib/ld-musl-i386.so.1"
> > +diff --git a/gcc/config/i386/linux64.h b/gcc/config/i386/linux64.h
> > +index c08221c4210..dbb474d792b 100644
> > +--- a/gcc/config/i386/linux64.h
> > ++++ b/gcc/config/i386/linux64.h
> > +@@ -27,9 +27,9 @@ see the files COPYING3 and COPYING.RUNTIME
> > respectively.  If not, see
> > + #define GNU_USER_LINK_EMULATION64 "elf_x86_64"
> > + #define GNU_USER_LINK_EMULATIONX32 "elf32_x86_64"
> > +
> > +-#define GLIBC_DYNAMIC_LINKER32 "/lib/ld-linux.so.2"
> > +-#define GLIBC_DYNAMIC_LINKER64 "/lib64/ld-linux-x86-64.so.2"
> > +-#define GLIBC_DYNAMIC_LINKERX32 "/libx32/ld-linux-x32.so.2"
> > ++#define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-linux.so.2"
> > ++#define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-linux-x86-
> > 64.so.2"
> > ++#define GLIBC_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR "ld-linux-x32.so.2"
> > +
> > + #undef MUSL_DYNAMIC_LINKER32
> > + #define MUSL_DYNAMIC_LINKER32 "/lib/ld-musl-i386.so.1"
> > +diff --git a/gcc/config/linux.h b/gcc/config/linux.h
> > +index c3c4a219e67..4b05d8e93d1 100644
> > +--- a/gcc/config/linux.h
> > ++++ b/gcc/config/linux.h
> > +@@ -94,10 +94,10 @@ see the files COPYING3 and COPYING.RUNTIME
> > respectively.  If not, see
> > +    GLIBC_DYNAMIC_LINKER must be defined for each target using them,
> > or
> > +    GLIBC_DYNAMIC_LINKER32 and GLIBC_DYNAMIC_LINKER64 for targets
> > +    supporting both 32-bit and 64-bit compilation.  */
> > +-#define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
> > +-#define UCLIBC_DYNAMIC_LINKER32 "/lib/ld-uClibc.so.0"
> > +-#define UCLIBC_DYNAMIC_LINKER64 "/lib/ld64-uClibc.so.0"
> > +-#define UCLIBC_DYNAMIC_LINKERX32 "/lib/ldx32-uClibc.so.0"
> > ++#define UCLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-uClibc.so.0"
> > ++#define UCLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-uClibc.so.0"
> > ++#define UCLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld64-uClibc.so.0"
> > ++#define UCLIBC_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR "ldx32-uClibc.so.0"
> > + #define BIONIC_DYNAMIC_LINKER "/system/bin/linker"
> > + #define BIONIC_DYNAMIC_LINKER32 "/system/bin/linker"
> > + #define BIONIC_DYNAMIC_LINKER64 "/system/bin/linker64"
> > +diff --git a/gcc/config/mips/linux.h b/gcc/config/mips/linux.h
> > +index 6f79ac9c01a..25de96f9561 100644
> > +--- a/gcc/config/mips/linux.h
> > ++++ b/gcc/config/mips/linux.h
> > +@@ -22,20 +22,20 @@ along with GCC; see the file COPYING3.  If not
> > see
> > + #define GNU_USER_LINK_EMULATIONN32 "elf32%{EB:b}%{EL:l}tsmipn32"
> > +
> > + #define GLIBC_DYNAMIC_LINKER32 \
> > +-  "%{mnan=2008:/lib/ld-linux-mipsn8.so.1;:/lib/ld.so.1}"
> > ++  "%{mnan=2008:" SYSTEMLIBS_DIR "ld-linux-mipsn8.so.1;:"
> > SYSTEMLIBS_DIR "ld.so.1}"
> > + #define GLIBC_DYNAMIC_LINKER64 \
> > +-  "%{mnan=2008:/lib64/ld-linux-mipsn8.so.1;:/lib64/ld.so.1}"
> > ++  "%{mnan=2008:" SYSTEMLIBS_DIR "ld-linux-mipsn8.so.1;:"
> > SYSTEMLIBS_DIR "ld.so.1}"
> > + #define GLIBC_DYNAMIC_LINKERN32 \
> > +-  "%{mnan=2008:/lib32/ld-linux-mipsn8.so.1;:/lib32/ld.so.1}"
> > ++  "%{mnan=2008:" SYSTEMLIBS_DIR "ld-linux-mipsn8.so.1;:"
> > SYSTEMLIBS_DIR "ld.so.1}"
> > +
> > + #undef UCLIBC_DYNAMIC_LINKER32
> > + #define UCLIBC_DYNAMIC_LINKER32 \
> > +-  "%{mnan=2008:/lib/ld-uClibc-mipsn8.so.0;:/lib/ld-uClibc.so.0}"
> > ++  "%{mnan=2008:" SYSTEMLIBS_DIR "ld-uClibc-mipsn8.so.0;:"
> > SYSTEMLIBS_DIR "ld-uClibc.so.0}"
> > + #undef UCLIBC_DYNAMIC_LINKER64
> > + #define UCLIBC_DYNAMIC_LINKER64 \
> > +-  "%{mnan=2008:/lib/ld64-uClibc-mipsn8.so.0;:/lib/ld64-
> > uClibc.so.0}"
> > ++  "%{mnan=2008:" SYSTEMLIBS_DIR "ld64-uClibc-mipsn8.so.0;:"
> > SYSTEMLIBS_DIR "ld64-uClibc.so.0}"
> > + #define UCLIBC_DYNAMIC_LINKERN32 \
> > +-  "%{mnan=2008:/lib32/ld-uClibc-mipsn8.so.0;:/lib32/ld-
> > uClibc.so.0}"
> > ++  "%{mnan=2008:" SYSTEMLIBS_DIR "ld-uClibc-mipsn8.so.0;:"
> > SYSTEMLIBS_DIR "ld-uClibc.so.0}"
> > +
> > + #undef MUSL_DYNAMIC_LINKER32
> > + #define MUSL_DYNAMIC_LINKER32 \
> > +diff --git a/gcc/config/rs6000/linux64.h
> > b/gcc/config/rs6000/linux64.h
> > +index bcc540b5ff2..982ca274621 100644
> > +--- a/gcc/config/rs6000/linux64.h
> > ++++ b/gcc/config/rs6000/linux64.h
> > +@@ -428,24 +428,19 @@ extern int dot_symbols;
> > + #undef      LINK_OS_DEFAULT_SPEC
> > + #define LINK_OS_DEFAULT_SPEC "%(link_os_linux)"
> > +
> > +-#define GLIBC_DYNAMIC_LINKER32
> > "%(dynamic_linker_prefix)/lib/ld.so.1"
> > +-
> > ++#define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld.so.1"
> > + #ifdef LINUX64_DEFAULT_ABI_ELFv2
> > +-#define GLIBC_DYNAMIC_LINKER64 \
> > +-"%{mabi=elfv1:%(dynamic_linker_prefix)/lib64/ld64.so.1;" \
> > +-":%(dynamic_linker_prefix)/lib64/ld64.so.2}"
> > ++#define GLIBC_DYNAMIC_LINKER64 "%{mabi=elfv1:" SYSTEMLIBS_DIR
> > "ld64.so.1;:" SYSTEMLIBS_DIR "ld64.so.2}"
> > + #else
> > +-#define GLIBC_DYNAMIC_LINKER64 \
> > +-"%{mabi=elfv2:%(dynamic_linker_prefix)/lib64/ld64.so.2;" \
> > +-":%(dynamic_linker_prefix)/lib64/ld64.so.1}"
> > ++#define GLIBC_DYNAMIC_LINKER64 "%{mabi=elfv2:" SYSTEMLIBS_DIR
> > "ld64.so.2;:" SYSTEMLIBS_DIR "ld64.so.1}"
> > + #endif
> > +
> > + #undef MUSL_DYNAMIC_LINKER32
> > + #define MUSL_DYNAMIC_LINKER32 \
> > +-  "/lib/ld-musl-powerpc" MUSL_DYNAMIC_LINKER_E "%{msoft-float:-
> > sf}.so.1"
> > ++  SYSTEMLIBS_DIR "ld-musl-powerpc" MUSL_DYNAMIC_LINKER_E "%{msoft-
> > float:-sf}.so.1"
> > + #undef MUSL_DYNAMIC_LINKER64
> > + #define MUSL_DYNAMIC_LINKER64 \
> > +-  "/lib/ld-musl-powerpc64" MUSL_DYNAMIC_LINKER_E "%{msoft-float:-
> > sf}.so.1"
> > ++  SYSTEMLIBS_DIR "ld-musl-powerpc64" MUSL_DYNAMIC_LINKER_E
> > "%{msoft-float:-sf}.so.1"
> > +
> > + #undef  DEFAULT_ASM_ENDIAN
> > + #if (TARGET_DEFAULT & MASK_LITTLE_ENDIAN)
> > +diff --git a/gcc/config/sh/linux.h b/gcc/config/sh/linux.h
> > +index c9897b7aca5..82f275319cc 100644
> > +--- a/gcc/config/sh/linux.h
> > ++++ b/gcc/config/sh/linux.h
> > +@@ -64,7 +64,7 @@ along with GCC; see the file COPYING3.  If not see
> > +   "/lib/ld-musl-sh" MUSL_DYNAMIC_LINKER_E MUSL_DYNAMIC_LINKER_FP \
> > +   "%{mfdpic:-fdpic}.so.1"
> > +
> > +-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
> > ++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
> > +
> > + #undef SUBTARGET_LINK_EMUL_SUFFIX
> > + #define SUBTARGET_LINK_EMUL_SUFFIX "%{mfdpic:_fd;:_linux}"
> > +diff --git a/gcc/config/sparc/linux.h b/gcc/config/sparc/linux.h
> > +index 2db9ea2172e..1979cfff5d3 100644
> > +--- a/gcc/config/sparc/linux.h
> > ++++ b/gcc/config/sparc/linux.h
> > +@@ -83,7 +83,7 @@ extern const char *host_detect_local_cpu (int
> > argc, const char **argv);
> > +    When the -shared link option is used a final link is not being
> > +    done.  */
> > +
> > +-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
> > ++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
> > +
> > + #undef  LINK_SPEC
> > + #define LINK_SPEC "-m elf32_sparc %{shared:-shared} \
> > +diff --git a/gcc/config/sparc/linux64.h b/gcc/config/sparc/linux64.h
> > +index 21e13001951..d39c38a531f 100644
> > +--- a/gcc/config/sparc/linux64.h
> > ++++ b/gcc/config/sparc/linux64.h
> > +@@ -84,8 +84,8 @@ along with GCC; see the file COPYING3.  If not see
> > +    When the -shared link option is used a final link is not being
> > +    done.  */
> > +
> > +-#define GLIBC_DYNAMIC_LINKER32 "/lib/ld-linux.so.2"
> > +-#define GLIBC_DYNAMIC_LINKER64 "/lib64/ld-linux.so.2"
> > ++#define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-linux.so.2"
> > ++#define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-linux.so.2"
> > +
> > + #ifdef SPARC_BI_ARCH
> > +
> > +--
> > +2.20.1
> > +
> > diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0013-gcc-Fix-argument-
> > list-too-long-error.patch b/meta/recipes-devtools/gcc/gcc-9.1/0013-
> > gcc-Fix-argument-list-too-long-error.patch
> > new file mode 100644
> > index 0000000000..f853ff90d2
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc-9.1/0013-gcc-Fix-argument-list-
> > too-long-error.patch
> > @@ -0,0 +1,40 @@
> > +From d8a24eca2d7a222d4910c8a508d75d0d1418e201 Mon Sep 17 00:00:00
> > 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:26:37 +0400
> > +Subject: [PATCH 13/37] gcc: Fix argument list too long error.
> > +
> > +There would be an "Argument list too long" error when the
> > +build directory is longer than 200, this is caused by:
> > +
> > +headers=`echo $(PLUGIN_HEADERS) | tr ' ' '\012' | sort -u`
> > +
> > +The PLUGIN_HEADERS is too long before sort, so the "echo" can't
> > handle
> > +it, use the $(sort list) of GNU make which can handle the too long
> > list
> > +would fix the problem, the header would be short enough after
> > sorted.
> > +The "tr ' ' '\012'" was used for translating the space to "\n", the
> > +$(sort list) doesn't need this.
> > +
> > +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Pending
> > +---
> > + gcc/Makefile.in | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/gcc/Makefile.in b/gcc/Makefile.in
> > +index 3ccff1614bb..88b1aec732b 100644
> > +--- a/gcc/Makefile.in
> > ++++ b/gcc/Makefile.in
> > +@@ -3538,7 +3538,7 @@ install-plugin: installdirs lang.install-
> > plugin s-header-vars install-gengtype
> > + # We keep the directory structure for files in config or c-family
> > and .def
> > + # files. All other files are flattened to a single directory.
> > +     $(mkinstalldirs) $(DESTDIR)$(plugin_includedir)
> > +-    headers=`echo $(PLUGIN_HEADERS) $$(cd $(srcdir); echo *.h
> > *.def) | tr ' ' '\012' | sort -u`; \
> > ++    headers="$(sort $(PLUGIN_HEADERS) $$(cd $(srcdir); echo *.h
> > *.def))"; \
> > +     srcdirstrip=`echo "$(srcdir)" | sed 's/[].[^$$\\*|]/\\\\&/g'`;
> > \
> > +     for file in $$headers; do \
> > +       if [ -f $$file ] ; then \
> > +--
> > +2.20.1
> > +
> > diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0014-Disable-sdt.patch
> > b/meta/recipes-devtools/gcc/gcc-9.1/0014-Disable-sdt.patch
> > new file mode 100644
> > index 0000000000..945cf8f8af
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc-9.1/0014-Disable-sdt.patch
> > @@ -0,0 +1,113 @@
> > +From d5e52580314ef6056ca701fcc030c7c884cb1d7f Mon Sep 17 00:00:00
> > 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:28:10 +0400
> > +Subject: [PATCH 14/37] Disable sdt.
> > +
> > +We don't list dtrace in DEPENDS so we shouldn't be depending on this
> > header.
> > +It may or may not exist from preivous builds though. To be
> > determinstic, disable
> > +sdt.h usage always. This avoids build failures if the header is
> > removed after configure
> > +but before libgcc is compiled for example.
> > +
> > +RP 2012/8/7
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Disable sdt for libstdc++-v3.
> > +
> > +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > +
> > +Upstream-Status: Inappropriate [hack]
> > +---
> > + gcc/configure             | 12 ++++++------
> > + gcc/configure.ac          | 18 +++++++++---------
> > + libstdc++-v3/configure    |  6 +++---
> > + libstdc++-v3/configure.ac |  2 +-
> > + 4 files changed, 19 insertions(+), 19 deletions(-)
> > +
> > +diff --git a/gcc/configure b/gcc/configure
> > +index 7acc7e487b0..6a87ab693ea 100755
> > +--- a/gcc/configure
> > ++++ b/gcc/configure
> > +@@ -29292,12 +29292,12 @@ fi
> > + { $as_echo "$as_me:${as_lineno-$LINENO}: checking sys/sdt.h in the
> > target C library" >&5
> > + $as_echo_n "checking sys/sdt.h in the target C library... " >&6; }
> > + have_sys_sdt_h=no
> > +-if test -f $target_header_dir/sys/sdt.h; then
> > +-  have_sys_sdt_h=yes
> > +-
> > +-$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
> > +-
> > +-fi
> > ++#if test -f $target_header_dir/sys/sdt.h; then
> > ++#  have_sys_sdt_h=yes
> > ++#
> > ++#$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
> > ++#
> > ++#fi
> > + { $as_echo "$as_me:${as_lineno-$LINENO}: result: $have_sys_sdt_h"
> > >&5
> > + $as_echo "$have_sys_sdt_h" >&6; }
> > +
> > +diff --git a/gcc/configure.ac b/gcc/configure.ac
> > +index f5d5e5c16a8..a50765171be 100644
> > +--- a/gcc/configure.ac
> > ++++ b/gcc/configure.ac
> > +@@ -5985,15 +5985,15 @@ fi
> > + AC_SUBST([enable_default_ssp])
> > +
> > + # Test for <sys/sdt.h> on the target.
> > +-GCC_TARGET_TEMPLATE([HAVE_SYS_SDT_H])
> > +-AC_MSG_CHECKING(sys/sdt.h in the target C library)
> > +-have_sys_sdt_h=no
> > +-if test -f $target_header_dir/sys/sdt.h; then
> > +-  have_sys_sdt_h=yes
> > +-  AC_DEFINE(HAVE_SYS_SDT_H, 1,
> > +-            [Define if your target C library provides sys/sdt.h])
> > +-fi
> > +-AC_MSG_RESULT($have_sys_sdt_h)
> > ++#GCC_TARGET_TEMPLATE([HAVE_SYS_SDT_H])
> > ++#AC_MSG_CHECKING(sys/sdt.h in the target C library)
> > ++#have_sys_sdt_h=no
> > ++#if test -f $target_header_dir/sys/sdt.h; then
> > ++#  have_sys_sdt_h=yes
> > ++#  AC_DEFINE(HAVE_SYS_SDT_H, 1,
> > ++#            [Define if your target C library provides sys/sdt.h])
> > ++#fi
> > ++#AC_MSG_RESULT($have_sys_sdt_h)
> > +
> > + # Check if TFmode long double should be used by default or not.
> > + # Some glibc targets used DFmode long double, but with glibc 2.4
> > +diff --git a/libstdc++-v3/configure b/libstdc++-v3/configure
> > +index 15848e364ab..8d3da1cc526 100755
> > +--- a/libstdc++-v3/configure
> > ++++ b/libstdc++-v3/configure
> > +@@ -22084,11 +22084,11 @@ ac_compile='$CC -c $CFLAGS $CPPFLAGS
> > conftest.$ac_ext >&5'
> > + ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS
> > conftest.$ac_ext $LIBS >&5'
> > + ac_compiler_gnu=$ac_cv_c_compiler_gnu
> > +
> > +-  if test $glibcxx_cv_sys_sdt_h = yes; then
> > ++#  if test $glibcxx_cv_sys_sdt_h = yes; then
> > +
> > +-$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
> > ++#$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
> > +
> > +-  fi
> > ++#  fi
> > +   { $as_echo "$as_me:${as_lineno-$LINENO}: result:
> > $glibcxx_cv_sys_sdt_h" >&5
> > + $as_echo "$glibcxx_cv_sys_sdt_h" >&6; }
> > +
> > +diff --git a/libstdc++-v3/configure.ac b/libstdc++-v3/configure.ac
> > +index ad5b4117cfd..2341645ba6f 100644
> > +--- a/libstdc++-v3/configure.ac
> > ++++ b/libstdc++-v3/configure.ac
> > +@@ -230,7 +230,7 @@ GLIBCXX_CHECK_SC_NPROCESSORS_ONLN
> > + GLIBCXX_CHECK_SC_NPROC_ONLN
> > + GLIBCXX_CHECK_PTHREADS_NUM_PROCESSORS_NP
> > + GLIBCXX_CHECK_SYSCTL_HW_NCPU
> > +-GLIBCXX_CHECK_SDT_H
> > ++#GLIBCXX_CHECK_SDT_H
> > +
> > + # Check for available headers.
> > + AC_CHECK_HEADERS([endian.h execinfo.h float.h fp.h ieeefp.h
> > inttypes.h \
> > +--
> > +2.20.1
> > +
> > diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0015-libtool.patch
> > b/meta/recipes-devtools/gcc/gcc-9.1/0015-libtool.patch
> > new file mode 100644
> > index 0000000000..764460b89e
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc-9.1/0015-libtool.patch
> > @@ -0,0 +1,42 @@
> > +From d7c605d92094c75dc2717d9dd830e525b2c8b0ff Mon Sep 17 00:00:00
> > 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:29:11 +0400
> > +Subject: [PATCH 15/37] libtool
> > +
> > +libstdc++ from gcc-runtime gets created with -rpath=/usr/lib/../lib
> > for qemux86-64
> > +when running on am x86_64 build host.
> > +
> > +This patch stops this speading to libdir in the libstdc++.la file
> > within libtool.
> > +Arguably, it shouldn't be passing this into libtool in the first
> > place but
> > +for now this resolves the nastiest problems this causes.
> > +
> > +func_normal_abspath would resolve an empty path to `pwd` so we need
> > +to filter the zero case.
> > +
> > +RP 2012/8/24
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Pending
> > +---
> > + ltmain.sh | 4 ++++
> > + 1 file changed, 4 insertions(+)
> > +
> > +diff --git a/ltmain.sh b/ltmain.sh
> > +index 79f9ba89af5..8e222f7c16b 100644
> > +--- a/ltmain.sh
> > ++++ b/ltmain.sh
> > +@@ -6359,6 +6359,10 @@ func_mode_link ()
> > +     func_warning "ignoring multiple \`-rpath's for a libtool
> > library"
> > +
> > +       install_libdir="$1"
> > ++      if test -n "$install_libdir"; then
> > ++    func_normal_abspath "$install_libdir"
> > ++    install_libdir=$func_normal_abspath_result
> > ++      fi
> > +
> > +       oldlibs=
> > +       if test -z "$rpath"; then
> > +--
> > +2.20.1
> > +
> > diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0016-gcc-armv4-pass-
> > fix-v4bx-to-linker-to-support-EABI.patch b/meta/recipes-
> > devtools/gcc/gcc-9.1/0016-gcc-armv4-pass-fix-v4bx-to-linker-to-
> > support-EABI.patch
> > new file mode 100644
> > index 0000000000..398074b5cc
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc-9.1/0016-gcc-armv4-pass-fix-v4bx-
> > to-linker-to-support-EABI.patch
> > @@ -0,0 +1,43 @@
> > +From c3addf8bc41190d46d98eb7690ff4583eebd5943 Mon Sep 17 00:00:00
> > 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:30:32 +0400
> > +Subject: [PATCH 16/37] gcc: armv4: pass fix-v4bx to linker to
> > support EABI.
> > +
> > +The LINK_SPEC for linux gets overwritten by linux-eabi.h which
> > +means the value of TARGET_FIX_V4BX_SPEC gets lost and as a result
> > +the option is not passed to linker when chosing march=armv4
> > +This patch redefines this in linux-eabi.h and reinserts it
> > +for eabi defaulting toolchains.
> > +
> > +We might want to send it upstream.
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Pending
> > +---
> > + gcc/config/arm/linux-eabi.h | 6 +++++-
> > + 1 file changed, 5 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-
> > eabi.h
> > +index e4ade2e2ab0..108863f69d2 100644
> > +--- a/gcc/config/arm/linux-eabi.h
> > ++++ b/gcc/config/arm/linux-eabi.h
> > +@@ -91,10 +91,14 @@
> > + #define MUSL_DYNAMIC_LINKER \
> > +   "/lib/ld-musl-arm" MUSL_DYNAMIC_LINKER_E "%{mfloat-
> > abi=hard:hf}.so.1"
> > +
> > ++/* For armv4 we pass --fix-v4bx to linker to support EABI */
> > ++#undef TARGET_FIX_V4BX_SPEC
> > ++#define TARGET_FIX_V4BX_SPEC
> > "%{mcpu=arm8|mcpu=arm810|mcpu=strongarm*|march=armv4: --fix-v4bx}"
> > ++
> > + /* At this point, bpabi.h will have clobbered LINK_SPEC.  We want
> > to
> > +    use the GNU/Linux version, not the generic BPABI version.  */
> > + #undef  LINK_SPEC
> > +-#define LINK_SPEC EABI_LINK_SPEC
> > \
> > ++#define LINK_SPEC TARGET_FIX_V4BX_SPEC EABI_LINK_SPEC
> >       \
> > +   LINUX_OR_ANDROID_LD (LINUX_TARGET_LINK_SPEC,
> >       \
> > +                    LINUX_TARGET_LINK_SPEC " " ANDROID_LINK_SPEC)
> > +
> > +--
> > +2.20.1
> > +
> > diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0017-Use-the-multilib-
> > config-files-from-B-instead-of-usin.patch b/meta/recipes-
> > devtools/gcc/gcc-9.1/0017-Use-the-multilib-config-files-from-B-
> > instead-of-usin.patch
> > new file mode 100644
> > index 0000000000..7d5c94a646
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc-9.1/0017-Use-the-multilib-config-
> > files-from-B-instead-of-usin.patch
> > @@ -0,0 +1,102 @@
> > +From e1071f4e749586fcb3edcacf43d4dd44081d16ec Mon Sep 17 00:00:00
> > 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:33:04 +0400
> > +Subject: [PATCH 17/37] Use the multilib config files from ${B}
> > instead of
> > + using the ones from ${S}
> > +
> > +Use the multilib config files from ${B} instead of using the ones
> > from ${S}
> > +so that the source can be shared between gcc-cross-initial,
> > +gcc-cross-intermediate, gcc-cross, gcc-runtime, and also the sdk
> > build.
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> > +
> > +Upstream-Status: Inappropriate [configuration]
> > +---
> > + gcc/configure    | 22 ++++++++++++++++++----
> > + gcc/configure.ac | 22 ++++++++++++++++++----
> > + 2 files changed, 36 insertions(+), 8 deletions(-)
> > +
> > +diff --git a/gcc/configure b/gcc/configure
> > +index 6a87ab693ea..2e822caf66d 100755
> > +--- a/gcc/configure
> > ++++ b/gcc/configure
> > +@@ -12321,10 +12321,20 @@ done
> > + tmake_file_=
> > + for f in ${tmake_file}
> > + do
> > +-    if test -f ${srcdir}/config/$f
> > +-    then
> > +-            tmake_file_="${tmake_file_} \$(srcdir)/config/$f"
> > +-    fi
> > ++  case $f in
> > ++    */t-linux64 )
> > ++       if test -f ./config/$f
> > ++       then
> > ++         tmake_file_="${tmake_file_} ./config/$f"
> > ++       fi
> > ++       ;;
> > ++    * )
> > ++       if test -f ${srcdir}/config/$f
> > ++       then
> > ++         tmake_file_="${tmake_file_} \$(srcdir)/config/$f"
> > ++       fi
> > ++       ;;
> > ++  esac
> > + done
> > + tmake_file="${tmake_file_}"
> > +
> > +@@ -12335,6 +12345,10 @@ tm_file_list="options.h"
> > + tm_include_list="options.h insn-constants.h"
> > + for f in $tm_file; do
> > +   case $f in
> > ++    */linux64.h )
> > ++       tm_file_list="${tm_file_list} ./config/$f"
> > ++       tm_include_list="${tm_include_list} ./config/$f"
> > ++       ;;
> > +     ./* )
> > +        f=`echo $f | sed 's/^..//'`
> > +        tm_file_list="${tm_file_list} $f"
> > +diff --git a/gcc/configure.ac b/gcc/configure.ac
> > +index a50765171be..70e7bac78c4 100644
> > +--- a/gcc/configure.ac
> > ++++ b/gcc/configure.ac
> > +@@ -1948,10 +1948,20 @@ done
> > + tmake_file_=
> > + for f in ${tmake_file}
> > + do
> > +-    if test -f ${srcdir}/config/$f
> > +-    then
> > +-            tmake_file_="${tmake_file_} \$(srcdir)/config/$f"
> > +-    fi
> > ++  case $f in
> > ++    */t-linux64 )
> > ++       if test -f ./config/$f
> > ++       then
> > ++         tmake_file_="${tmake_file_} ./config/$f"
> > ++       fi
> > ++       ;;
> > ++    * )
> > ++       if test -f ${srcdir}/config/$f
> > ++       then
> > ++         tmake_file_="${tmake_file_} \$(srcdir)/config/$f"
> > ++       fi
> > ++       ;;
> > ++  esac
> > + done
> > + tmake_file="${tmake_file_}"
> > +
> > +@@ -1962,6 +1972,10 @@ tm_file_list="options.h"
> > + tm_include_list="options.h insn-constants.h"
> > + for f in $tm_file; do
> > +   case $f in
> > ++    */linux64.h )
> > ++       tm_file_list="${tm_file_list} ./config/$f"
> > ++       tm_include_list="${tm_include_list} ./config/$f"
> > ++       ;;
> > +     ./* )
> > +        f=`echo $f | sed 's/^..//'`
> > +        tm_file_list="${tm_file_list} $f"
> > +--
> > +2.20.1
> > +
> > diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0018-Avoid-using-
> > libdir-from-.la-which-usually-points-to-.patch b/meta/recipes-
> > devtools/gcc/gcc-9.1/0018-Avoid-using-libdir-from-.la-which-usually-
> > points-to-.patch
> > new file mode 100644
> > index 0000000000..596337bc1f
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc-9.1/0018-Avoid-using-libdir-from-
> > .la-which-usually-points-to-.patch
> > @@ -0,0 +1,31 @@
> > +From 1ffbbb39c9848aa7a04da18fb79b1f0bd7731e00 Mon Sep 17 00:00:00
> > 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 20 Feb 2015 09:39:38 +0000
> > +Subject: [PATCH 18/37] Avoid using libdir from .la which usually
> > points to a
> > + host path
> > +
> > +Upstream-Status: Inappropriate [embedded specific]
> > +
> > +Signed-off-by: Jonathan Liu <net147@gmail.com>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + ltmain.sh | 3 +++
> > + 1 file changed, 3 insertions(+)
> > +
> > +diff --git a/ltmain.sh b/ltmain.sh
> > +index 8e222f7c16b..0a93b4e5c3b 100644
> > +--- a/ltmain.sh
> > ++++ b/ltmain.sh
> > +@@ -5628,6 +5628,9 @@ func_mode_link ()
> > +         absdir="$abs_ladir"
> > +         libdir="$abs_ladir"
> > +       else
> > ++        # Instead of using libdir from .la which usually points to
> > a host path,
> > ++        # use the path the .la is contained in.
> > ++        libdir="$abs_ladir"
> > +         dir="$libdir"
> > +         absdir="$libdir"
> > +       fi
> > +--
> > +2.20.1
> > +
> > diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0019-export-CPP.patch
> > b/meta/recipes-devtools/gcc/gcc-9.1/0019-export-CPP.patch
> > new file mode 100644
> > index 0000000000..50d17dd962
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc-9.1/0019-export-CPP.patch
> > @@ -0,0 +1,53 @@
> > +From 5ece023b88eaba16d8744f8f2ff72345ec3b7f92 Mon Sep 17 00:00:00
> > 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 20 Feb 2015 09:40:59 +0000
> > +Subject: [PATCH 19/37] export CPP
> > +
> > +The OE environment sets and exports CPP as being the target gcc.
> > When
> > +building gcc-cross-canadian for a mingw targetted sdk, the following
> > can be found
> > +in build.x86_64-pokysdk-mingw32.i586-poky-linux/build-x86_64-
> > linux/libiberty/config.log:
> > +
> > +configure:3641: checking for _FILE_OFFSET_BITS value needed for
> > large files
> > +configure:3666: gcc  -c
> > -isystem/media/build1/poky/build/tmp/sysroots/x86_64-
> > linux/usr/include -O2 -pipe  conftest.c >&5
> > +configure:3666: $? = 0
> > +configure:3698: result: no
> > +configure:3786: checking how to run the C preprocessor
> > +configure:3856: result: x86_64-pokysdk-mingw32-gcc -E --
> > sysroot=/media/build1/poky/build/tmp/sysroots/x86_64-nativesdk-
> > mingw32-pokysdk-mingw32
> > +configure:3876: x86_64-pokysdk-mingw32-gcc -E --
> > sysroot=/media/build1/poky/build/tmp/sysroots/x86_64-nativesdk-
> > mingw32-pokysdk-mingw32 conftest.c
> > +configure:3876: $? = 0
> > +
> > +Note this is a *build* target (in build-x86_64-linux) so it should
> > be
> > +using the host "gcc", not x86_64-pokysdk-mingw32-gcc. Since the
> > mingw32
> > +headers are very different, using the wrong cpp is a real problem.
> > It is leaking
> > +into configure through the CPP variable. Ultimately this leads to
> > build
> > +failures related to not being able to include a process.h file for
> > pem-unix.c.
> > +
> > +The fix is to ensure we export a sane CPP value into the build
> > +environment when using build targets. We could define a
> > CPP_FOR_BUILD value which may be
> > +the version which needs to be upstreamed but for now, this fix is
> > good enough to
> > +avoid the problem.
> > +
> > +RP 22/08/2013
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + Makefile.in | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/Makefile.in b/Makefile.in
> > +index 28539a45372..b21e0791f55 100644
> > +--- a/Makefile.in
> > ++++ b/Makefile.in
> > +@@ -149,6 +149,7 @@ BUILD_EXPORTS = \
> > +     AR="$(AR_FOR_BUILD)"; export AR; \
> > +     AS="$(AS_FOR_BUILD)"; export AS; \
> > +     CC="$(CC_FOR_BUILD)"; export CC; \
> > ++    CPP="$(CC_FOR_BUILD) -E"; export CPP; \
> > +     CFLAGS="$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
> > +     CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
> > +     CXX="$(CXX_FOR_BUILD)"; export CXX; \
> > +--
> > +2.20.1
> > +
> > diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0020-Ensure-target-
> > gcc-headers-can-be-included.patch b/meta/recipes-devtools/gcc/gcc-
> > 9.1/0020-Ensure-target-gcc-headers-can-be-included.patch
> > new file mode 100644
> > index 0000000000..f37c6f39aa
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc-9.1/0020-Ensure-target-gcc-
> > headers-can-be-included.patch
> > @@ -0,0 +1,98 @@
> > +From 89f7a8e5c55b31bff011cd7466d78cd84d1eb307 Mon Sep 17 00:00:00
> > 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 20 Feb 2015 10:25:11 +0000
> > +Subject: [PATCH 20/37] Ensure target gcc headers can be included
> > +
> > +There are a few headers installed as part of the OpenEmbedded
> > +gcc-runtime target (omp.h, ssp/*.h). Being installed from a recipe
> > +built for the target architecture, these are within the target
> > +sysroot and not cross/nativesdk; thus they weren't able to be
> > +found by gcc with the existing search paths. Add support for
> > +picking up these headers under the sysroot supplied on the gcc
> > +command line in order to resolve this.
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + gcc/Makefile.in  | 2 ++
> > + gcc/cppdefault.c | 4 ++++
> > + gcc/defaults.h   | 9 +++++++++
> > + gcc/gcc.c        | 7 -------
> > + 4 files changed, 15 insertions(+), 7 deletions(-)
> > +
> > +diff --git a/gcc/Makefile.in b/gcc/Makefile.in
> > +index 88b1aec732b..eb1dc304de2 100644
> > +--- a/gcc/Makefile.in
> > ++++ b/gcc/Makefile.in
> > +@@ -618,6 +618,7 @@ libexecdir = @libexecdir@
> > +
> > + # Directory in which the compiler finds libraries etc.
> > + libsubdir =
> > $(libdir)/gcc/$(real_target_noncanonical)/$(version)$(accel_dir_suffi
> > x)
> > ++libsubdir_target = gcc/$(target_noncanonical)/$(version)
> > + # Directory in which the compiler finds executables
> > + libexecsubdir =
> > $(libexecdir)/gcc/$(real_target_noncanonical)/$(version)$(accel_dir_s
> > uffix)
> > + # Directory in which all plugin resources are installed
> > +@@ -2867,6 +2868,7 @@ CFLAGS-intl.o += -DLOCALEDIR=\"$(localedir)\"
> > +
> > + PREPROCESSOR_DEFINES = \
> > +   -DGCC_INCLUDE_DIR=\"$(libsubdir)/include\" \
> > ++  -DGCC_INCLUDE_SUBDIR_TARGET=\"$(libsubdir_target)/include\" \
> > +   -DFIXED_INCLUDE_DIR=\"$(libsubdir)/include-fixed\" \
> > +   -DGPLUSPLUS_INCLUDE_DIR=\"$(gcc_gxx_include_dir)\" \
> > +   -
> > DGPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT=$(gcc_gxx_include_dir_add_sysroot)
> > \
> > +diff --git a/gcc/cppdefault.c b/gcc/cppdefault.c
> > +index c4796385643..980e2bd47a7 100644
> > +--- a/gcc/cppdefault.c
> > ++++ b/gcc/cppdefault.c
> > +@@ -59,6 +59,10 @@ const struct default_include
> > cpp_include_defaults[]
> > +     /* This is the dir for gcc's private headers.  */
> > +     { GCC_INCLUDE_DIR, "GCC", 0, 0, 0, 0 },
> > + #endif
> > ++#ifdef GCC_INCLUDE_SUBDIR_TARGET
> > ++    /* This is the dir for gcc's private headers under the
> > specified sysroot.  */
> > ++    { STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUBDIR_TARGET, "GCC",
> > 0, 0, 1, 0 },
> > ++#endif
> > + #ifdef LOCAL_INCLUDE_DIR
> > +     /* /usr/local/include comes before the fixincluded header
> > files.  */
> > +     { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 2 },
> > +diff --git a/gcc/defaults.h b/gcc/defaults.h
> > +index b7534256119..41ca579b267 100644
> > +--- a/gcc/defaults.h
> > ++++ b/gcc/defaults.h
> > +@@ -1459,4 +1459,13 @@ see the files COPYING3 and COPYING.RUNTIME
> > respectively.  If not, see
> > + #define DWARF_GNAT_ENCODINGS_DEFAULT DWARF_GNAT_ENCODINGS_GDB
> > + #endif
> > +
> > ++/* Default prefixes to attach to command names.  */
> > ++
> > ++#ifndef STANDARD_STARTFILE_PREFIX_1
> > ++#define STANDARD_STARTFILE_PREFIX_1 "/lib/"
> > ++#endif
> > ++#ifndef STANDARD_STARTFILE_PREFIX_2
> > ++#define STANDARD_STARTFILE_PREFIX_2 "/usr/lib/"
> > ++#endif
> > ++
> > + #endif  /* ! GCC_DEFAULTS_H */
> > +diff --git a/gcc/gcc.c b/gcc/gcc.c
> > +index cef26c454d7..14b1a6e8c44 100644
> > +--- a/gcc/gcc.c
> > ++++ b/gcc/gcc.c
> > +@@ -1470,13 +1470,6 @@ static const char *gcc_libexec_prefix;
> > +
> > + /* Default prefixes to attach to command names.  */
> > +
> > +-#ifndef STANDARD_STARTFILE_PREFIX_1
> > +-#define STANDARD_STARTFILE_PREFIX_1 "/lib/"
> > +-#endif
> > +-#ifndef STANDARD_STARTFILE_PREFIX_2
> > +-#define STANDARD_STARTFILE_PREFIX_2 "/usr/lib/"
> > +-#endif
> > +-
> > + #ifdef CROSS_DIRECTORY_STRUCTURE  /* Don't use these prefixes for a
> > cross compiler.  */
> > + #undef MD_EXEC_PREFIX
> > + #undef MD_STARTFILE_PREFIX
> > +--
> > +2.20.1
> > +
> > diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0021-gcc-4.8-won-t-
> > build-with-disable-dependency-tracking.patch b/meta/recipes-
> > devtools/gcc/gcc-9.1/0021-gcc-4.8-won-t-build-with-disable-
> > dependency-tracking.patch
> > new file mode 100644
> > index 0000000000..ef985727a6
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc-9.1/0021-gcc-4.8-won-t-build-
> > with-disable-dependency-tracking.patch
> > @@ -0,0 +1,54 @@
> > +From 2a1895aca3d9020d0d5ac74975221727384ef8a6 Mon Sep 17 00:00:00
> > 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 20 Feb 2015 11:17:19 +0000
> > +Subject: [PATCH 21/37] gcc 4.8+ won't build with --disable-
> > dependency-tracking
> > +
> > +since the *.Ppo files don't get created unless --enable-dependency-
> > tracking is true.
> > +
> > +This patch ensures we only use those compiler options when its
> > enabled.
> > +
> > +Upstream-Status: Submitted
> > +
> > +(Problem was already reported upstream, attached this patch there
> > +http://gcc.gnu.org/bugzilla/show_bug.cgi?id=55930)
> > +
> > +RP
> > +2012/09/22
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + libatomic/Makefile.am | 3 ++-
> > + libatomic/Makefile.in | 3 ++-
> > + 2 files changed, 4 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/libatomic/Makefile.am b/libatomic/Makefile.am
> > +index c1b7c73934a..ef43d62c07a 100644
> > +--- a/libatomic/Makefile.am
> > ++++ b/libatomic/Makefile.am
> > +@@ -101,7 +101,8 @@ PAT_S            = $(word 3,$(PAT_SPLIT))
> > + IFUNC_DEF   = -DIFUNC_ALT=$(PAT_S)
> > + IFUNC_OPT   = $(word $(PAT_S),$(IFUNC_OPTIONS))
> > +
> > +-M_DEPS              = -MT $@ -MD -MP -MF $(DEPDIR)/$(@F).Ppo
> > ++@AMDEP_TRUE@M_DEPS          = -MT $@ -MD -MP -MF
> > $(DEPDIR)/$(@F).Ppo
> > ++@AMDEP_FALSE@M_DEPS         =
> > + M_SIZE              = -DN=$(PAT_N)
> > + M_IFUNC             = $(if $(PAT_S),$(IFUNC_DEF) $(IFUNC_OPT))
> > + M_FILE              = $(PAT_BASE)_n.c
> > +diff --git a/libatomic/Makefile.in b/libatomic/Makefile.in
> > +index 29324e3e0ac..d5cdb4259ef 100644
> > +--- a/libatomic/Makefile.in
> > ++++ b/libatomic/Makefile.in
> > +@@ -414,7 +414,8 @@ PAT_N = $(word 2,$(PAT_SPLIT))
> > + PAT_S = $(word 3,$(PAT_SPLIT))
> > + IFUNC_DEF = -DIFUNC_ALT=$(PAT_S)
> > + IFUNC_OPT = $(word $(PAT_S),$(IFUNC_OPTIONS))
> > +-M_DEPS = -MT $@ -MD -MP -MF $(DEPDIR)/$(@F).Ppo
> > ++@AMDEP_TRUE@M_DEPS = -MT $@ -MD -MP -MF $(DEPDIR)/$(@F).Ppo
> > ++@AMDEP_FALSE@M_DEPS =
> > + M_SIZE = -DN=$(PAT_N)
> > + M_IFUNC = $(if $(PAT_S),$(IFUNC_DEF) $(IFUNC_OPT))
> > + M_FILE = $(PAT_BASE)_n.c
> > +--
> > +2.20.1
> > +
> > diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0022-Don-t-search-
> > host-directory-during-relink-if-inst_pr.patch b/meta/recipes-
> > devtools/gcc/gcc-9.1/0022-Don-t-search-host-directory-during-relink-
> > if-inst_pr.patch
> > new file mode 100644
> > index 0000000000..8316c4d814
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc-9.1/0022-Don-t-search-host-
> > directory-during-relink-if-inst_pr.patch
> > @@ -0,0 +1,38 @@
> > +From 4b9f8cfbfb48a1a9781b7c3a9b867732ef37b7c5 Mon Sep 17 00:00:00
> > 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Tue, 3 Mar 2015 08:21:19 +0000
> > +Subject: [PATCH 22/37] Don't search host directory during "relink"
> > if
> > + $inst_prefix is provided
> > +
> > +
> > http://lists.gnu.org/archive/html/libtool-patches/2011-01/msg00026.html
> > +
> > +Upstream-Status: Submitted
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + ltmain.sh | 5 +++--
> > + 1 file changed, 3 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/ltmain.sh b/ltmain.sh
> > +index 0a93b4e5c3b..6de6ed2f9a0 100644
> > +--- a/ltmain.sh
> > ++++ b/ltmain.sh
> > +@@ -6004,12 +6004,13 @@ func_mode_link ()
> > +           fi
> > +         else
> > +           # We cannot seem to hardcode it, guess we'll fake it.
> > ++          # Default if $libdir is not relative to the prefix:
> > +           add_dir="-L$libdir"
> > +-          # Try looking first in the location we're being installed
> > to.
> > ++
> > +           if test -n "$inst_prefix_dir"; then
> > +             case $libdir in
> > +               [\\/]*)
> > +-                add_dir="$add_dir -L$inst_prefix_dir$libdir"
> > ++                add_dir="-L$inst_prefix_dir$libdir"
> > +                 ;;
> > +             esac
> > +           fi
> > +--
> > +2.20.1
> > +
> > diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0023-Use-
> > SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
> > b/meta/recipes-devtools/gcc/gcc-9.1/0023-Use-SYSTEMLIBS_DIR-
> > replacement-instead-of-hardcoding.patch
> > new file mode 100644
> > index 0000000000..fdea599abd
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc-9.1/0023-Use-SYSTEMLIBS_DIR-
> > replacement-instead-of-hardcoding.patch
> > @@ -0,0 +1,29 @@
> > +From 3a554b321250f6ddf1277e5559890ee977e78cb0 Mon Sep 17 00:00:00
> > 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Tue, 28 Apr 2015 23:15:27 -0700
> > +Subject: [PATCH 23/37] Use SYSTEMLIBS_DIR replacement instead of
> > hardcoding
> > + base_libdir
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + gcc/config/aarch64/aarch64-linux.h | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/gcc/config/aarch64/aarch64-linux.h
> > b/gcc/config/aarch64/aarch64-linux.h
> > +index 9d0292d64f2..51661995fc7 100644
> > +--- a/gcc/config/aarch64/aarch64-linux.h
> > ++++ b/gcc/config/aarch64/aarch64-linux.h
> > +@@ -21,7 +21,7 @@
> > + #ifndef GCC_AARCH64_LINUX_H
> > + #define GCC_AARCH64_LINUX_H
> > +
> > +-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-aarch64%{mbig-
> > endian:_be}%{mabi=ilp32:_ilp32}.so.1"
> > ++#define GLIBC_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-linux-
> > aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
> > +
> > + #undef MUSL_DYNAMIC_LINKER
> > + #define MUSL_DYNAMIC_LINKER "/lib/ld-musl-aarch64%{mbig-
> > endian:_be}%{mabi=ilp32:_ilp32}.so.1"
> > +--
> > +2.20.1
> > +
> > diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0024-aarch64-Add-
> > support-for-musl-ldso.patch b/meta/recipes-devtools/gcc/gcc-9.1/0024-
> > aarch64-Add-support-for-musl-ldso.patch
> > new file mode 100644
> > index 0000000000..f53c9949c7
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc-9.1/0024-aarch64-Add-support-for-
> > musl-ldso.patch
> > @@ -0,0 +1,28 @@
> > +From b7001034f35e7e5090fa95cb9a622469300cd45d Mon Sep 17 00:00:00
> > 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Tue, 28 Apr 2015 23:18:39 -0700
> > +Subject: [PATCH 24/37] aarch64: Add support for musl ldso
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + gcc/config/aarch64/aarch64-linux.h | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/gcc/config/aarch64/aarch64-linux.h
> > b/gcc/config/aarch64/aarch64-linux.h
> > +index 51661995fc7..db687f753f6 100644
> > +--- a/gcc/config/aarch64/aarch64-linux.h
> > ++++ b/gcc/config/aarch64/aarch64-linux.h
> > +@@ -24,7 +24,7 @@
> > + #define GLIBC_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-linux-
> > aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
> > +
> > + #undef MUSL_DYNAMIC_LINKER
> > +-#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-aarch64%{mbig-
> > endian:_be}%{mabi=ilp32:_ilp32}.so.1"
> > ++#define MUSL_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-musl-aarch64%{mbig-
> > endian:_be}%{mabi=ilp32:_ilp32}.so.1"
> > +
> > + #undef  ASAN_CC1_SPEC
> > + #define ASAN_CC1_SPEC "%{%:sanitize(address):-funwind-tables}"
> > +--
> > +2.20.1
> > +
> > diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0025-libcc1-fix-
> > libcc1-s-install-path-and-rpath.patch b/meta/recipes-
> > devtools/gcc/gcc-9.1/0025-libcc1-fix-libcc1-s-install-path-and-
> > rpath.patch
> > new file mode 100644
> > index 0000000000..7b80655b68
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc-9.1/0025-libcc1-fix-libcc1-s-
> > install-path-and-rpath.patch
> > @@ -0,0 +1,54 @@
> > +From 4d05ea7a12d1ba4515220c5c16f71ac650219db6 Mon Sep 17 00:00:00
> > 2001
> > +From: Robert Yang <liezhi.yang@windriver.com>
> > +Date: Sun, 5 Jul 2015 20:25:18 -0700
> > +Subject: [PATCH 25/37] libcc1: fix libcc1's install path and rpath
> > +
> > +* Install libcc1.so and libcc1plugin.so into
> > +  $(libexecdir)/gcc/$(target_noncanonical)/$(gcc_version), as what
> > we
> > +  had done to lto-plugin.
> > +* Fix bad RPATH iussue:
> > +  gcc-5.2.0: package gcc-plugins contains bad RPATH
> > /patht/to/tmp/sysroots/qemux86-64/usr/lib64/../lib64 in file
> > + /path/to/gcc/5.2.0-r0/packages-split/gcc-
> > plugins/usr/lib64/gcc/x86_64-poky-
> > linux/5.2.0/plugin/libcc1plugin.so.0.0.0
> > + [rpaths]
> > +
> > +Upstream-Status: Inappropriate [OE configuration]
> > +
> > +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > +---
> > + libcc1/Makefile.am | 4 ++--
> > + libcc1/Makefile.in | 4 ++--
> > + 2 files changed, 4 insertions(+), 4 deletions(-)
> > +
> > +diff --git a/libcc1/Makefile.am b/libcc1/Makefile.am
> > +index 72c6aead475..42a87740b31 100644
> > +--- a/libcc1/Makefile.am
> > ++++ b/libcc1/Makefile.am
> > +@@ -37,8 +37,8 @@ libiberty = $(if $(wildcard
> > $(libiberty_noasan)),$(Wc)$(libiberty_noasan), \
> > +         $(Wc)$(libiberty_normal)))
> > + libiberty_dep = $(patsubst $(Wc)%,%,$(libiberty))
> > +
> > +-plugindir =
> > $(libdir)/gcc/$(target_noncanonical)/$(gcc_version)/plugin
> > +-cc1libdir = $(libdir)/$(libsuffix)
> > ++cc1libdir = $(libexecdir)/gcc/$(target_noncanonical)/$(gcc_version)
> > ++plugindir = $(cc1libdir)
> > +
> > + if ENABLE_PLUGIN
> > + plugin_LTLIBRARIES = libcc1plugin.la libcp1plugin.la
> > +diff --git a/libcc1/Makefile.in b/libcc1/Makefile.in
> > +index 7104b649026..2103c477468 100644
> > +--- a/libcc1/Makefile.in
> > ++++ b/libcc1/Makefile.in
> > +@@ -393,8 +393,8 @@ libiberty = $(if $(wildcard
> > $(libiberty_noasan)),$(Wc)$(libiberty_noasan), \
> > +         $(Wc)$(libiberty_normal)))
> > +
> > + libiberty_dep = $(patsubst $(Wc)%,%,$(libiberty))
> > +-plugindir =
> > $(libdir)/gcc/$(target_noncanonical)/$(gcc_version)/plugin
> > +-cc1libdir = $(libdir)/$(libsuffix)
> > ++cc1libdir = $(libexecdir)/gcc/$(target_noncanonical)/$(gcc_version)
> > ++plugindir = $(cc1libdir)
> > + @ENABLE_PLUGIN_TRUE@plugin_LTLIBRARIES = libcc1plugin.la
> > libcp1plugin.la
> > + @ENABLE_PLUGIN_TRUE@cc1lib_LTLIBRARIES = libcc1.la
> > + shared_source = callbacks.cc callbacks.hh connection.cc
> > connection.hh \
> > +--
> > +2.20.1
> > +
> > diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0026-handle-sysroot-
> > support-for-nativesdk-gcc.patch b/meta/recipes-devtools/gcc/gcc-
> > 9.1/0026-handle-sysroot-support-for-nativesdk-gcc.patch
> > new file mode 100644
> > index 0000000000..7062c03197
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc-9.1/0026-handle-sysroot-support-
> > for-nativesdk-gcc.patch
> > @@ -0,0 +1,213 @@
> > +From fe175ac845f1ac6965ede0240e9b763ae520614d Mon Sep 17 00:00:00
> > 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Mon, 7 Dec 2015 23:39:54 +0000
> > +Subject: [PATCH 26/37] handle sysroot support for nativesdk-gcc
> > +
> > +Being able to build a nativesdk gcc is useful, particularly in cases
> > +where the host compiler may be of an incompatible version (or a 32
> > +bit compiler is needed).
> > +
> > +Sadly, building nativesdk-gcc is not straight forward. We install
> > +nativesdk-gcc into a relocatable location and this means that its
> > +library locations can change. "Normal" sysroot support doesn't help
> > +in this case since the values of paths like "libdir" change, not
> > just
> > +base root directory of the system.
> > +
> > +In order to handle this we do two things:
> > +
> > +a) Add %r into spec file markup which can be used for injected paths
> > +   such as SYSTEMLIBS_DIR (see gcc_multilib_setup()).
> > +b) Add other paths which need relocation into a .gccrelocprefix
> > section
> > +   which the relocation code will notice and adjust automatically.
> > +
> > +Upstream-Status: Inappropriate
> > +RP 2015/7/28
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + gcc/cppdefault.c | 50 +++++++++++++++++++++++++++++++++++--------
> > -----
> > + gcc/cppdefault.h |  3 ++-
> > + gcc/gcc.c        | 20 +++++++++++++------
> > + 3 files changed, 53 insertions(+), 20 deletions(-)
> > +
> > +diff --git a/gcc/cppdefault.c b/gcc/cppdefault.c
> > +index 980e2bd47a7..39b6059efdc 100644
> > +--- a/gcc/cppdefault.c
> > ++++ b/gcc/cppdefault.c
> > +@@ -35,6 +35,30 @@
> > + # undef CROSS_INCLUDE_DIR
> > + #endif
> > +
> > ++static char GPLUSPLUS_INCLUDE_DIRVAR[4096] __attribute__ ((section
> > (".gccrelocprefix"))) = GPLUSPLUS_INCLUDE_DIR;
> > ++static char GCC_INCLUDE_DIRVAR[4096] __attribute__ ((section
> > (".gccrelocprefix"))) = GCC_INCLUDE_DIR;
> > ++static char GPLUSPLUS_TOOL_INCLUDE_DIRVAR[4096] __attribute__
> > ((section (".gccrelocprefix"))) = GPLUSPLUS_TOOL_INCLUDE_DIR;
> > ++static char GPLUSPLUS_BACKWARD_INCLUDE_DIRVAR[4096] __attribute__
> > ((section (".gccrelocprefix"))) = GPLUSPLUS_BACKWARD_INCLUDE_DIR;
> > ++static char STANDARD_STARTFILE_PREFIX_2VAR[4096] __attribute__
> > ((section (".gccrelocprefix"))) = STANDARD_STARTFILE_PREFIX_2
> > GCC_INCLUDE_SUBDIR_TARGET;
> > ++#ifdef LOCAL_INCLUDE_DIR
> > ++static char LOCAL_INCLUDE_DIRVAR[4096] __attribute__ ((section
> > (".gccrelocprefix"))) = LOCAL_INCLUDE_DIR;
> > ++#endif
> > ++#ifdef PREFIX_INCLUDE_DIR
> > ++static char PREFIX_INCLUDE_DIRVAR[4096] __attribute__ ((section
> > (".gccrelocprefix"))) = PREFIX_INCLUDE_DIR;
> > ++#endif
> > ++#ifdef FIXED_INCLUDE_DIR
> > ++static char FIXED_INCLUDE_DIRVAR[4096] __attribute__ ((section
> > (".gccrelocprefix"))) = FIXED_INCLUDE_DIR;
> > ++#endif
> > ++#ifdef CROSS_INCLUDE_DIR
> > ++static char CROSS_INCLUDE_DIRVAR[4096] __attribute__ ((section
> > (".gccrelocprefix"))) = CROSS_INCLUDE_DIR;
> > ++#endif
> > ++#ifdef TOOL_INCLUDE_DIR
> > ++static char TOOL_INCLUDE_DIRVAR[4096] __attribute__ ((section
> > (".gccrelocprefix"))) = TOOL_INCLUDE_DIR;
> > ++#endif
> > ++#ifdef NATIVE_SYSTEM_HEADER_DIR
> > ++static char NATIVE_SYSTEM_HEADER_DIRVAR[4096] __attribute__
> > ((section (".gccrelocprefix"))) = NATIVE_SYSTEM_HEADER_DIR;
> > ++#endif
> > ++
> > + const struct default_include cpp_include_defaults[]
> > + #ifdef INCLUDE_DEFAULTS
> > + = INCLUDE_DEFAULTS;
> > +@@ -42,38 +66,38 @@ const struct default_include
> > cpp_include_defaults[]
> > + = {
> > + #ifdef GPLUSPLUS_INCLUDE_DIR
> > +     /* Pick up GNU C++ generic include files.  */
> > +-    { GPLUSPLUS_INCLUDE_DIR, "G++", 1, 1,
> > ++    { GPLUSPLUS_INCLUDE_DIRVAR, "G++", 1, 1,
> > +       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },
> > + #endif
> > + #ifdef GPLUSPLUS_TOOL_INCLUDE_DIR
> > +     /* Pick up GNU C++ target-dependent include files.  */
> > +-    { GPLUSPLUS_TOOL_INCLUDE_DIR, "G++", 1, 1,
> > ++    { GPLUSPLUS_TOOL_INCLUDE_DIRVAR, "G++", 1, 1,
> > +       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 1 },
> > + #endif
> > + #ifdef GPLUSPLUS_BACKWARD_INCLUDE_DIR
> > +     /* Pick up GNU C++ backward and deprecated include files.  */
> > +-    { GPLUSPLUS_BACKWARD_INCLUDE_DIR, "G++", 1, 1,
> > ++    { GPLUSPLUS_BACKWARD_INCLUDE_DIRVAR, "G++", 1, 1,
> > +       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },
> > + #endif
> > + #ifdef GCC_INCLUDE_DIR
> > +     /* This is the dir for gcc's private headers.  */
> > +-    { GCC_INCLUDE_DIR, "GCC", 0, 0, 0, 0 },
> > ++    { GCC_INCLUDE_DIRVAR, "GCC", 0, 0, 0, 0 },
> > + #endif
> > + #ifdef GCC_INCLUDE_SUBDIR_TARGET
> > +     /* This is the dir for gcc's private headers under the
> > specified sysroot.  */
> > +-    { STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUBDIR_TARGET, "GCC",
> > 0, 0, 1, 0 },
> > ++    { STANDARD_STARTFILE_PREFIX_2VAR, "GCC", 0, 0, 1, 0 },
> > + #endif
> > + #ifdef LOCAL_INCLUDE_DIR
> > +     /* /usr/local/include comes before the fixincluded header
> > files.  */
> > +-    { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 2 },
> > +-    { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 0 },
> > ++    { LOCAL_INCLUDE_DIRVAR, 0, 0, 1, 1, 2 },
> > ++    { LOCAL_INCLUDE_DIRVAR, 0, 0, 1, 1, 0 },
> > + #endif
> > + #ifdef PREFIX_INCLUDE_DIR
> > +-    { PREFIX_INCLUDE_DIR, 0, 0, 1, 0, 0 },
> > ++    { PREFIX_INCLUDE_DIRVAR, 0, 0, 1, 0, 0 },
> > + #endif
> > + #ifdef FIXED_INCLUDE_DIR
> > +     /* This is the dir for fixincludes.  */
> > +-    { FIXED_INCLUDE_DIR, "GCC", 0, 0, 0,
> > ++    { FIXED_INCLUDE_DIRVAR, "GCC", 0, 0, 0,
> > +       /* A multilib suffix needs adding if different multilibs use
> > +      different headers.  */
> > + #ifdef SYSROOT_HEADERS_SUFFIX_SPEC
> > +@@ -85,16 +109,16 @@ const struct default_include
> > cpp_include_defaults[]
> > + #endif
> > + #ifdef CROSS_INCLUDE_DIR
> > +     /* One place the target system's headers might be.  */
> > +-    { CROSS_INCLUDE_DIR, "GCC", 0, 0, 0, 0 },
> > ++    { CROSS_INCLUDE_DIRVAR, "GCC", 0, 0, 0, 0 },
> > + #endif
> > + #ifdef TOOL_INCLUDE_DIR
> > +     /* Another place the target system's headers might be.  */
> > +-    { TOOL_INCLUDE_DIR, "BINUTILS", 0, 1, 0, 0 },
> > ++    { TOOL_INCLUDE_DIRVAR, "BINUTILS", 0, 1, 0, 0 },
> > + #endif
> > + #ifdef NATIVE_SYSTEM_HEADER_DIR
> > +     /* /usr/include comes dead last.  */
> > +-    { NATIVE_SYSTEM_HEADER_DIR, NATIVE_SYSTEM_HEADER_COMPONENT, 0,
> > 0, 1, 2 },
> > +-    { NATIVE_SYSTEM_HEADER_DIR, NATIVE_SYSTEM_HEADER_COMPONENT, 0,
> > 0, 1, 0 },
> > ++    { NATIVE_SYSTEM_HEADER_DIRVAR, NATIVE_SYSTEM_HEADER_COMPONENT,
> > 0, 0, 1, 2 },
> > ++    { NATIVE_SYSTEM_HEADER_DIRVAR, NATIVE_SYSTEM_HEADER_COMPONENT,
> > 0, 0, 1, 0 },
> > + #endif
> > +     { 0, 0, 0, 0, 0, 0 }
> > +   };
> > +diff --git a/gcc/cppdefault.h b/gcc/cppdefault.h
> > +index e2d96f1e760..29fa5f815c8 100644
> > +--- a/gcc/cppdefault.h
> > ++++ b/gcc/cppdefault.h
> > +@@ -33,7 +33,8 @@
> > +
> > + struct default_include
> > + {
> > +-  const char *const fname;  /* The name of the directory.  */
> > ++  const char *fname;     /* The name of the directory.  */
> > ++
> > +   const char *const component;      /* The component containing the
> > directory
> > +                                (see update_path in prefix.c) */
> > +   const char cplusplus;             /* Only look here if we're
> > compiling C++.  */
> > +diff --git a/gcc/gcc.c b/gcc/gcc.c
> > +index 14b1a6e8c44..857310092d9 100644
> > +--- a/gcc/gcc.c
> > ++++ b/gcc/gcc.c
> > +@@ -253,6 +253,8 @@ FILE *report_times_to_file = NULL;
> > + #endif
> > + static const char *target_system_root = DEFAULT_TARGET_SYSTEM_ROOT;
> > +
> > ++static char target_relocatable_prefix[4096] __attribute__ ((section
> > (".gccrelocprefix"))) = SYSTEMLIBS_DIR;
> > ++
> > + /* Nonzero means pass the updated target_system_root to the
> > compiler.  */
> > +
> > + static int target_system_root_changed;
> > +@@ -527,6 +529,7 @@ or with constant text in a single argument.
> > +  %G     process LIBGCC_SPEC as a spec.
> > +  %R     Output the concatenation of target_system_root and
> > +         target_sysroot_suffix.
> > ++ %r     Output the base path target_relocatable_prefix
> > +  %S     process STARTFILE_SPEC as a spec.  A capital S is actually
> > used here.
> > +  %E     process ENDFILE_SPEC as a spec.  A capital E is actually
> > used here.
> > +  %C     process CPP_SPEC as a spec.
> > +@@ -1493,10 +1496,10 @@ static const char *gcc_libexec_prefix;
> > +    gcc_exec_prefix is set because, in that case, we know where the
> > +    compiler has been installed, and use paths relative to that
> > +    location instead.  */
> > +-static const char *const standard_exec_prefix =
> > STANDARD_EXEC_PREFIX;
> > +-static const char *const standard_libexec_prefix =
> > STANDARD_LIBEXEC_PREFIX;
> > +-static const char *const standard_bindir_prefix =
> > STANDARD_BINDIR_PREFIX;
> > +-static const char *const standard_startfile_prefix =
> > STANDARD_STARTFILE_PREFIX;
> > ++static char standard_exec_prefix[4096] __attribute__ ((section
> > (".gccrelocprefix"))) = STANDARD_EXEC_PREFIX;
> > ++static char standard_libexec_prefix[4096] __attribute__ ((section
> > (".gccrelocprefix"))) = STANDARD_LIBEXEC_PREFIX;
> > ++static char standard_bindir_prefix[4096] __attribute__ ((section
> > (".gccrelocprefix"))) = STANDARD_BINDIR_PREFIX;
> > ++static char *const standard_startfile_prefix =
> > STANDARD_STARTFILE_PREFIX;
> > +
> > + /* For native compilers, these are well-known paths containing
> > +    components that may be provided by the system.  For cross
> > +@@ -1504,9 +1507,9 @@ static const char *const
> > standard_startfile_prefix = STANDARD_STARTFILE_PREFIX;
> > + static const char *md_exec_prefix = MD_EXEC_PREFIX;
> > + static const char *md_startfile_prefix = MD_STARTFILE_PREFIX;
> > + static const char *md_startfile_prefix_1 = MD_STARTFILE_PREFIX_1;
> > +-static const char *const standard_startfile_prefix_1
> > ++static char standard_startfile_prefix_1[4096] __attribute__
> > ((section (".gccrelocprefix")))
> > +   = STANDARD_STARTFILE_PREFIX_1;
> > +-static const char *const standard_startfile_prefix_2
> > ++static char standard_startfile_prefix_2[4096] __attribute__
> > ((section (".gccrelocprefix")))
> > +   = STANDARD_STARTFILE_PREFIX_2;
> > +
> > + /* A relative path to be used in finding the location of tools
> > +@@ -5915,6 +5918,11 @@ do_spec_1 (const char *spec, int inswitch,
> > const char *soft_matched_part)
> > +           }
> > +         break;
> > +
> > ++          case 'r':
> > ++              obstack_grow (&obstack, target_relocatable_prefix,
> > ++                  strlen (target_relocatable_prefix));
> > ++            break;
> > ++
> > +       case 'S':
> > +         value = do_spec_1 (startfile_spec, 0, NULL);
> > +         if (value != 0)
> > +--
> > +2.20.1
> > +
> > diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0027-Search-target-
> > sysroot-gcc-version-specific-dirs-with.patch b/meta/recipes-
> > devtools/gcc/gcc-9.1/0027-Search-target-sysroot-gcc-version-specific-
> > dirs-with.patch
> > new file mode 100644
> > index 0000000000..e3ec943bfe
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc-9.1/0027-Search-target-sysroot-
> > gcc-version-specific-dirs-with.patch
> > @@ -0,0 +1,102 @@
> > +From bf07530706382c90fb89f7d8a727eb9aeb29a56a Mon Sep 17 00:00:00
> > 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Mon, 7 Dec 2015 23:41:45 +0000
> > +Subject: [PATCH 27/37] Search target sysroot gcc version specific
> > dirs with
> > + multilib.
> > +
> > +We install the gcc libraries (such as crtbegin.p) into
> > +<sysroot><libdir>/<target-sys>/5.2.0/
> > +which is a default search path for GCC (aka multi_suffix in the
> > +code below). <target-sys> is 'machine' in gcc's terminology. We use
> > +these directories so that multiple gcc versions could in theory
> > +co-exist on target.
> > +
> > +We only want to build one gcc-cross-canadian per arch and have this
> > work
> > +for all multilibs. <target-sys> can be handled by mapping the
> > multilib
> > +<target-sys> to the one used by gcc-cross-canadian, e.g.
> > +mips64-polkmllib32-linux
> > +is symlinked to by mips64-poky-linux.
> > +
> > +The default gcc search path in the target sysroot for a "lib64"
> > mutlilib
> > +is:
> > +
> > +<sysroot>/lib32/mips64-poky-linux/5.2.0/
> > +<sysroot>/lib32/../lib64/
> > +<sysroot>/usr/lib32/mips64-poky-linux/5.2.0/
> > +<sysroot>/usr/lib32/../lib64/
> > +<sysroot>/lib32/
> > +<sysroot>/usr/lib32/
> > +
> > +which means that the lib32 crtbegin.o will be found and the lib64
> > ones
> > +will not which leads to compiler failures.
> > +
> > +This patch injects a multilib version of that path first so the
> > lib64
> > +binaries can be found first. With this change the search path
> > becomes:
> > +
> > +<sysroot>/lib32/../lib64/mips64-poky-linux/5.2.0/
> > +<sysroot>/lib32/mips64-poky-linux/5.2.0/
> > +<sysroot>/lib32/../lib64/
> > +<sysroot>/usr/lib32/../lib64/mips64-poky-linux/5.2.0/
> > +<sysroot>/usr/lib32/mips64-poky-linux/5.2.0/
> > +<sysroot>/usr/lib32/../lib64/
> > +<sysroot>/lib32/
> > +<sysroot>/usr/lib32/
> > +
> > +Upstream-Status: Pending
> > +RP 2015/7/31
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + gcc/gcc.c | 29 ++++++++++++++++++++++++++++-
> > + 1 file changed, 28 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/gcc/gcc.c b/gcc/gcc.c
> > +index 857310092d9..6363e63b8ff 100644
> > +--- a/gcc/gcc.c
> > ++++ b/gcc/gcc.c
> > +@@ -2610,7 +2610,7 @@ for_each_path (const struct path_prefix
> > *paths,
> > +       if (path == NULL)
> > +     {
> > +       len = paths->max_len + extra_space + 1;
> > +-      len += MAX (MAX (suffix_len, multi_os_dir_len),
> > multiarch_len);
> > ++      len += MAX ((suffix_len + multi_os_dir_len), multiarch_len);
> > +       path = XNEWVEC (char, len);
> > +     }
> > +
> > +@@ -2622,6 +2622,33 @@ for_each_path (const struct path_prefix
> > *paths,
> > +       /* Look first in MACHINE/VERSION subdirectory.  */
> > +       if (!skip_multi_dir)
> > +         {
> > ++          if (!(pl->os_multilib ? skip_multi_os_dir :
> > skip_multi_dir))
> > ++            {
> > ++              const char *this_multi;
> > ++              size_t this_multi_len;
> > ++
> > ++              if (pl->os_multilib)
> > ++                {
> > ++                  this_multi = multi_os_dir;
> > ++                  this_multi_len = multi_os_dir_len;
> > ++                }
> > ++              else
> > ++                {
> > ++                  this_multi = multi_dir;
> > ++                  this_multi_len = multi_dir_len;
> > ++                }
> > ++
> > ++              /* Look in multilib MACHINE/VERSION subdirectory
> > first */
> > ++              if (this_multi_len)
> > ++                {
> > ++                  memcpy (path + len, this_multi, this_multi_len +
> > 1);
> > ++                  memcpy (path + len + this_multi_len,
> > multi_suffix, suffix_len + 1);
> > ++                  ret = callback (path, callback_info);
> > ++                    if (ret)
> > ++                      break;
> > ++                }
> > ++            }
> > ++
> > +           memcpy (path + len, multi_suffix, suffix_len + 1);
> > +           ret = callback (path, callback_info);
> > +           if (ret)
> > +--
> > +2.20.1
> > +
> > diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0028-Fix-various-
> > _FOR_BUILD-and-related-variables.patch b/meta/recipes-
> > devtools/gcc/gcc-9.1/0028-Fix-various-_FOR_BUILD-and-related-
> > variables.patch
> > new file mode 100644
> > index 0000000000..bdcbd323cb
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc-9.1/0028-Fix-various-_FOR_BUILD-
> > and-related-variables.patch
> > @@ -0,0 +1,137 @@
> > +From 16ab14b7221b3491cd43ab745f57b60ca83089df Mon Sep 17 00:00:00
> > 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Mon, 7 Dec 2015 23:42:45 +0000
> > +Subject: [PATCH 28/37] Fix various _FOR_BUILD and related variables
> > +
> > +When doing a FOR_BUILD thing, you have to override CFLAGS with
> > +CFLAGS_FOR_BUILD. And if you use C++, you also have to override
> > +CXXFLAGS with CXXFLAGS_FOR_BUILD.
> > +Without this, when building for mingw, you end up trying to use
> > +the mingw headers for a host build.
> > +
> > +The same goes for other variables as well, such as CPPFLAGS,
> > +CPP, and GMPINC.
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
> > +Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + Makefile.in      | 6 ++++++
> > + Makefile.tpl     | 5 +++++
> > + gcc/Makefile.in  | 2 +-
> > + gcc/configure    | 2 +-
> > + gcc/configure.ac | 2 +-
> > + 5 files changed, 14 insertions(+), 3 deletions(-)
> > +
> > +diff --git a/Makefile.in b/Makefile.in
> > +index b21e0791f55..0e573791202 100644
> > +--- a/Makefile.in
> > ++++ b/Makefile.in
> > +@@ -152,6 +152,7 @@ BUILD_EXPORTS = \
> > +     CPP="$(CC_FOR_BUILD) -E"; export CPP; \
> > +     CFLAGS="$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
> > +     CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
> > ++    CPPFLAGS="$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS; \
> > +     CXX="$(CXX_FOR_BUILD)"; export CXX; \
> > +     CXXFLAGS="$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS; \
> > +     GFORTRAN="$(GFORTRAN_FOR_BUILD)"; export GFORTRAN; \
> > +@@ -171,6 +172,9 @@ BUILD_EXPORTS = \
> > + # built for the build system to override those in
> > BASE_FLAGS_TO_PASS.
> > + EXTRA_BUILD_FLAGS = \
> > +     CFLAGS="$(CFLAGS_FOR_BUILD)" \
> > ++    CXXFLAGS="$(CXXFLAGS_FOR_BUILD)" \
> > ++    CPP="$(CC_FOR_BUILD) -E" \
> > ++    CPPFLAGS="$(CPPFLAGS_FOR_BUILD)" \
> > +     LDFLAGS="$(LDFLAGS_FOR_BUILD)"
> > +
> > + # This is the list of directories to built for the host system.
> > +@@ -188,6 +192,7 @@ HOST_SUBDIR = @host_subdir@
> > + HOST_EXPORTS = \
> > +     $(BASE_EXPORTS) \
> > +     CC="$(CC)"; export CC; \
> > ++    CPP="$(CC) -E"; export CPP; \
> > +     ADA_CFLAGS="$(ADA_CFLAGS)"; export ADA_CFLAGS; \
> > +     CFLAGS="$(CFLAGS)"; export CFLAGS; \
> > +     CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
> > +@@ -775,6 +780,7 @@ BASE_FLAGS_TO_PASS = \
> > +     "CC_FOR_BUILD=$(CC_FOR_BUILD)" \
> > +     "CFLAGS_FOR_BUILD=$(CFLAGS_FOR_BUILD)" \
> > +     "CXX_FOR_BUILD=$(CXX_FOR_BUILD)" \
> > ++    "CXXFLAGS_FOR_BUILD=$(CXXFLAGS_FOR_BUILD)" \
> > +     "EXPECT=$(EXPECT)" \
> > +     "FLEX=$(FLEX)" \
> > +     "INSTALL=$(INSTALL)" \
> > +diff --git a/Makefile.tpl b/Makefile.tpl
> > +index 126296fb49a..15fb236bcc0 100644
> > +--- a/Makefile.tpl
> > ++++ b/Makefile.tpl
> > +@@ -154,6 +154,7 @@ BUILD_EXPORTS = \
> > +     CC="$(CC_FOR_BUILD)"; export CC; \
> > +     CFLAGS="$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
> > +     CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
> > ++    CPPFLAGS="$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS; \
> > +     CXX="$(CXX_FOR_BUILD)"; export CXX; \
> > +     CXXFLAGS="$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS; \
> > +     GFORTRAN="$(GFORTRAN_FOR_BUILD)"; export GFORTRAN; \
> > +@@ -173,6 +174,9 @@ BUILD_EXPORTS = \
> > + # built for the build system to override those in
> > BASE_FLAGS_TO_PASS.
> > + EXTRA_BUILD_FLAGS = \
> > +     CFLAGS="$(CFLAGS_FOR_BUILD)" \
> > ++    CXXFLAGS="$(CXXFLAGS_FOR_BUILD)" \
> > ++    CPP="$(CC_FOR_BUILD) -E" \
> > ++    CPPFLAGS="$(CPPFLAGS_FOR_BUILD)" \
> > +     LDFLAGS="$(LDFLAGS_FOR_BUILD)"
> > +
> > + # This is the list of directories to built for the host system.
> > +@@ -190,6 +194,7 @@ HOST_SUBDIR = @host_subdir@
> > + HOST_EXPORTS = \
> > +     $(BASE_EXPORTS) \
> > +     CC="$(CC)"; export CC; \
> > ++    CPP="$(CC) -E"; export CPP; \
> > +     ADA_CFLAGS="$(ADA_CFLAGS)"; export ADA_CFLAGS; \
> > +     CFLAGS="$(CFLAGS)"; export CFLAGS; \
> > +     CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
> > +diff --git a/gcc/Makefile.in b/gcc/Makefile.in
> > +index eb1dc304de2..93a43146846 100644
> > +--- a/gcc/Makefile.in
> > ++++ b/gcc/Makefile.in
> > +@@ -805,7 +805,7 @@ BUILD_LDFLAGS=@BUILD_LDFLAGS@
> > + BUILD_NO_PIE_FLAG = @BUILD_NO_PIE_FLAG@
> > + BUILD_LDFLAGS += $(BUILD_NO_PIE_FLAG)
> > + BUILD_CPPFLAGS= -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
> > +-            -I$(srcdir)/../include @INCINTL@ $(CPPINC) $(CPPFLAGS)
> > ++            -I$(srcdir)/../include @INCINTL@ $(CPPINC)
> > $(CPPFLAGS_FOR_BUILD)
> > +
> > + # Actual name to use when installing a native compiler.
> > + GCC_INSTALL_NAME := $(shell echo gcc|sed
> > '$(program_transform_name)')
> > +diff --git a/gcc/configure b/gcc/configure
> > +index 2e822caf66d..2c50676a2bf 100755
> > +--- a/gcc/configure
> > ++++ b/gcc/configure
> > +@@ -11965,7 +11965,7 @@ else
> > +     CC="${CC_FOR_BUILD}" CFLAGS="${CFLAGS_FOR_BUILD}" \
> > +     CXX="${CXX_FOR_BUILD}" CXXFLAGS="${CXXFLAGS_FOR_BUILD}" \
> > +     LD="${LD_FOR_BUILD}" LDFLAGS="${LDFLAGS_FOR_BUILD}" \
> > +-    GMPINC="" CPPFLAGS="${CPPFLAGS} -DGENERATOR_FILE" \
> > ++    GMPINC="" CPPFLAGS="${CPPFLAGS_FOR_BUILD} -DGENERATOR_FILE" \
> > +     ${realsrcdir}/configure \
> > +             --enable-languages=${enable_languages-all} \
> > +             --target=$target_alias --host=$build_alias --
> > build=$build_alias
> > +diff --git a/gcc/configure.ac b/gcc/configure.ac
> > +index 70e7bac78c4..d29eb580429 100644
> > +--- a/gcc/configure.ac
> > ++++ b/gcc/configure.ac
> > +@@ -1743,7 +1743,7 @@ else
> > +     CC="${CC_FOR_BUILD}" CFLAGS="${CFLAGS_FOR_BUILD}" \
> > +     CXX="${CXX_FOR_BUILD}" CXXFLAGS="${CXXFLAGS_FOR_BUILD}" \
> > +     LD="${LD_FOR_BUILD}" LDFLAGS="${LDFLAGS_FOR_BUILD}" \
> > +-    GMPINC="" CPPFLAGS="${CPPFLAGS} -DGENERATOR_FILE" \
> > ++    GMPINC="" CPPFLAGS="${CPPFLAGS_FOR_BUILD} -DGENERATOR_FILE" \
> > +     ${realsrcdir}/configure \
> > +             --enable-languages=${enable_languages-all} \
> > +             --target=$target_alias --host=$build_alias --
> > build=$build_alias
> > +--
> > +2.20.1
> > +
> > diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0029-nios2-Define-
> > MUSL_DYNAMIC_LINKER.patch b/meta/recipes-devtools/gcc/gcc-9.1/0029-
> > nios2-Define-MUSL_DYNAMIC_LINKER.patch
> > new file mode 100644
> > index 0000000000..08da1ab986
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc-9.1/0029-nios2-Define-
> > MUSL_DYNAMIC_LINKER.patch
> > @@ -0,0 +1,28 @@
> > +From e293df9a5734b43cb60cc47a3f5ff9af50fee3aa Mon Sep 17 00:00:00
> > 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Tue, 2 Feb 2016 10:26:10 -0800
> > +Subject: [PATCH 29/37] nios2: Define MUSL_DYNAMIC_LINKER
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Marek Vasut <marex@denx.de>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + gcc/config/nios2/linux.h | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/gcc/config/nios2/linux.h b/gcc/config/nios2/linux.h
> > +index 698734add35..eeee60ecfea 100644
> > +--- a/gcc/config/nios2/linux.h
> > ++++ b/gcc/config/nios2/linux.h
> > +@@ -30,6 +30,7 @@
> > + #define CPP_SPEC "%{posix:-D_POSIX_SOURCE} %{pthread:-D_REENTRANT}"
> > +
> > + #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-nios2.so.1"
> > ++#define MUSL_DYNAMIC_LINKER  "/lib/ld-musl-nios2.so.1"
> > +
> > + #undef LINK_SPEC
> > + #define LINK_SPEC LINK_SPEC_ENDIAN \
> > +--
> > +2.20.1
> > +
> > diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0030-Add-
> > ssp_nonshared-to-link-commandline-for-musl-targe.patch
> > b/meta/recipes-devtools/gcc/gcc-9.1/0030-Add-ssp_nonshared-to-link-
> > commandline-for-musl-targe.patch
> > new file mode 100644
> > index 0000000000..792e852614
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc-9.1/0030-Add-ssp_nonshared-to-
> > link-commandline-for-musl-targe.patch
> > @@ -0,0 +1,87 @@
> > +From 6232013df7fd65c994869789fa4b93c8d2303d1c Mon Sep 17 00:00:00
> > 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Tue, 27 Jun 2017 18:10:54 -0700
> > +Subject: [PATCH 30/37] Add ssp_nonshared to link commandline for
> > musl targets
> > +
> > +when -fstack-protector options are enabled we need to
> > +link with ssp_shared on musl since it does not provide
> > +the __stack_chk_fail_local() so essentially it provides
> > +libssp but not libssp_nonshared something like
> > +TARGET_LIBC_PROVIDES_SSP_BUT_NOT_SSP_NONSHARED
> > + where-as for glibc the needed symbols
> > +are already present in libc_nonshared library therefore
> > +we do not need any library helper on glibc based systems
> > +but musl needs the libssp_noshared from gcc
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + gcc/config/linux.h          |  7 +++++++
> > + gcc/config/rs6000/linux.h   | 10 ++++++++++
> > + gcc/config/rs6000/linux64.h | 10 ++++++++++
> > + 3 files changed, 27 insertions(+)
> > +
> > +diff --git a/gcc/config/linux.h b/gcc/config/linux.h
> > +index 4b05d8e93d1..0ca117e2ed4 100644
> > +--- a/gcc/config/linux.h
> > ++++ b/gcc/config/linux.h
> > +@@ -195,6 +195,13 @@ see the files COPYING3 and COPYING.RUNTIME
> > respectively.  If not, see
> > +     { GCC_INCLUDE_DIR, "GCC", 0, 1, 0, 0 },         \
> > +     { 0, 0, 0, 0, 0, 0 }                            \
> > +   }
> > ++#ifdef TARGET_LIBC_PROVIDES_SSP
> > ++#undef LINK_SSP_SPEC
> > ++#define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
> > ++                   "|fstack-protector-strong|fstack-protector-
> > explicit" \
> > ++                   ":-lssp_nonshared}"
> > ++#endif
> > ++
> > + #endif
> > +
> > + #if (DEFAULT_LIBC == LIBC_UCLIBC) && defined (SINGLE_LIBC) /*
> > uClinux */
> > +diff --git a/gcc/config/rs6000/linux.h b/gcc/config/rs6000/linux.h
> > +index 96b97877989..0bbde54c844 100644
> > +--- a/gcc/config/rs6000/linux.h
> > ++++ b/gcc/config/rs6000/linux.h
> > +@@ -107,6 +107,16 @@
> > +                                      " -m elf32ppclinux")
> > + #endif
> > +
> > ++/* link libssp_nonshared.a with musl */
> > ++#if DEFAULT_LIBC == LIBC_MUSL
> > ++#ifdef TARGET_LIBC_PROVIDES_SSP
> > ++#undef LINK_SSP_SPEC
> > ++#define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
> > ++                   "|fstack-protector-strong|fstack-protector-
> > explicit" \
> > ++                   ":-lssp_nonshared}"
> > ++#endif
> > ++#endif
> > ++
> > + #undef LINK_OS_LINUX_SPEC
> > + #define LINK_OS_LINUX_SPEC LINK_OS_LINUX_EMUL " %{!shared:
> > %{!static: \
> > +   %{!static-pie: \
> > +diff --git a/gcc/config/rs6000/linux64.h
> > b/gcc/config/rs6000/linux64.h
> > +index 982ca274621..83c07b275da 100644
> > +--- a/gcc/config/rs6000/linux64.h
> > ++++ b/gcc/config/rs6000/linux64.h
> > +@@ -461,6 +461,16 @@ extern int dot_symbols;
> > +                                        " -m elf64ppc")
> > + #endif
> > +
> > ++/* link libssp_nonshared.a with musl */
> > ++#if DEFAULT_LIBC == LIBC_MUSL
> > ++#ifdef TARGET_LIBC_PROVIDES_SSP
> > ++#undef LINK_SSP_SPEC
> > ++#define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
> > ++                   "|fstack-protector-strong|fstack-protector-
> > explicit" \
> > ++                   ":-lssp_nonshared}"
> > ++#endif
> > ++#endif
> > ++
> > + #define LINK_OS_LINUX_SPEC32 LINK_OS_LINUX_EMUL32 " %{!shared:
> > %{!static: \
> > +   %{!static-pie: \
> > +     %{rdynamic:-export-dynamic} \
> > +--
> > +2.20.1
> > +
> > diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0031-libgcc-Add-knob-
> > to-use-ldbl-128-on-ppc.patch b/meta/recipes-devtools/gcc/gcc-
> > 9.1/0031-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
> > new file mode 100644
> > index 0000000000..efa40bec5e
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc-9.1/0031-libgcc-Add-knob-to-use-
> > ldbl-128-on-ppc.patch
> > @@ -0,0 +1,125 @@
> > +From 1877b2ee5835a3716e6544706fbccd8c656e0a32 Mon Sep 17 00:00:00
> > 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Apr 2016 20:03:28 +0000
> > +Subject: [PATCH 31/37] libgcc: Add knob to use ldbl-128 on ppc
> > +
> > +musl does not support ldbl 128 so we can not assume
> > +that linux as a whole supports ldbl-128 bits, instead
> > +act upon configure option passed to gcc and assume no
> > +on musl and yes otherwise if no option is passed since
> > +default behaviour is to assume ldbl128 it does not
> > +change the defaults
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + libgcc/Makefile.in           |  1 +
> > + libgcc/config/rs6000/t-linux |  5 ++++-
> > + libgcc/configure             | 18 ++++++++++++++++++
> > + libgcc/configure.ac          | 12 ++++++++++++
> > + 4 files changed, 35 insertions(+), 1 deletion(-)
> > + mode change 100644 => 100755 libgcc/configure
> > +
> > +diff --git a/libgcc/Makefile.in b/libgcc/Makefile.in
> > +index ea390a5bbea..114c7876304 100644
> > +--- a/libgcc/Makefile.in
> > ++++ b/libgcc/Makefile.in
> > +@@ -50,6 +50,7 @@ unwind_header = @unwind_header@
> > + md_unwind_header = @md_unwind_header@
> > + sfp_machine_header = @sfp_machine_header@
> > + thread_header = @thread_header@
> > ++with_ldbl128 = @with_ldbl128@
> > +
> > + host_noncanonical = @host_noncanonical@
> > + real_host_noncanonical = @real_host_noncanonical@
> > +diff --git a/libgcc/config/rs6000/t-linux b/libgcc/config/rs6000/t-
> > linux
> > +index 4f6d4c4a4d2..c50dd94a2da 100644
> > +--- a/libgcc/config/rs6000/t-linux
> > ++++ b/libgcc/config/rs6000/t-linux
> > +@@ -1,3 +1,6 @@
> > + SHLIB_MAPFILES += $(srcdir)/config/rs6000/libgcc-glibc.ver
> > +
> > +-HOST_LIBGCC2_CFLAGS += -mlong-double-128 -mno-minimal-toc
> > ++ifeq ($(with_ldbl128),yes)
> > ++HOST_LIBGCC2_CFLAGS += -mlong-double-128
> > ++endif
> > ++HOST_LIBGCC2_CFLAGS += -mno-minimal-toc
> > +diff --git a/libgcc/configure b/libgcc/configure
> > +old mode 100644
> > +new mode 100755
> > +index 36dbbc1f699..b5dd5c34e2a
> > +--- a/libgcc/configure
> > ++++ b/libgcc/configure
> > +@@ -651,6 +651,7 @@ build_vendor
> > + build_cpu
> > + build
> > + with_aix_soname
> > ++with_ldbl128
> > + enable_vtable_verify
> > + enable_gcov
> > + enable_shared
> > +@@ -702,6 +703,7 @@ with_ld
> > + enable_shared
> > + enable_gcov
> > + enable_vtable_verify
> > ++with_long_double_128
> > + with_aix_soname
> > + enable_version_specific_runtime_libs
> > + with_slibdir
> > +@@ -1363,6 +1365,7 @@ Optional Packages:
> > +   --with-target-subdir=SUBDIR      Configuring in a subdirectory
> > for target
> > +   --with-cross-host=HOST           Configuring with a cross
> > compiler
> > +   --with-ld               arrange to use the specified ld (full
> > pathname)
> > ++  --with-long-double-128  use 128-bit long double by default
> > +   --with-aix-soname=aix|svr4|both
> > +                           shared library versioning (aka "SONAME")
> > variant to
> > +                           provide on AIX
> > +@@ -2268,6 +2271,21 @@ fi
> > +
> > +
> > +
> > ++# Check whether --with-long-double-128 was given.
> > ++if test "${with_long_double_128+set}" = set; then :
> > ++  withval=$with_long_double_128;
> > with_ldbl128="$with_long_double_128"
> > ++else
> > ++  case "${host}" in
> > ++ power*-*-musl*)
> > ++   with_ldbl128="no";;
> > ++ *) with_ldbl128="yes";;
> > ++ esac
> > ++
> > ++fi
> > ++
> > ++
> > ++
> > ++
> > + # Check whether --with-aix-soname was given.
> > + if test "${with_aix_soname+set}" = set; then :
> > +   withval=$with_aix_soname; case "${host}:${enable_shared}" in
> > +diff --git a/libgcc/configure.ac b/libgcc/configure.ac
> > +index 8e96cafdf8b..9247856bf24 100644
> > +--- a/libgcc/configure.ac
> > ++++ b/libgcc/configure.ac
> > +@@ -82,6 +82,18 @@ AC_ARG_ENABLE(vtable-verify,
> > + [enable_vtable_verify=no])
> > + AC_SUBST(enable_vtable_verify)
> > +
> > ++AC_ARG_WITH(long-double-128,
> > ++[AS_HELP_STRING([--with-long-double-128],
> > ++    [use 128-bit long double by default])],
> > ++      with_ldbl128="$with_long_double_128",
> > ++[case "${host}" in
> > ++ power*-*-musl*)
> > ++   with_ldbl128="no";;
> > ++ *) with_ldbl128="yes";;
> > ++ esac
> > ++])
> > ++AC_SUBST(with_ldbl128)
> > ++
> > + AC_ARG_WITH(aix-soname,
> > + [AS_HELP_STRING([--with-aix-soname=aix|svr4|both],
> > +     [shared library versioning (aka "SONAME") variant to provide on
> > AIX])],
> > +--
> > +2.20.1
> > +
> > diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0032-Link-libgcc-
> > using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch b/meta/recipes-
> > devtools/gcc/gcc-9.1/0032-Link-libgcc-using-LDFLAGS-not-just-
> > SHLIB_LDFLAGS.patch
> > new file mode 100644
> > index 0000000000..3de8345f93
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc-9.1/0032-Link-libgcc-using-
> > LDFLAGS-not-just-SHLIB_LDFLAGS.patch
> > @@ -0,0 +1,29 @@
> > +From 9d76a765a12677597134953352b25dc16dea721e Mon Sep 17 00:00:00
> > 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Wed, 4 May 2016 21:11:34 -0700
> > +Subject: [PATCH 32/37] Link libgcc using LDFLAGS, not just
> > SHLIB_LDFLAGS
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + libgcc/config/t-slibgcc | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/libgcc/config/t-slibgcc b/libgcc/config/t-slibgcc
> > +index 099bf23e62f..436b277a79f 100644
> > +--- a/libgcc/config/t-slibgcc
> > ++++ b/libgcc/config/t-slibgcc
> > +@@ -32,7 +32,7 @@ SHLIB_INSTALL_SOLINK = $(LN_S) $(SHLIB_SONAME) \
> > +     $(DESTDIR)$(slibdir)$(SHLIB_SLIBDIR_QUAL)/$(SHLIB_SOLINK)
> > +
> > + SHLIB_LINK = $(CC) $(LIBGCC2_CFLAGS) -shared -nodefaultlibs \
> > +-    $(SHLIB_LDFLAGS) \
> > ++    $(LDFLAGS) $(SHLIB_LDFLAGS) \
> > +     -o $(SHLIB_DIR)/$(SHLIB_SONAME).tmp @multilib_flags@ \
> > +     $(SHLIB_OBJS) $(SHLIB_LC) && \
> > +     rm -f $(SHLIB_DIR)/$(SHLIB_SOLINK) && \
> > +--
> > +2.20.1
> > +
> > diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0033-libgcc_s-Use-
> > alias-for-__cpu_indicator_init-instead-.patch b/meta/recipes-
> > devtools/gcc/gcc-9.1/0033-libgcc_s-Use-alias-for-
> > __cpu_indicator_init-instead-.patch
> > new file mode 100644
> > index 0000000000..d8cc643211
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc-9.1/0033-libgcc_s-Use-alias-for-
> > __cpu_indicator_init-instead-.patch
> > @@ -0,0 +1,86 @@
> > +From 6c001e08bcd0568367a4aa2f991ab7d85b43a43d Mon Sep 17 00:00:00
> > 2001
> > +From: Szabolcs Nagy <nsz@port70.net>
> > +Date: Sat, 24 Oct 2015 20:09:53 +0000
> > +Subject: [PATCH 33/37] libgcc_s: Use alias for __cpu_indicator_init
> > instead of
> > + symver
> > +
> > +Adapter from
> > +
> > +https://gcc.gnu.org/ml/gcc-patches/2015-05/msg00899.html
> > +
> > +This fix was debated but hasnt been applied gcc upstream since
> > +they expect musl to support '@' in symbol versioning which is
> > +a sun/gnu versioning extention. This patch however avoids the
> > +need for the '@' symbols at all
> > +
> > +libgcc/Changelog:
> > +
> > +2015-05-11  Szabolcs Nagy  <szabolcs.nagy@arm.com>
> > +
> > +     * config/i386/cpuinfo.c (__cpu_indicator_init_local): Add.
> > +     (__cpu_indicator_init@GCC_4.8.0, __cpu_model@GCC_4.8.0):
> > Remove.
> > +
> > +     * config/i386/t-linux (HOST_LIBGCC2_CFLAGS): Remove
> > -DUSE_ELF_SYMVER.
> > +
> > +gcc/Changelog:
> > +
> > +2015-05-11  Szabolcs Nagy  <szabolcs.nagy@arm.com>
> > +
> > +     * config/i386/i386.c (ix86_expand_builtin): Make
> > __builtin_cpu_init
> > +     call __cpu_indicator_init_local instead of
> > __cpu_indicator_init.
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + gcc/config/i386/i386.c       | 4 ++--
> > + libgcc/config/i386/cpuinfo.c | 6 +++---
> > + libgcc/config/i386/t-linux   | 2 +-
> > + 3 files changed, 6 insertions(+), 6 deletions(-)
> > +
> > +diff --git a/gcc/config/i386/i386.c b/gcc/config/i386/i386.c
> > +index 88557f26c44..839308e2799 100644
> > +--- a/gcc/config/i386/i386.c
> > ++++ b/gcc/config/i386/i386.c
> > +@@ -36577,10 +36577,10 @@ ix86_expand_builtin (tree exp, rtx target,
> > rtx subtarget,
> > +     {
> > +     case IX86_BUILTIN_CPU_INIT:
> > +       {
> > +-    /* Make it call __cpu_indicator_init in libgcc. */
> > ++    /* Make it call __cpu_indicator_init_local in libgcc.a. */
> > +     tree call_expr, fndecl, type;
> > +         type = build_function_type_list (integer_type_node,
> > NULL_TREE);
> > +-    fndecl = build_fn_decl ("__cpu_indicator_init", type);
> > ++    fndecl = build_fn_decl ("__cpu_indicator_init_local", type);
> > +     call_expr = build_call_expr (fndecl, 0);
> > +     return expand_expr (call_expr, target, mode, EXPAND_NORMAL);
> > +       }
> > +diff --git a/libgcc/config/i386/cpuinfo.c
> > b/libgcc/config/i386/cpuinfo.c
> > +index d6cb2de6265..ce04ef78205 100644
> > +--- a/libgcc/config/i386/cpuinfo.c
> > ++++ b/libgcc/config/i386/cpuinfo.c
> > +@@ -504,7 +504,7 @@ __cpu_indicator_init (void)
> > +   return 0;
> > + }
> > +
> > +-#if defined SHARED && defined USE_ELF_SYMVER
> > +-__asm__ (".symver __cpu_indicator_init, __cpu_indicator_init@GCC_4.
> > 8.0");
> > +-__asm__ (".symver __cpu_model, __cpu_model@GCC_4.8.0");
> > ++#ifndef SHARED
> > ++int __cpu_indicator_init_local (void)
> > ++  __attribute__ ((weak, alias ("__cpu_indicator_init")));
> > + #endif
> > +diff --git a/libgcc/config/i386/t-linux b/libgcc/config/i386/t-linux
> > +index 8506a635790..564296f788e 100644
> > +--- a/libgcc/config/i386/t-linux
> > ++++ b/libgcc/config/i386/t-linux
> > +@@ -3,5 +3,5 @@
> > + # t-slibgcc-elf-ver and t-linux
> > + SHLIB_MAPFILES = libgcc-std.ver $(srcdir)/config/i386/libgcc-
> > glibc.ver
> > +
> > +-HOST_LIBGCC2_CFLAGS += -mlong-double-80 -DUSE_ELF_SYMVER
> > $(CET_FLAGS)
> > ++HOST_LIBGCC2_CFLAGS += -mlong-double-80 $(CET_FLAGS)
> > + CRTSTUFF_T_CFLAGS += $(CET_FLAGS)
> > +--
> > +2.20.1
> > +
> > diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0034-sync-gcc-
> > stddef.h-with-musl.patch b/meta/recipes-devtools/gcc/gcc-9.1/0034-
> > sync-gcc-stddef.h-with-musl.patch
> > new file mode 100644
> > index 0000000000..a2c35ab537
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc-9.1/0034-sync-gcc-stddef.h-with-
> > musl.patch
> > @@ -0,0 +1,91 @@
> > +From 83ba95929c5908ae0f51ce148a30f85b085a178a Mon Sep 17 00:00:00
> > 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 3 Feb 2017 12:56:00 -0800
> > +Subject: [PATCH 34/37] sync gcc stddef.h with musl
> > +
> > +musl defines ptrdiff_t size_t and wchar_t
> > +so dont define them here if musl is definining them
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + gcc/ginclude/stddef.h | 9 +++++++++
> > + 1 file changed, 9 insertions(+)
> > +
> > +diff --git a/gcc/ginclude/stddef.h b/gcc/ginclude/stddef.h
> > +index da692e1c01a..9a00c261adb 100644
> > +--- a/gcc/ginclude/stddef.h
> > ++++ b/gcc/ginclude/stddef.h
> > +@@ -128,6 +128,7 @@ _TYPE_wchar_t;
> > + #ifndef ___int_ptrdiff_t_h
> > + #ifndef _GCC_PTRDIFF_T
> > + #ifndef _PTRDIFF_T_DECLARED /* DragonFly */
> > ++#ifndef __DEFINED_ptrdiff_t /* musl */
> > + #define _PTRDIFF_T
> > + #define _T_PTRDIFF_
> > + #define _T_PTRDIFF
> > +@@ -137,10 +138,12 @@ _TYPE_wchar_t;
> > + #define ___int_ptrdiff_t_h
> > + #define _GCC_PTRDIFF_T
> > + #define _PTRDIFF_T_DECLARED
> > ++#define __DEFINED_ptrdiff_t /* musl */
> > + #ifndef __PTRDIFF_TYPE__
> > + #define __PTRDIFF_TYPE__ long int
> > + #endif
> > + typedef __PTRDIFF_TYPE__ ptrdiff_t;
> > ++#endif /* __DEFINED_ptrdiff_t */
> > + #endif /* _PTRDIFF_T_DECLARED */
> > + #endif /* _GCC_PTRDIFF_T */
> > + #endif /* ___int_ptrdiff_t_h */
> > +@@ -178,6 +181,7 @@ typedef __PTRDIFF_TYPE__ ptrdiff_t;
> > + #ifndef _GCC_SIZE_T
> > + #ifndef _SIZET_
> > + #ifndef __size_t
> > ++#ifndef __DEFINED_size_t /* musl */
> > + #define __size_t__  /* BeOS */
> > + #define __SIZE_T__  /* Cray Unicos/Mk */
> > + #define _SIZE_T
> > +@@ -194,6 +198,7 @@ typedef __PTRDIFF_TYPE__ ptrdiff_t;
> > + #define ___int_size_t_h
> > + #define _GCC_SIZE_T
> > + #define _SIZET_
> > ++#define __DEFINED_size_t /* musl */
> > + #if defined (__FreeBSD__) \
> > +   || defined(__DragonFly__) \
> > +   || defined(__FreeBSD_kernel__) \
> > +@@ -228,6 +233,7 @@ typedef long ssize_t;
> > + #endif /* _SIZE_T */
> > + #endif /* __SIZE_T__ */
> > + #endif /* __size_t__ */
> > ++#endif /* __DEFINED_size_t */
> > + #undef      __need_size_t
> > + #endif /* _STDDEF_H or __need_size_t.  */
> > +
> > +@@ -257,6 +263,7 @@ typedef long ssize_t;
> > + #ifndef ___int_wchar_t_h
> > + #ifndef __INT_WCHAR_T_H
> > + #ifndef _GCC_WCHAR_T
> > ++#ifndef __DEFINED_wchar_t /* musl */
> > + #define __wchar_t__ /* BeOS */
> > + #define __WCHAR_T__ /* Cray Unicos/Mk */
> > + #define _WCHAR_T
> > +@@ -272,6 +279,7 @@ typedef long ssize_t;
> > + #define __INT_WCHAR_T_H
> > + #define _GCC_WCHAR_T
> > + #define _WCHAR_T_DECLARED
> > ++#define __DEFINED_wchar_t /* musl */
> > +
> > + /* On BSD/386 1.1, at least, machine/ansi.h defines _BSD_WCHAR_T_
> > +    instead of _WCHAR_T_, and _BSD_RUNE_T_ (which, unlike the other
> > +@@ -337,6 +345,7 @@ typedef __WCHAR_TYPE__ wchar_t;
> > + #endif
> > + #endif /* __WCHAR_T__ */
> > + #endif /* __wchar_t__ */
> > ++#endif /* __DEFINED_wchar_t musl */
> > + #undef      __need_wchar_t
> > + #endif /* _STDDEF_H or __need_wchar_t.  */
> > +
> > +--
> > +2.20.1
> > +
> > diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0035-fix-segmentation-
> > fault-in-precompiled-header-generat.patch b/meta/recipes-
> > devtools/gcc/gcc-9.1/0035-fix-segmentation-fault-in-precompiled-
> > header-generat.patch
> > new file mode 100644
> > index 0000000000..ad1f6e7d10
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc-9.1/0035-fix-segmentation-fault-
> > in-precompiled-header-generat.patch
> > @@ -0,0 +1,60 @@
> > +From c4f89e62c56975fee99304c9cbbe5be6e8bc9ed6 Mon Sep 17 00:00:00
> > 2001
> > +From: Juro Bystricky <juro.bystricky@intel.com>
> > +Date: Mon, 19 Mar 2018 22:31:20 -0700
> > +Subject: [PATCH 35/37] fix segmentation fault in precompiled header
> > generation
> > +
> > +Prevent a segmentation fault which occurs when using incorrect
> > +structure trying to access name of some named operators, such as
> > +CPP_NOT, CPP_AND etc. "token->val.node.spelling" cannot be used in
> > +those cases, as is may not be initialized at all.
> > +
> > +[YOCTO #11738]
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + libcpp/lex.c | 26 +++++++++++++++++++++-----
> > + 1 file changed, 21 insertions(+), 5 deletions(-)
> > +
> > +diff --git a/libcpp/lex.c b/libcpp/lex.c
> > +index eedfcbb3146..15040a1b1f0 100644
> > +--- a/libcpp/lex.c
> > ++++ b/libcpp/lex.c
> > +@@ -3280,11 +3280,27 @@ cpp_spell_token (cpp_reader *pfile, const
> > cpp_token *token,
> > +     spell_ident:
> > +     case SPELL_IDENT:
> > +       if (forstring)
> > +-    {
> > +-      memcpy (buffer, NODE_NAME (token->val.node.spelling),
> > +-              NODE_LEN (token->val.node.spelling));
> > +-      buffer += NODE_LEN (token->val.node.spelling);
> > +-    }
> > ++        {
> > ++          if (token->type == CPP_NAME)
> > ++            {
> > ++              memcpy (buffer, NODE_NAME (token->val.node.spelling),
> > ++                    NODE_LEN (token->val.node.spelling));
> > ++              buffer += NODE_LEN (token->val.node.spelling);
> > ++              break;
> > ++            }
> > ++          /* NAMED_OP, cannot use node.spelling */
> > ++          if (token->flags & NAMED_OP)
> > ++            {
> > ++              const char *str = cpp_named_operator2name (token-
> > >type);
> > ++              if (str)
> > ++                {
> > ++                  size_t len = strlen(str);
> > ++                  memcpy(buffer, str, len);
> > ++                  buffer += len;
> > ++                }
> > ++              break;
> > ++            }
> > ++        }
> > +       else
> > +     buffer = _cpp_spell_ident_ucns (buffer, token->val.node.node);
> > +       break;
> > +--
> > +2.20.1
> > +
> > diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0036-Fix-for-
> > testsuite-failure.patch b/meta/recipes-devtools/gcc/gcc-9.1/0036-Fix-
> > for-testsuite-failure.patch
> > new file mode 100644
> > index 0000000000..4fb0698afc
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc-9.1/0036-Fix-for-testsuite-
> > failure.patch
> > @@ -0,0 +1,258 @@
> > +From 8d773b5ba6cf396ca76611963127ba2b516272b3 Mon Sep 17 00:00:00
> > 2001
> > +From: RAGHUNATH LOLUR <raghunath.lolur@kpit.com>
> > +Date: Wed, 6 Dec 2017 22:52:26 -0800
> > +Subject: [PATCH 36/37] Fix for testsuite failure
> > +
> > +2017-11-16  Raghunath Lolur  <raghunath.lolur@kpit.com>
> > +
> > +     * gcc.dg/pr56275.c: If SSE is disabled, ensure that
> > +     "-mfpmath" is not set to use SSE. Set "-mfpmath=387".
> > +     * gcc.dg/pr68306.c: Likewise
> > +     * gcc.dg/pr68306-2.c: Likewise
> > +     * gcc.dg/pr68306-3.c: Likewise
> > +     * gcc.dg/pr69634.c: Likewise
> > +     * gcc.target/i386/amd64-abi-1.c: Likewise
> > +     * gcc.target/i386/funcspec-6.c: Likewise
> > +     * gcc.target/i386/interrupt-387-err-1.c: Likewise
> > +     * gcc.target/i386/isa-14.c: Likewise
> > +     * gcc.target/i386/pr44948-2b.c: Likewise
> > +     * gcc.target/i386/pr53425-1.c: Likewise
> > +     * gcc.target/i386/pr53425-2.c: Likewise
> > +     * gcc.target/i386/pr55247.c: Likewise
> > +     * gcc.target/i386/pr59644.c: Likewise
> > +     * gcc.target/i386/pr62120.c: Likewise
> > +     * gcc.target/i386/pr70467-1.c: Likewise
> > +     * gcc.target/i386/warn-vect-op-1.c: Likewise
> > +
> > +If -Wall, -Werror are used during compilation various test cases
> > fail
> > +to compile.
> > +
> > +If SSE is disabled, be sure to -mfpmath=387 to resolve this.
> > +
> > +This patch removes the changes to Changelog from the original patch.
> > +This will help us avoid conflicts.
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> > +---
> > + gcc/testsuite/gcc.dg/pr56275.c                      | 2 +-
> > + gcc/testsuite/gcc.dg/pr68306-2.c                    | 2 +-
> > + gcc/testsuite/gcc.dg/pr68306-3.c                    | 2 +-
> > + gcc/testsuite/gcc.dg/pr68306.c                      | 2 +-
> > + gcc/testsuite/gcc.dg/pr69634.c                      | 2 +-
> > + gcc/testsuite/gcc.target/i386/amd64-abi-1.c         | 2 +-
> > + gcc/testsuite/gcc.target/i386/funcspec-6.c          | 1 +
> > + gcc/testsuite/gcc.target/i386/interrupt-387-err-1.c | 2 +-
> > + gcc/testsuite/gcc.target/i386/isa-14.c              | 2 +-
> > + gcc/testsuite/gcc.target/i386/pr44948-2b.c          | 2 +-
> > + gcc/testsuite/gcc.target/i386/pr53425-1.c           | 2 +-
> > + gcc/testsuite/gcc.target/i386/pr53425-2.c           | 2 +-
> > + gcc/testsuite/gcc.target/i386/pr55247.c             | 2 +-
> > + gcc/testsuite/gcc.target/i386/pr59644.c             | 2 +-
> > + gcc/testsuite/gcc.target/i386/pr62120.c             | 2 +-
> > + gcc/testsuite/gcc.target/i386/pr70467-1.c           | 2 +-
> > + gcc/testsuite/gcc.target/i386/warn-vect-op-1.c      | 2 +-
> > + 17 files changed, 17 insertions(+), 16 deletions(-)
> > +
> > +diff --git a/gcc/testsuite/gcc.dg/pr56275.c
> > b/gcc/testsuite/gcc.dg/pr56275.c
> > +index b901bb2b199..a4f6c95e1a1 100644
> > +--- a/gcc/testsuite/gcc.dg/pr56275.c
> > ++++ b/gcc/testsuite/gcc.dg/pr56275.c
> > +@@ -1,6 +1,6 @@
> > + /* { dg-do compile } */
> > + /* { dg-options "-O2" } */
> > +-/* { dg-additional-options "-mno-sse" { target { i?86-*-* x86_64-*-
> > * } } } */
> > ++/* { dg-additional-options "-mno-sse -mfpmath=387" { target { i?86-
> > *-* x86_64-*-* } } } */
> > +
> > + typedef long long v2tw __attribute__ ((vector_size (2 * sizeof
> > (long long))));
> > +
> > +diff --git a/gcc/testsuite/gcc.dg/pr68306-2.c
> > b/gcc/testsuite/gcc.dg/pr68306-2.c
> > +index 4672ebe7987..2a368c484b6 100644
> > +--- a/gcc/testsuite/gcc.dg/pr68306-2.c
> > ++++ b/gcc/testsuite/gcc.dg/pr68306-2.c
> > +@@ -1,6 +1,6 @@
> > + /* { dg-do compile } */
> > + /* { dg-options "-O3" } */
> > +-/* { dg-additional-options "-mno-sse -mno-mmx" { target i?86-*-*
> > x86_64-*-* } } */
> > ++/* { dg-additional-options "-mno-sse -mno-mmx -mfpmath=387" {
> > target i?86-*-* x86_64-*-* } } */
> > +
> > + struct {
> > +     int tz_minuteswest;
> > +diff --git a/gcc/testsuite/gcc.dg/pr68306-3.c
> > b/gcc/testsuite/gcc.dg/pr68306-3.c
> > +index f5a8c102cf8..df3390c64c2 100644
> > +--- a/gcc/testsuite/gcc.dg/pr68306-3.c
> > ++++ b/gcc/testsuite/gcc.dg/pr68306-3.c
> > +@@ -1,6 +1,6 @@
> > + /* { dg-do compile } */
> > + /* { dg-options "-O3" } */
> > +-/* { dg-additional-options "-mno-sse -mno-mmx" { target i?86-*-*
> > x86_64-*-* } } */
> > ++/* { dg-additional-options "-mno-sse -mno-mmx -mfpmath=387" {
> > target i?86-*-* x86_64-*-* } } */
> > + /* { dg-additional-options "-mno-altivec -mno-vsx" { target
> > powerpc*-*-* } } */
> > +
> > + extern void fn2();
> > +diff --git a/gcc/testsuite/gcc.dg/pr68306.c
> > b/gcc/testsuite/gcc.dg/pr68306.c
> > +index 54e5b40f221..0813389e2c1 100644
> > +--- a/gcc/testsuite/gcc.dg/pr68306.c
> > ++++ b/gcc/testsuite/gcc.dg/pr68306.c
> > +@@ -1,6 +1,6 @@
> > + /* { dg-do compile } */
> > + /* { dg-options "-O3" } */
> > +-/* { dg-additional-options "-mno-sse -mno-mmx" { target i?86-*-*
> > x86_64-*-* } } */
> > ++/* { dg-additional-options "-mno-sse -mno-mmx -mfpmath=387" {
> > target i?86-*-* x86_64-*-* } } */
> > +
> > + enum powerpc_pmc_type { PPC_PMC_IBM };
> > + struct {
> > +diff --git a/gcc/testsuite/gcc.dg/pr69634.c
> > b/gcc/testsuite/gcc.dg/pr69634.c
> > +index 60a56149463..bcc23f9ccd6 100644
> > +--- a/gcc/testsuite/gcc.dg/pr69634.c
> > ++++ b/gcc/testsuite/gcc.dg/pr69634.c
> > +@@ -1,6 +1,6 @@
> > + /* { dg-do compile } */
> > + /* { dg-options "-O2 -fno-dce -fschedule-insns -fno-tree-vrp
> > -fcompare-debug -Wno-psabi" } */
> > +-/* { dg-additional-options "-mno-sse" { target i?86-*-* x86_64-*-*
> > } } */
> > ++/* { dg-additional-options "-mno-sse -mfpmath=387" { target i?86-*-
> > * x86_64-*-* } } */
> > + /* { dg-require-effective-target scheduling } */
> > +
> > + typedef unsigned short u16;
> > +diff --git a/gcc/testsuite/gcc.target/i386/amd64-abi-1.c
> > b/gcc/testsuite/gcc.target/i386/amd64-abi-1.c
> > +index 69fde57bf06..7f1f1c03edf 100644
> > +--- a/gcc/testsuite/gcc.target/i386/amd64-abi-1.c
> > ++++ b/gcc/testsuite/gcc.target/i386/amd64-abi-1.c
> > +@@ -1,5 +1,5 @@
> > + /* { dg-do compile { target { ! ia32 } } } */
> > +-/* { dg-options "-mno-sse" } */
> > ++/* { dg-options "-mno-sse -mfpmath=387" } */
> > + /* { dg-additional-options "-mabi=sysv" { target *-*-mingw* } } */
> > +
> > + double foo(void) { return 0; }      /* { dg-error "SSE disabled" }
> > */
> > +diff --git a/gcc/testsuite/gcc.target/i386/funcspec-6.c
> > b/gcc/testsuite/gcc.target/i386/funcspec-6.c
> > +index ea896b7ebfd..bf15569b826 100644
> > +--- a/gcc/testsuite/gcc.target/i386/funcspec-6.c
> > ++++ b/gcc/testsuite/gcc.target/i386/funcspec-6.c
> > +@@ -1,6 +1,7 @@
> > + /* Test whether all of the 64-bit function specific options are
> > accepted
> > +    without error.  */
> > + /* { dg-do compile { target { ! ia32 } } } */
> > ++/* { dg-additional-options "-mfpmath=387" } */
> > +
> > + #include "funcspec-56.inc"
> > +
> > +diff --git a/gcc/testsuite/gcc.target/i386/interrupt-387-err-1.c
> > b/gcc/testsuite/gcc.target/i386/interrupt-387-err-1.c
> > +index 3fbdc881dda..6b4d9d1252a 100644
> > +--- a/gcc/testsuite/gcc.target/i386/interrupt-387-err-1.c
> > ++++ b/gcc/testsuite/gcc.target/i386/interrupt-387-err-1.c
> > +@@ -1,5 +1,5 @@
> > + /* { dg-do compile } */
> > +-/* { dg-options "-O2 -mgeneral-regs-only -mno-cld -mno-iamcu
> > -m80387" } */
> > ++/* { dg-options "-O2 -mgeneral-regs-only -mno-cld -mno-iamcu
> > -m80387 -mfpmath=387" } */
> > +
> > + typedef unsigned int uword_t __attribute__ ((mode (__word__)));
> > +
> > +diff --git a/gcc/testsuite/gcc.target/i386/isa-14.c
> > b/gcc/testsuite/gcc.target/i386/isa-14.c
> > +index 5d49e6e77fe..1de2db92bdd 100644
> > +--- a/gcc/testsuite/gcc.target/i386/isa-14.c
> > ++++ b/gcc/testsuite/gcc.target/i386/isa-14.c
> > +@@ -1,5 +1,5 @@
> > + /* { dg-do run } */
> > +-/* { dg-options "-march=x86-64 -msse4a -mfma4 -mno-sse" } */
> > ++/* { dg-options "-march=x86-64 -msse4a -mfma4 -mno-sse
> > -mfpmath=387" } */
> > +
> > + extern void abort (void);
> > +
> > +diff --git a/gcc/testsuite/gcc.target/i386/pr44948-2b.c
> > b/gcc/testsuite/gcc.target/i386/pr44948-2b.c
> > +index fa1769b62fb..f79fb12726f 100644
> > +--- a/gcc/testsuite/gcc.target/i386/pr44948-2b.c
> > ++++ b/gcc/testsuite/gcc.target/i386/pr44948-2b.c
> > +@@ -1,5 +1,5 @@
> > + /* { dg-do compile } */
> > +-/* { dg-options "-O -mno-sse -Wno-psabi -mtune=generic" } */
> > ++/* { dg-options "-O -mno-sse -Wno-psabi -mtune=generic
> > -mfpmath=387" } */
> > +
> > + struct A
> > + {
> > +diff --git a/gcc/testsuite/gcc.target/i386/pr53425-1.c
> > b/gcc/testsuite/gcc.target/i386/pr53425-1.c
> > +index 2e89ff7d81d..6339bf6b736 100644
> > +--- a/gcc/testsuite/gcc.target/i386/pr53425-1.c
> > ++++ b/gcc/testsuite/gcc.target/i386/pr53425-1.c
> > +@@ -1,6 +1,6 @@
> > + /* PR target/53425 */
> > + /* { dg-do compile { target { ! ia32 } } } */
> > +-/* { dg-options "-O2 -mno-sse" } */
> > ++/* { dg-options "-O2 -mno-sse -mfpmath=387" } */
> > + /* { dg-skip-if "no SSE vector" { x86_64-*-mingw* } } */
> > +
> > + typedef double __v2df __attribute__ ((__vector_size__ (16)));
> > +diff --git a/gcc/testsuite/gcc.target/i386/pr53425-2.c
> > b/gcc/testsuite/gcc.target/i386/pr53425-2.c
> > +index 61f6283dbe9..2c5a55f0ac3 100644
> > +--- a/gcc/testsuite/gcc.target/i386/pr53425-2.c
> > ++++ b/gcc/testsuite/gcc.target/i386/pr53425-2.c
> > +@@ -1,6 +1,6 @@
> > + /* PR target/53425 */
> > + /* { dg-do compile { target { ! ia32 } } } */
> > +-/* { dg-options "-O2 -mno-sse" } */
> > ++/* { dg-options "-O2 -mno-sse -mfpmath=387" } */
> > + /* { dg-skip-if "no SSE vector" { x86_64-*-mingw* } } */
> > +
> > + typedef float __v2sf __attribute__ ((__vector_size__ (8)));
> > +diff --git a/gcc/testsuite/gcc.target/i386/pr55247.c
> > b/gcc/testsuite/gcc.target/i386/pr55247.c
> > +index 23366d0909d..9810e3abb76 100644
> > +--- a/gcc/testsuite/gcc.target/i386/pr55247.c
> > ++++ b/gcc/testsuite/gcc.target/i386/pr55247.c
> > +@@ -1,6 +1,6 @@
> > + /* { dg-do compile { target { ! ia32 } } } */
> > + /* { dg-require-effective-target maybe_x32 } */
> > +-/* { dg-options "-O2 -mno-sse -mno-mmx -mx32 -maddress-mode=long" }
> > */
> > ++/* { dg-options "-O2 -mno-sse -mno-mmx -mx32 -maddress-mode=long
> > -mfpmath=387" } */
> > +
> > + typedef unsigned int uint32_t;
> > + typedef uint32_t Elf32_Word;
> > +diff --git a/gcc/testsuite/gcc.target/i386/pr59644.c
> > b/gcc/testsuite/gcc.target/i386/pr59644.c
> > +index 96006b3e338..4287e4538bf 100644
> > +--- a/gcc/testsuite/gcc.target/i386/pr59644.c
> > ++++ b/gcc/testsuite/gcc.target/i386/pr59644.c
> > +@@ -1,6 +1,6 @@
> > + /* PR target/59644 */
> > + /* { dg-do run { target lp64 } } */
> > +-/* { dg-options "-O2 -ffreestanding -mno-sse -mpreferred-stack-
> > boundary=3 -maccumulate-outgoing-args -mno-red-zone" } */
> > ++/* { dg-options "-O2 -ffreestanding -mno-sse -mpreferred-stack-
> > boundary=3 -maccumulate-outgoing-args -mno-red-zone -mfpmath=387" }
> > */
> > +
> > + /* This test uses __builtin_trap () instead of e.g. abort,
> > +    because due to -mpreferred-stack-boundary=3 it should not call
> > +diff --git a/gcc/testsuite/gcc.target/i386/pr62120.c
> > b/gcc/testsuite/gcc.target/i386/pr62120.c
> > +index bfb8c4703eb..ed04cf181f3 100644
> > +--- a/gcc/testsuite/gcc.target/i386/pr62120.c
> > ++++ b/gcc/testsuite/gcc.target/i386/pr62120.c
> > +@@ -1,5 +1,5 @@
> > + /* { dg-do compile } */
> > +-/* { dg-options "-mno-sse" } */
> > ++/* { dg-options "-mno-sse -mfpmath=387" } */
> > +
> > + void foo ()
> > + {
> > +diff --git a/gcc/testsuite/gcc.target/i386/pr70467-1.c
> > b/gcc/testsuite/gcc.target/i386/pr70467-1.c
> > +index 4e112c88d07..bcfb396a68d 100644
> > +--- a/gcc/testsuite/gcc.target/i386/pr70467-1.c
> > ++++ b/gcc/testsuite/gcc.target/i386/pr70467-1.c
> > +@@ -1,6 +1,6 @@
> > + /* PR rtl-optimization/70467 */
> > + /* { dg-do compile } */
> > +-/* { dg-options "-O2 -mno-sse" } */
> > ++/* { dg-options "-O2 -mno-sse -mfpmath=387" } */
> > +
> > + void foo (unsigned long long *);
> > +
> > +diff --git a/gcc/testsuite/gcc.target/i386/warn-vect-op-1.c
> > b/gcc/testsuite/gcc.target/i386/warn-vect-op-1.c
> > +index 6cda1534311..26e37f5b8ba 100644
> > +--- a/gcc/testsuite/gcc.target/i386/warn-vect-op-1.c
> > ++++ b/gcc/testsuite/gcc.target/i386/warn-vect-op-1.c
> > +@@ -1,5 +1,5 @@
> > + /* { dg-do compile { target { ! ia32 } } }  */
> > +-/* { dg-options "-mno-sse -Wvector-operation-performance" }  */
> > ++/* { dg-options "-mno-sse -Wvector-operation-performance
> > -mfpmath=387" }  */
> > + #define vector(elcount, type)  \
> > + __attribute__((vector_size((elcount)*sizeof(type)))) type
> > +
> > +--
> > +2.20.1
> > +
> > diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0037-Re-introduce-spe-
> > commandline-options.patch b/meta/recipes-devtools/gcc/gcc-9.1/0037-
> > Re-introduce-spe-commandline-options.patch
> > new file mode 100644
> > index 0000000000..251097e131
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc-9.1/0037-Re-introduce-spe-
> > commandline-options.patch
> > @@ -0,0 +1,41 @@
> > +From 49d3dbe240226206d09ff646499cd398cb60bd12 Mon Sep 17 00:00:00
> > 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Wed, 6 Jun 2018 12:10:22 -0700
> > +Subject: [PATCH 37/37] Re-introduce spe commandline options
> > +
> > +This should ensure that we keep accepting
> > +spe options
> > +
> > +Upstream-Status: Inappropriate [SPE port is removed from rs600 port]
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + gcc/config/rs6000/rs6000.opt | 12 ++++++++++++
> > + 1 file changed, 12 insertions(+)
> > +
> > +diff --git a/gcc/config/rs6000/rs6000.opt
> > b/gcc/config/rs6000/rs6000.opt
> > +index 2e90bf37747..ebd297da46b 100644
> > +--- a/gcc/config/rs6000/rs6000.opt
> > ++++ b/gcc/config/rs6000/rs6000.opt
> > +@@ -345,6 +345,18 @@ mdebug=
> > + Target RejectNegative Joined
> > + -mdebug=    Enable debug output.
> > +
> > ++mspe
> > ++Target Var(rs6000_spe) Save
> > ++Generate SPE SIMD instructions on E500.
> > ++
> > ++mabi=spe
> > ++Target RejectNegative Var(rs6000_spe_abi) Save
> > ++Use the SPE ABI extensions.
> > ++
> > ++mabi=no-spe
> > ++Target RejectNegative Var(rs6000_spe_abi, 0)
> > ++Do not use the SPE ABI extensions.
> > ++
> > + mabi=altivec
> > + Target RejectNegative Var(rs6000_altivec_abi) Save
> > + Use the AltiVec ABI extensions.
> > +--
> > +2.20.1
> > +
> > diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_9.1.bb
> > b/meta/recipes-devtools/gcc/gcc-cross-canadian_9.1.bb
> > new file mode 100644
> > index 0000000000..bf53c5cd78
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian_9.1.bb
> > @@ -0,0 +1,5 @@
> > +require recipes-devtools/gcc/gcc-${PV}.inc
> > +require gcc-cross-canadian.inc
> > +
> > +
> > +
> > diff --git a/meta/recipes-devtools/gcc/gcc-cross_9.1.bb
> > b/meta/recipes-devtools/gcc/gcc-cross_9.1.bb
> > new file mode 100644
> > index 0000000000..b43cca0c52
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc-cross_9.1.bb
> > @@ -0,0 +1,3 @@
> > +require recipes-devtools/gcc/gcc-${PV}.inc
> > +require gcc-cross.inc
> > +
> > diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_9.1.bb
> > b/meta/recipes-devtools/gcc/gcc-crosssdk_9.1.bb
> > new file mode 100644
> > index 0000000000..40a6c4feff
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc-crosssdk_9.1.bb
> > @@ -0,0 +1,2 @@
> > +require recipes-devtools/gcc/gcc-cross_${PV}.bb
> > +require gcc-crosssdk.inc
> > diff --git a/meta/recipes-devtools/gcc/gcc-runtime_9.1.bb
> > b/meta/recipes-devtools/gcc/gcc-runtime_9.1.bb
> > new file mode 100644
> > index 0000000000..a1c7a76d0b
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc-runtime_9.1.bb
> > @@ -0,0 +1,12 @@
> > +require recipes-devtools/gcc/gcc-${PV}.inc
> > +require gcc-runtime.inc
> > +
> > +# Disable ifuncs for libatomic on arm conflicts -march/-mcpu
> > +EXTRA_OECONF_append_arm = " libat_cv_have_ifunc=no "
> > +
> > +FILES_libgomp-dev += "\
> > +    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/openacc.h \
> > +"
> > +
> > +# Building with thumb enabled on armv6t fails
> > +ARM_INSTRUCTION_SET_armv6 = "arm"
> > diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_9.1.bb
> > b/meta/recipes-devtools/gcc/gcc-sanitizers_9.1.bb
> > new file mode 100644
> > index 0000000000..f3c7058114
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc-sanitizers_9.1.bb
> > @@ -0,0 +1,7 @@
> > +require recipes-devtools/gcc/gcc-${PV}.inc
> > +require gcc-sanitizers.inc
> > +
> > +# Building with thumb enabled on armv4t armv5t fails with
> > +# sanitizer_linux.s:5749: Error: lo register required -- `ldr
> > ip,[sp],#8'
> > +ARM_INSTRUCTION_SET_armv4 = "arm"
> > +ARM_INSTRUCTION_SET_armv5 = "arm"
> > diff --git a/meta/recipes-devtools/gcc/gcc-source_9.1.bb
> > b/meta/recipes-devtools/gcc/gcc-source_9.1.bb
> > new file mode 100644
> > index 0000000000..b890fa33ea
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc-source_9.1.bb
> > @@ -0,0 +1,4 @@
> > +require recipes-devtools/gcc/gcc-${PV}.inc
> > +require recipes-devtools/gcc/gcc-source.inc
> > +
> > +EXCLUDE_FROM_WORLD = "1"
> > diff --git a/meta/recipes-devtools/gcc/gcc_9.1.bb b/meta/recipes-
> > devtools/gcc/gcc_9.1.bb
> > new file mode 100644
> > index 0000000000..7d93590588
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc_9.1.bb
> > @@ -0,0 +1,14 @@
> > +require recipes-devtools/gcc/gcc-${PV}.inc
> > +require gcc-target.inc
> > +
> > +# Building with thumb enabled on armv4t armv5t fails with
> > +# | gcc-4.8.1-r0/gcc-
> > 4.8.1/gcc/cp/decl.c:7438:(.text.unlikely+0x2fa): relocation truncated
> > to fit: R_ARM_THM_CALL against symbol `fancy_abort(char const*, int,
> > char const*)' defined in .glue_7 section in linker stubs
> > +# | gcc-4.8.1-r0/gcc-
> > 4.8.1/gcc/cp/decl.c:7442:(.text.unlikely+0x318): additional
> > relocation overflows omitted from the output
> > +ARM_INSTRUCTION_SET_armv4 = "arm"
> > +ARM_INSTRUCTION_SET_armv5 = "arm"
> > +
> > +ARMFPARCHEXT_armv6 = "${@'+fp' if d.getVar('TARGET_FPU') == 'hard'
> > else ''}"
> > +ARMFPARCHEXT_armv7a = "${@'+fp' if d.getVar('TARGET_FPU') == 'hard'
> > else ''}"
> > +ARMFPARCHEXT_armv7ve = "${@'+fp' if d.getVar('TARGET_FPU') == 'hard'
> > else ''}"
> > +
> > +BBCLASSEXTEND = "nativesdk"
> > diff --git a/meta/recipes-devtools/gcc/libgcc-initial_9.1.bb
> > b/meta/recipes-devtools/gcc/libgcc-initial_9.1.bb
> > new file mode 100644
> > index 0000000000..0c698c26ec
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/libgcc-initial_9.1.bb
> > @@ -0,0 +1,5 @@
> > +require recipes-devtools/gcc/gcc-${PV}.inc
> > +require libgcc-initial.inc
> > +
> > +# Building with thumb enabled on armv6t fails
> > +ARM_INSTRUCTION_SET_armv6 = "arm"
> > diff --git a/meta/recipes-devtools/gcc/libgcc_9.1.bb b/meta/recipes-
> > devtools/gcc/libgcc_9.1.bb
> > new file mode 100644
> > index 0000000000..ea210a1130
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/libgcc_9.1.bb
> > @@ -0,0 +1,5 @@
> > +require recipes-devtools/gcc/gcc-${PV}.inc
> > +require libgcc.inc
> > +
> > +# Building with thumb enabled on armv6t fails
> > +ARM_INSTRUCTION_SET_armv6 = "arm"
> > diff --git a/meta/recipes-devtools/gcc/libgfortran_9.1.bb
> > b/meta/recipes-devtools/gcc/libgfortran_9.1.bb
> > new file mode 100644
> > index 0000000000..71dd8b4bdc
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/libgfortran_9.1.bb
> > @@ -0,0 +1,3 @@
> > +require recipes-devtools/gcc/gcc-${PV}.inc
> > +require libgfortran.inc
> > +
> > --
> > 2.21.0
> >
>

