Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web12.23235.1618172871245798200
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Apr 2021 13:27:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=I7VdtwVW;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id j6-20020a17090adc86b02900cbfe6f2c96so5878077pjv.1
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Apr 2021 13:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sppEzBn+ncOk1c/dX/nRAEJlwpXNvRwxRifigbtB+g8=;
        b=I7VdtwVWn6BOcgzLENg5KmrnxqM/P2ffdEn86EfUV9J4/PcGzyshYu57JbS0Im5M3s
         8hP5d33H4o9WYmipmSXIAMBqn741WykYWqXupr3lonpO3koJqBqogMDQy952X1L8Yuu3
         ARyijWrkFkXoUyH9D44gX7zJUc3nkvRrwWeJmX8J0DBnxjbetLLuVtCK6HVUboGPu+Iq
         T5nvT79Xjwhu+vr1TukfQbnHK4jADhjBxvYXEyHN+IcodK4mes8ILdDWIkXyCshyhkNl
         +pq3l2UsflewVbW4LdpB3+9RJtplQ5PzYO0WZISCYGbpJ62uWloVMdFhJtR2Er+cL4c6
         jOKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sppEzBn+ncOk1c/dX/nRAEJlwpXNvRwxRifigbtB+g8=;
        b=QOSVAjQk884inhqqt135Xx/r3XKIJEW/+k8aOHNws6W0M2c2RF3MWWDZ5+bJo2ucLm
         zfbt/lMd87fnbUVg1twFlYlU58sAvNa9xVgCPETm922vh8+WGeGGlQNSWW8Z794AEU4z
         SxAVI5xptueyzkc55A0I1LNIdkziErRqpUU1s/QU+ybPRGcxZJv/1+fv/UwF4AaoshoI
         mEJeydtcwQa4a/KyYM6cgOSpxQ2/gmYysXaOarBp9BDbb5g31X2vPfn+7AYDKUtwXZNr
         lH6OD6p25Q0/UcKQ+MbGfsXj5+7y8BJgUuuSuYYRAlfk+AoCW5A0bYIInM04/SbCVtHM
         4tzw==
X-Gm-Message-State: AOAM53291vXg9ghWQBA1vKZVc7Eunonshj07N0QB+okW9jHT4dWyo+/b
	97duJDBJnnqZg91os1l5m3UPrQ/15kmX5g==
X-Google-Smtp-Source: ABdhPJwPPu5kGfvOKE48GCl1V7X3X2LkXRKHr2cEJlS9Wo/LVju0am3mt5FE5tcDJwHxgkoEqkizsQ==
X-Received: by 2002:a17:902:6907:b029:ea:d1e8:b80b with SMTP id j7-20020a1709026907b02900ead1e8b80bmr6857137plk.41.1618172869728;
        Sun, 11 Apr 2021 13:27:49 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bc1b])
        by smtp.gmail.com with ESMTPSA id mv13sm1517730pjb.29.2021.04.11.13.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 13:27:49 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3] gcc: Upgrade to 10.3.0 bug-fix release
Date: Sun, 11 Apr 2021 13:27:46 -0700
Message-Id: <20210411202746.388822-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop aarch64 backports which are already upstream
List of bugs fixed is [1]

[1] https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=RESOLVED&list_id=298084&resolution=FIXED&target_milestone=10.3

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix BINV
v3: Fix maintainer entry to use PV
    Fix include poison patch which was old version

 meta/conf/distro/include/maintainers.inc      |   2 +-
 .../gcc/{gcc-10.2.inc => gcc-10.3.inc}        |  12 +-
 ...ian_10.2.bb => gcc-cross-canadian_10.3.bb} |   0
 .../{gcc-cross_10.2.bb => gcc-cross_10.3.bb}  |   0
 ...-crosssdk_10.2.bb => gcc-crosssdk_10.3.bb} |   0
 ...cc-runtime_10.2.bb => gcc-runtime_10.3.bb} |   0
 ...itizers_10.2.bb => gcc-sanitizers_10.3.bb} |   0
 ...{gcc-source_10.2.bb => gcc-source_10.3.bb} |   0
 ...-up-__aarch64_cas16_acq_rel-fallback.patch |  66 --
 ...ight-Line-Speculation-SLS-mitigation.patch | 202 ------
 ...0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch |  10 +-
 ...e-SLS-mitigation-for-RET-and-BR-inst.patch | 607 ----------------
 .../0002-gcc-poison-system-directories.patch  |  31 +-
 ...h64-Mitigate-SLS-for-BLR-instruction.patch | 658 ------------------
 ...-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |   6 +-
 .../gcc/gcc/0004-64-bit-multilib-hack.patch   |   2 +-
 .../gcc/gcc/0005-optional-libstdc.patch       |  10 +-
 .../gcc/gcc/0006-COLLECT_GCC_OPTIONS.patch    |   6 +-
 ...ts.h-in-B-instead-of-S-and-t-oe-in-B.patch |  12 +-
 .../gcc/0008-fortran-cross-compile-hack.patch |   6 +-
 .../gcc/gcc/0009-cpp-honor-sysroot.patch      |   6 +-
 .../gcc/0010-MIPS64-Default-to-N64-ABI.patch  |   6 +-
 ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |  12 +-
 ...gcc-Fix-argument-list-too-long-error.patch |  11 +-
 .../gcc/gcc/0013-Disable-sdt.patch            |  18 +-
 .../gcc/gcc/0014-libtool.patch                |   2 +-
 ...s-fix-v4bx-to-linker-to-support-EABI.patch |   2 +-
 ...-config-files-from-B-instead-of-usin.patch |  14 +-
 ...ir-from-.la-which-usually-points-to-.patch |   2 +-
 .../gcc/gcc/0018-export-CPP.patch             |   2 +-
 ...e-target-gcc-headers-can-be-included.patch |   6 +-
 ...t-directory-during-relink-if-inst_pr.patch |   2 +-
 ...IR-replacement-instead-of-hardcoding.patch |   2 +-
 ...22-aarch64-Add-support-for-musl-ldso.patch |   2 +-
 ...-fix-libcc1-s-install-path-and-rpath.patch |  10 +-
 ...le-sysroot-support-for-nativesdk-gcc.patch |  15 +-
 ...sroot-gcc-version-specific-dirs-with.patch |   8 +-
 ...ous-_FOR_BUILD-and-related-variables.patch |  12 +-
 ...027-nios2-Define-MUSL_DYNAMIC_LINKER.patch |   2 +-
 ...d-to-link-commandline-for-musl-targe.patch |   4 +-
 ...using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch |   2 +-
 .../0030-sync-gcc-stddef.h-with-musl.patch    |   2 +-
 ...-fault-in-precompiled-header-generat.patch |   4 +-
 .../gcc/0032-Fix-for-testsuite-failure.patch  |   2 +-
 ...Re-introduce-spe-commandline-options.patch |   6 +-
 ...as-for-__cpu_indicator_init-instead-.patch |  10 +-
 ...s-Do-not-use-__LINE__-for-maintainin.patch |   4 +-
 ...ngw32-Enable-operation_not_supported.patch |   8 +-
 ...omic-Do-not-enforce-march-on-aarch64.patch |   2 +-
 ...ibgomp-libitc-Fix-bootstrap-PR70454.patch} |  13 +-
 .../gcc/{gcc_10.2.bb => gcc_10.3.bb}          |   0
 ...initial_10.2.bb => libgcc-initial_10.3.bb} |   0
 .../gcc/{libgcc_10.2.bb => libgcc_10.3.bb}    |   0
 ...ibgfortran_10.2.bb => libgfortran_10.3.bb} |   0
 54 files changed, 140 insertions(+), 1681 deletions(-)
 rename meta/recipes-devtools/gcc/{gcc-10.2.inc => gcc-10.3.inc} (90%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_10.2.bb => gcc-cross-canadian_10.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_10.2.bb => gcc-cross_10.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_10.2.bb => gcc-crosssdk_10.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_10.2.bb => gcc-runtime_10.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_10.2.bb => gcc-sanitizers_10.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_10.2.bb => gcc-source_10.3.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0001-aarch64-Fix-up-__aarch64_cas16_acq_rel-fallback.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0001-aarch64-New-Straight-Line-Speculation-SLS-mitigation.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0002-aarch64-Introduce-SLS-mitigation-for-RET-and-BR-inst.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0003-aarch64-Mitigate-SLS-for-BLR-instruction.patch
 rename meta/recipes-devtools/gcc/gcc/{0001-libatomic-libgomp-libitc-Fix-bootstrap-PR70454.patch => 0038-libatomic-libgomp-libitc-Fix-bootstrap-PR70454.patch} (94%)
 rename meta/recipes-devtools/gcc/{gcc_10.2.bb => gcc_10.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_10.2.bb => libgcc-initial_10.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_10.2.bb => libgcc_10.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_10.2.bb => libgfortran_10.3.bb} (100%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 6276331857..f075b8d7e2 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -191,7 +191,7 @@ RECIPE_MAINTAINER_pn-gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Khem Raj <r
 RECIPE_MAINTAINER_pn-gcc-crosssdk-${SDK_SYS} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-gcc-runtime = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-gcc-sanitizers = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER_pn-gcc-source-10.2.0 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER_pn-gcc-source-${PV} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-gconf = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-gcr = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-gdb = "Khem Raj <raj.khem@gmail.com>"
diff --git a/meta/recipes-devtools/gcc/gcc-10.2.inc b/meta/recipes-devtools/gcc/gcc-10.3.inc
similarity index 90%
rename from meta/recipes-devtools/gcc/gcc-10.2.inc
rename to meta/recipes-devtools/gcc/gcc-10.3.inc
index c0cd8b31d5..7fcb058fea 100644
--- a/meta/recipes-devtools/gcc/gcc-10.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-10.3.inc
@@ -2,11 +2,11 @@ require gcc-common.inc

 # Third digit in PV should be incremented after a minor release

-PV = "10.2.0"
+PV = "10.3.0"

 # BINV should be incremented to a revision after a minor gcc release

-BINV = "10.2.0"
+BINV = "10.3.0"

 FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"

@@ -65,13 +65,9 @@ SRC_URI = "\
            file://0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch \
            file://0036-mingw32-Enable-operation_not_supported.patch \
            file://0037-libatomic-Do-not-enforce-march-on-aarch64.patch \
-           file://0001-aarch64-New-Straight-Line-Speculation-SLS-mitigation.patch \
-           file://0002-aarch64-Introduce-SLS-mitigation-for-RET-and-BR-inst.patch \
-           file://0003-aarch64-Mitigate-SLS-for-BLR-instruction.patch \
-           file://0001-aarch64-Fix-up-__aarch64_cas16_acq_rel-fallback.patch \
-           file://0001-libatomic-libgomp-libitc-Fix-bootstrap-PR70454.patch \
+           file://0038-libatomic-libgomp-libitc-Fix-bootstrap-PR70454.patch \
 "
-SRC_URI[sha256sum] = "b8dd4368bb9c7f0b98188317ee0254dd8cc99d1e3a18d0ff146c855fe16c1d8c"
+SRC_URI[sha256sum] = "64f404c1a650f27fc33da242e1f2df54952e3963a49e06e73f6940f3223ac344"

 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
 # For dev release snapshotting
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_10.2.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_10.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-canadian_10.2.bb
rename to meta/recipes-devtools/gcc/gcc-cross-canadian_10.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross_10.2.bb b/meta/recipes-devtools/gcc/gcc-cross_10.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross_10.2.bb
rename to meta/recipes-devtools/gcc/gcc-cross_10.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_10.2.bb b/meta/recipes-devtools/gcc/gcc-crosssdk_10.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk_10.2.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk_10.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb b/meta/recipes-devtools/gcc/gcc-runtime_10.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-runtime_10.2.bb
rename to meta/recipes-devtools/gcc/gcc-runtime_10.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_10.2.bb b/meta/recipes-devtools/gcc/gcc-sanitizers_10.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-sanitizers_10.2.bb
rename to meta/recipes-devtools/gcc/gcc-sanitizers_10.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-source_10.2.bb b/meta/recipes-devtools/gcc/gcc-source_10.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-source_10.2.bb
rename to meta/recipes-devtools/gcc/gcc-source_10.3.bb
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
index 82ae9f8d14..6beedacf66 100644
--- a/meta/recipes-devtools/gcc/gcc/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
+++ b/meta/recipes-devtools/gcc/gcc/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
@@ -1,4 +1,4 @@
-From f2a5dc3bc7e5727d6bf77e1c6e8a31a6f000883d Mon Sep 17 00:00:00 2001
+From 2b4a66cbe0bd52e77b37dbaee46e2605d3854412 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 08:37:11 +0400
 Subject: [PATCH] gcc-4.3.1: ARCH_FLAGS_FOR_TARGET
@@ -12,10 +12,10 @@ Upstream-Status: Inappropriate [embedded specific]
  2 files changed, 2 insertions(+), 2 deletions(-)

 diff --git a/configure b/configure
-index 4cc938ebb7d..226a64939d1 100755
+index f2ec106a86e..9350b0cf3ed 100755
 --- a/configure
 +++ b/configure
-@@ -7722,7 +7722,7 @@ fi
+@@ -7723,7 +7723,7 @@ fi
  # for target_alias and gcc doesn't manage it consistently.
  target_configargs="--cache-file=./config.cache ${target_configargs}"

@@ -25,10 +25,10 @@ index 4cc938ebb7d..226a64939d1 100755
   *" newlib "*)
    case " $target_configargs " in
 diff --git a/configure.ac b/configure.ac
-index c78d9cbea62..f024f4bac9b 100644
+index 115db3f402a..5ef61255710 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3227,7 +3227,7 @@ fi
+@@ -3228,7 +3228,7 @@ fi
  # for target_alias and gcc doesn't manage it consistently.
  target_configargs="--cache-file=./config.cache ${target_configargs}"

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
index 697bdc8219..c96f170196 100644
--- a/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch
+++ b/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch
@@ -1,4 +1,4 @@
-From 74cc21f474402cf3578e37e1d7a1a22bbd070f6a Mon Sep 17 00:00:00 2001
+From a4fd05ff8e8ed7252d7b302891ac842cbb190c41 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 08:59:00 +0400
 Subject: [PATCH] gcc: poison-system-directories
@@ -27,7 +27,7 @@ Upstream-Status: Pending
  7 files changed, 86 insertions(+), 2 deletions(-)

 diff --git a/gcc/common.opt b/gcc/common.opt
-index 3ec7743ea..d3c3e51dc 100644
+index ec5235c3a41..ca942863064 100644
 --- a/gcc/common.opt
 +++ b/gcc/common.opt
 @@ -682,6 +682,10 @@ Wreturn-local-addr
@@ -42,7 +42,7 @@ index 3ec7743ea..d3c3e51dc 100644
  Common Var(warn_shadow) Warning
  Warn when one variable shadows another.  Same as -Wshadow=global.
 diff --git a/gcc/config.in b/gcc/config.in
-index 364eba477..7d2c3bbf1 100644
+index 364eba47737..7d2c3bbf1a3 100644
 --- a/gcc/config.in
 +++ b/gcc/config.in
 @@ -224,6 +224,16 @@
@@ -63,7 +63,7 @@ index 364eba477..7d2c3bbf1 100644
     optimizer and back end) to be checked for dynamic type safety at runtime.
     This is quite expensive. */
 diff --git a/gcc/configure b/gcc/configure
