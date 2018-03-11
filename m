Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id BBCE7788BF
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Mar 2018 00:42:36 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id x7so9952724wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2018 16:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=U3T1RGGVU5BFapwbAMkVfatvH7MqsMLjpDC1pCo9n58=;
	b=aSHVtq3u/pDk9kCfsM5nr6eyO5J2ScXm7gFEsanZ1qWlJmr7bsRHIoj0q2PkUyUNVD
	kJ3m/xLZQLK+rRBXX62inpsQsuXXksOeRzLQUbW7yLnj+Co8iOHi38JCkxI99j3BluTw
	S1TDTe2Ik8P9B1HYVB8ylnpsShqkURNF9buSdyN8QrmAIXyzL1vp2I8yb/RbPDtedWct
	Lp+MLdpavFaZUH4cm9J0KC0b490yIbn8G14Znbh+zMcXnRfZ/tj/KBn6CwOx+PoTBQn7
	VM67j1Jpj4EvJuITWBP/xxuxBESHjOo704BEd1Zu771zWiQQH38QKl/UND4y3FSkJNZx
	shPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=U3T1RGGVU5BFapwbAMkVfatvH7MqsMLjpDC1pCo9n58=;
	b=pVKAzL2/YZi5vScl1tWDWcQ91+e+lYgbgrI2tJAonZORsmQHgiFsI61HAgw/EL+EJg
	V5HMir6e9h404vzhmSQWak0yHFGeJfamZ+iL/ltWDfGfcxLVuG6u3WW3hob0HXGAH+bJ
	sxlv2WYUUXzXlTxyOeEeXZmbVBDGDUj42Z5EzhakpBfBkmPUduvWGPGUmkJ/aOqiBBoD
	MdGluLhHCm7lq0kZNhoailS4w0NiLRkObNwNYoecVwaHUR50U6Dvha7L+uPlif7gjRti
	lSTkL8mHYwlnAZe82OF01S2EvIxu1NGidrc8JnDBktzqelNeju6Ui8SVBICgVl4UrdFn
	37vQ==
X-Gm-Message-State: AElRT7Eo9a9tdSd0MVAcWwuIndiB69x4IEWYxfnrCqjgr5EfcuNrJVes
	c2dGXaGPhGLuvdo5XYbf9yUumQ==
X-Google-Smtp-Source: AG47ELvj1lus8ycQq1Dg8i7cZ/IoDUvmvwQo0MIZtXN8zUJs7wNFsEUNWaxJe3WZa2S/gguneceXQg==
X-Received: by 10.28.7.13 with SMTP id 13mr1987055wmh.9.1520728956797;
	Sat, 10 Mar 2018 16:42:36 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	v35sm4052560wrc.56.2018.03.10.16.42.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 10 Mar 2018 16:42:35 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Sun, 11 Mar 2018 00:42:15 +0000
Message-Id: <c24f6de26efdfb13b95e51b4531d1e111fab409c.1520728802.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <cover.1520728802.git.Martin.Jansa@gmail.com>
References: <cover.1520728802.git.Martin.Jansa@gmail.com>
Subject: [morty][PATCH 03/16] gcc6: Upgrade to 6.3.0
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
X-List-Received-Date: Sun, 11 Mar 2018 00:42:37 -0000

From: Khem Raj <raj.khem@gmail.com>

6.3.0 is a bugfix release in gcc 6 series

