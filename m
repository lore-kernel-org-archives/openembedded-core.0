Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web08.168.1617139827939363660
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Mar 2021 14:30:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=r+UwZudw;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id w11so6835637ply.6
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Mar 2021 14:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S1usJR7BAbULtPoKpQBijLHeB7quResmgWIA3wz8Oec=;
        b=r+UwZudw8MSyflhXG55rRWRpxkyHcgV6EQn6CwjFooJcj3zREOOvgGP1OzZ/4vUDnM
         xOvvZLclKMNLwtAUEayH8tS2fF7Lyhi6u1IELL3zvJRThbnBAfpS2uJP7OFMwAMwpR4h
         hKGyWklfAE/UaMRQhvP3mj2x1nMsXd/IX7ivxDuZYR/XO8jVsce8I3BbZjy483z+gr4L
         BjRCIUG/ks8dOsqtTRj47n2H9IbNdRYfocxWoo9g+rRkxl0s9UhTfZzVPLve4a/UGj0K
         pwLzRPGXBx7WhbQfwO5zIipqSWJzEcA7kWhv2+N9JQmAznfMSY4dZBRpk7r7BKnwtUAB
         yt+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S1usJR7BAbULtPoKpQBijLHeB7quResmgWIA3wz8Oec=;
        b=EzfFIdXZ0aQRt7q72OiBZbCaQU0D8iQ0dLBzHMiqRVmKvCOkbiXgOouKhFtqg/VI+t
         QIXYSaOQN+R6q3hny2+KCZ5c5ZPkPY3Gkglu5k/+QzQzWPqjU7F6nhH5nY+Ad0OJL6cF
         EZnCVN3kBkedq5iZ4b5u285+VuOijJ8H4Fq/jFkE0Jc6oGVMPNEq6cfx7juqW17yhevl
         WsTBsrMYM1XhGOm7MNabm3aleY+GafcTHV/3GyfM/odNViOjUu8uoEKySP3dIlvGxNEh
         EUbmzzXzqi5huFQt8hUC1Neo8jrXEvPjHqEPlQeIryYDqsadm/TaguUK9elqMkMnSQNo
         hKFA==
X-Gm-Message-State: AOAM532xfPRCkYV8NY28gW9o0kX8uAAiRltMefocfdsfb4jHRz8tGZ0X
	eOJXXmzrhIIhF7AQWjoWJ+lGO8XN2xp48A==
X-Google-Smtp-Source: ABdhPJxNibNUxwhXI0ZXrze89o5INFnCbtIXg5uAYsGRUTZvoxc4FrwTpeMNxcAn+mN2orBLlZrHlQ==
X-Received: by 2002:a17:902:e986:b029:e6:bffd:f465 with SMTP id f6-20020a170902e986b02900e6bffdf465mr263335plb.35.1617139826102;
        Tue, 30 Mar 2021 14:30:26 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ae20])
        by smtp.gmail.com with ESMTPSA id j30sm144875pgm.59.2021.03.30.14.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 14:30:25 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] gcc: Upgrade to GCC 11
