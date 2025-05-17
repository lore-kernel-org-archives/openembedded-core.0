Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9F21C2D0CD
	for <webhook@archiver.kernel.org>; Sat, 17 May 2025 08:17:56 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.8120.1747469873457862273
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 May 2025 01:17:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZyLP0fS7;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-30a9cd61159so2791505a91.1
        for <openembedded-core@lists.openembedded.org>; Sat, 17 May 2025 01:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747469872; x=1748074672; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PV8MqZA90nZpUdDY8RdbxAym6LZ0IQKuLqyt8sOl90w=;
        b=ZyLP0fS7xnuzMZ2fsjmuXYQzYIqauTAPt6yTl1JrXyC7zwkyHQo+HVmlNXNs63NnCA
         DBL9h707/R0LRs/9qKcOqv0dXykEuJQfVwZpkDCoLdcTSnW+1D2w94yk4hQ8vCZ6tPcb
         qA16V9R5+N6mNl3jLXMWDJ1T9QPBwGqh91UivgUS9aio8bnMoVLcrAZPHgbCeUNxbONT
         QpS1i0TiSCBAD4jW6x2dRv3s5y4F97cO2DTXNYM+oNvTB2X4liaa8AjhlROMpmjrl7tk
         MS65aLsczevnjbMLyZI3Rnuw4Jak2y8yk7LTUnJrCuNNWF4XxaeP1NgWWzxsavD5PhYF
         KROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747469872; x=1748074672;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PV8MqZA90nZpUdDY8RdbxAym6LZ0IQKuLqyt8sOl90w=;
        b=m2Fst/mO/0v1hNYkpnBcsJxQ0Y9CnFfc9SuZE9T5J2ICWovL2u+NImPwhjsMdjOG+S
         4K0yI7qAie0CVdQZm8wvxEEM6JwR2sGAyIcaFaUGJWJfG3Qc92XotEPjRzkkq+IJLq+O
         t573AmcqQV+AfmwVFWTl2VKhy88zfV7MTRl78NGWlKPoODIR6Eq1gnqzc0zTOFzHE78k
         ltjCvxznu/wg96BeT12hYQs+FhGJrTD4WDHXo/OS3o5PKUxSRa4uSABOKkzXiBeAEykW
         g3Gz/efGbzbEHpLCw5e92wTauwAtfUkmQdAfqzLFfa4yBIE/A8enXohW2VaUx3S494pu
         3TyA==
X-Gm-Message-State: AOJu0YwiXG3KB6ZKbycsvFjZkGMixcBBZaiEJIykMCYLW+n/2cyKvWp4
	FKwvDTWUqlAGubd6onS59p35EgtdoZpN6ulMIuXRWU5yGqMQyK7ljVoRlDJ/KeSG
X-Gm-Gg: ASbGncsr6Z2nJPYb4Bxpx0W/B0zGJruTqWD9lQHHDOJ6V58IeMm15elkwwBswqzF9Ic
	UoNxHiASM76npULVaUB0e/H4s7aFzFK9qQEKi0SXQiR3qD/CFFaaZRPi56Je6F1OcOtRbjagXdX
	nmgJo2StwsQqIZhWuFgKF7VNorM5K8r8ehS/LQMpPJUZjNky12SXkJiORkF0gxI5Lgjai7abEAt
	+6XmbLXlcTaMT5bbPiZwBrgTLbKIBwItW9rFUWCgb+iN+1TQBBMBq2iMO1vzenFOg37MgyWOTIi
	jF1BS2J2P7jY36MFKkh5SZ2/8viNLTCdP/XnDEvADeU8UG/ToBn0tA==
