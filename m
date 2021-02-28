Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.7713.1614526638613040960
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Feb 2021 07:37:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tuFRWl+N;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id r17so23490332ejy.13
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Feb 2021 07:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FWfOOk8w7rlm2320gnODtTTTusrmV3OILY2L+qk6U+c=;
        b=tuFRWl+NcH8ooFQANHatn7KcBI+HknVwaaQjmA8iV1gAkCe/1l1W5TRmeXoAjMeC3l
         jtYL4ouYl7Sw1IlzfpFfASYKtFtvEfPIk8HIlW8eN6lCzek4XwdPigKXTLCQurL8/IHw
         /zb/JBsR7XnODegVTo/iXbe4NGVRsjVMNgpLFcuCPfKYnE+cgWg3vBuWiCzuqmjIwpdJ
         PIWbvdhwH5gr4efpWTIhJcM/0kqq1phauFJDKFXuGOuyV+ZIAZUo81d1h8oPTT5bcclz
         aYpxhwPiZ54f9lMDnYhGyCKijZQ7uKiD9CiW4g3o7PRXifbBmEaLS19159+WPuKBto0e
         o0ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FWfOOk8w7rlm2320gnODtTTTusrmV3OILY2L+qk6U+c=;
        b=AcEXxOX7tiMZunm0CuAMtY1+ZdtjXpeibwCUUkFvWd8lu/+GGLOOlsmOwP1JFFrILq
         Imz8T+Z4kN2i0FC3cli/Cf54LatS7trpmvBnorIHRXeiNXwCS6PBCzuhndaHJyAa+h7t
         CjRyTQao3TwzqwqdZcbsL1baxDo6GVLkVJ3JQnQN15M1Sk1XPSgSJsUPcjXE7sKBV5M/
         154xYk6xTrp9IxPV8Ff3GgDpXanjux3fK7IqZIFTSZUcMFRS77Kgiq6iDBQymt3IFeX5
         7s4Ks03dYlpfxdyksetXPYuDc7E2XQBeAo4KuRSiQGQfkry7kLKtltvWVN9fLd1P0RlR
         5oTw==
X-Gm-Message-State: AOAM530ehwHrKZpCCkMFR9CwXTLj5KR3osEKhFkZMBy083KNmybuARSx
	dXYeCoJsOszmfSPFIpo9uq0gvIxzBH71IA==
X-Google-Smtp-Source: ABdhPJx/DNB1OljKbA6PfEKnkda2ASrWH83U4z/owqTsUtg3VH/3MQZWITx5Rkz1CIW8bfyb30qBIA==
X-Received: by 2002:a17:906:3444:: with SMTP id d4mr11981548ejb.410.1614526636988;
        Sun, 28 Feb 2021 07:37:16 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2450:1011:512:45a5:1b3d:84d2:e7fc])
        by smtp.gmail.com with ESMTPSA id b17sm10234780ejj.9.2021.02.28.07.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Feb 2021 07:37:16 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 07/24] elfutils: update 0.182 -> 0.183
Date: Sun, 28 Feb 2021 16:36:45 +0100
Message-Id: <20210228153702.498275-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210228153702.498275-1-alex.kanavin@gmail.com>
References: <20210228153702.498275-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop 0001-ppc_initreg.c-Incliude-asm-ptrace.h-for-pt_regs-defi.patch
Drop 0001-musl-obstack-fts.patch
(upstream has fixed the issues).

Drop a few other chunks where upstream has fixed the issues
or removed the code being patched.

Adjust ptests to pass again.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{elfutils_0.182.bb => elfutils_0.183.bb}  |   8 +-
 ...d-support-for-ipkg-to-debuginfod.cxx.patch |   7 +-
 .../elfutils/files/0001-dso-link-change.patch |   8 +-
 ...libasm-may-link-with-libbz2-if-found.patch |   4 +-
 ...-check-data_list.data.d.d_buf-before.patch |   2 +-
 .../files/0001-musl-obstack-fts.patch         | 124 ------------------
 ...cliude-asm-ptrace.h-for-pt_regs-defi.patch |  32 -----
 ...-skip-the-test-when-gcc-not-deployed.patch |  24 ++--
 ...m-compile-test_nlist-with-standard-C.patch |   6 +-
 ...cvt_gunhash-if-dest-and-src-are-same.patch |   2 +-
 .../elfutils/files/0002-musl-libs.patch       |  30 +----
 .../elfutils/files/0003-fixheadercheck.patch  |   6 +-
 .../elfutils/files/0003-musl-utils.patch      |  91 ++-----------
 ...4-Disable-the-test-to-convert-euc-jp.patch |  12 +-
 .../files/0004-Fix-error-on-musl.patch        |   4 +-
 .../0006-Fix-build-on-aarch64-musl.patch      |   2 +-
 .../0015-config-eu.am-do-not-use-Werror.patch |   2 +-
 .../elfutils/files/ptest.patch                |  61 ++++-----
 .../recipes-devtools/elfutils/files/run-ptest |   2 +-
 19 files changed, 85 insertions(+), 342 deletions(-)
 rename meta/recipes-devtools/elfutils/{elfutils_0.182.bb => elfutils_0.183.bb} (95%)
 delete mode 100644 meta/recipes-devtools/elfutils/files/0001-musl-obstack-fts.patch
 delete mode 100644 meta/recipes-devtools/elfutils/files/0001-ppc_initreg.c-Incliude-asm-ptrace.h-for-pt_regs-defi.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.182.bb b/meta/recipes-devtools/elfutils/elfutils_0.183.bb
similarity index 95%
rename from meta/recipes-devtools/elfutils/elfutils_0.182.bb
rename to meta/recipes-devtools/elfutils/elfutils_0.183.bb
index 1123a34bfe..16ed7c9ddb 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.182.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.183.bb
@@ -19,20 +19,18 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://0001-libasm-may-link-with-libbz2-if-found.patch \
            file://0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch \
            file://0001-skip-the-test-when-gcc-not-deployed.patch \
