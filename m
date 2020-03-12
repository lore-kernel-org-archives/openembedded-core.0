Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id BBAF461CBC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 23:08:31 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id j20so3274180pll.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 16:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4Ur2o5U2DXgV2Bau8fLsTmPcfDmcNVCVh5MtQ9y+AaU=;
	b=B7xttYWs1uIv9VHmN0A9EmsHA5eQPFpzdnktWhm1kiR7bi1ZaANiLHHsywPZrS/Bm9
	TpQxDBi8CoDvbNf7eOTbGB/O0CDhjY1AgbGQ7M9uxbK5hIwchlwh8KtpPoE6wvvhTe5M
	2oG4J0d2RZet16HuvDx0Jg9g47XjGasLqmz/y251dKOD8HeGkExbTq3mdjVr/CU9OMd+
	W1f3vells9VyrnTLL/vq9mdCFrcqTo4zCUA3ySK7DZJWDjD4WA2CTHtPyVBFgNd0UodV
	eXIRrkk6hx1aNCV7p7ZOX8hybtvqA/rgQfxKnGcArPZnI6TKHSD3M41AuOXe8StE2p+v
	9iWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4Ur2o5U2DXgV2Bau8fLsTmPcfDmcNVCVh5MtQ9y+AaU=;
	b=UozA3Us/kzZf7RyJz7bVPI6Iivzgnd3YvZ4oPhmBhJm6LhiLbzCfalQup7ZbWA0qIO
	fEjkpXY+RcHtOzeMe8/bVmOxp5DemuSFtwHXKUtw9BNtFxz6a6x5OstUq5HBcwbbd3X6
	9sIwTEWU9rd9swRfiDmQjkooYZZRH0l/2V/JzwAKBbduq2NL7XnQGPzF52LhM4JsTRkF
	qvOFUevRT0kDmxi0YdCRfPIlA/Tn6BGIb14mWz9oh4OTDJ5iUkCt+Az6JHCwQ3HIsrJ8
	EZ4PXaqSsfj9/975FknTdqu2lCDR4MSb7CeU8Moeyji7QhXv5FEWWFExGtWdlbyOzzfE
	Ve2Q==
X-Gm-Message-State: ANhLgQ292l4N8uheInSJnjBfxTGKmIGOu2/QUZIsHxdzyBP93XONOHco
	blf4C3Wb29tls/WtXLJky2IbBzPvjpY=
X-Google-Smtp-Source: ADFU+vs2/bjw9NiucJVA9lptdV6vdC8nc0itlKAIkfn/R7J4pdnXKICuthR4GMXdeib2NUq+JAJ0+w==
X-Received: by 2002:a17:90a:928c:: with SMTP id
	n12mr6684207pjo.45.1584054508578; 
	Thu, 12 Mar 2020 16:08:28 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::94a8])
	by smtp.gmail.com with ESMTPSA id
	u23sm55396249pfm.29.2020.03.12.16.08.27
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Mar 2020 16:08:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Mar 2020 16:08:40 -0700
Message-Id: <20200312230840.751166-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [PATCH] gcc: Upgrade to 9.3 bugfix release
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
X-List-Received-Date: Thu, 12 Mar 2020 23:08:32 -0000
Content-Transfer-Encoding: 8bit

This brings ~157 bugfixes [1] to gcc-9 with no features
Drop backports which are already part of the release now

