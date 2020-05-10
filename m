Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
 by mx.groups.io with SMTP id smtpd.web12.21214.1589139945109366944
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 May 2020 12:45:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=A9foNh78;
 spf=pass (domain: gmail.com, ip: 209.85.210.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f193.google.com with SMTP id x77so3740301pfc.0
        for <openembedded-core@lists.openembedded.org>; Sun, 10 May 2020 12:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qBX3WPnE3cbZXGrAu5/kpafJETC/HAeq2U5pIyPVKKk=;
        b=A9foNh782uBOQSB4WhZPW5R6ewwhHet/JB1hUW40esW0CIhjEjIfsF1E/+DlTDHu62
         +/kBQs5kmDuZetxdgD4uXoNGRlCWD7NKLNl+Ly1lTmX0gVq89UdR5Cn3ukA9vwjQjXv7
         hANVYeaX18x5HQYc8zM7UNRsJuWBwsQzLafR4dFb9kgN1HQuqofykZJcXgHgfU1XMOuU
         7wWB4lzA0NUSG7sVyEGuoPXDJGPUgZi6obMeEhHGJ4zichMpdl82c2McUz4baJnbJfMB
         fTebpWQU4Oy98Rvxz/iIR0Lx8VB77hsj42c7Zdz3INmMvJXgUbkW2Gb4+vKn/f1Lguio
         WmgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qBX3WPnE3cbZXGrAu5/kpafJETC/HAeq2U5pIyPVKKk=;
        b=V3oZENY/7+cGngzwlla6eOncNzeKkxcyt43AxG4x9gJGrM349AF50tv/Lv1GppGj3f
         pC7wOET7y8IA/2LM8X5VjB7m0pYxB2LSO4u4pjuUfVdPfNv6Q1NalBwykh6/QbDGNok+
         iORLInFxmFESdOTvJ6YXI6TZOSX8+JPkSaAPlDiVSxFI1jeyvROhhLkarOIeC88qLw5o
         TEa2vX0p+JbhxSeX4RvPoW5XfV2u5FCWB0v2Whk6bYzXBAgMCwfcmEnu3etpcOUeaN4C
         ZnzVZeEvUH3AWIQRO5QExcaSkUzMQkCedS+d9bE6L04UPhqoPJVHKzZySAIAEPB0c6bH
         Dj4Q==
X-Gm-Message-State: AGi0PuZX28rNrys2j9b0C+1zV9GN1dEJMNW9PTe3hKaIe2U6pEUXi0od
	ka/OcV3lMJilXEGEveRVH9Z7vi2y1b4=
X-Google-Smtp-Source: APiQypK02/L73t2s8XwzYGd70J4sjc4TXBBK4dQqr/6N00HcHQ+nZonsiUtyujXlOY6y45yx0nS+QA==
X-Received: by 2002:a63:5952:: with SMTP id j18mr11435087pgm.272.1589139940944;
        Sun, 10 May 2020 12:45:40 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::8caf])
        by smtp.gmail.com with ESMTPSA id x19sm7303796pfq.137.2020.05.10.12.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2020 12:45:40 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] gcc10: Update to GCC 10.1 Release
Date: Sun, 10 May 2020 12:45:36 -0700
Message-Id: <20200510194537.3265782-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* Package new gomp header acc_prof.h
* Package lto-dump which is a new tool in gcc10
* All Changes are here [1]
* Porting apps to gcc 10 help is here [2]

[1] https://gcc.gnu.org/gcc-10/changes.html
[2] https://gcc.gnu.org/gcc-10/porting_to.html

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |   2 +-
 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 .../gcc/{gcc-9.3.inc => gcc-10.1.inc}         |  49 ++++----
 ...0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch |  15 +--
 .../0002-gcc-poison-system-directories.patch  |  47 ++++----
 ...-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |  11 +-
 .../0004-64-bit-multilib-hack.patch           |  15 +--
 .../0005-optional-libstdc.patch               |  29 ++---
 .../0006-COLLECT_GCC_OPTIONS.patch            |  11 +-
 ...ts.h-in-B-instead-of-S-and-t-oe-in-B.patch |  20 ++--
 .../0008-fortran-cross-compile-hack.patch     |  15 +--
 .../0009-cpp-honor-sysroot.patch              |  13 +-
 .../0010-MIPS64-Default-to-N64-ABI.patch      |  11 +-
 ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |  33 +++---
 ...gcc-Fix-argument-list-too-long-error.patch |  11 +-
 .../0013-Disable-sdt.patch                    |  23 ++--
 .../{gcc-9.3 => gcc-10.1}/0014-libtool.patch  |   9 +-
 ...s-fix-v4bx-to-linker-to-support-EABI.patch |  11 +-
 ...-config-files-from-B-instead-of-usin.patch |  25 ++--
 ...ir-from-.la-which-usually-points-to-.patch |  11 +-
 .../0018-export-CPP.patch                     |   9 +-
 ...e-target-gcc-headers-can-be-included.patch |  13 +-
 ...-directory-during-relink-if-inst_pr.patch} |  11 +-
 ...R-replacement-instead-of-hardcoding.patch} |   9 +-
 ...2-aarch64-Add-support-for-musl-ldso.patch} |   9 +-
 ...fix-libcc1-s-install-path-and-rpath.patch} |   9 +-
 ...e-sysroot-support-for-nativesdk-gcc.patch} | 112 +++++++++---------
 ...root-gcc-version-specific-dirs-with.patch} |  13 +-
 ...us-_FOR_BUILD-and-related-variables.patch} |  27 ++---
 ...27-nios2-Define-MUSL_DYNAMIC_LINKER.patch} |   9 +-
 ...-to-link-commandline-for-musl-targe.patch} |  15 +--
 ...sing-LDFLAGS-not-just-SHLIB_LDFLAGS.patch} |   9 +-
 .../0030-sync-gcc-stddef.h-with-musl.patch}   |   9 +-
 ...fault-in-precompiled-header-generat.patch} |  11 +-
 .../0032-Fix-for-testsuite-failure.patch}     |   9 +-
 ...e-introduce-spe-commandline-options.patch} |  11 +-
 ...s-for-__cpu_indicator_init-instead-.patch} |  29 ++---
 ...-Do-not-use-__LINE__-for-maintainin.patch} |  55 ++++-----
 ...ild-with-disable-dependency-tracking.patch |  54 ---------
 .../gcc/gcc-9.3/0030-ldbl128-config.patch     |  79 ------------
 ...heck-zero-value-in-simple_object_elf.patch |  48 --------
 ...ands-Don-t-match-user-defined-regs-o.patch | 100 ----------------
 ...dian_9.3.bb => gcc-cross-canadian_10.1.bb} |   0
 .../{gcc-cross_9.3.bb => gcc-cross_10.1.bb}   |   0
 ...c-crosssdk_9.3.bb => gcc-crosssdk_10.1.bb} |   0
 meta/recipes-devtools/gcc/gcc-runtime.inc     |   1 +
 ...gcc-runtime_9.3.bb => gcc-runtime_10.1.bb} |   0
 ...nitizers_9.3.bb => gcc-sanitizers_10.1.bb} |   0
 .../{gcc-source_9.3.bb => gcc-source_10.1.bb} |   0
 meta/recipes-devtools/gcc/gcc-target.inc      |   1 +
 .../gcc/{gcc_9.3.bb => gcc_10.1.bb}           |   0
 ...-initial_9.3.bb => libgcc-initial_10.1.bb} |   0
 .../gcc/{libgcc_9.3.bb => libgcc_10.1.bb}     |   0
 ...libgfortran_9.3.bb => libgfortran_10.1.bb} |   0
 meta/recipes-support/icu/icu/filter.json      |   6 +
 55 files changed, 320 insertions(+), 701 deletions(-)
 rename meta/recipes-devtools/gcc/{gcc-9.3.inc => gcc-10.1.inc} (65%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-10.1}/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch (79%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-10.1}/0002-gcc-poison-system-directories.patch (85%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-10.1}/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch (92%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-10.1}/0004-64-bit-multilib-hack.patch (95%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-10.1}/0005-optional-libstdc.patch (86%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-10.1}/0006-COLLECT_GCC_OPTIONS.patch (80%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-10.1}/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch (87%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-10.1}/0008-fortran-cross-compile-hack.patch (81%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-10.1}/0009-cpp-honor-sysroot.patch (87%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-10.1}/0010-MIPS64-Default-to-N64-ABI.patch (85%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-10.1}/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch (93%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-10.1}/0012-gcc-Fix-argument-list-too-long-error.patch (85%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-10.1}/0013-Disable-sdt.patch (88%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-10.1}/0014-libtool.patch (87%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-10.1}/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch (87%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-10.1}/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch (81%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-10.1}/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch (76%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-10.1}/0018-export-CPP.patch (93%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-10.1}/0019-Ensure-target-gcc-headers-can-be-included.patch (88%)
 rename meta/recipes-devtools/gcc/{gcc-9.3/0021-Don-t-search-host-directory-during-relink-if-inst_pr.patch => gcc-10.1/0020-Don-t-search-host-directory-during-relink-if-inst_pr.patch} (80%)
 rename meta/recipes-devtools/gcc/{gcc-9.3/0022-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch => gcc-10.1/0021-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch} (81%)
 rename meta/recipes-devtools/gcc/{gcc-9.3/0023-aarch64-Add-support-for-musl-ldso.patch => gcc-10.1/0022-aarch64-Add-support-for-musl-ldso.patch} (83%)
 rename meta/recipes-devtools/gcc/{gcc-9.3/0024-libcc1-fix-libcc1-s-install-path-and-rpath.patch => gcc-10.1/0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch} (91%)
 rename meta/recipes-devtools/gcc/{gcc-9.3/0025-handle-sysroot-support-for-nativesdk-gcc.patch => gcc-10.1/0024-handle-sysroot-support-for-nativesdk-gcc.patch} (84%)
 rename meta/recipes-devtools/gcc/{gcc-9.3/0026-Search-target-sysroot-gcc-version-specific-dirs-with.patch => gcc-10.1/0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch} (90%)
 rename meta/recipes-devtools/gcc/{gcc-9.3/0027-Fix-various-_FOR_BUILD-and-related-variables.patch => gcc-10.1/0026-Fix-various-_FOR_BUILD-and-related-variables.patch} (89%)
 rename meta/recipes-devtools/gcc/{gcc-9.3/0028-nios2-Define-MUSL_DYNAMIC_LINKER.patch => gcc-10.1/0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch} (79%)
 rename meta/recipes-devtools/gcc/{gcc-9.3/0029-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch => gcc-10.1/0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch} (89%)
 rename meta/recipes-devtools/gcc/{gcc-9.3/0031-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch => gcc-10.1/0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch} (80%)
 rename meta/recipes-devtools/gcc/{gcc-9.3/0033-sync-gcc-stddef.h-with-musl.patch => gcc-10.1/0030-sync-gcc-stddef.h-with-musl.patch} (93%)
 rename meta/recipes-devtools/gcc/{gcc-9.3/0034-fix-segmentation-fault-in-precompiled-header-generat.patch => gcc-10.1/0031-fix-segmentation-fault-in-precompiled-header-generat.patch} (86%)
 rename meta/recipes-devtools/gcc/{gcc-9.3/0035-Fix-for-testsuite-failure.patch => gcc-10.1/0032-Fix-for-testsuite-failure.patch} (98%)
 rename meta/recipes-devtools/gcc/{gcc-9.3/0036-Re-introduce-spe-commandline-options.patch => gcc-10.1/0033-Re-introduce-spe-commandline-options.patch} (81%)
 rename meta/recipes-devtools/gcc/{gcc-9.3/0032-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch => gcc-10.1/0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch} (77%)
 rename meta/recipes-devtools/gcc/{gcc-9.3/0038-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch => gcc-10.1/0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch} (80%)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0020-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0030-ldbl128-config.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0037-CVE-2019-14250-Check-zero-value-in-simple_object_elf.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0039-process_alt_operands-Don-t-match-user-defined-regs-o.patch
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_9.3.bb => gcc-cross-canadian_10.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_9.3.bb => gcc-cross_10.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_9.3.bb => gcc-crosssdk_10.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_9.3.bb => gcc-runtime_10.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_9.3.bb => gcc-sanitizers_10.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_9.3.bb => gcc-source_10.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc_9.3.bb => gcc_10.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_9.3.bb => libgcc-initial_10.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_9.3.bb => libgcc_10.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_9.3.bb => libgfortran_10.1.bb} (100%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 6dc6baf9f0..dc2ec131b3 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -193,7 +193,7 @@ RECIPE_MAINTAINER_pn-gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Khem Raj <r
 RECIPE_MAINTAINER_pn-gcc-crosssdk-${SDK_SYS} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-gcc-runtime = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-gcc-sanitizers = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER_pn-gcc-source-9.3.0 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER_pn-gcc-source-10.0.1 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-gconf = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-gcr = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-gdb = "Khem Raj <raj.khem@gmail.com>"
diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 849bcf6900..ab4333144b 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -16,7 +16,7 @@ PREFERRED_PROVIDER_virtual/${SDK_PREFIX}compilerlibs = "nativesdk-gcc-runtime"
 # Default libc config
 PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 
-GCCVERSION ?= "9.%"
+GCCVERSION ?= "10.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.34%"
 GDBVERSION ?= "9.%"
diff --git a/meta/recipes-devtools/gcc/gcc-9.3.inc b/meta/recipes-devtools/gcc/gcc-10.1.inc
similarity index 65%
rename from meta/recipes-devtools/gcc/gcc-9.3.inc
rename to meta/recipes-devtools/gcc/gcc-10.1.inc
index b0411078d3..a8f22b3cd5 100644
--- a/meta/recipes-devtools/gcc/gcc-9.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-10.1.inc
@@ -2,13 +2,13 @@ require gcc-common.inc
 
 # Third digit in PV should be incremented after a minor release
 
-PV = "9.3.0"
+PV = "10.1.0"
 
 # BINV should be incremented to a revision after a minor gcc release
 
-BINV = "9.3.0"
+BINV = "10.1.0"
 
-FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-9.3:${FILE_DIRNAME}/gcc-9.3/backport:"
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-10.1:${FILE_DIRNAME}/gcc-10.1/backport:"
 
 DEPENDS =+ "mpfr gmp libmpc zlib flex-native"
 NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native flex-native"
@@ -24,8 +24,8 @@ LIC_FILES_CHKSUM = "\
 "
 
 BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
-#RELEASE ?= "5a5ca2d"
-#BASEURI ?= "https://repo.or.cz/official-gcc.git/snapshot/${RELEASE}.tar.gz;downloadfilename=gcc-${RELEASE}.tar.gz"
+#RELEASE ?= "93a49d2d2292893b9b7f38132df949c70942838c"
+#BASEURI ?= "https://github.com/gcc-mirror/gcc/archive/${RELEASE}.zip;downloadfilename=gcc-${PV}-${RELEASE}.zip"
 SRC_URI = "\
            ${BASEURI} \
            file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
@@ -47,31 +47,26 @@ SRC_URI = "\
            file://0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch \
            file://0018-export-CPP.patch \
            file://0019-Ensure-target-gcc-headers-can-be-included.patch \
-           file://0020-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch \
-           file://0021-Don-t-search-host-directory-during-relink-if-inst_pr.patch \
-           file://0022-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch \
-           file://0023-aarch64-Add-support-for-musl-ldso.patch \
-           file://0024-libcc1-fix-libcc1-s-install-path-and-rpath.patch \
-           file://0025-handle-sysroot-support-for-nativesdk-gcc.patch \
-           file://0026-Search-target-sysroot-gcc-version-specific-dirs-with.patch \
-           file://0027-Fix-various-_FOR_BUILD-and-related-variables.patch \
-           file://0028-nios2-Define-MUSL_DYNAMIC_LINKER.patch \
-           file://0029-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch \
-           file://0030-ldbl128-config.patch \
-           file://0031-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch \
-           file://0032-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch \
-           file://0033-sync-gcc-stddef.h-with-musl.patch \
-           file://0034-fix-segmentation-fault-in-precompiled-header-generat.patch \
-           file://0035-Fix-for-testsuite-failure.patch \
-           file://0036-Re-introduce-spe-commandline-options.patch \
-           file://0037-CVE-2019-14250-Check-zero-value-in-simple_object_elf.patch \
-           file://0038-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch \
-           file://0039-process_alt_operands-Don-t-match-user-defined-regs-o.patch \
+           file://0020-Don-t-search-host-directory-during-relink-if-inst_pr.patch \
+           file://0021-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch \
+           file://0022-aarch64-Add-support-for-musl-ldso.patch \
+           file://0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch \
+           file://0024-handle-sysroot-support-for-nativesdk-gcc.patch \
+           file://0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch \
+           file://0026-Fix-various-_FOR_BUILD-and-related-variables.patch \
+           file://0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch \
+           file://0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch \
+           file://0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch \
+           file://0030-sync-gcc-stddef.h-with-musl.patch \
+           file://0031-fix-segmentation-fault-in-precompiled-header-generat.patch \
+           file://0032-Fix-for-testsuite-failure.patch \
+           file://0033-Re-introduce-spe-commandline-options.patch \
+           file://0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch \
+           file://0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch \
 "
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
-SRC_URI[sha256sum] = "71e197867611f6054aa1119b13a0c0abac12834765fe2d81f35ac57f84f742d1"
 # For dev release snapshotting
-#S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/official-gcc-${RELEASE}"
+#S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${RELEASE}"
 #B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
 
 # Language Overrides
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc-10.1/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
similarity index 79%
rename from meta/recipes-devtools/gcc/gcc-9.3/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
rename to meta/recipes-devtools/gcc/gcc-10.1/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
index 0d9222df17..a848e90359 100644
--- a/meta/recipes-devtools/gcc/gcc-9.3/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
+++ b/meta/recipes-devtools/gcc/gcc-10.1/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
@@ -1,7 +1,7 @@
-From 02b1789dbbb184726782b5038a4dd96515ec790c Mon Sep 17 00:00:00 2001
+From 37c7eff225d5938593cc6aa4871c0ce986553dff Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 08:37:11 +0400
-Subject: [PATCH 01/39] gcc-4.3.1: ARCH_FLAGS_FOR_TARGET
+Subject: [PATCH] gcc-4.3.1: ARCH_FLAGS_FOR_TARGET
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
@@ -12,10 +12,10 @@ Upstream-Status: Inappropriate [embedded specific]
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure b/configure
-index abd93a990a9..b121088d778 100755
+index 4cc938ebb7d..226a64939d1 100755
 --- a/configure
 +++ b/configure
-@@ -7603,7 +7603,7 @@ fi
+@@ -7722,7 +7722,7 @@ fi
  # for target_alias and gcc doesn't manage it consistently.
  target_configargs="--cache-file=./config.cache ${target_configargs}"
  
@@ -25,10 +25,10 @@ index abd93a990a9..b121088d778 100755
   *" newlib "*)
    case " $target_configargs " in
 diff --git a/configure.ac b/configure.ac