Date: Tue, 30 Mar 2021 14:30:18 -0700
Message-Id: <20210330213019.2300696-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210330213019.2300696-1-raj.khem@gmail.com>
References: <20210330213019.2300696-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop already upstream/backported patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 .../gcc/{gcc-10.2.inc => gcc-11.0.inc}        |  23 +-
 ...ian_10.2.bb => gcc-cross-canadian_11.0.bb} |   0
 .../{gcc-cross_10.2.bb => gcc-cross_11.0.bb}  |   0
 ...-crosssdk_10.2.bb => gcc-crosssdk_11.0.bb} |   0
 ...cc-runtime_10.2.bb => gcc-runtime_11.0.bb} |   0
 ...itizers_10.2.bb => gcc-sanitizers_11.0.bb} |   0
 ...{gcc-source_10.2.bb => gcc-source_11.0.bb} |   0
 ...-up-__aarch64_cas16_acq_rel-fallback.patch |  66 --
 ...ight-Line-Speculation-SLS-mitigation.patch | 202 ------
 ...0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch |  10 +-
 ...libgomp-libitc-Fix-bootstrap-PR70454.patch | 208 ------
 ...e-SLS-mitigation-for-RET-and-BR-inst.patch | 607 ----------------
 .../0002-gcc-poison-system-directories.patch  |  55 +-
 ...h64-Mitigate-SLS-for-BLR-instruction.patch | 658 ------------------
 ...-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |   6 +-
 .../gcc/gcc/0004-64-bit-multilib-hack.patch   |  10 +-
 .../gcc/gcc/0005-optional-libstdc.patch       |  26 +-
 .../gcc/gcc/0006-COLLECT_GCC_OPTIONS.patch    |   6 +-
 ...ts.h-in-B-instead-of-S-and-t-oe-in-B.patch |  16 +-
 .../gcc/0008-fortran-cross-compile-hack.patch |  10 +-
 .../gcc/gcc/0009-cpp-honor-sysroot.patch      |  14 +-
 .../gcc/0010-MIPS64-Default-to-N64-ABI.patch  |   6 +-
 ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |  32 +-
 ...gcc-Fix-argument-list-too-long-error.patch |  11 +-
 .../gcc/gcc/0013-Disable-sdt.patch            |  18 +-
 .../gcc/gcc/0014-libtool.patch                |   2 +-
 ...s-fix-v4bx-to-linker-to-support-EABI.patch |   4 +-
 ...-config-files-from-B-instead-of-usin.patch |  14 +-
 ...ir-from-.la-which-usually-points-to-.patch |   2 +-
 .../gcc/gcc/0018-export-CPP.patch             |   4 +-
 ...e-target-gcc-headers-can-be-included.patch |  12 +-
 ...t-directory-during-relink-if-inst_pr.patch |   2 +-
 ...IR-replacement-instead-of-hardcoding.patch |   4 +-
 ...22-aarch64-Add-support-for-musl-ldso.patch |   4 +-
 ...-fix-libcc1-s-install-path-and-rpath.patch |  10 +-
 ...le-sysroot-support-for-nativesdk-gcc.patch |  44 +-
 ...sroot-gcc-version-specific-dirs-with.patch |   8 +-
 ...ous-_FOR_BUILD-and-related-variables.patch |  18 +-
 ...027-nios2-Define-MUSL_DYNAMIC_LINKER.patch |   4 +-
 ...d-to-link-commandline-for-musl-targe.patch |  10 +-
 ...using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch |   4 +-
 .../0030-sync-gcc-stddef.h-with-musl.patch    |   4 +-
 ...-fault-in-precompiled-header-generat.patch |   6 +-
 .../gcc/0032-Fix-for-testsuite-failure.patch  |   2 +-
 ...Re-introduce-spe-commandline-options.patch |  13 +-
 ...as-for-__cpu_indicator_init-instead-.patch |  12 +-
 ...s-Do-not-use-__LINE__-for-maintainin.patch |  34 +-
 ...ngw32-Enable-operation_not_supported.patch |   8 +-
 ...omic-Do-not-enforce-march-on-aarch64.patch |   8 +-
 .../gcc/{gcc_10.2.bb => gcc_11.0.bb}          |   0
 ...initial_10.2.bb => libgcc-initial_11.0.bb} |   0
 .../gcc/{libgcc_10.2.bb => libgcc_11.0.bb}    |   0
 ...ibgfortran_10.2.bb => libgfortran_11.0.bb} |   0
 54 files changed, 236 insertions(+), 1983 deletions(-)
 rename meta/recipes-devtools/gcc/{gcc-10.2.inc => gcc-11.0.inc} (82%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_10.2.bb => gcc-cross-canadian_11.0.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_10.2.bb => gcc-cross_11.0.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_10.2.bb => gcc-crosssdk_11.0.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_10.2.bb => gcc-runtime_11.0.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_10.2.bb => gcc-sanitizers_11.0.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_10.2.bb => gcc-source_11.0.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0001-aarch64-Fix-up-__aarch64_cas16_acq_rel-fallback.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0001-aarch64-New-Straight-Line-Speculation-SLS-mitigation.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0001-libatomic-libgomp-libitc-Fix-bootstrap-PR70454.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0002-aarch64-Introduce-SLS-mitigation-for-RET-and-BR-inst.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0003-aarch64-Mitigate-SLS-for-BLR-instruction.patch
 rename meta/recipes-devtools/gcc/{gcc_10.2.bb => gcc_11.0.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_10.2.bb => libgcc-initial_11.0.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_10.2.bb => libgcc_11.0.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_10.2.bb => libgfortran_11.0.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 76ada982f9..594108ec1c 100644
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
diff --git a/meta/recipes-devtools/gcc/gcc-10.2.inc b/meta/recipes-devtools/gcc/gcc-11.0.inc
similarity index 82%
rename from meta/recipes-devtools/gcc/gcc-10.2.inc
rename to meta/recipes-devtools/gcc/gcc-11.0.inc
index c0cd8b31d5..9e8c41d316 100644
--- a/meta/recipes-devtools/gcc/gcc-10.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.0.inc
@@ -2,11 +2,11 @@ require gcc-common.inc
 
 # Third digit in PV should be incremented after a minor release
 
-PV = "10.2.0"
+PV = "11.0.1"
 
 # BINV should be incremented to a revision after a minor gcc release
 
-BINV = "10.2.0"
+BINV = "11.0.1"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
 
@@ -23,9 +23,9 @@ LIC_FILES_CHKSUM = "\
     file://COPYING.RUNTIME;md5=fe60d87048567d4fe8c8a0ed2448bcc8 \
 "
 
-BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
-#RELEASE ?= "93a49d2d2292893b9b7f38132df949c70942838c"
-#BASEURI ?= "https://github.com/gcc-mirror/gcc/archive/${RELEASE}.zip;downloadfilename=gcc-${PV}-${RELEASE}.zip"
+RELEASE ?= "5a5d23010ab8ecbefd443054d9a3ec227aceb976"
+BASEURI ?= "https://github.com/gcc-mirror/gcc/archive/${RELEASE}.zip;downloadfilename=gcc-${PV}-${RELEASE}.zip"
+#BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
 SRC_URI = "\
            ${BASEURI} \
            file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
@@ -65,18 +65,13 @@ SRC_URI = "\
            file://0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch \
            file://0036-mingw32-Enable-operation_not_supported.patch \
            file://0037-libatomic-Do-not-enforce-march-on-aarch64.patch \
-           file://0001-aarch64-New-Straight-Line-Speculation-SLS-mitigation.patch \
-           file://0002-aarch64-Introduce-SLS-mitigation-for-RET-and-BR-inst.patch \
-           file://0003-aarch64-Mitigate-SLS-for-BLR-instruction.patch \
-           file://0001-aarch64-Fix-up-__aarch64_cas16_acq_rel-fallback.patch \
-           file://0001-libatomic-libgomp-libitc-Fix-bootstrap-PR70454.patch \
 "
-SRC_URI[sha256sum] = "b8dd4368bb9c7f0b98188317ee0254dd8cc99d1e3a18d0ff146c855fe16c1d8c"
+SRC_URI[sha256sum] = "4e63b4fed2adc57879172decae18f8803cb6ab53433c123a69936260e8083205"
 
-S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
+#S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
 # For dev release snapshotting
-#S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${RELEASE}"
-#B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
+S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${RELEASE}"
+B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
 
 # Language Overrides
 FORTRAN = ""
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_10.2.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_11.0.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-canadian_10.2.bb
rename to meta/recipes-devtools/gcc/gcc-cross-canadian_11.0.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross_10.2.bb b/meta/recipes-devtools/gcc/gcc-cross_11.0.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross_10.2.bb
rename to meta/recipes-devtools/gcc/gcc-cross_11.0.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_10.2.bb b/meta/recipes-devtools/gcc/gcc-crosssdk_11.0.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk_10.2.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk_11.0.bb
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb b/meta/recipes-devtools/gcc/gcc-runtime_11.0.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-runtime_10.2.bb
rename to meta/recipes-devtools/gcc/gcc-runtime_11.0.bb
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_10.2.bb b/meta/recipes-devtools/gcc/gcc-sanitizers_11.0.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-sanitizers_10.2.bb
rename to meta/recipes-devtools/gcc/gcc-sanitizers_11.0.bb
diff --git a/meta/recipes-devtools/gcc/gcc-source_10.2.bb b/meta/recipes-devtools/gcc/gcc-source_11.0.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-source_10.2.bb
rename to meta/recipes-devtools/gcc/gcc-source_11.0.bb
diff --git a/meta/recipes-devtools/gcc/gcc/0001-aarch64-Fix-up-__aarch64_cas16_acq_rel-fallback.patch b/meta/recipes-devtools/gcc/gcc/0001-aarch64-Fix-up-__aarch64_cas16_acq_rel-fallback.patch
deleted file mode 100644
index c060accd99..0000000000
--- a/meta/recipes-devtools/gcc/gcc/0001-aarch64-Fix-up-__aarch64_cas16_acq_rel-fallback.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From fd2ec4542fd2975e6d3f2f1c1a2639945a84f9e1 Mon Sep 17 00:00:00 2001
-From: Jakub Jelinek <jakub@redhat.com>
-Date: Mon, 3 Aug 2020 22:55:28 +0200
-Subject: [PATCH] aarch64: Fix up __aarch64_cas16_acq_rel fallback
-
-As mentioned in the PR, the fallback path when LSE is unavailable writes
-incorrect registers to the memory if the previous content compares equal
-to x0, x1 - it writes copy of x0, x1 from the start of function, but it
-should write x2, x3.
-
-2020-08-03  Jakub Jelinek  <jakub@redhat.com>
-
-	PR target/96402
-	* config/aarch64/lse.S (__aarch64_cas16_acq_rel): Use x2, x3 instead
-	of x(tmp0), x(tmp1) in STXP arguments.
-
-	* gcc.target/aarch64/pr96402.c: New test.
-
-(cherry picked from commit 90b43856fdff7d96d93d22970eca8a86c56e0ddc)
----
- gcc/testsuite/gcc.target/aarch64/pr96402.c | 16 ++++++++++++++++
- libgcc/config/aarch64/lse.S                |  2 +-
- 2 files changed, 17 insertions(+), 1 deletion(-)
- create mode 100644 gcc/testsuite/gcc.target/aarch64/pr96402.c
-
-diff --git a/gcc/testsuite/gcc.target/aarch64/pr96402.c b/gcc/testsuite/gcc.target/aarch64/pr96402.c
-new file mode 100644
-index 00000000000..fa2dddfac15
---- /dev/null
-+++ b/gcc/testsuite/gcc.target/aarch64/pr96402.c
-@@ -0,0 +1,16 @@
-+/* PR target/96402 */
-+/* { dg-do run { target int128 } } */
-+/* { dg-options "-moutline-atomics" } */
-+
-+int
-+main ()
-+{
-+  __int128 a = 0;
-+  __sync_val_compare_and_swap (&a, (__int128) 0, (__int128) 1);
-+  if (a != 1)
-+    __builtin_abort ();
-+  __sync_val_compare_and_swap (&a, (__int128) 1, (((__int128) 0xdeadbeeffeedbac1ULL) << 64) | 0xabadcafe00c0ffeeULL);
-+  if (a != ((((__int128) 0xdeadbeeffeedbac1ULL) << 64) | 0xabadcafe00c0ffeeULL))
-+    __builtin_abort ();
-+  return 0;
-+}
-diff --git a/libgcc/config/aarch64/lse.S b/libgcc/config/aarch64/lse.S
-index 64691c601c1..c8fbfbce4fd 100644
---- a/libgcc/config/aarch64/lse.S
-+++ b/libgcc/config/aarch64/lse.S
-@@ -203,7 +203,7 @@ STARTFN	NAME(cas)
- 	cmp		x0, x(tmp0)
- 	ccmp		x1, x(tmp1), #0, eq
- 	bne		1f
--	STXP		w(tmp2), x(tmp0), x(tmp1), [x4]
-+	STXP		w(tmp2), x2, x3, [x4]
- 	cbnz		w(tmp2), 0b
- 1:	ret
- 
--- 
-2.26.2
-
diff --git a/meta/recipes-devtools/gcc/gcc/0001-aarch64-New-Straight-Line-Speculation-SLS-mitigation.patch b/meta/recipes-devtools/gcc/gcc/0001-aarch64-New-Straight-Line-Speculation-SLS-mitigation.patch
deleted file mode 100644
index 73de4c7590..0000000000
--- a/meta/recipes-devtools/gcc/gcc/0001-aarch64-New-Straight-Line-Speculation-SLS-mitigation.patch
+++ /dev/null
@@ -1,202 +0,0 @@
-CVE: CVE-2020-13844
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 1ff243934ac443b5f58cd02a5012ce58ecc31fb2 Mon Sep 17 00:00:00 2001
-From: Matthew Malcomson <matthew.malcomson@arm.com>
-Date: Thu, 9 Jul 2020 09:11:58 +0100
-Subject: [PATCH 1/3] aarch64: New Straight Line Speculation (SLS) mitigation
- flags
-
-Here we introduce the flags that will be used for straight line speculation.
-
-The new flag introduced is `-mharden-sls=`.
-This flag can take arguments of `none`, `all`, or a comma seperated list of one
-or more of `retbr` or `blr`.
-`none` indicates no special mitigation of the straight line speculation
-vulnerability.
-`all` requests all mitigations currently implemented.
-`retbr` requests that the RET and BR instructions have a speculation barrier
-inserted after them.
-`blr` requests that BLR instructions are replaced by a BL to a function stub
-using a BR with a speculation barrier after it.
-
-Setting this on a per-function basis using attributes or the like is not
-enabled, but may be in the future.
-
-gcc/ChangeLog:
-
-2020-06-02  Matthew Malcomson  <matthew.malcomson@arm.com>
-
-	* config/aarch64/aarch64-protos.h (aarch64_harden_sls_retbr_p):
-	New.
-	(aarch64_harden_sls_blr_p): New.
-	* config/aarch64/aarch64.c (enum aarch64_sls_hardening_type):
-	New.
-	(aarch64_harden_sls_retbr_p): New.
-	(aarch64_harden_sls_blr_p): New.
-	(aarch64_validate_sls_mitigation): New.
-	(aarch64_override_options): Parse options for SLS mitigation.
-	* config/aarch64/aarch64.opt (-mharden-sls): New option.
-	* doc/invoke.texi: Document new option.
----
- gcc/config/aarch64/aarch64-protos.h |  3 ++
- gcc/config/aarch64/aarch64.c        | 76 +++++++++++++++++++++++++++++++++++++
- gcc/config/aarch64/aarch64.opt      |  4 ++
- gcc/doc/invoke.texi                 | 12 ++++++
- 4 files changed, 95 insertions(+)
-
-diff --git a/gcc/config/aarch64/aarch64-protos.h b/gcc/config/aarch64/aarch64-protos.h
-index 723d9ba..eb5f4b4 100644
---- a/gcc/config/aarch64/aarch64-protos.h
-+++ b/gcc/config/aarch64/aarch64-protos.h
-@@ -781,4 +781,7 @@ extern const atomic_ool_names aarch64_ool_ldeor_names;
- 
- tree aarch64_resolve_overloaded_builtin_general (location_t, tree, void *);
- 
-+extern bool aarch64_harden_sls_retbr_p (void);
-+extern bool aarch64_harden_sls_blr_p (void);
-+
- #endif /* GCC_AARCH64_PROTOS_H */
-diff --git a/gcc/config/aarch64/aarch64.c b/gcc/config/aarch64/aarch64.c
-index b86434a..437a9cf 100644
---- a/gcc/config/aarch64/aarch64.c
-+++ b/gcc/config/aarch64/aarch64.c
-@@ -14494,6 +14494,79 @@ aarch64_validate_mcpu (const char *str, const struct processor **res,
-   return false;
- }
- 
-+/* Straight line speculation indicators.  */
-+enum aarch64_sls_hardening_type
-+{
-+  SLS_NONE = 0,
-+  SLS_RETBR = 1,
-+  SLS_BLR = 2,
-+  SLS_ALL = 3,
-+};
-+static enum aarch64_sls_hardening_type aarch64_sls_hardening;
-+
-+/* Return whether we should mitigatate Straight Line Speculation for the RET
-+   and BR instructions.  */
-+bool
-+aarch64_harden_sls_retbr_p (void)
-+{
-+  return aarch64_sls_hardening & SLS_RETBR;
-+}
-+
-+/* Return whether we should mitigatate Straight Line Speculation for the BLR
-+   instruction.  */
-+bool
-+aarch64_harden_sls_blr_p (void)
-+{
-+  return aarch64_sls_hardening & SLS_BLR;
-+}
-+
-+/* As of yet we only allow setting these options globally, in the future we may
-+   allow setting them per function.  */
-+static void
-+aarch64_validate_sls_mitigation (const char *const_str)
-+{
-+  char *token_save = NULL;
-+  char *str = NULL;
-+
-+  if (strcmp (const_str, "none") == 0)
-+    {
-+      aarch64_sls_hardening = SLS_NONE;
-+      return;
-+    }
-+  if (strcmp (const_str, "all") == 0)
-+    {
-+      aarch64_sls_hardening = SLS_ALL;
-+      return;
-+    }
-+
-+  char *str_root = xstrdup (const_str);
-+  str = strtok_r (str_root, ",", &token_save);
-+  if (!str)
-+    error ("invalid argument given to %<-mharden-sls=%>");
-+
-+  int temp = SLS_NONE;
-+  while (str)
-+    {
-+      if (strcmp (str, "blr") == 0)
-+	temp |= SLS_BLR;
-+      else if (strcmp (str, "retbr") == 0)
-+	temp |= SLS_RETBR;
-+      else if (strcmp (str, "none") == 0 || strcmp (str, "all") == 0)
-+	{
-+	  error ("%<%s%> must be by itself for %<-mharden-sls=%>", str);
-+	  break;
-+	}
-+      else
-+	{
-+	  error ("invalid argument %<%s%> for %<-mharden-sls=%>", str);
-+	  break;
-+	}
-+      str = strtok_r (NULL, ",", &token_save);
-+    }
-+  aarch64_sls_hardening = (aarch64_sls_hardening_type) temp;
-+  free (str_root);
-+}
-+
- /* Parses CONST_STR for branch protection features specified in
-    aarch64_branch_protect_types, and set any global variables required.  Returns
-    the parsing result and assigns LAST_STR to the last processed token from
-@@ -14738,6 +14811,9 @@ aarch64_override_options (void)
-   selected_arch = NULL;
-   selected_tune = NULL;
- 
-+  if (aarch64_harden_sls_string)
-+    aarch64_validate_sls_mitigation (aarch64_harden_sls_string);
-+
-   if (aarch64_branch_protection_string)
-     aarch64_validate_mbranch_protection (aarch64_branch_protection_string);
- 
-diff --git a/gcc/config/aarch64/aarch64.opt b/gcc/config/aarch64/aarch64.opt
-index d99d14c..5170361 100644
---- a/gcc/config/aarch64/aarch64.opt
-+++ b/gcc/config/aarch64/aarch64.opt
-@@ -71,6 +71,10 @@ mgeneral-regs-only
- Target Report RejectNegative Mask(GENERAL_REGS_ONLY) Save
- Generate code which uses only the general registers.
- 
-+mharden-sls=
-+Target RejectNegative Joined Var(aarch64_harden_sls_string)
-+Generate code to mitigate against straight line speculation.
-+
- mfix-cortex-a53-835769
- Target Report Var(aarch64_fix_a53_err835769) Init(2) Save
- Workaround for ARM Cortex-A53 Erratum number 835769.
-diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
-index a2794a6..bd5b77a 100644
---- a/gcc/doc/invoke.texi
-+++ b/gcc/doc/invoke.texi
-@@ -696,6 +696,7 @@ Objective-C and Objective-C++ Dialects}.
- -msign-return-address=@var{scope} @gol
- -mbranch-protection=@var{none}|@var{standard}|@var{pac-ret}[+@var{leaf}
- +@var{b-key}]|@var{bti} @gol
-+-mharden-sls=@var{opts} @gol
- -march=@var{name}  -mcpu=@var{name}  -mtune=@var{name}  @gol
- -moverride=@var{string}  -mverbose-cost-dump @gol
- -mstack-protector-guard=@var{guard} -mstack-protector-guard-reg=@var{sysreg} @gol
-@@ -17065,6 +17066,17 @@ functions.  The optional argument @samp{b-key} can be used to sign the functions
- with the B-key instead of the A-key.
- @samp{bti} turns on branch target identification mechanism.
- 
-+@item -mharden-sls=@var{opts}
-+@opindex mharden-sls
-+Enable compiler hardening against straight line speculation (SLS).
-+@var{opts} is a comma-separated list of the following options:
-+@table @samp
-+@item retbr
-+@item blr
-+@end table
-+In addition, @samp{-mharden-sls=all} enables all SLS hardening while
-+@samp{-mharden-sls=none} disables all SLS hardening.
-+
- @item -msve-vector-bits=@var{bits}
- @opindex msve-vector-bits
- Specify the number of bits in an SVE vector register.  This option only has
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/gcc/gcc/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
index 82ae9f8d14..0a108ee51b 100644
--- a/meta/recipes-devtools/gcc/gcc/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
+++ b/meta/recipes-devtools/gcc/gcc/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
@@ -1,4 +1,4 @@
-From f2a5dc3bc7e5727d6bf77e1c6e8a31a6f000883d Mon Sep 17 00:00:00 2001
+From 368eaf1846733a9920c7cf5bc547a377e7167785 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 08:37:11 +0400
 Subject: [PATCH] gcc-4.3.1: ARCH_FLAGS_FOR_TARGET
@@ -12,10 +12,10 @@ Upstream-Status: Inappropriate [embedded specific]
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure b/configure
-index 4cc938ebb7d..226a64939d1 100755
+index 504f6410274..bcebad264ec 100755
 --- a/configure
 +++ b/configure
-@@ -7722,7 +7722,7 @@ fi
+@@ -9728,7 +9728,7 @@ fi
  # for target_alias and gcc doesn't manage it consistently.
  target_configargs="--cache-file=./config.cache ${target_configargs}"
  
@@ -25,10 +25,10 @@ index 4cc938ebb7d..226a64939d1 100755
   *" newlib "*)
    case " $target_configargs " in
 diff --git a/configure.ac b/configure.ac
-index c78d9cbea62..f024f4bac9b 100644
+index 088e735c5db..1289fe08760 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3227,7 +3227,7 @@ fi
+@@ -3240,7 +3240,7 @@ fi
  # for target_alias and gcc doesn't manage it consistently.
  target_configargs="--cache-file=./config.cache ${target_configargs}"
  
diff --git a/meta/recipes-devtools/gcc/gcc/0001-libatomic-libgomp-libitc-Fix-bootstrap-PR70454.patch b/meta/recipes-devtools/gcc/gcc/0001-libatomic-libgomp-libitc-Fix-bootstrap-PR70454.patch
deleted file mode 100644
index addecb4bd8..0000000000
--- a/meta/recipes-devtools/gcc/gcc/0001-libatomic-libgomp-libitc-Fix-bootstrap-PR70454.patch
+++ /dev/null
@@ -1,208 +0,0 @@
-From 2824d2418605e092899117e77bc8ebf332321807 Mon Sep 17 00:00:00 2001
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
----
- libatomic/configure.tgt | 56 +++++++++++++++++++++++------------------
- libgomp/configure.tgt   | 35 +++++++++++---------------
- libitm/configure.tgt    | 37 +++++++++++++--------------
- 3 files changed, 64 insertions(+), 64 deletions(-)
-
-diff --git a/libatomic/configure.tgt b/libatomic/configure.tgt
-index 5dd0926d20..6ea082a29b 100644
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
-index 4790a31e39..761ef2a7db 100644
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
-index 04109160e9..ca62bac627 100644
---- a/libitm/configure.tgt
-+++ b/libitm/configure.tgt
-@@ -58,16 +58,23 @@ case "${target_cpu}" in
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
-@@ -102,16 +109,6 @@ case "${target_cpu}" in
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
diff --git a/meta/recipes-devtools/gcc/gcc/0002-aarch64-Introduce-SLS-mitigation-for-RET-and-BR-inst.patch b/meta/recipes-devtools/gcc/gcc/0002-aarch64-Introduce-SLS-mitigation-for-RET-and-BR-inst.patch
deleted file mode 100644
index 823cc8b668..0000000000
--- a/meta/recipes-devtools/gcc/gcc/0002-aarch64-Introduce-SLS-mitigation-for-RET-and-BR-inst.patch
+++ /dev/null
@@ -1,607 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From b1204d16e1ec96a4aa89e44de8990e2499ffdb22 Mon Sep 17 00:00:00 2001
-From: Matthew Malcomson <matthew.malcomson@arm.com>
-Date: Thu, 9 Jul 2020 09:11:59 +0100
-Subject: [PATCH 2/3] aarch64: Introduce SLS mitigation for RET and BR
- instructions
-
-Instructions following RET or BR are not necessarily executed.  In order
-to avoid speculation past RET and BR we can simply append a speculation
-barrier.
-
-Since these speculation barriers will not be architecturally executed,
-they are not expected to add a high performance penalty.
-
-The speculation barrier is to be SB when targeting architectures which
-have this enabled, and DSB SY + ISB otherwise.
-
-We add tests for each of the cases where such an instruction was seen.
-
-This is implemented by modifying each machine description pattern that
-emits either a RET or a BR instruction.  We choose not to use something
-like `TARGET_ASM_FUNCTION_EPILOGUE` since it does not affect the
-`indirect_jump`, `jump`, `sibcall_insn` and `sibcall_value_insn`
-patterns and we find it preferable to implement the functionality in the
-same way for every pattern.
-
-There is one particular case which is slightly tricky.  The
-implementation of TARGET_ASM_TRAMPOLINE_TEMPLATE uses a BR which needs
-to be mitigated against.  The trampoline template is used *once* per
-compilation unit, and the TRAMPOLINE_SIZE is exposed to the user via the
-builtin macro __LIBGCC_TRAMPOLINE_SIZE__.
-In the future we may implement function specific attributes to turn on
-and off hardening on a per-function basis.
-The fixed nature of the trampoline described above implies it will be
-safer to ensure this speculation barrier is always used.
-
-Testing:
-  Bootstrap and regtest done on aarch64-none-linux
-  Used a temporary hack(1) to use these options on every test in the
-  testsuite and a script to check that the output never emitted an
-  unmitigated RET or BR.
-
-1) Temporary hack was a change to the testsuite to always use
-`-save-temps` and run a script on the assembly output of those
-compilations which produced one to ensure every RET or BR is immediately
-followed by a speculation barrier.
-
-gcc/ChangeLog:
-
-	* config/aarch64/aarch64-protos.h (aarch64_sls_barrier): New.
-	* config/aarch64/aarch64.c (aarch64_output_casesi): Emit
-	speculation barrier after BR instruction if needs be.
-	(aarch64_trampoline_init): Handle ptr_mode value & adjust size
-	of code copied.
-	(aarch64_sls_barrier): New.
-	(aarch64_asm_trampoline_template): Add needed barriers.
-	* config/aarch64/aarch64.h (AARCH64_ISA_SB): New.
-	(TARGET_SB): New.
-	(TRAMPOLINE_SIZE): Account for barrier.
-	* config/aarch64/aarch64.md (indirect_jump, *casesi_dispatch,
-	simple_return, *do_return, *sibcall_insn, *sibcall_value_insn):
-	Emit barrier if needs be, also account for possible barrier using
-	"sls_length" attribute.
-	(sls_length): New attribute.
-	(length): Determine default using any non-default sls_length
-	value.
-
-gcc/testsuite/ChangeLog:
-
-	* gcc.target/aarch64/sls-mitigation/sls-miti-retbr.c: New test.
-	* gcc.target/aarch64/sls-mitigation/sls-miti-retbr-pacret.c:
-	New test.
-	* gcc.target/aarch64/sls-mitigation/sls-mitigation.exp: New file.
-	* lib/target-supports.exp (check_effective_target_aarch64_asm_sb_ok):
-	New proc.
----
- gcc/config/aarch64/aarch64-protos.h                |   1 +
- gcc/config/aarch64/aarch64.c                       |  41 ++++++-
- gcc/config/aarch64/aarch64.h                       |  10 +-
- gcc/config/aarch64/aarch64.md                      |  76 +++++++++----
- .../aarch64/sls-mitigation/sls-miti-retbr-pacret.c |  21 ++++
- .../aarch64/sls-mitigation/sls-miti-retbr.c        | 119 +++++++++++++++++++++
- .../aarch64/sls-mitigation/sls-mitigation.exp      |  73 +++++++++++++
- gcc/testsuite/lib/target-supports.exp              |   2 +-
- 8 files changed, 318 insertions(+), 25 deletions(-)
- create mode 100644 gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-retbr-pacret.c
- create mode 100644 gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-retbr.c
- create mode 100644 gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-mitigation.exp
-
-diff --git a/gcc/config/aarch64/aarch64-protos.h b/gcc/config/aarch64/aarch64-protos.h
-index eb5f4b4..ee0ffde 100644
---- a/gcc/config/aarch64/aarch64-protos.h
-+++ b/gcc/config/aarch64/aarch64-protos.h
-@@ -781,6 +781,7 @@ extern const atomic_ool_names aarch64_ool_ldeor_names;
- 
- tree aarch64_resolve_overloaded_builtin_general (location_t, tree, void *);
- 
-+const char *aarch64_sls_barrier (int);
- extern bool aarch64_harden_sls_retbr_p (void);
- extern bool aarch64_harden_sls_blr_p (void);
- 
-diff --git a/gcc/config/aarch64/aarch64.c b/gcc/config/aarch64/aarch64.c
-index 437a9cf..44e3d1f 100644
---- a/gcc/config/aarch64/aarch64.c
-+++ b/gcc/config/aarch64/aarch64.c
-@@ -10852,8 +10852,8 @@ aarch64_return_addr (int count, rtx frame ATTRIBUTE_UNUSED)
- static void
- aarch64_asm_trampoline_template (FILE *f)
- {
--  int offset1 = 16;
--  int offset2 = 20;
-+  int offset1 = 24;
-+  int offset2 = 28;
- 
-   if (aarch64_bti_enabled ())
-     {
-@@ -10876,6 +10876,17 @@ aarch64_asm_trampoline_template (FILE *f)
-     }
-   asm_fprintf (f, "\tbr\t%s\n", reg_names [IP1_REGNUM]);
- 
-+  /* We always emit a speculation barrier.
-+     This is because the same trampoline template is used for every nested
-+     function.  Since nested functions are not particularly common or
-+     performant we don't worry too much about the extra instructions to copy
-+     around.
-+     This is not yet a problem, since we have not yet implemented function
-+     specific attributes to choose between hardening against straight line
-+     speculation or not, but such function specific attributes are likely to
-+     happen in the future.  */
-+  asm_fprintf (f, "\tdsb\tsy\n\tisb\n");
-+
-   /* The trampoline needs an extra padding instruction.  In case if BTI is
-      enabled the padding instruction is replaced by the BTI instruction at
-      the beginning.  */
-@@ -10890,10 +10901,14 @@ static void
- aarch64_trampoline_init (rtx m_tramp, tree fndecl, rtx chain_value)
- {
-   rtx fnaddr, mem, a_tramp;
--  const int tramp_code_sz = 16;
-+  const int tramp_code_sz = 24;
- 
-   /* Don't need to copy the trailing D-words, we fill those in below.  */
--  emit_block_move (m_tramp, assemble_trampoline_template (),
-+  /* We create our own memory address in Pmode so that `emit_block_move` can
-+     use parts of the backend which expect Pmode addresses.  */
-+  rtx temp = convert_memory_address (Pmode, XEXP (m_tramp, 0));
-+  emit_block_move (gen_rtx_MEM (BLKmode, temp),
-+		   assemble_trampoline_template (),
- 		   GEN_INT (tramp_code_sz), BLOCK_OP_NORMAL);
-   mem = adjust_address (m_tramp, ptr_mode, tramp_code_sz);
-   fnaddr = XEXP (DECL_RTL (fndecl), 0);
-@@ -11084,6 +11099,8 @@ aarch64_output_casesi (rtx *operands)
-   output_asm_insn (buf, operands);
-   output_asm_insn (patterns[index][1], operands);
-   output_asm_insn ("br\t%3", operands);
-+  output_asm_insn (aarch64_sls_barrier (aarch64_harden_sls_retbr_p ()),
-+		   operands);
-   assemble_label (asm_out_file, label);
-   return "";
- }
-@@ -22924,6 +22941,22 @@ aarch64_file_end_indicate_exec_stack ()
- #undef GNU_PROPERTY_AARCH64_FEATURE_1_BTI
- #undef GNU_PROPERTY_AARCH64_FEATURE_1_AND
- 
-+/* Helper function for straight line speculation.
-+   Return what barrier should be emitted for straight line speculation
-+   mitigation.
-+   When not mitigating against straight line speculation this function returns
-+   an empty string.
-+   When mitigating against straight line speculation, use:
-+   * SB when the v8.5-A SB extension is enabled.
-+   * DSB+ISB otherwise.  */
-+const char *
-+aarch64_sls_barrier (int mitigation_required)
-+{
-+  return mitigation_required
-+    ? (TARGET_SB ? "sb" : "dsb\tsy\n\tisb")
-+    : "";
-+}
-+
- /* Target-specific selftests.  */
- 
- #if CHECKING_P
-diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64.h
-index 1ce23c6..c21015f 100644
---- a/gcc/config/aarch64/aarch64.h
-+++ b/gcc/config/aarch64/aarch64.h
-@@ -281,6 +281,7 @@ extern unsigned aarch64_architecture_version;
- #define AARCH64_ISA_F32MM	   (aarch64_isa_flags & AARCH64_FL_F32MM)
- #define AARCH64_ISA_F64MM	   (aarch64_isa_flags & AARCH64_FL_F64MM)
- #define AARCH64_ISA_BF16	   (aarch64_isa_flags & AARCH64_FL_BF16)
-+#define AARCH64_ISA_SB  	   (aarch64_isa_flags & AARCH64_FL_SB)
- 
- /* Crypto is an optional extension to AdvSIMD.  */
- #define TARGET_CRYPTO (TARGET_SIMD && AARCH64_ISA_CRYPTO)
-@@ -378,6 +379,9 @@ extern unsigned aarch64_architecture_version;
- #define TARGET_FIX_ERR_A53_835769_DEFAULT 1
- #endif
- 
-+/* SB instruction is enabled through +sb.  */
-+#define TARGET_SB (AARCH64_ISA_SB)
-+
- /* Apply the workaround for Cortex-A53 erratum 835769.  */
- #define TARGET_FIX_ERR_A53_835769	\
-   ((aarch64_fix_a53_err835769 == 2)	\
-@@ -1058,8 +1062,10 @@ typedef struct
- 
- #define RETURN_ADDR_RTX aarch64_return_addr
- 
--/* BTI c + 3 insns + 2 pointer-sized entries.  */
--#define TRAMPOLINE_SIZE	(TARGET_ILP32 ? 24 : 32)
-+/* BTI c + 3 insns
-+   + sls barrier of DSB + ISB.
-+   + 2 pointer-sized entries.  */
-+#define TRAMPOLINE_SIZE	(24 + (TARGET_ILP32 ? 8 : 16))
- 
- /* Trampolines contain dwords, so must be dword aligned.  */
- #define TRAMPOLINE_ALIGNMENT 64
-diff --git a/gcc/config/aarch64/aarch64.md b/gcc/config/aarch64/aarch64.md
-index 8c8be3c..dda04ee 100644
---- a/gcc/config/aarch64/aarch64.md
-+++ b/gcc/config/aarch64/aarch64.md
-@@ -407,10 +407,25 @@
- ;; Attribute that specifies whether the alternative uses MOVPRFX.
- (define_attr "movprfx" "no,yes" (const_string "no"))
- 
-+;; Attribute to specify that an alternative has the length of a single
-+;; instruction plus a speculation barrier.
-+(define_attr "sls_length" "none,retbr,casesi" (const_string "none"))
-+
- (define_attr "length" ""
-   (cond [(eq_attr "movprfx" "yes")
-            (const_int 8)
--        ] (const_int 4)))
-+
-+	 (eq_attr "sls_length" "retbr")
-+	   (cond [(match_test "!aarch64_harden_sls_retbr_p ()") (const_int 4)
-+		  (match_test "TARGET_SB") (const_int 8)]
-+		 (const_int 12))
-+
-+	 (eq_attr "sls_length" "casesi")
-+	   (cond [(match_test "!aarch64_harden_sls_retbr_p ()") (const_int 16)
-+		  (match_test "TARGET_SB") (const_int 20)]
-+		 (const_int 24))
-+	]
-+	  (const_int 4)))
- 
- ;; Strictly for compatibility with AArch32 in pipeline models, since AArch64 has
- ;; no predicated insns.
-@@ -447,8 +462,12 @@
- (define_insn "indirect_jump"
-   [(set (pc) (match_operand:DI 0 "register_operand" "r"))]
-   ""
--  "br\\t%0"
--  [(set_attr "type" "branch")]
-+  {
-+    output_asm_insn ("br\\t%0", operands);
-+    return aarch64_sls_barrier (aarch64_harden_sls_retbr_p ());
-+  }
-+  [(set_attr "type" "branch")
-+   (set_attr "sls_length" "retbr")]
- )
- 
- (define_insn "jump"
-@@ -765,7 +784,7 @@
-   "*
-   return aarch64_output_casesi (operands);
-   "
--  [(set_attr "length" "16")
-+  [(set_attr "sls_length" "casesi")
-    (set_attr "type" "branch")]
- )
- 
-@@ -844,18 +863,23 @@
-   [(return)]
-   ""
-   {
-+    const char *ret = NULL;
-     if (aarch64_return_address_signing_enabled ()
- 	&& TARGET_ARMV8_3
- 	&& !crtl->calls_eh_return)
-       {
- 	if (aarch64_ra_sign_key == AARCH64_KEY_B)
--	  return "retab";
-+	  ret = "retab";
- 	else
--	  return "retaa";
-+	  ret = "retaa";
-       }
--    return "ret";
-+    else
-+      ret = "ret";
-+    output_asm_insn (ret, operands);
-+    return aarch64_sls_barrier (aarch64_harden_sls_retbr_p ());
-   }
--  [(set_attr "type" "branch")]
-+  [(set_attr "type" "branch")
-+   (set_attr "sls_length" "retbr")]
- )
- 
- (define_expand "return"
-@@ -867,8 +891,12 @@
- (define_insn "simple_return"
-   [(simple_return)]
-   ""
--  "ret"
--  [(set_attr "type" "branch")]
-+  {
-+    output_asm_insn ("ret", operands);
-+    return aarch64_sls_barrier (aarch64_harden_sls_retbr_p ());
-+  }
-+  [(set_attr "type" "branch")
-+   (set_attr "sls_length" "retbr")]
- )
- 
- (define_insn "*cb<optab><mode>1"
-@@ -1066,10 +1094,16 @@
-    (unspec:DI [(match_operand:DI 2 "const_int_operand")] UNSPEC_CALLEE_ABI)
-    (return)]
-   "SIBLING_CALL_P (insn)"
--  "@
--   br\\t%0
--   b\\t%c0"
--  [(set_attr "type" "branch, branch")]
-+  {
-+    if (which_alternative == 0)
-+      {
-+	output_asm_insn ("br\\t%0", operands);
-+	return aarch64_sls_barrier (aarch64_harden_sls_retbr_p ());
-+      }
-+    return "b\\t%c0";
-+  }
-+  [(set_attr "type" "branch, branch")
-+   (set_attr "sls_length" "retbr,none")]
- )
- 
- (define_insn "*sibcall_value_insn"
-@@ -1080,10 +1114,16 @@
-    (unspec:DI [(match_operand:DI 3 "const_int_operand")] UNSPEC_CALLEE_ABI)
-    (return)]
-   "SIBLING_CALL_P (insn)"
--  "@
--   br\\t%1
--   b\\t%c1"
--  [(set_attr "type" "branch, branch")]
-+  {
-+    if (which_alternative == 0)
-+      {
-+	output_asm_insn ("br\\t%1", operands);
-+	return aarch64_sls_barrier (aarch64_harden_sls_retbr_p ());
-+      }
-+    return "b\\t%c1";
-+  }
-+  [(set_attr "type" "branch, branch")
-+   (set_attr "sls_length" "retbr,none")]
- )
- 
- ;; Call subroutine returning any type.
-diff --git a/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-retbr-pacret.c b/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-retbr-pacret.c
-new file mode 100644
-index 0000000..fa1887a
---- /dev/null
-+++ b/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-retbr-pacret.c
-@@ -0,0 +1,21 @@
-+/* Avoid ILP32 since pacret is only available for LP64 */
-+/* { dg-do compile { target { ! ilp32 } } } */
-+/* { dg-additional-options "-mharden-sls=retbr -mbranch-protection=pac-ret -march=armv8.3-a" } */
-+
-+/* Testing the do_return pattern for retaa and retab.  */
-+long retbr_subcall(void);
-+long retbr_do_return_retaa(void)
-+{
-+    return retbr_subcall()+1;
-+}
-+
-+__attribute__((target("branch-protection=pac-ret+b-key")))
-+long retbr_do_return_retab(void)
-+{
-+    return retbr_subcall()+1;
-+}
-+
-+/* Ensure there are no BR or RET instructions which are not directly followed
-+   by a speculation barrier.  */
-+/* { dg-final { scan-assembler-not {\t(br|ret|retaa|retab)\tx[0-9][0-9]?\n\t(?!dsb\tsy\n\tisb)} } } */
-+/* { dg-final { scan-assembler-not {ret\t} } } */
-diff --git a/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-retbr.c b/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-retbr.c
-new file mode 100644
-index 0000000..76b8d03
---- /dev/null
-+++ b/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-retbr.c
-@@ -0,0 +1,119 @@
-+/* We ensure that -Wpedantic is off since it complains about the trampolines
-+   we explicitly want to test.  */
-+/* { dg-additional-options "-mharden-sls=retbr -Wno-pedantic " } */
-+/*
-+   Ensure that the SLS hardening of RET and BR leaves no unprotected RET/BR
-+   instructions.
-+  */
-+typedef int (foo) (int, int);
-+typedef void (bar) (int, int);
-+struct sls_testclass {
-+    foo *x;
-+    bar *y;
-+    int left;
-+    int right;
-+};
-+
-+int
-+retbr_sibcall_value_insn (struct sls_testclass x)
-+{
-+  return x.x(x.left, x.right);
-+}
-+
-+void
-+retbr_sibcall_insn (struct sls_testclass x)
-+{
-+  x.y(x.left, x.right);
-+}
-+
-+/* Aim to test two different returns.
-+   One that introduces a tail call in the middle of the function, and one that
-+   has a normal return.  */
-+int
-+retbr_multiple_returns (struct sls_testclass x)
-+{
-+  int temp;
-+  if (x.left % 10)
-+    return x.x(x.left, 100);
-+  else if (x.right % 20)
-+    {
-+      return x.x(x.left * x.right, 100);
-+    }
-+  temp = x.left % x.right;
-+  temp *= 100;
-+  temp /= 2;
-+  return temp % 3;
-+}
-+
-+void
-+retbr_multiple_returns_void (struct sls_testclass x)
-+{
-+  if (x.left % 10)
-+    {
-+      x.y(x.left, 100);
-+    }
-+  else if (x.right % 20)
-+    {
-+      x.y(x.left * x.right, 100);
-+    }
-+  return;
-+}
-+
-+/* Testing the casesi jump via register.  */
-+__attribute__ ((optimize ("Os")))
-+int
-+retbr_casesi_dispatch (struct sls_testclass x)
-+{
-+  switch (x.left)
-+    {
-+    case -5:
-+      return -2;
-+    case -3:
-+      return -1;
-+    case 0:
-+      return 0;
-+    case 3:
-+      return 1;
-+    case 5:
-+      break;
-+    default:
-+      __builtin_unreachable ();
-+    }
-+  return x.right;
-+}
-+
-+/* Testing the BR in trampolines is mitigated against.  */
-+void f1 (void *);
-+void f3 (void *, void (*)(void *));
-+void f2 (void *);
-+
-+int
-+retbr_trampolines (void *a, int b)
-+{
-+  if (!b)
-+    {
-+      f1 (a);
-+      return 1;
-+    }
-+  if (b)
-+    {
-+      void retbr_tramp_internal (void *c)
-+      {
-+	if (c == a)
-+	  f2 (c);
-+      }
-+      f3 (a, retbr_tramp_internal);
-+    }
-+  return 0;
-+}
-+
-+/* Testing the indirect_jump pattern.  */
-+void
-+retbr_indirect_jump (int *buf)
-+{
-+  __builtin_longjmp(buf, 1);
-+}
-+
-+/* Ensure there are no BR or RET instructions which are not directly followed
-+   by a speculation barrier.  */
-+/* { dg-final { scan-assembler-not {\t(br|ret|retaa|retab)\tx[0-9][0-9]?\n\t(?!dsb\tsy\n\tisb|sb)} } } */
-diff --git a/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-mitigation.exp b/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-mitigation.exp
-new file mode 100644
-index 0000000..8122503
---- /dev/null
-+++ b/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-mitigation.exp
-@@ -0,0 +1,73 @@
-+#  Regression driver for SLS mitigation on AArch64.
-+#  Copyright (C) 2020 Free Software Foundation, Inc.
-+#  Contributed by ARM Ltd.
-+#
-+#  This file is part of GCC.
-+#
-+#  GCC is free software; you can redistribute it and/or modify it
-+#  under the terms of the GNU General Public License as published by
-+#  the Free Software Foundation; either version 3, or (at your option)
-+#  any later version.
-+#
-+#  GCC is distributed in the hope that it will be useful, but
-+#  WITHOUT ANY WARRANTY; without even the implied warranty of
-+#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+#  General Public License for more details.
-+#
-+#  You should have received a copy of the GNU General Public License
-+#  along with GCC; see the file COPYING3.  If not see
-+#  <http://www.gnu.org/licenses/>.  */
-+
-+# Exit immediately if this isn't an AArch64 target.
-+if {![istarget aarch64*-*-*] } then {
-+  return
-+}
-+
-+# Load support procs.
-+load_lib gcc-dg.exp
-+load_lib torture-options.exp
-+
-+# If a testcase doesn't have special options, use these.
-+global DEFAULT_CFLAGS
-+if ![info exists DEFAULT_CFLAGS] then {
-+    set DEFAULT_CFLAGS " "
-+}
-+
-+# Initialize `dg'.
-+dg-init
-+torture-init
-+
-+# Use different architectures as well as the normal optimisation options.
-+# (i.e. use both SB and DSB+ISB barriers).
-+
-+set save-dg-do-what-default ${dg-do-what-default}
-+# Main loop.
-+# Run with torture tests (i.e. a bunch of different optimisation levels) just
-+# to increase test coverage.
-+set dg-do-what-default assemble
-+gcc-dg-runtest [lsort [glob -nocomplain $srcdir/$subdir/*.\[cCS\]]] \
-+	"-save-temps" $DEFAULT_CFLAGS
-+
-+# Run the same tests but this time with SB extension.
-+# Since not all supported assemblers will support that extension we decide
-+# whether to assemble or just compile based on whether the extension is
-+# supported for the available assembler.
-+
-+set templist {}
-+foreach x $DG_TORTURE_OPTIONS {
-+  lappend templist "$x -march=armv8.3-a+sb "
-+  lappend templist "$x -march=armv8-a+sb "
-+}
-+set-torture-options $templist
-+if { [check_effective_target_aarch64_asm_sb_ok] } {
-+    set dg-do-what-default assemble
-+} else {
-+    set dg-do-what-default compile
-+}
-+gcc-dg-runtest [lsort [glob -nocomplain $srcdir/$subdir/*.\[cCS\]]] \
-+	"-save-temps" $DEFAULT_CFLAGS
-+set dg-do-what-default ${save-dg-do-what-default}
-+
-+# All done.
-+torture-finish
-+dg-finish
-diff --git a/gcc/testsuite/lib/target-supports.exp b/gcc/testsuite/lib/target-supports.exp
-index 8a186dd..9d2e093 100644
---- a/gcc/testsuite/lib/target-supports.exp
-+++ b/gcc/testsuite/lib/target-supports.exp
-@@ -9432,7 +9432,7 @@ proc check_effective_target_aarch64_tiny { } {
- # various architecture extensions via the .arch_extension pseudo-op.
- 
- foreach { aarch64_ext } { "fp" "simd" "crypto" "crc" "lse" "dotprod" "sve"
--			  "i8mm" "f32mm" "f64mm" "bf16" } {
-+			  "i8mm" "f32mm" "f64mm" "bf16" "sb" } {
-     eval [string map [list FUNC $aarch64_ext] {
- 	proc check_effective_target_aarch64_asm_FUNC_ok { } {
- 	  if { [istarget aarch64*-*-*] } {
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch b/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch
index 697bdc8219..18a9fb8701 100644
--- a/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch
+++ b/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch
@@ -1,6 +1,6 @@
-From 74cc21f474402cf3578e37e1d7a1a22bbd070f6a Mon Sep 17 00:00:00 2001
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
-index 3ec7743ea..d3c3e51dc 100644
+index c75dd36843e..49acbd6ed44 100644
 --- a/gcc/common.opt
 +++ b/gcc/common.opt
-@@ -682,6 +682,10 @@ Wreturn-local-addr
+@@ -683,6 +683,10 @@ Wreturn-local-addr
  Common Var(warn_return_local_addr) Init(1) Warning
  Warn about returning a pointer/reference to a local or temporary variable.
  
@@ -42,10 +40,10 @@ index 3ec7743ea..d3c3e51dc 100644
  Common Var(warn_shadow) Warning
  Warn when one variable shadows another.  Same as -Wshadow=global.
 diff --git a/gcc/config.in b/gcc/config.in
-index 364eba477..7d2c3bbf1 100644
+index 10a13cde586..8848284da41 100644
 --- a/gcc/config.in
 +++ b/gcc/config.in
-@@ -224,6 +224,16 @@
+@@ -218,6 +218,16 @@
  #endif
  
  
@@ -63,18 +61,18 @@ index 364eba477..7d2c3bbf1 100644
     optimizer and back end) to be checked for dynamic type safety at runtime.
     This is quite expensive. */
 diff --git a/gcc/configure b/gcc/configure
-index 2a9d646b4..a848792f2 100755
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
@@ -83,7 +81,7 @@ index 2a9d646b4..a848792f2 100755
    --enable-plugin         enable plugin support
    --enable-host-shared    build host code as shared libraries
    --disable-libquadmath-support
-@@ -30280,6 +30283,22 @@ if test "${enable_version_specific_runtime_libs+set}" = set; then :
+@@ -31325,6 +31328,22 @@ if test "${enable_version_specific_runtime_libs+set}" = set; then :
  fi
  
  
@@ -107,16 +105,16 @@ index 2a9d646b4..a848792f2 100755
  
  
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 51cce36ce..66ffde305 100644
+index caa611933df..54e21764b3e 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -6614,6 +6614,22 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
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
@@ -134,10 +132,10 @@ index 51cce36ce..66ffde305 100644
  AC_SUBST(subdirs)
  AC_SUBST(srcdir)
 diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
-index d929eb109..aa5ff88b1 100644
+index 7a368959e5e..6659a903bf0 100644
 --- a/gcc/doc/invoke.texi
 +++ b/gcc/doc/invoke.texi
-@@ -351,6 +351,7 @@ Objective-C and Objective-C++ Dialects}.
+@@ -369,6 +369,7 @@ Objective-C and Objective-C++ Dialects}.
  -Wpacked  -Wno-packed-bitfield-compat  -Wpacked-not-aligned  -Wpadded @gol
  -Wparentheses  -Wno-pedantic-ms-format @gol
  -Wpointer-arith  -Wno-pointer-compare  -Wno-pointer-to-int-cast @gol