[1] https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=RESOLVED&list_id=260610&resolution=FIXED&target_milestone=9.3

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |   2 +-
 ...libsanitizer-build-with-master-glibc.patch |  70 ---
 .../gcc/gcc-9.2/CVE-2019-15847_1.patch        | 521 ------------------
 .../gcc/gcc-9.2/CVE-2019-15847_2.patch        |  77 ---
 .../gcc/gcc-9.2/CVE-2019-15847_3.patch        |  62 ---
 .../gcc/{gcc-9.2.inc => gcc-9.3.inc}          |  22 +-
 ...0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch |   6 +-
 .../0002-gcc-poison-system-directories.patch  |  24 +-
 ...-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |   6 +-
 .../0004-64-bit-multilib-hack.patch           |   6 +-
 .../0005-optional-libstdc.patch               |  12 +-
 .../0006-COLLECT_GCC_OPTIONS.patch            |   6 +-
 ...ts.h-in-B-instead-of-S-and-t-oe-in-B.patch |  14 +-
 .../0008-fortran-cross-compile-hack.patch     |   6 +-
 .../0009-cpp-honor-sysroot.patch              |   6 +-
 .../0010-MIPS64-Default-to-N64-ABI.patch      |   8 +-
 ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |   7 +-
 ...gcc-Fix-argument-list-too-long-error.patch |  10 +-
 .../0013-Disable-sdt.patch                    |  20 +-
 .../{gcc-9.2 => gcc-9.3}/0014-libtool.patch   |   6 +-
 ...s-fix-v4bx-to-linker-to-support-EABI.patch |   6 +-
 ...-config-files-from-B-instead-of-usin.patch |  14 +-
 ...ir-from-.la-which-usually-points-to-.patch |   6 +-
 .../0018-export-CPP.patch                     |   6 +-
 ...e-target-gcc-headers-can-be-included.patch |  19 +-
 ...ild-with-disable-dependency-tracking.patch |   6 +-
 ...t-directory-during-relink-if-inst_pr.patch |   6 +-
 ...IR-replacement-instead-of-hardcoding.patch |   6 +-
 ...23-aarch64-Add-support-for-musl-ldso.patch |   6 +-
 ...-fix-libcc1-s-install-path-and-rpath.patch |   6 +-
 ...le-sysroot-support-for-nativesdk-gcc.patch | 187 +------
 ...sroot-gcc-version-specific-dirs-with.patch |  12 +-
 ...ous-_FOR_BUILD-and-related-variables.patch |  14 +-
 ...028-nios2-Define-MUSL_DYNAMIC_LINKER.patch |   6 +-
 ...d-to-link-commandline-for-musl-targe.patch |   6 +-
 .../0030-ldbl128-config.patch}                |  16 +-
 ...using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch |   6 +-
 ...as-for-__cpu_indicator_init-instead-.patch |  10 +-
 .../0033-sync-gcc-stddef.h-with-musl.patch    |   6 +-
 ...-fault-in-precompiled-header-generat.patch |   6 +-
 .../0035-Fix-for-testsuite-failure.patch      |   6 +-
 ...Re-introduce-spe-commandline-options.patch |   6 +-
 ...eck-zero-value-in-simple_object_elf.patch} |  24 +-
 ...-Do-not-use-__LINE__-for-maintainin.patch} |  21 +-
 ...nds-Don-t-match-user-defined-regs-o.patch} |  15 +-
 ...adian_9.2.bb => gcc-cross-canadian_9.3.bb} |   0
 .../{gcc-cross_9.2.bb => gcc-cross_9.3.bb}    |   0
 ...cc-crosssdk_9.2.bb => gcc-crosssdk_9.3.bb} |   0
 ...{gcc-runtime_9.2.bb => gcc-runtime_9.3.bb} |   0
 ...anitizers_9.2.bb => gcc-sanitizers_9.3.bb} |   0
 .../{gcc-source_9.2.bb => gcc-source_9.3.bb}  |   0
 .../gcc/{gcc_9.2.bb => gcc_9.3.bb}            |   0
 ...c-initial_9.2.bb => libgcc-initial_9.3.bb} |   0
 .../gcc/{libgcc_9.2.bb => libgcc_9.3.bb}      |   0
 ...{libgfortran_9.2.bb => libgfortran_9.3.bb} |   0
 55 files changed, 238 insertions(+), 1075 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-9.2/0037-Fix-up-libsanitizer-build-with-master-glibc.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-9.2/CVE-2019-15847_1.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-9.2/CVE-2019-15847_2.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-9.2/CVE-2019-15847_3.patch
 rename meta/recipes-devtools/gcc/{gcc-9.2.inc => gcc-9.3.inc} (87%)
 rename meta/recipes-devtools/gcc/{gcc-9.2 => gcc-9.3}/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch (89%)
 rename meta/recipes-devtools/gcc/{gcc-9.2 => gcc-9.3}/0002-gcc-poison-system-directories.patch (92%)
 rename meta/recipes-devtools/gcc/{gcc-9.2 => gcc-9.3}/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch (95%)
 rename meta/recipes-devtools/gcc/{gcc-9.2 => gcc-9.3}/0004-64-bit-multilib-hack.patch (98%)
 rename meta/recipes-devtools/gcc/{gcc-9.2 => gcc-9.3}/0005-optional-libstdc.patch (94%)
 rename meta/recipes-devtools/gcc/{gcc-9.2 => gcc-9.3}/0006-COLLECT_GCC_OPTIONS.patch (89%)
 rename meta/recipes-devtools/gcc/{gcc-9.2 => gcc-9.3}/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch (91%)
 rename meta/recipes-devtools/gcc/{gcc-9.2 => gcc-9.3}/0008-fortran-cross-compile-hack.patch (91%)
 rename meta/recipes-devtools/gcc/{gcc-9.2 => gcc-9.3}/0009-cpp-honor-sysroot.patch (94%)
 rename meta/recipes-devtools/gcc/{gcc-9.2 => gcc-9.3}/0010-MIPS64-Default-to-N64-ABI.patch (89%)
 rename meta/recipes-devtools/gcc/{gcc-9.2 => gcc-9.3}/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch (98%)
 rename meta/recipes-devtools/gcc/{gcc-9.2 => gcc-9.3}/0012-gcc-Fix-argument-list-too-long-error.patch (85%)
 rename meta/recipes-devtools/gcc/{gcc-9.2 => gcc-9.3}/0013-Disable-sdt.patch (89%)
 rename meta/recipes-devtools/gcc/{gcc-9.2 => gcc-9.3}/0014-libtool.patch (91%)
 rename meta/recipes-devtools/gcc/{gcc-9.2 => gcc-9.3}/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch (91%)
 rename meta/recipes-devtools/gcc/{gcc-9.2 => gcc-9.3}/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch (89%)
 rename meta/recipes-devtools/gcc/{gcc-9.2 => gcc-9.3}/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch (84%)
 rename meta/recipes-devtools/gcc/{gcc-9.2 => gcc-9.3}/0018-export-CPP.patch (95%)
 rename meta/recipes-devtools/gcc/{gcc-9.2 => gcc-9.3}/0019-Ensure-target-gcc-headers-can-be-included.patch (80%)
 rename meta/recipes-devtools/gcc/{gcc-9.2 => gcc-9.3}/0020-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch (92%)
 rename meta/recipes-devtools/gcc/{gcc-9.2 => gcc-9.3}/0021-Don-t-search-host-directory-during-relink-if-inst_pr.patch (87%)
 rename meta/recipes-devtools/gcc/{gcc-9.2 => gcc-9.3}/0022-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch (86%)
 rename meta/recipes-devtools/gcc/{gcc-9.2 => gcc-9.3}/0023-aarch64-Add-support-for-musl-ldso.patch (87%)
 rename meta/recipes-devtools/gcc/{gcc-9.2 => gcc-9.3}/0024-libcc1-fix-libcc1-s-install-path-and-rpath.patch (93%)
 rename meta/recipes-devtools/gcc/{gcc-9.2 => gcc-9.3}/0025-handle-sysroot-support-for-nativesdk-gcc.patch (55%)
 rename meta/recipes-devtools/gcc/{gcc-9.2 => gcc-9.3}/0026-Search-target-sysroot-gcc-version-specific-dirs-with.patch (90%)
 rename meta/recipes-devtools/gcc/{gcc-9.2 => gcc-9.3}/0027-Fix-various-_FOR_BUILD-and-related-variables.patch (94%)
 rename meta/recipes-devtools/gcc/{gcc-9.2 => gcc-9.3}/0028-nios2-Define-MUSL_DYNAMIC_LINKER.patch (84%)
 rename meta/recipes-devtools/gcc/{gcc-9.2 => gcc-9.3}/0029-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch (95%)
 rename meta/recipes-devtools/gcc/{gcc-9.2/0030-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch => gcc-9.3/0030-ldbl128-config.patch} (84%)
 rename meta/recipes-devtools/gcc/{gcc-9.2 => gcc-9.3}/0031-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch (86%)
 rename meta/recipes-devtools/gcc/{gcc-9.2 => gcc-9.3}/0032-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch (92%)
 rename meta/recipes-devtools/gcc/{gcc-9.2 => gcc-9.3}/0033-sync-gcc-stddef.h-with-musl.patch (95%)
 rename meta/recipes-devtools/gcc/{gcc-9.2 => gcc-9.3}/0034-fix-segmentation-fault-in-precompiled-header-generat.patch (93%)
 rename meta/recipes-devtools/gcc/{gcc-9.2 => gcc-9.3}/0035-Fix-for-testsuite-failure.patch (98%)
 rename meta/recipes-devtools/gcc/{gcc-9.2 => gcc-9.3}/0036-Re-introduce-spe-commandline-options.patch (88%)
 rename meta/recipes-devtools/gcc/{gcc-9.2/CVE-2019-14250.patch => gcc-9.3/0037-CVE-2019-14250-Check-zero-value-in-simple_object_elf.patch} (59%)
 rename meta/recipes-devtools/gcc/{gcc-9.2/gen-no-line-numbers.patch => gcc-9.3/0038-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch} (93%)
 rename meta/recipes-devtools/gcc/{gcc-9.2/re-PR-target-91102-aarch64-ICE-on-Linux-kernel-with-.patch => gcc-9.3/0039-process_alt_operands-Don-t-match-user-defined-regs-o.patch} (88%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_9.2.bb => gcc-cross-canadian_9.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_9.2.bb => gcc-cross_9.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_9.2.bb => gcc-crosssdk_9.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_9.2.bb => gcc-runtime_9.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_9.2.bb => gcc-sanitizers_9.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_9.2.bb => gcc-source_9.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc_9.2.bb => gcc_9.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_9.2.bb => libgcc-initial_9.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_9.2.bb => libgcc_9.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_9.2.bb => libgfortran_9.3.bb} (100%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 33f8044470..40e90f782b 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -194,7 +194,7 @@ RECIPE_MAINTAINER_pn-gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Khem Raj <r
 RECIPE_MAINTAINER_pn-gcc-crosssdk-${SDK_SYS} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-gcc-runtime = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-gcc-sanitizers = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER_pn-gcc-source-9.2.0 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER_pn-gcc-source-9.3.0 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-gconf = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-gcr = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-gdb = "Khem Raj <raj.khem@gmail.com>"
diff --git a/meta/recipes-devtools/gcc/gcc-9.2/0037-Fix-up-libsanitizer-build-with-master-glibc.patch b/meta/recipes-devtools/gcc/gcc-9.2/0037-Fix-up-libsanitizer-build-with-master-glibc.patch
deleted file mode 100644
index abe074c289..0000000000
--- a/meta/recipes-devtools/gcc/gcc-9.2/0037-Fix-up-libsanitizer-build-with-master-glibc.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 7ed24d12664319f34625a12fd8c0f729a0e71f5c Mon Sep 17 00:00:00 2001
-From: Auto Builder <ab@rdk>
-Date: Sun, 22 Dec 2019 02:58:24 +0000
-Subject: [PATCH] Fix up libsanitizer build with master glibc
-
-2019-11-26  Jakub Jelinek  <jakub@redhat.com>
-
-	PR sanitizer/92154
-	* sanitizer_common/sanitizer_platform_limits_posix.h: Cherry-pick
-	llvm-project revision 947f9692440836dcb8d88b74b69dd379d85974ce.
-	* sanitizer_common/sanitizer_platform_limits_posix.cpp: Likewise.
-
-Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=b02486e0951bc0ed38310a03be73e479fc6f3e7a;hp=3feeac76ffc38427de2d7d086e2928e63eee2d44]
-Signed-off-by: Auto Builder <ab@rdk>
----
- .../sanitizer_platform_limits_posix.cc            |  5 +++--
- .../sanitizer_platform_limits_posix.h             | 15 +--------------
- 2 files changed, 4 insertions(+), 16 deletions(-)
-
-diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc
-index 6cd4a5bac..d823a1219 100644
---- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc
-+++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc
-@@ -1156,8 +1156,9 @@ CHECK_SIZE_AND_OFFSET(ipc_perm, uid);
- CHECK_SIZE_AND_OFFSET(ipc_perm, gid);
- CHECK_SIZE_AND_OFFSET(ipc_perm, cuid);
- CHECK_SIZE_AND_OFFSET(ipc_perm, cgid);
--#if !defined(__aarch64__) || !SANITIZER_LINUX || __GLIBC_PREREQ (2, 21)
--/* On aarch64 glibc 2.20 and earlier provided incorrect mode field.  */
-+#if !SANITIZER_LINUX || __GLIBC_PREREQ (2, 31)
-+/* glibc 2.30 and earlier provided 16-bit mode field instead of 32-bit
-+   on many architectures.  */
- CHECK_SIZE_AND_OFFSET(ipc_perm, mode);
- #endif
- 
-diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
-index 73af92af1..6a673a7c9 100644
---- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
-+++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
-@@ -211,26 +211,13 @@ namespace __sanitizer {
-     u64 __unused1;
-     u64 __unused2;
- #elif defined(__sparc__)
--#if defined(__arch64__)
-     unsigned mode;
--    unsigned short __pad1;
--#else
--    unsigned short __pad1;
--    unsigned short mode;
-     unsigned short __pad2;
--#endif
-     unsigned short __seq;
-     unsigned long long __unused1;
-     unsigned long long __unused2;
--#elif defined(__mips__) || defined(__aarch64__) || defined(__s390x__)
--    unsigned int mode;
--    unsigned short __seq;
--    unsigned short __pad1;
--    unsigned long __unused1;
--    unsigned long __unused2;
- #else
--    unsigned short mode;
--    unsigned short __pad1;
-+    unsigned int mode;
-     unsigned short __seq;
-     unsigned short __pad2;
- #if defined(__x86_64__) && !defined(_LP64)
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/gcc/gcc-9.2/CVE-2019-15847_1.patch b/meta/recipes-devtools/gcc/gcc-9.2/CVE-2019-15847_1.patch
deleted file mode 100644
index 227fd47c95..0000000000
--- a/meta/recipes-devtools/gcc/gcc-9.2/CVE-2019-15847_1.patch
+++ /dev/null
@@ -1,521 +0,0 @@
-From 8c61566116d23063ff597271884f8e00d94ab1a1 Mon Sep 17 00:00:00 2001
-From: segher <segher@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Fri, 30 Aug 2019 13:48:48 +0000
-Subject: [PATCH] 	Backport from trunk 	2019-08-22  Segher Boessenkool
-  <segher@kernel.crashing.org>
-
-	* config/rs6000/altivec.md (unspec): Delete UNSPEC_DARN, UNSPEC_DARN_32,
-	UNSPEC_DARN_RAW, UNSPEC_CMPRB, UNSPEC_CMPRB2, UNSPEC_CMPEQB; move to...
-	* config/rs6000/rs6000.md (unspec): ... here.
-	* config/rs6000/altivec.md (darn_32, darn_raw, darn, cmprb,
-	*cmprb_internal, setb_signed, setb_unsigned, cmprb2, *cmprb2_internal,
-	cmpeqb, *cmpeqb_internal): Delete, move to...
-	* config/rs6000/rs6000.md (darn_32, darn_raw, darn, cmprb,
-	*cmprb_internal, setb_signed, setb_unsigned, cmprb2, *cmprb2_internal,
-	cmpeqb, *cmpeqb_internal): ... here.
-
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-9-branch@275170 138bc75d-0d04-0410-961f-82ee72b054a4
-
-Upstream-Status: Backport
-CVE: CVE-2019-15847 p1
-Affects <= 9.2.0
-Dropped Changelog changes
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- gcc/config/rs6000/altivec.md | 223 ----------------------------------
- gcc/config/rs6000/rs6000.md  | 224 +++++++++++++++++++++++++++++++++++
- 3 files changed, 239 insertions(+), 223 deletions(-)
-
-Index: gcc-9.2.0/gcc/config/rs6000/altivec.md
-===================================================================
---- gcc-9.2.0.orig/gcc/config/rs6000/altivec.md
-+++ gcc-9.2.0/gcc/config/rs6000/altivec.md
-@@ -80,9 +80,6 @@
-    UNSPEC_VUPKHPX
-    UNSPEC_VUPKLPX
-    UNSPEC_CONVERT_4F32_8I16
--   UNSPEC_DARN
--   UNSPEC_DARN_32
--   UNSPEC_DARN_RAW
-    UNSPEC_DST
-    UNSPEC_DSTT
-    UNSPEC_DSTST
-@@ -161,9 +158,6 @@
-    UNSPEC_BCDADD
-    UNSPEC_BCDSUB
-    UNSPEC_BCD_OVERFLOW
--   UNSPEC_CMPRB
--   UNSPEC_CMPRB2
--   UNSPEC_CMPEQB
-    UNSPEC_VRLMI
-    UNSPEC_VRLNM
- ])
-@@ -4101,223 +4095,6 @@
-   "bcd<bcd_add_sub>. %0,%1,%2,%3"
-   [(set_attr "type" "vecsimple")])
- 
--(define_insn "darn_32"
--  [(set (match_operand:SI 0 "register_operand" "=r")
--        (unspec:SI [(const_int 0)] UNSPEC_DARN_32))]
--  "TARGET_P9_MISC"
--  "darn %0,0"
--  [(set_attr "type" "integer")])
--
--(define_insn "darn_raw"
--  [(set (match_operand:DI 0 "register_operand" "=r")
--        (unspec:DI [(const_int 0)] UNSPEC_DARN_RAW))]
--  "TARGET_P9_MISC && TARGET_64BIT"
--  "darn %0,2"
--  [(set_attr "type" "integer")])
--
--(define_insn "darn"
--  [(set (match_operand:DI 0 "register_operand" "=r")
--        (unspec:DI [(const_int 0)] UNSPEC_DARN))]
--  "TARGET_P9_MISC && TARGET_64BIT"
--  "darn %0,1"
--  [(set_attr "type" "integer")])
--
--;; Test byte within range.
--;;
--;; The bytes of operand 1 are organized as xx:xx:xx:vv, where xx
--;; represents a byte whose value is ignored in this context and
--;; vv, the least significant byte, holds the byte value that is to
--;; be tested for membership within the range specified by operand 2.
--;; The bytes of operand 2 are organized as xx:xx:hi:lo.
--;;
--;; Return in target register operand 0 a value of 1 if lo <= vv and
--;; vv <= hi.  Otherwise, set register operand 0 to 0.
--;;
--;; Though the instructions to which this expansion maps operate on
--;; 64-bit registers, the current implementation only operates on
--;; SI-mode operands as the high-order bits provide no information
--;; that is not already available in the low-order bits.  To avoid the
--;; costs of data widening operations, future enhancements might allow
--;; DI mode for operand 0 and/or might allow operand 1 to be QI mode.
--(define_expand "cmprb"
--  [(set (match_dup 3)
--	(unspec:CC [(match_operand:SI 1 "gpc_reg_operand" "r")
--		    (match_operand:SI 2 "gpc_reg_operand" "r")]
--	 UNSPEC_CMPRB))
--   (set (match_operand:SI 0 "gpc_reg_operand" "=r")
--	(if_then_else:SI (lt (match_dup 3)
--			     (const_int 0))
--			 (const_int -1)
--			 (if_then_else (gt (match_dup 3)
--					   (const_int 0))
--				       (const_int 1)
--				       (const_int 0))))]
--  "TARGET_P9_MISC"
--{
--  operands[3] = gen_reg_rtx (CCmode);
--})
--
--;; The bytes of operand 1 are organized as xx:xx:xx:vv, where xx
--;; represents a byte whose value is ignored in this context and
--;; vv, the least significant byte, holds the byte value that is to
--;; be tested for membership within the range specified by operand 2.
--;; The bytes of operand 2 are organized as xx:xx:hi:lo.
--;;
--;; Set bit 1 (the GT bit, 0x4) of CR register operand 0 to 1 if
--;; lo <= vv and vv <= hi.  Otherwise, set the GT bit to 0.  The other
--;; 3 bits of the target CR register are all set to 0.
--(define_insn "*cmprb_internal"
--  [(set (match_operand:CC 0 "cc_reg_operand" "=y")
--	(unspec:CC [(match_operand:SI 1 "gpc_reg_operand" "r")
--		    (match_operand:SI 2 "gpc_reg_operand" "r")]
--	 UNSPEC_CMPRB))]
--  "TARGET_P9_MISC"
--  "cmprb %0,0,%1,%2"
--  [(set_attr "type" "logical")])
--
--;; Set operand 0 register to -1 if the LT bit (0x8) of condition
--;; register operand 1 is on.  Otherwise, set operand 0 register to 1
--;; if the GT bit (0x4) of condition register operand 1 is on.
--;; Otherwise, set operand 0 to 0.  Note that the result stored into
--;; register operand 0 is non-zero iff either the LT or GT bits are on
--;; within condition register operand 1.
--(define_insn "setb_signed"
--   [(set (match_operand:SI 0 "gpc_reg_operand" "=r")
--	 (if_then_else:SI (lt (match_operand:CC 1 "cc_reg_operand" "y")
--			      (const_int 0))
--			  (const_int -1)
--			  (if_then_else (gt (match_dup 1)
--					    (const_int 0))
--					(const_int 1)
--					(const_int 0))))]
--  "TARGET_P9_MISC"
--  "setb %0,%1"
--  [(set_attr "type" "logical")])
--
--(define_insn "setb_unsigned"
--   [(set (match_operand:SI 0 "gpc_reg_operand" "=r")
--	 (if_then_else:SI (ltu (match_operand:CCUNS 1 "cc_reg_operand" "y")
--			      (const_int 0))
--			  (const_int -1)
--			  (if_then_else (gtu (match_dup 1)
--					    (const_int 0))
--					(const_int 1)
--					(const_int 0))))]
--  "TARGET_P9_MISC"
--  "setb %0,%1"
--  [(set_attr "type" "logical")])
--
--;; Test byte within two ranges.
--;;
--;; The bytes of operand 1 are organized as xx:xx:xx:vv, where xx
--;; represents a byte whose value is ignored in this context and
--;; vv, the least significant byte, holds the byte value that is to
--;; be tested for membership within the range specified by operand 2.
--;; The bytes of operand 2 are organized as hi_1:lo_1:hi_2:lo_2.
--;;
--;; Return in target register operand 0 a value of 1 if (lo_1 <= vv and
--;; vv <= hi_1) or if (lo_2 <= vv and vv <= hi_2).  Otherwise, set register
--;; operand 0 to 0.
--;;
--;; Though the instructions to which this expansion maps operate on
--;; 64-bit registers, the current implementation only operates on
--;; SI-mode operands as the high-order bits provide no information
--;; that is not already available in the low-order bits.  To avoid the
--;; costs of data widening operations, future enhancements might allow
--;; DI mode for operand 0 and/or might allow operand 1 to be QI mode.
--(define_expand "cmprb2"
--  [(set (match_dup 3)
--	(unspec:CC [(match_operand:SI 1 "gpc_reg_operand" "r")
--		    (match_operand:SI 2 "gpc_reg_operand" "r")]
--	 UNSPEC_CMPRB2))
--   (set (match_operand:SI 0 "gpc_reg_operand" "=r")
--	(if_then_else:SI (lt (match_dup 3)
--			     (const_int 0))
--			 (const_int -1)
--			 (if_then_else (gt (match_dup 3)
--					   (const_int 0))
--				       (const_int 1)
--				       (const_int 0))))]
--  "TARGET_P9_MISC"
--{
--  operands[3] = gen_reg_rtx (CCmode);
--})
--
--;; The bytes of operand 1 are organized as xx:xx:xx:vv, where xx
--;; represents a byte whose value is ignored in this context and
--;; vv, the least significant byte, holds the byte value that is to
--;; be tested for membership within the ranges specified by operand 2.
--;; The bytes of operand 2 are organized as hi_1:lo_1:hi_2:lo_2.
--;;
--;; Set bit 1 (the GT bit, 0x4) of CR register operand 0 to 1 if
--;; (lo_1 <= vv and vv <= hi_1) or if (lo_2 <= vv and vv <= hi_2).
--;; Otherwise, set the GT bit to 0.  The other 3 bits of the target
--;; CR register are all set to 0.
--(define_insn "*cmprb2_internal"
--  [(set (match_operand:CC 0 "cc_reg_operand" "=y")
--	(unspec:CC [(match_operand:SI 1 "gpc_reg_operand" "r")
--		    (match_operand:SI 2 "gpc_reg_operand" "r")]
--	 UNSPEC_CMPRB2))]
--  "TARGET_P9_MISC"
--  "cmprb %0,1,%1,%2"
--  [(set_attr "type" "logical")])
--
--;; Test byte membership within set of 8 bytes.
--;;
--;; The bytes of operand 1 are organized as xx:xx:xx:vv, where xx
--;; represents a byte whose value is ignored in this context and
--;; vv, the least significant byte, holds the byte value that is to
--;; be tested for membership within the set specified by operand 2.
--;; The bytes of operand 2 are organized as e0:e1:e2:e3:e4:e5:e6:e7.
--;;
--;; Return in target register operand 0 a value of 1 if vv equals one
--;; of the values e0, e1, e2, e3, e4, e5, e6, or e7.  Otherwise, set
--;; register operand 0 to 0.  Note that the 8 byte values held within
--;; operand 2 need not be unique.
--;;
--;; Though the instructions to which this expansion maps operate on
--;; 64-bit registers, the current implementation requires that operands
--;; 0 and 1 have mode SI as the high-order bits provide no information
--;; that is not already available in the low-order bits.  To avoid the
--;; costs of data widening operations, future enhancements might allow
--;; DI mode for operand 0 and/or might allow operand 1 to be QI mode.
--(define_expand "cmpeqb"
--  [(set (match_dup 3)
--	(unspec:CC [(match_operand:SI 1 "gpc_reg_operand" "r")
--		    (match_operand:DI 2 "gpc_reg_operand" "r")]
--	 UNSPEC_CMPEQB))
--   (set (match_operand:SI 0 "gpc_reg_operand" "=r")
--	(if_then_else:SI (lt (match_dup 3)
--			     (const_int 0))
--			 (const_int -1)
--			 (if_then_else (gt (match_dup 3)
--					   (const_int 0))
--				       (const_int 1)
--				       (const_int 0))))]
--  "TARGET_P9_MISC && TARGET_64BIT"
--{
--  operands[3] = gen_reg_rtx (CCmode);
--})
--
--;; The bytes of operand 1 are organized as xx:xx:xx:vv, where xx
--;; represents a byte whose value is ignored in this context and
--;; vv, the least significant byte, holds the byte value that is to
--;; be tested for membership within the set specified by operand 2.
--;; The bytes of operand 2 are organized as e0:e1:e2:e3:e4:e5:e6:e7.
--;;
--;; Set bit 1 (the GT bit, 0x4) of CR register operand 0 to 1 if vv
--;; equals one of the values e0, e1, e2, e3, e4, e5, e6, or e7.  Otherwise,
--;; set the GT bit to zero.  The other 3 bits of the target CR register
--;; are all set to 0.
--(define_insn "*cmpeqb_internal"
--  [(set (match_operand:CC 0 "cc_reg_operand" "=y")
--	 (unspec:CC [(match_operand:SI 1 "gpc_reg_operand" "r")
--		     (match_operand:DI 2 "gpc_reg_operand" "r")]
--	  UNSPEC_CMPEQB))]
--  "TARGET_P9_MISC && TARGET_64BIT"
--  "cmpeqb %0,%1,%2"
--  [(set_attr "type" "logical")])
--
- (define_expand "bcd<bcd_add_sub>_<code>"
-   [(parallel [(set (reg:CCFP CR6_REGNO)
- 		   (compare:CCFP
-Index: gcc-9.2.0/gcc/config/rs6000/rs6000.md
-===================================================================
---- gcc-9.2.0.orig/gcc/config/rs6000/rs6000.md
-+++ gcc-9.2.0/gcc/config/rs6000/rs6000.md
-@@ -137,6 +137,12 @@
-    UNSPEC_LSQ
-    UNSPEC_FUSION_GPR
-    UNSPEC_STACK_CHECK
-+   UNSPEC_DARN
-+   UNSPEC_DARN_32
-+   UNSPEC_DARN_RAW
-+   UNSPEC_CMPRB
-+   UNSPEC_CMPRB2
-+   UNSPEC_CMPEQB
-    UNSPEC_ADD_ROUND_TO_ODD
-    UNSPEC_SUB_ROUND_TO_ODD
-    UNSPEC_MUL_ROUND_TO_ODD
-@@ -14322,7 +14328,225 @@
-    "xscmpuqp %0,%1,%2"
-   [(set_attr "type" "veccmp")
-    (set_attr "size" "128")])
-+
-+;; Miscellaneous ISA 3.0 (power9) instructions
-+
-+(define_insn "darn_32"
-+  [(set (match_operand:SI 0 "register_operand" "=r")
-+        (unspec:SI [(const_int 0)] UNSPEC_DARN_32))]
-+  "TARGET_P9_MISC"
-+  "darn %0,0"
-+  [(set_attr "type" "integer")])
-+
-+(define_insn "darn_raw"
-+  [(set (match_operand:DI 0 "register_operand" "=r")
-+        (unspec:DI [(const_int 0)] UNSPEC_DARN_RAW))]
-+  "TARGET_P9_MISC && TARGET_64BIT"
-+  "darn %0,2"
-+  [(set_attr "type" "integer")])
-+
-+(define_insn "darn"
-+  [(set (match_operand:DI 0 "register_operand" "=r")
-+        (unspec:DI [(const_int 0)] UNSPEC_DARN))]
-+  "TARGET_P9_MISC && TARGET_64BIT"
-+  "darn %0,1"
-+  [(set_attr "type" "integer")])
-+
-+;; Test byte within range.
-+;;
-+;; The bytes of operand 1 are organized as xx:xx:xx:vv, where xx
-+;; represents a byte whose value is ignored in this context and
-+;; vv, the least significant byte, holds the byte value that is to
-+;; be tested for membership within the range specified by operand 2.
-+;; The bytes of operand 2 are organized as xx:xx:hi:lo.
-+;;
-+;; Return in target register operand 0 a value of 1 if lo <= vv and
-+;; vv <= hi.  Otherwise, set register operand 0 to 0.
-+;;
-+;; Though the instructions to which this expansion maps operate on
-+;; 64-bit registers, the current implementation only operates on
-+;; SI-mode operands as the high-order bits provide no information
-+;; that is not already available in the low-order bits.  To avoid the
-+;; costs of data widening operations, future enhancements might allow
-+;; DI mode for operand 0 and/or might allow operand 1 to be QI mode.
-+(define_expand "cmprb"
-+  [(set (match_dup 3)
-+	(unspec:CC [(match_operand:SI 1 "gpc_reg_operand" "r")
-+		    (match_operand:SI 2 "gpc_reg_operand" "r")]
-+	 UNSPEC_CMPRB))
-+   (set (match_operand:SI 0 "gpc_reg_operand" "=r")
-+	(if_then_else:SI (lt (match_dup 3)
-+			     (const_int 0))
-+			 (const_int -1)
-+			 (if_then_else (gt (match_dup 3)
-+					   (const_int 0))
-+				       (const_int 1)
-+				       (const_int 0))))]
-+  "TARGET_P9_MISC"
-+{
-+  operands[3] = gen_reg_rtx (CCmode);
-+})
-+
-+;; The bytes of operand 1 are organized as xx:xx:xx:vv, where xx
-+;; represents a byte whose value is ignored in this context and
-+;; vv, the least significant byte, holds the byte value that is to
-+;; be tested for membership within the range specified by operand 2.
-+;; The bytes of operand 2 are organized as xx:xx:hi:lo.
-+;;
-+;; Set bit 1 (the GT bit, 0x4) of CR register operand 0 to 1 if
-+;; lo <= vv and vv <= hi.  Otherwise, set the GT bit to 0.  The other
-+;; 3 bits of the target CR register are all set to 0.
-+(define_insn "*cmprb_internal"
-+  [(set (match_operand:CC 0 "cc_reg_operand" "=y")
-+	(unspec:CC [(match_operand:SI 1 "gpc_reg_operand" "r")
-+		    (match_operand:SI 2 "gpc_reg_operand" "r")]
-+	 UNSPEC_CMPRB))]
-+  "TARGET_P9_MISC"
-+  "cmprb %0,0,%1,%2"
-+  [(set_attr "type" "logical")])
-+
-+;; Set operand 0 register to -1 if the LT bit (0x8) of condition
-+;; register operand 1 is on.  Otherwise, set operand 0 register to 1
-+;; if the GT bit (0x4) of condition register operand 1 is on.
-+;; Otherwise, set operand 0 to 0.  Note that the result stored into
-+;; register operand 0 is non-zero iff either the LT or GT bits are on
-+;; within condition register operand 1.
-+(define_insn "setb_signed"
-+   [(set (match_operand:SI 0 "gpc_reg_operand" "=r")
-+	 (if_then_else:SI (lt (match_operand:CC 1 "cc_reg_operand" "y")
-+			      (const_int 0))
-+			  (const_int -1)
-+			  (if_then_else (gt (match_dup 1)
-+					    (const_int 0))
-+					(const_int 1)
-+					(const_int 0))))]
-+  "TARGET_P9_MISC"
-+  "setb %0,%1"
-+  [(set_attr "type" "logical")])
- 
-+(define_insn "setb_unsigned"
-+   [(set (match_operand:SI 0 "gpc_reg_operand" "=r")
-+	 (if_then_else:SI (ltu (match_operand:CCUNS 1 "cc_reg_operand" "y")
-+			      (const_int 0))
-+			  (const_int -1)
-+			  (if_then_else (gtu (match_dup 1)
-+					    (const_int 0))
-+					(const_int 1)
-+					(const_int 0))))]
-+  "TARGET_P9_MISC"
-+  "setb %0,%1"
-+  [(set_attr "type" "logical")])
-+
-+;; Test byte within two ranges.
-+;;
-+;; The bytes of operand 1 are organized as xx:xx:xx:vv, where xx
-+;; represents a byte whose value is ignored in this context and
-+;; vv, the least significant byte, holds the byte value that is to
-+;; be tested for membership within the range specified by operand 2.
-+;; The bytes of operand 2 are organized as hi_1:lo_1:hi_2:lo_2.
-+;;
-+;; Return in target register operand 0 a value of 1 if (lo_1 <= vv and
-+;; vv <= hi_1) or if (lo_2 <= vv and vv <= hi_2).  Otherwise, set register
-+;; operand 0 to 0.
-+;;
-+;; Though the instructions to which this expansion maps operate on
-+;; 64-bit registers, the current implementation only operates on
-+;; SI-mode operands as the high-order bits provide no information
-+;; that is not already available in the low-order bits.  To avoid the
-+;; costs of data widening operations, future enhancements might allow
-+;; DI mode for operand 0 and/or might allow operand 1 to be QI mode.
-+(define_expand "cmprb2"
-+  [(set (match_dup 3)
-+	(unspec:CC [(match_operand:SI 1 "gpc_reg_operand" "r")
-+		    (match_operand:SI 2 "gpc_reg_operand" "r")]
-+	 UNSPEC_CMPRB2))
-+   (set (match_operand:SI 0 "gpc_reg_operand" "=r")
-+	(if_then_else:SI (lt (match_dup 3)
-+			     (const_int 0))
-+			 (const_int -1)
-+			 (if_then_else (gt (match_dup 3)
-+					   (const_int 0))
-+				       (const_int 1)
-+				       (const_int 0))))]
-+  "TARGET_P9_MISC"
-+{
-+  operands[3] = gen_reg_rtx (CCmode);
-+})
-+
-+;; The bytes of operand 1 are organized as xx:xx:xx:vv, where xx
-+;; represents a byte whose value is ignored in this context and
-+;; vv, the least significant byte, holds the byte value that is to
-+;; be tested for membership within the ranges specified by operand 2.
-+;; The bytes of operand 2 are organized as hi_1:lo_1:hi_2:lo_2.
-+;;
-+;; Set bit 1 (the GT bit, 0x4) of CR register operand 0 to 1 if
-+;; (lo_1 <= vv and vv <= hi_1) or if (lo_2 <= vv and vv <= hi_2).
-+;; Otherwise, set the GT bit to 0.  The other 3 bits of the target
-+;; CR register are all set to 0.
-+(define_insn "*cmprb2_internal"
-+  [(set (match_operand:CC 0 "cc_reg_operand" "=y")
-+	(unspec:CC [(match_operand:SI 1 "gpc_reg_operand" "r")
-+		    (match_operand:SI 2 "gpc_reg_operand" "r")]
-+	 UNSPEC_CMPRB2))]
-+  "TARGET_P9_MISC"
-+  "cmprb %0,1,%1,%2"
-+  [(set_attr "type" "logical")])
-+
-+;; Test byte membership within set of 8 bytes.
-+;;
-+;; The bytes of operand 1 are organized as xx:xx:xx:vv, where xx
-+;; represents a byte whose value is ignored in this context and
-+;; vv, the least significant byte, holds the byte value that is to
-+;; be tested for membership within the set specified by operand 2.
-+;; The bytes of operand 2 are organized as e0:e1:e2:e3:e4:e5:e6:e7.
-+;;
-+;; Return in target register operand 0 a value of 1 if vv equals one
-+;; of the values e0, e1, e2, e3, e4, e5, e6, or e7.  Otherwise, set
-+;; register operand 0 to 0.  Note that the 8 byte values held within
-+;; operand 2 need not be unique.
-+;;
-+;; Though the instructions to which this expansion maps operate on
-+;; 64-bit registers, the current implementation requires that operands
-+;; 0 and 1 have mode SI as the high-order bits provide no information
-+;; that is not already available in the low-order bits.  To avoid the
-+;; costs of data widening operations, future enhancements might allow
-+;; DI mode for operand 0 and/or might allow operand 1 to be QI mode.
-+(define_expand "cmpeqb"
-+  [(set (match_dup 3)
-+	(unspec:CC [(match_operand:SI 1 "gpc_reg_operand" "r")
-+		    (match_operand:DI 2 "gpc_reg_operand" "r")]
-+	 UNSPEC_CMPEQB))
-+   (set (match_operand:SI 0 "gpc_reg_operand" "=r")
-+	(if_then_else:SI (lt (match_dup 3)
-+			     (const_int 0))
-+			 (const_int -1)
-+			 (if_then_else (gt (match_dup 3)
-+					   (const_int 0))
-+				       (const_int 1)
-+				       (const_int 0))))]
-+  "TARGET_P9_MISC && TARGET_64BIT"
-+{
-+  operands[3] = gen_reg_rtx (CCmode);
-+})
-+
-+;; The bytes of operand 1 are organized as xx:xx:xx:vv, where xx
-+;; represents a byte whose value is ignored in this context and
-+;; vv, the least significant byte, holds the byte value that is to
-+;; be tested for membership within the set specified by operand 2.
-+;; The bytes of operand 2 are organized as e0:e1:e2:e3:e4:e5:e6:e7.
-+;;
-+;; Set bit 1 (the GT bit, 0x4) of CR register operand 0 to 1 if vv
-+;; equals one of the values e0, e1, e2, e3, e4, e5, e6, or e7.  Otherwise,
-+;; set the GT bit to zero.  The other 3 bits of the target CR register
-+;; are all set to 0.
-+(define_insn "*cmpeqb_internal"
-+  [(set (match_operand:CC 0 "cc_reg_operand" "=y")
-+	 (unspec:CC [(match_operand:SI 1 "gpc_reg_operand" "r")
-+		     (match_operand:DI 2 "gpc_reg_operand" "r")]
-+	  UNSPEC_CMPEQB))]
-+  "TARGET_P9_MISC && TARGET_64BIT"
-+  "cmpeqb %0,%1,%2"
-+  [(set_attr "type" "logical")])
- 
- 
- (include "sync.md")
diff --git a/meta/recipes-devtools/gcc/gcc-9.2/CVE-2019-15847_2.patch b/meta/recipes-devtools/gcc/gcc-9.2/CVE-2019-15847_2.patch
deleted file mode 100644
index de7a83c23f..0000000000
--- a/meta/recipes-devtools/gcc/gcc-9.2/CVE-2019-15847_2.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From 87bc784a7ca3a43182f7272241597a50d7491342 Mon Sep 17 00:00:00 2001
-From: segher <segher@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Fri, 30 Aug 2019 13:51:26 +0000
-Subject: [PATCH] 	Backport from trunk 	2019-08-22  Segher Boessenkool
-  <segher@kernel.crashing.org>
-
-	PR target/91481
-	* config/rs6000/rs6000.md (unspec): Delete UNSPEC_DARN, UNSPEC_DARN_32,
-	and UNSPEC_DARN_RAW.
-	(unspecv): New enumerator values UNSPECV_DARN, UNSPECV_DARN_32, and
-	UNSPECV_DARN_RAW.
-	(darn_32): Use an unspec_volatile, and UNSPECV_DARN_32.
-	(darn_raw): Use an unspec_volatile, and UNSPECV_DARN_RAW.
-	(darn): Use an unspec_volatile, and UNSPECV_DARN.
-
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-9-branch@275175 138bc75d-0d04-0410-961f-82ee72b054a4
-
-Upstream-Status: Backport
-CVE: CVE-2019-15847 p2
-Affects <= 9.2.0
-Dropped Changelog changes
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- gcc/config/rs6000/rs6000.md | 12 ++++++------
- 2 files changed, 20 insertions(+), 6 deletions(-)
-
-Index: gcc-9.2.0/gcc/config/rs6000/rs6000.md
-===================================================================
---- gcc-9.2.0.orig/gcc/config/rs6000/rs6000.md
-+++ gcc-9.2.0/gcc/config/rs6000/rs6000.md
-@@ -137,9 +137,6 @@
-    UNSPEC_LSQ
-    UNSPEC_FUSION_GPR
-    UNSPEC_STACK_CHECK
--   UNSPEC_DARN
--   UNSPEC_DARN_32
--   UNSPEC_DARN_RAW
-    UNSPEC_CMPRB
-    UNSPEC_CMPRB2
-    UNSPEC_CMPEQB
-@@ -170,6 +167,9 @@
-    UNSPECV_EH_RR		; eh_reg_restore
-    UNSPECV_ISYNC		; isync instruction
-    UNSPECV_MFTB			; move from time base
-+   UNSPECV_DARN			; darn 1 (deliver a random number)
-+   UNSPECV_DARN_32		; darn 2
-+   UNSPECV_DARN_RAW		; darn 0
-    UNSPECV_NLGR			; non-local goto receiver
-    UNSPECV_MFFS			; Move from FPSCR
-    UNSPECV_MFFSL		; Move from FPSCR light instruction version
-@@ -14333,21 +14333,21 @@
- 
- (define_insn "darn_32"
-   [(set (match_operand:SI 0 "register_operand" "=r")
--        (unspec:SI [(const_int 0)] UNSPEC_DARN_32))]
-+        (unspec_volatile:SI [(const_int 0)] UNSPECV_DARN_32))]
-   "TARGET_P9_MISC"
-   "darn %0,0"
-   [(set_attr "type" "integer")])
- 
- (define_insn "darn_raw"
-   [(set (match_operand:DI 0 "register_operand" "=r")
--        (unspec:DI [(const_int 0)] UNSPEC_DARN_RAW))]
-+        (unspec_volatile:DI [(const_int 0)] UNSPECV_DARN_RAW))]
-   "TARGET_P9_MISC && TARGET_64BIT"
-   "darn %0,2"
-   [(set_attr "type" "integer")])
- 
- (define_insn "darn"
-   [(set (match_operand:DI 0 "register_operand" "=r")
--        (unspec:DI [(const_int 0)] UNSPEC_DARN))]
-+        (unspec_volatile:DI [(const_int 0)] UNSPECV_DARN))]
-   "TARGET_P9_MISC && TARGET_64BIT"
-   "darn %0,1"
-   [(set_attr "type" "integer")])
diff --git a/meta/recipes-devtools/gcc/gcc-9.2/CVE-2019-15847_3.patch b/meta/recipes-devtools/gcc/gcc-9.2/CVE-2019-15847_3.patch
deleted file mode 100644
index ba7130ca7d..0000000000
--- a/meta/recipes-devtools/gcc/gcc-9.2/CVE-2019-15847_3.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From dc4c8dd9dbe70740ec7a684b0f35620249fb036a Mon Sep 17 00:00:00 2001
-From: segher <segher@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Fri, 30 Aug 2019 13:53:11 +0000
-Subject: [PATCH] 	Backport from trunk 	2019-08-23  Segher Boessenkool
-  <segher@kernel.crashing.org>
-
-gcc/testsuite/
-	PR target/91481
-	* gcc.target/powerpc/darn-3.c: New testcase.
-
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-9-branch@275176 138bc75d-0d04-0410-961f-82ee72b054a4
-
-Upstream-Status: Backport
-CVE: CVE-2019-15847 p3
-Affects <= 9.2.0
-Dropped Changelog changes
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- gcc/testsuite/ChangeLog                   |  6 ++++++
- gcc/testsuite/gcc.target/powerpc/darn-3.c | 16 ++++++++++++++++
- 2 files changed, 22 insertions(+)
- create mode 100644 gcc/testsuite/gcc.target/powerpc/darn-3.c
-
-Index: gcc-9.2.0/gcc/testsuite/gcc.target/powerpc/darn-3.c
-===================================================================
---- /dev/null
-+++ gcc-9.2.0/gcc/testsuite/gcc.target/powerpc/darn-3.c
-@@ -0,0 +1,16 @@
-+/* { dg-do compile { target { powerpc*-*-* } } } */
-+/* { dg-skip-if "" { powerpc*-*-aix* } } */
-+/* { dg-options "-O2 -mdejagnu-cpu=power9" } */
-+
-+static int darn32(void) { return __builtin_darn_32(); }
-+
-+int four(void)
-+{
-+	int sum = 0;
-+	int i;
-+	for (i = 0; i < 4; i++)
-+		sum += darn32();
-+	return sum;
-+}
-+
-+/* { dg-final { scan-assembler-times {(?n)\mdarn .*,0\M} 4 } } */
-Index: gcc-9.2.0/gcc/testsuite/ChangeLog
-===================================================================
---- gcc-9.2.0.orig/gcc/testsuite/ChangeLog
-+++ gcc-9.2.0/gcc/testsuite/ChangeLog
-@@ -1,3 +1,11 @@
-+2019-08-30  Segher Boessenkool  <segher@kernel.crashing.org>
-+
-+	Backport from trunk
-+	2019-08-23  Segher Boessenkool  <segher@kernel.crashing.org>
-+
-+	PR target/91481
-+	* gcc.target/powerpc/darn-3.c: New testcase.
-+
- 2019-08-12  Release Manager
- 
- 	* GCC 9.2.0 released.
diff --git a/meta/recipes-devtools/gcc/gcc-9.2.inc b/meta/recipes-devtools/gcc/gcc-9.3.inc
similarity index 87%
rename from meta/recipes-devtools/gcc/gcc-9.2.inc
rename to meta/recipes-devtools/gcc/gcc-9.3.inc
index 2368f35867..b0411078d3 100644
--- a/meta/recipes-devtools/gcc/gcc-9.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-9.3.inc
@@ -2,13 +2,13 @@ require gcc-common.inc
 
 # Third digit in PV should be incremented after a minor release
 