-index 9db4fd14aa2..aad93c4d183 100644
+index c78d9cbea62..f024f4bac9b 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3119,7 +3119,7 @@ fi
+@@ -3227,7 +3227,7 @@ fi
  # for target_alias and gcc doesn't manage it consistently.
  target_configargs="--cache-file=./config.cache ${target_configargs}"
  
@@ -37,6 +37,3 @@ index 9db4fd14aa2..aad93c4d183 100644
  case " $target_configdirs " in
   *" newlib "*)
    case " $target_configargs " in
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0002-gcc-poison-system-directories.patch b/meta/recipes-devtools/gcc/gcc-10.1/0002-gcc-poison-system-directories.patch
similarity index 85%
rename from meta/recipes-devtools/gcc/gcc-9.3/0002-gcc-poison-system-directories.patch
rename to meta/recipes-devtools/gcc/gcc-10.1/0002-gcc-poison-system-directories.patch
index f427ee67c1..0bef139990 100644
--- a/meta/recipes-devtools/gcc/gcc-9.3/0002-gcc-poison-system-directories.patch
+++ b/meta/recipes-devtools/gcc/gcc-10.1/0002-gcc-poison-system-directories.patch
@@ -1,7 +1,7 @@
-From 5368cd0293ce50a69ced6e4b25ba6c8d8e014256 Mon Sep 17 00:00:00 2001
+From 430d9301dff60e532ae05d51227a3af036ebb57c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 08:59:00 +0400
-Subject: [PATCH 02/39] gcc: poison-system-directories
+Subject: [PATCH] gcc: poison-system-directories
 
 Add /sw/include and /opt/include based on the original
 zecke-no-host-includes.patch patch.  The original patch checked for
@@ -26,10 +26,10 @@ Upstream-Status: Pending
  7 files changed, 68 insertions(+)
 
 diff --git a/gcc/common.opt b/gcc/common.opt
-index d342c4f3749..c64fd4a6c50 100644
+index d33383b523c..96438b60c6b 100644
 --- a/gcc/common.opt
 +++ b/gcc/common.opt
-@@ -684,6 +684,10 @@ Wreturn-local-addr
+@@ -682,6 +682,10 @@ Wreturn-local-addr
  Common Var(warn_return_local_addr) Init(1) Warning
  Warn about returning a pointer/reference to a local or temporary variable.
  
@@ -41,10 +41,10 @@ index d342c4f3749..c64fd4a6c50 100644
  Common Var(warn_shadow) Warning
  Warn when one variable shadows another.  Same as -Wshadow=global.
 diff --git a/gcc/config.in b/gcc/config.in
-index a718ceaf3da..5713342efb1 100644
+index 809e7b26823..5adeaeed36b 100644
 --- a/gcc/config.in
 +++ b/gcc/config.in
-@@ -200,6 +200,12 @@
+@@ -224,6 +224,12 @@
  #endif
  
  
@@ -58,10 +58,10 @@ index a718ceaf3da..5713342efb1 100644
     optimizer and back end) to be checked for dynamic type safety at runtime.
     This is quite expensive. */
 diff --git a/gcc/configure b/gcc/configure
-index a065ba23728..2e26dd33310 100755
+index cd3d9516fce..8de766a942c 100755
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -996,6 +996,7 @@ with_system_zlib
+@@ -1010,6 +1010,7 @@ with_system_zlib
  enable_maintainer_mode
  enable_link_mutex
  enable_version_specific_runtime_libs
@@ -69,7 +69,7 @@ index a065ba23728..2e26dd33310 100755
  enable_plugin
  enable_host_shared
  enable_libquadmath_support
-@@ -1749,6 +1750,8 @@ Optional Features:
+@@ -1766,6 +1767,8 @@ Optional Features:
    --enable-version-specific-runtime-libs
                            specify that runtime libraries should be installed
                            in a compiler-specific directory
@@ -78,7 +78,7 @@ index a065ba23728..2e26dd33310 100755
    --enable-plugin         enable plugin support
    --enable-host-shared    build host code as shared libraries
    --disable-libquadmath-support
-@@ -29753,6 +29756,19 @@ if test "${enable_version_specific_runtime_libs+set}" = set; then :
+@@ -30235,6 +30238,19 @@ if test "${enable_version_specific_runtime_libs+set}" = set; then :
  fi
  
  
@@ -99,10 +99,10 @@ index a065ba23728..2e26dd33310 100755
  
  
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 3a7251102ef..12d1d04e645 100644
+index 0de3b4bf97b..8bfd6feb780 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -6380,6 +6380,16 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
+@@ -6595,6 +6595,16 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
                  [specify that runtime libraries should be
                   installed in a compiler-specific directory])])
  
@@ -120,18 +120,18 @@ index 3a7251102ef..12d1d04e645 100644
  AC_SUBST(subdirs)
  AC_SUBST(srcdir)
 diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
-index 0ab6c9c6449..c3d3d51a28f 100644
+index f98161391a0..f12d8d12150 100644
 --- a/gcc/doc/invoke.texi
 +++ b/gcc/doc/invoke.texi
-@@ -333,6 +333,7 @@ Objective-C and Objective-C++ Dialects}.
- -Wpacked  -Wpacked-bitfield-compat -Wpacked-not-aligned  -Wpadded @gol
+@@ -348,6 +348,7 @@ Objective-C and Objective-C++ Dialects}.
+ -Wpacked  -Wno-packed-bitfield-compat  -Wpacked-not-aligned  -Wpadded @gol
  -Wparentheses  -Wno-pedantic-ms-format @gol
- -Wplacement-new  -Wplacement-new=@var{n} @gol
+ -Wpointer-arith  -Wno-pointer-compare  -Wno-pointer-to-int-cast @gol
 +-Wno-poison-system-directories @gol
- -Wpointer-arith  -Wpointer-compare  -Wno-pointer-to-int-cast @gol
  -Wno-pragmas  -Wno-prio-ctor-dtor  -Wredundant-decls @gol
- -Wrestrict  -Wno-return-local-addr @gol
-@@ -6290,6 +6291,14 @@ made up of data only and thus requires no special treatment.  But, for
+ -Wrestrict  -Wno-return-local-addr  -Wreturn-type @gol
+ -Wno-scalar-storage-order  -Wsequence-point @gol
+@@ -6924,6 +6925,14 @@ made up of data only and thus requires no special treatment.  But, for
  most targets, it is made up of code and thus requires the stack to be
  made executable in order for the program to work properly.
  
@@ -147,10 +147,10 @@ index 0ab6c9c6449..c3d3d51a28f 100644
  @opindex Wfloat-equal
  @opindex Wno-float-equal
 diff --git a/gcc/gcc.c b/gcc/gcc.c
-index 4f57765b012..a2601a6bb06 100644
+index 9f790db0daf..b2200c5185a 100644
 --- a/gcc/gcc.c
 +++ b/gcc/gcc.c
-@@ -1042,6 +1042,8 @@ proper position among the other output files.  */
+@@ -1041,6 +1041,8 @@ proper position among the other output files.  */
     "%{fuse-ld=*:-fuse-ld=%*} " LINK_COMPRESS_DEBUG_SPEC \
     "%X %{o*} %{e*} %{N} %{n} %{r}\
      %{s} %{t} %{u*} %{z} %{Z} %{!nostdlib:%{!r:%{!nostartfiles:%S}}} \
@@ -160,7 +160,7 @@ index 4f57765b012..a2601a6bb06 100644
      VTABLE_VERIFICATION_SPEC " " SANITIZER_EARLY_SPEC " %o "" \
      %{fopenacc|fopenmp|%:gt(%{ftree-parallelize-loops=*:%*} 1):\
 diff --git a/gcc/incpath.c b/gcc/incpath.c
-index bcbe2082905..5752298bbf2 100644
+index 8a2bda00f80..9098ab044ab 100644
 --- a/gcc/incpath.c
 +++ b/gcc/incpath.c
 @@ -26,6 +26,7 @@
@@ -198,6 +198,3 @@ index bcbe2082905..5752298bbf2 100644
  }
  
  /* Use given -I paths for #include "..." but not #include <...>, and
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc-10.1/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
similarity index 92%
rename from meta/recipes-devtools/gcc/gcc-9.3/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
rename to meta/recipes-devtools/gcc/gcc-10.1/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
index 23ec5bce03..a007967b31 100644
--- a/meta/recipes-devtools/gcc/gcc-9.3/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
+++ b/meta/recipes-devtools/gcc/gcc-10.1/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
@@ -1,7 +1,7 @@
-From df90dbdba7a85c20bad95de71525f0f400a849d2 Mon Sep 17 00:00:00 2001
+From 33e1e6538bd4c62a7730a8d33ec8c9869440c6f3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:08:31 +0400
-Subject: [PATCH 03/39] gcc-4.3.3: SYSROOT_CFLAGS_FOR_TARGET
+Subject: [PATCH] gcc-4.3.3: SYSROOT_CFLAGS_FOR_TARGET
 
 Before committing, I noticed that PR/32161 was marked as a dup of PR/32009, but my previous patch did not fix it.
 
@@ -26,10 +26,10 @@ Upstream-Status: Pending
  1 file changed, 32 insertions(+)
 
 diff --git a/configure b/configure
-index b121088d778..93aae5bb26f 100755
+index 226a64939d1..b31dc137fc9 100755
 --- a/configure
 +++ b/configure
-@@ -6864,6 +6864,38 @@ fi
+@@ -6971,6 +6971,38 @@ fi
  
  
  
@@ -68,6 +68,3 @@ index b121088d778..93aae5bb26f 100755
  # Handle --with-headers=XXX.  If the value is not "yes", the contents of
  # the named directory are copied to $(tooldir)/sys-include.
  if test x"${with_headers}" != x && test x"${with_headers}" != xno ; then
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0004-64-bit-multilib-hack.patch b/meta/recipes-devtools/gcc/gcc-10.1/0004-64-bit-multilib-hack.patch
similarity index 95%
rename from meta/recipes-devtools/gcc/gcc-9.3/0004-64-bit-multilib-hack.patch
rename to meta/recipes-devtools/gcc/gcc-10.1/0004-64-bit-multilib-hack.patch
index 17ec8986c1..475abb619d 100644
--- a/meta/recipes-devtools/gcc/gcc-9.3/0004-64-bit-multilib-hack.patch
+++ b/meta/recipes-devtools/gcc/gcc-10.1/0004-64-bit-multilib-hack.patch
@@ -1,7 +1,7 @@
-From 2e00d0a9a809153f693659e977c1e0550665e65c Mon Sep 17 00:00:00 2001
+From 924d8cf37398e67611a483a0f4ec7e592901f203 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:10:06 +0400
-Subject: [PATCH 04/39] 64-bit multilib hack.
+Subject: [PATCH] 64-bit multilib hack.
 
 GCC has internal multilib handling code but it assumes a very specific rigid directory
 layout. The build system implementation of multilib layout is very generic and allows
@@ -37,7 +37,7 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
  5 files changed, 15 insertions(+), 20 deletions(-)
 
 diff --git a/gcc/config/aarch64/t-aarch64-linux b/gcc/config/aarch64/t-aarch64-linux
-index 5ad670ba2ce..e26019e7157 100644
+index 83e59e33b85..b1356be1fb4 100644
 --- a/gcc/config/aarch64/t-aarch64-linux
 +++ b/gcc/config/aarch64/t-aarch64-linux
 @@ -21,8 +21,8 @@
@@ -54,7 +54,7 @@ index 5ad670ba2ce..e26019e7157 100644
 -MULTILIB_OSDIRNAMES += mabi.ilp32=../libilp32$(call if_multiarch,:aarch64$(AARCH_BE)-linux-gnu_ilp32)
 +#MULTILIB_OSDIRNAMES += mabi.ilp32=../libilp32$(call if_multiarch,:aarch64$(AARCH_BE)-linux-gnu_ilp32)
 diff --git a/gcc/config/i386/t-linux64 b/gcc/config/i386/t-linux64
-index c686ab2f0d2..c82b60dadcd 100644
+index 1171e218578..5e057b7e5db 100644
 --- a/gcc/config/i386/t-linux64
 +++ b/gcc/config/i386/t-linux64
 @@ -32,7 +32,5 @@
@@ -68,7 +68,7 @@ index c686ab2f0d2..c82b60dadcd 100644
 +MULTILIB_DIRNAMES = . .
 +MULTILIB_OSDIRNAMES = ../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir))
 diff --git a/gcc/config/mips/t-linux64 b/gcc/config/mips/t-linux64
-index 3a2ff700d7d..13ef19576b5 100644
+index ceb58d3b5f3..43fe2bf28ab 100644
 --- a/gcc/config/mips/t-linux64
 +++ b/gcc/config/mips/t-linux64
 @@ -17,10 +17,6 @@
@@ -98,7 +98,7 @@ index 216d2776a18..e4d817621fc 100644
 +#MULTILIB_OSDIRNAMES := $(patsubst lib%,../lib%,$(MULTILIB_DIRNAMES))
 +MULTILIB_OSDIRNAMES := ../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir))
 diff --git a/gcc/config/rs6000/t-linux64 b/gcc/config/rs6000/t-linux64
-index f3c6e2be1d9..bd0393155fa 100644
+index 264a7e27524..dc9d440f66b 100644
 --- a/gcc/config/rs6000/t-linux64
 +++ b/gcc/config/rs6000/t-linux64
 @@ -26,10 +26,9 @@
@@ -114,6 +114,3 @@ index f3c6e2be1d9..bd0393155fa 100644
  
  rs6000-linux.o: $(srcdir)/config/rs6000/rs6000-linux.c
  	$(COMPILE) $<
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0005-optional-libstdc.patch b/meta/recipes-devtools/gcc/gcc-10.1/0005-optional-libstdc.patch
similarity index 86%
rename from meta/recipes-devtools/gcc/gcc-9.3/0005-optional-libstdc.patch
rename to meta/recipes-devtools/gcc/gcc-10.1/0005-optional-libstdc.patch
index 3c28aeac63..d28faf8205 100644
--- a/meta/recipes-devtools/gcc/gcc-9.3/0005-optional-libstdc.patch
+++ b/meta/recipes-devtools/gcc/gcc-10.1/0005-optional-libstdc.patch
@@ -1,7 +1,7 @@
-From 435e45592e944018f33bff32f1202b0872a23141 Mon Sep 17 00:00:00 2001
+From 6947ba730de0bc33ed60f848176391838a625df5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:12:56 +0400
-Subject: [PATCH 05/39] optional libstdc
+Subject: [PATCH] optional libstdc
 
 gcc-runtime builds libstdc++ separately from gcc-cross-*. Its configure tests using g++
 will not run correctly since by default the linker will try to link against libstdc++
@@ -25,10 +25,10 @@ Upstream-Status: Inappropriate [embedded specific]
  4 files changed, 37 insertions(+), 1 deletion(-)
 
 diff --git a/gcc/c-family/c.opt b/gcc/c-family/c.opt
-index 916cc67b453..41619fa591c 100644
+index c49da99d395..35f712e2c84 100644
 --- a/gcc/c-family/c.opt
 +++ b/gcc/c-family/c.opt
-@@ -1952,6 +1952,10 @@ nostdinc++
+@@ -2025,6 +2025,10 @@ nostdinc++
  C++ ObjC++
  Do not search standard system include directories for C++.
  
@@ -40,7 +40,7 @@ index 916cc67b453..41619fa591c 100644
  C ObjC C++ ObjC++ Joined Separate
  ; Documented in common.opt
 diff --git a/gcc/cp/g++spec.c b/gcc/cp/g++spec.c
-index 6c4574a837d..0e2657f00ee 100644
+index 0ab63bcd211..7b081e9e4f0 100644
 --- a/gcc/cp/g++spec.c
 +++ b/gcc/cp/g++spec.c
 @@ -137,6 +137,7 @@ lang_specific_driver (struct cl_decoded_option **in_decoded_options,
@@ -52,10 +52,10 @@ index 6c4574a837d..0e2657f00ee 100644
  	  library = -1;
  	  break;
 diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
-index c3d3d51a28f..2f7ffe456c3 100644
+index f12d8d12150..cf6cb428e7d 100644
 --- a/gcc/doc/invoke.texi
 +++ b/gcc/doc/invoke.texi
-@@ -228,6 +228,9 @@ in the following sections.
+@@ -230,6 +230,9 @@ in the following sections.
  -fno-weak  -nostdinc++ @gol
  -fvisibility-inlines-hidden @gol
  -fvisibility-ms-compat @gol
@@ -63,9 +63,9 @@ index c3d3d51a28f..2f7ffe456c3 100644
 +-fvtv-counts -fvtv-debug @gol
 +-nostdlib++ @gol
  -fext-numeric-literals @gol
- -Wabi=@var{n}  -Wabi-tag  -Wconversion-null  -Wctor-dtor-privacy @gol
- -Wdelete-non-virtual-dtor  -Wdeprecated-copy  -Wdeprecated-copy-dtor @gol
-@@ -539,7 +542,7 @@ Objective-C and Objective-C++ Dialects}.
+ -Wabi-tag  -Wcatch-value  -Wcatch-value=@var{n} @gol
+ -Wno-class-conversion  -Wclass-memaccess @gol
+@@ -599,7 +602,7 @@ Objective-C and Objective-C++ Dialects}.
  -pie  -pthread  -r  -rdynamic @gol
  -s  -static  -static-pie  -static-libgcc  -static-libstdc++ @gol
  -static-libasan  -static-libtsan  -static-liblsan  -static-libubsan @gol
@@ -74,7 +74,7 @@ index c3d3d51a28f..2f7ffe456c3 100644
  -T @var{script}  -Wl,@var{option}  -Xlinker @var{option} @gol
  -u @var{symbol}  -z @var{keyword}}
  
-@@ -13321,6 +13324,33 @@ Specify that the program entry point is @var{entry}.  The argument is
+@@ -14407,6 +14410,33 @@ Specify that the program entry point is @var{entry}.  The argument is
  interpreted by the linker; the GNU linker accepts either a symbol name
  or an address.
  
@@ -109,10 +109,10 @@ index c3d3d51a28f..2f7ffe456c3 100644
  @opindex pie
  Produce a dynamically linked position independent executable on targets
 diff --git a/gcc/gcc.c b/gcc/gcc.c
-index a2601a6bb06..cd6c6fc95db 100644
+index b2200c5185a..f8be58ce0a6 100644
 --- a/gcc/gcc.c
 +++ b/gcc/gcc.c
-@@ -1052,6 +1052,7 @@ proper position among the other output files.  */
+@@ -1051,6 +1051,7 @@ proper position among the other output files.  */
      %(mflib) " STACK_SPLIT_SPEC "\
      %{fprofile-arcs|fprofile-generate*|coverage:-lgcov} " SANITIZER_SPEC " \
      %{!nostdlib:%{!r:%{!nodefaultlibs:%(link_ssp) %(link_gcc_c_sequence)}}}\