@@ -145,7 +143,7 @@ index d929eb109..aa5ff88b1 100644
  -Wno-pragmas  -Wno-prio-ctor-dtor  -Wredundant-decls @gol
  -Wrestrict  -Wno-return-local-addr  -Wreturn-type @gol
  -Wno-scalar-storage-order  -Wsequence-point @gol
-@@ -6928,6 +6929,14 @@ made up of data only and thus requires no special treatment.  But, for
+@@ -7735,6 +7736,14 @@ made up of data only and thus requires no special treatment.  But, for
  most targets, it is made up of code and thus requires the stack to be
  made executable in order for the program to work properly.
  
@@ -161,10 +159,10 @@ index d929eb109..aa5ff88b1 100644
  @opindex Wfloat-equal
  @opindex Wno-float-equal
 diff --git a/gcc/gcc.c b/gcc/gcc.c
-index 49c9c6c17..24a92bf27 100644
+index 7837553958b..19c75b6e20d 100644
 --- a/gcc/gcc.c
 +++ b/gcc/gcc.c
-@@ -1044,6 +1044,8 @@ proper position among the other output files.  */
+@@ -1152,6 +1152,8 @@ proper position among the other output files.  */
     "%{fuse-ld=*:-fuse-ld=%*} " LINK_COMPRESS_DEBUG_SPEC \
     "%X %{o*} %{e*} %{N} %{n} %{r}\
      %{s} %{t} %{u*} %{z} %{Z} %{!nostdlib:%{!r:%{!nostartfiles:%S}}} \
@@ -173,7 +171,7 @@ index 49c9c6c17..24a92bf27 100644
      %{static|no-pie|static-pie:} %@{L*} %(mfwrap) %(link_libgcc) " \
      VTABLE_VERIFICATION_SPEC " " SANITIZER_EARLY_SPEC " %o "" \
      %{fopenacc|fopenmp|%:gt(%{ftree-parallelize-loops=*:%*} 1):\
-@@ -1138,8 +1140,11 @@ static const char *cpp_unique_options =
+@@ -1247,8 +1249,11 @@ static const char *cpp_unique_options =
  static const char *cpp_options =
  "%(cpp_unique_options) %1 %{m*} %{std*&ansi&trigraphs} %{W*&pedantic*} %{w}\
   %{f*} %{g*:%{%:debug-level-gt(0):%{g*}\
@@ -185,10 +183,10 @@ index 49c9c6c17..24a92bf27 100644
 +#endif
 + " %{undef} %{save-temps*:-fpch-preprocess}";
  
- /* This contains cpp options which are not passed when the preprocessor
-    output will be used by another program.  */
+ /* Pass -d* flags, possibly modifying -dumpdir, -dumpbase et al.
+ 
 diff --git a/gcc/incpath.c b/gcc/incpath.c
-index 94eaba7b1..bfad4ebe3 100644
+index 446d280321d..fbfc0ce03b8 100644
 --- a/gcc/incpath.c
 +++ b/gcc/incpath.c
 @@ -26,6 +26,7 @@
@@ -199,7 +197,7 @@ index 94eaba7b1..bfad4ebe3 100644
  
  /* Microsoft Windows does not natively support inodes.
     VMS has non-numeric inodes.  */
-@@ -393,6 +394,26 @@ merge_include_chains (const char *sysroot, cpp_reader *pfile, int verbose)
+@@ -395,6 +396,26 @@ merge_include_chains (const char *sysroot, cpp_reader *pfile, int verbose)
  	}
        fprintf (stderr, _("End of search list.\n"));
      }