X-Google-Smtp-Source: AGHT+IGdVkliq7qs7DlaLprSZiub6S3A8Sjq515j1xnlummO9SEr6Uw6ZpACuFZiKZh1BTmi4FflPQ==
X-Received: by 2002:a17:90b:2e85:b0:2ee:c30f:33c9 with SMTP id 98e67ed59e1d1-30e7e770523mr4923348a91.14.1747469872283;
        Sat, 17 May 2025 01:17:52 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb081aa2sm2737955a12.48.2025.05.17.01.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 May 2025 01:17:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3] m4: Upgrade to 1.4.20 release
Date: Sat, 17 May 2025 01:17:47 -0700
Message-ID: <20250517081747.1089519-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 May 2025 08:17:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216767

This has been 4 years in making, it has fixes to build with gcc-15
and some patches are upstream [1] [2]

This release collects several years of portability improvements, as
well as a couple of minor optimizations to performance.  Notable
improvements in this release include faster execution of the 'eval'
builtin. More details [3]

[1] https://github.com/coreutils/gnulib/commit/2d830e4a792fcd9f614ed08a7f18584b8b21d23b
[2] https://git.savannah.gnu.org/gitweb/?p=libsigsegv.git;a=commitdiff;h=a6ff69873110c0a8ba6f7fd90532dbc11224828c
[3] https://lists.gnu.org/archive/html/m4-announce/2025-05/msg00000.html

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix do_install_ptest builds
v3: Fix failing ptests

 .../m4/{m4-1.4.19.inc => m4-1.4.20.inc}       | 16 ++----
 ...4-native_1.4.19.bb => m4-native_1.4.20.bb} |  0
 ...lot-using-_Alignof-when-using-C11-or.patch | 49 -------------------
 .../0001-sigsegv-Fix-build-on-ppc-musl.patch  | 37 --------------
 .../m4/m4/ac_config_links.patch               | 37 --------------
 meta/recipes-devtools/m4/m4/run-ptest         |  2 +-
 .../m4/m4/serial-tests-config.patch           | 11 ++---
 .../m4/{m4_1.4.19.bb => m4_1.4.20.bb}         |  0
 8 files changed, 9 insertions(+), 143 deletions(-)
 rename meta/recipes-devtools/m4/{m4-1.4.19.inc => m4-1.4.20.inc} (75%)
 rename meta/recipes-devtools/m4/{m4-native_1.4.19.bb => m4-native_1.4.20.bb} (100%)
 delete mode 100644 meta/recipes-devtools/m4/m4/0001-Define-alignof_slot-using-_Alignof-when-using-C11-or.patch
 delete mode 100644 meta/recipes-devtools/m4/m4/0001-sigsegv-Fix-build-on-ppc-musl.patch
 delete mode 100644 meta/recipes-devtools/m4/m4/ac_config_links.patch
 rename meta/recipes-devtools/m4/{m4_1.4.19.bb => m4_1.4.20.bb} (100%)

diff --git a/meta/recipes-devtools/m4/m4-1.4.19.inc b/meta/recipes-devtools/m4/m4-1.4.20.inc
similarity index 75%
rename from meta/recipes-devtools/m4/m4-1.4.19.inc
rename to meta/recipes-devtools/m4/m4-1.4.20.inc
index c73418d8e67..2ea3a9bace2 100644
--- a/meta/recipes-devtools/m4/m4-1.4.19.inc
+++ b/meta/recipes-devtools/m4/m4-1.4.20.inc
@@ -7,15 +7,12 @@ GNU M4 also has built-in functions for including files, running shell commands,
 inherit autotools texinfo ptest gettext
 
 SRC_URI = "${GNU_MIRROR}/m4/m4-${PV}.tar.gz \
-           file://ac_config_links.patch \
-           file://0001-sigsegv-Fix-build-on-ppc-musl.patch \
-           file://0001-Define-alignof_slot-using-_Alignof-when-using-C11-or.patch \
            "
 SRC_URI:append:class-target = " file://run-ptest \
                                 file://serial-tests-config.patch \
                               "
 