-PV = "9.2.0"
+PV = "9.3.0"
 
 # BINV should be incremented to a revision after a minor gcc release
 
-BINV = "9.2.0"
+BINV = "9.3.0"
 
-FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-9.2:${FILE_DIRNAME}/gcc-9.2/backport:"
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-9.3:${FILE_DIRNAME}/gcc-9.3/backport:"
 
 DEPENDS =+ "mpfr gmp libmpc zlib flex-native"
 NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native flex-native"
@@ -57,25 +57,19 @@ SRC_URI = "\
            file://0027-Fix-various-_FOR_BUILD-and-related-variables.patch \
            file://0028-nios2-Define-MUSL_DYNAMIC_LINKER.patch \
            file://0029-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch \
-           file://0030-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch \
+           file://0030-ldbl128-config.patch \
            file://0031-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch \
            file://0032-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch \
            file://0033-sync-gcc-stddef.h-with-musl.patch \
            file://0034-fix-segmentation-fault-in-precompiled-header-generat.patch \
            file://0035-Fix-for-testsuite-failure.patch \
            file://0036-Re-introduce-spe-commandline-options.patch \
-           file://0037-Fix-up-libsanitizer-build-with-master-glibc.patch \
-           file://CVE-2019-14250.patch \
-	   file://CVE-2019-15847_1.patch \
-	   file://CVE-2019-15847_2.patch \
-	   file://CVE-2019-15847_3.patch \
-           file://re-PR-target-91102-aarch64-ICE-on-Linux-kernel-with-.patch \
-           file://gen-no-line-numbers.patch \
+           file://0037-CVE-2019-14250-Check-zero-value-in-simple_object_elf.patch \
+           file://0038-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch \
+           file://0039-process_alt_operands-Don-t-match-user-defined-regs-o.patch \
 "
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
-SRC_URI[md5sum] = "3818ad8600447f05349098232c2ddc78"
-SRC_URI[sha256sum] = "ea6ef08f121239da5695f76c9b33637a118dcf63e24164422231917fa61fb206"
-
+SRC_URI[sha256sum] = "71e197867611f6054aa1119b13a0c0abac12834765fe2d81f35ac57f84f742d1"
 # For dev release snapshotting
 #S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/official-gcc-${RELEASE}"
 #B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
