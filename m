Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C38E5D591DE
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:16:59 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.4659.1731964617240623107
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:16:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=YfLQgmKH;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=YrHWPUAO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101934122bf28-b901f9e3-4ef5-4a04-9d31-7b90e503012d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964616;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mwBe1RIe7I/j7fk1NZIgaUgP1Yryq2dDQ6tjQz3ez2I=;
	b=YfLQgmKH6AiOrdoay2+ABYAbO8A7hhfaaraVNbPulckSoR+iYgOnBlcZIMA1BoBg
	Aj/5c9QSlXWsLEzSrShsey9D1ahjaxkNK/SOpGr9ogX+w6+7zSA9XJ+wclKRDyNZCAZ
	rc4DpFhJA0MV/T5FmEOHu2Ii93VMm2JjlAyP6/Xk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964616;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mwBe1RIe7I/j7fk1NZIgaUgP1Yryq2dDQ6tjQz3ez2I=;
	b=YrHWPUAOozf7Aq9fif5+fgHmqMKpUFBlqzH117o9IVOZswFyKxPZwc+QvLri3hMi
	klT/1HGvcHj12y9VGWcDcNTi9/0IkXBzRjE6i9U21RZe1zBvFkNGuRmUfntHzupdzBd
	iGOS4DfrGSOwQDwA17IYkBG0VxyYEZl4Nnf0wl/s=
Content-Type: multipart/mixed; boundary="===============5100914117630768748=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangruochen@loongson.cn>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] elfutils: upgrading to 0.192 FAILED
Message-ID: <010101934122bf28-b901f9e3-4ef5-4a04-9d31-7b90e503012d-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:16:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:16:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207262

--===============5100914117630768748==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *elfutils* to *0.192* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-elfutils-upgrade-0.191-0.192.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 94a13c33d99ba43708f364f006a5d8d71e6f1658 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 16 Nov 2024 09:36:46 +0000
Subject: [PATCH] elfutils: upgrade 0.191 -> 0.192

---
 .../{elfutils_0.191.bb => elfutils_0.192.bb}  | 27 +++++++++++---
 ...01-debuginfod-Remove-unused-variable.patch | 34 ------------------
 .../elfutils/files/0001-dso-link-change.patch | 12 +++----
 ...libasm-may-link-with-libbz2-if-found.patch |  8 ++---
 ...-check-data_list.data.d.d_buf-before.patch |  6 ++--
 ...-skip-the-test-when-gcc-not-deployed.patch |  2 +-
 ...iles-fix-unused-variable-BUFFER_SIZE.patch | 36 -------------------
 ...m-compile-test_nlist-with-standard-C.patch |  6 ++--
 ...cvt_gunhash-if-dest-and-src-are-same.patch |  2 +-
 .../elfutils/files/0003-fixheadercheck.patch  |  2 +-
 .../elfutils/files/0003-musl-utils.patch      |  4 +--
 .../elfutils/files/ptest.patch                | 12 +++----
 12 files changed, 50 insertions(+), 101 deletions(-)
 rename meta/recipes-devtools/elfutils/{elfutils_0.191.bb => elfutils_0.192.bb} (90%)
 delete mode 100644 meta/recipes-devtools/elfutils/files/0001-debuginfod-Remove-unused-variable.patch
 delete mode 100644 meta/recipes-devtools/elfutils/files/0001-srcfiles-fix-unused-variable-BUFFER_SIZE.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.191.bb b/meta/recipes-devtools/elfutils/elfutils_0.192.bb
similarity index 90%
rename from meta/recipes-devtools/elfutils/elfutils_0.191.bb
rename to meta/recipes-devtools/elfutils/elfutils_0.192.bb
index 95364cef97..632236c881 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.191.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.192.bb
@@ -1,10 +1,30 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- debuginfod/debuginfod-client.c
+# +++ debuginfod/debuginfod-client.c
+# @@ -1,5 +1,5 @@
+#  /* Retrieve ELF / DWARF / source files from the debuginfod.
+# -   Copyright (C) 2019-2021 Red Hat, Inc.
+# +   Copyright (C) 2019-2024 Red Hat, Inc.
+#     Copyright (C) 2021, 2022 Mark J. Wielaard <mark@klomp.org>
+#     This file is part of elfutils.
+#  
+# 
+#
+
 SUMMARY = "Utilities and libraries for handling compiled object files"
 HOMEPAGE = "https://sourceware.org/elfutils"
 DESCRIPTION = "elfutils is a collection of utilities and libraries to read, create and modify ELF binary files, find and handle DWARF debug data, symbols, thread state and stacktraces for processes and core files on GNU/Linux."
 SECTION = "base"
 LICENSE = "( GPL-2.0-or-later | LGPL-3.0-or-later ) & GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://debuginfod/debuginfod-client.c;endline=28;md5=f0a7c3170776866ee94e8f9225a6ad79 \
+                    file://debuginfod/debuginfod-client.c;endline=28;md5=6b7b0a4b25197d7f2e12b2f4aa1c86b8 \
                     "
 DEPENDS = "zlib virtual/libintl"
 DEPENDS:append:libc-musl = " argp-standalone fts musl-legacy-error musl-obstack"
@@ -20,13 +40,12 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://0001-skip-the-test-when-gcc-not-deployed.patch \
            file://ptest.patch \
            file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch \
-           file://0001-debuginfod-Remove-unused-variable.patch \
-           file://0001-srcfiles-fix-unused-variable-BUFFER_SIZE.patch \
+           file://0003-musl-utils.patch \
            "
 SRC_URI:append:libc-musl = " \
            file://0003-musl-utils.patch \
            "
-SRC_URI[sha256sum] = "df76db71366d1d708365fc7a6c60ca48398f14367eb2b8954efc8897147ad871"
+SRC_URI[sha256sum] = "616099beae24aba11f9b63d86ca6cc8d566d968b802391334c91df54eab416b4"
 
 inherit autotools gettext ptest pkgconfig
 
diff --git a/meta/recipes-devtools/elfutils/files/0001-debuginfod-Remove-unused-variable.patch b/meta/recipes-devtools/elfutils/files/0001-debuginfod-Remove-unused-variable.patch
deleted file mode 100644
index 81f49dbf21..0000000000
--- a/meta/recipes-devtools/elfutils/files/0001-debuginfod-Remove-unused-variable.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From c3502140e51886bffc6ae5cd256308e40e0cbb78 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 9 Mar 2024 15:52:32 -0800
-Subject: [PATCH] debuginfod: Remove unused variable
-
-Recent commit acd9525e9 has removed all references to max_fds
-therefore remove it, moreover clang18 is happier
-
-| ../../elfutils-0.191/debuginfod/debuginfod.cxx:1448:8: error: private field 'max_fds' is not used [-Werror,-Wunused-private-field]
-|  1448 |   long max_fds;
-|       |        ^
-| 1 error generated.
-
-Upstream-Status: Submitted [https://sourceware.org/pipermail/elfutils-devel/2024q1/006900.html]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- debuginfod/debuginfod.cxx | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/debuginfod/debuginfod.cxx b/debuginfod/debuginfod.cxx
-index 560880f2..72617848 100644
---- a/debuginfod/debuginfod.cxx
-+++ b/debuginfod/debuginfod.cxx
-@@ -1445,7 +1445,6 @@ private:
- 
-   map<key,fdcache_entry> entries; // optimized for lookup
-   time_t last_cleaning;
--  long max_fds;
-   long max_mbs;
- 
- public:
--- 
-2.44.0
-
diff --git a/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch b/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch
index 4f7539bef2..0eb532f3dd 100644
--- a/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch
@@ -1,4 +1,4 @@
-From 63070df4b0dc7af37a720915b5e6494204463c9a Mon Sep 17 00:00:00 2001
+From 7b0f78c86bf2e658649327fb3dd1b862f282c42e Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 15 Aug 2017 17:10:57 +0800
 Subject: [PATCH] dso link change
@@ -22,10 +22,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/Makefile.am b/src/Makefile.am
-index 1d592d4..853eda4 100644
+index 6bdf2df..3bcee3c 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
-@@ -50,7 +50,7 @@ libdebuginfod =
+@@ -56,7 +56,7 @@ libdebuginfod =
  endif
  else
  libasm = ../libasm/libasm.so
@@ -35,11 +35,11 @@ index 1d592d4..853eda4 100644
  if LIBDEBUGINFOD
  libdebuginfod = ../debuginfod/libdebuginfod.so
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 9141074..ee49d07 100644
+index 76f1682..865a604 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -694,7 +694,7 @@ libdw = ../libdw/libdw.a -lz $(zip_LIBS) $(libelf) $(libebl) -ldl -lpthread
- libelf = ../libelf/libelf.a -lz $(zstd_LIBS)
+@@ -733,7 +733,7 @@ libdw = ../libdw/libdw.a -lz $(zip_LIBS) $(libelf) $(libebl) -ldl -lpthread
+ libelf = ../libelf/libelf.a -lz $(zstd_LIBS) $(libeu)
  libasm = ../libasm/libasm.a
  else
 -libdw = ../libdw/libdw.so
diff --git a/meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch b/meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch
index a9f5e030fc..6031b721fc 100644
--- a/meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch
@@ -1,4 +1,4 @@
-From 46d9d889a07fc9f9f089f800e5c0e895889c44ae Mon Sep 17 00:00:00 2001
+From 7bcee92c2006b7adad463be28cf4c3af21489cd2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 4 Oct 2017 22:30:46 -0700
 Subject: [PATCH] libasm may link with libbz2 if found
@@ -16,10 +16,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/Makefile.am b/src/Makefile.am
-index 853eda4..da7f3b4 100644
+index 3bcee3c..18eed9a 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
-@@ -40,7 +40,7 @@ EXTRA_DIST += make-debug-archive.in
+@@ -46,7 +46,7 @@ EXTRA_DIST += make-debug-archive.in
  CLEANFILES += make-debug-archive
  
  if BUILD_STATIC
@@ -28,7 +28,7 @@ index 853eda4..da7f3b4 100644
  libdw = ../libdw/libdw.a -lz $(zip_LIBS) $(libelf) -ldl -lpthread
  libelf = ../libelf/libelf.a -lz $(zstd_LIBS)
  if LIBDEBUGINFOD
-@@ -49,7 +49,7 @@ else
+@@ -55,7 +55,7 @@ else
  libdebuginfod =
  endif
  else
diff --git a/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch b/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch
index 57e4b3890a..1ee50588dc 100644
--- a/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch
@@ -1,4 +1,4 @@
-From 19d9e9d838e74e4a0a22f08ae03167380f8aa490 Mon Sep 17 00:00:00 2001
+From c4a26ff38182b289a1076bbef263e808b5e3aa97 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Thu, 16 Aug 2018 09:58:26 +0800
 Subject: [PATCH] libelf/elf_end.c: check data_list.data.d.d_buf before free it
@@ -19,10 +19,10 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  1 file changed, 4 insertions(+), 2 deletions(-)
 
 diff --git a/libelf/elf_end.c b/libelf/elf_end.c
-index 80f4d13..b103959 100644
+index da8f3a2..8557658 100644
 --- a/libelf/elf_end.c
 +++ b/libelf/elf_end.c
-@@ -169,14 +169,16 @@ elf_end (Elf *elf)
+@@ -170,14 +170,16 @@ elf_end (Elf *elf)
  		   architecture doesn't require overly stringent
  		   alignment the raw data buffer is the same as the
  		   one used for presenting to the caller.  */
diff --git a/meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-gcc-not-deployed.patch b/meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-gcc-not-deployed.patch
index 096361e215..2fc526372d 100644
--- a/meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-gcc-not-deployed.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-gcc-not-deployed.patch
@@ -1,4 +1,4 @@
-From f9ab54454000fd210dbaa92cf516084d05060f9d Mon Sep 17 00:00:00 2001
+From d59d6fd13e4a7fe3fdca2a4ce1cd2def36356bb4 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <Mingli.Yu@windriver.com>
 Date: Tue, 21 May 2019 15:20:34 +0800
 Subject: [PATCH] skip the test when gcc not deployed
diff --git a/meta/recipes-devtools/elfutils/files/0001-srcfiles-fix-unused-variable-BUFFER_SIZE.patch b/meta/recipes-devtools/elfutils/files/0001-srcfiles-fix-unused-variable-BUFFER_SIZE.patch
deleted file mode 100644
index b3032327a2..0000000000
--- a/meta/recipes-devtools/elfutils/files/0001-srcfiles-fix-unused-variable-BUFFER_SIZE.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From db51a55a8e3811d19265bf12d2ff715c6cf558b4 Mon Sep 17 00:00:00 2001
-From: Jose Quaresma <jose.quaresma@foundries.io>
-Date: Tue, 19 Mar 2024 10:17:59 +0000
-Subject: [PATCH] srcfiles: fix unused variable BUFFER_SIZE
-
-The const variable BUFFER_SIZE is used only on the zip_files
-function witch is only available with LIBARCHIVE.
-
-| ../../elfutils-0.191/src/srcfiles.cxx:81:18: error: unused variable 'BUFFER_SIZE' [-Werror,-Wunused-const-variable]
-|    81 | constexpr size_t BUFFER_SIZE = 8192;
-|       |                  ^~~~~~~~~~~
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=elfutils.git;a=commitdiff;h=ef8a4b841aaf26326b8961a651dbe915d54d23e7]
-
-Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
----
- src/srcfiles.cxx | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/srcfiles.cxx b/src/srcfiles.cxx
-index 892737cc..09d50f8d 100644
---- a/src/srcfiles.cxx
-+++ b/src/srcfiles.cxx
-@@ -78,7 +78,9 @@ ARGP_PROGRAM_VERSION_HOOK_DEF = print_version;
- /* Bug report address.  */
- ARGP_PROGRAM_BUG_ADDRESS_DEF = PACKAGE_BUGREPORT;
- 
-+#ifdef HAVE_LIBARCHIVE
- constexpr size_t BUFFER_SIZE = 8192;
-+#endif
- 
- /* Definitions of arguments for argp functions.  */
- static const struct argp_option options[] =
--- 
-2.44.0
-
diff --git a/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch b/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch
index d410eb13d8..f3790a6d25 100644
--- a/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch
@@ -1,4 +1,4 @@
-From 2d4dfb814dda02193e49c9203147cf73e6d3f8b7 Mon Sep 17 00:00:00 2001
+From 34ae914b362c84ff0a96b8936beedb44a2e3f451 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 23 Jun 2020 07:49:35 +0000
 Subject: [PATCH] tests/Makefile.am: compile test_nlist with standard CFLAGS