-           file://0001-ppc_initreg.c-Incliude-asm-ptrace.h-for-pt_regs-defi.patch \
            file://run-ptest \
            file://ptest.patch \
            file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch \
            file://0001-add-support-for-ipkg-to-debuginfod.cxx.patch \
            "
 SRC_URI_append_libc-musl = " \
-           file://0001-musl-obstack-fts.patch \
            file://0002-musl-libs.patch \
            file://0003-musl-utils.patch \
            file://0004-Fix-error-on-musl.patch \
            file://0015-config-eu.am-do-not-use-Werror.patch \
            "
-SRC_URI[sha256sum] = "ecc406914edf335f0b7fc084ebe6c460c4d6d5175bfdd6688c1c78d9146b8858"
+SRC_URI[sha256sum] = "c3637c208d309d58714a51e61e63f1958808fead882e9b607506a29e5474f2c5"
 
 inherit autotools gettext ptest pkgconfig
 
@@ -68,6 +66,8 @@ do_install_ptest() {
 		install -d -m 755                       ${D}${PTEST_PATH}/libdwfl
 		install -d -m 755                       ${D}${PTEST_PATH}/libdwelf
 		install -d -m 755                       ${D}${PTEST_PATH}/libasm
+		install -d -m 755                       ${D}${PTEST_PATH}/libcpu
+		install -d -m 755                       ${D}${PTEST_PATH}/libebl
 		for test_file in ${TEST_FILES}; do
 			if [ -f ${B}/src/${test_file} ]; then
 				cp -r ${B}/src/${test_file} ${D}${PTEST_PATH}/src
@@ -76,6 +76,8 @@ do_install_ptest() {
 		cp ${D}${libdir}/libelf-${PV}.so ${D}${PTEST_PATH}/libelf/libelf.so
 		cp ${D}${libdir}/libdw-${PV}.so ${D}${PTEST_PATH}/libdw/libdw.so
 		cp ${D}${libdir}/libasm-${PV}.so ${D}${PTEST_PATH}/libasm/libasm.so
+		cp ${B}/libcpu/libcpu.a ${D}${PTEST_PATH}/libcpu/
+		cp ${B}/libebl/libebl.a ${D}${PTEST_PATH}/libebl/
 		cp ${S}/libelf/*.h             ${D}${PTEST_PATH}/libelf/
 		cp ${S}/libdw/*.h              ${D}${PTEST_PATH}/libdw/
 		cp ${S}/libdwfl/*.h            ${D}${PTEST_PATH}/libdwfl/
diff --git a/meta/recipes-devtools/elfutils/files/0001-add-support-for-ipkg-to-debuginfod.cxx.patch b/meta/recipes-devtools/elfutils/files/0001-add-support-for-ipkg-to-debuginfod.cxx.patch
index f15eacbe72..5f82afef0c 100644
--- a/meta/recipes-devtools/elfutils/files/0001-add-support-for-ipkg-to-debuginfod.cxx.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-add-support-for-ipkg-to-debuginfod.cxx.patch
@@ -1,4 +1,4 @@
-From b647d1df55c20772a9cc7ce96fcf323c500481bf Mon Sep 17 00:00:00 2001
+From 571416bf5b5ef319df6d9c79e46680920487e4a7 Mon Sep 17 00:00:00 2001
 From: dorindabassey <dorindabassey@gmail.com>
 Date: Sat, 19 Dec 2020 01:11:46 +0100
 Subject: [PATCH] add support for ipkg to debuginfod.cxx
@@ -8,15 +8,16 @@ added support for ipkg to the debuginfod scanner. 0.182 only supports RPM and sc
 Upstream-status: Submitted [https://sourceware.org/pipermail/elfutils-devel/2020q4/003357.html]
 
 Signed-off-by: dorindabassey <dorindabassey@gmail.com>
+
 ---
  debuginfod/debuginfod.cxx | 2 ++
  1 file changed, 2 insertions(+)
 
 diff --git a/debuginfod/debuginfod.cxx b/debuginfod/debuginfod.cxx
-index 5621030..cc78c93 100644
+index b34eacc..a8915f2 100644
 --- a/debuginfod/debuginfod.cxx
 +++ b/debuginfod/debuginfod.cxx
-@@ -442,11 +442,13 @@ parse_opt (int key, char *arg,
+@@ -484,11 +484,13 @@ parse_opt (int key, char *arg,
          {
            scan_archives[".deb"]="dpkg-deb --fsys-tarfile";
            scan_archives[".ddeb"]="dpkg-deb --fsys-tarfile";
diff --git a/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch b/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch
index 62031073e3..6acc036406 100644
--- a/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch
@@ -1,4 +1,4 @@
-From ec9a7742734aae5417c0ebbffce66ac353e6cae7 Mon Sep 17 00:00:00 2001
+From c5fb59ac0819b5b6d8244c613cbcf92cb09840c1 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 15 Aug 2017 17:10:57 +0800
 Subject: [PATCH] dso link change
@@ -23,7 +23,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/Makefile.am b/src/Makefile.am
-index e462e7d..ea1215b 100644
+index 88d0ac8..c28d81f 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
 @@ -45,7 +45,7 @@ libdw = ../libdw/libdw.a -lz $(zip_LIBS) $(libelf) -ldl -lpthread
@@ -36,10 +36,10 @@ index e462e7d..ea1215b 100644
  endif
  libebl = ../libebl/libebl.a ../backends/libebl_backends.a ../libcpu/libcpu.a
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index eab4ae6..f59a01f 100644
+index c145720..72afd0e 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -516,7 +516,7 @@ libdw = ../libdw/libdw.a -lz $(zip_LIBS) $(libelf) $(libebl) -ldl -lpthread
+@@ -554,7 +554,7 @@ libdw = ../libdw/libdw.a -lz $(zip_LIBS) $(libelf) $(libebl) -ldl -lpthread
  libelf = ../libelf/libelf.a -lz
  libasm = ../libasm/libasm.a
  else
diff --git a/meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch b/meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch
index 73ead6d412..09c9d3ea24 100644
--- a/meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch
@@ -1,4 +1,4 @@
-From 8e5fff8b1d819e0870fb22b27950bb5f10c7a272 Mon Sep 17 00:00:00 2001
+From ed1975deeaa47f98d212fd144c8bda075b1a5d36 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 4 Oct 2017 22:30:46 -0700
 Subject: [PATCH] libasm may link with libbz2 if found
@@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/Makefile.am b/src/Makefile.am
-index ea1215b..13d9bda 100644
+index c28d81f..951e978 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
 @@ -40,11 +40,11 @@ EXTRA_DIST += make-debug-archive.in
diff --git a/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch b/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch
index b26ed99f65..c8d55d583a 100644
--- a/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch
@@ -1,4 +1,4 @@
-From e571cbd0c20085ec71969971f19280b5de95cfb7 Mon Sep 17 00:00:00 2001
+From f40cbd43acdb1fefef4fa53a6034296d83cbff7d Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Thu, 16 Aug 2018 09:58:26 +0800
 Subject: [PATCH] libelf/elf_end.c: check data_list.data.d.d_buf before free it
diff --git a/meta/recipes-devtools/elfutils/files/0001-musl-obstack-fts.patch b/meta/recipes-devtools/elfutils/files/0001-musl-obstack-fts.patch
deleted file mode 100644
index ca7caf08d8..0000000000
--- a/meta/recipes-devtools/elfutils/files/0001-musl-obstack-fts.patch
+++ /dev/null
@@ -1,124 +0,0 @@
-From dbaa05a519acfe4f6040784f5d4a28ca586c0fc4 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Fri, 23 Aug 2019 10:17:25 +0800
-Subject: [PATCH] musl-obstack-fts
-
-Look for libfts and libobstack during configure, these
-libraries are external to libc when using musl, whereas
-on glibc these libraries are provided in libc itself.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Inappropriate [workaround for musl]
-
-Rebase to 0.177
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
----
- configure.ac      | 54 +++++++++++++++++++++++++++++++++++++++++++++++
- libdw/Makefile.am |  2 +-
- src/Makefile.am   |  6 +++---
- 3 files changed, 58 insertions(+), 4 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 53bab6a..dfea85e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -539,6 +539,60 @@ else
- fi
- AC_SUBST([argp_LDADD])
- 
-+dnl Check if we have fts available from our libc
-+AC_LINK_IFELSE(
-+	[AC_LANG_PROGRAM(
-+		[#if !defined(__x86_64__)
-+		#undef  _FILE_OFFSET_BITS
-+		#define _FILE_OFFSET_BITS 32
-+		#endif
-+		#include <fts.h>],
-+		[FTS* fts = 0; return fts_close(fts); return 0;]
-+		)],
-+	[libc_has_fts="true"],
-+	[libc_has_fts="false"]
-+)
-+
-+dnl If our libc doesn't provide fts, then test for libfts
-+if test "$libc_has_fts" = "false" ; then
-+	AC_MSG_WARN("libc does not have fts")
-+	AC_CHECK_LIB([fts], [fts_close], [have_fts="true"], [have_fts="false"])
-+
-+	if test "$have_fts" = "false"; then
-+		AC_MSG_ERROR("no libfts found")
-+	else
-+		fts_LDADD="-lfts"
-+	fi
-+else
-+	fts_LDADD=""
-+fi
-+AC_SUBST([fts_LDADD])
-+
-+dnl Check if we have obstack available from our libc
-+AC_LINK_IFELSE(
-+	[AC_LANG_PROGRAM(
-+		[#include <obstack.h>],
-+		[_obstack_begin(0, 0, 0, NULL, NULL); return 0;]
-+		)],
-+	[libc_has_obstack="true"],
-+	[libc_has_obstack="false"]
-+)
-+
-+dnl If our libc doesn't provide obstack, then test for libobstack
-+if test "$libc_has_obstack" = "false" ; then
-+	AC_MSG_WARN("libc does not have obstack")
-+	AC_CHECK_LIB([obstack], [_obstack_begin], [have_obstack="true"], [have_obstack="false"])
-+
-+	if test "$have_obstack" = "false"; then
-+		AC_MSG_ERROR("no libobstack found")
-+	else
-+		obstack_LDADD="-lobstack"
-+	fi
-+else
-+	obstack_LDADD=""
-+fi
-+AC_SUBST([obstack_LDADD])
-+
- dnl The directories with content.
- 
- dnl Documentation.
-diff --git a/libdw/Makefile.am b/libdw/Makefile.am
-index 33b5838..ff92e02 100644
---- a/libdw/Makefile.am
-+++ b/libdw/Makefile.am
-@@ -109,7 +109,7 @@ libdw_so_LIBS = ../libebl/libebl_pic.a ../backends/libebl_backends_pic.a \
- 		../libcpu/libcpu_pic.a libdw_pic.a ../libdwelf/libdwelf_pic.a \
- 		../libdwfl/libdwfl_pic.a
- libdw_so_DEPS = ../lib/libeu.a ../libelf/libelf.so
--libdw_so_LDLIBS = $(libdw_so_DEPS) -ldl -lz $(argp_LDADD) $(zip_LIBS) -pthread
-+libdw_so_LDLIBS = $(libdw_so_DEPS) -ldl -lz $(argp_LDADD) $(fts_LDADD) $(zip_LIBS) -pthread
- libdw_so_SOURCES =
- libdw.so$(EXEEXT): $(srcdir)/libdw.map $(libdw_so_LIBS) $(libdw_so_DEPS)
- 	$(AM_V_CCLD)$(LINK) $(dso_LDFLAGS) -o $@ \
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 13d9bda..d5a4f7d 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -69,7 +69,7 @@ ar_no_Wstack_usage = yes
- unstrip_no_Wstack_usage = yes
- 
- readelf_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) $(argp_LDADD)
--nm_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) $(argp_LDADD) \
-+nm_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) $(argp_LDADD) $(obstack_LDADD) \
- 	   $(demanglelib)
- size_LDADD = $(libelf) $(libeu) $(argp_LDADD)
- strip_LDADD = $(libebl) $(libelf) $(libdw) $(libeu) $(argp_LDADD)
-@@ -78,9 +78,9 @@ findtextrel_LDADD = $(libdw) $(libelf) $(libeu) $(argp_LDADD)
- addr2line_LDADD = $(libdw) $(libelf) $(libeu) $(argp_LDADD) $(demanglelib)
- elfcmp_LDADD = $(libebl) $(libdw) $(libelf) $(libeu) $(argp_LDADD)
- objdump_LDADD  = $(libasm) $(libebl) $(libdw) $(libelf) $(libeu) $(argp_LDADD)
--ranlib_LDADD = libar.a $(libelf) $(libeu) $(argp_LDADD)
-+ranlib_LDADD = libar.a $(libelf) $(libeu) $(argp_LDADD) $(obstack_LDADD)
- strings_LDADD = $(libelf) $(libeu) $(argp_LDADD)
--ar_LDADD = libar.a $(libelf) $(libeu) $(argp_LDADD)
-+ar_LDADD = libar.a $(libelf) $(libeu) $(argp_LDADD) $(obstack_LDADD)
- unstrip_LDADD = $(libebl) $(libelf) $(libdw) $(libeu) $(argp_LDADD)
- stack_LDADD = $(libebl) $(libelf) $(libdw) $(libeu) $(argp_LDADD) $(demanglelib)
- elfcompress_LDADD = $(libebl) $(libelf) $(libdw) $(libeu) $(argp_LDADD)
diff --git a/meta/recipes-devtools/elfutils/files/0001-ppc_initreg.c-Incliude-asm-ptrace.h-for-pt_regs-defi.patch b/meta/recipes-devtools/elfutils/files/0001-ppc_initreg.c-Incliude-asm-ptrace.h-for-pt_regs-defi.patch
deleted file mode 100644
index 3303333c45..0000000000
--- a/meta/recipes-devtools/elfutils/files/0001-ppc_initreg.c-Incliude-asm-ptrace.h-for-pt_regs-defi.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 2e2232d0935bf8ef6e66ebffba3be68a73b5b3e5 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 8 Sep 2019 15:57:59 -0700
-Subject: [PATCH] ppc_initreg.c: Incliude asm/ptrace.h for pt_regs definition
-
-Fixes
-| ../../elfutils-0.176/backends/ppc_initreg.c:79:22: error: field 'r' has incomplete type
-|       struct pt_regs r;
-|                      ^
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- backends/ppc_initreg.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/backends/ppc_initreg.c b/backends/ppc_initreg.c
-index 0e0d359..e5cca7e 100644
---- a/backends/ppc_initreg.c
-+++ b/backends/ppc_initreg.c
-@@ -33,6 +33,7 @@
- #include <stdlib.h>
- #if defined(__powerpc__) && defined(__linux__)
- # include <sys/ptrace.h>
-+# include <asm/ptrace.h>
- # include <sys/user.h>
- #endif
- 
--- 
-2.23.0
-
diff --git a/meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-gcc-not-deployed.patch b/meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-gcc-not-deployed.patch
index de8c05f11e..114ca63cb5 100644
--- a/meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-gcc-not-deployed.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-gcc-not-deployed.patch
@@ -1,7 +1,7 @@
-From e82a055f85e398cb03a4eaf5faf351a3a1f19344 Mon Sep 17 00:00:00 2001
+From 2fa52d61b1abdf4a3f3b153c771fb2081666430c Mon Sep 17 00:00:00 2001
 From: Mingli Yu <Mingli.Yu@windriver.com>
 Date: Tue, 21 May 2019 15:20:34 +0800
-Subject: [PATCH v2] skip the test when gcc not deployed
+Subject: [PATCH] skip the test when gcc not deployed
 
 Skip the tests which depend on gcc when
 gcc not deployed.
@@ -9,6 +9,7 @@ gcc not deployed.
 Upstream-Status: Submitted[https://sourceware.org/ml/elfutils-devel/2019-q2/msg00091.html]
 
 Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
+
 ---
  tests/run-disasm-x86-64.sh | 2 ++
  tests/run-disasm-x86.sh    | 2 ++
@@ -17,7 +18,7 @@ Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
  4 files changed, 8 insertions(+)
 
 diff --git a/tests/run-disasm-x86-64.sh b/tests/run-disasm-x86-64.sh
-index a6be62b..c3ef238 100755
+index 07b612b..7a32996 100755
 --- a/tests/run-disasm-x86-64.sh
 +++ b/tests/run-disasm-x86-64.sh
 @@ -22,6 +22,8 @@ case "`uname -m`" in
@@ -26,11 +27,11 @@ index a6be62b..c3ef238 100755
      testfiles testfile45.S testfile45.expect
 +    # skip the case if no gcc deployed
 +    which gcc || exit 77
-     gcc -m64 -c -o testfile45.o testfile45.S
+     ${CC} -m64 -c -o testfile45.o testfile45.S
      testrun_compare ${abs_top_builddir}/src/objdump -d testfile45.o < testfile45.expect
      ;;
 diff --git a/tests/run-disasm-x86.sh b/tests/run-disasm-x86.sh
-index 28a3df7..544fc28 100755
+index 7ac73ad..f0d4796 100755
 --- a/tests/run-disasm-x86.sh
 +++ b/tests/run-disasm-x86.sh
 @@ -22,6 +22,8 @@ case "`uname -m`" in
@@ -39,11 +40,11 @@ index 28a3df7..544fc28 100755
      testfiles testfile44.S testfile44.expect
 +    # skip the case if no gcc deployed
 +    which gcc || exit 77
-     gcc -m32 -c -o testfile44.o testfile44.S
+     ${CC} -m32 -c -o testfile44.o testfile44.S
      testrun_compare ${abs_top_builddir}/src/objdump -d testfile44.o < testfile44.expect
      ;;
 diff --git a/tests/run-strip-g.sh b/tests/run-strip-g.sh
-index 1303819..a943dec 100755
+index 1592121..9b8157e 100755
 --- a/tests/run-strip-g.sh
 +++ b/tests/run-strip-g.sh
 @@ -24,6 +24,8 @@
@@ -53,10 +54,10 @@ index 1303819..a943dec 100755
 +# skip the test if gcc deployed
 +which gcc || exit 77
  echo Create debug a.out.
- echo "int main() { return 1; }" | gcc -g -xc -
+ echo "int main() { return 1; }" | ${CC} -g -xc -
  
 diff --git a/tests/run-strip-nothing.sh b/tests/run-strip-nothing.sh
-index 914fdfb..d03f734 100755
+index 710c200..3a81d8e 100755
 --- a/tests/run-strip-nothing.sh
 +++ b/tests/run-strip-nothing.sh
 @@ -22,6 +22,8 @@
@@ -66,8 +67,5 @@ index 914fdfb..d03f734 100755
 +# skip the case if no gcc deployed
 +which gcc || exit 77
  # Create no-debug a.out.
- echo "int main() { return 1; }" | gcc -s -xc -
+ echo "int main() { return 1; }" | ${CC} -s -xc -
  
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch b/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch
index d7b382fd94..c494d7f2e5 100644
--- a/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch
@@ -1,4 +1,4 @@
-From fa265ff686cb60e19aa607bda3752b6b2ee87a14 Mon Sep 17 00:00:00 2001
+From 22e0e1c01ec680a2970f4d5ca9e47f90259cbdcf Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 23 Jun 2020 07:49:35 +0000
 Subject: [PATCH] tests/Makefile.am: compile test_nlist with standard CFLAGS
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 05fc9b4..11de0fc 100644
+index a2dfd43..40a0228 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -92,7 +92,7 @@ endif
+@@ -90,7 +90,7 @@ endif
  test-nlist$(EXEEXT): test-nlist.c
  	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) \
  	  $(AM_CPPFLAGS) $(CPPFLAGS) \
diff --git a/meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch b/meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch
index 96c2565e3e..be48ef010b 100644
--- a/meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch
+++ b/meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch
@@ -1,4 +1,4 @@
-From f8e4118b60a9b54950437006a82b4047f38f5347 Mon Sep 17 00:00:00 2001
+From 1643d793761216252bb654e28aaa5b8eb1536bca Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 15 Aug 2017 17:13:59 +0800
 Subject: [PATCH] Fix elf_cvt_gunhash if dest and src are same.
diff --git a/meta/recipes-devtools/elfutils/files/0002-musl-libs.patch b/meta/recipes-devtools/elfutils/files/0002-musl-libs.patch
index c6f766f680..b373940d37 100644
--- a/meta/recipes-devtools/elfutils/files/0002-musl-libs.patch
+++ b/meta/recipes-devtools/elfutils/files/0002-musl-libs.patch
@@ -1,4 +1,4 @@
-From f4ca9db9d38f865505322595a8a1e8f69d5bb87c Mon Sep 17 00:00:00 2001
+From 18c527991deee93170a887b6da622560d5606913 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 23 Aug 2019 10:18:47 +0800
 Subject: [PATCH] musl-libs
@@ -19,10 +19,9 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  lib/error.h                    | 27 +++++++++++++++++++++++++++
  lib/fixedsizehash.h            |  1 -
  lib/libeu.h                    |  1 +
- libdwfl/dwfl_error.c           |  9 +++++++++
  libdwfl/linux-kernel-modules.c |  1 +
  libelf/elf.h                   |  7 +++++++
- 6 files changed, 45 insertions(+), 1 deletion(-)
+ 5 files changed, 36 insertions(+), 1 deletion(-)
  create mode 100644 lib/error.h
 
 diff --git a/lib/error.h b/lib/error.h
@@ -82,27 +81,6 @@ index ecb4d01..edc85e3 100644
  #include <stddef.h>
  #include <stdint.h>
  
-diff --git a/libdwfl/dwfl_error.c b/libdwfl/dwfl_error.c
-index 7bcf61c..11dcc8b 100644
---- a/libdwfl/dwfl_error.c
-+++ b/libdwfl/dwfl_error.c
-@@ -154,7 +154,16 @@ dwfl_errmsg (int error)
-   switch (error &~ 0xffff)
-     {
-     case OTHER_ERROR (ERRNO):
-+#if defined(__GLIBC__)
-       return strerror_r (error & 0xffff, "bad", 0);
-+#else
-+      {
-+        static __thread char buf[128] = "";
-+        if (strerror_r (error & 0xffff, buf, sizeof(buf)) == 0)
-+          return buf;
-+      }
-+      return "strerror_r() failed";
-+#endif
-     case OTHER_ERROR (LIBELF):
-       return elf_errmsg (error & 0xffff);
-     case OTHER_ERROR (LIBDW):
 diff --git a/libdwfl/linux-kernel-modules.c b/libdwfl/linux-kernel-modules.c
 index 6edb27f..f331e3c 100644
 --- a/libdwfl/linux-kernel-modules.c
@@ -116,7 +94,7 @@ index 6edb27f..f331e3c 100644
  /* If fts.h is included before config.h, its indirect inclusions may not
     give us the right LFS aliases of these functions, so map them manually.  */
 diff --git a/libelf/elf.h b/libelf/elf.h
-index 6439c1a..a87c589 100644
+index 8e3e618..1353890 100644
 --- a/libelf/elf.h
 +++ b/libelf/elf.h
 @@ -19,6 +19,10 @@
@@ -130,7 +108,7 @@ index 6439c1a..a87c589 100644
  /* Standard ELF types.  */
  
  #include <stdint.h>
-@@ -4101,4 +4105,7 @@ enum
+@@ -4102,4 +4106,7 @@ enum
  #define R_ARC_TLS_LE_S9		0x4a
  #define R_ARC_TLS_LE_32		0x4b
  
diff --git a/meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch b/meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch
index e36d3f44dd..212b358dc2 100644
--- a/meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch
+++ b/meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch
@@ -1,4 +1,4 @@
-From dd7c8c730457def5f62ebd43022b2f06df8c6ed9 Mon Sep 17 00:00:00 2001
+From 7e1f91c42ef5b0bf10afefec10dd08588df3ab1f Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 15 Aug 2017 17:17:20 +0800
 Subject: [PATCH] fixheadercheck
@@ -22,10 +22,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/libelf/elf32_updatenull.c b/libelf/elf32_updatenull.c
-index 3e9ef61..5351518 100644
+index d0d4d1e..4ecf5a5 100644
 --- a/libelf/elf32_updatenull.c
 +++ b/libelf/elf32_updatenull.c
-@@ -339,8 +339,8 @@ __elfw2(LIBELFBITS,updatenull_wrlock) (Elf *elf, int *change_bop, size_t shnum)
+@@ -354,8 +354,8 @@ __elfw2(LIBELFBITS,updatenull_wrlock) (Elf *elf, int *change_bop, size_t shnum)
  		     we test for the alignment of the section being large
  		     enough for the largest alignment required by a data
  		     block.  */
diff --git a/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch b/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
index a8b39b5f93..65593be32f 100644
--- a/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
+++ b/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
@@ -1,4 +1,4 @@
-From e7e5333ed2e19f25ecbd7121f424eec99d61265a Mon Sep 17 00:00:00 2001
+From 2dab1a02a3cfd80629f3e0f380805a5e58dd0ac3 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 23 Aug 2019 10:19:48 +0800
 Subject: [PATCH] musl-utils
@@ -15,12 +15,11 @@ Rebase to 0.177
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 
 ---
- src/arlib.h       |  6 ++++++
- src/elfcompress.c |  7 +++++++
- src/readelf.c     | 20 ++++++++++++--------
- src/strip.c       |  7 +++++++
- src/unstrip.c     |  9 +++++++++
- 5 files changed, 41 insertions(+), 8 deletions(-)
+ src/arlib.h       | 6 ++++++
+ src/elfcompress.c | 7 +++++++
+ src/strip.c       | 7 +++++++
+ src/unstrip.c     | 9 +++++++++
+ 4 files changed, 29 insertions(+)
 
 diff --git a/src/arlib.h b/src/arlib.h
 index e117166..8326f6c 100644
@@ -40,7 +39,7 @@ index e117166..8326f6c 100644
  /* State of -D/-U flags.  */
  extern bool arlib_deterministic_output;
 diff --git a/src/elfcompress.c b/src/elfcompress.c
-index 6ba6af4..0c7674b 100644
+index 1b5b1e3..21c9024 100644
 --- a/src/elfcompress.c
 +++ b/src/elfcompress.c
 @@ -37,6 +37,13 @@
@@ -57,74 +56,8 @@ index 6ba6af4..0c7674b 100644
  /* Name and version of program.  */
  ARGP_PROGRAM_VERSION_HOOK_DEF = print_version;
  
-diff --git a/src/readelf.c b/src/readelf.c
-index 64067a5..630739c 100644
---- a/src/readelf.c
-+++ b/src/readelf.c
-@@ -4829,10 +4829,11 @@ listptr_base (struct listptr *p)
-   return cudie_base (&cu);
- }
- 
-+static const char *listptr_name;
-+
- static int
--compare_listptr (const void *a, const void *b, void *arg)
-+compare_listptr (const void *a, const void *b)
- {
--  const char *name = arg;
-   struct listptr *p1 = (void *) a;
-   struct listptr *p2 = (void *) b;
- 
-@@ -4848,21 +4849,21 @@ compare_listptr (const void *a, const void *b, void *arg)
- 	  p1->warned = p2->warned = true;
- 	  error (0, 0,
- 		 gettext ("%s %#" PRIx64 " used with different address sizes"),
--		 name, (uint64_t) p1->offset);
-+		 listptr_name, (uint64_t) p1->offset);
- 	}
-       if (p1->dwarf64 != p2->dwarf64)
- 	{
- 	  p1->warned = p2->warned = true;
- 	  error (0, 0,
- 		 gettext ("%s %#" PRIx64 " used with different offset sizes"),
--		 name, (uint64_t) p1->offset);
-+		 listptr_name, (uint64_t) p1->offset);
- 	}
-       if (listptr_base (p1) != listptr_base (p2))
- 	{
- 	  p1->warned = p2->warned = true;
- 	  error (0, 0,
- 		 gettext ("%s %#" PRIx64 " used with different base addresses"),
--		 name, (uint64_t) p1->offset);
-+		 listptr_name, (uint64_t) p1->offset);
- 	}
-       if (p1->attr != p2 ->attr)
- 	{
-@@ -4870,7 +4871,7 @@ compare_listptr (const void *a, const void *b, void *arg)
- 	  error (0, 0,
- 		 gettext ("%s %#" PRIx64
- 			  " used with different attribute %s and %s"),
--		 name, (uint64_t) p1->offset, dwarf_attr_name (p2->attr),
-+		 listptr_name, (uint64_t) p1->offset, dwarf_attr_name (p2->attr),
- 		 dwarf_attr_name (p2->attr));
- 	}
-     }
-@@ -4942,8 +4943,11 @@ static void
- sort_listptr (struct listptr_table *table, const char *name)
- {
-   if (table->n > 0)
--    qsort_r (table->table, table->n, sizeof table->table[0],
--	     &compare_listptr, (void *) name);
-+    {
-+      listptr_name = name;
-+      qsort (table->table, table->n, sizeof table->table[0],
-+	    &compare_listptr);
-+    }
- }
- 
- static bool
 diff --git a/src/strip.c b/src/strip.c