@@ -226,6 +224,3 @@ index 94eaba7b1..bfad4ebe3 100644
  }
  
  /* Use given -I paths for #include "..." but not #include <...>, and
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/gcc/gcc/0003-aarch64-Mitigate-SLS-for-BLR-instruction.patch b/meta/recipes-devtools/gcc/gcc/0003-aarch64-Mitigate-SLS-for-BLR-instruction.patch
deleted file mode 100644
index 716a367172..0000000000
--- a/meta/recipes-devtools/gcc/gcc/0003-aarch64-Mitigate-SLS-for-BLR-instruction.patch
+++ /dev/null
@@ -1,658 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From a5e7efc40ed841934c1d913f39476afa17d8e5f7 Mon Sep 17 00:00:00 2001
-From: Matthew Malcomson <matthew.malcomson@arm.com>
-Date: Thu, 9 Jul 2020 09:11:59 +0100
-Subject: [PATCH 3/3] aarch64: Mitigate SLS for BLR instruction
-
-This patch introduces the mitigation for Straight Line Speculation past
-the BLR instruction.
-
-This mitigation replaces BLR instructions with a BL to a stub which uses
-a BR to jump to the original value.  These function stubs are then
-appended with a speculation barrier to ensure no straight line
-speculation happens after these jumps.
-
-When optimising for speed we use a set of stubs for each function since
-this should help the branch predictor make more accurate predictions
-about where a stub should branch.
-
-When optimising for size we use one set of stubs for all functions.
-This set of stubs can have human readable names, and we are using
-`__call_indirect_x<N>` for register x<N>.
-
-When BTI branch protection is enabled the BLR instruction can jump to a
-`BTI c` instruction using any register, while the BR instruction can
-only jump to a `BTI c` instruction using the x16 or x17 registers.
-Hence, in order to ensure this transformation is safe we mov the value
-of the original register into x16 and use x16 for the BR.
-
-As an example when optimising for size:
-a
-    BLR x0
-instruction would get transformed to something like
-    BL __call_indirect_x0
-where __call_indirect_x0 labels a thunk that contains
-__call_indirect_x0:
-    MOV X16, X0
-    BR X16
-    <speculation barrier>
-
-The first version of this patch used local symbols specific to a
-compilation unit to try and avoid relocations.
-This was mistaken since functions coming from the same compilation unit
-can still be in different sections, and the assembler will insert
-relocations at jumps between sections.
-
-On any relocation the linker is permitted to emit a veneer to handle
-jumps between symbols that are very far apart.  The registers x16 and
-x17 may be clobbered by these veneers.
-Hence the function stubs cannot rely on the values of x16 and x17 being
-the same as just before the function stub is called.
-
-Similar can be said for the hot/cold partitioning of single functions,
-so function-local stubs have the same restriction.
-
-This updated version of the patch never emits function stubs for x16 and
-x17, and instead forces other registers to be used.
-
-Given the above, there is now no benefit to local symbols (since they
-are not enough to avoid dealing with linker intricacies).  This patch
-now uses global symbols with hidden visibility each stored in their own
-COMDAT section.  This means stubs can be shared between compilation
-units while still avoiding the PLT indirection.
-
-This patch also removes the `__call_indirect_x30` stub (and
-function-local equivalent) which would simply jump back to the original
-location.
-
-The function-local stubs are emitted to the assembly output file in one
-chunk, which means we need not add the speculation barrier directly
-after each one.
-This is because we know for certain that the instructions directly after
-the BR in all but the last function stub will be from another one of
-these stubs and hence will not contain a speculation gadget.
-Instead we add a speculation barrier at the end of the sequence of
-stubs.
-
-The global stubs are emitted in COMDAT/.linkonce sections by
-themselves so that the linker can remove duplicates from multiple object
-files.  This means they are not emitted in one chunk, and each one must
-include the speculation barrier.
-
-Another difference is that since the global stubs are shared across
-compilation units we do not know that all functions will be targeting an
-architecture supporting the SB instruction.
-Rather than provide multiple stubs for each architecture, we provide a
-stub that will work for all architectures -- using the DSB+ISB barrier.
-
-This mitigation does not apply for BLR instructions in the following
-places:
-- Some accesses to thread-local variables use a code sequence with a BLR
-  instruction.  This code sequence is part of the binary interface between
-  compiler and linker. If this BLR instruction needs to be mitigated, it'd
-  probably be best to do so in the linker. It seems that the code sequence
-  for thread-local variable access is unlikely to lead to a Spectre Revalation
-  Gadget.
-- PLT stubs are produced by the linker and each contain a BLR instruction.
-  It seems that at most only after the last PLT stub a Spectre Revalation
-  Gadget might appear.
-
-Testing:
-  Bootstrap and regtest on AArch64
-    (with BOOT_CFLAGS="-mharden-sls=retbr,blr")
-  Used a temporary hack(1) in gcc-dg.exp to use these options on every
-  test in the testsuite, a slight modification to emit the speculation
-  barrier after every function stub, and a script to check that the
-  output never emitted a BLR, or unmitigated BR or RET instruction.
-  Similar on an aarch64-none-elf cross-compiler.
-
-1) Temporary hack emitted a speculation barrier at the end of every stub
-function, and used a script to ensure that:
-  a) Every RET or BR is immediately followed by a speculation barrier.
-  b) No BLR instruction is emitted by compiler.
-
-gcc/ChangeLog:
-
-	* config/aarch64/aarch64-protos.h (aarch64_indirect_call_asm):
-	New declaration.
-	* config/aarch64/aarch64.c (aarch64_regno_regclass): Handle new
-	stub registers class.
-	(aarch64_class_max_nregs): Likewise.
-	(aarch64_register_move_cost): Likewise.
-	(aarch64_sls_shared_thunks): Global array to store stub labels.
-	(aarch64_sls_emit_function_stub): New.
-	(aarch64_create_blr_label): New.
-	(aarch64_sls_emit_blr_function_thunks): New.
-	(aarch64_sls_emit_shared_blr_thunks): New.
-	(aarch64_asm_file_end): New.
-	(aarch64_indirect_call_asm): New.
-	(TARGET_ASM_FILE_END): Use aarch64_asm_file_end.
-	(TARGET_ASM_FUNCTION_EPILOGUE): Use
-	aarch64_sls_emit_blr_function_thunks.
-	* config/aarch64/aarch64.h (STB_REGNUM_P): New.
-	(enum reg_class): Add STUB_REGS class.
-	(machine_function): Introduce `call_via` array for
-	function-local stub labels.
-	* config/aarch64/aarch64.md (*call_insn, *call_value_insn): Use
-	aarch64_indirect_call_asm to emit code when hardening BLR
-	instructions.
-	* config/aarch64/constraints.md (Ucr): New constraint
-	representing registers for indirect calls.  Is GENERAL_REGS
-	usually, and STUB_REGS when hardening BLR instruction against
-	SLS.
-	* config/aarch64/predicates.md (aarch64_general_reg): STUB_REGS class
-	is also a general register.
-
-gcc/testsuite/ChangeLog:
-
-	* gcc.target/aarch64/sls-mitigation/sls-miti-blr-bti.c: New test.
-	* gcc.target/aarch64/sls-mitigation/sls-miti-blr.c: New test.
----
- gcc/config/aarch64/aarch64-protos.h                |   1 +
- gcc/config/aarch64/aarch64.c                       | 225 ++++++++++++++++++++-
- gcc/config/aarch64/aarch64.h                       |  15 ++
- gcc/config/aarch64/aarch64.md                      |  11 +-
- gcc/config/aarch64/constraints.md                  |   9 +
- gcc/config/aarch64/predicates.md                   |   3 +-
- .../aarch64/sls-mitigation/sls-miti-blr-bti.c      |  40 ++++
- .../aarch64/sls-mitigation/sls-miti-blr.c          |  33 +++
- 8 files changed, 328 insertions(+), 9 deletions(-)
- create mode 100644 gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-blr-bti.c
- create mode 100644 gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-blr.c
-
-diff --git a/gcc/config/aarch64/aarch64-protos.h b/gcc/config/aarch64/aarch64-protos.h
-index ee0ffde..839f801 100644
---- a/gcc/config/aarch64/aarch64-protos.h
-+++ b/gcc/config/aarch64/aarch64-protos.h
-@@ -782,6 +782,7 @@ extern const atomic_ool_names aarch64_ool_ldeor_names;
- tree aarch64_resolve_overloaded_builtin_general (location_t, tree, void *);
- 
- const char *aarch64_sls_barrier (int);
-+const char *aarch64_indirect_call_asm (rtx);
- extern bool aarch64_harden_sls_retbr_p (void);
- extern bool aarch64_harden_sls_blr_p (void);
- 
-diff --git a/gcc/config/aarch64/aarch64.c b/gcc/config/aarch64/aarch64.c
-index 2389d49..0f7bba3 100644
---- a/gcc/config/aarch64/aarch64.c
-+++ b/gcc/config/aarch64/aarch64.c
-@@ -10605,6 +10605,9 @@ aarch64_label_mentioned_p (rtx x)
- enum reg_class
- aarch64_regno_regclass (unsigned regno)
- {
-+  if (STUB_REGNUM_P (regno))
-+    return STUB_REGS;
-+
-   if (GP_REGNUM_P (regno))
-     return GENERAL_REGS;
- 
-@@ -10939,6 +10942,7 @@ aarch64_class_max_nregs (reg_class_t regclass, machine_mode mode)
-   unsigned int nregs, vec_flags;
-   switch (regclass)
-     {
-+    case STUB_REGS:
-     case TAILCALL_ADDR_REGS:
-     case POINTER_REGS:
-     case GENERAL_REGS:
-@@ -13155,10 +13159,12 @@ aarch64_register_move_cost (machine_mode mode,
-     = aarch64_tune_params.regmove_cost;
- 
-   /* Caller save and pointer regs are equivalent to GENERAL_REGS.  */
--  if (to == TAILCALL_ADDR_REGS || to == POINTER_REGS)
-+  if (to == TAILCALL_ADDR_REGS || to == POINTER_REGS
-+      || to == STUB_REGS)
-     to = GENERAL_REGS;
- 
--  if (from == TAILCALL_ADDR_REGS || from == POINTER_REGS)
-+  if (from == TAILCALL_ADDR_REGS || from == POINTER_REGS
-+      || from == STUB_REGS)
-     from = GENERAL_REGS;
- 
-   /* Make RDFFR very expensive.  In particular, if we know that the FFR
-@@ -22957,6 +22963,215 @@ aarch64_sls_barrier (int mitigation_required)
-     : "";
- }
- 
-+static GTY (()) tree aarch64_sls_shared_thunks[30];
-+static GTY (()) bool aarch64_sls_shared_thunks_needed = false;
-+const char *indirect_symbol_names[30] = {
-+    "__call_indirect_x0",
-+    "__call_indirect_x1",
-+    "__call_indirect_x2",
-+    "__call_indirect_x3",
-+    "__call_indirect_x4",
-+    "__call_indirect_x5",
-+    "__call_indirect_x6",
-+    "__call_indirect_x7",
-+    "__call_indirect_x8",
-+    "__call_indirect_x9",
-+    "__call_indirect_x10",
-+    "__call_indirect_x11",
-+    "__call_indirect_x12",
-+    "__call_indirect_x13",
-+    "__call_indirect_x14",
-+    "__call_indirect_x15",
-+    "", /* "__call_indirect_x16",  */
-+    "", /* "__call_indirect_x17",  */
-+    "__call_indirect_x18",
-+    "__call_indirect_x19",
-+    "__call_indirect_x20",
-+    "__call_indirect_x21",
-+    "__call_indirect_x22",
-+    "__call_indirect_x23",
-+    "__call_indirect_x24",
-+    "__call_indirect_x25",
-+    "__call_indirect_x26",
-+    "__call_indirect_x27",
-+    "__call_indirect_x28",
-+    "__call_indirect_x29",
-+};
-+
-+/* Function to create a BLR thunk.  This thunk is used to mitigate straight
-+   line speculation.  Instead of a simple BLR that can be speculated past,
-+   we emit a BL to this thunk, and this thunk contains a BR to the relevant
-+   register.  These thunks have the relevant speculation barries put after
-+   their indirect branch so that speculation is blocked.
-+
-+   We use such a thunk so the speculation barriers are kept off the
-+   architecturally executed path in order to reduce the performance overhead.
-+
-+   When optimizing for size we use stubs shared by the linked object.
-+   When optimizing for performance we emit stubs for each function in the hope
-+   that the branch predictor can better train on jumps specific for a given
-+   function.  */
-+rtx
-+aarch64_sls_create_blr_label (int regnum)
-+{
-+  gcc_assert (STUB_REGNUM_P (regnum));
-+  if (optimize_function_for_size_p (cfun))
-+    {
-+      /* For the thunks shared between different functions in this compilation
-+	 unit we use a named symbol -- this is just for users to more easily
-+	 understand the generated assembly.  */
-+      aarch64_sls_shared_thunks_needed = true;
-+      const char *thunk_name = indirect_symbol_names[regnum];
-+      if (aarch64_sls_shared_thunks[regnum] == NULL)
-+	{
-+	  /* Build a decl representing this function stub and record it for
-+	     later.  We build a decl here so we can use the GCC machinery for
-+	     handling sections automatically (through `get_named_section` and
-+	     `make_decl_one_only`).  That saves us a lot of trouble handling
-+	     the specifics of different output file formats.  */
-+	  tree decl = build_decl (BUILTINS_LOCATION, FUNCTION_DECL,
-+				  get_identifier (thunk_name),
-+				  build_function_type_list (void_type_node,
-+							    NULL_TREE));
-+	  DECL_RESULT (decl) = build_decl (BUILTINS_LOCATION, RESULT_DECL,
-+					   NULL_TREE, void_type_node);
-+	  TREE_PUBLIC (decl) = 1;
-+	  TREE_STATIC (decl) = 1;
-+	  DECL_IGNORED_P (decl) = 1;
-+	  DECL_ARTIFICIAL (decl) = 1;
-+	  make_decl_one_only (decl, DECL_ASSEMBLER_NAME (decl));
-+	  resolve_unique_section (decl, 0, false);
-+	  aarch64_sls_shared_thunks[regnum] = decl;
-+	}
-+
-+      return gen_rtx_SYMBOL_REF (Pmode, thunk_name);
-+    }
-+
-+  if (cfun->machine->call_via[regnum] == NULL)
-+    cfun->machine->call_via[regnum]
-+      = gen_rtx_LABEL_REF (Pmode, gen_label_rtx ());
-+  return cfun->machine->call_via[regnum];
-+}
-+
-+/* Helper function for aarch64_sls_emit_blr_function_thunks and
-+   aarch64_sls_emit_shared_blr_thunks below.  */
-+static void
-+aarch64_sls_emit_function_stub (FILE *out_file, int regnum)
-+{
-+  /* Save in x16 and branch to that function so this transformation does
-+     not prevent jumping to `BTI c` instructions.  */
-+  asm_fprintf (out_file, "\tmov\tx16, x%d\n", regnum);
-+  asm_fprintf (out_file, "\tbr\tx16\n");
-+}
-+
-+/* Emit all BLR stubs for this particular function.
-+   Here we emit all the BLR stubs needed for the current function.  Since we
-+   emit these stubs in a consecutive block we know there will be no speculation
-+   gadgets between each stub, and hence we only emit a speculation barrier at
-+   the end of the stub sequences.
-+
-+   This is called in the TARGET_ASM_FUNCTION_EPILOGUE hook.  */
-+void
-+aarch64_sls_emit_blr_function_thunks (FILE *out_file)
-+{
-+  if (! aarch64_harden_sls_blr_p ())
-+    return;
-+
-+  bool any_functions_emitted = false;
-+  /* We must save and restore the current function section since this assembly
-+     is emitted at the end of the function.  This means it can be emitted *just
-+     after* the cold section of a function.  That cold part would be emitted in
-+     a different section.  That switch would trigger a `.cfi_endproc` directive
-+     to be emitted in the original section and a `.cfi_startproc` directive to
-+     be emitted in the new section.  Switching to the original section without
-+     restoring would mean that the `.cfi_endproc` emitted as a function ends
-+     would happen in a different section -- leaving an unmatched
-+     `.cfi_startproc` in the cold text section and an unmatched `.cfi_endproc`
-+     in the standard text section.  */
-+  section *save_text_section = in_section;
-+  switch_to_section (function_section (current_function_decl));
-+  for (int regnum = 0; regnum < 30; ++regnum)
-+    {
-+      rtx specu_label = cfun->machine->call_via[regnum];
-+      if (specu_label == NULL)
-+	continue;
-+
-+      targetm.asm_out.print_operand (out_file, specu_label, 0);
-+      asm_fprintf (out_file, ":\n");
-+      aarch64_sls_emit_function_stub (out_file, regnum);
-+      any_functions_emitted = true;
-+    }
-+  if (any_functions_emitted)
-+    /* Can use the SB if needs be here, since this stub will only be used
-+      by the current function, and hence for the current target.  */
-+    asm_fprintf (out_file, "\t%s\n", aarch64_sls_barrier (true));
-+  switch_to_section (save_text_section);
-+}
-+
-+/* Emit shared BLR stubs for the current compilation unit.
-+   Over the course of compiling this unit we may have converted some BLR
-+   instructions to a BL to a shared stub function.  This is where we emit those
-+   stub functions.
-+   This function is for the stubs shared between different functions in this
-+   compilation unit.  We share when optimizing for size instead of speed.
-+
-+   This function is called through the TARGET_ASM_FILE_END hook.  */
-+void
-+aarch64_sls_emit_shared_blr_thunks (FILE *out_file)
-+{
-+  if (! aarch64_sls_shared_thunks_needed)
-+    return;
-+
-+  for (int regnum = 0; regnum < 30; ++regnum)
-+    {
-+      tree decl = aarch64_sls_shared_thunks[regnum];
-+      if (!decl)
-+	continue;
-+
-+      const char *name = indirect_symbol_names[regnum];
-+      switch_to_section (get_named_section (decl, NULL, 0));
-+      ASM_OUTPUT_ALIGN (out_file, 2);
-+      targetm.asm_out.globalize_label (out_file, name);
-+      /* Only emits if the compiler is configured for an assembler that can
-+	 handle visibility directives.  */
-+      targetm.asm_out.assemble_visibility (decl, VISIBILITY_HIDDEN);
-+      ASM_OUTPUT_TYPE_DIRECTIVE (out_file, name, "function");
-+      ASM_OUTPUT_LABEL (out_file, name);
-+      aarch64_sls_emit_function_stub (out_file, regnum);
-+      /* Use the most conservative target to ensure it can always be used by any
-+	 function in the translation unit.  */
-+      asm_fprintf (out_file, "\tdsb\tsy\n\tisb\n");
-+      ASM_DECLARE_FUNCTION_SIZE (out_file, name, decl);
-+    }
-+}
-+
-+/* Implement TARGET_ASM_FILE_END.  */
-+void
-+aarch64_asm_file_end ()
-+{
-+  aarch64_sls_emit_shared_blr_thunks (asm_out_file);
-+  /* Since this function will be called for the ASM_FILE_END hook, we ensure
-+     that what would be called otherwise (e.g. `file_end_indicate_exec_stack`
-+     for FreeBSD) still gets called.  */
-+#ifdef TARGET_ASM_FILE_END
-+  TARGET_ASM_FILE_END ();
-+#endif
-+}
-+
-+const char *
-+aarch64_indirect_call_asm (rtx addr)
-+{
-+  gcc_assert (REG_P (addr));
-+  if (aarch64_harden_sls_blr_p ())
-+    {
-+      rtx stub_label = aarch64_sls_create_blr_label (REGNO (addr));
-+      output_asm_insn ("bl\t%0", &stub_label);
-+    }
-+  else
-+   output_asm_insn ("blr\t%0", &addr);
-+  return "";
-+}
-+
- /* Target-specific selftests.  */
- 
- #if CHECKING_P
-@@ -23507,6 +23722,12 @@ aarch64_libgcc_floating_mode_supported_p
- #undef TARGET_MD_ASM_ADJUST
- #define TARGET_MD_ASM_ADJUST arm_md_asm_adjust
- 
-+#undef TARGET_ASM_FILE_END
-+#define TARGET_ASM_FILE_END aarch64_asm_file_end
-+
-+#undef TARGET_ASM_FUNCTION_EPILOGUE
-+#define TARGET_ASM_FUNCTION_EPILOGUE aarch64_sls_emit_blr_function_thunks
-+
- struct gcc_target targetm = TARGET_INITIALIZER;
- 
- #include "gt-aarch64.h"
-diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64.h
-index 8e0fc37..7331450 100644
---- a/gcc/config/aarch64/aarch64.h
-+++ b/gcc/config/aarch64/aarch64.h
-@@ -643,6 +643,16 @@ extern unsigned aarch64_architecture_version;
- #define GP_REGNUM_P(REGNO)						\
-   (((unsigned) (REGNO - R0_REGNUM)) <= (R30_REGNUM - R0_REGNUM))
- 
-+/* Registers known to be preserved over a BL instruction.  This consists of the
-+   GENERAL_REGS without x16, x17, and x30.  The x30 register is changed by the
-+   BL instruction itself, while the x16 and x17 registers may be used by
-+   veneers which can be inserted by the linker.  */
-+#define STUB_REGNUM_P(REGNO) \
-+  (GP_REGNUM_P (REGNO) \
-+   && (REGNO) != R16_REGNUM \
-+   && (REGNO) != R17_REGNUM \
-+   && (REGNO) != R30_REGNUM) \
-+
- #define FP_REGNUM_P(REGNO)			\
-   (((unsigned) (REGNO - V0_REGNUM)) <= (V31_REGNUM - V0_REGNUM))
- 
-@@ -667,6 +677,7 @@ enum reg_class
- {
-   NO_REGS,
-   TAILCALL_ADDR_REGS,
-+  STUB_REGS,
-   GENERAL_REGS,
-   STACK_REG,
-   POINTER_REGS,
-@@ -689,6 +700,7 @@ enum reg_class
- {						\
-   "NO_REGS",					\
-   "TAILCALL_ADDR_REGS",				\
-+  "STUB_REGS",					\
-   "GENERAL_REGS",				\
-   "STACK_REG",					\
-   "POINTER_REGS",				\
-@@ -708,6 +720,7 @@ enum reg_class
- {									\
-   { 0x00000000, 0x00000000, 0x00000000 },	/* NO_REGS */		\
-   { 0x00030000, 0x00000000, 0x00000000 },	/* TAILCALL_ADDR_REGS */\
-+  { 0x3ffcffff, 0x00000000, 0x00000000 },	/* STUB_REGS */		\
-   { 0x7fffffff, 0x00000000, 0x00000003 },	/* GENERAL_REGS */	\
-   { 0x80000000, 0x00000000, 0x00000000 },	/* STACK_REG */		\
-   { 0xffffffff, 0x00000000, 0x00000003 },	/* POINTER_REGS */	\
-@@ -862,6 +875,8 @@ typedef struct GTY (()) machine_function
-   struct aarch64_frame frame;
-   /* One entry for each hard register.  */
-   bool reg_is_wrapped_separately[LAST_SAVED_REGNUM];
-+  /* One entry for each general purpose register.  */
-+  rtx call_via[SP_REGNUM];
-   bool label_is_assembled;
- } machine_function;
- #endif
-diff --git a/gcc/config/aarch64/aarch64.md b/gcc/config/aarch64/aarch64.md
-index dda04ee..43da754 100644
---- a/gcc/config/aarch64/aarch64.md
-+++ b/gcc/config/aarch64/aarch64.md
-@@ -1022,16 +1022,15 @@
- )
- 
- (define_insn "*call_insn"
--  [(call (mem:DI (match_operand:DI 0 "aarch64_call_insn_operand" "r, Usf"))
-+  [(call (mem:DI (match_operand:DI 0 "aarch64_call_insn_operand" "Ucr, Usf"))
- 	 (match_operand 1 "" ""))
-    (unspec:DI [(match_operand:DI 2 "const_int_operand")] UNSPEC_CALLEE_ABI)
-    (clobber (reg:DI LR_REGNUM))]
-   ""
-   "@
--  blr\\t%0
-+  * return aarch64_indirect_call_asm (operands[0]);
-   bl\\t%c0"
--  [(set_attr "type" "call, call")]
--)
-+  [(set_attr "type" "call, call")])
- 
- (define_expand "call_value"
-   [(parallel
-@@ -1050,13 +1049,13 @@
- 
- (define_insn "*call_value_insn"
-   [(set (match_operand 0 "" "")
--	(call (mem:DI (match_operand:DI 1 "aarch64_call_insn_operand" "r, Usf"))
-+	(call (mem:DI (match_operand:DI 1 "aarch64_call_insn_operand" "Ucr, Usf"))
- 		      (match_operand 2 "" "")))
-    (unspec:DI [(match_operand:DI 3 "const_int_operand")] UNSPEC_CALLEE_ABI)
-    (clobber (reg:DI LR_REGNUM))]
-   ""
-   "@
--  blr\\t%1
-+  * return aarch64_indirect_call_asm (operands[1]);
-   bl\\t%c1"
-   [(set_attr "type" "call, call")]
- )
-diff --git a/gcc/config/aarch64/constraints.md b/gcc/config/aarch64/constraints.md
-index d993268..8cc6f50 100644
---- a/gcc/config/aarch64/constraints.md
-+++ b/gcc/config/aarch64/constraints.md
-@@ -24,6 +24,15 @@
- (define_register_constraint "Ucs" "TAILCALL_ADDR_REGS"
-   "@internal Registers suitable for an indirect tail call")
- 
-+(define_register_constraint "Ucr"
-+    "aarch64_harden_sls_blr_p () ? STUB_REGS : GENERAL_REGS"
-+  "@internal Registers to be used for an indirect call.
-+   This is usually the general registers, but when we are hardening against
-+   Straight Line Speculation we disallow x16, x17, and x30 so we can use
-+   indirection stubs.  These indirection stubs cannot use the above registers
-+   since they will be reached by a BL that may have to go through a linker
-+   veneer.")
-+
- (define_register_constraint "w" "FP_REGS"
-   "Floating point and SIMD vector registers.")
- 
-diff --git a/gcc/config/aarch64/predicates.md b/gcc/config/aarch64/predicates.md
-index 215fcec..1754b1e 100644
---- a/gcc/config/aarch64/predicates.md
-+++ b/gcc/config/aarch64/predicates.md
-@@ -32,7 +32,8 @@
- 
- (define_predicate "aarch64_general_reg"
-   (and (match_operand 0 "register_operand")
--       (match_test "REGNO_REG_CLASS (REGNO (op)) == GENERAL_REGS")))
-+       (match_test "REGNO_REG_CLASS (REGNO (op)) == STUB_REGS
-+		    || REGNO_REG_CLASS (REGNO (op)) == GENERAL_REGS")))
- 
- ;; Return true if OP a (const_int 0) operand.
- (define_predicate "const0_operand"
-diff --git a/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-blr-bti.c b/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-blr-bti.c
-new file mode 100644
-index 0000000..b1fb754
---- /dev/null
-+++ b/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-blr-bti.c
-@@ -0,0 +1,40 @@
-+/* { dg-do compile } */
-+/* { dg-additional-options "-mharden-sls=blr -mbranch-protection=bti" } */
-+/*
-+   Ensure that the SLS hardening of BLR leaves no BLR instructions.
-+   Here we also check that there are no BR instructions with anything except an
-+   x16 or x17 register.  This is because a `BTI c` instruction can be branched
-+   to using a BLR instruction using any register, but can only be branched to
-+   with a BR using an x16 or x17 register.
-+  */
-+typedef int (foo) (int, int);
-+typedef void (bar) (int, int);
-+struct sls_testclass {
-+    foo *x;
-+    bar *y;
-+    int left;
-+    int right;
-+};
-+
-+/* We test both RTL patterns for a call which returns a value and a call which
-+   does not.  */
-+int blr_call_value (struct sls_testclass x)
-+{
-+  int retval = x.x(x.left, x.right);
-+  if (retval % 10)
-+    return 100;
-+  return 9;
-+}
-+
-+int blr_call (struct sls_testclass x)
-+{
-+  x.y(x.left, x.right);
-+  if (x.left % 10)
-+    return 100;
-+  return 9;
-+}
-+
-+/* { dg-final { scan-assembler-not {\tblr\t} } } */
-+/* { dg-final { scan-assembler-not {\tbr\tx(?!16|17)} } } */
-+/* { dg-final { scan-assembler {\tbr\tx(16|17)} } } */
-+
-diff --git a/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-blr.c b/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-blr.c
-new file mode 100644
-index 0000000..88bafff
---- /dev/null
-+++ b/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-blr.c
-@@ -0,0 +1,33 @@
-+/* { dg-additional-options "-mharden-sls=blr -save-temps" } */
-+/* Ensure that the SLS hardening of BLR leaves no BLR instructions.
-+   We only test that all BLR instructions have been removed, not that the
-+   resulting code makes sense.  */
-+typedef int (foo) (int, int);
-+typedef void (bar) (int, int);
-+struct sls_testclass {
-+    foo *x;
-+    bar *y;
-+    int left;
-+    int right;
-+};
-+
-+/* We test both RTL patterns for a call which returns a value and a call which
-+   does not.  */
-+int blr_call_value (struct sls_testclass x)
-+{
-+  int retval = x.x(x.left, x.right);
-+  if (retval % 10)
-+    return 100;
-+  return 9;
-+}
-+
-+int blr_call (struct sls_testclass x)
-+{
-+  x.y(x.left, x.right);
-+  if (x.left % 10)
-+    return 100;
-+  return 9;
-+}
-+
-+/* { dg-final { scan-assembler-not {\tblr\t} } } */
-+/* { dg-final { scan-assembler {\tbr\tx[0-9][0-9]?} } } */
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/gcc/gcc/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
index 27237feb5a..7a67654555 100644
--- a/meta/recipes-devtools/gcc/gcc/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
+++ b/meta/recipes-devtools/gcc/gcc/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
@@ -1,4 +1,4 @@
-From 6e3395c0bc933bdc3242d1dead4896d0aa4e11a8 Mon Sep 17 00:00:00 2001
+From 274a27da6fe355c4c49953b3b69c8949d2412c62 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:08:31 +0400
 Subject: [PATCH] gcc-4.3.3: SYSROOT_CFLAGS_FOR_TARGET
@@ -26,10 +26,10 @@ Upstream-Status: Pending
  1 file changed, 32 insertions(+)
 
 diff --git a/configure b/configure
-index 226a64939d1..b31dc137fc9 100755
+index bcebad264ec..86e4ee7c383 100755
 --- a/configure
 +++ b/configure
-@@ -6971,6 +6971,38 @@ fi
+@@ -8977,6 +8977,38 @@ fi
  
  
  
diff --git a/meta/recipes-devtools/gcc/gcc/0004-64-bit-multilib-hack.patch b/meta/recipes-devtools/gcc/gcc/0004-64-bit-multilib-hack.patch
index 7c751bef65..789f57343b 100644
--- a/meta/recipes-devtools/gcc/gcc/0004-64-bit-multilib-hack.patch
+++ b/meta/recipes-devtools/gcc/gcc/0004-64-bit-multilib-hack.patch
@@ -1,4 +1,4 @@
-From 85a7c5aeb82ed61e6ef6d8e061b9da9e6a4a652c Mon Sep 17 00:00:00 2001
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
index 4020c9e3cf..c921ac3340 100644
--- a/meta/recipes-devtools/gcc/gcc/0005-optional-libstdc.patch
+++ b/meta/recipes-devtools/gcc/gcc/0005-optional-libstdc.patch
@@ -1,4 +1,4 @@
-From 6ddfb0bfcd1eea71acd37ab06f7a4510b9f1d12b Mon Sep 17 00:00:00 2001
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
-index f12d8d12150..cf6cb428e7d 100644
+index 6659a903bf0..9ee63dbe52f 100644
 --- a/gcc/doc/invoke.texi
 +++ b/gcc/doc/invoke.texi
-@@ -230,6 +230,9 @@ in the following sections.
+@@ -239,6 +239,9 @@ in the following sections.
  -fno-weak  -nostdinc++ @gol
  -fvisibility-inlines-hidden @gol
  -fvisibility-ms-compat @gol
@@ -63,9 +63,9 @@ index f12d8d12150..cf6cb428e7d 100644
 +-fvtv-counts -fvtv-debug @gol
 +-nostdlib++ @gol
  -fext-numeric-literals @gol
- -Wabi-tag  -Wcatch-value  -Wcatch-value=@var{n} @gol
- -Wno-class-conversion  -Wclass-memaccess @gol
-@@ -599,7 +602,7 @@ Objective-C and Objective-C++ Dialects}.
+ -flang-info-include-translate@r{[}=@var{header}@r{]} @gol
+ -flang-info-include-translate-not @gol
+@@ -632,7 +635,7 @@ Objective-C and Objective-C++ Dialects}.
  -pie  -pthread  -r  -rdynamic @gol
  -s  -static  -static-pie  -static-libgcc  -static-libstdc++ @gol
  -static-libasan  -static-libtsan  -static-liblsan  -static-libubsan @gol
@@ -74,7 +74,7 @@ index f12d8d12150..cf6cb428e7d 100644
  -T @var{script}  -Wl,@var{option}  -Xlinker @var{option} @gol
  -u @var{symbol}  -z @var{keyword}}
  
-@@ -14407,6 +14410,33 @@ Specify that the program entry point is @var{entry}.  The argument is
+@@ -15708,6 +15711,33 @@ Specify that the program entry point is @var{entry}.  The argument is
  interpreted by the linker; the GNU linker accepts either a symbol name
  or an address.
  
@@ -109,10 +109,10 @@ index f12d8d12150..cf6cb428e7d 100644
  @opindex pie
  Produce a dynamically linked position independent executable on targets
 diff --git a/gcc/gcc.c b/gcc/gcc.c
-index b2200c5185a..f8be58ce0a6 100644
+index 19c75b6e20d..be7630ffd8c 100644
 --- a/gcc/gcc.c
 +++ b/gcc/gcc.c
-@@ -1051,6 +1051,7 @@ proper position among the other output files.  */
+@@ -1162,6 +1162,7 @@ proper position among the other output files.  */
      %(mflib) " STACK_SPLIT_SPEC "\
      %{fprofile-arcs|fprofile-generate*|coverage:-lgcov} " SANITIZER_SPEC " \
      %{!nostdlib:%{!r:%{!nodefaultlibs:%(link_ssp) %(link_gcc_c_sequence)}}}\
diff --git a/meta/recipes-devtools/gcc/gcc/0006-COLLECT_GCC_OPTIONS.patch b/meta/recipes-devtools/gcc/gcc/0006-COLLECT_GCC_OPTIONS.patch
index 9fbbe80703..265ca0e218 100644
--- a/meta/recipes-devtools/gcc/gcc/0006-COLLECT_GCC_OPTIONS.patch
+++ b/meta/recipes-devtools/gcc/gcc/0006-COLLECT_GCC_OPTIONS.patch
@@ -1,4 +1,4 @@
-From a6c90d3a9c5010b4aa7cc30467cf81ca7e0f430e Mon Sep 17 00:00:00 2001
+From 127716a32a11ca2a6b3aac068054bfc69c4dcfd8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:16:28 +0400
 Subject: [PATCH] COLLECT_GCC_OPTIONS
@@ -14,10 +14,10 @@ Upstream-Status: Pending
  1 file changed, 9 insertions(+)
 
 diff --git a/gcc/gcc.c b/gcc/gcc.c
-index f8be58ce0a6..48b0f9dde81 100644
+index be7630ffd8c..1bc45285384 100644
 --- a/gcc/gcc.c
 +++ b/gcc/gcc.c
-@@ -4806,6 +4806,15 @@ set_collect_gcc_options (void)
+@@ -5383,6 +5383,15 @@ set_collect_gcc_options (void)
  		sizeof ("COLLECT_GCC_OPTIONS=") - 1);
  
    first_time = TRUE;
diff --git a/meta/recipes-devtools/gcc/gcc/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch b/meta/recipes-devtools/gcc/gcc/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
index a764bdd0f4..9844c2ae8a 100644
--- a/meta/recipes-devtools/gcc/gcc/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
+++ b/meta/recipes-devtools/gcc/gcc/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
@@ -1,4 +1,4 @@
-From 5670d4489f119d2da661734895ac0be99b606d1b Mon Sep 17 00:00:00 2001
+From e64342df647829d3e1c52fd480a5be7c1281ced0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:17:25 +0400
 Subject: [PATCH] Use the defaults.h in ${B} instead of ${S}, and t-oe in ${B}
@@ -26,10 +26,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  4 files changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index 543b477ff18..a67d2cc18d6 100644
+index 8a5fb3fd99c..7da6f439fff 100644
 --- a/gcc/Makefile.in
 +++ b/gcc/Makefile.in
-@@ -540,7 +540,7 @@ TARGET_SYSTEM_ROOT = @TARGET_SYSTEM_ROOT@
+@@ -552,7 +552,7 @@ TARGET_SYSTEM_ROOT = @TARGET_SYSTEM_ROOT@
  TARGET_SYSTEM_ROOT_DEFINE = @TARGET_SYSTEM_ROOT_DEFINE@
  
  xmake_file=@xmake_file@
@@ -39,10 +39,10 @@ index 543b477ff18..a67d2cc18d6 100644
  TM_MULTILIB_CONFIG=@TM_MULTILIB_CONFIG@
  TM_MULTILIB_EXCEPTIONS_CONFIG=@TM_MULTILIB_EXCEPTIONS_CONFIG@
 diff --git a/gcc/configure b/gcc/configure
-index 8de766a942c..b26e8fc7fee 100755
+index 3f0734bff11..c5d3bc4ee2d 100755
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -12705,8 +12705,8 @@ for f in $tm_file; do
+@@ -13090,8 +13090,8 @@ for f in $tm_file; do
         tm_include_list="${tm_include_list} $f"
         ;;
      defaults.h )
@@ -54,10 +54,10 @@ index 8de766a942c..b26e8fc7fee 100755
      * )
         tm_file_list="${tm_file_list} \$(srcdir)/config/$f"
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 8bfd6feb780..26fa46802c7 100644
+index 54e21764b3e..f83420326d6 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -2138,8 +2138,8 @@ for f in $tm_file; do
+@@ -2263,8 +2263,8 @@ for f in $tm_file; do
         tm_include_list="${tm_include_list} $f"
         ;;
      defaults.h )
@@ -69,7 +69,7 @@ index 8bfd6feb780..26fa46802c7 100644
      * )
         tm_file_list="${tm_file_list} \$(srcdir)/config/$f"
 diff --git a/gcc/mkconfig.sh b/gcc/mkconfig.sh
-index d2c677a4a42..d03852481cb 100644
+index c49acd8f7e4..a0a657bdbb9 100644
 --- a/gcc/mkconfig.sh
 +++ b/gcc/mkconfig.sh
 @@ -77,7 +77,7 @@ if [ -n "$HEADERS" ]; then
diff --git a/meta/recipes-devtools/gcc/gcc/0008-fortran-cross-compile-hack.patch b/meta/recipes-devtools/gcc/gcc/0008-fortran-cross-compile-hack.patch
index 714db3bef5..47f611e37e 100644
--- a/meta/recipes-devtools/gcc/gcc/0008-fortran-cross-compile-hack.patch
+++ b/meta/recipes-devtools/gcc/gcc/0008-fortran-cross-compile-hack.patch
@@ -1,4 +1,4 @@
-From f05062625e7a4751be723595a2f7a4b7fbeff311 Mon Sep 17 00:00:00 2001
+From 904d102e3ccb93296b16ceb2e283a6ccf3c1d718 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:20:01 +0400
 Subject: [PATCH] fortran cross-compile hack.
@@ -16,10 +16,10 @@ Upstream-Status: Inappropriate [embedded specific]
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/libgfortran/configure b/libgfortran/configure
-index b4cf854ddb3..e8e0ac3b1cf 100755
+index f3634389cf8..f974e874b8e 100755
 --- a/libgfortran/configure
 +++ b/libgfortran/configure
-@@ -13090,7 +13090,7 @@ esac
+@@ -13102,7 +13102,7 @@ esac
  
  # We need gfortran to compile parts of the library
  #AC_PROG_FC(gfortran)
@@ -29,10 +29,10 @@ index b4cf854ddb3..e8e0ac3b1cf 100755
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
index 8ad6853d81..c720defa35 100644
--- a/meta/recipes-devtools/gcc/gcc/0009-cpp-honor-sysroot.patch
+++ b/meta/recipes-devtools/gcc/gcc/0009-cpp-honor-sysroot.patch
@@ -1,4 +1,4 @@
-From 1d76de7f1f5c99f1fa1a4b14aedad3d702e4e136 Mon Sep 17 00:00:00 2001
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
-index 48b0f9dde81..c87f603955f 100644
+index 1bc45285384..8737bae5353 100644
 --- a/gcc/gcc.c
 +++ b/gcc/gcc.c
-@@ -1348,7 +1348,7 @@ static const struct compiler default_compilers[] =
+@@ -1470,7 +1470,7 @@ static const struct compiler default_compilers[] =
  					   %W{o*:--output-pch=%*}}%V}}}}}}}", 0, 0, 0},
    {".i", "@cpp-output", 0, 0, 0},
    {"@cpp-output",
diff --git a/meta/recipes-devtools/gcc/gcc/0010-MIPS64-Default-to-N64-ABI.patch b/meta/recipes-devtools/gcc/gcc/0010-MIPS64-Default-to-N64-ABI.patch
index 625e2d8709..f385f8c5a2 100644
--- a/meta/recipes-devtools/gcc/gcc/0010-MIPS64-Default-to-N64-ABI.patch
+++ b/meta/recipes-devtools/gcc/gcc/0010-MIPS64-Default-to-N64-ABI.patch
@@ -1,4 +1,4 @@
-From 4fad4433c96bc9d0d9d124f9674fb3389f6f426e Mon Sep 17 00:00:00 2001
+From a2dc2fa4cc7e5d54544d4a7b6601eef79bc26cad Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:23:08 +0400
 Subject: [PATCH] MIPS64: Default to N64 ABI
@@ -14,10 +14,10 @@ Upstream-Status: Inappropriate [OE config specific]
  1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/gcc/config.gcc b/gcc/config.gcc
-index cf1a87e2efd..37c4221a39f 100644
+index 3ec7582f5dd..a046fa6945c 100644
 --- a/gcc/config.gcc
 +++ b/gcc/config.gcc
-@@ -2511,29 +2511,29 @@ mips*-*-linux*)				# Linux MIPS, either endian.
+@@ -2543,29 +2543,29 @@ mips*-*-linux*)				# Linux MIPS, either endian.
  			default_mips_arch=mips32
  			;;
  		mips64el-st-linux-gnu)