@@ -13,10 +13,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 3bd8e58..370c6a8 100644
+index eed9bd4..5dd6e05 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -103,7 +103,7 @@ endif
+@@ -104,7 +104,7 @@ endif
  test-nlist$(EXEEXT): test-nlist.c
  	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) \
  	  $(AM_CPPFLAGS) $(CPPFLAGS) \
diff --git a/meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch b/meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch
index fa2282b8dd..bf177cce4a 100644
--- a/meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch
+++ b/meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch
@@ -1,4 +1,4 @@
-From d8f07a23d608b744dcc0592f9f32f258b186a77c Mon Sep 17 00:00:00 2001
+From bd78783254a7126d82eab26a2069b3a457b98e2e Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 15 Aug 2017 17:13:59 +0800
 Subject: [PATCH] Fix elf_cvt_gunhash if dest and src are same.
diff --git a/meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch b/meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch
index e8b986e4ba..a539396fd8 100644
--- a/meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch
+++ b/meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch
@@ -1,4 +1,4 @@
-From 614f062b22e6da108643f8644a3e92a1108f2b9b Mon Sep 17 00:00:00 2001
+From da61b483072b7b0bfac1f034ad03972f5104a410 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 15 Aug 2017 17:17:20 +0800
 Subject: [PATCH] fixheadercheck
diff --git a/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch b/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
index 230ea88f41..d32b90f6df 100644
--- a/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
+++ b/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
@@ -1,4 +1,4 @@
-From aab5985a29bd7ab6e0b06eaab190b42a04e10f70 Mon Sep 17 00:00:00 2001
+From 9cdbec36fc1561d840181be2dd3e4120a2b9c7c1 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 23 Aug 2019 10:19:48 +0800
 Subject: [PATCH] musl-utils
@@ -56,7 +56,7 @@ index f771b92..263de62 100644
  ARGP_PROGRAM_VERSION_HOOK_DEF = print_version;
  
 diff --git a/src/strip.c b/src/strip.c
-index 6436443..1608496 100644
+index 403e0f6..738e948 100644
 --- a/src/strip.c
 +++ b/src/strip.c
 @@ -45,6 +45,13 @@
diff --git a/meta/recipes-devtools/elfutils/files/ptest.patch b/meta/recipes-devtools/elfutils/files/ptest.patch
index 2152875d63..1de82ef32b 100644
--- a/meta/recipes-devtools/elfutils/files/ptest.patch
+++ b/meta/recipes-devtools/elfutils/files/ptest.patch
@@ -1,4 +1,4 @@
-From d49f6a135762ec1f1831d0e80b8df2a4269b0a66 Mon Sep 17 00:00:00 2001
+From 74dad3295f2b8dc06b7e6bb876bc4541e927ef47 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 1 May 2019 16:37:48 +0100
 Subject: [PATCH] Changes to allow ptest to run standalone on target:
@@ -21,7 +21,7 @@ Upstream-Status: Inappropriate [oe specific]
  3 files changed, 3 insertions(+), 7 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index bbe8673..488712b 100644
+index f191488..426a68f 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -49,7 +49,7 @@ AC_COPYRIGHT([Copyright (C) 1996-2024 The elfutils developers.])
@@ -34,20 +34,20 @@ index bbe8673..488712b 100644
  
  AM_SILENT_RULES([yes])
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index ee49d07..3bd8e58 100644
+index 865a604..eed9bd4 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -852,3 +852,5 @@ check: check-am coverage
+@@ -893,3 +893,5 @@ check: check-am coverage
  coverage:
  	-$(srcdir)/coverage.sh
  endif
 +oecheck:
 +	$(MAKE) $(AM_MAKEFLAGS) $(check_PROGRAMS)
 diff --git a/tests/test-subr.sh b/tests/test-subr.sh
-index 411e5f2..a638ff9 100644
+index ea80cbe..7632d20 100644
 --- a/tests/test-subr.sh
 +++ b/tests/test-subr.sh
-@@ -91,12 +91,6 @@ installed_testrun()
+@@ -92,12 +92,6 @@ installed_testrun()
    program="$1"
    shift
    case "$program" in
-- 
2.44.1


--===============5100914117630768748==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-elfutils-upgrade-0.191-0.192.patch"