-index 48792a7..198a2e4 100644
+index 7a5d4e4..81a0d57 100644
 --- a/src/strip.c
 +++ b/src/strip.c
 @@ -46,6 +46,13 @@
@@ -142,12 +75,12 @@ index 48792a7..198a2e4 100644
  
  /* Name and version of program.  */
 diff --git a/src/unstrip.c b/src/unstrip.c
-index a855038..df6fc1c 100644
+index 8580329..d547487 100644
 --- a/src/unstrip.c
 +++ b/src/unstrip.c
-@@ -56,6 +56,15 @@
- # define _(str) gettext (str)
- #endif
+@@ -52,6 +52,15 @@
+ #include "libeu.h"
+ #include "printversion.h"
  
 +#ifndef strndupa
 +#define strndupa(s, n) \
diff --git a/meta/recipes-devtools/elfutils/files/0004-Disable-the-test-to-convert-euc-jp.patch b/meta/recipes-devtools/elfutils/files/0004-Disable-the-test-to-convert-euc-jp.patch
index 5dee61210a..f407bdd0be 100644
--- a/meta/recipes-devtools/elfutils/files/0004-Disable-the-test-to-convert-euc-jp.patch
+++ b/meta/recipes-devtools/elfutils/files/0004-Disable-the-test-to-convert-euc-jp.patch
@@ -1,4 +1,4 @@
-From e4ede22e28eaa38d81667ddcb19541ece1a83cf8 Mon Sep 17 00:00:00 2001
+From cd36f34c722dd0babd7beb13c968aa0780c9f726 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 15 Aug 2017 17:24:06 +0800
 Subject: [PATCH] Disable the test to convert euc-jp