diff --git a/meta/recipes-devtools/gcc/gcc/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
index e357976330..4726267a80 100644
--- a/meta/recipes-devtools/gcc/gcc/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
+++ b/meta/recipes-devtools/gcc/gcc/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
@@ -1,4 +1,4 @@
-From 8fc016a53c22c19feccbfa13ebdf19090dc67058 Mon Sep 17 00:00:00 2001
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
-index 34776c8421e..967c1c43c63 100644
+index e3f2cd254f6..a11e01faa3d 100644
 --- a/gcc/config/rs6000/linux64.h
 +++ b/gcc/config/rs6000/linux64.h
-@@ -419,24 +419,19 @@ extern int dot_symbols;
+@@ -336,24 +336,19 @@ extern int dot_symbols;
  #undef	LINK_OS_DEFAULT_SPEC
  #define LINK_OS_DEFAULT_SPEC "%(link_os_linux)"
  
@@ -201,7 +201,7 @@ index 34776c8421e..967c1c43c63 100644
  #undef  DEFAULT_ASM_ENDIAN
  #if (TARGET_DEFAULT & MASK_LITTLE_ENDIAN)
 diff --git a/gcc/config/sh/linux.h b/gcc/config/sh/linux.h
-index c1d0441d488..81373eb8336 100644
+index 7558d2f7195..3aaa6c3a078 100644
 --- a/gcc/config/sh/linux.h
 +++ b/gcc/config/sh/linux.h
 @@ -64,7 +64,7 @@ along with GCC; see the file COPYING3.  If not see