diff --git a/meta/recipes-devtools/gcc/gcc-9.2/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc-9.3/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
similarity index 89%
rename from meta/recipes-devtools/gcc/gcc-9.2/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
rename to meta/recipes-devtools/gcc/gcc-9.3/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
index 9065c304b5..0d9222df17 100644
--- a/meta/recipes-devtools/gcc/gcc-9.2/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.3/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
@@ -1,7 +1,7 @@
-From 863325ec3c6eb4987be63509ac407b2d13617342 Mon Sep 17 00:00:00 2001
+From 02b1789dbbb184726782b5038a4dd96515ec790c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 08:37:11 +0400
-Subject: [PATCH 01/36] gcc-4.3.1: ARCH_FLAGS_FOR_TARGET
+Subject: [PATCH 01/39] gcc-4.3.1: ARCH_FLAGS_FOR_TARGET
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
@@ -38,5 +38,5 @@ index 9db4fd14aa2..aad93c4d183 100644
   *" newlib "*)
    case " $target_configargs " in
 -- 
-2.22.1
+2.25.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.2/0002-gcc-poison-system-directories.patch b/meta/recipes-devtools/gcc/gcc-9.3/0002-gcc-poison-system-directories.patch
similarity index 92%
rename from meta/recipes-devtools/gcc/gcc-9.2/0002-gcc-poison-system-directories.patch
rename to meta/recipes-devtools/gcc/gcc-9.3/0002-gcc-poison-system-directories.patch
index a1116e7509..f427ee67c1 100644
--- a/meta/recipes-devtools/gcc/gcc-9.2/0002-gcc-poison-system-directories.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.3/0002-gcc-poison-system-directories.patch
@@ -1,7 +1,7 @@
-From 68e78bc15de215fa15c7d8b56bd2e2b0539b34fa Mon Sep 17 00:00:00 2001
+From 5368cd0293ce50a69ced6e4b25ba6c8d8e014256 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 08:59:00 +0400
-Subject: [PATCH 02/36] gcc: poison-system-directories
+Subject: [PATCH 02/39] gcc: poison-system-directories
 
 Add /sw/include and /opt/include based on the original
 zecke-no-host-includes.patch patch.  The original patch checked for
@@ -58,10 +58,10 @@ index a718ceaf3da..5713342efb1 100644
     optimizer and back end) to be checked for dynamic type safety at runtime.
     This is quite expensive. */
 diff --git a/gcc/configure b/gcc/configure
-index 481071b4265..a6ea3a8a84c 100755
+index a065ba23728..2e26dd33310 100755
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -995,6 +995,7 @@ with_system_zlib
+@@ -996,6 +996,7 @@ with_system_zlib
  enable_maintainer_mode
  enable_link_mutex
  enable_version_specific_runtime_libs
@@ -69,7 +69,7 @@ index 481071b4265..a6ea3a8a84c 100755
  enable_plugin
  enable_host_shared
  enable_libquadmath_support
-@@ -1748,6 +1749,8 @@ Optional Features:
+@@ -1749,6 +1750,8 @@ Optional Features:
    --enable-version-specific-runtime-libs
                            specify that runtime libraries should be installed
                            in a compiler-specific directory
@@ -78,7 +78,7 @@ index 481071b4265..a6ea3a8a84c 100755
    --enable-plugin         enable plugin support
    --enable-host-shared    build host code as shared libraries
    --disable-libquadmath-support
-@@ -29750,6 +29753,19 @@ if test "${enable_version_specific_runtime_libs+set}" = set; then :
+@@ -29753,6 +29756,19 @@ if test "${enable_version_specific_runtime_libs+set}" = set; then :
  fi
  
  
@@ -99,10 +99,10 @@ index 481071b4265..a6ea3a8a84c 100755
  
  
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index ce2825580c6..d42bbd4fd1c 100644
+index 3a7251102ef..12d1d04e645 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -6378,6 +6378,16 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
+@@ -6380,6 +6380,16 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
                  [specify that runtime libraries should be
                   installed in a compiler-specific directory])])
  
@@ -120,10 +120,10 @@ index ce2825580c6..d42bbd4fd1c 100644
  AC_SUBST(subdirs)
  AC_SUBST(srcdir)
 diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
-index 6ef36ce02aa..09414d8cc05 100644
+index 0ab6c9c6449..c3d3d51a28f 100644
 --- a/gcc/doc/invoke.texi
 +++ b/gcc/doc/invoke.texi
-@@ -332,6 +332,7 @@ Objective-C and Objective-C++ Dialects}.
+@@ -333,6 +333,7 @@ Objective-C and Objective-C++ Dialects}.
  -Wpacked  -Wpacked-bitfield-compat -Wpacked-not-aligned  -Wpadded @gol
  -Wparentheses  -Wno-pedantic-ms-format @gol
  -Wplacement-new  -Wplacement-new=@var{n} @gol
@@ -131,7 +131,7 @@ index 6ef36ce02aa..09414d8cc05 100644
  -Wpointer-arith  -Wpointer-compare  -Wno-pointer-to-int-cast @gol
  -Wno-pragmas  -Wno-prio-ctor-dtor  -Wredundant-decls @gol
  -Wrestrict  -Wno-return-local-addr @gol
-@@ -6289,6 +6290,14 @@ made up of data only and thus requires no special treatment.  But, for
+@@ -6290,6 +6291,14 @@ made up of data only and thus requires no special treatment.  But, for
  most targets, it is made up of code and thus requires the stack to be
  made executable in order for the program to work properly.
  
