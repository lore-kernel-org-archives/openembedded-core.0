Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1059D10DB4
	for <webhook@archiver.kernel.org>; Sun,  1 Dec 2024 10:05:58 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.148761.1733047557564961981
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Dec 2024 02:05:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=BegQ+988;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=jf1sSO/Z;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019381af1aad-68189710-44fb-446f-9a3c-aa5e259d12a6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1733047557;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=yAvMCoz0DRI8kETJpzwsGdw2xRefs8HWVKrWHprmLeI=;
	b=BegQ+988FxCu4b2ZPq6kiSOLeikF7zrcoGILBVNpdm29TQ8pWPZD+uQzExYjXthY
	HuDQLpmdaI220CP/Ko5ecOlq2DOjIRThGZNYXL5rrSUPqYyV+rPthafp65v0Woyp9LV
	KSZIcIIFf6eOWgb2fxu1EawDrGM6JakEjTiyKJZ0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1733047557;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=yAvMCoz0DRI8kETJpzwsGdw2xRefs8HWVKrWHprmLeI=;
	b=jf1sSO/Z66fzDu1GattbXfOA5eW23VjpBXGwP7bS8alq4AFACsWOHBDWNVQX+XQZ
	8datDuWnZYDQl+10ispb2UCUv5m8kb/9AFm6Ys2lNEpDsFCr1jeYZQIMxOB5TscUUjy
	NhfHGl+3OIND/GMLZvAeLHnyF6dE6EOToKa5Xyqg=
Content-Type: multipart/mixed; boundary="===============7502339287187537768=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangruochen@loongson.cn>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] elfutils: upgrading to 0.192 FAILED
Message-ID: <0101019381af1aad-68189710-44fb-446f-9a3c-aa5e259d12a6-000000@us-west-2.amazonses.com>
Date: Sun, 1 Dec 2024 10:05:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Dec 2024 10:05:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208068

--===============7502339287187537768==
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
From 3b8539cd60251497888b01a363f3dfa450a29bf9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Dec 2024 06:54:39 +0000
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
index 4f7539bef2..5b7b093196 100644
--- a/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch
@@ -1,4 +1,4 @@
-From 63070df4b0dc7af37a720915b5e6494204463c9a Mon Sep 17 00:00:00 2001
+From e2db59e77196ca3dc4c99a9fc3df2145c08d32b4 Mon Sep 17 00:00:00 2001
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
index a9f5e030fc..09265ff55f 100644
--- a/meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch
@@ -1,4 +1,4 @@
-From 46d9d889a07fc9f9f089f800e5c0e895889c44ae Mon Sep 17 00:00:00 2001
+From 26006611efc7a393fdad9bec09762df78cf2e952 Mon Sep 17 00:00:00 2001
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
index 57e4b3890a..85427e8e30 100644
--- a/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch
@@ -1,4 +1,4 @@
-From 19d9e9d838e74e4a0a22f08ae03167380f8aa490 Mon Sep 17 00:00:00 2001
+From 352578d7fc0f7bac4c63fb5b3bde65d4852b3d70 Mon Sep 17 00:00:00 2001
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
index 096361e215..f120122ba3 100644
--- a/meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-gcc-not-deployed.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-gcc-not-deployed.patch
@@ -1,4 +1,4 @@
-From f9ab54454000fd210dbaa92cf516084d05060f9d Mon Sep 17 00:00:00 2001
+From 6304e8497da16f89f80fca52bd17fb9dfbac59f2 Mon Sep 17 00:00:00 2001
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
index d410eb13d8..6953de4dea 100644
--- a/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch
@@ -1,4 +1,4 @@
-From 2d4dfb814dda02193e49c9203147cf73e6d3f8b7 Mon Sep 17 00:00:00 2001
+From 683cf130082a73c6140650f18aaf18875a388132 Mon Sep 17 00:00:00 2001
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
index fa2282b8dd..622ebad929 100644
--- a/meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch
+++ b/meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch
@@ -1,4 +1,4 @@
-From d8f07a23d608b744dcc0592f9f32f258b186a77c Mon Sep 17 00:00:00 2001
+From 541cca4c83270a6f7317a78bf12095a73f7ee917 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 15 Aug 2017 17:13:59 +0800
 Subject: [PATCH] Fix elf_cvt_gunhash if dest and src are same.
diff --git a/meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch b/meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch
index e8b986e4ba..23134bb179 100644
--- a/meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch
+++ b/meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch
@@ -1,4 +1,4 @@
-From 614f062b22e6da108643f8644a3e92a1108f2b9b Mon Sep 17 00:00:00 2001
+From 0587d4d500e2270452c66956cae1add6f3bbf58a Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 15 Aug 2017 17:17:20 +0800
 Subject: [PATCH] fixheadercheck
diff --git a/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch b/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
index 230ea88f41..5010d7a15d 100644
--- a/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
+++ b/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
@@ -1,4 +1,4 @@
-From aab5985a29bd7ab6e0b06eaab190b42a04e10f70 Mon Sep 17 00:00:00 2001
+From 53d8d655a77d2e01d0f65e4abedffcf7aa47d357 Mon Sep 17 00:00:00 2001
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
index 2152875d63..749933e154 100644
--- a/meta/recipes-devtools/elfutils/files/ptest.patch
+++ b/meta/recipes-devtools/elfutils/files/ptest.patch
@@ -1,4 +1,4 @@
-From d49f6a135762ec1f1831d0e80b8df2a4269b0a66 Mon Sep 17 00:00:00 2001
+From 7a817b2ce0b3ec44d3b4ea90fb29d26102b60690 Mon Sep 17 00:00:00 2001
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