-index 2a9d646b4..a848792f2 100755
+index 8fe9c91fd7c..8976850dff6 100755
 --- a/gcc/configure
 +++ b/gcc/configure
 @@ -1010,6 +1010,7 @@ with_system_zlib
@@ -83,7 +83,7 @@ index 2a9d646b4..a848792f2 100755
    --enable-plugin         enable plugin support
    --enable-host-shared    build host code as shared libraries
    --disable-libquadmath-support
-@@ -30280,6 +30283,22 @@ if test "${enable_version_specific_runtime_libs+set}" = set; then :
+@@ -30276,6 +30279,22 @@ if test "${enable_version_specific_runtime_libs+set}" = set; then :
  fi


@@ -107,10 +107,10 @@ index 2a9d646b4..a848792f2 100755


 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 51cce36ce..66ffde305 100644
+index 84dceb8074a..13eace6cfc6 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -6614,6 +6614,22 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
+@@ -6608,6 +6608,22 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
                  [specify that runtime libraries should be
                   installed in a compiler-specific directory])])

@@ -134,10 +134,10 @@ index 51cce36ce..66ffde305 100644
  AC_SUBST(subdirs)
  AC_SUBST(srcdir)
 diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
-index d929eb109..aa5ff88b1 100644
+index eabeec944e7..cd31b522e42 100644
 --- a/gcc/doc/invoke.texi
 +++ b/gcc/doc/invoke.texi
-@@ -351,6 +351,7 @@ Objective-C and Objective-C++ Dialects}.
+@@ -348,6 +348,7 @@ Objective-C and Objective-C++ Dialects}.
  -Wpacked  -Wno-packed-bitfield-compat  -Wpacked-not-aligned  -Wpadded @gol
  -Wparentheses  -Wno-pedantic-ms-format @gol
  -Wpointer-arith  -Wno-pointer-compare  -Wno-pointer-to-int-cast @gol
@@ -145,7 +145,7 @@ index d929eb109..aa5ff88b1 100644
  -Wno-pragmas  -Wno-prio-ctor-dtor  -Wredundant-decls @gol
  -Wrestrict  -Wno-return-local-addr  -Wreturn-type @gol
  -Wno-scalar-storage-order  -Wsequence-point @gol
-@@ -6928,6 +6929,14 @@ made up of data only and thus requires no special treatment.  But, for
+@@ -6926,6 +6927,14 @@ made up of data only and thus requires no special treatment.  But, for
  most targets, it is made up of code and thus requires the stack to be
  made executable in order for the program to work properly.

@@ -161,10 +161,10 @@ index d929eb109..aa5ff88b1 100644
  @opindex Wfloat-equal
  @opindex Wno-float-equal
 diff --git a/gcc/gcc.c b/gcc/gcc.c
-index 49c9c6c17..24a92bf27 100644
+index 9f790db0daf..f379f71da3d 100644
 --- a/gcc/gcc.c
 +++ b/gcc/gcc.c