@@ -21,10 +21,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/m4/iconv.m4 b/m4/iconv.m4
-index a503646..299f1eb 100644
+index aa159c5..d16312b 100644
 --- a/m4/iconv.m4
 +++ b/m4/iconv.m4
-@@ -159,6 +159,7 @@ int main ()
+@@ -165,6 +165,7 @@ AC_DEFUN([AM_ICONV_LINK],
        }
    }
  #endif
@@ -32,11 +32,11 @@ index a503646..299f1eb 100644
    /* Test against HP-UX 11.11 bug: No converter from EUC-JP to UTF-8 is
       provided.  */
    if (/* Try standardized names.  */
-@@ -170,6 +171,7 @@ int main ()
+@@ -176,6 +177,7 @@ AC_DEFUN([AM_ICONV_LINK],
        /* Try HP-UX names.  */
        && iconv_open ("utf8", "eucJP") == (iconv_t)(-1))
      result |= 16;
 +#endif
    return result;
- }]])],
-         [am_cv_func_iconv_works=yes],
+ ]])],
+           [am_cv_func_iconv_works=yes], ,
diff --git a/meta/recipes-devtools/elfutils/files/0004-Fix-error-on-musl.patch b/meta/recipes-devtools/elfutils/files/0004-Fix-error-on-musl.patch
index 0d162ebe1b..8e1e97041f 100644
--- a/meta/recipes-devtools/elfutils/files/0004-Fix-error-on-musl.patch
+++ b/meta/recipes-devtools/elfutils/files/0004-Fix-error-on-musl.patch
@@ -1,4 +1,4 @@
-From ed87f11f7297c0edb3ca8950de1cc23e9b96217c Mon Sep 17 00:00:00 2001
+From ce3b1403bd88261b5461a9dcb7d6d6be9185703e Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 1 May 2019 22:15:03 +0100
 Subject: [PATCH] Fix error on musl:
@@ -19,7 +19,7 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
  1 file changed, 5 insertions(+)
 
 diff --git a/tests/elfstrmerge.c b/tests/elfstrmerge.c
-index ba0d68d..1d2447f 100644
+index abbdf3f..bd90f4d 100644
 --- a/tests/elfstrmerge.c
 +++ b/tests/elfstrmerge.c
 @@ -33,6 +33,11 @@
diff --git a/meta/recipes-devtools/elfutils/files/0006-Fix-build-on-aarch64-musl.patch b/meta/recipes-devtools/elfutils/files/0006-Fix-build-on-aarch64-musl.patch
index 6f7956c5ae..8942ad7828 100644
--- a/meta/recipes-devtools/elfutils/files/0006-Fix-build-on-aarch64-musl.patch
+++ b/meta/recipes-devtools/elfutils/files/0006-Fix-build-on-aarch64-musl.patch
@@ -1,4 +1,4 @@
-From 578f370c7e7a9f056aefa062b34590b0aa13bce5 Mon Sep 17 00:00:00 2001
+From 2396fd67d81e54e18fbad67a5ff67d5684a01013 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 15 Aug 2017 17:27:30 +0800
 Subject: [PATCH] Fix build on aarch64/musl
diff --git a/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch b/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch
index ec1b927c2e..205362626d 100644
--- a/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch
+++ b/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch
@@ -1,4 +1,4 @@
-From 574ac484c01125a97ba8737cf7292ca926897310 Mon Sep 17 00:00:00 2001
+From dfe11e043cd8ea0b0f0252bcff9f5a6b98c0ecd3 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jun 2020 21:35:16 +0000
 Subject: [PATCH] config/eu.am: do not use -Werror