-SRC_URI[sha256sum] = "3be4a26d825ffdfda52a56fc43246456989a3630093cced3fbddf4771ee58a70"
+SRC_URI[sha256sum] = "6ac4fc31ce440debe63987c2ebbf9d7b6634e67a7c3279257dc7361de8bdb3ef"
 
 LICENSE = "GPL-3.0-only"
 
@@ -26,8 +23,6 @@ EXTRA_OECONF += "--without-libsigsegv-prefix"
 
 EXTRA_OEMAKE += "'infodir=${infodir}'"
 
-CFLAGS += "-std=gnu17"
-
 do_compile_ptest() {
 	cd ${B}/tests
 	sed -i '/^buildtest-TESTS: /c buildtest-TESTS: $(TESTS) $(check_LIBRARIES) $(check_PROGRAMS)' Makefile
@@ -37,15 +32,15 @@ do_compile_ptest() {
 do_install_ptest() {
                 cp -r ${B}/tests                        ${D}${PTEST_PATH}
                 cp -r ${S}/tests/*                      ${D}${PTEST_PATH}/tests/
+                cp -r ${S}/build-aux                    ${D}${PTEST_PATH}/tests/
                 sed -i '/^Makefile:/c Makefile:'        ${D}${PTEST_PATH}/tests/Makefile
                 find ${D}${PTEST_PATH} -type f -name *.[hoc] | xargs -i rm {}
-                cp ${S}/build-aux/update-copyright  ${D}${PTEST_PATH}/tests/
-                sed -i 's;update-copyright;./update-copyright;g' ${D}${PTEST_PATH}/tests/test-update-copyright.sh
-                chmod 0755 ${D}${PTEST_PATH}/tests/test-mbrtowc-w32-1.sh  ${D}${PTEST_PATH}/tests/test-spawn-pipe-main \
+                chmod 0755 ${D}${PTEST_PATH}/tests/test-spawn-pipe-main \
                      ${D}${PTEST_PATH}/tests/test-spawn-pipe-child ${D}${PTEST_PATH}/tests/test-version-etc \
                      ${D}${PTEST_PATH}/tests/test-xalloc-die
 
-                ln -s ptest ${D}${libdir}/${BPN}/${BP} 
+                ln -sf ptest ${D}${libdir}/${BPN}/${BP}
+                sed -i -e 's/@BP@/${BP}/g' ${D}${PTEST_PATH}/run-ptest
 }
 
 do_install_ptest:append:libc-glibc() {
@@ -59,4 +54,3 @@ RDEPENDS:${PN}-ptest:append:libc-glibc = "\
      locale-base-fr-fr.iso-8859-1 \
      glibc-gconv-iso8859-1 \
 "
-
diff --git a/meta/recipes-devtools/m4/m4-native_1.4.19.bb b/meta/recipes-devtools/m4/m4-native_1.4.20.bb
similarity index 100%
rename from meta/recipes-devtools/m4/m4-native_1.4.19.bb
rename to meta/recipes-devtools/m4/m4-native_1.4.20.bb
diff --git a/meta/recipes-devtools/m4/m4/0001-Define-alignof_slot-using-_Alignof-when-using-C11-or.patch b/meta/recipes-devtools/m4/m4/0001-Define-alignof_slot-using-_Alignof-when-using-C11-or.patch
deleted file mode 100644
index 8757abd7a0e..00000000000
--- a/meta/recipes-devtools/m4/m4/0001-Define-alignof_slot-using-_Alignof-when-using-C11-or.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From b0fd3a58354b1f5ead891907979dfd3dd36840d5 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 14 Jan 2023 14:55:03 -0800
-Subject: [PATCH] Define alignof_slot using _Alignof when using C11 or newer
-
-WG14 N2350 made very clear that it is an UB having type definitions
-within "offsetof" [1]. This patch enhances the implementation of macro
-alignof_slot to use builtin "_Alignof" to avoid undefined behavior on
-when using std=c11 or newer
-
-clang 16+ has started to flag this [2]
-
-Fixes build when using -std >= gnu11 and using clang16+ [3]
-
-[1] https://www.open-std.org/jtc1/sc22/wg14/www/docs/n2350.htm
-[2] https://reviews.llvm.org/D133574
-[3] https://public-inbox.org/bug-gnulib/20230114232744.215167-1-raj.khem@gmail.com/T/#u
-
-Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=2d404c7dd974cc65f894526f4a1b76bc1dcd8d82]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/alignof.h | 2 ++
- 1 file changed, 2 insertions(+)
-
---- a/lib/alignof.h
-+++ b/lib/alignof.h
-@@ -18,19 +18,19 @@
- #define _ALIGNOF_H
- 
- #include <stddef.h>
-+#include "stdalign.h"
- 
- /* alignof_slot (TYPE)
-    Determine the alignment of a structure slot (field) of a given type,
-    at compile time.  Note that the result depends on the ABI.
--   This is the same as alignof (TYPE) and _Alignof (TYPE), defined in
--   <stdalign.h> if __alignof_is_defined is 1.
-+   This is the same as alignof (TYPE).
-    Note: The result cannot be used as a value for an 'enum' constant,
-    due to bugs in HP-UX 10.20 cc and AIX 3.2.5 xlc.  */
- #if defined __cplusplus
-   template <class type> struct alignof_helper { char __slot1; type __slot2; };
- # define alignof_slot(type) offsetof (alignof_helper<type>, __slot2)
- #else
--# define alignof_slot(type) offsetof (struct { char __slot1; type __slot2; }, __slot2)
-+# define alignof_slot(type) alignof (type)
- #endif
- 
- /* alignof_type (TYPE)
diff --git a/meta/recipes-devtools/m4/m4/0001-sigsegv-Fix-build-on-ppc-musl.patch b/meta/recipes-devtools/m4/m4/0001-sigsegv-Fix-build-on-ppc-musl.patch
deleted file mode 100644
index 04320de63a2..00000000000
--- a/meta/recipes-devtools/m4/m4/0001-sigsegv-Fix-build-on-ppc-musl.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 36d5e26f606e070553eb0fff1f738e61970be5d7 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 9 Mar 2022 20:22:20 -0800
-Subject: [PATCH] sigsegv: Fix build on ppc/musl
-
-mcontext is not a standard layout so glibc and musl differ sadly.
-
-Fixes
-../../m4-1.4.19/lib/sigsegv.c: In function 'sigsegv_handler':                                                                                                                               ../../m4-1.4.19/lib/sigsegv.c:223:75: error: 'mcontext_t' has no member named 'uc_regs'; did you mean 'gregs'?                                                                                223 | #    define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.uc_regs->gregs[1]                                                                                               |                                                                           ^~~~~~~
-
-Upstream-Status: Submitted [https://lists.gnu.org/archive/html/m4-patches/2022-03/msg00000.html]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/sigsegv.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/lib/sigsegv.c b/lib/sigsegv.c
-index 696a152..fa0c465 100644
---- a/lib/sigsegv.c
-+++ b/lib/sigsegv.c
-@@ -217,10 +217,10 @@ int libsigsegv_version = LIBSIGSEGV_VERSION;
- #   define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.gp_regs[1]
- #  else /* 32-bit */
- /* both should be equivalent */
--#   if 0
--#    define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.regs->gpr[1]
-+#   if ! defined __GLIBC__
-+#      define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_regs->gregs[1]
- #   else
--#    define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.uc_regs->gregs[1]
-+#      define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.uc_regs->gregs[1]
- #   endif
- #  endif
- 
--- 
-2.35.1
-
diff --git a/meta/recipes-devtools/m4/m4/ac_config_links.patch b/meta/recipes-devtools/m4/m4/ac_config_links.patch
deleted file mode 100644
index 39fcd918968..00000000000
--- a/meta/recipes-devtools/m4/m4/ac_config_links.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-This patch fixes a build problem for m4-native experienced on Ubuntu 9.10,
-where autoconf/automake (AC_CONFIG_LINKS) ends up making GNUmakefile a
-symlink to itself.
-
-The patch comments out ac_config_links directly in configure,
-as autoreconf is not actually run for m4-native.
-
-I believe it should be safe, as GNUmakefile is actually unpacked from
-source, and what we want is to is to not touch it.
-
-Tested on x86_64_linux (Ubuntu 8.04 and 9.10).
-
-2009-11-10      Esben Haabendal     <eha@doredevelopment.dk>
----
- configure | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure b/configure
-index 883336a..6343a34 100755
---- a/configure
-+++ b/configure
-@@ -37061,8 +37061,8 @@ printf "%s\n" "#define GNULIB_TEST_GETRANDOM 1" >>confdefs.h
-   # only, it does not matter if we skip the link with older autoconf.
-   # Automake 1.10.1 and earlier try to remove GNUmakefile in non-VPATH
-   # builds, so use a shell variable to bypass this.
--  GNUmakefile=GNUmakefile
--  ac_config_links="$ac_config_links $GNUmakefile:$GNUmakefile"
-+#  GNUmakefile=GNUmakefile
-+#  ac_config_links="$ac_config_links $GNUmakefile:$GNUmakefile"
- 
- 
-   LIB_HARD_LOCALE="$LIB_SETLOCALE_NULL"
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/m4/m4/run-ptest b/meta/recipes-devtools/m4/m4/run-ptest
index 5c0fe933578..a91c372e541 100644
--- a/meta/recipes-devtools/m4/m4/run-ptest
+++ b/meta/recipes-devtools/m4/m4/run-ptest
@@ -2,4 +2,4 @@
 #
 #This script is used to run m4 test suites
 cd tests 
-make -k runtest-TESTS top_srcdir=.. srcdir=.
+make -k runtest-TESTS abs_aux_dir=../../@BP@/tests/build-aux abs_top_srcdir=../../@BP@/tests abs_srcdir=../../@BP@/tests top_srcdir=.. srcdir=.
diff --git a/meta/recipes-devtools/m4/m4/serial-tests-config.patch b/meta/recipes-devtools/m4/m4/serial-tests-config.patch
index 34e6ad801e7..c1573b13c0f 100644
--- a/meta/recipes-devtools/m4/m4/serial-tests-config.patch
+++ b/meta/recipes-devtools/m4/m4/serial-tests-config.patch
@@ -12,19 +12,14 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/configure.ac b/configure.ac
-index 78b8788..931fa6f 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -22,7 +22,7 @@ AC_INIT([GNU M4], m4_esyscmd([build-aux/git-version-gen .tarball-version]),
+@@ -22,7 +22,7 @@ AC_INIT([GNU M4], m4_esyscmd([build-aux/
    [bug-m4@gnu.org])
  AC_CONFIG_AUX_DIR([build-aux])
  
--AM_INIT_AUTOMAKE([1.11.6 dist-bzip2 dist-xz color-tests parallel-tests
-+AM_INIT_AUTOMAKE([1.11.6 dist-bzip2 dist-xz color-tests serial-tests
+-AM_INIT_AUTOMAKE([1.14 dist-bzip2 dist-xz color-tests parallel-tests
++AM_INIT_AUTOMAKE([1.14 dist-bzip2 dist-xz color-tests serial-tests
  silent-rules subdir-objects gnu])
  AM_SILENT_RULES([yes]) # make --enable-silent-rules the default.
  
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/m4/m4_1.4.19.bb b/meta/recipes-devtools/m4/m4_1.4.20.bb
similarity index 100%
rename from meta/recipes-devtools/m4/m4_1.4.19.bb
rename to meta/recipes-devtools/m4/m4_1.4.20.bb