@@ -120,6 +120,3 @@ index a2601a6bb06..cd6c6fc95db 100644
      %{!nostdlib:%{!r:%{!nostartfiles:%E}}} %{T*}  \n%(post_link) }}}}}}"
  #endif
  
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0006-COLLECT_GCC_OPTIONS.patch b/meta/recipes-devtools/gcc/gcc-10.1/0006-COLLECT_GCC_OPTIONS.patch
similarity index 80%
rename from meta/recipes-devtools/gcc/gcc-9.3/0006-COLLECT_GCC_OPTIONS.patch
rename to meta/recipes-devtools/gcc/gcc-10.1/0006-COLLECT_GCC_OPTIONS.patch
index 906f3a7317..cf49f1c975 100644
--- a/meta/recipes-devtools/gcc/gcc-9.3/0006-COLLECT_GCC_OPTIONS.patch
+++ b/meta/recipes-devtools/gcc/gcc-10.1/0006-COLLECT_GCC_OPTIONS.patch
@@ -1,7 +1,7 @@
-From c99684477ec66f290ec74efe732acd3c24db7dcc Mon Sep 17 00:00:00 2001
+From 92a079a0940c0b740cdc307753f0eb71db436745 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:16:28 +0400
-Subject: [PATCH 06/39] COLLECT_GCC_OPTIONS
+Subject: [PATCH] COLLECT_GCC_OPTIONS
 
 This patch adds --sysroot into COLLECT_GCC_OPTIONS which is used to
 invoke collect2.
@@ -14,10 +14,10 @@ Upstream-Status: Pending
  1 file changed, 9 insertions(+)
 
 diff --git a/gcc/gcc.c b/gcc/gcc.c
-index cd6c6fc95db..7da9c5d457b 100644
+index f8be58ce0a6..48b0f9dde81 100644
 --- a/gcc/gcc.c
 +++ b/gcc/gcc.c
-@@ -4804,6 +4804,15 @@ set_collect_gcc_options (void)
+@@ -4806,6 +4806,15 @@ set_collect_gcc_options (void)
  		sizeof ("COLLECT_GCC_OPTIONS=") - 1);
  
    first_time = TRUE;
@@ -33,6 +33,3 @@ index cd6c6fc95db..7da9c5d457b 100644
    for (i = 0; (int) i < n_switches; i++)
      {
        const char *const *args;
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch b/meta/recipes-devtools/gcc/gcc-10.1/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
similarity index 87%
rename from meta/recipes-devtools/gcc/gcc-9.3/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
rename to meta/recipes-devtools/gcc/gcc-10.1/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
index 68a876cb95..eec79a4a15 100644
--- a/meta/recipes-devtools/gcc/gcc-9.3/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
+++ b/meta/recipes-devtools/gcc/gcc-10.1/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
@@ -1,8 +1,7 @@
-From d6f4edaab0ad0e742fb1e3a6f76908a2ac9927d5 Mon Sep 17 00:00:00 2001
+From f92d0b68dc13a2eaf8fd3270f0563428bbf369ab Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:17:25 +0400
-Subject: [PATCH 07/39] Use the defaults.h in ${B} instead of ${S}, and t-oe in
- ${B}
+Subject: [PATCH] Use the defaults.h in ${B} instead of ${S}, and t-oe in ${B}
 
 Use the defaults.h in ${B} instead of ${S}, and t-oe in ${B}, so that
 the source can be shared between gcc-cross-initial,
@@ -27,7 +26,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  4 files changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index abae872cd63..fef6c4c61e3 100644
+index 543b477ff18..a67d2cc18d6 100644
 --- a/gcc/Makefile.in
 +++ b/gcc/Makefile.in
 @@ -540,7 +540,7 @@ TARGET_SYSTEM_ROOT = @TARGET_SYSTEM_ROOT@
@@ -40,10 +39,10 @@ index abae872cd63..fef6c4c61e3 100644
  TM_MULTILIB_CONFIG=@TM_MULTILIB_CONFIG@
  TM_MULTILIB_EXCEPTIONS_CONFIG=@TM_MULTILIB_EXCEPTIONS_CONFIG@
 diff --git a/gcc/configure b/gcc/configure
-index 2e26dd33310..ed7931daed3 100755
+index 8de766a942c..b26e8fc7fee 100755
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -12342,8 +12342,8 @@ for f in $tm_file; do
+@@ -12705,8 +12705,8 @@ for f in $tm_file; do
         tm_include_list="${tm_include_list} $f"
         ;;
      defaults.h )
@@ -55,10 +54,10 @@ index 2e26dd33310..ed7931daed3 100755
      * )
         tm_file_list="${tm_file_list} \$(srcdir)/config/$f"
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 12d1d04e645..e0500e30d50 100644
+index 8bfd6feb780..26fa46802c7 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -1968,8 +1968,8 @@ for f in $tm_file; do
+@@ -2138,8 +2138,8 @@ for f in $tm_file; do
         tm_include_list="${tm_include_list} $f"
         ;;
      defaults.h )
@@ -70,7 +69,7 @@ index 12d1d04e645..e0500e30d50 100644
      * )
         tm_file_list="${tm_file_list} \$(srcdir)/config/$f"
 diff --git a/gcc/mkconfig.sh b/gcc/mkconfig.sh
-index 308b87d0cc1..19068cbc24a 100644
+index d2c677a4a42..d03852481cb 100644
 --- a/gcc/mkconfig.sh
 +++ b/gcc/mkconfig.sh
 @@ -77,7 +77,7 @@ if [ -n "$HEADERS" ]; then
@@ -91,6 +90,3 @@ index 308b87d0cc1..19068cbc24a 100644
  fi
  
  # Add multiple inclusion protection guard, part two.
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0008-fortran-cross-compile-hack.patch b/meta/recipes-devtools/gcc/gcc-10.1/0008-fortran-cross-compile-hack.patch
similarity index 81%
rename from meta/recipes-devtools/gcc/gcc-9.3/0008-fortran-cross-compile-hack.patch
rename to meta/recipes-devtools/gcc/gcc-10.1/0008-fortran-cross-compile-hack.patch
index 6acd2b0cf9..79ae9f905e 100644
--- a/meta/recipes-devtools/gcc/gcc-9.3/0008-fortran-cross-compile-hack.patch
+++ b/meta/recipes-devtools/gcc/gcc-10.1/0008-fortran-cross-compile-hack.patch
@@ -1,7 +1,7 @@
-From 2c514ada36ffbf70177909f633e9f68811de61e0 Mon Sep 17 00:00:00 2001
+From ae1e7553b0bf551dc5702339164ec6aad54887ec Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:20:01 +0400
-Subject: [PATCH 08/39] fortran cross-compile hack.
+Subject: [PATCH] fortran cross-compile hack.
 
 * Fortran would have searched for arm-angstrom-gnueabi-gfortran but would have used
 used gfortan. For gcc_4.2.2.bb we want to use the gfortran compiler from our cross
@@ -16,10 +16,10 @@ Upstream-Status: Inappropriate [embedded specific]
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/libgfortran/configure b/libgfortran/configure
-index 60867b93d0e..3fc9fca5b7b 100755
+index b4cf854ddb3..e8e0ac3b1cf 100755
 --- a/libgfortran/configure
 +++ b/libgfortran/configure
-@@ -13071,7 +13071,7 @@ esac
+@@ -13090,7 +13090,7 @@ esac
  
  # We need gfortran to compile parts of the library
  #AC_PROG_FC(gfortran)
@@ -29,10 +29,10 @@ index 60867b93d0e..3fc9fca5b7b 100755
  ac_compile='$FC -c $FCFLAGS $ac_fcflags_srcext conftest.$ac_ext >&5'
  ac_link='$FC -o conftest$ac_exeext $FCFLAGS $LDFLAGS $ac_fcflags_srcext conftest.$ac_ext $LIBS >&5'
 diff --git a/libgfortran/configure.ac b/libgfortran/configure.ac
-index 7cfce28ab69..6cd515ee1a4 100644
+index 711dc60ff78..3c9bbfbf47d 100644
 --- a/libgfortran/configure.ac
 +++ b/libgfortran/configure.ac
-@@ -250,7 +250,7 @@ AC_SUBST(enable_static)
+@@ -258,7 +258,7 @@ AC_SUBST(enable_static)
  
  # We need gfortran to compile parts of the library
  #AC_PROG_FC(gfortran)
@@ -41,6 +41,3 @@ index 7cfce28ab69..6cd515ee1a4 100644
  AC_PROG_FC(gfortran)
  
  # extra LD Flags which are required for targets
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0009-cpp-honor-sysroot.patch b/meta/recipes-devtools/gcc/gcc-10.1/0009-cpp-honor-sysroot.patch
similarity index 87%
rename from meta/recipes-devtools/gcc/gcc-9.3/0009-cpp-honor-sysroot.patch
rename to meta/recipes-devtools/gcc/gcc-10.1/0009-cpp-honor-sysroot.patch
index 5a9e527606..8776a1060d 100644
--- a/meta/recipes-devtools/gcc/gcc-9.3/0009-cpp-honor-sysroot.patch
+++ b/meta/recipes-devtools/gcc/gcc-10.1/0009-cpp-honor-sysroot.patch
@@ -1,7 +1,7 @@
-From 0a7c03a9cf925ba09a510a32e684f01ec5a50650 Mon Sep 17 00:00:00 2001
+From 960df7ed02b95799722e5ad57bcf18b44fd347e1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:22:00 +0400
-Subject: [PATCH 09/39] cpp: honor sysroot.
+Subject: [PATCH] cpp: honor sysroot.
 
 Currently, if the gcc toolchain is relocated and installed from sstate, then you try and compile
 preprocessed source (.i or .ii files), the compiler will try and access the builtin sysroot location
@@ -26,7 +26,7 @@ Upstream-Status: Pending
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/gcc/cp/lang-specs.h b/gcc/cp/lang-specs.h
-index c6e42eda283..e1ddf066467 100644
+index 0ad4a33b93e..16c744f4f90 100644
 --- a/gcc/cp/lang-specs.h
 +++ b/gcc/cp/lang-specs.h
 @@ -66,5 +66,5 @@ along with GCC; see the file COPYING3.  If not see
@@ -37,10 +37,10 @@ index c6e42eda283..e1ddf066467 100644
 +      "  cc1plus -fpreprocessed %i %I %(cc1_options) %2"
        "  %{!fsyntax-only:%(invoke_as)}}}}", 0, 0, 0},
 diff --git a/gcc/gcc.c b/gcc/gcc.c
-index 7da9c5d457b..4e7c45b268c 100644
+index 48b0f9dde81..c87f603955f 100644
 --- a/gcc/gcc.c
 +++ b/gcc/gcc.c
-@@ -1349,7 +1349,7 @@ static const struct compiler default_compilers[] =
+@@ -1348,7 +1348,7 @@ static const struct compiler default_compilers[] =
  					   %W{o*:--output-pch=%*}}%V}}}}}}}", 0, 0, 0},
    {".i", "@cpp-output", 0, 0, 0},
    {"@cpp-output",
@@ -49,6 +49,3 @@ index 7da9c5d457b..4e7c45b268c 100644
    {".s", "@assembler", 0, 0, 0},
    {"@assembler",
     "%{!M:%{!MM:%{!E:%{!S:as %(asm_debug) %(asm_options) %i %A }}}}", 0, 0, 0},
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0010-MIPS64-Default-to-N64-ABI.patch b/meta/recipes-devtools/gcc/gcc-10.1/0010-MIPS64-Default-to-N64-ABI.patch
similarity index 85%
rename from meta/recipes-devtools/gcc/gcc-9.3/0010-MIPS64-Default-to-N64-ABI.patch
rename to meta/recipes-devtools/gcc/gcc-10.1/0010-MIPS64-Default-to-N64-ABI.patch
index a8103b951e..0f8b885f8f 100644
--- a/meta/recipes-devtools/gcc/gcc-9.3/0010-MIPS64-Default-to-N64-ABI.patch
+++ b/meta/recipes-devtools/gcc/gcc-10.1/0010-MIPS64-Default-to-N64-ABI.patch
@@ -1,7 +1,7 @@
-From 374aab6a88200fbd7343467d97f7ee6455bbce61 Mon Sep 17 00:00:00 2001
+From 96246002e40e445694855750d5b369b91fafcd9a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:23:08 +0400
-Subject: [PATCH 10/39] MIPS64: Default to N64 ABI
+Subject: [PATCH] MIPS64: Default to N64 ABI
 
 MIPS64 defaults to n32 ABI, this patch makes it
 so that it defaults to N64 ABI
@@ -14,10 +14,10 @@ Upstream-Status: Inappropriate [OE config specific]
  1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/gcc/config.gcc b/gcc/config.gcc
-index b2282ecdf0b..69c0e4a005b 100644
+index cf1a87e2efd..37c4221a39f 100644
 --- a/gcc/config.gcc
 +++ b/gcc/config.gcc
-@@ -2282,29 +2282,29 @@ mips*-*-linux*)				# Linux MIPS, either endian.
+@@ -2511,29 +2511,29 @@ mips*-*-linux*)				# Linux MIPS, either endian.
  			default_mips_arch=mips32
  			;;
  		mips64el-st-linux-gnu)
@@ -52,6 +52,3 @@ index b2282ecdf0b..69c0e4a005b 100644
  			enable_mips_multilibs="yes"
  			;;
  	esac
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc-10.1/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
similarity index 93%
rename from meta/recipes-devtools/gcc/gcc-9.3/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
rename to meta/recipes-devtools/gcc/gcc-10.1/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
index d9d563d0f7..2101539041 100644
--- a/meta/recipes-devtools/gcc/gcc-9.3/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
+++ b/meta/recipes-devtools/gcc/gcc-10.1/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
@@ -1,7 +1,7 @@
-From dcd7891d6aea5327969132fea6ca4c199f14e985 Mon Sep 17 00:00:00 2001
+From 8612203e73af7b67c38861b8593e1c4b7cd42d4d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:24:50 +0400
-Subject: [PATCH 11/39] Define GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
+Subject: [PATCH] Define GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
  relative to SYSTEMLIBS_DIR
 
 This patch defines GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
@@ -31,7 +31,7 @@ Upstream-Status: Inappropriate [OE configuration]
  12 files changed, 29 insertions(+), 34 deletions(-)
 
 diff --git a/gcc/config/alpha/linux-elf.h b/gcc/config/alpha/linux-elf.h
-index 824861befec..6afacce3292 100644
+index e25fcac3c59..01aca0c6542 100644
 --- a/gcc/config/alpha/linux-elf.h
 +++ b/gcc/config/alpha/linux-elf.h
 @@ -23,8 +23,8 @@ along with GCC; see the file COPYING3.  If not see
@@ -46,7 +46,7 @@ index 824861befec..6afacce3292 100644
  #define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
  #elif DEFAULT_LIBC == LIBC_GLIBC
 diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-eabi.h
-index 66ec0ea3980..e4ade2e2ab0 100644
+index 5bdcfa0c5d3..0c0332f317f 100644
 --- a/gcc/config/arm/linux-eabi.h
 +++ b/gcc/config/arm/linux-eabi.h
 @@ -65,8 +65,8 @@
@@ -61,7 +61,7 @@ index 66ec0ea3980..e4ade2e2ab0 100644
  
  #define GLIBC_DYNAMIC_LINKER \
 diff --git a/gcc/config/arm/linux-elf.h b/gcc/config/arm/linux-elf.h
-index 9a360defd21..98f6e960b64 100644
+index 0ec3aa53189..abfa9566d74 100644
 --- a/gcc/config/arm/linux-elf.h
 +++ b/gcc/config/arm/linux-elf.h
 @@ -60,7 +60,7 @@
@@ -74,7 +74,7 @@ index 9a360defd21..98f6e960b64 100644
  #define LINUX_TARGET_LINK_SPEC  "%{h*} \
     %{static:-Bstatic} \
 diff --git a/gcc/config/i386/linux.h b/gcc/config/i386/linux.h
-index 9a6e2d99896..31efbb73016 100644
+index 9f823f125ed..e0390b7d5e3 100644
 --- a/gcc/config/i386/linux.h
 +++ b/gcc/config/i386/linux.h
 @@ -20,7 +20,7 @@ along with GCC; see the file COPYING3.  If not see
@@ -87,7 +87,7 @@ index 9a6e2d99896..31efbb73016 100644
  #undef MUSL_DYNAMIC_LINKER
  #define MUSL_DYNAMIC_LINKER "/lib/ld-musl-i386.so.1"
 diff --git a/gcc/config/i386/linux64.h b/gcc/config/i386/linux64.h
-index c08221c4210..dbb474d792b 100644
+index 6cb68d1ccfa..7de09ec857c 100644
 --- a/gcc/config/i386/linux64.h
 +++ b/gcc/config/i386/linux64.h
 @@ -27,9 +27,9 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
@@ -104,7 +104,7 @@ index c08221c4210..dbb474d792b 100644
  #undef MUSL_DYNAMIC_LINKER32
  #define MUSL_DYNAMIC_LINKER32 "/lib/ld-musl-i386.so.1"
 diff --git a/gcc/config/linux.h b/gcc/config/linux.h
-index c3c4a219e67..4b05d8e93d1 100644
+index 95654bcdb5a..0c1a8118a26 100644
 --- a/gcc/config/linux.h
 +++ b/gcc/config/linux.h
 @@ -94,10 +94,10 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
@@ -123,7 +123,7 @@ index c3c4a219e67..4b05d8e93d1 100644
  #define BIONIC_DYNAMIC_LINKER32 "/system/bin/linker"
  #define BIONIC_DYNAMIC_LINKER64 "/system/bin/linker64"
 diff --git a/gcc/config/mips/linux.h b/gcc/config/mips/linux.h
-index 6f79ac9c01a..25de96f9561 100644
+index 54446e58e5f..4786ee304c1 100644
 --- a/gcc/config/mips/linux.h
 +++ b/gcc/config/mips/linux.h
 @@ -22,20 +22,20 @@ along with GCC; see the file COPYING3.  If not see
@@ -154,7 +154,7 @@ index 6f79ac9c01a..25de96f9561 100644
  #undef MUSL_DYNAMIC_LINKER32
  #define MUSL_DYNAMIC_LINKER32 \
 diff --git a/gcc/config/riscv/linux.h b/gcc/config/riscv/linux.h
-index 58dd18b89f3..112ba9cd764 100644
+index 4afef7c228c..01997330741 100644
 --- a/gcc/config/riscv/linux.h
 +++ b/gcc/config/riscv/linux.h
 @@ -22,7 +22,7 @@ along with GCC; see the file COPYING3.  If not see
