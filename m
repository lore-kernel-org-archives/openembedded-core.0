Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.2065.1619668397245822392
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Apr 2021 20:53:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bF262311;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id z16so5287306pga.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Apr 2021 20:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sE3l5o4bEn0JcU5X1iCnI8O2Oh1HQ0SBIz2jA5Ndl48=;
        b=bF262311q75+AmxxTaWNrGTJ+PqpBh409RMtusCK90hvti/qTaPJPtFY48HU4QS1W3
         ARTwmrrn4cRqkaLBXD1Loe6hmNZkKcQquVrVAX0nXRKYomeC4zRIlqyH2V8CeDXxJjco
         xZhdx1tVFH6m9vhOtwEbhdVc80yNcS9/0/nIYMOI5zJZrmoU98w0s6EGHDPWY2jN+7MF
         qgbNZkCxSe/6lsHOKkW6OOTi4R4iOjO0DkQJq95xJCosP+MaTkY/V3Ka9/LBT8yneo4r
         zBqT4NRX+chlazrKsb0ksEPcZEGyClAy1V9rXDmLQKlK2oW8ETvUcRhNeOeLafzch/By
         fY5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sE3l5o4bEn0JcU5X1iCnI8O2Oh1HQ0SBIz2jA5Ndl48=;
        b=F2sOS5NmXA25iEomJKMYSGRHPi4oc/nbJHDL+TgmjThwnVbgrSlCz9zzAVYsapgKP5
         OLajNEH3MDuY36hXGBSLSlHB73SOlBdLHJ6D5Mam7UfQg3gxdo+irrqof4BEu8WchU80
         MFgvqxBEvyucw9QBNTefKx9lZmobbaOZz4Pn5hdkieQgSZGvT5a4uHenKyjF3R3NoQGN
         tWrZjy5x4vb0dfrzuG37cTa/QcyawIwdNHcN4E9AP6D0URLN1Yej3SgalNmrKeNOjyML
         2MN8JSBqgBlJ9OuLKX4SgQJNjjd5eB26nhdwRtCpNwSysvlq7MybuLvoHAb+dwl5VunH
         JiLQ==
X-Gm-Message-State: AOAM532FAaMPFysAQbr/4ONHRsP1mbjCnUYCfR7+nBPjUtK1uhsoGZEO
	pTJfu5E6rBry3cpA/pmcj/5FW0H1R1WYIw==
X-Google-Smtp-Source: ABdhPJy57np0EFz2YoLq06sxxp2eKIzWkTrvREbeXICvy1xKIWYsd2k7TtHREXS1DElvgXI5C+ZUsg==
X-Received: by 2002:a63:b09:: with SMTP id 9mr30352407pgl.107.1619668395255;
        Wed, 28 Apr 2021 20:53:15 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ef3])
        by smtp.gmail.com with ESMTPSA id b7sm996929pfi.42.2021.04.28.20.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 20:53:14 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] gcc: Upgrade to GCC 11
Date: Wed, 28 Apr 2021 20:53:10 -0700
Message-Id: <20210429035310.993762-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210429035310.993762-1-raj.khem@gmail.com>
References: <20210429035310.993762-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop already upstream/backported patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |   2 +-
 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 .../gcc/{gcc-10.3.inc => gcc-11.1.inc}        |  12 +-
 ...ian_10.3.bb => gcc-cross-canadian_11.1.bb} |   0
 .../{gcc-cross_10.3.bb => gcc-cross_11.1.bb}  |   0
 ...-crosssdk_10.3.bb => gcc-crosssdk_11.1.bb} |   0
 ...cc-runtime_10.3.bb => gcc-runtime_11.1.bb} |   0
 ...itizers_10.3.bb => gcc-sanitizers_11.1.bb} |   0
 ...{gcc-source_10.3.bb => gcc-source_11.1.bb} |   0
 ...0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch |  10 +-
 .../0002-gcc-poison-system-directories.patch  |  52 +++--
 ...-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |   6 +-
 .../gcc/gcc/0004-64-bit-multilib-hack.patch   |  10 +-
 .../gcc/gcc/0005-optional-libstdc.patch       |  26 +--
 .../gcc/gcc/0006-COLLECT_GCC_OPTIONS.patch    |   6 +-
 ...ts.h-in-B-instead-of-S-and-t-oe-in-B.patch |  16 +-
 .../gcc/0008-fortran-cross-compile-hack.patch |  10 +-
 .../gcc/gcc/0009-cpp-honor-sysroot.patch      |  14 +-
 .../gcc/0010-MIPS64-Default-to-N64-ABI.patch  |   6 +-
 ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |  28 +--
 ...gcc-Fix-argument-list-too-long-error.patch |   6 +-
 .../gcc/gcc/0013-Disable-sdt.patch            |  16 +-
 .../gcc/gcc/0014-libtool.patch                |   2 +-
 ...s-fix-v4bx-to-linker-to-support-EABI.patch |   4 +-
 ...-config-files-from-B-instead-of-usin.patch |  14 +-
 ...ir-from-.la-which-usually-points-to-.patch |   2 +-
 .../gcc/gcc/0018-export-CPP.patch             |   4 +-
 ...e-target-gcc-headers-can-be-included.patch |  12 +-
 ...t-directory-during-relink-if-inst_pr.patch |   2 +-
 ...IR-replacement-instead-of-hardcoding.patch |   4 +-
 ...22-aarch64-Add-support-for-musl-ldso.patch |   4 +-
 ...-fix-libcc1-s-install-path-and-rpath.patch |   8 +-
 ...le-sysroot-support-for-nativesdk-gcc.patch |  41 ++--
 ...sroot-gcc-version-specific-dirs-with.patch |   8 +-
 ...ous-_FOR_BUILD-and-related-variables.patch |  18 +-
 ...027-nios2-Define-MUSL_DYNAMIC_LINKER.patch |   4 +-
 ...d-to-link-commandline-for-musl-targe.patch |  10 +-
 ...using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch |   4 +-
 .../0030-sync-gcc-stddef.h-with-musl.patch    |   4 +-
 ...-fault-in-precompiled-header-generat.patch |   6 +-
 .../gcc/0032-Fix-for-testsuite-failure.patch  |   2 +-
 ...Re-introduce-spe-commandline-options.patch |  11 +-
 ...as-for-__cpu_indicator_init-instead-.patch |  12 +-
 ...s-Do-not-use-__LINE__-for-maintainin.patch |  34 +--
 ...ngw32-Enable-operation_not_supported.patch |   4 +-
 ...omic-Do-not-enforce-march-on-aarch64.patch |   8 +-
 ...libgomp-libitc-Fix-bootstrap-PR70454.patch | 209 ------------------
 .../gcc/{gcc_10.3.bb => gcc_11.1.bb}          |   0
 ...initial_10.3.bb => libgcc-initial_11.1.bb} |   0
 .../gcc/{libgcc_10.3.bb => libgcc_11.1.bb}    |   0
 ...ibgfortran_10.3.bb => libgfortran_11.1.bb} |   0
 51 files changed, 224 insertions(+), 429 deletions(-)
 rename meta/recipes-devtools/gcc/{gcc-10.3.inc => gcc-11.1.inc} (94%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_10.3.bb => gcc-cross-canadian_11.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_10.3.bb => gcc-cross_11.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_10.3.bb => gcc-crosssdk_11.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_10.3.bb => gcc-runtime_11.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_10.3.bb => gcc-sanitizers_11.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_10.3.bb => gcc-source_11.1.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0038-libatomic-libgomp-libitc-Fix-bootstrap-PR70454.patch
 rename meta/recipes-devtools/gcc/{gcc_10.3.bb => gcc_11.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_10.3.bb => libgcc-initial_11.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_10.3.bb => libgcc_11.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_10.3.bb => libgfortran_11.1.bb} (100%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 0766205d2f..140f7b490e 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -194,7 +194,7 @@ RECIPE_MAINTAINER_pn-gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Khem Raj <r
 RECIPE_MAINTAINER_pn-gcc-crosssdk-${SDK_SYS} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-gcc-runtime = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-gcc-sanitizers = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER_pn-gcc-source-10.3.0 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER_pn-gcc-source-11.1.0 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-gconf = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-gcr = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-gdb = "Khem Raj <raj.khem@gmail.com>"
diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 67ca87240f..a0c35eed09 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -16,7 +16,7 @@ PREFERRED_PROVIDER_virtual/${SDK_PREFIX}compilerlibs = "nativesdk-gcc-runtime"
 # Default libc config
 PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 
-GCCVERSION ?= "10.%"
+GCCVERSION ?= "11.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.36%"
 GDBVERSION ?= "10.%"
diff --git a/meta/recipes-devtools/gcc/gcc-10.3.inc b/meta/recipes-devtools/gcc/gcc-11.1.inc
similarity index 94%
rename from meta/recipes-devtools/gcc/gcc-10.3.inc
rename to meta/recipes-devtools/gcc/gcc-11.1.inc
index 7fcb058fea..713002266a 100644
--- a/meta/recipes-devtools/gcc/gcc-10.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.1.inc
@@ -2,11 +2,11 @@ require gcc-common.inc
 
 # Third digit in PV should be incremented after a minor release
 
-PV = "10.3.0"
+PV = "11.1.0"
 
 # BINV should be incremented to a revision after a minor gcc release
 
-BINV = "10.3.0"
+BINV = "11.1.0"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
 
@@ -23,9 +23,9 @@ LIC_FILES_CHKSUM = "\
     file://COPYING.RUNTIME;md5=fe60d87048567d4fe8c8a0ed2448bcc8 \
 "
 
-BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
-#RELEASE ?= "93a49d2d2292893b9b7f38132df949c70942838c"
+#RELEASE ?= "5b2ac9b40c325e9209c0bd55955db84aad4a0cc5"
 #BASEURI ?= "https://github.com/gcc-mirror/gcc/archive/${RELEASE}.zip;downloadfilename=gcc-${PV}-${RELEASE}.zip"
+BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
 SRC_URI = "\
            ${BASEURI} \
            file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
@@ -65,11 +65,11 @@ SRC_URI = "\
            file://0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch \
            file://0036-mingw32-Enable-operation_not_supported.patch \
            file://0037-libatomic-Do-not-enforce-march-on-aarch64.patch \
-           file://0038-libatomic-libgomp-libitc-Fix-bootstrap-PR70454.patch \
 "
-SRC_URI[sha256sum] = "64f404c1a650f27fc33da242e1f2df54952e3963a49e06e73f6940f3223ac344"
+SRC_URI[sha256sum] = "4c4a6fb8a8396059241c2e674b85b351c26a5d678274007f076957afa1cc9ddf"
 
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
+
 # For dev release snapshotting
 #S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${RELEASE}"
 #B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_10.3.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_11.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-canadian_10.3.bb
rename to meta/recipes-devtools/gcc/gcc-cross-canadian_11.1.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross_10.3.bb b/meta/recipes-devtools/gcc/gcc-cross_11.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross_10.3.bb
rename to meta/recipes-devtools/gcc/gcc-cross_11.1.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_10.3.bb b/meta/recipes-devtools/gcc/gcc-crosssdk_11.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk_10.3.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk_11.1.bb
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_10.3.bb b/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-runtime_10.3.bb
rename to meta/recipes-devtools/gcc/gcc-runtime_11.1.bb
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_10.3.bb b/meta/recipes-devtools/gcc/gcc-sanitizers_11.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-sanitizers_10.3.bb
rename to meta/recipes-devtools/gcc/gcc-sanitizers_11.1.bb
diff --git a/meta/recipes-devtools/gcc/gcc-source_10.3.bb b/meta/recipes-devtools/gcc/gcc-source_11.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-source_10.3.bb
rename to meta/recipes-devtools/gcc/gcc-source_11.1.bb
diff --git a/meta/recipes-devtools/gcc/gcc/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
index 6beedacf66..0a108ee51b 100644
--- a/meta/recipes-devtools/gcc/gcc/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
+++ b/meta/recipes-devtools/gcc/gcc/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
@@ -1,4 +1,4 @@
-From 2b4a66cbe0bd52e77b37dbaee46e2605d3854412 Mon Sep 17 00:00:00 2001
+From 368eaf1846733a9920c7cf5bc547a377e7167785 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 08:37:11 +0400
 Subject: [PATCH] gcc-4.3.1: ARCH_FLAGS_FOR_TARGET
@@ -12,10 +12,10 @@ Upstream-Status: Inappropriate [embedded specific]
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure b/configure
-index f2ec106a86e..9350b0cf3ed 100755
+index 504f6410274..bcebad264ec 100755
 --- a/configure
 +++ b/configure
-@@ -7723,7 +7723,7 @@ fi
+@@ -9728,7 +9728,7 @@ fi
  # for target_alias and gcc doesn't manage it consistently.
  target_configargs="--cache-file=./config.cache ${target_configargs}"
  
@@ -25,10 +25,10 @@ index f2ec106a86e..9350b0cf3ed 100755
   *" newlib "*)
    case " $target_configargs " in
 diff --git a/configure.ac b/configure.ac
-index 115db3f402a..5ef61255710 100644
+index 088e735c5db..1289fe08760 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3228,7 +3228,7 @@ fi
+@@ -3240,7 +3240,7 @@ fi
  # for target_alias and gcc doesn't manage it consistently.
  target_configargs="--cache-file=./config.cache ${target_configargs}"
  
diff --git a/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch b/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch
index c96f170196..18a9fb8701 100644
--- a/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch
+++ b/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch
@@ -1,6 +1,6 @@
-From a4fd05ff8e8ed7252d7b302891ac842cbb190c41 Mon Sep 17 00:00:00 2001
+From 118c6f054711d437167ff125a88c9236bfc8099c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 29 Mar 2013 08:59:00 +0400
+Date: Mon, 8 Mar 2021 16:04:20 -0800
 Subject: [PATCH] gcc: poison-system-directories
 
 Add /sw/include and /opt/include based on the original
@@ -11,11 +11,9 @@ aborted.
 Instead, we add the two missing items to the current scan.  If the user
 wants this to be a failure, they can add "-Werror=poison-system-directories".
 
+Upstream-Status: Pending
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
-
-Upstream-Status: Pending
 ---
  gcc/common.opt      |  4 ++++
  gcc/config.in       | 10 ++++++++++
@@ -27,10 +25,10 @@ Upstream-Status: Pending
  7 files changed, 86 insertions(+), 2 deletions(-)
 
 diff --git a/gcc/common.opt b/gcc/common.opt
-index ec5235c3a41..ca942863064 100644
+index c75dd36843e..49acbd6ed44 100644
 --- a/gcc/common.opt
 +++ b/gcc/common.opt
-@@ -682,6 +682,10 @@ Wreturn-local-addr
+@@ -683,6 +683,10 @@ Wreturn-local-addr
  Common Var(warn_return_local_addr) Init(1) Warning
  Warn about returning a pointer/reference to a local or temporary variable.
  
@@ -42,10 +40,10 @@ index ec5235c3a41..ca942863064 100644
  Common Var(warn_shadow) Warning
  Warn when one variable shadows another.  Same as -Wshadow=global.
 diff --git a/gcc/config.in b/gcc/config.in
-index 364eba47737..7d2c3bbf1a3 100644
+index 10a13cde586..8848284da41 100644
 --- a/gcc/config.in
 +++ b/gcc/config.in
-@@ -224,6 +224,16 @@
+@@ -218,6 +218,16 @@
  #endif
  
  
@@ -63,18 +61,18 @@ index 364eba47737..7d2c3bbf1a3 100644
     optimizer and back end) to be checked for dynamic type safety at runtime.
     This is quite expensive. */
 diff --git a/gcc/configure b/gcc/configure