Cherry-picked from oe-core master 36ffcd1d7d2ab9dcc91e9c09623a6613a248bc69

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc                    |  2 +-
 meta/recipes-devtools/gcc/{gcc-6.2.inc => gcc-6.3.inc}         | 10 +++++-----
 .../0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch                 |  0
 .../gcc/{gcc-6.2 => gcc-6.3}/0002-uclibc-conf.patch            |  0
 .../0003-gcc-uclibc-locale-ctype_touplow_t.patch               |  0
 .../gcc/{gcc-6.2 => gcc-6.3}/0004-uclibc-locale.patch          |  0
 .../gcc/{gcc-6.2 => gcc-6.3}/0005-uclibc-locale-no__x.patch    |  0
 .../{gcc-6.2 => gcc-6.3}/0006-uclibc-locale-wchar_fix.patch    |  0
 .../gcc/{gcc-6.2 => gcc-6.3}/0007-uclibc-locale-update.patch   |  0
 .../gcc/{gcc-6.2 => gcc-6.3}/0008-missing-execinfo_h.patch     |  0
 .../gcc/{gcc-6.2 => gcc-6.3}/0009-c99-snprintf.patch           |  0
 .../0010-gcc-poison-system-directories.patch                   |  0
 .../gcc/{gcc-6.2 => gcc-6.3}/0011-gcc-poison-dir-extend.patch  |  0
 .../0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch             |  0
 .../gcc/{gcc-6.2 => gcc-6.3}/0013-64-bit-multilib-hack.patch   |  0
 .../gcc/{gcc-6.2 => gcc-6.3}/0014-optional-libstdc.patch       |  0
 .../0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch            |  0
 .../gcc/{gcc-6.2 => gcc-6.3}/0016-COLLECT_GCC_OPTIONS.patch    |  0
 ...17-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch |  0
 .../{gcc-6.2 => gcc-6.3}/0018-fortran-cross-compile-hack.patch |  0
 .../gcc/{gcc-6.2 => gcc-6.3}/0019-cpp-honor-sysroot.patch      |  0
 .../{gcc-6.2 => gcc-6.3}/0020-MIPS64-Default-to-N64-ABI.patch  |  0
 ...-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |  0
 .../0022-gcc-Fix-argument-list-too-long-error.patch            |  0
 .../gcc/{gcc-6.2 => gcc-6.3}/0023-Disable-sdt.patch            |  0
 .../gcc/{gcc-6.2 => gcc-6.3}/0024-libtool.patch                |  0
 ...025-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch |  0
 ...-Use-the-multilib-config-files-from-B-instead-of-usin.patch |  0
 ...-Avoid-using-libdir-from-.la-which-usually-points-to-.patch |  0
 .../gcc/{gcc-6.2 => gcc-6.3}/0028-export-CPP.patch             |  0
 ...-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch |  0
 ...-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch |  0
 .../0031-Ensure-target-gcc-headers-can-be-included.patch       |  0
 ...-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch |  0
 ...-Don-t-search-host-directory-during-relink-if-inst_pr.patch |  0
 ...-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch |  0
 .../0035-aarch64-Add-support-for-musl-ldso.patch               |  0
 .../0036-libcc1-fix-libcc1-s-install-path-and-rpath.patch      |  0
 .../0037-handle-sysroot-support-for-nativesdk-gcc.patch        |  0
 ...-Search-target-sysroot-gcc-version-specific-dirs-with.patch |  0
 .../0039-Fix-various-_FOR_BUILD-and-related-variables.patch    |  0
 .../0040-nios2-Define-MUSL_DYNAMIC_LINKER.patch                |  0
 .../gcc/{gcc-6.2 => gcc-6.3}/0041-ssp_nonshared.patch          |  0
 .../0042-gcc-libcpp-support-ffile-prefix-map-old-new.patch     |  0
 ...3-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch |  0
 ...-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch |  0
 .../0045-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch          |  0
 ...0046-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch |  0
 ...-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch |  0
 ...-ARM-PR-target-71056-Don-t-use-vectorized-builtins-wh.patch |  0
 .../gcc/{gcc-6.2 => gcc-6.3}/CVE-2016-4490.patch               |  0
 .../{gcc-6.2 => gcc-6.3}/ubsan-fix-check-empty-string.patch    |  0
 .../{gcc-cross-canadian_6.2.bb => gcc-cross-canadian_6.3.bb}   |  0
 .../gcc/{gcc-cross-initial_6.2.bb => gcc-cross-initial_6.3.bb} |  0
 .../gcc/{gcc-cross_6.2.bb => gcc-cross_6.3.bb}                 |  0
 ...gcc-crosssdk-initial_6.2.bb => gcc-crosssdk-initial_6.3.bb} |  0
 .../gcc/{gcc-crosssdk_6.2.bb => gcc-crosssdk_6.3.bb}           |  0
 .../gcc/{gcc-runtime_6.2.bb => gcc-runtime_6.3.bb}             |  0
 .../gcc/{gcc-sanitizers_6.2.bb => gcc-sanitizers_6.3.bb}       |  0
 .../gcc/{gcc-source_6.2.bb => gcc-source_6.3.bb}               |  0
 meta/recipes-devtools/gcc/{gcc_6.2.bb => gcc_6.3.bb}           |  0
 .../gcc/{libgcc-initial_6.2.bb => libgcc-initial_6.3.bb}       |  0
 meta/recipes-devtools/gcc/{libgcc_6.2.bb => libgcc_6.3.bb}     |  0
 .../gcc/{libgfortran_6.2.bb => libgfortran_6.3.bb}             |  0
 64 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/gcc/{gcc-6.2.inc => gcc-6.3.inc} (95%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0002-uclibc-conf.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0003-gcc-uclibc-locale-ctype_touplow_t.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0004-uclibc-locale.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0005-uclibc-locale-no__x.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0006-uclibc-locale-wchar_fix.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0007-uclibc-locale-update.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0008-missing-execinfo_h.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0009-c99-snprintf.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0010-gcc-poison-system-directories.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0011-gcc-poison-dir-extend.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0013-64-bit-multilib-hack.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0014-optional-libstdc.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0016-COLLECT_GCC_OPTIONS.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0018-fortran-cross-compile-hack.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0019-cpp-honor-sysroot.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0020-MIPS64-Default-to-N64-ABI.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0021-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0022-gcc-Fix-argument-list-too-long-error.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0023-Disable-sdt.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0024-libtool.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0025-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0026-Use-the-multilib-config-files-from-B-instead-of-usin.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0027-Avoid-using-libdir-from-.la-which-usually-points-to-.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0028-export-CPP.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0029-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0030-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0031-Ensure-target-gcc-headers-can-be-included.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0032-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0033-Don-t-search-host-directory-during-relink-if-inst_pr.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0034-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0035-aarch64-Add-support-for-musl-ldso.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0036-libcc1-fix-libcc1-s-install-path-and-rpath.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0037-handle-sysroot-support-for-nativesdk-gcc.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0038-Search-target-sysroot-gcc-version-specific-dirs-with.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0039-Fix-various-_FOR_BUILD-and-related-variables.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0040-nios2-Define-MUSL_DYNAMIC_LINKER.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0041-ssp_nonshared.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0042-gcc-libcpp-support-ffile-prefix-map-old-new.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0043-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0044-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0045-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0046-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/0048-ARM-PR-target-71056-Don-t-use-vectorized-builtins-wh.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/CVE-2016-4490.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.3}/ubsan-fix-check-empty-string.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_6.2.bb => gcc-cross-canadian_6.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross-initial_6.2.bb => gcc-cross-initial_6.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_6.2.bb => gcc-cross_6.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk-initial_6.2.bb => gcc-crosssdk-initial_6.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_6.2.bb => gcc-crosssdk_6.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_6.2.bb => gcc-runtime_6.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_6.2.bb => gcc-sanitizers_6.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_6.2.bb => gcc-source_6.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc_6.2.bb => gcc_6.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_6.2.bb => libgcc-initial_6.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_6.2.bb => libgcc_6.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_6.2.bb => libgfortran_6.3.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index ca3c5ec90a..6a81c365bd 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -22,7 +22,7 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial = "${TCLIBC}-initial"
 PREFERRED_PROVIDER_virtual/nativesdk-${SDK_PREFIX}libc-initial ?= "nativesdk-glibc-initial"
 PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 
