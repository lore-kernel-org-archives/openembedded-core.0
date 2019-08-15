Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id E90A17F2B1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2019 07:17:24 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id f17so936100pfn.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2019 00:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ny0c8xG0sE5oADGdYCvmtYefS3UEuehEywp7jfzKskk=;
	b=n7F9f09eXmEaVvIJ3w+uGvJ/piLo6+BWHHKMviezoBsEU04/1OZpwR3USC/dzVJwzq
	GBJtJ1iVbqYMm1uCHTAckUytqJwjfMdi9zDXaOAODyi6wqtz5Q+AT4EbHmZQTKex6t1h
	AZklPtpGwbAn/USeRLLCU3tTGa91ECuNv5Kiu1UX8rTlpS6ZF6uS5TFtURvBbNjD/bpG
	YdL7qj22Eyt3OOCfbiyKPXrxoJl0L8rGUTYpy/RLezVjhdNk0YM5uitZXSEBXTs7uzqq
	WNnsbqmeKhkZ6t4V0puY9UYNVRzc6QiUNGX3zfL0/Tze51dKxga67JpTOv1znQHO5y0V
	aiHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ny0c8xG0sE5oADGdYCvmtYefS3UEuehEywp7jfzKskk=;
	b=cW3BWXzzbnsVGCH7sVhWlpewI7JsytuRwTv+N8zcrPdPle02cfUbAwFVO+8oZwIHM6
	jAHtY8grxCPs/V2/f+Jb6f2kwJNZXUDGiLBRPFOjWVwswUbNMfPua3iCH6yr1TKJwdF0
	gmhOLBAp7LZcfG6pXFyyA6FptxEvc/XW2l2M9nXskbNbcP3Ed/bi0FN5iDB1SaH08p+M
	90g9MqoT/YTM5UqyUlutvF/S9h1DrQ+yAd2A2fSYHrABh3sxanhGLyyPha/a7CBiATb3
	Dj6iUQ7fSevxG5wjQKtKj1JQl3r5iGb66GIRNkqQWn1WcOUq4tW1bOdjT68WBTuQaAP0
	ZEyA==
X-Gm-Message-State: APjAAAXOKvrLiNiNlHDHyT7l1sk0CGDWD3xnmNzmlbJZS27ta0fGOscp
	zihw2sGGWwTkO+pnM4SVuIgs7CTga+4=
X-Google-Smtp-Source: APXvYqyR5bgB+UzYjC1mL3GfA0aqg1wAQBD9AN+h9r75H4u0qbJd2AfuW7JRhmopbvmz+Wnrzi/I+Q==
X-Received: by 2002:a62:7912:: with SMTP id u18mr4228328pfc.254.1565853444501; 
	Thu, 15 Aug 2019 00:17:24 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3])
	by smtp.gmail.com with ESMTPSA id 97sm635469pjz.12.2019.08.15.00.17.23
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 15 Aug 2019 00:17:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Aug 2019 00:17:13 -0700
Message-Id: <20190815071713.14503-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
Subject: [PATCH] gcc-9: Upgrade to 9.2
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
X-List-Received-Date: Thu, 15 Aug 2019 07:17:25 -0000
Content-Transfer-Encoding: 8bit

BugFix only release see [1] for details

[1] https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=RESOLVED&resolution=FIXED&target_milestone=9.2

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |  2 +-
 .../gcc/{gcc-9.1.inc => gcc-9.2.inc}          | 11 ++--
 ...0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch | 12 ++--
 .../0002-gcc-poison-system-directories.patch  | 24 ++++----
 ...-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |  8 +--
 .../0004-64-bit-multilib-hack.patch           |  4 +-
 .../0005-optional-libstdc.patch               | 18 +++---
 ...gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch | 59 +++++++++++++++++++
 .../0007-COLLECT_GCC_OPTIONS.patch            |  6 +-
 ...ts.h-in-B-instead-of-S-and-t-oe-in-B.patch | 10 ++--
 .../0009-fortran-cross-compile-hack.patch     | 10 ++--
 .../0010-cpp-honor-sysroot.patch              |  6 +-
 .../0011-MIPS64-Default-to-N64-ABI.patch      |  8 +--
 ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch | 24 ++------
 ...gcc-Fix-argument-list-too-long-error.patch |  8 +--
 .../0014-Disable-sdt.patch                    | 18 +++---
 .../{gcc-9.1 => gcc-9.2}/0015-libtool.patch   |  4 +-
 ...s-fix-v4bx-to-linker-to-support-EABI.patch |  4 +-
 ...-config-files-from-B-instead-of-usin.patch |  8 +--
 ...ir-from-.la-which-usually-points-to-.patch |  4 +-
 .../0019-export-CPP.patch                     |  6 +-
 ...e-target-gcc-headers-can-be-included.patch | 10 ++--
 ...ild-with-disable-dependency-tracking.patch |  4 +-
 ...t-directory-during-relink-if-inst_pr.patch |  4 +-
 ...IR-replacement-instead-of-hardcoding.patch |  6 +-
 ...24-aarch64-Add-support-for-musl-ldso.patch |  6 +-
 ...-fix-libcc1-s-install-path-and-rpath.patch |  4 +-
 ...le-sysroot-support-for-nativesdk-gcc.patch |  6 +-
 ...sroot-gcc-version-specific-dirs-with.patch |  6 +-
 ...ous-_FOR_BUILD-and-related-variables.patch | 14 ++---
 ...029-nios2-Define-MUSL_DYNAMIC_LINKER.patch |  4 +-
 ...d-to-link-commandline-for-musl-targe.patch | 12 ++--
 ...bgcc-Add-knob-to-use-ldbl-128-on-ppc.patch |  4 +-
 ...using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch |  4 +-
 ...as-for-__cpu_indicator_init-instead-.patch |  8 +--
 .../0034-sync-gcc-stddef.h-with-musl.patch    |  4 +-
 ...-fault-in-precompiled-header-generat.patch |  4 +-
 .../0036-Fix-for-testsuite-failure.patch      |  6 +-
 ...Re-introduce-spe-commandline-options.patch |  6 +-
 ...adian_9.1.bb => gcc-cross-canadian_9.2.bb} |  0
 .../{gcc-cross_9.1.bb => gcc-cross_9.2.bb}    |  0
 ...cc-crosssdk_9.1.bb => gcc-crosssdk_9.2.bb} |  0
 ...{gcc-runtime_9.1.bb => gcc-runtime_9.2.bb} |  0
 ...anitizers_9.1.bb => gcc-sanitizers_9.2.bb} |  0
 .../{gcc-source_9.1.bb => gcc-source_9.2.bb}  |  0
 .../gcc/{gcc_9.1.bb => gcc_9.2.bb}            |  0
 ...c-initial_9.1.bb => libgcc-initial_9.2.bb} |  0
 .../gcc/{libgcc_9.1.bb => libgcc_9.2.bb}      |  0
 ...{libgfortran_9.1.bb => libgfortran_9.2.bb} |  0
 49 files changed, 206 insertions(+), 160 deletions(-)
 rename meta/recipes-devtools/gcc/{gcc-9.1.inc => gcc-9.2.inc} (94%)
 rename meta/recipes-devtools/gcc/{gcc-9.1 => gcc-9.2}/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch (84%)
 rename meta/recipes-devtools/gcc/{gcc-9.1 => gcc-9.2}/0002-gcc-poison-system-directories.patch (92%)
 rename meta/recipes-devtools/gcc/{gcc-9.1 => gcc-9.2}/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch (95%)
 rename meta/recipes-devtools/gcc/{gcc-9.1 => gcc-9.2}/0004-64-bit-multilib-hack.patch (98%)
 rename meta/recipes-devtools/gcc/{gcc-9.1 => gcc-9.2}/0005-optional-libstdc.patch (92%)
 create mode 100644 meta/recipes-devtools/gcc/gcc-9.2/0006-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
 rename meta/recipes-devtools/gcc/{gcc-9.1 => gcc-9.2}/0007-COLLECT_GCC_OPTIONS.patch (89%)
 rename meta/recipes-devtools/gcc/{gcc-9.1 => gcc-9.2}/0008-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch (94%)
 rename meta/recipes-devtools/gcc/{gcc-9.1 => gcc-9.2}/0009-fortran-cross-compile-hack.patch (88%)
 rename meta/recipes-devtools/gcc/{gcc-9.1 => gcc-9.2}/0010-cpp-honor-sysroot.patch (94%)
 rename meta/recipes-devtools/gcc/{gcc-9.1 => gcc-9.2}/0011-MIPS64-Default-to-N64-ABI.patch (88%)
 rename meta/recipes-devtools/gcc/{gcc-9.1 => gcc-9.2}/0012-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch (92%)
 rename meta/recipes-devtools/gcc/{gcc-9.1 => gcc-9.2}/0013-gcc-Fix-argument-list-too-long-error.patch (89%)
 rename meta/recipes-devtools/gcc/{gcc-9.1 => gcc-9.2}/0014-Disable-sdt.patch (90%)
 rename meta/recipes-devtools/gcc/{gcc-9.1 => gcc-9.2}/0015-libtool.patch (94%)
 rename meta/recipes-devtools/gcc/{gcc-9.1 => gcc-9.2}/0016-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch (95%)
 rename meta/recipes-devtools/gcc/{gcc-9.1 => gcc-9.2}/0017-Use-the-multilib-config-files-from-B-instead-of-usin.patch (94%)
 rename meta/recipes-devtools/gcc/{gcc-9.1 => gcc-9.2}/0018-Avoid-using-libdir-from-.la-which-usually-points-to-.patch (91%)
 rename meta/recipes-devtools/gcc/{gcc-9.1 => gcc-9.2}/0019-export-CPP.patch (95%)
 rename meta/recipes-devtools/gcc/{gcc-9.1 => gcc-9.2}/0020-Ensure-target-gcc-headers-can-be-included.patch (94%)
 rename meta/recipes-devtools/gcc/{gcc-9.1 => gcc-9.2}/0021-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch (96%)
 rename meta/recipes-devtools/gcc/{gcc-9.1 => gcc-9.2}/0022-Don-t-search-host-directory-during-relink-if-inst_pr.patch (93%)
 rename meta/recipes-devtools/gcc/{gcc-9.1 => gcc-9.2}/0023-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch (89%)
 rename meta/recipes-devtools/gcc/{gcc-9.1 => gcc-9.2}/0024-aarch64-Add-support-for-musl-ldso.patch (89%)
 rename meta/recipes-devtools/gcc/{gcc-9.1 => gcc-9.2}/0025-libcc1-fix-libcc1-s-install-path-and-rpath.patch (96%)
 rename meta/recipes-devtools/gcc/{gcc-9.1 => gcc-9.2}/0026-handle-sysroot-support-for-nativesdk-gcc.patch (98%)
 rename meta/recipes-devtools/gcc/{gcc-9.1 => gcc-9.2}/0027-Search-target-sysroot-gcc-version-specific-dirs-with.patch (96%)
 rename meta/recipes-devtools/gcc/{gcc-9.1 => gcc-9.2}/0028-Fix-various-_FOR_BUILD-and-related-variables.patch (95%)
 rename meta/recipes-devtools/gcc/{gcc-9.1 => gcc-9.2}/0029-nios2-Define-MUSL_DYNAMIC_LINKER.patch (91%)
 rename meta/recipes-devtools/gcc/{gcc-9.1 => gcc-9.2}/0030-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch (92%)
 rename meta/recipes-devtools/gcc/{gcc-9.1 => gcc-9.2}/0031-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch (98%)
 rename meta/recipes-devtools/gcc/{gcc-9.1 => gcc-9.2}/0032-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch (92%)
 rename meta/recipes-devtools/gcc/{gcc-9.1 => gcc-9.2}/0033-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch (94%)
 rename meta/recipes-devtools/gcc/{gcc-9.1 => gcc-9.2}/0034-sync-gcc-stddef.h-with-musl.patch (97%)
 rename meta/recipes-devtools/gcc/{gcc-9.1 => gcc-9.2}/0035-fix-segmentation-fault-in-precompiled-header-generat.patch (96%)
 rename meta/recipes-devtools/gcc/{gcc-9.1 => gcc-9.2}/0036-Fix-for-testsuite-failure.patch (99%)
 rename meta/recipes-devtools/gcc/{gcc-9.1 => gcc-9.2}/0037-Re-introduce-spe-commandline-options.patch (90%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_9.1.bb => gcc-cross-canadian_9.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_9.1.bb => gcc-cross_9.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_9.1.bb => gcc-crosssdk_9.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_9.1.bb => gcc-runtime_9.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_9.1.bb => gcc-sanitizers_9.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_9.1.bb => gcc-source_9.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc_9.1.bb => gcc_9.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_9.1.bb => libgcc-initial_9.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_9.1.bb => libgcc_9.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_9.1.bb => libgfortran_9.2.bb} (100%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index a595507948..6a2308d13c 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -200,7 +200,7 @@ RECIPE_MAINTAINER_pn-gcc-crosssdk-initial-${SDK_SYS} = "Khem Raj <raj.khem@gmail
 RECIPE_MAINTAINER_pn-gcc-runtime = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-gcc-sanitizers = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-gcc-source-8.3.0 = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER_pn-gcc-source-9.1.0 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER_pn-gcc-source-9.2.0 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-gccmakedep = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-gconf = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-gcr = "Alexander Kanavin <alex.kanavin@gmail.com>"
diff --git a/meta/recipes-devtools/gcc/gcc-9.1.inc b/meta/recipes-devtools/gcc/gcc-9.2.inc
similarity index 94%
rename from meta/recipes-devtools/gcc/gcc-9.1.inc
rename to meta/recipes-devtools/gcc/gcc-9.2.inc
index 4c648a1694..657b2ef506 100644
--- a/meta/recipes-devtools/gcc/gcc-9.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-9.2.inc
@@ -2,13 +2,13 @@ require gcc-common.inc
 
 # Third digit in PV should be incremented after a minor release
 
-PV = "9.1.0"
+PV = "9.2.0"
 
 # BINV should be incremented to a revision after a minor gcc release
 
-BINV = "9.1.0"
+BINV = "9.2.0"
 
-FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-9.1:${FILE_DIRNAME}/gcc-9.1/backport:"
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-9.2:${FILE_DIRNAME}/gcc-9.2/backport:"
 
 DEPENDS =+ "mpfr gmp libmpc zlib flex-native"
 NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native flex-native"
@@ -65,9 +65,10 @@ SRC_URI = "\
            file://0036-Fix-for-testsuite-failure.patch \
            file://0037-Re-introduce-spe-commandline-options.patch \
 "
-SRC_URI[md5sum] = "6069ae3737cf02bf2cb44a391ef0e937"
-SRC_URI[sha256sum] = "79a66834e96a6050d8fe78db2c3b32fb285b230b855d0a66288235bc04b327a0"
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
+SRC_URI[md5sum] = "3818ad8600447f05349098232c2ddc78"
+SRC_URI[sha256sum] = "ea6ef08f121239da5695f76c9b33637a118dcf63e24164422231917fa61fb206"
+
 # For dev release snapshotting
 #S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/official-gcc-${RELEASE}"
 #B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc-9.2/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
similarity index 84%
rename from meta/recipes-devtools/gcc/gcc-9.1/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
rename to meta/recipes-devtools/gcc/gcc-9.2/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
index 33c910cc53..2d2688e638 100644
--- a/meta/recipes-devtools/gcc/gcc-9.1/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.2/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
@@ -1,4 +1,4 @@
-From f1f6d84aadc4e3cde707b1ec8490f5dc46d4c8e0 Mon Sep 17 00:00:00 2001
+From cd30e99f05792bfbd39afaee8021838afa14050d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 08:37:11 +0400
 Subject: [PATCH 01/37] gcc-4.3.1: ARCH_FLAGS_FOR_TARGET
@@ -12,10 +12,10 @@ Upstream-Status: Inappropriate [embedded specific]
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure b/configure
-index adf4fda0f69..8a04eea4c71 100755
+index abd93a990a9..b121088d778 100755
 --- a/configure
 +++ b/configure
-@@ -7602,7 +7602,7 @@ fi
+@@ -7603,7 +7603,7 @@ fi
  # for target_alias and gcc doesn't manage it consistently.
  target_configargs="--cache-file=./config.cache ${target_configargs}"
  
@@ -25,10 +25,10 @@ index adf4fda0f69..8a04eea4c71 100755
   *" newlib "*)
    case " $target_configargs " in
 diff --git a/configure.ac b/configure.ac