-index 8fe9c91fd7c..8976850dff6 100755
+index 9bb436ce7bd..3f0734bff11 100755
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -1010,6 +1010,7 @@ with_system_zlib
- enable_maintainer_mode
+@@ -1020,6 +1020,7 @@ enable_maintainer_mode
  enable_link_mutex
+ enable_link_serialization
  enable_version_specific_runtime_libs
 +enable_poison_system_directories
  enable_plugin
  enable_host_shared
  enable_libquadmath_support
-@@ -1766,6 +1767,8 @@ Optional Features:
+@@ -1782,6 +1783,8 @@ Optional Features:
    --enable-version-specific-runtime-libs
                            specify that runtime libraries should be installed
                            in a compiler-specific directory
@@ -83,7 +81,7 @@ index 8fe9c91fd7c..8976850dff6 100755
    --enable-plugin         enable plugin support
    --enable-host-shared    build host code as shared libraries
    --disable-libquadmath-support
-@@ -30276,6 +30279,22 @@ if test "${enable_version_specific_runtime_libs+set}" = set; then :
+@@ -31325,6 +31328,22 @@ if test "${enable_version_specific_runtime_libs+set}" = set; then :
  fi
  
  
@@ -107,16 +105,16 @@ index 8fe9c91fd7c..8976850dff6 100755
  
  
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 84dceb8074a..13eace6cfc6 100644
+index caa611933df..54e21764b3e 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -6608,6 +6608,22 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
+@@ -7123,6 +7123,22 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
                  [specify that runtime libraries should be
                   installed in a compiler-specific directory])])
  
 +AC_ARG_ENABLE([poison-system-directories],
 +             AS_HELP_STRING([--enable-poison-system-directories],
-+			    [warn for use of native system header directories (no/yes/error)]),,
++                            [warn for use of native system header directories (no/yes/error)]),,
 +             [enable_poison_system_directories=no])
 +AC_MSG_NOTICE([poisoned directories $enable_poison_system_directories])
 +if test "x${enable_poison_system_directories}" != "xno"; then
@@ -134,10 +132,10 @@ index 84dceb8074a..13eace6cfc6 100644
  AC_SUBST(subdirs)
  AC_SUBST(srcdir)
 diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
-index eabeec944e7..cd31b522e42 100644
+index 7a368959e5e..6659a903bf0 100644
 --- a/gcc/doc/invoke.texi
 +++ b/gcc/doc/invoke.texi
-@@ -348,6 +348,7 @@ Objective-C and Objective-C++ Dialects}.
+@@ -369,6 +369,7 @@ Objective-C and Objective-C++ Dialects}.
  -Wpacked  -Wno-packed-bitfield-compat  -Wpacked-not-aligned  -Wpadded @gol
  -Wparentheses  -Wno-pedantic-ms-format @gol
  -Wpointer-arith  -Wno-pointer-compare  -Wno-pointer-to-int-cast @gol
@@ -145,7 +143,7 @@ index eabeec944e7..cd31b522e42 100644
  -Wno-pragmas  -Wno-prio-ctor-dtor  -Wredundant-decls @gol
  -Wrestrict  -Wno-return-local-addr  -Wreturn-type @gol
  -Wno-scalar-storage-order  -Wsequence-point @gol
-@@ -6926,6 +6927,14 @@ made up of data only and thus requires no special treatment.  But, for
+@@ -7735,6 +7736,14 @@ made up of data only and thus requires no special treatment.  But, for
  most targets, it is made up of code and thus requires the stack to be
  made executable in order for the program to work properly.
  
@@ -161,10 +159,10 @@ index eabeec944e7..cd31b522e42 100644
  @opindex Wfloat-equal
  @opindex Wno-float-equal
 diff --git a/gcc/gcc.c b/gcc/gcc.c
-index 9f790db0daf..f379f71da3d 100644
+index 7837553958b..19c75b6e20d 100644
 --- a/gcc/gcc.c
 +++ b/gcc/gcc.c
-@@ -1041,6 +1041,8 @@ proper position among the other output files.  */
+@@ -1152,6 +1152,8 @@ proper position among the other output files.  */
     "%{fuse-ld=*:-fuse-ld=%*} " LINK_COMPRESS_DEBUG_SPEC \
     "%X %{o*} %{e*} %{N} %{n} %{r}\
      %{s} %{t} %{u*} %{z} %{Z} %{!nostdlib:%{!r:%{!nostartfiles:%S}}} \
@@ -173,7 +171,7 @@ index 9f790db0daf..f379f71da3d 100644
      %{static|no-pie|static-pie:} %@{L*} %(mfwrap) %(link_libgcc) " \
      VTABLE_VERIFICATION_SPEC " " SANITIZER_EARLY_SPEC " %o "" \
      %{fopenacc|fopenmp|%:gt(%{ftree-parallelize-loops=*:%*} 1):\
-@@ -1134,8 +1136,11 @@ static const char *cpp_unique_options =
+@@ -1247,8 +1249,11 @@ static const char *cpp_unique_options =
  static const char *cpp_options =
  "%(cpp_unique_options) %1 %{m*} %{std*&ansi&trigraphs} %{W*&pedantic*} %{w}\
   %{f*} %{g*:%{%:debug-level-gt(0):%{g*}\
@@ -185,10 +183,10 @@ index 9f790db0daf..f379f71da3d 100644
 +#endif
 + " %{undef} %{save-temps*:-fpch-preprocess}";
  
- /* This contains cpp options which are not passed when the preprocessor
-    output will be used by another program.  */
+ /* Pass -d* flags, possibly modifying -dumpdir, -dumpbase et al.
+ 
 diff --git a/gcc/incpath.c b/gcc/incpath.c
-index 8a2bda00f80..9098ab044ab 100644
+index 446d280321d..fbfc0ce03b8 100644
 --- a/gcc/incpath.c
 +++ b/gcc/incpath.c
 @@ -26,6 +26,7 @@
@@ -199,7 +197,7 @@ index 8a2bda00f80..9098ab044ab 100644
  
  /* Microsoft Windows does not natively support inodes.
     VMS has non-numeric inodes.  */
-@@ -393,6 +394,26 @@ merge_include_chains (const char *sysroot, cpp_reader *pfile, int verbose)
+@@ -395,6 +396,26 @@ merge_include_chains (const char *sysroot, cpp_reader *pfile, int verbose)
  	}
        fprintf (stderr, _("End of search list.\n"));
      }
diff --git a/meta/recipes-devtools/gcc/gcc/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
index 39b616e82e..7a67654555 100644
--- a/meta/recipes-devtools/gcc/gcc/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
+++ b/meta/recipes-devtools/gcc/gcc/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
@@ -1,4 +1,4 @@
-From 860a8a2ec653e3c65bc5440f181b459dfe56c8a0 Mon Sep 17 00:00:00 2001
+From 274a27da6fe355c4c49953b3b69c8949d2412c62 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:08:31 +0400
 Subject: [PATCH] gcc-4.3.3: SYSROOT_CFLAGS_FOR_TARGET
@@ -26,10 +26,10 @@ Upstream-Status: Pending
  1 file changed, 32 insertions(+)
 
 diff --git a/configure b/configure
-index 9350b0cf3ed..8ed565c51b3 100755
+index bcebad264ec..86e4ee7c383 100755
 --- a/configure
 +++ b/configure
-@@ -6972,6 +6972,38 @@ fi
+@@ -8977,6 +8977,38 @@ fi
  
  
  
diff --git a/meta/recipes-devtools/gcc/gcc/0004-64-bit-multilib-hack.patch b/meta/recipes-devtools/gcc/gcc/0004-64-bit-multilib-hack.patch
index 04d8bdf331..789f57343b 100644
--- a/meta/recipes-devtools/gcc/gcc/0004-64-bit-multilib-hack.patch
+++ b/meta/recipes-devtools/gcc/gcc/0004-64-bit-multilib-hack.patch
@@ -1,4 +1,4 @@
-From d166c36206b276f769e175f39cf44b33c98bd153 Mon Sep 17 00:00:00 2001
+From 28e7c312b1292ca216d4b54ec9f6b7ac055907a8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:10:06 +0400
 Subject: [PATCH] 64-bit multilib hack.
@@ -37,7 +37,7 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
  5 files changed, 15 insertions(+), 20 deletions(-)
 
 diff --git a/gcc/config/aarch64/t-aarch64-linux b/gcc/config/aarch64/t-aarch64-linux
-index 83e59e33b85..b1356be1fb4 100644
+index 241b0ef20b6..a7dadb2d64f 100644
 --- a/gcc/config/aarch64/t-aarch64-linux
 +++ b/gcc/config/aarch64/t-aarch64-linux
 @@ -21,8 +21,8 @@
@@ -54,7 +54,7 @@ index 83e59e33b85..b1356be1fb4 100644
 -MULTILIB_OSDIRNAMES += mabi.ilp32=../libilp32$(call if_multiarch,:aarch64$(AARCH_BE)-linux-gnu_ilp32)
 +#MULTILIB_OSDIRNAMES += mabi.ilp32=../libilp32$(call if_multiarch,:aarch64$(AARCH_BE)-linux-gnu_ilp32)
 diff --git a/gcc/config/i386/t-linux64 b/gcc/config/i386/t-linux64
-index 1171e218578..5e057b7e5db 100644
+index d288b093522..7b5980a9d21 100644
 --- a/gcc/config/i386/t-linux64
 +++ b/gcc/config/i386/t-linux64
 @@ -32,7 +32,5 @@
@@ -68,7 +68,7 @@ index 1171e218578..5e057b7e5db 100644
 +MULTILIB_DIRNAMES = . .
 +MULTILIB_OSDIRNAMES = ../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir))
 diff --git a/gcc/config/mips/t-linux64 b/gcc/config/mips/t-linux64
-index ceb58d3b5f3..43fe2bf28ab 100644
+index 130e1f04707..3b7eb6b2a2f 100644
 --- a/gcc/config/mips/t-linux64
 +++ b/gcc/config/mips/t-linux64
 @@ -17,10 +17,6 @@
@@ -98,7 +98,7 @@ index 216d2776a18..e4d817621fc 100644
 +#MULTILIB_OSDIRNAMES := $(patsubst lib%,../lib%,$(MULTILIB_DIRNAMES))
 +MULTILIB_OSDIRNAMES := ../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir))
 diff --git a/gcc/config/rs6000/t-linux64 b/gcc/config/rs6000/t-linux64
-index 264a7e27524..dc9d440f66b 100644
+index e11a118cb5f..4eaffb416fe 100644
 --- a/gcc/config/rs6000/t-linux64
 +++ b/gcc/config/rs6000/t-linux64
 @@ -26,10 +26,9 @@
diff --git a/meta/recipes-devtools/gcc/gcc/0005-optional-libstdc.patch b/meta/recipes-devtools/gcc/gcc/0005-optional-libstdc.patch
index 9f5b96eb63..c921ac3340 100644
--- a/meta/recipes-devtools/gcc/gcc/0005-optional-libstdc.patch
+++ b/meta/recipes-devtools/gcc/gcc/0005-optional-libstdc.patch
@@ -1,4 +1,4 @@
-From dcbfaf57a213e3beaafb0561b007c61501961f03 Mon Sep 17 00:00:00 2001
+From 57e2c5e35732988c0b287289eb0997b4e9769371 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:12:56 +0400
 Subject: [PATCH] optional libstdc
@@ -25,10 +25,10 @@ Upstream-Status: Inappropriate [embedded specific]
  4 files changed, 37 insertions(+), 1 deletion(-)
 
 diff --git a/gcc/c-family/c.opt b/gcc/c-family/c.opt
-index c49da99d395..35f712e2c84 100644
+index 64e46e7573e..1824380f27a 100644
 --- a/gcc/c-family/c.opt
 +++ b/gcc/c-family/c.opt
-@@ -2025,6 +2025,10 @@ nostdinc++
+@@ -2166,6 +2166,10 @@ nostdinc++
  C++ ObjC++
  Do not search standard system include directories for C++.
  
@@ -40,10 +40,10 @@ index c49da99d395..35f712e2c84 100644
  C ObjC C++ ObjC++ Joined Separate
  ; Documented in common.opt
 diff --git a/gcc/cp/g++spec.c b/gcc/cp/g++spec.c
-index 0ab63bcd211..7b081e9e4f0 100644
+index 3c9bd1490b4..818beb61cee 100644
 --- a/gcc/cp/g++spec.c
 +++ b/gcc/cp/g++spec.c
-@@ -137,6 +137,7 @@ lang_specific_driver (struct cl_decoded_option **in_decoded_options,
+@@ -159,6 +159,7 @@ lang_specific_driver (struct cl_decoded_option **in_decoded_options,
        switch (decoded_options[i].opt_index)
  	{
  	case OPT_nostdlib:
@@ -52,10 +52,10 @@ index 0ab63bcd211..7b081e9e4f0 100644
  	  library = -1;
  	  break;
 diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
-index cd31b522e42..1f14df48bda 100644
+index 6659a903bf0..9ee63dbe52f 100644
 --- a/gcc/doc/invoke.texi
 +++ b/gcc/doc/invoke.texi
-@@ -230,6 +230,9 @@ in the following sections.
+@@ -239,6 +239,9 @@ in the following sections.
  -fno-weak  -nostdinc++ @gol
  -fvisibility-inlines-hidden @gol
  -fvisibility-ms-compat @gol
@@ -63,9 +63,9 @@ index cd31b522e42..1f14df48bda 100644
 +-fvtv-counts -fvtv-debug @gol
 +-nostdlib++ @gol
  -fext-numeric-literals @gol
- -Wabi-tag  -Wcatch-value  -Wcatch-value=@var{n} @gol
- -Wno-class-conversion  -Wclass-memaccess @gol
-@@ -600,7 +603,7 @@ Objective-C and Objective-C++ Dialects}.
+ -flang-info-include-translate@r{[}=@var{header}@r{]} @gol
+ -flang-info-include-translate-not @gol
+@@ -632,7 +635,7 @@ Objective-C and Objective-C++ Dialects}.
  -pie  -pthread  -r  -rdynamic @gol
  -s  -static  -static-pie  -static-libgcc  -static-libstdc++ @gol
  -static-libasan  -static-libtsan  -static-liblsan  -static-libubsan @gol
@@ -74,7 +74,7 @@ index cd31b522e42..1f14df48bda 100644
  -T @var{script}  -Wl,@var{option}  -Xlinker @var{option} @gol
  -u @var{symbol}  -z @var{keyword}}
  