-GCCVERSION ?= "6.2%"
+GCCVERSION ?= "6.3%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.27%"
 GDBVERSION ?= "7.11%"
diff --git a/meta/recipes-devtools/gcc/gcc-6.2.inc b/meta/recipes-devtools/gcc/gcc-6.3.inc
similarity index 95%
rename from meta/recipes-devtools/gcc/gcc-6.2.inc
rename to meta/recipes-devtools/gcc/gcc-6.3.inc
index 39ae653805..15e79bf25c 100644
--- a/meta/recipes-devtools/gcc/gcc-6.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-6.3.inc
@@ -2,13 +2,13 @@ require gcc-common.inc
 
 # Third digit in PV should be incremented after a minor release
 
-PV = "6.2.0"
+PV = "6.3.0"
 
 # BINV should be incremented to a revision after a minor gcc release
 
-BINV = "6.2.0"
+BINV = "6.3.0"
 
-FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-6.2:${FILE_DIRNAME}/gcc-6.2/backport:"
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-6.3:${FILE_DIRNAME}/gcc-6.3/backport:"
 
 DEPENDS =+ "mpfr gmp libmpc zlib"
 NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native"
@@ -83,8 +83,8 @@ SRC_URI = "\
 BACKPORTS = "\
            file://ubsan-fix-check-empty-string.patch \
 "