-@@ -1044,6 +1044,8 @@ proper position among the other output files.  */
+@@ -1041,6 +1041,8 @@ proper position among the other output files.  */
     "%{fuse-ld=*:-fuse-ld=%*} " LINK_COMPRESS_DEBUG_SPEC \
     "%X %{o*} %{e*} %{N} %{n} %{r}\
      %{s} %{t} %{u*} %{z} %{Z} %{!nostdlib:%{!r:%{!nostartfiles:%S}}} \
@@ -173,7 +173,7 @@ index 49c9c6c17..24a92bf27 100644
      %{static|no-pie|static-pie:} %@{L*} %(mfwrap) %(link_libgcc) " \
      VTABLE_VERIFICATION_SPEC " " SANITIZER_EARLY_SPEC " %o "" \
      %{fopenacc|fopenmp|%:gt(%{ftree-parallelize-loops=*:%*} 1):\
-@@ -1138,8 +1140,11 @@ static const char *cpp_unique_options =
+@@ -1134,8 +1136,11 @@ static const char *cpp_unique_options =
  static const char *cpp_options =
  "%(cpp_unique_options) %1 %{m*} %{std*&ansi&trigraphs} %{W*&pedantic*} %{w}\
   %{f*} %{g*:%{%:debug-level-gt(0):%{g*}\
@@ -188,7 +188,7 @@ index 49c9c6c17..24a92bf27 100644
  /* This contains cpp options which are not passed when the preprocessor
     output will be used by another program.  */
 diff --git a/gcc/incpath.c b/gcc/incpath.c
-index 94eaba7b1..bfad4ebe3 100644
+index 8a2bda00f80..9098ab044ab 100644
 --- a/gcc/incpath.c
 +++ b/gcc/incpath.c
 @@ -26,6 +26,7 @@
@@ -226,6 +226,3 @@ index 94eaba7b1..bfad4ebe3 100644
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
index 27237feb5a..39b616e82e 100644
--- a/meta/recipes-devtools/gcc/gcc/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
+++ b/meta/recipes-devtools/gcc/gcc/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
@@ -1,4 +1,4 @@
-From 6e3395c0bc933bdc3242d1dead4896d0aa4e11a8 Mon Sep 17 00:00:00 2001
+From 860a8a2ec653e3c65bc5440f181b459dfe56c8a0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:08:31 +0400
 Subject: [PATCH] gcc-4.3.3: SYSROOT_CFLAGS_FOR_TARGET
@@ -26,10 +26,10 @@ Upstream-Status: Pending
  1 file changed, 32 insertions(+)

 diff --git a/configure b/configure
-index 226a64939d1..b31dc137fc9 100755
+index 9350b0cf3ed..8ed565c51b3 100755
 --- a/configure
 +++ b/configure
-@@ -6971,6 +6971,38 @@ fi
+@@ -6972,6 +6972,38 @@ fi



diff --git a/meta/recipes-devtools/gcc/gcc/0004-64-bit-multilib-hack.patch b/meta/recipes-devtools/gcc/gcc/0004-64-bit-multilib-hack.patch
index 7c751bef65..04d8bdf331 100644
--- a/meta/recipes-devtools/gcc/gcc/0004-64-bit-multilib-hack.patch
+++ b/meta/recipes-devtools/gcc/gcc/0004-64-bit-multilib-hack.patch
@@ -1,4 +1,4 @@
-From 85a7c5aeb82ed61e6ef6d8e061b9da9e6a4a652c Mon Sep 17 00:00:00 2001
+From d166c36206b276f769e175f39cf44b33c98bd153 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:10:06 +0400
 Subject: [PATCH] 64-bit multilib hack.
diff --git a/meta/recipes-devtools/gcc/gcc/0005-optional-libstdc.patch b/meta/recipes-devtools/gcc/gcc/0005-optional-libstdc.patch
index 4020c9e3cf..9f5b96eb63 100644
--- a/meta/recipes-devtools/gcc/gcc/0005-optional-libstdc.patch
+++ b/meta/recipes-devtools/gcc/gcc/0005-optional-libstdc.patch
@@ -1,4 +1,4 @@
-From 6ddfb0bfcd1eea71acd37ab06f7a4510b9f1d12b Mon Sep 17 00:00:00 2001
+From dcbfaf57a213e3beaafb0561b007c61501961f03 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:12:56 +0400
 Subject: [PATCH] optional libstdc
@@ -52,7 +52,7 @@ index 0ab63bcd211..7b081e9e4f0 100644
  	  library = -1;
  	  break;
 diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
-index f12d8d12150..cf6cb428e7d 100644
+index cd31b522e42..1f14df48bda 100644
 --- a/gcc/doc/invoke.texi
 +++ b/gcc/doc/invoke.texi
 @@ -230,6 +230,9 @@ in the following sections.
@@ -65,7 +65,7 @@ index f12d8d12150..cf6cb428e7d 100644
  -fext-numeric-literals @gol
  -Wabi-tag  -Wcatch-value  -Wcatch-value=@var{n} @gol
  -Wno-class-conversion  -Wclass-memaccess @gol
-@@ -599,7 +602,7 @@ Objective-C and Objective-C++ Dialects}.
+@@ -600,7 +603,7 @@ Objective-C and Objective-C++ Dialects}.
  -pie  -pthread  -r  -rdynamic @gol
  -s  -static  -static-pie  -static-libgcc  -static-libstdc++ @gol
  -static-libasan  -static-libtsan  -static-liblsan  -static-libubsan @gol
@@ -74,7 +74,7 @@ index f12d8d12150..cf6cb428e7d 100644
  -T @var{script}  -Wl,@var{option}  -Xlinker @var{option} @gol
  -u @var{symbol}  -z @var{keyword}}

-@@ -14407,6 +14410,33 @@ Specify that the program entry point is @var{entry}.  The argument is
+@@ -14468,6 +14471,33 @@ Specify that the program entry point is @var{entry}.  The argument is
  interpreted by the linker; the GNU linker accepts either a symbol name
  or an address.

@@ -109,7 +109,7 @@ index f12d8d12150..cf6cb428e7d 100644
  @opindex pie
  Produce a dynamically linked position independent executable on targets
 diff --git a/gcc/gcc.c b/gcc/gcc.c
-index b2200c5185a..f8be58ce0a6 100644
+index f379f71da3d..1ee962acfaa 100644
 --- a/gcc/gcc.c
 +++ b/gcc/gcc.c
 @@ -1051,6 +1051,7 @@ proper position among the other output files.  */
diff --git a/meta/recipes-devtools/gcc/gcc/0006-COLLECT_GCC_OPTIONS.patch b/meta/recipes-devtools/gcc/gcc/0006-COLLECT_GCC_OPTIONS.patch
index 9fbbe80703..7e43284c17 100644
--- a/meta/recipes-devtools/gcc/gcc/0006-COLLECT_GCC_OPTIONS.patch
+++ b/meta/recipes-devtools/gcc/gcc/0006-COLLECT_GCC_OPTIONS.patch
@@ -1,4 +1,4 @@
-From a6c90d3a9c5010b4aa7cc30467cf81ca7e0f430e Mon Sep 17 00:00:00 2001
+From a03125f58038c89637445fdfbb6c38d2b276633e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:16:28 +0400
 Subject: [PATCH] COLLECT_GCC_OPTIONS
@@ -14,10 +14,10 @@ Upstream-Status: Pending
  1 file changed, 9 insertions(+)

 diff --git a/gcc/gcc.c b/gcc/gcc.c
-index f8be58ce0a6..48b0f9dde81 100644
+index 1ee962acfaa..39b1635651a 100644
 --- a/gcc/gcc.c
 +++ b/gcc/gcc.c
-@@ -4806,6 +4806,15 @@ set_collect_gcc_options (void)
+@@ -4809,6 +4809,15 @@ set_collect_gcc_options (void)
  		sizeof ("COLLECT_GCC_OPTIONS=") - 1);

    first_time = TRUE;
diff --git a/meta/recipes-devtools/gcc/gcc/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch b/meta/recipes-devtools/gcc/gcc/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
index a764bdd0f4..c7693a8b77 100644
--- a/meta/recipes-devtools/gcc/gcc/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
+++ b/meta/recipes-devtools/gcc/gcc/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
@@ -1,4 +1,4 @@
-From 5670d4489f119d2da661734895ac0be99b606d1b Mon Sep 17 00:00:00 2001
+From 938b65c6ba6cb4af24285f288126fe65b3e1fa9e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:17:25 +0400
 Subject: [PATCH] Use the defaults.h in ${B} instead of ${S}, and t-oe in ${B}
@@ -26,7 +26,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  4 files changed, 7 insertions(+), 7 deletions(-)

 diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index 543b477ff18..a67d2cc18d6 100644
+index 646db219460..501a5f16d9f 100644
 --- a/gcc/Makefile.in
 +++ b/gcc/Makefile.in
 @@ -540,7 +540,7 @@ TARGET_SYSTEM_ROOT = @TARGET_SYSTEM_ROOT@
@@ -39,10 +39,10 @@ index 543b477ff18..a67d2cc18d6 100644
  TM_MULTILIB_CONFIG=@TM_MULTILIB_CONFIG@
  TM_MULTILIB_EXCEPTIONS_CONFIG=@TM_MULTILIB_EXCEPTIONS_CONFIG@
 diff --git a/gcc/configure b/gcc/configure
-index 8de766a942c..b26e8fc7fee 100755
+index 8976850dff6..4d903cf40e8 100755
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -12705,8 +12705,8 @@ for f in $tm_file; do
+@@ -12710,8 +12710,8 @@ for f in $tm_file; do
         tm_include_list="${tm_include_list} $f"
         ;;
      defaults.h )
@@ -54,10 +54,10 @@ index 8de766a942c..b26e8fc7fee 100755
      * )
         tm_file_list="${tm_file_list} \$(srcdir)/config/$f"
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 8bfd6feb780..26fa46802c7 100644
+index 13eace6cfc6..07aacfee055 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -2138,8 +2138,8 @@ for f in $tm_file; do
+@@ -2143,8 +2143,8 @@ for f in $tm_file; do
         tm_include_list="${tm_include_list} $f"
         ;;
      defaults.h )
diff --git a/meta/recipes-devtools/gcc/gcc/0008-fortran-cross-compile-hack.patch b/meta/recipes-devtools/gcc/gcc/0008-fortran-cross-compile-hack.patch
index 714db3bef5..707066291f 100644
--- a/meta/recipes-devtools/gcc/gcc/0008-fortran-cross-compile-hack.patch
+++ b/meta/recipes-devtools/gcc/gcc/0008-fortran-cross-compile-hack.patch
@@ -1,4 +1,4 @@
-From f05062625e7a4751be723595a2f7a4b7fbeff311 Mon Sep 17 00:00:00 2001
+From 660bf2b932273e2cde495f31cc031bb084572862 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:20:01 +0400
 Subject: [PATCH] fortran cross-compile hack.