-@@ -14468,6 +14471,33 @@ Specify that the program entry point is @var{entry}.  The argument is
+@@ -15708,6 +15711,33 @@ Specify that the program entry point is @var{entry}.  The argument is
  interpreted by the linker; the GNU linker accepts either a symbol name
  or an address.
  
@@ -109,10 +109,10 @@ index cd31b522e42..1f14df48bda 100644
  @opindex pie
  Produce a dynamically linked position independent executable on targets
 diff --git a/gcc/gcc.c b/gcc/gcc.c
-index f379f71da3d..1ee962acfaa 100644
+index 19c75b6e20d..be7630ffd8c 100644
 --- a/gcc/gcc.c
 +++ b/gcc/gcc.c
-@@ -1051,6 +1051,7 @@ proper position among the other output files.  */
+@@ -1162,6 +1162,7 @@ proper position among the other output files.  */
      %(mflib) " STACK_SPLIT_SPEC "\
      %{fprofile-arcs|fprofile-generate*|coverage:-lgcov} " SANITIZER_SPEC " \
      %{!nostdlib:%{!r:%{!nodefaultlibs:%(link_ssp) %(link_gcc_c_sequence)}}}\
diff --git a/meta/recipes-devtools/gcc/gcc/0006-COLLECT_GCC_OPTIONS.patch b/meta/recipes-devtools/gcc/gcc/0006-COLLECT_GCC_OPTIONS.patch
index 7e43284c17..265ca0e218 100644
--- a/meta/recipes-devtools/gcc/gcc/0006-COLLECT_GCC_OPTIONS.patch
+++ b/meta/recipes-devtools/gcc/gcc/0006-COLLECT_GCC_OPTIONS.patch
@@ -1,4 +1,4 @@
-From a03125f58038c89637445fdfbb6c38d2b276633e Mon Sep 17 00:00:00 2001
+From 127716a32a11ca2a6b3aac068054bfc69c4dcfd8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:16:28 +0400
 Subject: [PATCH] COLLECT_GCC_OPTIONS
@@ -14,10 +14,10 @@ Upstream-Status: Pending
  1 file changed, 9 insertions(+)
 
 diff --git a/gcc/gcc.c b/gcc/gcc.c
-index 1ee962acfaa..39b1635651a 100644
+index be7630ffd8c..1bc45285384 100644
 --- a/gcc/gcc.c
 +++ b/gcc/gcc.c
-@@ -4809,6 +4809,15 @@ set_collect_gcc_options (void)
+@@ -5383,6 +5383,15 @@ set_collect_gcc_options (void)
  		sizeof ("COLLECT_GCC_OPTIONS=") - 1);
  
    first_time = TRUE;
diff --git a/meta/recipes-devtools/gcc/gcc/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch b/meta/recipes-devtools/gcc/gcc/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
index c7693a8b77..9844c2ae8a 100644
--- a/meta/recipes-devtools/gcc/gcc/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
+++ b/meta/recipes-devtools/gcc/gcc/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
@@ -1,4 +1,4 @@
-From 938b65c6ba6cb4af24285f288126fe65b3e1fa9e Mon Sep 17 00:00:00 2001
+From e64342df647829d3e1c52fd480a5be7c1281ced0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:17:25 +0400
 Subject: [PATCH] Use the defaults.h in ${B} instead of ${S}, and t-oe in ${B}
@@ -26,10 +26,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  4 files changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index 646db219460..501a5f16d9f 100644
+index 8a5fb3fd99c..7da6f439fff 100644
 --- a/gcc/Makefile.in
 +++ b/gcc/Makefile.in
-@@ -540,7 +540,7 @@ TARGET_SYSTEM_ROOT = @TARGET_SYSTEM_ROOT@
+@@ -552,7 +552,7 @@ TARGET_SYSTEM_ROOT = @TARGET_SYSTEM_ROOT@
  TARGET_SYSTEM_ROOT_DEFINE = @TARGET_SYSTEM_ROOT_DEFINE@
  
  xmake_file=@xmake_file@
@@ -39,10 +39,10 @@ index 646db219460..501a5f16d9f 100644
  TM_MULTILIB_CONFIG=@TM_MULTILIB_CONFIG@
  TM_MULTILIB_EXCEPTIONS_CONFIG=@TM_MULTILIB_EXCEPTIONS_CONFIG@
 diff --git a/gcc/configure b/gcc/configure
-index 8976850dff6..4d903cf40e8 100755
+index 3f0734bff11..c5d3bc4ee2d 100755
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -12710,8 +12710,8 @@ for f in $tm_file; do
+@@ -13090,8 +13090,8 @@ for f in $tm_file; do
         tm_include_list="${tm_include_list} $f"
         ;;
      defaults.h )
@@ -54,10 +54,10 @@ index 8976850dff6..4d903cf40e8 100755
      * )
         tm_file_list="${tm_file_list} \$(srcdir)/config/$f"
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 13eace6cfc6..07aacfee055 100644
+index 54e21764b3e..f83420326d6 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -2143,8 +2143,8 @@ for f in $tm_file; do
+@@ -2263,8 +2263,8 @@ for f in $tm_file; do
         tm_include_list="${tm_include_list} $f"
         ;;
      defaults.h )
@@ -69,7 +69,7 @@ index 13eace6cfc6..07aacfee055 100644
      * )
         tm_file_list="${tm_file_list} \$(srcdir)/config/$f"
 diff --git a/gcc/mkconfig.sh b/gcc/mkconfig.sh
-index d2c677a4a42..d03852481cb 100644
+index c49acd8f7e4..a0a657bdbb9 100644
 --- a/gcc/mkconfig.sh
 +++ b/gcc/mkconfig.sh
 @@ -77,7 +77,7 @@ if [ -n "$HEADERS" ]; then
diff --git a/meta/recipes-devtools/gcc/gcc/0008-fortran-cross-compile-hack.patch b/meta/recipes-devtools/gcc/gcc/0008-fortran-cross-compile-hack.patch
index 707066291f..47f611e37e 100644
--- a/meta/recipes-devtools/gcc/gcc/0008-fortran-cross-compile-hack.patch
+++ b/meta/recipes-devtools/gcc/gcc/0008-fortran-cross-compile-hack.patch
@@ -1,4 +1,4 @@
-From 660bf2b932273e2cde495f31cc031bb084572862 Mon Sep 17 00:00:00 2001
+From 904d102e3ccb93296b16ceb2e283a6ccf3c1d718 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:20:01 +0400
 Subject: [PATCH] fortran cross-compile hack.
@@ -16,10 +16,10 @@ Upstream-Status: Inappropriate [embedded specific]
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/libgfortran/configure b/libgfortran/configure
-index 1b4a8b10609..d7ab18fc9f9 100755
+index f3634389cf8..f974e874b8e 100755
 --- a/libgfortran/configure
 +++ b/libgfortran/configure
-@@ -13092,7 +13092,7 @@ esac
+@@ -13102,7 +13102,7 @@ esac
  
  # We need gfortran to compile parts of the library
  #AC_PROG_FC(gfortran)
@@ -29,10 +29,10 @@ index 1b4a8b10609..d7ab18fc9f9 100755
  ac_compile='$FC -c $FCFLAGS $ac_fcflags_srcext conftest.$ac_ext >&5'
  ac_link='$FC -o conftest$ac_exeext $FCFLAGS $LDFLAGS $ac_fcflags_srcext conftest.$ac_ext $LIBS >&5'
 diff --git a/libgfortran/configure.ac b/libgfortran/configure.ac
-index 711dc60ff78..3c9bbfbf47d 100644
+index 8961e314d82..49c8221cb6b 100644
 --- a/libgfortran/configure.ac
 +++ b/libgfortran/configure.ac
-@@ -258,7 +258,7 @@ AC_SUBST(enable_static)
+@@ -271,7 +271,7 @@ AC_SUBST(enable_static)
  
  # We need gfortran to compile parts of the library
  #AC_PROG_FC(gfortran)
diff --git a/meta/recipes-devtools/gcc/gcc/0009-cpp-honor-sysroot.patch b/meta/recipes-devtools/gcc/gcc/0009-cpp-honor-sysroot.patch
index 3f6b69a3cc..c720defa35 100644
--- a/meta/recipes-devtools/gcc/gcc/0009-cpp-honor-sysroot.patch
+++ b/meta/recipes-devtools/gcc/gcc/0009-cpp-honor-sysroot.patch
@@ -1,4 +1,4 @@
-From 303cc9292cc0a1bd7bae994dd1e86197fb94068d Mon Sep 17 00:00:00 2001
+From 33a7a55d39c040ba09af2d69f7fa9cf8e6f84c91 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:22:00 +0400
 Subject: [PATCH] cpp: honor sysroot.
@@ -26,21 +26,23 @@ Upstream-Status: Pending
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/gcc/cp/lang-specs.h b/gcc/cp/lang-specs.h
-index 0ad4a33b93e..16c744f4f90 100644
+index 8902ae1d2ed..e99e2fcd6ad 100644
 --- a/gcc/cp/lang-specs.h
 +++ b/gcc/cp/lang-specs.h
-@@ -66,5 +66,5 @@ along with GCC; see the file COPYING3.  If not see
+@@ -116,7 +116,7 @@ along with GCC; see the file COPYING3.  If not see
    {".ii", "@c++-cpp-output", 0, 0, 0},
    {"@c++-cpp-output",
        "%{!E:%{!M:%{!MM:"
 -      "  cc1plus -fpreprocessed %i %(cc1_options) %2"
 +      "  cc1plus -fpreprocessed %i %I %(cc1_options) %2"
-       "  %{!fsyntax-only:%(invoke_as)}}}}", 0, 0, 0},
+       "  %{!fsyntax-only:"
+       "    %{fmodule-only:%{!S:-o %g.s%V}}"
+       "    %{!fmodule-only:%{!fmodule-header*:%(invoke_as)}}}"
 diff --git a/gcc/gcc.c b/gcc/gcc.c
-index 39b1635651a..e2e0bcee9b2 100644
+index 1bc45285384..8737bae5353 100644
 --- a/gcc/gcc.c
 +++ b/gcc/gcc.c
-@@ -1351,7 +1351,7 @@ static const struct compiler default_compilers[] =
+@@ -1470,7 +1470,7 @@ static const struct compiler default_compilers[] =
  					   %W{o*:--output-pch=%*}}%V}}}}}}}", 0, 0, 0},
    {".i", "@cpp-output", 0, 0, 0},
    {"@cpp-output",
diff --git a/meta/recipes-devtools/gcc/gcc/0010-MIPS64-Default-to-N64-ABI.patch b/meta/recipes-devtools/gcc/gcc/0010-MIPS64-Default-to-N64-ABI.patch
index 1aa29e6ac5..f385f8c5a2 100644
--- a/meta/recipes-devtools/gcc/gcc/0010-MIPS64-Default-to-N64-ABI.patch
+++ b/meta/recipes-devtools/gcc/gcc/0010-MIPS64-Default-to-N64-ABI.patch
@@ -1,4 +1,4 @@
-From b75e8fb1cc1607077a113de40ae0d16ad273f05a Mon Sep 17 00:00:00 2001
+From a2dc2fa4cc7e5d54544d4a7b6601eef79bc26cad Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:23:08 +0400
 Subject: [PATCH] MIPS64: Default to N64 ABI
@@ -14,10 +14,10 @@ Upstream-Status: Inappropriate [OE config specific]
  1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/gcc/config.gcc b/gcc/config.gcc
-index 6fcdd771d4c..feafcadfcac 100644
+index 3ec7582f5dd..a046fa6945c 100644
 --- a/gcc/config.gcc
 +++ b/gcc/config.gcc
-@@ -2542,29 +2542,29 @@ mips*-*-linux*)				# Linux MIPS, either endian.
+@@ -2543,29 +2543,29 @@ mips*-*-linux*)				# Linux MIPS, either endian.
  			default_mips_arch=mips32
  			;;
  		mips64el-st-linux-gnu)
diff --git a/meta/recipes-devtools/gcc/gcc/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
index ee34836ea0..4726267a80 100644
--- a/meta/recipes-devtools/gcc/gcc/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
+++ b/meta/recipes-devtools/gcc/gcc/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
@@ -1,4 +1,4 @@
-From 438b8d40f6060c0d62b474b2ae970241f9635f6b Mon Sep 17 00:00:00 2001
+From 8e9d6efecdc8c42f47e3a012dee764b13c3dad59 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:24:50 +0400
 Subject: [PATCH] Define GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
@@ -31,7 +31,7 @@ Upstream-Status: Inappropriate [OE configuration]
  12 files changed, 29 insertions(+), 34 deletions(-)
 
 diff --git a/gcc/config/alpha/linux-elf.h b/gcc/config/alpha/linux-elf.h
-index e25fcac3c59..01aca0c6542 100644
+index c1dae8ca2cf..3ce2b76c1a4 100644
 --- a/gcc/config/alpha/linux-elf.h
 +++ b/gcc/config/alpha/linux-elf.h
 @@ -23,8 +23,8 @@ along with GCC; see the file COPYING3.  If not see
@@ -46,7 +46,7 @@ index e25fcac3c59..01aca0c6542 100644
  #define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
  #elif DEFAULT_LIBC == LIBC_GLIBC
 diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-eabi.h
-index 5bdcfa0c5d3..0c0332f317f 100644
+index 85d0136e76e..6bd95855827 100644
 --- a/gcc/config/arm/linux-eabi.h
 +++ b/gcc/config/arm/linux-eabi.h
 @@ -65,8 +65,8 @@
@@ -61,7 +61,7 @@ index 5bdcfa0c5d3..0c0332f317f 100644
  
  #define GLIBC_DYNAMIC_LINKER \
 diff --git a/gcc/config/arm/linux-elf.h b/gcc/config/arm/linux-elf.h
-index 0ec3aa53189..abfa9566d74 100644
+index 0c1c4e70b6b..6bd643ade11 100644
 --- a/gcc/config/arm/linux-elf.h
 +++ b/gcc/config/arm/linux-elf.h
 @@ -60,7 +60,7 @@
@@ -74,7 +74,7 @@ index 0ec3aa53189..abfa9566d74 100644
  #define LINUX_TARGET_LINK_SPEC  "%{h*} \
     %{static:-Bstatic} \
 diff --git a/gcc/config/i386/linux.h b/gcc/config/i386/linux.h
-index 9f823f125ed..e0390b7d5e3 100644
+index 04b274f1654..7aafcf3ac2d 100644
 --- a/gcc/config/i386/linux.h
 +++ b/gcc/config/i386/linux.h
 @@ -20,7 +20,7 @@ along with GCC; see the file COPYING3.  If not see