-index 87f2aee0500..01b46b8bed4 100644
+index 9db4fd14aa2..aad93c4d183 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3118,7 +3118,7 @@ fi
+@@ -3119,7 +3119,7 @@ fi
  # for target_alias and gcc doesn't manage it consistently.
  target_configargs="--cache-file=./config.cache ${target_configargs}"
  
@@ -38,5 +38,5 @@ index 87f2aee0500..01b46b8bed4 100644
   *" newlib "*)
    case " $target_configargs " in
 -- 
-2.20.1
+2.22.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0002-gcc-poison-system-directories.patch b/meta/recipes-devtools/gcc/gcc-9.2/0002-gcc-poison-system-directories.patch
similarity index 92%
rename from meta/recipes-devtools/gcc/gcc-9.1/0002-gcc-poison-system-directories.patch
rename to meta/recipes-devtools/gcc/gcc-9.2/0002-gcc-poison-system-directories.patch
index 1231567410..5771891457 100644
--- a/meta/recipes-devtools/gcc/gcc-9.1/0002-gcc-poison-system-directories.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.2/0002-gcc-poison-system-directories.patch
@@ -1,4 +1,4 @@
-From 733ca3372e4125170d4531bcd33e48eeb36bfec0 Mon Sep 17 00:00:00 2001
+From c788de515b743a21005188cff0b7611293c73489 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 08:59:00 +0400
 Subject: [PATCH 02/37] gcc: poison-system-directories
@@ -26,7 +26,7 @@ Upstream-Status: Pending
  7 files changed, 68 insertions(+)
 
 diff --git a/gcc/common.opt b/gcc/common.opt
-index 9a5e9af06ca..211f2b2260e 100644
+index d342c4f3749..c64fd4a6c50 100644
 --- a/gcc/common.opt
 +++ b/gcc/common.opt
 @@ -684,6 +684,10 @@ Wreturn-local-addr
@@ -41,7 +41,7 @@ index 9a5e9af06ca..211f2b2260e 100644
  Common Var(warn_shadow) Warning
  Warn when one variable shadows another.  Same as -Wshadow=global.
 diff --git a/gcc/config.in b/gcc/config.in
-index 48a533bf208..fc3043bbdfb 100644
+index a718ceaf3da..5713342efb1 100644
 --- a/gcc/config.in
 +++ b/gcc/config.in
 @@ -200,6 +200,12 @@
@@ -58,7 +58,7 @@ index 48a533bf208..fc3043bbdfb 100644
     optimizer and back end) to be checked for dynamic type safety at runtime.
     This is quite expensive. */
 diff --git a/gcc/configure b/gcc/configure
-index d6a48ef76e7..2e08396622e 100755
+index 481071b4265..a6ea3a8a84c 100755
 --- a/gcc/configure
 +++ b/gcc/configure
 @@ -995,6 +995,7 @@ with_system_zlib
@@ -78,7 +78,7 @@ index d6a48ef76e7..2e08396622e 100755
    --enable-plugin         enable plugin support
    --enable-host-shared    build host code as shared libraries
    --disable-libquadmath-support
-@@ -29717,6 +29720,19 @@ if test "${enable_version_specific_runtime_libs+set}" = set; then :
+@@ -29750,6 +29753,19 @@ if test "${enable_version_specific_runtime_libs+set}" = set; then :
  fi
  
  
@@ -99,10 +99,10 @@ index d6a48ef76e7..2e08396622e 100755
  
  
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 78370352938..7d34911573e 100644
+index ce2825580c6..d42bbd4fd1c 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -6375,6 +6375,16 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
+@@ -6378,6 +6378,16 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
                  [specify that runtime libraries should be
                   installed in a compiler-specific directory])])
  
@@ -120,10 +120,10 @@ index 78370352938..7d34911573e 100644
  AC_SUBST(subdirs)
  AC_SUBST(srcdir)
 diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
-index 99fd97404e1..001868e1509 100644
+index 6ef36ce02aa..09414d8cc05 100644
 --- a/gcc/doc/invoke.texi
 +++ b/gcc/doc/invoke.texi
-@@ -330,6 +330,7 @@ Objective-C and Objective-C++ Dialects}.
+@@ -332,6 +332,7 @@ Objective-C and Objective-C++ Dialects}.
  -Wpacked  -Wpacked-bitfield-compat -Wpacked-not-aligned  -Wpadded @gol
  -Wparentheses  -Wno-pedantic-ms-format @gol
  -Wplacement-new  -Wplacement-new=@var{n} @gol
@@ -131,7 +131,7 @@ index 99fd97404e1..001868e1509 100644
  -Wpointer-arith  -Wpointer-compare  -Wno-pointer-to-int-cast @gol
  -Wno-pragmas  -Wno-prio-ctor-dtor  -Wredundant-decls @gol
  -Wrestrict  -Wno-return-local-addr @gol
-@@ -6254,6 +6255,14 @@ made up of data only and thus requires no special treatment.  But, for
+@@ -6289,6 +6290,14 @@ made up of data only and thus requires no special treatment.  But, for
  most targets, it is made up of code and thus requires the stack to be
  made executable in order for the program to work properly.
  
@@ -147,7 +147,7 @@ index 99fd97404e1..001868e1509 100644
  @opindex Wfloat-equal
  @opindex Wno-float-equal
 diff --git a/gcc/gcc.c b/gcc/gcc.c
-index 797ed36616f..79c38d858d1 100644
+index 4f57765b012..a2601a6bb06 100644
 --- a/gcc/gcc.c
 +++ b/gcc/gcc.c
 @@ -1042,6 +1042,8 @@ proper position among the other output files.  */