@@ -16,10 +16,10 @@ Upstream-Status: Inappropriate [embedded specific]
  2 files changed, 2 insertions(+), 2 deletions(-)

 diff --git a/libgfortran/configure b/libgfortran/configure
-index b4cf854ddb3..e8e0ac3b1cf 100755
+index 1b4a8b10609..d7ab18fc9f9 100755
 --- a/libgfortran/configure
 +++ b/libgfortran/configure
-@@ -13090,7 +13090,7 @@ esac
+@@ -13092,7 +13092,7 @@ esac

  # We need gfortran to compile parts of the library
  #AC_PROG_FC(gfortran)
diff --git a/meta/recipes-devtools/gcc/gcc/0009-cpp-honor-sysroot.patch b/meta/recipes-devtools/gcc/gcc/0009-cpp-honor-sysroot.patch
index 8ad6853d81..3f6b69a3cc 100644
--- a/meta/recipes-devtools/gcc/gcc/0009-cpp-honor-sysroot.patch
+++ b/meta/recipes-devtools/gcc/gcc/0009-cpp-honor-sysroot.patch
@@ -1,4 +1,4 @@
-From 1d76de7f1f5c99f1fa1a4b14aedad3d702e4e136 Mon Sep 17 00:00:00 2001
+From 303cc9292cc0a1bd7bae994dd1e86197fb94068d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:22:00 +0400
 Subject: [PATCH] cpp: honor sysroot.
@@ -37,10 +37,10 @@ index 0ad4a33b93e..16c744f4f90 100644
 +      "  cc1plus -fpreprocessed %i %I %(cc1_options) %2"
        "  %{!fsyntax-only:%(invoke_as)}}}}", 0, 0, 0},
 diff --git a/gcc/gcc.c b/gcc/gcc.c
-index 48b0f9dde81..c87f603955f 100644
+index 39b1635651a..e2e0bcee9b2 100644
 --- a/gcc/gcc.c
 +++ b/gcc/gcc.c
-@@ -1348,7 +1348,7 @@ static const struct compiler default_compilers[] =
+@@ -1351,7 +1351,7 @@ static const struct compiler default_compilers[] =
  					   %W{o*:--output-pch=%*}}%V}}}}}}}", 0, 0, 0},
    {".i", "@cpp-output", 0, 0, 0},
    {"@cpp-output",
diff --git a/meta/recipes-devtools/gcc/gcc/0010-MIPS64-Default-to-N64-ABI.patch b/meta/recipes-devtools/gcc/gcc/0010-MIPS64-Default-to-N64-ABI.patch
index 625e2d8709..1aa29e6ac5 100644
--- a/meta/recipes-devtools/gcc/gcc/0010-MIPS64-Default-to-N64-ABI.patch
+++ b/meta/recipes-devtools/gcc/gcc/0010-MIPS64-Default-to-N64-ABI.patch
@@ -1,4 +1,4 @@
-From 4fad4433c96bc9d0d9d124f9674fb3389f6f426e Mon Sep 17 00:00:00 2001
+From b75e8fb1cc1607077a113de40ae0d16ad273f05a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:23:08 +0400
 Subject: [PATCH] MIPS64: Default to N64 ABI
@@ -14,10 +14,10 @@ Upstream-Status: Inappropriate [OE config specific]
  1 file changed, 5 insertions(+), 5 deletions(-)

 diff --git a/gcc/config.gcc b/gcc/config.gcc
-index cf1a87e2efd..37c4221a39f 100644
+index 6fcdd771d4c..feafcadfcac 100644
 --- a/gcc/config.gcc
 +++ b/gcc/config.gcc
-@@ -2511,29 +2511,29 @@ mips*-*-linux*)				# Linux MIPS, either endian.
+@@ -2542,29 +2542,29 @@ mips*-*-linux*)				# Linux MIPS, either endian.
  			default_mips_arch=mips32
  			;;
  		mips64el-st-linux-gnu)
diff --git a/meta/recipes-devtools/gcc/gcc/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
index e357976330..ee34836ea0 100644
--- a/meta/recipes-devtools/gcc/gcc/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
+++ b/meta/recipes-devtools/gcc/gcc/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
@@ -1,4 +1,4 @@
-From 8fc016a53c22c19feccbfa13ebdf19090dc67058 Mon Sep 17 00:00:00 2001
+From 438b8d40f6060c0d62b474b2ae970241f9635f6b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:24:50 +0400
 Subject: [PATCH] Define GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
@@ -167,7 +167,7 @@ index 4afef7c228c..01997330741 100644
  #define MUSL_ABI_SUFFIX \
    "%{mabi=ilp32:-sf}" \
 diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
-index 34776c8421e..967c1c43c63 100644
+index 2ded3301282..80969a8fd89 100644
 --- a/gcc/config/rs6000/linux64.h
 +++ b/gcc/config/rs6000/linux64.h
 @@ -419,24 +419,19 @@ extern int dot_symbols;
@@ -214,10 +214,10 @@ index c1d0441d488..81373eb8336 100644
  #undef SUBTARGET_LINK_EMUL_SUFFIX
  #define SUBTARGET_LINK_EMUL_SUFFIX "%{mfdpic:_fd;:_linux}"
 diff --git a/gcc/config/sparc/linux.h b/gcc/config/sparc/linux.h
-index 81201e67a2f..8b6fc577594 100644
+index 63853e60c03..31219e9892c 100644
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
+index 19ce84d7adb..0d9cc752931 100644
 --- a/gcc/config/sparc/linux64.h
 +++ b/gcc/config/sparc/linux64.h
-@@ -84,8 +84,8 @@ along with GCC; see the file COPYING3.  If not see
+@@ -78,8 +78,8 @@ along with GCC; see the file COPYING3.  If not see
     When the -shared link option is used a final link is not being
     done.  */

diff --git a/meta/recipes-devtools/gcc/gcc/0012-gcc-Fix-argument-list-too-long-error.patch b/meta/recipes-devtools/gcc/gcc/0012-gcc-Fix-argument-list-too-long-error.patch
index 88e1715b5c..ad2df92192 100644
--- a/meta/recipes-devtools/gcc/gcc/0012-gcc-Fix-argument-list-too-long-error.patch
+++ b/meta/recipes-devtools/gcc/gcc/0012-gcc-Fix-argument-list-too-long-error.patch
@@ -1,4 +1,4 @@
-From a22d1264049d29b90663cf5667049ae6f9b7a5ce Mon Sep 17 00:00:00 2001
+From cc2aac0b93f2f22a5fd0ecd80743e88d4e244597 Mon Sep 17 00:00:00 2001
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
+index 501a5f16d9f..674f1057aaf 100644
 --- a/gcc/Makefile.in
 +++ b/gcc/Makefile.in
-@@ -3606,7 +3606,7 @@ install-plugin: installdirs lang.install-plugin s-header-vars install-gengtype
- # We keep the directory structure for files in config or c-family and .def
- # files. All other files are flattened to a single directory.
+@@ -3609,7 +3609,7 @@ install-plugin: installdirs lang.install-plugin s-header-vars install-gengtype
+ # We keep the directory structure for files in config, common/config or
+ # c-family and .def files. All other files are flattened to a single directory.
  	$(mkinstalldirs) $(DESTDIR)$(plugin_includedir)
 -	headers=`echo $(PLUGIN_HEADERS) $$(cd $(srcdir); echo *.h *.def) | tr ' ' '\012' | sort -u`; \
 +	headers=`echo $(sort $(PLUGIN_HEADERS)) $$(cd $(srcdir); echo *.h *.def) | tr ' ' '\012' | sort -u`; \
diff --git a/meta/recipes-devtools/gcc/gcc/0013-Disable-sdt.patch b/meta/recipes-devtools/gcc/gcc/0013-Disable-sdt.patch
index 207cdb57af..b93ae837ac 100644
--- a/meta/recipes-devtools/gcc/gcc/0013-Disable-sdt.patch
+++ b/meta/recipes-devtools/gcc/gcc/0013-Disable-sdt.patch
@@ -1,4 +1,4 @@
-From fa47586935a18ecfc2ad5586802e326e21741b7b Mon Sep 17 00:00:00 2001
+From d87eef0037d15f363b2614bac531626b87189d4f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:28:10 +0400
 Subject: [PATCH] Disable sdt.
@@ -25,10 +25,10 @@ Upstream-Status: Inappropriate [hack]
  4 files changed, 19 insertions(+), 19 deletions(-)

 diff --git a/gcc/configure b/gcc/configure
-index b26e8fc7fee..6080f86145e 100755
+index 4d903cf40e8..156090550c2 100755
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -29789,12 +29789,12 @@ fi
+@@ -29830,12 +29830,12 @@ fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking sys/sdt.h in the target C library" >&5
  $as_echo_n "checking sys/sdt.h in the target C library... " >&6; }
  have_sys_sdt_h=no
@@ -48,10 +48,10 @@ index b26e8fc7fee..6080f86145e 100755
  $as_echo "$have_sys_sdt_h" >&6; }

 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 26fa46802c7..42be5252778 100644
+index 07aacfee055..f31a43e7dd3 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -6190,15 +6190,15 @@ fi
+@@ -6203,15 +6203,15 @@ fi
  AC_SUBST([enable_default_ssp])

  # Test for <sys/sdt.h> on the target.