@@ -214,10 +214,10 @@ index c1d0441d488..81373eb8336 100644
  #undef SUBTARGET_LINK_EMUL_SUFFIX
  #define SUBTARGET_LINK_EMUL_SUFFIX "%{mfdpic:_fd;:_linux}"
 diff --git a/gcc/config/sparc/linux.h b/gcc/config/sparc/linux.h
-index 81201e67a2f..8b6fc577594 100644
+index 2550d7ee8f0..a94f4cd8ba2 100644
 --- a/gcc/config/sparc/linux.h
 +++ b/gcc/config/sparc/linux.h
-@@ -84,7 +84,7 @@ extern const char *host_detect_local_cpu (int argc, const char **argv);
+@@ -78,7 +78,7 @@ extern const char *host_detect_local_cpu (int argc, const char **argv);
     When the -shared link option is used a final link is not being
     done.  */
  
@@ -227,10 +227,10 @@ index 81201e67a2f..8b6fc577594 100644
  #undef  LINK_SPEC
  #define LINK_SPEC "-m elf32_sparc %{shared:-shared} \
 diff --git a/gcc/config/sparc/linux64.h b/gcc/config/sparc/linux64.h
-index a1a0efd8f28..85d1084afc2 100644
+index 95af8afa9b5..63127afb074 100644
 --- a/gcc/config/sparc/linux64.h
 +++ b/gcc/config/sparc/linux64.h
-@@ -84,8 +84,8 @@ along with GCC; see the file COPYING3.  If not see
+@@ -78,8 +78,8 @@ along with GCC; see the file COPYING3.  If not see
     When the -shared link option is used a final link is not being
     done.  */
  
diff --git a/meta/recipes-devtools/gcc/gcc/0012-gcc-Fix-argument-list-too-long-error.patch b/meta/recipes-devtools/gcc/gcc/0012-gcc-Fix-argument-list-too-long-error.patch
index 88e1715b5c..814ce18b98 100644
--- a/meta/recipes-devtools/gcc/gcc/0012-gcc-Fix-argument-list-too-long-error.patch
+++ b/meta/recipes-devtools/gcc/gcc/0012-gcc-Fix-argument-list-too-long-error.patch
@@ -1,4 +1,4 @@
-From a22d1264049d29b90663cf5667049ae6f9b7a5ce Mon Sep 17 00:00:00 2001
+From 12646c0899dec1b127ce71ebacf2571c1c7360f4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:26:37 +0400
 Subject: [PATCH] gcc: Fix argument list too long error.
@@ -22,17 +22,18 @@ fix. Add the sort to the original gcc code, leaving the tr+sort to fix the origi
 issue but include the new files too as reported by Zhuang <qiuguang.zqg@alibaba-inc.com>
 
 Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  gcc/Makefile.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index a67d2cc18d6..480c9366418 100644
+index 7da6f439fff..59c45c81393 100644
 --- a/gcc/Makefile.in
 +++ b/gcc/Makefile.in
-@@ -3606,7 +3606,7 @@ install-plugin: installdirs lang.install-plugin s-header-vars install-gengtype
- # We keep the directory structure for files in config or c-family and .def
- # files. All other files are flattened to a single directory.
+@@ -3678,7 +3678,7 @@ install-plugin: installdirs lang.install-plugin s-header-vars install-gengtype
+ # We keep the directory structure for files in config, common/config or
+ # c-family and .def files. All other files are flattened to a single directory.
  	$(mkinstalldirs) $(DESTDIR)$(plugin_includedir)
 -	headers=`echo $(PLUGIN_HEADERS) $$(cd $(srcdir); echo *.h *.def) | tr ' ' '\012' | sort -u`; \
 +	headers=`echo $(sort $(PLUGIN_HEADERS)) $$(cd $(srcdir); echo *.h *.def) | tr ' ' '\012' | sort -u`; \
diff --git a/meta/recipes-devtools/gcc/gcc/0013-Disable-sdt.patch b/meta/recipes-devtools/gcc/gcc/0013-Disable-sdt.patch
index 207cdb57af..1e657666df 100644
--- a/meta/recipes-devtools/gcc/gcc/0013-Disable-sdt.patch
+++ b/meta/recipes-devtools/gcc/gcc/0013-Disable-sdt.patch
@@ -1,4 +1,4 @@
-From fa47586935a18ecfc2ad5586802e326e21741b7b Mon Sep 17 00:00:00 2001
+From 7928a4eddc4a6d821a6aa6eaaea1fd60d54e3da9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:28:10 +0400
 Subject: [PATCH] Disable sdt.
@@ -25,10 +25,10 @@ Upstream-Status: Inappropriate [hack]
  4 files changed, 19 insertions(+), 19 deletions(-)
 
 diff --git a/gcc/configure b/gcc/configure
-index b26e8fc7fee..6080f86145e 100755
+index c5d3bc4ee2d..5160917d73e 100755
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -29789,12 +29789,12 @@ fi
+@@ -30812,12 +30812,12 @@ fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking sys/sdt.h in the target C library" >&5
  $as_echo_n "checking sys/sdt.h in the target C library... " >&6; }
  have_sys_sdt_h=no
@@ -48,10 +48,10 @@ index b26e8fc7fee..6080f86145e 100755
  $as_echo "$have_sys_sdt_h" >&6; }
  
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 26fa46802c7..42be5252778 100644
+index f83420326d6..50f78308e8a 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -6190,15 +6190,15 @@ fi
+@@ -6653,15 +6653,15 @@ fi
  AC_SUBST([enable_default_ssp])
  
  # Test for <sys/sdt.h> on the target.
@@ -77,10 +77,10 @@ index 26fa46802c7..42be5252778 100644
  # Check if TFmode long double should be used by default or not.
  # Some glibc targets used DFmode long double, but with glibc 2.4
 diff --git a/libstdc++-v3/configure b/libstdc++-v3/configure
-index 9f9c5a2419a..71ed13b815b 100755
+index a310e9feb6c..c879445b8a6 100755
 --- a/libstdc++-v3/configure
 +++ b/libstdc++-v3/configure
-@@ -22615,11 +22615,11 @@ ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
+@@ -22014,11 +22014,11 @@ ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
  ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
  ac_compiler_gnu=$ac_cv_c_compiler_gnu
  
@@ -96,10 +96,10 @@ index 9f9c5a2419a..71ed13b815b 100755
  $as_echo "$glibcxx_cv_sys_sdt_h" >&6; }
  
 diff --git a/libstdc++-v3/configure.ac b/libstdc++-v3/configure.ac
-index 699e55fd829..5c7a7bda439 100644
+index 3c799be82b1..3f63a8ec9ce 100644
 --- a/libstdc++-v3/configure.ac
 +++ b/libstdc++-v3/configure.ac
-@@ -241,7 +241,7 @@ GLIBCXX_CHECK_SC_NPROCESSORS_ONLN
+@@ -240,7 +240,7 @@ GLIBCXX_CHECK_SC_NPROCESSORS_ONLN
  GLIBCXX_CHECK_SC_NPROC_ONLN
  GLIBCXX_CHECK_PTHREADS_NUM_PROCESSORS_NP
  GLIBCXX_CHECK_SYSCTL_HW_NCPU
diff --git a/meta/recipes-devtools/gcc/gcc/0014-libtool.patch b/meta/recipes-devtools/gcc/gcc/0014-libtool.patch
index f4e70c3b18..f2b8924ebf 100644
--- a/meta/recipes-devtools/gcc/gcc/0014-libtool.patch
+++ b/meta/recipes-devtools/gcc/gcc/0014-libtool.patch
@@ -1,4 +1,4 @@
-From 6ecd478881468934444ff85611fd43f7033b1e81 Mon Sep 17 00:00:00 2001
+From a5b984db9669cf38a7bd76c3fcdb41c086f740db Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:29:11 +0400
 Subject: [PATCH] libtool