--===============7502339287187537768==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1879 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (920 cached, 1 parsed). 1877 targets, 41 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:ec4a99d675c49f19cf0f0360b4ea31914135b9bd"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 438 Local 207 Mirrors 0 Missed 231 Current 272 (47% match, 67% complete)
Removing 2 stale sstate objects for arch x86_64...done.
Removing 63 stale sstate objects for arch qemux86_64...done.
Removing 60 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 351 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 402 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 425 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 426 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 435 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 440 of 710 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 445 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 449 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 454 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 460 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 463 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 466 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.43.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 474 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 476 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 480 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 482 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gawk-5.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-2.43.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.13.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 484 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gawk-5.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 488 of 710 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl-cross/perlcross_1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 491 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.40.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-2.43.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perl-5.40.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 493 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 494 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.11.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 496 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.40.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 499 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: recipe make-4.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 500 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_populate_sysroot_setscene)
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 504 of 710 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_create_spdx_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 506 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.2.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 508 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 509 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 512 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 513 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 517 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 519 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-locale-2.40+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe perlcross-native-1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe iproute2-6.11.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glibc-locale-2.40+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 520 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gawk-5.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe iptables-1.8.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-native-5.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe iproute2-6.11.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 525 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/cross-localedef-native_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 527 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 528 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_recipe_qa_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 530 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 531 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_recipe_qa_setscene)
NOTE: recipe gawk-5.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 532 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20240808-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 536 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cross-localedef-native-2.40+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-native-5.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 538 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 543 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 545 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 547 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 548 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 550 of 710 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_populate_sysroot_setscene)
NOTE: recipe iptables-1.8.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe perlcross-native-1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 552 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 553 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe perl-5.40.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 554 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.2.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 558 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-5.2.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-0.192-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 559 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_recipe_qa_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 564 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cross-localedef-native-2.40+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 565 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 566 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.47.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 569 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 570 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 571 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe elfutils-0.192-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 574 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 575 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 583 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 585 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.47.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 587 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 589 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 590 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe curl-8.10.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnutls-3.8.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.13.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 591 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe curl-8.10.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 592 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 599 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/cross-localedef-native_2.40.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 601 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 602 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.13.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libedit-20240808-3.1-r1: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 603 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 612 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 613 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 614 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 617 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cross-localedef-native-2.40+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 620 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 621 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.71.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.24-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe iptables-1.8.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 622 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 627 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 628 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cross-localedef-native-2.40+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 630 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 631 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe iptables-1.8.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 633 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 634 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.71-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 635 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 636 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe nettle-3.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 637 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 638 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 641 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.71-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.6.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 642 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 643 of 710 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl-cross/perlcross_1.6.bb:do_recipe_qa_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 644 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 645 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe iptables-1.8.11-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 649 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libedit-20240808-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 650 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 652 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 653 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe iptables-1.8.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 654 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 655 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb:do_create_spdx_setscene)
NOTE: recipe libedit-20240808-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 656 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perlcross-native-1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 657 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 661 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 664 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 665 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 666 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lzlib-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perlcross-native-1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 667 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 668 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.51-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 669 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 671 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 672 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 675 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcc-initial-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 678 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgpg-error-1.51-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 679 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 680 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 683 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 685 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 690 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcc-initial-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 691 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 695 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_stash_locale_setscene)
NOTE: Running setscene task 697 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 701 of 710 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 702 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.36-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glibc-2.40+git-r0: task do_stash_locale_setscene: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 703 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-native-0.192-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 208 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_fetch)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-native-0.192-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running noexec task 315 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_fetch)
NOTE: recipe shadow-4.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 399 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_fetch)
NOTE: Running noexec task 401 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.12-r0: task do_fetch: Started
NOTE: Running task 443 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.12-r0: task do_fetch: Succeeded
NOTE: Running task 482 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_unpack)
NOTE: Running task 483 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe shadow-4.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 542 of 1902 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_fetch)
NOTE: Running task 544 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_fetch)
NOTE: Running task 546 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_fetch)
NOTE: recipe libtool-cross-2.5.2-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.2-r0: task do_fetch: Succeeded
NOTE: Running task 620 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_fetch)
NOTE: Running task 622 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: Running task 624 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_fetch)
NOTE: Running task 628 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_fetch)
NOTE: Running task 632 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_fetch)
NOTE: Running task 633 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_fetch)
NOTE: Running task 634 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_fetch)
NOTE: Running task 636 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_unpack)
NOTE: recipe linux-libc-headers-6.12-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 711 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_fetch)
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Started
NOTE: recipe openssl-3.4.0-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 712 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_unpack)
NOTE: recipe elfutils-native-0.192-r0: task do_fetch: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_fetch: Started
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Started
NOTE: recipe openssl-3.4.0-r0: task do_fetch: Succeeded
NOTE: recipe libtool-cross-2.5.2-r0: task do_unpack: Started
NOTE: recipe attr-2.5.2-r0: task do_fetch: Started
NOTE: Running task 713 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_unpack)
NOTE: recipe libpam-1.6.1-r0: task do_fetch: Started
NOTE: recipe nettle-3.10-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.51-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_fetch: Started
NOTE: recipe glibc-2.40+git-r0: task do_stash_locale_setscene: Succeeded
NOTE: Running setscene task 704 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe elfutils-native-0.192-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 705 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 714 of 1902 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_unpack)
NOTE: recipe linux-libc-headers-6.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_fetch: Started
NOTE: Running task 715 of 1902 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_prepare_recipe_sysroot)
NOTE: Running task 716 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_unpack)
NOTE: recipe libunistring-1.3-r0: task do_fetch: Succeeded
NOTE: Running task 717 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_unpack)
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 718 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: recipe openssl-3.4.0-r0: task do_unpack: Started
NOTE: recipe libgcc-initial-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.40+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Succeeded
NOTE: recipe libtool-cross-2.5.2-r0: task do_unpack: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_unpack: Started
NOTE: Running task 719 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_patch)
NOTE: recipe libpam-1.6.1-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Started
NOTE: recipe elfutils-native-0.192-r0: task do_unpack: Started
NOTE: Running task 750 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_fetch)
NOTE: recipe elfutils-native-0.192-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe attr-2.5.2-r0: task do_unpack: Succeeded
NOTE: recipe glibc-2.40+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 751 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_fetch)
NOTE: Running task 752 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_patch)
NOTE: recipe zlib-1.3.1-r0: task do_patch: Started
NOTE: recipe libgcc-initial-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 706 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.7-r0: task do_fetch: Succeeded
NOTE: Running setscene task 707 of 710 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_gcc_stash_builddir_setscene)
NOTE: recipe attr-2.5.2-r0: task do_patch: Started
NOTE: recipe glibc-2.40+git-r0: task do_fetch: Started
NOTE: recipe libgcc-initial-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glibc-2.40+git-r0: task do_fetch: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: Running task 753 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_unpack)
NOTE: recipe libgcc-initial-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 762 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_unpack)
NOTE: recipe zlib-1.3.1-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 766 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 767 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_patch)
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 768 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_unpack)
NOTE: recipe glibc-2.40+git-r0: task do_unpack: Started
NOTE: recipe libunistring-1.3-r0: task do_unpack: Started
NOTE: recipe attr-2.5.2-r0: task do_patch: Succeeded
NOTE: Running task 770 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.51-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_patch: Started
NOTE: Running task 771 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_unpack)
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 772 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: recipe xz-5.6.3-r0: task do_fetch: Started
NOTE: recipe xz-5.6.3-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.51-r0: task do_unpack: Started
NOTE: Running task 773 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_unpack)
NOTE: recipe libpam-1.6.1-r0: task do_patch: Succeeded
NOTE: recipe elfutils-native-0.192-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 776 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.1.bb:do_fetch)
NOTE: Running task 777 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: Running task 778 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe openssl-3.4.0-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_unpack: Started
NOTE: Running task 779 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_patch)
NOTE: recipe libunistring-1.3-r0: task do_unpack: Succeeded
NOTE: recipe curl-8.10.1-r0: task do_fetch: Started
NOTE: Running task 780 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_patch)
NOTE: recipe xz-5.6.3-r0: task do_unpack: Started
NOTE: recipe curl-8.10.1-r0: task do_fetch: Succeeded
NOTE: Running task 781 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.1.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe openssl-3.4.0-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.51-r0: task do_unpack: Succeeded
NOTE: Running task 782 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_patch)
NOTE: recipe libunistring-1.3-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Succeeded
NOTE: Running task 785 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_fetch)
NOTE: recipe xz-5.6.3-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_unpack: Succeeded
NOTE: Running task 786 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_patch)
NOTE: Running task 787 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_patch)
NOTE: recipe curl-8.10.1-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.51-r0: task do_patch: Started
NOTE: recipe acl-2.3.2-r0: task do_fetch: Started
NOTE: recipe libunistring-1.3-r0: task do_patch: Succeeded
NOTE: Running task 792 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.71.bb:do_fetch)
NOTE: recipe xz-5.6.3-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.7-r0: task do_patch: Started
NOTE: recipe acl-2.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 794 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_fetch)
NOTE: recipe libcap-2.71-r0: task do_fetch: Started
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Succeeded
NOTE: recipe libcap-2.71-r0: task do_fetch: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Started
NOTE: Running task 795 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_patch)
NOTE: Running task 798 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_fetch)
NOTE: recipe libidn2-2.3.7-r0: task do_patch: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.6.3-r0: task do_patch: Succeeded
NOTE: Running task 799 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.8.bb:do_fetch)
NOTE: Running task 803 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_unpack)
NOTE: Running task 805 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.71.bb:do_unpack)
NOTE: recipe openssl-3.4.0-r0: task do_patch: Succeeded
NOTE: Running task 807 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_unpack)
NOTE: recipe gmp-6.3.0-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_fetch: Started
NOTE: recipe libcap-2.71-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.51-r0: task do_patch: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_unpack: Started
NOTE: recipe gnutls-3.8.8-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-native-0.192-r0: task do_unpack: Succeeded
NOTE: Running task 820 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_unpack)
NOTE: Running task 828 of 1902 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_patch)
NOTE: Running task 834 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_fetch)
NOTE: recipe gnutls-3.8.8-r0: task do_fetch: Succeeded
NOTE: Running task 835 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.8.bb:do_unpack)
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Started
NOTE: recipe curl-8.10.1-r0: task do_unpack: Succeeded
NOTE: Running task 836 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.1.bb:do_patch)
NOTE: recipe acl-2.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 837 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_patch)
NOTE: recipe zstd-1.5.6-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: Running task 838 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe gnutls-3.8.8-r0: task do_unpack: Started
NOTE: recipe elfutils-native-0.192-r0: task do_patch: Started
NOTE: recipe libcap-2.71-r0: task do_unpack: Succeeded
NOTE: Running task 839 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.71.bb:do_patch)
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Succeeded
NOTE: Running task 840 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_patch)
NOTE: recipe curl-8.10.1-r0: task do_patch: Started
NOTE: recipe acl-2.3.2-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe libcap-2.71-r0: task do_patch: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_patch: Started
NOTE: recipe zstd-1.5.6-r0: task do_fetch: Succeeded
NOTE: Running task 845 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_unpack)
NOTE: recipe curl-8.10.1-r0: task do_patch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_patch: Succeeded
NOTE: Running task 848 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_fetch)
NOTE: Running task 851 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_fetch)
NOTE: recipe zstd-1.5.6-r0: task do_unpack: Started
NOTE: recipe lzlib-1.14-r0: task do_fetch: Started
NOTE: recipe gdbm-1.24-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: Running task 854 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.0.bb:do_fetch)
NOTE: recipe acl-2.3.2-r0: task do_patch: Succeeded
NOTE: recipe libcap-2.71-r0: task do_patch: Succeeded
NOTE: Running task 858 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_fetch)
NOTE: Running task 860 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.7.bb:do_fetch)
NOTE: recipe libtasn1-4.19.0-r0: task do_patch: Succeeded
NOTE: Running task 863 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_fetch)
NOTE: recipe sqlite3-3_3.47.0-r0: task do_fetch: Started
NOTE: recipe file-5.45-r0: task do_fetch: Started
NOTE: recipe libarchive-3.7.7-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_fetch: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.7.7-r0: task do_fetch: Succeeded
NOTE: Running task 864 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_unpack)
NOTE: Running task 866 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_fetch)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 868 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_fetch)
NOTE: recipe libseccomp-2.5.5-r0: task do_fetch: Succeeded
NOTE: Running task 869 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_unpack)
NOTE: recipe libxcrypt-4.4.36-r0: task do_unpack: Started
NOTE: recipe expat-2.6.4-r0: task do_fetch: Started
NOTE: recipe elfutils-0.192-r0: task do_fetch: Started
NOTE: recipe nettle-3.10-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_unpack: Succeeded
NOTE: Running task 870 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_unpack)
NOTE: Running task 871 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_unpack)
NOTE: Running task 872 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_patch)
NOTE: recipe elfutils-0.192-r0: task do_fetch: Succeeded
NOTE: Running task 873 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.7.bb:do_unpack)
NOTE: recipe libseccomp-2.5.5-r0: task do_unpack: Started
NOTE: recipe nettle-3.10-r0: task do_unpack: Started
NOTE: recipe expat-2.6.4-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_patch: Started
NOTE: recipe libarchive-3.7.7-r0: task do_unpack: Started
NOTE: recipe gnutls-3.8.8-r0: task do_unpack: Succeeded
NOTE: recipe elfutils-native-0.192-r0: task do_patch: Succeeded
NOTE: Running task 874 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.8.bb:do_patch)
NOTE: Running task 875 of 1902 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_deploy_source_date_epoch)
NOTE: recipe zstd-1.5.6-r0: task do_unpack: Succeeded
NOTE: Running task 876 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_patch)
NOTE: recipe expat-2.6.4-r0: task do_unpack: Succeeded
NOTE: recipe nettle-3.10-r0: task do_unpack: Succeeded
NOTE: Running task 877 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_patch)
NOTE: Running task 878 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_patch)
NOTE: recipe gnutls-3.8.8-r0: task do_patch: Started
NOTE: recipe elfutils-native-0.192-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe zstd-1.5.6-r0: task do_patch: Started
NOTE: recipe libarchive-3.7.7-r0: task do_unpack: Succeeded
NOTE: recipe nettle-3.10-r0: task do_patch: Started
NOTE: recipe expat-2.6.4-r0: task do_patch: Started
NOTE: Running task 879 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.7.bb:do_patch)
NOTE: recipe zstd-1.5.6-r0: task do_patch: Succeeded
NOTE: Running task 881 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_unpack)
NOTE: recipe libxcrypt-4.4.36-r0: task do_unpack: Succeeded
NOTE: recipe libarchive-3.7.7-r0: task do_patch: Started
NOTE: Running task 882 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_patch)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 897 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_unpack)
NOTE: recipe expat-2.6.4-r0: task do_patch: Succeeded
NOTE: Running task 899 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_fetch)
NOTE: recipe libarchive-3.7.7-r0: task do_patch: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_unpack: Succeeded
NOTE: Running task 901 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_generate_toolchain_file)
NOTE: Running task 902 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_patch)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_unpack: Started
NOTE: recipe gnutls-3.8.8-r0: task do_patch: Succeeded
NOTE: recipe libxcrypt-4.4.36-r0: task do_patch: Started
NOTE: Running task 908 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_fetch)
NOTE: recipe elfutils-0.192-r0: task do_unpack: Started
NOTE: recipe ncurses-6.5-r0: task do_fetch: Started
NOTE: recipe elfutils-native-0.192-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_patch: Succeeded
NOTE: Task virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_deploy_source_date_epoch unihash changed to b98a6d50e2c1dd34f6f2c7d49581a9fe1147abe5c54def3cc8a56b0ea620023b
NOTE: recipe expat-2.6.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_patch: Started
NOTE: recipe nettle-3.10-r0: task do_patch: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_unpack: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_fetch: Started
NOTE: recipe expat-2.6.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_fetch: Succeeded
NOTE: recipe libxcrypt-4.4.36-r0: task do_patch: Succeeded
NOTE: recipe glibc-2.40+git-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 909 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_patch)
NOTE: Running task 910 of 1902 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_configure)
NOTE: Running task 915 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_patch)
NOTE: Running task 916 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_unpack)
NOTE: Running task 918 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_fetch)
NOTE: Running task 920 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.5.bb:do_fetch)
NOTE: Running task 922 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_fetch)
NOTE: Running task 926 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_fetch)
NOTE: Running task 928 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_fetch)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_patch: Started
NOTE: recipe base-passwd-3.6.5-r0: task do_fetch: Started
NOTE: recipe mpfr-4.2.1-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_fetch: Started
NOTE: recipe ncurses-6.5-r0: task do_unpack: Started
NOTE: recipe glibc-2.40+git-r0: task do_patch: Started
NOTE: recipe bash-5.2.37-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-native-0.192-r0: task do_configure: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_fetch: Succeeded
NOTE: Running task 932 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_fetch)
NOTE: Running task 933 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_unpack)
NOTE: recipe bash-5.2.37-r0: task do_fetch: Succeeded
NOTE: Running task 934 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_unpack)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_patch: Succeeded
NOTE: recipe libedit-20240808-3.1-r1: task do_fetch: Started
NOTE: Running task 936 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_fetch)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_unpack: Started
NOTE: recipe bash-5.2.37-r0: task do_unpack: Started
NOTE: recipe gdbm-1.24-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 937 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_unpack)
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Started
NOTE: recipe gdbm-1.24-r0: task do_unpack: Started
NOTE: recipe elfutils-0.192-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 938 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_patch)
NOTE: recipe gdbm-1.24-r0: task do_unpack: Succeeded
NOTE: Running task 939 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_patch)
NOTE: recipe elfutils-0.192-r0: task do_patch: Started
NOTE: recipe gdbm-1.24-r0: task do_patch: Started
NOTE: recipe bash-5.2.37-r0: task do_unpack: Succeeded
NOTE: Running task 940 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_patch)
NOTE: recipe bash-5.2.37-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_unpack: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_patch: Succeeded
NOTE: Running task 941 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_patch)
NOTE: Running task 943 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_fetch)
NOTE: recipe ncurses-6.5-r0: task do_unpack: Succeeded
NOTE: Running task 944 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_patch)
NOTE: recipe libedit-20240808-3.1-r1: task do_fetch: Succeeded
NOTE: Running task 950 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_fetch)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_patch: Started
NOTE: recipe libffi-3.4.6-r0: task do_fetch: Started
NOTE: recipe mpfr-4.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 951 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_unpack)
NOTE: recipe ncurses-6.5-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.47.0-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 952 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.0.bb:do_unpack)
NOTE: recipe mpfr-4.2.1-r0: task do_unpack: Started
NOTE: recipe python3-3.13.0-r0: task do_fetch: Started
NOTE: recipe python3-3.13.0-r0: task do_fetch: Succeeded
NOTE: Running task 953 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_fetch)
NOTE: recipe sqlite3-3_3.47.0-r0: task do_unpack: Started
NOTE: recipe sed-4.9-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.47.0-r0: task do_unpack: Succeeded
NOTE: Running task 954 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.0.bb:do_patch)
NOTE: recipe mpfr-4.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 955 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_patch)
NOTE: recipe base-passwd-3.6.5-r0: task do_fetch: Succeeded
NOTE: Running task 956 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.5.bb:do_unpack)
NOTE: recipe sqlite3-3_3.47.0-r0: task do_patch: Started
NOTE: recipe mpfr-4.2.1-r0: task do_patch: Started
NOTE: recipe ncurses-6.5-r0: task do_patch: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_patch: Succeeded
NOTE: Running task 958 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_fetch)
NOTE: Running task 960 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_fetch)
NOTE: recipe base-passwd-3.6.5-r0: task do_unpack: Started
NOTE: recipe elfutils-0.192-r0: task do_patch: Succeeded
NOTE: Running task 961 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_deploy_source_date_epoch)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_patch: Succeeded
NOTE: Running task 963 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe bash-5.2.37-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-3_3.47.0-r0: task do_patch: Succeeded
NOTE: Running task 973 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_unpack)
NOTE: Running task 974 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_unpack)
NOTE: recipe glibc-2.40+git-r0: task do_patch: Succeeded
NOTE: recipe perl-5.40.0-r0: task do_fetch: Started
NOTE: Running task 978 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_unpack)
NOTE: recipe shadow-4.16.0-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe shadow-4.16.0-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.192-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 980 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_unpack: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_unpack: Started
NOTE: Running task 984 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_fetch)
NOTE: recipe base-passwd-3.6.5-r0: task do_unpack: Succeeded
NOTE: Running task 985 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.5.bb:do_patch)
NOTE: recipe libedit-20240808-3.1-r1: task do_unpack: Succeeded
NOTE: Running task 986 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_patch)
NOTE: recipe shadow-4.16.0-r0: task do_unpack: Started
NOTE: recipe python3-3.13.0-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.5-r0: task do_patch: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_patch: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 987 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_unpack)
NOTE: recipe file-5.45-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 988 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_unpack)
NOTE: recipe bash-completion-2.14.0-r0: task do_unpack: Succeeded
NOTE: Running task 989 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_patch)
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 990 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_unpack)
NOTE: recipe libtirpc-1.3.6-r0: task do_unpack: Started
NOTE: recipe file-5.45-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_patch: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Started
NOTE: recipe elfutils-0.192-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_deploy_source_date_epoch unihash changed to c513671a38b0ba495581c8029e9b72fcdeac7ff0ef2dd52d530a3d41ba5aeb68
NOTE: recipe libedit-20240808-3.1-r1: task do_patch: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_patch: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 991 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_patch)
NOTE: Running task 992 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_fetch)
NOTE: Running task 993 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 997 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_fetch)
NOTE: recipe lzlib-1.14-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 998 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_unpack)
NOTE: recipe libtirpc-1.3.6-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe libmnl-1.0.5-r0: task do_fetch: Started
NOTE: recipe readline-8.2.13-r0: task do_fetch: Started
NOTE: recipe lzlib-1.14-r0: task do_unpack: Started
NOTE: recipe lzlib-1.14-r0: task do_unpack: Succeeded
NOTE: Running task 999 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_patch)
NOTE: recipe base-passwd-3.6.5-r0: task do_patch: Succeeded
NOTE: Running task 1001 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_fetch)
NOTE: recipe libtirpc-1.3.6-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1003 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_fetch)
NOTE: Running task 1004 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Succeeded
NOTE: recipe lzlib-1.14-r0: task do_patch: Started
NOTE: Running task 1005 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_patch)
NOTE: recipe iptables-1.8.11-r0: task do_fetch: Started
NOTE: recipe file-5.45-r0: task do_unpack: Succeeded
NOTE: Running task 1006 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_patch)
NOTE: recipe libffi-3.4.6-r0: task do_fetch: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_fetch: Started
NOTE: Running task 1007 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_patch: Started
NOTE: recipe lzlib-1.14-r0: task do_patch: Succeeded
NOTE: Running task 1013 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_fetch)
NOTE: recipe file-5.45-r0: task do_patch: Started
NOTE: recipe perl-5.40.0-r0: task do_fetch: Succeeded
NOTE: Running task 1014 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_unpack)
NOTE: recipe libffi-3.4.6-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1015 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_fetch)
NOTE: recipe libnsl2-2.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1016 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.1.bb:do_fetch)
NOTE: recipe findutils-4.10.0-r0: task do_fetch: Started
NOTE: recipe libffi-3.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 1017 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_patch)
NOTE: recipe perl-5.40.0-r0: task do_unpack: Started
NOTE: recipe util-linux-2.40.2-r0: task do_fetch: Started
NOTE: recipe gawk-5.3.1-r0: task do_fetch: Started
NOTE: recipe file-5.45-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_patch: Started
NOTE: Running task 1035 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: recipe util-linux-2.40.2-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 1043 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_fetch)
NOTE: Running task 1044 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_patch)
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Started
NOTE: recipe libmnl-1.0.5-r0: task do_fetch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Succeeded
NOTE: Running task 1045 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_unpack)
NOTE: Running task 1046 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_fetch)
NOTE: recipe make-4.4.1-r0: task do_fetch: Started
NOTE: recipe shadow-4.16.0-r0: task do_patch: Started
NOTE: recipe libmnl-1.0.5-r0: task do_unpack: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_fetch: Started
NOTE: recipe libffi-3.4.6-r0: task do_patch: Succeeded
NOTE: Running task 1050 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_unpack)
NOTE: recipe libmnl-1.0.5-r0: task do_unpack: Succeeded
NOTE: Running task 1051 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_patch)
NOTE: recipe shadow-4.16.0-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_unpack: Started
NOTE: recipe python3-3.13.0-r0: task do_unpack: Succeeded
NOTE: Running task 1055 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.43.1.bb:do_fetch)
NOTE: Running task 1056 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_patch)
NOTE: recipe libmnl-1.0.5-r0: task do_patch: Started
NOTE: recipe sed-4.9-r0: task do_fetch: Succeeded
NOTE: Running task 1057 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_unpack)
NOTE: recipe binutils-2.43.1-r0: task do_fetch: Started
NOTE: recipe iptables-1.8.11-r0: task do_fetch: Succeeded
NOTE: recipe binutils-2.43.1-r0: task do_fetch: Succeeded
NOTE: Running task 1058 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_unpack)
NOTE: Running task 1065 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcap-ng-0.8.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.13.0-r0: task do_patch: Started
NOTE: recipe libmnl-1.0.5-r0: task do_patch: Succeeded
NOTE: Running task 1066 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_unpack)
NOTE: Running task 1068 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: recipe sed-4.9-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iptables-1.8.11-r0: task do_unpack: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_unpack: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1069 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.11.0.bb:do_fetch)
NOTE: Running task 1070 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe iproute2-6.11.0-r0: task do_fetch: Started
NOTE: recipe iproute2-6.11.0-r0: task do_fetch: Succeeded
NOTE: Running task 1075 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.43.1.bb:do_unpack)
NOTE: recipe sed-4.9-r0: task do_unpack: Succeeded
NOTE: Running task 1076 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe iptables-1.8.11-r0: task do_unpack: Succeeded
NOTE: Running task 1077 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: Running task 1078 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_patch)
NOTE: recipe binutils-2.43.1-r0: task do_unpack: Started
NOTE: recipe perl-5.40.0-r0: task do_unpack: Succeeded
NOTE: recipe sed-4.9-r0: task do_patch: Started
NOTE: Running task 1079 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe util-linux-2.40.2-r0: task do_unpack: Succeeded
NOTE: recipe iptables-1.8.11-r0: task do_patch: Started
NOTE: Running task 1080 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_patch)
NOTE: recipe sed-4.9-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1106 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.11.0.bb:do_unpack)
NOTE: Running task 1107 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe iptables-1.8.11-r0: task do_patch: Succeeded
NOTE: recipe perl-5.40.0-r0: task do_patch: Started
NOTE: recipe util-linux-2.40.2-r0: task do_patch: Started
NOTE: recipe iproute2-6.11.0-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_unpack: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_fetch: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_unpack: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe iproute2-6.11.0-r0: task do_unpack: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1108 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_patch)
NOTE: Running task 1109 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_collect_spdx_deps)
NOTE: Running task 1110 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_unpack)
NOTE: Running task 1111 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_patch)
NOTE: Running task 1112 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_unpack)
NOTE: Running task 1113 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_unpack)
NOTE: Running task 1115 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.11.0.bb:do_patch)
NOTE: Running noexec task 1144 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.2.bb:do_fetch)
NOTE: Running task 1148 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_fetch)
NOTE: recipe perl-5.40.0-r0: task do_patch: Succeeded
NOTE: Running task 1183 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe findutils-4.10.0-r0: task do_fetch: Succeeded
NOTE: Running task 1184 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_unpack)
NOTE: recipe linux-libc-headers-6.12-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_unpack: Started
NOTE: recipe libmpc-1.3.1-r0: task do_unpack: Started
NOTE: recipe readline-8.2.13-r0: task do_unpack: Started
NOTE: recipe iproute2-6.11.0-r0: task do_patch: Started
NOTE: recipe psmisc-23.7-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_patch: Succeeded
NOTE: Running task 1187 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: Running noexec task 1189 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_configure)
NOTE: Running noexec task 1190 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_compile)
NOTE: Running task 1191 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_install)
NOTE: recipe libmpc-1.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 1192 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_unpack: Started
NOTE: recipe readline-8.2.13-r0: task do_unpack: Succeeded
NOTE: Running task 1193 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_patch)
NOTE: recipe iproute2-6.11.0-r0: task do_patch: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_patch: Started
NOTE: recipe elfutils-0.192-r0: task do_populate_lic: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_install: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_patch: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_patch: Started
NOTE: recipe python3-3.13.0-r0: task do_patch: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_patch: Succeeded
NOTE: recipe elfutils-0.192-r0: task do_populate_lic: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_unpack: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_populate_lic unihash changed to ccabe8bd2b1468658079ebd3ab10a396a9ee52da1f6d035eff365994a4fd538e
NOTE: Running task 1198 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_patch: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1201 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_patch)
NOTE: recipe findutils-4.10.0-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_patch: Started
NOTE: recipe findutils-4.10.0-r0: task do_patch: Succeeded
NOTE: recipe make-4.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 1203 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_unpack)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_patch: Succeeded
NOTE: recipe make-4.4.1-r0: task do_unpack: Started
NOTE: recipe make-4.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 1205 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_patch)
NOTE: recipe make-4.4.1-r0: task do_patch: Started
NOTE: recipe make-4.4.1-r0: task do_patch: Succeeded
NOTE: recipe gawk-5.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 1207 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.1.bb:do_unpack)
NOTE: recipe gawk-5.3.1-r0: task do_unpack: Started
NOTE: recipe gawk-5.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 1208 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.1.bb:do_patch)
NOTE: recipe gawk-5.3.1-r0: task do_patch: Started
NOTE: recipe gawk-5.3.1-r0: task do_patch: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_fetch: Succeeded
NOTE: Running task 1210 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_unpack)
NOTE: recipe psmisc-23.7-r0: task do_unpack: Started
NOTE: recipe psmisc-23.7-r0: task do_unpack: Succeeded
NOTE: Running task 1211 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_patch)
NOTE: recipe binutils-2.43.1-r0: task do_unpack: Succeeded
NOTE: Running task 1212 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.43.1.bb:do_patch)
NOTE: recipe psmisc-23.7-r0: task do_patch: Started
NOTE: recipe binutils-2.43.1-r0: task do_patch: Started
NOTE: recipe psmisc-23.7-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_install: Succeeded
NOTE: Running task 1228 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_prepare_recipe_sysroot)
NOTE: recipe glibc-2.40+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glibc-2.40+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1229 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_configure)
NOTE: recipe glibc-2.40+git-r0: task do_configure: Started
NOTE: recipe binutils-2.43.1-r0: task do_patch: Succeeded
NOTE: recipe glibc-2.40+git-r0: task do_configure: Succeeded
NOTE: Running task 1231 of 1902 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_compile)
NOTE: recipe glibc-2.40+git-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext-minimal-native_0.22.5.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-native_2.5.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.68.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf_2.72e.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/automake/automake_1.17.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.7.bb:do_populate_sysroot', 'vir
 tual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.0.bb:do_populate_sysroot']
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
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/elfutils-native/0.192/temp/run.do_configure.528522:285 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/elfutils-native/0.192/temp/run.do_configure.528522, line 285
| 	#2: oe_runconf, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/elfutils-native/0.192/temp/run.do_configure.528522, line 261
| 	#3: autotools_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/elfutils-native/0.192/temp/run.do_configure.528522, line 231
| 	#4: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/elfutils-native/0.192/temp/run.do_configure.528522, line 151
| 	#5: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/elfutils-native/0.192/temp/run.do_configure.528522, line 289
NOTE: recipe elfutils-native-0.192-r0: task do_configure: Failed
NOTE: recipe glibc-2.40+git-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1231 tasks of which 1025 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241201065314.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241201065314.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/elfutils-native/0.192/temp/log.do_configure.528522
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: elfutils-native-0.192-r0 do_configure: configure failed
ERROR: elfutils-native-0.192-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/elfutils-native/0.192/temp/run.do_configure.528522' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/elfutils-native/0.192/temp/log.do_configure.528522
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_configure) failed with exit code '1'