RnJvbSA5NGExM2MzM2Q5OWJhNDM3MDhmMzY0ZjAwNmE1ZDhkNzFlNmYxNjU4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTYgTm92IDIwMjQgMDk6MzY6NDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
bGZ1dGlsczogdXBncmFkZSAwLjE5MSAtPiAwLjE5MgoKLS0tCiAuLi4ve2VsZnV0aWxzXzAuMTkx
LmJiID0+IGVsZnV0aWxzXzAuMTkyLmJifSAgfCAyNyArKysrKysrKysrKy0tLQogLi4uMDEtZGVi
dWdpbmZvZC1SZW1vdmUtdW51c2VkLXZhcmlhYmxlLnBhdGNoIHwgMzQgLS0tLS0tLS0tLS0tLS0t
LS0tCiAuLi4vZWxmdXRpbHMvZmlsZXMvMDAwMS1kc28tbGluay1jaGFuZ2UucGF0Y2ggfCAxMiAr
KystLS0tCiAuLi5saWJhc20tbWF5LWxpbmstd2l0aC1saWJiejItaWYtZm91bmQucGF0Y2ggfCAg
OCArKy0tLQogLi4uLWNoZWNrLWRhdGFfbGlzdC5kYXRhLmQuZF9idWYtYmVmb3JlLnBhdGNoIHwg
IDYgKystLQogLi4uLXNraXAtdGhlLXRlc3Qtd2hlbi1nY2Mtbm90LWRlcGxveWVkLnBhdGNoIHwg
IDIgKy0KIC4uLmlsZXMtZml4LXVudXNlZC12YXJpYWJsZS1CVUZGRVJfU0laRS5wYXRjaCB8IDM2
IC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4uLm0tY29tcGlsZS10ZXN0X25saXN0LXdpdGgtc3RhbmRh
cmQtQy5wYXRjaCB8ICA2ICsrLS0KIC4uLmN2dF9ndW5oYXNoLWlmLWRlc3QtYW5kLXNyYy1hcmUt
c2FtZS5wYXRjaCB8ICAyICstCiAuLi4vZWxmdXRpbHMvZmlsZXMvMDAwMy1maXhoZWFkZXJjaGVj
ay5wYXRjaCAgfCAgMiArLQogLi4uL2VsZnV0aWxzL2ZpbGVzLzAwMDMtbXVzbC11dGlscy5wYXRj
aCAgICAgIHwgIDQgKy0tCiAuLi4vZWxmdXRpbHMvZmlsZXMvcHRlc3QucGF0Y2ggICAgICAgICAg
ICAgICAgfCAxMiArKystLS0tCiAxMiBmaWxlcyBjaGFuZ2VkLCA1MCBpbnNlcnRpb25zKCspLCAx
MDEgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL3tl
bGZ1dGlsc18wLjE5MS5iYiA9PiBlbGZ1dGlsc18wLjE5Mi5iYn0gKDkwJSkKIGRlbGV0ZSBtb2Rl
IDEwMDY0NCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMvMDAwMS1kZWJ1Z2lu
Zm9kLVJlbW92ZS11bnVzZWQtdmFyaWFibGUucGF0Y2gKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMvMDAwMS1zcmNmaWxlcy1maXgtdW51c2Vk
LXZhcmlhYmxlLUJVRkZFUl9TSVpFLnBhdGNoCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2VsZnV0aWxzL2VsZnV0aWxzXzAuMTkxLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2VsZnV0aWxzL2VsZnV0aWxzXzAuMTkyLmJiCnNpbWlsYXJpdHkgaW5kZXggOTAlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9lbGZ1dGlsc18wLjE5MS5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2VsZnV0aWxzXzAuMTkyLmJiCmlu
ZGV4IDk1MzY0Y2VmOTcuLjYzMjIzNmM4ODEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9lbGZ1dGlscy9lbGZ1dGlsc18wLjE5MS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZWxmdXRpbHMvZWxmdXRpbHNfMC4xOTIuYmIKQEAgLTEsMTAgKzEsMzAgQEAKKyMgRklYTUU6
IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9v
bCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRo
ZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNF
TlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUg
Y29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdM
aWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5n
ZXM6CisjCisjIC0tLSBkZWJ1Z2luZm9kL2RlYnVnaW5mb2QtY2xpZW50LmMKKyMgKysrIGRlYnVn
aW5mb2QvZGVidWdpbmZvZC1jbGllbnQuYworIyBAQCAtMSw1ICsxLDUgQEAKKyMgIC8qIFJldHJp
ZXZlIEVMRiAvIERXQVJGIC8gc291cmNlIGZpbGVzIGZyb20gdGhlIGRlYnVnaW5mb2QuCisjIC0g
ICBDb3B5cmlnaHQgKEMpIDIwMTktMjAyMSBSZWQgSGF0LCBJbmMuCisjICsgICBDb3B5cmlnaHQg
KEMpIDIwMTktMjAyNCBSZWQgSGF0LCBJbmMuCisjICAgICBDb3B5cmlnaHQgKEMpIDIwMjEsIDIw
MjIgTWFyayBKLiBXaWVsYWFyZCA8bWFya0BrbG9tcC5vcmc+CisjICAgICBUaGlzIGZpbGUgaXMg
cGFydCBvZiBlbGZ1dGlscy4KKyMgIAorIyAKKyMKKwogU1VNTUFSWSA9ICJVdGlsaXRpZXMgYW5k
IGxpYnJhcmllcyBmb3IgaGFuZGxpbmcgY29tcGlsZWQgb2JqZWN0IGZpbGVzIgogSE9NRVBBR0Ug
PSAiaHR0cHM6Ly9zb3VyY2V3YXJlLm9yZy9lbGZ1dGlscyIKIERFU0NSSVBUSU9OID0gImVsZnV0
aWxzIGlzIGEgY29sbGVjdGlvbiBvZiB1dGlsaXRpZXMgYW5kIGxpYnJhcmllcyB0byByZWFkLCBj
cmVhdGUgYW5kIG1vZGlmeSBFTEYgYmluYXJ5IGZpbGVzLCBmaW5kIGFuZCBoYW5kbGUgRFdBUkYg
ZGVidWcgZGF0YSwgc3ltYm9scywgdGhyZWFkIHN0YXRlIGFuZCBzdGFja3RyYWNlcyBmb3IgcHJv
Y2Vzc2VzIGFuZCBjb3JlIGZpbGVzIG9uIEdOVS9MaW51eC4iCiBTRUNUSU9OID0gImJhc2UiCiBM
SUNFTlNFID0gIiggR1BMLTIuMC1vci1sYXRlciB8IExHUEwtMy4wLW9yLWxhdGVyICkgJiBHUEwt
My4wLW9yLWxhdGVyIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9ZDMy
MjM5YmNiNjczNDYzYWI4NzRlODBkNDdmYWU1MDQgXAotICAgICAgICAgICAgICAgICAgICBmaWxl
Oi8vZGVidWdpbmZvZC9kZWJ1Z2luZm9kLWNsaWVudC5jO2VuZGxpbmU9Mjg7bWQ1PWYwYTdjMzE3
MDc3Njg2NmVlOTRlOGY5MjI1YTZhZDc5IFwKKyAgICAgICAgICAgICAgICAgICAgZmlsZTovL2Rl
YnVnaW5mb2QvZGVidWdpbmZvZC1jbGllbnQuYztlbmRsaW5lPTI4O21kNT02YjdiMGE0YjI1MTk3
ZDdmMmUxMmIyZjRhYTFjODZiOCBcCiAgICAgICAgICAgICAgICAgICAgICIKIERFUEVORFMgPSAi
emxpYiB2aXJ0dWFsL2xpYmludGwiCiBERVBFTkRTOmFwcGVuZDpsaWJjLW11c2wgPSAiIGFyZ3At
c3RhbmRhbG9uZSBmdHMgbXVzbC1sZWdhY3ktZXJyb3IgbXVzbC1vYnN0YWNrIgpAQCAtMjAsMTMg
KzQwLDEyIEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9zb3VyY2V3YXJlLm9yZy9lbGZ1dGlscy9mdHAv
JHtQVn0vJHtCUH0udGFyLmJ6MiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLXNraXAtdGhlLXRl
c3Qtd2hlbi1nY2Mtbm90LWRlcGxveWVkLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovL3B0ZXN0
LnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtdGVzdHMtTWFrZWZpbGUuYW0tY29tcGls
ZS10ZXN0X25saXN0LXdpdGgtc3RhbmRhcmQtQy5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly8w
MDAxLWRlYnVnaW5mb2QtUmVtb3ZlLXVudXNlZC12YXJpYWJsZS5wYXRjaCBcCi0gICAgICAgICAg
IGZpbGU6Ly8wMDAxLXNyY2ZpbGVzLWZpeC11bnVzZWQtdmFyaWFibGUtQlVGRkVSX1NJWkUucGF0
Y2ggXAorICAgICAgICAgICBmaWxlOi8vMDAwMy1tdXNsLXV0aWxzLnBhdGNoIFwKICAgICAgICAg
ICAgIgogU1JDX1VSSTphcHBlbmQ6bGliYy1tdXNsID0gIiBcCiAgICAgICAgICAgIGZpbGU6Ly8w
MDAzLW11c2wtdXRpbHMucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiZGY3NmRiNzEzNjZkMWQ3MDgzNjVmYzdhNmM2MGNhNDgzOThmMTQzNjdlYjJiODk1NGVmYzg4
OTcxNDdhZDg3MSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI2MTYwOTliZWFlMjRhYmExMWY5YjYz
ZDg2Y2E2Y2M4ZDU2NmQ5NjhiODAyMzkxMzM0YzkxZGY1NGVhYjQxNmI0IgogCiBpbmhlcml0IGF1
dG90b29scyBnZXR0ZXh0IHB0ZXN0IHBrZ2NvbmZpZwogCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMvMDAwMS1kZWJ1Z2luZm9kLVJlbW92ZS11bnVzZWQt
dmFyaWFibGUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMvMDAw
MS1kZWJ1Z2luZm9kLVJlbW92ZS11bnVzZWQtdmFyaWFibGUucGF0Y2gKZGVsZXRlZCBmaWxlIG1v
ZGUgMTAwNjQ0CmluZGV4IDgxZjQ5ZGJmMjEuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2VsZnV0aWxzL2ZpbGVzLzAwMDEtZGVidWdpbmZvZC1SZW1vdmUtdW51c2VkLXZh
cmlhYmxlLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsMzQgKzAsMCBAQAotRnJvbSBjMzUwMjE0
MGU1MTg4NmJmZmM2YWU1Y2QyNTYzMDhlNDBlMGNiYjc4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQotRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KLURhdGU6IFNhdCwgOSBNYXIg
MjAyNCAxNTo1MjozMiAtMDgwMAotU3ViamVjdDogW1BBVENIXSBkZWJ1Z2luZm9kOiBSZW1vdmUg
dW51c2VkIHZhcmlhYmxlCi0KLVJlY2VudCBjb21taXQgYWNkOTUyNWU5IGhhcyByZW1vdmVkIGFs
bCByZWZlcmVuY2VzIHRvIG1heF9mZHMKLXRoZXJlZm9yZSByZW1vdmUgaXQsIG1vcmVvdmVyIGNs
YW5nMTggaXMgaGFwcGllcgotCi18IC4uLy4uL2VsZnV0aWxzLTAuMTkxL2RlYnVnaW5mb2QvZGVi
dWdpbmZvZC5jeHg6MTQ0ODo4OiBlcnJvcjogcHJpdmF0ZSBmaWVsZCAnbWF4X2ZkcycgaXMgbm90
IHVzZWQgWy1XZXJyb3IsLVd1bnVzZWQtcHJpdmF0ZS1maWVsZF0KLXwgIDE0NDggfCAgIGxvbmcg
bWF4X2ZkczsKLXwgICAgICAgfCAgICAgICAgXgotfCAxIGVycm9yIGdlbmVyYXRlZC4KLQotVXBz
dHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQgW2h0dHBzOi8vc291cmNld2FyZS5vcmcvcGlwZXJtYWls
L2VsZnV0aWxzLWRldmVsLzIwMjRxMS8wMDY5MDAuaHRtbF0KLVNpZ25lZC1vZmYtYnk6IEtoZW0g
UmFqIDxyYWoua2hlbUBnbWFpbC5jb20+Ci0tLS0KLSBkZWJ1Z2luZm9kL2RlYnVnaW5mb2QuY3h4
IHwgMSAtCi0gMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKLQotZGlmZiAtLWdpdCBhL2Rl
YnVnaW5mb2QvZGVidWdpbmZvZC5jeHggYi9kZWJ1Z2luZm9kL2RlYnVnaW5mb2QuY3h4Ci1pbmRl
eCA1NjA4ODBmMi4uNzI2MTc4NDggMTAwNjQ0Ci0tLS0gYS9kZWJ1Z2luZm9kL2RlYnVnaW5mb2Qu
Y3h4Ci0rKysgYi9kZWJ1Z2luZm9kL2RlYnVnaW5mb2QuY3h4Ci1AQCAtMTQ0NSw3ICsxNDQ1LDYg
QEAgcHJpdmF0ZToKLSAKLSAgIG1hcDxrZXksZmRjYWNoZV9lbnRyeT4gZW50cmllczsgLy8gb3B0
aW1pemVkIGZvciBsb29rdXAKLSAgIHRpbWVfdCBsYXN0X2NsZWFuaW5nOwotLSAgbG9uZyBtYXhf
ZmRzOwotICAgbG9uZyBtYXhfbWJzOwotIAotIHB1YmxpYzoKLS0tIAotMi40NC4wCi0KZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDAxLWRzby1saW5r
LWNoYW5nZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDAx
LWRzby1saW5rLWNoYW5nZS5wYXRjaAppbmRleCA0Zjc1MzliZWYyLi4wZWI1MzJmM2RkIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMvMDAwMS1kc28tbGlu
ay1jaGFuZ2UucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2ZpbGVz
LzAwMDEtZHNvLWxpbmstY2hhbmdlLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA2MzA3MGRm
NGIwZGM3YWYzN2E3MjA5MTViNWU2NDk0MjA0NDYzYzlhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSA3YjBmNzhjODZiZjJlNjU4NjQ5MzI3ZmIzZGQxYjg2MmYyODJjNDJlIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIu
Y29tPgogRGF0ZTogVHVlLCAxNSBBdWcgMjAxNyAxNzoxMDo1NyArMDgwMAogU3ViamVjdDogW1BB
VENIXSBkc28gbGluayBjaGFuZ2UKQEAgLTIyLDEwICsyMiwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBI
b25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5jb20+CiAgMiBmaWxlcyBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9zcmMvTWFrZWZp
bGUuYW0gYi9zcmMvTWFrZWZpbGUuYW0KLWluZGV4IDFkNTkyZDQuLjg1M2VkYTQgMTAwNjQ0Citp
bmRleCA2YmRmMmRmLi4zYmNlZTNjIDEwMDY0NAogLS0tIGEvc3JjL01ha2VmaWxlLmFtCiArKysg
Yi9zcmMvTWFrZWZpbGUuYW0KLUBAIC01MCw3ICs1MCw3IEBAIGxpYmRlYnVnaW5mb2QgPQorQEAg
LTU2LDcgKzU2LDcgQEAgbGliZGVidWdpbmZvZCA9CiAgZW5kaWYKICBlbHNlCiAgbGliYXNtID0g
Li4vbGliYXNtL2xpYmFzbS5zbwpAQCAtMzUsMTEgKzM1LDExIEBAIGluZGV4IDFkNTkyZDQuLjg1
M2VkYTQgMTAwNjQ0CiAgaWYgTElCREVCVUdJTkZPRAogIGxpYmRlYnVnaW5mb2QgPSAuLi9kZWJ1
Z2luZm9kL2xpYmRlYnVnaW5mb2Quc28KIGRpZmYgLS1naXQgYS90ZXN0cy9NYWtlZmlsZS5hbSBi
L3Rlc3RzL01ha2VmaWxlLmFtCi1pbmRleCA5MTQxMDc0Li5lZTQ5ZDA3IDEwMDY0NAoraW5kZXgg
NzZmMTY4Mi4uODY1YTYwNCAxMDA2NDQKIC0tLSBhL3Rlc3RzL01ha2VmaWxlLmFtCiArKysgYi90
ZXN0cy9NYWtlZmlsZS5hbQotQEAgLTY5NCw3ICs2OTQsNyBAQCBsaWJkdyA9IC4uL2xpYmR3L2xp
YmR3LmEgLWx6ICQoemlwX0xJQlMpICQobGliZWxmKSAkKGxpYmVibCkgLWxkbCAtbHB0aHJlYWQK
LSBsaWJlbGYgPSAuLi9saWJlbGYvbGliZWxmLmEgLWx6ICQoenN0ZF9MSUJTKQorQEAgLTczMyw3
ICs3MzMsNyBAQCBsaWJkdyA9IC4uL2xpYmR3L2xpYmR3LmEgLWx6ICQoemlwX0xJQlMpICQobGli
ZWxmKSAkKGxpYmVibCkgLWxkbCAtbHB0aHJlYWQKKyBsaWJlbGYgPSAuLi9saWJlbGYvbGliZWxm
LmEgLWx6ICQoenN0ZF9MSUJTKSAkKGxpYmV1KQogIGxpYmFzbSA9IC4uL2xpYmFzbS9saWJhc20u
YQogIGVsc2UKIC1saWJkdyA9IC4uL2xpYmR3L2xpYmR3LnNvCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMvMDAwMS1saWJhc20tbWF5LWxpbmstd2l0aC1s
aWJiejItaWYtZm91bmQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmls
ZXMvMDAwMS1saWJhc20tbWF5LWxpbmstd2l0aC1saWJiejItaWYtZm91bmQucGF0Y2gKaW5kZXgg
YTlmNWUwMzBmYy4uNjAzMWI3MjFmYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2VsZnV0aWxzL2ZpbGVzLzAwMDEtbGliYXNtLW1heS1saW5rLXdpdGgtbGliYnoyLWlmLWZvdW5k
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDAxLWxp
YmFzbS1tYXktbGluay13aXRoLWxpYmJ6Mi1pZi1mb3VuZC5wYXRjaApAQCAtMSw0ICsxLDQgQEAK
LUZyb20gNDZkOWQ4ODlhMDdmYzlmOWYwODlmODAwZTVjMGU4OTU4ODljNDRhZSBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKK0Zyb20gN2JjZWU5MmMyMDA2YjdhZGFkNDYzYmUyOGNmNGMzYWYyMTQ4
OWNkMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBn
bWFpbC5jb20+CiBEYXRlOiBXZWQsIDQgT2N0IDIwMTcgMjI6MzA6NDYgLTA3MDAKIFN1YmplY3Q6
IFtQQVRDSF0gbGliYXNtIG1heSBsaW5rIHdpdGggbGliYnoyIGlmIGZvdW5kCkBAIC0xNiwxMCAr
MTYsMTAgQEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KICAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogCiBkaWZmIC0t
Z2l0IGEvc3JjL01ha2VmaWxlLmFtIGIvc3JjL01ha2VmaWxlLmFtCi1pbmRleCA4NTNlZGE0Li5k
YTdmM2I0IDEwMDY0NAoraW5kZXggM2JjZWUzYy4uMThlZWQ5YSAxMDA2NDQKIC0tLSBhL3NyYy9N
YWtlZmlsZS5hbQogKysrIGIvc3JjL01ha2VmaWxlLmFtCi1AQCAtNDAsNyArNDAsNyBAQCBFWFRS
QV9ESVNUICs9IG1ha2UtZGVidWctYXJjaGl2ZS5pbgorQEAgLTQ2LDcgKzQ2LDcgQEAgRVhUUkFf
RElTVCArPSBtYWtlLWRlYnVnLWFyY2hpdmUuaW4KICBDTEVBTkZJTEVTICs9IG1ha2UtZGVidWct
YXJjaGl2ZQogIAogIGlmIEJVSUxEX1NUQVRJQwpAQCAtMjgsNyArMjgsNyBAQCBpbmRleCA4NTNl
ZGE0Li5kYTdmM2I0IDEwMDY0NAogIGxpYmR3ID0gLi4vbGliZHcvbGliZHcuYSAtbHogJCh6aXBf
TElCUykgJChsaWJlbGYpIC1sZGwgLWxwdGhyZWFkCiAgbGliZWxmID0gLi4vbGliZWxmL2xpYmVs
Zi5hIC1seiAkKHpzdGRfTElCUykKICBpZiBMSUJERUJVR0lORk9ECi1AQCAtNDksNyArNDksNyBA
QCBlbHNlCitAQCAtNTUsNyArNTUsNyBAQCBlbHNlCiAgbGliZGVidWdpbmZvZCA9CiAgZW5kaWYK
ICBlbHNlCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMv
MDAwMS1saWJlbGYtZWxmX2VuZC5jLWNoZWNrLWRhdGFfbGlzdC5kYXRhLmQuZF9idWYtYmVmb3Jl
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2ZpbGVzLzAwMDEtbGliZWxm
LWVsZl9lbmQuYy1jaGVjay1kYXRhX2xpc3QuZGF0YS5kLmRfYnVmLWJlZm9yZS5wYXRjaAppbmRl
eCA1N2U0YjM4OTBhLi4xZWU1MDU4OGRjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZWxmdXRpbHMvZmlsZXMvMDAwMS1saWJlbGYtZWxmX2VuZC5jLWNoZWNrLWRhdGFfbGlzdC5k
YXRhLmQuZF9idWYtYmVmb3JlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1
dGlscy9maWxlcy8wMDAxLWxpYmVsZi1lbGZfZW5kLmMtY2hlY2stZGF0YV9saXN0LmRhdGEuZC5k
X2J1Zi1iZWZvcmUucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDE5ZDllOWQ4MzhlNzRlNGEw
YTIyZjA4YWUwMzE2NzM4MGY4YWE0OTAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGM0
YTI2ZmYzODE4MmIyODlhMTA3NmJiZWYyNjNlODA4YjVlM2FhOTcgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCiBGcm9tOiBSb2JlcnQgWWFuZyA8bGllemhpLnlhbmdAd2luZHJpdmVyLmNvbT4KIERh
dGU6IFRodSwgMTYgQXVnIDIwMTggMDk6NTg6MjYgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gbGli
ZWxmL2VsZl9lbmQuYzogY2hlY2sgZGF0YV9saXN0LmRhdGEuZC5kX2J1ZiBiZWZvcmUgZnJlZSBp
dApAQCAtMTksMTAgKzE5LDEwIEBAIFNpZ25lZC1vZmYtYnk6IFJvYmVydCBZYW5nIDxsaWV6aGku
eWFuZ0B3aW5kcml2ZXIuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9saWJlbGYvZWxmX2VuZC5jIGIvbGliZWxmL2Vs
Zl9lbmQuYwotaW5kZXggODBmNGQxMy4uYjEwMzk1OSAxMDA2NDQKK2luZGV4IGRhOGYzYTIuLjg1
NTc2NTggMTAwNjQ0CiAtLS0gYS9saWJlbGYvZWxmX2VuZC5jCiArKysgYi9saWJlbGYvZWxmX2Vu
ZC5jCi1AQCAtMTY5LDE0ICsxNjksMTYgQEAgZWxmX2VuZCAoRWxmICplbGYpCitAQCAtMTcwLDE0
ICsxNzAsMTYgQEAgZWxmX2VuZCAoRWxmICplbGYpCiAgCQkgICBhcmNoaXRlY3R1cmUgZG9lc24n
dCByZXF1aXJlIG92ZXJseSBzdHJpbmdlbnQKICAJCSAgIGFsaWdubWVudCB0aGUgcmF3IGRhdGEg
YnVmZmVyIGlzIHRoZSBzYW1lIGFzIHRoZQogIAkJICAgb25lIHVzZWQgZm9yIHByZXNlbnRpbmcg
dG8gdGhlIGNhbGxlci4gICovCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxm
dXRpbHMvZmlsZXMvMDAwMS1za2lwLXRoZS10ZXN0LXdoZW4tZ2NjLW5vdC1kZXBsb3llZC5wYXRj
aCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDAxLXNraXAtdGhlLXRl
c3Qtd2hlbi1nY2Mtbm90LWRlcGxveWVkLnBhdGNoCmluZGV4IDA5NjM2MWUyMTUuLjJmYzUyNjM3
MmQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDAx
LXNraXAtdGhlLXRlc3Qtd2hlbi1nY2Mtbm90LWRlcGxveWVkLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDAxLXNraXAtdGhlLXRlc3Qtd2hlbi1nY2Mt
bm90LWRlcGxveWVkLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBmOWFiNTQ0NTQwMDBmZDIx
MGRiYWE5MmNmNTE2MDg0ZDA1MDYwZjlkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBk
NTlkNmZkMTNlNGE3ZmUzZmRjYTJhNGNlMWNkMmRlZjM2MzU2YmI0IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogTWluZ2xpIFl1IDxNaW5nbGkuWXVAd2luZHJpdmVyLmNvbT4KIERhdGU6
IFR1ZSwgMjEgTWF5IDIwMTkgMTU6MjA6MzQgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gc2tpcCB0
aGUgdGVzdCB3aGVuIGdjYyBub3QgZGVwbG95ZWQKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDAxLXNyY2ZpbGVzLWZpeC11bnVzZWQtdmFyaWFibGUt
QlVGRkVSX1NJWkUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMv
MDAwMS1zcmNmaWxlcy1maXgtdW51c2VkLXZhcmlhYmxlLUJVRkZFUl9TSVpFLnBhdGNoCmRlbGV0
ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBiMzAzMjMyN2EyLi4wMDAwMDAwMDAwCi0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDAxLXNyY2ZpbGVzLWZpeC11bnVz
ZWQtdmFyaWFibGUtQlVGRkVSX1NJWkUucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwzNiArMCww
IEBACi1Gcm9tIGRiNTFhNTVhOGUzODExZDE5MjY1YmYxMmQyZmY3MTVjNmNmNTU4YjQgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBKb3NlIFF1YXJlc21hIDxqb3NlLnF1YXJlc21hQGZv
dW5kcmllcy5pbz4KLURhdGU6IFR1ZSwgMTkgTWFyIDIwMjQgMTA6MTc6NTkgKzAwMDAKLVN1Ympl
Y3Q6IFtQQVRDSF0gc3JjZmlsZXM6IGZpeCB1bnVzZWQgdmFyaWFibGUgQlVGRkVSX1NJWkUKLQot
VGhlIGNvbnN0IHZhcmlhYmxlIEJVRkZFUl9TSVpFIGlzIHVzZWQgb25seSBvbiB0aGUgemlwX2Zp
bGVzCi1mdW5jdGlvbiB3aXRjaCBpcyBvbmx5IGF2YWlsYWJsZSB3aXRoIExJQkFSQ0hJVkUuCi0K
LXwgLi4vLi4vZWxmdXRpbHMtMC4xOTEvc3JjL3NyY2ZpbGVzLmN4eDo4MToxODogZXJyb3I6IHVu
dXNlZCB2YXJpYWJsZSAnQlVGRkVSX1NJWkUnIFstV2Vycm9yLC1XdW51c2VkLWNvbnN0LXZhcmlh
YmxlXQotfCAgICA4MSB8IGNvbnN0ZXhwciBzaXplX3QgQlVGRkVSX1NJWkUgPSA4MTkyOwotfCAg
ICAgICB8ICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn4KLQotVXBzdHJlYW0tU3RhdHVzOiBC
YWNrcG9ydCBbaHR0cHM6Ly9zb3VyY2V3YXJlLm9yZy9naXQvP3A9ZWxmdXRpbHMuZ2l0O2E9Y29t
bWl0ZGlmZjtoPWVmOGE0Yjg0MWFhZjI2MzI2Yjg5NjFhNjUxZGJlOTE1ZDU0ZDIzZTddCi0KLVNp
Z25lZC1vZmYtYnk6IEpvc2UgUXVhcmVzbWEgPGpvc2UucXVhcmVzbWFAZm91bmRyaWVzLmlvPgot
LS0tCi0gc3JjL3NyY2ZpbGVzLmN4eCB8IDIgKysKLSAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspCi0KLWRpZmYgLS1naXQgYS9zcmMvc3JjZmlsZXMuY3h4IGIvc3JjL3NyY2ZpbGVzLmN4
eAotaW5kZXggODkyNzM3Y2MuLjA5ZDUwZjhkIDEwMDY0NAotLS0tIGEvc3JjL3NyY2ZpbGVzLmN4
eAotKysrIGIvc3JjL3NyY2ZpbGVzLmN4eAotQEAgLTc4LDcgKzc4LDkgQEAgQVJHUF9QUk9HUkFN
X1ZFUlNJT05fSE9PS19ERUYgPSBwcmludF92ZXJzaW9uOwotIC8qIEJ1ZyByZXBvcnQgYWRkcmVz
cy4gICovCi0gQVJHUF9QUk9HUkFNX0JVR19BRERSRVNTX0RFRiA9IFBBQ0tBR0VfQlVHUkVQT1JU
OwotIAotKyNpZmRlZiBIQVZFX0xJQkFSQ0hJVkUKLSBjb25zdGV4cHIgc2l6ZV90IEJVRkZFUl9T
SVpFID0gODE5MjsKLSsjZW5kaWYKLSAKLSAvKiBEZWZpbml0aW9ucyBvZiBhcmd1bWVudHMgZm9y
IGFyZ3AgZnVuY3Rpb25zLiAgKi8KLSBzdGF0aWMgY29uc3Qgc3RydWN0IGFyZ3Bfb3B0aW9uIG9w
dGlvbnNbXSA9Ci0tLSAKLTIuNDQuMAotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZWxmdXRpbHMvZmlsZXMvMDAwMS10ZXN0cy1NYWtlZmlsZS5hbS1jb21waWxlLXRlc3Rfbmxp
c3Qtd2l0aC1zdGFuZGFyZC1DLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxz
L2ZpbGVzLzAwMDEtdGVzdHMtTWFrZWZpbGUuYW0tY29tcGlsZS10ZXN0X25saXN0LXdpdGgtc3Rh
bmRhcmQtQy5wYXRjaAppbmRleCBkNDEwZWIxM2Q4Li5mMzc5MGE2ZDI1IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMvMDAwMS10ZXN0cy1NYWtlZmlsZS5h
bS1jb21waWxlLXRlc3Rfbmxpc3Qtd2l0aC1zdGFuZGFyZC1DLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDAxLXRlc3RzLU1ha2VmaWxlLmFtLWNvbXBp
bGUtdGVzdF9ubGlzdC13aXRoLXN0YW5kYXJkLUMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9t
IDJkNGRmYjgxNGRkYTAyMTkzZTQ5YzkyMDMxNDdjZjczZTZkM2Y4YjcgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIDM0YWU5MTRiMzYyYzg0ZmYwYTk2Yjg5MzZiZWVkYjQ0YTJlM2Y0NTEg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5r
YW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IFR1ZSwgMjMgSnVuIDIwMjAgMDc6NDk6MzUgKzAwMDAK
IFN1YmplY3Q6IFtQQVRDSF0gdGVzdHMvTWFrZWZpbGUuYW06IGNvbXBpbGUgdGVzdF9ubGlzdCB3
aXRoIHN0YW5kYXJkIENGTEFHUwpAQCAtMTMsMTAgKzEzLDEwIEBAIFNpZ25lZC1vZmYtYnk6IEFs
ZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvdGVzdHMvTWFr
ZWZpbGUuYW0gYi90ZXN0cy9NYWtlZmlsZS5hbQotaW5kZXggM2JkOGU1OC4uMzcwYzZhOCAxMDA2
NDQKK2luZGV4IGVlZDliZDQuLjVkZDZlMDUgMTAwNjQ0CiAtLS0gYS90ZXN0cy9NYWtlZmlsZS5h
bQogKysrIGIvdGVzdHMvTWFrZWZpbGUuYW0KLUBAIC0xMDMsNyArMTAzLDcgQEAgZW5kaWYKK0BA
IC0xMDQsNyArMTA0LDcgQEAgZW5kaWYKICB0ZXN0LW5saXN0JChFWEVFWFQpOiB0ZXN0LW5saXN0
LmMKICAJJChBTV9WX0NDKSQoQ0MpICQoREVGUykgJChERUZBVUxUX0lOQ0xVREVTKSAkKElOQ0xV
REVTKSBcCiAgCSAgJChBTV9DUFBGTEFHUykgJChDUFBGTEFHUykgXApkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2ZpbGVzLzAwMDItRml4LWVsZl9jdnRfZ3VuaGFz
aC1pZi1kZXN0LWFuZC1zcmMtYXJlLXNhbWUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
ZWxmdXRpbHMvZmlsZXMvMDAwMi1GaXgtZWxmX2N2dF9ndW5oYXNoLWlmLWRlc3QtYW5kLXNyYy1h
cmUtc2FtZS5wYXRjaAppbmRleCBmYTIyODJiOGRkLi5iZjE3N2NjZTRhIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMvMDAwMi1GaXgtZWxmX2N2dF9ndW5o
YXNoLWlmLWRlc3QtYW5kLXNyYy1hcmUtc2FtZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZWxmdXRpbHMvZmlsZXMvMDAwMi1GaXgtZWxmX2N2dF9ndW5oYXNoLWlmLWRlc3QtYW5k
LXNyYy1hcmUtc2FtZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZDhmMDdhMjNkNjA4Yjc0
NGRjYzA1OTJmOWYzMmYyNThiMTg2YTc3YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
YmQ3ODc4MzI1NGE3MTI2ZDgyZWFiMjZhMjA2OWIzYTQ1N2I5OGUyZSBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IEhvbmd4dSBKaWEgPGhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbT4KIERh
dGU6IFR1ZSwgMTUgQXVnIDIwMTcgMTc6MTM6NTkgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gRml4
IGVsZl9jdnRfZ3VuaGFzaCBpZiBkZXN0IGFuZCBzcmMgYXJlIHNhbWUuCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMvMDAwMy1maXhoZWFkZXJjaGVjay5w
YXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDAzLWZpeGhlYWRl
cmNoZWNrLnBhdGNoCmluZGV4IGU4Yjk4NmU0YmEuLmE1MzkzOTZmZDggMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDAzLWZpeGhlYWRlcmNoZWNrLnBh
dGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDAzLWZpeGhl
YWRlcmNoZWNrLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA2MTRmMDYyYjIyZTZkYTEwODY0
M2Y4NjQ0YTNlOTJhMTEwOGYyYjliIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBkYTYx
YjQ4MzA3MmI3YjBiZmFjMWYwMzRhZDAzOTcyZjUxMDRhNDEwIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogSG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29tPgogRGF0ZTog
VHVlLCAxNSBBdWcgMjAxNyAxNzoxNzoyMCArMDgwMAogU3ViamVjdDogW1BBVENIXSBmaXhoZWFk
ZXJjaGVjawpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2ZpbGVz
LzAwMDMtbXVzbC11dGlscy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9m
aWxlcy8wMDAzLW11c2wtdXRpbHMucGF0Y2gKaW5kZXggMjMwZWE4OGY0MS4uZDMyYjkwZjZkZiAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2ZpbGVzLzAwMDMtbXVz
bC11dGlscy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMv
MDAwMy1tdXNsLXV0aWxzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBhYWI1OTg1YTI5YmQ3
YWI2ZTBiMDZlYWFiMTkwYjQyYTA0ZTEwZjcwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSA5Y2RiZWMzNmZjMTU2MWQ4NDAxODFiZTJkZDNlNDEyMGEyYjljN2MxIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogSG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29tPgog
RGF0ZTogRnJpLCAyMyBBdWcgMjAxOSAxMDoxOTo0OCArMDgwMAogU3ViamVjdDogW1BBVENIXSBt
dXNsLXV0aWxzCkBAIC01Niw3ICs1Niw3IEBAIGluZGV4IGY3NzFiOTIuLjI2M2RlNjIgMTAwNjQ0
CiAgQVJHUF9QUk9HUkFNX1ZFUlNJT05fSE9PS19ERUYgPSBwcmludF92ZXJzaW9uOwogIAogZGlm
ZiAtLWdpdCBhL3NyYy9zdHJpcC5jIGIvc3JjL3N0cmlwLmMKLWluZGV4IDY0MzY0NDMuLjE2MDg0
OTYgMTAwNjQ0CitpbmRleCA0MDNlMGY2Li43MzhlOTQ4IDEwMDY0NAogLS0tIGEvc3JjL3N0cmlw
LmMKICsrKyBiL3NyYy9zdHJpcC5jCiBAQCAtNDUsNiArNDUsMTMgQEAKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy9wdGVzdC5wYXRjaCBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy9wdGVzdC5wYXRjaAppbmRleCAyMTUyODc1ZDYz
Li4xZGU4MmVmMzJiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMv
ZmlsZXMvcHRlc3QucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2Zp
bGVzL3B0ZXN0LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBkNDlmNmExMzU3NjJlYzFmMTgz
MWQwZTgwYjhkZjJhNDI2OWIwYTY2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA3NGRh
ZDMyOTVmMmI4ZGMwNmI3ZTZiYjg3NmJjNDU0MWU5MjdlZjQ3IE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlv
bi5vcmc+CiBEYXRlOiBXZWQsIDEgTWF5IDIwMTkgMTY6Mzc6NDggKzAxMDAKIFN1YmplY3Q6IFtQ
QVRDSF0gQ2hhbmdlcyB0byBhbGxvdyBwdGVzdCB0byBydW4gc3RhbmRhbG9uZSBvbiB0YXJnZXQ6
CkBAIC0yMSw3ICsyMSw3IEBAIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbb2Ugc3Bl
Y2lmaWNdCiAgMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0p
CiAKIGRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4IGJiZTg2
NzMuLjQ4ODcxMmIgMTAwNjQ0CitpbmRleCBmMTkxNDg4Li40MjZhNjhmIDEwMDY0NAogLS0tIGEv
Y29uZmlndXJlLmFjCiArKysgYi9jb25maWd1cmUuYWMKIEBAIC00OSw3ICs0OSw3IEBAIEFDX0NP
UFlSSUdIVChbQ29weXJpZ2h0IChDKSAxOTk2LTIwMjQgVGhlIGVsZnV0aWxzIGRldmVsb3BlcnMu
XSkKQEAgLTM0LDIwICszNCwyMCBAQCBpbmRleCBiYmU4NjczLi40ODg3MTJiIDEwMDY0NAogIAog
IEFNX1NJTEVOVF9SVUxFUyhbeWVzXSkKIGRpZmYgLS1naXQgYS90ZXN0cy9NYWtlZmlsZS5hbSBi
L3Rlc3RzL01ha2VmaWxlLmFtCi1pbmRleCBlZTQ5ZDA3Li4zYmQ4ZTU4IDEwMDY0NAoraW5kZXgg
ODY1YTYwNC4uZWVkOWJkNCAxMDA2NDQKIC0tLSBhL3Rlc3RzL01ha2VmaWxlLmFtCiArKysgYi90
ZXN0cy9NYWtlZmlsZS5hbQotQEAgLTg1MiwzICs4NTIsNSBAQCBjaGVjazogY2hlY2stYW0gY292
ZXJhZ2UKK0BAIC04OTMsMyArODkzLDUgQEAgY2hlY2s6IGNoZWNrLWFtIGNvdmVyYWdlCiAgY292
ZXJhZ2U6CiAgCS0kKHNyY2RpcikvY292ZXJhZ2Uuc2gKICBlbmRpZgogK29lY2hlY2s6CiArCSQo
TUFLRSkgJChBTV9NQUtFRkxBR1MpICQoY2hlY2tfUFJPR1JBTVMpCiBkaWZmIC0tZ2l0IGEvdGVz
dHMvdGVzdC1zdWJyLnNoIGIvdGVzdHMvdGVzdC1zdWJyLnNoCi1pbmRleCA0MTFlNWYyLi5hNjM4
ZmY5IDEwMDY0NAoraW5kZXggZWE4MGNiZS4uNzYzMmQyMCAxMDA2NDQKIC0tLSBhL3Rlc3RzL3Rl
c3Qtc3Vici5zaAogKysrIGIvdGVzdHMvdGVzdC1zdWJyLnNoCi1AQCAtOTEsMTIgKzkxLDYgQEAg
aW5zdGFsbGVkX3Rlc3RydW4oKQorQEAgLTkyLDEyICs5Miw2IEBAIGluc3RhbGxlZF90ZXN0cnVu
KCkKICAgIHByb2dyYW09IiQxIgogICAgc2hpZnQKICAgIGNhc2UgIiRwcm9ncmFtIiBpbgotLSAK
Mi40NC4xCgo=