@@ -199,5 +199,5 @@ index bcbe2082905..5752298bbf2 100644
  
  /* Use given -I paths for #include "..." but not #include <...>, and
 -- 
-2.20.1
+2.22.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc-9.2/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
similarity index 95%
rename from meta/recipes-devtools/gcc/gcc-9.1/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
rename to meta/recipes-devtools/gcc/gcc-9.2/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
index 916c374e3e..839ed59180 100644
--- a/meta/recipes-devtools/gcc/gcc-9.1/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.2/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
@@ -1,4 +1,4 @@
-From 320352cc741c89f1a9b2ee7929193d255e65f27a Mon Sep 17 00:00:00 2001
+From e5be0a155f05756bcbbd867920d9d51dca8050aa Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:08:31 +0400
 Subject: [PATCH 03/37] gcc-4.3.3: SYSROOT_CFLAGS_FOR_TARGET
@@ -26,10 +26,10 @@ Upstream-Status: Pending
  1 file changed, 32 insertions(+)
 
 diff --git a/configure b/configure
-index 8a04eea4c71..3b0eed74847 100755
+index b121088d778..93aae5bb26f 100755
 --- a/configure
 +++ b/configure
-@@ -6863,6 +6863,38 @@ fi
+@@ -6864,6 +6864,38 @@ fi
  
  
  
@@ -69,5 +69,5 @@ index 8a04eea4c71..3b0eed74847 100755
  # the named directory are copied to $(tooldir)/sys-include.
  if test x"${with_headers}" != x && test x"${with_headers}" != xno ; then
 -- 
-2.20.1
+2.22.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0004-64-bit-multilib-hack.patch b/meta/recipes-devtools/gcc/gcc-9.2/0004-64-bit-multilib-hack.patch
similarity index 98%
rename from meta/recipes-devtools/gcc/gcc-9.1/0004-64-bit-multilib-hack.patch
rename to meta/recipes-devtools/gcc/gcc-9.2/0004-64-bit-multilib-hack.patch
index 137261b86c..c1c89862bb 100644
--- a/meta/recipes-devtools/gcc/gcc-9.1/0004-64-bit-multilib-hack.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.2/0004-64-bit-multilib-hack.patch
@@ -1,4 +1,4 @@
-From 150d946082b3e21614d1cd0eb4752871495fe519 Mon Sep 17 00:00:00 2001
+From 1436b41b9ff5d7ca83eea3a7106875f2a2487fb1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:10:06 +0400
 Subject: [PATCH 04/37] 64-bit multilib hack.
@@ -115,5 +115,5 @@ index f3c6e2be1d9..bd0393155fa 100644
  rs6000-linux.o: $(srcdir)/config/rs6000/rs6000-linux.c
  	$(COMPILE) $<
 -- 
-2.20.1
+2.22.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0005-optional-libstdc.patch b/meta/recipes-devtools/gcc/gcc-9.2/0005-optional-libstdc.patch
similarity index 92%
rename from meta/recipes-devtools/gcc/gcc-9.1/0005-optional-libstdc.patch
rename to meta/recipes-devtools/gcc/gcc-9.2/0005-optional-libstdc.patch
index d8e970a1aa..09418949ad 100644
--- a/meta/recipes-devtools/gcc/gcc-9.1/0005-optional-libstdc.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.2/0005-optional-libstdc.patch
@@ -1,4 +1,4 @@
-From a3323ea74f0793b35af4a4cdbe5e99fe21e4816b Mon Sep 17 00:00:00 2001
+From 32ce1d674780b2610e3fea4c0466b0900aecad2e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:12:56 +0400
 Subject: [PATCH 05/37] optional libstdc
@@ -25,10 +25,10 @@ Upstream-Status: Inappropriate [embedded specific]
  4 files changed, 37 insertions(+), 1 deletion(-)
 
 diff --git a/gcc/c-family/c.opt b/gcc/c-family/c.opt
-index 88c72c51c21..a7029592aa3 100644
+index 916cc67b453..41619fa591c 100644
 --- a/gcc/c-family/c.opt
 +++ b/gcc/c-family/c.opt
-@@ -1948,6 +1948,10 @@ nostdinc++
+@@ -1952,6 +1952,10 @@ nostdinc++
  C++ ObjC++
  Do not search standard system include directories for C++.
  
@@ -52,10 +52,10 @@ index 6c4574a837d..0e2657f00ee 100644
  	  library = -1;
  	  break;
 diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
-index 001868e1509..4186c2616ab 100644
+index 09414d8cc05..a43969bc9f0 100644
 --- a/gcc/doc/invoke.texi
 +++ b/gcc/doc/invoke.texi
-@@ -226,6 +226,9 @@ in the following sections.
+@@ -228,6 +228,9 @@ in the following sections.
  -fno-weak  -nostdinc++ @gol
  -fvisibility-inlines-hidden @gol
  -fvisibility-ms-compat @gol
@@ -65,7 +65,7 @@ index 001868e1509..4186c2616ab 100644
  -fext-numeric-literals @gol
  -Wabi=@var{n}  -Wabi-tag  -Wconversion-null  -Wctor-dtor-privacy @gol
  -Wdelete-non-virtual-dtor  -Wdeprecated-copy  -Wdeprecated-copy-dtor @gol
-@@ -536,7 +539,7 @@ Objective-C and Objective-C++ Dialects}.
+@@ -538,7 +541,7 @@ Objective-C and Objective-C++ Dialects}.
  -pie  -pthread  -r  -rdynamic @gol
  -s  -static  -static-pie  -static-libgcc  -static-libstdc++ @gol
  -static-libasan  -static-libtsan  -static-liblsan  -static-libubsan @gol
@@ -74,7 +74,7 @@ index 001868e1509..4186c2616ab 100644
  -T @var{script}  -Wl,@var{option}  -Xlinker @var{option} @gol
  -u @var{symbol}  -z @var{keyword}}
  
-@@ -13259,6 +13262,33 @@ Specify that the program entry point is @var{entry}.  The argument is
+@@ -13312,6 +13315,33 @@ Specify that the program entry point is @var{entry}.  The argument is
  interpreted by the linker; the GNU linker accepts either a symbol name
  or an address.
  
@@ -109,7 +109,7 @@ index 001868e1509..4186c2616ab 100644
  @opindex pie
  Produce a dynamically linked position independent executable on targets
 diff --git a/gcc/gcc.c b/gcc/gcc.c
-index 79c38d858d1..308872aef5f 100644
+index a2601a6bb06..cd6c6fc95db 100644
 --- a/gcc/gcc.c
 +++ b/gcc/gcc.c
 @@ -1052,6 +1052,7 @@ proper position among the other output files.  */
@@ -121,5 +121,5 @@ index 79c38d858d1..308872aef5f 100644
  #endif
  
 -- 