@@ -167,10 +167,10 @@ index 58dd18b89f3..112ba9cd764 100644
  #define MUSL_ABI_SUFFIX \
    "%{mabi=ilp32:-sf}" \
 diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
-index 9946d3fed94..45a9a7cae59 100644
+index 34776c8421e..967c1c43c63 100644
 --- a/gcc/config/rs6000/linux64.h
 +++ b/gcc/config/rs6000/linux64.h
-@@ -423,24 +423,19 @@ extern int dot_symbols;
+@@ -419,24 +419,19 @@ extern int dot_symbols;
  #undef	LINK_OS_DEFAULT_SPEC
  #define LINK_OS_DEFAULT_SPEC "%(link_os_linux)"
  
@@ -201,7 +201,7 @@ index 9946d3fed94..45a9a7cae59 100644
  #undef  DEFAULT_ASM_ENDIAN
  #if (TARGET_DEFAULT & MASK_LITTLE_ENDIAN)
 diff --git a/gcc/config/sh/linux.h b/gcc/config/sh/linux.h
-index c9897b7aca5..82f275319cc 100644
+index c1d0441d488..81373eb8336 100644
 --- a/gcc/config/sh/linux.h
 +++ b/gcc/config/sh/linux.h
 @@ -64,7 +64,7 @@ along with GCC; see the file COPYING3.  If not see
@@ -214,7 +214,7 @@ index c9897b7aca5..82f275319cc 100644
  #undef SUBTARGET_LINK_EMUL_SUFFIX
  #define SUBTARGET_LINK_EMUL_SUFFIX "%{mfdpic:_fd;:_linux}"
 diff --git a/gcc/config/sparc/linux.h b/gcc/config/sparc/linux.h
-index 08476f1d94d..80440e712ad 100644
+index 81201e67a2f..8b6fc577594 100644
 --- a/gcc/config/sparc/linux.h
 +++ b/gcc/config/sparc/linux.h
 @@ -84,7 +84,7 @@ extern const char *host_detect_local_cpu (int argc, const char **argv);
@@ -227,7 +227,7 @@ index 08476f1d94d..80440e712ad 100644
  #undef  LINK_SPEC
  #define LINK_SPEC "-m elf32_sparc %{shared:-shared} \
 diff --git a/gcc/config/sparc/linux64.h b/gcc/config/sparc/linux64.h
-index 789d1df4bd5..b920c680fb1 100644
+index a1a0efd8f28..85d1084afc2 100644
 --- a/gcc/config/sparc/linux64.h
 +++ b/gcc/config/sparc/linux64.h
 @@ -84,8 +84,8 @@ along with GCC; see the file COPYING3.  If not see
@@ -241,6 +241,3 @@ index 789d1df4bd5..b920c680fb1 100644
  
  #ifdef SPARC_BI_ARCH
  
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0012-gcc-Fix-argument-list-too-long-error.patch b/meta/recipes-devtools/gcc/gcc-10.1/0012-gcc-Fix-argument-list-too-long-error.patch
similarity index 85%
rename from meta/recipes-devtools/gcc/gcc-9.3/0012-gcc-Fix-argument-list-too-long-error.patch
rename to meta/recipes-devtools/gcc/gcc-10.1/0012-gcc-Fix-argument-list-too-long-error.patch
index 9d98878096..6e75f18ec0 100644
--- a/meta/recipes-devtools/gcc/gcc-9.3/0012-gcc-Fix-argument-list-too-long-error.patch
+++ b/meta/recipes-devtools/gcc/gcc-10.1/0012-gcc-Fix-argument-list-too-long-error.patch
@@ -1,7 +1,7 @@
-From faa0f712a67005ef0260f95eebe7c7c57a6f8360 Mon Sep 17 00:00:00 2001
+From 921c6b998fba6556ad0b31dc3b02010c458a8bef Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:26:37 +0400
-Subject: [PATCH 12/39] gcc: Fix argument list too long error.
+Subject: [PATCH] gcc: Fix argument list too long error.
 
 There would be an "Argument list too long" error when the
 build directory is longer than 200, this is caused by:
@@ -23,10 +23,10 @@ Upstream-Status: Pending
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index fef6c4c61e3..57cf7804f0a 100644
+index a67d2cc18d6..480c9366418 100644
 --- a/gcc/Makefile.in
 +++ b/gcc/Makefile.in
-@@ -3538,7 +3538,7 @@ install-plugin: installdirs lang.install-plugin s-header-vars install-gengtype
+@@ -3606,7 +3606,7 @@ install-plugin: installdirs lang.install-plugin s-header-vars install-gengtype
  # We keep the directory structure for files in config or c-family and .def
  # files. All other files are flattened to a single directory.
  	$(mkinstalldirs) $(DESTDIR)$(plugin_includedir)
@@ -35,6 +35,3 @@ index fef6c4c61e3..57cf7804f0a 100644
  	srcdirstrip=`echo "$(srcdir)" | sed 's/[].[^$$\\*|]/\\\\&/g'`; \
  	for file in $$headers; do \
  	  if [ -f $$file ] ; then \
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0013-Disable-sdt.patch b/meta/recipes-devtools/gcc/gcc-10.1/0013-Disable-sdt.patch
similarity index 88%
rename from meta/recipes-devtools/gcc/gcc-9.3/0013-Disable-sdt.patch
rename to meta/recipes-devtools/gcc/gcc-10.1/0013-Disable-sdt.patch
index 455858354f..86e8767746 100644
--- a/meta/recipes-devtools/gcc/gcc-9.3/0013-Disable-sdt.patch
+++ b/meta/recipes-devtools/gcc/gcc-10.1/0013-Disable-sdt.patch
@@ -1,7 +1,7 @@
-From 4df5a747265983092afd6fbc5329dd808cc1da3c Mon Sep 17 00:00:00 2001
+From 99ca86472c85e2c7da0843b8eda85caa00b284c0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:28:10 +0400
-Subject: [PATCH 13/39] Disable sdt.
+Subject: [PATCH] Disable sdt.
 
 We don't list dtrace in DEPENDS so we shouldn't be depending on this header.
 It may or may not exist from preivous builds though. To be determinstic, disable
@@ -25,10 +25,10 @@ Upstream-Status: Inappropriate [hack]
  4 files changed, 19 insertions(+), 19 deletions(-)
 
 diff --git a/gcc/configure b/gcc/configure
-index ed7931daed3..52f52b0ec86 100755
+index b26e8fc7fee..6080f86145e 100755
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -29333,12 +29333,12 @@ fi
+@@ -29789,12 +29789,12 @@ fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking sys/sdt.h in the target C library" >&5
  $as_echo_n "checking sys/sdt.h in the target C library... " >&6; }
  have_sys_sdt_h=no
@@ -48,10 +48,10 @@ index ed7931daed3..52f52b0ec86 100755
  $as_echo "$have_sys_sdt_h" >&6; }
  
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index e0500e30d50..242ad28ec83 100644
+index 26fa46802c7..42be5252778 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -5995,15 +5995,15 @@ fi
+@@ -6190,15 +6190,15 @@ fi
  AC_SUBST([enable_default_ssp])
  
  # Test for <sys/sdt.h> on the target.
@@ -77,10 +77,10 @@ index e0500e30d50..242ad28ec83 100644
  # Check if TFmode long double should be used by default or not.
  # Some glibc targets used DFmode long double, but with glibc 2.4
 diff --git a/libstdc++-v3/configure b/libstdc++-v3/configure
-index 1225edc596b..3b89b880fc8 100755
+index 9f9c5a2419a..71ed13b815b 100755
 --- a/libstdc++-v3/configure
 +++ b/libstdc++-v3/configure
-@@ -22325,11 +22325,11 @@ ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
+@@ -22615,11 +22615,11 @@ ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
  ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
  ac_compiler_gnu=$ac_cv_c_compiler_gnu
  
@@ -96,10 +96,10 @@ index 1225edc596b..3b89b880fc8 100755
  $as_echo "$glibcxx_cv_sys_sdt_h" >&6; }
  
 diff --git a/libstdc++-v3/configure.ac b/libstdc++-v3/configure.ac
-index d8455e41574..844cf1acbce 100644
+index 699e55fd829..5c7a7bda439 100644
 --- a/libstdc++-v3/configure.ac
 +++ b/libstdc++-v3/configure.ac
-@@ -232,7 +232,7 @@ GLIBCXX_CHECK_SC_NPROCESSORS_ONLN
+@@ -241,7 +241,7 @@ GLIBCXX_CHECK_SC_NPROCESSORS_ONLN
  GLIBCXX_CHECK_SC_NPROC_ONLN
  GLIBCXX_CHECK_PTHREADS_NUM_PROCESSORS_NP
  GLIBCXX_CHECK_SYSCTL_HW_NCPU