@@ -77,10 +77,10 @@ index 26fa46802c7..42be5252778 100644
  # Check if TFmode long double should be used by default or not.
  # Some glibc targets used DFmode long double, but with glibc 2.4
 diff --git a/libstdc++-v3/configure b/libstdc++-v3/configure
-index 9f9c5a2419a..71ed13b815b 100755
+index 766a0a8d504..ba59088a722 100755
 --- a/libstdc++-v3/configure
 +++ b/libstdc++-v3/configure
-@@ -22615,11 +22615,11 @@ ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
+@@ -21986,11 +21986,11 @@ ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
  ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
  ac_compiler_gnu=$ac_cv_c_compiler_gnu

@@ -96,10 +96,10 @@ index 9f9c5a2419a..71ed13b815b 100755
  $as_echo "$glibcxx_cv_sys_sdt_h" >&6; }

 diff --git a/libstdc++-v3/configure.ac b/libstdc++-v3/configure.ac
-index 699e55fd829..5c7a7bda439 100644
+index 07cf05b6856..dd5f26957d5 100644
 --- a/libstdc++-v3/configure.ac
 +++ b/libstdc++-v3/configure.ac
-@@ -241,7 +241,7 @@ GLIBCXX_CHECK_SC_NPROCESSORS_ONLN
+@@ -240,7 +240,7 @@ GLIBCXX_CHECK_SC_NPROCESSORS_ONLN
  GLIBCXX_CHECK_SC_NPROC_ONLN
  GLIBCXX_CHECK_PTHREADS_NUM_PROCESSORS_NP
  GLIBCXX_CHECK_SYSCTL_HW_NCPU
diff --git a/meta/recipes-devtools/gcc/gcc/0014-libtool.patch b/meta/recipes-devtools/gcc/gcc/0014-libtool.patch
index f4e70c3b18..3da3261bfe 100644
--- a/meta/recipes-devtools/gcc/gcc/0014-libtool.patch
+++ b/meta/recipes-devtools/gcc/gcc/0014-libtool.patch
@@ -1,4 +1,4 @@
-From 6ecd478881468934444ff85611fd43f7033b1e81 Mon Sep 17 00:00:00 2001
+From d1584292b3a199dc6318f7508fd0c74ec4169a21 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:29:11 +0400
 Subject: [PATCH] libtool
diff --git a/meta/recipes-devtools/gcc/gcc/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch b/meta/recipes-devtools/gcc/gcc/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
index bc2674abcc..e08e44cc04 100644
--- a/meta/recipes-devtools/gcc/gcc/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
+++ b/meta/recipes-devtools/gcc/gcc/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
@@ -1,4 +1,4 @@
-From de4427fa49c07dc651ee6ceaf5c5078700ca3b08 Mon Sep 17 00:00:00 2001
+From b7a96ff62cc0daa3a789c720d30e2edaabbafe5d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:30:32 +0400
 Subject: [PATCH] gcc: armv4: pass fix-v4bx to linker to support EABI.
diff --git a/meta/recipes-devtools/gcc/gcc/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch b/meta/recipes-devtools/gcc/gcc/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch
index 1dc4bb859a..d86da6517f 100644
--- a/meta/recipes-devtools/gcc/gcc/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch
+++ b/meta/recipes-devtools/gcc/gcc/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch
@@ -1,4 +1,4 @@
-From 6b363c2c1c089ee900efa6013aefba1003840a37 Mon Sep 17 00:00:00 2001
+From 187e962aed3b3f39a96eb4419a7fa23e88634efb Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:33:04 +0400
 Subject: [PATCH] Use the multilib config files from ${B} instead of using the
@@ -18,10 +18,10 @@ Upstream-Status: Inappropriate [configuration]
  2 files changed, 36 insertions(+), 8 deletions(-)

 diff --git a/gcc/configure b/gcc/configure
-index 6080f86145e..825a9652329 100755
+index 156090550c2..fde89ad8e89 100755
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -12685,10 +12685,20 @@ done
+@@ -12690,10 +12690,20 @@ done
  tmake_file_=
  for f in ${tmake_file}
  do
@@ -46,7 +46,7 @@ index 6080f86145e..825a9652329 100755
  done
  tmake_file="${tmake_file_}${omp_device_property_tmake_file}"

-@@ -12699,6 +12709,10 @@ tm_file_list="options.h"
+@@ -12704,6 +12714,10 @@ tm_file_list="options.h"
  tm_include_list="options.h insn-constants.h"
  for f in $tm_file; do
    case $f in
@@ -58,10 +58,10 @@ index 6080f86145e..825a9652329 100755
         f=`echo $f | sed 's/^..//'`
         tm_file_list="${tm_file_list} $f"
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 42be5252778..6099eb3251f 100644
+index f31a43e7dd3..cad69549a01 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -2118,10 +2118,20 @@ done
+@@ -2123,10 +2123,20 @@ done
  tmake_file_=
  for f in ${tmake_file}
  do
@@ -86,7 +86,7 @@ index 42be5252778..6099eb3251f 100644
  done
  tmake_file="${tmake_file_}${omp_device_property_tmake_file}"

-@@ -2132,6 +2142,10 @@ tm_file_list="options.h"
+@@ -2137,6 +2147,10 @@ tm_file_list="options.h"
  tm_include_list="options.h insn-constants.h"
  for f in $tm_file; do
    case $f in
diff --git a/meta/recipes-devtools/gcc/gcc/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch b/meta/recipes-devtools/gcc/gcc/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
index 05f12847e9..55eb44e326 100644
--- a/meta/recipes-devtools/gcc/gcc/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
+++ b/meta/recipes-devtools/gcc/gcc/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
@@ -1,4 +1,4 @@
-From 08752c2f1d21553301bee5757c453c6a36cbe03c Mon Sep 17 00:00:00 2001
+From 6211545ca5aa4a5bfb7c4dfcfdb9db7e5511b40e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 09:39:38 +0000
 Subject: [PATCH] Avoid using libdir from .la which usually points to a host
diff --git a/meta/recipes-devtools/gcc/gcc/0018-export-CPP.patch b/meta/recipes-devtools/gcc/gcc/0018-export-CPP.patch
index 886a1221d3..5f28e868e2 100644
--- a/meta/recipes-devtools/gcc/gcc/0018-export-CPP.patch
+++ b/meta/recipes-devtools/gcc/gcc/0018-export-CPP.patch
@@ -1,4 +1,4 @@
-From 5c3d66378c7ff60ca11a875aa4aa6f8a8529d43a Mon Sep 17 00:00:00 2001
+From 9d8512e3efa0d125714bafb907734a0c095b84ce Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 09:40:59 +0000
 Subject: [PATCH] export CPP
diff --git a/meta/recipes-devtools/gcc/gcc/0019-Ensure-target-gcc-headers-can-be-included.patch b/meta/recipes-devtools/gcc/gcc/0019-Ensure-target-gcc-headers-can-be-included.patch
index 2797b2c22d..9e9f2874db 100644
--- a/meta/recipes-devtools/gcc/gcc/0019-Ensure-target-gcc-headers-can-be-included.patch
+++ b/meta/recipes-devtools/gcc/gcc/0019-Ensure-target-gcc-headers-can-be-included.patch
@@ -1,4 +1,4 @@
-From 378b752c5d9a3dba4e58cdadf8b4b4f34ea99a76 Mon Sep 17 00:00:00 2001
+From 468604663f799d3d80d0db760f03ba32678801aa Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 10:25:11 +0000
 Subject: [PATCH] Ensure target gcc headers can be included
@@ -21,7 +21,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 6 insertions(+)

 diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index 480c9366418..011c7ac2db6 100644
+index 674f1057aaf..087bf3f1137 100644
 --- a/gcc/Makefile.in
 +++ b/gcc/Makefile.in
 @@ -618,6 +618,7 @@ libexecdir = @libexecdir@
@@ -32,7 +32,7 @@ index 480c9366418..011c7ac2db6 100644
  # Directory in which the compiler finds executables
  libexecsubdir = $(libexecdir)/gcc/$(real_target_noncanonical)/$(version)$(accel_dir_suffix)
  # Directory in which all plugin resources are installed
-@@ -2946,6 +2947,7 @@ CFLAGS-intl.o += -DLOCALEDIR=\"$(localedir)\"
+@@ -2948,6 +2949,7 @@ CFLAGS-intl.o += -DLOCALEDIR=\"$(localedir)\"

  PREPROCESSOR_DEFINES = \
    -DGCC_INCLUDE_DIR=\"$(libsubdir)/include\" \
diff --git a/meta/recipes-devtools/gcc/gcc/0020-Don-t-search-host-directory-during-relink-if-inst_pr.patch b/meta/recipes-devtools/gcc/gcc/0020-Don-t-search-host-directory-during-relink-if-inst_pr.patch
index c3baf8b451..ce838ebcdb 100644
--- a/meta/recipes-devtools/gcc/gcc/0020-Don-t-search-host-directory-during-relink-if-inst_pr.patch
+++ b/meta/recipes-devtools/gcc/gcc/0020-Don-t-search-host-directory-during-relink-if-inst_pr.patch
@@ -1,4 +1,4 @@
-From 870e805d705d99d9b9d7dbd09727f9c1d2ad9c1d Mon Sep 17 00:00:00 2001
+From dbdf19800e24571603b0baee1734a58ff2cf2974 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 3 Mar 2015 08:21:19 +0000
 Subject: [PATCH] Don't search host directory during "relink" if $inst_prefix
diff --git a/meta/recipes-devtools/gcc/gcc/0021-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch b/meta/recipes-devtools/gcc/gcc/0021-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
index abee48669d..58327209d4 100644
--- a/meta/recipes-devtools/gcc/gcc/0021-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
+++ b/meta/recipes-devtools/gcc/gcc/0021-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
@@ -1,4 +1,4 @@
-From aba42de763a619355471efd1573561b0cbf51162 Mon Sep 17 00:00:00 2001
+From 7c019b932f06bdce624b4739fba75dacff794076 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 28 Apr 2015 23:15:27 -0700
 Subject: [PATCH] Use SYSTEMLIBS_DIR replacement instead of hardcoding
