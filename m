Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6C7BD78C99
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 08:31:23 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id z7-v6so2012349plo.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 01:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=uW/Y3zV0nxqxFcBSRx7kWMp1sgdMiIDQtIBZw2w0Bpo=;
	b=prYeDn7o75seK4KXw3aSHO1lv2CVbzmzWijbJEfRCAU+9lzy50JrahVK6PuQTJFRP2
	Q8vwZGIoRJcJziJqfl/6vlsJ60ndV3254xQA+AnH89TgIrmnQp5pzSCQvbWQloP1BvCd
	IkBikr1KTCivtpUl/oobBmAdDanGtfQjn41LITVanjJF8lgvPuqYwDkI4Wz1l5vqKaNg
	o8l593xD8O8NloZQ3WxIt+CyGQZeqgd/MW44FONsxOgPSoMzSztiBIOB4OBiUPpF64UU
	sv4j5tonx7svkZyCqD+NmpmfpGgsIeAM0ASli36DAkxu3ZlWrXXji6SpNSPxu6ZcLS68
	cIUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=uW/Y3zV0nxqxFcBSRx7kWMp1sgdMiIDQtIBZw2w0Bpo=;
	b=YYZjuTFiJ7acgFEg4GVngYSD5uQXUdZlx7teAb+0R3ebqcGbRadgBksY595t7y8h60
	m7pZetp4T+V3FRaZ55kePKu88chwTsrU7m9gdyLlyU3ttg9e/MhRhAVvvP3RM5R5Tklh
	W2213IkXnv2RigIdWX3XKLTFKkGta1cSt7vRxqWt3SfdZlauNzS3QergVFjXxZe/esBz
	AzUA98aM/3kVnzTSfFM9dDDbT1zKbu7i5t60aSYWMIjCyEW3/Ur4QyxRJrOxgNJQFl87
	bdxB5aazSet3HzmMRUex7UDILc+2+wFMkrMIS/oqYhnb4q6ZXl9AzDGVmBu3NOSvklYL
	uWEg==
X-Gm-Message-State: AOUpUlHPWlIOV0Vi22WrqpQORixef6xAEwYeQFpgXT8wVFP18WSf3iVC
	WhgNNgfjulQJR/uukUh43Ux0WK2e
X-Google-Smtp-Source: AAOMgpefyMiIUgSMfKdKC2pvtB0DCRfH+VW643z2obj5rRPHf11dqj56+KFilz4Mg6EYlQ/bFcgaHg==
X-Received: by 2002:a17:902:8a8e:: with SMTP id
	p14-v6mr5107256plo.213.1532680283838; 
	Fri, 27 Jul 2018 01:31:23 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::ee7a])
	by smtp.gmail.com with ESMTPSA id
	j83-v6sm8437383pfj.71.2018.07.27.01.31.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jul 2018 01:31:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jul 2018 01:31:13 -0700