@@ -108,6 +108,3 @@ index d8455e41574..844cf1acbce 100644
  
  # Check for available headers.
  AC_CHECK_HEADERS([endian.h execinfo.h float.h fp.h ieeefp.h inttypes.h \
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0014-libtool.patch b/meta/recipes-devtools/gcc/gcc-10.1/0014-libtool.patch
similarity index 87%
rename from meta/recipes-devtools/gcc/gcc-9.3/0014-libtool.patch
rename to meta/recipes-devtools/gcc/gcc-10.1/0014-libtool.patch
index 2953859238..891ef095e8 100644
--- a/meta/recipes-devtools/gcc/gcc-9.3/0014-libtool.patch
+++ b/meta/recipes-devtools/gcc/gcc-10.1/0014-libtool.patch
@@ -1,7 +1,7 @@
-From 34977d994666a90983c96a9240dfa3540562da35 Mon Sep 17 00:00:00 2001
+From 090ca1bebbfac906fb2b12742cd076f0f77b6f8c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:29:11 +0400
-Subject: [PATCH 14/39] libtool
+Subject: [PATCH] libtool
 
 libstdc++ from gcc-runtime gets created with -rpath=/usr/lib/../lib for qemux86-64
 when running on am x86_64 build host.
@@ -23,7 +23,7 @@ Upstream-Status: Pending
  1 file changed, 4 insertions(+)
 
 diff --git a/ltmain.sh b/ltmain.sh
-index 79f9ba89af5..8e222f7c16b 100644
+index 70990740b6c..ee938056bef 100644
 --- a/ltmain.sh
 +++ b/ltmain.sh
 @@ -6359,6 +6359,10 @@ func_mode_link ()
@@ -37,6 +37,3 @@ index 79f9ba89af5..8e222f7c16b 100644
  
        oldlibs=
        if test -z "$rpath"; then
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch b/meta/recipes-devtools/gcc/gcc-10.1/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
similarity index 87%
rename from meta/recipes-devtools/gcc/gcc-9.3/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
rename to meta/recipes-devtools/gcc/gcc-10.1/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
index d4445244e2..538aec382e 100644
--- a/meta/recipes-devtools/gcc/gcc-9.3/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
+++ b/meta/recipes-devtools/gcc/gcc-10.1/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
@@ -1,7 +1,7 @@
-From 4558ba7fa020c111f9a204021a418c0ce55d77f9 Mon Sep 17 00:00:00 2001
+From a330fdef98fa5b861a192724e5c4086f0cd8d94d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:30:32 +0400
-Subject: [PATCH 15/39] gcc: armv4: pass fix-v4bx to linker to support EABI.
+Subject: [PATCH] gcc: armv4: pass fix-v4bx to linker to support EABI.
 
 The LINK_SPEC for linux gets overwritten by linux-eabi.h which
 means the value of TARGET_FIX_V4BX_SPEC gets lost and as a result
@@ -19,12 +19,12 @@ Upstream-Status: Pending
  1 file changed, 5 insertions(+), 1 deletion(-)
 
 diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-eabi.h
-index e4ade2e2ab0..108863f69d2 100644
+index 0c0332f317f..7b3769e8459 100644
 --- a/gcc/config/arm/linux-eabi.h
 +++ b/gcc/config/arm/linux-eabi.h
 @@ -91,10 +91,14 @@
  #define MUSL_DYNAMIC_LINKER \
-   "/lib/ld-musl-arm" MUSL_DYNAMIC_LINKER_E "%{mfloat-abi=hard:hf}.so.1"
+   "/lib/ld-musl-arm" MUSL_DYNAMIC_LINKER_E "%{mfloat-abi=hard:hf}%{mfdpic:-fdpic}.so.1"
  
 +/* For armv4 we pass --fix-v4bx to linker to support EABI */
 +#undef TARGET_FIX_V4BX_SPEC
@@ -38,6 +38,3 @@ index e4ade2e2ab0..108863f69d2 100644
    LINUX_OR_ANDROID_LD (LINUX_TARGET_LINK_SPEC,				\
  		       LINUX_TARGET_LINK_SPEC " " ANDROID_LINK_SPEC)
  
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch b/meta/recipes-devtools/gcc/gcc-10.1/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch
similarity index 81%
rename from meta/recipes-devtools/gcc/gcc-9.3/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch
rename to meta/recipes-devtools/gcc/gcc-10.1/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch
index 6f0833ccda..bcc3dae2d0 100644
--- a/meta/recipes-devtools/gcc/gcc-9.3/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch
+++ b/meta/recipes-devtools/gcc/gcc-10.1/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch
@@ -1,8 +1,8 @@
-From 7effc632d65c2d72bf6fa32a219ec2f82fef9405 Mon Sep 17 00:00:00 2001
+From 275f1ce3d4ddae06fd254839b48516a3343702e7 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:33:04 +0400
-Subject: [PATCH 16/39] Use the multilib config files from ${B} instead of
- using the ones from ${S}
+Subject: [PATCH] Use the multilib config files from ${B} instead of using the
+ ones from ${S}
 
 Use the multilib config files from ${B} instead of using the ones from ${S}
 so that the source can be shared between gcc-cross-initial,
@@ -18,10 +18,10 @@ Upstream-Status: Inappropriate [configuration]
  2 files changed, 36 insertions(+), 8 deletions(-)
 
 diff --git a/gcc/configure b/gcc/configure
-index 52f52b0ec86..a5f208af7cf 100755
+index 6080f86145e..825a9652329 100755
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -12322,10 +12322,20 @@ done
+@@ -12685,10 +12685,20 @@ done
  tmake_file_=
  for f in ${tmake_file}
  do
@@ -44,9 +44,9 @@ index 52f52b0ec86..a5f208af7cf 100755
 +       ;;
 +  esac
  done
- tmake_file="${tmake_file_}"
+ tmake_file="${tmake_file_}${omp_device_property_tmake_file}"
  
-@@ -12336,6 +12346,10 @@ tm_file_list="options.h"
+@@ -12699,6 +12709,10 @@ tm_file_list="options.h"
  tm_include_list="options.h insn-constants.h"
  for f in $tm_file; do
    case $f in
@@ -58,10 +58,10 @@ index 52f52b0ec86..a5f208af7cf 100755
         f=`echo $f | sed 's/^..//'`
         tm_file_list="${tm_file_list} $f"
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 242ad28ec83..b7a7ead1c02 100644
+index 42be5252778..6099eb3251f 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -1948,10 +1948,20 @@ done
+@@ -2118,10 +2118,20 @@ done
  tmake_file_=
  for f in ${tmake_file}
  do
@@ -84,9 +84,9 @@ index 242ad28ec83..b7a7ead1c02 100644
 +       ;;
 +  esac
  done
- tmake_file="${tmake_file_}"
+ tmake_file="${tmake_file_}${omp_device_property_tmake_file}"
  
-@@ -1962,6 +1972,10 @@ tm_file_list="options.h"
+@@ -2132,6 +2142,10 @@ tm_file_list="options.h"
  tm_include_list="options.h insn-constants.h"
  for f in $tm_file; do
    case $f in
@@ -97,6 +97,3 @@ index 242ad28ec83..b7a7ead1c02 100644
      ./* )
         f=`echo $f | sed 's/^..//'`
         tm_file_list="${tm_file_list} $f"
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch b/meta/recipes-devtools/gcc/gcc-10.1/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
similarity index 76%
rename from meta/recipes-devtools/gcc/gcc-9.3/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
rename to meta/recipes-devtools/gcc/gcc-10.1/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
index 96da013bf2..7bb8f2c8fc 100644
--- a/meta/recipes-devtools/gcc/gcc-9.3/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
+++ b/meta/recipes-devtools/gcc/gcc-10.1/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
@@ -1,8 +1,8 @@
-From a2b2bf77621f344a849e55ab179ece8587d19234 Mon Sep 17 00:00:00 2001
+From 92d6cdbaf247f006b9763bdc2eae9e1360de36f5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 09:39:38 +0000
-Subject: [PATCH 17/39] Avoid using libdir from .la which usually points to a
- host path
+Subject: [PATCH] Avoid using libdir from .la which usually points to a host
+ path
 
 Upstream-Status: Inappropriate [embedded specific]
 
@@ -13,7 +13,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 3 insertions(+)
 
 diff --git a/ltmain.sh b/ltmain.sh
-index 8e222f7c16b..0a93b4e5c3b 100644
+index ee938056bef..9ebc7e3d1e0 100644
 --- a/ltmain.sh
 +++ b/ltmain.sh
 @@ -5628,6 +5628,9 @@ func_mode_link ()
@@ -26,6 +26,3 @@ index 8e222f7c16b..0a93b4e5c3b 100644
  	    dir="$libdir"
  	    absdir="$libdir"
  	  fi
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0018-export-CPP.patch b/meta/recipes-devtools/gcc/gcc-10.1/0018-export-CPP.patch
similarity index 93%
rename from meta/recipes-devtools/gcc/gcc-9.3/0018-export-CPP.patch
rename to meta/recipes-devtools/gcc/gcc-10.1/0018-export-CPP.patch
index 2385099c25..e0066c6879 100644
--- a/meta/recipes-devtools/gcc/gcc-9.3/0018-export-CPP.patch
+++ b/meta/recipes-devtools/gcc/gcc-10.1/0018-export-CPP.patch
@@ -1,7 +1,7 @@
-From cafb6a621c05c1f238679d52fc026446f38c8af5 Mon Sep 17 00:00:00 2001
+From a2b9f99ec24cf1471cd10a423fb781ec88cdb1bf Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 09:40:59 +0000
-Subject: [PATCH 18/39] export CPP
+Subject: [PATCH] export CPP
 
 The OE environment sets and exports CPP as being the target gcc. When
 building gcc-cross-canadian for a mingw targetted sdk, the following can be found
@@ -37,7 +37,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/Makefile.in b/Makefile.in
-index 64e091ba71d..255822e3f27 100644
+index 36e369df6e7..c717903bb13 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -149,6 +149,7 @@ BUILD_EXPORTS = \
@@ -48,6 +48,3 @@ index 64e091ba71d..255822e3f27 100644
  	CFLAGS="$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
  	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
  	CXX="$(CXX_FOR_BUILD)"; export CXX; \
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0019-Ensure-target-gcc-headers-can-be-included.patch b/meta/recipes-devtools/gcc/gcc-10.1/0019-Ensure-target-gcc-headers-can-be-included.patch
similarity index 88%
rename from meta/recipes-devtools/gcc/gcc-9.3/0019-Ensure-target-gcc-headers-can-be-included.patch
rename to meta/recipes-devtools/gcc/gcc-10.1/0019-Ensure-target-gcc-headers-can-be-included.patch
index e0129d1f96..b080d64ae2 100644
--- a/meta/recipes-devtools/gcc/gcc-9.3/0019-Ensure-target-gcc-headers-can-be-included.patch
+++ b/meta/recipes-devtools/gcc/gcc-10.1/0019-Ensure-target-gcc-headers-can-be-included.patch
@@ -1,7 +1,7 @@
-From 182057b80891edc0e8d46835e2d8bfd28330a55a Mon Sep 17 00:00:00 2001
+From a7865306b0b6b10154f7ae42aeb4824eb378e5ca Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 10:25:11 +0000
-Subject: [PATCH 19/39] Ensure target gcc headers can be included
+Subject: [PATCH] Ensure target gcc headers can be included
 
 There are a few headers installed as part of the OpenEmbedded
 gcc-runtime target (omp.h, ssp/*.h). Being installed from a recipe
@@ -21,7 +21,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 6 insertions(+)
 
 diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index 57cf7804f0a..7772342ad5e 100644
+index 480c9366418..011c7ac2db6 100644
 --- a/gcc/Makefile.in
 +++ b/gcc/Makefile.in
 @@ -618,6 +618,7 @@ libexecdir = @libexecdir@
@@ -32,7 +32,7 @@ index 57cf7804f0a..7772342ad5e 100644
  # Directory in which the compiler finds executables
  libexecsubdir = $(libexecdir)/gcc/$(real_target_noncanonical)/$(version)$(accel_dir_suffix)
  # Directory in which all plugin resources are installed
-@@ -2867,6 +2868,7 @@ CFLAGS-intl.o += -DLOCALEDIR=\"$(localedir)\"
+@@ -2946,6 +2947,7 @@ CFLAGS-intl.o += -DLOCALEDIR=\"$(localedir)\"
  
  PREPROCESSOR_DEFINES = \
    -DGCC_INCLUDE_DIR=\"$(libsubdir)/include\" \
@@ -41,7 +41,7 @@ index 57cf7804f0a..7772342ad5e 100644
    -DGPLUSPLUS_INCLUDE_DIR=\"$(gcc_gxx_include_dir)\" \
    -DGPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT=$(gcc_gxx_include_dir_add_sysroot) \
 diff --git a/gcc/cppdefault.c b/gcc/cppdefault.c
-index c4796385643..980e2bd47a7 100644
+index af38cc494ea..2f43b88a0c3 100644
 --- a/gcc/cppdefault.c
 +++ b/gcc/cppdefault.c
 @@ -59,6 +59,10 @@ const struct default_include cpp_include_defaults[]
@@ -55,6 +55,3 @@ index c4796385643..980e2bd47a7 100644
  #ifdef LOCAL_INCLUDE_DIR
      /* /usr/local/include comes before the fixincluded header files.  */
      { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 2 },
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0021-Don-t-search-host-directory-during-relink-if-inst_pr.patch b/meta/recipes-devtools/gcc/gcc-10.1/0020-Don-t-search-host-directory-during-relink-if-inst_pr.patch
similarity index 80%
rename from meta/recipes-devtools/gcc/gcc-9.3/0021-Don-t-search-host-directory-during-relink-if-inst_pr.patch
rename to meta/recipes-devtools/gcc/gcc-10.1/0020-Don-t-search-host-directory-during-relink-if-inst_pr.patch
index e363c7d445..100ba4cf7b 100644
--- a/meta/recipes-devtools/gcc/gcc-9.3/0021-Don-t-search-host-directory-during-relink-if-inst_pr.patch
+++ b/meta/recipes-devtools/gcc/gcc-10.1/0020-Don-t-search-host-directory-during-relink-if-inst_pr.patch
@@ -1,8 +1,8 @@
-From f3edad81d80dde5d64bf77e6abafda54db10b824 Mon Sep 17 00:00:00 2001
+From 6a6e9e81777b1720ca24afcd481bb93b5e02a5cc Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 3 Mar 2015 08:21:19 +0000
-Subject: [PATCH 21/39] Don't search host directory during "relink" if
- $inst_prefix is provided
+Subject: [PATCH] Don't search host directory during "relink" if $inst_prefix
+ is provided
 
 http://lists.gnu.org/archive/html/libtool-patches/2011-01/msg00026.html
 
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/ltmain.sh b/ltmain.sh
-index 0a93b4e5c3b..6de6ed2f9a0 100644
+index 9ebc7e3d1e0..7ea79fa8be6 100644
 --- a/ltmain.sh
 +++ b/ltmain.sh
 @@ -6004,12 +6004,13 @@ func_mode_link ()
@@ -33,6 +33,3 @@ index 0a93b4e5c3b..6de6ed2f9a0 100644
  		    ;;
  		esac
  	      fi
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0022-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch b/meta/recipes-devtools/gcc/gcc-10.1/0021-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
similarity index 81%
rename from meta/recipes-devtools/gcc/gcc-9.3/0022-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
rename to meta/recipes-devtools/gcc/gcc-10.1/0021-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
index 846c0de5e8..aec7d2d380 100644
--- a/meta/recipes-devtools/gcc/gcc-9.3/0022-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
+++ b/meta/recipes-devtools/gcc/gcc-10.1/0021-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
@@ -1,7 +1,7 @@
-From b8ea2c2c7d33376f5dd651646c7e822000e47749 Mon Sep 17 00:00:00 2001
+From 60881e48c0b86dc6f3f0396b41c11889e00e82dd Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 28 Apr 2015 23:15:27 -0700
-Subject: [PATCH 22/39] Use SYSTEMLIBS_DIR replacement instead of hardcoding
+Subject: [PATCH] Use SYSTEMLIBS_DIR replacement instead of hardcoding
  base_libdir
 
 Upstream-Status: Pending
@@ -12,7 +12,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64/aarch64-linux.h
-index 5e8b34ded03..7e628bf661e 100644
+index e587e2e9ad6..ddc62895693 100644
 --- a/gcc/config/aarch64/aarch64-linux.h
 +++ b/gcc/config/aarch64/aarch64-linux.h
 @@ -21,7 +21,7 @@
@@ -24,6 +24,3 @@ index 5e8b34ded03..7e628bf661e 100644
  
  #undef MUSL_DYNAMIC_LINKER
  #define MUSL_DYNAMIC_LINKER "/lib/ld-musl-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0023-aarch64-Add-support-for-musl-ldso.patch b/meta/recipes-devtools/gcc/gcc-10.1/0022-aarch64-Add-support-for-musl-ldso.patch
similarity index 83%
rename from meta/recipes-devtools/gcc/gcc-9.3/0023-aarch64-Add-support-for-musl-ldso.patch
rename to meta/recipes-devtools/gcc/gcc-10.1/0022-aarch64-Add-support-for-musl-ldso.patch
index 102d6fc742..38e97d6a98 100644
--- a/meta/recipes-devtools/gcc/gcc-9.3/0023-aarch64-Add-support-for-musl-ldso.patch
+++ b/meta/recipes-devtools/gcc/gcc-10.1/0022-aarch64-Add-support-for-musl-ldso.patch
@@ -1,7 +1,7 @@
-From 8645b57e7c0dfd93afee5caeaa534c714f449ba1 Mon Sep 17 00:00:00 2001
+From 0c8042292764c40bc37b42c7fdba9172993c2336 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 28 Apr 2015 23:18:39 -0700
-Subject: [PATCH 23/39] aarch64: Add support for musl ldso
+Subject: [PATCH] aarch64: Add support for musl ldso
 
 Upstream-Status: Pending
 
@@ -11,7 +11,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64/aarch64-linux.h
-index 7e628bf661e..1717cbe5471 100644
+index ddc62895693..b301825313a 100644
 --- a/gcc/config/aarch64/aarch64-linux.h
 +++ b/gcc/config/aarch64/aarch64-linux.h
 @@ -24,7 +24,7 @@
@@ -23,6 +23,3 @@ index 7e628bf661e..1717cbe5471 100644
  
  #undef  ASAN_CC1_SPEC
  #define ASAN_CC1_SPEC "%{%:sanitize(address):-funwind-tables}"
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0024-libcc1-fix-libcc1-s-install-path-and-rpath.patch b/meta/recipes-devtools/gcc/gcc-10.1/0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch
similarity index 91%
rename from meta/recipes-devtools/gcc/gcc-9.3/0024-libcc1-fix-libcc1-s-install-path-and-rpath.patch
rename to meta/recipes-devtools/gcc/gcc-10.1/0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch
index 443e0a2ca6..09d4bf606a 100644
--- a/meta/recipes-devtools/gcc/gcc-9.3/0024-libcc1-fix-libcc1-s-install-path-and-rpath.patch
+++ b/meta/recipes-devtools/gcc/gcc-10.1/0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch
@@ -1,7 +1,7 @@
-From b1666565e4e133ee41f32fa8032165bcb06afe9a Mon Sep 17 00:00:00 2001
+From 74334be2ef31fdc7f585b44a086e1d738b4fcc56 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Sun, 5 Jul 2015 20:25:18 -0700
-Subject: [PATCH 24/39] libcc1: fix libcc1's install path and rpath
+Subject: [PATCH] libcc1: fix libcc1's install path and rpath
 
 * Install libcc1.so and libcc1plugin.so into
   $(libexecdir)/gcc/$(target_noncanonical)/$(gcc_version), as what we
@@ -20,7 +20,7 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  2 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/libcc1/Makefile.am b/libcc1/Makefile.am
-index 72c6aead475..42a87740b31 100644
+index c005b0dad4a..ec31d35b7b9 100644
 --- a/libcc1/Makefile.am
 +++ b/libcc1/Makefile.am
 @@ -37,8 +37,8 @@ libiberty = $(if $(wildcard $(libiberty_noasan)),$(Wc)$(libiberty_noasan), \
@@ -49,6 +49,3 @@ index 7104b649026..2103c477468 100644
  @ENABLE_PLUGIN_TRUE@plugin_LTLIBRARIES = libcc1plugin.la libcp1plugin.la
  @ENABLE_PLUGIN_TRUE@cc1lib_LTLIBRARIES = libcc1.la
  shared_source = callbacks.cc callbacks.hh connection.cc connection.hh \
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0025-handle-sysroot-support-for-nativesdk-gcc.patch b/meta/recipes-devtools/gcc/gcc-10.1/0024-handle-sysroot-support-for-nativesdk-gcc.patch
similarity index 84%
rename from meta/recipes-devtools/gcc/gcc-9.3/0025-handle-sysroot-support-for-nativesdk-gcc.patch
rename to meta/recipes-devtools/gcc/gcc-10.1/0024-handle-sysroot-support-for-nativesdk-gcc.patch
index 59ac97eaed..3f04a49be0 100644
--- a/meta/recipes-devtools/gcc/gcc-9.3/0025-handle-sysroot-support-for-nativesdk-gcc.patch
+++ b/meta/recipes-devtools/gcc/gcc-10.1/0024-handle-sysroot-support-for-nativesdk-gcc.patch
@@ -1,7 +1,7 @@
-From 7d614a84709d7dc4a2529c3d529e2da8541f9fd4 Mon Sep 17 00:00:00 2001
+From 466bc27ac26fbd467c3ffab62b3571e477909fb5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 7 Dec 2015 23:39:54 +0000
-Subject: [PATCH 25/39] handle sysroot support for nativesdk-gcc
+Subject: [PATCH] handle sysroot support for nativesdk-gcc
 
 Being able to build a nativesdk gcc is useful, particularly in cases
 where the host compiler may be of an incompatible version (or a 32
@@ -32,18 +32,33 @@ implementation.)
 
 Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
 ---
- c-family/c-opts.c |    4 +--
- cppdefault.c      |   63 +++++++++++++++++++++++++++++++++---------------------
- cppdefault.h      |   13 ++++-------
- gcc.c             |   20 ++++++++++++-----
- incpath.c         |   12 +++++-----
- prefix.c          |    4 +--
- 6 files changed, 68 insertions(+), 48 deletions(-)
+ gcc/c-family/c-opts.c |  4 +--
+ gcc/cppdefault.c      | 63 ++++++++++++++++++++++++++-----------------
+ gcc/cppdefault.h      | 13 ++++-----
+ gcc/gcc.c             | 20 +++++++++-----
+ gcc/incpath.c         | 12 ++++-----
+ gcc/prefix.c          |  6 +++--
+ 6 files changed, 70 insertions(+), 48 deletions(-)
 
-Index: gcc-9.3.0/gcc/cppdefault.c
-===================================================================
---- gcc-9.3.0.orig/gcc/cppdefault.c
-+++ gcc-9.3.0/gcc/cppdefault.c
+diff --git a/gcc/c-family/c-opts.c b/gcc/c-family/c-opts.c
+index 58ba0948e79..806bbcfb7a5 100644
+--- a/gcc/c-family/c-opts.c
++++ b/gcc/c-family/c-opts.c
+@@ -1409,8 +1409,8 @@ add_prefixed_path (const char *suffix, incpath_kind chain)
+   size_t prefix_len, suffix_len;
+ 
+   suffix_len = strlen (suffix);
+-  prefix     = iprefix ? iprefix : cpp_GCC_INCLUDE_DIR;
+-  prefix_len = iprefix ? strlen (iprefix) : cpp_GCC_INCLUDE_DIR_len;
++  prefix     = iprefix ? iprefix : GCC_INCLUDE_DIRVAR;
++  prefix_len = iprefix ? strlen (iprefix) : strlen(GCC_INCLUDE_DIRVAR) - 7;
+ 
+   path = (char *) xmalloc (prefix_len + suffix_len + 1);
+   memcpy (path, prefix, prefix_len);
+diff --git a/gcc/cppdefault.c b/gcc/cppdefault.c
+index 2f43b88a0c3..6b6be04686c 100644
+--- a/gcc/cppdefault.c
++++ b/gcc/cppdefault.c
 @@ -35,6 +35,30 @@
  # undef CROSS_INCLUDE_DIR
  #endif
@@ -75,7 +90,7 @@ Index: gcc-9.3.0/gcc/cppdefault.c
  const struct default_include cpp_include_defaults[]
  #ifdef INCLUDE_DEFAULTS
  = INCLUDE_DEFAULTS;
-@@ -42,38 +66,38 @@ const struct default_include cpp_include
+@@ -42,38 +66,38 @@ const struct default_include cpp_include_defaults[]
  = {
  #ifdef GPLUSPLUS_INCLUDE_DIR
      /* Pick up GNU C++ generic include files.  */
@@ -123,7 +138,7 @@ Index: gcc-9.3.0/gcc/cppdefault.c
        /* A multilib suffix needs adding if different multilibs use
  	 different headers.  */
  #ifdef SYSROOT_HEADERS_SUFFIX_SPEC
-@@ -85,33 +109,24 @@ const struct default_include cpp_include
+@@ -85,33 +109,24 @@ const struct default_include cpp_include_defaults[]
  #endif
  #ifdef CROSS_INCLUDE_DIR
      /* One place the target system's headers might be.  */
@@ -163,10 +178,10 @@ Index: gcc-9.3.0/gcc/cppdefault.c
  
  /* This value is set by cpp_relocated at runtime */
  const char *gcc_exec_prefix;
-Index: gcc-9.3.0/gcc/cppdefault.h
-===================================================================
---- gcc-9.3.0.orig/gcc/cppdefault.h
-+++ gcc-9.3.0/gcc/cppdefault.h
+diff --git a/gcc/cppdefault.h b/gcc/cppdefault.h
+index a681264f75e..5e10a2fa140 100644
+--- a/gcc/cppdefault.h
++++ b/gcc/cppdefault.h
 @@ -33,7 +33,8 @@
  
  struct default_include
@@ -198,11 +213,11 @@ Index: gcc-9.3.0/gcc/cppdefault.h
  /* The run-time execution prefix.  This is typically the lib/gcc
     subdirectory of the actual installation.  */
  extern const char *gcc_exec_prefix;
-Index: gcc-9.3.0/gcc/gcc.c
-===================================================================
---- gcc-9.3.0.orig/gcc/gcc.c
-+++ gcc-9.3.0/gcc/gcc.c
-@@ -253,6 +253,8 @@ FILE *report_times_to_file = NULL;
+diff --git a/gcc/gcc.c b/gcc/gcc.c
+index c87f603955f..535d5c3bb65 100644
+--- a/gcc/gcc.c
++++ b/gcc/gcc.c
+@@ -252,6 +252,8 @@ FILE *report_times_to_file = NULL;
  #endif
  static const char *target_system_root = DEFAULT_TARGET_SYSTEM_ROOT;
  
@@ -211,7 +226,7 @@ Index: gcc-9.3.0/gcc/gcc.c
  /* Nonzero means pass the updated target_system_root to the compiler.  */
  
  static int target_system_root_changed;
-@@ -527,6 +529,7 @@ or with constant text in a single argume
+@@ -526,6 +528,7 @@ or with constant text in a single argument.
   %G     process LIBGCC_SPEC as a spec.
   %R     Output the concatenation of target_system_root and
          target_sysroot_suffix.
@@ -219,7 +234,7 @@ Index: gcc-9.3.0/gcc/gcc.c
   %S     process STARTFILE_SPEC as a spec.  A capital S is actually used here.
   %E     process ENDFILE_SPEC as a spec.  A capital E is actually used here.
   %C     process CPP_SPEC as a spec.
-@@ -1500,10 +1503,10 @@ static const char *gcc_libexec_prefix;
+@@ -1499,10 +1502,10 @@ static const char *gcc_libexec_prefix;
     gcc_exec_prefix is set because, in that case, we know where the
     compiler has been installed, and use paths relative to that
     location instead.  */
@@ -234,7 +249,7 @@ Index: gcc-9.3.0/gcc/gcc.c
  
  /* For native compilers, these are well-known paths containing
     components that may be provided by the system.  For cross
-@@ -1511,9 +1514,9 @@ static const char *const standard_startf
+@@ -1510,9 +1513,9 @@ static const char *const standard_startfile_prefix = STANDARD_STARTFILE_PREFIX;
  static const char *md_exec_prefix = MD_EXEC_PREFIX;
  static const char *md_startfile_prefix = MD_STARTFILE_PREFIX;
  static const char *md_startfile_prefix_1 = MD_STARTFILE_PREFIX_1;
@@ -246,7 +261,7 @@ Index: gcc-9.3.0/gcc/gcc.c
    = STANDARD_STARTFILE_PREFIX_2;
  
  /* A relative path to be used in finding the location of tools
-@@ -5922,6 +5925,11 @@ do_spec_1 (const char *spec, int inswitc
+@@ -5952,6 +5955,11 @@ do_spec_1 (const char *spec, int inswitch, const char *soft_matched_part)
  	      }
  	    break;
  
@@ -258,26 +273,11 @@ Index: gcc-9.3.0/gcc/gcc.c
  	  case 'S':
  	    value = do_spec_1 (startfile_spec, 0, NULL);
  	    if (value != 0)
-Index: gcc-9.3.0/gcc/c-family/c-opts.c
-===================================================================
---- gcc-9.3.0.orig/gcc/c-family/c-opts.c
-+++ gcc-9.3.0/gcc/c-family/c-opts.c
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
-Index: gcc-9.3.0/gcc/incpath.c
-===================================================================
---- gcc-9.3.0.orig/gcc/incpath.c
-+++ gcc-9.3.0/gcc/incpath.c
-@@ -131,7 +131,7 @@ add_standard_paths (const char *sysroot,
+diff --git a/gcc/incpath.c b/gcc/incpath.c
+index 9098ab044ab..bfad4ebe382 100644
+--- a/gcc/incpath.c
++++ b/gcc/incpath.c
+@@ -131,7 +131,7 @@ add_standard_paths (const char *sysroot, const char *iprefix,
    int relocated = cpp_relocated ();
    size_t len;
  
@@ -286,7 +286,7 @@ Index: gcc-9.3.0/gcc/incpath.c
      {
        /* Look for directories that start with the standard prefix.
  	 "Translate" them, i.e. replace /usr/local/lib/gcc... with
-@@ -145,7 +145,7 @@ add_standard_paths (const char *sysroot,
+@@ -145,7 +145,7 @@ add_standard_paths (const char *sysroot, const char *iprefix,
  		 now.  */
  	      if (sysroot && p->add_sysroot)
  		continue;
@@ -295,7 +295,7 @@ Index: gcc-9.3.0/gcc/incpath.c
  		{
  		  char *str = concat (iprefix, p->fname + len, NULL);
  		  if (p->multilib == 1 && imultilib)
-@@ -185,7 +185,7 @@ add_standard_paths (const char *sysroot,
+@@ -185,7 +185,7 @@ add_standard_paths (const char *sysroot, const char *iprefix,
  	      free (sysroot_no_trailing_dir_separator);
  	    }
  	  else if (!p->add_sysroot && relocated
@@ -304,7 +304,7 @@ Index: gcc-9.3.0/gcc/incpath.c
  	    {
   	      static const char *relocated_prefix;
  	      char *ostr;
-@@ -202,12 +202,12 @@ add_standard_paths (const char *sysroot,
+@@ -202,12 +202,12 @@ add_standard_paths (const char *sysroot, const char *iprefix,
  		  dummy = concat (gcc_exec_prefix, "dummy", NULL);
  		  relocated_prefix
  		    = make_relative_prefix (dummy,
@@ -320,11 +320,11 @@ Index: gcc-9.3.0/gcc/incpath.c
  			     NULL);
  	      str = update_path (ostr, p->component);
  	      free (ostr);
-Index: gcc-9.3.0/gcc/prefix.c
-===================================================================
---- gcc-9.3.0.orig/gcc/prefix.c
-+++ gcc-9.3.0/gcc/prefix.c
-@@ -72,7 +72,9 @@ License along with GCC; see the file COP
+diff --git a/gcc/prefix.c b/gcc/prefix.c
+index 1a403e535bd..3257ed3cd3e 100644
+--- a/gcc/prefix.c
++++ b/gcc/prefix.c
+@@ -72,7 +72,9 @@ License along with GCC; see the file COPYING3.  If not see
  #include "prefix.h"
  #include "common/common-target.h"
  
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0026-Search-target-sysroot-gcc-version-specific-dirs-with.patch b/meta/recipes-devtools/gcc/gcc-10.1/0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch
similarity index 90%
rename from meta/recipes-devtools/gcc/gcc-9.3/0026-Search-target-sysroot-gcc-version-specific-dirs-with.patch
rename to meta/recipes-devtools/gcc/gcc-10.1/0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch
index abfa7516da..fb1082669e 100644
--- a/meta/recipes-devtools/gcc/gcc-9.3/0026-Search-target-sysroot-gcc-version-specific-dirs-with.patch
+++ b/meta/recipes-devtools/gcc/gcc-10.1/0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch
@@ -1,7 +1,7 @@
-From 6c39a22c3e85d20dee9e2fc2274e95da980de4d0 Mon Sep 17 00:00:00 2001
+From 0c7d9d41a14ce5eb9ea1b691855c46ac95347ee0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 7 Dec 2015 23:41:45 +0000
-Subject: [PATCH 26/39] Search target sysroot gcc version specific dirs with
+Subject: [PATCH] Search target sysroot gcc version specific dirs with
  multilib.
 
 We install the gcc libraries (such as crtbegin.p) into
@@ -51,10 +51,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 28 insertions(+), 1 deletion(-)
 
 diff --git a/gcc/gcc.c b/gcc/gcc.c
-index 59fb64f5fd5..3e79da4238c 100644
+index 535d5c3bb65..04647ae812d 100644
 --- a/gcc/gcc.c
 +++ b/gcc/gcc.c
-@@ -2617,7 +2617,7 @@ for_each_path (const struct path_prefix *paths,
+@@ -2616,7 +2616,7 @@ for_each_path (const struct path_prefix *paths,
        if (path == NULL)
  	{
  	  len = paths->max_len + extra_space + 1;
@@ -63,7 +63,7 @@ index 59fb64f5fd5..3e79da4238c 100644
  	  path = XNEWVEC (char, len);
  	}
  
-@@ -2629,6 +2629,33 @@ for_each_path (const struct path_prefix *paths,
+@@ -2628,6 +2628,33 @@ for_each_path (const struct path_prefix *paths,
  	  /* Look first in MACHINE/VERSION subdirectory.  */
  	  if (!skip_multi_dir)
  	    {
@@ -97,6 +97,3 @@ index 59fb64f5fd5..3e79da4238c 100644
  	      memcpy (path + len, multi_suffix, suffix_len + 1);
  	      ret = callback (path, callback_info);
  	      if (ret)
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0027-Fix-various-_FOR_BUILD-and-related-variables.patch b/meta/recipes-devtools/gcc/gcc-10.1/0026-Fix-various-_FOR_BUILD-and-related-variables.patch
similarity index 89%
rename from meta/recipes-devtools/gcc/gcc-9.3/0027-Fix-various-_FOR_BUILD-and-related-variables.patch
rename to meta/recipes-devtools/gcc/gcc-10.1/0026-Fix-various-_FOR_BUILD-and-related-variables.patch
index ae8acc7f13..988695e59e 100644
--- a/meta/recipes-devtools/gcc/gcc-9.3/0027-Fix-various-_FOR_BUILD-and-related-variables.patch
+++ b/meta/recipes-devtools/gcc/gcc-10.1/0026-Fix-various-_FOR_BUILD-and-related-variables.patch
@@ -1,7 +1,7 @@
-From 07db34b16b6c8e3d948b417f2fc052500ffb77d3 Mon Sep 17 00:00:00 2001
+From b082a610095dd6c1356ece47ca320a300464b405 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 7 Dec 2015 23:42:45 +0000
-Subject: [PATCH 27/39] Fix various _FOR_BUILD and related variables
+Subject: [PATCH] Fix various _FOR_BUILD and related variables
 
 When doing a FOR_BUILD thing, you have to override CFLAGS with
 CFLAGS_FOR_BUILD. And if you use C++, you also have to override
@@ -26,7 +26,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  5 files changed, 14 insertions(+), 3 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 255822e3f27..9dc0dff0474 100644
+index c717903bb13..5abc649868d 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -152,6 +152,7 @@ BUILD_EXPORTS = \
@@ -55,7 +55,7 @@ index 255822e3f27..9dc0dff0474 100644
  	ADA_CFLAGS="$(ADA_CFLAGS)"; export ADA_CFLAGS; \
  	CFLAGS="$(CFLAGS)"; export CFLAGS; \
  	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
-@@ -775,6 +780,7 @@ BASE_FLAGS_TO_PASS = \
+@@ -776,6 +781,7 @@ BASE_FLAGS_TO_PASS = \
  	"CC_FOR_BUILD=$(CC_FOR_BUILD)" \
  	"CFLAGS_FOR_BUILD=$(CFLAGS_FOR_BUILD)" \
  	"CXX_FOR_BUILD=$(CXX_FOR_BUILD)" \
@@ -64,7 +64,7 @@ index 255822e3f27..9dc0dff0474 100644
  	"FLEX=$(FLEX)" \
  	"INSTALL=$(INSTALL)" \
 diff --git a/Makefile.tpl b/Makefile.tpl
-index 41cae58a267..d3f6b79acdc 100644
+index efed1511750..778beb705b4 100644
 --- a/Makefile.tpl
 +++ b/Makefile.tpl
 @@ -154,6 +154,7 @@ BUILD_EXPORTS = \
@@ -94,7 +94,7 @@ index 41cae58a267..d3f6b79acdc 100644
  	CFLAGS="$(CFLAGS)"; export CFLAGS; \
  	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
 diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index 7772342ad5e..02fec881b6d 100644
+index 011c7ac2db6..2f1165f7b5e 100644
 --- a/gcc/Makefile.in
 +++ b/gcc/Makefile.in
 @@ -805,7 +805,7 @@ BUILD_LDFLAGS=@BUILD_LDFLAGS@
@@ -107,10 +107,10 @@ index 7772342ad5e..02fec881b6d 100644
  # Actual name to use when installing a native compiler.
  GCC_INSTALL_NAME := $(shell echo gcc|sed '$(program_transform_name)')
 diff --git a/gcc/configure b/gcc/configure
-index a5f208af7cf..0788b7bf0b5 100755
+index 825a9652329..ff46cf58960 100755
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -11966,7 +11966,7 @@ else
+@@ -12314,7 +12314,7 @@ else
  	CC="${CC_FOR_BUILD}" CFLAGS="${CFLAGS_FOR_BUILD}" \
  	CXX="${CXX_FOR_BUILD}" CXXFLAGS="${CXXFLAGS_FOR_BUILD}" \
  	LD="${LD_FOR_BUILD}" LDFLAGS="${LDFLAGS_FOR_BUILD}" \
@@ -118,12 +118,12 @@ index a5f208af7cf..0788b7bf0b5 100755
 +	GMPINC="" CPPFLAGS="${CPPFLAGS_FOR_BUILD} -DGENERATOR_FILE" \
  	${realsrcdir}/configure \
  		--enable-languages=${enable_languages-all} \
- 		--target=$target_alias --host=$build_alias --build=$build_alias
+ 		${enable_obsolete+--enable-obsolete="$enable_obsolete"} \
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index b7a7ead1c02..5ab50fae0f3 100644
+index 6099eb3251f..b3c345b61dc 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -1743,7 +1743,7 @@ else
+@@ -1898,7 +1898,7 @@ else
  	CC="${CC_FOR_BUILD}" CFLAGS="${CFLAGS_FOR_BUILD}" \
  	CXX="${CXX_FOR_BUILD}" CXXFLAGS="${CXXFLAGS_FOR_BUILD}" \
  	LD="${LD_FOR_BUILD}" LDFLAGS="${LDFLAGS_FOR_BUILD}" \
@@ -131,7 +131,4 @@ index b7a7ead1c02..5ab50fae0f3 100644
 +	GMPINC="" CPPFLAGS="${CPPFLAGS_FOR_BUILD} -DGENERATOR_FILE" \
  	${realsrcdir}/configure \
  		--enable-languages=${enable_languages-all} \
- 		--target=$target_alias --host=$build_alias --build=$build_alias
--- 
-2.25.1
-
+ 		${enable_obsolete+--enable-obsolete="$enable_obsolete"} \
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0028-nios2-Define-MUSL_DYNAMIC_LINKER.patch b/meta/recipes-devtools/gcc/gcc-10.1/0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch
similarity index 79%
rename from meta/recipes-devtools/gcc/gcc-9.3/0028-nios2-Define-MUSL_DYNAMIC_LINKER.patch
rename to meta/recipes-devtools/gcc/gcc-10.1/0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch
index 52a5d97aef..dc76b5f8ad 100644
--- a/meta/recipes-devtools/gcc/gcc-9.3/0028-nios2-Define-MUSL_DYNAMIC_LINKER.patch
+++ b/meta/recipes-devtools/gcc/gcc-10.1/0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch
@@ -1,7 +1,7 @@
-From 59543e897eb35194fb47288f7762e40a18fff611 Mon Sep 17 00:00:00 2001
+From 3a11dc504eb8dae5ed0e575cfe8ba704ba1ceba3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 2 Feb 2016 10:26:10 -0800
-Subject: [PATCH 28/39] nios2: Define MUSL_DYNAMIC_LINKER
+Subject: [PATCH] nios2: Define MUSL_DYNAMIC_LINKER
 
 Upstream-Status: Pending
 
@@ -12,7 +12,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/gcc/config/nios2/linux.h b/gcc/config/nios2/linux.h
-index 698734add35..eeee60ecfea 100644
+index 4bdcdcca1f0..e7943a9d640 100644
 --- a/gcc/config/nios2/linux.h
 +++ b/gcc/config/nios2/linux.h
 @@ -30,6 +30,7 @@
@@ -23,6 +23,3 @@ index 698734add35..eeee60ecfea 100644
  
  #undef LINK_SPEC
  #define LINK_SPEC LINK_SPEC_ENDIAN \
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0029-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch b/meta/recipes-devtools/gcc/gcc-10.1/0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
similarity index 89%
rename from meta/recipes-devtools/gcc/gcc-9.3/0029-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
rename to meta/recipes-devtools/gcc/gcc-10.1/0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
index bfa7e19dd0..f7082c3875 100644
--- a/meta/recipes-devtools/gcc/gcc-9.3/0029-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
+++ b/meta/recipes-devtools/gcc/gcc-10.1/0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
@@ -1,7 +1,7 @@
-From 8df99af0a65ef740bcf2b7dc9a109cc57f15c3aa Mon Sep 17 00:00:00 2001
+From d93fa8c7060d748065b6bf9d2e948c84fc58098a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 27 Jun 2017 18:10:54 -0700
-Subject: [PATCH 29/39] Add ssp_nonshared to link commandline for musl targets
+Subject: [PATCH] Add ssp_nonshared to link commandline for musl targets
 
 when -fstack-protector options are enabled we need to
 link with ssp_shared on musl since it does not provide
@@ -23,7 +23,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  3 files changed, 27 insertions(+)
 
 diff --git a/gcc/config/linux.h b/gcc/config/linux.h
-index 4b05d8e93d1..0ca117e2ed4 100644
+index 0c1a8118a26..bdc2a2d0659 100644
 --- a/gcc/config/linux.h
 +++ b/gcc/config/linux.h
 @@ -195,6 +195,13 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
@@ -41,7 +41,7 @@ index 4b05d8e93d1..0ca117e2ed4 100644
  
  #if (DEFAULT_LIBC == LIBC_UCLIBC) && defined (SINGLE_LIBC) /* uClinux */
 diff --git a/gcc/config/rs6000/linux.h b/gcc/config/rs6000/linux.h
-index ffceb32bf65..c82cb2ad05b 100644
+index b7026fcbee7..dd54d6c393e 100644
 --- a/gcc/config/rs6000/linux.h
 +++ b/gcc/config/rs6000/linux.h
 @@ -94,6 +94,16 @@
@@ -62,10 +62,10 @@ index ffceb32bf65..c82cb2ad05b 100644
  #define LINK_OS_LINUX_SPEC LINK_OS_LINUX_EMUL " %{!shared: %{!static: \
    %{!static-pie: \
 diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
-index 45a9a7cae59..d1e88a40e82 100644
+index 967c1c43c63..dc5e4d97975 100644
 --- a/gcc/config/rs6000/linux64.h
 +++ b/gcc/config/rs6000/linux64.h
-@@ -456,6 +456,16 @@ extern int dot_symbols;
+@@ -452,6 +452,16 @@ extern int dot_symbols;
  					   " -m elf64ppc")
  #endif
  
@@ -82,6 +82,3 @@ index 45a9a7cae59..d1e88a40e82 100644
  #define LINK_OS_LINUX_SPEC32 LINK_OS_LINUX_EMUL32 " %{!shared: %{!static: \
    %{!static-pie: \
      %{rdynamic:-export-dynamic} \
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0031-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch b/meta/recipes-devtools/gcc/gcc-10.1/0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
similarity index 80%
rename from meta/recipes-devtools/gcc/gcc-9.3/0031-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
rename to meta/recipes-devtools/gcc/gcc-10.1/0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
index 60a29fc94d..bd272cdab1 100644
--- a/meta/recipes-devtools/gcc/gcc-9.3/0031-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
+++ b/meta/recipes-devtools/gcc/gcc-10.1/0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
@@ -1,7 +1,7 @@
-From 31d008f5573627c6192ce9fcf729f0be464a7cf5 Mon Sep 17 00:00:00 2001
+From 0d01e9f6020b1a50aca27f29776ed90ee74d43dd Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 4 May 2016 21:11:34 -0700
-Subject: [PATCH 31/39] Link libgcc using LDFLAGS, not just SHLIB_LDFLAGS
+Subject: [PATCH] Link libgcc using LDFLAGS, not just SHLIB_LDFLAGS
 
 Upstream-Status: Pending
 
@@ -12,7 +12,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/libgcc/config/t-slibgcc b/libgcc/config/t-slibgcc
-index 099bf23e62f..436b277a79f 100644
+index c997553447c..330352c2c81 100644
 --- a/libgcc/config/t-slibgcc
 +++ b/libgcc/config/t-slibgcc
 @@ -32,7 +32,7 @@ SHLIB_INSTALL_SOLINK = $(LN_S) $(SHLIB_SONAME) \
@@ -24,6 +24,3 @@ index 099bf23e62f..436b277a79f 100644
  	-o $(SHLIB_DIR)/$(SHLIB_SONAME).tmp @multilib_flags@ \
  	$(SHLIB_OBJS) $(SHLIB_LC) && \
  	rm -f $(SHLIB_DIR)/$(SHLIB_SOLINK) && \
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0033-sync-gcc-stddef.h-with-musl.patch b/meta/recipes-devtools/gcc/gcc-10.1/0030-sync-gcc-stddef.h-with-musl.patch
similarity index 93%
rename from meta/recipes-devtools/gcc/gcc-9.3/0033-sync-gcc-stddef.h-with-musl.patch
rename to meta/recipes-devtools/gcc/gcc-10.1/0030-sync-gcc-stddef.h-with-musl.patch
index f080b0596f..775bd7d458 100644
--- a/meta/recipes-devtools/gcc/gcc-9.3/0033-sync-gcc-stddef.h-with-musl.patch
+++ b/meta/recipes-devtools/gcc/gcc-10.1/0030-sync-gcc-stddef.h-with-musl.patch
@@ -1,7 +1,7 @@
-From 126e342fb39d7af70c1e5a6df8ffafc8dfc3bf08 Mon Sep 17 00:00:00 2001
+From f572ef8c226178ba2404ce14e800cde5d7941bea Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 3 Feb 2017 12:56:00 -0800
-Subject: [PATCH 33/39] sync gcc stddef.h with musl
+Subject: [PATCH] sync gcc stddef.h with musl
 
 musl defines ptrdiff_t size_t and wchar_t
 so dont define them here if musl is definining them
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 9 insertions(+)
 
 diff --git a/gcc/ginclude/stddef.h b/gcc/ginclude/stddef.h
-index da692e1c01a..9a00c261adb 100644
+index 9d67eac4947..6cb5edbedb4 100644
 --- a/gcc/ginclude/stddef.h
 +++ b/gcc/ginclude/stddef.h
 @@ -128,6 +128,7 @@ _TYPE_wchar_t;
@@ -86,6 +86,3 @@ index da692e1c01a..9a00c261adb 100644
  #undef	__need_wchar_t
  #endif /* _STDDEF_H or __need_wchar_t.  */
  
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0034-fix-segmentation-fault-in-precompiled-header-generat.patch b/meta/recipes-devtools/gcc/gcc-10.1/0031-fix-segmentation-fault-in-precompiled-header-generat.patch
similarity index 86%
rename from meta/recipes-devtools/gcc/gcc-9.3/0034-fix-segmentation-fault-in-precompiled-header-generat.patch
rename to meta/recipes-devtools/gcc/gcc-10.1/0031-fix-segmentation-fault-in-precompiled-header-generat.patch
index 3b7ccb3e3d..80721648bb 100644
--- a/meta/recipes-devtools/gcc/gcc-9.3/0034-fix-segmentation-fault-in-precompiled-header-generat.patch
+++ b/meta/recipes-devtools/gcc/gcc-10.1/0031-fix-segmentation-fault-in-precompiled-header-generat.patch
@@ -1,7 +1,7 @@
-From d26fa9ededccc7e1ec47ead7f18afc80971483a3 Mon Sep 17 00:00:00 2001
+From 4423dff365a76e7416c7b4616b8bed80075f6949 Mon Sep 17 00:00:00 2001
 From: Juro Bystricky <juro.bystricky@intel.com>
 Date: Mon, 19 Mar 2018 22:31:20 -0700
-Subject: [PATCH 34/39] fix segmentation fault in precompiled header generation
+Subject: [PATCH] fix segmentation fault in precompiled header generation
 
 Prevent a segmentation fault which occurs when using incorrect
 structure trying to access name of some named operators, such as
@@ -19,10 +19,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 21 insertions(+), 5 deletions(-)
 
 diff --git a/libcpp/lex.c b/libcpp/lex.c
-index eedfcbb3146..15040a1b1f0 100644
+index 56ac3a1dd73..73a951148b3 100644
 --- a/libcpp/lex.c
 +++ b/libcpp/lex.c
-@@ -3280,11 +3280,27 @@ cpp_spell_token (cpp_reader *pfile, const cpp_token *token,
+@@ -3311,11 +3311,27 @@ cpp_spell_token (cpp_reader *pfile, const cpp_token *token,
      spell_ident:
      case SPELL_IDENT:
        if (forstring)
@@ -55,6 +55,3 @@ index eedfcbb3146..15040a1b1f0 100644
        else
  	buffer = _cpp_spell_ident_ucns (buffer, token->val.node.node);
        break;
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0035-Fix-for-testsuite-failure.patch b/meta/recipes-devtools/gcc/gcc-10.1/0032-Fix-for-testsuite-failure.patch
similarity index 98%
rename from meta/recipes-devtools/gcc/gcc-9.3/0035-Fix-for-testsuite-failure.patch
rename to meta/recipes-devtools/gcc/gcc-10.1/0032-Fix-for-testsuite-failure.patch
index 5e199fbcfd..ef651f85ff 100644
--- a/meta/recipes-devtools/gcc/gcc-9.3/0035-Fix-for-testsuite-failure.patch
+++ b/meta/recipes-devtools/gcc/gcc-10.1/0032-Fix-for-testsuite-failure.patch
@@ -1,7 +1,7 @@
-From fb5bdf8f8527228d587e8af9fc700e5164b3c18c Mon Sep 17 00:00:00 2001
+From 15e0ee6b834ae4e5ddb51cc94fc4941b74b05c9e Mon Sep 17 00:00:00 2001
 From: RAGHUNATH LOLUR <raghunath.lolur@kpit.com>
 Date: Wed, 6 Dec 2017 22:52:26 -0800
-Subject: [PATCH 35/39] Fix for testsuite failure
+Subject: [PATCH] Fix for testsuite failure
 
 2017-11-16  Raghunath Lolur  <raghunath.lolur@kpit.com>
 
@@ -220,7 +220,7 @@ index 96006b3e338..4287e4538bf 100644
  /* This test uses __builtin_trap () instead of e.g. abort,
     because due to -mpreferred-stack-boundary=3 it should not call
 diff --git a/gcc/testsuite/gcc.target/i386/pr62120.c b/gcc/testsuite/gcc.target/i386/pr62120.c
-index bfb8c4703eb..ed04cf181f3 100644
+index 28d85d37712..c93266bd4bc 100644
 --- a/gcc/testsuite/gcc.target/i386/pr62120.c
 +++ b/gcc/testsuite/gcc.target/i386/pr62120.c
 @@ -1,5 +1,5 @@
@@ -253,6 +253,3 @@ index 6cda1534311..26e37f5b8ba 100644
  #define vector(elcount, type)  \
  __attribute__((vector_size((elcount)*sizeof(type)))) type
  
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0036-Re-introduce-spe-commandline-options.patch b/meta/recipes-devtools/gcc/gcc-10.1/0033-Re-introduce-spe-commandline-options.patch
similarity index 81%
rename from meta/recipes-devtools/gcc/gcc-9.3/0036-Re-introduce-spe-commandline-options.patch
rename to meta/recipes-devtools/gcc/gcc-10.1/0033-Re-introduce-spe-commandline-options.patch
index 825e070aa3..3adcecf74e 100644
--- a/meta/recipes-devtools/gcc/gcc-9.3/0036-Re-introduce-spe-commandline-options.patch
+++ b/meta/recipes-devtools/gcc/gcc-10.1/0033-Re-introduce-spe-commandline-options.patch
@@ -1,7 +1,7 @@
-From dc23cabac6a7b2ca85b02d2a58a8916c98f382e0 Mon Sep 17 00:00:00 2001
+From 9d37d5e75fb4bb2abb8a69f69ac63808c22a5366 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 6 Jun 2018 12:10:22 -0700
-Subject: [PATCH 36/39] Re-introduce spe commandline options
+Subject: [PATCH] Re-introduce spe commandline options
 
 This should ensure that we keep accepting
 spe options
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 12 insertions(+)
 
 diff --git a/gcc/config/rs6000/rs6000.opt b/gcc/config/rs6000/rs6000.opt
-index f4b5c91e11f..69869350fce 100644
+index f95b8279270..0e52d51409d 100644
 --- a/gcc/config/rs6000/rs6000.opt
 +++ b/gcc/config/rs6000/rs6000.opt
-@@ -345,6 +345,18 @@ mdebug=
+@@ -344,6 +344,18 @@ mdebug=
  Target RejectNegative Joined
  -mdebug=	Enable debug output.
  
@@ -36,6 +36,3 @@ index f4b5c91e11f..69869350fce 100644
  mabi=altivec
  Target RejectNegative Var(rs6000_altivec_abi) Save
  Use the AltiVec ABI extensions.
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0032-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch b/meta/recipes-devtools/gcc/gcc-10.1/0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
similarity index 77%
rename from meta/recipes-devtools/gcc/gcc-9.3/0032-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
rename to meta/recipes-devtools/gcc/gcc-10.1/0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
index 6f048dab82..8a9c03c5cd 100644
--- a/meta/recipes-devtools/gcc/gcc-9.3/0032-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
+++ b/meta/recipes-devtools/gcc/gcc-10.1/0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
@@ -1,7 +1,7 @@
-From 761fa6e3e37608cfd1b288e721a2ff89288cd6aa Mon Sep 17 00:00:00 2001
+From e20cad27b5aebd69b334519d77ae91f14ef07b65 Mon Sep 17 00:00:00 2001
 From: Szabolcs Nagy <nsz@port70.net>
 Date: Sat, 24 Oct 2015 20:09:53 +0000
-Subject: [PATCH 32/39] libgcc_s: Use alias for __cpu_indicator_init instead of
+Subject: [PATCH] libgcc_s: Use alias for __cpu_indicator_init instead of
  symver
 
 Adapter from
@@ -26,23 +26,23 @@ gcc/Changelog:
 
 2015-05-11  Szabolcs Nagy  <szabolcs.nagy@arm.com>
 
-	* config/i386/i386.c (ix86_expand_builtin): Make __builtin_cpu_init
+	* config/i386/i386-expand.c (ix86_expand_builtin): Make __builtin_cpu_init
 	call __cpu_indicator_init_local instead of __cpu_indicator_init.
 
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- gcc/config/i386/i386.c       | 4 ++--
- libgcc/config/i386/cpuinfo.c | 6 +++---
- libgcc/config/i386/t-linux   | 2 +-
+ gcc/config/i386/i386-expand.c | 4 ++--
+ libgcc/config/i386/cpuinfo.c  | 6 +++---
+ libgcc/config/i386/t-linux    | 2 +-
  3 files changed, 6 insertions(+), 6 deletions(-)
 
-diff --git a/gcc/config/i386/i386.c b/gcc/config/i386/i386.c
-index 1bca5a7eea6..096c4bc8e25 100644
---- a/gcc/config/i386/i386.c
-+++ b/gcc/config/i386/i386.c
-@@ -36685,10 +36685,10 @@ ix86_expand_builtin (tree exp, rtx target, rtx subtarget,
+diff --git a/gcc/config/i386/i386-expand.c b/gcc/config/i386/i386-expand.c
+index 48f00c5fcfc..468f5f71fac 100644
+--- a/gcc/config/i386/i386-expand.c
++++ b/gcc/config/i386/i386-expand.c
+@@ -10941,10 +10941,10 @@ ix86_expand_builtin (tree exp, rtx target, rtx subtarget,
      {
      case IX86_BUILTIN_CPU_INIT:
        {
@@ -56,10 +56,10 @@ index 1bca5a7eea6..096c4bc8e25 100644
  	return expand_expr (call_expr, target, mode, EXPAND_NORMAL);
        }
 diff --git a/libgcc/config/i386/cpuinfo.c b/libgcc/config/i386/cpuinfo.c
-index d6cb2de6265..ce04ef78205 100644
+index 00322c58622..f42bbb8af98 100644
 --- a/libgcc/config/i386/cpuinfo.c
 +++ b/libgcc/config/i386/cpuinfo.c
-@@ -504,7 +504,7 @@ __cpu_indicator_init (void)
+@@ -508,7 +508,7 @@ __cpu_indicator_init (void)
    return 0;
  }
  
@@ -81,6 +81,3 @@ index 8506a635790..564296f788e 100644
 -HOST_LIBGCC2_CFLAGS += -mlong-double-80 -DUSE_ELF_SYMVER $(CET_FLAGS)
 +HOST_LIBGCC2_CFLAGS += -mlong-double-80 $(CET_FLAGS)
  CRTSTUFF_T_CFLAGS += $(CET_FLAGS)
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0038-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch b/meta/recipes-devtools/gcc/gcc-10.1/0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
similarity index 80%
rename from meta/recipes-devtools/gcc/gcc-9.3/0038-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
rename to meta/recipes-devtools/gcc/gcc-10.1/0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
index a79fc03d15..90a1f19f8d 100644
--- a/meta/recipes-devtools/gcc/gcc-9.3/0038-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
+++ b/meta/recipes-devtools/gcc/gcc-10.1/0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
@@ -1,7 +1,7 @@
-From 075e0929e04913538391052c32178b6a14ef0ae3 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 12 Mar 2020 14:41:40 -0700
-Subject: [PATCH 38/39] gentypes/genmodes: Do not use __LINE__ for maintaining
+From baab9d17abaae605a77385cbb3ba67831beb1f99 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Tue, 10 Mar 2020 08:26:53 -0700
+Subject: [PATCH] gentypes/genmodes: Do not use __LINE__ for maintaining
  reproducibility
 
 Inserting line numbers into generated code means its not always reproducible wth
@@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 19 insertions(+), 19 deletions(-)
 
 diff --git a/gcc/gengtype.c b/gcc/gengtype.c
-index 53317337cf8..bbb26151671 100644
+index 981577481af..d5700fff401 100644
 --- a/gcc/gengtype.c
 +++ b/gcc/gengtype.c
 @@ -991,7 +991,7 @@ create_field_at (pair_p next, type_p type, const char *name, options_p opt,
@@ -38,7 +38,7 @@ index 53317337cf8..bbb26151671 100644
  
  /* Reverse a linked list of 'struct pair's in place.  */
  pair_p
-@@ -5186,7 +5186,7 @@ main (int argc, char **argv)
+@@ -5187,7 +5187,7 @@ main (int argc, char **argv)
        /* These types are set up with #define or else outside of where
           we can see them.  We should initialize them before calling
           read_input_list.  */
@@ -48,10 +48,10 @@ index 53317337cf8..bbb26151671 100644
        POS_HERE (do_scalar_typedef ("CUMULATIVE_ARGS", &pos));
        POS_HERE (do_scalar_typedef ("REAL_VALUE_TYPE", &pos));
 diff --git a/gcc/genmodes.c b/gcc/genmodes.c
-index f33eefa2494..07bef9eebe2 100644
+index bd78310ea24..dbd02c51a4c 100644
 --- a/gcc/genmodes.c
 +++ b/gcc/genmodes.c
-@@ -429,7 +429,7 @@ complete_all_modes (void)
+@@ -430,7 +430,7 @@ complete_all_modes (void)
  }
  
  /* For each mode in class CLASS, construct a corresponding complex mode.  */
@@ -60,16 +60,16 @@ index f33eefa2494..07bef9eebe2 100644
  static void
  make_complex_modes (enum mode_class cl,
  		    const char *file, unsigned int line)
-@@ -487,7 +487,7 @@ make_complex_modes (enum mode_class cl,
- /* For all modes in class CL, construct vector modes of width
-    WIDTH, having as many components as necessary.  */
- #define VECTOR_MODES_WITH_PREFIX(PREFIX, C, W) \
--  make_vector_modes (MODE_##C, #PREFIX, W, __FILE__, __LINE__)
-+  make_vector_modes (MODE_##C, #PREFIX, W, __FILE__, 0)
- #define VECTOR_MODES(C, W) VECTOR_MODES_WITH_PREFIX (V, C, W)
+@@ -489,7 +489,7 @@ make_complex_modes (enum mode_class cl,
+    having as many components as necessary.  ORDER is the sorting order
+    of the mode, with smaller numbers indicating a higher priority.  */
+ #define VECTOR_MODES_WITH_PREFIX(PREFIX, C, W, ORDER) \
+-  make_vector_modes (MODE_##C, #PREFIX, W, ORDER, __FILE__, __LINE__)
++  make_vector_modes (MODE_##C, #PREFIX, W, ORDER, __FILE__, 0)
+ #define VECTOR_MODES(C, W) VECTOR_MODES_WITH_PREFIX (V, C, W, 0)
  static void ATTRIBUTE_UNUSED
  make_vector_modes (enum mode_class cl, const char *prefix, unsigned int width,
-@@ -538,7 +538,7 @@ make_vector_modes (enum mode_class cl, const char *prefix, unsigned int width,
+@@ -541,7 +541,7 @@ make_vector_modes (enum mode_class cl, const char *prefix, unsigned int width,
  /* Create a vector of booleans called NAME with COUNT elements and
     BYTESIZE bytes in total.  */
  #define VECTOR_BOOL_MODE(NAME, COUNT, BYTESIZE) \
@@ -78,7 +78,7 @@ index f33eefa2494..07bef9eebe2 100644
  static void ATTRIBUTE_UNUSED
  make_vector_bool_mode (const char *name, unsigned int count,
  		       unsigned int bytesize, const char *file,
-@@ -560,7 +560,7 @@ make_vector_bool_mode (const char *name, unsigned int count,
+@@ -563,7 +563,7 @@ make_vector_bool_mode (const char *name, unsigned int count,
  /* Input.  */
  
  #define _SPECIAL_MODE(C, N) \
@@ -87,7 +87,7 @@ index f33eefa2494..07bef9eebe2 100644
  #define RANDOM_MODE(N) _SPECIAL_MODE (RANDOM, N)
  #define CC_MODE(N) _SPECIAL_MODE (CC, N)
  
-@@ -573,7 +573,7 @@ make_special_mode (enum mode_class cl, const char *name,
+@@ -576,7 +576,7 @@ make_special_mode (enum mode_class cl, const char *name,
  
  #define INT_MODE(N, Y) FRACTIONAL_INT_MODE (N, -1U, Y)
  #define FRACTIONAL_INT_MODE(N, B, Y) \
@@ -96,7 +96,7 @@ index f33eefa2494..07bef9eebe2 100644
  
  static void
  make_int_mode (const char *name,
-@@ -586,16 +586,16 @@ make_int_mode (const char *name,
+@@ -589,16 +589,16 @@ make_int_mode (const char *name,
  }
  
  #define FRACT_MODE(N, Y, F) \
@@ -117,7 +117,7 @@ index f33eefa2494..07bef9eebe2 100644
  
  /* Create a fixed-point mode by setting CL, NAME, BYTESIZE, IBIT, FBIT,
     FILE, and LINE.  */
-@@ -616,7 +616,7 @@ make_fixed_point_mode (enum mode_class cl,
+@@ -619,7 +619,7 @@ make_fixed_point_mode (enum mode_class cl,
  
  #define FLOAT_MODE(N, Y, F)             FRACTIONAL_FLOAT_MODE (N, -1U, Y, F)
  #define FRACTIONAL_FLOAT_MODE(N, B, Y, F) \
@@ -126,7 +126,7 @@ index f33eefa2494..07bef9eebe2 100644
  
  static void
  make_float_mode (const char *name,
-@@ -633,7 +633,7 @@ make_float_mode (const char *name,
+@@ -636,7 +636,7 @@ make_float_mode (const char *name,
  #define DECIMAL_FLOAT_MODE(N, Y, F)	\
  	FRACTIONAL_DECIMAL_FLOAT_MODE (N, -1U, Y, F)
  #define FRACTIONAL_DECIMAL_FLOAT_MODE(N, B, Y, F)	\
@@ -135,7 +135,7 @@ index f33eefa2494..07bef9eebe2 100644
  
  static void
  make_decimal_float_mode (const char *name,
-@@ -648,7 +648,7 @@ make_decimal_float_mode (const char *name,
+@@ -651,7 +651,7 @@ make_decimal_float_mode (const char *name,
  }
  
  #define RESET_FLOAT_FORMAT(N, F) \
@@ -144,7 +144,7 @@ index f33eefa2494..07bef9eebe2 100644
  static void ATTRIBUTE_UNUSED
  reset_float_format (const char *name, const char *format,
  		    const char *file, unsigned int line)
-@@ -669,7 +669,7 @@ reset_float_format (const char *name, const char *format,
+@@ -672,7 +672,7 @@ reset_float_format (const char *name, const char *format,
  
  /* __intN support.  */
  #define INT_N(M,PREC)				\
@@ -153,7 +153,7 @@ index f33eefa2494..07bef9eebe2 100644
  static void ATTRIBUTE_UNUSED
  make_int_n (const char *m, int bitsize,
              const char *file, unsigned int line)
-@@ -698,7 +698,7 @@ make_int_n (const char *m, int bitsize,
+@@ -701,7 +701,7 @@ make_int_n (const char *m, int bitsize,
  /* Partial integer modes are specified by relation to a full integer
     mode.  */
  #define PARTIAL_INT_MODE(M,PREC,NAME)				\
@@ -162,7 +162,7 @@ index f33eefa2494..07bef9eebe2 100644
  static void ATTRIBUTE_UNUSED
  make_partial_integer_mode (const char *base, const char *name,
  			   unsigned int precision,
-@@ -725,7 +725,7 @@ make_partial_integer_mode (const char *base, const char *name,
+@@ -728,7 +728,7 @@ make_partial_integer_mode (const char *base, const char *name,
  /* A single vector mode can be specified by naming its component
     mode and the number of components.  */
  #define VECTOR_MODE(C, M, N) \
@@ -171,7 +171,7 @@ index f33eefa2494..07bef9eebe2 100644
  static void ATTRIBUTE_UNUSED
  make_vector_mode (enum mode_class bclass,
  		  const char *base,
-@@ -768,7 +768,7 @@ make_vector_mode (enum mode_class bclass,
+@@ -771,7 +771,7 @@ make_vector_mode (enum mode_class bclass,
  
  /* Adjustability.  */
  #define _ADD_ADJUST(A, M, X, C1, C2) \
@@ -180,6 +180,3 @@ index f33eefa2494..07bef9eebe2 100644
  
  #define ADJUST_NUNITS(M, X)    _ADD_ADJUST (nunits, M, X, RANDOM, RANDOM)
  #define ADJUST_BYTESIZE(M, X)  _ADD_ADJUST (bytesize, M, X, RANDOM, RANDOM)
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0020-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch b/meta/recipes-devtools/gcc/gcc-9.3/0020-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
deleted file mode 100644
index 1d2182140f..0000000000
--- a/meta/recipes-devtools/gcc/gcc-9.3/0020-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From a4740f1290e6a602fbbfa27b863be2e3b2675685 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 20 Feb 2015 11:17:19 +0000
-Subject: [PATCH 20/39] gcc 4.8+ won't build with --disable-dependency-tracking
-
-since the *.Ppo files don't get created unless --enable-dependency-tracking is true.
-
-This patch ensures we only use those compiler options when its enabled.
-
-Upstream-Status: Submitted
-
-(Problem was already reported upstream, attached this patch there
-http://gcc.gnu.org/bugzilla/show_bug.cgi?id=55930)
-
-RP
-2012/09/22
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libatomic/Makefile.am | 3 ++-
- libatomic/Makefile.in | 3 ++-
- 2 files changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/libatomic/Makefile.am b/libatomic/Makefile.am
-index c1b7c73934a..ef43d62c07a 100644
---- a/libatomic/Makefile.am
-+++ b/libatomic/Makefile.am
-@@ -101,7 +101,8 @@ PAT_S		= $(word 3,$(PAT_SPLIT))
- IFUNC_DEF	= -DIFUNC_ALT=$(PAT_S)
- IFUNC_OPT	= $(word $(PAT_S),$(IFUNC_OPTIONS))
- 
--M_DEPS		= -MT $@ -MD -MP -MF $(DEPDIR)/$(@F).Ppo
-+@AMDEP_TRUE@M_DEPS		= -MT $@ -MD -MP -MF $(DEPDIR)/$(@F).Ppo
-+@AMDEP_FALSE@M_DEPS		=
- M_SIZE		= -DN=$(PAT_N)
- M_IFUNC		= $(if $(PAT_S),$(IFUNC_DEF) $(IFUNC_OPT))
- M_FILE		= $(PAT_BASE)_n.c
-diff --git a/libatomic/Makefile.in b/libatomic/Makefile.in
-index 29324e3e0ac..d5cdb4259ef 100644
---- a/libatomic/Makefile.in
-+++ b/libatomic/Makefile.in
-@@ -414,7 +414,8 @@ PAT_N = $(word 2,$(PAT_SPLIT))
- PAT_S = $(word 3,$(PAT_SPLIT))
- IFUNC_DEF = -DIFUNC_ALT=$(PAT_S)
- IFUNC_OPT = $(word $(PAT_S),$(IFUNC_OPTIONS))
--M_DEPS = -MT $@ -MD -MP -MF $(DEPDIR)/$(@F).Ppo
-+@AMDEP_TRUE@M_DEPS = -MT $@ -MD -MP -MF $(DEPDIR)/$(@F).Ppo
-+@AMDEP_FALSE@M_DEPS =
- M_SIZE = -DN=$(PAT_N)
- M_IFUNC = $(if $(PAT_S),$(IFUNC_DEF) $(IFUNC_OPT))
- M_FILE = $(PAT_BASE)_n.c
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0030-ldbl128-config.patch b/meta/recipes-devtools/gcc/gcc-9.3/0030-ldbl128-config.patch
deleted file mode 100644
index f8e8c07f62..0000000000
--- a/meta/recipes-devtools/gcc/gcc-9.3/0030-ldbl128-config.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From 1bfae624b27ea4a1f5c5a92050d741b511e7b3d5 Mon Sep 17 00:00:00 2001
-From: Szabolcs Nagy <nsz@port70.net>
-Date: Wed, 28 Feb 2018 00:54:05 +0000
-Subject: [PATCH 30/39] ldbl128 config
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- gcc/configure    | 13 +++++++++++++
- gcc/configure.ac | 16 ++++++++++++++--
- 2 files changed, 27 insertions(+), 2 deletions(-)
-
-diff --git a/gcc/configure b/gcc/configure
-index 0788b7bf0b5..eb1a45bb263 100755
---- a/gcc/configure
-+++ b/gcc/configure
-@@ -29370,6 +29370,15 @@ if test "${with_long_double_128+set}" = set; then :
-   withval=$with_long_double_128; gcc_cv_target_ldbl128="$with_long_double_128"
- else
- 
-+      case "$target" in
-+	s390*-*-linux-musl*)
-+	  gcc_cv_target_ldbl128=yes
-+	  ;;
-+	powerpc*-*-linux-musl*)
-+	  gcc_cv_target_ldbl128=no
-+	  ;;
-+	*)
-+
- if test $glibc_version_major -gt 2 \
-   || ( test $glibc_version_major -eq 2 && test $glibc_version_minor -ge 4 ); then :
-   gcc_cv_target_ldbl128=yes
-@@ -29381,6 +29390,10 @@ else
-       && gcc_cv_target_ldbl128=yes
- 
- fi
-+
-+	  ;;
-+      esac
-+
- fi
- 
-     ;;
-diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 5ab50fae0f3..7ffe35ee1c3 100644
---- a/gcc/configure.ac
-+++ b/gcc/configure.ac
-@@ -6030,13 +6030,25 @@ case "$target" in
-     AC_ARG_WITH(long-double-128,
-       [AS_HELP_STRING([--with-long-double-128],
- 		      [use 128-bit long double by default])],
--      gcc_cv_target_ldbl128="$with_long_double_128",
-+      gcc_cv_target_ldbl128="$with_long_double_128", [
-+      case "$target" in
-+	s390*-*-linux-musl*)
-+	  gcc_cv_target_ldbl128=yes
-+	  ;;
-+	powerpc*-*-linux-musl*)
-+	  gcc_cv_target_ldbl128=no
-+	  ;;
-+	*)]
-       [GCC_GLIBC_VERSION_GTE_IFELSE([2], [4], [gcc_cv_target_ldbl128=yes], [
-       [gcc_cv_target_ldbl128=no
-       grep '^[ 	]*#[ 	]*define[ 	][ 	]*__LONG_DOUBLE_MATH_OPTIONAL' \
-         $target_header_dir/bits/wordsize.h > /dev/null 2>&1 \
-       && gcc_cv_target_ldbl128=yes
--      ]])])
-+      ]])]
-+      [
-+	  ;;
-+      esac
-+      ])
-     ;;
- esac
- if test x$gcc_cv_target_ldbl128 = xyes; then
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0037-CVE-2019-14250-Check-zero-value-in-simple_object_elf.patch b/meta/recipes-devtools/gcc/gcc-9.3/0037-CVE-2019-14250-Check-zero-value-in-simple_object_elf.patch
deleted file mode 100644
index f268a4eb58..0000000000
--- a/meta/recipes-devtools/gcc/gcc-9.3/0037-CVE-2019-14250-Check-zero-value-in-simple_object_elf.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From ac4af583bd59f6631671ad4abf985799ce4a53d9 Mon Sep 17 00:00:00 2001
-From: rguenth <rguenth@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Thu, 25 Jul 2019 10:46:54 +0000
-Subject: [PATCH 37/39] CVE-2019-14250: Check zero value in
- simple_object_elf_match
-
-2019-07-25 Richard Biener <rguenther@suse.de>
-
-	PR lto/90924
-	Backport from mainline
-	2019-07-12  Ren Kimura  <rkx1209dev@gmail.com>
-
-	* simple-object-elf.c (simple_object_elf_match): Check zero value
-	shstrndx.
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-9-branch@273793 138bc75d-0d04-0410-961f-82ee72b054a4
-
-Upstream-Status: Backport
-Affectes: <  9.2
-CVE: CVE-2019-14250
-Dropped changelog
-Signed-off-by: Armin Kuster <Akustre@mvista.com>
----
- libiberty/simple-object-elf.c | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/libiberty/simple-object-elf.c b/libiberty/simple-object-elf.c
-index 3d49f339631..c00cebdb6c7 100644
---- a/libiberty/simple-object-elf.c
-+++ b/libiberty/simple-object-elf.c
-@@ -557,6 +557,14 @@ simple_object_elf_match (unsigned char header[SIMPLE_OBJECT_MATCH_HEADER_LEN],
-       return NULL;
-     }
- 
-+  if (eor->shstrndx == 0)
-+    {
-+      *errmsg = "invalid ELF shstrndx == 0";
-+      *err = 0;
-+      XDELETE (eor);
-+      return NULL;
-+    }
-+
-   return (void *) eor;
- }
- 
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0039-process_alt_operands-Don-t-match-user-defined-regs-o.patch b/meta/recipes-devtools/gcc/gcc-9.3/0039-process_alt_operands-Don-t-match-user-defined-regs-o.patch
deleted file mode 100644
index b69114d1e5..0000000000
--- a/meta/recipes-devtools/gcc/gcc-9.3/0039-process_alt_operands-Don-t-match-user-defined-regs-o.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-From e75bcc2ec4f1e7e081ce18713f0a25913ba15340 Mon Sep 17 00:00:00 2001
-From: Vladimir Makarov <vmakarov@redhat.com>
-Date: Wed, 10 Jul 2019 16:07:10 +0000
-Subject: [PATCH 39/39] process_alt_operands: Don't match user defined regs
- only if they are early clobbers
-
-PR target/91102 (aarch64 ICE on Linux kernel with -Os starting with r270266)
-
-2019-07-10  Vladimir Makarov  <vmakarov@redhat.com>
-
-	PR target/91102
-	* lra-constraints.c (process_alt_operands): Don't match user
-	defined regs only if they are early clobbers.
-
-2019-07-10  Vladimir Makarov  <vmakarov@redhat.com>
-
-	PR target/91102
-	* gcc.target/aarch64/pr91102.c: New test.
-
-From-SVN: r273357
-Upstream-Status: Backport [https://github.com/gcc-mirror/gcc/commit/613caed2feb9cfc8158308670b59df3d031ec629]
-[takondra: dropped conflicting ChangeLog changes]
-Signed-off-by: Taras Kondratiuk <takondra@cisco.com>
----
- gcc/lra-constraints.c                      | 17 ++++++++++----
- gcc/testsuite/gcc.target/aarch64/pr91102.c | 26 ++++++++++++++++++++++
- 2 files changed, 39 insertions(+), 4 deletions(-)
- create mode 100644 gcc/testsuite/gcc.target/aarch64/pr91102.c
-
-diff --git a/gcc/lra-constraints.c b/gcc/lra-constraints.c
-index cf33da8013e..6382dbf852b 100644
---- a/gcc/lra-constraints.c
-+++ b/gcc/lra-constraints.c
-@@ -2172,8 +2172,9 @@ process_alt_operands (int only_alternative)
- 		    else
- 		      {
- 			/* Operands don't match.  If the operands are
--			   different user defined explicit hard registers,
--			   then we cannot make them match.  */
-+			   different user defined explicit hard
-+			   registers, then we cannot make them match
-+			   when one is early clobber operand.  */
- 			if ((REG_P (*curr_id->operand_loc[nop])
- 			     || SUBREG_P (*curr_id->operand_loc[nop]))
- 			    && (REG_P (*curr_id->operand_loc[m])
-@@ -2192,9 +2193,17 @@ process_alt_operands (int only_alternative)
- 				&& REG_P (m_reg)
- 				&& HARD_REGISTER_P (m_reg)
- 				&& REG_USERVAR_P (m_reg))
--			      break;
-+			      {
-+				int i;
-+				
-+				for (i = 0; i < early_clobbered_regs_num; i++)
-+				  if (m == early_clobbered_nops[i])
-+				    break;
-+				if (i < early_clobbered_regs_num
-+				    || early_clobber_p)
-+				  break;
-+			      }
- 			  }
--
- 			/* Both operands must allow a reload register,
- 			   otherwise we cannot make them match.  */
- 			if (curr_alt[m] == NO_REGS)
-diff --git a/gcc/testsuite/gcc.target/aarch64/pr91102.c b/gcc/testsuite/gcc.target/aarch64/pr91102.c
-new file mode 100644
-index 00000000000..70b99045a48
---- /dev/null
-+++ b/gcc/testsuite/gcc.target/aarch64/pr91102.c
-@@ -0,0 +1,26 @@
-+/* PR target/91102 */
-+/* { dg-do compile } */
-+/* { dg-options "-O2" } */
-+
-+int
-+foo (long d, long l)
-+{
-+  register long e asm ("x1") = d;
-+  register long f asm("x2") = l;
-+  asm ("" : : "r" (e), "r" (f));
-+  return 3;
-+}
-+
-+struct T { int i; int j; };
-+union S { long h; struct T t; };
-+
-+void
-+bar (union S b)
-+{
-+  while (1)
-+    {
-+      union S c = b;
-+      c.t.j++;
-+      b.h = foo (b.h, c.h);
-+    }
-+}
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_9.3.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_10.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-canadian_9.3.bb
rename to meta/recipes-devtools/gcc/gcc-cross-canadian_10.1.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross_9.3.bb b/meta/recipes-devtools/gcc/gcc-cross_10.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross_9.3.bb
rename to meta/recipes-devtools/gcc/gcc-cross_10.1.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_9.3.bb b/meta/recipes-devtools/gcc/gcc-crosssdk_10.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk_9.3.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk_10.1.bb
diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index d9a4e483cc..38c1672876 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -263,6 +263,7 @@ FILES_libgomp-dev = "\
     ${libdir}/libgomp*${SOLIBSDEV} \
     ${libdir}/libgomp*.la \
     ${libdir}/libgomp.spec \
+    ${libdir}/${TARGET_SYS}/${BINV}/include/acc_prof.h \
     ${libdir}/${TARGET_SYS}/${BINV}/include/omp.h \
     ${libdir}/${TARGET_SYS}/${BINV}/include/openacc.h \
 "
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_9.3.bb b/meta/recipes-devtools/gcc/gcc-runtime_10.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-runtime_9.3.bb
rename to meta/recipes-devtools/gcc/gcc-runtime_10.1.bb
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_9.3.bb b/meta/recipes-devtools/gcc/gcc-sanitizers_10.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-sanitizers_9.3.bb
rename to meta/recipes-devtools/gcc/gcc-sanitizers_10.1.bb
diff --git a/meta/recipes-devtools/gcc/gcc-source_9.3.bb b/meta/recipes-devtools/gcc/gcc-source_10.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-source_9.3.bb
rename to meta/recipes-devtools/gcc/gcc-source_10.1.bb
diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index 6263e81497..1e25dad86b 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -42,6 +42,7 @@ PACKAGES = "\
 
 FILES_${PN} = "\
     ${bindir}/${TARGET_PREFIX}gcc* \
+    ${bindir}/${TARGET_PREFIX}lto* \
     ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/collect2* \
     ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc1plus \
     ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/lto* \
diff --git a/meta/recipes-devtools/gcc/gcc_9.3.bb b/meta/recipes-devtools/gcc/gcc_10.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc_9.3.bb
rename to meta/recipes-devtools/gcc/gcc_10.1.bb
diff --git a/meta/recipes-devtools/gcc/libgcc-initial_9.3.bb b/meta/recipes-devtools/gcc/libgcc-initial_10.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc-initial_9.3.bb
rename to meta/recipes-devtools/gcc/libgcc-initial_10.1.bb
diff --git a/meta/recipes-devtools/gcc/libgcc_9.3.bb b/meta/recipes-devtools/gcc/libgcc_10.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc_9.3.bb
rename to meta/recipes-devtools/gcc/libgcc_10.1.bb
diff --git a/meta/recipes-devtools/gcc/libgfortran_9.3.bb b/meta/recipes-devtools/gcc/libgfortran_10.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgfortran_9.3.bb
rename to meta/recipes-devtools/gcc/libgfortran_10.1.bb
diff --git a/meta/recipes-support/icu/icu/filter.json b/meta/recipes-support/icu/icu/filter.json
index 2c63c08510..34b2dd308c 100644
--- a/meta/recipes-support/icu/icu/filter.json
+++ b/meta/recipes-support/icu/icu/filter.json
@@ -1,2 +1,8 @@
 {
+  "localeFilter": {
+    "filterType": "language",
+    "whitelist": [
+      "en"
+    ]
+  }
 }
-- 
2.26.2