@@ -199,5 +199,5 @@ index bcbe2082905..5752298bbf2 100644
  
  /* Use given -I paths for #include "..." but not #include <...>, and
 -- 
-2.22.1
+2.25.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.2/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc-9.3/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
similarity index 95%
rename from meta/recipes-devtools/gcc/gcc-9.2/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
rename to meta/recipes-devtools/gcc/gcc-9.3/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
index 23039d2123..23ec5bce03 100644
--- a/meta/recipes-devtools/gcc/gcc-9.2/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.3/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
@@ -1,7 +1,7 @@
-From f8d60c4114acb92361c7b2f4a4561d4661e8da9d Mon Sep 17 00:00:00 2001
+From df90dbdba7a85c20bad95de71525f0f400a849d2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:08:31 +0400
-Subject: [PATCH 03/36] gcc-4.3.3: SYSROOT_CFLAGS_FOR_TARGET
+Subject: [PATCH 03/39] gcc-4.3.3: SYSROOT_CFLAGS_FOR_TARGET
 
 Before committing, I noticed that PR/32161 was marked as a dup of PR/32009, but my previous patch did not fix it.
 
@@ -69,5 +69,5 @@ index b121088d778..93aae5bb26f 100755
  # the named directory are copied to $(tooldir)/sys-include.
  if test x"${with_headers}" != x && test x"${with_headers}" != xno ; then
 -- 
-2.22.1
+2.25.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.2/0004-64-bit-multilib-hack.patch b/meta/recipes-devtools/gcc/gcc-9.3/0004-64-bit-multilib-hack.patch
similarity index 98%
rename from meta/recipes-devtools/gcc/gcc-9.2/0004-64-bit-multilib-hack.patch
rename to meta/recipes-devtools/gcc/gcc-9.3/0004-64-bit-multilib-hack.patch
index a79c40c1aa..17ec8986c1 100644
--- a/meta/recipes-devtools/gcc/gcc-9.2/0004-64-bit-multilib-hack.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.3/0004-64-bit-multilib-hack.patch
@@ -1,7 +1,7 @@
-From c2081c51db589471ea713870c72f13999abda815 Mon Sep 17 00:00:00 2001
+From 2e00d0a9a809153f693659e977c1e0550665e65c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:10:06 +0400
-Subject: [PATCH 04/36] 64-bit multilib hack.
+Subject: [PATCH 04/39] 64-bit multilib hack.
 
 GCC has internal multilib handling code but it assumes a very specific rigid directory
 layout. The build system implementation of multilib layout is very generic and allows
@@ -115,5 +115,5 @@ index f3c6e2be1d9..bd0393155fa 100644
  rs6000-linux.o: $(srcdir)/config/rs6000/rs6000-linux.c
  	$(COMPILE) $<
 -- 
-2.22.1
+2.25.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.2/0005-optional-libstdc.patch b/meta/recipes-devtools/gcc/gcc-9.3/0005-optional-libstdc.patch
similarity index 94%
rename from meta/recipes-devtools/gcc/gcc-9.2/0005-optional-libstdc.patch
rename to meta/recipes-devtools/gcc/gcc-9.3/0005-optional-libstdc.patch
index f4fac91467..3c28aeac63 100644
--- a/meta/recipes-devtools/gcc/gcc-9.2/0005-optional-libstdc.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.3/0005-optional-libstdc.patch
@@ -1,7 +1,7 @@
-From e7e504f4a90cfa395e7f8ee779f8c3ed687802ca Mon Sep 17 00:00:00 2001
+From 435e45592e944018f33bff32f1202b0872a23141 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:12:56 +0400
-Subject: [PATCH 05/36] optional libstdc
+Subject: [PATCH 05/39] optional libstdc
 
 gcc-runtime builds libstdc++ separately from gcc-cross-*. Its configure tests using g++
 will not run correctly since by default the linker will try to link against libstdc++
@@ -52,7 +52,7 @@ index 6c4574a837d..0e2657f00ee 100644
  	  library = -1;
  	  break;
 diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
-index 09414d8cc05..a43969bc9f0 100644
+index c3d3d51a28f..2f7ffe456c3 100644
 --- a/gcc/doc/invoke.texi
 +++ b/gcc/doc/invoke.texi
 @@ -228,6 +228,9 @@ in the following sections.
@@ -65,7 +65,7 @@ index 09414d8cc05..a43969bc9f0 100644
  -fext-numeric-literals @gol
  -Wabi=@var{n}  -Wabi-tag  -Wconversion-null  -Wctor-dtor-privacy @gol
  -Wdelete-non-virtual-dtor  -Wdeprecated-copy  -Wdeprecated-copy-dtor @gol
-@@ -538,7 +541,7 @@ Objective-C and Objective-C++ Dialects}.
+@@ -539,7 +542,7 @@ Objective-C and Objective-C++ Dialects}.
  -pie  -pthread  -r  -rdynamic @gol
  -s  -static  -static-pie  -static-libgcc  -static-libstdc++ @gol
  -static-libasan  -static-libtsan  -static-liblsan  -static-libubsan @gol
@@ -74,7 +74,7 @@ index 09414d8cc05..a43969bc9f0 100644
  -T @var{script}  -Wl,@var{option}  -Xlinker @var{option} @gol
  -u @var{symbol}  -z @var{keyword}}
  
-@@ -13312,6 +13315,33 @@ Specify that the program entry point is @var{entry}.  The argument is
+@@ -13321,6 +13324,33 @@ Specify that the program entry point is @var{entry}.  The argument is
  interpreted by the linker; the GNU linker accepts either a symbol name
  or an address.
  
@@ -121,5 +121,5 @@ index a2601a6bb06..cd6c6fc95db 100644
  #endif
  
 -- 
-2.22.1
+2.25.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.2/0006-COLLECT_GCC_OPTIONS.patch b/meta/recipes-devtools/gcc/gcc-9.3/0006-COLLECT_GCC_OPTIONS.patch
similarity index 89%
rename from meta/recipes-devtools/gcc/gcc-9.2/0006-COLLECT_GCC_OPTIONS.patch
rename to meta/recipes-devtools/gcc/gcc-9.3/0006-COLLECT_GCC_OPTIONS.patch
index 9f7e603f8c..906f3a7317 100644
--- a/meta/recipes-devtools/gcc/gcc-9.2/0006-COLLECT_GCC_OPTIONS.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.3/0006-COLLECT_GCC_OPTIONS.patch
@@ -1,7 +1,7 @@
-From b9260cd3ac26b0302824ed466a548464c864d95f Mon Sep 17 00:00:00 2001
+From c99684477ec66f290ec74efe732acd3c24db7dcc Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:16:28 +0400
-Subject: [PATCH 06/36] COLLECT_GCC_OPTIONS
+Subject: [PATCH 06/39] COLLECT_GCC_OPTIONS
 
 This patch adds --sysroot into COLLECT_GCC_OPTIONS which is used to
 invoke collect2.
@@ -34,5 +34,5 @@ index cd6c6fc95db..7da9c5d457b 100644
      {
        const char *const *args;
 -- 
-2.22.1
+2.25.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.2/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch b/meta/recipes-devtools/gcc/gcc-9.3/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
similarity index 91%
rename from meta/recipes-devtools/gcc/gcc-9.2/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
rename to meta/recipes-devtools/gcc/gcc-9.3/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
index 28f8fc2674..68a876cb95 100644
--- a/meta/recipes-devtools/gcc/gcc-9.2/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.3/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
@@ -1,7 +1,7 @@
-From 88e728dad53d48c4a19f15e19f66fd23f4820b4a Mon Sep 17 00:00:00 2001
+From d6f4edaab0ad0e742fb1e3a6f76908a2ac9927d5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:17:25 +0400
-Subject: [PATCH 07/36] Use the defaults.h in ${B} instead of ${S}, and t-oe in
+Subject: [PATCH 07/39] Use the defaults.h in ${B} instead of ${S}, and t-oe in
  ${B}
 
 Use the defaults.h in ${B} instead of ${S}, and t-oe in ${B}, so that
@@ -27,7 +27,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  4 files changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index 5f43d9de00e..41f0f592ff4 100644
+index abae872cd63..fef6c4c61e3 100644
 --- a/gcc/Makefile.in
 +++ b/gcc/Makefile.in
 @@ -540,7 +540,7 @@ TARGET_SYSTEM_ROOT = @TARGET_SYSTEM_ROOT@
@@ -40,10 +40,10 @@ index 5f43d9de00e..41f0f592ff4 100644
  TM_MULTILIB_CONFIG=@TM_MULTILIB_CONFIG@
  TM_MULTILIB_EXCEPTIONS_CONFIG=@TM_MULTILIB_EXCEPTIONS_CONFIG@
 diff --git a/gcc/configure b/gcc/configure
-index a6ea3a8a84c..e3bcf8abe9a 100755
+index 2e26dd33310..ed7931daed3 100755
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -12341,8 +12341,8 @@ for f in $tm_file; do
+@@ -12342,8 +12342,8 @@ for f in $tm_file; do
         tm_include_list="${tm_include_list} $f"
         ;;
      defaults.h )
@@ -55,7 +55,7 @@ index a6ea3a8a84c..e3bcf8abe9a 100755
      * )
         tm_file_list="${tm_file_list} \$(srcdir)/config/$f"
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index d42bbd4fd1c..2ebc377a74d 100644
+index 12d1d04e645..e0500e30d50 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
 @@ -1968,8 +1968,8 @@ for f in $tm_file; do
@@ -92,5 +92,5 @@ index 308b87d0cc1..19068cbc24a 100644
  
  # Add multiple inclusion protection guard, part two.
 -- 
-2.22.1
+2.25.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.2/0008-fortran-cross-compile-hack.patch b/meta/recipes-devtools/gcc/gcc-9.3/0008-fortran-cross-compile-hack.patch
similarity index 91%
rename from meta/recipes-devtools/gcc/gcc-9.2/0008-fortran-cross-compile-hack.patch
rename to meta/recipes-devtools/gcc/gcc-9.3/0008-fortran-cross-compile-hack.patch
index 24e3abe0bb..6acd2b0cf9 100644
--- a/meta/recipes-devtools/gcc/gcc-9.2/0008-fortran-cross-compile-hack.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.3/0008-fortran-cross-compile-hack.patch
@@ -1,7 +1,7 @@
-From 010f09f2963ede24e85134e5fab2fa627a9afa05 Mon Sep 17 00:00:00 2001
+From 2c514ada36ffbf70177909f633e9f68811de61e0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:20:01 +0400
-Subject: [PATCH 08/36] fortran cross-compile hack.
+Subject: [PATCH 08/39] fortran cross-compile hack.
 
 * Fortran would have searched for arm-angstrom-gnueabi-gfortran but would have used
 used gfortan. For gcc_4.2.2.bb we want to use the gfortran compiler from our cross
@@ -42,5 +42,5 @@ index 7cfce28ab69..6cd515ee1a4 100644
  
  # extra LD Flags which are required for targets
 -- 
-2.22.1
+2.25.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.2/0009-cpp-honor-sysroot.patch b/meta/recipes-devtools/gcc/gcc-9.3/0009-cpp-honor-sysroot.patch
similarity index 94%
rename from meta/recipes-devtools/gcc/gcc-9.2/0009-cpp-honor-sysroot.patch
rename to meta/recipes-devtools/gcc/gcc-9.3/0009-cpp-honor-sysroot.patch
index 6af0a0124a..5a9e527606 100644
--- a/meta/recipes-devtools/gcc/gcc-9.2/0009-cpp-honor-sysroot.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.3/0009-cpp-honor-sysroot.patch
@@ -1,7 +1,7 @@
-From 45e9cd39d9c62454d46b9e9473a0c1034ceca15d Mon Sep 17 00:00:00 2001
+From 0a7c03a9cf925ba09a510a32e684f01ec5a50650 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:22:00 +0400
-Subject: [PATCH 09/36] cpp: honor sysroot.
+Subject: [PATCH 09/39] cpp: honor sysroot.
 
 Currently, if the gcc toolchain is relocated and installed from sstate, then you try and compile
 preprocessed source (.i or .ii files), the compiler will try and access the builtin sysroot location
@@ -50,5 +50,5 @@ index 7da9c5d457b..4e7c45b268c 100644
    {"@assembler",
     "%{!M:%{!MM:%{!E:%{!S:as %(asm_debug) %(asm_options) %i %A }}}}", 0, 0, 0},
 -- 
-2.22.1
+2.25.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.2/0010-MIPS64-Default-to-N64-ABI.patch b/meta/recipes-devtools/gcc/gcc-9.3/0010-MIPS64-Default-to-N64-ABI.patch
similarity index 89%
rename from meta/recipes-devtools/gcc/gcc-9.2/0010-MIPS64-Default-to-N64-ABI.patch
rename to meta/recipes-devtools/gcc/gcc-9.3/0010-MIPS64-Default-to-N64-ABI.patch
index bc0c6d5bed..a8103b951e 100644
--- a/meta/recipes-devtools/gcc/gcc-9.2/0010-MIPS64-Default-to-N64-ABI.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.3/0010-MIPS64-Default-to-N64-ABI.patch
@@ -1,7 +1,7 @@
-From 1ff4108d707b34e399e9dc418ad1ecc42f72676d Mon Sep 17 00:00:00 2001
+From 374aab6a88200fbd7343467d97f7ee6455bbce61 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:23:08 +0400
-Subject: [PATCH 10/36] MIPS64: Default to N64 ABI
+Subject: [PATCH 10/39] MIPS64: Default to N64 ABI
 
 MIPS64 defaults to n32 ABI, this patch makes it
 so that it defaults to N64 ABI
@@ -14,7 +14,7 @@ Upstream-Status: Inappropriate [OE config specific]
  1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/gcc/config.gcc b/gcc/config.gcc
-index ddd3b8f4d9d..fdfc0bd3e82 100644
+index b2282ecdf0b..69c0e4a005b 100644
 --- a/gcc/config.gcc
 +++ b/gcc/config.gcc
 @@ -2282,29 +2282,29 @@ mips*-*-linux*)				# Linux MIPS, either endian.
@@ -53,5 +53,5 @@ index ddd3b8f4d9d..fdfc0bd3e82 100644
  			;;
  	esac
 -- 
-2.22.1
+2.25.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.2/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc-9.3/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
similarity index 98%
rename from meta/recipes-devtools/gcc/gcc-9.2/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
rename to meta/recipes-devtools/gcc/gcc-9.3/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
index 66fb24d4cd..d9d563d0f7 100644
--- a/meta/recipes-devtools/gcc/gcc-9.2/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.3/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
@@ -1,7 +1,7 @@
-From 72fc3975bcd720b2f8040fa87cd23d3db4c5975a Mon Sep 17 00:00:00 2001
+From dcd7891d6aea5327969132fea6ca4c199f14e985 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:24:50 +0400
-Subject: [PATCH] Define GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
+Subject: [PATCH 11/39] Define GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
  relative to SYSTEMLIBS_DIR
 
 This patch defines GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
@@ -241,3 +241,6 @@ index 789d1df4bd5..b920c680fb1 100644
  
  #ifdef SPARC_BI_ARCH
  
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/gcc/gcc-9.2/0012-gcc-Fix-argument-list-too-long-error.patch b/meta/recipes-devtools/gcc/gcc-9.3/0012-gcc-Fix-argument-list-too-long-error.patch
similarity index 85%
rename from meta/recipes-devtools/gcc/gcc-9.2/0012-gcc-Fix-argument-list-too-long-error.patch
rename to meta/recipes-devtools/gcc/gcc-9.3/0012-gcc-Fix-argument-list-too-long-error.patch
index 60539795c5..9d98878096 100644
--- a/meta/recipes-devtools/gcc/gcc-9.2/0012-gcc-Fix-argument-list-too-long-error.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.3/0012-gcc-Fix-argument-list-too-long-error.patch
@@ -1,7 +1,7 @@
-From 2cb227cd8069c73242286f64183fb203f8d2618a Mon Sep 17 00:00:00 2001
+From faa0f712a67005ef0260f95eebe7c7c57a6f8360 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:26:37 +0400
-Subject: [PATCH 12/36] gcc: Fix argument list too long error.
+Subject: [PATCH 12/39] gcc: Fix argument list too long error.
 
 There would be an "Argument list too long" error when the
 build directory is longer than 200, this is caused by:
@@ -23,10 +23,10 @@ Upstream-Status: Pending
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index 41f0f592ff4..0064a282488 100644
+index fef6c4c61e3..57cf7804f0a 100644
 --- a/gcc/Makefile.in
 +++ b/gcc/Makefile.in
-@@ -3537,7 +3537,7 @@ install-plugin: installdirs lang.install-plugin s-header-vars install-gengtype
+@@ -3538,7 +3538,7 @@ install-plugin: installdirs lang.install-plugin s-header-vars install-gengtype
  # We keep the directory structure for files in config or c-family and .def
  # files. All other files are flattened to a single directory.
  	$(mkinstalldirs) $(DESTDIR)$(plugin_includedir)
@@ -36,5 +36,5 @@ index 41f0f592ff4..0064a282488 100644
  	for file in $$headers; do \
  	  if [ -f $$file ] ; then \
 -- 
-2.22.1
+2.25.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.2/0013-Disable-sdt.patch b/meta/recipes-devtools/gcc/gcc-9.3/0013-Disable-sdt.patch
similarity index 89%
rename from meta/recipes-devtools/gcc/gcc-9.2/0013-Disable-sdt.patch
rename to meta/recipes-devtools/gcc/gcc-9.3/0013-Disable-sdt.patch
index a21a63c617..455858354f 100644
--- a/meta/recipes-devtools/gcc/gcc-9.2/0013-Disable-sdt.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.3/0013-Disable-sdt.patch
@@ -1,7 +1,7 @@
-From aea5ffa9d704f4eb8fa93366884d3c26a1dbec49 Mon Sep 17 00:00:00 2001
+From 4df5a747265983092afd6fbc5329dd808cc1da3c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:28:10 +0400
-Subject: [PATCH 13/36] Disable sdt.
+Subject: [PATCH 13/39] Disable sdt.
 
 We don't list dtrace in DEPENDS so we shouldn't be depending on this header.
 It may or may not exist from preivous builds though. To be determinstic, disable
@@ -25,10 +25,10 @@ Upstream-Status: Inappropriate [hack]
  4 files changed, 19 insertions(+), 19 deletions(-)
 
 diff --git a/gcc/configure b/gcc/configure
-index e3bcf8abe9a..1f1d22ca666 100755
+index ed7931daed3..52f52b0ec86 100755
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -29332,12 +29332,12 @@ fi
+@@ -29333,12 +29333,12 @@ fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking sys/sdt.h in the target C library" >&5
  $as_echo_n "checking sys/sdt.h in the target C library... " >&6; }
  have_sys_sdt_h=no
@@ -48,7 +48,7 @@ index e3bcf8abe9a..1f1d22ca666 100755
  $as_echo "$have_sys_sdt_h" >&6; }
  
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 2ebc377a74d..ddc85197588 100644
+index e0500e30d50..242ad28ec83 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
 @@ -5995,15 +5995,15 @@ fi
@@ -77,10 +77,10 @@ index 2ebc377a74d..ddc85197588 100644
  # Check if TFmode long double should be used by default or not.
  # Some glibc targets used DFmode long double, but with glibc 2.4
 diff --git a/libstdc++-v3/configure b/libstdc++-v3/configure
-index 5acf79cba54..191bc6c5796 100755
+index 1225edc596b..3b89b880fc8 100755
 --- a/libstdc++-v3/configure
 +++ b/libstdc++-v3/configure
-@@ -22085,11 +22085,11 @@ ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
+@@ -22325,11 +22325,11 @@ ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
  ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
  ac_compiler_gnu=$ac_cv_c_compiler_gnu
  
@@ -96,10 +96,10 @@ index 5acf79cba54..191bc6c5796 100755
  $as_echo "$glibcxx_cv_sys_sdt_h" >&6; }
  
 diff --git a/libstdc++-v3/configure.ac b/libstdc++-v3/configure.ac
-index dadd8827b49..6b1ce9957d3 100644
+index d8455e41574..844cf1acbce 100644
 --- a/libstdc++-v3/configure.ac
 +++ b/libstdc++-v3/configure.ac
-@@ -230,7 +230,7 @@ GLIBCXX_CHECK_SC_NPROCESSORS_ONLN
+@@ -232,7 +232,7 @@ GLIBCXX_CHECK_SC_NPROCESSORS_ONLN
  GLIBCXX_CHECK_SC_NPROC_ONLN
  GLIBCXX_CHECK_PTHREADS_NUM_PROCESSORS_NP
  GLIBCXX_CHECK_SYSCTL_HW_NCPU
@@ -109,5 +109,5 @@ index dadd8827b49..6b1ce9957d3 100644
  # Check for available headers.
  AC_CHECK_HEADERS([endian.h execinfo.h float.h fp.h ieeefp.h inttypes.h \
 -- 
-2.22.1
+2.25.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.2/0014-libtool.patch b/meta/recipes-devtools/gcc/gcc-9.3/0014-libtool.patch
similarity index 91%
rename from meta/recipes-devtools/gcc/gcc-9.2/0014-libtool.patch
rename to meta/recipes-devtools/gcc/gcc-9.3/0014-libtool.patch
index 7a8f3afecf..2953859238 100644
--- a/meta/recipes-devtools/gcc/gcc-9.2/0014-libtool.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.3/0014-libtool.patch
@@ -1,7 +1,7 @@
-From 6c4d0c303ebc3e1c7e554d54a8bb807d77ed41fd Mon Sep 17 00:00:00 2001
+From 34977d994666a90983c96a9240dfa3540562da35 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:29:11 +0400
-Subject: [PATCH 14/36] libtool
+Subject: [PATCH 14/39] libtool
 
 libstdc++ from gcc-runtime gets created with -rpath=/usr/lib/../lib for qemux86-64
 when running on am x86_64 build host.
@@ -38,5 +38,5 @@ index 79f9ba89af5..8e222f7c16b 100644
        oldlibs=
        if test -z "$rpath"; then
 -- 
-2.22.1
+2.25.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.2/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch b/meta/recipes-devtools/gcc/gcc-9.3/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
similarity index 91%
rename from meta/recipes-devtools/gcc/gcc-9.2/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
rename to meta/recipes-devtools/gcc/gcc-9.3/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
index d06ae27028..d4445244e2 100644
--- a/meta/recipes-devtools/gcc/gcc-9.2/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.3/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
@@ -1,7 +1,7 @@
-From c5662ff1e7dea2291b9cb7a83cfff3001dd31f53 Mon Sep 17 00:00:00 2001
+From 4558ba7fa020c111f9a204021a418c0ce55d77f9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:30:32 +0400
-Subject: [PATCH 15/36] gcc: armv4: pass fix-v4bx to linker to support EABI.
+Subject: [PATCH 15/39] gcc: armv4: pass fix-v4bx to linker to support EABI.
 
 The LINK_SPEC for linux gets overwritten by linux-eabi.h which
 means the value of TARGET_FIX_V4BX_SPEC gets lost and as a result
@@ -39,5 +39,5 @@ index e4ade2e2ab0..108863f69d2 100644
  		       LINUX_TARGET_LINK_SPEC " " ANDROID_LINK_SPEC)
  
 -- 
-2.22.1
+2.25.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.2/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch b/meta/recipes-devtools/gcc/gcc-9.3/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch
similarity index 89%
rename from meta/recipes-devtools/gcc/gcc-9.2/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch
rename to meta/recipes-devtools/gcc/gcc-9.3/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch
index 310caec4a1..6f0833ccda 100644
--- a/meta/recipes-devtools/gcc/gcc-9.2/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.3/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch
@@ -1,7 +1,7 @@
-From e3b693b9d6dc9496f7c98a13b28182d23084215c Mon Sep 17 00:00:00 2001
+From 7effc632d65c2d72bf6fa32a219ec2f82fef9405 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:33:04 +0400
-Subject: [PATCH 16/36] Use the multilib config files from ${B} instead of
+Subject: [PATCH 16/39] Use the multilib config files from ${B} instead of
  using the ones from ${S}
 
 Use the multilib config files from ${B} instead of using the ones from ${S}
@@ -18,10 +18,10 @@ Upstream-Status: Inappropriate [configuration]
  2 files changed, 36 insertions(+), 8 deletions(-)
 
 diff --git a/gcc/configure b/gcc/configure
-index 1f1d22ca666..911de2cf017 100755
+index 52f52b0ec86..a5f208af7cf 100755
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -12321,10 +12321,20 @@ done
+@@ -12322,10 +12322,20 @@ done
  tmake_file_=
  for f in ${tmake_file}
  do
@@ -46,7 +46,7 @@ index 1f1d22ca666..911de2cf017 100755
  done
  tmake_file="${tmake_file_}"
  
-@@ -12335,6 +12345,10 @@ tm_file_list="options.h"
+@@ -12336,6 +12346,10 @@ tm_file_list="options.h"
  tm_include_list="options.h insn-constants.h"
  for f in $tm_file; do
    case $f in
@@ -58,7 +58,7 @@ index 1f1d22ca666..911de2cf017 100755
         f=`echo $f | sed 's/^..//'`
         tm_file_list="${tm_file_list} $f"
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index ddc85197588..b413ae9bf25 100644
+index 242ad28ec83..b7a7ead1c02 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
 @@ -1948,10 +1948,20 @@ done
@@ -98,5 +98,5 @@ index ddc85197588..b413ae9bf25 100644
         f=`echo $f | sed 's/^..//'`
         tm_file_list="${tm_file_list} $f"
 -- 
-2.22.1
+2.25.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.2/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch b/meta/recipes-devtools/gcc/gcc-9.3/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
similarity index 84%
rename from meta/recipes-devtools/gcc/gcc-9.2/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
rename to meta/recipes-devtools/gcc/gcc-9.3/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
index ad1d1d4eb0..96da013bf2 100644
--- a/meta/recipes-devtools/gcc/gcc-9.2/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.3/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
@@ -1,7 +1,7 @@
-From 09d9ccc1d471020949d1285a5276f17504fd60dd Mon Sep 17 00:00:00 2001
+From a2b2bf77621f344a849e55ab179ece8587d19234 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 09:39:38 +0000
-Subject: [PATCH 17/36] Avoid using libdir from .la which usually points to a
+Subject: [PATCH 17/39] Avoid using libdir from .la which usually points to a
  host path
 
 Upstream-Status: Inappropriate [embedded specific]
@@ -27,5 +27,5 @@ index 8e222f7c16b..0a93b4e5c3b 100644
  	    absdir="$libdir"
  	  fi
 -- 
-2.22.1
+2.25.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.2/0018-export-CPP.patch b/meta/recipes-devtools/gcc/gcc-9.3/0018-export-CPP.patch
similarity index 95%
rename from meta/recipes-devtools/gcc/gcc-9.2/0018-export-CPP.patch
rename to meta/recipes-devtools/gcc/gcc-9.3/0018-export-CPP.patch
index 0f728ec542..2385099c25 100644
--- a/meta/recipes-devtools/gcc/gcc-9.2/0018-export-CPP.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.3/0018-export-CPP.patch
@@ -1,7 +1,7 @@
-From 987338cd847a723de533bb317e452a60b1e52165 Mon Sep 17 00:00:00 2001
+From cafb6a621c05c1f238679d52fc026446f38c8af5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 09:40:59 +0000
-Subject: [PATCH 18/36] export CPP
+Subject: [PATCH 18/39] export CPP
 
 The OE environment sets and exports CPP as being the target gcc. When
 building gcc-cross-canadian for a mingw targetted sdk, the following can be found
@@ -49,5 +49,5 @@ index 64e091ba71d..255822e3f27 100644
  	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
  	CXX="$(CXX_FOR_BUILD)"; export CXX; \
 -- 
-2.22.1
+2.25.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.2/0019-Ensure-target-gcc-headers-can-be-included.patch b/meta/recipes-devtools/gcc/gcc-9.3/0019-Ensure-target-gcc-headers-can-be-included.patch
similarity index 80%
rename from meta/recipes-devtools/gcc/gcc-9.2/0019-Ensure-target-gcc-headers-can-be-included.patch
rename to meta/recipes-devtools/gcc/gcc-9.3/0019-Ensure-target-gcc-headers-can-be-included.patch
index 53f9e99d07..e0129d1f96 100644
--- a/meta/recipes-devtools/gcc/gcc-9.2/0019-Ensure-target-gcc-headers-can-be-included.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.3/0019-Ensure-target-gcc-headers-can-be-included.patch
@@ -1,7 +1,7 @@
-From d27ba49e2e5c608c43265462d6831363cc7f565b Mon Sep 17 00:00:00 2001
+From 182057b80891edc0e8d46835e2d8bfd28330a55a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 10:25:11 +0000
-Subject: [PATCH 19/36] Ensure target gcc headers can be included
+Subject: [PATCH 19/39] Ensure target gcc headers can be included
 
 There are a few headers installed as part of the OpenEmbedded
 gcc-runtime target (omp.h, ssp/*.h). Being installed from a recipe
@@ -18,10 +18,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  gcc/Makefile.in  | 2 ++
  gcc/cppdefault.c | 4 ++++
- gcc/defaults.h   | 9 +++++++++
- gcc/gcc.c        | 7 -------
- 4 files changed, 15 insertions(+), 7 deletions(-)
+ 2 files changed, 6 insertions(+)
 
+diff --git a/gcc/Makefile.in b/gcc/Makefile.in
+index 57cf7804f0a..7772342ad5e 100644
 --- a/gcc/Makefile.in
 +++ b/gcc/Makefile.in
 @@ -618,6 +618,7 @@ libexecdir = @libexecdir@
@@ -32,7 +32,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  # Directory in which the compiler finds executables
  libexecsubdir = $(libexecdir)/gcc/$(real_target_noncanonical)/$(version)$(accel_dir_suffix)
  # Directory in which all plugin resources are installed
-@@ -2866,6 +2867,7 @@ CFLAGS-intl.o += -DLOCALEDIR=\"$(localed
+@@ -2867,6 +2868,7 @@ CFLAGS-intl.o += -DLOCALEDIR=\"$(localedir)\"
  
  PREPROCESSOR_DEFINES = \
    -DGCC_INCLUDE_DIR=\"$(libsubdir)/include\" \
@@ -40,9 +40,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    -DFIXED_INCLUDE_DIR=\"$(libsubdir)/include-fixed\" \
    -DGPLUSPLUS_INCLUDE_DIR=\"$(gcc_gxx_include_dir)\" \
    -DGPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT=$(gcc_gxx_include_dir_add_sysroot) \
+diff --git a/gcc/cppdefault.c b/gcc/cppdefault.c
+index c4796385643..980e2bd47a7 100644
 --- a/gcc/cppdefault.c
 +++ b/gcc/cppdefault.c
-@@ -59,6 +59,10 @@ const struct default_include cpp_include
+@@ -59,6 +59,10 @@ const struct default_include cpp_include_defaults[]
      /* This is the dir for gcc's private headers.  */
      { GCC_INCLUDE_DIR, "GCC", 0, 0, 0, 0 },
  #endif