--===============5100914117630768748==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1882 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (920 cached, 1 parsed). 1880 targets, 41 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:624b6b0982567ea5ee3f1203460ca538406a66de"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 421 Local 185 Mirrors 0 Missed 236 Current 299 (43% match, 67% complete)
Removing 68 stale sstate objects for arch core2-64...done.
Removing 64 stale sstate objects for arch qemux86_64...done.
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 323 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 341 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.43.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 349 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 361 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 366 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 369 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 370 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 382 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/cross-localedef-native_2.40.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 383 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.40.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 388 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 389 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 394 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 397 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 400 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 405 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 406 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cross-localedef-native-2.40+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-locale-2.40+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-2.43.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gawk-5.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.13.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-locale-2.40+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libedit-20240808-3.1-r1: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 410 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-2.43.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 421 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 424 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 427 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 430 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe perl-5.40.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 431 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.2.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 434 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 437 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gawk-5.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 438 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 442 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.13.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cross-localedef-native-2.40+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 445 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 447 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/cross-localedef-native_2.40.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 448 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 449 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe coreutils-9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 450 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe iptables-1.8.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 451 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe perl-5.40.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cross-localedef-native-2.40+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gawk-5.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe iptables-1.8.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 454 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 457 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 476 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 479 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 482 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe perl-5.40.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 483 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_recipe_qa_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 486 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 489 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 494 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cross-localedef-native-2.40+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 495 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gawk-5.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 500 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-5.2.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 501 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 504 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 509 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 510 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 513 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.50.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.6.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.10.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 514 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gnutls-3.8.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe lzlib-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 518 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 522 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe file-5.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 526 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 536 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 537 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 557 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 558 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe curl-8.10.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 560 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 561 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.50-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 567 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb:do_create_spdx_setscene)
NOTE: recipe gnutls-3.8.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 568 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.2.bb:do_create_spdx_setscene)
NOTE: recipe libcap-2.70-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 569 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 573 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 578 of 720 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.4.bb:do_create_spdx_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.50-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 588 of 720 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_create_spdx_setscene)
NOTE: recipe nettle-3.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcc-initial-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 589 of 720 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 600 of 720 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl-cross/perlcross_1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 607 of 720 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_create_spdx_setscene)
NOTE: recipe libunistring-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe nettle-3.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-native-2.13.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 643 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 644 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcc-initial-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 645 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.46.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 646 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 653 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe perlcross-native-1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 660 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 665 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 666 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 667 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 674 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 679 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_stash_locale_setscene)
NOTE: recipe file-native-5.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe cracklib-native-2.10.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-native-2.13.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 680 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.36-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 681 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.10.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-native-5.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cracklib-native-2.10.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 684 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 685 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 686 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 687 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 688 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.40+git-r0: task do_stash_locale_setscene: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 691 of 720 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 692 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.10.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 698 of 720 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 701 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perlcross-native-1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 703 of 720 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl-cross/perlcross_1.6.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 291 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_fetch)
NOTE: Running noexec task 305 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_fetch)
NOTE: recipe libmpc-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-native-2.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running noexec task 366 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_fetch)
NOTE: recipe mpfr-4.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 381 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_fetch)
NOTE: Running task 383 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_fetch)
NOTE: Running task 422 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: recipe base-passwd-3.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe perlcross-native-1.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 505 of 1928 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_recipe_qa)
NOTE: recipe linux-libc-headers-6.10-r0: task do_fetch: Started
NOTE: Running task 534 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.10-r0: task do_fetch: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 704 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_recipe_qa_setscene)
NOTE: Running task 574 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_unpack)
NOTE: Running task 575 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-cross-2.5.2-r0: task do_fetch: Started
NOTE: Running task 576 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_fetch)
NOTE: Running task 578 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: Running task 580 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_fetch)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe perlcross-native-1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Started
NOTE: Running setscene task 705 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 706 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.2-r0: task do_fetch: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 707 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-native-2.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 601 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_unpack)
NOTE: Running setscene task 709 of 720 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_recipe_qa_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Started
NOTE: recipe elfutils-native-0.192-r0: task do_recipe_qa: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_fetch: Started
NOTE: recipe glibc-2.40+git-r0: task do_stash_locale_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_fetch: Started
NOTE: Running setscene task 710 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 711 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.5.2-r0: task do_unpack: Started
NOTE: recipe attr-2.5.2-r0: task do_fetch: Succeeded
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 602 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_unpack)
NOTE: recipe mpfr-4.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 626 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_unpack)
NOTE: Running task 628 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_fetch)
NOTE: recipe cracklib-native-2.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Succeeded
NOTE: recipe libgcc-initial-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 632 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 633 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: recipe glibc-2.40+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Started
NOTE: Running task 707 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-native-2.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 712 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 710 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_fetch)
NOTE: recipe cracklib-2.10.2-r0: task do_fetch: Started
NOTE: Running task 711 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.50.bb:do_fetch)
NOTE: recipe elfutils-native-0.192-r0: task do_recipe_qa: Succeeded
NOTE: recipe shadow-4.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 712 of 1928 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_fetch)
NOTE: Running setscene task 713 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.5.2-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Started
NOTE: Running task 715 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_unpack)
NOTE: recipe glibc-2.40+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 716 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_fetch)
NOTE: recipe libpam-1.6.1-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 717 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_patch)
NOTE: recipe nettle-3.10-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.50-r0: task do_fetch: Started
NOTE: recipe libpam-1.6.1-r0: task do_fetch: Succeeded
NOTE: Running task 720 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_unpack)
NOTE: recipe libgcc-initial-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 714 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_gcc_stash_builddir_setscene)
NOTE: recipe elfutils-native-0.192-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_fetch: Started
NOTE: recipe attr-2.5.2-r0: task do_unpack: Started
NOTE: recipe shadow-4.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_patch: Started
NOTE: recipe elfutils-native-0.192-r0: task do_fetch: Succeeded
NOTE: recipe glibc-2.40+git-r0: task do_fetch: Started
NOTE: Running setscene task 716 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 717 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 721 of 1928 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_unpack)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe glibc-2.40+git-r0: task do_fetch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Started
NOTE: Running task 722 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_unpack)
NOTE: recipe shadow-4.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 718 of 720 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.50-r0: task do_fetch: Succeeded
NOTE: Running task 723 of 1928 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-initial-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-native-0.192-r0: task do_unpack: Started
NOTE: recipe glibc-2.40+git-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.1-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-initial-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 724 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_patch)
NOTE: Running task 732 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_unpack)
NOTE: Running task 733 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.50.bb:do_unpack)
NOTE: recipe elfutils-native-0.192-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nettle-3.10-r0: task do_fetch: Succeeded
NOTE: Running task 734 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_unpack)
NOTE: recipe shadow-4.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 763 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_fetch)
NOTE: recipe attr-2.5.2-r0: task do_patch: Started
NOTE: recipe libpam-1.6.1-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.50-r0: task do_unpack: Started
NOTE: recipe libunistring-1.3-r0: task do_fetch: Started
NOTE: recipe libunistring-1.3-r0: task do_fetch: Succeeded
NOTE: recipe nettle-3.10-r0: task do_unpack: Started
NOTE: Running task 765 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_fetch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 766 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: recipe libidn2-2.3.7-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.7-r0: task do_fetch: Succeeded
NOTE: Running task 779 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_unpack)
NOTE: recipe attr-2.5.2-r0: task do_patch: Succeeded
NOTE: Running task 783 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: recipe nettle-3.10-r0: task do_unpack: Succeeded
NOTE: Running task 784 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_patch)
NOTE: recipe openssl-3.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 785 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_patch)
NOTE: recipe libgpg-error-1.50-r0: task do_unpack: Succeeded
NOTE: Running task 786 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.50.bb:do_patch)
NOTE: recipe libunistring-1.3-r0: task do_unpack: Started
NOTE: recipe libpam-1.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 787 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe nettle-3.10-r0: task do_patch: Started
NOTE: recipe openssl-3.3.1-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Succeeded
NOTE: Running task 789 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_fetch)
NOTE: recipe libgpg-error-1.50-r0: task do_patch: Started
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Succeeded
NOTE: recipe libxcrypt-4.4.36-r0: task do_fetch: Succeeded
NOTE: Running task 790 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_patch)
NOTE: Running task 791 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_unpack)
NOTE: recipe libpam-1.6.1-r0: task do_patch: Started
NOTE: recipe elfutils-native-0.192-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 792 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_unpack)
NOTE: recipe xz-5.6.3-r0: task do_fetch: Started
NOTE: recipe gmp-6.3.0-r0: task do_patch: Started
NOTE: recipe xz-5.6.3-r0: task do_fetch: Succeeded
NOTE: recipe libxcrypt-4.4.36-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: Running task 794 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.1.bb:do_fetch)
NOTE: Running task 795 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe libpam-1.6.1-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_unpack: Started
NOTE: Running task 797 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_unpack)
NOTE: recipe libunistring-1.3-r0: task do_unpack: Succeeded
NOTE: Running task 798 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_patch)
NOTE: recipe nettle-3.10-r0: task do_patch: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_fetch: Succeeded
NOTE: Running task 801 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_fetch)
NOTE: Running task 802 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe curl-8.10.1-r0: task do_fetch: Started
NOTE: recipe curl-8.10.1-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.50-r0: task do_patch: Succeeded
NOTE: Running task 803 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.1.bb:do_unpack)
NOTE: recipe xz-5.6.3-r0: task do_unpack: Started
NOTE: Running task 808 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_fetch)
NOTE: recipe libunistring-1.3-r0: task do_patch: Started
NOTE: recipe acl-2.3.2-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_unpack: Started
NOTE: recipe openssl-3.3.1-r0: task do_patch: Succeeded
NOTE: Running task 811 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_fetch)
NOTE: recipe acl-2.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 814 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.7.1.bb:do_fetch)
NOTE: recipe libidn2-2.3.7-r0: task do_unpack: Succeeded
NOTE: recipe libcap-2.70-r0: task do_fetch: Started
NOTE: Running task 815 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_patch)
NOTE: recipe curl-8.10.1-r0: task do_unpack: Started
NOTE: recipe libcap-2.70-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.6.3-r0: task do_unpack: Succeeded
NOTE: Running task 816 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_fetch)
NOTE: Running task 817 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_patch)
NOTE: recipe libunistring-1.3-r0: task do_patch: Succeeded
NOTE: Running task 821 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_unpack)
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Started
NOTE: recipe gmp-6.3.0-r0: task do_patch: Succeeded
NOTE: Running task 823 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_unpack)
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Succeeded
NOTE: Running task 824 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_unpack)
NOTE: recipe gnutls-3.8.7.1-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.7-r0: task do_patch: Started
NOTE: recipe gnutls-3.8.7.1-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_fetch: Started
NOTE: Running task 827 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.7.1.bb:do_unpack)
NOTE: recipe xz-5.6.3-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_fetch: Succeeded
NOTE: Running task 828 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_unpack)
NOTE: recipe acl-2.3.2-r0: task do_unpack: Started
NOTE: recipe libcap-2.70-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.7-r0: task do_patch: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_unpack: Succeeded
NOTE: recipe libxcrypt-4.4.36-r0: task do_unpack: Succeeded
NOTE: recipe gnutls-3.8.7.1-r0: task do_unpack: Started
NOTE: Running task 833 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_patch)
NOTE: Running task 834 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_patch)
NOTE: Running task 853 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_fetch)
NOTE: recipe libgcrypt-1.11.0-r0: task do_unpack: Started
NOTE: recipe xz-5.6.3-r0: task do_patch: Succeeded
NOTE: Running task 860 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_fetch)
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Succeeded
NOTE: Running task 861 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_patch)
NOTE: recipe libcap-2.70-r0: task do_unpack: Succeeded
NOTE: Running task 862 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_patch)
NOTE: recipe zstd-1.5.6-r0: task do_fetch: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_patch: Started
NOTE: recipe acl-2.3.2-r0: task do_patch: Started
NOTE: recipe cracklib-2.10.2-r0: task do_fetch: Succeeded
NOTE: Running task 863 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_unpack)
NOTE: recipe gdbm-1.24-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: Running task 864 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe elfutils-native-0.192-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_patch: Started
NOTE: Running task 865 of 1928 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_patch)
NOTE: recipe curl-8.10.1-r0: task do_unpack: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_unpack: Succeeded
NOTE: recipe libcap-2.70-r0: task do_patch: Started
NOTE: Running task 866 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.1.bb:do_patch)
NOTE: Running task 867 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_patch)
NOTE: recipe cracklib-2.10.2-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe zstd-1.5.6-r0: task do_fetch: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_patch: Started
NOTE: Running task 868 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_unpack)
NOTE: recipe curl-8.10.1-r0: task do_patch: Started
NOTE: recipe elfutils-native-0.192-r0: task do_patch: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_patch: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_patch: Succeeded
NOTE: Running task 871 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_fetch)
NOTE: recipe libcap-2.70-r0: task do_patch: Succeeded
NOTE: Running task 874 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_fetch)
NOTE: recipe zstd-1.5.6-r0: task do_unpack: Started
NOTE: recipe acl-2.3.2-r0: task do_patch: Succeeded
NOTE: Running task 877 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_fetch)
NOTE: Running task 880 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.7.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: Running task 883 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_fetch)
NOTE: recipe gdbm-1.24-r0: task do_fetch: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_patch: Succeeded
NOTE: Running task 885 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_fetch)
NOTE: recipe curl-8.10.1-r0: task do_patch: Succeeded
NOTE: Running task 887 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_unpack)
NOTE: Running task 889 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_recipe_qa)
NOTE: recipe lzlib-1.14-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_fetch: Started
NOTE: recipe file-5.45-r0: task do_fetch: Started
NOTE: recipe libarchive-3.7.7-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_fetch: Started
NOTE: recipe libarchive-3.7.7-r0: task do_fetch: Succeeded
NOTE: Running task 890 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.7.bb:do_unpack)
NOTE: recipe expat-2.6.4-r0: task do_fetch: Started
NOTE: recipe gdbm-1.24-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 891 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_unpack)
NOTE: recipe elfutils-0.192-r0: task do_recipe_qa: Started
NOTE: recipe expat-2.6.4-r0: task do_fetch: Succeeded
NOTE: Running task 892 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_unpack)
NOTE: recipe gdbm-1.24-r0: task do_unpack: Succeeded
NOTE: Running task 893 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_patch)
NOTE: recipe libarchive-3.7.7-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_unpack: Started
NOTE: recipe expat-2.6.4-r0: task do_unpack: Started
NOTE: recipe cracklib-2.10.2-r0: task do_unpack: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_unpack: Succeeded
NOTE: Running task 894 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_patch)
NOTE: Running task 895 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_patch)
NOTE: recipe elfutils-0.192-r0: task do_recipe_qa: Succeeded
NOTE: Running task 896 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_fetch)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gdbm-1.24-r0: task do_patch: Started
NOTE: Running task 912 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_fetch)
NOTE: recipe gnutls-3.8.7.1-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 913 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.7.1.bb:do_patch)
NOTE: Running task 914 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_patch)
NOTE: recipe cracklib-2.10.2-r0: task do_patch: Started
NOTE: recipe expat-2.6.4-r0: task do_unpack: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_patch: Started
NOTE: Running task 915 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_patch)
NOTE: recipe elfutils-0.192-r0: task do_fetch: Started
NOTE: recipe ncurses-6.5-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_fetch: Succeeded
NOTE: Running task 916 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_unpack)
NOTE: recipe elfutils-0.192-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.7.7-r0: task do_unpack: Succeeded
NOTE: Running task 917 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_unpack)
NOTE: Running task 918 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.7.bb:do_patch)
NOTE: recipe gnutls-3.8.7.1-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_patch: Started
NOTE: recipe expat-2.6.4-r0: task do_patch: Started
NOTE: recipe lzlib-1.14-r0: task do_fetch: Succeeded
NOTE: recipe cracklib-2.10.2-r0: task do_patch: Succeeded
NOTE: Running task 919 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_unpack)
NOTE: Running task 924 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_fetch)
NOTE: recipe zstd-1.5.6-r0: task do_unpack: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_patch: Succeeded
NOTE: Running task 925 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_patch)
NOTE: recipe sqlite3-3_3.46.1-r0: task do_unpack: Started
NOTE: Running task 927 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_fetch)
NOTE: recipe libarchive-3.7.7-r0: task do_patch: Started
NOTE: recipe elfutils-native-0.192-r0: task do_patch: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_patch: Succeeded
NOTE: Running task 928 of 1928 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_deploy_source_date_epoch)
NOTE: recipe elfutils-0.192-r0: task do_unpack: Started
NOTE: Running task 930 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_fetch)
NOTE: recipe lzlib-1.14-r0: task do_unpack: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_fetch: Started
NOTE: recipe libarchive-3.7.7-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_patch: Started
NOTE: recipe ncurses-6.5-r0: task do_fetch: Succeeded
NOTE: Running task 933 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_fetch)
NOTE: recipe expat-2.6.4-r0: task do_patch: Succeeded
NOTE: Running task 934 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_unpack)
NOTE: recipe lzlib-1.14-r0: task do_unpack: Succeeded
NOTE: Running task 935 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_generate_toolchain_file)
NOTE: Running task 936 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_patch)
NOTE: recipe coreutils-9.5-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_unpack: Succeeded
NOTE: Running task 937 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_patch)
NOTE: recipe coreutils-9.5-r0: task do_fetch: Succeeded
NOTE: Running task 940 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_fetch)
NOTE: recipe bash-5.2.37-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_fetch: Started
NOTE: recipe lzlib-1.14-r0: task do_patch: Started
NOTE: recipe ncurses-6.5-r0: task do_unpack: Started
NOTE: recipe bash-5.2.37-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-native-0.192-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 941 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_unpack)
NOTE: recipe zstd-1.5.6-r0: task do_patch: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_fetch: Succeeded
NOTE: Running task 943 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_unpack)
NOTE: Running task 945 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_fetch)
NOTE: recipe sqlite3-3_3.46.1-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_fetch: Started
NOTE: recipe gnutls-3.8.7.1-r0: task do_patch: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 948 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_fetch)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_fetch: Succeeded
NOTE: Running task 949 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_unpack)
NOTE: Running task 950 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_unpack)
NOTE: recipe mpfr-4.2.1-r0: task do_fetch: Started
NOTE: recipe lzlib-1.14-r0: task do_patch: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_patch: Succeeded
NOTE: Running task 955 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_fetch)
NOTE: recipe bash-5.2.37-r0: task do_unpack: Started
NOTE: recipe coreutils-9.5-r0: task do_unpack: Started
NOTE: Running task 957 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_fetch)
NOTE: recipe bash-completion-2.14.0-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_patch: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_unpack: Started
NOTE: Running task 959 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_fetch)
NOTE: Running task 965 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_fetch)
NOTE: recipe elfutils-native-0.192-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 966 of 1928 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_configure)
NOTE: recipe libedit-20240808-3.1-r1: task do_fetch: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Started
NOTE: recipe libffi-3.4.6-r0: task do_fetch: Started
NOTE: recipe mpfr-4.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 967 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_unpack)
NOTE: recipe base-passwd-3.6.4-r0: task do_unpack: Succeeded
NOTE: recipe libedit-20240808-3.1-r1: task do_fetch: Succeeded
NOTE: Running task 968 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_patch)
NOTE: Running task 969 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_fetch)
NOTE: recipe elfutils-native-0.192-r0: task do_configure: Started
NOTE: recipe python3-3.13.0-r0: task do_fetch: Started
NOTE: recipe mpfr-4.2.1-r0: task do_unpack: Started
NOTE: recipe glibc-2.40+git-r0: task do_unpack: Succeeded
NOTE: Running task 970 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_patch)
NOTE: recipe python3-3.13.0-r0: task do_fetch: Succeeded
NOTE: Running task 971 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_fetch)
NOTE: recipe base-passwd-3.6.4-r0: task do_patch: Started
NOTE: recipe sed-4.9-r0: task do_fetch: Started
NOTE: recipe libffi-3.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 973 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_fetch)
NOTE: recipe perl-5.40.0-r0: task do_fetch: Started
NOTE: recipe bash-5.2.37-r0: task do_unpack: Succeeded
NOTE: Running task 974 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_patch)
NOTE: recipe glibc-2.40+git-r0: task do_patch: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_fetch: Succeeded
NOTE: Running task 975 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_unpack)
NOTE: recipe mpfr-4.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 976 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_patch)
NOTE: recipe shadow-4.16.0-r0: task do_fetch: Started
NOTE: recipe shadow-4.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 978 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe bash-5.2.37-r0: task do_patch: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_unpack: Started
NOTE: recipe ncurses-6.5-r0: task do_unpack: Succeeded
NOTE: Running task 979 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_patch)
NOTE: recipe mpfr-4.2.1-r0: task do_patch: Started
NOTE: recipe sed-4.9-r0: task do_fetch: Succeeded
NOTE: Running task 986 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_unpack)
NOTE: recipe coreutils-9.5-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_unpack: Succeeded
NOTE: Running task 987 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_patch)
NOTE: Running task 988 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_patch: Succeeded
NOTE: Running task 989 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_unpack)
NOTE: Running task 990 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_unpack)
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 991 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_unpack)
NOTE: recipe libtirpc-1.3.5-r0: task do_unpack: Succeeded
NOTE: Running task 992 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_patch)
NOTE: recipe ncurses-6.5-r0: task do_patch: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_patch: Started
NOTE: recipe coreutils-9.5-r0: task do_patch: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_unpack: Started
NOTE: recipe libffi-3.4.6-r0: task do_unpack: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_patch: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_unpack: Succeeded
NOTE: Running task 993 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_patch)
NOTE: recipe libffi-3.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 994 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_patch)
NOTE: recipe base-passwd-3.6.4-r0: task do_patch: Succeeded
NOTE: Running task 997 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_unpack)
NOTE: recipe libedit-20240808-3.1-r1: task do_patch: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_unpack: Succeeded
NOTE: Running task 999 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_unpack)
NOTE: Running task 1000 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_patch)
NOTE: recipe libffi-3.4.6-r0: task do_patch: Started
NOTE: recipe perl-5.40.0-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.192-r0: task do_unpack: Succeeded
NOTE: Running task 1001 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_unpack)
NOTE: Running task 1002 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_patch)
NOTE: recipe coreutils-9.5-r0: task do_patch: Succeeded
NOTE: Running task 1005 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_unpack)
NOTE: recipe bash-completion-2.14.0-r0: task do_patch: Started
NOTE: recipe sed-4.9-r0: task do_unpack: Started
NOTE: recipe python3-3.13.0-r0: task do_unpack: Started
NOTE: recipe file-5.45-r0: task do_fetch: Succeeded
NOTE: Running task 1006 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_unpack)
NOTE: recipe bash-completion-2.14.0-r0: task do_patch: Succeeded
NOTE: Running task 1010 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_fetch)
NOTE: recipe libedit-20240808-3.1-r1: task do_patch: Succeeded
NOTE: recipe perl-5.40.0-r0: task do_unpack: Started
NOTE: recipe elfutils-0.192-r0: task do_patch: Started
NOTE: Running task 1011 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_fetch)
NOTE: recipe ncurses-6.5-r0: task do_patch: Succeeded
NOTE: Running task 1013 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe shadow-4.16.0-r0: task do_unpack: Started
NOTE: recipe libffi-3.4.6-r0: task do_patch: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_patch: Succeeded
NOTE: Running task 1018 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_fetch)
NOTE: Running task 1020 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_fetch)
NOTE: recipe file-5.45-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_fetch: Started
NOTE: recipe readline-8.2.13-r0: task do_fetch: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: Running task 1021 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_patch)
NOTE: Running task 1022 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_fetch)
NOTE: recipe libmpc-1.3.1-r0: task do_fetch: Started
NOTE: recipe sed-4.9-r0: task do_unpack: Succeeded
NOTE: recipe iptables-1.8.10-r0: task do_fetch: Started
NOTE: Running task 1023 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_patch)
NOTE: recipe libnsl2-2.0.1-r0: task do_patch: Started
NOTE: recipe libmnl-1.0.5-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1024 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe sed-4.9-r0: task do_patch: Started
NOTE: recipe iptables-1.8.10-r0: task do_fetch: Succeeded
NOTE: Running task 1029 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe sed-4.9-r0: task do_patch: Succeeded
NOTE: Running task 1030 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_fetch)
NOTE: recipe libmnl-1.0.5-r0: task do_fetch: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1031 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_fetch)
NOTE: Running task 1048 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: recipe libmpc-1.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 1056 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_unpack)
NOTE: recipe findutils-4.10.0-r0: task do_fetch: Started
NOTE: recipe readline-8.2.13-r0: task do_fetch: Succeeded
NOTE: Running task 1057 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_unpack)
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Succeeded
NOTE: Running task 1058 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_fetch: Started
NOTE: recipe gawk-5.3.0-r0: task do_fetch: Started
NOTE: Running task 1059 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_unpack)
NOTE: recipe util-linux-2.40.2-r0: task do_fetch: Succeeded
NOTE: Running task 1060 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_fetch)
NOTE: recipe libmpc-1.3.1-r0: task do_unpack: Started
NOTE: recipe readline-8.2.13-r0: task do_unpack: Started
NOTE: recipe iptables-1.8.10-r0: task do_unpack: Started
NOTE: recipe libmpc-1.3.1-r0: task do_unpack: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_unpack: Started
NOTE: Running task 1061 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_fetch)
NOTE: recipe file-5.45-r0: task do_unpack: Succeeded
NOTE: Running task 1062 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_patch)
NOTE: recipe make-4.4.1-r0: task do_fetch: Started
NOTE: recipe glibc-2.40+git-r0: task do_patch: Succeeded
NOTE: Running task 1064 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_patch)
NOTE: recipe libmnl-1.0.5-r0: task do_unpack: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_fetch: Succeeded
NOTE: Running task 1065 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_patch)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_fetch: Started
NOTE: Running task 1066 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_unpack)
NOTE: recipe readline-8.2.13-r0: task do_unpack: Succeeded
NOTE: Running task 1067 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_patch)
NOTE: recipe file-5.45-r0: task do_patch: Started
NOTE: recipe libmpc-1.3.1-r0: task do_patch: Started
NOTE: recipe findutils-4.10.0-r0: task do_fetch: Succeeded
NOTE: Running task 1071 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_unpack)
NOTE: recipe libcap-ng-0.8.5-r0: task do_unpack: Started
NOTE: recipe elfutils-0.192-r0: task do_patch: Succeeded
NOTE: Running task 1072 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_deploy_source_date_epoch)
NOTE: recipe readline-8.2.13-r0: task do_patch: Started
NOTE: recipe libmnl-1.0.5-r0: task do_patch: Started
NOTE: recipe iptables-1.8.10-r0: task do_unpack: Succeeded
NOTE: Running task 1073 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_patch)
NOTE: recipe findutils-4.10.0-r0: task do_unpack: Started
NOTE: recipe libmpc-1.3.1-r0: task do_patch: Succeeded
NOTE: Running task 1074 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_unpack)
NOTE: recipe elfutils-0.192-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gawk-5.3.0-r0: task do_fetch: Succeeded
NOTE: recipe file-5.45-r0: task do_patch: Succeeded
NOTE: Running task 1075 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_unpack)
NOTE: recipe iptables-1.8.10-r0: task do_patch: Started
NOTE: Running task 1081 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.43.1.bb:do_fetch)
NOTE: recipe make-4.4.1-r0: task do_fetch: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_patch: Succeeded
NOTE: Running task 1087 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1089 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: recipe readline-8.2.13-r0: task do_patch: Succeeded
NOTE: Running task 1090 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_unpack)
NOTE: recipe gawk-5.3.0-r0: task do_unpack: Started
NOTE: recipe util-linux-2.40.2-r0: task do_unpack: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Started
NOTE: recipe binutils-2.43.1-r0: task do_fetch: Started
NOTE: recipe perl-5.40.0-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Succeeded
NOTE: Running task 1091 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_patch)
NOTE: recipe binutils-2.43.1-r0: task do_fetch: Succeeded
NOTE: Running task 1126 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.43.1.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running noexec task 1154 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.2.bb:do_fetch)
NOTE: Running task 1158 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_fetch)
NOTE: Running task 1159 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe make-4.4.1-r0: task do_unpack: Started
NOTE: recipe iptables-1.8.10-r0: task do_patch: Succeeded
NOTE: Running task 1196 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: recipe elfutils-0.192-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1199 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_populate_lic)
NOTE: recipe perl-5.40.0-r0: task do_patch: Started
NOTE: recipe shadow-4.16.0-r0: task do_unpack: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1200 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_patch)
NOTE: Running task 1201 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_unpack)
NOTE: recipe binutils-2.43.1-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe psmisc-23.7-r0: task do_fetch: Started
NOTE: recipe findutils-4.10.0-r0: task do_unpack: Succeeded
NOTE: Running task 1202 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_patch)
NOTE: recipe make-4.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 1203 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_unpack: Succeeded
NOTE: Running task 1204 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_unpack: Started
NOTE: Running task 1205 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe elfutils-0.192-r0: task do_populate_lic: Started
NOTE: recipe shadow-4.16.0-r0: task do_patch: Started
NOTE: recipe gawk-5.3.0-r0: task do_unpack: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_patch: Started
NOTE: Running task 1206 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_patch)
NOTE: recipe make-4.4.1-r0: task do_patch: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe findutils-4.10.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1208 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe gawk-5.3.0-r0: task do_patch: Started
NOTE: recipe elfutils-0.192-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-3.13.0-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.16.0-r0: task do_patch: Succeeded
NOTE: Running task 1209 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_patch)
NOTE: recipe make-4.4.1-r0: task do_patch: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_unpack: Succeeded
NOTE: recipe gawk-5.3.0-r0: task do_patch: Succeeded
NOTE: Running task 1210 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_patch)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_unpack: Succeeded
NOTE: recipe perl-5.40.0-r0: task do_patch: Succeeded
NOTE: Running task 1213 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_patch)
NOTE: recipe psmisc-23.7-r0: task do_fetch: Succeeded
NOTE: Running task 1217 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_patch: Started
NOTE: recipe psmisc-23.7-r0: task do_unpack: Started
NOTE: recipe util-linux-2.40.2-r0: task do_patch: Started
NOTE: recipe python3-3.13.0-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_unpack: Succeeded
NOTE: Running task 1220 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_patch)
NOTE: recipe util-linux-2.40.2-r0: task do_patch: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_patch: Started
NOTE: recipe psmisc-23.7-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-6.10-r0: task do_unpack: Succeeded
NOTE: Running task 1223 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_patch)
NOTE: Running task 1224 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_collect_spdx_deps)
NOTE: recipe linux-libc-headers-6.10-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe linux-libc-headers-6.10-r0: task do_patch: Succeeded
NOTE: Running noexec task 1226 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_configure)
NOTE: Running noexec task 1227 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_compile)
NOTE: Running task 1228 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_install)
NOTE: recipe linux-libc-headers-6.10-r0: task do_install: Started
NOTE: recipe python3-3.13.0-r0: task do_patch: Succeeded
NOTE: recipe binutils-2.43.1-r0: task do_unpack: Succeeded
NOTE: Running task 1230 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.43.1.bb:do_patch)
NOTE: recipe binutils-2.43.1-r0: task do_patch: Started
NOTE: recipe binutils-2.43.1-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-6.10-r0: task do_install: Succeeded
NOTE: Running task 1246 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_prepare_recipe_sysroot)
NOTE: recipe glibc-2.40+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glibc-2.40+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1247 of 1928 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_configure)
NOTE: recipe glibc-2.40+git-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext-minimal-native_0.22.5.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-native_2.5.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.68.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf_2.72e.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/automake/automake_1.17.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.7.bb:do_populate_sysroot', 'vir
 tual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['gettext-minimal-native', 'cmake-native', 'libtool-native', 'm4-native', 'quilt-native', 'texinfo-dummy-native', 'openssl-native', 'expat-native', 'ncurses-native', 'util-linux-libuuid-native', 'zlib-native', 'autoconf-native', 'automake-native', 'gnu-config-native', 'libedit-native', 'make-native', 'perl-native', 'pkgconfig-native', 'python3-native', 'bzip2-native', 'libarchive-native', 'libidn2-native', 'libnsl2-native', 'libtirpc-native', 'xz-native', 'zstd-native', 'acl-native', 'attr-native', 'curl-native', 'gdbm-native', 'gmp-native', 'gnutls-native', 'libtasn1-native', 'libcap-native', 'libffi-native', 'libgcrypt-native', 'libgpg-error-native', 'libmicrohttpd-native', 'libunistring-native', 'nettle-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_configure
| automake (GNU automake) 1.17
| Features: subsecond-mtime
| 
| Copyright (C) 2024 Free Software Foundation, Inc.
| License GPLv2+: GNU GPL version 2 or later
|   <https://gnu.org/licenses/gpl-2.0.html>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY, to the extent permitted by law.
| 
| Written by Tom Tromey <tromey@redhat.com>
|        and Alexandre Duret-Lutz <adl@gnu.org>.
| AUTOV is 1
| NOTE: Executing ACLOCAL="aclocal --system-acdir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/elfutils-native/0.192/recipe-sysroot-native/usr/share/aclocal/" autoreconf -Wcross --verbose --install --force --exclude=autopoint -I /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/elfutils-native/0.192/elfutils-0.192/m4/
| autoreconf: export WARNINGS=cross,no-obsolete
| autoreconf: Entering directory '.'
| autoreconf: running: aclocal --system-acdir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/elfutils-native/0.192/recipe-sysroot-native/usr/share/aclocal/ -I /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/elfutils-native/0.192/elfutils-0.192/m4/ --force -I m4
| autoreconf: configure.ac: tracing
| autoreconf: configure.ac: not using Libtool
| autoreconf: configure.ac: not using Intltool
| autoreconf: configure.ac: not using Gtkdoc
| autoreconf: running: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/elfutils-native/0.192/recipe-sysroot-native/usr/bin/autoconf --include=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/elfutils-native/0.192/elfutils-0.192/m4/ --force
| autoreconf: running: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/elfutils-native/0.192/recipe-sysroot-native/usr/bin/autoheader --include=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/elfutils-native/0.192/elfutils-0.192/m4/ --force
| autoreconf: running: automake --add-missing --copy --force-missing
| autoreconf: 'config/config.sub' is updated
| autoreconf: 'config/config.guess' is updated
| autoreconf: Leaving directory '.'
| NOTE: Running ../elfutils-0.192/configure  --build=x86_64-linux 		  --host=x86_64-linux 		  --target=x86_64-linux 		  --prefix=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/elfutils-native/0.192/recipe-sysroot-native/usr 		  --exec_prefix=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/elfutils-native/0.192/recipe-sysroot-native/usr 		  --bindir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/elfutils-native/0.192/recipe-sysroot-native/usr/bin 		  --sbindir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/elfutils-native/0.192/recipe-sysroot-native/usr/sbin 		  --libexecdir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/elfutils-native/0.192/recipe-sysroot-native/usr/libexec 		  --datadir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/elfutils-native/0.192/recipe-sysroot-native/usr/share 		  --sysconfdir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/elf
 utils-native/0.192/recipe-sysroot-native/etc 		  --sharedstatedir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/elfutils-native/0.192/recipe-sysroot-native/com 		  --localstatedir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/elfutils-native/0.192/recipe-sysroot-native/var 		  --libdir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/elfutils-native/0.192/recipe-sysroot-native/usr/lib 		  --includedir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/elfutils-native/0.192/recipe-sysroot-native/usr/include 		  --oldincludedir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/elfutils-native/0.192/recipe-sysroot-native/usr/include 		  --infodir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/elfutils-native/0.192/recipe-sysroot-native/usr/share/info 		  --mandir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/elfutils-native/0.192/recipe-sysroot-native/usr/share
 /man 		  --disable-silent-rules 		  --disable-dependency-tracking --program-prefix=eu- --disable-static  --without-bzlib --enable-debuginfod --enable-libdebuginfod --without-lzma --without-zstd --disable-nls
| configure: WARNING: unrecognized options: --disable-static
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/meta/site/endian-little
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/meta/site/common-linux
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/meta/site/common-glibc
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/meta/site/x86_64-linux
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/meta/site/common
| checking for a BSD-compatible install... /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c
| checking whether sleep supports fractional seconds... yes
| checking filesystem timestamp resolution... 0.01
| checking whether build environment is sane... yes
| checking for a race-free mkdir -p... /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p
| checking for gawk... gawk
| checking whether make sets $(MAKE)... yes
| checking whether make supports nested variables... yes
| checking xargs -n works... yes
| checking whether to enable maintainer-specific portions of Makefiles... no
| checking build system type... x86_64-pc-linux-gnu
| checking host system type... x86_64-pc-linux-gnu
| checking for x86_64-linux-gcc... gcc
| checking whether the C compiler works... yes
| checking for C compiler default output file name... a.out
| checking for suffix of executables...
| checking whether we are cross compiling... no
| checking for suffix of object files... o
| checking whether the compiler supports GNU C... yes
| checking whether gcc  accepts -g... yes
| checking for gcc  option to enable C11 features... none needed
| checking whether gcc  understands -c and -o together... yes
| checking whether make supports the include directive... yes (GNU style)
| checking dependency style of gcc ... none
| checking whether the compiler supports GNU C++... yes
| checking whether g++  accepts -g... yes
| checking for g++  option to enable C++11 features... none needed
| checking dependency style of g++ ... none
| checking for x86_64-linux-ranlib... ranlib -D
| checking for bison... no
| checking for byacc... no
| checking for flex... no
| checking for lex... no
| checking for x86_64-linux-ar... ar
| checking the archiver (ar) interface... ar
| checking for x86_64-linux-readelf... readelf
| checking for x86_64-linux-nm... nm
| checking whether gcc supports __attribute__((visibility()))... yes
| checking whether gcc supports __attribute__((gcc_struct))... yes
| checking whether gcc supports -fPIC... yes
| checking whether gcc supports -fPIE... yes
| checking whether gcc supports -Wl,-z,defs... yes
| checking whether the compiler generates build-ids... yes
| checking whether gcc supports -Wl,-z,relro... yes
| checking for __thread support... yes
| checking whether gcc provides stdatomic.h... yes
| checking for gcc  option to enable large file support... none needed
| checking whether fts.h is bad when included (with LFS)... no
| checking whether to add -D_FORTIFY_SOURCE=2 or =3 to CFLAGS... yes -D_FORTIFY_SOURCE=3
| checking for library containing gzdirect... -lz
| checking for gcc  options needed to detect all undeclared functions... none needed
| checking whether memrchr is declared... yes
| checking whether rawmemchr is declared... yes
| checking whether powerof2 is declared... yes
| checking whether mempcpy is declared... yes
| checking whether reallocarray is declared... yes
| checking for process_vm_readv... yes
| checking for mremap... yes
| checking for stdio.h... yes
| checking for stdlib.h... yes
| checking for string.h... yes
| checking for inttypes.h... yes
| checking for stdint.h... yes
| checking for strings.h... yes
| checking for sys/stat.h... yes
| checking for sys/types.h... yes
| checking for unistd.h... yes
| checking for error.h... yes
| checking for err.h... yes
| checking for sched.h... yes
| checking for sched_getaffinity... yes
| checking for sys/resource.h... yes
| checking for getrlimit... yes
| checking for malloc.h... yes
| checking for malloc_trim... yes
| checking whether strerror_r is declared... yes
| checking whether strerror_r returns char *... yes
| checking for __cxa_demangle in -lstdc++... yes
| checking whether symbol versioning is supported... yes
| checking whether gcc accepts -Wstack-usage... yes
| checking whether gcc has a sane -Wlogical-op... yes
| checking whether gcc accepts -Wduplicated-cond... yes
| checking whether gcc accepts -Wnull-dereference... yes
| checking whether gcc accepts -Wimplicit-fallthrough... yes
| checking whether the compiler accepts -Wimplicit-fallthrough=5... yes
| checking whether the compiler accepts -Wtrampolines... yes
| checking whether the compiler accepts -Wno-packed-not-aligned... yes
| checking whether the compiler accepts -Wuse-after-free=3... yes
| checking whether the compiler accepts -fno-addrsig... no
| checking for library containing argp_parse... none required
| checking for library containing fts_close... none required
| checking for library containing _obstack_free... none required
| checking for a sed that does not truncate output... (cached) sed
| checking whether NLS is requested... no
| checking for msgfmt... no
| checking for gmsgfmt... :
| checking for xgettext... no
| checking for msgmerge... no
| checking for ld... ld
| checking if the linker (ld ) is GNU ld... yes
| checking for shared library run path origin... done
| checking 32-bit host C ABI... no
| checking how to run the C preprocessor... gcc  -E
| checking for egrep -e... /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/grep -E
| checking for ELF binary format... yes
| checking for the common suffixes of directories in the library search path... lib,lib,lib64
| checking for CFPreferencesCopyAppValue... no
| checking for CFLocaleCopyPreferredLanguages... no
| checking whether to use NLS... no
| checking size of long... (cached) 8
| checking for struct user_regs_struct... yes
| checking gcc  option for 32-bit word size... -m32
| checking for 64-bit host... yes
| checking whether gcc  -m32 makes executables we can run... no
| configure: WARNING: not running biarch tests, gcc  -m32 does not work
| checking for bunzip2... (cached) yes
| checking for zstd... yes
| checking whether g++  supports C++11 features with -std=c++11... yes
| checking for execinfo.h... yes
| checking for x86_64-linux-pkg-config... no
| checking for pkg-config... /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/elfutils-native/0.192/recipe-sysroot-native/usr/bin/pkg-config
| checking pkg-config is at least version 0.9.0... yes
| checking for libcurl >= 7.29.0... yes
| checking for pthread_setname_np in -lpthread... yes
| checking for json-c >= 0.11... no
| checking for libmicrohttpd >= 0.9.33... yes
| checking for libmicrohttpd < 0.9.51... no
| checking for sqlite3 >= 3.7.17... yes
| checking for libarchive >= 3.1.2... yes
| checking for headerGet in -lrpm... no
| checking for EVP_MD_CTX_new in -lcrypto... yes
| checking for imaevm.h... no
| configure: error: unable to build libdebuginfod
| NOTE: The following config.log files may provide further information.
| NOTE: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/elfutils-native/0.192/build/config.log
| ERROR: configure failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/elfutils-native/0.192/temp/run.do_configure.3291305:285 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/elfutils-native/0.192/temp/run.do_configure.3291305, line 285
| 	#2: oe_runconf, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/elfutils-native/0.192/temp/run.do_configure.3291305, line 261
| 	#3: autotools_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/elfutils-native/0.192/temp/run.do_configure.3291305, line 231
| 	#4: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/elfutils-native/0.192/temp/run.do_configure.3291305, line 151
| 	#5: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/elfutils-native/0.192/temp/run.do_configure.3291305, line 289
NOTE: recipe elfutils-native-0.192-r0: task do_configure: Failed
NOTE: recipe glibc-2.40+git-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1247 tasks of which 1037 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 11 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241116093424.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241116093424.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/elfutils-native/0.192/temp/log.do_configure.3291305
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: elfutils-native-0.192-r0 do_configure: configure failed
ERROR: elfutils-native-0.192-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/elfutils-native/0.192/temp/run.do_configure.3291305' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/elfutils-native/0.192/temp/log.do_configure.3291305
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_configure) failed with exit code '1'

--===============5100914117630768748==--