@@ -87,7 +87,7 @@ index 9f823f125ed..e0390b7d5e3 100644
  #undef MUSL_DYNAMIC_LINKER
  #define MUSL_DYNAMIC_LINKER "/lib/ld-musl-i386.so.1"
 diff --git a/gcc/config/i386/linux64.h b/gcc/config/i386/linux64.h
-index 6cb68d1ccfa..7de09ec857c 100644
+index b3822ced528..92d303e80d6 100644
 --- a/gcc/config/i386/linux64.h
 +++ b/gcc/config/i386/linux64.h
 @@ -27,9 +27,9 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
@@ -104,7 +104,7 @@ index 6cb68d1ccfa..7de09ec857c 100644
  #undef MUSL_DYNAMIC_LINKER32
  #define MUSL_DYNAMIC_LINKER32 "/lib/ld-musl-i386.so.1"
 diff --git a/gcc/config/linux.h b/gcc/config/linux.h
-index 95654bcdb5a..0c1a8118a26 100644
+index 4e1db60fced..87efc5f69fe 100644
 --- a/gcc/config/linux.h
 +++ b/gcc/config/linux.h
 @@ -94,10 +94,10 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
@@ -123,7 +123,7 @@ index 95654bcdb5a..0c1a8118a26 100644
  #define BIONIC_DYNAMIC_LINKER32 "/system/bin/linker"
  #define BIONIC_DYNAMIC_LINKER64 "/system/bin/linker64"
 diff --git a/gcc/config/mips/linux.h b/gcc/config/mips/linux.h
-index 54446e58e5f..4786ee304c1 100644
+index 44a85e410d9..8d41b5574f6 100644
 --- a/gcc/config/mips/linux.h
 +++ b/gcc/config/mips/linux.h
 @@ -22,20 +22,20 @@ along with GCC; see the file COPYING3.  If not see
@@ -154,7 +154,7 @@ index 54446e58e5f..4786ee304c1 100644
  #undef MUSL_DYNAMIC_LINKER32
  #define MUSL_DYNAMIC_LINKER32 \
 diff --git a/gcc/config/riscv/linux.h b/gcc/config/riscv/linux.h
-index 4afef7c228c..01997330741 100644
+index 9238de5bc92..7136a83260a 100644
 --- a/gcc/config/riscv/linux.h
 +++ b/gcc/config/riscv/linux.h
 @@ -22,7 +22,7 @@ along with GCC; see the file COPYING3.  If not see
@@ -167,10 +167,10 @@ index 4afef7c228c..01997330741 100644
  #define MUSL_ABI_SUFFIX \
    "%{mabi=ilp32:-sf}" \
 diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
-index 2ded3301282..80969a8fd89 100644
+index e3f2cd254f6..a11e01faa3d 100644
 --- a/gcc/config/rs6000/linux64.h
 +++ b/gcc/config/rs6000/linux64.h
-@@ -419,24 +419,19 @@ extern int dot_symbols;
+@@ -336,24 +336,19 @@ extern int dot_symbols;
  #undef	LINK_OS_DEFAULT_SPEC
  #define LINK_OS_DEFAULT_SPEC "%(link_os_linux)"
  
@@ -201,7 +201,7 @@ index 2ded3301282..80969a8fd89 100644
  #undef  DEFAULT_ASM_ENDIAN
  #if (TARGET_DEFAULT & MASK_LITTLE_ENDIAN)
 diff --git a/gcc/config/sh/linux.h b/gcc/config/sh/linux.h
-index c1d0441d488..81373eb8336 100644
+index 7558d2f7195..3aaa6c3a078 100644
 --- a/gcc/config/sh/linux.h
 +++ b/gcc/config/sh/linux.h
 @@ -64,7 +64,7 @@ along with GCC; see the file COPYING3.  If not see
@@ -214,7 +214,7 @@ index c1d0441d488..81373eb8336 100644
  #undef SUBTARGET_LINK_EMUL_SUFFIX
  #define SUBTARGET_LINK_EMUL_SUFFIX "%{mfdpic:_fd;:_linux}"
 diff --git a/gcc/config/sparc/linux.h b/gcc/config/sparc/linux.h
-index 63853e60c03..31219e9892c 100644
+index 2550d7ee8f0..a94f4cd8ba2 100644
 --- a/gcc/config/sparc/linux.h
 +++ b/gcc/config/sparc/linux.h
 @@ -78,7 +78,7 @@ extern const char *host_detect_local_cpu (int argc, const char **argv);
@@ -227,7 +227,7 @@ index 63853e60c03..31219e9892c 100644
  #undef  LINK_SPEC
  #define LINK_SPEC "-m elf32_sparc %{shared:-shared} \
 diff --git a/gcc/config/sparc/linux64.h b/gcc/config/sparc/linux64.h
-index 19ce84d7adb..0d9cc752931 100644
+index 95af8afa9b5..63127afb074 100644
 --- a/gcc/config/sparc/linux64.h
 +++ b/gcc/config/sparc/linux64.h
 @@ -78,8 +78,8 @@ along with GCC; see the file COPYING3.  If not see
diff --git a/meta/recipes-devtools/gcc/gcc/0012-gcc-Fix-argument-list-too-long-error.patch b/meta/recipes-devtools/gcc/gcc/0012-gcc-Fix-argument-list-too-long-error.patch
index ad2df92192..814ce18b98 100644
--- a/meta/recipes-devtools/gcc/gcc/0012-gcc-Fix-argument-list-too-long-error.patch
+++ b/meta/recipes-devtools/gcc/gcc/0012-gcc-Fix-argument-list-too-long-error.patch
@@ -1,4 +1,4 @@
-From cc2aac0b93f2f22a5fd0ecd80743e88d4e244597 Mon Sep 17 00:00:00 2001
+From 12646c0899dec1b127ce71ebacf2571c1c7360f4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:26:37 +0400
 Subject: [PATCH] gcc: Fix argument list too long error.
@@ -28,10 +28,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index 501a5f16d9f..674f1057aaf 100644
+index 7da6f439fff..59c45c81393 100644
 --- a/gcc/Makefile.in
 +++ b/gcc/Makefile.in
-@@ -3609,7 +3609,7 @@ install-plugin: installdirs lang.install-plugin s-header-vars install-gengtype
+@@ -3678,7 +3678,7 @@ install-plugin: installdirs lang.install-plugin s-header-vars install-gengtype
  # We keep the directory structure for files in config, common/config or
  # c-family and .def files. All other files are flattened to a single directory.
  	$(mkinstalldirs) $(DESTDIR)$(plugin_includedir)
diff --git a/meta/recipes-devtools/gcc/gcc/0013-Disable-sdt.patch b/meta/recipes-devtools/gcc/gcc/0013-Disable-sdt.patch
index b93ae837ac..1e657666df 100644
--- a/meta/recipes-devtools/gcc/gcc/0013-Disable-sdt.patch
+++ b/meta/recipes-devtools/gcc/gcc/0013-Disable-sdt.patch
@@ -1,4 +1,4 @@
-From d87eef0037d15f363b2614bac531626b87189d4f Mon Sep 17 00:00:00 2001
+From 7928a4eddc4a6d821a6aa6eaaea1fd60d54e3da9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:28:10 +0400
 Subject: [PATCH] Disable sdt.
@@ -25,10 +25,10 @@ Upstream-Status: Inappropriate [hack]
  4 files changed, 19 insertions(+), 19 deletions(-)
 
 diff --git a/gcc/configure b/gcc/configure
-index 4d903cf40e8..156090550c2 100755
+index c5d3bc4ee2d..5160917d73e 100755
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -29830,12 +29830,12 @@ fi
+@@ -30812,12 +30812,12 @@ fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking sys/sdt.h in the target C library" >&5
  $as_echo_n "checking sys/sdt.h in the target C library... " >&6; }
  have_sys_sdt_h=no
@@ -48,10 +48,10 @@ index 4d903cf40e8..156090550c2 100755
  $as_echo "$have_sys_sdt_h" >&6; }
  
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 07aacfee055..f31a43e7dd3 100644
+index f83420326d6..50f78308e8a 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -6203,15 +6203,15 @@ fi
+@@ -6653,15 +6653,15 @@ fi
  AC_SUBST([enable_default_ssp])
  
  # Test for <sys/sdt.h> on the target.
@@ -77,10 +77,10 @@ index 07aacfee055..f31a43e7dd3 100644
  # Check if TFmode long double should be used by default or not.
  # Some glibc targets used DFmode long double, but with glibc 2.4
 diff --git a/libstdc++-v3/configure b/libstdc++-v3/configure
-index 766a0a8d504..ba59088a722 100755
+index a310e9feb6c..c879445b8a6 100755
 --- a/libstdc++-v3/configure
 +++ b/libstdc++-v3/configure
-@@ -21986,11 +21986,11 @@ ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
+@@ -22014,11 +22014,11 @@ ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
  ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
  ac_compiler_gnu=$ac_cv_c_compiler_gnu
  
@@ -96,7 +96,7 @@ index 766a0a8d504..ba59088a722 100755
  $as_echo "$glibcxx_cv_sys_sdt_h" >&6; }
  
 diff --git a/libstdc++-v3/configure.ac b/libstdc++-v3/configure.ac
-index 07cf05b6856..dd5f26957d5 100644
+index 3c799be82b1..3f63a8ec9ce 100644
 --- a/libstdc++-v3/configure.ac
 +++ b/libstdc++-v3/configure.ac
 @@ -240,7 +240,7 @@ GLIBCXX_CHECK_SC_NPROCESSORS_ONLN
diff --git a/meta/recipes-devtools/gcc/gcc/0014-libtool.patch b/meta/recipes-devtools/gcc/gcc/0014-libtool.patch
index 3da3261bfe..f2b8924ebf 100644
--- a/meta/recipes-devtools/gcc/gcc/0014-libtool.patch
+++ b/meta/recipes-devtools/gcc/gcc/0014-libtool.patch
@@ -1,4 +1,4 @@
-From d1584292b3a199dc6318f7508fd0c74ec4169a21 Mon Sep 17 00:00:00 2001
+From a5b984db9669cf38a7bd76c3fcdb41c086f740db Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:29:11 +0400
 Subject: [PATCH] libtool
diff --git a/meta/recipes-devtools/gcc/gcc/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch b/meta/recipes-devtools/gcc/gcc/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
index e08e44cc04..1ccf39ceba 100644
--- a/meta/recipes-devtools/gcc/gcc/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
+++ b/meta/recipes-devtools/gcc/gcc/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
@@ -1,4 +1,4 @@
-From b7a96ff62cc0daa3a789c720d30e2edaabbafe5d Mon Sep 17 00:00:00 2001
+From 0ae7090dec149cb2ff0c87eef87c043d4000ece1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:30:32 +0400
 Subject: [PATCH] gcc: armv4: pass fix-v4bx to linker to support EABI.
@@ -19,7 +19,7 @@ Upstream-Status: Pending
  1 file changed, 5 insertions(+), 1 deletion(-)
 
 diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-eabi.h
-index 0c0332f317f..7b3769e8459 100644
+index 6bd95855827..77befab5da8 100644
 --- a/gcc/config/arm/linux-eabi.h
 +++ b/gcc/config/arm/linux-eabi.h
 @@ -91,10 +91,14 @@
diff --git a/meta/recipes-devtools/gcc/gcc/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch b/meta/recipes-devtools/gcc/gcc/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch
index d86da6517f..bde7ec6609 100644
--- a/meta/recipes-devtools/gcc/gcc/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch
+++ b/meta/recipes-devtools/gcc/gcc/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch
@@ -1,4 +1,4 @@
-From 187e962aed3b3f39a96eb4419a7fa23e88634efb Mon Sep 17 00:00:00 2001
+From 5ce8aa4615a3816d12c43752323154744517ae9f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:33:04 +0400
 Subject: [PATCH] Use the multilib config files from ${B} instead of using the
@@ -18,10 +18,10 @@ Upstream-Status: Inappropriate [configuration]
  2 files changed, 36 insertions(+), 8 deletions(-)
 
 diff --git a/gcc/configure b/gcc/configure
-index 156090550c2..fde89ad8e89 100755
+index 5160917d73e..e663052cad2 100755
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -12690,10 +12690,20 @@ done
+@@ -13070,10 +13070,20 @@ done
  tmake_file_=
  for f in ${tmake_file}
  do
@@ -46,7 +46,7 @@ index 156090550c2..fde89ad8e89 100755
  done
  tmake_file="${tmake_file_}${omp_device_property_tmake_file}"
  
-@@ -12704,6 +12714,10 @@ tm_file_list="options.h"
+@@ -13084,6 +13094,10 @@ tm_file_list="options.h"
  tm_include_list="options.h insn-constants.h"
  for f in $tm_file; do
    case $f in
@@ -58,10 +58,10 @@ index 156090550c2..fde89ad8e89 100755
         f=`echo $f | sed 's/^..//'`
         tm_file_list="${tm_file_list} $f"
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index f31a43e7dd3..cad69549a01 100644
+index 50f78308e8a..2b84875b028 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -2123,10 +2123,20 @@ done
+@@ -2243,10 +2243,20 @@ done
  tmake_file_=
  for f in ${tmake_file}
  do
@@ -86,7 +86,7 @@ index f31a43e7dd3..cad69549a01 100644
  done
  tmake_file="${tmake_file_}${omp_device_property_tmake_file}"
  
-@@ -2137,6 +2147,10 @@ tm_file_list="options.h"
+@@ -2257,6 +2267,10 @@ tm_file_list="options.h"
  tm_include_list="options.h insn-constants.h"
  for f in $tm_file; do
    case $f in
diff --git a/meta/recipes-devtools/gcc/gcc/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch b/meta/recipes-devtools/gcc/gcc/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
index 55eb44e326..3e0a1b4136 100644
--- a/meta/recipes-devtools/gcc/gcc/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
+++ b/meta/recipes-devtools/gcc/gcc/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
@@ -1,4 +1,4 @@
-From 6211545ca5aa4a5bfb7c4dfcfdb9db7e5511b40e Mon Sep 17 00:00:00 2001
+From 75a1ce0265ca123f74f17a40ad8bd8f26d9c2ab3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 09:39:38 +0000
 Subject: [PATCH] Avoid using libdir from .la which usually points to a host
diff --git a/meta/recipes-devtools/gcc/gcc/0018-export-CPP.patch b/meta/recipes-devtools/gcc/gcc/0018-export-CPP.patch
index 5f28e868e2..e6596da5c7 100644
--- a/meta/recipes-devtools/gcc/gcc/0018-export-CPP.patch
+++ b/meta/recipes-devtools/gcc/gcc/0018-export-CPP.patch
@@ -1,4 +1,4 @@
-From 9d8512e3efa0d125714bafb907734a0c095b84ce Mon Sep 17 00:00:00 2001
+From b6e229a13aebfbb3fe38c216fd51b68bf71cfa9c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 09:40:59 +0000
 Subject: [PATCH] export CPP