Message-Id: <20180727083113.17370-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH] gcc-8: Upgrade to 8.2 release
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
X-List-Received-Date: Fri, 27 Jul 2018 08:31:23 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...003-build-failures-with-with-cpu-xsc.patch | 61 -------------------
 .../gcc/{gcc-8.1.inc => gcc-8.2.inc}          | 11 ++--
 ...0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch |  0
 .../0003-gcc-poison-system-directories.patch  |  0
 .../0004-gcc-poison-dir-extend.patch          |  0
 ...-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |  0
 .../0006-64-bit-multilib-hack.patch           |  0
 .../0007-optional-libstdc.patch               |  0
 ...gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch |  0
 .../0009-COLLECT_GCC_OPTIONS.patch            |  0
 ...ts.h-in-B-instead-of-S-and-t-oe-in-B.patch |  0
 .../0011-fortran-cross-compile-hack.patch     |  0
 .../0012-cpp-honor-sysroot.patch              |  0
 .../0013-MIPS64-Default-to-N64-ABI.patch      |  0
 ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |  0
 ...gcc-Fix-argument-list-too-long-error.patch |  0
 .../0016-Disable-sdt.patch                    |  0
 .../{gcc-8.1 => gcc-8.2}/0017-libtool.patch   |  0
 ...s-fix-v4bx-to-linker-to-support-EABI.patch |  0
 ...-config-files-from-B-instead-of-usin.patch |  0
 ...ir-from-.la-which-usually-points-to-.patch |  0
 .../0021-export-CPP.patch                     |  0
 ...ILIB_OSDIRNAMES-and-other-multilib-o.patch |  0
 ...e-target-gcc-headers-can-be-included.patch |  0
 ...ild-with-disable-dependency-tracking.patch |  0
 ...t-directory-during-relink-if-inst_pr.patch |  0
 ...IR-replacement-instead-of-hardcoding.patch |  0
 ...27-aarch64-Add-support-for-musl-ldso.patch |  0
 ...-fix-libcc1-s-install-path-and-rpath.patch |  0
 ...le-sysroot-support-for-nativesdk-gcc.patch |  0
 ...sroot-gcc-version-specific-dirs-with.patch |  0
 ...ous-_FOR_BUILD-and-related-variables.patch |  0
 ...032-nios2-Define-MUSL_DYNAMIC_LINKER.patch |  0
 ...d-to-link-commandline-for-musl-targe.patch |  0
 ...bgcc-Add-knob-to-use-ldbl-128-on-ppc.patch |  0
 ...using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch |  0
 ...as-for-__cpu_indicator_init-instead-.patch |  0
 .../0037-sync-gcc-stddef.h-with-musl.patch    |  0
 ...-fault-in-precompiled-header-generat.patch |  0
 .../0039-Fix-for-testsuite-failure.patch      |  0
 ...Re-introduce-spe-commandline-options.patch |  0
 ...adian_8.1.bb => gcc-cross-canadian_8.2.bb} |  0
 ...nitial_8.1.bb => gcc-cross-initial_8.2.bb} |  0
 .../{gcc-cross_8.1.bb => gcc-cross_8.2.bb}    |  0
 ...ial_8.1.bb => gcc-crosssdk-initial_8.2.bb} |  0
 ...cc-crosssdk_8.1.bb => gcc-crosssdk_8.2.bb} |  0
 ...{gcc-runtime_8.1.bb => gcc-runtime_8.2.bb} |  0
 ...anitizers_8.1.bb => gcc-sanitizers_8.2.bb} |  0
 .../{gcc-source_8.1.bb => gcc-source_8.2.bb}  |  0
 .../gcc/{gcc_8.1.bb => gcc_8.2.bb}            |  0
 ...c-initial_8.1.bb => libgcc-initial_8.2.bb} |  0
 .../gcc/{libgcc_8.1.bb => libgcc_8.2.bb}      |  0
 ...{libgfortran_8.1.bb => libgfortran_8.2.bb} |  0
 53 files changed, 5 insertions(+), 67 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0041-arm-PR-target-86003-build-failures-with-with-cpu-xsc.patch
 rename meta/recipes-devtools/gcc/{gcc-8.1.inc => gcc-8.2.inc} (93%)
 rename meta/recipes-devtools/gcc/{gcc-8.1 => gcc-8.2}/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-8.1 => gcc-8.2}/0003-gcc-poison-system-directories.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-8.1 => gcc-8.2}/0004-gcc-poison-dir-extend.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-8.1 => gcc-8.2}/0005-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-8.1 => gcc-8.2}/0006-64-bit-multilib-hack.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-8.1 => gcc-8.2}/0007-optional-libstdc.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-8.1 => gcc-8.2}/0008-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-8.1 => gcc-8.2}/0009-COLLECT_GCC_OPTIONS.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-8.1 => gcc-8.2}/0010-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-8.1 => gcc-8.2}/0011-fortran-cross-compile-hack.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-8.1 => gcc-8.2}/0012-cpp-honor-sysroot.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-8.1 => gcc-8.2}/0013-MIPS64-Default-to-N64-ABI.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-8.1 => gcc-8.2}/0014-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-8.1 => gcc-8.2}/0015-gcc-Fix-argument-list-too-long-error.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-8.1 => gcc-8.2}/0016-Disable-sdt.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-8.1 => gcc-8.2}/0017-libtool.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-8.1 => gcc-8.2}/0018-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-8.1 => gcc-8.2}/0019-Use-the-multilib-config-files-from-B-instead-of-usin.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-8.1 => gcc-8.2}/0020-Avoid-using-libdir-from-.la-which-usually-points-to-.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-8.1 => gcc-8.2}/0021-export-CPP.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-8.1 => gcc-8.2}/0022-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-8.1 => gcc-8.2}/0023-Ensure-target-gcc-headers-can-be-included.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-8.1 => gcc-8.2}/0024-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-8.1 => gcc-8.2}/0025-Don-t-search-host-directory-during-relink-if-inst_pr.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-8.1 => gcc-8.2}/0026-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-8.1 => gcc-8.2}/0027-aarch64-Add-support-for-musl-ldso.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-8.1 => gcc-8.2}/0028-libcc1-fix-libcc1-s-install-path-and-rpath.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-8.1 => gcc-8.2}/0029-handle-sysroot-support-for-nativesdk-gcc.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-8.1 => gcc-8.2}/0030-Search-target-sysroot-gcc-version-specific-dirs-with.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-8.1 => gcc-8.2}/0031-Fix-various-_FOR_BUILD-and-related-variables.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-8.1 => gcc-8.2}/0032-nios2-Define-MUSL_DYNAMIC_LINKER.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-8.1 => gcc-8.2}/0033-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-8.1 => gcc-8.2}/0034-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-8.1 => gcc-8.2}/0035-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-8.1 => gcc-8.2}/0036-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-8.1 => gcc-8.2}/0037-sync-gcc-stddef.h-with-musl.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-8.1 => gcc-8.2}/0038-fix-segmentation-fault-in-precompiled-header-generat.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-8.1 => gcc-8.2}/0039-Fix-for-testsuite-failure.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-8.1 => gcc-8.2}/0040-Re-introduce-spe-commandline-options.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_8.1.bb => gcc-cross-canadian_8.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross-initial_8.1.bb => gcc-cross-initial_8.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_8.1.bb => gcc-cross_8.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk-initial_8.1.bb => gcc-crosssdk-initial_8.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_8.1.bb => gcc-crosssdk_8.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_8.1.bb => gcc-runtime_8.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_8.1.bb => gcc-sanitizers_8.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_8.1.bb => gcc-source_8.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc_8.1.bb => gcc_8.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_8.1.bb => libgcc-initial_8.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_8.1.bb => libgcc_8.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_8.1.bb => libgfortran_8.2.bb} (100%)

diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0041-arm-PR-target-86003-build-failures-with-with-cpu-xsc.patch b/meta/recipes-devtools/gcc/gcc-8.1/0041-arm-PR-target-86003-build-failures-with-with-cpu-xsc.patch
deleted file mode 100644
index 68b8962d47..0000000000
--- a/meta/recipes-devtools/gcc/gcc-8.1/0041-arm-PR-target-86003-build-failures-with-with-cpu-xsc.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 11dc6b9576b78bb7a8d70491beab7ab4de24c9d0 Mon Sep 17 00:00:00 2001
-From: rearnsha <rearnsha@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Mon, 4 Jun 2018 08:46:04 +0000
-Subject: [PATCH] [arm] PR target/86003 build failures with --with-cpu=xscale
-
-The XScale cpu configuration in GCC has always been somewhat
-non-conforming.  Although XScale isn't an architecture (it's simply an
-implementation of ARMv5te), we do by tradition emit a specific
-pre-define for it.  We achieve this effect by adding an additional
-feature bit to the xscale CPU definition that isn't part of the base
-architecture.
-
-When I restructured the options last year I overlooked this oddity and
-the result, of course, is that this configuration now fails to build
-as intended.
-
-What happens is that the driver (correctly) constructs an architecture
-for the xscale cpu name (as armv5te) and passes it in addition to the
-CPU name.  The backend code, on finding both a cpu and an architecture
-specifies attempts to correlate the two and finds a difference due to
-the additional feature bit and reports an inconsistency (fatally if
--werror is specified).
-
-I think the best fix to this is to treat the xscale feature bit using
-the same mechanism that we use for other 'quirks' in CPU
-implementations and simply filter it out before comparing the
-capabilities.  It has the additional benefit that it's also the
-simplest fix.
-
-	PR target/86003
-	* config/arm/arm-cpus.in (ALL_QUIRKS): Add xscale feature to the list
-	of bits to ignore when comparing architectures.
-
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-8-branch@261141 138bc75d-0d04-0410-961f-82ee72b054a4
----
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Backport
-
- gcc/ChangeLog              | 6 ++++++
- gcc/config/arm/arm-cpus.in | 4 +++-
- 2 files changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/gcc/config/arm/arm-cpus.in b/gcc/config/arm/arm-cpus.in
-index 96972a057e7..545321b0bbe 100644
---- a/gcc/config/arm/arm-cpus.in
-+++ b/gcc/config/arm/arm-cpus.in
-@@ -268,7 +268,9 @@ define fgroup DOTPROD	NEON dotprod
- 
- # List of all quirk bits to strip out when comparing CPU features with
- # architectures.
--define fgroup ALL_QUIRKS   quirk_no_volatile_ce quirk_armv6kz quirk_cm3_ldrd
-+# xscale isn't really a 'quirk', but it isn't an architecture either and we
-+# need to ignore it for matching purposes.
-+define fgroup ALL_QUIRKS   quirk_no_volatile_ce quirk_armv6kz quirk_cm3_ldrd xscale
- 
- # Architecture entries
- # format:
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/gcc/gcc-8.1.inc b/meta/recipes-devtools/gcc/gcc-8.2.inc
similarity index 93%
rename from meta/recipes-devtools/gcc/gcc-8.1.inc
rename to meta/recipes-devtools/gcc/gcc-8.2.inc
index ebe3c24978..8503a66b07 100644
--- a/meta/recipes-devtools/gcc/gcc-8.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-8.2.inc
@@ -2,13 +2,13 @@ require gcc-common.inc
 
 # Third digit in PV should be incremented after a minor release
 
