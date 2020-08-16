Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.20188.1597561700737591089
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2020 00:08:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QwKBdReB;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id t6so6185945pjr.0
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2020 00:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vG3Hrb6M5szkl95v20pqLKzPJhGASJwVTcMKHqTeegA=;
        b=QwKBdReB+07YCny/skuFhxPT56TFOZqU1ncCh6NTpNTu2Bhub3npsecbaAUl0bVfkD
         vxYEC4ywiOPj17PqeNiY6ot4+DREROGIvAdKAew8gSmop3F1ZMmz1s9yGiilDv2ehDEx
         IQZJns+PKEJkkxBzSv7HYo1enfDjv8ocZxFBQ7WhHsKDBKUGhWSWa3BXDXjPtiBJmaJ4
         b61fbqsErNVbUuxZsZzHANH9wOfKzeNcrcBkVjE+mz8Hc0sioM//NM+G8BSPwz5yxqUh
         8zPPfHYEcPQg9wRAr/V0cqDlf8EZINaKNAHC3ywpLU3/zeDxqvvKsTlmf1F48wJBc5Gq
         akGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vG3Hrb6M5szkl95v20pqLKzPJhGASJwVTcMKHqTeegA=;
        b=WQ0U1U6ycZErq2oH9vyNDJ2YhMI+GOFc4g40OjKZMBhwlMN8LsO3KUFneND6fTbdEO
         +rii1Ptp8oCN/rptkWaPENM55cP1UHJRr/lk6xvxDE0x98yAFKxuDEpry+z7ihNIzUq/
         BFLV1WpkXieekgdpUcnQF6g489L70TkU0ZjUhKpRwEum/MFhnIQCu2QwGkpzC9KS01NB
         s5Fwkw6Bcuroq6B5VBYn6I0jSx83f4/hzj2X1hDZGUlGfn1sKVibDCWrjN+BLG4ieVLK
         VrZFYlag4xfQmVHxM9IXCBWgfcOLD/Dx4vJy0tKIvBb2bG/Gg4thkYkoB0eW5yJgnwlM
         rZKw==
X-Gm-Message-State: AOAM532X623yF+iAnjWAICO5d2n0ALWoqexh7TYmNB5lZWtXhXehONuH
	r2RgguzLlJBdktSMtwOcrhSswvk/CxL55Q==
X-Google-Smtp-Source: ABdhPJyo5vzhmQsy5YrCS11mlC4CCi2Dut8E3jRMyIEO9sdMrjgqVnF8/RNpJ+87t4GcDgIvIVJoYQ==
X-Received: by 2002:a17:90a:a794:: with SMTP id f20mr8207797pjq.74.1597561699137;
        Sun, 16 Aug 2020 00:08:19 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net (c-73-63-224-124.hsd1.ca.comcast.net. [73.63.224.124])
        by smtp.gmail.com with ESMTPSA id em20sm12646873pjb.37.2020.08.16.00.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2020 00:08:18 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/3] gcc: Upgrade to 10.2.0