@@ -53,3 +55,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #ifdef LOCAL_INCLUDE_DIR
      /* /usr/local/include comes before the fixincluded header files.  */
      { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 2 },
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/gcc/gcc-9.2/0020-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch b/meta/recipes-devtools/gcc/gcc-9.3/0020-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
similarity index 92%
rename from meta/recipes-devtools/gcc/gcc-9.2/0020-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
rename to meta/recipes-devtools/gcc/gcc-9.3/0020-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
index b0f96d06d4..1d2182140f 100644
--- a/meta/recipes-devtools/gcc/gcc-9.2/0020-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.3/0020-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
@@ -1,7 +1,7 @@
-From 83bcd4cc47ae63971c888c117abd00dfd506532c Mon Sep 17 00:00:00 2001
+From a4740f1290e6a602fbbfa27b863be2e3b2675685 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 11:17:19 +0000
-Subject: [PATCH 20/36] gcc 4.8+ won't build with --disable-dependency-tracking
+Subject: [PATCH 20/39] gcc 4.8+ won't build with --disable-dependency-tracking
 
 since the *.Ppo files don't get created unless --enable-dependency-tracking is true.
 
@@ -50,5 +50,5 @@ index 29324e3e0ac..d5cdb4259ef 100644
  M_IFUNC = $(if $(PAT_S),$(IFUNC_DEF) $(IFUNC_OPT))
  M_FILE = $(PAT_BASE)_n.c
 -- 
-2.22.1
+2.25.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.2/0021-Don-t-search-host-directory-during-relink-if-inst_pr.patch b/meta/recipes-devtools/gcc/gcc-9.3/0021-Don-t-search-host-directory-during-relink-if-inst_pr.patch
similarity index 87%
rename from meta/recipes-devtools/gcc/gcc-9.2/0021-Don-t-search-host-directory-during-relink-if-inst_pr.patch
rename to meta/recipes-devtools/gcc/gcc-9.3/0021-Don-t-search-host-directory-during-relink-if-inst_pr.patch
index f36ca29b9e..e363c7d445 100644
--- a/meta/recipes-devtools/gcc/gcc-9.2/0021-Don-t-search-host-directory-during-relink-if-inst_pr.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.3/0021-Don-t-search-host-directory-during-relink-if-inst_pr.patch
@@ -1,7 +1,7 @@
-From 667cc8d43e8fb4ac09654ee408da482f96b09580 Mon Sep 17 00:00:00 2001
+From f3edad81d80dde5d64bf77e6abafda54db10b824 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 3 Mar 2015 08:21:19 +0000
-Subject: [PATCH 21/36] Don't search host directory during "relink" if
+Subject: [PATCH 21/39] Don't search host directory during "relink" if
  $inst_prefix is provided
 
 http://lists.gnu.org/archive/html/libtool-patches/2011-01/msg00026.html
@@ -34,5 +34,5 @@ index 0a93b4e5c3b..6de6ed2f9a0 100644
  		esac
  	      fi
 -- 
-2.22.1
+2.25.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.2/0022-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch b/meta/recipes-devtools/gcc/gcc-9.3/0022-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
similarity index 86%
rename from meta/recipes-devtools/gcc/gcc-9.2/0022-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
rename to meta/recipes-devtools/gcc/gcc-9.3/0022-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
index d5b9150023..846c0de5e8 100644
--- a/meta/recipes-devtools/gcc/gcc-9.2/0022-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.3/0022-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
@@ -1,7 +1,7 @@
-From 279c4de48e3fd61e2f268787ed3f1d69ed9224f8 Mon Sep 17 00:00:00 2001
+From b8ea2c2c7d33376f5dd651646c7e822000e47749 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 28 Apr 2015 23:15:27 -0700
-Subject: [PATCH 22/36] Use SYSTEMLIBS_DIR replacement instead of hardcoding
+Subject: [PATCH 22/39] Use SYSTEMLIBS_DIR replacement instead of hardcoding
  base_libdir
 
 Upstream-Status: Pending
@@ -25,5 +25,5 @@ index 5e8b34ded03..7e628bf661e 100644
  #undef MUSL_DYNAMIC_LINKER
  #define MUSL_DYNAMIC_LINKER "/lib/ld-musl-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
 -- 
-2.22.1
+2.25.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.2/0023-aarch64-Add-support-for-musl-ldso.patch b/meta/recipes-devtools/gcc/gcc-9.3/0023-aarch64-Add-support-for-musl-ldso.patch
similarity index 87%
rename from meta/recipes-devtools/gcc/gcc-9.2/0023-aarch64-Add-support-for-musl-ldso.patch
rename to meta/recipes-devtools/gcc/gcc-9.3/0023-aarch64-Add-support-for-musl-ldso.patch
index f811306c31..102d6fc742 100644
--- a/meta/recipes-devtools/gcc/gcc-9.2/0023-aarch64-Add-support-for-musl-ldso.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.3/0023-aarch64-Add-support-for-musl-ldso.patch
@@ -1,7 +1,7 @@
-From 1277d12058334087443828dfd57d44e3b1dfcc9a Mon Sep 17 00:00:00 2001
+From 8645b57e7c0dfd93afee5caeaa534c714f449ba1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 28 Apr 2015 23:18:39 -0700
-Subject: [PATCH 23/36] aarch64: Add support for musl ldso
+Subject: [PATCH 23/39] aarch64: Add support for musl ldso
 
 Upstream-Status: Pending
 
@@ -24,5 +24,5 @@ index 7e628bf661e..1717cbe5471 100644
  #undef  ASAN_CC1_SPEC
  #define ASAN_CC1_SPEC "%{%:sanitize(address):-funwind-tables}"
 -- 
-2.22.1
+2.25.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.2/0024-libcc1-fix-libcc1-s-install-path-and-rpath.patch b/meta/recipes-devtools/gcc/gcc-9.3/0024-libcc1-fix-libcc1-s-install-path-and-rpath.patch
similarity index 93%
rename from meta/recipes-devtools/gcc/gcc-9.2/0024-libcc1-fix-libcc1-s-install-path-and-rpath.patch
rename to meta/recipes-devtools/gcc/gcc-9.3/0024-libcc1-fix-libcc1-s-install-path-and-rpath.patch
index 298b0962f6..443e0a2ca6 100644
--- a/meta/recipes-devtools/gcc/gcc-9.2/0024-libcc1-fix-libcc1-s-install-path-and-rpath.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.3/0024-libcc1-fix-libcc1-s-install-path-and-rpath.patch
@@ -1,7 +1,7 @@
-From 4a0487ad75accd780dd155aa59086cc4b11cfc47 Mon Sep 17 00:00:00 2001
+From b1666565e4e133ee41f32fa8032165bcb06afe9a Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Sun, 5 Jul 2015 20:25:18 -0700
-Subject: [PATCH 24/36] libcc1: fix libcc1's install path and rpath
+Subject: [PATCH 24/39] libcc1: fix libcc1's install path and rpath
 
 * Install libcc1.so and libcc1plugin.so into
   $(libexecdir)/gcc/$(target_noncanonical)/$(gcc_version), as what we
@@ -50,5 +50,5 @@ index 7104b649026..2103c477468 100644
  @ENABLE_PLUGIN_TRUE@cc1lib_LTLIBRARIES = libcc1.la
  shared_source = callbacks.cc callbacks.hh connection.cc connection.hh \
 -- 
-2.22.1
+2.25.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.2/0025-handle-sysroot-support-for-nativesdk-gcc.patch b/meta/recipes-devtools/gcc/gcc-9.3/0025-handle-sysroot-support-for-nativesdk-gcc.patch
similarity index 55%
rename from meta/recipes-devtools/gcc/gcc-9.2/0025-handle-sysroot-support-for-nativesdk-gcc.patch
rename to meta/recipes-devtools/gcc/gcc-9.3/0025-handle-sysroot-support-for-nativesdk-gcc.patch
index 2e7a444b58..c81a532c8f 100644
--- a/meta/recipes-devtools/gcc/gcc-9.2/0025-handle-sysroot-support-for-nativesdk-gcc.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.3/0025-handle-sysroot-support-for-nativesdk-gcc.patch
@@ -1,7 +1,7 @@
-From a183c82ea2af934a8d30055a791dc1d80c9067a9 Mon Sep 17 00:00:00 2001
+From 7d614a84709d7dc4a2529c3d529e2da8541f9fd4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 7 Dec 2015 23:39:54 +0000
-Subject: [PATCH 25/36] handle sysroot support for nativesdk-gcc
+Subject: [PATCH 25/39] handle sysroot support for nativesdk-gcc
 
 Being able to build a nativesdk gcc is useful, particularly in cases
 where the host compiler may be of an incompatible version (or a 32
@@ -24,32 +24,22 @@ Upstream-Status: Inappropriate
 RP 2015/7/28
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Added PREFIXVAR and EXEC_PREFIXVAR to support runtime relocation.  Without
-these as part of the gccrelocprefix the system can't do runtime relocation
-if the executable is moved.  (These paths were missed in the original
-implementation.)
-
-Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
 ---
- c-family/c-opts.c |    4 +--
- cppdefault.c      |   63 +++++++++++++++++++++++++++++++++---------------------
- cppdefault.h      |   13 ++++-------
- gcc.c             |   20 ++++++++++++-----
- incpath.c         |   12 +++++-----
- prefix.c          |    4 +--
- 6 files changed, 68 insertions(+), 48 deletions(-)
+ gcc/cppdefault.c | 50 +++++++++++++++++++++++++++++++++++-------------
+ gcc/cppdefault.h |  3 ++-
+ gcc/gcc.c        | 20 +++++++++++++------
+ 3 files changed, 53 insertions(+), 20 deletions(-)
 
-Index: gcc-9.2.0/gcc/cppdefault.c
-===================================================================
---- gcc-9.2.0.orig/gcc/cppdefault.c
-+++ gcc-9.2.0/gcc/cppdefault.c
+diff --git a/gcc/cppdefault.c b/gcc/cppdefault.c
+index 980e2bd47a7..39b6059efdc 100644
+--- a/gcc/cppdefault.c
++++ b/gcc/cppdefault.c
 @@ -35,6 +35,30 @@
  # undef CROSS_INCLUDE_DIR
  #endif
  
 +static char GPLUSPLUS_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = GPLUSPLUS_INCLUDE_DIR;
-+char GCC_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = GCC_INCLUDE_DIR;
++static char GCC_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = GCC_INCLUDE_DIR;
 +static char GPLUSPLUS_TOOL_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = GPLUSPLUS_TOOL_INCLUDE_DIR;
 +static char GPLUSPLUS_BACKWARD_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = GPLUSPLUS_BACKWARD_INCLUDE_DIR;
 +static char STANDARD_STARTFILE_PREFIX_2VAR[4096] __attribute__ ((section (".gccrelocprefix"))) = STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUBDIR_TARGET;
@@ -75,7 +65,7 @@ Index: gcc-9.2.0/gcc/cppdefault.c
  const struct default_include cpp_include_defaults[]
  #ifdef INCLUDE_DEFAULTS
  = INCLUDE_DEFAULTS;
-@@ -42,38 +66,38 @@ const struct default_include cpp_include
+@@ -42,38 +66,38 @@ const struct default_include cpp_include_defaults[]
  = {
  #ifdef GPLUSPLUS_INCLUDE_DIR
      /* Pick up GNU C++ generic include files.  */
@@ -123,7 +113,7 @@ Index: gcc-9.2.0/gcc/cppdefault.c
        /* A multilib suffix needs adding if different multilibs use
  	 different headers.  */
  #ifdef SYSROOT_HEADERS_SUFFIX_SPEC
-@@ -85,33 +109,24 @@ const struct default_include cpp_include
+@@ -85,16 +109,16 @@ const struct default_include cpp_include_defaults[]
  #endif
  #ifdef CROSS_INCLUDE_DIR
      /* One place the target system's headers might be.  */
@@ -144,29 +134,10 @@ Index: gcc-9.2.0/gcc/cppdefault.c
  #endif
      { 0, 0, 0, 0, 0, 0 }
    };
- #endif /* no INCLUDE_DEFAULTS */
- 
--#ifdef GCC_INCLUDE_DIR
--const char cpp_GCC_INCLUDE_DIR[] = GCC_INCLUDE_DIR;
--const size_t cpp_GCC_INCLUDE_DIR_len = sizeof GCC_INCLUDE_DIR - 8;
--#else
--const char cpp_GCC_INCLUDE_DIR[] = "";
--const size_t cpp_GCC_INCLUDE_DIR_len = 0;
--#endif
--
- /* The configured prefix.  */
--const char cpp_PREFIX[] = PREFIX;
--const size_t cpp_PREFIX_len = sizeof PREFIX - 1;
--const char cpp_EXEC_PREFIX[] = STANDARD_EXEC_PREFIX;
-+char PREFIXVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = PREFIX;
-+char EXEC_PREFIXVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = STANDARD_EXEC_PREFIX;
- 
- /* This value is set by cpp_relocated at runtime */
- const char *gcc_exec_prefix;
-Index: gcc-9.2.0/gcc/cppdefault.h
-===================================================================
---- gcc-9.2.0.orig/gcc/cppdefault.h
-+++ gcc-9.2.0/gcc/cppdefault.h
+diff --git a/gcc/cppdefault.h b/gcc/cppdefault.h
+index e2d96f1e760..29fa5f815c8 100644
+--- a/gcc/cppdefault.h
++++ b/gcc/cppdefault.h
 @@ -33,7 +33,8 @@
  
  struct default_include
@@ -177,31 +148,10 @@ Index: gcc-9.2.0/gcc/cppdefault.h
    const char *const component;	/* The component containing the directory
  				   (see update_path in prefix.c) */
    const char cplusplus;		/* Only look here if we're compiling C++.  */
-@@ -50,17 +51,13 @@ struct default_include
- };
- 
- extern const struct default_include cpp_include_defaults[];
--extern const char cpp_GCC_INCLUDE_DIR[];
--extern const size_t cpp_GCC_INCLUDE_DIR_len;
-+extern char GCC_INCLUDE_DIRVAR[] __attribute__ ((section (".gccrelocprefix")));
- 
- /* The configure-time prefix, i.e., the value supplied as the argument
-    to --prefix=.  */
--extern const char cpp_PREFIX[];
-+extern char PREFIXVAR[] __attribute__ ((section (".gccrelocprefix")));
- /* The length of the configure-time prefix.  */
--extern const size_t cpp_PREFIX_len;
--/* The configure-time execution prefix.  This is typically the lib/gcc
--   subdirectory of cpp_PREFIX.  */
--extern const char cpp_EXEC_PREFIX[];
-+extern char EXEC_PREFIXVAR[] __attribute__ ((section (".gccrelocprefix")));
- /* The run-time execution prefix.  This is typically the lib/gcc
-    subdirectory of the actual installation.  */
- extern const char *gcc_exec_prefix;
-Index: gcc-9.2.0/gcc/gcc.c
-===================================================================
---- gcc-9.2.0.orig/gcc/gcc.c
-+++ gcc-9.2.0/gcc/gcc.c
+diff --git a/gcc/gcc.c b/gcc/gcc.c
+index 4e7c45b268c..59fb64f5fd5 100644
+--- a/gcc/gcc.c
++++ b/gcc/gcc.c
 @@ -253,6 +253,8 @@ FILE *report_times_to_file = NULL;
  #endif
  static const char *target_system_root = DEFAULT_TARGET_SYSTEM_ROOT;
@@ -211,7 +161,7 @@ Index: gcc-9.2.0/gcc/gcc.c
  /* Nonzero means pass the updated target_system_root to the compiler.  */
  
  static int target_system_root_changed;
-@@ -527,6 +529,7 @@ or with constant text in a single argume
+@@ -527,6 +529,7 @@ or with constant text in a single argument.
   %G     process LIBGCC_SPEC as a spec.
   %R     Output the concatenation of target_system_root and
          target_sysroot_suffix.