-2.20.1
+2.22.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.2/0006-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch b/meta/recipes-devtools/gcc/gcc-9.2/0006-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
new file mode 100644
index 0000000000..4d32fd0f48
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-9.2/0006-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
@@ -0,0 +1,59 @@
+From ef8b45e6c78c839d3974b5b715198e857ac46e60 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 09:14:20 +0400
+Subject: [PATCH 06/37] gcc: disable MASK_RELAX_PIC_CALLS bit
+
+The new feature added after 4.3.3
+"http://www.pubbs.net/200909/gcc/94048-patch-add-support-for-rmipsjalr.html"
+will cause cc1plus eat up all the system memory when build webkit-gtk.
+The function mips_get_pic_call_symbol keeps on recursively calling itself.
+Disable this feature to walk aside the bug.
+
+Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Inappropriate [configuration]
+---
+ gcc/configure    | 7 -------
+ gcc/configure.ac | 7 -------
+ 2 files changed, 14 deletions(-)
+
+diff --git a/gcc/configure b/gcc/configure
+index a6ea3a8a84c..9209718dfca 100755
+--- a/gcc/configure
++++ b/gcc/configure
+@@ -27505,13 +27505,6 @@ $as_echo_n "checking assembler and linker for explicit JALR relocation... " >&6;
+         rm -f conftest.*
+       fi
+     fi
+-    if test $gcc_cv_as_ld_jalr_reloc = yes; then
+-      if test x$target_cpu_default = x; then
+-        target_cpu_default=MASK_RELAX_PIC_CALLS
+-      else
+-        target_cpu_default="($target_cpu_default)|MASK_RELAX_PIC_CALLS"
+-      fi
+-    fi
+     { $as_echo "$as_me:${as_lineno-$LINENO}: result: $gcc_cv_as_ld_jalr_reloc" >&5
+ $as_echo "$gcc_cv_as_ld_jalr_reloc" >&6; }
+ 
+diff --git a/gcc/configure.ac b/gcc/configure.ac
+index d42bbd4fd1c..9e88fc18f55 100644
+--- a/gcc/configure.ac
++++ b/gcc/configure.ac
+@@ -4812,13 +4812,6 @@ x:
+         rm -f conftest.*
+       fi
+     fi
+-    if test $gcc_cv_as_ld_jalr_reloc = yes; then
+-      if test x$target_cpu_default = x; then
+-        target_cpu_default=MASK_RELAX_PIC_CALLS
+-      else
+-        target_cpu_default="($target_cpu_default)|MASK_RELAX_PIC_CALLS"
+-      fi
+-    fi
+     AC_MSG_RESULT($gcc_cv_as_ld_jalr_reloc)
+ 
+     AC_CACHE_CHECK([linker for .eh_frame personality relaxation],
+-- 
+2.22.1
+
diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0007-COLLECT_GCC_OPTIONS.patch b/meta/recipes-devtools/gcc/gcc-9.2/0007-COLLECT_GCC_OPTIONS.patch
similarity index 89%
rename from meta/recipes-devtools/gcc/gcc-9.1/0007-COLLECT_GCC_OPTIONS.patch
rename to meta/recipes-devtools/gcc/gcc-9.2/0007-COLLECT_GCC_OPTIONS.patch
index a522ada448..1deb1a8bd7 100644
--- a/meta/recipes-devtools/gcc/gcc-9.1/0007-COLLECT_GCC_OPTIONS.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.2/0007-COLLECT_GCC_OPTIONS.patch
@@ -1,4 +1,4 @@
-From c7b8c2a6e81daaa50047c336c8ee90086aa4d4d5 Mon Sep 17 00:00:00 2001
+From d0046bb354a23749b2480594de3e064e2d9497ea Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:16:28 +0400
 Subject: [PATCH 07/37] COLLECT_GCC_OPTIONS
@@ -14,7 +14,7 @@ Upstream-Status: Pending
  1 file changed, 9 insertions(+)
 
 diff --git a/gcc/gcc.c b/gcc/gcc.c
-index 308872aef5f..30845e5b125 100644
+index cd6c6fc95db..7da9c5d457b 100644
 --- a/gcc/gcc.c
 +++ b/gcc/gcc.c
 @@ -4804,6 +4804,15 @@ set_collect_gcc_options (void)
@@ -34,5 +34,5 @@ index 308872aef5f..30845e5b125 100644
      {
        const char *const *args;
 -- 
-2.20.1
+2.22.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0008-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch b/meta/recipes-devtools/gcc/gcc-9.2/0008-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
similarity index 94%
rename from meta/recipes-devtools/gcc/gcc-9.1/0008-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
rename to meta/recipes-devtools/gcc/gcc-9.2/0008-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
index 2ef94a0b85..aa588e9279 100644
--- a/meta/recipes-devtools/gcc/gcc-9.1/0008-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.2/0008-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
@@ -1,4 +1,4 @@
-From 2f65b8bbf9c7c4bc0b94bb7ba9f6a8eb8675c9ab Mon Sep 17 00:00:00 2001
+From 09139bbf168c891681caae97eafa29bc853bcbec Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:17:25 +0400
 Subject: [PATCH 08/37] Use the defaults.h in ${B} instead of ${S}, and t-oe in
@@ -27,7 +27,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  4 files changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index 508c674cbdc..3ccff1614bb 100644
+index 5f43d9de00e..41f0f592ff4 100644
 --- a/gcc/Makefile.in
 +++ b/gcc/Makefile.in
 @@ -540,7 +540,7 @@ TARGET_SYSTEM_ROOT = @TARGET_SYSTEM_ROOT@
@@ -40,7 +40,7 @@ index 508c674cbdc..3ccff1614bb 100644
  TM_MULTILIB_CONFIG=@TM_MULTILIB_CONFIG@
  TM_MULTILIB_EXCEPTIONS_CONFIG=@TM_MULTILIB_EXCEPTIONS_CONFIG@
 diff --git a/gcc/configure b/gcc/configure
-index d36cb51bc2c..7acc7e487b0 100755
+index 9209718dfca..0cf73e607a6 100755
 --- a/gcc/configure
 +++ b/gcc/configure
 @@ -12341,8 +12341,8 @@ for f in $tm_file; do
@@ -55,7 +55,7 @@ index d36cb51bc2c..7acc7e487b0 100755
      * )
         tm_file_list="${tm_file_list} \$(srcdir)/config/$f"
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index dfa88c35f3f..f5d5e5c16a8 100644
+index 9e88fc18f55..b01975f075d 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
 @@ -1968,8 +1968,8 @@ for f in $tm_file; do
@@ -92,5 +92,5 @@ index 308b87d0cc1..19068cbc24a 100644
  
  # Add multiple inclusion protection guard, part two.
 -- 
-2.20.1
+2.22.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0009-fortran-cross-compile-hack.patch b/meta/recipes-devtools/gcc/gcc-9.2/0009-fortran-cross-compile-hack.patch
similarity index 88%
rename from meta/recipes-devtools/gcc/gcc-9.1/0009-fortran-cross-compile-hack.patch
rename to meta/recipes-devtools/gcc/gcc-9.2/0009-fortran-cross-compile-hack.patch
index 7959714636..2ce79ae00d 100644
--- a/meta/recipes-devtools/gcc/gcc-9.1/0009-fortran-cross-compile-hack.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.2/0009-fortran-cross-compile-hack.patch
@@ -1,4 +1,4 @@
-From eda94df7d2389b6c36428e5687d5f0722d3375c3 Mon Sep 17 00:00:00 2001
+From a5e780b81d7d7ae6c18d2f4cec9f0d1c58f94bfd Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:20:01 +0400
 Subject: [PATCH 09/37] fortran cross-compile hack.
@@ -16,10 +16,10 @@ Upstream-Status: Inappropriate [embedded specific]
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/libgfortran/configure b/libgfortran/configure
-index 487d8c090e2..a02b49293ac 100755
+index 60867b93d0e..3fc9fca5b7b 100755
 --- a/libgfortran/configure
 +++ b/libgfortran/configure
-@@ -13056,7 +13056,7 @@ esac
+@@ -13071,7 +13071,7 @@ esac
  
  # We need gfortran to compile parts of the library
  #AC_PROG_FC(gfortran)
@@ -29,7 +29,7 @@ index 487d8c090e2..a02b49293ac 100755
  ac_compile='$FC -c $FCFLAGS $ac_fcflags_srcext conftest.$ac_ext >&5'
  ac_link='$FC -o conftest$ac_exeext $FCFLAGS $LDFLAGS $ac_fcflags_srcext conftest.$ac_ext $LIBS >&5'
 diff --git a/libgfortran/configure.ac b/libgfortran/configure.ac
-index c06db7b1a78..5b4b1b7f1f2 100644
+index 7cfce28ab69..6cd515ee1a4 100644
 --- a/libgfortran/configure.ac
 +++ b/libgfortran/configure.ac
 @@ -250,7 +250,7 @@ AC_SUBST(enable_static)
@@ -42,5 +42,5 @@ index c06db7b1a78..5b4b1b7f1f2 100644
  
  # extra LD Flags which are required for targets
 -- 
-2.20.1
+2.22.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0010-cpp-honor-sysroot.patch b/meta/recipes-devtools/gcc/gcc-9.2/0010-cpp-honor-sysroot.patch
similarity index 94%
rename from meta/recipes-devtools/gcc/gcc-9.1/0010-cpp-honor-sysroot.patch
rename to meta/recipes-devtools/gcc/gcc-9.2/0010-cpp-honor-sysroot.patch
index b680e6fc38..ee799f5a80 100644
--- a/meta/recipes-devtools/gcc/gcc-9.1/0010-cpp-honor-sysroot.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.2/0010-cpp-honor-sysroot.patch
@@ -1,4 +1,4 @@
-From c2ec131f19d656fd916c45f51186633c789db6e9 Mon Sep 17 00:00:00 2001
+From daa696ed2c457622f1e1832417fbf61385ec2c83 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:22:00 +0400
 Subject: [PATCH 10/37] cpp: honor sysroot.
@@ -37,7 +37,7 @@ index c6e42eda283..e1ddf066467 100644
 +      "  cc1plus -fpreprocessed %i %I %(cc1_options) %2"
        "  %{!fsyntax-only:%(invoke_as)}}}}", 0, 0, 0},
 diff --git a/gcc/gcc.c b/gcc/gcc.c
-index 30845e5b125..cef26c454d7 100644
+index 7da9c5d457b..4e7c45b268c 100644
 --- a/gcc/gcc.c
 +++ b/gcc/gcc.c
 @@ -1349,7 +1349,7 @@ static const struct compiler default_compilers[] =
@@ -50,5 +50,5 @@ index 30845e5b125..cef26c454d7 100644
    {"@assembler",
     "%{!M:%{!MM:%{!E:%{!S:as %(asm_debug) %(asm_options) %i %A }}}}", 0, 0, 0},
 -- 
-2.20.1
+2.22.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0011-MIPS64-Default-to-N64-ABI.patch b/meta/recipes-devtools/gcc/gcc-9.2/0011-MIPS64-Default-to-N64-ABI.patch
similarity index 88%
rename from meta/recipes-devtools/gcc/gcc-9.1/0011-MIPS64-Default-to-N64-ABI.patch
rename to meta/recipes-devtools/gcc/gcc-9.2/0011-MIPS64-Default-to-N64-ABI.patch
index d59a31be10..e4dd384a3a 100644
--- a/meta/recipes-devtools/gcc/gcc-9.1/0011-MIPS64-Default-to-N64-ABI.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.2/0011-MIPS64-Default-to-N64-ABI.patch
@@ -1,4 +1,4 @@
-From 52b915732de89d8676868641af462df81211bb39 Mon Sep 17 00:00:00 2001
+From 9a7a9adde8d3b443447004d4582648ce9b3cdfb5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:23:08 +0400
 Subject: [PATCH 11/37] MIPS64: Default to N64 ABI
@@ -14,10 +14,10 @@ Upstream-Status: Inappropriate [OE config specific]
  1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/gcc/config.gcc b/gcc/config.gcc
-index a189cb19f63..293ed8d585d 100644
+index ddd3b8f4d9d..fdfc0bd3e82 100644
 --- a/gcc/config.gcc
 +++ b/gcc/config.gcc
-@@ -2267,29 +2267,29 @@ mips*-*-linux*)				# Linux MIPS, either endian.
+@@ -2282,29 +2282,29 @@ mips*-*-linux*)				# Linux MIPS, either endian.
  			default_mips_arch=mips32
  			;;
  		mips64el-st-linux-gnu)
@@ -53,5 +53,5 @@ index a189cb19f63..293ed8d585d 100644
  			;;
  	esac
 -- 
-2.20.1
+2.22.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0012-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc-9.2/0012-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
similarity index 92%
rename from meta/recipes-devtools/gcc/gcc-9.1/0012-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
rename to meta/recipes-devtools/gcc/gcc-9.2/0012-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
index 1ff85c8073..2b1d2de7bb 100644
--- a/meta/recipes-devtools/gcc/gcc-9.1/0012-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.2/0012-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
@@ -1,4 +1,4 @@
-From 0e13b09ae400d8c8755e2869c72a158ed0dbc0b6 Mon Sep 17 00:00:00 2001
+From a9f1802da278f9f3bb9fb822543e7a5b20fbce52 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:24:50 +0400
 Subject: [PATCH 12/37] Define GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
@@ -23,12 +23,11 @@ Upstream-Status: Inappropriate [OE configuration]
  gcc/config/i386/linux64.h    |  6 +++---
  gcc/config/linux.h           |  8 ++++----
  gcc/config/mips/linux.h      | 12 ++++++------
- gcc/config/riscv/linux.h     |  2 +-
  gcc/config/rs6000/linux64.h  | 15 +++++----------
  gcc/config/sh/linux.h        |  2 +-
  gcc/config/sparc/linux.h     |  2 +-
  gcc/config/sparc/linux64.h   |  4 ++--
- 12 files changed, 29 insertions(+), 34 deletions(-)
+ 11 files changed, 28 insertions(+), 33 deletions(-)
 
 diff --git a/gcc/config/alpha/linux-elf.h b/gcc/config/alpha/linux-elf.h
 index 824861befec..6afacce3292 100644
@@ -153,24 +152,11 @@ index 6f79ac9c01a..25de96f9561 100644
  
  #undef MUSL_DYNAMIC_LINKER32
  #define MUSL_DYNAMIC_LINKER32 \
-diff --git a/gcc/config/riscv/linux.h b/gcc/config/riscv/linux.h
-index 58dd18b89f3..112ba9cd764 100644
---- a/gcc/config/riscv/linux.h
-+++ b/gcc/config/riscv/linux.h
-@@ -22,7 +22,7 @@ along with GCC; see the file COPYING3.  If not see
-     GNU_USER_TARGET_OS_CPP_BUILTINS();				\
-   } while (0)
- 
--#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-riscv" XLEN_SPEC "-" ABI_SPEC ".so.1"
-+#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux-riscv" XLEN_SPEC "-" ABI_SPEC ".so.1"
- 
- #define MUSL_ABI_SUFFIX \
-   "%{mabi=ilp32:-sf}" \
 diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
-index 5380f6a6a6f..c0f2dc1f43e 100644
+index 9946d3fed94..45a9a7cae59 100644
 --- a/gcc/config/rs6000/linux64.h
 +++ b/gcc/config/rs6000/linux64.h
-@@ -435,24 +435,19 @@ extern int dot_symbols;
+@@ -423,24 +423,19 @@ extern int dot_symbols;
  #undef	LINK_OS_DEFAULT_SPEC
  #define LINK_OS_DEFAULT_SPEC "%(link_os_linux)"
  
@@ -242,5 +228,5 @@ index 789d1df4bd5..b920c680fb1 100644
  #ifdef SPARC_BI_ARCH
  
 -- 