diff --git a/meta/recipes-devtools/elfutils/files/ptest.patch b/meta/recipes-devtools/elfutils/files/ptest.patch
index 35b23f43b3..fe6f272a83 100644
--- a/meta/recipes-devtools/elfutils/files/ptest.patch
+++ b/meta/recipes-devtools/elfutils/files/ptest.patch
@@ -1,4 +1,7 @@
-Changes to allow ptest to run standalone on target:
+From bfbf393e7d5b1b41df85ce1c37e887776c45d529 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Wed, 1 May 2019 16:37:48 +0100
+Subject: [PATCH] Changes to allow ptest to run standalone on target:
 
 a) Run the tests serially
 b) Use the standalone test mode which allows the tests to be run in their
@@ -12,11 +15,17 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
 Upstream-Status: Inappropriate [oe specific]
 
-Index: elfutils-0.176/configure.ac
-===================================================================
---- elfutils-0.176.orig/configure.ac
-+++ elfutils-0.176/configure.ac
-@@ -45,7 +45,7 @@ AC_COPYRIGHT([Copyright (C) 1996-2018 Th
+---
+ configure.ac       | 2 +-
+ tests/Makefile.am  | 2 ++
+ tests/test-subr.sh | 6 ------
+ 3 files changed, 3 insertions(+), 7 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index d345495..67933d1 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -48,7 +48,7 @@ AC_COPYRIGHT([Copyright (C) 1996-2021 The elfutils developers.])
  AC_PREREQ(2.63)			dnl Minimum Autoconf version required.
  
  dnl We use GNU make extensions; automake 1.10 defaults to -Wportability.
@@ -25,42 +34,20 @@ Index: elfutils-0.176/configure.ac
  AM_MAINTAINER_MODE
  
  AM_SILENT_RULES([yes])
-Index: elfutils-0.176/tests/Makefile.am
-===================================================================
---- elfutils-0.176.orig/tests/Makefile.am
-+++ elfutils-0.176/tests/Makefile.am
-@@ -445,10 +445,10 @@ installed_TESTS_ENVIRONMENT = libdir=$(D
- installed_LOG_COMPILER = $(abs_srcdir)/test-wrapper.sh \
- 			 installed $(tests_rpath) \
- 			 '$(program_transform_name)'
--if STANDALONE
-+if !STANDALONE
- TESTS_ENVIRONMENT = $(installed_TESTS_ENVIRONMENT)
- LOG_COMPILER = $(installed_LOG_COMPILER)
--else !STANDALONE
-+else STANDALONE
- TESTS_ENVIRONMENT = LC_ALL=C; LANG=C; VALGRIND_CMD=$(valgrind_cmd); \
- 		    abs_srcdir=$(abs_srcdir);  abs_builddir=$(abs_builddir); \
- 		    abs_top_builddir=$(abs_top_builddir); \
-@@ -463,7 +463,7 @@ installcheck-local:
- 	$(MAKE) $(AM_MAKEFLAGS) \
- 		TESTS_ENVIRONMENT="$(installed_TESTS_ENVIRONMENT)" \
- 		LOG_COMPILER="$(installed_LOG_COMPILER)" check-TESTS
--endif !STANDALONE
-+endif STANDALONE
- 
- if STANDALONE
- libdw = -ldw
-@@ -612,3 +612,5 @@ check: check-am coverage
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 72afd0e..a2dfd43 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -698,3 +698,5 @@ check: check-am coverage
  coverage:
  	-$(srcdir)/coverage.sh
  endif
 +oecheck:
 +	$(MAKE) $(AM_MAKEFLAGS) $(check_PROGRAMS)
-Index: elfutils-0.176/tests/test-subr.sh
-===================================================================
---- elfutils-0.176.orig/tests/test-subr.sh
-+++ elfutils-0.176/tests/test-subr.sh
+diff --git a/tests/test-subr.sh b/tests/test-subr.sh
+index 411e5f2..a638ff9 100644
+--- a/tests/test-subr.sh
++++ b/tests/test-subr.sh
 @@ -91,12 +91,6 @@ installed_testrun()
    program="$1"
    shift
diff --git a/meta/recipes-devtools/elfutils/files/run-ptest b/meta/recipes-devtools/elfutils/files/run-ptest
index 81b81f2f5d..d5776fdb53 100644
--- a/meta/recipes-devtools/elfutils/files/run-ptest
+++ b/meta/recipes-devtools/elfutils/files/run-ptest
@@ -3,4 +3,4 @@
 #This script is used to run elfutils test suites
 cd tests
 
-make -k runtest-TESTS abs_srcdir=$PWD abs_builddir=$PWD srcdir=$PWD top_srcdir=$PWD/../ abs_top_builddir=$PWD/../ elfutils_testrun=installed elfutils_tests_rpath=no program_transform_name=s,^,eu-,
+make -k installcheck-local CC=gcc abs_srcdir=$PWD abs_builddir=$PWD srcdir=$PWD top_srcdir=$PWD/../ abs_top_builddir=$PWD/../ elfutils_testrun=installed elfutils_tests_rpath=no program_transform_name=s,^,eu-,
-- 
2.29.2