@@ -37,7 +37,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/Makefile.in b/Makefile.in
-index 36e369df6e7..c717903bb13 100644
+index 047be0255e2..af19589fa95 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -149,6 +149,7 @@ BUILD_EXPORTS = \
diff --git a/meta/recipes-devtools/gcc/gcc/0019-Ensure-target-gcc-headers-can-be-included.patch b/meta/recipes-devtools/gcc/gcc/0019-Ensure-target-gcc-headers-can-be-included.patch
index 9e9f2874db..98472dd2b5 100644
--- a/meta/recipes-devtools/gcc/gcc/0019-Ensure-target-gcc-headers-can-be-included.patch
+++ b/meta/recipes-devtools/gcc/gcc/0019-Ensure-target-gcc-headers-can-be-included.patch
@@ -1,4 +1,4 @@
-From 468604663f799d3d80d0db760f03ba32678801aa Mon Sep 17 00:00:00 2001
+From 9b4eb0e18a953d79d20c78d3ba741af6d71ab9ca Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 10:25:11 +0000
 Subject: [PATCH] Ensure target gcc headers can be included
@@ -21,10 +21,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 6 insertions(+)
 
 diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index 674f1057aaf..087bf3f1137 100644
+index 59c45c81393..9b17d120aa1 100644
 --- a/gcc/Makefile.in
 +++ b/gcc/Makefile.in
-@@ -618,6 +618,7 @@ libexecdir = @libexecdir@
+@@ -630,6 +630,7 @@ libexecdir = @libexecdir@
  
  # Directory in which the compiler finds libraries etc.
  libsubdir = $(libdir)/gcc/$(real_target_noncanonical)/$(version)$(accel_dir_suffix)
@@ -32,7 +32,7 @@ index 674f1057aaf..087bf3f1137 100644
  # Directory in which the compiler finds executables
  libexecsubdir = $(libexecdir)/gcc/$(real_target_noncanonical)/$(version)$(accel_dir_suffix)
  # Directory in which all plugin resources are installed
-@@ -2948,6 +2949,7 @@ CFLAGS-intl.o += -DLOCALEDIR=\"$(localedir)\"
+@@ -3016,6 +3017,7 @@ CFLAGS-intl.o += -DLOCALEDIR=\"$(localedir)\"
  
  PREPROCESSOR_DEFINES = \
    -DGCC_INCLUDE_DIR=\"$(libsubdir)/include\" \
@@ -41,10 +41,10 @@ index 674f1057aaf..087bf3f1137 100644
    -DGPLUSPLUS_INCLUDE_DIR=\"$(gcc_gxx_include_dir)\" \
    -DGPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT=$(gcc_gxx_include_dir_add_sysroot) \
 diff --git a/gcc/cppdefault.c b/gcc/cppdefault.c
-index af38cc494ea..2f43b88a0c3 100644
+index c503d14fc3f..d54d6ce0076 100644
 --- a/gcc/cppdefault.c
 +++ b/gcc/cppdefault.c
-@@ -59,6 +59,10 @@ const struct default_include cpp_include_defaults[]
+@@ -64,6 +64,10 @@ const struct default_include cpp_include_defaults[]
      /* This is the dir for gcc's private headers.  */
      { GCC_INCLUDE_DIR, "GCC", 0, 0, 0, 0 },
  #endif
diff --git a/meta/recipes-devtools/gcc/gcc/0020-Don-t-search-host-directory-during-relink-if-inst_pr.patch b/meta/recipes-devtools/gcc/gcc/0020-Don-t-search-host-directory-during-relink-if-inst_pr.patch
index ce838ebcdb..bb2a3671f0 100644
--- a/meta/recipes-devtools/gcc/gcc/0020-Don-t-search-host-directory-during-relink-if-inst_pr.patch
+++ b/meta/recipes-devtools/gcc/gcc/0020-Don-t-search-host-directory-during-relink-if-inst_pr.patch
@@ -1,4 +1,4 @@
-From dbdf19800e24571603b0baee1734a58ff2cf2974 Mon Sep 17 00:00:00 2001
+From cd09adb1e7f2a7e81a9f595a17c36f24911b90ac Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 3 Mar 2015 08:21:19 +0000
 Subject: [PATCH] Don't search host directory during "relink" if $inst_prefix
diff --git a/meta/recipes-devtools/gcc/gcc/0021-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch b/meta/recipes-devtools/gcc/gcc/0021-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
index 58327209d4..0f3b3869b0 100644
--- a/meta/recipes-devtools/gcc/gcc/0021-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
+++ b/meta/recipes-devtools/gcc/gcc/0021-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
@@ -1,4 +1,4 @@
-From 7c019b932f06bdce624b4739fba75dacff794076 Mon Sep 17 00:00:00 2001
+From 7faad21154a76b200efcced9e12945057c94dff3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 28 Apr 2015 23:15:27 -0700
 Subject: [PATCH] Use SYSTEMLIBS_DIR replacement instead of hardcoding
@@ -12,7 +12,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64/aarch64-linux.h
-index e587e2e9ad6..ddc62895693 100644
+index 7f2529a2a1d..5303b39186f 100644
 --- a/gcc/config/aarch64/aarch64-linux.h
 +++ b/gcc/config/aarch64/aarch64-linux.h
 @@ -21,7 +21,7 @@
diff --git a/meta/recipes-devtools/gcc/gcc/0022-aarch64-Add-support-for-musl-ldso.patch b/meta/recipes-devtools/gcc/gcc/0022-aarch64-Add-support-for-musl-ldso.patch
index 851f8ed063..41536a8a3b 100644
--- a/meta/recipes-devtools/gcc/gcc/0022-aarch64-Add-support-for-musl-ldso.patch
+++ b/meta/recipes-devtools/gcc/gcc/0022-aarch64-Add-support-for-musl-ldso.patch
@@ -1,4 +1,4 @@
-From ce93292090b1a8cb0b0b0061ec09243936bf9bcf Mon Sep 17 00:00:00 2001
+From 96aa24a874331a318693e4fccc4bc4e7d3fbad2b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 28 Apr 2015 23:18:39 -0700
 Subject: [PATCH] aarch64: Add support for musl ldso
@@ -11,7 +11,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64/aarch64-linux.h
-index ddc62895693..b301825313a 100644
+index 5303b39186f..4bcae7f3110 100644
 --- a/gcc/config/aarch64/aarch64-linux.h
 +++ b/gcc/config/aarch64/aarch64-linux.h
 @@ -24,7 +24,7 @@
diff --git a/meta/recipes-devtools/gcc/gcc/0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch b/meta/recipes-devtools/gcc/gcc/0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch
index d981b37658..fb4511cc1a 100644
--- a/meta/recipes-devtools/gcc/gcc/0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch
+++ b/meta/recipes-devtools/gcc/gcc/0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch
@@ -1,4 +1,4 @@
-From cc298bd514d32cea58bfbdbda503d710355e97b4 Mon Sep 17 00:00:00 2001
+From 2cfc5ee38b3f5ec1d7965aae0991bcd48b5dc2e6 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Sun, 5 Jul 2015 20:25:18 -0700
 Subject: [PATCH] libcc1: fix libcc1's install path and rpath