Date: Sun, 16 Aug 2020 00:08:13 -0700
Message-Id: <20200816070814.1303004-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200816070814.1303004-1-raj.khem@gmail.com>
References: <20200816070814.1303004-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop 0036-Enable-CET-in-cross-compiler-if-possible.patch and
pr96130.patch they are already in 10.2

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |   2 +-
 ...le-CET-in-cross-compiler-if-possible.patch | 150 ------------------
 .../gcc/gcc-10.1/pr96130.patch                | 106 -------------
 .../gcc/{gcc-10.1.inc => gcc-10.2.inc}        |  14 +-
 ...ian_10.1.bb => gcc-cross-canadian_10.2.bb} |   0
 .../{gcc-cross_10.1.bb => gcc-cross_10.2.bb}  |   0
 ...-crosssdk_10.1.bb => gcc-crosssdk_10.2.bb} |   0
 ...cc-runtime_10.1.bb => gcc-runtime_10.2.bb} |   0
 ...itizers_10.1.bb => gcc-sanitizers_10.2.bb} |   0
 ...{gcc-source_10.1.bb => gcc-source_10.2.bb} |   0
 ...-up-__aarch64_cas16_acq_rel-fallback.patch |   0
 ...ight-Line-Speculation-SLS-mitigation.patch |   0
 ...0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch |   0
 ...e-SLS-mitigation-for-RET-and-BR-inst.patch |   0
 .../0002-gcc-poison-system-directories.patch  |   0
 ...h64-Mitigate-SLS-for-BLR-instruction.patch |   0
 ...-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |   0
 .../0004-64-bit-multilib-hack.patch           |   0
 .../0005-optional-libstdc.patch               |   0
 .../0006-COLLECT_GCC_OPTIONS.patch            |   0
 ...ts.h-in-B-instead-of-S-and-t-oe-in-B.patch |   0
 .../0008-fortran-cross-compile-hack.patch     |   0
 .../0009-cpp-honor-sysroot.patch              |   0
 .../0010-MIPS64-Default-to-N64-ABI.patch      |   0
 ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |   0
 ...gcc-Fix-argument-list-too-long-error.patch |   0
 .../{gcc-10.1 => gcc}/0013-Disable-sdt.patch  |   0
 .../gcc/{gcc-10.1 => gcc}/0014-libtool.patch  |   0
 ...s-fix-v4bx-to-linker-to-support-EABI.patch |   0
 ...-config-files-from-B-instead-of-usin.patch |   0
 ...ir-from-.la-which-usually-points-to-.patch |   0
 .../{gcc-10.1 => gcc}/0018-export-CPP.patch   |   0
 ...e-target-gcc-headers-can-be-included.patch |   0
 ...t-directory-during-relink-if-inst_pr.patch |   0
 ...IR-replacement-instead-of-hardcoding.patch |   0
 ...22-aarch64-Add-support-for-musl-ldso.patch |   0
 ...-fix-libcc1-s-install-path-and-rpath.patch |   0
 ...le-sysroot-support-for-nativesdk-gcc.patch |   0
 ...sroot-gcc-version-specific-dirs-with.patch |   0
 ...ous-_FOR_BUILD-and-related-variables.patch |   0
 ...027-nios2-Define-MUSL_DYNAMIC_LINKER.patch |   0
 ...d-to-link-commandline-for-musl-targe.patch |   0
 ...using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch |   0
 .../0030-sync-gcc-stddef.h-with-musl.patch    |   0
 ...-fault-in-precompiled-header-generat.patch |   0
 .../0032-Fix-for-testsuite-failure.patch      |   0
 ...Re-introduce-spe-commandline-options.patch |   0
 ...as-for-__cpu_indicator_init-instead-.patch |   0
 ...s-Do-not-use-__LINE__-for-maintainin.patch |   0
 ...gw32-Enable-operation_not_supported.patch} |   0
 ...mic-Do-not-enforce-march-on-aarch64.patch} |   0
 .../gcc/{gcc_10.1.bb => gcc_10.2.bb}          |   0
 ...initial_10.1.bb => libgcc-initial_10.2.bb} |   0
 .../gcc/{libgcc_10.1.bb => libgcc_10.2.bb}    |   0
 ...ibgfortran_10.1.bb => libgfortran_10.2.bb} |   0
 55 files changed, 7 insertions(+), 265 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-10.1/0036-Enable-CET-in-cross-compiler-if-possible.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-10.1/pr96130.patch
 rename meta/recipes-devtools/gcc/{gcc-10.1.inc => gcc-10.2.inc} (91%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_10.1.bb => gcc-cross-canadian_10.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_10.1.bb => gcc-cross_10.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_10.1.bb => gcc-crosssdk_10.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_10.1.bb => gcc-runtime_10.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_10.1.bb => gcc-sanitizers_10.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_10.1.bb => gcc-source_10.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-10.1 => gcc}/0001-aarch64-Fix-up-__aarch64_cas16_acq_rel-fallback.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-10.1 => gcc}/0001-aarch64-New-Straight-Line-Speculation-SLS-mitigation.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-10.1 => gcc}/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-10.1 => gcc}/0002-aarch64-Introduce-SLS-mitigation-for-RET-and-BR-inst.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-10.1 => gcc}/0002-gcc-poison-system-directories.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-10.1 => gcc}/0003-aarch64-Mitigate-SLS-for-BLR-instruction.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-10.1 => gcc}/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-10.1 => gcc}/0004-64-bit-multilib-hack.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-10.1 => gcc}/0005-optional-libstdc.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-10.1 => gcc}/0006-COLLECT_GCC_OPTIONS.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-10.1 => gcc}/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-10.1 => gcc}/0008-fortran-cross-compile-hack.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-10.1 => gcc}/0009-cpp-honor-sysroot.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-10.1 => gcc}/0010-MIPS64-Default-to-N64-ABI.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-10.1 => gcc}/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-10.1 => gcc}/0012-gcc-Fix-argument-list-too-long-error.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-10.1 => gcc}/0013-Disable-sdt.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-10.1 => gcc}/0014-libtool.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-10.1 => gcc}/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-10.1 => gcc}/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-10.1 => gcc}/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-10.1 => gcc}/0018-export-CPP.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-10.1 => gcc}/0019-Ensure-target-gcc-headers-can-be-included.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-10.1 => gcc}/0020-Don-t-search-host-directory-during-relink-if-inst_pr.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-10.1 => gcc}/0021-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-10.1 => gcc}/0022-aarch64-Add-support-for-musl-ldso.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-10.1 => gcc}/0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-10.1 => gcc}/0024-handle-sysroot-support-for-nativesdk-gcc.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-10.1 => gcc}/0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-10.1 => gcc}/0026-Fix-various-_FOR_BUILD-and-related-variables.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-10.1 => gcc}/0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-10.1 => gcc}/0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-10.1 => gcc}/0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-10.1 => gcc}/0030-sync-gcc-stddef.h-with-musl.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-10.1 => gcc}/0031-fix-segmentation-fault-in-precompiled-header-generat.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-10.1 => gcc}/0032-Fix-for-testsuite-failure.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-10.1 => gcc}/0033-Re-introduce-spe-commandline-options.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-10.1 => gcc}/0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-10.1 => gcc}/0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-10.1/0037-mingw32-Enable-operation_not_supported.patch => gcc/0036-mingw32-Enable-operation_not_supported.patch} (100%)
 rename meta/recipes-devtools/gcc/{gcc-10.1/0038-libatomic-Do-not-enforce-march-on-aarch64.patch => gcc/0037-libatomic-Do-not-enforce-march-on-aarch64.patch} (100%)
 rename meta/recipes-devtools/gcc/{gcc_10.1.bb => gcc_10.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_10.1.bb => libgcc-initial_10.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_10.1.bb => libgcc_10.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_10.1.bb => libgfortran_10.2.bb} (100%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 17bf335d2f..4aa07e556c 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -191,7 +191,7 @@ RECIPE_MAINTAINER_pn-gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Khem Raj <r
 RECIPE_MAINTAINER_pn-gcc-crosssdk-${SDK_SYS} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-gcc-runtime = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-gcc-sanitizers = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER_pn-gcc-source-10.1.0 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER_pn-gcc-source-10.2.0 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-gconf = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-gcr = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-gdb = "Khem Raj <raj.khem@gmail.com>"
diff --git a/meta/recipes-devtools/gcc/gcc-10.1/0036-Enable-CET-in-cross-compiler-if-possible.patch b/meta/recipes-devtools/gcc/gcc-10.1/0036-Enable-CET-in-cross-compiler-if-possible.patch
deleted file mode 100644
index af80642829..0000000000
--- a/meta/recipes-devtools/gcc/gcc-10.1/0036-Enable-CET-in-cross-compiler-if-possible.patch
+++ /dev/null
@@ -1,150 +0,0 @@
-From 87a5ace658f2294b025e0420ef03ade1f45d926c Mon Sep 17 00:00:00 2001
-From: "H.J. Lu" <hjl.tools@gmail.com>
-Date: Fri, 8 May 2020 06:11:05 -0700
-Subject: [PATCH] Enable CET in cross compiler if possible
-
-Don't perform CET run-time check for host when cross compiling.  Instead,
-enable CET in cross compiler if possible so that it will run on both CET
-and non-CET hosts.
-
-config/
-
-	PR bootstrap/94998
-	* cet.m4 (GCC_CET_HOST_FLAGS): Enable CET in cross compiler if
-	possible.
-
-libiberty/
-
-	PR bootstrap/94998
-	* configure: Regenerated.
-
-lto-plugin/
-
-	PR bootstrap/94998
-	* configure: Regenerated.
-
-Upstream-Status: Submitted [https://patchwork.ozlabs.org/project/gcc/patch/20200508131105.170077-1-hjl.tools@gmail.com/]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- config/cet.m4        | 18 ++++++++++++------
- libiberty/configure  | 12 +++++++++---
- lto-plugin/configure | 16 +++++++++++-----
- 3 files changed, 32 insertions(+), 14 deletions(-)
-
-diff --git a/config/cet.m4 b/config/cet.m4
-index ea616b728a9..d9608699cd5 100644
---- a/config/cet.m4
-+++ b/config/cet.m4
-@@ -111,7 +111,8 @@ if test x$may_have_cet = xyes; then
- fi
- 
- if test x$may_have_cet = xyes; then
--  AC_TRY_RUN([
-+  if test x$cross_compiling = xno; then
-+    AC_TRY_RUN([
- static void
- foo (void)
- {
-@@ -137,12 +138,17 @@ main ()
-   bar ();
-   return 0;
- }
--  ],
--  [have_cet=no],
--  [have_cet=yes])
--  if test x$enable_cet = xno -a x$have_cet = xyes; then
--    AC_MSG_ERROR([Intel CET must be enabled on Intel CET enabled host])
-+    ],
-+    [have_cet=no],
-+    [have_cet=yes])
-+    if test x$enable_cet = xno -a x$have_cet = xyes; then
-+      AC_MSG_ERROR([Intel CET must be enabled on Intel CET enabled host])
-+    fi
-   fi
-+else
-+  # Enable CET in cross compiler if possible so that it will run on both
-+  # CET and non-CET hosts.
-+  have_cet=yes
- fi
- if test x$enable_cet = xyes; then
-   $1="-fcf-protection"
-diff --git a/libiberty/configure b/libiberty/configure
-index bb76cf1b823..3f82c5bb865 100755
---- a/libiberty/configure
-+++ b/libiberty/configure
-@@ -5375,7 +5375,8 @@ rm -f core conftest.err conftest.$ac_objext \
- fi
- 
- if test x$may_have_cet = xyes; then
--  if test "$cross_compiling" = yes; then :
-+  if test x$cross_compiling = xno; then
-+    if test "$cross_compiling" = yes; then :
-   { { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
- $as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
- as_fn_error $? "cannot run test program while cross compiling
-@@ -5420,9 +5421,14 @@ rm -f core *.core core.conftest.* gmon.out bb.out conftest$ac_exeext \
-   conftest.$ac_objext conftest.beam conftest.$ac_ext
- fi
- 
--  if test x$enable_cet = xno -a x$have_cet = xyes; then
--    as_fn_error $? "Intel CET must be enabled on Intel CET enabled host" "$LINENO" 5
-+    if test x$enable_cet = xno -a x$have_cet = xyes; then
-+      as_fn_error $? "Intel CET must be enabled on Intel CET enabled host" "$LINENO" 5
-+    fi
-   fi
-+else
-+  # Enable CET in cross compiler if possible so that it will run on both
-+  # CET and non-CET hosts.
-+  have_cet=yes
- fi
- if test x$enable_cet = xyes; then
-   CET_HOST_FLAGS="-fcf-protection"
-diff --git a/lto-plugin/configure b/lto-plugin/configure
-index 1baf6cc70b8..36c6ecc5875 100755
---- a/lto-plugin/configure
-+++ b/lto-plugin/configure
-@@ -5768,7 +5768,8 @@ rm -f core conftest.err conftest.$ac_objext \
- fi
- 
- if test x$may_have_cet = xyes; then
--  if test "$cross_compiling" = yes; then :
-+  if test x$cross_compiling = xno; then
-+    if test "$cross_compiling" = yes; then :
-   { { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
- $as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
- as_fn_error $? "cannot run test program while cross compiling
-@@ -5813,9 +5814,14 @@ rm -f core *.core core.conftest.* gmon.out bb.out conftest$ac_exeext \
-   conftest.$ac_objext conftest.beam conftest.$ac_ext
- fi
- 
--  if test x$enable_cet = xno -a x$have_cet = xyes; then
--    as_fn_error $? "Intel CET must be enabled on Intel CET enabled host" "$LINENO" 5
-+    if test x$enable_cet = xno -a x$have_cet = xyes; then
-+      as_fn_error $? "Intel CET must be enabled on Intel CET enabled host" "$LINENO" 5
-+    fi
-   fi
-+else
-+  # Enable CET in cross compiler if possible so that it will run on both
-+  # CET and non-CET hosts.
-+  have_cet=yes
- fi
- if test x$enable_cet = xyes; then
-   CET_HOST_FLAGS="-fcf-protection"
-@@ -11941,7 +11947,7 @@ else
-   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
-   lt_status=$lt_dlunknown
-   cat > conftest.$ac_ext <<_LT_EOF
--#line 11944 "configure"
-+#line 11950 "configure"
- #include "confdefs.h"
- 
- #if HAVE_DLFCN_H
-@@ -12047,7 +12053,7 @@ else
-   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
-   lt_status=$lt_dlunknown
-   cat > conftest.$ac_ext <<_LT_EOF
--#line 12050 "configure"
-+#line 12056 "configure"
- #include "confdefs.h"
- 
- #if HAVE_DLFCN_H
diff --git a/meta/recipes-devtools/gcc/gcc-10.1/pr96130.patch b/meta/recipes-devtools/gcc/gcc-10.1/pr96130.patch
deleted file mode 100644
index f0e6f85e22..0000000000
--- a/meta/recipes-devtools/gcc/gcc-10.1/pr96130.patch
+++ /dev/null
@@ -1,106 +0,0 @@
-From 0d03c0ee5213703ec6d9ffa632fa5298d83adaaa Mon Sep 17 00:00:00 2001
-From: Jakub Jelinek <jakub@redhat.com>
-Date: Mon, 13 Jul 2020 18:25:53 +0200
-Subject: [PATCH] ipa-fnsummary: Fix ICE with switch predicates [PR96130]
-
-The following testcase ICEs since r10-3199.
-There is a switch with default label, where the controlling expression has
-range just 0..7 and there are case labels for all those 8 values, but
-nothing has yet optimized away the default.
-Since r10-3199, set_switch_stmt_execution_predicate sets the switch to
-default label's edge's predicate to a false predicate and then
-compute_bb_predicates propagates the predicates through the cfg, but false
-predicates aren't really added.  The caller of compute_bb_predicates
-in one place handles NULL bb->aux as false predicate:
-      if (fbi.info)
-	{
-	  if (bb->aux)
-	    bb_predicate = *(predicate *) bb->aux;
-	  else
-	    bb_predicate = false;
-	}
-      else
-	bb_predicate = true;
-but then in two further spots that the patch below is changing
-it assumes bb->aux must be non-NULL.  Those two spots are guarded by a
-condition that is only true if fbi.info is non-NULL, so I think the right
-fix is to treat NULL aux as false predicate in those spots too.
-
-2020-07-13  Jakub Jelinek  <jakub@redhat.com>
-
-	PR ipa/96130
-	* ipa-fnsummary.c (analyze_function_body): Treat NULL bb->aux
-	as false predicate.
-
-	* gcc.dg/torture/pr96130.c: New test.
-
-(cherry picked from commit 776e48e0931db69f158f40e5cb8e15463d879a42)
----
- gcc/ipa-fnsummary.c                    | 10 ++++++++--
- gcc/testsuite/gcc.dg/torture/pr96130.c | 26 ++++++++++++++++++++++++++
- 2 files changed, 34 insertions(+), 2 deletions(-)
- create mode 100644 gcc/testsuite/gcc.dg/torture/pr96130.c
-
-diff --git a/gcc/ipa-fnsummary.c b/gcc/ipa-fnsummary.c
-index 045a0ecf766..55a0b272a96 100644
---- a/gcc/ipa-fnsummary.c
-+++ b/gcc/ipa-fnsummary.c
-@@ -2766,7 +2766,10 @@ analyze_function_body (struct cgraph_node *node, bool early)
- 	  edge ex;
- 	  unsigned int j;
- 	  class tree_niter_desc niter_desc;
--	  bb_predicate = *(predicate *) loop->header->aux;
-+	  if (loop->header->aux)
-+	    bb_predicate = *(predicate *) loop->header->aux;
-+	  else
-+	    bb_predicate = false;
- 
- 	  exits = get_loop_exit_edges (loop);
- 	  FOR_EACH_VEC_ELT (exits, j, ex)
-@@ -2799,7 +2802,10 @@ analyze_function_body (struct cgraph_node *node, bool early)
- 	  for (unsigned i = 0; i < loop->num_nodes; i++)
- 	    {
- 	      gimple_stmt_iterator gsi;
--	      bb_predicate = *(predicate *) body[i]->aux;
-+	      if (body[i]->aux)
-+		bb_predicate = *(predicate *) body[i]->aux;
-+	      else
-+		bb_predicate = false;
- 	      for (gsi = gsi_start_bb (body[i]); !gsi_end_p (gsi);
- 		   gsi_next (&gsi))
- 		{
-diff --git a/gcc/testsuite/gcc.dg/torture/pr96130.c b/gcc/testsuite/gcc.dg/torture/pr96130.c
-new file mode 100644
-index 00000000000..f722b9ad2a9
---- /dev/null
-+++ b/gcc/testsuite/gcc.dg/torture/pr96130.c
-@@ -0,0 +1,26 @@
-+/* PR ipa/96130 */
-+/* { dg-do compile } */
-+
-+struct S { unsigned j : 3; };
-+int k, l, m;
-+
-+void
-+foo (struct S x)
-+{
-+  while (l != 5)
-+    switch (x.j)
-+      {
-+      case 1:
-+      case 3:
-+      case 4:
-+      case 6:
-+      case 2:
-+      case 5:
-+	l = m;
-+      case 7:
-+      case 0:
-+	k = 0;
-+      default:
-+	break;
-+      }
-+}
--- 
-2.18.4
-
diff --git a/meta/recipes-devtools/gcc/gcc-10.1.inc b/meta/recipes-devtools/gcc/gcc-10.2.inc
similarity index 91%
rename from meta/recipes-devtools/gcc/gcc-10.1.inc
rename to meta/recipes-devtools/gcc/gcc-10.2.inc
index e8b0c61aae..7625af5110 100644
--- a/meta/recipes-devtools/gcc/gcc-10.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-10.2.inc
@@ -2,13 +2,13 @@ require gcc-common.inc
 
 # Third digit in PV should be incremented after a minor release
 
-PV = "10.1.0"
+PV = "10.2.0"
 
 # BINV should be incremented to a revision after a minor gcc release
 
-BINV = "10.1.0"
+BINV = "10.2.0"
 
-FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-10.1:${FILE_DIRNAME}/gcc-10.1/backport:"
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
 
 DEPENDS =+ "mpfr gmp libmpc zlib flex-native"
 NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native flex-native"
@@ -63,16 +63,14 @@ SRC_URI = "\
            file://0033-Re-introduce-spe-commandline-options.patch \
            file://0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch \
            file://0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch \
-           file://0036-Enable-CET-in-cross-compiler-if-possible.patch \
-           file://0037-mingw32-Enable-operation_not_supported.patch \
-           file://0038-libatomic-Do-not-enforce-march-on-aarch64.patch \
+           file://0036-mingw32-Enable-operation_not_supported.patch \
+           file://0037-libatomic-Do-not-enforce-march-on-aarch64.patch \
            file://0001-aarch64-New-Straight-Line-Speculation-SLS-mitigation.patch \
            file://0002-aarch64-Introduce-SLS-mitigation-for-RET-and-BR-inst.patch \
            file://0003-aarch64-Mitigate-SLS-for-BLR-instruction.patch \
-           file://pr96130.patch \
            file://0001-aarch64-Fix-up-__aarch64_cas16_acq_rel-fallback.patch \
 "
-SRC_URI[sha256sum] = "b6898a23844b656f1b68691c5c012036c2e694ac4b53a8918d4712ad876e7ea2"
+SRC_URI[sha256sum] = "b8dd4368bb9c7f0b98188317ee0254dd8cc99d1e3a18d0ff146c855fe16c1d8c"
 
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
 # For dev release snapshotting
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_10.1.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_10.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-canadian_10.1.bb
rename to meta/recipes-devtools/gcc/gcc-cross-canadian_10.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross_10.1.bb b/meta/recipes-devtools/gcc/gcc-cross_10.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross_10.1.bb
rename to meta/recipes-devtools/gcc/gcc-cross_10.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_10.1.bb b/meta/recipes-devtools/gcc/gcc-crosssdk_10.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk_10.1.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk_10.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_10.1.bb b/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-runtime_10.1.bb
rename to meta/recipes-devtools/gcc/gcc-runtime_10.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_10.1.bb b/meta/recipes-devtools/gcc/gcc-sanitizers_10.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-sanitizers_10.1.bb
rename to meta/recipes-devtools/gcc/gcc-sanitizers_10.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-source_10.1.bb b/meta/recipes-devtools/gcc/gcc-source_10.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-source_10.1.bb
rename to meta/recipes-devtools/gcc/gcc-source_10.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-10.1/0001-aarch64-Fix-up-__aarch64_cas16_acq_rel-fallback.patch b/meta/recipes-devtools/gcc/gcc/0001-aarch64-Fix-up-__aarch64_cas16_acq_rel-fallback.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-10.1/0001-aarch64-Fix-up-__aarch64_cas16_acq_rel-fallback.patch
rename to meta/recipes-devtools/gcc/gcc/0001-aarch64-Fix-up-__aarch64_cas16_acq_rel-fallback.patch
diff --git a/meta/recipes-devtools/gcc/gcc-10.1/0001-aarch64-New-Straight-Line-Speculation-SLS-mitigation.patch b/meta/recipes-devtools/gcc/gcc/0001-aarch64-New-Straight-Line-Speculation-SLS-mitigation.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-10.1/0001-aarch64-New-Straight-Line-Speculation-SLS-mitigation.patch
rename to meta/recipes-devtools/gcc/gcc/0001-aarch64-New-Straight-Line-Speculation-SLS-mitigation.patch
diff --git a/meta/recipes-devtools/gcc/gcc-10.1/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-10.1/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
rename to meta/recipes-devtools/gcc/gcc/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
diff --git a/meta/recipes-devtools/gcc/gcc-10.1/0002-aarch64-Introduce-SLS-mitigation-for-RET-and-BR-inst.patch b/meta/recipes-devtools/gcc/gcc/0002-aarch64-Introduce-SLS-mitigation-for-RET-and-BR-inst.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-10.1/0002-aarch64-Introduce-SLS-mitigation-for-RET-and-BR-inst.patch
rename to meta/recipes-devtools/gcc/gcc/0002-aarch64-Introduce-SLS-mitigation-for-RET-and-BR-inst.patch
diff --git a/meta/recipes-devtools/gcc/gcc-10.1/0002-gcc-poison-system-directories.patch b/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-10.1/0002-gcc-poison-system-directories.patch
rename to meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch
diff --git a/meta/recipes-devtools/gcc/gcc-10.1/0003-aarch64-Mitigate-SLS-for-BLR-instruction.patch b/meta/recipes-devtools/gcc/gcc/0003-aarch64-Mitigate-SLS-for-BLR-instruction.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-10.1/0003-aarch64-Mitigate-SLS-for-BLR-instruction.patch
rename to meta/recipes-devtools/gcc/gcc/0003-aarch64-Mitigate-SLS-for-BLR-instruction.patch
diff --git a/meta/recipes-devtools/gcc/gcc-10.1/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-10.1/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
rename to meta/recipes-devtools/gcc/gcc/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
diff --git a/meta/recipes-devtools/gcc/gcc-10.1/0004-64-bit-multilib-hack.patch b/meta/recipes-devtools/gcc/gcc/0004-64-bit-multilib-hack.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-10.1/0004-64-bit-multilib-hack.patch
rename to meta/recipes-devtools/gcc/gcc/0004-64-bit-multilib-hack.patch
diff --git a/meta/recipes-devtools/gcc/gcc-10.1/0005-optional-libstdc.patch b/meta/recipes-devtools/gcc/gcc/0005-optional-libstdc.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-10.1/0005-optional-libstdc.patch
rename to meta/recipes-devtools/gcc/gcc/0005-optional-libstdc.patch
diff --git a/meta/recipes-devtools/gcc/gcc-10.1/0006-COLLECT_GCC_OPTIONS.patch b/meta/recipes-devtools/gcc/gcc/0006-COLLECT_GCC_OPTIONS.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-10.1/0006-COLLECT_GCC_OPTIONS.patch
rename to meta/recipes-devtools/gcc/gcc/0006-COLLECT_GCC_OPTIONS.patch
diff --git a/meta/recipes-devtools/gcc/gcc-10.1/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch b/meta/recipes-devtools/gcc/gcc/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-10.1/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
rename to meta/recipes-devtools/gcc/gcc/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
diff --git a/meta/recipes-devtools/gcc/gcc-10.1/0008-fortran-cross-compile-hack.patch b/meta/recipes-devtools/gcc/gcc/0008-fortran-cross-compile-hack.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-10.1/0008-fortran-cross-compile-hack.patch
rename to meta/recipes-devtools/gcc/gcc/0008-fortran-cross-compile-hack.patch
diff --git a/meta/recipes-devtools/gcc/gcc-10.1/0009-cpp-honor-sysroot.patch b/meta/recipes-devtools/gcc/gcc/0009-cpp-honor-sysroot.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-10.1/0009-cpp-honor-sysroot.patch
rename to meta/recipes-devtools/gcc/gcc/0009-cpp-honor-sysroot.patch
diff --git a/meta/recipes-devtools/gcc/gcc-10.1/0010-MIPS64-Default-to-N64-ABI.patch b/meta/recipes-devtools/gcc/gcc/0010-MIPS64-Default-to-N64-ABI.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-10.1/0010-MIPS64-Default-to-N64-ABI.patch
rename to meta/recipes-devtools/gcc/gcc/0010-MIPS64-Default-to-N64-ABI.patch
diff --git a/meta/recipes-devtools/gcc/gcc-10.1/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-10.1/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
rename to meta/recipes-devtools/gcc/gcc/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
diff --git a/meta/recipes-devtools/gcc/gcc-10.1/0012-gcc-Fix-argument-list-too-long-error.patch b/meta/recipes-devtools/gcc/gcc/0012-gcc-Fix-argument-list-too-long-error.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-10.1/0012-gcc-Fix-argument-list-too-long-error.patch
rename to meta/recipes-devtools/gcc/gcc/0012-gcc-Fix-argument-list-too-long-error.patch
diff --git a/meta/recipes-devtools/gcc/gcc-10.1/0013-Disable-sdt.patch b/meta/recipes-devtools/gcc/gcc/0013-Disable-sdt.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-10.1/0013-Disable-sdt.patch
rename to meta/recipes-devtools/gcc/gcc/0013-Disable-sdt.patch
diff --git a/meta/recipes-devtools/gcc/gcc-10.1/0014-libtool.patch b/meta/recipes-devtools/gcc/gcc/0014-libtool.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-10.1/0014-libtool.patch
rename to meta/recipes-devtools/gcc/gcc/0014-libtool.patch
diff --git a/meta/recipes-devtools/gcc/gcc-10.1/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch b/meta/recipes-devtools/gcc/gcc/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-10.1/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
rename to meta/recipes-devtools/gcc/gcc/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
diff --git a/meta/recipes-devtools/gcc/gcc-10.1/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch b/meta/recipes-devtools/gcc/gcc/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-10.1/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch
rename to meta/recipes-devtools/gcc/gcc/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch
diff --git a/meta/recipes-devtools/gcc/gcc-10.1/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch b/meta/recipes-devtools/gcc/gcc/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-10.1/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
rename to meta/recipes-devtools/gcc/gcc/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
diff --git a/meta/recipes-devtools/gcc/gcc-10.1/0018-export-CPP.patch b/meta/recipes-devtools/gcc/gcc/0018-export-CPP.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-10.1/0018-export-CPP.patch
rename to meta/recipes-devtools/gcc/gcc/0018-export-CPP.patch
diff --git a/meta/recipes-devtools/gcc/gcc-10.1/0019-Ensure-target-gcc-headers-can-be-included.patch b/meta/recipes-devtools/gcc/gcc/0019-Ensure-target-gcc-headers-can-be-included.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-10.1/0019-Ensure-target-gcc-headers-can-be-included.patch
rename to meta/recipes-devtools/gcc/gcc/0019-Ensure-target-gcc-headers-can-be-included.patch
diff --git a/meta/recipes-devtools/gcc/gcc-10.1/0020-Don-t-search-host-directory-during-relink-if-inst_pr.patch b/meta/recipes-devtools/gcc/gcc/0020-Don-t-search-host-directory-during-relink-if-inst_pr.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-10.1/0020-Don-t-search-host-directory-during-relink-if-inst_pr.patch
rename to meta/recipes-devtools/gcc/gcc/0020-Don-t-search-host-directory-during-relink-if-inst_pr.patch
diff --git a/meta/recipes-devtools/gcc/gcc-10.1/0021-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch b/meta/recipes-devtools/gcc/gcc/0021-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-10.1/0021-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
rename to meta/recipes-devtools/gcc/gcc/0021-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
diff --git a/meta/recipes-devtools/gcc/gcc-10.1/0022-aarch64-Add-support-for-musl-ldso.patch b/meta/recipes-devtools/gcc/gcc/0022-aarch64-Add-support-for-musl-ldso.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-10.1/0022-aarch64-Add-support-for-musl-ldso.patch
rename to meta/recipes-devtools/gcc/gcc/0022-aarch64-Add-support-for-musl-ldso.patch
diff --git a/meta/recipes-devtools/gcc/gcc-10.1/0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch b/meta/recipes-devtools/gcc/gcc/0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-10.1/0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch
rename to meta/recipes-devtools/gcc/gcc/0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch
diff --git a/meta/recipes-devtools/gcc/gcc-10.1/0024-handle-sysroot-support-for-nativesdk-gcc.patch b/meta/recipes-devtools/gcc/gcc/0024-handle-sysroot-support-for-nativesdk-gcc.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-10.1/0024-handle-sysroot-support-for-nativesdk-gcc.patch
rename to meta/recipes-devtools/gcc/gcc/0024-handle-sysroot-support-for-nativesdk-gcc.patch
diff --git a/meta/recipes-devtools/gcc/gcc-10.1/0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch b/meta/recipes-devtools/gcc/gcc/0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-10.1/0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch
rename to meta/recipes-devtools/gcc/gcc/0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch
diff --git a/meta/recipes-devtools/gcc/gcc-10.1/0026-Fix-various-_FOR_BUILD-and-related-variables.patch b/meta/recipes-devtools/gcc/gcc/0026-Fix-various-_FOR_BUILD-and-related-variables.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-10.1/0026-Fix-various-_FOR_BUILD-and-related-variables.patch
rename to meta/recipes-devtools/gcc/gcc/0026-Fix-various-_FOR_BUILD-and-related-variables.patch
diff --git a/meta/recipes-devtools/gcc/gcc-10.1/0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch b/meta/recipes-devtools/gcc/gcc/0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-10.1/0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch
rename to meta/recipes-devtools/gcc/gcc/0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch
diff --git a/meta/recipes-devtools/gcc/gcc-10.1/0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch b/meta/recipes-devtools/gcc/gcc/0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-10.1/0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
rename to meta/recipes-devtools/gcc/gcc/0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
diff --git a/meta/recipes-devtools/gcc/gcc-10.1/0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch b/meta/recipes-devtools/gcc/gcc/0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-10.1/0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
rename to meta/recipes-devtools/gcc/gcc/0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
diff --git a/meta/recipes-devtools/gcc/gcc-10.1/0030-sync-gcc-stddef.h-with-musl.patch b/meta/recipes-devtools/gcc/gcc/0030-sync-gcc-stddef.h-with-musl.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-10.1/0030-sync-gcc-stddef.h-with-musl.patch
rename to meta/recipes-devtools/gcc/gcc/0030-sync-gcc-stddef.h-with-musl.patch
diff --git a/meta/recipes-devtools/gcc/gcc-10.1/0031-fix-segmentation-fault-in-precompiled-header-generat.patch b/meta/recipes-devtools/gcc/gcc/0031-fix-segmentation-fault-in-precompiled-header-generat.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-10.1/0031-fix-segmentation-fault-in-precompiled-header-generat.patch
rename to meta/recipes-devtools/gcc/gcc/0031-fix-segmentation-fault-in-precompiled-header-generat.patch
diff --git a/meta/recipes-devtools/gcc/gcc-10.1/0032-Fix-for-testsuite-failure.patch b/meta/recipes-devtools/gcc/gcc/0032-Fix-for-testsuite-failure.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-10.1/0032-Fix-for-testsuite-failure.patch
rename to meta/recipes-devtools/gcc/gcc/0032-Fix-for-testsuite-failure.patch
diff --git a/meta/recipes-devtools/gcc/gcc-10.1/0033-Re-introduce-spe-commandline-options.patch b/meta/recipes-devtools/gcc/gcc/0033-Re-introduce-spe-commandline-options.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-10.1/0033-Re-introduce-spe-commandline-options.patch
rename to meta/recipes-devtools/gcc/gcc/0033-Re-introduce-spe-commandline-options.patch
diff --git a/meta/recipes-devtools/gcc/gcc-10.1/0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch b/meta/recipes-devtools/gcc/gcc/0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-10.1/0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
rename to meta/recipes-devtools/gcc/gcc/0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
diff --git a/meta/recipes-devtools/gcc/gcc-10.1/0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch b/meta/recipes-devtools/gcc/gcc/0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-10.1/0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
rename to meta/recipes-devtools/gcc/gcc/0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
diff --git a/meta/recipes-devtools/gcc/gcc-10.1/0037-mingw32-Enable-operation_not_supported.patch b/meta/recipes-devtools/gcc/gcc/0036-mingw32-Enable-operation_not_supported.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-10.1/0037-mingw32-Enable-operation_not_supported.patch
rename to meta/recipes-devtools/gcc/gcc/0036-mingw32-Enable-operation_not_supported.patch
diff --git a/meta/recipes-devtools/gcc/gcc-10.1/0038-libatomic-Do-not-enforce-march-on-aarch64.patch b/meta/recipes-devtools/gcc/gcc/0037-libatomic-Do-not-enforce-march-on-aarch64.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-10.1/0038-libatomic-Do-not-enforce-march-on-aarch64.patch
rename to meta/recipes-devtools/gcc/gcc/0037-libatomic-Do-not-enforce-march-on-aarch64.patch
diff --git a/meta/recipes-devtools/gcc/gcc_10.1.bb b/meta/recipes-devtools/gcc/gcc_10.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc_10.1.bb
rename to meta/recipes-devtools/gcc/gcc_10.2.bb
diff --git a/meta/recipes-devtools/gcc/libgcc-initial_10.1.bb b/meta/recipes-devtools/gcc/libgcc-initial_10.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc-initial_10.1.bb
rename to meta/recipes-devtools/gcc/libgcc-initial_10.2.bb
diff --git a/meta/recipes-devtools/gcc/libgcc_10.1.bb b/meta/recipes-devtools/gcc/libgcc_10.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc_10.1.bb
rename to meta/recipes-devtools/gcc/libgcc_10.2.bb
diff --git a/meta/recipes-devtools/gcc/libgfortran_10.1.bb b/meta/recipes-devtools/gcc/libgfortran_10.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgfortran_10.1.bb
rename to meta/recipes-devtools/gcc/libgfortran_10.2.bb
-- 
2.28.0

