Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id CD4D577729
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 23:51:22 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id i68so6784264uad.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 15:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kObp/38xDd/v2MCOQLp4ebW9BK0qkQ68uNzGn8JIsqw=;
	b=tZBLA/nVmC6583J+zv1VhDOxqO7eaXw7UmIkJ0x1jOjc7oMl7Bfx2XVif9/8ADDRB0
	WDT9kLy6XBHx60f8FMgJlEKqMNgdbeIEi0TeLhyObo8kgu0kziP527s1jpjVc4xYGoJG
	szTvPld+B3HA4ekZ8PUoZ2YjzMMqBM1/oX+yggwy/F0K+vp036CBSn6uqrYGccsIEBy6
	lcBbRPljs/ZFrE0Bv6CggDvha61CGWa3WhZ9E1pt42Tmh9QQD7XZGoEHhsQB04Y/xxpT
	M5sPUad8nROWfrUlANVkz+QnPem0F0AHxWEfeWNanv6KbBvLJp8KC2SskETu1hpio8eg
	6E9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kObp/38xDd/v2MCOQLp4ebW9BK0qkQ68uNzGn8JIsqw=;
	b=N9Awjj/9KqMZ65Rh7s79u5cEWZ+FJQQxpXYRR6Yc/mBvmIsE88G6NRkY2c9QxhyUnY
	75cyOCdVCDmAPa+TisgdHPwVykfW69JcQ0ltRQqw4d9CvG/P4GqK7XiWZUmmUtjGZlW2
	ZzZVhIkTZ+Ey4jlz8vu/HF8wpP3iKfd71GeuqQVLqS385kddRmal0zQjC/TyiylnVwvd
	XWHcrd38lSwhxcEuFLurQQUFLN+Kgoo5JjPW/s2fefUrgDCAnCpgumeZjfhXjuPIF/Kr
	TiNyaHNIyFBFaxQTmFHjcfEf/GBLJZMhoJ08SD0/FPevv8GXApBJKxNLZ6ttcUK5iIzZ
	nXBg==
X-Gm-Message-State: AIkVDXIUhfUJ//UdSBNfvxGVCCWqa8Puqj9aP/MnPS7M9bIGB0ZIDMtfX5F4oon7VYcptvbWvLjVAZZ2BKwSZg==
X-Received: by 10.176.1.17 with SMTP id 17mr7767173uak.143.1482450683302; Thu,
	22 Dec 2016 15:51:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Thu, 22 Dec 2016 15:50:52 -0800 (PST)
In-Reply-To: <20161221200831.10782-1-raj.khem@gmail.com>
References: <20161221200831.10782-1-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 Dec 2016 15:50:52 -0800
Message-ID: <CAMKF1srYeo2ppk6DRSk3MktO7Z4ayUzQd5=refQgOrUOqLViYw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFT][PATCH] gcc6: Upgrade to 6.3.0
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
X-List-Received-Date: Thu, 22 Dec 2016 23:51:25 -0000
Content-Type: text/plain; charset=UTF-8

my testing shows no regression for world builds for all qemu machine.