@@ -20,7 +20,7 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  2 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/libcc1/Makefile.am b/libcc1/Makefile.am
-index fe7b64cbc6f..bdd0617049b 100644
+index f148fdd7aa2..0b6eb8f2855 100644
 --- a/libcc1/Makefile.am
 +++ b/libcc1/Makefile.am
 @@ -40,8 +40,8 @@ libiberty = $(if $(wildcard $(libiberty_noasan)),$(Wc)$(libiberty_noasan), \
@@ -35,10 +35,10 @@ index fe7b64cbc6f..bdd0617049b 100644
  if ENABLE_PLUGIN
  plugin_LTLIBRARIES = libcc1plugin.la libcp1plugin.la
 diff --git a/libcc1/Makefile.in b/libcc1/Makefile.in
-index 2def836cb06..98e12a9d369 100644
+index 753d435c9cb..455627b0a3b 100644
 --- a/libcc1/Makefile.in
 +++ b/libcc1/Makefile.in
-@@ -394,8 +394,8 @@ libiberty = $(if $(wildcard $(libiberty_noasan)),$(Wc)$(libiberty_noasan), \
+@@ -398,8 +398,8 @@ libiberty = $(if $(wildcard $(libiberty_noasan)),$(Wc)$(libiberty_noasan), \
  	    $(Wc)$(libiberty_normal)))
  
  libiberty_dep = $(patsubst $(Wc)%,%,$(libiberty))
diff --git a/meta/recipes-devtools/gcc/gcc/0024-handle-sysroot-support-for-nativesdk-gcc.patch b/meta/recipes-devtools/gcc/gcc/0024-handle-sysroot-support-for-nativesdk-gcc.patch
index 6c75c0f2bf..3958e9c212 100644
--- a/meta/recipes-devtools/gcc/gcc/0024-handle-sysroot-support-for-nativesdk-gcc.patch
+++ b/meta/recipes-devtools/gcc/gcc/0024-handle-sysroot-support-for-nativesdk-gcc.patch
@@ -1,4 +1,4 @@
-From 2966f3c43382fa4f79cbac761232dae2e92e7012 Mon Sep 17 00:00:00 2001
+From 35c084a051bcd6587ebc73e4acb045cb2bdf7e99 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 7 Dec 2015 23:39:54 +0000
 Subject: [PATCH] handle sysroot support for nativesdk-gcc
@@ -41,10 +41,10 @@ Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
  6 files changed, 70 insertions(+), 48 deletions(-)
 
 diff --git a/gcc/c-family/c-opts.c b/gcc/c-family/c-opts.c
-index c51d6d34726..aa7507df2cf 100644
+index bd15b9cd902..2bd667e3f58 100644
 --- a/gcc/c-family/c-opts.c
 +++ b/gcc/c-family/c-opts.c
-@@ -1409,8 +1409,8 @@ add_prefixed_path (const char *suffix, incpath_kind chain)
+@@ -1436,8 +1436,8 @@ add_prefixed_path (const char *suffix, incpath_kind chain)
    size_t prefix_len, suffix_len;
  
    suffix_len = strlen (suffix);
@@ -56,7 +56,7 @@ index c51d6d34726..aa7507df2cf 100644
    path = (char *) xmalloc (prefix_len + suffix_len + 1);
    memcpy (path, prefix, prefix_len);
 diff --git a/gcc/cppdefault.c b/gcc/cppdefault.c
-index 2f43b88a0c3..6b6be04686c 100644
+index d54d6ce0076..784a92a0c24 100644
 --- a/gcc/cppdefault.c
 +++ b/gcc/cppdefault.c
 @@ -35,6 +35,30 @@
@@ -90,7 +90,7 @@ index 2f43b88a0c3..6b6be04686c 100644
  const struct default_include cpp_include_defaults[]
  #ifdef INCLUDE_DEFAULTS
  = INCLUDE_DEFAULTS;
-@@ -42,38 +66,38 @@ const struct default_include cpp_include_defaults[]
+@@ -42,17 +66,17 @@ const struct default_include cpp_include_defaults[]
  = {
  #ifdef GPLUSPLUS_INCLUDE_DIR
      /* Pick up GNU C++ generic include files.  */
@@ -110,6 +110,9 @@ index 2f43b88a0c3..6b6be04686c 100644
 +    { GPLUSPLUS_BACKWARD_INCLUDE_DIRVAR, "G++", 1, 1,
        GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },
  #endif
+ #ifdef GPLUSPLUS_LIBCXX_INCLUDE_DIR
+@@ -62,23 +86,23 @@ const struct default_include cpp_include_defaults[]
+ #endif
  #ifdef GCC_INCLUDE_DIR
      /* This is the dir for gcc's private headers.  */
 -    { GCC_INCLUDE_DIR, "GCC", 0, 0, 0, 0 },
@@ -138,7 +141,7 @@ index 2f43b88a0c3..6b6be04686c 100644
        /* A multilib suffix needs adding if different multilibs use
  	 different headers.  */
  #ifdef SYSROOT_HEADERS_SUFFIX_SPEC
-@@ -85,33 +109,24 @@ const struct default_include cpp_include_defaults[]
+@@ -90,33 +114,24 @@ const struct default_include cpp_include_defaults[]
  #endif
  #ifdef CROSS_INCLUDE_DIR
      /* One place the target system's headers might be.  */
@@ -179,7 +182,7 @@ index 2f43b88a0c3..6b6be04686c 100644
  /* This value is set by cpp_relocated at runtime */
  const char *gcc_exec_prefix;
 diff --git a/gcc/cppdefault.h b/gcc/cppdefault.h
-index a681264f75e..5e10a2fa140 100644
+index fd3c655db1c..20669ac427d 100644
 --- a/gcc/cppdefault.h
 +++ b/gcc/cppdefault.h
 @@ -33,7 +33,8 @@
@@ -191,8 +194,8 @@ index a681264f75e..5e10a2fa140 100644
 +
    const char *const component;	/* The component containing the directory
  				   (see update_path in prefix.c) */
-   const char cplusplus;		/* Only look here if we're compiling C++.  */
-@@ -50,17 +51,13 @@ struct default_include
+   const char cplusplus;		/* When this is non-zero, we should only
+@@ -55,17 +56,13 @@ struct default_include
  };
  
  extern const struct default_include cpp_include_defaults[];
@@ -214,7 +217,7 @@ index a681264f75e..5e10a2fa140 100644
     subdirectory of the actual installation.  */
  extern const char *gcc_exec_prefix;
 diff --git a/gcc/gcc.c b/gcc/gcc.c
-index e2e0bcee9b2..912c2febf94 100644
+index 8737bae5353..aa6fbe43965 100644
 --- a/gcc/gcc.c
 +++ b/gcc/gcc.c
 @@ -252,6 +252,8 @@ FILE *report_times_to_file = NULL;
@@ -226,7 +229,7 @@ index e2e0bcee9b2..912c2febf94 100644
  /* Nonzero means pass the updated target_system_root to the compiler.  */
  
  static int target_system_root_changed;
-@@ -526,6 +528,7 @@ or with constant text in a single argument.
+@@ -568,6 +570,7 @@ or with constant text in a single argument.
   %G     process LIBGCC_SPEC as a spec.
   %R     Output the concatenation of target_system_root and
          target_sysroot_suffix.
@@ -234,7 +237,7 @@ index e2e0bcee9b2..912c2febf94 100644
   %S     process STARTFILE_SPEC as a spec.  A capital S is actually used here.
   %E     process ENDFILE_SPEC as a spec.  A capital E is actually used here.
   %C     process CPP_SPEC as a spec.
-@@ -1502,10 +1505,10 @@ static const char *gcc_libexec_prefix;
+@@ -1621,10 +1624,10 @@ static const char *gcc_libexec_prefix;
     gcc_exec_prefix is set because, in that case, we know where the
     compiler has been installed, and use paths relative to that
     location instead.  */
@@ -249,7 +252,7 @@ index e2e0bcee9b2..912c2febf94 100644
  
  /* For native compilers, these are well-known paths containing
     components that may be provided by the system.  For cross
-@@ -1513,9 +1516,9 @@ static const char *const standard_startfile_prefix = STANDARD_STARTFILE_PREFIX;
+@@ -1632,9 +1635,9 @@ static const char *const standard_startfile_prefix = STANDARD_STARTFILE_PREFIX;
  static const char *md_exec_prefix = MD_EXEC_PREFIX;
  static const char *md_startfile_prefix = MD_STARTFILE_PREFIX;
  static const char *md_startfile_prefix_1 = MD_STARTFILE_PREFIX_1;
@@ -261,7 +264,7 @@ index e2e0bcee9b2..912c2febf94 100644
    = STANDARD_STARTFILE_PREFIX_2;
  
  /* A relative path to be used in finding the location of tools
-@@ -5955,6 +5958,11 @@ do_spec_1 (const char *spec, int inswitch, const char *soft_matched_part)
+@@ -6564,6 +6567,11 @@ do_spec_1 (const char *spec, int inswitch, const char *soft_matched_part)
  	      }
  	    break;
  
@@ -274,7 +277,7 @@ index e2e0bcee9b2..912c2febf94 100644
  	    value = do_spec_1 (startfile_spec, 0, NULL);
  	    if (value != 0)
 diff --git a/gcc/incpath.c b/gcc/incpath.c
-index 9098ab044ab..bfad4ebe382 100644
+index fbfc0ce03b8..a82e543428b 100644
 --- a/gcc/incpath.c
 +++ b/gcc/incpath.c
 @@ -131,7 +131,7 @@ add_standard_paths (const char *sysroot, const char *iprefix,
@@ -286,7 +289,7 @@ index 9098ab044ab..bfad4ebe382 100644
      {
        /* Look for directories that start with the standard prefix.
  	 "Translate" them, i.e. replace /usr/local/lib/gcc... with
-@@ -145,7 +145,7 @@ add_standard_paths (const char *sysroot, const char *iprefix,
+@@ -146,7 +146,7 @@ add_standard_paths (const char *sysroot, const char *iprefix,
  		 now.  */
  	      if (sysroot && p->add_sysroot)
  		continue;
@@ -295,7 +298,7 @@ index 9098ab044ab..bfad4ebe382 100644
  		{
  		  char *str = concat (iprefix, p->fname + len, NULL);
  		  if (p->multilib == 1 && imultilib)
-@@ -185,7 +185,7 @@ add_standard_paths (const char *sysroot, const char *iprefix,
+@@ -187,7 +187,7 @@ add_standard_paths (const char *sysroot, const char *iprefix,
  	      free (sysroot_no_trailing_dir_separator);
  	    }
  	  else if (!p->add_sysroot && relocated
@@ -304,7 +307,7 @@ index 9098ab044ab..bfad4ebe382 100644
  	    {
   	      static const char *relocated_prefix;
  	      char *ostr;
-@@ -202,12 +202,12 @@ add_standard_paths (const char *sysroot, const char *iprefix,
+@@ -204,12 +204,12 @@ add_standard_paths (const char *sysroot, const char *iprefix,
  		  dummy = concat (gcc_exec_prefix, "dummy", NULL);
  		  relocated_prefix
  		    = make_relative_prefix (dummy,
@@ -321,7 +324,7 @@ index 9098ab044ab..bfad4ebe382 100644
  	      str = update_path (ostr, p->component);
  	      free (ostr);
 diff --git a/gcc/prefix.c b/gcc/prefix.c
-index 1a403e535bd..c26d07bde12 100644
+index 747c09de638..f728638dc65 100644
 --- a/gcc/prefix.c
 +++ b/gcc/prefix.c
 @@ -72,7 +72,9 @@ License along with GCC; see the file COPYING3.  If not see
diff --git a/meta/recipes-devtools/gcc/gcc/0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch b/meta/recipes-devtools/gcc/gcc/0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch
index e8b52daf25..ff622b1056 100644
--- a/meta/recipes-devtools/gcc/gcc/0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch
+++ b/meta/recipes-devtools/gcc/gcc/0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch
@@ -1,4 +1,4 @@
-From 5fdf6a0e959c26512c795bf904b35348f749406c Mon Sep 17 00:00:00 2001
+From c55e24459370ad96577496ecd87475e3a9de7dad Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 7 Dec 2015 23:41:45 +0000
 Subject: [PATCH] Search target sysroot gcc version specific dirs with
@@ -51,10 +51,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 28 insertions(+), 1 deletion(-)
 
 diff --git a/gcc/gcc.c b/gcc/gcc.c
-index 912c2febf94..24a92bf27f9 100644
+index aa6fbe43965..f8a71a13826 100644
 --- a/gcc/gcc.c
 +++ b/gcc/gcc.c
-@@ -2619,7 +2619,7 @@ for_each_path (const struct path_prefix *paths,
+@@ -2811,7 +2811,7 @@ for_each_path (const struct path_prefix *paths,
        if (path == NULL)
  	{
  	  len = paths->max_len + extra_space + 1;
@@ -63,7 +63,7 @@ index 912c2febf94..24a92bf27f9 100644
  	  path = XNEWVEC (char, len);
  	}
  
-@@ -2631,6 +2631,33 @@ for_each_path (const struct path_prefix *paths,
+@@ -2823,6 +2823,33 @@ for_each_path (const struct path_prefix *paths,
  	  /* Look first in MACHINE/VERSION subdirectory.  */
  	  if (!skip_multi_dir)
  	    {
diff --git a/meta/recipes-devtools/gcc/gcc/0026-Fix-various-_FOR_BUILD-and-related-variables.patch b/meta/recipes-devtools/gcc/gcc/0026-Fix-various-_FOR_BUILD-and-related-variables.patch
index 0356baac5c..c2698f9eeb 100644
--- a/meta/recipes-devtools/gcc/gcc/0026-Fix-various-_FOR_BUILD-and-related-variables.patch
+++ b/meta/recipes-devtools/gcc/gcc/0026-Fix-various-_FOR_BUILD-and-related-variables.patch
@@ -1,4 +1,4 @@
-From b647a62ddbbb7fbc58aa865cd2d34539677eb107 Mon Sep 17 00:00:00 2001
+From cd5db101e3c4e72248f988a67ce28be8e24f66d4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 7 Dec 2015 23:42:45 +0000
 Subject: [PATCH] Fix various _FOR_BUILD and related variables
@@ -26,7 +26,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  5 files changed, 14 insertions(+), 3 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index c717903bb13..5abc649868d 100644
+index af19589fa95..d0116a23e1a 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -152,6 +152,7 @@ BUILD_EXPORTS = \
@@ -64,7 +64,7 @@ index c717903bb13..5abc649868d 100644
  	"FLEX=$(FLEX)" \
  	"INSTALL=$(INSTALL)" \
 diff --git a/Makefile.tpl b/Makefile.tpl
-index efed1511750..778beb705b4 100644
+index 6e0337fb48f..4fcac93d3d8 100644
 --- a/Makefile.tpl
 +++ b/Makefile.tpl
 @@ -154,6 +154,7 @@ BUILD_EXPORTS = \
@@ -94,10 +94,10 @@ index efed1511750..778beb705b4 100644
  	CFLAGS="$(CFLAGS)"; export CFLAGS; \
  	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
 diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index 087bf3f1137..272d521a276 100644
+index 9b17d120aa1..3053d05903c 100644
 --- a/gcc/Makefile.in
 +++ b/gcc/Makefile.in
-@@ -805,7 +805,7 @@ BUILD_LDFLAGS=@BUILD_LDFLAGS@
+@@ -820,7 +820,7 @@ BUILD_LDFLAGS=@BUILD_LDFLAGS@
  BUILD_NO_PIE_FLAG = @BUILD_NO_PIE_FLAG@
  BUILD_LDFLAGS += $(BUILD_NO_PIE_FLAG)
  BUILD_CPPFLAGS= -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
@@ -107,10 +107,10 @@ index 087bf3f1137..272d521a276 100644
  # Actual name to use when installing a native compiler.
  GCC_INSTALL_NAME := $(shell echo gcc|sed '$(program_transform_name)')
 diff --git a/gcc/configure b/gcc/configure
-index fde89ad8e89..e042e992419 100755
+index e663052cad2..b0906aa3e96 100755
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -12319,7 +12319,7 @@ else
+@@ -12699,7 +12699,7 @@ else
  	CC="${CC_FOR_BUILD}" CFLAGS="${CFLAGS_FOR_BUILD}" \
  	CXX="${CXX_FOR_BUILD}" CXXFLAGS="${CXXFLAGS_FOR_BUILD}" \
  	LD="${LD_FOR_BUILD}" LDFLAGS="${LDFLAGS_FOR_BUILD}" \
@@ -120,10 +120,10 @@ index fde89ad8e89..e042e992419 100755
  		--enable-languages=${enable_languages-all} \
  		${enable_obsolete+--enable-obsolete="$enable_obsolete"} \
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index cad69549a01..8e35c9be7f9 100644
+index 2b84875b028..bfbd8946e8a 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -1903,7 +1903,7 @@ else
+@@ -2023,7 +2023,7 @@ else
  	CC="${CC_FOR_BUILD}" CFLAGS="${CFLAGS_FOR_BUILD}" \
  	CXX="${CXX_FOR_BUILD}" CXXFLAGS="${CXXFLAGS_FOR_BUILD}" \
  	LD="${LD_FOR_BUILD}" LDFLAGS="${LDFLAGS_FOR_BUILD}" \
diff --git a/meta/recipes-devtools/gcc/gcc/0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch b/meta/recipes-devtools/gcc/gcc/0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch
index 47de3c354c..2e65740ec0 100644
--- a/meta/recipes-devtools/gcc/gcc/0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch
+++ b/meta/recipes-devtools/gcc/gcc/0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch
@@ -1,4 +1,4 @@
-From f7a6ddd3fb612393595f6e959e99d48c26f4d14f Mon Sep 17 00:00:00 2001
+From 9bbce1b5a10caf636eee137e5a229e5434a6c8f5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 2 Feb 2016 10:26:10 -0800
 Subject: [PATCH] nios2: Define MUSL_DYNAMIC_LINKER
@@ -12,7 +12,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/gcc/config/nios2/linux.h b/gcc/config/nios2/linux.h
-index 4bdcdcca1f0..e7943a9d640 100644
+index 08edf1521f6..15696d86241 100644
 --- a/gcc/config/nios2/linux.h
 +++ b/gcc/config/nios2/linux.h
 @@ -30,6 +30,7 @@
diff --git a/meta/recipes-devtools/gcc/gcc/0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch b/meta/recipes-devtools/gcc/gcc/0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
index cd409a894c..edca9e3ca4 100644
--- a/meta/recipes-devtools/gcc/gcc/0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
+++ b/meta/recipes-devtools/gcc/gcc/0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
@@ -1,4 +1,4 @@
-From 0bb86e4d2ab0bb44bab37a005f971cf94046ff0d Mon Sep 17 00:00:00 2001
+From 745a2ac7825c73102b888226c54397d21512f86b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 27 Jun 2017 18:10:54 -0700
 Subject: [PATCH] Add ssp_nonshared to link commandline for musl targets
@@ -23,7 +23,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  3 files changed, 27 insertions(+)
 
 diff --git a/gcc/config/linux.h b/gcc/config/linux.h
-index 0c1a8118a26..bdc2a2d0659 100644
+index 87efc5f69fe..3c7b7c538b9 100644
 --- a/gcc/config/linux.h
 +++ b/gcc/config/linux.h
 @@ -195,6 +195,13 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
@@ -41,7 +41,7 @@ index 0c1a8118a26..bdc2a2d0659 100644
  
  #if (DEFAULT_LIBC == LIBC_UCLIBC) && defined (SINGLE_LIBC) /* uClinux */
 diff --git a/gcc/config/rs6000/linux.h b/gcc/config/rs6000/linux.h
-index b7026fcbee7..dd54d6c393e 100644
+index 47c9d9ac0b6..d065f88b377 100644
 --- a/gcc/config/rs6000/linux.h
 +++ b/gcc/config/rs6000/linux.h
 @@ -94,6 +94,16 @@
@@ -62,10 +62,10 @@ index b7026fcbee7..dd54d6c393e 100644
  #define LINK_OS_LINUX_SPEC LINK_OS_LINUX_EMUL " %{!shared: %{!static: \
    %{!static-pie: \
 diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
-index 80969a8fd89..97a78ae945c 100644
+index a11e01faa3d..ce464f3626b 100644
 --- a/gcc/config/rs6000/linux64.h
 +++ b/gcc/config/rs6000/linux64.h
-@@ -452,6 +452,16 @@ extern int dot_symbols;
+@@ -369,6 +369,16 @@ extern int dot_symbols;
  					   " -m elf64ppc")
  #endif
  
diff --git a/meta/recipes-devtools/gcc/gcc/0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch b/meta/recipes-devtools/gcc/gcc/0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
index 9342329ecf..b74aeb8bb6 100644
--- a/meta/recipes-devtools/gcc/gcc/0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
+++ b/meta/recipes-devtools/gcc/gcc/0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
@@ -1,4 +1,4 @@
-From 61b000792f32d4ca9b4b4498ebb7fd5d1deed710 Mon Sep 17 00:00:00 2001
+From 695adb4dffb23c6f5cbc757e05cf4187a2bd6528 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 4 May 2016 21:11:34 -0700
 Subject: [PATCH] Link libgcc using LDFLAGS, not just SHLIB_LDFLAGS
@@ -12,7 +12,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/libgcc/config/t-slibgcc b/libgcc/config/t-slibgcc
-index c997553447c..330352c2c81 100644
+index c59b43b7b69..ca4c141f526 100644
 --- a/libgcc/config/t-slibgcc
 +++ b/libgcc/config/t-slibgcc
 @@ -32,7 +32,7 @@ SHLIB_INSTALL_SOLINK = $(LN_S) $(SHLIB_SONAME) \
diff --git a/meta/recipes-devtools/gcc/gcc/0030-sync-gcc-stddef.h-with-musl.patch b/meta/recipes-devtools/gcc/gcc/0030-sync-gcc-stddef.h-with-musl.patch
index ffbf6b97ab..86f75d0d51 100644
--- a/meta/recipes-devtools/gcc/gcc/0030-sync-gcc-stddef.h-with-musl.patch
+++ b/meta/recipes-devtools/gcc/gcc/0030-sync-gcc-stddef.h-with-musl.patch
@@ -1,4 +1,4 @@
-From 92f588c68008176e7f6f1b3d534670bddedae783 Mon Sep 17 00:00:00 2001
+From a9173429ae256c4b4a3ab4d758a6adf42f8c4239 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 3 Feb 2017 12:56:00 -0800
 Subject: [PATCH] sync gcc stddef.h with musl
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 9 insertions(+)
 
 diff --git a/gcc/ginclude/stddef.h b/gcc/ginclude/stddef.h
-index 9d67eac4947..6cb5edbedb4 100644
+index 66619fe43b1..3f843d6f365 100644
 --- a/gcc/ginclude/stddef.h
 +++ b/gcc/ginclude/stddef.h
 @@ -128,6 +128,7 @@ _TYPE_wchar_t;
diff --git a/meta/recipes-devtools/gcc/gcc/0031-fix-segmentation-fault-in-precompiled-header-generat.patch b/meta/recipes-devtools/gcc/gcc/0031-fix-segmentation-fault-in-precompiled-header-generat.patch
index 0b93a055c2..70afa4f9e9 100644
--- a/meta/recipes-devtools/gcc/gcc/0031-fix-segmentation-fault-in-precompiled-header-generat.patch
+++ b/meta/recipes-devtools/gcc/gcc/0031-fix-segmentation-fault-in-precompiled-header-generat.patch
@@ -1,4 +1,4 @@
-From d3b25e66c7f9c86b5da0fd3e9e6236e0b59dc934 Mon Sep 17 00:00:00 2001
+From 3d59f763b824ac11f8360931092baf0bc1719562 Mon Sep 17 00:00:00 2001
 From: Juro Bystricky <juro.bystricky@intel.com>
 Date: Mon, 19 Mar 2018 22:31:20 -0700
 Subject: [PATCH] fix segmentation fault in precompiled header generation
@@ -19,10 +19,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 21 insertions(+), 5 deletions(-)
 
 diff --git a/libcpp/lex.c b/libcpp/lex.c
-index 665297af776..0ac5d67ddf0 100644
+index 06bcc31c87e..24bed9a35fa 100644
 --- a/libcpp/lex.c
 +++ b/libcpp/lex.c
-@@ -3311,11 +3311,27 @@ cpp_spell_token (cpp_reader *pfile, const cpp_token *token,
+@@ -3531,11 +3531,27 @@ cpp_spell_token (cpp_reader *pfile, const cpp_token *token,
      spell_ident:
      case SPELL_IDENT:
        if (forstring)
diff --git a/meta/recipes-devtools/gcc/gcc/0032-Fix-for-testsuite-failure.patch b/meta/recipes-devtools/gcc/gcc/0032-Fix-for-testsuite-failure.patch
index 515c1d8186..0be03e652b 100644
--- a/meta/recipes-devtools/gcc/gcc/0032-Fix-for-testsuite-failure.patch
+++ b/meta/recipes-devtools/gcc/gcc/0032-Fix-for-testsuite-failure.patch
@@ -1,4 +1,4 @@
-From a3beed38a5eaa122c375451adafd78289512ac5f Mon Sep 17 00:00:00 2001
+From bb171ef618f8892bd56e57ae41ecb6e02caa8173 Mon Sep 17 00:00:00 2001
 From: RAGHUNATH LOLUR <raghunath.lolur@kpit.com>
 Date: Wed, 6 Dec 2017 22:52:26 -0800
 Subject: [PATCH] Fix for testsuite failure
diff --git a/meta/recipes-devtools/gcc/gcc/0033-Re-introduce-spe-commandline-options.patch b/meta/recipes-devtools/gcc/gcc/0033-Re-introduce-spe-commandline-options.patch
index 8a8eda89b1..129f555a48 100644
--- a/meta/recipes-devtools/gcc/gcc/0033-Re-introduce-spe-commandline-options.patch
+++ b/meta/recipes-devtools/gcc/gcc/0033-Re-introduce-spe-commandline-options.patch
@@ -1,4 +1,4 @@
-From c1675b1dbc8b662eadaaa8ebf5bbfc783b7ecc75 Mon Sep 17 00:00:00 2001
+From 0b900d6410b7c1938e86eceb87b032fd538566a9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 6 Jun 2018 12:10:22 -0700
 Subject: [PATCH] Re-introduce spe commandline options
@@ -10,17 +10,18 @@ Upstream-Status: Inappropriate [SPE port is removed from rs600 port]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- gcc/config/rs6000/rs6000.opt | 12 ++++++++++++
- 1 file changed, 12 insertions(+)
+ gcc/config/rs6000/rs6000.opt | 13 +++++++++++++
+ 1 file changed, 13 insertions(+)
 
 diff --git a/gcc/config/rs6000/rs6000.opt b/gcc/config/rs6000/rs6000.opt
-index 4e3792bcefa..edfa4f7de48 100644
+index 0dbdf753673..b273eb65c35 100644
 --- a/gcc/config/rs6000/rs6000.opt
 +++ b/gcc/config/rs6000/rs6000.opt
-@@ -344,6 +344,18 @@ mdebug=
+@@ -352,6 +352,19 @@ mdebug=
  Target RejectNegative Joined
  -mdebug=	Enable debug output.
  
++; PPC SPE ABI
 +mspe
 +Target Var(rs6000_spe) Save
 +Generate SPE SIMD instructions on E500.
diff --git a/meta/recipes-devtools/gcc/gcc/0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch b/meta/recipes-devtools/gcc/gcc/0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
index 7dd334494d..3f666dc7bd 100644
--- a/meta/recipes-devtools/gcc/gcc/0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
+++ b/meta/recipes-devtools/gcc/gcc/0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
@@ -1,4 +1,4 @@
-From 0c8d6cd3a5de6cdb832fdba4ec39d029432e76e6 Mon Sep 17 00:00:00 2001
+From ea9154338cb3acbd75945fddde4202e73c20dd1a Mon Sep 17 00:00:00 2001
 From: Szabolcs Nagy <nsz@port70.net>
 Date: Sat, 24 Oct 2015 20:09:53 +0000
 Subject: [PATCH] libgcc_s: Use alias for __cpu_indicator_init instead of
@@ -39,10 +39,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  3 files changed, 6 insertions(+), 6 deletions(-)
 
 diff --git a/gcc/config/i386/i386-expand.c b/gcc/config/i386/i386-expand.c
-index 47d52550e5e..9cb8cc7950e 100644
+index ac69eed4d32..ffaa44a16fc 100644
 --- a/gcc/config/i386/i386-expand.c
 +++ b/gcc/config/i386/i386-expand.c
-@@ -10976,10 +10976,10 @@ ix86_expand_builtin (tree exp, rtx target, rtx subtarget,
+@@ -11038,10 +11038,10 @@ ix86_expand_builtin (tree exp, rtx target, rtx subtarget,
      {
      case IX86_BUILTIN_CPU_INIT:
        {
@@ -56,11 +56,11 @@ index 47d52550e5e..9cb8cc7950e 100644
  	return expand_expr (call_expr, target, mode, EXPAND_NORMAL);
        }
 diff --git a/libgcc/config/i386/cpuinfo.c b/libgcc/config/i386/cpuinfo.c
-index 83301a1445f..89fdc7eb587 100644
+index ef463848f9d..1a3de052c80 100644
 --- a/libgcc/config/i386/cpuinfo.c
 +++ b/libgcc/config/i386/cpuinfo.c
-@@ -516,7 +516,7 @@ __cpu_indicator_init (void)
-   return 0;
+@@ -63,7 +63,7 @@ __cpu_indicator_init (void)
+ 			     __cpu_features2);
  }
  
 -#if defined SHARED && defined USE_ELF_SYMVER
diff --git a/meta/recipes-devtools/gcc/gcc/0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch b/meta/recipes-devtools/gcc/gcc/0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
index b746f17e4e..874cd7798d 100644
--- a/meta/recipes-devtools/gcc/gcc/0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
+++ b/meta/recipes-devtools/gcc/gcc/0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
@@ -1,4 +1,4 @@
-From febc910933faf6868805546e0df4a8452a82c225 Mon Sep 17 00:00:00 2001
+From 520411cf364ee4b0b5a8f0857498aaabd790afb3 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 10 Mar 2020 08:26:53 -0700
 Subject: [PATCH] gentypes/genmodes: Do not use __LINE__ for maintaining
@@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 19 insertions(+), 19 deletions(-)
 
 diff --git a/gcc/gengtype.c b/gcc/gengtype.c
-index 981577481af..d5700fff401 100644
+index 5f50242e857..cbaca9b8cd0 100644
 --- a/gcc/gengtype.c
 +++ b/gcc/gengtype.c
 @@ -991,7 +991,7 @@ create_field_at (pair_p next, type_p type, const char *name, options_p opt,
@@ -38,7 +38,7 @@ index 981577481af..d5700fff401 100644
  
  /* Reverse a linked list of 'struct pair's in place.  */
  pair_p
-@@ -5187,7 +5187,7 @@ main (int argc, char **argv)
+@@ -5189,7 +5189,7 @@ main (int argc, char **argv)
        /* These types are set up with #define or else outside of where
           we can see them.  We should initialize them before calling
           read_input_list.  */
@@ -48,10 +48,10 @@ index 981577481af..d5700fff401 100644
        POS_HERE (do_scalar_typedef ("CUMULATIVE_ARGS", &pos));
        POS_HERE (do_scalar_typedef ("REAL_VALUE_TYPE", &pos));
 diff --git a/gcc/genmodes.c b/gcc/genmodes.c
-index 21e5f536976..a22f65a232f 100644
+index c268ebc4c6e..4361f3f1563 100644
 --- a/gcc/genmodes.c
 +++ b/gcc/genmodes.c
-@@ -430,7 +430,7 @@ complete_all_modes (void)
+@@ -438,7 +438,7 @@ complete_all_modes (void)
  }
  
  /* For each mode in class CLASS, construct a corresponding complex mode.  */
@@ -60,7 +60,7 @@ index 21e5f536976..a22f65a232f 100644
  static void
  make_complex_modes (enum mode_class cl,
  		    const char *file, unsigned int line)
-@@ -489,7 +489,7 @@ make_complex_modes (enum mode_class cl,
+@@ -497,7 +497,7 @@ make_complex_modes (enum mode_class cl,
     having as many components as necessary.  ORDER is the sorting order
     of the mode, with smaller numbers indicating a higher priority.  */
  #define VECTOR_MODES_WITH_PREFIX(PREFIX, C, W, ORDER) \
@@ -69,7 +69,7 @@ index 21e5f536976..a22f65a232f 100644
  #define VECTOR_MODES(C, W) VECTOR_MODES_WITH_PREFIX (V, C, W, 0)
  static void ATTRIBUTE_UNUSED
  make_vector_modes (enum mode_class cl, const char *prefix, unsigned int width,
-@@ -541,7 +541,7 @@ make_vector_modes (enum mode_class cl, const char *prefix, unsigned int width,
+@@ -549,7 +549,7 @@ make_vector_modes (enum mode_class cl, const char *prefix, unsigned int width,
  /* Create a vector of booleans called NAME with COUNT elements and
     BYTESIZE bytes in total.  */
  #define VECTOR_BOOL_MODE(NAME, COUNT, BYTESIZE) \
@@ -78,7 +78,7 @@ index 21e5f536976..a22f65a232f 100644
  static void ATTRIBUTE_UNUSED
  make_vector_bool_mode (const char *name, unsigned int count,
  		       unsigned int bytesize, const char *file,
-@@ -563,7 +563,7 @@ make_vector_bool_mode (const char *name, unsigned int count,
+@@ -571,7 +571,7 @@ make_vector_bool_mode (const char *name, unsigned int count,
  /* Input.  */
  
  #define _SPECIAL_MODE(C, N) \
@@ -87,7 +87,7 @@ index 21e5f536976..a22f65a232f 100644
  #define RANDOM_MODE(N) _SPECIAL_MODE (RANDOM, N)
  #define CC_MODE(N) _SPECIAL_MODE (CC, N)
  
-@@ -576,7 +576,7 @@ make_special_mode (enum mode_class cl, const char *name,
+@@ -584,7 +584,7 @@ make_special_mode (enum mode_class cl, const char *name,
  
  #define INT_MODE(N, Y) FRACTIONAL_INT_MODE (N, -1U, Y)
  #define FRACTIONAL_INT_MODE(N, B, Y) \
@@ -96,7 +96,7 @@ index 21e5f536976..a22f65a232f 100644
  
  static void
  make_int_mode (const char *name,
-@@ -589,16 +589,16 @@ make_int_mode (const char *name,
+@@ -611,16 +611,16 @@ make_opaque_mode (const char *name,
  }
  
  #define FRACT_MODE(N, Y, F) \
@@ -117,7 +117,7 @@ index 21e5f536976..a22f65a232f 100644
  
  /* Create a fixed-point mode by setting CL, NAME, BYTESIZE, IBIT, FBIT,
     FILE, and LINE.  */
-@@ -619,7 +619,7 @@ make_fixed_point_mode (enum mode_class cl,
+@@ -641,7 +641,7 @@ make_fixed_point_mode (enum mode_class cl,
  
  #define FLOAT_MODE(N, Y, F)             FRACTIONAL_FLOAT_MODE (N, -1U, Y, F)
  #define FRACTIONAL_FLOAT_MODE(N, B, Y, F) \
@@ -126,7 +126,7 @@ index 21e5f536976..a22f65a232f 100644
  
  static void
  make_float_mode (const char *name,
-@@ -636,7 +636,7 @@ make_float_mode (const char *name,
+@@ -658,7 +658,7 @@ make_float_mode (const char *name,
  #define DECIMAL_FLOAT_MODE(N, Y, F)	\
  	FRACTIONAL_DECIMAL_FLOAT_MODE (N, -1U, Y, F)
  #define FRACTIONAL_DECIMAL_FLOAT_MODE(N, B, Y, F)	\
@@ -135,7 +135,7 @@ index 21e5f536976..a22f65a232f 100644
  
  static void
  make_decimal_float_mode (const char *name,
-@@ -651,7 +651,7 @@ make_decimal_float_mode (const char *name,
+@@ -673,7 +673,7 @@ make_decimal_float_mode (const char *name,
  }
  
  #define RESET_FLOAT_FORMAT(N, F) \
@@ -144,7 +144,7 @@ index 21e5f536976..a22f65a232f 100644
  static void ATTRIBUTE_UNUSED
  reset_float_format (const char *name, const char *format,
  		    const char *file, unsigned int line)
-@@ -672,7 +672,7 @@ reset_float_format (const char *name, const char *format,
+@@ -694,7 +694,7 @@ reset_float_format (const char *name, const char *format,
  
  /* __intN support.  */
  #define INT_N(M,PREC)				\
@@ -153,7 +153,7 @@ index 21e5f536976..a22f65a232f 100644
  static void ATTRIBUTE_UNUSED
  make_int_n (const char *m, int bitsize,
              const char *file, unsigned int line)
-@@ -701,7 +701,7 @@ make_int_n (const char *m, int bitsize,
+@@ -723,7 +723,7 @@ make_int_n (const char *m, int bitsize,
  /* Partial integer modes are specified by relation to a full integer
     mode.  */
  #define PARTIAL_INT_MODE(M,PREC,NAME)				\
@@ -162,7 +162,7 @@ index 21e5f536976..a22f65a232f 100644
  static void ATTRIBUTE_UNUSED
  make_partial_integer_mode (const char *base, const char *name,
  			   unsigned int precision,
-@@ -728,7 +728,7 @@ make_partial_integer_mode (const char *base, const char *name,
+@@ -750,7 +750,7 @@ make_partial_integer_mode (const char *base, const char *name,
  /* A single vector mode can be specified by naming its component
     mode and the number of components.  */
  #define VECTOR_MODE(C, M, N) \
@@ -171,7 +171,7 @@ index 21e5f536976..a22f65a232f 100644
  static void ATTRIBUTE_UNUSED
  make_vector_mode (enum mode_class bclass,
  		  const char *base,
-@@ -771,7 +771,7 @@ make_vector_mode (enum mode_class bclass,
+@@ -793,7 +793,7 @@ make_vector_mode (enum mode_class bclass,
  
  /* Adjustability.  */
  #define _ADD_ADJUST(A, M, X, C1, C2) \
diff --git a/meta/recipes-devtools/gcc/gcc/0036-mingw32-Enable-operation_not_supported.patch b/meta/recipes-devtools/gcc/gcc/0036-mingw32-Enable-operation_not_supported.patch
index f2d6e30a07..3a7618c820 100644
--- a/meta/recipes-devtools/gcc/gcc/0036-mingw32-Enable-operation_not_supported.patch
+++ b/meta/recipes-devtools/gcc/gcc/0036-mingw32-Enable-operation_not_supported.patch
@@ -1,4 +1,4 @@
-From 6d9d080ce16de2fda138a8aac579e531bd64221d Mon Sep 17 00:00:00 2001
+From 96d895c8d5dc895d24fe37aa2b4f201a2566b4cc Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 12 May 2020 10:39:09 -0700
 Subject: [PATCH] mingw32: Enable operation_not_supported
@@ -12,7 +12,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/libstdc++-v3/config/os/mingw32/error_constants.h b/libstdc++-v3/config/os/mingw32/error_constants.h
-index 2222c5227c4..35290eabfa7 100644
+index eca06a97014..933cfab49cf 100644
 --- a/libstdc++-v3/config/os/mingw32/error_constants.h
 +++ b/libstdc++-v3/config/os/mingw32/error_constants.h
 @@ -107,7 +107,7 @@ _GLIBCXX_BEGIN_NAMESPACE_VERSION
diff --git a/meta/recipes-devtools/gcc/gcc/0037-libatomic-Do-not-enforce-march-on-aarch64.patch b/meta/recipes-devtools/gcc/gcc/0037-libatomic-Do-not-enforce-march-on-aarch64.patch
index a55fbffb2c..4c9a79cb64 100644
--- a/meta/recipes-devtools/gcc/gcc/0037-libatomic-Do-not-enforce-march-on-aarch64.patch
+++ b/meta/recipes-devtools/gcc/gcc/0037-libatomic-Do-not-enforce-march-on-aarch64.patch
@@ -1,4 +1,4 @@
-From f572efe2cee2d580007beb4540925965365ceeb9 Mon Sep 17 00:00:00 2001
+From 36d4fdbc99e69f9d70a29e2bada40cc3c1534557 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 13 May 2020 15:10:38 -0700
 Subject: [PATCH] libatomic: Do not enforce march on aarch64
@@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 deletions(-)
 
 diff --git a/libatomic/Makefile.am b/libatomic/Makefile.am
-index 133fbbca77e..ac1ca645876 100644
+index 0f3cd6f7121..c8124c1d5aa 100644
 --- a/libatomic/Makefile.am
 +++ b/libatomic/Makefile.am
 @@ -125,7 +125,6 @@ libatomic_la_LIBADD = $(foreach s,$(SIZES),$(addsuffix _$(s)_.lo,$(SIZEOBJS)))
@@ -29,10 +29,10 @@ index 133fbbca77e..ac1ca645876 100644
  endif
  if ARCH_ARM_LINUX
 diff --git a/libatomic/Makefile.in b/libatomic/Makefile.in
-index a51807e95c9..97df2d7ff03 100644
+index 0a51bd55f01..6d5b1581706 100644
 --- a/libatomic/Makefile.in
 +++ b/libatomic/Makefile.in
-@@ -431,7 +431,6 @@ M_SRC = $(firstword $(filter %/$(M_FILE), $(all_c_files)))
+@@ -432,7 +432,6 @@ M_SRC = $(firstword $(filter %/$(M_FILE), $(all_c_files)))
  libatomic_la_LIBADD = $(foreach s,$(SIZES),$(addsuffix \
  	_$(s)_.lo,$(SIZEOBJS))) $(am__append_1) $(am__append_2) \
  	$(am__append_3) $(am__append_4)
diff --git a/meta/recipes-devtools/gcc/gcc/0038-libatomic-libgomp-libitc-Fix-bootstrap-PR70454.patch b/meta/recipes-devtools/gcc/gcc/0038-libatomic-libgomp-libitc-Fix-bootstrap-PR70454.patch
deleted file mode 100644
index 65c3e398fe..0000000000
--- a/meta/recipes-devtools/gcc/gcc/0038-libatomic-libgomp-libitc-Fix-bootstrap-PR70454.patch
+++ /dev/null
@@ -1,209 +0,0 @@
-From eb5a17c7b8ed676d83ce4dd0e9623e2ee0191f91 Mon Sep 17 00:00:00 2001
-From: Jakub Jelinek <jakub@redhat.com>
-Date: Fri, 15 Jan 2021 13:12:59 +0100
-Subject: [PATCH] libatomic, libgomp, libitc: Fix bootstrap [PR70454]
-
-The recent changes to error on mixing -march=i386 and -fcf-protection broke
-bootstrap.  This patch changes lib{atomic,gomp,itm} configury, so that it
-only adds -march=i486 to flags if really needed (i.e. when 486 or later isn't
-on by default already).  Similarly, it will not use ifuncs if -mcx16
-(or -march=i686 for 32-bit) is on by default.
-
-2021-01-15  Jakub Jelinek  <jakub@redhat.com>
-
-	PR target/70454
-libatomic/
-	* configure.tgt: For i?86 and x86_64 determine if -march=i486 needs to
-	be added through preprocessor check on
-	__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4.  Determine if try_ifunc is needed
-	based on preprocessor check on __GCC_HAVE_SYNC_COMPARE_AND_SWAP_16
-	or __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8.
-libgomp/
-	* configure.tgt: For i?86 and x86_64 determine if -march=i486 needs to
-	be added through preprocessor check on
-	__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4.
-libitm/
-	* configure.tgt: For i?86 and x86_64 determine if -march=i486 needs to
-	be added through preprocessor check on
-	__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4.
-
-Upstream-Status: Backport [master post 10.x release]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libatomic/configure.tgt | 56 +++++++++++++++++++++++------------------
- libgomp/configure.tgt   | 35 +++++++++++---------------
- libitm/configure.tgt    | 37 +++++++++++++--------------
- 3 files changed, 64 insertions(+), 64 deletions(-)
-
-diff --git a/libatomic/configure.tgt b/libatomic/configure.tgt
-index 5dd0926d207..6ea082a29bc 100644
---- a/libatomic/configure.tgt
-+++ b/libatomic/configure.tgt
-@@ -81,32 +81,40 @@ case "${target_cpu}" in
- 	ARCH=sparc
- 	;;
- 
--  i[3456]86)
--	case " ${CC} ${CFLAGS} " in
--	  *" -m64 "*|*" -mx32 "*)
--	    ;;
--	  *)
--	    if test -z "$with_arch"; then
--	      XCFLAGS="${XCFLAGS} -march=i486 -mtune=${target_cpu}"
--	      XCFLAGS="${XCFLAGS} -fomit-frame-pointer"
--	    fi
--	esac
--	ARCH=x86
--	# ??? Detect when -march=i686 is already enabled.
--	try_ifunc=yes
--	;;
--  x86_64)
--	case " ${CC} ${CFLAGS} " in
--	  *" -m32 "*)
-+  i[3456]86 | x86_64)
-+	cat > conftestx.c <<EOF
-+#ifndef __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4
-+#error need -march=i486
-+#endif
-+EOF
-+	if ${CC} ${CFLAGS} -E conftestx.c > /dev/null 2>&1; then
-+	  :
-+	else
-+	  if test "${target_cpu}" = x86_64; then
- 	    XCFLAGS="${XCFLAGS} -march=i486 -mtune=generic"
--	    XCFLAGS="${XCFLAGS} -fomit-frame-pointer"
--	    ;;
--	  *)
--	    ;;
--	esac
-+	  else
-+	    XCFLAGS="${XCFLAGS} -march=i486 -mtune=${target_cpu}"
-+	  fi
-+	  XCFLAGS="${XCFLAGS} -fomit-frame-pointer"
-+	fi
-+	cat > conftestx.c <<EOF
-+#ifdef __x86_64__
-+#ifndef __GCC_HAVE_SYNC_COMPARE_AND_SWAP_16
-+#error need -mcx16
-+#endif
-+#else
-+#ifndef __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8
-+#error need -march=i686
-+#endif
-+#endif
-+EOF
-+	if ${CC} ${CFLAGS} -E conftestx.c > /dev/null 2>&1; then
-+	  try_ifunc=no
-+	else
-+	  try_ifunc=yes
-+	fi
-+	rm -f conftestx.c
- 	ARCH=x86
--	# ??? Detect when -mcx16 is already enabled.
--	try_ifunc=yes
- 	;;
- 
-   *)			ARCH="${target_cpu}" ;;
-diff --git a/libgomp/configure.tgt b/libgomp/configure.tgt
-index 4790a31e394..761ef2a7db2 100644
---- a/libgomp/configure.tgt
-+++ b/libgomp/configure.tgt
-@@ -70,28 +70,23 @@ if test x$enable_linux_futex = xyes; then
- 	;;
- 
-     # Note that bare i386 is not included here.  We need cmpxchg.
--    i[456]86-*-linux*)
-+    i[456]86-*-linux* | x86_64-*-linux*)
- 	config_path="linux/x86 linux posix"
--	case " ${CC} ${CFLAGS} " in
--	  *" -m64 "*|*" -mx32 "*)
--	    ;;
--	  *)
--	    if test -z "$with_arch"; then
--	      XCFLAGS="${XCFLAGS} -march=i486 -mtune=${target_cpu}"
--	    fi
--	esac
--	;;
--
--    # Similar jiggery-pokery for x86_64 multilibs, except here we
--    # can't rely on the --with-arch configure option, since that
--    # applies to the 64-bit side.
--    x86_64-*-linux*)
--	config_path="linux/x86 linux posix"
--	case " ${CC} ${CFLAGS} " in
--	  *" -m32 "*)
-+	cat > conftestx.c <<EOF
-+#ifndef __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4
-+#error need -march=i486
-+#endif
-+EOF
-+	if ${CC} ${CFLAGS} -E conftestx.c > /dev/null 2>&1; then
-+	  :
-+	else
-+	  if test "${target_cpu}" = x86_64; then
- 	    XCFLAGS="${XCFLAGS} -march=i486 -mtune=generic"
--	    ;;
--	esac
-+	  else
-+	    XCFLAGS="${XCFLAGS} -march=i486 -mtune=${target_cpu}"
-+	  fi
-+	fi
-+	rm -f conftestx.c
- 	;;
- 
-     # Note that sparcv7 and sparcv8 is not included here.  We need cas.
-diff --git a/libitm/configure.tgt b/libitm/configure.tgt
-index d1beb5c9ec8..608462e184e 100644
---- a/libitm/configure.tgt
-+++ b/libitm/configure.tgt
-@@ -59,16 +59,23 @@ case "${target_cpu}" in
- 
-   arm*)		ARCH=arm ;;
- 
--  i[3456]86)
--	case " ${CC} ${CFLAGS} " in
--	  *" -m64 "*|*" -mx32 "*)
--	    ;;
--	  *)
--	    if test -z "$with_arch"; then
--	      XCFLAGS="${XCFLAGS} -march=i486 -mtune=${target_cpu}"
--	      XCFLAGS="${XCFLAGS} -fomit-frame-pointer"
--	    fi
--	esac
-+  i[3456]86 | x86_64)
-+	cat > conftestx.c <<EOF
-+#ifndef __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4
-+#error need -march=i486
-+#endif
-+EOF
-+	if ${CC} ${CFLAGS} -E conftestx.c > /dev/null 2>&1; then
-+	  :
-+	else
-+	  if test "${target_cpu}" = x86_64; then
-+	    XCFLAGS="${XCFLAGS} -march=i486 -mtune=generic"
-+	  else
-+	    XCFLAGS="${XCFLAGS} -march=i486 -mtune=${target_cpu}"
-+	  fi
-+	  XCFLAGS="${XCFLAGS} -fomit-frame-pointer"
-+	fi
-+	rm -f conftestx.c
- 	XCFLAGS="${XCFLAGS} -mrtm"
- 	ARCH=x86
- 	;;
-@@ -103,16 +110,6 @@ case "${target_cpu}" in
- 	ARCH=sparc
- 	;;
- 
--  x86_64)
--	case " ${CC} ${CFLAGS} " in
--	  *" -m32 "*)
--	    XCFLAGS="${XCFLAGS} -march=i486 -mtune=generic"
--	    XCFLAGS="${XCFLAGS} -fomit-frame-pointer"
--	    ;;
--	esac
--	XCFLAGS="${XCFLAGS} -mrtm"
--	ARCH=x86
--	;;
-   s390|s390x)
- 	XCFLAGS="${XCFLAGS} -mzarch -mhtm"
- 	ARCH=s390
diff --git a/meta/recipes-devtools/gcc/gcc_10.3.bb b/meta/recipes-devtools/gcc/gcc_11.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc_10.3.bb
rename to meta/recipes-devtools/gcc/gcc_11.1.bb
diff --git a/meta/recipes-devtools/gcc/libgcc-initial_10.3.bb b/meta/recipes-devtools/gcc/libgcc-initial_11.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc-initial_10.3.bb
rename to meta/recipes-devtools/gcc/libgcc-initial_11.1.bb
diff --git a/meta/recipes-devtools/gcc/libgcc_10.3.bb b/meta/recipes-devtools/gcc/libgcc_11.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc_10.3.bb
rename to meta/recipes-devtools/gcc/libgcc_11.1.bb
diff --git a/meta/recipes-devtools/gcc/libgfortran_10.3.bb b/meta/recipes-devtools/gcc/libgfortran_11.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgfortran_10.3.bb
rename to meta/recipes-devtools/gcc/libgfortran_11.1.bb
-- 
2.31.1