-2.20.1
+2.22.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0013-gcc-Fix-argument-list-too-long-error.patch b/meta/recipes-devtools/gcc/gcc-9.2/0013-gcc-Fix-argument-list-too-long-error.patch
similarity index 89%
rename from meta/recipes-devtools/gcc/gcc-9.1/0013-gcc-Fix-argument-list-too-long-error.patch
rename to meta/recipes-devtools/gcc/gcc-9.2/0013-gcc-Fix-argument-list-too-long-error.patch
index f853ff90d2..91346e2162 100644
--- a/meta/recipes-devtools/gcc/gcc-9.1/0013-gcc-Fix-argument-list-too-long-error.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.2/0013-gcc-Fix-argument-list-too-long-error.patch
@@ -1,4 +1,4 @@
-From d8a24eca2d7a222d4910c8a508d75d0d1418e201 Mon Sep 17 00:00:00 2001
+From 1053fbeff4297457d6d47e71295442c89c480154 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:26:37 +0400
 Subject: [PATCH 13/37] gcc: Fix argument list too long error.
@@ -23,10 +23,10 @@ Upstream-Status: Pending
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index 3ccff1614bb..88b1aec732b 100644
+index 41f0f592ff4..0064a282488 100644
 --- a/gcc/Makefile.in
 +++ b/gcc/Makefile.in
-@@ -3538,7 +3538,7 @@ install-plugin: installdirs lang.install-plugin s-header-vars install-gengtype
+@@ -3537,7 +3537,7 @@ install-plugin: installdirs lang.install-plugin s-header-vars install-gengtype
  # We keep the directory structure for files in config or c-family and .def
  # files. All other files are flattened to a single directory.
  	$(mkinstalldirs) $(DESTDIR)$(plugin_includedir)
@@ -36,5 +36,5 @@ index 3ccff1614bb..88b1aec732b 100644
  	for file in $$headers; do \
  	  if [ -f $$file ] ; then \
 -- 
-2.20.1
+2.22.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0014-Disable-sdt.patch b/meta/recipes-devtools/gcc/gcc-9.2/0014-Disable-sdt.patch
similarity index 90%
rename from meta/recipes-devtools/gcc/gcc-9.1/0014-Disable-sdt.patch
rename to meta/recipes-devtools/gcc/gcc-9.2/0014-Disable-sdt.patch
index 945cf8f8af..488fe0b64a 100644
--- a/meta/recipes-devtools/gcc/gcc-9.1/0014-Disable-sdt.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.2/0014-Disable-sdt.patch
@@ -1,4 +1,4 @@
-From d5e52580314ef6056ca701fcc030c7c884cb1d7f Mon Sep 17 00:00:00 2001
+From 71fe191d0e8b5666c18194c6e23378d5fcfff097 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:28:10 +0400
 Subject: [PATCH 14/37] Disable sdt.
@@ -25,10 +25,10 @@ Upstream-Status: Inappropriate [hack]
  4 files changed, 19 insertions(+), 19 deletions(-)
 
 diff --git a/gcc/configure b/gcc/configure
-index 7acc7e487b0..6a87ab693ea 100755
+index 0cf73e607a6..bb91f823c74 100755
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -29292,12 +29292,12 @@ fi
+@@ -29325,12 +29325,12 @@ fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking sys/sdt.h in the target C library" >&5
  $as_echo_n "checking sys/sdt.h in the target C library... " >&6; }
  have_sys_sdt_h=no
@@ -48,10 +48,10 @@ index 7acc7e487b0..6a87ab693ea 100755
  $as_echo "$have_sys_sdt_h" >&6; }
  
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index f5d5e5c16a8..a50765171be 100644
+index b01975f075d..06fb00a2e3b 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -5985,15 +5985,15 @@ fi
+@@ -5988,15 +5988,15 @@ fi
  AC_SUBST([enable_default_ssp])
  
  # Test for <sys/sdt.h> on the target.
@@ -77,10 +77,10 @@ index f5d5e5c16a8..a50765171be 100644
  # Check if TFmode long double should be used by default or not.
  # Some glibc targets used DFmode long double, but with glibc 2.4
 diff --git a/libstdc++-v3/configure b/libstdc++-v3/configure
-index 15848e364ab..8d3da1cc526 100755
+index 5acf79cba54..191bc6c5796 100755
 --- a/libstdc++-v3/configure
 +++ b/libstdc++-v3/configure
-@@ -22084,11 +22084,11 @@ ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
+@@ -22085,11 +22085,11 @@ ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
  ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
  ac_compiler_gnu=$ac_cv_c_compiler_gnu
  
@@ -96,7 +96,7 @@ index 15848e364ab..8d3da1cc526 100755
  $as_echo "$glibcxx_cv_sys_sdt_h" >&6; }
  
 diff --git a/libstdc++-v3/configure.ac b/libstdc++-v3/configure.ac
-index ad5b4117cfd..2341645ba6f 100644
+index dadd8827b49..6b1ce9957d3 100644
 --- a/libstdc++-v3/configure.ac
 +++ b/libstdc++-v3/configure.ac
 @@ -230,7 +230,7 @@ GLIBCXX_CHECK_SC_NPROCESSORS_ONLN