diff --git a/meta/recipes-devtools/gcc/gcc/0022-aarch64-Add-support-for-musl-ldso.patch b/meta/recipes-devtools/gcc/gcc/0022-aarch64-Add-support-for-musl-ldso.patch
index c55b66d4ba..851f8ed063 100644
--- a/meta/recipes-devtools/gcc/gcc/0022-aarch64-Add-support-for-musl-ldso.patch
+++ b/meta/recipes-devtools/gcc/gcc/0022-aarch64-Add-support-for-musl-ldso.patch
@@ -1,4 +1,4 @@
-From d63820a78d92f302410358293546f01c7ad17bd8 Mon Sep 17 00:00:00 2001
+From ce93292090b1a8cb0b0b0061ec09243936bf9bcf Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 28 Apr 2015 23:18:39 -0700
 Subject: [PATCH] aarch64: Add support for musl ldso
diff --git a/meta/recipes-devtools/gcc/gcc/0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch b/meta/recipes-devtools/gcc/gcc/0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch
index 80c4d2292c..d981b37658 100644
--- a/meta/recipes-devtools/gcc/gcc/0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch
+++ b/meta/recipes-devtools/gcc/gcc/0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch
@@ -1,4 +1,4 @@
-From 3474e16ad4ea8cf4e0e330568e3bc9039e723dce Mon Sep 17 00:00:00 2001
+From cc298bd514d32cea58bfbdbda503d710355e97b4 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Sun, 5 Jul 2015 20:25:18 -0700
 Subject: [PATCH] libcc1: fix libcc1's install path and rpath
@@ -20,10 +20,10 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  2 files changed, 4 insertions(+), 4 deletions(-)

 diff --git a/libcc1/Makefile.am b/libcc1/Makefile.am
-index c005b0dad4a..ec31d35b7b9 100644
+index fe7b64cbc6f..bdd0617049b 100644
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
+index 2def836cb06..98e12a9d369 100644
 --- a/libcc1/Makefile.in
 +++ b/libcc1/Makefile.in
-@@ -393,8 +393,8 @@ libiberty = $(if $(wildcard $(libiberty_noasan)),$(Wc)$(libiberty_noasan), \
+@@ -394,8 +394,8 @@ libiberty = $(if $(wildcard $(libiberty_noasan)),$(Wc)$(libiberty_noasan), \
  	    $(Wc)$(libiberty_normal)))

  libiberty_dep = $(patsubst $(Wc)%,%,$(libiberty))
diff --git a/meta/recipes-devtools/gcc/gcc/0024-handle-sysroot-support-for-nativesdk-gcc.patch b/meta/recipes-devtools/gcc/gcc/0024-handle-sysroot-support-for-nativesdk-gcc.patch
index dc3e6da65a..6c75c0f2bf 100644
--- a/meta/recipes-devtools/gcc/gcc/0024-handle-sysroot-support-for-nativesdk-gcc.patch
+++ b/meta/recipes-devtools/gcc/gcc/0024-handle-sysroot-support-for-nativesdk-gcc.patch
@@ -1,4 +1,4 @@
-From 702daf2e9cb97337e0e594fcd435b1b61a917d14 Mon Sep 17 00:00:00 2001
+From 2966f3c43382fa4f79cbac761232dae2e92e7012 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 7 Dec 2015 23:39:54 +0000
 Subject: [PATCH] handle sysroot support for nativesdk-gcc
@@ -41,7 +41,7 @@ Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
  6 files changed, 70 insertions(+), 48 deletions(-)

 diff --git a/gcc/c-family/c-opts.c b/gcc/c-family/c-opts.c
-index 58ba0948e79..806bbcfb7a5 100644
+index c51d6d34726..aa7507df2cf 100644
 --- a/gcc/c-family/c-opts.c
 +++ b/gcc/c-family/c-opts.c
 @@ -1409,8 +1409,8 @@ add_prefixed_path (const char *suffix, incpath_kind chain)
@@ -214,7 +214,7 @@ index a681264f75e..5e10a2fa140 100644
     subdirectory of the actual installation.  */
  extern const char *gcc_exec_prefix;
 diff --git a/gcc/gcc.c b/gcc/gcc.c
-index c87f603955f..535d5c3bb65 100644
+index e2e0bcee9b2..912c2febf94 100644
 --- a/gcc/gcc.c
 +++ b/gcc/gcc.c
 @@ -252,6 +252,8 @@ FILE *report_times_to_file = NULL;
@@ -234,7 +234,7 @@ index c87f603955f..535d5c3bb65 100644
   %S     process STARTFILE_SPEC as a spec.  A capital S is actually used here.
   %E     process ENDFILE_SPEC as a spec.  A capital E is actually used here.
   %C     process CPP_SPEC as a spec.
-@@ -1499,10 +1502,10 @@ static const char *gcc_libexec_prefix;
+@@ -1502,10 +1505,10 @@ static const char *gcc_libexec_prefix;
     gcc_exec_prefix is set because, in that case, we know where the
     compiler has been installed, and use paths relative to that
     location instead.  */