diff --git a/meta/recipes-devtools/gcc/gcc/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch b/meta/recipes-devtools/gcc/gcc/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
index bc2674abcc..1ccf39ceba 100644
--- a/meta/recipes-devtools/gcc/gcc/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
+++ b/meta/recipes-devtools/gcc/gcc/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
@@ -1,4 +1,4 @@
-From de4427fa49c07dc651ee6ceaf5c5078700ca3b08 Mon Sep 17 00:00:00 2001
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
index 1dc4bb859a..bde7ec6609 100644
--- a/meta/recipes-devtools/gcc/gcc/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch
+++ b/meta/recipes-devtools/gcc/gcc/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch
@@ -1,4 +1,4 @@
-From 6b363c2c1c089ee900efa6013aefba1003840a37 Mon Sep 17 00:00:00 2001
+From 5ce8aa4615a3816d12c43752323154744517ae9f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:33:04 +0400
 Subject: [PATCH] Use the multilib config files from ${B} instead of using the
@@ -18,10 +18,10 @@ Upstream-Status: Inappropriate [configuration]
  2 files changed, 36 insertions(+), 8 deletions(-)
 
 diff --git a/gcc/configure b/gcc/configure
-index 6080f86145e..825a9652329 100755
+index 5160917d73e..e663052cad2 100755
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -12685,10 +12685,20 @@ done
+@@ -13070,10 +13070,20 @@ done
  tmake_file_=
  for f in ${tmake_file}
  do
@@ -46,7 +46,7 @@ index 6080f86145e..825a9652329 100755
  done
  tmake_file="${tmake_file_}${omp_device_property_tmake_file}"
  
-@@ -12699,6 +12709,10 @@ tm_file_list="options.h"
+@@ -13084,6 +13094,10 @@ tm_file_list="options.h"
  tm_include_list="options.h insn-constants.h"
  for f in $tm_file; do
    case $f in
@@ -58,10 +58,10 @@ index 6080f86145e..825a9652329 100755
         f=`echo $f | sed 's/^..//'`
         tm_file_list="${tm_file_list} $f"
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 42be5252778..6099eb3251f 100644
+index 50f78308e8a..2b84875b028 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -2118,10 +2118,20 @@ done
+@@ -2243,10 +2243,20 @@ done
  tmake_file_=
  for f in ${tmake_file}
  do
@@ -86,7 +86,7 @@ index 42be5252778..6099eb3251f 100644
  done
  tmake_file="${tmake_file_}${omp_device_property_tmake_file}"
  
-@@ -2132,6 +2142,10 @@ tm_file_list="options.h"
+@@ -2257,6 +2267,10 @@ tm_file_list="options.h"
  tm_include_list="options.h insn-constants.h"
  for f in $tm_file; do
    case $f in
diff --git a/meta/recipes-devtools/gcc/gcc/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch b/meta/recipes-devtools/gcc/gcc/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
index 05f12847e9..3e0a1b4136 100644
--- a/meta/recipes-devtools/gcc/gcc/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
+++ b/meta/recipes-devtools/gcc/gcc/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
@@ -1,4 +1,4 @@
-From 08752c2f1d21553301bee5757c453c6a36cbe03c Mon Sep 17 00:00:00 2001
+From 75a1ce0265ca123f74f17a40ad8bd8f26d9c2ab3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 09:39:38 +0000
 Subject: [PATCH] Avoid using libdir from .la which usually points to a host
diff --git a/meta/recipes-devtools/gcc/gcc/0018-export-CPP.patch b/meta/recipes-devtools/gcc/gcc/0018-export-CPP.patch
index 886a1221d3..e6596da5c7 100644
--- a/meta/recipes-devtools/gcc/gcc/0018-export-CPP.patch
+++ b/meta/recipes-devtools/gcc/gcc/0018-export-CPP.patch
@@ -1,4 +1,4 @@
-From 5c3d66378c7ff60ca11a875aa4aa6f8a8529d43a Mon Sep 17 00:00:00 2001
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
index 2797b2c22d..98472dd2b5 100644
--- a/meta/recipes-devtools/gcc/gcc/0019-Ensure-target-gcc-headers-can-be-included.patch
+++ b/meta/recipes-devtools/gcc/gcc/0019-Ensure-target-gcc-headers-can-be-included.patch
@@ -1,4 +1,4 @@
-From 378b752c5d9a3dba4e58cdadf8b4b4f34ea99a76 Mon Sep 17 00:00:00 2001
+From 9b4eb0e18a953d79d20c78d3ba741af6d71ab9ca Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 10:25:11 +0000
 Subject: [PATCH] Ensure target gcc headers can be included
@@ -21,10 +21,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 6 insertions(+)
 
 diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index 480c9366418..011c7ac2db6 100644
+index 59c45c81393..9b17d120aa1 100644
 --- a/gcc/Makefile.in
 +++ b/gcc/Makefile.in
-@@ -618,6 +618,7 @@ libexecdir = @libexecdir@
+@@ -630,6 +630,7 @@ libexecdir = @libexecdir@
  
  # Directory in which the compiler finds libraries etc.
  libsubdir = $(libdir)/gcc/$(real_target_noncanonical)/$(version)$(accel_dir_suffix)
@@ -32,7 +32,7 @@ index 480c9366418..011c7ac2db6 100644
  # Directory in which the compiler finds executables
  libexecsubdir = $(libexecdir)/gcc/$(real_target_noncanonical)/$(version)$(accel_dir_suffix)
  # Directory in which all plugin resources are installed
-@@ -2946,6 +2947,7 @@ CFLAGS-intl.o += -DLOCALEDIR=\"$(localedir)\"
+@@ -3016,6 +3017,7 @@ CFLAGS-intl.o += -DLOCALEDIR=\"$(localedir)\"
  
  PREPROCESSOR_DEFINES = \
    -DGCC_INCLUDE_DIR=\"$(libsubdir)/include\" \
@@ -41,10 +41,10 @@ index 480c9366418..011c7ac2db6 100644
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
index c3baf8b451..bb2a3671f0 100644
--- a/meta/recipes-devtools/gcc/gcc/0020-Don-t-search-host-directory-during-relink-if-inst_pr.patch
+++ b/meta/recipes-devtools/gcc/gcc/0020-Don-t-search-host-directory-during-relink-if-inst_pr.patch
@@ -1,4 +1,4 @@
-From 870e805d705d99d9b9d7dbd09727f9c1d2ad9c1d Mon Sep 17 00:00:00 2001
+From cd09adb1e7f2a7e81a9f595a17c36f24911b90ac Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 3 Mar 2015 08:21:19 +0000
 Subject: [PATCH] Don't search host directory during "relink" if $inst_prefix
diff --git a/meta/recipes-devtools/gcc/gcc/0021-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch b/meta/recipes-devtools/gcc/gcc/0021-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
index abee48669d..0f3b3869b0 100644
--- a/meta/recipes-devtools/gcc/gcc/0021-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
+++ b/meta/recipes-devtools/gcc/gcc/0021-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
@@ -1,4 +1,4 @@
-From aba42de763a619355471efd1573561b0cbf51162 Mon Sep 17 00:00:00 2001
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
index c55b66d4ba..41536a8a3b 100644
--- a/meta/recipes-devtools/gcc/gcc/0022-aarch64-Add-support-for-musl-ldso.patch
+++ b/meta/recipes-devtools/gcc/gcc/0022-aarch64-Add-support-for-musl-ldso.patch
@@ -1,4 +1,4 @@
-From d63820a78d92f302410358293546f01c7ad17bd8 Mon Sep 17 00:00:00 2001
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
index 80c4d2292c..fb4511cc1a 100644
--- a/meta/recipes-devtools/gcc/gcc/0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch
+++ b/meta/recipes-devtools/gcc/gcc/0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch
@@ -1,4 +1,4 @@
-From 3474e16ad4ea8cf4e0e330568e3bc9039e723dce Mon Sep 17 00:00:00 2001
+From 2cfc5ee38b3f5ec1d7965aae0991bcd48b5dc2e6 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Sun, 5 Jul 2015 20:25:18 -0700
 Subject: [PATCH] libcc1: fix libcc1's install path and rpath
@@ -20,10 +20,10 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  2 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/libcc1/Makefile.am b/libcc1/Makefile.am
-index c005b0dad4a..ec31d35b7b9 100644
+index f148fdd7aa2..0b6eb8f2855 100644
 --- a/libcc1/Makefile.am
 +++ b/libcc1/Makefile.am
-@@ -37,8 +37,8 @@ libiberty = $(if $(wildcard $(libiberty_noasan)),$(Wc)$(libiberty_noasan), \
+@@ -40,8 +40,8 @@ libiberty = $(if $(wildcard $(libiberty_noasan)),$(Wc)$(libiberty_noasan), \
  	    $(Wc)$(libiberty_normal)))
  libiberty_dep = $(patsubst $(Wc)%,%,$(libiberty))
  
@@ -35,10 +35,10 @@ index c005b0dad4a..ec31d35b7b9 100644
  if ENABLE_PLUGIN
  plugin_LTLIBRARIES = libcc1plugin.la libcp1plugin.la
 diff --git a/libcc1/Makefile.in b/libcc1/Makefile.in
-index 7104b649026..2103c477468 100644
+index 753d435c9cb..455627b0a3b 100644
 --- a/libcc1/Makefile.in
 +++ b/libcc1/Makefile.in
-@@ -393,8 +393,8 @@ libiberty = $(if $(wildcard $(libiberty_noasan)),$(Wc)$(libiberty_noasan), \
+@@ -398,8 +398,8 @@ libiberty = $(if $(wildcard $(libiberty_noasan)),$(Wc)$(libiberty_noasan), \
  	    $(Wc)$(libiberty_normal)))
  
  libiberty_dep = $(patsubst $(Wc)%,%,$(libiberty))
diff --git a/meta/recipes-devtools/gcc/gcc/0024-handle-sysroot-support-for-nativesdk-gcc.patch b/meta/recipes-devtools/gcc/gcc/0024-handle-sysroot-support-for-nativesdk-gcc.patch
index dc3e6da65a..3958e9c212 100644
--- a/meta/recipes-devtools/gcc/gcc/0024-handle-sysroot-support-for-nativesdk-gcc.patch
+++ b/meta/recipes-devtools/gcc/gcc/0024-handle-sysroot-support-for-nativesdk-gcc.patch
@@ -1,4 +1,4 @@
-From 702daf2e9cb97337e0e594fcd435b1b61a917d14 Mon Sep 17 00:00:00 2001
+From 35c084a051bcd6587ebc73e4acb045cb2bdf7e99 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 7 Dec 2015 23:39:54 +0000
 Subject: [PATCH] handle sysroot support for nativesdk-gcc
@@ -41,10 +41,10 @@ Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
  6 files changed, 70 insertions(+), 48 deletions(-)
 
 diff --git a/gcc/c-family/c-opts.c b/gcc/c-family/c-opts.c
-index 58ba0948e79..806bbcfb7a5 100644
+index bd15b9cd902..2bd667e3f58 100644
 --- a/gcc/c-family/c-opts.c
 +++ b/gcc/c-family/c-opts.c
-@@ -1409,8 +1409,8 @@ add_prefixed_path (const char *suffix, incpath_kind chain)
+@@ -1436,8 +1436,8 @@ add_prefixed_path (const char *suffix, incpath_kind chain)
    size_t prefix_len, suffix_len;
  
    suffix_len = strlen (suffix);
@@ -56,7 +56,7 @@ index 58ba0948e79..806bbcfb7a5 100644
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
-index c87f603955f..535d5c3bb65 100644
+index 8737bae5353..aa6fbe43965 100644
 --- a/gcc/gcc.c
 +++ b/gcc/gcc.c
 @@ -252,6 +252,8 @@ FILE *report_times_to_file = NULL;
@@ -226,7 +229,7 @@ index c87f603955f..535d5c3bb65 100644
  /* Nonzero means pass the updated target_system_root to the compiler.  */
  
  static int target_system_root_changed;
-@@ -526,6 +528,7 @@ or with constant text in a single argument.
+@@ -568,6 +570,7 @@ or with constant text in a single argument.
   %G     process LIBGCC_SPEC as a spec.
   %R     Output the concatenation of target_system_root and
          target_sysroot_suffix.
@@ -234,7 +237,7 @@ index c87f603955f..535d5c3bb65 100644
   %S     process STARTFILE_SPEC as a spec.  A capital S is actually used here.
   %E     process ENDFILE_SPEC as a spec.  A capital E is actually used here.
   %C     process CPP_SPEC as a spec.
-@@ -1499,10 +1502,10 @@ static const char *gcc_libexec_prefix;
+@@ -1621,10 +1624,10 @@ static const char *gcc_libexec_prefix;
     gcc_exec_prefix is set because, in that case, we know where the
     compiler has been installed, and use paths relative to that
     location instead.  */
@@ -249,7 +252,7 @@ index c87f603955f..535d5c3bb65 100644
  
  /* For native compilers, these are well-known paths containing
     components that may be provided by the system.  For cross
-@@ -1510,9 +1513,9 @@ static const char *const standard_startfile_prefix = STANDARD_STARTFILE_PREFIX;
+@@ -1632,9 +1635,9 @@ static const char *const standard_startfile_prefix = STANDARD_STARTFILE_PREFIX;
  static const char *md_exec_prefix = MD_EXEC_PREFIX;
  static const char *md_startfile_prefix = MD_STARTFILE_PREFIX;
  static const char *md_startfile_prefix_1 = MD_STARTFILE_PREFIX_1;
@@ -261,7 +264,7 @@ index c87f603955f..535d5c3bb65 100644
    = STANDARD_STARTFILE_PREFIX_2;
  
  /* A relative path to be used in finding the location of tools
-@@ -5952,6 +5955,11 @@ do_spec_1 (const char *spec, int inswitch, const char *soft_matched_part)
+@@ -6564,6 +6567,11 @@ do_spec_1 (const char *spec, int inswitch, const char *soft_matched_part)
  	      }
  	    break;
  
@@ -274,7 +277,7 @@ index c87f603955f..535d5c3bb65 100644
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
@@ -344,6 +347,3 @@ index 1a403e535bd..c26d07bde12 100644
  
        /* We used to strip trailing DIR_SEPARATORs here, but that can
  	 sometimes yield a result with no separator when one was coded
--- 
-2.29.2
-
diff --git a/meta/recipes-devtools/gcc/gcc/0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch b/meta/recipes-devtools/gcc/gcc/0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch
index abf1f8491f..ff622b1056 100644
--- a/meta/recipes-devtools/gcc/gcc/0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch
+++ b/meta/recipes-devtools/gcc/gcc/0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch
@@ -1,4 +1,4 @@
-From 9c0c73ee48dbee2aad57f4dcdad1b7b74e77b944 Mon Sep 17 00:00:00 2001
+From c55e24459370ad96577496ecd87475e3a9de7dad Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 7 Dec 2015 23:41:45 +0000
 Subject: [PATCH] Search target sysroot gcc version specific dirs with
@@ -51,10 +51,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 28 insertions(+), 1 deletion(-)
 
 diff --git a/gcc/gcc.c b/gcc/gcc.c
-index 535d5c3bb65..04647ae812d 100644
+index aa6fbe43965..f8a71a13826 100644
 --- a/gcc/gcc.c
 +++ b/gcc/gcc.c
-@@ -2616,7 +2616,7 @@ for_each_path (const struct path_prefix *paths,
+@@ -2811,7 +2811,7 @@ for_each_path (const struct path_prefix *paths,
        if (path == NULL)
  	{
  	  len = paths->max_len + extra_space + 1;
@@ -63,7 +63,7 @@ index 535d5c3bb65..04647ae812d 100644
  	  path = XNEWVEC (char, len);
  	}
  
-@@ -2628,6 +2628,33 @@ for_each_path (const struct path_prefix *paths,
+@@ -2823,6 +2823,33 @@ for_each_path (const struct path_prefix *paths,
  	  /* Look first in MACHINE/VERSION subdirectory.  */
  	  if (!skip_multi_dir)
  	    {
diff --git a/meta/recipes-devtools/gcc/gcc/0026-Fix-various-_FOR_BUILD-and-related-variables.patch b/meta/recipes-devtools/gcc/gcc/0026-Fix-various-_FOR_BUILD-and-related-variables.patch
index 97bf2f3a73..c2698f9eeb 100644
--- a/meta/recipes-devtools/gcc/gcc/0026-Fix-various-_FOR_BUILD-and-related-variables.patch
+++ b/meta/recipes-devtools/gcc/gcc/0026-Fix-various-_FOR_BUILD-and-related-variables.patch
@@ -1,4 +1,4 @@
-From 3a003af8804dda90fdf4862eca5f66cb12faaf02 Mon Sep 17 00:00:00 2001
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
-index 011c7ac2db6..2f1165f7b5e 100644
+index 9b17d120aa1..3053d05903c 100644
 --- a/gcc/Makefile.in
 +++ b/gcc/Makefile.in
-@@ -805,7 +805,7 @@ BUILD_LDFLAGS=@BUILD_LDFLAGS@
+@@ -820,7 +820,7 @@ BUILD_LDFLAGS=@BUILD_LDFLAGS@
  BUILD_NO_PIE_FLAG = @BUILD_NO_PIE_FLAG@
  BUILD_LDFLAGS += $(BUILD_NO_PIE_FLAG)
  BUILD_CPPFLAGS= -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
@@ -107,10 +107,10 @@ index 011c7ac2db6..2f1165f7b5e 100644
  # Actual name to use when installing a native compiler.
  GCC_INSTALL_NAME := $(shell echo gcc|sed '$(program_transform_name)')
 diff --git a/gcc/configure b/gcc/configure
-index 825a9652329..ff46cf58960 100755
+index e663052cad2..b0906aa3e96 100755
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -12314,7 +12314,7 @@ else
+@@ -12699,7 +12699,7 @@ else
  	CC="${CC_FOR_BUILD}" CFLAGS="${CFLAGS_FOR_BUILD}" \
  	CXX="${CXX_FOR_BUILD}" CXXFLAGS="${CXXFLAGS_FOR_BUILD}" \
  	LD="${LD_FOR_BUILD}" LDFLAGS="${LDFLAGS_FOR_BUILD}" \
@@ -120,10 +120,10 @@ index 825a9652329..ff46cf58960 100755
  		--enable-languages=${enable_languages-all} \
  		${enable_obsolete+--enable-obsolete="$enable_obsolete"} \
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 6099eb3251f..b3c345b61dc 100644
+index 2b84875b028..bfbd8946e8a 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -1898,7 +1898,7 @@ else
+@@ -2023,7 +2023,7 @@ else
  	CC="${CC_FOR_BUILD}" CFLAGS="${CFLAGS_FOR_BUILD}" \
  	CXX="${CXX_FOR_BUILD}" CXXFLAGS="${CXXFLAGS_FOR_BUILD}" \
  	LD="${LD_FOR_BUILD}" LDFLAGS="${LDFLAGS_FOR_BUILD}" \
diff --git a/meta/recipes-devtools/gcc/gcc/0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch b/meta/recipes-devtools/gcc/gcc/0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch
index 3cd75b7183..2e65740ec0 100644
--- a/meta/recipes-devtools/gcc/gcc/0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch
+++ b/meta/recipes-devtools/gcc/gcc/0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch
@@ -1,4 +1,4 @@
-From 4e53d0ae70af85af0e112a48a3e4dfe4c39f4a8d Mon Sep 17 00:00:00 2001
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
index 2a6769a82e..edca9e3ca4 100644
--- a/meta/recipes-devtools/gcc/gcc/0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
+++ b/meta/recipes-devtools/gcc/gcc/0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
@@ -1,4 +1,4 @@
-From 5db0404eb770ac477fd99d444226bcf021067584 Mon Sep 17 00:00:00 2001
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
-index 967c1c43c63..dc5e4d97975 100644
+index a11e01faa3d..ce464f3626b 100644
 --- a/gcc/config/rs6000/linux64.h
 +++ b/gcc/config/rs6000/linux64.h
-@@ -452,6 +452,16 @@ extern int dot_symbols;
+@@ -369,6 +369,16 @@ extern int dot_symbols;
  					   " -m elf64ppc")
  #endif
  