On Wed, Dec 21, 2016 at 12:08 PM, Khem Raj <raj.khem@gmail.com> wrote:
> 6.3.0 is a bugfix release in gcc 6 series
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/conf/distro/include/tcmode-default.inc                   |  2 +-
>  meta/recipes-devtools/gcc/{gcc-6.2.inc => gcc-6.3.inc}        | 11 +++++------
>  .../0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch                |  0
>  .../gcc/{gcc-6.2 => gcc-6.3}/0002-uclibc-conf.patch           |  0
>  .../0003-gcc-uclibc-locale-ctype_touplow_t.patch              |  0
>  .../gcc/{gcc-6.2 => gcc-6.3}/0004-uclibc-locale.patch         |  0
>  .../gcc/{gcc-6.2 => gcc-6.3}/0005-uclibc-locale-no__x.patch   |  0
>  .../{gcc-6.2 => gcc-6.3}/0006-uclibc-locale-wchar_fix.patch   |  0
>  .../gcc/{gcc-6.2 => gcc-6.3}/0007-uclibc-locale-update.patch  |  0
>  .../gcc/{gcc-6.2 => gcc-6.3}/0008-missing-execinfo_h.patch    |  0
>  .../gcc/{gcc-6.2 => gcc-6.3}/0009-c99-snprintf.patch          |  0
>  .../0010-gcc-poison-system-directories.patch                  |  0
>  .../gcc/{gcc-6.2 => gcc-6.3}/0011-gcc-poison-dir-extend.patch |  0
>  .../0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch            |  0
>  .../gcc/{gcc-6.2 => gcc-6.3}/0013-64-bit-multilib-hack.patch  |  0
>  .../gcc/{gcc-6.2 => gcc-6.3}/0014-optional-libstdc.patch      |  0
>  .../0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch           |  0
>  .../gcc/{gcc-6.2 => gcc-6.3}/0016-COLLECT_GCC_OPTIONS.patch   |  0
>  ...7-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch |  0
>  .../0018-fortran-cross-compile-hack.patch                     |  0
>  .../gcc/{gcc-6.2 => gcc-6.3}/0019-cpp-honor-sysroot.patch     |  0
>  .../{gcc-6.2 => gcc-6.3}/0020-MIPS64-Default-to-N64-ABI.patch |  0
>  ...Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |  0
>  .../0022-gcc-Fix-argument-list-too-long-error.patch           |  0
>  .../gcc/{gcc-6.2 => gcc-6.3}/0023-Disable-sdt.patch           |  0
>  .../gcc/{gcc-6.2 => gcc-6.3}/0024-libtool.patch               |  0
>  ...25-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch |  0
>  ...Use-the-multilib-config-files-from-B-instead-of-usin.patch |  0
>  ...Avoid-using-libdir-from-.la-which-usually-points-to-.patch |  0
>  .../gcc/{gcc-6.2 => gcc-6.3}/0028-export-CPP.patch            |  0
>  ...Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch |  0
>  ...Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch |  0
>  .../0031-Ensure-target-gcc-headers-can-be-included.patch      |  0
>  ...gcc-4.8-won-t-build-with-disable-dependency-tracking.patch |  0
>  ...Don-t-search-host-directory-during-relink-if-inst_pr.patch |  0
>  ...Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch |  0
>  .../0035-aarch64-Add-support-for-musl-ldso.patch              |  0
>  .../0036-libcc1-fix-libcc1-s-install-path-and-rpath.patch     |  0
>  .../0037-handle-sysroot-support-for-nativesdk-gcc.patch       |  0
>  ...Search-target-sysroot-gcc-version-specific-dirs-with.patch |  0
>  .../0039-Fix-various-_FOR_BUILD-and-related-variables.patch   |  0
>  .../0040-nios2-Define-MUSL_DYNAMIC_LINKER.patch               |  0
>  .../gcc/{gcc-6.2 => gcc-6.3}/0041-ssp_nonshared.patch         |  0
>  .../0042-gcc-libcpp-support-ffile-prefix-map-old-new.patch    |  0
>  ...-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch |  0
>  ...gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch |  0
>  .../0045-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch         |  0
>  ...046-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch |  0
>  ...libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch |  0
>  ...ARM-PR-target-71056-Don-t-use-vectorized-builtins-wh.patch |  0
>  .../gcc/{gcc-6.2 => gcc-6.3}/CVE-2016-4490.patch              |  0
>  .../{gcc-cross-canadian_6.2.bb => gcc-cross-canadian_6.3.bb}  |  0
>  .../{gcc-cross-initial_6.2.bb => gcc-cross-initial_6.3.bb}    |  0
>  .../gcc/{gcc-cross_6.2.bb => gcc-cross_6.3.bb}                |  0
>  ...cc-crosssdk-initial_6.2.bb => gcc-crosssdk-initial_6.3.bb} |  0
>  .../gcc/{gcc-crosssdk_6.2.bb => gcc-crosssdk_6.3.bb}          |  0
>  .../gcc/{gcc-runtime_6.2.bb => gcc-runtime_6.3.bb}            |  0
>  .../gcc/{gcc-sanitizers_6.2.bb => gcc-sanitizers_6.3.bb}      |  0
>  .../gcc/{gcc-source_6.2.bb => gcc-source_6.3.bb}              |  0
>  meta/recipes-devtools/gcc/{gcc_6.2.bb => gcc_6.3.bb}          |  0
>  .../gcc/{libgcc-initial_6.2.bb => libgcc-initial_6.3.bb}      |  0
>  meta/recipes-devtools/gcc/{libgcc_6.2.bb => libgcc_6.3.bb}    |  0
>  .../gcc/{libgfortran_6.2.bb => libgfortran_6.3.bb}            |  0
>  63 files changed, 6 insertions(+), 7 deletions(-)
>  rename meta/recipes-devtools/gcc/{gcc-6.2.inc => gcc-6.3.inc} (95%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0002-uclibc-conf.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0003-gcc-uclibc-locale-ctype_touplow_t.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0004-uclibc-locale.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0005-uclibc-locale-no__x.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0006-uclibc-locale-wchar_fix.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0007-uclibc-locale-update.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0008-missing-execinfo_h.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0009-c99-snprintf.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0010-gcc-poison-system-directories.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0011-gcc-poison-dir-extend.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0013-64-bit-multilib-hack.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0014-optional-libstdc.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0016-COLLECT_GCC_OPTIONS.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0018-fortran-cross-compile-hack.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0019-cpp-honor-sysroot.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0020-MIPS64-Default-to-N64-ABI.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0021-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0022-gcc-Fix-argument-list-too-long-error.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0023-Disable-sdt.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0024-libtool.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0025-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0026-Use-the-multilib-config-files-from-B-instead-of-usin.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0027-Avoid-using-libdir-from-.la-which-usually-points-to-.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0028-export-CPP.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0029-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0030-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0031-Ensure-target-gcc-headers-can-be-included.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0032-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0033-Don-t-search-host-directory-during-relink-if-inst_pr.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0034-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0035-aarch64-Add-support-for-musl-ldso.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0036-libcc1-fix-libcc1-s-install-path-and-rpath.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0037-handle-sysroot-support-for-nativesdk-gcc.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0038-Search-target-sysroot-gcc-version-specific-dirs-with.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0039-Fix-various-_FOR_BUILD-and-related-variables.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0040-nios2-Define-MUSL_DYNAMIC_LINKER.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0041-ssp_nonshared.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0042-gcc-libcpp-support-ffile-prefix-map-old-new.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0043-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0044-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0045-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0046-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0048-ARM-PR-target-71056-Don-t-use-vectorized-builtins-wh.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/CVE-2016-4490.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-cross-canadian_6.2.bb => gcc-cross-canadian_6.3.bb} (100%)
>  rename meta/recipes-devtools/gcc/{gcc-cross-initial_6.2.bb => gcc-cross-initial_6.3.bb} (100%)
>  rename meta/recipes-devtools/gcc/{gcc-cross_6.2.bb => gcc-cross_6.3.bb} (100%)
>  rename meta/recipes-devtools/gcc/{gcc-crosssdk-initial_6.2.bb => gcc-crosssdk-initial_6.3.bb} (100%)
>  rename meta/recipes-devtools/gcc/{gcc-crosssdk_6.2.bb => gcc-crosssdk_6.3.bb} (100%)
>  rename meta/recipes-devtools/gcc/{gcc-runtime_6.2.bb => gcc-runtime_6.3.bb} (100%)
>  rename meta/recipes-devtools/gcc/{gcc-sanitizers_6.2.bb => gcc-sanitizers_6.3.bb} (100%)
>  rename meta/recipes-devtools/gcc/{gcc-source_6.2.bb => gcc-source_6.3.bb} (100%)
>  rename meta/recipes-devtools/gcc/{gcc_6.2.bb => gcc_6.3.bb} (100%)
>  rename meta/recipes-devtools/gcc/{libgcc-initial_6.2.bb => libgcc-initial_6.3.bb} (100%)
>  rename meta/recipes-devtools/gcc/{libgcc_6.2.bb => libgcc_6.3.bb} (100%)
>  rename meta/recipes-devtools/gcc/{libgfortran_6.2.bb => libgfortran_6.3.bb} (100%)
>
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
> index ecf235977c..91143c4100 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -22,7 +22,7 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial = "${TCLIBC}-initial"
>  PREFERRED_PROVIDER_virtual/nativesdk-${SDK_PREFIX}libc-initial ?= "nativesdk-glibc-initial"
>  PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
>
> -GCCVERSION ?= "6.2%"
> +GCCVERSION ?= "6.3%"
>  SDKGCCVERSION ?= "${GCCVERSION}"
>  BINUVERSION ?= "2.27%"
>  GDBVERSION ?= "7.12%"
> diff --git a/meta/recipes-devtools/gcc/gcc-6.2.inc b/meta/recipes-devtools/gcc/gcc-6.3.inc
> similarity index 95%
> rename from meta/recipes-devtools/gcc/gcc-6.2.inc
> rename to meta/recipes-devtools/gcc/gcc-6.3.inc
> index b118995e1d..0b84597a42 100644
> --- a/meta/recipes-devtools/gcc/gcc-6.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-6.3.inc
> @@ -2,13 +2,13 @@ require gcc-common.inc
>
>  # Third digit in PV should be incremented after a minor release
>
> -PV = "6.2.0"
> +PV = "6.3.0"
>
>  # BINV should be incremented to a revision after a minor gcc release
>
> -BINV = "6.2.0"
> +BINV = "6.3.0"
>
> -FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-6.2:${FILE_DIRNAME}/gcc-6.2/backport:"
> +FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-6.3:${FILE_DIRNAME}/gcc-6.3/backport:"
>
>  DEPENDS =+ "mpfr gmp libmpc zlib"
>  NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native"
> @@ -81,9 +81,8 @@ SRC_URI = "\
>             ${BACKPORTS} \
>  "
>  BACKPORTS = ""
> -
> -SRC_URI[md5sum] = "9768625159663b300ae4de2f4745fcc4"
> -SRC_URI[sha256sum] = "9944589fc722d3e66308c0ce5257788ebd7872982a718aa2516123940671b7c5"
> +SRC_URI[md5sum] = "677a7623c7ef6ab99881bc4e048debb6"
> +SRC_URI[sha256sum] = "f06ae7f3f790fbf0f018f6d40e844451e6bc3b7bc96e128e63b09825c1f8b29f"
>
>  S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
>  #S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/git"
> diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc-6.3/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-6.2/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
> rename to meta/recipes-devtools/gcc/gcc-6.3/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0002-uclibc-conf.patch b/meta/recipes-devtools/gcc/gcc-6.3/0002-uclibc-conf.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-6.2/0002-uclibc-conf.patch
> rename to meta/recipes-devtools/gcc/gcc-6.3/0002-uclibc-conf.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0003-gcc-uclibc-locale-ctype_touplow_t.patch b/meta/recipes-devtools/gcc/gcc-6.3/0003-gcc-uclibc-locale-ctype_touplow_t.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-6.2/0003-gcc-uclibc-locale-ctype_touplow_t.patch
> rename to meta/recipes-devtools/gcc/gcc-6.3/0003-gcc-uclibc-locale-ctype_touplow_t.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0004-uclibc-locale.patch b/meta/recipes-devtools/gcc/gcc-6.3/0004-uclibc-locale.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-6.2/0004-uclibc-locale.patch
> rename to meta/recipes-devtools/gcc/gcc-6.3/0004-uclibc-locale.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0005-uclibc-locale-no__x.patch b/meta/recipes-devtools/gcc/gcc-6.3/0005-uclibc-locale-no__x.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-6.2/0005-uclibc-locale-no__x.patch
> rename to meta/recipes-devtools/gcc/gcc-6.3/0005-uclibc-locale-no__x.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0006-uclibc-locale-wchar_fix.patch b/meta/recipes-devtools/gcc/gcc-6.3/0006-uclibc-locale-wchar_fix.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-6.2/0006-uclibc-locale-wchar_fix.patch
> rename to meta/recipes-devtools/gcc/gcc-6.3/0006-uclibc-locale-wchar_fix.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0007-uclibc-locale-update.patch b/meta/recipes-devtools/gcc/gcc-6.3/0007-uclibc-locale-update.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-6.2/0007-uclibc-locale-update.patch
> rename to meta/recipes-devtools/gcc/gcc-6.3/0007-uclibc-locale-update.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0008-missing-execinfo_h.patch b/meta/recipes-devtools/gcc/gcc-6.3/0008-missing-execinfo_h.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-6.2/0008-missing-execinfo_h.patch
> rename to meta/recipes-devtools/gcc/gcc-6.3/0008-missing-execinfo_h.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0009-c99-snprintf.patch b/meta/recipes-devtools/gcc/gcc-6.3/0009-c99-snprintf.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-6.2/0009-c99-snprintf.patch
> rename to meta/recipes-devtools/gcc/gcc-6.3/0009-c99-snprintf.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0010-gcc-poison-system-directories.patch b/meta/recipes-devtools/gcc/gcc-6.3/0010-gcc-poison-system-directories.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-6.2/0010-gcc-poison-system-directories.patch
> rename to meta/recipes-devtools/gcc/gcc-6.3/0010-gcc-poison-system-directories.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0011-gcc-poison-dir-extend.patch b/meta/recipes-devtools/gcc/gcc-6.3/0011-gcc-poison-dir-extend.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-6.2/0011-gcc-poison-dir-extend.patch
> rename to meta/recipes-devtools/gcc/gcc-6.3/0011-gcc-poison-dir-extend.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc-6.3/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-6.2/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
> rename to meta/recipes-devtools/gcc/gcc-6.3/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0013-64-bit-multilib-hack.patch b/meta/recipes-devtools/gcc/gcc-6.3/0013-64-bit-multilib-hack.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-6.2/0013-64-bit-multilib-hack.patch
> rename to meta/recipes-devtools/gcc/gcc-6.3/0013-64-bit-multilib-hack.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0014-optional-libstdc.patch b/meta/recipes-devtools/gcc/gcc-6.3/0014-optional-libstdc.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-6.2/0014-optional-libstdc.patch
> rename to meta/recipes-devtools/gcc/gcc-6.3/0014-optional-libstdc.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch b/meta/recipes-devtools/gcc/gcc-6.3/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-6.2/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
> rename to meta/recipes-devtools/gcc/gcc-6.3/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0016-COLLECT_GCC_OPTIONS.patch b/meta/recipes-devtools/gcc/gcc-6.3/0016-COLLECT_GCC_OPTIONS.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-6.2/0016-COLLECT_GCC_OPTIONS.patch
> rename to meta/recipes-devtools/gcc/gcc-6.3/0016-COLLECT_GCC_OPTIONS.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch b/meta/recipes-devtools/gcc/gcc-6.3/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-6.2/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
> rename to meta/recipes-devtools/gcc/gcc-6.3/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0018-fortran-cross-compile-hack.patch b/meta/recipes-devtools/gcc/gcc-6.3/0018-fortran-cross-compile-hack.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-6.2/0018-fortran-cross-compile-hack.patch
> rename to meta/recipes-devtools/gcc/gcc-6.3/0018-fortran-cross-compile-hack.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0019-cpp-honor-sysroot.patch b/meta/recipes-devtools/gcc/gcc-6.3/0019-cpp-honor-sysroot.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-6.2/0019-cpp-honor-sysroot.patch
> rename to meta/recipes-devtools/gcc/gcc-6.3/0019-cpp-honor-sysroot.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0020-MIPS64-Default-to-N64-ABI.patch b/meta/recipes-devtools/gcc/gcc-6.3/0020-MIPS64-Default-to-N64-ABI.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-6.2/0020-MIPS64-Default-to-N64-ABI.patch
> rename to meta/recipes-devtools/gcc/gcc-6.3/0020-MIPS64-Default-to-N64-ABI.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0021-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc-6.3/0021-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-6.2/0021-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> rename to meta/recipes-devtools/gcc/gcc-6.3/0021-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0022-gcc-Fix-argument-list-too-long-error.patch b/meta/recipes-devtools/gcc/gcc-6.3/0022-gcc-Fix-argument-list-too-long-error.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-6.2/0022-gcc-Fix-argument-list-too-long-error.patch
> rename to meta/recipes-devtools/gcc/gcc-6.3/0022-gcc-Fix-argument-list-too-long-error.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0023-Disable-sdt.patch b/meta/recipes-devtools/gcc/gcc-6.3/0023-Disable-sdt.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-6.2/0023-Disable-sdt.patch
> rename to meta/recipes-devtools/gcc/gcc-6.3/0023-Disable-sdt.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0024-libtool.patch b/meta/recipes-devtools/gcc/gcc-6.3/0024-libtool.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-6.2/0024-libtool.patch
> rename to meta/recipes-devtools/gcc/gcc-6.3/0024-libtool.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0025-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch b/meta/recipes-devtools/gcc/gcc-6.3/0025-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-6.2/0025-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
> rename to meta/recipes-devtools/gcc/gcc-6.3/0025-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0026-Use-the-multilib-config-files-from-B-instead-of-usin.patch b/meta/recipes-devtools/gcc/gcc-6.3/0026-Use-the-multilib-config-files-from-B-instead-of-usin.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-6.2/0026-Use-the-multilib-config-files-from-B-instead-of-usin.patch
> rename to meta/recipes-devtools/gcc/gcc-6.3/0026-Use-the-multilib-config-files-from-B-instead-of-usin.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0027-Avoid-using-libdir-from-.la-which-usually-points-to-.patch b/meta/recipes-devtools/gcc/gcc-6.3/0027-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-6.2/0027-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
> rename to meta/recipes-devtools/gcc/gcc-6.3/0027-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0028-export-CPP.patch b/meta/recipes-devtools/gcc/gcc-6.3/0028-export-CPP.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-6.2/0028-export-CPP.patch
> rename to meta/recipes-devtools/gcc/gcc-6.3/0028-export-CPP.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0029-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch b/meta/recipes-devtools/gcc/gcc-6.3/0029-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-6.2/0029-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
> rename to meta/recipes-devtools/gcc/gcc-6.3/0029-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0030-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch b/meta/recipes-devtools/gcc/gcc-6.3/0030-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-6.2/0030-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
> rename to meta/recipes-devtools/gcc/gcc-6.3/0030-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0031-Ensure-target-gcc-headers-can-be-included.patch b/meta/recipes-devtools/gcc/gcc-6.3/0031-Ensure-target-gcc-headers-can-be-included.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-6.2/0031-Ensure-target-gcc-headers-can-be-included.patch
> rename to meta/recipes-devtools/gcc/gcc-6.3/0031-Ensure-target-gcc-headers-can-be-included.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0032-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch b/meta/recipes-devtools/gcc/gcc-6.3/0032-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-6.2/0032-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
> rename to meta/recipes-devtools/gcc/gcc-6.3/0032-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0033-Don-t-search-host-directory-during-relink-if-inst_pr.patch b/meta/recipes-devtools/gcc/gcc-6.3/0033-Don-t-search-host-directory-during-relink-if-inst_pr.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-6.2/0033-Don-t-search-host-directory-during-relink-if-inst_pr.patch
> rename to meta/recipes-devtools/gcc/gcc-6.3/0033-Don-t-search-host-directory-during-relink-if-inst_pr.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0034-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch b/meta/recipes-devtools/gcc/gcc-6.3/0034-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-6.2/0034-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
> rename to meta/recipes-devtools/gcc/gcc-6.3/0034-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0035-aarch64-Add-support-for-musl-ldso.patch b/meta/recipes-devtools/gcc/gcc-6.3/0035-aarch64-Add-support-for-musl-ldso.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-6.2/0035-aarch64-Add-support-for-musl-ldso.patch
> rename to meta/recipes-devtools/gcc/gcc-6.3/0035-aarch64-Add-support-for-musl-ldso.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0036-libcc1-fix-libcc1-s-install-path-and-rpath.patch b/meta/recipes-devtools/gcc/gcc-6.3/0036-libcc1-fix-libcc1-s-install-path-and-rpath.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-6.2/0036-libcc1-fix-libcc1-s-install-path-and-rpath.patch
> rename to meta/recipes-devtools/gcc/gcc-6.3/0036-libcc1-fix-libcc1-s-install-path-and-rpath.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0037-handle-sysroot-support-for-nativesdk-gcc.patch b/meta/recipes-devtools/gcc/gcc-6.3/0037-handle-sysroot-support-for-nativesdk-gcc.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-6.2/0037-handle-sysroot-support-for-nativesdk-gcc.patch
> rename to meta/recipes-devtools/gcc/gcc-6.3/0037-handle-sysroot-support-for-nativesdk-gcc.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0038-Search-target-sysroot-gcc-version-specific-dirs-with.patch b/meta/recipes-devtools/gcc/gcc-6.3/0038-Search-target-sysroot-gcc-version-specific-dirs-with.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-6.2/0038-Search-target-sysroot-gcc-version-specific-dirs-with.patch
> rename to meta/recipes-devtools/gcc/gcc-6.3/0038-Search-target-sysroot-gcc-version-specific-dirs-with.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0039-Fix-various-_FOR_BUILD-and-related-variables.patch b/meta/recipes-devtools/gcc/gcc-6.3/0039-Fix-various-_FOR_BUILD-and-related-variables.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-6.2/0039-Fix-various-_FOR_BUILD-and-related-variables.patch
> rename to meta/recipes-devtools/gcc/gcc-6.3/0039-Fix-various-_FOR_BUILD-and-related-variables.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0040-nios2-Define-MUSL_DYNAMIC_LINKER.patch b/meta/recipes-devtools/gcc/gcc-6.3/0040-nios2-Define-MUSL_DYNAMIC_LINKER.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-6.2/0040-nios2-Define-MUSL_DYNAMIC_LINKER.patch
> rename to meta/recipes-devtools/gcc/gcc-6.3/0040-nios2-Define-MUSL_DYNAMIC_LINKER.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0041-ssp_nonshared.patch b/meta/recipes-devtools/gcc/gcc-6.3/0041-ssp_nonshared.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-6.2/0041-ssp_nonshared.patch
> rename to meta/recipes-devtools/gcc/gcc-6.3/0041-ssp_nonshared.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0042-gcc-libcpp-support-ffile-prefix-map-old-new.patch b/meta/recipes-devtools/gcc/gcc-6.3/0042-gcc-libcpp-support-ffile-prefix-map-old-new.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-6.2/0042-gcc-libcpp-support-ffile-prefix-map-old-new.patch
> rename to meta/recipes-devtools/gcc/gcc-6.3/0042-gcc-libcpp-support-ffile-prefix-map-old-new.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0043-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch b/meta/recipes-devtools/gcc/gcc-6.3/0043-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-6.2/0043-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch
> rename to meta/recipes-devtools/gcc/gcc-6.3/0043-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0044-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch b/meta/recipes-devtools/gcc/gcc-6.3/0044-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-6.2/0044-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch
> rename to meta/recipes-devtools/gcc/gcc-6.3/0044-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0045-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch b/meta/recipes-devtools/gcc/gcc-6.3/0045-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-6.2/0045-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
> rename to meta/recipes-devtools/gcc/gcc-6.3/0045-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0046-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch b/meta/recipes-devtools/gcc/gcc-6.3/0046-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-6.2/0046-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
> rename to meta/recipes-devtools/gcc/gcc-6.3/0046-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch b/meta/recipes-devtools/gcc/gcc-6.3/0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-6.2/0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
> rename to meta/recipes-devtools/gcc/gcc-6.3/0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0048-ARM-PR-target-71056-Don-t-use-vectorized-builtins-wh.patch b/meta/recipes-devtools/gcc/gcc-6.3/0048-ARM-PR-target-71056-Don-t-use-vectorized-builtins-wh.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-6.2/0048-ARM-PR-target-71056-Don-t-use-vectorized-builtins-wh.patch
> rename to meta/recipes-devtools/gcc/gcc-6.3/0048-ARM-PR-target-71056-Don-t-use-vectorized-builtins-wh.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-6.2/CVE-2016-4490.patch b/meta/recipes-devtools/gcc/gcc-6.3/CVE-2016-4490.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-6.2/CVE-2016-4490.patch
> rename to meta/recipes-devtools/gcc/gcc-6.3/CVE-2016-4490.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_6.2.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_6.3.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-cross-canadian_6.2.bb
> rename to meta/recipes-devtools/gcc/gcc-cross-canadian_6.3.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial_6.2.bb b/meta/recipes-devtools/gcc/gcc-cross-initial_6.3.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-cross-initial_6.2.bb
> rename to meta/recipes-devtools/gcc/gcc-cross-initial_6.3.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-cross_6.2.bb b/meta/recipes-devtools/gcc/gcc-cross_6.3.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-cross_6.2.bb
> rename to meta/recipes-devtools/gcc/gcc-cross_6.3.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk-initial_6.2.bb b/meta/recipes-devtools/gcc/gcc-crosssdk-initial_6.3.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-crosssdk-initial_6.2.bb
> rename to meta/recipes-devtools/gcc/gcc-crosssdk-initial_6.3.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_6.2.bb b/meta/recipes-devtools/gcc/gcc-crosssdk_6.3.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-crosssdk_6.2.bb
> rename to meta/recipes-devtools/gcc/gcc-crosssdk_6.3.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime_6.2.bb b/meta/recipes-devtools/gcc/gcc-runtime_6.3.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-runtime_6.2.bb
> rename to meta/recipes-devtools/gcc/gcc-runtime_6.3.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_6.2.bb b/meta/recipes-devtools/gcc/gcc-sanitizers_6.3.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-sanitizers_6.2.bb
> rename to meta/recipes-devtools/gcc/gcc-sanitizers_6.3.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-source_6.2.bb b/meta/recipes-devtools/gcc/gcc-source_6.3.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-source_6.2.bb
> rename to meta/recipes-devtools/gcc/gcc-source_6.3.bb
> diff --git a/meta/recipes-devtools/gcc/gcc_6.2.bb b/meta/recipes-devtools/gcc/gcc_6.3.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc_6.2.bb
> rename to meta/recipes-devtools/gcc/gcc_6.3.bb
> diff --git a/meta/recipes-devtools/gcc/libgcc-initial_6.2.bb b/meta/recipes-devtools/gcc/libgcc-initial_6.3.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/libgcc-initial_6.2.bb
> rename to meta/recipes-devtools/gcc/libgcc-initial_6.3.bb
> diff --git a/meta/recipes-devtools/gcc/libgcc_6.2.bb b/meta/recipes-devtools/gcc/libgcc_6.3.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/libgcc_6.2.bb
> rename to meta/recipes-devtools/gcc/libgcc_6.3.bb
> diff --git a/meta/recipes-devtools/gcc/libgfortran_6.2.bb b/meta/recipes-devtools/gcc/libgfortran_6.3.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/libgfortran_6.2.bb
> rename to meta/recipes-devtools/gcc/libgfortran_6.3.bb
> --
> 2.11.0
>