-PV = "8.1.0"
+PV = "8.2.0"
 
 # BINV should be incremented to a revision after a minor gcc release
 
-BINV = "8.1.0"
+BINV = "8.2.0"
 
-FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-8.1:${FILE_DIRNAME}/gcc-8.1/backport:"
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-8.2:${FILE_DIRNAME}/gcc-8.2/backport:"
 
 DEPENDS =+ "mpfr gmp libmpc zlib flex-native"
 NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native flex-native"
@@ -73,10 +73,9 @@ SRC_URI = "\
            ${BACKPORTS} \
 "
 BACKPORTS = "\
-           file://0041-arm-PR-target-86003-build-failures-with-with-cpu-xsc.patch \
 "
-SRC_URI[md5sum] = "65f7c65818dc540b3437605026d329fc"
-SRC_URI[sha256sum] = "1d1866f992626e61349a1ccd0b8d5253816222cdc13390dcfaa74b093aa2b153"
+SRC_URI[md5sum] = "4ab282f414676496483b3e1793d07862"
+SRC_URI[sha256sum] = "196c3c04ba2613f893283977e6011b2345d1cd1af9abeac58e916b1aab3e0080"
 
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
 #S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/git"
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc-8.2/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-8.1/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
rename to meta/recipes-devtools/gcc/gcc-8.2/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0003-gcc-poison-system-directories.patch b/meta/recipes-devtools/gcc/gcc-8.2/0003-gcc-poison-system-directories.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-8.1/0003-gcc-poison-system-directories.patch
rename to meta/recipes-devtools/gcc/gcc-8.2/0003-gcc-poison-system-directories.patch
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0004-gcc-poison-dir-extend.patch b/meta/recipes-devtools/gcc/gcc-8.2/0004-gcc-poison-dir-extend.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-8.1/0004-gcc-poison-dir-extend.patch
rename to meta/recipes-devtools/gcc/gcc-8.2/0004-gcc-poison-dir-extend.patch
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0005-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc-8.2/0005-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-8.1/0005-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
rename to meta/recipes-devtools/gcc/gcc-8.2/0005-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0006-64-bit-multilib-hack.patch b/meta/recipes-devtools/gcc/gcc-8.2/0006-64-bit-multilib-hack.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-8.1/0006-64-bit-multilib-hack.patch
rename to meta/recipes-devtools/gcc/gcc-8.2/0006-64-bit-multilib-hack.patch
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0007-optional-libstdc.patch b/meta/recipes-devtools/gcc/gcc-8.2/0007-optional-libstdc.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-8.1/0007-optional-libstdc.patch
rename to meta/recipes-devtools/gcc/gcc-8.2/0007-optional-libstdc.patch
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0008-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch b/meta/recipes-devtools/gcc/gcc-8.2/0008-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-8.1/0008-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
rename to meta/recipes-devtools/gcc/gcc-8.2/0008-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0009-COLLECT_GCC_OPTIONS.patch b/meta/recipes-devtools/gcc/gcc-8.2/0009-COLLECT_GCC_OPTIONS.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-8.1/0009-COLLECT_GCC_OPTIONS.patch
rename to meta/recipes-devtools/gcc/gcc-8.2/0009-COLLECT_GCC_OPTIONS.patch
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0010-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch b/meta/recipes-devtools/gcc/gcc-8.2/0010-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-8.1/0010-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
rename to meta/recipes-devtools/gcc/gcc-8.2/0010-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0011-fortran-cross-compile-hack.patch b/meta/recipes-devtools/gcc/gcc-8.2/0011-fortran-cross-compile-hack.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-8.1/0011-fortran-cross-compile-hack.patch
rename to meta/recipes-devtools/gcc/gcc-8.2/0011-fortran-cross-compile-hack.patch
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0012-cpp-honor-sysroot.patch b/meta/recipes-devtools/gcc/gcc-8.2/0012-cpp-honor-sysroot.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-8.1/0012-cpp-honor-sysroot.patch
rename to meta/recipes-devtools/gcc/gcc-8.2/0012-cpp-honor-sysroot.patch
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0013-MIPS64-Default-to-N64-ABI.patch b/meta/recipes-devtools/gcc/gcc-8.2/0013-MIPS64-Default-to-N64-ABI.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-8.1/0013-MIPS64-Default-to-N64-ABI.patch
rename to meta/recipes-devtools/gcc/gcc-8.2/0013-MIPS64-Default-to-N64-ABI.patch
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0014-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc-8.2/0014-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-8.1/0014-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
rename to meta/recipes-devtools/gcc/gcc-8.2/0014-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0015-gcc-Fix-argument-list-too-long-error.patch b/meta/recipes-devtools/gcc/gcc-8.2/0015-gcc-Fix-argument-list-too-long-error.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-8.1/0015-gcc-Fix-argument-list-too-long-error.patch
rename to meta/recipes-devtools/gcc/gcc-8.2/0015-gcc-Fix-argument-list-too-long-error.patch
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0016-Disable-sdt.patch b/meta/recipes-devtools/gcc/gcc-8.2/0016-Disable-sdt.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-8.1/0016-Disable-sdt.patch
rename to meta/recipes-devtools/gcc/gcc-8.2/0016-Disable-sdt.patch
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0017-libtool.patch b/meta/recipes-devtools/gcc/gcc-8.2/0017-libtool.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-8.1/0017-libtool.patch
rename to meta/recipes-devtools/gcc/gcc-8.2/0017-libtool.patch
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0018-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch b/meta/recipes-devtools/gcc/gcc-8.2/0018-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-8.1/0018-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
rename to meta/recipes-devtools/gcc/gcc-8.2/0018-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0019-Use-the-multilib-config-files-from-B-instead-of-usin.patch b/meta/recipes-devtools/gcc/gcc-8.2/0019-Use-the-multilib-config-files-from-B-instead-of-usin.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-8.1/0019-Use-the-multilib-config-files-from-B-instead-of-usin.patch
rename to meta/recipes-devtools/gcc/gcc-8.2/0019-Use-the-multilib-config-files-from-B-instead-of-usin.patch
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0020-Avoid-using-libdir-from-.la-which-usually-points-to-.patch b/meta/recipes-devtools/gcc/gcc-8.2/0020-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-8.1/0020-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
rename to meta/recipes-devtools/gcc/gcc-8.2/0020-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0021-export-CPP.patch b/meta/recipes-devtools/gcc/gcc-8.2/0021-export-CPP.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-8.1/0021-export-CPP.patch
rename to meta/recipes-devtools/gcc/gcc-8.2/0021-export-CPP.patch
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0022-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch b/meta/recipes-devtools/gcc/gcc-8.2/0022-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-8.1/0022-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
rename to meta/recipes-devtools/gcc/gcc-8.2/0022-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0023-Ensure-target-gcc-headers-can-be-included.patch b/meta/recipes-devtools/gcc/gcc-8.2/0023-Ensure-target-gcc-headers-can-be-included.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-8.1/0023-Ensure-target-gcc-headers-can-be-included.patch
rename to meta/recipes-devtools/gcc/gcc-8.2/0023-Ensure-target-gcc-headers-can-be-included.patch
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0024-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch b/meta/recipes-devtools/gcc/gcc-8.2/0024-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-8.1/0024-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
rename to meta/recipes-devtools/gcc/gcc-8.2/0024-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0025-Don-t-search-host-directory-during-relink-if-inst_pr.patch b/meta/recipes-devtools/gcc/gcc-8.2/0025-Don-t-search-host-directory-during-relink-if-inst_pr.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-8.1/0025-Don-t-search-host-directory-during-relink-if-inst_pr.patch
rename to meta/recipes-devtools/gcc/gcc-8.2/0025-Don-t-search-host-directory-during-relink-if-inst_pr.patch
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0026-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch b/meta/recipes-devtools/gcc/gcc-8.2/0026-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-8.1/0026-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
rename to meta/recipes-devtools/gcc/gcc-8.2/0026-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0027-aarch64-Add-support-for-musl-ldso.patch b/meta/recipes-devtools/gcc/gcc-8.2/0027-aarch64-Add-support-for-musl-ldso.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-8.1/0027-aarch64-Add-support-for-musl-ldso.patch
rename to meta/recipes-devtools/gcc/gcc-8.2/0027-aarch64-Add-support-for-musl-ldso.patch
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0028-libcc1-fix-libcc1-s-install-path-and-rpath.patch b/meta/recipes-devtools/gcc/gcc-8.2/0028-libcc1-fix-libcc1-s-install-path-and-rpath.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-8.1/0028-libcc1-fix-libcc1-s-install-path-and-rpath.patch
rename to meta/recipes-devtools/gcc/gcc-8.2/0028-libcc1-fix-libcc1-s-install-path-and-rpath.patch
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0029-handle-sysroot-support-for-nativesdk-gcc.patch b/meta/recipes-devtools/gcc/gcc-8.2/0029-handle-sysroot-support-for-nativesdk-gcc.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-8.1/0029-handle-sysroot-support-for-nativesdk-gcc.patch
rename to meta/recipes-devtools/gcc/gcc-8.2/0029-handle-sysroot-support-for-nativesdk-gcc.patch
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0030-Search-target-sysroot-gcc-version-specific-dirs-with.patch b/meta/recipes-devtools/gcc/gcc-8.2/0030-Search-target-sysroot-gcc-version-specific-dirs-with.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-8.1/0030-Search-target-sysroot-gcc-version-specific-dirs-with.patch
rename to meta/recipes-devtools/gcc/gcc-8.2/0030-Search-target-sysroot-gcc-version-specific-dirs-with.patch
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0031-Fix-various-_FOR_BUILD-and-related-variables.patch b/meta/recipes-devtools/gcc/gcc-8.2/0031-Fix-various-_FOR_BUILD-and-related-variables.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-8.1/0031-Fix-various-_FOR_BUILD-and-related-variables.patch
rename to meta/recipes-devtools/gcc/gcc-8.2/0031-Fix-various-_FOR_BUILD-and-related-variables.patch
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0032-nios2-Define-MUSL_DYNAMIC_LINKER.patch b/meta/recipes-devtools/gcc/gcc-8.2/0032-nios2-Define-MUSL_DYNAMIC_LINKER.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-8.1/0032-nios2-Define-MUSL_DYNAMIC_LINKER.patch
rename to meta/recipes-devtools/gcc/gcc-8.2/0032-nios2-Define-MUSL_DYNAMIC_LINKER.patch
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0033-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch b/meta/recipes-devtools/gcc/gcc-8.2/0033-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-8.1/0033-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
rename to meta/recipes-devtools/gcc/gcc-8.2/0033-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0034-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch b/meta/recipes-devtools/gcc/gcc-8.2/0034-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-8.1/0034-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
rename to meta/recipes-devtools/gcc/gcc-8.2/0034-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0035-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch b/meta/recipes-devtools/gcc/gcc-8.2/0035-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-8.1/0035-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
rename to meta/recipes-devtools/gcc/gcc-8.2/0035-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0036-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch b/meta/recipes-devtools/gcc/gcc-8.2/0036-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-8.1/0036-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
rename to meta/recipes-devtools/gcc/gcc-8.2/0036-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0037-sync-gcc-stddef.h-with-musl.patch b/meta/recipes-devtools/gcc/gcc-8.2/0037-sync-gcc-stddef.h-with-musl.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-8.1/0037-sync-gcc-stddef.h-with-musl.patch
rename to meta/recipes-devtools/gcc/gcc-8.2/0037-sync-gcc-stddef.h-with-musl.patch
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0038-fix-segmentation-fault-in-precompiled-header-generat.patch b/meta/recipes-devtools/gcc/gcc-8.2/0038-fix-segmentation-fault-in-precompiled-header-generat.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-8.1/0038-fix-segmentation-fault-in-precompiled-header-generat.patch
rename to meta/recipes-devtools/gcc/gcc-8.2/0038-fix-segmentation-fault-in-precompiled-header-generat.patch
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0039-Fix-for-testsuite-failure.patch b/meta/recipes-devtools/gcc/gcc-8.2/0039-Fix-for-testsuite-failure.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-8.1/0039-Fix-for-testsuite-failure.patch
rename to meta/recipes-devtools/gcc/gcc-8.2/0039-Fix-for-testsuite-failure.patch
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0040-Re-introduce-spe-commandline-options.patch b/meta/recipes-devtools/gcc/gcc-8.2/0040-Re-introduce-spe-commandline-options.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-8.1/0040-Re-introduce-spe-commandline-options.patch
rename to meta/recipes-devtools/gcc/gcc-8.2/0040-Re-introduce-spe-commandline-options.patch
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_8.1.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_8.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-canadian_8.1.bb
rename to meta/recipes-devtools/gcc/gcc-cross-canadian_8.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial_8.1.bb b/meta/recipes-devtools/gcc/gcc-cross-initial_8.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-initial_8.1.bb
rename to meta/recipes-devtools/gcc/gcc-cross-initial_8.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross_8.1.bb b/meta/recipes-devtools/gcc/gcc-cross_8.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross_8.1.bb
rename to meta/recipes-devtools/gcc/gcc-cross_8.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk-initial_8.1.bb b/meta/recipes-devtools/gcc/gcc-crosssdk-initial_8.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk-initial_8.1.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk-initial_8.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_8.1.bb b/meta/recipes-devtools/gcc/gcc-crosssdk_8.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk_8.1.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk_8.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_8.1.bb b/meta/recipes-devtools/gcc/gcc-runtime_8.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-runtime_8.1.bb
rename to meta/recipes-devtools/gcc/gcc-runtime_8.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_8.1.bb b/meta/recipes-devtools/gcc/gcc-sanitizers_8.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-sanitizers_8.1.bb
rename to meta/recipes-devtools/gcc/gcc-sanitizers_8.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-source_8.1.bb b/meta/recipes-devtools/gcc/gcc-source_8.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-source_8.1.bb
rename to meta/recipes-devtools/gcc/gcc-source_8.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc_8.1.bb b/meta/recipes-devtools/gcc/gcc_8.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc_8.1.bb
rename to meta/recipes-devtools/gcc/gcc_8.2.bb
diff --git a/meta/recipes-devtools/gcc/libgcc-initial_8.1.bb b/meta/recipes-devtools/gcc/libgcc-initial_8.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc-initial_8.1.bb
rename to meta/recipes-devtools/gcc/libgcc-initial_8.2.bb
diff --git a/meta/recipes-devtools/gcc/libgcc_8.1.bb b/meta/recipes-devtools/gcc/libgcc_8.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc_8.1.bb
rename to meta/recipes-devtools/gcc/libgcc_8.2.bb
diff --git a/meta/recipes-devtools/gcc/libgfortran_8.1.bb b/meta/recipes-devtools/gcc/libgfortran_8.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgfortran_8.1.bb
rename to meta/recipes-devtools/gcc/libgfortran_8.2.bb
-- 
2.18.0