diff --git a/meta/recipes-devtools/gcc/gcc/0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch b/meta/recipes-devtools/gcc/gcc/0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
index 767cba0380..b74aeb8bb6 100644
--- a/meta/recipes-devtools/gcc/gcc/0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
+++ b/meta/recipes-devtools/gcc/gcc/0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
@@ -1,4 +1,4 @@
-From fbc926dbf6a47fa623b9c94cd9b09a0e90448fdc Mon Sep 17 00:00:00 2001
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
index 4f18907a1d..86f75d0d51 100644
--- a/meta/recipes-devtools/gcc/gcc/0030-sync-gcc-stddef.h-with-musl.patch
+++ b/meta/recipes-devtools/gcc/gcc/0030-sync-gcc-stddef.h-with-musl.patch
@@ -1,4 +1,4 @@
-From 24dc04dc8d69e3bf61322615b3ef18e02ccd311e Mon Sep 17 00:00:00 2001
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
index 702279af0e..70afa4f9e9 100644
--- a/meta/recipes-devtools/gcc/gcc/0031-fix-segmentation-fault-in-precompiled-header-generat.patch
+++ b/meta/recipes-devtools/gcc/gcc/0031-fix-segmentation-fault-in-precompiled-header-generat.patch
@@ -1,4 +1,4 @@
-From 27b8ba5555ada2dab076988529bfb84d00a4b901 Mon Sep 17 00:00:00 2001
+From 3d59f763b824ac11f8360931092baf0bc1719562 Mon Sep 17 00:00:00 2001
 From: Juro Bystricky <juro.bystricky@intel.com>
 Date: Mon, 19 Mar 2018 22:31:20 -0700
 Subject: [PATCH] fix segmentation fault in precompiled header generation
@@ -19,10 +19,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 21 insertions(+), 5 deletions(-)
 
 diff --git a/libcpp/lex.c b/libcpp/lex.c
-index 56ac3a1dd73..73a951148b3 100644
+index 06bcc31c87e..24bed9a35fa 100644
 --- a/libcpp/lex.c
 +++ b/libcpp/lex.c
-@@ -3311,11 +3311,27 @@ cpp_spell_token (cpp_reader *pfile, const cpp_token *token,
+@@ -3531,11 +3531,27 @@ cpp_spell_token (cpp_reader *pfile, const cpp_token *token,
      spell_ident:
      case SPELL_IDENT:
        if (forstring)
diff --git a/meta/recipes-devtools/gcc/gcc/0032-Fix-for-testsuite-failure.patch b/meta/recipes-devtools/gcc/gcc/0032-Fix-for-testsuite-failure.patch
index 0a0767b441..0be03e652b 100644
--- a/meta/recipes-devtools/gcc/gcc/0032-Fix-for-testsuite-failure.patch
+++ b/meta/recipes-devtools/gcc/gcc/0032-Fix-for-testsuite-failure.patch
@@ -1,4 +1,4 @@
-From 2512aacf023c679d86d8f40caff4f6ff412b32ff Mon Sep 17 00:00:00 2001
+From bb171ef618f8892bd56e57ae41ecb6e02caa8173 Mon Sep 17 00:00:00 2001
 From: RAGHUNATH LOLUR <raghunath.lolur@kpit.com>
 Date: Wed, 6 Dec 2017 22:52:26 -0800
 Subject: [PATCH] Fix for testsuite failure
diff --git a/meta/recipes-devtools/gcc/gcc/0033-Re-introduce-spe-commandline-options.patch b/meta/recipes-devtools/gcc/gcc/0033-Re-introduce-spe-commandline-options.patch
index ba7c2b8fd5..129f555a48 100644
--- a/meta/recipes-devtools/gcc/gcc/0033-Re-introduce-spe-commandline-options.patch
+++ b/meta/recipes-devtools/gcc/gcc/0033-Re-introduce-spe-commandline-options.patch
@@ -1,4 +1,4 @@
-From 3fc06241ce37e2e4b3ed21ace28d347eb511448d Mon Sep 17 00:00:00 2001
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
-index f95b8279270..0e52d51409d 100644
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
@@ -33,6 +34,6 @@ index f95b8279270..0e52d51409d 100644
 +Target RejectNegative Var(rs6000_spe_abi, 0)
 +Do not use the SPE ABI extensions.
 +
+ ; Altivec ABI
  mabi=altivec
  Target RejectNegative Var(rs6000_altivec_abi) Save
- Use the AltiVec ABI extensions.
diff --git a/meta/recipes-devtools/gcc/gcc/0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch b/meta/recipes-devtools/gcc/gcc/0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
index 4ce9dc6def..3f666dc7bd 100644
--- a/meta/recipes-devtools/gcc/gcc/0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
+++ b/meta/recipes-devtools/gcc/gcc/0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
@@ -1,4 +1,4 @@
-From b42ff59c3fe2967d37815c8db72a47b9b7f585b4 Mon Sep 17 00:00:00 2001
+From ea9154338cb3acbd75945fddde4202e73c20dd1a Mon Sep 17 00:00:00 2001
 From: Szabolcs Nagy <nsz@port70.net>
 Date: Sat, 24 Oct 2015 20:09:53 +0000
 Subject: [PATCH] libgcc_s: Use alias for __cpu_indicator_init instead of
@@ -39,10 +39,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  3 files changed, 6 insertions(+), 6 deletions(-)
 
 diff --git a/gcc/config/i386/i386-expand.c b/gcc/config/i386/i386-expand.c
-index 48f00c5fcfc..468f5f71fac 100644
+index ac69eed4d32..ffaa44a16fc 100644
 --- a/gcc/config/i386/i386-expand.c
 +++ b/gcc/config/i386/i386-expand.c
-@@ -10941,10 +10941,10 @@ ix86_expand_builtin (tree exp, rtx target, rtx subtarget,
+@@ -11038,10 +11038,10 @@ ix86_expand_builtin (tree exp, rtx target, rtx subtarget,
      {
      case IX86_BUILTIN_CPU_INIT:
        {
@@ -56,11 +56,11 @@ index 48f00c5fcfc..468f5f71fac 100644
  	return expand_expr (call_expr, target, mode, EXPAND_NORMAL);
        }
 diff --git a/libgcc/config/i386/cpuinfo.c b/libgcc/config/i386/cpuinfo.c
-index 00322c58622..f42bbb8af98 100644
+index ef463848f9d..1a3de052c80 100644
 --- a/libgcc/config/i386/cpuinfo.c
 +++ b/libgcc/config/i386/cpuinfo.c
-@@ -508,7 +508,7 @@ __cpu_indicator_init (void)
-   return 0;
+@@ -63,7 +63,7 @@ __cpu_indicator_init (void)
+ 			     __cpu_features2);
  }
  
 -#if defined SHARED && defined USE_ELF_SYMVER
diff --git a/meta/recipes-devtools/gcc/gcc/0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch b/meta/recipes-devtools/gcc/gcc/0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
index dd1bf6dedc..874cd7798d 100644
--- a/meta/recipes-devtools/gcc/gcc/0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
+++ b/meta/recipes-devtools/gcc/gcc/0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
@@ -1,4 +1,4 @@
-From 0395060a7dcf98c5f5a65103f6aaa71d6b862259 Mon Sep 17 00:00:00 2001
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
-index bd78310ea24..dbd02c51a4c 100644
+index c268ebc4c6e..4361f3f1563 100644
 --- a/gcc/genmodes.c
 +++ b/gcc/genmodes.c
-@@ -430,7 +430,7 @@ complete_all_modes (void)
+@@ -438,7 +438,7 @@ complete_all_modes (void)
  }
  
  /* For each mode in class CLASS, construct a corresponding complex mode.  */
@@ -60,7 +60,7 @@ index bd78310ea24..dbd02c51a4c 100644
  static void
  make_complex_modes (enum mode_class cl,
  		    const char *file, unsigned int line)
-@@ -489,7 +489,7 @@ make_complex_modes (enum mode_class cl,
+@@ -497,7 +497,7 @@ make_complex_modes (enum mode_class cl,
     having as many components as necessary.  ORDER is the sorting order
     of the mode, with smaller numbers indicating a higher priority.  */
  #define VECTOR_MODES_WITH_PREFIX(PREFIX, C, W, ORDER) \
@@ -69,7 +69,7 @@ index bd78310ea24..dbd02c51a4c 100644
  #define VECTOR_MODES(C, W) VECTOR_MODES_WITH_PREFIX (V, C, W, 0)
  static void ATTRIBUTE_UNUSED
  make_vector_modes (enum mode_class cl, const char *prefix, unsigned int width,
-@@ -541,7 +541,7 @@ make_vector_modes (enum mode_class cl, const char *prefix, unsigned int width,
+@@ -549,7 +549,7 @@ make_vector_modes (enum mode_class cl, const char *prefix, unsigned int width,
  /* Create a vector of booleans called NAME with COUNT elements and
     BYTESIZE bytes in total.  */
  #define VECTOR_BOOL_MODE(NAME, COUNT, BYTESIZE) \
@@ -78,7 +78,7 @@ index bd78310ea24..dbd02c51a4c 100644
  static void ATTRIBUTE_UNUSED
  make_vector_bool_mode (const char *name, unsigned int count,
  		       unsigned int bytesize, const char *file,
-@@ -563,7 +563,7 @@ make_vector_bool_mode (const char *name, unsigned int count,
+@@ -571,7 +571,7 @@ make_vector_bool_mode (const char *name, unsigned int count,
  /* Input.  */
  
  #define _SPECIAL_MODE(C, N) \
@@ -87,7 +87,7 @@ index bd78310ea24..dbd02c51a4c 100644
  #define RANDOM_MODE(N) _SPECIAL_MODE (RANDOM, N)
  #define CC_MODE(N) _SPECIAL_MODE (CC, N)
  
-@@ -576,7 +576,7 @@ make_special_mode (enum mode_class cl, const char *name,
+@@ -584,7 +584,7 @@ make_special_mode (enum mode_class cl, const char *name,
  
  #define INT_MODE(N, Y) FRACTIONAL_INT_MODE (N, -1U, Y)
  #define FRACTIONAL_INT_MODE(N, B, Y) \
@@ -96,7 +96,7 @@ index bd78310ea24..dbd02c51a4c 100644
  
  static void
  make_int_mode (const char *name,
-@@ -589,16 +589,16 @@ make_int_mode (const char *name,
+@@ -611,16 +611,16 @@ make_opaque_mode (const char *name,
  }
  
  #define FRACT_MODE(N, Y, F) \
@@ -117,7 +117,7 @@ index bd78310ea24..dbd02c51a4c 100644
  
  /* Create a fixed-point mode by setting CL, NAME, BYTESIZE, IBIT, FBIT,
     FILE, and LINE.  */
-@@ -619,7 +619,7 @@ make_fixed_point_mode (enum mode_class cl,
+@@ -641,7 +641,7 @@ make_fixed_point_mode (enum mode_class cl,
  
  #define FLOAT_MODE(N, Y, F)             FRACTIONAL_FLOAT_MODE (N, -1U, Y, F)
  #define FRACTIONAL_FLOAT_MODE(N, B, Y, F) \
@@ -126,7 +126,7 @@ index bd78310ea24..dbd02c51a4c 100644
  
  static void
  make_float_mode (const char *name,
-@@ -636,7 +636,7 @@ make_float_mode (const char *name,
+@@ -658,7 +658,7 @@ make_float_mode (const char *name,
  #define DECIMAL_FLOAT_MODE(N, Y, F)	\
  	FRACTIONAL_DECIMAL_FLOAT_MODE (N, -1U, Y, F)
  #define FRACTIONAL_DECIMAL_FLOAT_MODE(N, B, Y, F)	\
@@ -135,7 +135,7 @@ index bd78310ea24..dbd02c51a4c 100644
  
  static void
  make_decimal_float_mode (const char *name,
-@@ -651,7 +651,7 @@ make_decimal_float_mode (const char *name,
+@@ -673,7 +673,7 @@ make_decimal_float_mode (const char *name,
  }
  
  #define RESET_FLOAT_FORMAT(N, F) \
@@ -144,7 +144,7 @@ index bd78310ea24..dbd02c51a4c 100644
  static void ATTRIBUTE_UNUSED
  reset_float_format (const char *name, const char *format,
  		    const char *file, unsigned int line)
-@@ -672,7 +672,7 @@ reset_float_format (const char *name, const char *format,
+@@ -694,7 +694,7 @@ reset_float_format (const char *name, const char *format,
  
  /* __intN support.  */
  #define INT_N(M,PREC)				\
@@ -153,7 +153,7 @@ index bd78310ea24..dbd02c51a4c 100644
  static void ATTRIBUTE_UNUSED
  make_int_n (const char *m, int bitsize,
              const char *file, unsigned int line)
-@@ -701,7 +701,7 @@ make_int_n (const char *m, int bitsize,
+@@ -723,7 +723,7 @@ make_int_n (const char *m, int bitsize,
  /* Partial integer modes are specified by relation to a full integer
     mode.  */
  #define PARTIAL_INT_MODE(M,PREC,NAME)				\
@@ -162,7 +162,7 @@ index bd78310ea24..dbd02c51a4c 100644
  static void ATTRIBUTE_UNUSED
  make_partial_integer_mode (const char *base, const char *name,
  			   unsigned int precision,
-@@ -728,7 +728,7 @@ make_partial_integer_mode (const char *base, const char *name,
+@@ -750,7 +750,7 @@ make_partial_integer_mode (const char *base, const char *name,
  /* A single vector mode can be specified by naming its component
     mode and the number of components.  */
  #define VECTOR_MODE(C, M, N) \
@@ -171,7 +171,7 @@ index bd78310ea24..dbd02c51a4c 100644
  static void ATTRIBUTE_UNUSED
  make_vector_mode (enum mode_class bclass,
  		  const char *base,
-@@ -771,7 +771,7 @@ make_vector_mode (enum mode_class bclass,
+@@ -793,7 +793,7 @@ make_vector_mode (enum mode_class bclass,
  
  /* Adjustability.  */
  #define _ADD_ADJUST(A, M, X, C1, C2) \
diff --git a/meta/recipes-devtools/gcc/gcc/0036-mingw32-Enable-operation_not_supported.patch b/meta/recipes-devtools/gcc/gcc/0036-mingw32-Enable-operation_not_supported.patch
index de82a3a539..3a7618c820 100644
--- a/meta/recipes-devtools/gcc/gcc/0036-mingw32-Enable-operation_not_supported.patch
+++ b/meta/recipes-devtools/gcc/gcc/0036-mingw32-Enable-operation_not_supported.patch
@@ -1,4 +1,4 @@
-From 6f87a095f0e696bec07a50df789c9db8bdbca43d Mon Sep 17 00:00:00 2001
+From 96d895c8d5dc895d24fe37aa2b4f201a2566b4cc Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 12 May 2020 10:39:09 -0700
 Subject: [PATCH] mingw32: Enable operation_not_supported
@@ -12,15 +12,15 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/libstdc++-v3/config/os/mingw32/error_constants.h b/libstdc++-v3/config/os/mingw32/error_constants.h
-index 68ac72a78fb..71cd5815b81 100644
+index eca06a97014..933cfab49cf 100644
 --- a/libstdc++-v3/config/os/mingw32/error_constants.h
 +++ b/libstdc++-v3/config/os/mingw32/error_constants.h
 @@ -107,7 +107,7 @@ _GLIBCXX_BEGIN_NAMESPACE_VERSION
- #ifdef _GLIBCXX_HAVE_EPERM
+ #ifdef EPERM
        operation_not_permitted = 		EPERM,
  #endif
 -//    operation_not_supported = 		EOPNOTSUPP,
 +      operation_not_supported = 		EOPNOTSUPP,
- #ifdef _GLIBCXX_HAVE_EWOULDBLOCK
+ #ifdef EWOULDBLOCK
        operation_would_block = 			EWOULDBLOCK,
  #endif
diff --git a/meta/recipes-devtools/gcc/gcc/0037-libatomic-Do-not-enforce-march-on-aarch64.patch b/meta/recipes-devtools/gcc/gcc/0037-libatomic-Do-not-enforce-march-on-aarch64.patch
index 3946acea11..4c9a79cb64 100644
--- a/meta/recipes-devtools/gcc/gcc/0037-libatomic-Do-not-enforce-march-on-aarch64.patch
+++ b/meta/recipes-devtools/gcc/gcc/0037-libatomic-Do-not-enforce-march-on-aarch64.patch
@@ -1,4 +1,4 @@
-From 38d262bfe7c0c894c364dc6e4dc7971e78a73974 Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-devtools/gcc/gcc_10.2.bb b/meta/recipes-devtools/gcc/gcc_11.0.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc_10.2.bb
rename to meta/recipes-devtools/gcc/gcc_11.0.bb
diff --git a/meta/recipes-devtools/gcc/libgcc-initial_10.2.bb b/meta/recipes-devtools/gcc/libgcc-initial_11.0.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc-initial_10.2.bb
rename to meta/recipes-devtools/gcc/libgcc-initial_11.0.bb
diff --git a/meta/recipes-devtools/gcc/libgcc_10.2.bb b/meta/recipes-devtools/gcc/libgcc_11.0.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc_10.2.bb
rename to meta/recipes-devtools/gcc/libgcc_11.0.bb
diff --git a/meta/recipes-devtools/gcc/libgfortran_10.2.bb b/meta/recipes-devtools/gcc/libgfortran_11.0.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgfortran_10.2.bb
rename to meta/recipes-devtools/gcc/libgfortran_11.0.bb
-- 
2.31.1