-SRC_URI[md5sum] = "9768625159663b300ae4de2f4745fcc4"
-SRC_URI[sha256sum] = "9944589fc722d3e66308c0ce5257788ebd7872982a718aa2516123940671b7c5"
+SRC_URI[md5sum] = "677a7623c7ef6ab99881bc4e048debb6"
+SRC_URI[sha256sum] = "f06ae7f3f790fbf0f018f6d40e844451e6bc3b7bc96e128e63b09825c1f8b29f"
 
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
 #S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/git"
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc-6.3/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
rename to meta/recipes-devtools/gcc/gcc-6.3/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0002-uclibc-conf.patch b/meta/recipes-devtools/gcc/gcc-6.3/0002-uclibc-conf.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0002-uclibc-conf.patch
rename to meta/recipes-devtools/gcc/gcc-6.3/0002-uclibc-conf.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0003-gcc-uclibc-locale-ctype_touplow_t.patch b/meta/recipes-devtools/gcc/gcc-6.3/0003-gcc-uclibc-locale-ctype_touplow_t.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0003-gcc-uclibc-locale-ctype_touplow_t.patch
rename to meta/recipes-devtools/gcc/gcc-6.3/0003-gcc-uclibc-locale-ctype_touplow_t.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0004-uclibc-locale.patch b/meta/recipes-devtools/gcc/gcc-6.3/0004-uclibc-locale.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0004-uclibc-locale.patch
rename to meta/recipes-devtools/gcc/gcc-6.3/0004-uclibc-locale.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0005-uclibc-locale-no__x.patch b/meta/recipes-devtools/gcc/gcc-6.3/0005-uclibc-locale-no__x.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0005-uclibc-locale-no__x.patch
rename to meta/recipes-devtools/gcc/gcc-6.3/0005-uclibc-locale-no__x.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0006-uclibc-locale-wchar_fix.patch b/meta/recipes-devtools/gcc/gcc-6.3/0006-uclibc-locale-wchar_fix.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0006-uclibc-locale-wchar_fix.patch
rename to meta/recipes-devtools/gcc/gcc-6.3/0006-uclibc-locale-wchar_fix.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0007-uclibc-locale-update.patch b/meta/recipes-devtools/gcc/gcc-6.3/0007-uclibc-locale-update.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0007-uclibc-locale-update.patch
rename to meta/recipes-devtools/gcc/gcc-6.3/0007-uclibc-locale-update.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0008-missing-execinfo_h.patch b/meta/recipes-devtools/gcc/gcc-6.3/0008-missing-execinfo_h.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0008-missing-execinfo_h.patch
rename to meta/recipes-devtools/gcc/gcc-6.3/0008-missing-execinfo_h.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0009-c99-snprintf.patch b/meta/recipes-devtools/gcc/gcc-6.3/0009-c99-snprintf.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0009-c99-snprintf.patch
rename to meta/recipes-devtools/gcc/gcc-6.3/0009-c99-snprintf.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0010-gcc-poison-system-directories.patch b/meta/recipes-devtools/gcc/gcc-6.3/0010-gcc-poison-system-directories.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0010-gcc-poison-system-directories.patch
rename to meta/recipes-devtools/gcc/gcc-6.3/0010-gcc-poison-system-directories.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0011-gcc-poison-dir-extend.patch b/meta/recipes-devtools/gcc/gcc-6.3/0011-gcc-poison-dir-extend.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0011-gcc-poison-dir-extend.patch
rename to meta/recipes-devtools/gcc/gcc-6.3/0011-gcc-poison-dir-extend.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc-6.3/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
rename to meta/recipes-devtools/gcc/gcc-6.3/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0013-64-bit-multilib-hack.patch b/meta/recipes-devtools/gcc/gcc-6.3/0013-64-bit-multilib-hack.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0013-64-bit-multilib-hack.patch
rename to meta/recipes-devtools/gcc/gcc-6.3/0013-64-bit-multilib-hack.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0014-optional-libstdc.patch b/meta/recipes-devtools/gcc/gcc-6.3/0014-optional-libstdc.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0014-optional-libstdc.patch
rename to meta/recipes-devtools/gcc/gcc-6.3/0014-optional-libstdc.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch b/meta/recipes-devtools/gcc/gcc-6.3/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
rename to meta/recipes-devtools/gcc/gcc-6.3/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0016-COLLECT_GCC_OPTIONS.patch b/meta/recipes-devtools/gcc/gcc-6.3/0016-COLLECT_GCC_OPTIONS.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0016-COLLECT_GCC_OPTIONS.patch
rename to meta/recipes-devtools/gcc/gcc-6.3/0016-COLLECT_GCC_OPTIONS.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch b/meta/recipes-devtools/gcc/gcc-6.3/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
rename to meta/recipes-devtools/gcc/gcc-6.3/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0018-fortran-cross-compile-hack.patch b/meta/recipes-devtools/gcc/gcc-6.3/0018-fortran-cross-compile-hack.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0018-fortran-cross-compile-hack.patch
rename to meta/recipes-devtools/gcc/gcc-6.3/0018-fortran-cross-compile-hack.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0019-cpp-honor-sysroot.patch b/meta/recipes-devtools/gcc/gcc-6.3/0019-cpp-honor-sysroot.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0019-cpp-honor-sysroot.patch
rename to meta/recipes-devtools/gcc/gcc-6.3/0019-cpp-honor-sysroot.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0020-MIPS64-Default-to-N64-ABI.patch b/meta/recipes-devtools/gcc/gcc-6.3/0020-MIPS64-Default-to-N64-ABI.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0020-MIPS64-Default-to-N64-ABI.patch
rename to meta/recipes-devtools/gcc/gcc-6.3/0020-MIPS64-Default-to-N64-ABI.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0021-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc-6.3/0021-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0021-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
rename to meta/recipes-devtools/gcc/gcc-6.3/0021-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0022-gcc-Fix-argument-list-too-long-error.patch b/meta/recipes-devtools/gcc/gcc-6.3/0022-gcc-Fix-argument-list-too-long-error.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0022-gcc-Fix-argument-list-too-long-error.patch
rename to meta/recipes-devtools/gcc/gcc-6.3/0022-gcc-Fix-argument-list-too-long-error.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0023-Disable-sdt.patch b/meta/recipes-devtools/gcc/gcc-6.3/0023-Disable-sdt.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0023-Disable-sdt.patch
rename to meta/recipes-devtools/gcc/gcc-6.3/0023-Disable-sdt.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0024-libtool.patch b/meta/recipes-devtools/gcc/gcc-6.3/0024-libtool.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0024-libtool.patch
rename to meta/recipes-devtools/gcc/gcc-6.3/0024-libtool.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0025-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch b/meta/recipes-devtools/gcc/gcc-6.3/0025-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0025-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
rename to meta/recipes-devtools/gcc/gcc-6.3/0025-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0026-Use-the-multilib-config-files-from-B-instead-of-usin.patch b/meta/recipes-devtools/gcc/gcc-6.3/0026-Use-the-multilib-config-files-from-B-instead-of-usin.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0026-Use-the-multilib-config-files-from-B-instead-of-usin.patch
rename to meta/recipes-devtools/gcc/gcc-6.3/0026-Use-the-multilib-config-files-from-B-instead-of-usin.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0027-Avoid-using-libdir-from-.la-which-usually-points-to-.patch b/meta/recipes-devtools/gcc/gcc-6.3/0027-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0027-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
rename to meta/recipes-devtools/gcc/gcc-6.3/0027-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0028-export-CPP.patch b/meta/recipes-devtools/gcc/gcc-6.3/0028-export-CPP.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0028-export-CPP.patch
rename to meta/recipes-devtools/gcc/gcc-6.3/0028-export-CPP.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0029-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch b/meta/recipes-devtools/gcc/gcc-6.3/0029-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0029-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
rename to meta/recipes-devtools/gcc/gcc-6.3/0029-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0030-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch b/meta/recipes-devtools/gcc/gcc-6.3/0030-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0030-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
rename to meta/recipes-devtools/gcc/gcc-6.3/0030-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0031-Ensure-target-gcc-headers-can-be-included.patch b/meta/recipes-devtools/gcc/gcc-6.3/0031-Ensure-target-gcc-headers-can-be-included.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0031-Ensure-target-gcc-headers-can-be-included.patch
rename to meta/recipes-devtools/gcc/gcc-6.3/0031-Ensure-target-gcc-headers-can-be-included.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0032-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch b/meta/recipes-devtools/gcc/gcc-6.3/0032-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0032-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
rename to meta/recipes-devtools/gcc/gcc-6.3/0032-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0033-Don-t-search-host-directory-during-relink-if-inst_pr.patch b/meta/recipes-devtools/gcc/gcc-6.3/0033-Don-t-search-host-directory-during-relink-if-inst_pr.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0033-Don-t-search-host-directory-during-relink-if-inst_pr.patch
rename to meta/recipes-devtools/gcc/gcc-6.3/0033-Don-t-search-host-directory-during-relink-if-inst_pr.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0034-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch b/meta/recipes-devtools/gcc/gcc-6.3/0034-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0034-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
rename to meta/recipes-devtools/gcc/gcc-6.3/0034-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0035-aarch64-Add-support-for-musl-ldso.patch b/meta/recipes-devtools/gcc/gcc-6.3/0035-aarch64-Add-support-for-musl-ldso.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0035-aarch64-Add-support-for-musl-ldso.patch
rename to meta/recipes-devtools/gcc/gcc-6.3/0035-aarch64-Add-support-for-musl-ldso.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0036-libcc1-fix-libcc1-s-install-path-and-rpath.patch b/meta/recipes-devtools/gcc/gcc-6.3/0036-libcc1-fix-libcc1-s-install-path-and-rpath.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0036-libcc1-fix-libcc1-s-install-path-and-rpath.patch
rename to meta/recipes-devtools/gcc/gcc-6.3/0036-libcc1-fix-libcc1-s-install-path-and-rpath.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0037-handle-sysroot-support-for-nativesdk-gcc.patch b/meta/recipes-devtools/gcc/gcc-6.3/0037-handle-sysroot-support-for-nativesdk-gcc.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0037-handle-sysroot-support-for-nativesdk-gcc.patch
rename to meta/recipes-devtools/gcc/gcc-6.3/0037-handle-sysroot-support-for-nativesdk-gcc.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0038-Search-target-sysroot-gcc-version-specific-dirs-with.patch b/meta/recipes-devtools/gcc/gcc-6.3/0038-Search-target-sysroot-gcc-version-specific-dirs-with.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0038-Search-target-sysroot-gcc-version-specific-dirs-with.patch
rename to meta/recipes-devtools/gcc/gcc-6.3/0038-Search-target-sysroot-gcc-version-specific-dirs-with.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0039-Fix-various-_FOR_BUILD-and-related-variables.patch b/meta/recipes-devtools/gcc/gcc-6.3/0039-Fix-various-_FOR_BUILD-and-related-variables.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0039-Fix-various-_FOR_BUILD-and-related-variables.patch
rename to meta/recipes-devtools/gcc/gcc-6.3/0039-Fix-various-_FOR_BUILD-and-related-variables.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0040-nios2-Define-MUSL_DYNAMIC_LINKER.patch b/meta/recipes-devtools/gcc/gcc-6.3/0040-nios2-Define-MUSL_DYNAMIC_LINKER.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0040-nios2-Define-MUSL_DYNAMIC_LINKER.patch
rename to meta/recipes-devtools/gcc/gcc-6.3/0040-nios2-Define-MUSL_DYNAMIC_LINKER.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0041-ssp_nonshared.patch b/meta/recipes-devtools/gcc/gcc-6.3/0041-ssp_nonshared.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0041-ssp_nonshared.patch
rename to meta/recipes-devtools/gcc/gcc-6.3/0041-ssp_nonshared.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0042-gcc-libcpp-support-ffile-prefix-map-old-new.patch b/meta/recipes-devtools/gcc/gcc-6.3/0042-gcc-libcpp-support-ffile-prefix-map-old-new.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0042-gcc-libcpp-support-ffile-prefix-map-old-new.patch
rename to meta/recipes-devtools/gcc/gcc-6.3/0042-gcc-libcpp-support-ffile-prefix-map-old-new.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0043-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch b/meta/recipes-devtools/gcc/gcc-6.3/0043-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0043-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch
rename to meta/recipes-devtools/gcc/gcc-6.3/0043-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0044-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch b/meta/recipes-devtools/gcc/gcc-6.3/0044-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0044-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch
rename to meta/recipes-devtools/gcc/gcc-6.3/0044-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0045-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch b/meta/recipes-devtools/gcc/gcc-6.3/0045-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0045-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
rename to meta/recipes-devtools/gcc/gcc-6.3/0045-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0046-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch b/meta/recipes-devtools/gcc/gcc-6.3/0046-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0046-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
rename to meta/recipes-devtools/gcc/gcc-6.3/0046-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch b/meta/recipes-devtools/gcc/gcc-6.3/0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
rename to meta/recipes-devtools/gcc/gcc-6.3/0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0048-ARM-PR-target-71056-Don-t-use-vectorized-builtins-wh.patch b/meta/recipes-devtools/gcc/gcc-6.3/0048-ARM-PR-target-71056-Don-t-use-vectorized-builtins-wh.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/0048-ARM-PR-target-71056-Don-t-use-vectorized-builtins-wh.patch
rename to meta/recipes-devtools/gcc/gcc-6.3/0048-ARM-PR-target-71056-Don-t-use-vectorized-builtins-wh.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/CVE-2016-4490.patch b/meta/recipes-devtools/gcc/gcc-6.3/CVE-2016-4490.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/CVE-2016-4490.patch
rename to meta/recipes-devtools/gcc/gcc-6.3/CVE-2016-4490.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/ubsan-fix-check-empty-string.patch b/meta/recipes-devtools/gcc/gcc-6.3/ubsan-fix-check-empty-string.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-6.2/ubsan-fix-check-empty-string.patch
rename to meta/recipes-devtools/gcc/gcc-6.3/ubsan-fix-check-empty-string.patch
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_6.2.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_6.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-canadian_6.2.bb
rename to meta/recipes-devtools/gcc/gcc-cross-canadian_6.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial_6.2.bb b/meta/recipes-devtools/gcc/gcc-cross-initial_6.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-initial_6.2.bb
rename to meta/recipes-devtools/gcc/gcc-cross-initial_6.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross_6.2.bb b/meta/recipes-devtools/gcc/gcc-cross_6.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross_6.2.bb
rename to meta/recipes-devtools/gcc/gcc-cross_6.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk-initial_6.2.bb b/meta/recipes-devtools/gcc/gcc-crosssdk-initial_6.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk-initial_6.2.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk-initial_6.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_6.2.bb b/meta/recipes-devtools/gcc/gcc-crosssdk_6.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk_6.2.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk_6.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_6.2.bb b/meta/recipes-devtools/gcc/gcc-runtime_6.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-runtime_6.2.bb
rename to meta/recipes-devtools/gcc/gcc-runtime_6.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_6.2.bb b/meta/recipes-devtools/gcc/gcc-sanitizers_6.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-sanitizers_6.2.bb
rename to meta/recipes-devtools/gcc/gcc-sanitizers_6.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-source_6.2.bb b/meta/recipes-devtools/gcc/gcc-source_6.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-source_6.2.bb
rename to meta/recipes-devtools/gcc/gcc-source_6.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc_6.2.bb b/meta/recipes-devtools/gcc/gcc_6.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc_6.2.bb
rename to meta/recipes-devtools/gcc/gcc_6.3.bb
diff --git a/meta/recipes-devtools/gcc/libgcc-initial_6.2.bb b/meta/recipes-devtools/gcc/libgcc-initial_6.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc-initial_6.2.bb
rename to meta/recipes-devtools/gcc/libgcc-initial_6.3.bb
diff --git a/meta/recipes-devtools/gcc/libgcc_6.2.bb b/meta/recipes-devtools/gcc/libgcc_6.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc_6.2.bb
rename to meta/recipes-devtools/gcc/libgcc_6.3.bb
diff --git a/meta/recipes-devtools/gcc/libgfortran_6.2.bb b/meta/recipes-devtools/gcc/libgfortran_6.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgfortran_6.2.bb
rename to meta/recipes-devtools/gcc/libgfortran_6.3.bb
-- 
2.15.1