@@ -109,5 +109,5 @@ index ad5b4117cfd..2341645ba6f 100644
  # Check for available headers.
  AC_CHECK_HEADERS([endian.h execinfo.h float.h fp.h ieeefp.h inttypes.h \
 -- 
-2.20.1
+2.22.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0015-libtool.patch b/meta/recipes-devtools/gcc/gcc-9.2/0015-libtool.patch
similarity index 94%
rename from meta/recipes-devtools/gcc/gcc-9.1/0015-libtool.patch
rename to meta/recipes-devtools/gcc/gcc-9.2/0015-libtool.patch
index 764460b89e..1a64cb19d3 100644
--- a/meta/recipes-devtools/gcc/gcc-9.1/0015-libtool.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.2/0015-libtool.patch
@@ -1,4 +1,4 @@
-From d7c605d92094c75dc2717d9dd830e525b2c8b0ff Mon Sep 17 00:00:00 2001
+From 1fd2e6c2dba6f6c414b4bb07a7f319d9b4cad4ed Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:29:11 +0400
 Subject: [PATCH 15/37] libtool
@@ -38,5 +38,5 @@ index 79f9ba89af5..8e222f7c16b 100644
        oldlibs=
        if test -z "$rpath"; then
 -- 
-2.20.1
+2.22.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0016-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch b/meta/recipes-devtools/gcc/gcc-9.2/0016-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
similarity index 95%
rename from meta/recipes-devtools/gcc/gcc-9.1/0016-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
rename to meta/recipes-devtools/gcc/gcc-9.2/0016-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
index 398074b5cc..22a2a9405b 100644
--- a/meta/recipes-devtools/gcc/gcc-9.1/0016-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.2/0016-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
@@ -1,4 +1,4 @@
-From c3addf8bc41190d46d98eb7690ff4583eebd5943 Mon Sep 17 00:00:00 2001
+From f0196ab13a9f64d5ccdef2a8595cb437f1300640 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:30:32 +0400
 Subject: [PATCH 16/37] gcc: armv4: pass fix-v4bx to linker to support EABI.
@@ -39,5 +39,5 @@ index e4ade2e2ab0..108863f69d2 100644
  		       LINUX_TARGET_LINK_SPEC " " ANDROID_LINK_SPEC)
  
 -- 
-2.20.1
+2.22.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0017-Use-the-multilib-config-files-from-B-instead-of-usin.patch b/meta/recipes-devtools/gcc/gcc-9.2/0017-Use-the-multilib-config-files-from-B-instead-of-usin.patch
similarity index 94%
rename from meta/recipes-devtools/gcc/gcc-9.1/0017-Use-the-multilib-config-files-from-B-instead-of-usin.patch
rename to meta/recipes-devtools/gcc/gcc-9.2/0017-Use-the-multilib-config-files-from-B-instead-of-usin.patch
index 7d5c94a646..fa6c399942 100644
--- a/meta/recipes-devtools/gcc/gcc-9.1/0017-Use-the-multilib-config-files-from-B-instead-of-usin.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.2/0017-Use-the-multilib-config-files-from-B-instead-of-usin.patch
@@ -1,4 +1,4 @@
-From e1071f4e749586fcb3edcacf43d4dd44081d16ec Mon Sep 17 00:00:00 2001
+From 7b3e6a4ea0d36af7bdf65dc45b84e2af5ccd4cf3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:33:04 +0400
 Subject: [PATCH 17/37] Use the multilib config files from ${B} instead of
@@ -18,7 +18,7 @@ Upstream-Status: Inappropriate [configuration]
  2 files changed, 36 insertions(+), 8 deletions(-)
 
 diff --git a/gcc/configure b/gcc/configure
-index 6a87ab693ea..2e822caf66d 100755
+index bb91f823c74..1ca872ce56c 100755
 --- a/gcc/configure
 +++ b/gcc/configure
 @@ -12321,10 +12321,20 @@ done
@@ -58,7 +58,7 @@ index 6a87ab693ea..2e822caf66d 100755
         f=`echo $f | sed 's/^..//'`
         tm_file_list="${tm_file_list} $f"
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index a50765171be..70e7bac78c4 100644
+index 06fb00a2e3b..486ac6a86d6 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
 @@ -1948,10 +1948,20 @@ done
@@ -98,5 +98,5 @@ index a50765171be..70e7bac78c4 100644
         f=`echo $f | sed 's/^..//'`
         tm_file_list="${tm_file_list} $f"
 -- 
-2.20.1
+2.22.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0018-Avoid-using-libdir-from-.la-which-usually-points-to-.patch b/meta/recipes-devtools/gcc/gcc-9.2/0018-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
similarity index 91%
rename from meta/recipes-devtools/gcc/gcc-9.1/0018-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
rename to meta/recipes-devtools/gcc/gcc-9.2/0018-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
index 596337bc1f..b4f5fb8e2c 100644
--- a/meta/recipes-devtools/gcc/gcc-9.1/0018-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.2/0018-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
@@ -1,4 +1,4 @@
-From 1ffbbb39c9848aa7a04da18fb79b1f0bd7731e00 Mon Sep 17 00:00:00 2001
+From 2de4ff5a14a68adc7011f14aceec882a0d97f9f1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 09:39:38 +0000
 Subject: [PATCH 18/37] Avoid using libdir from .la which usually points to a
@@ -27,5 +27,5 @@ index 8e222f7c16b..0a93b4e5c3b 100644
  	    absdir="$libdir"
  	  fi
 -- 
-2.20.1
+2.22.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0019-export-CPP.patch b/meta/recipes-devtools/gcc/gcc-9.2/0019-export-CPP.patch
similarity index 95%
rename from meta/recipes-devtools/gcc/gcc-9.1/0019-export-CPP.patch
rename to meta/recipes-devtools/gcc/gcc-9.2/0019-export-CPP.patch
index 50d17dd962..0e12bc5450 100644
--- a/meta/recipes-devtools/gcc/gcc-9.1/0019-export-CPP.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.2/0019-export-CPP.patch
@@ -1,4 +1,4 @@
-From 5ece023b88eaba16d8744f8f2ff72345ec3b7f92 Mon Sep 17 00:00:00 2001
+From a83f7a0282aabf7f5e6e59d200b2784b026ddeee Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 09:40:59 +0000
 Subject: [PATCH 19/37] export CPP
@@ -37,7 +37,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/Makefile.in b/Makefile.in
-index 28539a45372..b21e0791f55 100644
+index 64e091ba71d..255822e3f27 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -149,6 +149,7 @@ BUILD_EXPORTS = \
@@ -49,5 +49,5 @@ index 28539a45372..b21e0791f55 100644
  	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
  	CXX="$(CXX_FOR_BUILD)"; export CXX; \
 -- 
-2.20.1
+2.22.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0020-Ensure-target-gcc-headers-can-be-included.patch b/meta/recipes-devtools/gcc/gcc-9.2/0020-Ensure-target-gcc-headers-can-be-included.patch
similarity index 94%
rename from meta/recipes-devtools/gcc/gcc-9.1/0020-Ensure-target-gcc-headers-can-be-included.patch
rename to meta/recipes-devtools/gcc/gcc-9.2/0020-Ensure-target-gcc-headers-can-be-included.patch
index f37c6f39aa..8fccb7f4d6 100644
--- a/meta/recipes-devtools/gcc/gcc-9.1/0020-Ensure-target-gcc-headers-can-be-included.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.2/0020-Ensure-target-gcc-headers-can-be-included.patch
@@ -1,4 +1,4 @@
-From 89f7a8e5c55b31bff011cd7466d78cd84d1eb307 Mon Sep 17 00:00:00 2001
+From 2e9e15b20e831ab73d87a5035b82e10f568c77e9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 10:25:11 +0000
 Subject: [PATCH 20/37] Ensure target gcc headers can be included
@@ -23,7 +23,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  4 files changed, 15 insertions(+), 7 deletions(-)
 
 diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index 88b1aec732b..eb1dc304de2 100644
+index 0064a282488..21472745c2c 100644
 --- a/gcc/Makefile.in
 +++ b/gcc/Makefile.in
 @@ -618,6 +618,7 @@ libexecdir = @libexecdir@
@@ -34,7 +34,7 @@ index 88b1aec732b..eb1dc304de2 100644
  # Directory in which the compiler finds executables
  libexecsubdir = $(libexecdir)/gcc/$(real_target_noncanonical)/$(version)$(accel_dir_suffix)
  # Directory in which all plugin resources are installed
-@@ -2867,6 +2868,7 @@ CFLAGS-intl.o += -DLOCALEDIR=\"$(localedir)\"
+@@ -2866,6 +2867,7 @@ CFLAGS-intl.o += -DLOCALEDIR=\"$(localedir)\"
  
  PREPROCESSOR_DEFINES = \
    -DGCC_INCLUDE_DIR=\"$(libsubdir)/include\" \
@@ -76,7 +76,7 @@ index b7534256119..41ca579b267 100644
 +
  #endif  /* ! GCC_DEFAULTS_H */
 diff --git a/gcc/gcc.c b/gcc/gcc.c
-index cef26c454d7..14b1a6e8c44 100644
+index 4e7c45b268c..1a3704b2763 100644
 --- a/gcc/gcc.c
 +++ b/gcc/gcc.c
 @@ -1470,13 +1470,6 @@ static const char *gcc_libexec_prefix;
@@ -94,5 +94,5 @@ index cef26c454d7..14b1a6e8c44 100644
  #undef MD_EXEC_PREFIX
  #undef MD_STARTFILE_PREFIX
 -- 
-2.20.1
+2.22.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0021-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch b/meta/recipes-devtools/gcc/gcc-9.2/0021-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
similarity index 96%
rename from meta/recipes-devtools/gcc/gcc-9.1/0021-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
rename to meta/recipes-devtools/gcc/gcc-9.2/0021-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
index ef985727a6..6591b76e19 100644
--- a/meta/recipes-devtools/gcc/gcc-9.1/0021-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.2/0021-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
@@ -1,4 +1,4 @@
-From 2a1895aca3d9020d0d5ac74975221727384ef8a6 Mon Sep 17 00:00:00 2001
+From 08b73ca61aa6e925e2929113e1f04a75d75bce05 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 11:17:19 +0000
 Subject: [PATCH 21/37] gcc 4.8+ won't build with --disable-dependency-tracking
@@ -50,5 +50,5 @@ index 29324e3e0ac..d5cdb4259ef 100644
  M_IFUNC = $(if $(PAT_S),$(IFUNC_DEF) $(IFUNC_OPT))
  M_FILE = $(PAT_BASE)_n.c
 -- 
-2.20.1
+2.22.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0022-Don-t-search-host-directory-during-relink-if-inst_pr.patch b/meta/recipes-devtools/gcc/gcc-9.2/0022-Don-t-search-host-directory-during-relink-if-inst_pr.patch
similarity index 93%
rename from meta/recipes-devtools/gcc/gcc-9.1/0022-Don-t-search-host-directory-during-relink-if-inst_pr.patch
rename to meta/recipes-devtools/gcc/gcc-9.2/0022-Don-t-search-host-directory-during-relink-if-inst_pr.patch
index 8316c4d814..7aa3cae3c7 100644
--- a/meta/recipes-devtools/gcc/gcc-9.1/0022-Don-t-search-host-directory-during-relink-if-inst_pr.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.2/0022-Don-t-search-host-directory-during-relink-if-inst_pr.patch
@@ -1,4 +1,4 @@
-From 4b9f8cfbfb48a1a9781b7c3a9b867732ef37b7c5 Mon Sep 17 00:00:00 2001
+From 914a12ce4c2ec9ed943d054a7eb49ee222377474 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 3 Mar 2015 08:21:19 +0000
 Subject: [PATCH 22/37] Don't search host directory during "relink" if
@@ -34,5 +34,5 @@ index 0a93b4e5c3b..6de6ed2f9a0 100644
  		esac
  	      fi
 -- 
-2.20.1
+2.22.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0023-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch b/meta/recipes-devtools/gcc/gcc-9.2/0023-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
similarity index 89%
rename from meta/recipes-devtools/gcc/gcc-9.1/0023-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
rename to meta/recipes-devtools/gcc/gcc-9.2/0023-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
index fdea599abd..c2e14ead8b 100644
--- a/meta/recipes-devtools/gcc/gcc-9.1/0023-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.2/0023-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
@@ -1,4 +1,4 @@
-From 3a554b321250f6ddf1277e5559890ee977e78cb0 Mon Sep 17 00:00:00 2001
+From a12f985730d9853440c5523dfcdabe214b00a992 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 28 Apr 2015 23:15:27 -0700
 Subject: [PATCH 23/37] Use SYSTEMLIBS_DIR replacement instead of hardcoding
@@ -12,7 +12,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64/aarch64-linux.h
-index 9d0292d64f2..51661995fc7 100644
+index 5e8b34ded03..7e628bf661e 100644
 --- a/gcc/config/aarch64/aarch64-linux.h
 +++ b/gcc/config/aarch64/aarch64-linux.h
 @@ -21,7 +21,7 @@
@@ -25,5 +25,5 @@ index 9d0292d64f2..51661995fc7 100644
  #undef MUSL_DYNAMIC_LINKER
  #define MUSL_DYNAMIC_LINKER "/lib/ld-musl-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
 -- 
-2.20.1
+2.22.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0024-aarch64-Add-support-for-musl-ldso.patch b/meta/recipes-devtools/gcc/gcc-9.2/0024-aarch64-Add-support-for-musl-ldso.patch
similarity index 89%
rename from meta/recipes-devtools/gcc/gcc-9.1/0024-aarch64-Add-support-for-musl-ldso.patch
rename to meta/recipes-devtools/gcc/gcc-9.2/0024-aarch64-Add-support-for-musl-ldso.patch
index f53c9949c7..a67e0a850a 100644
--- a/meta/recipes-devtools/gcc/gcc-9.1/0024-aarch64-Add-support-for-musl-ldso.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.2/0024-aarch64-Add-support-for-musl-ldso.patch
@@ -1,4 +1,4 @@
-From b7001034f35e7e5090fa95cb9a622469300cd45d Mon Sep 17 00:00:00 2001
+From 09d3c3125aa1338f627bef8f89c006da920f1e3a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 28 Apr 2015 23:18:39 -0700
 Subject: [PATCH 24/37] aarch64: Add support for musl ldso
@@ -11,7 +11,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64/aarch64-linux.h
-index 51661995fc7..db687f753f6 100644
+index 7e628bf661e..1717cbe5471 100644
 --- a/gcc/config/aarch64/aarch64-linux.h
 +++ b/gcc/config/aarch64/aarch64-linux.h
 @@ -24,7 +24,7 @@
@@ -24,5 +24,5 @@ index 51661995fc7..db687f753f6 100644
  #undef  ASAN_CC1_SPEC
  #define ASAN_CC1_SPEC "%{%:sanitize(address):-funwind-tables}"
 -- 
-2.20.1
+2.22.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0025-libcc1-fix-libcc1-s-install-path-and-rpath.patch b/meta/recipes-devtools/gcc/gcc-9.2/0025-libcc1-fix-libcc1-s-install-path-and-rpath.patch
similarity index 96%
rename from meta/recipes-devtools/gcc/gcc-9.1/0025-libcc1-fix-libcc1-s-install-path-and-rpath.patch
rename to meta/recipes-devtools/gcc/gcc-9.2/0025-libcc1-fix-libcc1-s-install-path-and-rpath.patch
index 7b80655b68..20fe602c41 100644
--- a/meta/recipes-devtools/gcc/gcc-9.1/0025-libcc1-fix-libcc1-s-install-path-and-rpath.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.2/0025-libcc1-fix-libcc1-s-install-path-and-rpath.patch
@@ -1,4 +1,4 @@
-From 4d05ea7a12d1ba4515220c5c16f71ac650219db6 Mon Sep 17 00:00:00 2001
+From bee39216a71b286b2f4174a382c1c56185b84b00 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Sun, 5 Jul 2015 20:25:18 -0700
 Subject: [PATCH 25/37] libcc1: fix libcc1's install path and rpath
@@ -50,5 +50,5 @@ index 7104b649026..2103c477468 100644
  @ENABLE_PLUGIN_TRUE@cc1lib_LTLIBRARIES = libcc1.la
  shared_source = callbacks.cc callbacks.hh connection.cc connection.hh \
 -- 
-2.20.1
+2.22.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0026-handle-sysroot-support-for-nativesdk-gcc.patch b/meta/recipes-devtools/gcc/gcc-9.2/0026-handle-sysroot-support-for-nativesdk-gcc.patch
similarity index 98%
rename from meta/recipes-devtools/gcc/gcc-9.1/0026-handle-sysroot-support-for-nativesdk-gcc.patch
rename to meta/recipes-devtools/gcc/gcc-9.2/0026-handle-sysroot-support-for-nativesdk-gcc.patch
index 7062c03197..c6c669c923 100644
--- a/meta/recipes-devtools/gcc/gcc-9.1/0026-handle-sysroot-support-for-nativesdk-gcc.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.2/0026-handle-sysroot-support-for-nativesdk-gcc.patch
@@ -1,4 +1,4 @@
-From fe175ac845f1ac6965ede0240e9b763ae520614d Mon Sep 17 00:00:00 2001
+From e7425891ee65980ec734383d04810c0fc19c134e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 7 Dec 2015 23:39:54 +0000
 Subject: [PATCH 26/37] handle sysroot support for nativesdk-gcc
@@ -149,7 +149,7 @@ index e2d96f1e760..29fa5f815c8 100644
  				   (see update_path in prefix.c) */
    const char cplusplus;		/* Only look here if we're compiling C++.  */
 diff --git a/gcc/gcc.c b/gcc/gcc.c
-index 14b1a6e8c44..857310092d9 100644
+index 1a3704b2763..db0e2934038 100644
 --- a/gcc/gcc.c
 +++ b/gcc/gcc.c
 @@ -253,6 +253,8 @@ FILE *report_times_to_file = NULL;
@@ -209,5 +209,5 @@ index 14b1a6e8c44..857310092d9 100644
  	    value = do_spec_1 (startfile_spec, 0, NULL);
  	    if (value != 0)
 -- 
-2.20.1
+2.22.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0027-Search-target-sysroot-gcc-version-specific-dirs-with.patch b/meta/recipes-devtools/gcc/gcc-9.2/0027-Search-target-sysroot-gcc-version-specific-dirs-with.patch
similarity index 96%
rename from meta/recipes-devtools/gcc/gcc-9.1/0027-Search-target-sysroot-gcc-version-specific-dirs-with.patch
rename to meta/recipes-devtools/gcc/gcc-9.2/0027-Search-target-sysroot-gcc-version-specific-dirs-with.patch
index e3ec943bfe..9eeb3675af 100644
--- a/meta/recipes-devtools/gcc/gcc-9.1/0027-Search-target-sysroot-gcc-version-specific-dirs-with.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.2/0027-Search-target-sysroot-gcc-version-specific-dirs-with.patch
@@ -1,4 +1,4 @@
-From bf07530706382c90fb89f7d8a727eb9aeb29a56a Mon Sep 17 00:00:00 2001
+From 2c26561402941da0e05a748e875d4e29ad51573a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 7 Dec 2015 23:41:45 +0000
 Subject: [PATCH 27/37] Search target sysroot gcc version specific dirs with
@@ -51,7 +51,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 28 insertions(+), 1 deletion(-)
 
 diff --git a/gcc/gcc.c b/gcc/gcc.c
-index 857310092d9..6363e63b8ff 100644
+index db0e2934038..1c21d1b08eb 100644
 --- a/gcc/gcc.c
 +++ b/gcc/gcc.c
 @@ -2610,7 +2610,7 @@ for_each_path (const struct path_prefix *paths,
@@ -98,5 +98,5 @@ index 857310092d9..6363e63b8ff 100644
  	      ret = callback (path, callback_info);
  	      if (ret)
 -- 
-2.20.1
+2.22.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0028-Fix-various-_FOR_BUILD-and-related-variables.patch b/meta/recipes-devtools/gcc/gcc-9.2/0028-Fix-various-_FOR_BUILD-and-related-variables.patch
similarity index 95%
rename from meta/recipes-devtools/gcc/gcc-9.1/0028-Fix-various-_FOR_BUILD-and-related-variables.patch
rename to meta/recipes-devtools/gcc/gcc-9.2/0028-Fix-various-_FOR_BUILD-and-related-variables.patch
index bdcbd323cb..6480be17c4 100644
--- a/meta/recipes-devtools/gcc/gcc-9.1/0028-Fix-various-_FOR_BUILD-and-related-variables.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.2/0028-Fix-various-_FOR_BUILD-and-related-variables.patch
@@ -1,4 +1,4 @@
-From 16ab14b7221b3491cd43ab745f57b60ca83089df Mon Sep 17 00:00:00 2001
+From 7391dcc950be396ed11cb35763654c63097079f5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 7 Dec 2015 23:42:45 +0000
 Subject: [PATCH 28/37] Fix various _FOR_BUILD and related variables
@@ -26,7 +26,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  5 files changed, 14 insertions(+), 3 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index b21e0791f55..0e573791202 100644
+index 255822e3f27..9dc0dff0474 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -152,6 +152,7 @@ BUILD_EXPORTS = \
@@ -64,7 +64,7 @@ index b21e0791f55..0e573791202 100644
  	"FLEX=$(FLEX)" \
  	"INSTALL=$(INSTALL)" \
 diff --git a/Makefile.tpl b/Makefile.tpl
-index 126296fb49a..15fb236bcc0 100644
+index 41cae58a267..d3f6b79acdc 100644
 --- a/Makefile.tpl
 +++ b/Makefile.tpl
 @@ -154,6 +154,7 @@ BUILD_EXPORTS = \
@@ -94,7 +94,7 @@ index 126296fb49a..15fb236bcc0 100644
  	CFLAGS="$(CFLAGS)"; export CFLAGS; \
  	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
 diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index eb1dc304de2..93a43146846 100644
+index 21472745c2c..8c93f03ffdc 100644
 --- a/gcc/Makefile.in
 +++ b/gcc/Makefile.in
 @@ -805,7 +805,7 @@ BUILD_LDFLAGS=@BUILD_LDFLAGS@
@@ -107,7 +107,7 @@ index eb1dc304de2..93a43146846 100644
  # Actual name to use when installing a native compiler.
  GCC_INSTALL_NAME := $(shell echo gcc|sed '$(program_transform_name)')
 diff --git a/gcc/configure b/gcc/configure
-index 2e822caf66d..2c50676a2bf 100755
+index 1ca872ce56c..28b6112685a 100755
 --- a/gcc/configure
 +++ b/gcc/configure
 @@ -11965,7 +11965,7 @@ else
@@ -120,7 +120,7 @@ index 2e822caf66d..2c50676a2bf 100755
  		--enable-languages=${enable_languages-all} \
  		--target=$target_alias --host=$build_alias --build=$build_alias
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 70e7bac78c4..d29eb580429 100644
+index 486ac6a86d6..33b0fcf0f43 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
 @@ -1743,7 +1743,7 @@ else
@@ -133,5 +133,5 @@ index 70e7bac78c4..d29eb580429 100644
  		--enable-languages=${enable_languages-all} \
  		--target=$target_alias --host=$build_alias --build=$build_alias
 -- 
-2.20.1
+2.22.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0029-nios2-Define-MUSL_DYNAMIC_LINKER.patch b/meta/recipes-devtools/gcc/gcc-9.2/0029-nios2-Define-MUSL_DYNAMIC_LINKER.patch
similarity index 91%
rename from meta/recipes-devtools/gcc/gcc-9.1/0029-nios2-Define-MUSL_DYNAMIC_LINKER.patch
rename to meta/recipes-devtools/gcc/gcc-9.2/0029-nios2-Define-MUSL_DYNAMIC_LINKER.patch
index 08da1ab986..0c74adcbf5 100644
--- a/meta/recipes-devtools/gcc/gcc-9.1/0029-nios2-Define-MUSL_DYNAMIC_LINKER.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.2/0029-nios2-Define-MUSL_DYNAMIC_LINKER.patch
@@ -1,4 +1,4 @@
-From e293df9a5734b43cb60cc47a3f5ff9af50fee3aa Mon Sep 17 00:00:00 2001
+From 4b3be4154f6143300c2a579e979bee083eb8387b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 2 Feb 2016 10:26:10 -0800
 Subject: [PATCH 29/37] nios2: Define MUSL_DYNAMIC_LINKER
@@ -24,5 +24,5 @@ index 698734add35..eeee60ecfea 100644
  #undef LINK_SPEC
  #define LINK_SPEC LINK_SPEC_ENDIAN \
 -- 
-2.20.1
+2.22.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0030-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch b/meta/recipes-devtools/gcc/gcc-9.2/0030-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
similarity index 92%
rename from meta/recipes-devtools/gcc/gcc-9.1/0030-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
rename to meta/recipes-devtools/gcc/gcc-9.2/0030-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
index 792e852614..83662d8022 100644
--- a/meta/recipes-devtools/gcc/gcc-9.1/0030-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.2/0030-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
@@ -1,4 +1,4 @@
-From 6232013df7fd65c994869789fa4b93c8d2303d1c Mon Sep 17 00:00:00 2001
+From 7402c1ab357bd7cba2b5c6c6a0ca9005b131b521 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 27 Jun 2017 18:10:54 -0700
 Subject: [PATCH 30/37] Add ssp_nonshared to link commandline for musl targets
@@ -41,10 +41,10 @@ index 4b05d8e93d1..0ca117e2ed4 100644
  
  #if (DEFAULT_LIBC == LIBC_UCLIBC) && defined (SINGLE_LIBC) /* uClinux */
 diff --git a/gcc/config/rs6000/linux.h b/gcc/config/rs6000/linux.h
-index 96b97877989..0bbde54c844 100644
+index ffceb32bf65..c82cb2ad05b 100644
 --- a/gcc/config/rs6000/linux.h
 +++ b/gcc/config/rs6000/linux.h
-@@ -107,6 +107,16 @@
+@@ -94,6 +94,16 @@
  					 " -m elf32ppclinux")
  #endif
  
@@ -62,10 +62,10 @@ index 96b97877989..0bbde54c844 100644
  #define LINK_OS_LINUX_SPEC LINK_OS_LINUX_EMUL " %{!shared: %{!static: \
    %{!static-pie: \
 diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
-index 982ca274621..83c07b275da 100644
+index 45a9a7cae59..d1e88a40e82 100644
 --- a/gcc/config/rs6000/linux64.h
 +++ b/gcc/config/rs6000/linux64.h
-@@ -461,6 +461,16 @@ extern int dot_symbols;
+@@ -456,6 +456,16 @@ extern int dot_symbols;
  					   " -m elf64ppc")
  #endif
  
@@ -83,5 +83,5 @@ index 982ca274621..83c07b275da 100644
    %{!static-pie: \
      %{rdynamic:-export-dynamic} \
 -- 
-2.20.1
+2.22.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0031-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch b/meta/recipes-devtools/gcc/gcc-9.2/0031-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
similarity index 98%
rename from meta/recipes-devtools/gcc/gcc-9.1/0031-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
rename to meta/recipes-devtools/gcc/gcc-9.2/0031-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
index efa40bec5e..2903e3ebd5 100644
--- a/meta/recipes-devtools/gcc/gcc-9.1/0031-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.2/0031-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
@@ -1,4 +1,4 @@
-From 1877b2ee5835a3716e6544706fbccd8c656e0a32 Mon Sep 17 00:00:00 2001
+From dd988e9608a4c28f6a68da359e3cea7664de4de0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Apr 2016 20:03:28 +0000
 Subject: [PATCH 31/37] libgcc: Add knob to use ldbl-128 on ppc
@@ -121,5 +121,5 @@ index 8e96cafdf8b..9247856bf24 100644
  [AS_HELP_STRING([--with-aix-soname=aix|svr4|both],
      [shared library versioning (aka "SONAME") variant to provide on AIX])],
 -- 
-2.20.1
+2.22.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0032-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch b/meta/recipes-devtools/gcc/gcc-9.2/0032-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
similarity index 92%
rename from meta/recipes-devtools/gcc/gcc-9.1/0032-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
rename to meta/recipes-devtools/gcc/gcc-9.2/0032-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
index 3de8345f93..048122c531 100644
--- a/meta/recipes-devtools/gcc/gcc-9.1/0032-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.2/0032-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
@@ -1,4 +1,4 @@
-From 9d76a765a12677597134953352b25dc16dea721e Mon Sep 17 00:00:00 2001
+From 0b72ac0f4bb6e20f294851fe553a4549a8992976 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 4 May 2016 21:11:34 -0700
 Subject: [PATCH 32/37] Link libgcc using LDFLAGS, not just SHLIB_LDFLAGS
@@ -25,5 +25,5 @@ index 099bf23e62f..436b277a79f 100644
  	$(SHLIB_OBJS) $(SHLIB_LC) && \
  	rm -f $(SHLIB_DIR)/$(SHLIB_SOLINK) && \
 -- 
-2.20.1
+2.22.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0033-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch b/meta/recipes-devtools/gcc/gcc-9.2/0033-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
similarity index 94%
rename from meta/recipes-devtools/gcc/gcc-9.1/0033-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
rename to meta/recipes-devtools/gcc/gcc-9.2/0033-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
index d8cc643211..cd78d2746e 100644
--- a/meta/recipes-devtools/gcc/gcc-9.1/0033-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.2/0033-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
@@ -1,4 +1,4 @@
-From 6c001e08bcd0568367a4aa2f991ab7d85b43a43d Mon Sep 17 00:00:00 2001
+From 42390d7778a43176e91949e6dc38851c19473b24 Mon Sep 17 00:00:00 2001
 From: Szabolcs Nagy <nsz@port70.net>
 Date: Sat, 24 Oct 2015 20:09:53 +0000
 Subject: [PATCH 33/37] libgcc_s: Use alias for __cpu_indicator_init instead of
@@ -39,10 +39,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  3 files changed, 6 insertions(+), 6 deletions(-)
 
 diff --git a/gcc/config/i386/i386.c b/gcc/config/i386/i386.c
-index 88557f26c44..839308e2799 100644
+index 2b37296e537..dd380ddba88 100644
 --- a/gcc/config/i386/i386.c
 +++ b/gcc/config/i386/i386.c
-@@ -36577,10 +36577,10 @@ ix86_expand_builtin (tree exp, rtx target, rtx subtarget,
+@@ -36658,10 +36658,10 @@ ix86_expand_builtin (tree exp, rtx target, rtx subtarget,
      {
      case IX86_BUILTIN_CPU_INIT:
        {
@@ -82,5 +82,5 @@ index 8506a635790..564296f788e 100644
 +HOST_LIBGCC2_CFLAGS += -mlong-double-80 $(CET_FLAGS)
  CRTSTUFF_T_CFLAGS += $(CET_FLAGS)
 -- 
-2.20.1
+2.22.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0034-sync-gcc-stddef.h-with-musl.patch b/meta/recipes-devtools/gcc/gcc-9.2/0034-sync-gcc-stddef.h-with-musl.patch
similarity index 97%
rename from meta/recipes-devtools/gcc/gcc-9.1/0034-sync-gcc-stddef.h-with-musl.patch
rename to meta/recipes-devtools/gcc/gcc-9.2/0034-sync-gcc-stddef.h-with-musl.patch
index a2c35ab537..969c720508 100644
--- a/meta/recipes-devtools/gcc/gcc-9.1/0034-sync-gcc-stddef.h-with-musl.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.2/0034-sync-gcc-stddef.h-with-musl.patch
@@ -1,4 +1,4 @@
-From 83ba95929c5908ae0f51ce148a30f85b085a178a Mon Sep 17 00:00:00 2001
+From 2c03fd98863513a97871864693f11f057899160d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 3 Feb 2017 12:56:00 -0800
 Subject: [PATCH 34/37] sync gcc stddef.h with musl
@@ -87,5 +87,5 @@ index da692e1c01a..9a00c261adb 100644
  #endif /* _STDDEF_H or __need_wchar_t.  */
  
 -- 
-2.20.1
+2.22.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0035-fix-segmentation-fault-in-precompiled-header-generat.patch b/meta/recipes-devtools/gcc/gcc-9.2/0035-fix-segmentation-fault-in-precompiled-header-generat.patch
similarity index 96%
rename from meta/recipes-devtools/gcc/gcc-9.1/0035-fix-segmentation-fault-in-precompiled-header-generat.patch
rename to meta/recipes-devtools/gcc/gcc-9.2/0035-fix-segmentation-fault-in-precompiled-header-generat.patch
index ad1f6e7d10..a6f4ad3077 100644
--- a/meta/recipes-devtools/gcc/gcc-9.1/0035-fix-segmentation-fault-in-precompiled-header-generat.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.2/0035-fix-segmentation-fault-in-precompiled-header-generat.patch
@@ -1,4 +1,4 @@
-From c4f89e62c56975fee99304c9cbbe5be6e8bc9ed6 Mon Sep 17 00:00:00 2001
+From c9228d8ce3b0a7a6954c44b24f94433a77d74381 Mon Sep 17 00:00:00 2001
 From: Juro Bystricky <juro.bystricky@intel.com>
 Date: Mon, 19 Mar 2018 22:31:20 -0700
 Subject: [PATCH 35/37] fix segmentation fault in precompiled header generation
@@ -56,5 +56,5 @@ index eedfcbb3146..15040a1b1f0 100644
  	buffer = _cpp_spell_ident_ucns (buffer, token->val.node.node);
        break;
 -- 
-2.20.1
+2.22.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0036-Fix-for-testsuite-failure.patch b/meta/recipes-devtools/gcc/gcc-9.2/0036-Fix-for-testsuite-failure.patch
similarity index 99%
rename from meta/recipes-devtools/gcc/gcc-9.1/0036-Fix-for-testsuite-failure.patch
rename to meta/recipes-devtools/gcc/gcc-9.2/0036-Fix-for-testsuite-failure.patch
index 4fb0698afc..5cff39e842 100644
--- a/meta/recipes-devtools/gcc/gcc-9.1/0036-Fix-for-testsuite-failure.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.2/0036-Fix-for-testsuite-failure.patch
@@ -1,4 +1,4 @@
-From 8d773b5ba6cf396ca76611963127ba2b516272b3 Mon Sep 17 00:00:00 2001
+From 11474640ef2662b44c1e890d76a4d0a0003f0a4a Mon Sep 17 00:00:00 2001
 From: RAGHUNATH LOLUR <raghunath.lolur@kpit.com>
 Date: Wed, 6 Dec 2017 22:52:26 -0800
 Subject: [PATCH 36/37] Fix for testsuite failure
@@ -139,7 +139,7 @@ index ea896b7ebfd..bf15569b826 100644
  #include "funcspec-56.inc"
  
 diff --git a/gcc/testsuite/gcc.target/i386/interrupt-387-err-1.c b/gcc/testsuite/gcc.target/i386/interrupt-387-err-1.c
-index 3fbdc881dda..6b4d9d1252a 100644
+index 8561a3c26d6..6377f814645 100644
 --- a/gcc/testsuite/gcc.target/i386/interrupt-387-err-1.c
 +++ b/gcc/testsuite/gcc.target/i386/interrupt-387-err-1.c
 @@ -1,5 +1,5 @@
@@ -254,5 +254,5 @@ index 6cda1534311..26e37f5b8ba 100644
  __attribute__((vector_size((elcount)*sizeof(type)))) type
  
 -- 
-2.20.1
+2.22.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0037-Re-introduce-spe-commandline-options.patch b/meta/recipes-devtools/gcc/gcc-9.2/0037-Re-introduce-spe-commandline-options.patch
similarity index 90%
rename from meta/recipes-devtools/gcc/gcc-9.1/0037-Re-introduce-spe-commandline-options.patch
rename to meta/recipes-devtools/gcc/gcc-9.2/0037-Re-introduce-spe-commandline-options.patch
index 251097e131..e62e18d443 100644
--- a/meta/recipes-devtools/gcc/gcc-9.1/0037-Re-introduce-spe-commandline-options.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.2/0037-Re-introduce-spe-commandline-options.patch
@@ -1,4 +1,4 @@
-From 49d3dbe240226206d09ff646499cd398cb60bd12 Mon Sep 17 00:00:00 2001
+From 4dfcfd0e8282c833e70c927ad67a6274d5e0436d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 6 Jun 2018 12:10:22 -0700
 Subject: [PATCH 37/37] Re-introduce spe commandline options
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 12 insertions(+)
 
 diff --git a/gcc/config/rs6000/rs6000.opt b/gcc/config/rs6000/rs6000.opt
-index 2e90bf37747..ebd297da46b 100644
+index f4b5c91e11f..69869350fce 100644
 --- a/gcc/config/rs6000/rs6000.opt
 +++ b/gcc/config/rs6000/rs6000.opt
 @@ -345,6 +345,18 @@ mdebug=
@@ -37,5 +37,5 @@ index 2e90bf37747..ebd297da46b 100644
  Target RejectNegative Var(rs6000_altivec_abi) Save
  Use the AltiVec ABI extensions.
 -- 
-2.20.1
+2.22.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_9.1.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_9.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-canadian_9.1.bb
rename to meta/recipes-devtools/gcc/gcc-cross-canadian_9.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross_9.1.bb b/meta/recipes-devtools/gcc/gcc-cross_9.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross_9.1.bb
rename to meta/recipes-devtools/gcc/gcc-cross_9.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_9.1.bb b/meta/recipes-devtools/gcc/gcc-crosssdk_9.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk_9.1.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk_9.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_9.1.bb b/meta/recipes-devtools/gcc/gcc-runtime_9.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-runtime_9.1.bb
rename to meta/recipes-devtools/gcc/gcc-runtime_9.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_9.1.bb b/meta/recipes-devtools/gcc/gcc-sanitizers_9.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-sanitizers_9.1.bb
rename to meta/recipes-devtools/gcc/gcc-sanitizers_9.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-source_9.1.bb b/meta/recipes-devtools/gcc/gcc-source_9.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-source_9.1.bb
rename to meta/recipes-devtools/gcc/gcc-source_9.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc_9.1.bb b/meta/recipes-devtools/gcc/gcc_9.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc_9.1.bb
rename to meta/recipes-devtools/gcc/gcc_9.2.bb
diff --git a/meta/recipes-devtools/gcc/libgcc-initial_9.1.bb b/meta/recipes-devtools/gcc/libgcc-initial_9.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc-initial_9.1.bb
rename to meta/recipes-devtools/gcc/libgcc-initial_9.2.bb
diff --git a/meta/recipes-devtools/gcc/libgcc_9.1.bb b/meta/recipes-devtools/gcc/libgcc_9.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc_9.1.bb
rename to meta/recipes-devtools/gcc/libgcc_9.2.bb
diff --git a/meta/recipes-devtools/gcc/libgfortran_9.1.bb b/meta/recipes-devtools/gcc/libgfortran_9.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgfortran_9.1.bb
rename to meta/recipes-devtools/gcc/libgfortran_9.2.bb
-- 
2.22.1