@@ -234,7 +184,7 @@ Index: gcc-9.2.0/gcc/gcc.c
  
  /* For native compilers, these are well-known paths containing
     components that may be provided by the system.  For cross
-@@ -1511,9 +1514,9 @@ static const char *const standard_startf
+@@ -1511,9 +1514,9 @@ static const char *const standard_startfile_prefix = STANDARD_STARTFILE_PREFIX;
  static const char *md_exec_prefix = MD_EXEC_PREFIX;
  static const char *md_startfile_prefix = MD_STARTFILE_PREFIX;
  static const char *md_startfile_prefix_1 = MD_STARTFILE_PREFIX_1;
@@ -246,7 +196,7 @@ Index: gcc-9.2.0/gcc/gcc.c
    = STANDARD_STARTFILE_PREFIX_2;
  
  /* A relative path to be used in finding the location of tools
-@@ -5922,6 +5925,11 @@ do_spec_1 (const char *spec, int inswitc
+@@ -5922,6 +5925,11 @@ do_spec_1 (const char *spec, int inswitch, const char *soft_matched_part)
  	      }
  	    break;
  
@@ -258,89 +208,6 @@ Index: gcc-9.2.0/gcc/gcc.c
  	  case 'S':
  	    value = do_spec_1 (startfile_spec, 0, NULL);
  	    if (value != 0)
-Index: gcc-9.2.0/gcc/c-family/c-opts.c
-===================================================================
---- gcc-9.2.0.orig/gcc/c-family/c-opts.c
-+++ gcc-9.2.0/gcc/c-family/c-opts.c
-@@ -1382,8 +1382,8 @@ add_prefixed_path (const char *suffix, i
-   size_t prefix_len, suffix_len;
- 
-   suffix_len = strlen (suffix);
--  prefix     = iprefix ? iprefix : cpp_GCC_INCLUDE_DIR;
--  prefix_len = iprefix ? strlen (iprefix) : cpp_GCC_INCLUDE_DIR_len;
-+  prefix     = iprefix ? iprefix : GCC_INCLUDE_DIRVAR;
-+  prefix_len = iprefix ? strlen (iprefix) : strlen(GCC_INCLUDE_DIRVAR) - 7;
- 
-   path = (char *) xmalloc (prefix_len + suffix_len + 1);
-   memcpy (path, prefix, prefix_len);
-Index: gcc-9.2.0/gcc/incpath.c
-===================================================================
---- gcc-9.2.0.orig/gcc/incpath.c
-+++ gcc-9.2.0/gcc/incpath.c
-@@ -131,7 +131,7 @@ add_standard_paths (const char *sysroot,
-   int relocated = cpp_relocated ();
-   size_t len;
- 
--  if (iprefix && (len = cpp_GCC_INCLUDE_DIR_len) != 0)
-+  if (iprefix && (len = strlen(GCC_INCLUDE_DIRVAR) - 7) != 0)
-     {
-       /* Look for directories that start with the standard prefix.
- 	 "Translate" them, i.e. replace /usr/local/lib/gcc... with
-@@ -145,7 +145,7 @@ add_standard_paths (const char *sysroot,
- 		 now.  */
- 	      if (sysroot && p->add_sysroot)
- 		continue;
--	      if (!filename_ncmp (p->fname, cpp_GCC_INCLUDE_DIR, len))
-+	      if (!filename_ncmp (p->fname, GCC_INCLUDE_DIRVAR, len))
- 		{
- 		  char *str = concat (iprefix, p->fname + len, NULL);
- 		  if (p->multilib == 1 && imultilib)
-@@ -185,7 +185,7 @@ add_standard_paths (const char *sysroot,
- 	      free (sysroot_no_trailing_dir_separator);
- 	    }
- 	  else if (!p->add_sysroot && relocated
--		   && !filename_ncmp (p->fname, cpp_PREFIX, cpp_PREFIX_len))
-+		   && !filename_ncmp (p->fname, PREFIXVAR, strlen(PREFIXVAR)))
- 	    {
-  	      static const char *relocated_prefix;
- 	      char *ostr;
-@@ -202,12 +202,12 @@ add_standard_paths (const char *sysroot,
- 		  dummy = concat (gcc_exec_prefix, "dummy", NULL);
- 		  relocated_prefix
- 		    = make_relative_prefix (dummy,
--					    cpp_EXEC_PREFIX,
--					    cpp_PREFIX);
-+					    EXEC_PREFIXVAR,
-+					    PREFIXVAR);
- 		  free (dummy);
- 		}
- 	      ostr = concat (relocated_prefix,
--			     p->fname + cpp_PREFIX_len,
-+			     p->fname + strlen(PREFIXVAR),
- 			     NULL);
- 	      str = update_path (ostr, p->component);
- 	      free (ostr);
-Index: gcc-9.2.0/gcc/prefix.c
-===================================================================
---- gcc-9.2.0.orig/gcc/prefix.c
-+++ gcc-9.2.0/gcc/prefix.c
-@@ -72,7 +72,9 @@ License along with GCC; see the file COP
- #include "prefix.h"
- #include "common/common-target.h"
- 
--static const char *std_prefix = PREFIX;
-+static const char PREFIXVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = PREFIX;
-+
-+static const char *std_prefix = PREFIXVAR;
- 
- static const char *get_key_value (char *);
- static char *translate_name (char *);
-@@ -212,7 +214,7 @@ translate_name (char *name)
- 	prefix = getenv (key);
- 
-       if (prefix == 0)
--	prefix = PREFIX;
-+	prefix = PREFIXVAR;
- 
-       /* We used to strip trailing DIR_SEPARATORs here, but that can
- 	 sometimes yield a result with no separator when one was coded
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/gcc/gcc-9.2/0026-Search-target-sysroot-gcc-version-specific-dirs-with.patch b/meta/recipes-devtools/gcc/gcc-9.3/0026-Search-target-sysroot-gcc-version-specific-dirs-with.patch
similarity index 90%
rename from meta/recipes-devtools/gcc/gcc-9.2/0026-Search-target-sysroot-gcc-version-specific-dirs-with.patch
rename to meta/recipes-devtools/gcc/gcc-9.3/0026-Search-target-sysroot-gcc-version-specific-dirs-with.patch
index fde206eb71..abfa7516da 100644
--- a/meta/recipes-devtools/gcc/gcc-9.2/0026-Search-target-sysroot-gcc-version-specific-dirs-with.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.3/0026-Search-target-sysroot-gcc-version-specific-dirs-with.patch
@@ -1,7 +1,7 @@
-From dab4db14e319f3239a2b4c7d1fbf2971936e27ba Mon Sep 17 00:00:00 2001
+From 6c39a22c3e85d20dee9e2fc2274e95da980de4d0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 7 Dec 2015 23:41:45 +0000
-Subject: [PATCH 26/36] Search target sysroot gcc version specific dirs with
+Subject: [PATCH 26/39] Search target sysroot gcc version specific dirs with
  multilib.
 
 We install the gcc libraries (such as crtbegin.p) into
@@ -51,10 +51,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 28 insertions(+), 1 deletion(-)
 
 diff --git a/gcc/gcc.c b/gcc/gcc.c
-index db0e2934038..1c21d1b08eb 100644
+index 59fb64f5fd5..3e79da4238c 100644
 --- a/gcc/gcc.c
 +++ b/gcc/gcc.c
-@@ -2610,7 +2610,7 @@ for_each_path (const struct path_prefix *paths,
+@@ -2617,7 +2617,7 @@ for_each_path (const struct path_prefix *paths,
        if (path == NULL)
  	{
  	  len = paths->max_len + extra_space + 1;
@@ -63,7 +63,7 @@ index db0e2934038..1c21d1b08eb 100644
  	  path = XNEWVEC (char, len);
  	}
  
-@@ -2622,6 +2622,33 @@ for_each_path (const struct path_prefix *paths,
+@@ -2629,6 +2629,33 @@ for_each_path (const struct path_prefix *paths,
  	  /* Look first in MACHINE/VERSION subdirectory.  */
  	  if (!skip_multi_dir)
  	    {
@@ -98,5 +98,5 @@ index db0e2934038..1c21d1b08eb 100644
  	      ret = callback (path, callback_info);
  	      if (ret)
 -- 
-2.22.1
+2.25.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.2/0027-Fix-various-_FOR_BUILD-and-related-variables.patch b/meta/recipes-devtools/gcc/gcc-9.3/0027-Fix-various-_FOR_BUILD-and-related-variables.patch
similarity index 94%
rename from meta/recipes-devtools/gcc/gcc-9.2/0027-Fix-various-_FOR_BUILD-and-related-variables.patch
rename to meta/recipes-devtools/gcc/gcc-9.3/0027-Fix-various-_FOR_BUILD-and-related-variables.patch
index 5d89e8e7e2..ae8acc7f13 100644
--- a/meta/recipes-devtools/gcc/gcc-9.2/0027-Fix-various-_FOR_BUILD-and-related-variables.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.3/0027-Fix-various-_FOR_BUILD-and-related-variables.patch
@@ -1,7 +1,7 @@
-From 8e84bb09d2b7a60487a30e438bb109f31c2c254b Mon Sep 17 00:00:00 2001
+From 07db34b16b6c8e3d948b417f2fc052500ffb77d3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 7 Dec 2015 23:42:45 +0000
-Subject: [PATCH 27/36] Fix various _FOR_BUILD and related variables
+Subject: [PATCH 27/39] Fix various _FOR_BUILD and related variables
 
 When doing a FOR_BUILD thing, you have to override CFLAGS with
 CFLAGS_FOR_BUILD. And if you use C++, you also have to override
@@ -94,7 +94,7 @@ index 41cae58a267..d3f6b79acdc 100644
  	CFLAGS="$(CFLAGS)"; export CFLAGS; \
  	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
 diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index 21472745c2c..8c93f03ffdc 100644
+index 7772342ad5e..02fec881b6d 100644
 --- a/gcc/Makefile.in
 +++ b/gcc/Makefile.in
 @@ -805,7 +805,7 @@ BUILD_LDFLAGS=@BUILD_LDFLAGS@
@@ -107,10 +107,10 @@ index 21472745c2c..8c93f03ffdc 100644
  # Actual name to use when installing a native compiler.
  GCC_INSTALL_NAME := $(shell echo gcc|sed '$(program_transform_name)')
 diff --git a/gcc/configure b/gcc/configure
-index 911de2cf017..325ace34cdf 100755
+index a5f208af7cf..0788b7bf0b5 100755
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -11965,7 +11965,7 @@ else
+@@ -11966,7 +11966,7 @@ else
  	CC="${CC_FOR_BUILD}" CFLAGS="${CFLAGS_FOR_BUILD}" \
  	CXX="${CXX_FOR_BUILD}" CXXFLAGS="${CXXFLAGS_FOR_BUILD}" \
  	LD="${LD_FOR_BUILD}" LDFLAGS="${LDFLAGS_FOR_BUILD}" \
@@ -120,7 +120,7 @@ index 911de2cf017..325ace34cdf 100755
  		--enable-languages=${enable_languages-all} \
  		--target=$target_alias --host=$build_alias --build=$build_alias
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index b413ae9bf25..72a6c95121b 100644
+index b7a7ead1c02..5ab50fae0f3 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
 @@ -1743,7 +1743,7 @@ else
@@ -133,5 +133,5 @@ index b413ae9bf25..72a6c95121b 100644
  		--enable-languages=${enable_languages-all} \
  		--target=$target_alias --host=$build_alias --build=$build_alias
 -- 
-2.22.1
+2.25.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.2/0028-nios2-Define-MUSL_DYNAMIC_LINKER.patch b/meta/recipes-devtools/gcc/gcc-9.3/0028-nios2-Define-MUSL_DYNAMIC_LINKER.patch
similarity index 84%
rename from meta/recipes-devtools/gcc/gcc-9.2/0028-nios2-Define-MUSL_DYNAMIC_LINKER.patch
rename to meta/recipes-devtools/gcc/gcc-9.3/0028-nios2-Define-MUSL_DYNAMIC_LINKER.patch
index 84d92a337e..52a5d97aef 100644
--- a/meta/recipes-devtools/gcc/gcc-9.2/0028-nios2-Define-MUSL_DYNAMIC_LINKER.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.3/0028-nios2-Define-MUSL_DYNAMIC_LINKER.patch
@@ -1,7 +1,7 @@
-From 5647f773e28b528a67800ef06ca44730f9f5dc7e Mon Sep 17 00:00:00 2001
+From 59543e897eb35194fb47288f7762e40a18fff611 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 2 Feb 2016 10:26:10 -0800
-Subject: [PATCH 28/36] nios2: Define MUSL_DYNAMIC_LINKER
+Subject: [PATCH 28/39] nios2: Define MUSL_DYNAMIC_LINKER
 
 Upstream-Status: Pending
 
@@ -24,5 +24,5 @@ index 698734add35..eeee60ecfea 100644
  #undef LINK_SPEC
  #define LINK_SPEC LINK_SPEC_ENDIAN \
 -- 
-2.22.1
+2.25.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.2/0029-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch b/meta/recipes-devtools/gcc/gcc-9.3/0029-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
similarity index 95%
rename from meta/recipes-devtools/gcc/gcc-9.2/0029-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
rename to meta/recipes-devtools/gcc/gcc-9.3/0029-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
index d19e5a08b9..bfa7e19dd0 100644
--- a/meta/recipes-devtools/gcc/gcc-9.2/0029-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.3/0029-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
@@ -1,7 +1,7 @@
-From 474043ca7a064ca7b0a32308a0ed6f7c546f17b2 Mon Sep 17 00:00:00 2001
+From 8df99af0a65ef740bcf2b7dc9a109cc57f15c3aa Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 27 Jun 2017 18:10:54 -0700
-Subject: [PATCH 29/36] Add ssp_nonshared to link commandline for musl targets
+Subject: [PATCH 29/39] Add ssp_nonshared to link commandline for musl targets
 
 when -fstack-protector options are enabled we need to
 link with ssp_shared on musl since it does not provide
@@ -83,5 +83,5 @@ index 45a9a7cae59..d1e88a40e82 100644
    %{!static-pie: \
      %{rdynamic:-export-dynamic} \
 -- 
-2.22.1
+2.25.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.2/0030-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch b/meta/recipes-devtools/gcc/gcc-9.3/0030-ldbl128-config.patch
similarity index 84%
rename from meta/recipes-devtools/gcc/gcc-9.2/0030-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
rename to meta/recipes-devtools/gcc/gcc-9.3/0030-ldbl128-config.patch
index 38eab5a083..f8e8c07f62 100644
--- a/meta/recipes-devtools/gcc/gcc-9.2/0030-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.3/0030-ldbl128-config.patch
@@ -1,7 +1,7 @@
-From 47467f3ab0fb2f2fcede81060fe8bb339d0909eb Mon Sep 17 00:00:00 2001
+From 1bfae624b27ea4a1f5c5a92050d741b511e7b3d5 Mon Sep 17 00:00:00 2001
 From: Szabolcs Nagy <nsz@port70.net>
 Date: Wed, 28 Feb 2018 00:54:05 +0000
-Subject: [PATCH 10/12] ldbl128 config
+Subject: [PATCH 30/39] ldbl128 config
 
 Upstream-Status: Pending
 
@@ -12,10 +12,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 27 insertions(+), 2 deletions(-)
 
 diff --git a/gcc/configure b/gcc/configure
-index 6121e163259..07ff8597d48 100755
+index 0788b7bf0b5..eb1a45bb263 100755
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -29309,6 +29309,15 @@ if test "${with_long_double_128+set}" = set; then :
+@@ -29370,6 +29370,15 @@ if test "${with_long_double_128+set}" = set; then :
    withval=$with_long_double_128; gcc_cv_target_ldbl128="$with_long_double_128"
  else
  
@@ -31,7 +31,7 @@ index 6121e163259..07ff8597d48 100755
  if test $glibc_version_major -gt 2 \
    || ( test $glibc_version_major -eq 2 && test $glibc_version_minor -ge 4 ); then :
    gcc_cv_target_ldbl128=yes
-@@ -29320,6 +29329,10 @@ else
+@@ -29381,6 +29390,10 @@ else
        && gcc_cv_target_ldbl128=yes
  
  fi
@@ -43,10 +43,10 @@ index 6121e163259..07ff8597d48 100755
  
      ;;
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index b066cc609e1..6c15ed898c0 100644
+index 5ab50fae0f3..7ffe35ee1c3 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -5971,13 +5971,25 @@ case "$target" in
+@@ -6030,13 +6030,25 @@ case "$target" in
      AC_ARG_WITH(long-double-128,
        [AS_HELP_STRING([--with-long-double-128],
  		      [use 128-bit long double by default])],
@@ -75,5 +75,5 @@ index b066cc609e1..6c15ed898c0 100644
  esac
  if test x$gcc_cv_target_ldbl128 = xyes; then
 -- 
-2.17.1
+2.25.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.2/0031-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch b/meta/recipes-devtools/gcc/gcc-9.3/0031-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
similarity index 86%
rename from meta/recipes-devtools/gcc/gcc-9.2/0031-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
rename to meta/recipes-devtools/gcc/gcc-9.3/0031-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
index dc2141d70c..60a29fc94d 100644
--- a/meta/recipes-devtools/gcc/gcc-9.2/0031-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.3/0031-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
@@ -1,7 +1,7 @@
-From 266dcc78e4d9d38de2809118977d97dc9270cf1f Mon Sep 17 00:00:00 2001
+From 31d008f5573627c6192ce9fcf729f0be464a7cf5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 4 May 2016 21:11:34 -0700
-Subject: [PATCH 31/36] Link libgcc using LDFLAGS, not just SHLIB_LDFLAGS
+Subject: [PATCH 31/39] Link libgcc using LDFLAGS, not just SHLIB_LDFLAGS
 
 Upstream-Status: Pending
 
@@ -25,5 +25,5 @@ index 099bf23e62f..436b277a79f 100644
  	$(SHLIB_OBJS) $(SHLIB_LC) && \
  	rm -f $(SHLIB_DIR)/$(SHLIB_SOLINK) && \
 -- 
-2.22.1
+2.25.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.2/0032-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch b/meta/recipes-devtools/gcc/gcc-9.3/0032-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
similarity index 92%
rename from meta/recipes-devtools/gcc/gcc-9.2/0032-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
rename to meta/recipes-devtools/gcc/gcc-9.3/0032-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
index 8dde016ce5..6f048dab82 100644
--- a/meta/recipes-devtools/gcc/gcc-9.2/0032-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.3/0032-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
@@ -1,7 +1,7 @@
-From 9975b6ed3570bbf7c7d2d82f4d5f733d24ccacf5 Mon Sep 17 00:00:00 2001
+From 761fa6e3e37608cfd1b288e721a2ff89288cd6aa Mon Sep 17 00:00:00 2001
 From: Szabolcs Nagy <nsz@port70.net>
 Date: Sat, 24 Oct 2015 20:09:53 +0000
-Subject: [PATCH 32/36] libgcc_s: Use alias for __cpu_indicator_init instead of
+Subject: [PATCH 32/39] libgcc_s: Use alias for __cpu_indicator_init instead of
  symver
 
 Adapter from
@@ -39,10 +39,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  3 files changed, 6 insertions(+), 6 deletions(-)
 
 diff --git a/gcc/config/i386/i386.c b/gcc/config/i386/i386.c
-index 2b37296e537..dd380ddba88 100644
+index 1bca5a7eea6..096c4bc8e25 100644
 --- a/gcc/config/i386/i386.c
 +++ b/gcc/config/i386/i386.c
-@@ -36658,10 +36658,10 @@ ix86_expand_builtin (tree exp, rtx target, rtx subtarget,
+@@ -36685,10 +36685,10 @@ ix86_expand_builtin (tree exp, rtx target, rtx subtarget,
      {
      case IX86_BUILTIN_CPU_INIT:
        {
@@ -82,5 +82,5 @@ index 8506a635790..564296f788e 100644
 +HOST_LIBGCC2_CFLAGS += -mlong-double-80 $(CET_FLAGS)
  CRTSTUFF_T_CFLAGS += $(CET_FLAGS)
 -- 
-2.22.1
+2.25.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.2/0033-sync-gcc-stddef.h-with-musl.patch b/meta/recipes-devtools/gcc/gcc-9.3/0033-sync-gcc-stddef.h-with-musl.patch
similarity index 95%
rename from meta/recipes-devtools/gcc/gcc-9.2/0033-sync-gcc-stddef.h-with-musl.patch
rename to meta/recipes-devtools/gcc/gcc-9.3/0033-sync-gcc-stddef.h-with-musl.patch
index b99ac429a0..f080b0596f 100644
--- a/meta/recipes-devtools/gcc/gcc-9.2/0033-sync-gcc-stddef.h-with-musl.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.3/0033-sync-gcc-stddef.h-with-musl.patch
@@ -1,7 +1,7 @@
-From 39e2f61d262f9f6c7a91068998dea80791ef665e Mon Sep 17 00:00:00 2001
+From 126e342fb39d7af70c1e5a6df8ffafc8dfc3bf08 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 3 Feb 2017 12:56:00 -0800
-Subject: [PATCH 33/36] sync gcc stddef.h with musl
+Subject: [PATCH 33/39] sync gcc stddef.h with musl
 
 musl defines ptrdiff_t size_t and wchar_t
 so dont define them here if musl is definining them
@@ -87,5 +87,5 @@ index da692e1c01a..9a00c261adb 100644
  #endif /* _STDDEF_H or __need_wchar_t.  */
  
 -- 
-2.22.1
+2.25.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.2/0034-fix-segmentation-fault-in-precompiled-header-generat.patch b/meta/recipes-devtools/gcc/gcc-9.3/0034-fix-segmentation-fault-in-precompiled-header-generat.patch
similarity index 93%
rename from meta/recipes-devtools/gcc/gcc-9.2/0034-fix-segmentation-fault-in-precompiled-header-generat.patch
rename to meta/recipes-devtools/gcc/gcc-9.3/0034-fix-segmentation-fault-in-precompiled-header-generat.patch
index 06a3c9f884..3b7ccb3e3d 100644
--- a/meta/recipes-devtools/gcc/gcc-9.2/0034-fix-segmentation-fault-in-precompiled-header-generat.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.3/0034-fix-segmentation-fault-in-precompiled-header-generat.patch
@@ -1,7 +1,7 @@
-From aaa896a57b0004a74c1d474e74b21f41147a65cb Mon Sep 17 00:00:00 2001
+From d26fa9ededccc7e1ec47ead7f18afc80971483a3 Mon Sep 17 00:00:00 2001
 From: Juro Bystricky <juro.bystricky@intel.com>
 Date: Mon, 19 Mar 2018 22:31:20 -0700
-Subject: [PATCH 34/36] fix segmentation fault in precompiled header generation
+Subject: [PATCH 34/39] fix segmentation fault in precompiled header generation
 
 Prevent a segmentation fault which occurs when using incorrect
 structure trying to access name of some named operators, such as
@@ -56,5 +56,5 @@ index eedfcbb3146..15040a1b1f0 100644
  	buffer = _cpp_spell_ident_ucns (buffer, token->val.node.node);
        break;
 -- 
-2.22.1
+2.25.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.2/0035-Fix-for-testsuite-failure.patch b/meta/recipes-devtools/gcc/gcc-9.3/0035-Fix-for-testsuite-failure.patch
similarity index 98%
rename from meta/recipes-devtools/gcc/gcc-9.2/0035-Fix-for-testsuite-failure.patch
rename to meta/recipes-devtools/gcc/gcc-9.3/0035-Fix-for-testsuite-failure.patch
index 7470cbfcfc..5e199fbcfd 100644
--- a/meta/recipes-devtools/gcc/gcc-9.2/0035-Fix-for-testsuite-failure.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.3/0035-Fix-for-testsuite-failure.patch
@@ -1,7 +1,7 @@
-From 0f9d449c739df03782ce9d29f6b68d9af976a607 Mon Sep 17 00:00:00 2001
+From fb5bdf8f8527228d587e8af9fc700e5164b3c18c Mon Sep 17 00:00:00 2001
 From: RAGHUNATH LOLUR <raghunath.lolur@kpit.com>
 Date: Wed, 6 Dec 2017 22:52:26 -0800
-Subject: [PATCH 35/36] Fix for testsuite failure
+Subject: [PATCH 35/39] Fix for testsuite failure
 
 2017-11-16  Raghunath Lolur  <raghunath.lolur@kpit.com>
 
@@ -254,5 +254,5 @@ index 6cda1534311..26e37f5b8ba 100644
  __attribute__((vector_size((elcount)*sizeof(type)))) type
  
 -- 
-2.22.1
+2.25.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.2/0036-Re-introduce-spe-commandline-options.patch b/meta/recipes-devtools/gcc/gcc-9.3/0036-Re-introduce-spe-commandline-options.patch
similarity index 88%
rename from meta/recipes-devtools/gcc/gcc-9.2/0036-Re-introduce-spe-commandline-options.patch
rename to meta/recipes-devtools/gcc/gcc-9.3/0036-Re-introduce-spe-commandline-options.patch
index 4dbcd98945..825e070aa3 100644
--- a/meta/recipes-devtools/gcc/gcc-9.2/0036-Re-introduce-spe-commandline-options.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.3/0036-Re-introduce-spe-commandline-options.patch
@@ -1,7 +1,7 @@
-From 71e99c2b58a9eb00cdd65a04aeb6fb78227e3297 Mon Sep 17 00:00:00 2001
+From dc23cabac6a7b2ca85b02d2a58a8916c98f382e0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 6 Jun 2018 12:10:22 -0700
-Subject: [PATCH 36/36] Re-introduce spe commandline options
+Subject: [PATCH 36/39] Re-introduce spe commandline options
 
 This should ensure that we keep accepting
 spe options
@@ -37,5 +37,5 @@ index f4b5c91e11f..69869350fce 100644
  Target RejectNegative Var(rs6000_altivec_abi) Save
  Use the AltiVec ABI extensions.
 -- 
-2.22.1
+2.25.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.2/CVE-2019-14250.patch b/meta/recipes-devtools/gcc/gcc-9.3/0037-CVE-2019-14250-Check-zero-value-in-simple_object_elf.patch
similarity index 59%
rename from meta/recipes-devtools/gcc/gcc-9.2/CVE-2019-14250.patch
rename to meta/recipes-devtools/gcc/gcc-9.3/0037-CVE-2019-14250-Check-zero-value-in-simple_object_elf.patch
index 65ea34558a..f268a4eb58 100644
--- a/meta/recipes-devtools/gcc/gcc-9.2/CVE-2019-14250.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.3/0037-CVE-2019-14250-Check-zero-value-in-simple_object_elf.patch
@@ -1,7 +1,10 @@
-From 517b211a3d78366ca8d5929f580e8ca72fd2c004 Mon Sep 17 00:00:00 2001
+From ac4af583bd59f6631671ad4abf985799ce4a53d9 Mon Sep 17 00:00:00 2001
 From: rguenth <rguenth@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Thu, 25 Jul 2019 10:46:54 +0000
-Subject: [PATCH] 2019-07-25  Richard Biener  <rguenther@suse.de>
+Subject: [PATCH 37/39] CVE-2019-14250: Check zero value in
+ simple_object_elf_match
+
+2019-07-25 Richard Biener <rguenther@suse.de>
 
 	PR lto/90924
 	Backport from mainline
@@ -10,7 +13,6 @@ Subject: [PATCH] 2019-07-25  Richard Biener  <rguenther@suse.de>
 	* simple-object-elf.c (simple_object_elf_match): Check zero value
 	shstrndx.
 
-
 git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-9-branch@273793 138bc75d-0d04-0410-961f-82ee72b054a4
 
 Upstream-Status: Backport
@@ -18,16 +20,15 @@ Affectes: <  9.2
 CVE: CVE-2019-14250
 Dropped changelog
 Signed-off-by: Armin Kuster <Akustre@mvista.com>
-
 ---
  libiberty/simple-object-elf.c | 8 ++++++++
- 2 files changed, 17 insertions(+)
+ 1 file changed, 8 insertions(+)
 
-Index: gcc-9.2.0/libiberty/simple-object-elf.c
-===================================================================
---- gcc-9.2.0.orig/libiberty/simple-object-elf.c
-+++ gcc-9.2.0/libiberty/simple-object-elf.c
-@@ -557,6 +557,14 @@ simple_object_elf_match (unsigned char h
+diff --git a/libiberty/simple-object-elf.c b/libiberty/simple-object-elf.c
+index 3d49f339631..c00cebdb6c7 100644
+--- a/libiberty/simple-object-elf.c
++++ b/libiberty/simple-object-elf.c
+@@ -557,6 +557,14 @@ simple_object_elf_match (unsigned char header[SIMPLE_OBJECT_MATCH_HEADER_LEN],
        return NULL;
      }
  
@@ -42,3 +43,6 @@ Index: gcc-9.2.0/libiberty/simple-object-elf.c
    return (void *) eor;
  }
  
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/gcc/gcc-9.2/gen-no-line-numbers.patch b/meta/recipes-devtools/gcc/gcc-9.3/0038-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
similarity index 93%
rename from meta/recipes-devtools/gcc/gcc-9.2/gen-no-line-numbers.patch
rename to meta/recipes-devtools/gcc/gcc-9.3/0038-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
index 8e2c3f5809..a79fc03d15 100644
--- a/meta/recipes-devtools/gcc/gcc-9.2/gen-no-line-numbers.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.3/0038-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
@@ -1,11 +1,23 @@
-Inserting line numbers into generated code means its not always reproducible wth 
+From 075e0929e04913538391052c32178b6a14ef0ae3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 12 Mar 2020 14:41:40 -0700
+Subject: [PATCH 38/39] gentypes/genmodes: Do not use __LINE__ for maintaining
+ reproducibility
+
+Inserting line numbers into generated code means its not always reproducible wth
 differing versions of host gcc. Void the issue by not adding these.
 
 Upstream-Status: Inappropriate [OE Reproducibility specific]
+
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gcc/gengtype.c |  6 +++---
+ gcc/genmodes.c | 32 ++++++++++++++++----------------
+ 2 files changed, 19 insertions(+), 19 deletions(-)
 
 diff --git a/gcc/gengtype.c b/gcc/gengtype.c
-index 53317337c..bbb261516 100644
+index 53317337cf8..bbb26151671 100644
 --- a/gcc/gengtype.c
 +++ b/gcc/gengtype.c
 @@ -991,7 +991,7 @@ create_field_at (pair_p next, type_p type, const char *name, options_p opt,
@@ -36,7 +48,7 @@ index 53317337c..bbb261516 100644
        POS_HERE (do_scalar_typedef ("CUMULATIVE_ARGS", &pos));
        POS_HERE (do_scalar_typedef ("REAL_VALUE_TYPE", &pos));
 diff --git a/gcc/genmodes.c b/gcc/genmodes.c
-index f33eefa24..07bef9eeb 100644
+index f33eefa2494..07bef9eebe2 100644
 --- a/gcc/genmodes.c
 +++ b/gcc/genmodes.c
 @@ -429,7 +429,7 @@ complete_all_modes (void)
@@ -168,3 +180,6 @@ index f33eefa24..07bef9eeb 100644
  
  #define ADJUST_NUNITS(M, X)    _ADD_ADJUST (nunits, M, X, RANDOM, RANDOM)
  #define ADJUST_BYTESIZE(M, X)  _ADD_ADJUST (bytesize, M, X, RANDOM, RANDOM)
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/gcc/gcc-9.2/re-PR-target-91102-aarch64-ICE-on-Linux-kernel-with-.patch b/meta/recipes-devtools/gcc/gcc-9.3/0039-process_alt_operands-Don-t-match-user-defined-regs-o.patch
similarity index 88%
rename from meta/recipes-devtools/gcc/gcc-9.2/re-PR-target-91102-aarch64-ICE-on-Linux-kernel-with-.patch
rename to meta/recipes-devtools/gcc/gcc-9.3/0039-process_alt_operands-Don-t-match-user-defined-regs-o.patch
index c37e0bb9dd..b69114d1e5 100644
--- a/meta/recipes-devtools/gcc/gcc-9.2/re-PR-target-91102-aarch64-ICE-on-Linux-kernel-with-.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.3/0039-process_alt_operands-Don-t-match-user-defined-regs-o.patch
@@ -1,8 +1,10 @@
-From efb0ee06f5c0186c2d1442ecd4dbbd55dbd97b44 Mon Sep 17 00:00:00 2001
+From e75bcc2ec4f1e7e081ce18713f0a25913ba15340 Mon Sep 17 00:00:00 2001
 From: Vladimir Makarov <vmakarov@redhat.com>
 Date: Wed, 10 Jul 2019 16:07:10 +0000
-Subject: [PATCH] re PR target/91102 (aarch64 ICE on Linux kernel with -Os
- starting with r270266)
+Subject: [PATCH 39/39] process_alt_operands: Don't match user defined regs
+ only if they are early clobbers
+
+PR target/91102 (aarch64 ICE on Linux kernel with -Os starting with r270266)
 
 2019-07-10  Vladimir Makarov  <vmakarov@redhat.com>
 
@@ -26,7 +28,7 @@ Signed-off-by: Taras Kondratiuk <takondra@cisco.com>
  create mode 100644 gcc/testsuite/gcc.target/aarch64/pr91102.c
 
 diff --git a/gcc/lra-constraints.c b/gcc/lra-constraints.c
-index cf33da8013e4..6382dbf852b6 100644
+index cf33da8013e..6382dbf852b 100644
 --- a/gcc/lra-constraints.c
 +++ b/gcc/lra-constraints.c
 @@ -2172,8 +2172,9 @@ process_alt_operands (int only_alternative)
@@ -63,7 +65,7 @@ index cf33da8013e4..6382dbf852b6 100644
  			if (curr_alt[m] == NO_REGS)
 diff --git a/gcc/testsuite/gcc.target/aarch64/pr91102.c b/gcc/testsuite/gcc.target/aarch64/pr91102.c
 new file mode 100644
-index 000000000000..70b99045a48e
+index 00000000000..70b99045a48
 --- /dev/null
 +++ b/gcc/testsuite/gcc.target/aarch64/pr91102.c
 @@ -0,0 +1,26 @@
@@ -93,3 +95,6 @@ index 000000000000..70b99045a48e
 +      b.h = foo (b.h, c.h);
 +    }
 +}
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_9.2.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_9.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-canadian_9.2.bb
rename to meta/recipes-devtools/gcc/gcc-cross-canadian_9.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross_9.2.bb b/meta/recipes-devtools/gcc/gcc-cross_9.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross_9.2.bb
rename to meta/recipes-devtools/gcc/gcc-cross_9.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_9.2.bb b/meta/recipes-devtools/gcc/gcc-crosssdk_9.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk_9.2.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk_9.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_9.2.bb b/meta/recipes-devtools/gcc/gcc-runtime_9.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-runtime_9.2.bb
rename to meta/recipes-devtools/gcc/gcc-runtime_9.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_9.2.bb b/meta/recipes-devtools/gcc/gcc-sanitizers_9.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-sanitizers_9.2.bb
rename to meta/recipes-devtools/gcc/gcc-sanitizers_9.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-source_9.2.bb b/meta/recipes-devtools/gcc/gcc-source_9.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-source_9.2.bb
rename to meta/recipes-devtools/gcc/gcc-source_9.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc_9.2.bb b/meta/recipes-devtools/gcc/gcc_9.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc_9.2.bb
rename to meta/recipes-devtools/gcc/gcc_9.3.bb
diff --git a/meta/recipes-devtools/gcc/libgcc-initial_9.2.bb b/meta/recipes-devtools/gcc/libgcc-initial_9.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc-initial_9.2.bb
rename to meta/recipes-devtools/gcc/libgcc-initial_9.3.bb
diff --git a/meta/recipes-devtools/gcc/libgcc_9.2.bb b/meta/recipes-devtools/gcc/libgcc_9.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc_9.2.bb
rename to meta/recipes-devtools/gcc/libgcc_9.3.bb
diff --git a/meta/recipes-devtools/gcc/libgfortran_9.2.bb b/meta/recipes-devtools/gcc/libgfortran_9.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgfortran_9.2.bb
rename to meta/recipes-devtools/gcc/libgfortran_9.3.bb
-- 
2.25.1