--===============7502339287187537768==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-elfutils-upgrade-0.191-0.192.patch"

RnJvbSAzYjg1MzljZDYwMjUxNDk3ODg4YjAxYTM2M2YzZGZhNDUwYTI5YmY5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBEZWMgMjAyNCAwNjo1NDozOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGVs
ZnV0aWxzOiB1cGdyYWRlIDAuMTkxIC0+IDAuMTkyCgotLS0KIC4uLi97ZWxmdXRpbHNfMC4xOTEu
YmIgPT4gZWxmdXRpbHNfMC4xOTIuYmJ9ICB8IDI3ICsrKysrKysrKysrLS0tCiAuLi4wMS1kZWJ1
Z2luZm9kLVJlbW92ZS11bnVzZWQtdmFyaWFibGUucGF0Y2ggfCAzNCAtLS0tLS0tLS0tLS0tLS0t
LS0KIC4uLi9lbGZ1dGlscy9maWxlcy8wMDAxLWRzby1saW5rLWNoYW5nZS5wYXRjaCB8IDEyICsr
Ky0tLS0KIC4uLmxpYmFzbS1tYXktbGluay13aXRoLWxpYmJ6Mi1pZi1mb3VuZC5wYXRjaCB8ICA4
ICsrLS0tCiAuLi4tY2hlY2stZGF0YV9saXN0LmRhdGEuZC5kX2J1Zi1iZWZvcmUucGF0Y2ggfCAg
NiArKy0tCiAuLi4tc2tpcC10aGUtdGVzdC13aGVuLWdjYy1ub3QtZGVwbG95ZWQucGF0Y2ggfCAg
MiArLQogLi4uaWxlcy1maXgtdW51c2VkLXZhcmlhYmxlLUJVRkZFUl9TSVpFLnBhdGNoIHwgMzYg
LS0tLS0tLS0tLS0tLS0tLS0tLQogLi4ubS1jb21waWxlLXRlc3Rfbmxpc3Qtd2l0aC1zdGFuZGFy
ZC1DLnBhdGNoIHwgIDYgKystLQogLi4uY3Z0X2d1bmhhc2gtaWYtZGVzdC1hbmQtc3JjLWFyZS1z
YW1lLnBhdGNoIHwgIDIgKy0KIC4uLi9lbGZ1dGlscy9maWxlcy8wMDAzLWZpeGhlYWRlcmNoZWNr
LnBhdGNoICB8ICAyICstCiAuLi4vZWxmdXRpbHMvZmlsZXMvMDAwMy1tdXNsLXV0aWxzLnBhdGNo
ICAgICAgfCAgNCArLS0KIC4uLi9lbGZ1dGlscy9maWxlcy9wdGVzdC5wYXRjaCAgICAgICAgICAg
ICAgICB8IDEyICsrKy0tLS0KIDEyIGZpbGVzIGNoYW5nZWQsIDUwIGluc2VydGlvbnMoKyksIDEw
MSBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMve2Vs
ZnV0aWxzXzAuMTkxLmJiID0+IGVsZnV0aWxzXzAuMTkyLmJifSAoOTAlKQogZGVsZXRlIG1vZGUg
MTAwNjQ0IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDAxLWRlYnVnaW5m
b2QtUmVtb3ZlLXVudXNlZC12YXJpYWJsZS5wYXRjaAogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDAxLXNyY2ZpbGVzLWZpeC11bnVzZWQt
dmFyaWFibGUtQlVGRkVSX1NJWkUucGF0Y2gKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZWxmdXRpbHMvZWxmdXRpbHNfMC4xOTEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
ZWxmdXRpbHMvZWxmdXRpbHNfMC4xOTIuYmIKc2ltaWxhcml0eSBpbmRleCA5MCUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2VsZnV0aWxzXzAuMTkxLmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZWxmdXRpbHNfMC4xOTIuYmIKaW5k
ZXggOTUzNjRjZWY5Ny4uNjMyMjM2Yzg4MSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2VsZnV0aWxzL2VsZnV0aWxzXzAuMTkxLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9lbGZ1dGlscy9lbGZ1dGlsc18wLjE5Mi5iYgpAQCAtMSwxMCArMSwzMCBAQAorIyBGSVhNRTog
dGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29s
IHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhl
IG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VO
U0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBj
b21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xp
Y2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdl
czoKKyMKKyMgLS0tIGRlYnVnaW5mb2QvZGVidWdpbmZvZC1jbGllbnQuYworIyArKysgZGVidWdp
bmZvZC9kZWJ1Z2luZm9kLWNsaWVudC5jCisjIEBAIC0xLDUgKzEsNSBAQAorIyAgLyogUmV0cmll
dmUgRUxGIC8gRFdBUkYgLyBzb3VyY2UgZmlsZXMgZnJvbSB0aGUgZGVidWdpbmZvZC4KKyMgLSAg
IENvcHlyaWdodCAoQykgMjAxOS0yMDIxIFJlZCBIYXQsIEluYy4KKyMgKyAgIENvcHlyaWdodCAo
QykgMjAxOS0yMDI0IFJlZCBIYXQsIEluYy4KKyMgICAgIENvcHlyaWdodCAoQykgMjAyMSwgMjAy
MiBNYXJrIEouIFdpZWxhYXJkIDxtYXJrQGtsb21wLm9yZz4KKyMgICAgIFRoaXMgZmlsZSBpcyBw
YXJ0IG9mIGVsZnV0aWxzLgorIyAgCisjIAorIworCiBTVU1NQVJZID0gIlV0aWxpdGllcyBhbmQg
bGlicmFyaWVzIGZvciBoYW5kbGluZyBjb21waWxlZCBvYmplY3QgZmlsZXMiCiBIT01FUEFHRSA9
ICJodHRwczovL3NvdXJjZXdhcmUub3JnL2VsZnV0aWxzIgogREVTQ1JJUFRJT04gPSAiZWxmdXRp
bHMgaXMgYSBjb2xsZWN0aW9uIG9mIHV0aWxpdGllcyBhbmQgbGlicmFyaWVzIHRvIHJlYWQsIGNy
ZWF0ZSBhbmQgbW9kaWZ5IEVMRiBiaW5hcnkgZmlsZXMsIGZpbmQgYW5kIGhhbmRsZSBEV0FSRiBk
ZWJ1ZyBkYXRhLCBzeW1ib2xzLCB0aHJlYWQgc3RhdGUgYW5kIHN0YWNrdHJhY2VzIGZvciBwcm9j
ZXNzZXMgYW5kIGNvcmUgZmlsZXMgb24gR05VL0xpbnV4LiIKIFNFQ1RJT04gPSAiYmFzZSIKIExJ
Q0VOU0UgPSAiKCBHUEwtMi4wLW9yLWxhdGVyIHwgTEdQTC0zLjAtb3ItbGF0ZXIgKSAmIEdQTC0z
LjAtb3ItbGF0ZXIiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1kMzIy
MzliY2I2NzM0NjNhYjg3NGU4MGQ0N2ZhZTUwNCBcCi0gICAgICAgICAgICAgICAgICAgIGZpbGU6
Ly9kZWJ1Z2luZm9kL2RlYnVnaW5mb2QtY2xpZW50LmM7ZW5kbGluZT0yODttZDU9ZjBhN2MzMTcw
Nzc2ODY2ZWU5NGU4ZjkyMjVhNmFkNzkgXAorICAgICAgICAgICAgICAgICAgICBmaWxlOi8vZGVi
dWdpbmZvZC9kZWJ1Z2luZm9kLWNsaWVudC5jO2VuZGxpbmU9Mjg7bWQ1PTZiN2IwYTRiMjUxOTdk
N2YyZTEyYjJmNGFhMWM4NmI4IFwKICAgICAgICAgICAgICAgICAgICAgIgogREVQRU5EUyA9ICJ6
bGliIHZpcnR1YWwvbGliaW50bCIKIERFUEVORFM6YXBwZW5kOmxpYmMtbXVzbCA9ICIgYXJncC1z
dGFuZGFsb25lIGZ0cyBtdXNsLWxlZ2FjeS1lcnJvciBtdXNsLW9ic3RhY2siCkBAIC0yMCwxMyAr
NDAsMTIgQEAgU1JDX1VSSSA9ICJodHRwczovL3NvdXJjZXdhcmUub3JnL2VsZnV0aWxzL2Z0cC8k
e1BWfS8ke0JQfS50YXIuYnoyIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtc2tpcC10aGUtdGVz
dC13aGVuLWdjYy1ub3QtZGVwbG95ZWQucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vcHRlc3Qu
cGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwMS10ZXN0cy1NYWtlZmlsZS5hbS1jb21waWxl
LXRlc3Rfbmxpc3Qtd2l0aC1zdGFuZGFyZC1DLnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovLzAw
MDEtZGVidWdpbmZvZC1SZW1vdmUtdW51c2VkLXZhcmlhYmxlLnBhdGNoIFwKLSAgICAgICAgICAg
ZmlsZTovLzAwMDEtc3JjZmlsZXMtZml4LXVudXNlZC12YXJpYWJsZS1CVUZGRVJfU0laRS5wYXRj
aCBcCisgICAgICAgICAgIGZpbGU6Ly8wMDAzLW11c2wtdXRpbHMucGF0Y2ggXAogICAgICAgICAg
ICAiCiBTUkNfVVJJOmFwcGVuZDpsaWJjLW11c2wgPSAiIFwKICAgICAgICAgICAgZmlsZTovLzAw
MDMtbXVzbC11dGlscy5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9
ICJkZjc2ZGI3MTM2NmQxZDcwODM2NWZjN2E2YzYwY2E0ODM5OGYxNDM2N2ViMmI4OTU0ZWZjODg5
NzE0N2FkODcxIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjYxNjA5OWJlYWUyNGFiYTExZjliNjNk
ODZjYTZjYzhkNTY2ZDk2OGI4MDIzOTEzMzRjOTFkZjU0ZWFiNDE2YjQiCiAKIGluaGVyaXQgYXV0
b3Rvb2xzIGdldHRleHQgcHRlc3QgcGtnY29uZmlnCiAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDAxLWRlYnVnaW5mb2QtUmVtb3ZlLXVudXNlZC12
YXJpYWJsZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDAx
LWRlYnVnaW5mb2QtUmVtb3ZlLXVudXNlZC12YXJpYWJsZS5wYXRjaApkZWxldGVkIGZpbGUgbW9k
ZSAxMDA2NDQKaW5kZXggODFmNDlkYmYyMS4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMvMDAwMS1kZWJ1Z2luZm9kLVJlbW92ZS11bnVzZWQtdmFy
aWFibGUucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwzNCArMCwwIEBACi1Gcm9tIGMzNTAyMTQw
ZTUxODg2YmZmYzZhZTVjZDI1NjMwOGU0MGUwY2JiNzggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
Ci1Gcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgotRGF0ZTogU2F0LCA5IE1hciAy
MDI0IDE1OjUyOjMyIC0wODAwCi1TdWJqZWN0OiBbUEFUQ0hdIGRlYnVnaW5mb2Q6IFJlbW92ZSB1
bnVzZWQgdmFyaWFibGUKLQotUmVjZW50IGNvbW1pdCBhY2Q5NTI1ZTkgaGFzIHJlbW92ZWQgYWxs
IHJlZmVyZW5jZXMgdG8gbWF4X2ZkcwotdGhlcmVmb3JlIHJlbW92ZSBpdCwgbW9yZW92ZXIgY2xh
bmcxOCBpcyBoYXBwaWVyCi0KLXwgLi4vLi4vZWxmdXRpbHMtMC4xOTEvZGVidWdpbmZvZC9kZWJ1
Z2luZm9kLmN4eDoxNDQ4Ojg6IGVycm9yOiBwcml2YXRlIGZpZWxkICdtYXhfZmRzJyBpcyBub3Qg
dXNlZCBbLVdlcnJvciwtV3VudXNlZC1wcml2YXRlLWZpZWxkXQotfCAgMTQ0OCB8ICAgbG9uZyBt
YXhfZmRzOwotfCAgICAgICB8ICAgICAgICBeCi18IDEgZXJyb3IgZ2VuZXJhdGVkLgotCi1VcHN0
cmVhbS1TdGF0dXM6IFN1Ym1pdHRlZCBbaHR0cHM6Ly9zb3VyY2V3YXJlLm9yZy9waXBlcm1haWwv
ZWxmdXRpbHMtZGV2ZWwvMjAyNHExLzAwNjkwMC5odG1sXQotU2lnbmVkLW9mZi1ieTogS2hlbSBS
YWogPHJhai5raGVtQGdtYWlsLmNvbT4KLS0tLQotIGRlYnVnaW5mb2QvZGVidWdpbmZvZC5jeHgg
fCAxIC0KLSAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQotCi1kaWZmIC0tZ2l0IGEvZGVi
dWdpbmZvZC9kZWJ1Z2luZm9kLmN4eCBiL2RlYnVnaW5mb2QvZGVidWdpbmZvZC5jeHgKLWluZGV4
IDU2MDg4MGYyLi43MjYxNzg0OCAxMDA2NDQKLS0tLSBhL2RlYnVnaW5mb2QvZGVidWdpbmZvZC5j
eHgKLSsrKyBiL2RlYnVnaW5mb2QvZGVidWdpbmZvZC5jeHgKLUBAIC0xNDQ1LDcgKzE0NDUsNiBA
QCBwcml2YXRlOgotIAotICAgbWFwPGtleSxmZGNhY2hlX2VudHJ5PiBlbnRyaWVzOyAvLyBvcHRp
bWl6ZWQgZm9yIGxvb2t1cAotICAgdGltZV90IGxhc3RfY2xlYW5pbmc7Ci0tICBsb25nIG1heF9m
ZHM7Ci0gICBsb25nIG1heF9tYnM7Ci0gCi0gcHVibGljOgotLS0gCi0yLjQ0LjAKLQpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2ZpbGVzLzAwMDEtZHNvLWxpbmst
Y2hhbmdlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2ZpbGVzLzAwMDEt
ZHNvLWxpbmstY2hhbmdlLnBhdGNoCmluZGV4IDRmNzUzOWJlZjIuLjViN2IwOTMxOTYgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDAxLWRzby1saW5r
LWNoYW5nZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMv
MDAwMS1kc28tbGluay1jaGFuZ2UucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDYzMDcwZGY0
YjBkYzdhZjM3YTcyMDkxNWI1ZTY0OTQyMDQ0NjNjOWEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIGUyZGI1OWU3NzE5NmNhM2RjNGM5OWE5ZmMzZGYyMTQ1YzA4ZDMyYjQgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBIb25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5j
b20+CiBEYXRlOiBUdWUsIDE1IEF1ZyAyMDE3IDE3OjEwOjU3ICswODAwCiBTdWJqZWN0OiBbUEFU
Q0hdIGRzbyBsaW5rIGNoYW5nZQpAQCAtMjIsMTAgKzIyLDEwIEBAIFNpZ25lZC1vZmYtYnk6IEhv
bmd4dSBKaWEgPGhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbT4KICAyIGZpbGVzIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL3NyYy9NYWtlZmls
ZS5hbSBiL3NyYy9NYWtlZmlsZS5hbQotaW5kZXggMWQ1OTJkNC4uODUzZWRhNCAxMDA2NDQKK2lu
ZGV4IDZiZGYyZGYuLjNiY2VlM2MgMTAwNjQ0CiAtLS0gYS9zcmMvTWFrZWZpbGUuYW0KICsrKyBi
L3NyYy9NYWtlZmlsZS5hbQotQEAgLTUwLDcgKzUwLDcgQEAgbGliZGVidWdpbmZvZCA9CitAQCAt
NTYsNyArNTYsNyBAQCBsaWJkZWJ1Z2luZm9kID0KICBlbmRpZgogIGVsc2UKICBsaWJhc20gPSAu
Li9saWJhc20vbGliYXNtLnNvCkBAIC0zNSwxMSArMzUsMTEgQEAgaW5kZXggMWQ1OTJkNC4uODUz
ZWRhNCAxMDA2NDQKICBpZiBMSUJERUJVR0lORk9ECiAgbGliZGVidWdpbmZvZCA9IC4uL2RlYnVn
aW5mb2QvbGliZGVidWdpbmZvZC5zbwogZGlmZiAtLWdpdCBhL3Rlc3RzL01ha2VmaWxlLmFtIGIv
dGVzdHMvTWFrZWZpbGUuYW0KLWluZGV4IDkxNDEwNzQuLmVlNDlkMDcgMTAwNjQ0CitpbmRleCA3
NmYxNjgyLi44NjVhNjA0IDEwMDY0NAogLS0tIGEvdGVzdHMvTWFrZWZpbGUuYW0KICsrKyBiL3Rl
c3RzL01ha2VmaWxlLmFtCi1AQCAtNjk0LDcgKzY5NCw3IEBAIGxpYmR3ID0gLi4vbGliZHcvbGli
ZHcuYSAtbHogJCh6aXBfTElCUykgJChsaWJlbGYpICQobGliZWJsKSAtbGRsIC1scHRocmVhZAot
IGxpYmVsZiA9IC4uL2xpYmVsZi9saWJlbGYuYSAtbHogJCh6c3RkX0xJQlMpCitAQCAtNzMzLDcg
KzczMyw3IEBAIGxpYmR3ID0gLi4vbGliZHcvbGliZHcuYSAtbHogJCh6aXBfTElCUykgJChsaWJl
bGYpICQobGliZWJsKSAtbGRsIC1scHRocmVhZAorIGxpYmVsZiA9IC4uL2xpYmVsZi9saWJlbGYu
YSAtbHogJCh6c3RkX0xJQlMpICQobGliZXUpCiAgbGliYXNtID0gLi4vbGliYXNtL2xpYmFzbS5h
CiAgZWxzZQogLWxpYmR3ID0gLi4vbGliZHcvbGliZHcuc28KZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDAxLWxpYmFzbS1tYXktbGluay13aXRoLWxp
YmJ6Mi1pZi1mb3VuZC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxl
cy8wMDAxLWxpYmFzbS1tYXktbGluay13aXRoLWxpYmJ6Mi1pZi1mb3VuZC5wYXRjaAppbmRleCBh
OWY1ZTAzMGZjLi4wOTI2NWZmNTVmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
ZWxmdXRpbHMvZmlsZXMvMDAwMS1saWJhc20tbWF5LWxpbmstd2l0aC1saWJiejItaWYtZm91bmQu
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2ZpbGVzLzAwMDEtbGli
YXNtLW1heS1saW5rLXdpdGgtbGliYnoyLWlmLWZvdW5kLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAot
RnJvbSA0NmQ5ZDg4OWEwN2ZjOWY5ZjA4OWY4MDBlNWMwZTg5NTg4OWM0NGFlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSAyNjAwNjYxMWVmYzdhMzkzZmRhZDliZWMwOTc2MmRmNzhjZjJl
OTUyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdt
YWlsLmNvbT4KIERhdGU6IFdlZCwgNCBPY3QgMjAxNyAyMjozMDo0NiAtMDcwMAogU3ViamVjdDog
W1BBVENIXSBsaWJhc20gbWF5IGxpbmsgd2l0aCBsaWJiejIgaWYgZm91bmQKQEAgLTE2LDEwICsx
NiwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1n
aXQgYS9zcmMvTWFrZWZpbGUuYW0gYi9zcmMvTWFrZWZpbGUuYW0KLWluZGV4IDg1M2VkYTQuLmRh
N2YzYjQgMTAwNjQ0CitpbmRleCAzYmNlZTNjLi4xOGVlZDlhIDEwMDY0NAogLS0tIGEvc3JjL01h
a2VmaWxlLmFtCiArKysgYi9zcmMvTWFrZWZpbGUuYW0KLUBAIC00MCw3ICs0MCw3IEBAIEVYVFJB
X0RJU1QgKz0gbWFrZS1kZWJ1Zy1hcmNoaXZlLmluCitAQCAtNDYsNyArNDYsNyBAQCBFWFRSQV9E
SVNUICs9IG1ha2UtZGVidWctYXJjaGl2ZS5pbgogIENMRUFORklMRVMgKz0gbWFrZS1kZWJ1Zy1h
cmNoaXZlCiAgCiAgaWYgQlVJTERfU1RBVElDCkBAIC0yOCw3ICsyOCw3IEBAIGluZGV4IDg1M2Vk
YTQuLmRhN2YzYjQgMTAwNjQ0CiAgbGliZHcgPSAuLi9saWJkdy9saWJkdy5hIC1seiAkKHppcF9M
SUJTKSAkKGxpYmVsZikgLWxkbCAtbHB0aHJlYWQKICBsaWJlbGYgPSAuLi9saWJlbGYvbGliZWxm
LmEgLWx6ICQoenN0ZF9MSUJTKQogIGlmIExJQkRFQlVHSU5GT0QKLUBAIC00OSw3ICs0OSw3IEBA
IGVsc2UKK0BAIC01NSw3ICs1NSw3IEBAIGVsc2UKICBsaWJkZWJ1Z2luZm9kID0KICBlbmRpZgog
IGVsc2UKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8w
MDAxLWxpYmVsZi1lbGZfZW5kLmMtY2hlY2stZGF0YV9saXN0LmRhdGEuZC5kX2J1Zi1iZWZvcmUu
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMvMDAwMS1saWJlbGYt
ZWxmX2VuZC5jLWNoZWNrLWRhdGFfbGlzdC5kYXRhLmQuZF9idWYtYmVmb3JlLnBhdGNoCmluZGV4
IDU3ZTRiMzg5MGEuLjg1NDI3ZThlMzAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9lbGZ1dGlscy9maWxlcy8wMDAxLWxpYmVsZi1lbGZfZW5kLmMtY2hlY2stZGF0YV9saXN0LmRh
dGEuZC5kX2J1Zi1iZWZvcmUucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0
aWxzL2ZpbGVzLzAwMDEtbGliZWxmLWVsZl9lbmQuYy1jaGVjay1kYXRhX2xpc3QuZGF0YS5kLmRf
YnVmLWJlZm9yZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMTlkOWU5ZDgzOGU3NGU0YTBh
MjJmMDhhZTAzMTY3MzgwZjhhYTQ5MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMzUy
NTc4ZDdmYzBmN2JhYzRjNjNmYjViM2JkZTY1ZDQ4NTJiM2Q3MCBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IFJvYmVydCBZYW5nIDxsaWV6aGkueWFuZ0B3aW5kcml2ZXIuY29tPgogRGF0
ZTogVGh1LCAxNiBBdWcgMjAxOCAwOTo1ODoyNiArMDgwMAogU3ViamVjdDogW1BBVENIXSBsaWJl
bGYvZWxmX2VuZC5jOiBjaGVjayBkYXRhX2xpc3QuZGF0YS5kLmRfYnVmIGJlZm9yZSBmcmVlIGl0
CkBAIC0xOSwxMCArMTksMTAgQEAgU2lnbmVkLW9mZi1ieTogUm9iZXJ0IFlhbmcgPGxpZXpoaS55
YW5nQHdpbmRyaXZlci5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL2xpYmVsZi9lbGZfZW5kLmMgYi9saWJlbGYvZWxm
X2VuZC5jCi1pbmRleCA4MGY0ZDEzLi5iMTAzOTU5IDEwMDY0NAoraW5kZXggZGE4ZjNhMi4uODU1
NzY1OCAxMDA2NDQKIC0tLSBhL2xpYmVsZi9lbGZfZW5kLmMKICsrKyBiL2xpYmVsZi9lbGZfZW5k
LmMKLUBAIC0xNjksMTQgKzE2OSwxNiBAQCBlbGZfZW5kIChFbGYgKmVsZikKK0BAIC0xNzAsMTQg
KzE3MCwxNiBAQCBlbGZfZW5kIChFbGYgKmVsZikKICAJCSAgIGFyY2hpdGVjdHVyZSBkb2Vzbid0
IHJlcXVpcmUgb3Zlcmx5IHN0cmluZ2VudAogIAkJICAgYWxpZ25tZW50IHRoZSByYXcgZGF0YSBi
dWZmZXIgaXMgdGhlIHNhbWUgYXMgdGhlCiAgCQkgICBvbmUgdXNlZCBmb3IgcHJlc2VudGluZyB0
byB0aGUgY2FsbGVyLiAgKi8KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1
dGlscy9maWxlcy8wMDAxLXNraXAtdGhlLXRlc3Qtd2hlbi1nY2Mtbm90LWRlcGxveWVkLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2ZpbGVzLzAwMDEtc2tpcC10aGUtdGVz
dC13aGVuLWdjYy1ub3QtZGVwbG95ZWQucGF0Y2gKaW5kZXggMDk2MzYxZTIxNS4uZjEyMDEyMmJh
MyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2ZpbGVzLzAwMDEt
c2tpcC10aGUtdGVzdC13aGVuLWdjYy1ub3QtZGVwbG95ZWQucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2VsZnV0aWxzL2ZpbGVzLzAwMDEtc2tpcC10aGUtdGVzdC13aGVuLWdjYy1u
b3QtZGVwbG95ZWQucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGY5YWI1NDQ1NDAwMGZkMjEw
ZGJhYTkyY2Y1MTYwODRkMDUwNjBmOWQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDYz
MDRlODQ5N2RhMTZmODlmODBmY2E1MmJkMTdmYjlkZmJhYzU5ZjIgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCiBGcm9tOiBNaW5nbGkgWXUgPE1pbmdsaS5ZdUB3aW5kcml2ZXIuY29tPgogRGF0ZTog
VHVlLCAyMSBNYXkgMjAxOSAxNToyMDozNCArMDgwMAogU3ViamVjdDogW1BBVENIXSBza2lwIHRo
ZSB0ZXN0IHdoZW4gZ2NjIG5vdCBkZXBsb3llZApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2VsZnV0aWxzL2ZpbGVzLzAwMDEtc3JjZmlsZXMtZml4LXVudXNlZC12YXJpYWJsZS1C
VUZGRVJfU0laRS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8w
MDAxLXNyY2ZpbGVzLWZpeC11bnVzZWQtdmFyaWFibGUtQlVGRkVSX1NJWkUucGF0Y2gKZGVsZXRl
ZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IGIzMDMyMzI3YTIuLjAwMDAwMDAwMDAKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2ZpbGVzLzAwMDEtc3JjZmlsZXMtZml4LXVudXNl
ZC12YXJpYWJsZS1CVUZGRVJfU0laRS5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDM2ICswLDAg
QEAKLUZyb20gZGI1MWE1NWE4ZTM4MTFkMTkyNjViZjEyZDJmZjcxNWM2Y2Y1NThiNCBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEpvc2UgUXVhcmVzbWEgPGpvc2UucXVhcmVzbWFAZm91
bmRyaWVzLmlvPgotRGF0ZTogVHVlLCAxOSBNYXIgMjAyNCAxMDoxNzo1OSArMDAwMAotU3ViamVj
dDogW1BBVENIXSBzcmNmaWxlczogZml4IHVudXNlZCB2YXJpYWJsZSBCVUZGRVJfU0laRQotCi1U
aGUgY29uc3QgdmFyaWFibGUgQlVGRkVSX1NJWkUgaXMgdXNlZCBvbmx5IG9uIHRoZSB6aXBfZmls
ZXMKLWZ1bmN0aW9uIHdpdGNoIGlzIG9ubHkgYXZhaWxhYmxlIHdpdGggTElCQVJDSElWRS4KLQot
fCAuLi8uLi9lbGZ1dGlscy0wLjE5MS9zcmMvc3JjZmlsZXMuY3h4OjgxOjE4OiBlcnJvcjogdW51
c2VkIHZhcmlhYmxlICdCVUZGRVJfU0laRScgWy1XZXJyb3IsLVd1bnVzZWQtY29uc3QtdmFyaWFi
bGVdCi18ICAgIDgxIHwgY29uc3RleHByIHNpemVfdCBCVUZGRVJfU0laRSA9IDgxOTI7Ci18ICAg
ICAgIHwgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fgotCi1VcHN0cmVhbS1TdGF0dXM6IEJh
Y2twb3J0IFtodHRwczovL3NvdXJjZXdhcmUub3JnL2dpdC8/cD1lbGZ1dGlscy5naXQ7YT1jb21t
aXRkaWZmO2g9ZWY4YTRiODQxYWFmMjYzMjZiODk2MWE2NTFkYmU5MTVkNTRkMjNlN10KLQotU2ln
bmVkLW9mZi1ieTogSm9zZSBRdWFyZXNtYSA8am9zZS5xdWFyZXNtYUBmb3VuZHJpZXMuaW8+Ci0t
LS0KLSBzcmMvc3JjZmlsZXMuY3h4IHwgMiArKwotIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKykKLQotZGlmZiAtLWdpdCBhL3NyYy9zcmNmaWxlcy5jeHggYi9zcmMvc3JjZmlsZXMuY3h4
Ci1pbmRleCA4OTI3MzdjYy4uMDlkNTBmOGQgMTAwNjQ0Ci0tLS0gYS9zcmMvc3JjZmlsZXMuY3h4
Ci0rKysgYi9zcmMvc3JjZmlsZXMuY3h4Ci1AQCAtNzgsNyArNzgsOSBAQCBBUkdQX1BST0dSQU1f
VkVSU0lPTl9IT09LX0RFRiA9IHByaW50X3ZlcnNpb247Ci0gLyogQnVnIHJlcG9ydCBhZGRyZXNz
LiAgKi8KLSBBUkdQX1BST0dSQU1fQlVHX0FERFJFU1NfREVGID0gUEFDS0FHRV9CVUdSRVBPUlQ7
Ci0gCi0rI2lmZGVmIEhBVkVfTElCQVJDSElWRQotIGNvbnN0ZXhwciBzaXplX3QgQlVGRkVSX1NJ
WkUgPSA4MTkyOwotKyNlbmRpZgotIAotIC8qIERlZmluaXRpb25zIG9mIGFyZ3VtZW50cyBmb3Ig
YXJncCBmdW5jdGlvbnMuICAqLwotIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYXJncF9vcHRpb24gb3B0
aW9uc1tdID0KLS0tIAotMi40NC4wCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9lbGZ1dGlscy9maWxlcy8wMDAxLXRlc3RzLU1ha2VmaWxlLmFtLWNvbXBpbGUtdGVzdF9ubGlz
dC13aXRoLXN0YW5kYXJkLUMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMv
ZmlsZXMvMDAwMS10ZXN0cy1NYWtlZmlsZS5hbS1jb21waWxlLXRlc3Rfbmxpc3Qtd2l0aC1zdGFu
ZGFyZC1DLnBhdGNoCmluZGV4IGQ0MTBlYjEzZDguLjY5NTNkZTRkZWEgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDAxLXRlc3RzLU1ha2VmaWxlLmFt
LWNvbXBpbGUtdGVzdF9ubGlzdC13aXRoLXN0YW5kYXJkLUMucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2VsZnV0aWxzL2ZpbGVzLzAwMDEtdGVzdHMtTWFrZWZpbGUuYW0tY29tcGls
ZS10ZXN0X25saXN0LXdpdGgtc3RhbmRhcmQtQy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20g
MmQ0ZGZiODE0ZGRhMDIxOTNlNDljOTIwMzE0N2NmNzNlNmQzZjhiNyBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb20gNjgzY2YxMzAwODJhNzNjNjE0MDY1MGYxOGFhZjE4ODc1YTM4ODEzMiBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4Lmth
bmF2aW5AZ21haWwuY29tPgogRGF0ZTogVHVlLCAyMyBKdW4gMjAyMCAwNzo0OTozNSArMDAwMAog
U3ViamVjdDogW1BBVENIXSB0ZXN0cy9NYWtlZmlsZS5hbTogY29tcGlsZSB0ZXN0X25saXN0IHdp
dGggc3RhbmRhcmQgQ0ZMQUdTCkBAIC0xMywxMCArMTMsMTAgQEAgU2lnbmVkLW9mZi1ieTogQWxl
eGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS90ZXN0cy9NYWtl
ZmlsZS5hbSBiL3Rlc3RzL01ha2VmaWxlLmFtCi1pbmRleCAzYmQ4ZTU4Li4zNzBjNmE4IDEwMDY0
NAoraW5kZXggZWVkOWJkNC4uNWRkNmUwNSAxMDA2NDQKIC0tLSBhL3Rlc3RzL01ha2VmaWxlLmFt
CiArKysgYi90ZXN0cy9NYWtlZmlsZS5hbQotQEAgLTEwMyw3ICsxMDMsNyBAQCBlbmRpZgorQEAg
LTEwNCw3ICsxMDQsNyBAQCBlbmRpZgogIHRlc3Qtbmxpc3QkKEVYRUVYVCk6IHRlc3Qtbmxpc3Qu
YwogIAkkKEFNX1ZfQ0MpJChDQykgJChERUZTKSAkKERFRkFVTFRfSU5DTFVERVMpICQoSU5DTFVE
RVMpIFwKICAJICAkKEFNX0NQUEZMQUdTKSAkKENQUEZMQUdTKSBcCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMvMDAwMi1GaXgtZWxmX2N2dF9ndW5oYXNo
LWlmLWRlc3QtYW5kLXNyYy1hcmUtc2FtZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9l
bGZ1dGlscy9maWxlcy8wMDAyLUZpeC1lbGZfY3Z0X2d1bmhhc2gtaWYtZGVzdC1hbmQtc3JjLWFy
ZS1zYW1lLnBhdGNoCmluZGV4IGZhMjI4MmI4ZGQuLjYyMmViYWQ5MjkgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDAyLUZpeC1lbGZfY3Z0X2d1bmhh
c2gtaWYtZGVzdC1hbmQtc3JjLWFyZS1zYW1lLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9lbGZ1dGlscy9maWxlcy8wMDAyLUZpeC1lbGZfY3Z0X2d1bmhhc2gtaWYtZGVzdC1hbmQt
c3JjLWFyZS1zYW1lLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBkOGYwN2EyM2Q2MDhiNzQ0
ZGNjMDU5MmY5ZjMyZjI1OGIxODZhNzdjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA1
NDFjY2E0YzgzMjcwYTZmNzMxN2E3OGJmMTIwOTVhNzNmN2VlOTE3IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogSG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29tPgogRGF0
ZTogVHVlLCAxNSBBdWcgMjAxNyAxNzoxMzo1OSArMDgwMAogU3ViamVjdDogW1BBVENIXSBGaXgg
ZWxmX2N2dF9ndW5oYXNoIGlmIGRlc3QgYW5kIHNyYyBhcmUgc2FtZS4KZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDAzLWZpeGhlYWRlcmNoZWNrLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2ZpbGVzLzAwMDMtZml4aGVhZGVy
Y2hlY2sucGF0Y2gKaW5kZXggZThiOTg2ZTRiYS4uMjMxMzRiYjE3OSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2ZpbGVzLzAwMDMtZml4aGVhZGVyY2hlY2sucGF0
Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2ZpbGVzLzAwMDMtZml4aGVh
ZGVyY2hlY2sucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDYxNGYwNjJiMjJlNmRhMTA4NjQz
Zjg2NDRhM2U5MmExMTA4ZjJiOWIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDA1ODdk
NGQ1MDBlMjI3MDQ1MmM2Njk1NmNhZTFhZGQ2ZjNiYmY1OGEgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCiBGcm9tOiBIb25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5jb20+CiBEYXRlOiBU
dWUsIDE1IEF1ZyAyMDE3IDE3OjE3OjIwICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGZpeGhlYWRl
cmNoZWNrCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMv
MDAwMy1tdXNsLXV0aWxzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2Zp
bGVzLzAwMDMtbXVzbC11dGlscy5wYXRjaAppbmRleCAyMzBlYTg4ZjQxLi41MDEwZDdhMTVkIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMvMDAwMy1tdXNs
LXV0aWxzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8w
MDAzLW11c2wtdXRpbHMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGFhYjU5ODVhMjliZDdh
YjZlMGIwNmVhYWIxOTBiNDJhMDRlMTBmNzAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IDUzZDhkNjU1YTc3ZDJlMDFkMGY2NWU0YWJlZGZmY2Y3YWE0N2QzNTcgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBIb25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5jb20+CiBE
YXRlOiBGcmksIDIzIEF1ZyAyMDE5IDEwOjE5OjQ4ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIG11
c2wtdXRpbHMKQEAgLTU2LDcgKzU2LDcgQEAgaW5kZXggZjc3MWI5Mi4uMjYzZGU2MiAxMDA2NDQK
ICBBUkdQX1BST0dSQU1fVkVSU0lPTl9IT09LX0RFRiA9IHByaW50X3ZlcnNpb247CiAgCiBkaWZm
IC0tZ2l0IGEvc3JjL3N0cmlwLmMgYi9zcmMvc3RyaXAuYwotaW5kZXggNjQzNjQ0My4uMTYwODQ5
NiAxMDA2NDQKK2luZGV4IDQwM2UwZjYuLjczOGU5NDggMTAwNjQ0CiAtLS0gYS9zcmMvc3RyaXAu
YwogKysrIGIvc3JjL3N0cmlwLmMKIEBAIC00NSw2ICs0NSwxMyBAQApkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2ZpbGVzL3B0ZXN0LnBhdGNoIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2VsZnV0aWxzL2ZpbGVzL3B0ZXN0LnBhdGNoCmluZGV4IDIxNTI4NzVkNjMu
Ljc0OTkzM2UxNTQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9m
aWxlcy9wdGVzdC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmls
ZXMvcHRlc3QucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGQ0OWY2YTEzNTc2MmVjMWYxODMx
ZDBlODBiOGRmMmE0MjY5YjBhNjYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDdhODE3
YjJjZTBiM2VjNDRkM2I0ZWE5MGZiMjlkMjYxMDJiNjA2OTAgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9u
Lm9yZz4KIERhdGU6IFdlZCwgMSBNYXkgMjAxOSAxNjozNzo0OCArMDEwMAogU3ViamVjdDogW1BB
VENIXSBDaGFuZ2VzIHRvIGFsbG93IHB0ZXN0IHRvIHJ1biBzdGFuZGFsb25lIG9uIHRhcmdldDoK
QEAgLTIxLDcgKzIxLDcgQEAgVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtvZSBzcGVj
aWZpY10KICAzIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkK
IAogZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwotaW5kZXggYmJlODY3
My4uNDg4NzEyYiAxMDA2NDQKK2luZGV4IGYxOTE0ODguLjQyNmE2OGYgMTAwNjQ0CiAtLS0gYS9j
b25maWd1cmUuYWMKICsrKyBiL2NvbmZpZ3VyZS5hYwogQEAgLTQ5LDcgKzQ5LDcgQEAgQUNfQ09Q
WVJJR0hUKFtDb3B5cmlnaHQgKEMpIDE5OTYtMjAyNCBUaGUgZWxmdXRpbHMgZGV2ZWxvcGVycy5d
KQpAQCAtMzQsMjAgKzM0LDIwIEBAIGluZGV4IGJiZTg2NzMuLjQ4ODcxMmIgMTAwNjQ0CiAgCiAg
QU1fU0lMRU5UX1JVTEVTKFt5ZXNdKQogZGlmZiAtLWdpdCBhL3Rlc3RzL01ha2VmaWxlLmFtIGIv
dGVzdHMvTWFrZWZpbGUuYW0KLWluZGV4IGVlNDlkMDcuLjNiZDhlNTggMTAwNjQ0CitpbmRleCA4
NjVhNjA0Li5lZWQ5YmQ0IDEwMDY0NAogLS0tIGEvdGVzdHMvTWFrZWZpbGUuYW0KICsrKyBiL3Rl
c3RzL01ha2VmaWxlLmFtCi1AQCAtODUyLDMgKzg1Miw1IEBAIGNoZWNrOiBjaGVjay1hbSBjb3Zl
cmFnZQorQEAgLTg5MywzICs4OTMsNSBAQCBjaGVjazogY2hlY2stYW0gY292ZXJhZ2UKICBjb3Zl
cmFnZToKICAJLSQoc3JjZGlyKS9jb3ZlcmFnZS5zaAogIGVuZGlmCiArb2VjaGVjazoKICsJJChN
QUtFKSAkKEFNX01BS0VGTEFHUykgJChjaGVja19QUk9HUkFNUykKIGRpZmYgLS1naXQgYS90ZXN0
cy90ZXN0LXN1YnIuc2ggYi90ZXN0cy90ZXN0LXN1YnIuc2gKLWluZGV4IDQxMWU1ZjIuLmE2Mzhm
ZjkgMTAwNjQ0CitpbmRleCBlYTgwY2JlLi43NjMyZDIwIDEwMDY0NAogLS0tIGEvdGVzdHMvdGVz
dC1zdWJyLnNoCiArKysgYi90ZXN0cy90ZXN0LXN1YnIuc2gKLUBAIC05MSwxMiArOTEsNiBAQCBp
bnN0YWxsZWRfdGVzdHJ1bigpCitAQCAtOTIsMTIgKzkyLDYgQEAgaW5zdGFsbGVkX3Rlc3RydW4o
KQogICAgcHJvZ3JhbT0iJDEiCiAgICBzaGlmdAogICAgY2FzZSAiJHByb2dyYW0iIGluCi0tIAoy
LjQ0LjEKCg==

--===============7502339287187537768==--