@@ -249,7 +249,7 @@ index c87f603955f..535d5c3bb65 100644

  /* For native compilers, these are well-known paths containing
     components that may be provided by the system.  For cross
-@@ -1510,9 +1513,9 @@ static const char *const standard_startfile_prefix = STANDARD_STARTFILE_PREFIX;
+@@ -1513,9 +1516,9 @@ static const char *const standard_startfile_prefix = STANDARD_STARTFILE_PREFIX;
  static const char *md_exec_prefix = MD_EXEC_PREFIX;
  static const char *md_startfile_prefix = MD_STARTFILE_PREFIX;
  static const char *md_startfile_prefix_1 = MD_STARTFILE_PREFIX_1;
@@ -261,7 +261,7 @@ index c87f603955f..535d5c3bb65 100644
    = STANDARD_STARTFILE_PREFIX_2;

  /* A relative path to be used in finding the location of tools
-@@ -5952,6 +5955,11 @@ do_spec_1 (const char *spec, int inswitch, const char *soft_matched_part)
+@@ -5955,6 +5958,11 @@ do_spec_1 (const char *spec, int inswitch, const char *soft_matched_part)
  	      }
  	    break;

@@ -344,6 +344,3 @@ index 1a403e535bd..c26d07bde12 100644

        /* We used to strip trailing DIR_SEPARATORs here, but that can
  	 sometimes yield a result with no separator when one was coded
---
-2.29.2
-
diff --git a/meta/recipes-devtools/gcc/gcc/0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch b/meta/recipes-devtools/gcc/gcc/0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch
index abf1f8491f..e8b52daf25 100644
--- a/meta/recipes-devtools/gcc/gcc/0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch
+++ b/meta/recipes-devtools/gcc/gcc/0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch
@@ -1,4 +1,4 @@
-From 9c0c73ee48dbee2aad57f4dcdad1b7b74e77b944 Mon Sep 17 00:00:00 2001
+From 5fdf6a0e959c26512c795bf904b35348f749406c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 7 Dec 2015 23:41:45 +0000
 Subject: [PATCH] Search target sysroot gcc version specific dirs with
@@ -51,10 +51,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 28 insertions(+), 1 deletion(-)

 diff --git a/gcc/gcc.c b/gcc/gcc.c
-index 535d5c3bb65..04647ae812d 100644
+index 912c2febf94..24a92bf27f9 100644
 --- a/gcc/gcc.c
 +++ b/gcc/gcc.c
-@@ -2616,7 +2616,7 @@ for_each_path (const struct path_prefix *paths,
+@@ -2619,7 +2619,7 @@ for_each_path (const struct path_prefix *paths,
        if (path == NULL)
  	{
  	  len = paths->max_len + extra_space + 1;
@@ -63,7 +63,7 @@ index 535d5c3bb65..04647ae812d 100644
  	  path = XNEWVEC (char, len);
  	}

-@@ -2628,6 +2628,33 @@ for_each_path (const struct path_prefix *paths,
+@@ -2631,6 +2631,33 @@ for_each_path (const struct path_prefix *paths,
  	  /* Look first in MACHINE/VERSION subdirectory.  */
  	  if (!skip_multi_dir)
  	    {
diff --git a/meta/recipes-devtools/gcc/gcc/0026-Fix-various-_FOR_BUILD-and-related-variables.patch b/meta/recipes-devtools/gcc/gcc/0026-Fix-various-_FOR_BUILD-and-related-variables.patch
index 97bf2f3a73..0356baac5c 100644
--- a/meta/recipes-devtools/gcc/gcc/0026-Fix-various-_FOR_BUILD-and-related-variables.patch
+++ b/meta/recipes-devtools/gcc/gcc/0026-Fix-various-_FOR_BUILD-and-related-variables.patch
@@ -1,4 +1,4 @@
-From 3a003af8804dda90fdf4862eca5f66cb12faaf02 Mon Sep 17 00:00:00 2001
+From b647a62ddbbb7fbc58aa865cd2d34539677eb107 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 7 Dec 2015 23:42:45 +0000
 Subject: [PATCH] Fix various _FOR_BUILD and related variables
@@ -94,7 +94,7 @@ index efed1511750..778beb705b4 100644
  	CFLAGS="$(CFLAGS)"; export CFLAGS; \
  	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
 diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index 011c7ac2db6..2f1165f7b5e 100644
+index 087bf3f1137..272d521a276 100644
 --- a/gcc/Makefile.in
 +++ b/gcc/Makefile.in
 @@ -805,7 +805,7 @@ BUILD_LDFLAGS=@BUILD_LDFLAGS@
@@ -107,10 +107,10 @@ index 011c7ac2db6..2f1165f7b5e 100644
  # Actual name to use when installing a native compiler.
  GCC_INSTALL_NAME := $(shell echo gcc|sed '$(program_transform_name)')
 diff --git a/gcc/configure b/gcc/configure
-index 825a9652329..ff46cf58960 100755
+index fde89ad8e89..e042e992419 100755
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -12314,7 +12314,7 @@ else
+@@ -12319,7 +12319,7 @@ else
  	CC="${CC_FOR_BUILD}" CFLAGS="${CFLAGS_FOR_BUILD}" \
  	CXX="${CXX_FOR_BUILD}" CXXFLAGS="${CXXFLAGS_FOR_BUILD}" \
  	LD="${LD_FOR_BUILD}" LDFLAGS="${LDFLAGS_FOR_BUILD}" \
@@ -120,10 +120,10 @@ index 825a9652329..ff46cf58960 100755
  		--enable-languages=${enable_languages-all} \
  		${enable_obsolete+--enable-obsolete="$enable_obsolete"} \
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 6099eb3251f..b3c345b61dc 100644
+index cad69549a01..8e35c9be7f9 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -1898,7 +1898,7 @@ else
+@@ -1903,7 +1903,7 @@ else
  	CC="${CC_FOR_BUILD}" CFLAGS="${CFLAGS_FOR_BUILD}" \
  	CXX="${CXX_FOR_BUILD}" CXXFLAGS="${CXXFLAGS_FOR_BUILD}" \
  	LD="${LD_FOR_BUILD}" LDFLAGS="${LDFLAGS_FOR_BUILD}" \
diff --git a/meta/recipes-devtools/gcc/gcc/0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch b/meta/recipes-devtools/gcc/gcc/0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch
index 3cd75b7183..47de3c354c 100644
--- a/meta/recipes-devtools/gcc/gcc/0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch
+++ b/meta/recipes-devtools/gcc/gcc/0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch
@@ -1,4 +1,4 @@
-From 4e53d0ae70af85af0e112a48a3e4dfe4c39f4a8d Mon Sep 17 00:00:00 2001
+From f7a6ddd3fb612393595f6e959e99d48c26f4d14f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 2 Feb 2016 10:26:10 -0800
 Subject: [PATCH] nios2: Define MUSL_DYNAMIC_LINKER
diff --git a/meta/recipes-devtools/gcc/gcc/0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch b/meta/recipes-devtools/gcc/gcc/0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
index 2a6769a82e..cd409a894c 100644
--- a/meta/recipes-devtools/gcc/gcc/0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
+++ b/meta/recipes-devtools/gcc/gcc/0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
@@ -1,4 +1,4 @@
-From 5db0404eb770ac477fd99d444226bcf021067584 Mon Sep 17 00:00:00 2001
+From 0bb86e4d2ab0bb44bab37a005f971cf94046ff0d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 27 Jun 2017 18:10:54 -0700
 Subject: [PATCH] Add ssp_nonshared to link commandline for musl targets
@@ -62,7 +62,7 @@ index b7026fcbee7..dd54d6c393e 100644
  #define LINK_OS_LINUX_SPEC LINK_OS_LINUX_EMUL " %{!shared: %{!static: \
    %{!static-pie: \
 diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
-index 967c1c43c63..dc5e4d97975 100644
+index 80969a8fd89..97a78ae945c 100644
 --- a/gcc/config/rs6000/linux64.h
 +++ b/gcc/config/rs6000/linux64.h
 @@ -452,6 +452,16 @@ extern int dot_symbols;
diff --git a/meta/recipes-devtools/gcc/gcc/0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch b/meta/recipes-devtools/gcc/gcc/0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
index 767cba0380..9342329ecf 100644
--- a/meta/recipes-devtools/gcc/gcc/0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
+++ b/meta/recipes-devtools/gcc/gcc/0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
@@ -1,4 +1,4 @@
-From fbc926dbf6a47fa623b9c94cd9b09a0e90448fdc Mon Sep 17 00:00:00 2001
+From 61b000792f32d4ca9b4b4498ebb7fd5d1deed710 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 4 May 2016 21:11:34 -0700
 Subject: [PATCH] Link libgcc using LDFLAGS, not just SHLIB_LDFLAGS
diff --git a/meta/recipes-devtools/gcc/gcc/0030-sync-gcc-stddef.h-with-musl.patch b/meta/recipes-devtools/gcc/gcc/0030-sync-gcc-stddef.h-with-musl.patch
index 4f18907a1d..ffbf6b97ab 100644
--- a/meta/recipes-devtools/gcc/gcc/0030-sync-gcc-stddef.h-with-musl.patch
+++ b/meta/recipes-devtools/gcc/gcc/0030-sync-gcc-stddef.h-with-musl.patch
@@ -1,4 +1,4 @@
-From 24dc04dc8d69e3bf61322615b3ef18e02ccd311e Mon Sep 17 00:00:00 2001
+From 92f588c68008176e7f6f1b3d534670bddedae783 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 3 Feb 2017 12:56:00 -0800
 Subject: [PATCH] sync gcc stddef.h with musl
diff --git a/meta/recipes-devtools/gcc/gcc/0031-fix-segmentation-fault-in-precompiled-header-generat.patch b/meta/recipes-devtools/gcc/gcc/0031-fix-segmentation-fault-in-precompiled-header-generat.patch
index 702279af0e..0b93a055c2 100644
--- a/meta/recipes-devtools/gcc/gcc/0031-fix-segmentation-fault-in-precompiled-header-generat.patch
+++ b/meta/recipes-devtools/gcc/gcc/0031-fix-segmentation-fault-in-precompiled-header-generat.patch
@@ -1,4 +1,4 @@
-From 27b8ba5555ada2dab076988529bfb84d00a4b901 Mon Sep 17 00:00:00 2001
+From d3b25e66c7f9c86b5da0fd3e9e6236e0b59dc934 Mon Sep 17 00:00:00 2001
 From: Juro Bystricky <juro.bystricky@intel.com>
 Date: Mon, 19 Mar 2018 22:31:20 -0700
 Subject: [PATCH] fix segmentation fault in precompiled header generation
@@ -19,7 +19,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 21 insertions(+), 5 deletions(-)

 diff --git a/libcpp/lex.c b/libcpp/lex.c
-index 56ac3a1dd73..73a951148b3 100644
+index 665297af776..0ac5d67ddf0 100644
 --- a/libcpp/lex.c
 +++ b/libcpp/lex.c
 @@ -3311,11 +3311,27 @@ cpp_spell_token (cpp_reader *pfile, const cpp_token *token,
diff --git a/meta/recipes-devtools/gcc/gcc/0032-Fix-for-testsuite-failure.patch b/meta/recipes-devtools/gcc/gcc/0032-Fix-for-testsuite-failure.patch
index 0a0767b441..515c1d8186 100644
--- a/meta/recipes-devtools/gcc/gcc/0032-Fix-for-testsuite-failure.patch
+++ b/meta/recipes-devtools/gcc/gcc/0032-Fix-for-testsuite-failure.patch
@@ -1,4 +1,4 @@
-From 2512aacf023c679d86d8f40caff4f6ff412b32ff Mon Sep 17 00:00:00 2001
+From a3beed38a5eaa122c375451adafd78289512ac5f Mon Sep 17 00:00:00 2001
 From: RAGHUNATH LOLUR <raghunath.lolur@kpit.com>
 Date: Wed, 6 Dec 2017 22:52:26 -0800
 Subject: [PATCH] Fix for testsuite failure
diff --git a/meta/recipes-devtools/gcc/gcc/0033-Re-introduce-spe-commandline-options.patch b/meta/recipes-devtools/gcc/gcc/0033-Re-introduce-spe-commandline-options.patch
index ba7c2b8fd5..8a8eda89b1 100644
--- a/meta/recipes-devtools/gcc/gcc/0033-Re-introduce-spe-commandline-options.patch
+++ b/meta/recipes-devtools/gcc/gcc/0033-Re-introduce-spe-commandline-options.patch
@@ -1,4 +1,4 @@
-From 3fc06241ce37e2e4b3ed21ace28d347eb511448d Mon Sep 17 00:00:00 2001
+From c1675b1dbc8b662eadaaa8ebf5bbfc783b7ecc75 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 6 Jun 2018 12:10:22 -0700
 Subject: [PATCH] Re-introduce spe commandline options
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 12 insertions(+)

 diff --git a/gcc/config/rs6000/rs6000.opt b/gcc/config/rs6000/rs6000.opt
-index f95b8279270..0e52d51409d 100644
+index 4e3792bcefa..edfa4f7de48 100644
 --- a/gcc/config/rs6000/rs6000.opt
 +++ b/gcc/config/rs6000/rs6000.opt
 @@ -344,6 +344,18 @@ mdebug=
@@ -33,6 +33,6 @@ index f95b8279270..0e52d51409d 100644
 +Target RejectNegative Var(rs6000_spe_abi, 0)
 +Do not use the SPE ABI extensions.
 +
+ ; Altivec ABI
  mabi=altivec
  Target RejectNegative Var(rs6000_altivec_abi) Save
- Use the AltiVec ABI extensions.
diff --git a/meta/recipes-devtools/gcc/gcc/0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch b/meta/recipes-devtools/gcc/gcc/0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
index 4ce9dc6def..7dd334494d 100644
--- a/meta/recipes-devtools/gcc/gcc/0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
+++ b/meta/recipes-devtools/gcc/gcc/0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
@@ -1,4 +1,4 @@
-From b42ff59c3fe2967d37815c8db72a47b9b7f585b4 Mon Sep 17 00:00:00 2001
+From 0c8d6cd3a5de6cdb832fdba4ec39d029432e76e6 Mon Sep 17 00:00:00 2001
 From: Szabolcs Nagy <nsz@port70.net>
 Date: Sat, 24 Oct 2015 20:09:53 +0000
 Subject: [PATCH] libgcc_s: Use alias for __cpu_indicator_init instead of
@@ -39,10 +39,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  3 files changed, 6 insertions(+), 6 deletions(-)

 diff --git a/gcc/config/i386/i386-expand.c b/gcc/config/i386/i386-expand.c
-index 48f00c5fcfc..468f5f71fac 100644
+index 47d52550e5e..9cb8cc7950e 100644
 --- a/gcc/config/i386/i386-expand.c
 +++ b/gcc/config/i386/i386-expand.c
-@@ -10941,10 +10941,10 @@ ix86_expand_builtin (tree exp, rtx target, rtx subtarget,
+@@ -10976,10 +10976,10 @@ ix86_expand_builtin (tree exp, rtx target, rtx subtarget,
      {
      case IX86_BUILTIN_CPU_INIT:
        {
@@ -56,10 +56,10 @@ index 48f00c5fcfc..468f5f71fac 100644
  	return expand_expr (call_expr, target, mode, EXPAND_NORMAL);
        }
 diff --git a/libgcc/config/i386/cpuinfo.c b/libgcc/config/i386/cpuinfo.c
-index 00322c58622..f42bbb8af98 100644
+index 83301a1445f..89fdc7eb587 100644
 --- a/libgcc/config/i386/cpuinfo.c
 +++ b/libgcc/config/i386/cpuinfo.c
-@@ -508,7 +508,7 @@ __cpu_indicator_init (void)
+@@ -516,7 +516,7 @@ __cpu_indicator_init (void)
    return 0;
  }

diff --git a/meta/recipes-devtools/gcc/gcc/0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch b/meta/recipes-devtools/gcc/gcc/0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
index dd1bf6dedc..b746f17e4e 100644
--- a/meta/recipes-devtools/gcc/gcc/0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
+++ b/meta/recipes-devtools/gcc/gcc/0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
@@ -1,4 +1,4 @@
-From 0395060a7dcf98c5f5a65103f6aaa71d6b862259 Mon Sep 17 00:00:00 2001
+From febc910933faf6868805546e0df4a8452a82c225 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 10 Mar 2020 08:26:53 -0700
 Subject: [PATCH] gentypes/genmodes: Do not use __LINE__ for maintaining
@@ -48,7 +48,7 @@ index 981577481af..d5700fff401 100644
        POS_HERE (do_scalar_typedef ("CUMULATIVE_ARGS", &pos));
        POS_HERE (do_scalar_typedef ("REAL_VALUE_TYPE", &pos));
 diff --git a/gcc/genmodes.c b/gcc/genmodes.c
-index bd78310ea24..dbd02c51a4c 100644
+index 21e5f536976..a22f65a232f 100644
 --- a/gcc/genmodes.c
 +++ b/gcc/genmodes.c
 @@ -430,7 +430,7 @@ complete_all_modes (void)
diff --git a/meta/recipes-devtools/gcc/gcc/0036-mingw32-Enable-operation_not_supported.patch b/meta/recipes-devtools/gcc/gcc/0036-mingw32-Enable-operation_not_supported.patch
index de82a3a539..f2d6e30a07 100644
--- a/meta/recipes-devtools/gcc/gcc/0036-mingw32-Enable-operation_not_supported.patch
+++ b/meta/recipes-devtools/gcc/gcc/0036-mingw32-Enable-operation_not_supported.patch
@@ -1,4 +1,4 @@
-From 6f87a095f0e696bec07a50df789c9db8bdbca43d Mon Sep 17 00:00:00 2001
+From 6d9d080ce16de2fda138a8aac579e531bd64221d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 12 May 2020 10:39:09 -0700
 Subject: [PATCH] mingw32: Enable operation_not_supported
@@ -12,15 +12,15 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)

 diff --git a/libstdc++-v3/config/os/mingw32/error_constants.h b/libstdc++-v3/config/os/mingw32/error_constants.h
-index 68ac72a78fb..71cd5815b81 100644
+index 2222c5227c4..35290eabfa7 100644
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
index 3946acea11..a55fbffb2c 100644
--- a/meta/recipes-devtools/gcc/gcc/0037-libatomic-Do-not-enforce-march-on-aarch64.patch
+++ b/meta/recipes-devtools/gcc/gcc/0037-libatomic-Do-not-enforce-march-on-aarch64.patch
@@ -1,4 +1,4 @@
-From 38d262bfe7c0c894c364dc6e4dc7971e78a73974 Mon Sep 17 00:00:00 2001
+From f572efe2cee2d580007beb4540925965365ceeb9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 13 May 2020 15:10:38 -0700
 Subject: [PATCH] libatomic: Do not enforce march on aarch64
diff --git a/meta/recipes-devtools/gcc/gcc/0001-libatomic-libgomp-libitc-Fix-bootstrap-PR70454.patch b/meta/recipes-devtools/gcc/gcc/0038-libatomic-libgomp-libitc-Fix-bootstrap-PR70454.patch
similarity index 94%
rename from meta/recipes-devtools/gcc/gcc/0001-libatomic-libgomp-libitc-Fix-bootstrap-PR70454.patch
rename to meta/recipes-devtools/gcc/gcc/0038-libatomic-libgomp-libitc-Fix-bootstrap-PR70454.patch
index addecb4bd8..65c3e398fe 100644
--- a/meta/recipes-devtools/gcc/gcc/0001-libatomic-libgomp-libitc-Fix-bootstrap-PR70454.patch
+++ b/meta/recipes-devtools/gcc/gcc/0038-libatomic-libgomp-libitc-Fix-bootstrap-PR70454.patch
@@ -1,4 +1,4 @@
-From 2824d2418605e092899117e77bc8ebf332321807 Mon Sep 17 00:00:00 2001
+From eb5a17c7b8ed676d83ce4dd0e9623e2ee0191f91 Mon Sep 17 00:00:00 2001
 From: Jakub Jelinek <jakub@redhat.com>
 Date: Fri, 15 Jan 2021 13:12:59 +0100
 Subject: [PATCH] libatomic, libgomp, libitc: Fix bootstrap [PR70454]
@@ -28,6 +28,7 @@ libitm/
 	__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4.

 Upstream-Status: Backport [master post 10.x release]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  libatomic/configure.tgt | 56 +++++++++++++++++++++++------------------
  libgomp/configure.tgt   | 35 +++++++++++---------------
@@ -35,7 +36,7 @@ Upstream-Status: Backport [master post 10.x release]
  3 files changed, 64 insertions(+), 64 deletions(-)

 diff --git a/libatomic/configure.tgt b/libatomic/configure.tgt
-index 5dd0926d20..6ea082a29b 100644
+index 5dd0926d207..6ea082a29bc 100644
 --- a/libatomic/configure.tgt
 +++ b/libatomic/configure.tgt
 @@ -81,32 +81,40 @@ case "${target_cpu}" in
@@ -104,7 +105,7 @@ index 5dd0926d20..6ea082a29b 100644

    *)			ARCH="${target_cpu}" ;;
 diff --git a/libgomp/configure.tgt b/libgomp/configure.tgt
-index 4790a31e39..761ef2a7db 100644
+index 4790a31e394..761ef2a7db2 100644
 --- a/libgomp/configure.tgt
 +++ b/libgomp/configure.tgt
 @@ -70,28 +70,23 @@ if test x$enable_linux_futex = xyes; then
@@ -152,10 +153,10 @@ index 4790a31e39..761ef2a7db 100644

      # Note that sparcv7 and sparcv8 is not included here.  We need cas.
 diff --git a/libitm/configure.tgt b/libitm/configure.tgt
-index 04109160e9..ca62bac627 100644
+index d1beb5c9ec8..608462e184e 100644
 --- a/libitm/configure.tgt
 +++ b/libitm/configure.tgt
-@@ -58,16 +58,23 @@ case "${target_cpu}" in
+@@ -59,16 +59,23 @@ case "${target_cpu}" in

    arm*)		ARCH=arm ;;

@@ -189,7 +190,7 @@ index 04109160e9..ca62bac627 100644
  	XCFLAGS="${XCFLAGS} -mrtm"
  	ARCH=x86
  	;;
-@@ -102,16 +109,6 @@ case "${target_cpu}" in
+@@ -103,16 +110,6 @@ case "${target_cpu}" in
  	ARCH=sparc
  	;;

diff --git a/meta/recipes-devtools/gcc/gcc_10.2.bb b/meta/recipes-devtools/gcc/gcc_10.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc_10.2.bb
rename to meta/recipes-devtools/gcc/gcc_10.3.bb
diff --git a/meta/recipes-devtools/gcc/libgcc-initial_10.2.bb b/meta/recipes-devtools/gcc/libgcc-initial_10.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc-initial_10.2.bb
rename to meta/recipes-devtools/gcc/libgcc-initial_10.3.bb
diff --git a/meta/recipes-devtools/gcc/libgcc_10.2.bb b/meta/recipes-devtools/gcc/libgcc_10.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc_10.2.bb
rename to meta/recipes-devtools/gcc/libgcc_10.3.bb
diff --git a/meta/recipes-devtools/gcc/libgfortran_10.2.bb b/meta/recipes-devtools/gcc/libgfortran_10.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgfortran_10.2.bb
rename to meta/recipes-devtools/gcc/libgfortran_10.3.bb
--
2.31.1
