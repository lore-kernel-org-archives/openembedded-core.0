Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37AFACC6B38
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 06:03:20 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15487.1792130599081182675
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 23:03:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=qaC2gIPF;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=FjqqPyeI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a1434ec592-fa87a05a-edc7-431e-89ab-75a9ae0a9188-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792130598;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=q8l2I6r1qiIO67u+WDXhfTKNHDAD7vay3kuZExvCBWI=;
	b=qaC2gIPFQQAD4FQ553xzn+mTKORHRGAC7/i4jllcOCewG99qMSDgd4hih9szLgdg
	anStt3sl6SYRTxsupc5KZWJ/6BRYn1WE4uaGKOHBjAGqtg3ZAo0DThcPaiCKXa/N8vJ
	1LyhQv1YrSBRVQGWDi457tAqHz3tmw/Z23SqjiIk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792130598;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=q8l2I6r1qiIO67u+WDXhfTKNHDAD7vay3kuZExvCBWI=;
	b=FjqqPyeIdim12lGy6nf3caHQUy8lGrYXiJcha1drEVQ+9s3145ik0fpobXAgJGS2
	jJdcLmZCraBwc/j4biiJR0gO+R4cSEmIbEGHYjuHiySGVPO4tGn1mF3zdITMwb3u9uR
	7dL1k3HdfHE1uC4XPYPaWoV6G8a/6quxZ+aksVB8=
Content-Type: multipart/mixed; boundary="===============3735459126619506349=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libarchive: upgrading to 3.8.10 SUCCEEDED
Message-ID: <010101a1434ec592-fa87a05a-edc7-431e-89ab-75a9ae0a9188-000000@us-west-2.amazonses.com>
Date: Fri, 16 Oct 2026 06:03:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.16-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247965

--===============3735459126619506349==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libarchive* to *3.8.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libarchive-upgrade-3.8.9-3.8.10.patch
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
From 42c7e1c7222542f91be22f57a7b6c05b12c38c42 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 16 Oct 2026 06:00:04 +0000
Subject: [PATCH] libarchive: upgrade 3.8.9 -> 3.8.10

Oct 14, 2026: libarchive 3.8.10 released
---
 ...nd_filter-Use-last-bidder-for-filter.patch | 188 -------------
 ...-Verify-that-bidder-and-filter-match.patch | 103 -------
 ...aes256-streaming-test-when-no-crypto.patch |  46 ----
 .../libarchive/0003-Remove-bidder-name.patch  | 258 ------------------
 ...vert-RPM-reader-into-a-proper-format.patch |  32 +--
 ...0005-Disable-RPM-filter-auto-bidding.patch |   6 +-
 ...barchive_3.8.9.bb => libarchive_3.8.10.bb} |   8 +-
 7 files changed, 20 insertions(+), 621 deletions(-)
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/0001-append_filter-Use-last-bidder-for-filter.patch
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/0001-append_filter-Verify-that-bidder-and-filter-match.patch
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/0001-test-skip-ppmd8-aes256-streaming-test-when-no-crypto.patch
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/0003-Remove-bidder-name.patch
 rename meta/recipes-extended/libarchive/{libarchive_3.8.9.bb => libarchive_3.8.10.bb} (90%)

diff --git a/meta/recipes-extended/libarchive/libarchive/0001-append_filter-Use-last-bidder-for-filter.patch b/meta/recipes-extended/libarchive/libarchive/0001-append_filter-Use-last-bidder-for-filter.patch
deleted file mode 100644
index 8e1eb0e938..0000000000
--- a/meta/recipes-extended/libarchive/libarchive/0001-append_filter-Use-last-bidder-for-filter.patch
+++ /dev/null
@@ -1,188 +0,0 @@
-From 50b585bb55484cdc70bd92852a477178dc43485c Mon Sep 17 00:00:00 2001
-From: Tobias Stoeckmann <tobias@stoeckmann.org>
-Date: Sun, 2 Aug 2026 14:27:17 +0200
-Subject: [PATCH] append_filter: Use last bidder for filter
-
-Appending a filter implies appending a bidder. Always use the last added
-bidder, since it was just added. This avoids desync situations where
-previously added bidders could erroneously match.
-
-Signed-off-by: Tobias Stoeckmann <tobias@stoeckmann.org>
-
-Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/50b585bb]
----
- libarchive/archive_read_append_filter.c | 72 ++++++++-----------------
- 1 file changed, 22 insertions(+), 50 deletions(-)
-
-diff --git a/libarchive/archive_read_append_filter.c b/libarchive/archive_read_append_filter.c
-index 8de1b2ea..9dd9f536 100644
---- a/libarchive/archive_read_append_filter.c
-+++ b/libarchive/archive_read_append_filter.c
-@@ -33,14 +33,25 @@
- #include "archive_private.h"
- #include "archive_read_private.h"
- 
-+static struct archive_read_filter_bidder *
-+get_last_bidder(struct archive_read *a)
-+{
-+  size_t i;
-+
-+  for (i = 0; i < sizeof(a->bidders) / sizeof(a->bidders[0]); i++)
-+  {
-+    if (a->bidders[i].vtable == NULL)
-+      break;
-+  }
-+
-+  return a->bidders + (i - 1);
-+}
-+
- int
- archive_read_append_filter(struct archive *_a, int code)
- {
--  int r1, r2, number_bidders, i;
--  const char *str;
--  struct archive_read_filter_bidder *b;
--  struct archive_read_filter *f;
-   struct archive_read *a = (struct archive_read *)_a;
-+  int r1, r2;
- 
-   r2 = (ARCHIVE_OK);
-   switch (code)
-@@ -53,15 +64,12 @@ archive_read_append_filter(struct archive *_a, int code)
-       r1 = (ARCHIVE_OK);
-       break;
-     case ARCHIVE_FILTER_GZIP:
--      str = "gzip";
-       r1 = archive_read_support_filter_gzip(_a);
-       break;
-     case ARCHIVE_FILTER_BZIP2:
--      str = "bzip2";
-       r1 = archive_read_support_filter_bzip2(_a);
-       break;
-     case ARCHIVE_FILTER_COMPRESS:
--      str = "compress (.Z)";
-       r1 = archive_read_support_filter_compress(_a);
-       break;
-     case ARCHIVE_FILTER_PROGRAM:
-@@ -69,43 +77,33 @@ archive_read_append_filter(struct archive *_a, int code)
-           "Cannot append program filter using archive_read_append_filter");
-       return (ARCHIVE_FATAL);
-     case ARCHIVE_FILTER_LZMA:
--      str = "lzma";
-       r1 = archive_read_support_filter_lzma(_a);
-       break;
-     case ARCHIVE_FILTER_XZ:
--      str = "xz";
-       r1 = archive_read_support_filter_xz(_a);
-       break;
-     case ARCHIVE_FILTER_UU:
--      str = "uu";
-       r1 = archive_read_support_filter_uu(_a);
-       break;
-     case ARCHIVE_FILTER_RPM:
--      str = "rpm";
-       r1 = archive_read_support_filter_rpm(_a);
-       break;
-     case ARCHIVE_FILTER_LZ4:
--      str = "lz4";
-       r1 = archive_read_support_filter_lz4(_a);
-       break;
-     case ARCHIVE_FILTER_ZSTD:
--      str = "zstd";
-       r1 = archive_read_support_filter_zstd(_a);
-       break;
-     case ARCHIVE_FILTER_LZIP:
--      str = "lzip";
-       r1 = archive_read_support_filter_lzip(_a);
-       break;
-     case ARCHIVE_FILTER_LZOP:
--      str = "lzop";
-       r1 = archive_read_support_filter_lzop(_a);
-       break;
-     case ARCHIVE_FILTER_LRZIP:
--      str = "lrzip";
-       r1 = archive_read_support_filter_lrzip(_a);
-       break;
-     case ARCHIVE_FILTER_GRZIP:
--      str = "grzip";
-       r1 = archive_read_support_filter_grzip(_a);
-       break;
-     default:
-@@ -114,22 +112,10 @@ archive_read_append_filter(struct archive *_a, int code)
-       return (ARCHIVE_FATAL);
-   }
- 
--  if (code != ARCHIVE_FILTER_NONE)
-+  if (r1 > ARCHIVE_FATAL && code != ARCHIVE_FILTER_NONE)
-   {
--    number_bidders = sizeof(a->bidders) / sizeof(a->bidders[0]);
--
--    b = a->bidders;
--    for (i = 1; i < number_bidders; i++, b++)
--    {
--      if (!b->name || !strcmp(b->name, str))
--        break;
--    }
--    if (!b->name || strcmp(b->name, str))
--    {
--      archive_set_error(&a->archive, ARCHIVE_ERRNO_PROGRAMMER,
--          "Internal error: Unable to append filter");
--      return (ARCHIVE_FATAL);
--    }
-+    struct archive_read_filter_bidder *b;
-+    struct archive_read_filter *f;
- 
-     f = calloc(1, sizeof(*f));
-     if (f == NULL)
-@@ -137,6 +123,7 @@ archive_read_append_filter(struct archive *_a, int code)
-       archive_set_error(&a->archive, ENOMEM, "Out of memory");
-       return (ARCHIVE_FATAL);
-     }
-+    b = get_last_bidder(a);
-     f->bidder = b;
-     f->archive = a;
-     f->upstream = a->filter;
-@@ -162,37 +149,22 @@ int
- archive_read_append_filter_program_signature(struct archive *_a,
-   const char *cmd, const void *signature, size_t signature_len)
- {
--  int r, number_bidders, i;
-+  struct archive_read *a = (struct archive_read *)_a;
-   struct archive_read_filter_bidder *b;
-   struct archive_read_filter *f;
--  struct archive_read *a = (struct archive_read *)_a;
-+  int r;
- 
-   if (archive_read_support_filter_program_signature(_a, cmd, signature,
-     signature_len) != (ARCHIVE_OK))
-     return (ARCHIVE_FATAL);
- 
--  number_bidders = sizeof(a->bidders) / sizeof(a->bidders[0]);
--
--  b = a->bidders;
--  for (i = 0; i < number_bidders; i++, b++)
--  {
--    /* Program bidder name set to filter name after initialization */
--    if (b->data && !b->name)
--      break;
--  }
--  if (!b->data)
--  {
--    archive_set_error(&a->archive, ARCHIVE_ERRNO_PROGRAMMER,
--        "Internal error: Unable to append program filter");
--    return (ARCHIVE_FATAL);
--  }
--
-   f = calloc(1, sizeof(*f));
-   if (f == NULL)
-   {
-     archive_set_error(&a->archive, ENOMEM, "Out of memory");
-     return (ARCHIVE_FATAL);
-   }
-+  b = get_last_bidder(a);
-   f->bidder = b;
-   f->archive = a;
-   f->upstream = a->filter;
--- 
-2.54.0
-
diff --git a/meta/recipes-extended/libarchive/libarchive/0001-append_filter-Verify-that-bidder-and-filter-match.patch b/meta/recipes-extended/libarchive/libarchive/0001-append_filter-Verify-that-bidder-and-filter-match.patch
deleted file mode 100644
index a91f518207..0000000000
--- a/meta/recipes-extended/libarchive/libarchive/0001-append_filter-Verify-that-bidder-and-filter-match.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-From db4fb440792278cd01e0829c93f6b62f567b704b Mon Sep 17 00:00:00 2001
-From: Tobias Stoeckmann <tobias@stoeckmann.org>
-Date: Sun, 2 Aug 2026 14:26:22 +0200
-Subject: [PATCH 1/3] append_filter: Verify that bidder and filter match
-
-Make sure that appending a filter always matches its supposed bidder.
-
-Upstream-Status: Submitted [https://github.com/libarchive/libarchive/pull/3346]
-Signed-off-by: Tobias Stoeckmann <tobias@stoeckmann.org>
-Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
----
- Makefile.am                                   |  1 +
- libarchive/test/CMakeLists.txt                |  1 +
- .../test/test_archive_read_append_filter.c    | 54 +++++++++++++++++++
- 3 files changed, 56 insertions(+)
- create mode 100644 libarchive/test/test_archive_read_append_filter.c
-
-diff --git a/Makefile.am b/Makefile.am
-index 2fb4fdf4..c96b3bc6 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -404,6 +404,7 @@ libarchive_test_SOURCES= \
- 	libarchive/test/test_archive_pathmatch_oob.c \
- 	libarchive/test/test_archive_read.c \
- 	libarchive/test/test_archive_read_add_passphrase.c \
-+	libarchive/test/test_archive_read_append_filter.c \
- 	libarchive/test/test_archive_read_close_twice.c \
- 	libarchive/test/test_archive_read_multiple_data_objects.c \
- 	libarchive/test/test_archive_read_next_header_empty.c \
-diff --git a/libarchive/test/CMakeLists.txt b/libarchive/test/CMakeLists.txt
-index 44f839f8..c4102c3d 100644
---- a/libarchive/test/CMakeLists.txt
-+++ b/libarchive/test/CMakeLists.txt
-@@ -33,6 +33,7 @@ IF(ENABLE_TEST)
-     test_archive_pathmatch_oob.c
-     test_archive_read.c
-     test_archive_read_add_passphrase.c
-+    test_archive_read_append_filter.c
-     test_archive_read_close_twice.c
-     test_archive_read_multiple_data_objects.c
-     test_archive_read_next_header_empty.c
-diff --git a/libarchive/test/test_archive_read_append_filter.c b/libarchive/test/test_archive_read_append_filter.c
-new file mode 100644
-index 00000000..5c301d52
---- /dev/null
-+++ b/libarchive/test/test_archive_read_append_filter.c
-@@ -0,0 +1,54 @@
-+/*-
-+ * Copyright (c) 2026 Tobias Stoeckmann
-+ * All rights reserved.
-+ *
-+ * Redistribution and use in source and binary forms, with or without
-+ * modification, are permitted provided that the following conditions
-+ * are met:
-+ * 1. Redistributions of source code must retain the above copyright
-+ *    notice, this list of conditions and the following disclaimer.
-+ * 2. Redistributions in binary form must reproduce the above copyright
-+ *    notice, this list of conditions and the following disclaimer in the
-+ *    documentation and/or other materials provided with the distribution.
-+ *
-+ * THIS SOFTWARE IS PROVIDED BY THE AUTHOR(S) ``AS IS'' AND ANY EXPRESS OR
-+ * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
-+ * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
-+ * IN NO EVENT SHALL THE AUTHOR(S) BE LIABLE FOR ANY DIRECT, INDIRECT,
-+ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
-+ * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
-+ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
-+ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
-+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
-+ * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-+ */
-+
-+#include "archive.h"
-+#include "test.h"
-+
-+DEFINE_TEST(test_archive_read_append_filter)
-+{
-+	struct archive *a;
-+	int r;
-+
-+	a = archive_read_new();
-+	assert(a != NULL);
-+
-+	/* Append a program bidder (without filter). */
-+	assertEqualIntA(a, ARCHIVE_OK,
-+	    archive_read_support_filter_program(a, "prog1"));
-+
-+	/* Append a filter program which comes with its own bidder. */
-+	r = archive_read_append_filter_program(a, "prog2");
-+
-+	/* Verify that filter uses its own bidder. */
-+	if (r == ARCHIVE_FATAL) {
-+		assertEqualStringA(a, "Can't initialize filter; unable to run program \"prog2\"",
-+			archive_error_string(a));
-+	} else {
-+		assertEqualIntA(a, ARCHIVE_OK, r);
-+		assertEqualStringA(a, "Program: prog2", archive_filter_name(a, 0));
-+	}
-+
-+	archive_read_free(a);
-+}
--- 
-2.49.0
diff --git a/meta/recipes-extended/libarchive/libarchive/0001-test-skip-ppmd8-aes256-streaming-test-when-no-crypto.patch b/meta/recipes-extended/libarchive/libarchive/0001-test-skip-ppmd8-aes256-streaming-test-when-no-crypto.patch
deleted file mode 100644
index fc96225141..0000000000
--- a/meta/recipes-extended/libarchive/libarchive/0001-test-skip-ppmd8-aes256-streaming-test-when-no-crypto.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From c2b00a5fff659bbe8d70b5e00cb6abb831170aeb Mon Sep 17 00:00:00 2001
-From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
-Date: Wed, 29 Jul 2026 13:33:10 +0000
-Subject: [PATCH] test: skip ppmd8 aes256 streaming test when no crypto library
- is present
-
-test_read_format_zip_ppmd8_aes256_streaming fails with 6 assertion
-failures on systems without a crypto library (openssl/nettle/mbedtls)
-because it tries to decrypt a pre-built encrypted zipx file without
-checking crypto availability first.
-
-Add the same guard used by the other encrypted zip tests in this file.
-
-Upstream-Status: Submitted [https://github.com/libarchive/libarchive/pull/3335]
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- .../test/test_read_format_zip_zipx_encrypted.c     | 14 ++++++++++++++
- 1 file changed, 14 insertions(+)
-
-diff --git a/libarchive/test/test_read_format_zip_zipx_encrypted.c b/libarchive/test/test_read_format_zip_zipx_encrypted.c
-index f07e1e5c..a0a431fb 100644
---- a/libarchive/test/test_read_format_zip_zipx_encrypted.c
-+++ b/libarchive/test/test_read_format_zip_zipx_encrypted.c
-@@ -257,8 +257,22 @@ DEFINE_TEST(test_read_format_zip_zipx_zstd_encrypted_streaming)
- DEFINE_TEST(test_read_format_zip_ppmd8_aes256_streaming)
- {
- 	const char *refname = "test_read_format_zip_ppmd8_aes256_streaming.zipx";
-+	struct archive *a;
- 	size_t used;
- 	char buff[600];
-+
-+	/* Check if running system has cryptographic functionality. */
-+	assert((a = archive_write_new()) != NULL);
-+	assertEqualIntA(a, ARCHIVE_OK, archive_write_set_format_zip(a));
-+	assertEqualIntA(a, ARCHIVE_OK, archive_write_add_filter_none(a));
-+	if (ARCHIVE_OK != archive_write_set_options(a,
-+			"zip:encryption=aes256")) {
-+		skipping("This system does not have cryptographic library");
-+		archive_write_free(a);
-+		return;
-+	}
-+	archive_write_free(a);
-+
- 	extract_reference_file(refname);
- 	FILE *f = fopen(refname, "rb");
- 	used = fread(buff, 1, sizeof(buff), f);
diff --git a/meta/recipes-extended/libarchive/libarchive/0003-Remove-bidder-name.patch b/meta/recipes-extended/libarchive/libarchive/0003-Remove-bidder-name.patch
deleted file mode 100644
index bbd2478577..0000000000
--- a/meta/recipes-extended/libarchive/libarchive/0003-Remove-bidder-name.patch
+++ /dev/null
@@ -1,258 +0,0 @@
-From 76c7142bd2595184826722063598fddf62031cca Mon Sep 17 00:00:00 2001
-From: Tobias Stoeckmann <tobias@stoeckmann.org>
-Date: Sun, 2 Aug 2026 14:31:33 +0200
-Subject: [PATCH 3/3] Remove bidder name
-
-The name was only needed to find the appropriate bidder for a filter.
-Since this has been resolved by accessing the last bidder, since in these
-situations the bidder is added first, then the filter, the name is not
-needed anymore.
-
-Upstream-Status: Submitted [https://github.com/libarchive/libarchive/pull/3346]
-Signed-off-by: Tobias Stoeckmann <tobias@stoeckmann.org>
-Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
----
- libarchive/archive_read.c                         | 2 --
- libarchive/archive_read_append_filter.c           | 1 -
- libarchive/archive_read_private.h                 | 3 ---
- libarchive/archive_read_support_filter_bzip2.c    | 2 +-
- libarchive/archive_read_support_filter_compress.c | 2 +-
- libarchive/archive_read_support_filter_grzip.c    | 2 +-
- libarchive/archive_read_support_filter_gzip.c     | 2 +-
- libarchive/archive_read_support_filter_lrzip.c    | 2 +-
- libarchive/archive_read_support_filter_lz4.c      | 2 +-
- libarchive/archive_read_support_filter_lzop.c     | 2 +-
- libarchive/archive_read_support_filter_program.c  | 2 +-
- libarchive/archive_read_support_filter_rpm.c      | 2 +-
- libarchive/archive_read_support_filter_uu.c       | 2 +-
- libarchive/archive_read_support_filter_xz.c       | 6 +++---
- libarchive/archive_read_support_filter_zstd.c     | 2 +-
- 15 files changed, 14 insertions(+), 20 deletions(-)
-
-diff --git a/libarchive/archive_read.c b/libarchive/archive_read.c
-index e844e42d..406d84de 100644
---- a/libarchive/archive_read.c
-+++ b/libarchive/archive_read.c
-@@ -1290,7 +1290,6 @@ __archive_read_register_format(struct archive_read *a,
- int
- __archive_read_register_bidder(struct archive_read *a,
- 	void *bidder_data,
--	const char *name,
- 	const struct archive_read_filter_bidder_vtable *vtable)
- {
- 	struct archive_read_filter_bidder *bidder;
-@@ -1307,7 +1306,6 @@ __archive_read_register_bidder(struct archive_read *a,
- 		memset(a->bidders + i, 0, sizeof(a->bidders[0]));
- 		bidder = (a->bidders + i);
- 		bidder->data = bidder_data;
--		bidder->name = name;
- 		bidder->vtable = vtable;
- 		if (bidder->vtable->bid == NULL || bidder->vtable->init == NULL) {
- 			archive_set_error(&a->archive, ARCHIVE_ERRNO_PROGRAMMER,
-diff --git a/libarchive/archive_read_append_filter.c b/libarchive/archive_read_append_filter.c
-index 9dd9f536..5cc8ff55 100644
---- a/libarchive/archive_read_append_filter.c
-+++ b/libarchive/archive_read_append_filter.c
-@@ -174,7 +174,6 @@ archive_read_append_filter_program_signature(struct archive *_a,
-     __archive_read_free_filters(a);
-     return (ARCHIVE_FATAL);
-   }
--  b->name = a->filter->name;
- 
-   a->bypass_filter_bidding = 1;
-   return r;
-diff --git a/libarchive/archive_read_private.h b/libarchive/archive_read_private.h
-index 3bd8de2d..e30b6c2b 100644
---- a/libarchive/archive_read_private.h
-+++ b/libarchive/archive_read_private.h
-@@ -68,8 +68,6 @@ struct archive_read_filter_bidder_vtable {
- struct archive_read_filter_bidder {
- 	/* Configuration data for the bidder. */
- 	void *data;
--	/* Name of the filter */
--	const char *name;
- 	const struct archive_read_filter_bidder_vtable *vtable;
- };
- 
-@@ -250,7 +248,6 @@ int	__archive_read_register_format(struct archive_read *a,
- 
- int __archive_read_register_bidder(struct archive_read *a,
- 		void *bidder_data,
--		const char *name,
- 		const struct archive_read_filter_bidder_vtable *vtable);
- 
- const void *__archive_read_ahead(struct archive_read *, size_t, ssize_t *);
-diff --git a/libarchive/archive_read_support_filter_bzip2.c b/libarchive/archive_read_support_filter_bzip2.c
-index 588953f2..1cfc55dc 100644
---- a/libarchive/archive_read_support_filter_bzip2.c
-+++ b/libarchive/archive_read_support_filter_bzip2.c
-@@ -91,7 +91,7 @@ archive_read_support_filter_bzip2(struct archive *_a)
- {
- 	struct archive_read *a = (struct archive_read *)_a;
- 
--	if (__archive_read_register_bidder(a, NULL, "bzip2",
-+	if (__archive_read_register_bidder(a, NULL,
- 				&bzip2_bidder_vtable) != ARCHIVE_OK)
- 		return (ARCHIVE_FATAL);
- 
-diff --git a/libarchive/archive_read_support_filter_compress.c b/libarchive/archive_read_support_filter_compress.c
-index 4e1f1dc5..4763995e 100644
---- a/libarchive/archive_read_support_filter_compress.c
-+++ b/libarchive/archive_read_support_filter_compress.c
-@@ -160,7 +160,7 @@ archive_read_support_filter_compress(struct archive *_a)
- {
- 	struct archive_read *a = (struct archive_read *)_a;
- 
--	return __archive_read_register_bidder(a, NULL, "compress (.Z)",
-+	return __archive_read_register_bidder(a, NULL,
- 			&compress_bidder_vtable);
- }
- 
-diff --git a/libarchive/archive_read_support_filter_grzip.c b/libarchive/archive_read_support_filter_grzip.c
-index 9d9ad46e..8457ec7c 100644
---- a/libarchive/archive_read_support_filter_grzip.c
-+++ b/libarchive/archive_read_support_filter_grzip.c
-@@ -62,7 +62,7 @@ archive_read_support_filter_grzip(struct archive *_a)
- {
- 	struct archive_read *a = (struct archive_read *)_a;
- 
--	if (__archive_read_register_bidder(a, NULL, "grzip",
-+	if (__archive_read_register_bidder(a, NULL,
- 				&grzip_bidder_vtable) != ARCHIVE_OK)
- 		return (ARCHIVE_FATAL);
- 
-diff --git a/libarchive/archive_read_support_filter_gzip.c b/libarchive/archive_read_support_filter_gzip.c
-index 89ae0f37..34b174b7 100644
---- a/libarchive/archive_read_support_filter_gzip.c
-+++ b/libarchive/archive_read_support_filter_gzip.c
-@@ -96,7 +96,7 @@ archive_read_support_filter_gzip(struct archive *_a)
- {
- 	struct archive_read *a = (struct archive_read *)_a;
- 
--	if (__archive_read_register_bidder(a, NULL, "gzip",
-+	if (__archive_read_register_bidder(a, NULL,
- 				&gzip_bidder_vtable) != ARCHIVE_OK)
- 		return (ARCHIVE_FATAL);
- 
-diff --git a/libarchive/archive_read_support_filter_lrzip.c b/libarchive/archive_read_support_filter_lrzip.c
-index 33910fe1..a1d45d77 100644
---- a/libarchive/archive_read_support_filter_lrzip.c
-+++ b/libarchive/archive_read_support_filter_lrzip.c
-@@ -61,7 +61,7 @@ archive_read_support_filter_lrzip(struct archive *_a)
- {
- 	struct archive_read *a = (struct archive_read *)_a;
- 
--	if (__archive_read_register_bidder(a, NULL, "lrzip",
-+	if (__archive_read_register_bidder(a, NULL,
- 				&lrzip_bidder_vtable) != ARCHIVE_OK)
- 		return (ARCHIVE_FATAL);
- 
-diff --git a/libarchive/archive_read_support_filter_lz4.c b/libarchive/archive_read_support_filter_lz4.c
-index 19086a1f..28189a07 100644
---- a/libarchive/archive_read_support_filter_lz4.c
-+++ b/libarchive/archive_read_support_filter_lz4.c
-@@ -118,7 +118,7 @@ archive_read_support_filter_lz4(struct archive *_a)
- {
- 	struct archive_read *a = (struct archive_read *)_a;
- 
--	if (__archive_read_register_bidder(a, NULL, "lz4",
-+	if (__archive_read_register_bidder(a, NULL,
- 				&lz4_bidder_vtable) != ARCHIVE_OK)
- 		return (ARCHIVE_FATAL);
- 
-diff --git a/libarchive/archive_read_support_filter_lzop.c b/libarchive/archive_read_support_filter_lzop.c
-index ebfaf01e..5a552fce 100644
---- a/libarchive/archive_read_support_filter_lzop.c
-+++ b/libarchive/archive_read_support_filter_lzop.c
-@@ -109,7 +109,7 @@ archive_read_support_filter_lzop(struct archive *_a)
- {
- 	struct archive_read *a = (struct archive_read *)_a;
- 
--	if (__archive_read_register_bidder(a, NULL, "lzop",
-+	if (__archive_read_register_bidder(a, NULL,
- 				&lzop_bidder_vtable) != ARCHIVE_OK)
- 		return (ARCHIVE_FATAL);
- 
-diff --git a/libarchive/archive_read_support_filter_program.c b/libarchive/archive_read_support_filter_program.c
-index cf7c3613..a9e02a32 100644
---- a/libarchive/archive_read_support_filter_program.c
-+++ b/libarchive/archive_read_support_filter_program.c
-@@ -156,7 +156,7 @@ archive_read_support_filter_program_signature(struct archive *_a,
- 		memcpy(state->signature, signature, signature_len);
- 	}
- 
--	if (__archive_read_register_bidder(a, state, NULL,
-+	if (__archive_read_register_bidder(a, state,
- 				&program_bidder_vtable) != ARCHIVE_OK) {
- 		free_state(state);
- 		return (ARCHIVE_FATAL);
-diff --git a/libarchive/archive_read_support_filter_rpm.c b/libarchive/archive_read_support_filter_rpm.c
-index 01bd1bf7..1cfddf75 100644
---- a/libarchive/archive_read_support_filter_rpm.c
-+++ b/libarchive/archive_read_support_filter_rpm.c
-@@ -71,7 +71,7 @@ archive_read_support_filter_rpm(struct archive *_a)
- {
- 	struct archive_read *a = (struct archive_read *)_a;
- 
--	return __archive_read_register_bidder(a, NULL, "rpm",
-+	return __archive_read_register_bidder(a, NULL,
- 			&rpm_bidder_vtable);
- }
- 
-diff --git a/libarchive/archive_read_support_filter_uu.c b/libarchive/archive_read_support_filter_uu.c
-index c0f6f48e..10d49648 100644
---- a/libarchive/archive_read_support_filter_uu.c
-+++ b/libarchive/archive_read_support_filter_uu.c
-@@ -92,7 +92,7 @@ archive_read_support_filter_uu(struct archive *_a)
- {
- 	struct archive_read *a = (struct archive_read *)_a;
- 
--	return __archive_read_register_bidder(a, NULL, "uu",
-+	return __archive_read_register_bidder(a, NULL,
- 			&uudecode_bidder_vtable);
- }
- 
-diff --git a/libarchive/archive_read_support_filter_xz.c b/libarchive/archive_read_support_filter_xz.c
-index 7c8e0cb5..b00ba543 100644
---- a/libarchive/archive_read_support_filter_xz.c
-+++ b/libarchive/archive_read_support_filter_xz.c
-@@ -115,7 +115,7 @@ archive_read_support_filter_xz(struct archive *_a)
- {
- 	struct archive_read *a = (struct archive_read *)_a;
- 
--	if (__archive_read_register_bidder(a, NULL, "xz",
-+	if (__archive_read_register_bidder(a, NULL,
- 				&xz_bidder_vtable) != ARCHIVE_OK)
- 		return (ARCHIVE_FATAL);
- 
-@@ -147,7 +147,7 @@ archive_read_support_filter_lzma(struct archive *_a)
- {
- 	struct archive_read *a = (struct archive_read *)_a;
- 
--	if (__archive_read_register_bidder(a, NULL, "lzma",
-+	if (__archive_read_register_bidder(a, NULL,
- 				&lzma_bidder_vtable) != ARCHIVE_OK)
- 		return (ARCHIVE_FATAL);
- 
-@@ -180,7 +180,7 @@ archive_read_support_filter_lzip(struct archive *_a)
- {
- 	struct archive_read *a = (struct archive_read *)_a;
- 
--	if (__archive_read_register_bidder(a, NULL, "lzip",
-+	if (__archive_read_register_bidder(a, NULL,
- 				&lzip_bidder_vtable) != ARCHIVE_OK)
- 		return (ARCHIVE_FATAL);
- 
-diff --git a/libarchive/archive_read_support_filter_zstd.c b/libarchive/archive_read_support_filter_zstd.c
-index 12eac04c..163f54b5 100644
---- a/libarchive/archive_read_support_filter_zstd.c
-+++ b/libarchive/archive_read_support_filter_zstd.c
-@@ -87,7 +87,7 @@ archive_read_support_filter_zstd(struct archive *_a)
- {
- 	struct archive_read *a = (struct archive_read *)_a;
- 
--	if (__archive_read_register_bidder(a, NULL, "zstd",
-+	if (__archive_read_register_bidder(a, NULL,
- 				&zstd_bidder_vtable) != ARCHIVE_OK)
- 		return (ARCHIVE_FATAL);
- 
diff --git a/meta/recipes-extended/libarchive/libarchive/0004-Convert-RPM-reader-into-a-proper-format.patch b/meta/recipes-extended/libarchive/libarchive/0004-Convert-RPM-reader-into-a-proper-format.patch
index 03a207f33f..e309b3a839 100644
--- a/meta/recipes-extended/libarchive/libarchive/0004-Convert-RPM-reader-into-a-proper-format.patch
+++ b/meta/recipes-extended/libarchive/libarchive/0004-Convert-RPM-reader-into-a-proper-format.patch
@@ -1,4 +1,4 @@
-From 2606336bce3a7f66cc6c8af28687a82536c9086c Mon Sep 17 00:00:00 2001
+From a20f942aa883a48021b66dc6a00cbae342ee67b9 Mon Sep 17 00:00:00 2001
 From: Davide Beatrici <git@davidebeatrici.dev>
 Date: Sun, 9 Aug 2026 14:14:59 -0700
 Subject: [PATCH] libarchive: Convert RPM reader into a proper format
@@ -38,14 +38,14 @@ Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
  .../test_read_format_cpio_svr4_bzip2_rpm.c    |    4 +-
  .../test_read_format_cpio_svr4_gzip_rpm.c     |    4 +-
  libarchive/test/test_read_format_huge_rpm.c   |   13 +-
- 15 files changed, 1169 insertions(+), 20 deletions(-)
+ 15 files changed, 1162 insertions(+), 15 deletions(-)
  create mode 100644 libarchive/archive_read_support_format_rpm.c
 
 diff --git a/Makefile.am b/Makefile.am
-index c96b3bc..725e20c 100644
+index 8bc70c5..487bef3 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -210,6 +210,7 @@ libarchive_la_SOURCES= \
+@@ -212,6 +212,7 @@ libarchive_la_SOURCES= \
  	libarchive/archive_read_support_format_rar.c \
  	libarchive/archive_read_support_format_rar5.c \
  	libarchive/archive_read_support_format_raw.c \
@@ -54,7 +54,7 @@ index c96b3bc..725e20c 100644
  	libarchive/archive_read_support_format_warc.c \
  	libarchive/archive_read_support_format_xar.c \
 diff --git a/contrib/android/Android.mk b/contrib/android/Android.mk
-index 9e1c72f..3d1f087 100644
+index f81dcb0..24af25e 100644
 --- a/contrib/android/Android.mk
 +++ b/contrib/android/Android.mk
 @@ -91,6 +91,7 @@ libarchive_src_files := libarchive/archive_acl.c \
@@ -66,7 +66,7 @@ index 9e1c72f..3d1f087 100644
  						libarchive/archive_read_support_format_warc.c \
  						libarchive/archive_read_support_format_xar.c \
 diff --git a/libarchive/CMakeLists.txt b/libarchive/CMakeLists.txt
-index b296637..d132123 100644
+index ac039c1..34ba173 100644
 --- a/libarchive/CMakeLists.txt
 +++ b/libarchive/CMakeLists.txt
 @@ -110,6 +110,7 @@ SET(libarchive_SOURCES
@@ -78,10 +78,10 @@ index b296637..d132123 100644
    archive_read_support_format_warc.c
    archive_read_support_format_xar.c
 diff --git a/libarchive/archive.h b/libarchive/archive.h
-index a7de6f6..89c60b3 100644
+index 19b316a..f04a747 100644
 --- a/libarchive/archive.h
 +++ b/libarchive/archive.h
-@@ -314,7 +314,9 @@ typedef const char *archive_passphrase_callback(struct archive *,
+@@ -316,7 +316,9 @@ typedef const char *archive_passphrase_callback(struct archive *,
  #define	ARCHIVE_FILTER_LZMA	5
  #define	ARCHIVE_FILTER_XZ	6
  #define	ARCHIVE_FILTER_UU	7
@@ -91,7 +91,7 @@ index a7de6f6..89c60b3 100644
  #define	ARCHIVE_FILTER_LZIP	9
  #define	ARCHIVE_FILTER_LRZIP	10
  #define	ARCHIVE_FILTER_LZOP	11
-@@ -385,6 +387,7 @@ typedef const char *archive_passphrase_callback(struct archive *,
+@@ -387,6 +389,7 @@ typedef const char *archive_passphrase_callback(struct archive *,
  #define	ARCHIVE_FORMAT_7ZIP			0xE0000
  #define	ARCHIVE_FORMAT_WARC			0xF0000
  #define	ARCHIVE_FORMAT_RAR_V5			0x100000
@@ -99,7 +99,7 @@ index a7de6f6..89c60b3 100644
  
  /*
   * Codes returned by archive_read_format_capabilities().
-@@ -478,7 +481,9 @@ __LA_DECL int archive_read_support_filter_program(struct archive *,
+@@ -480,7 +483,9 @@ __LA_DECL int archive_read_support_filter_program(struct archive *,
  __LA_DECL int archive_read_support_filter_program_signature
  		(struct archive *, const char * /* cmd */,
  				    const void * /* match */, size_t);
@@ -109,7 +109,7 @@ index a7de6f6..89c60b3 100644
  __LA_DECL int archive_read_support_filter_uu(struct archive *);
  __LA_DECL int archive_read_support_filter_xz(struct archive *);
  __LA_DECL int archive_read_support_filter_zstd(struct archive *);
-@@ -499,6 +504,7 @@ __LA_DECL int archive_read_support_format_mtree(struct archive *);
+@@ -501,6 +506,7 @@ __LA_DECL int archive_read_support_format_mtree(struct archive *);
  __LA_DECL int archive_read_support_format_rar(struct archive *);
  __LA_DECL int archive_read_support_format_rar5(struct archive *);
  __LA_DECL int archive_read_support_format_raw(struct archive *);
@@ -118,10 +118,10 @@ index a7de6f6..89c60b3 100644
  __LA_DECL int archive_read_support_format_warc(struct archive *);
  __LA_DECL int archive_read_support_format_xar(struct archive *);
 diff --git a/libarchive/archive_read.c b/libarchive/archive_read.c
-index 406d84d..150bd31 100644
+index 2f006fb..5c51df5 100644
 --- a/libarchive/archive_read.c
 +++ b/libarchive/archive_read.c
-@@ -1296,13 +1296,18 @@ __archive_read_register_bidder(struct archive_read *a,
+@@ -1297,13 +1297,18 @@ __archive_read_register_bidder(struct archive_read *a,
  	int i, number_slots;
  
  	archive_check_magic(&a->archive, ARCHIVE_READ_MAGIC,
@@ -143,10 +143,10 @@ index 406d84d..150bd31 100644
  		bidder = (a->bidders + i);
  		bidder->data = bidder_data;
 diff --git a/libarchive/archive_read_private.h b/libarchive/archive_read_private.h
-index e30b6c2..9ff3602 100644
+index 43b7f85..9b27655 100644
 --- a/libarchive/archive_read_private.h
 +++ b/libarchive/archive_read_private.h
-@@ -212,7 +212,7 @@ struct archive_read {
+@@ -208,7 +208,7 @@ struct archive_read {
  		int	(*cleanup)(struct archive_read *);
  		int	(*format_capabilties)(struct archive_read *);
  		int	(*has_encrypted_entries)(struct archive_read *);
@@ -1344,7 +1344,7 @@ index 0000000..fe0e500
 +	free(hash);
 +}
 diff --git a/libarchive/test/test_archive_read_support.c b/libarchive/test/test_archive_read_support.c
-index b0c9280..bc256a1 100644
+index ff03c0f..1bef2f7 100644
 --- a/libarchive/test/test_archive_read_support.c
 +++ b/libarchive/test/test_archive_read_support.c
 @@ -91,6 +91,7 @@ DEFINE_TEST(test_archive_read_support)
diff --git a/meta/recipes-extended/libarchive/libarchive/0005-Disable-RPM-filter-auto-bidding.patch b/meta/recipes-extended/libarchive/libarchive/0005-Disable-RPM-filter-auto-bidding.patch
index 26a0159908..86eb48a804 100644
--- a/meta/recipes-extended/libarchive/libarchive/0005-Disable-RPM-filter-auto-bidding.patch
+++ b/meta/recipes-extended/libarchive/libarchive/0005-Disable-RPM-filter-auto-bidding.patch
@@ -1,4 +1,4 @@
-From 882166d7fa113f0c2108864b8a579d01816e1fce Mon Sep 17 00:00:00 2001
+From b367b31b5b764e15c8d484a75c790b6ffa1e20d8 Mon Sep 17 00:00:00 2001
 From: Sumanth Gavini <sumanth.gavini@windriver.com>
 Date: Tue, 11 Aug 2026 12:02:31 -0700
 Subject: [PATCH] libarchive: Disable RPM filter auto-bidding
@@ -20,7 +20,7 @@ Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
  1 file changed, 6 insertions(+), 31 deletions(-)
 
 diff --git a/libarchive/archive_read_support_filter_rpm.c b/libarchive/archive_read_support_filter_rpm.c
-index 01bd1bf..8e90da3 100644
+index 1cfddf7..a9b6ef8 100644
 --- a/libarchive/archive_read_support_filter_rpm.c
 +++ b/libarchive/archive_read_support_filter_rpm.c
 @@ -79,39 +79,14 @@ static int
@@ -69,5 +69,3 @@ index 01bd1bf..8e90da3 100644
  }
  
  static const struct archive_read_filter_vtable
--- 
-2.49.0
diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.9.bb b/meta/recipes-extended/libarchive/libarchive_3.8.10.bb
similarity index 90%
rename from meta/recipes-extended/libarchive/libarchive_3.8.9.bb
rename to meta/recipes-extended/libarchive/libarchive_3.8.10.bb
index 2eefa28532..804dcd7451 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.10.bb
@@ -31,16 +31,12 @@ EXTRA_OECONF += "--enable-largefile --without-iconv"
 
 SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://run-ptest \
-           file://0001-append_filter-Use-last-bidder-for-filter.patch \
-           file://0001-test-skip-ppmd8-aes256-streaming-test-when-no-crypto.patch \
-           file://0001-append_filter-Verify-that-bidder-and-filter-match.patch \
-           file://0003-Remove-bidder-name.patch \
            file://0004-Convert-RPM-reader-into-a-proper-format.patch \
            file://0005-Disable-RPM-filter-auto-bidding.patch \
-          "
+           "
 UPSTREAM_CHECK_URI = "https://www.libarchive.org/"
 
-SRC_URI[sha256sum] = "f5a6539059cf5e597dbeda37bfa4874b1e8dea063c8d93bf85a2b44af90a5bd4"
+SRC_URI[sha256sum] = "a1bffbe5152cfe869751179e7b16648c87c461cb8c46eee75062efbe164cc57c"
 
 inherit autotools update-alternatives pkgconfig ptest
 
-- 
2.47.1


--===============3735459126619506349==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libarchive/bsdtar: PKGSIZE changed from 71784 to 79976 (+11%)
packages/x86-64-v3-poky-linux/libarchive/libarchive-ptest: FILELIST: added "/usr/lib/libarchive/ptest/libarchive/test/test_read_format_7zip_lzma1_riscv.7z.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_rar5_zip_in_rar.rar.uu /usr/lib/libarchive/ptest/libarchive/test/test_archive_read_open_filenames.c /usr/lib/libarchive/ptest/libarchive/test/test_read_format_zip_dos_mtime_precedence.c /usr/lib/libarchive/ptest/libarchive/test/test_read_format_zip_negative_timestamps.c /usr/lib/libarchive/ptest/libarchive/test/test_read_format_rar5_extra_data_size_toolong.rar.Z.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_iso_rockridge_cl_re_cycle.iso.Z.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_rar_filter_incomplete_block.c /usr/lib/libarchive/ptest/libarchive/test/test_read_format_rar5_varint_near_eof.c /usr/lib/libarchive/ptest/libarchive/test/test_read_format_rar5_redir_overflow.c /usr/lib/libarchive/ptest/unzip/test/test_windows_paths.c /usr/lib/
 libarchive/ptest/libarchive/test/test_read_format_7zip_deflate_armthumb.7z.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_zip_unset_times.c /usr/lib/libarchive/ptest/libarchive/test/test_read_format_7zip_deflate_delta.7z.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_rar5_redir_overflow.rar.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_rar5_extra_field_underflow.c /usr/lib/libarchive/ptest/libarchive/test/test_read_format_rar_filter_incomplete_block.rar.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_7zip_deflate_arm64_large.7z.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_7zip_ppmd_arm64.7z.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_data_into_fd_no_offset_reported.c /usr/lib/libarchive/ptest/libarchive/test/test_read_format_cab_skip_across_folders.c /usr/lib/libarchive/ptest/libarchive/test/test_read_format_xar_empty_xattr.xar.uu /usr/lib/libarchive/ptest/libarchive/test/test_write_disk_secure_p
 hysicaldrive.c /usr/lib/libarchive/ptest/libarchive/test/test_read_format_rar5_group_name_toolong.rar.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_zip_empty.c /usr/lib/libarchive/ptest/libarchive/test/test_read_format_rar5_extra_field_underflow.rar.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_cab_lzx_invalid_history.c /usr/lib/libarchive/ptest/libarchive/test/test_read_format_7zip_ppmd_small_block.7z.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_iso_rockridge_ce_overflow.iso.Z.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_rar5_header_size_wraparound.c /usr/lib/libarchive/ptest/libarchive/test/test_archive_ntfs_time.c /usr/lib/libarchive/ptest/libarchive/test/test_read_format_zip_lzma_alone_large_size.c /usr/lib/libarchive/ptest/libarchive/test/test_read_format_7zip_lzma1_ia64.7z.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_7zip_lzma1_sparc.7z.uu /usr/lib/libarchive/ptest/tar/test/test_option_mode.c /u
 sr/lib/libarchive/ptest/libarchive/test/test_read_format_rar5_truncated_htime.c /usr/lib/libarchive/ptest/libarchive/test/test_read_format_rar5_redir_varint_2byte.rar.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_7zip_lzma1_armthumb.7z.uu /usr/lib/libarchive/ptest/libarchive/test/test_compat_zstd_3.tar.zst.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_xar_toc_premature_stream_end.xar.uu /usr/lib/libarchive/ptest/libarchive/test/test_archive_read_open_filenames_split_uaf_1.tar.uu /usr/lib/libarchive/ptest/libarchive/test/test_archive_read_open_filenames_split_uaf_2.tar.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_mtree_size.c /usr/lib/libarchive/ptest/libarchive/test/test_read_format_lha_amiga_script.c /usr/lib/libarchive/ptest/libarchive/test/test_read_format_cab_lzx_invalid_history.cab.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_7zip_ppmd_bcj.7z.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_cab_skip_
 across_folders.cab.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_lha_amiga_script.lha.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_zip_ntfs_timestamp.c /usr/lib/libarchive/ptest/libarchive/test/test_read_format_cab_lzx_literal_control.cab.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_7zip_null_client_next.7z.uu /usr/lib/libarchive/ptest/tar/test/test_edit_pathname_hardlink.c /usr/lib/libarchive/ptest/libarchive/test/test_read_format_iso_rockridge_ce_overflow.c /usr/lib/libarchive/ptest/libarchive/test/test_read_format_zip_lzma_alone_large_size.zip.uu /usr/lib/libarchive/ptest/libarchive/test/test_archive_crc32.c /usr/lib/libarchive/ptest/libarchive/test/test_read_format_7zip_deflate_riscv.7z.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_tar_pax_global_header.tar.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_iso_rockridge_cl_re_cycle.c /usr/lib/libarchive/ptest/libarchive/test/test_read_format_iso_rockri
 dge_cl_re_control.iso.Z.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_xar_toc_premature_stream_end_control.xar.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_7zip_lzma1_powerpc.7z.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_rar5_owner_name_toolong.rar.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_filter_uudecode_newlines.c /usr/lib/libarchive/ptest/libarchive/test/test_read_format_7zip_lzma1_arm.7z.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_zip_ntfs_precedence.c /usr/lib/libarchive/ptest/libarchive/test/test_read_format_tar_pax_global_header_ignorable.tar.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_gtar_sparse_exceeds_length.c /usr/lib/libarchive/ptest/libarchive/test/test_read_data_block_offset_at_eof.c /usr/lib/libarchive/ptest/libarchive/test/test_read_format_7zip_lzma1_arm64.7z.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_gtar_sparse_exceeds_length.tar.Z.uu /usr/lib/li
 barchive/ptest/tar/test/test_edit_pathname_hardlink.tar.Z.uu /usr/lib/libarchive/ptest/libarchive/test/test_write_format_iso9660_rr_moved_notdir.c /usr/lib/libarchive/ptest/libarchive/test/test_read_format_warc_uri_nul.warc.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_7zip_deflate_ia64.7z.uu /usr/lib/libarchive/ptest/unzip/test/test_windows_paths.zip.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_zip_ambiguous_timestamps.c /usr/lib/libarchive/ptest/libarchive/test/test_create_child_environment.c /usr/lib/libarchive/ptest/libarchive/test/test_read_format_7zip_deflate_arm_arm64.7z.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_tar_pax_global_header.c"
packages/x86-64-v3-poky-linux/libarchive/libarchive: FILELIST: removed "/usr/lib/libarchive.so.13.8.9", added "/usr/lib/libarchive.so.13.8.10"
Changes to packages/x86-64-v3-poky-linux/libarchive (sysroot):
  /usr/lib/libarchive.so.13 changed symlink target from libarchive.so.13.8.9 to libarchive.so.13.8.10
  /usr/lib/libarchive.so changed symlink target from libarchive.so.13.8.9 to libarchive.so.13.8.10
  /usr/lib/libarchive.so.13.8.10 was added
  /usr/lib/libarchive.so.13.8.9 was removed
Changes to packages/x86_64-linux/elfutils-native (sysroot):
  /usr/bin/eu-stackprof was added
Changes to packages/x86_64-linux/libarchive-native (sysroot):
  /usr/lib/libarchive.so.13 changed symlink target from libarchive.so.13.8.9 to libarchive.so.13.8.10
  /usr/lib/libarchive.so changed symlink target from libarchive.so.13.8.9 to libarchive.so.13.8.10
  /usr/lib/libarchive.so.13.8.10 was added
  /usr/lib/libarchive.so.13.8.9 was removed

--===============3735459126619506349==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libarchive-changelog.txt"

Oct 14, 2026: libarchive 3.8.10 released

--===============3735459126619506349==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libarchive-upgrade-3.8.9-3.8.10.patch"

RnJvbSA0MmM3ZTFjNzIyMjU0MmY5MWJlMjJmNTdhN2I2YzA1YjEyYzM4YzQyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTYgT2N0IDIwMjYgMDY6MDA6MDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJhcmNoaXZlOiB1cGdyYWRlIDMuOC45IC0+IDMuOC4xMAoKT2N0IDE0LCAyMDI2OiBsaWJhcmNo
aXZlIDMuOC4xMCByZWxlYXNlZAotLS0KIC4uLm5kX2ZpbHRlci1Vc2UtbGFzdC1iaWRkZXItZm9y
LWZpbHRlci5wYXRjaCB8IDE4OCAtLS0tLS0tLS0tLS0tCiAuLi4tVmVyaWZ5LXRoYXQtYmlkZGVy
LWFuZC1maWx0ZXItbWF0Y2gucGF0Y2ggfCAxMDMgLS0tLS0tLQogLi4uYWVzMjU2LXN0cmVhbWlu
Zy10ZXN0LXdoZW4tbm8tY3J5cHRvLnBhdGNoIHwgIDQ2IC0tLS0KIC4uLi9saWJhcmNoaXZlLzAw
MDMtUmVtb3ZlLWJpZGRlci1uYW1lLnBhdGNoICB8IDI1OCAtLS0tLS0tLS0tLS0tLS0tLS0KIC4u
LnZlcnQtUlBNLXJlYWRlci1pbnRvLWEtcHJvcGVyLWZvcm1hdC5wYXRjaCB8ICAzMiArLS0KIC4u
LjAwMDUtRGlzYWJsZS1SUE0tZmlsdGVyLWF1dG8tYmlkZGluZy5wYXRjaCB8ICAgNiArLQogLi4u
YmFyY2hpdmVfMy44LjkuYmIgPT4gbGliYXJjaGl2ZV8zLjguMTAuYmJ9IHwgICA4ICstCiA3IGZp
bGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDYyMSBkZWxldGlvbnMoLSkKIGRlbGV0ZSBt
b2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGliYXJjaGl2ZS9saWJhcmNoaXZlLzAw
MDEtYXBwZW5kX2ZpbHRlci1Vc2UtbGFzdC1iaWRkZXItZm9yLWZpbHRlci5wYXRjaAogZGVsZXRl
IG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJhcmNoaXZlL2xpYmFyY2hpdmUv
MDAwMS1hcHBlbmRfZmlsdGVyLVZlcmlmeS10aGF0LWJpZGRlci1hbmQtZmlsdGVyLW1hdGNoLnBh
dGNoCiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUv
bGliYXJjaGl2ZS8wMDAxLXRlc3Qtc2tpcC1wcG1kOC1hZXMyNTYtc3RyZWFtaW5nLXRlc3Qtd2hl
bi1uby1jcnlwdG8ucGF0Y2gKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvbGliYXJjaGl2ZS9saWJhcmNoaXZlLzAwMDMtUmVtb3ZlLWJpZGRlci1uYW1lLnBhdGNoCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUve2xpYmFyY2hpdmVfMy44Ljku
YmIgPT4gbGliYXJjaGl2ZV8zLjguMTAuYmJ9ICg5MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUvbGliYXJjaGl2ZS8wMDAxLWFwcGVuZF9maWx0ZXItVXNl
LWxhc3QtYmlkZGVyLWZvci1maWx0ZXIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGli
YXJjaGl2ZS9saWJhcmNoaXZlLzAwMDEtYXBwZW5kX2ZpbHRlci1Vc2UtbGFzdC1iaWRkZXItZm9y
LWZpbHRlci5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggOGUxZWIwZTkzOC4u
MDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGliYXJjaGl2ZS9saWJhcmNo
aXZlLzAwMDEtYXBwZW5kX2ZpbHRlci1Vc2UtbGFzdC1iaWRkZXItZm9yLWZpbHRlci5wYXRjaAor
KysgL2Rldi9udWxsCkBAIC0xLDE4OCArMCwwIEBACi1Gcm9tIDUwYjU4NWJiNTU0ODRjZGM3MGJk
OTI4NTJhNDc3MTc4ZGM0MzQ4NWMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBUb2Jp
YXMgU3RvZWNrbWFubiA8dG9iaWFzQHN0b2Vja21hbm4ub3JnPgotRGF0ZTogU3VuLCAyIEF1ZyAy
MDI2IDE0OjI3OjE3ICswMjAwCi1TdWJqZWN0OiBbUEFUQ0hdIGFwcGVuZF9maWx0ZXI6IFVzZSBs
YXN0IGJpZGRlciBmb3IgZmlsdGVyCi0KLUFwcGVuZGluZyBhIGZpbHRlciBpbXBsaWVzIGFwcGVu
ZGluZyBhIGJpZGRlci4gQWx3YXlzIHVzZSB0aGUgbGFzdCBhZGRlZAotYmlkZGVyLCBzaW5jZSBp
dCB3YXMganVzdCBhZGRlZC4gVGhpcyBhdm9pZHMgZGVzeW5jIHNpdHVhdGlvbnMgd2hlcmUKLXBy
ZXZpb3VzbHkgYWRkZWQgYmlkZGVycyBjb3VsZCBlcnJvbmVvdXNseSBtYXRjaC4KLQotU2lnbmVk
LW9mZi1ieTogVG9iaWFzIFN0b2Vja21hbm4gPHRvYmlhc0BzdG9lY2ttYW5uLm9yZz4KLQotVXBz
dHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9naXRodWIuY29tL2xpYmFyY2hpdmUvbGli
YXJjaGl2ZS9jb21taXQvNTBiNTg1YmJdCi0tLS0KLSBsaWJhcmNoaXZlL2FyY2hpdmVfcmVhZF9h
cHBlbmRfZmlsdGVyLmMgfCA3MiArKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tCi0gMSBmaWxlIGNo
YW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDUwIGRlbGV0aW9ucygtKQotCi1kaWZmIC0tZ2l0IGEv
bGliYXJjaGl2ZS9hcmNoaXZlX3JlYWRfYXBwZW5kX2ZpbHRlci5jIGIvbGliYXJjaGl2ZS9hcmNo
aXZlX3JlYWRfYXBwZW5kX2ZpbHRlci5jCi1pbmRleCA4ZGUxYjJlYS4uOWRkOWY1MzYgMTAwNjQ0
Ci0tLS0gYS9saWJhcmNoaXZlL2FyY2hpdmVfcmVhZF9hcHBlbmRfZmlsdGVyLmMKLSsrKyBiL2xp
YmFyY2hpdmUvYXJjaGl2ZV9yZWFkX2FwcGVuZF9maWx0ZXIuYwotQEAgLTMzLDE0ICszMywyNSBA
QAotICNpbmNsdWRlICJhcmNoaXZlX3ByaXZhdGUuaCIKLSAjaW5jbHVkZSAiYXJjaGl2ZV9yZWFk
X3ByaXZhdGUuaCIKLSAKLStzdGF0aWMgc3RydWN0IGFyY2hpdmVfcmVhZF9maWx0ZXJfYmlkZGVy
ICoKLStnZXRfbGFzdF9iaWRkZXIoc3RydWN0IGFyY2hpdmVfcmVhZCAqYSkKLSt7Ci0rICBzaXpl
X3QgaTsKLSsKLSsgIGZvciAoaSA9IDA7IGkgPCBzaXplb2YoYS0+YmlkZGVycykgLyBzaXplb2Yo
YS0+YmlkZGVyc1swXSk7IGkrKykKLSsgIHsKLSsgICAgaWYgKGEtPmJpZGRlcnNbaV0udnRhYmxl
ID09IE5VTEwpCi0rICAgICAgYnJlYWs7Ci0rICB9Ci0rCi0rICByZXR1cm4gYS0+YmlkZGVycyAr
IChpIC0gMSk7Ci0rfQotKwotIGludAotIGFyY2hpdmVfcmVhZF9hcHBlbmRfZmlsdGVyKHN0cnVj
dCBhcmNoaXZlICpfYSwgaW50IGNvZGUpCi0gewotLSAgaW50IHIxLCByMiwgbnVtYmVyX2JpZGRl
cnMsIGk7Ci0tICBjb25zdCBjaGFyICpzdHI7Ci0tICBzdHJ1Y3QgYXJjaGl2ZV9yZWFkX2ZpbHRl
cl9iaWRkZXIgKmI7Ci0tICBzdHJ1Y3QgYXJjaGl2ZV9yZWFkX2ZpbHRlciAqZjsKLSAgIHN0cnVj
dCBhcmNoaXZlX3JlYWQgKmEgPSAoc3RydWN0IGFyY2hpdmVfcmVhZCAqKV9hOwotKyAgaW50IHIx
LCByMjsKLSAKLSAgIHIyID0gKEFSQ0hJVkVfT0spOwotICAgc3dpdGNoIChjb2RlKQotQEAgLTUz
LDE1ICs2NCwxMiBAQCBhcmNoaXZlX3JlYWRfYXBwZW5kX2ZpbHRlcihzdHJ1Y3QgYXJjaGl2ZSAq
X2EsIGludCBjb2RlKQotICAgICAgIHIxID0gKEFSQ0hJVkVfT0spOwotICAgICAgIGJyZWFrOwot
ICAgICBjYXNlIEFSQ0hJVkVfRklMVEVSX0daSVA6Ci0tICAgICAgc3RyID0gImd6aXAiOwotICAg
ICAgIHIxID0gYXJjaGl2ZV9yZWFkX3N1cHBvcnRfZmlsdGVyX2d6aXAoX2EpOwotICAgICAgIGJy
ZWFrOwotICAgICBjYXNlIEFSQ0hJVkVfRklMVEVSX0JaSVAyOgotLSAgICAgIHN0ciA9ICJiemlw
MiI7Ci0gICAgICAgcjEgPSBhcmNoaXZlX3JlYWRfc3VwcG9ydF9maWx0ZXJfYnppcDIoX2EpOwot
ICAgICAgIGJyZWFrOwotICAgICBjYXNlIEFSQ0hJVkVfRklMVEVSX0NPTVBSRVNTOgotLSAgICAg
IHN0ciA9ICJjb21wcmVzcyAoLlopIjsKLSAgICAgICByMSA9IGFyY2hpdmVfcmVhZF9zdXBwb3J0
X2ZpbHRlcl9jb21wcmVzcyhfYSk7Ci0gICAgICAgYnJlYWs7Ci0gICAgIGNhc2UgQVJDSElWRV9G
SUxURVJfUFJPR1JBTToKLUBAIC02OSw0MyArNzcsMzMgQEAgYXJjaGl2ZV9yZWFkX2FwcGVuZF9m
aWx0ZXIoc3RydWN0IGFyY2hpdmUgKl9hLCBpbnQgY29kZSkKLSAgICAgICAgICAgIkNhbm5vdCBh
cHBlbmQgcHJvZ3JhbSBmaWx0ZXIgdXNpbmcgYXJjaGl2ZV9yZWFkX2FwcGVuZF9maWx0ZXIiKTsK
LSAgICAgICByZXR1cm4gKEFSQ0hJVkVfRkFUQUwpOwotICAgICBjYXNlIEFSQ0hJVkVfRklMVEVS
X0xaTUE6Ci0tICAgICAgc3RyID0gImx6bWEiOwotICAgICAgIHIxID0gYXJjaGl2ZV9yZWFkX3N1
cHBvcnRfZmlsdGVyX2x6bWEoX2EpOwotICAgICAgIGJyZWFrOwotICAgICBjYXNlIEFSQ0hJVkVf
RklMVEVSX1haOgotLSAgICAgIHN0ciA9ICJ4eiI7Ci0gICAgICAgcjEgPSBhcmNoaXZlX3JlYWRf
c3VwcG9ydF9maWx0ZXJfeHooX2EpOwotICAgICAgIGJyZWFrOwotICAgICBjYXNlIEFSQ0hJVkVf
RklMVEVSX1VVOgotLSAgICAgIHN0ciA9ICJ1dSI7Ci0gICAgICAgcjEgPSBhcmNoaXZlX3JlYWRf
c3VwcG9ydF9maWx0ZXJfdXUoX2EpOwotICAgICAgIGJyZWFrOwotICAgICBjYXNlIEFSQ0hJVkVf
RklMVEVSX1JQTToKLS0gICAgICBzdHIgPSAicnBtIjsKLSAgICAgICByMSA9IGFyY2hpdmVfcmVh
ZF9zdXBwb3J0X2ZpbHRlcl9ycG0oX2EpOwotICAgICAgIGJyZWFrOwotICAgICBjYXNlIEFSQ0hJ
VkVfRklMVEVSX0xaNDoKLS0gICAgICBzdHIgPSAibHo0IjsKLSAgICAgICByMSA9IGFyY2hpdmVf
cmVhZF9zdXBwb3J0X2ZpbHRlcl9sejQoX2EpOwotICAgICAgIGJyZWFrOwotICAgICBjYXNlIEFS
Q0hJVkVfRklMVEVSX1pTVEQ6Ci0tICAgICAgc3RyID0gInpzdGQiOwotICAgICAgIHIxID0gYXJj
aGl2ZV9yZWFkX3N1cHBvcnRfZmlsdGVyX3pzdGQoX2EpOwotICAgICAgIGJyZWFrOwotICAgICBj
YXNlIEFSQ0hJVkVfRklMVEVSX0xaSVA6Ci0tICAgICAgc3RyID0gImx6aXAiOwotICAgICAgIHIx
ID0gYXJjaGl2ZV9yZWFkX3N1cHBvcnRfZmlsdGVyX2x6aXAoX2EpOwotICAgICAgIGJyZWFrOwot
ICAgICBjYXNlIEFSQ0hJVkVfRklMVEVSX0xaT1A6Ci0tICAgICAgc3RyID0gImx6b3AiOwotICAg
ICAgIHIxID0gYXJjaGl2ZV9yZWFkX3N1cHBvcnRfZmlsdGVyX2x6b3AoX2EpOwotICAgICAgIGJy
ZWFrOwotICAgICBjYXNlIEFSQ0hJVkVfRklMVEVSX0xSWklQOgotLSAgICAgIHN0ciA9ICJscnpp
cCI7Ci0gICAgICAgcjEgPSBhcmNoaXZlX3JlYWRfc3VwcG9ydF9maWx0ZXJfbHJ6aXAoX2EpOwot
ICAgICAgIGJyZWFrOwotICAgICBjYXNlIEFSQ0hJVkVfRklMVEVSX0dSWklQOgotLSAgICAgIHN0
ciA9ICJncnppcCI7Ci0gICAgICAgcjEgPSBhcmNoaXZlX3JlYWRfc3VwcG9ydF9maWx0ZXJfZ3J6
aXAoX2EpOwotICAgICAgIGJyZWFrOwotICAgICBkZWZhdWx0OgotQEAgLTExNCwyMiArMTEyLDEw
IEBAIGFyY2hpdmVfcmVhZF9hcHBlbmRfZmlsdGVyKHN0cnVjdCBhcmNoaXZlICpfYSwgaW50IGNv
ZGUpCi0gICAgICAgcmV0dXJuIChBUkNISVZFX0ZBVEFMKTsKLSAgIH0KLSAKLS0gIGlmIChjb2Rl
ICE9IEFSQ0hJVkVfRklMVEVSX05PTkUpCi0rICBpZiAocjEgPiBBUkNISVZFX0ZBVEFMICYmIGNv
ZGUgIT0gQVJDSElWRV9GSUxURVJfTk9ORSkKLSAgIHsKLS0gICAgbnVtYmVyX2JpZGRlcnMgPSBz
aXplb2YoYS0+YmlkZGVycykgLyBzaXplb2YoYS0+YmlkZGVyc1swXSk7Ci0tCi0tICAgIGIgPSBh
LT5iaWRkZXJzOwotLSAgICBmb3IgKGkgPSAxOyBpIDwgbnVtYmVyX2JpZGRlcnM7IGkrKywgYisr
KQotLSAgICB7Ci0tICAgICAgaWYgKCFiLT5uYW1lIHx8ICFzdHJjbXAoYi0+bmFtZSwgc3RyKSkK
LS0gICAgICAgIGJyZWFrOwotLSAgICB9Ci0tICAgIGlmICghYi0+bmFtZSB8fCBzdHJjbXAoYi0+
bmFtZSwgc3RyKSkKLS0gICAgewotLSAgICAgIGFyY2hpdmVfc2V0X2Vycm9yKCZhLT5hcmNoaXZl
LCBBUkNISVZFX0VSUk5PX1BST0dSQU1NRVIsCi0tICAgICAgICAgICJJbnRlcm5hbCBlcnJvcjog
VW5hYmxlIHRvIGFwcGVuZCBmaWx0ZXIiKTsKLS0gICAgICByZXR1cm4gKEFSQ0hJVkVfRkFUQUwp
OwotLSAgICB9Ci0rICAgIHN0cnVjdCBhcmNoaXZlX3JlYWRfZmlsdGVyX2JpZGRlciAqYjsKLSsg
ICAgc3RydWN0IGFyY2hpdmVfcmVhZF9maWx0ZXIgKmY7Ci0gCi0gICAgIGYgPSBjYWxsb2MoMSwg
c2l6ZW9mKCpmKSk7Ci0gICAgIGlmIChmID09IE5VTEwpCi1AQCAtMTM3LDYgKzEyMyw3IEBAIGFy
Y2hpdmVfcmVhZF9hcHBlbmRfZmlsdGVyKHN0cnVjdCBhcmNoaXZlICpfYSwgaW50IGNvZGUpCi0g
ICAgICAgYXJjaGl2ZV9zZXRfZXJyb3IoJmEtPmFyY2hpdmUsIEVOT01FTSwgIk91dCBvZiBtZW1v
cnkiKTsKLSAgICAgICByZXR1cm4gKEFSQ0hJVkVfRkFUQUwpOwotICAgICB9Ci0rICAgIGIgPSBn
ZXRfbGFzdF9iaWRkZXIoYSk7Ci0gICAgIGYtPmJpZGRlciA9IGI7Ci0gICAgIGYtPmFyY2hpdmUg
PSBhOwotICAgICBmLT51cHN0cmVhbSA9IGEtPmZpbHRlcjsKLUBAIC0xNjIsMzcgKzE0OSwyMiBA
QCBpbnQKLSBhcmNoaXZlX3JlYWRfYXBwZW5kX2ZpbHRlcl9wcm9ncmFtX3NpZ25hdHVyZShzdHJ1
Y3QgYXJjaGl2ZSAqX2EsCi0gICBjb25zdCBjaGFyICpjbWQsIGNvbnN0IHZvaWQgKnNpZ25hdHVy
ZSwgc2l6ZV90IHNpZ25hdHVyZV9sZW4pCi0gewotLSAgaW50IHIsIG51bWJlcl9iaWRkZXJzLCBp
OwotKyAgc3RydWN0IGFyY2hpdmVfcmVhZCAqYSA9IChzdHJ1Y3QgYXJjaGl2ZV9yZWFkICopX2E7
Ci0gICBzdHJ1Y3QgYXJjaGl2ZV9yZWFkX2ZpbHRlcl9iaWRkZXIgKmI7Ci0gICBzdHJ1Y3QgYXJj
aGl2ZV9yZWFkX2ZpbHRlciAqZjsKLS0gIHN0cnVjdCBhcmNoaXZlX3JlYWQgKmEgPSAoc3RydWN0
IGFyY2hpdmVfcmVhZCAqKV9hOwotKyAgaW50IHI7Ci0gCi0gICBpZiAoYXJjaGl2ZV9yZWFkX3N1
cHBvcnRfZmlsdGVyX3Byb2dyYW1fc2lnbmF0dXJlKF9hLCBjbWQsIHNpZ25hdHVyZSwKLSAgICAg
c2lnbmF0dXJlX2xlbikgIT0gKEFSQ0hJVkVfT0spKQotICAgICByZXR1cm4gKEFSQ0hJVkVfRkFU
QUwpOwotIAotLSAgbnVtYmVyX2JpZGRlcnMgPSBzaXplb2YoYS0+YmlkZGVycykgLyBzaXplb2Yo
YS0+YmlkZGVyc1swXSk7Ci0tCi0tICBiID0gYS0+YmlkZGVyczsKLS0gIGZvciAoaSA9IDA7IGkg
PCBudW1iZXJfYmlkZGVyczsgaSsrLCBiKyspCi0tICB7Ci0tICAgIC8qIFByb2dyYW0gYmlkZGVy
IG5hbWUgc2V0IHRvIGZpbHRlciBuYW1lIGFmdGVyIGluaXRpYWxpemF0aW9uICovCi0tICAgIGlm
IChiLT5kYXRhICYmICFiLT5uYW1lKQotLSAgICAgIGJyZWFrOwotLSAgfQotLSAgaWYgKCFiLT5k
YXRhKQotLSAgewotLSAgICBhcmNoaXZlX3NldF9lcnJvcigmYS0+YXJjaGl2ZSwgQVJDSElWRV9F
UlJOT19QUk9HUkFNTUVSLAotLSAgICAgICAgIkludGVybmFsIGVycm9yOiBVbmFibGUgdG8gYXBw
ZW5kIHByb2dyYW0gZmlsdGVyIik7Ci0tICAgIHJldHVybiAoQVJDSElWRV9GQVRBTCk7Ci0tICB9
Ci0tCi0gICBmID0gY2FsbG9jKDEsIHNpemVvZigqZikpOwotICAgaWYgKGYgPT0gTlVMTCkKLSAg
IHsKLSAgICAgYXJjaGl2ZV9zZXRfZXJyb3IoJmEtPmFyY2hpdmUsIEVOT01FTSwgIk91dCBvZiBt
ZW1vcnkiKTsKLSAgICAgcmV0dXJuIChBUkNISVZFX0ZBVEFMKTsKLSAgIH0KLSsgIGIgPSBnZXRf
bGFzdF9iaWRkZXIoYSk7Ci0gICBmLT5iaWRkZXIgPSBiOwotICAgZi0+YXJjaGl2ZSA9IGE7Ci0g
ICBmLT51cHN0cmVhbSA9IGEtPmZpbHRlcjsKLS0tIAotMi41NC4wCi0KZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9saWJhcmNoaXZlL2xpYmFyY2hpdmUvMDAwMS1hcHBlbmRfZmls
dGVyLVZlcmlmeS10aGF0LWJpZGRlci1hbmQtZmlsdGVyLW1hdGNoLnBhdGNoIGIvbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUvbGliYXJjaGl2ZS8wMDAxLWFwcGVuZF9maWx0ZXItVmVy
aWZ5LXRoYXQtYmlkZGVyLWFuZC1maWx0ZXItbWF0Y2gucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IGE5MWY1MTgyMDcuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL2xpYmFyY2hpdmUvbGliYXJjaGl2ZS8wMDAxLWFwcGVuZF9maWx0ZXItVmVyaWZ5LXRo
YXQtYmlkZGVyLWFuZC1maWx0ZXItbWF0Y2gucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwxMDMg
KzAsMCBAQAotRnJvbSBkYjRmYjQ0MDc5MjI3OGNkMDFlMDgyOWM5M2Y2YjYyZjU2N2I3MDRiIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogVG9iaWFzIFN0b2Vja21hbm4gPHRvYmlhc0Bz
dG9lY2ttYW5uLm9yZz4KLURhdGU6IFN1biwgMiBBdWcgMjAyNiAxNDoyNjoyMiArMDIwMAotU3Vi
amVjdDogW1BBVENIIDEvM10gYXBwZW5kX2ZpbHRlcjogVmVyaWZ5IHRoYXQgYmlkZGVyIGFuZCBm
aWx0ZXIgbWF0Y2gKLQotTWFrZSBzdXJlIHRoYXQgYXBwZW5kaW5nIGEgZmlsdGVyIGFsd2F5cyBt
YXRjaGVzIGl0cyBzdXBwb3NlZCBiaWRkZXIuCi0KLVVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVk
IFtodHRwczovL2dpdGh1Yi5jb20vbGliYXJjaGl2ZS9saWJhcmNoaXZlL3B1bGwvMzM0Nl0KLVNp
Z25lZC1vZmYtYnk6IFRvYmlhcyBTdG9lY2ttYW5uIDx0b2JpYXNAc3RvZWNrbWFubi5vcmc+Ci1T
aWduZWQtb2ZmLWJ5OiBTdW1hbnRoIEdhdmluaSA8c3VtYW50aC5nYXZpbmlAd2luZHJpdmVyLmNv
bT4KLS0tLQotIE1ha2VmaWxlLmFtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAxICsKLSBsaWJhcmNoaXZlL3Rlc3QvQ01ha2VMaXN0cy50eHQgICAgICAgICAgICAgICAgfCAg
MSArCi0gLi4uL3Rlc3QvdGVzdF9hcmNoaXZlX3JlYWRfYXBwZW5kX2ZpbHRlci5jICAgIHwgNTQg
KysrKysrKysrKysrKysrKysrKwotIDMgZmlsZXMgY2hhbmdlZCwgNTYgaW5zZXJ0aW9ucygrKQot
IGNyZWF0ZSBtb2RlIDEwMDY0NCBsaWJhcmNoaXZlL3Rlc3QvdGVzdF9hcmNoaXZlX3JlYWRfYXBw
ZW5kX2ZpbHRlci5jCi0KLWRpZmYgLS1naXQgYS9NYWtlZmlsZS5hbSBiL01ha2VmaWxlLmFtCi1p
bmRleCAyZmI0ZmRmNC4uYzk2YjNiYzYgMTAwNjQ0Ci0tLS0gYS9NYWtlZmlsZS5hbQotKysrIGIv
TWFrZWZpbGUuYW0KLUBAIC00MDQsNiArNDA0LDcgQEAgbGliYXJjaGl2ZV90ZXN0X1NPVVJDRVM9
IFwKLSAJbGliYXJjaGl2ZS90ZXN0L3Rlc3RfYXJjaGl2ZV9wYXRobWF0Y2hfb29iLmMgXAotIAls
aWJhcmNoaXZlL3Rlc3QvdGVzdF9hcmNoaXZlX3JlYWQuYyBcCi0gCWxpYmFyY2hpdmUvdGVzdC90
ZXN0X2FyY2hpdmVfcmVhZF9hZGRfcGFzc3BocmFzZS5jIFwKLSsJbGliYXJjaGl2ZS90ZXN0L3Rl
c3RfYXJjaGl2ZV9yZWFkX2FwcGVuZF9maWx0ZXIuYyBcCi0gCWxpYmFyY2hpdmUvdGVzdC90ZXN0
X2FyY2hpdmVfcmVhZF9jbG9zZV90d2ljZS5jIFwKLSAJbGliYXJjaGl2ZS90ZXN0L3Rlc3RfYXJj
aGl2ZV9yZWFkX211bHRpcGxlX2RhdGFfb2JqZWN0cy5jIFwKLSAJbGliYXJjaGl2ZS90ZXN0L3Rl
c3RfYXJjaGl2ZV9yZWFkX25leHRfaGVhZGVyX2VtcHR5LmMgXAotZGlmZiAtLWdpdCBhL2xpYmFy
Y2hpdmUvdGVzdC9DTWFrZUxpc3RzLnR4dCBiL2xpYmFyY2hpdmUvdGVzdC9DTWFrZUxpc3RzLnR4
dAotaW5kZXggNDRmODM5ZjguLmM0MTAyYzNkIDEwMDY0NAotLS0tIGEvbGliYXJjaGl2ZS90ZXN0
L0NNYWtlTGlzdHMudHh0Ci0rKysgYi9saWJhcmNoaXZlL3Rlc3QvQ01ha2VMaXN0cy50eHQKLUBA
IC0zMyw2ICszMyw3IEBAIElGKEVOQUJMRV9URVNUKQotICAgICB0ZXN0X2FyY2hpdmVfcGF0aG1h
dGNoX29vYi5jCi0gICAgIHRlc3RfYXJjaGl2ZV9yZWFkLmMKLSAgICAgdGVzdF9hcmNoaXZlX3Jl
YWRfYWRkX3Bhc3NwaHJhc2UuYwotKyAgICB0ZXN0X2FyY2hpdmVfcmVhZF9hcHBlbmRfZmlsdGVy
LmMKLSAgICAgdGVzdF9hcmNoaXZlX3JlYWRfY2xvc2VfdHdpY2UuYwotICAgICB0ZXN0X2FyY2hp
dmVfcmVhZF9tdWx0aXBsZV9kYXRhX29iamVjdHMuYwotICAgICB0ZXN0X2FyY2hpdmVfcmVhZF9u
ZXh0X2hlYWRlcl9lbXB0eS5jCi1kaWZmIC0tZ2l0IGEvbGliYXJjaGl2ZS90ZXN0L3Rlc3RfYXJj
aGl2ZV9yZWFkX2FwcGVuZF9maWx0ZXIuYyBiL2xpYmFyY2hpdmUvdGVzdC90ZXN0X2FyY2hpdmVf
cmVhZF9hcHBlbmRfZmlsdGVyLmMKLW5ldyBmaWxlIG1vZGUgMTAwNjQ0Ci1pbmRleCAwMDAwMDAw
MC4uNWMzMDFkNTIKLS0tLSAvZGV2L251bGwKLSsrKyBiL2xpYmFyY2hpdmUvdGVzdC90ZXN0X2Fy
Y2hpdmVfcmVhZF9hcHBlbmRfZmlsdGVyLmMKLUBAIC0wLDAgKzEsNTQgQEAKLSsvKi0KLSsgKiBD
b3B5cmlnaHQgKGMpIDIwMjYgVG9iaWFzIFN0b2Vja21hbm4KLSsgKiBBbGwgcmlnaHRzIHJlc2Vy
dmVkLgotKyAqCi0rICogUmVkaXN0cmlidXRpb24gYW5kIHVzZSBpbiBzb3VyY2UgYW5kIGJpbmFy
eSBmb3Jtcywgd2l0aCBvciB3aXRob3V0Ci0rICogbW9kaWZpY2F0aW9uLCBhcmUgcGVybWl0dGVk
IHByb3ZpZGVkIHRoYXQgdGhlIGZvbGxvd2luZyBjb25kaXRpb25zCi0rICogYXJlIG1ldDoKLSsg
KiAxLiBSZWRpc3RyaWJ1dGlvbnMgb2Ygc291cmNlIGNvZGUgbXVzdCByZXRhaW4gdGhlIGFib3Zl
IGNvcHlyaWdodAotKyAqICAgIG5vdGljZSwgdGhpcyBsaXN0IG9mIGNvbmRpdGlvbnMgYW5kIHRo
ZSBmb2xsb3dpbmcgZGlzY2xhaW1lci4KLSsgKiAyLiBSZWRpc3RyaWJ1dGlvbnMgaW4gYmluYXJ5
IGZvcm0gbXVzdCByZXByb2R1Y2UgdGhlIGFib3ZlIGNvcHlyaWdodAotKyAqICAgIG5vdGljZSwg
dGhpcyBsaXN0IG9mIGNvbmRpdGlvbnMgYW5kIHRoZSBmb2xsb3dpbmcgZGlzY2xhaW1lciBpbiB0
aGUKLSsgKiAgICBkb2N1bWVudGF0aW9uIGFuZC9vciBvdGhlciBtYXRlcmlhbHMgcHJvdmlkZWQg
d2l0aCB0aGUgZGlzdHJpYnV0aW9uLgotKyAqCi0rICogVEhJUyBTT0ZUV0FSRSBJUyBQUk9WSURF
RCBCWSBUSEUgQVVUSE9SKFMpIGBgQVMgSVMnJyBBTkQgQU5ZIEVYUFJFU1MgT1IKLSsgKiBJTVBM
SUVEIFdBUlJBTlRJRVMsIElOQ0xVRElORywgQlVUIE5PVCBMSU1JVEVEIFRPLCBUSEUgSU1QTElF
RCBXQVJSQU5USUVTCi0rICogT0YgTUVSQ0hBTlRBQklMSVRZIEFORCBGSVRORVNTIEZPUiBBIFBB
UlRJQ1VMQVIgUFVSUE9TRSBBUkUgRElTQ0xBSU1FRC4KLSsgKiBJTiBOTyBFVkVOVCBTSEFMTCBU
SEUgQVVUSE9SKFMpIEJFIExJQUJMRSBGT1IgQU5ZIERJUkVDVCwgSU5ESVJFQ1QsCi0rICogSU5D
SURFTlRBTCwgU1BFQ0lBTCwgRVhFTVBMQVJZLCBPUiBDT05TRVFVRU5USUFMIERBTUFHRVMgKElO
Q0xVRElORywgQlVUCi0rICogTk9UIExJTUlURUQgVE8sIFBST0NVUkVNRU5UIE9GIFNVQlNUSVRV
VEUgR09PRFMgT1IgU0VSVklDRVM7IExPU1MgT0YgVVNFLAotKyAqIERBVEEsIE9SIFBST0ZJVFM7
IE9SIEJVU0lORVNTIElOVEVSUlVQVElPTikgSE9XRVZFUiBDQVVTRUQgQU5EIE9OIEFOWQotKyAq
IFRIRU9SWSBPRiBMSUFCSUxJVFksIFdIRVRIRVIgSU4gQ09OVFJBQ1QsIFNUUklDVCBMSUFCSUxJ
VFksIE9SIFRPUlQKLSsgKiAoSU5DTFVESU5HIE5FR0xJR0VOQ0UgT1IgT1RIRVJXSVNFKSBBUklT
SU5HIElOIEFOWSBXQVkgT1VUIE9GIFRIRSBVU0UgT0YKLSsgKiBUSElTIFNPRlRXQVJFLCBFVkVO
IElGIEFEVklTRUQgT0YgVEhFIFBPU1NJQklMSVRZIE9GIFNVQ0ggREFNQUdFLgotKyAqLwotKwot
KyNpbmNsdWRlICJhcmNoaXZlLmgiCi0rI2luY2x1ZGUgInRlc3QuaCIKLSsKLStERUZJTkVfVEVT
VCh0ZXN0X2FyY2hpdmVfcmVhZF9hcHBlbmRfZmlsdGVyKQotK3sKLSsJc3RydWN0IGFyY2hpdmUg
KmE7Ci0rCWludCByOwotKwotKwlhID0gYXJjaGl2ZV9yZWFkX25ldygpOwotKwlhc3NlcnQoYSAh
PSBOVUxMKTsKLSsKLSsJLyogQXBwZW5kIGEgcHJvZ3JhbSBiaWRkZXIgKHdpdGhvdXQgZmlsdGVy
KS4gKi8KLSsJYXNzZXJ0RXF1YWxJbnRBKGEsIEFSQ0hJVkVfT0ssCi0rCSAgICBhcmNoaXZlX3Jl
YWRfc3VwcG9ydF9maWx0ZXJfcHJvZ3JhbShhLCAicHJvZzEiKSk7Ci0rCi0rCS8qIEFwcGVuZCBh
IGZpbHRlciBwcm9ncmFtIHdoaWNoIGNvbWVzIHdpdGggaXRzIG93biBiaWRkZXIuICovCi0rCXIg
PSBhcmNoaXZlX3JlYWRfYXBwZW5kX2ZpbHRlcl9wcm9ncmFtKGEsICJwcm9nMiIpOwotKwotKwkv
KiBWZXJpZnkgdGhhdCBmaWx0ZXIgdXNlcyBpdHMgb3duIGJpZGRlci4gKi8KLSsJaWYgKHIgPT0g
QVJDSElWRV9GQVRBTCkgewotKwkJYXNzZXJ0RXF1YWxTdHJpbmdBKGEsICJDYW4ndCBpbml0aWFs
aXplIGZpbHRlcjsgdW5hYmxlIHRvIHJ1biBwcm9ncmFtIFwicHJvZzJcIiIsCi0rCQkJYXJjaGl2
ZV9lcnJvcl9zdHJpbmcoYSkpOwotKwl9IGVsc2UgewotKwkJYXNzZXJ0RXF1YWxJbnRBKGEsIEFS
Q0hJVkVfT0ssIHIpOwotKwkJYXNzZXJ0RXF1YWxTdHJpbmdBKGEsICJQcm9ncmFtOiBwcm9nMiIs
IGFyY2hpdmVfZmlsdGVyX25hbWUoYSwgMCkpOwotKwl9Ci0rCi0rCWFyY2hpdmVfcmVhZF9mcmVl
KGEpOwotK30KLS0tIAotMi40OS4wCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
bGliYXJjaGl2ZS9saWJhcmNoaXZlLzAwMDEtdGVzdC1za2lwLXBwbWQ4LWFlczI1Ni1zdHJlYW1p
bmctdGVzdC13aGVuLW5vLWNyeXB0by5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJh
cmNoaXZlL2xpYmFyY2hpdmUvMDAwMS10ZXN0LXNraXAtcHBtZDgtYWVzMjU2LXN0cmVhbWluZy10
ZXN0LXdoZW4tbm8tY3J5cHRvLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBm
Yzk2MjI1MTQxLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJhcmNo
aXZlL2xpYmFyY2hpdmUvMDAwMS10ZXN0LXNraXAtcHBtZDgtYWVzMjU2LXN0cmVhbWluZy10ZXN0
LXdoZW4tbm8tY3J5cHRvLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsNDYgKzAsMCBAQAotRnJv
bSBjMmIwMGE1ZmZmNjU5YmJlOGQ3MGI1ZTAwY2I2YWJiODMxMTcwYWViIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQotRnJvbTogSmFpcGF1bCBDaGVlcm5hbSA8amFpcGF1bC5jaGVlcm5hbUBlc3Qu
dGVjaD4KLURhdGU6IFdlZCwgMjkgSnVsIDIwMjYgMTM6MzM6MTAgKzAwMDAKLVN1YmplY3Q6IFtQ
QVRDSF0gdGVzdDogc2tpcCBwcG1kOCBhZXMyNTYgc3RyZWFtaW5nIHRlc3Qgd2hlbiBubyBjcnlw
dG8gbGlicmFyeQotIGlzIHByZXNlbnQKLQotdGVzdF9yZWFkX2Zvcm1hdF96aXBfcHBtZDhfYWVz
MjU2X3N0cmVhbWluZyBmYWlscyB3aXRoIDYgYXNzZXJ0aW9uCi1mYWlsdXJlcyBvbiBzeXN0ZW1z
IHdpdGhvdXQgYSBjcnlwdG8gbGlicmFyeSAob3BlbnNzbC9uZXR0bGUvbWJlZHRscykKLWJlY2F1
c2UgaXQgdHJpZXMgdG8gZGVjcnlwdCBhIHByZS1idWlsdCBlbmNyeXB0ZWQgemlweCBmaWxlIHdp
dGhvdXQKLWNoZWNraW5nIGNyeXB0byBhdmFpbGFiaWxpdHkgZmlyc3QuCi0KLUFkZCB0aGUgc2Ft
ZSBndWFyZCB1c2VkIGJ5IHRoZSBvdGhlciBlbmNyeXB0ZWQgemlwIHRlc3RzIGluIHRoaXMgZmls
ZS4KLQotVXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQgW2h0dHBzOi8vZ2l0aHViLmNvbS9saWJh
cmNoaXZlL2xpYmFyY2hpdmUvcHVsbC8zMzM1XQotU2lnbmVkLW9mZi1ieTogSmFpcGF1bCBDaGVl
cm5hbSA8amFpcGF1bC5jaGVlcm5hbUBlc3QudGVjaD4KLS0tLQotIC4uLi90ZXN0L3Rlc3RfcmVh
ZF9mb3JtYXRfemlwX3ppcHhfZW5jcnlwdGVkLmMgICAgIHwgMTQgKysrKysrKysrKysrKysKLSAx
IGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQotCi1kaWZmIC0tZ2l0IGEvbGliYXJjaGl2
ZS90ZXN0L3Rlc3RfcmVhZF9mb3JtYXRfemlwX3ppcHhfZW5jcnlwdGVkLmMgYi9saWJhcmNoaXZl
L3Rlc3QvdGVzdF9yZWFkX2Zvcm1hdF96aXBfemlweF9lbmNyeXB0ZWQuYwotaW5kZXggZjA3ZTFl
NWMuLmEwYTQzMWZiIDEwMDY0NAotLS0tIGEvbGliYXJjaGl2ZS90ZXN0L3Rlc3RfcmVhZF9mb3Jt
YXRfemlwX3ppcHhfZW5jcnlwdGVkLmMKLSsrKyBiL2xpYmFyY2hpdmUvdGVzdC90ZXN0X3JlYWRf
Zm9ybWF0X3ppcF96aXB4X2VuY3J5cHRlZC5jCi1AQCAtMjU3LDggKzI1NywyMiBAQCBERUZJTkVf
VEVTVCh0ZXN0X3JlYWRfZm9ybWF0X3ppcF96aXB4X3pzdGRfZW5jcnlwdGVkX3N0cmVhbWluZykK
LSBERUZJTkVfVEVTVCh0ZXN0X3JlYWRfZm9ybWF0X3ppcF9wcG1kOF9hZXMyNTZfc3RyZWFtaW5n
KQotIHsKLSAJY29uc3QgY2hhciAqcmVmbmFtZSA9ICJ0ZXN0X3JlYWRfZm9ybWF0X3ppcF9wcG1k
OF9hZXMyNTZfc3RyZWFtaW5nLnppcHgiOwotKwlzdHJ1Y3QgYXJjaGl2ZSAqYTsKLSAJc2l6ZV90
IHVzZWQ7Ci0gCWNoYXIgYnVmZls2MDBdOwotKwotKwkvKiBDaGVjayBpZiBydW5uaW5nIHN5c3Rl
bSBoYXMgY3J5cHRvZ3JhcGhpYyBmdW5jdGlvbmFsaXR5LiAqLwotKwlhc3NlcnQoKGEgPSBhcmNo
aXZlX3dyaXRlX25ldygpKSAhPSBOVUxMKTsKLSsJYXNzZXJ0RXF1YWxJbnRBKGEsIEFSQ0hJVkVf
T0ssIGFyY2hpdmVfd3JpdGVfc2V0X2Zvcm1hdF96aXAoYSkpOwotKwlhc3NlcnRFcXVhbEludEEo
YSwgQVJDSElWRV9PSywgYXJjaGl2ZV93cml0ZV9hZGRfZmlsdGVyX25vbmUoYSkpOwotKwlpZiAo
QVJDSElWRV9PSyAhPSBhcmNoaXZlX3dyaXRlX3NldF9vcHRpb25zKGEsCi0rCQkJInppcDplbmNy
eXB0aW9uPWFlczI1NiIpKSB7Ci0rCQlza2lwcGluZygiVGhpcyBzeXN0ZW0gZG9lcyBub3QgaGF2
ZSBjcnlwdG9ncmFwaGljIGxpYnJhcnkiKTsKLSsJCWFyY2hpdmVfd3JpdGVfZnJlZShhKTsKLSsJ
CXJldHVybjsKLSsJfQotKwlhcmNoaXZlX3dyaXRlX2ZyZWUoYSk7Ci0rCi0gCWV4dHJhY3RfcmVm
ZXJlbmNlX2ZpbGUocmVmbmFtZSk7Ci0gCUZJTEUgKmYgPSBmb3BlbihyZWZuYW1lLCAicmIiKTsK
LSAJdXNlZCA9IGZyZWFkKGJ1ZmYsIDEsIHNpemVvZihidWZmKSwgZik7CmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGliYXJjaGl2ZS9saWJhcmNoaXZlLzAwMDMtUmVtb3ZlLWJp
ZGRlci1uYW1lLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUvbGliYXJj
aGl2ZS8wMDAzLVJlbW92ZS1iaWRkZXItbmFtZS5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2
NDQKaW5kZXggYmJkMjQ3ODU3Ny4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvbGliYXJjaGl2ZS9saWJhcmNoaXZlLzAwMDMtUmVtb3ZlLWJpZGRlci1uYW1lLnBhdGNoCisr
KyAvZGV2L251bGwKQEAgLTEsMjU4ICswLDAgQEAKLUZyb20gNzZjNzE0MmJkMjU5NTE4NDgyNjcy
MjA2MzU5OGZkZGY2MjAzMWNjYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IFRvYmlh
cyBTdG9lY2ttYW5uIDx0b2JpYXNAc3RvZWNrbWFubi5vcmc+Ci1EYXRlOiBTdW4sIDIgQXVnIDIw
MjYgMTQ6MzE6MzMgKzAyMDAKLVN1YmplY3Q6IFtQQVRDSCAzLzNdIFJlbW92ZSBiaWRkZXIgbmFt
ZQotCi1UaGUgbmFtZSB3YXMgb25seSBuZWVkZWQgdG8gZmluZCB0aGUgYXBwcm9wcmlhdGUgYmlk
ZGVyIGZvciBhIGZpbHRlci4KLVNpbmNlIHRoaXMgaGFzIGJlZW4gcmVzb2x2ZWQgYnkgYWNjZXNz
aW5nIHRoZSBsYXN0IGJpZGRlciwgc2luY2UgaW4gdGhlc2UKLXNpdHVhdGlvbnMgdGhlIGJpZGRl
ciBpcyBhZGRlZCBmaXJzdCwgdGhlbiB0aGUgZmlsdGVyLCB0aGUgbmFtZSBpcyBub3QKLW5lZWRl
ZCBhbnltb3JlLgotCi1VcHN0cmVhbS1TdGF0dXM6IFN1Ym1pdHRlZCBbaHR0cHM6Ly9naXRodWIu
Y29tL2xpYmFyY2hpdmUvbGliYXJjaGl2ZS9wdWxsLzMzNDZdCi1TaWduZWQtb2ZmLWJ5OiBUb2Jp
YXMgU3RvZWNrbWFubiA8dG9iaWFzQHN0b2Vja21hbm4ub3JnPgotU2lnbmVkLW9mZi1ieTogU3Vt
YW50aCBHYXZpbmkgPHN1bWFudGguZ2F2aW5pQHdpbmRyaXZlci5jb20+Ci0tLS0KLSBsaWJhcmNo
aXZlL2FyY2hpdmVfcmVhZC5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiAtLQotIGxpYmFy
Y2hpdmUvYXJjaGl2ZV9yZWFkX2FwcGVuZF9maWx0ZXIuYyAgICAgICAgICAgfCAxIC0KLSBsaWJh
cmNoaXZlL2FyY2hpdmVfcmVhZF9wcml2YXRlLmggICAgICAgICAgICAgICAgIHwgMyAtLS0KLSBs
aWJhcmNoaXZlL2FyY2hpdmVfcmVhZF9zdXBwb3J0X2ZpbHRlcl9iemlwMi5jICAgIHwgMiArLQot
IGxpYmFyY2hpdmUvYXJjaGl2ZV9yZWFkX3N1cHBvcnRfZmlsdGVyX2NvbXByZXNzLmMgfCAyICst
Ci0gbGliYXJjaGl2ZS9hcmNoaXZlX3JlYWRfc3VwcG9ydF9maWx0ZXJfZ3J6aXAuYyAgICB8IDIg
Ky0KLSBsaWJhcmNoaXZlL2FyY2hpdmVfcmVhZF9zdXBwb3J0X2ZpbHRlcl9nemlwLmMgICAgIHwg
MiArLQotIGxpYmFyY2hpdmUvYXJjaGl2ZV9yZWFkX3N1cHBvcnRfZmlsdGVyX2xyemlwLmMgICAg
fCAyICstCi0gbGliYXJjaGl2ZS9hcmNoaXZlX3JlYWRfc3VwcG9ydF9maWx0ZXJfbHo0LmMgICAg
ICB8IDIgKy0KLSBsaWJhcmNoaXZlL2FyY2hpdmVfcmVhZF9zdXBwb3J0X2ZpbHRlcl9sem9wLmMg
ICAgIHwgMiArLQotIGxpYmFyY2hpdmUvYXJjaGl2ZV9yZWFkX3N1cHBvcnRfZmlsdGVyX3Byb2dy
YW0uYyAgfCAyICstCi0gbGliYXJjaGl2ZS9hcmNoaXZlX3JlYWRfc3VwcG9ydF9maWx0ZXJfcnBt
LmMgICAgICB8IDIgKy0KLSBsaWJhcmNoaXZlL2FyY2hpdmVfcmVhZF9zdXBwb3J0X2ZpbHRlcl91
dS5jICAgICAgIHwgMiArLQotIGxpYmFyY2hpdmUvYXJjaGl2ZV9yZWFkX3N1cHBvcnRfZmlsdGVy
X3h6LmMgICAgICAgfCA2ICsrKy0tLQotIGxpYmFyY2hpdmUvYXJjaGl2ZV9yZWFkX3N1cHBvcnRf
ZmlsdGVyX3pzdGQuYyAgICAgfCAyICstCi0gMTUgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9u
cygrKSwgMjAgZGVsZXRpb25zKC0pCi0KLWRpZmYgLS1naXQgYS9saWJhcmNoaXZlL2FyY2hpdmVf
cmVhZC5jIGIvbGliYXJjaGl2ZS9hcmNoaXZlX3JlYWQuYwotaW5kZXggZTg0NGU0MmQuLjQwNmQ4
NGRlIDEwMDY0NAotLS0tIGEvbGliYXJjaGl2ZS9hcmNoaXZlX3JlYWQuYwotKysrIGIvbGliYXJj
aGl2ZS9hcmNoaXZlX3JlYWQuYwotQEAgLTEyOTAsNyArMTI5MCw2IEBAIF9fYXJjaGl2ZV9yZWFk
X3JlZ2lzdGVyX2Zvcm1hdChzdHJ1Y3QgYXJjaGl2ZV9yZWFkICphLAotIGludAotIF9fYXJjaGl2
ZV9yZWFkX3JlZ2lzdGVyX2JpZGRlcihzdHJ1Y3QgYXJjaGl2ZV9yZWFkICphLAotIAl2b2lkICpi
aWRkZXJfZGF0YSwKLS0JY29uc3QgY2hhciAqbmFtZSwKLSAJY29uc3Qgc3RydWN0IGFyY2hpdmVf
cmVhZF9maWx0ZXJfYmlkZGVyX3Z0YWJsZSAqdnRhYmxlKQotIHsKLSAJc3RydWN0IGFyY2hpdmVf
cmVhZF9maWx0ZXJfYmlkZGVyICpiaWRkZXI7Ci1AQCAtMTMwNyw3ICsxMzA2LDYgQEAgX19hcmNo
aXZlX3JlYWRfcmVnaXN0ZXJfYmlkZGVyKHN0cnVjdCBhcmNoaXZlX3JlYWQgKmEsCi0gCQltZW1z
ZXQoYS0+YmlkZGVycyArIGksIDAsIHNpemVvZihhLT5iaWRkZXJzWzBdKSk7Ci0gCQliaWRkZXIg
PSAoYS0+YmlkZGVycyArIGkpOwotIAkJYmlkZGVyLT5kYXRhID0gYmlkZGVyX2RhdGE7Ci0tCQli
aWRkZXItPm5hbWUgPSBuYW1lOwotIAkJYmlkZGVyLT52dGFibGUgPSB2dGFibGU7Ci0gCQlpZiAo
YmlkZGVyLT52dGFibGUtPmJpZCA9PSBOVUxMIHx8IGJpZGRlci0+dnRhYmxlLT5pbml0ID09IE5V
TEwpIHsKLSAJCQlhcmNoaXZlX3NldF9lcnJvcigmYS0+YXJjaGl2ZSwgQVJDSElWRV9FUlJOT19Q
Uk9HUkFNTUVSLAotZGlmZiAtLWdpdCBhL2xpYmFyY2hpdmUvYXJjaGl2ZV9yZWFkX2FwcGVuZF9m
aWx0ZXIuYyBiL2xpYmFyY2hpdmUvYXJjaGl2ZV9yZWFkX2FwcGVuZF9maWx0ZXIuYwotaW5kZXgg
OWRkOWY1MzYuLjVjYzhmZjU1IDEwMDY0NAotLS0tIGEvbGliYXJjaGl2ZS9hcmNoaXZlX3JlYWRf
YXBwZW5kX2ZpbHRlci5jCi0rKysgYi9saWJhcmNoaXZlL2FyY2hpdmVfcmVhZF9hcHBlbmRfZmls
dGVyLmMKLUBAIC0xNzQsNyArMTc0LDYgQEAgYXJjaGl2ZV9yZWFkX2FwcGVuZF9maWx0ZXJfcHJv
Z3JhbV9zaWduYXR1cmUoc3RydWN0IGFyY2hpdmUgKl9hLAotICAgICBfX2FyY2hpdmVfcmVhZF9m
cmVlX2ZpbHRlcnMoYSk7Ci0gICAgIHJldHVybiAoQVJDSElWRV9GQVRBTCk7Ci0gICB9Ci0tICBi
LT5uYW1lID0gYS0+ZmlsdGVyLT5uYW1lOwotIAotICAgYS0+YnlwYXNzX2ZpbHRlcl9iaWRkaW5n
ID0gMTsKLSAgIHJldHVybiByOwotZGlmZiAtLWdpdCBhL2xpYmFyY2hpdmUvYXJjaGl2ZV9yZWFk
X3ByaXZhdGUuaCBiL2xpYmFyY2hpdmUvYXJjaGl2ZV9yZWFkX3ByaXZhdGUuaAotaW5kZXggM2Jk
OGRlMmQuLmUzMGI2YzJiIDEwMDY0NAotLS0tIGEvbGliYXJjaGl2ZS9hcmNoaXZlX3JlYWRfcHJp
dmF0ZS5oCi0rKysgYi9saWJhcmNoaXZlL2FyY2hpdmVfcmVhZF9wcml2YXRlLmgKLUBAIC02OCw4
ICs2OCw2IEBAIHN0cnVjdCBhcmNoaXZlX3JlYWRfZmlsdGVyX2JpZGRlcl92dGFibGUgewotIHN0
cnVjdCBhcmNoaXZlX3JlYWRfZmlsdGVyX2JpZGRlciB7Ci0gCS8qIENvbmZpZ3VyYXRpb24gZGF0
YSBmb3IgdGhlIGJpZGRlci4gKi8KLSAJdm9pZCAqZGF0YTsKLS0JLyogTmFtZSBvZiB0aGUgZmls
dGVyICovCi0tCWNvbnN0IGNoYXIgKm5hbWU7Ci0gCWNvbnN0IHN0cnVjdCBhcmNoaXZlX3JlYWRf
ZmlsdGVyX2JpZGRlcl92dGFibGUgKnZ0YWJsZTsKLSB9OwotIAotQEAgLTI1MCw3ICsyNDgsNiBA
QCBpbnQJX19hcmNoaXZlX3JlYWRfcmVnaXN0ZXJfZm9ybWF0KHN0cnVjdCBhcmNoaXZlX3JlYWQg
KmEsCi0gCi0gaW50IF9fYXJjaGl2ZV9yZWFkX3JlZ2lzdGVyX2JpZGRlcihzdHJ1Y3QgYXJjaGl2
ZV9yZWFkICphLAotIAkJdm9pZCAqYmlkZGVyX2RhdGEsCi0tCQljb25zdCBjaGFyICpuYW1lLAot
IAkJY29uc3Qgc3RydWN0IGFyY2hpdmVfcmVhZF9maWx0ZXJfYmlkZGVyX3Z0YWJsZSAqdnRhYmxl
KTsKLSAKLSBjb25zdCB2b2lkICpfX2FyY2hpdmVfcmVhZF9haGVhZChzdHJ1Y3QgYXJjaGl2ZV9y
ZWFkICosIHNpemVfdCwgc3NpemVfdCAqKTsKLWRpZmYgLS1naXQgYS9saWJhcmNoaXZlL2FyY2hp
dmVfcmVhZF9zdXBwb3J0X2ZpbHRlcl9iemlwMi5jIGIvbGliYXJjaGl2ZS9hcmNoaXZlX3JlYWRf
c3VwcG9ydF9maWx0ZXJfYnppcDIuYwotaW5kZXggNTg4OTUzZjIuLjFjZmM1NWRjIDEwMDY0NAot
LS0tIGEvbGliYXJjaGl2ZS9hcmNoaXZlX3JlYWRfc3VwcG9ydF9maWx0ZXJfYnppcDIuYwotKysr
IGIvbGliYXJjaGl2ZS9hcmNoaXZlX3JlYWRfc3VwcG9ydF9maWx0ZXJfYnppcDIuYwotQEAgLTkx
LDcgKzkxLDcgQEAgYXJjaGl2ZV9yZWFkX3N1cHBvcnRfZmlsdGVyX2J6aXAyKHN0cnVjdCBhcmNo
aXZlICpfYSkKLSB7Ci0gCXN0cnVjdCBhcmNoaXZlX3JlYWQgKmEgPSAoc3RydWN0IGFyY2hpdmVf
cmVhZCAqKV9hOwotIAotLQlpZiAoX19hcmNoaXZlX3JlYWRfcmVnaXN0ZXJfYmlkZGVyKGEsIE5V
TEwsICJiemlwMiIsCi0rCWlmIChfX2FyY2hpdmVfcmVhZF9yZWdpc3Rlcl9iaWRkZXIoYSwgTlVM
TCwKLSAJCQkJJmJ6aXAyX2JpZGRlcl92dGFibGUpICE9IEFSQ0hJVkVfT0spCi0gCQlyZXR1cm4g
KEFSQ0hJVkVfRkFUQUwpOwotIAotZGlmZiAtLWdpdCBhL2xpYmFyY2hpdmUvYXJjaGl2ZV9yZWFk
X3N1cHBvcnRfZmlsdGVyX2NvbXByZXNzLmMgYi9saWJhcmNoaXZlL2FyY2hpdmVfcmVhZF9zdXBw
b3J0X2ZpbHRlcl9jb21wcmVzcy5jCi1pbmRleCA0ZTFmMWRjNS4uNDc2Mzk5NWUgMTAwNjQ0Ci0t
LS0gYS9saWJhcmNoaXZlL2FyY2hpdmVfcmVhZF9zdXBwb3J0X2ZpbHRlcl9jb21wcmVzcy5jCi0r
KysgYi9saWJhcmNoaXZlL2FyY2hpdmVfcmVhZF9zdXBwb3J0X2ZpbHRlcl9jb21wcmVzcy5jCi1A
QCAtMTYwLDcgKzE2MCw3IEBAIGFyY2hpdmVfcmVhZF9zdXBwb3J0X2ZpbHRlcl9jb21wcmVzcyhz
dHJ1Y3QgYXJjaGl2ZSAqX2EpCi0gewotIAlzdHJ1Y3QgYXJjaGl2ZV9yZWFkICphID0gKHN0cnVj
dCBhcmNoaXZlX3JlYWQgKilfYTsKLSAKLS0JcmV0dXJuIF9fYXJjaGl2ZV9yZWFkX3JlZ2lzdGVy
X2JpZGRlcihhLCBOVUxMLCAiY29tcHJlc3MgKC5aKSIsCi0rCXJldHVybiBfX2FyY2hpdmVfcmVh
ZF9yZWdpc3Rlcl9iaWRkZXIoYSwgTlVMTCwKLSAJCQkmY29tcHJlc3NfYmlkZGVyX3Z0YWJsZSk7
Ci0gfQotIAotZGlmZiAtLWdpdCBhL2xpYmFyY2hpdmUvYXJjaGl2ZV9yZWFkX3N1cHBvcnRfZmls
dGVyX2dyemlwLmMgYi9saWJhcmNoaXZlL2FyY2hpdmVfcmVhZF9zdXBwb3J0X2ZpbHRlcl9ncnpp
cC5jCi1pbmRleCA5ZDlhZDQ2ZS4uODQ1N2VjN2MgMTAwNjQ0Ci0tLS0gYS9saWJhcmNoaXZlL2Fy
Y2hpdmVfcmVhZF9zdXBwb3J0X2ZpbHRlcl9ncnppcC5jCi0rKysgYi9saWJhcmNoaXZlL2FyY2hp
dmVfcmVhZF9zdXBwb3J0X2ZpbHRlcl9ncnppcC5jCi1AQCAtNjIsNyArNjIsNyBAQCBhcmNoaXZl
X3JlYWRfc3VwcG9ydF9maWx0ZXJfZ3J6aXAoc3RydWN0IGFyY2hpdmUgKl9hKQotIHsKLSAJc3Ry
dWN0IGFyY2hpdmVfcmVhZCAqYSA9IChzdHJ1Y3QgYXJjaGl2ZV9yZWFkICopX2E7Ci0gCi0tCWlm
IChfX2FyY2hpdmVfcmVhZF9yZWdpc3Rlcl9iaWRkZXIoYSwgTlVMTCwgImdyemlwIiwKLSsJaWYg
KF9fYXJjaGl2ZV9yZWFkX3JlZ2lzdGVyX2JpZGRlcihhLCBOVUxMLAotIAkJCQkmZ3J6aXBfYmlk
ZGVyX3Z0YWJsZSkgIT0gQVJDSElWRV9PSykKLSAJCXJldHVybiAoQVJDSElWRV9GQVRBTCk7Ci0g
Ci1kaWZmIC0tZ2l0IGEvbGliYXJjaGl2ZS9hcmNoaXZlX3JlYWRfc3VwcG9ydF9maWx0ZXJfZ3pp
cC5jIGIvbGliYXJjaGl2ZS9hcmNoaXZlX3JlYWRfc3VwcG9ydF9maWx0ZXJfZ3ppcC5jCi1pbmRl
eCA4OWFlMGYzNy4uMzRiMTc0YjcgMTAwNjQ0Ci0tLS0gYS9saWJhcmNoaXZlL2FyY2hpdmVfcmVh
ZF9zdXBwb3J0X2ZpbHRlcl9nemlwLmMKLSsrKyBiL2xpYmFyY2hpdmUvYXJjaGl2ZV9yZWFkX3N1
cHBvcnRfZmlsdGVyX2d6aXAuYwotQEAgLTk2LDcgKzk2LDcgQEAgYXJjaGl2ZV9yZWFkX3N1cHBv
cnRfZmlsdGVyX2d6aXAoc3RydWN0IGFyY2hpdmUgKl9hKQotIHsKLSAJc3RydWN0IGFyY2hpdmVf
cmVhZCAqYSA9IChzdHJ1Y3QgYXJjaGl2ZV9yZWFkICopX2E7Ci0gCi0tCWlmIChfX2FyY2hpdmVf
cmVhZF9yZWdpc3Rlcl9iaWRkZXIoYSwgTlVMTCwgImd6aXAiLAotKwlpZiAoX19hcmNoaXZlX3Jl
YWRfcmVnaXN0ZXJfYmlkZGVyKGEsIE5VTEwsCi0gCQkJCSZnemlwX2JpZGRlcl92dGFibGUpICE9
IEFSQ0hJVkVfT0spCi0gCQlyZXR1cm4gKEFSQ0hJVkVfRkFUQUwpOwotIAotZGlmZiAtLWdpdCBh
L2xpYmFyY2hpdmUvYXJjaGl2ZV9yZWFkX3N1cHBvcnRfZmlsdGVyX2xyemlwLmMgYi9saWJhcmNo
aXZlL2FyY2hpdmVfcmVhZF9zdXBwb3J0X2ZpbHRlcl9scnppcC5jCi1pbmRleCAzMzkxMGZlMS4u
YTFkNDVkNzcgMTAwNjQ0Ci0tLS0gYS9saWJhcmNoaXZlL2FyY2hpdmVfcmVhZF9zdXBwb3J0X2Zp
bHRlcl9scnppcC5jCi0rKysgYi9saWJhcmNoaXZlL2FyY2hpdmVfcmVhZF9zdXBwb3J0X2ZpbHRl
cl9scnppcC5jCi1AQCAtNjEsNyArNjEsNyBAQCBhcmNoaXZlX3JlYWRfc3VwcG9ydF9maWx0ZXJf
bHJ6aXAoc3RydWN0IGFyY2hpdmUgKl9hKQotIHsKLSAJc3RydWN0IGFyY2hpdmVfcmVhZCAqYSA9
IChzdHJ1Y3QgYXJjaGl2ZV9yZWFkICopX2E7Ci0gCi0tCWlmIChfX2FyY2hpdmVfcmVhZF9yZWdp
c3Rlcl9iaWRkZXIoYSwgTlVMTCwgImxyemlwIiwKLSsJaWYgKF9fYXJjaGl2ZV9yZWFkX3JlZ2lz
dGVyX2JpZGRlcihhLCBOVUxMLAotIAkJCQkmbHJ6aXBfYmlkZGVyX3Z0YWJsZSkgIT0gQVJDSElW
RV9PSykKLSAJCXJldHVybiAoQVJDSElWRV9GQVRBTCk7Ci0gCi1kaWZmIC0tZ2l0IGEvbGliYXJj
aGl2ZS9hcmNoaXZlX3JlYWRfc3VwcG9ydF9maWx0ZXJfbHo0LmMgYi9saWJhcmNoaXZlL2FyY2hp
dmVfcmVhZF9zdXBwb3J0X2ZpbHRlcl9sejQuYwotaW5kZXggMTkwODZhMWYuLjI4MTg5YTA3IDEw
MDY0NAotLS0tIGEvbGliYXJjaGl2ZS9hcmNoaXZlX3JlYWRfc3VwcG9ydF9maWx0ZXJfbHo0LmMK
LSsrKyBiL2xpYmFyY2hpdmUvYXJjaGl2ZV9yZWFkX3N1cHBvcnRfZmlsdGVyX2x6NC5jCi1AQCAt
MTE4LDcgKzExOCw3IEBAIGFyY2hpdmVfcmVhZF9zdXBwb3J0X2ZpbHRlcl9sejQoc3RydWN0IGFy
Y2hpdmUgKl9hKQotIHsKLSAJc3RydWN0IGFyY2hpdmVfcmVhZCAqYSA9IChzdHJ1Y3QgYXJjaGl2
ZV9yZWFkICopX2E7Ci0gCi0tCWlmIChfX2FyY2hpdmVfcmVhZF9yZWdpc3Rlcl9iaWRkZXIoYSwg
TlVMTCwgImx6NCIsCi0rCWlmIChfX2FyY2hpdmVfcmVhZF9yZWdpc3Rlcl9iaWRkZXIoYSwgTlVM
TCwKLSAJCQkJJmx6NF9iaWRkZXJfdnRhYmxlKSAhPSBBUkNISVZFX09LKQotIAkJcmV0dXJuIChB
UkNISVZFX0ZBVEFMKTsKLSAKLWRpZmYgLS1naXQgYS9saWJhcmNoaXZlL2FyY2hpdmVfcmVhZF9z
dXBwb3J0X2ZpbHRlcl9sem9wLmMgYi9saWJhcmNoaXZlL2FyY2hpdmVfcmVhZF9zdXBwb3J0X2Zp
bHRlcl9sem9wLmMKLWluZGV4IGViZmFmMDFlLi41YTU1MmZjZSAxMDA2NDQKLS0tLSBhL2xpYmFy
Y2hpdmUvYXJjaGl2ZV9yZWFkX3N1cHBvcnRfZmlsdGVyX2x6b3AuYwotKysrIGIvbGliYXJjaGl2
ZS9hcmNoaXZlX3JlYWRfc3VwcG9ydF9maWx0ZXJfbHpvcC5jCi1AQCAtMTA5LDcgKzEwOSw3IEBA
IGFyY2hpdmVfcmVhZF9zdXBwb3J0X2ZpbHRlcl9sem9wKHN0cnVjdCBhcmNoaXZlICpfYSkKLSB7
Ci0gCXN0cnVjdCBhcmNoaXZlX3JlYWQgKmEgPSAoc3RydWN0IGFyY2hpdmVfcmVhZCAqKV9hOwot
IAotLQlpZiAoX19hcmNoaXZlX3JlYWRfcmVnaXN0ZXJfYmlkZGVyKGEsIE5VTEwsICJsem9wIiwK
LSsJaWYgKF9fYXJjaGl2ZV9yZWFkX3JlZ2lzdGVyX2JpZGRlcihhLCBOVUxMLAotIAkJCQkmbHpv
cF9iaWRkZXJfdnRhYmxlKSAhPSBBUkNISVZFX09LKQotIAkJcmV0dXJuIChBUkNISVZFX0ZBVEFM
KTsKLSAKLWRpZmYgLS1naXQgYS9saWJhcmNoaXZlL2FyY2hpdmVfcmVhZF9zdXBwb3J0X2ZpbHRl
cl9wcm9ncmFtLmMgYi9saWJhcmNoaXZlL2FyY2hpdmVfcmVhZF9zdXBwb3J0X2ZpbHRlcl9wcm9n
cmFtLmMKLWluZGV4IGNmN2MzNjEzLi5hOWUwMmEzMiAxMDA2NDQKLS0tLSBhL2xpYmFyY2hpdmUv
YXJjaGl2ZV9yZWFkX3N1cHBvcnRfZmlsdGVyX3Byb2dyYW0uYwotKysrIGIvbGliYXJjaGl2ZS9h
cmNoaXZlX3JlYWRfc3VwcG9ydF9maWx0ZXJfcHJvZ3JhbS5jCi1AQCAtMTU2LDcgKzE1Niw3IEBA
IGFyY2hpdmVfcmVhZF9zdXBwb3J0X2ZpbHRlcl9wcm9ncmFtX3NpZ25hdHVyZShzdHJ1Y3QgYXJj
aGl2ZSAqX2EsCi0gCQltZW1jcHkoc3RhdGUtPnNpZ25hdHVyZSwgc2lnbmF0dXJlLCBzaWduYXR1
cmVfbGVuKTsKLSAJfQotIAotLQlpZiAoX19hcmNoaXZlX3JlYWRfcmVnaXN0ZXJfYmlkZGVyKGEs
IHN0YXRlLCBOVUxMLAotKwlpZiAoX19hcmNoaXZlX3JlYWRfcmVnaXN0ZXJfYmlkZGVyKGEsIHN0
YXRlLAotIAkJCQkmcHJvZ3JhbV9iaWRkZXJfdnRhYmxlKSAhPSBBUkNISVZFX09LKSB7Ci0gCQlm
cmVlX3N0YXRlKHN0YXRlKTsKLSAJCXJldHVybiAoQVJDSElWRV9GQVRBTCk7Ci1kaWZmIC0tZ2l0
IGEvbGliYXJjaGl2ZS9hcmNoaXZlX3JlYWRfc3VwcG9ydF9maWx0ZXJfcnBtLmMgYi9saWJhcmNo
aXZlL2FyY2hpdmVfcmVhZF9zdXBwb3J0X2ZpbHRlcl9ycG0uYwotaW5kZXggMDFiZDFiZjcuLjFj
ZmRkZjc1IDEwMDY0NAotLS0tIGEvbGliYXJjaGl2ZS9hcmNoaXZlX3JlYWRfc3VwcG9ydF9maWx0
ZXJfcnBtLmMKLSsrKyBiL2xpYmFyY2hpdmUvYXJjaGl2ZV9yZWFkX3N1cHBvcnRfZmlsdGVyX3Jw
bS5jCi1AQCAtNzEsNyArNzEsNyBAQCBhcmNoaXZlX3JlYWRfc3VwcG9ydF9maWx0ZXJfcnBtKHN0
cnVjdCBhcmNoaXZlICpfYSkKLSB7Ci0gCXN0cnVjdCBhcmNoaXZlX3JlYWQgKmEgPSAoc3RydWN0
IGFyY2hpdmVfcmVhZCAqKV9hOwotIAotLQlyZXR1cm4gX19hcmNoaXZlX3JlYWRfcmVnaXN0ZXJf
YmlkZGVyKGEsIE5VTEwsICJycG0iLAotKwlyZXR1cm4gX19hcmNoaXZlX3JlYWRfcmVnaXN0ZXJf
YmlkZGVyKGEsIE5VTEwsCi0gCQkJJnJwbV9iaWRkZXJfdnRhYmxlKTsKLSB9Ci0gCi1kaWZmIC0t
Z2l0IGEvbGliYXJjaGl2ZS9hcmNoaXZlX3JlYWRfc3VwcG9ydF9maWx0ZXJfdXUuYyBiL2xpYmFy
Y2hpdmUvYXJjaGl2ZV9yZWFkX3N1cHBvcnRfZmlsdGVyX3V1LmMKLWluZGV4IGMwZjZmNDhlLi4x
MGQ0OTY0OCAxMDA2NDQKLS0tLSBhL2xpYmFyY2hpdmUvYXJjaGl2ZV9yZWFkX3N1cHBvcnRfZmls
dGVyX3V1LmMKLSsrKyBiL2xpYmFyY2hpdmUvYXJjaGl2ZV9yZWFkX3N1cHBvcnRfZmlsdGVyX3V1
LmMKLUBAIC05Miw3ICs5Miw3IEBAIGFyY2hpdmVfcmVhZF9zdXBwb3J0X2ZpbHRlcl91dShzdHJ1
Y3QgYXJjaGl2ZSAqX2EpCi0gewotIAlzdHJ1Y3QgYXJjaGl2ZV9yZWFkICphID0gKHN0cnVjdCBh
cmNoaXZlX3JlYWQgKilfYTsKLSAKLS0JcmV0dXJuIF9fYXJjaGl2ZV9yZWFkX3JlZ2lzdGVyX2Jp
ZGRlcihhLCBOVUxMLCAidXUiLAotKwlyZXR1cm4gX19hcmNoaXZlX3JlYWRfcmVnaXN0ZXJfYmlk
ZGVyKGEsIE5VTEwsCi0gCQkJJnV1ZGVjb2RlX2JpZGRlcl92dGFibGUpOwotIH0KLSAKLWRpZmYg
LS1naXQgYS9saWJhcmNoaXZlL2FyY2hpdmVfcmVhZF9zdXBwb3J0X2ZpbHRlcl94ei5jIGIvbGli
YXJjaGl2ZS9hcmNoaXZlX3JlYWRfc3VwcG9ydF9maWx0ZXJfeHouYwotaW5kZXggN2M4ZTBjYjUu
LmIwMGJhNTQzIDEwMDY0NAotLS0tIGEvbGliYXJjaGl2ZS9hcmNoaXZlX3JlYWRfc3VwcG9ydF9m
aWx0ZXJfeHouYwotKysrIGIvbGliYXJjaGl2ZS9hcmNoaXZlX3JlYWRfc3VwcG9ydF9maWx0ZXJf
eHouYwotQEAgLTExNSw3ICsxMTUsNyBAQCBhcmNoaXZlX3JlYWRfc3VwcG9ydF9maWx0ZXJfeHoo
c3RydWN0IGFyY2hpdmUgKl9hKQotIHsKLSAJc3RydWN0IGFyY2hpdmVfcmVhZCAqYSA9IChzdHJ1
Y3QgYXJjaGl2ZV9yZWFkICopX2E7Ci0gCi0tCWlmIChfX2FyY2hpdmVfcmVhZF9yZWdpc3Rlcl9i
aWRkZXIoYSwgTlVMTCwgInh6IiwKLSsJaWYgKF9fYXJjaGl2ZV9yZWFkX3JlZ2lzdGVyX2JpZGRl
cihhLCBOVUxMLAotIAkJCQkmeHpfYmlkZGVyX3Z0YWJsZSkgIT0gQVJDSElWRV9PSykKLSAJCXJl
dHVybiAoQVJDSElWRV9GQVRBTCk7Ci0gCi1AQCAtMTQ3LDcgKzE0Nyw3IEBAIGFyY2hpdmVfcmVh
ZF9zdXBwb3J0X2ZpbHRlcl9sem1hKHN0cnVjdCBhcmNoaXZlICpfYSkKLSB7Ci0gCXN0cnVjdCBh
cmNoaXZlX3JlYWQgKmEgPSAoc3RydWN0IGFyY2hpdmVfcmVhZCAqKV9hOwotIAotLQlpZiAoX19h
cmNoaXZlX3JlYWRfcmVnaXN0ZXJfYmlkZGVyKGEsIE5VTEwsICJsem1hIiwKLSsJaWYgKF9fYXJj
aGl2ZV9yZWFkX3JlZ2lzdGVyX2JpZGRlcihhLCBOVUxMLAotIAkJCQkmbHptYV9iaWRkZXJfdnRh
YmxlKSAhPSBBUkNISVZFX09LKQotIAkJcmV0dXJuIChBUkNISVZFX0ZBVEFMKTsKLSAKLUBAIC0x
ODAsNyArMTgwLDcgQEAgYXJjaGl2ZV9yZWFkX3N1cHBvcnRfZmlsdGVyX2x6aXAoc3RydWN0IGFy
Y2hpdmUgKl9hKQotIHsKLSAJc3RydWN0IGFyY2hpdmVfcmVhZCAqYSA9IChzdHJ1Y3QgYXJjaGl2
ZV9yZWFkICopX2E7Ci0gCi0tCWlmIChfX2FyY2hpdmVfcmVhZF9yZWdpc3Rlcl9iaWRkZXIoYSwg
TlVMTCwgImx6aXAiLAotKwlpZiAoX19hcmNoaXZlX3JlYWRfcmVnaXN0ZXJfYmlkZGVyKGEsIE5V
TEwsCi0gCQkJCSZsemlwX2JpZGRlcl92dGFibGUpICE9IEFSQ0hJVkVfT0spCi0gCQlyZXR1cm4g
KEFSQ0hJVkVfRkFUQUwpOwotIAotZGlmZiAtLWdpdCBhL2xpYmFyY2hpdmUvYXJjaGl2ZV9yZWFk
X3N1cHBvcnRfZmlsdGVyX3pzdGQuYyBiL2xpYmFyY2hpdmUvYXJjaGl2ZV9yZWFkX3N1cHBvcnRf
ZmlsdGVyX3pzdGQuYwotaW5kZXggMTJlYWMwNGMuLjE2M2Y1NGI1IDEwMDY0NAotLS0tIGEvbGli
YXJjaGl2ZS9hcmNoaXZlX3JlYWRfc3VwcG9ydF9maWx0ZXJfenN0ZC5jCi0rKysgYi9saWJhcmNo
aXZlL2FyY2hpdmVfcmVhZF9zdXBwb3J0X2ZpbHRlcl96c3RkLmMKLUBAIC04Nyw3ICs4Nyw3IEBA
IGFyY2hpdmVfcmVhZF9zdXBwb3J0X2ZpbHRlcl96c3RkKHN0cnVjdCBhcmNoaXZlICpfYSkKLSB7
Ci0gCXN0cnVjdCBhcmNoaXZlX3JlYWQgKmEgPSAoc3RydWN0IGFyY2hpdmVfcmVhZCAqKV9hOwot
IAotLQlpZiAoX19hcmNoaXZlX3JlYWRfcmVnaXN0ZXJfYmlkZGVyKGEsIE5VTEwsICJ6c3RkIiwK
LSsJaWYgKF9fYXJjaGl2ZV9yZWFkX3JlZ2lzdGVyX2JpZGRlcihhLCBOVUxMLAotIAkJCQkmenN0
ZF9iaWRkZXJfdnRhYmxlKSAhPSBBUkNISVZFX09LKQotIAkJcmV0dXJuIChBUkNISVZFX0ZBVEFM
KTsKLSAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJhcmNoaXZlL2xpYmFy
Y2hpdmUvMDAwNC1Db252ZXJ0LVJQTS1yZWFkZXItaW50by1hLXByb3Blci1mb3JtYXQucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGliYXJjaGl2ZS9saWJhcmNoaXZlLzAwMDQtQ29udmVy
dC1SUE0tcmVhZGVyLWludG8tYS1wcm9wZXItZm9ybWF0LnBhdGNoCmluZGV4IDAzYTIwN2YzM2Yu
LmUzMDliM2E4MzkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJhcmNoaXZl
L2xpYmFyY2hpdmUvMDAwNC1Db252ZXJ0LVJQTS1yZWFkZXItaW50by1hLXByb3Blci1mb3JtYXQu
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUvbGliYXJjaGl2ZS8w
MDA0LUNvbnZlcnQtUlBNLXJlYWRlci1pbnRvLWEtcHJvcGVyLWZvcm1hdC5wYXRjaApAQCAtMSw0
ICsxLDQgQEAKLUZyb20gMjYwNjMzNmJjZTNhN2Y2NmNjNmM4YWYyODY4N2E4MjUzNmM5MDg2YyBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYTIwZjk0MmFhODgzYTQ4MDIxYjY2ZGM2YTAw
Y2JhZTM0MmVlNjdiOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IERhdmlkZSBCZWF0
cmljaSA8Z2l0QGRhdmlkZWJlYXRyaWNpLmRldj4KIERhdGU6IFN1biwgOSBBdWcgMjAyNiAxNDox
NDo1OSAtMDcwMAogU3ViamVjdDogW1BBVENIXSBsaWJhcmNoaXZlOiBDb252ZXJ0IFJQTSByZWFk
ZXIgaW50byBhIHByb3BlciBmb3JtYXQKQEAgLTM4LDE0ICszOCwxNCBAQCBTaWduZWQtb2ZmLWJ5
OiBTdW1hbnRoIEdhdmluaSA8c3VtYW50aC5nYXZpbmlAd2luZHJpdmVyLmNvbT4KICAuLi4vdGVz
dF9yZWFkX2Zvcm1hdF9jcGlvX3N2cjRfYnppcDJfcnBtLmMgICAgfCAgICA0ICstCiAgLi4uL3Rl
c3RfcmVhZF9mb3JtYXRfY3Bpb19zdnI0X2d6aXBfcnBtLmMgICAgIHwgICAgNCArLQogIGxpYmFy
Y2hpdmUvdGVzdC90ZXN0X3JlYWRfZm9ybWF0X2h1Z2VfcnBtLmMgICB8ICAgMTMgKy0KLSAxNSBm
aWxlcyBjaGFuZ2VkLCAxMTY5IGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQorIDE1IGZp
bGVzIGNoYW5nZWQsIDExNjIgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IGxpYmFyY2hpdmUvYXJjaGl2ZV9yZWFkX3N1cHBvcnRfZm9ybWF0X3JwbS5j
CiAKIGRpZmYgLS1naXQgYS9NYWtlZmlsZS5hbSBiL01ha2VmaWxlLmFtCi1pbmRleCBjOTZiM2Jj
Li43MjVlMjBjIDEwMDY0NAoraW5kZXggOGJjNzBjNS4uNDg3YmVmMyAxMDA2NDQKIC0tLSBhL01h
a2VmaWxlLmFtCiArKysgYi9NYWtlZmlsZS5hbQotQEAgLTIxMCw2ICsyMTAsNyBAQCBsaWJhcmNo
aXZlX2xhX1NPVVJDRVM9IFwKK0BAIC0yMTIsNiArMjEyLDcgQEAgbGliYXJjaGl2ZV9sYV9TT1VS
Q0VTPSBcCiAgCWxpYmFyY2hpdmUvYXJjaGl2ZV9yZWFkX3N1cHBvcnRfZm9ybWF0X3Jhci5jIFwK
ICAJbGliYXJjaGl2ZS9hcmNoaXZlX3JlYWRfc3VwcG9ydF9mb3JtYXRfcmFyNS5jIFwKICAJbGli
YXJjaGl2ZS9hcmNoaXZlX3JlYWRfc3VwcG9ydF9mb3JtYXRfcmF3LmMgXApAQCAtNTQsNyArNTQs
NyBAQCBpbmRleCBjOTZiM2JjLi43MjVlMjBjIDEwMDY0NAogIAlsaWJhcmNoaXZlL2FyY2hpdmVf
cmVhZF9zdXBwb3J0X2Zvcm1hdF93YXJjLmMgXAogIAlsaWJhcmNoaXZlL2FyY2hpdmVfcmVhZF9z
dXBwb3J0X2Zvcm1hdF94YXIuYyBcCiBkaWZmIC0tZ2l0IGEvY29udHJpYi9hbmRyb2lkL0FuZHJv
aWQubWsgYi9jb250cmliL2FuZHJvaWQvQW5kcm9pZC5tawotaW5kZXggOWUxYzcyZi4uM2QxZjA4
NyAxMDA2NDQKK2luZGV4IGY4MWRjYjAuLjI0YWYyNWUgMTAwNjQ0CiAtLS0gYS9jb250cmliL2Fu
ZHJvaWQvQW5kcm9pZC5tawogKysrIGIvY29udHJpYi9hbmRyb2lkL0FuZHJvaWQubWsKIEBAIC05
MSw2ICs5MSw3IEBAIGxpYmFyY2hpdmVfc3JjX2ZpbGVzIDo9IGxpYmFyY2hpdmUvYXJjaGl2ZV9h
Y2wuYyBcCkBAIC02Niw3ICs2Niw3IEBAIGluZGV4IDllMWM3MmYuLjNkMWYwODcgMTAwNjQ0CiAg
CQkJCQkJbGliYXJjaGl2ZS9hcmNoaXZlX3JlYWRfc3VwcG9ydF9mb3JtYXRfd2FyYy5jIFwKICAJ
CQkJCQlsaWJhcmNoaXZlL2FyY2hpdmVfcmVhZF9zdXBwb3J0X2Zvcm1hdF94YXIuYyBcCiBkaWZm
IC0tZ2l0IGEvbGliYXJjaGl2ZS9DTWFrZUxpc3RzLnR4dCBiL2xpYmFyY2hpdmUvQ01ha2VMaXN0
cy50eHQKLWluZGV4IGIyOTY2MzcuLmQxMzIxMjMgMTAwNjQ0CitpbmRleCBhYzAzOWMxLi4zNGJh
MTczIDEwMDY0NAogLS0tIGEvbGliYXJjaGl2ZS9DTWFrZUxpc3RzLnR4dAogKysrIGIvbGliYXJj
aGl2ZS9DTWFrZUxpc3RzLnR4dAogQEAgLTExMCw2ICsxMTAsNyBAQCBTRVQobGliYXJjaGl2ZV9T
T1VSQ0VTCkBAIC03OCwxMCArNzgsMTAgQEAgaW5kZXggYjI5NjYzNy4uZDEzMjEyMyAxMDA2NDQK
ICAgIGFyY2hpdmVfcmVhZF9zdXBwb3J0X2Zvcm1hdF93YXJjLmMKICAgIGFyY2hpdmVfcmVhZF9z
dXBwb3J0X2Zvcm1hdF94YXIuYwogZGlmZiAtLWdpdCBhL2xpYmFyY2hpdmUvYXJjaGl2ZS5oIGIv
bGliYXJjaGl2ZS9hcmNoaXZlLmgKLWluZGV4IGE3ZGU2ZjYuLjg5YzYwYjMgMTAwNjQ0CitpbmRl
eCAxOWIzMTZhLi5mMDRhNzQ3IDEwMDY0NAogLS0tIGEvbGliYXJjaGl2ZS9hcmNoaXZlLmgKICsr
KyBiL2xpYmFyY2hpdmUvYXJjaGl2ZS5oCi1AQCAtMzE0LDcgKzMxNCw5IEBAIHR5cGVkZWYgY29u
c3QgY2hhciAqYXJjaGl2ZV9wYXNzcGhyYXNlX2NhbGxiYWNrKHN0cnVjdCBhcmNoaXZlICosCitA
QCAtMzE2LDcgKzMxNiw5IEBAIHR5cGVkZWYgY29uc3QgY2hhciAqYXJjaGl2ZV9wYXNzcGhyYXNl
X2NhbGxiYWNrKHN0cnVjdCBhcmNoaXZlICosCiAgI2RlZmluZQlBUkNISVZFX0ZJTFRFUl9MWk1B
CTUKICAjZGVmaW5lCUFSQ0hJVkVfRklMVEVSX1haCTYKICAjZGVmaW5lCUFSQ0hJVkVfRklMVEVS
X1VVCTcKQEAgLTkxLDcgKzkxLDcgQEAgaW5kZXggYTdkZTZmNi4uODljNjBiMyAxMDA2NDQKICAj
ZGVmaW5lCUFSQ0hJVkVfRklMVEVSX0xaSVAJOQogICNkZWZpbmUJQVJDSElWRV9GSUxURVJfTFJa
SVAJMTAKICAjZGVmaW5lCUFSQ0hJVkVfRklMVEVSX0xaT1AJMTEKLUBAIC0zODUsNiArMzg3LDcg
QEAgdHlwZWRlZiBjb25zdCBjaGFyICphcmNoaXZlX3Bhc3NwaHJhc2VfY2FsbGJhY2soc3RydWN0
IGFyY2hpdmUgKiwKK0BAIC0zODcsNiArMzg5LDcgQEAgdHlwZWRlZiBjb25zdCBjaGFyICphcmNo
aXZlX3Bhc3NwaHJhc2VfY2FsbGJhY2soc3RydWN0IGFyY2hpdmUgKiwKICAjZGVmaW5lCUFSQ0hJ
VkVfRk9STUFUXzdaSVAJCQkweEUwMDAwCiAgI2RlZmluZQlBUkNISVZFX0ZPUk1BVF9XQVJDCQkJ
MHhGMDAwMAogICNkZWZpbmUJQVJDSElWRV9GT1JNQVRfUkFSX1Y1CQkJMHgxMDAwMDAKQEAgLTk5
LDcgKzk5LDcgQEAgaW5kZXggYTdkZTZmNi4uODljNjBiMyAxMDA2NDQKICAKICAvKgogICAqIENv
ZGVzIHJldHVybmVkIGJ5IGFyY2hpdmVfcmVhZF9mb3JtYXRfY2FwYWJpbGl0aWVzKCkuCi1AQCAt
NDc4LDcgKzQ4MSw5IEBAIF9fTEFfREVDTCBpbnQgYXJjaGl2ZV9yZWFkX3N1cHBvcnRfZmlsdGVy
X3Byb2dyYW0oc3RydWN0IGFyY2hpdmUgKiwKK0BAIC00ODAsNyArNDgzLDkgQEAgX19MQV9ERUNM
IGludCBhcmNoaXZlX3JlYWRfc3VwcG9ydF9maWx0ZXJfcHJvZ3JhbShzdHJ1Y3QgYXJjaGl2ZSAq
LAogIF9fTEFfREVDTCBpbnQgYXJjaGl2ZV9yZWFkX3N1cHBvcnRfZmlsdGVyX3Byb2dyYW1fc2ln
bmF0dXJlCiAgCQkoc3RydWN0IGFyY2hpdmUgKiwgY29uc3QgY2hhciAqIC8qIGNtZCAqLywKICAJ
CQkJICAgIGNvbnN0IHZvaWQgKiAvKiBtYXRjaCAqLywgc2l6ZV90KTsKQEAgLTEwOSw3ICsxMDks
NyBAQCBpbmRleCBhN2RlNmY2Li44OWM2MGIzIDEwMDY0NAogIF9fTEFfREVDTCBpbnQgYXJjaGl2
ZV9yZWFkX3N1cHBvcnRfZmlsdGVyX3V1KHN0cnVjdCBhcmNoaXZlICopOwogIF9fTEFfREVDTCBp
bnQgYXJjaGl2ZV9yZWFkX3N1cHBvcnRfZmlsdGVyX3h6KHN0cnVjdCBhcmNoaXZlICopOwogIF9f
TEFfREVDTCBpbnQgYXJjaGl2ZV9yZWFkX3N1cHBvcnRfZmlsdGVyX3pzdGQoc3RydWN0IGFyY2hp
dmUgKik7Ci1AQCAtNDk5LDYgKzUwNCw3IEBAIF9fTEFfREVDTCBpbnQgYXJjaGl2ZV9yZWFkX3N1
cHBvcnRfZm9ybWF0X210cmVlKHN0cnVjdCBhcmNoaXZlICopOworQEAgLTUwMSw2ICs1MDYsNyBA
QCBfX0xBX0RFQ0wgaW50IGFyY2hpdmVfcmVhZF9zdXBwb3J0X2Zvcm1hdF9tdHJlZShzdHJ1Y3Qg
YXJjaGl2ZSAqKTsKICBfX0xBX0RFQ0wgaW50IGFyY2hpdmVfcmVhZF9zdXBwb3J0X2Zvcm1hdF9y
YXIoc3RydWN0IGFyY2hpdmUgKik7CiAgX19MQV9ERUNMIGludCBhcmNoaXZlX3JlYWRfc3VwcG9y
dF9mb3JtYXRfcmFyNShzdHJ1Y3QgYXJjaGl2ZSAqKTsKICBfX0xBX0RFQ0wgaW50IGFyY2hpdmVf
cmVhZF9zdXBwb3J0X2Zvcm1hdF9yYXcoc3RydWN0IGFyY2hpdmUgKik7CkBAIC0xMTgsMTAgKzEx
OCwxMCBAQCBpbmRleCBhN2RlNmY2Li44OWM2MGIzIDEwMDY0NAogIF9fTEFfREVDTCBpbnQgYXJj
aGl2ZV9yZWFkX3N1cHBvcnRfZm9ybWF0X3dhcmMoc3RydWN0IGFyY2hpdmUgKik7CiAgX19MQV9E
RUNMIGludCBhcmNoaXZlX3JlYWRfc3VwcG9ydF9mb3JtYXRfeGFyKHN0cnVjdCBhcmNoaXZlICop
OwogZGlmZiAtLWdpdCBhL2xpYmFyY2hpdmUvYXJjaGl2ZV9yZWFkLmMgYi9saWJhcmNoaXZlL2Fy
Y2hpdmVfcmVhZC5jCi1pbmRleCA0MDZkODRkLi4xNTBiZDMxIDEwMDY0NAoraW5kZXggMmYwMDZm
Yi4uNWM1MWRmNSAxMDA2NDQKIC0tLSBhL2xpYmFyY2hpdmUvYXJjaGl2ZV9yZWFkLmMKICsrKyBi
L2xpYmFyY2hpdmUvYXJjaGl2ZV9yZWFkLmMKLUBAIC0xMjk2LDEzICsxMjk2LDE4IEBAIF9fYXJj
aGl2ZV9yZWFkX3JlZ2lzdGVyX2JpZGRlcihzdHJ1Y3QgYXJjaGl2ZV9yZWFkICphLAorQEAgLTEy
OTcsMTMgKzEyOTcsMTggQEAgX19hcmNoaXZlX3JlYWRfcmVnaXN0ZXJfYmlkZGVyKHN0cnVjdCBh
cmNoaXZlX3JlYWQgKmEsCiAgCWludCBpLCBudW1iZXJfc2xvdHM7CiAgCiAgCWFyY2hpdmVfY2hl
Y2tfbWFnaWMoJmEtPmFyY2hpdmUsIEFSQ0hJVkVfUkVBRF9NQUdJQywKQEAgLTE0MywxMCArMTQz
LDEwIEBAIGluZGV4IDQwNmQ4NGQuLjE1MGJkMzEgMTAwNjQ0CiAgCQliaWRkZXIgPSAoYS0+Ymlk
ZGVycyArIGkpOwogIAkJYmlkZGVyLT5kYXRhID0gYmlkZGVyX2RhdGE7CiBkaWZmIC0tZ2l0IGEv
bGliYXJjaGl2ZS9hcmNoaXZlX3JlYWRfcHJpdmF0ZS5oIGIvbGliYXJjaGl2ZS9hcmNoaXZlX3Jl
YWRfcHJpdmF0ZS5oCi1pbmRleCBlMzBiNmMyLi45ZmYzNjAyIDEwMDY0NAoraW5kZXggNDNiN2Y4
NS4uOWIyNzY1NSAxMDA2NDQKIC0tLSBhL2xpYmFyY2hpdmUvYXJjaGl2ZV9yZWFkX3ByaXZhdGUu
aAogKysrIGIvbGliYXJjaGl2ZS9hcmNoaXZlX3JlYWRfcHJpdmF0ZS5oCi1AQCAtMjEyLDcgKzIx
Miw3IEBAIHN0cnVjdCBhcmNoaXZlX3JlYWQgeworQEAgLTIwOCw3ICsyMDgsNyBAQCBzdHJ1Y3Qg
YXJjaGl2ZV9yZWFkIHsKICAJCWludAkoKmNsZWFudXApKHN0cnVjdCBhcmNoaXZlX3JlYWQgKik7
CiAgCQlpbnQJKCpmb3JtYXRfY2FwYWJpbHRpZXMpKHN0cnVjdCBhcmNoaXZlX3JlYWQgKik7CiAg
CQlpbnQJKCpoYXNfZW5jcnlwdGVkX2VudHJpZXMpKHN0cnVjdCBhcmNoaXZlX3JlYWQgKik7CkBA
IC0xMzQ0LDcgKzEzNDQsNyBAQCBpbmRleCAwMDAwMDAwLi5mZTBlNTAwCiArCWZyZWUoaGFzaCk7
CiArfQogZGlmZiAtLWdpdCBhL2xpYmFyY2hpdmUvdGVzdC90ZXN0X2FyY2hpdmVfcmVhZF9zdXBw
b3J0LmMgYi9saWJhcmNoaXZlL3Rlc3QvdGVzdF9hcmNoaXZlX3JlYWRfc3VwcG9ydC5jCi1pbmRl
eCBiMGM5MjgwLi5iYzI1NmExIDEwMDY0NAoraW5kZXggZmYwM2MwZi4uMWJlZjJmNyAxMDA2NDQK
IC0tLSBhL2xpYmFyY2hpdmUvdGVzdC90ZXN0X2FyY2hpdmVfcmVhZF9zdXBwb3J0LmMKICsrKyBi
L2xpYmFyY2hpdmUvdGVzdC90ZXN0X2FyY2hpdmVfcmVhZF9zdXBwb3J0LmMKIEBAIC05MSw2ICs5
MSw3IEBAIERFRklORV9URVNUKHRlc3RfYXJjaGl2ZV9yZWFkX3N1cHBvcnQpCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGliYXJjaGl2ZS9saWJhcmNoaXZlLzAwMDUtRGlzYWJs
ZS1SUE0tZmlsdGVyLWF1dG8tYmlkZGluZy5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9s
aWJhcmNoaXZlL2xpYmFyY2hpdmUvMDAwNS1EaXNhYmxlLVJQTS1maWx0ZXItYXV0by1iaWRkaW5n
LnBhdGNoCmluZGV4IDI2YTAxNTk5MDguLjg2ZWI0OGE4MDQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1leHRlbmRlZC9saWJhcmNoaXZlL2xpYmFyY2hpdmUvMDAwNS1EaXNhYmxlLVJQTS1maWx0
ZXItYXV0by1iaWRkaW5nLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJhcmNo
aXZlL2xpYmFyY2hpdmUvMDAwNS1EaXNhYmxlLVJQTS1maWx0ZXItYXV0by1iaWRkaW5nLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSA4ODIxNjZkN2ZhMTEzZjBjMjEwODg2NGI4YTU3OWQwMTgx
NmUxZmNlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBiMzY3YjMxYjViNzY0ZTE1Yzhk
NDg0YTc1Yzc5MGI2ZmZhMWUyMGQ4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogU3Vt
YW50aCBHYXZpbmkgPHN1bWFudGguZ2F2aW5pQHdpbmRyaXZlci5jb20+CiBEYXRlOiBUdWUsIDEx
IEF1ZyAyMDI2IDEyOjAyOjMxIC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIGxpYmFyY2hpdmU6IERp
c2FibGUgUlBNIGZpbHRlciBhdXRvLWJpZGRpbmcKQEAgLTIwLDcgKzIwLDcgQEAgU2lnbmVkLW9m
Zi1ieTogU3VtYW50aCBHYXZpbmkgPHN1bWFudGguZ2F2aW5pQHdpbmRyaXZlci5jb20+CiAgMSBm
aWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMzEgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1n
aXQgYS9saWJhcmNoaXZlL2FyY2hpdmVfcmVhZF9zdXBwb3J0X2ZpbHRlcl9ycG0uYyBiL2xpYmFy
Y2hpdmUvYXJjaGl2ZV9yZWFkX3N1cHBvcnRfZmlsdGVyX3JwbS5jCi1pbmRleCAwMWJkMWJmLi44
ZTkwZGEzIDEwMDY0NAoraW5kZXggMWNmZGRmNy4uYTliNmVmOCAxMDA2NDQKIC0tLSBhL2xpYmFy
Y2hpdmUvYXJjaGl2ZV9yZWFkX3N1cHBvcnRfZmlsdGVyX3JwbS5jCiArKysgYi9saWJhcmNoaXZl
L2FyY2hpdmVfcmVhZF9zdXBwb3J0X2ZpbHRlcl9ycG0uYwogQEAgLTc5LDM5ICs3OSwxNCBAQCBz
dGF0aWMgaW50CkBAIC02OSw1ICs2OSwzIEBAIGluZGV4IDAxYmQxYmYuLjhlOTBkYTMgMTAwNjQ0
CiAgfQogIAogIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYXJjaGl2ZV9yZWFkX2ZpbHRlcl92dGFibGUK
LS0tIAotMi40OS4wCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGliYXJjaGl2
ZS9saWJhcmNoaXZlXzMuOC45LmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUv
bGliYXJjaGl2ZV8zLjguMTAuYmIKc2ltaWxhcml0eSBpbmRleCA5MCUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUvbGliYXJjaGl2ZV8zLjguOS5iYgpyZW5hbWUg
dG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUvbGliYXJjaGl2ZV8zLjguMTAuYmIK
aW5kZXggMmVlZmEyODUzMi4uODA0ZGNkNzQ1MSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL2xpYmFyY2hpdmUvbGliYXJjaGl2ZV8zLjguOS5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvbGliYXJjaGl2ZS9saWJhcmNoaXZlXzMuOC4xMC5iYgpAQCAtMzEsMTYgKzMxLDEy
IEBAIEVYVFJBX09FQ09ORiArPSAiLS1lbmFibGUtbGFyZ2VmaWxlIC0td2l0aG91dC1pY29udiIK
IAogU1JDX1VSSSA9ICJodHRwczovL2xpYmFyY2hpdmUub3JnL2Rvd25sb2Fkcy9saWJhcmNoaXZl
LSR7UFZ9LnRhci5neiBcCiAgICAgICAgICAgIGZpbGU6Ly9ydW4tcHRlc3QgXAotICAgICAgICAg
ICBmaWxlOi8vMDAwMS1hcHBlbmRfZmlsdGVyLVVzZS1sYXN0LWJpZGRlci1mb3ItZmlsdGVyLnBh
dGNoIFwKLSAgICAgICAgICAgZmlsZTovLzAwMDEtdGVzdC1za2lwLXBwbWQ4LWFlczI1Ni1zdHJl
YW1pbmctdGVzdC13aGVuLW5vLWNyeXB0by5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDAx
LWFwcGVuZF9maWx0ZXItVmVyaWZ5LXRoYXQtYmlkZGVyLWFuZC1maWx0ZXItbWF0Y2gucGF0Y2gg
XAotICAgICAgICAgICBmaWxlOi8vMDAwMy1SZW1vdmUtYmlkZGVyLW5hbWUucGF0Y2ggXAogICAg
ICAgICAgICBmaWxlOi8vMDAwNC1Db252ZXJ0LVJQTS1yZWFkZXItaW50by1hLXByb3Blci1mb3Jt
YXQucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwNS1EaXNhYmxlLVJQTS1maWx0ZXItYXV0
by1iaWRkaW5nLnBhdGNoIFwKLSAgICAgICAgICAiCisgICAgICAgICAgICIKIFVQU1RSRUFNX0NI
RUNLX1VSSSA9ICJodHRwczovL3d3dy5saWJhcmNoaXZlLm9yZy8iCiAKLVNSQ19VUklbc2hhMjU2
c3VtXSA9ICJmNWE2NTM5MDU5Y2Y1ZTU5N2RiZWRhMzdiZmE0ODc0YjFlOGRlYTA2M2M4ZDkzYmY4
NWEyYjQ0YWY5MGE1YmQ0IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImExYmZmYmU1MTUyY2ZlODY5
NzUxMTc5ZTdiMTY2NDhjODdjNDYxY2I4YzQ2ZWVlNzUwNjJlZmJlMTY0Y2M1N2MiCiAKIGluaGVy
aXQgYXV0b3Rvb2xzIHVwZGF0ZS1hbHRlcm5hdGl2ZXMgcGtnY29uZmlnIHB0ZXN0CiAKLS0gCjIu
NDcuMQoK

--===============3735459126619506349==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libarchive/bsdcpio: PKGV changed from 3.8.9 [default] to 3.8.10 [default]
packages/x86-64-v3-poky-linux/libarchive/bsdcpio: PV changed from "3.8.9" to "3.8.10"
packages/x86-64-v3-poky-linux/libarchive/bsdtar: PKGV changed from 3.8.9 [default] to 3.8.10 [default]
packages/x86-64-v3-poky-linux/libarchive/bsdtar: PKGSIZE changed from 71784 to 79976 (+11%)
packages/x86-64-v3-poky-linux/libarchive/bsdtar: PV changed from "3.8.9" to "3.8.10"
packages/x86-64-v3-poky-linux/libarchive: SRC_URI changed from "https://libarchive.org/downloads/libarchive-3.8.9.tar.gz file://run-ptest file://0001-append_filter-Use-last-bidder-for-filter.patch file://0001-test-skip-ppmd8-aes256-streaming-test-when-no-crypto.patch file://0001-append_filter-Verify-that-bidder-and-filter-match.patch file://0003-Remove-bidder-name.patch file://0004-Convert-RPM-reader-into-a-proper-format.patch file://0005-Disable-RPM-filter-auto-bidding.patch" to "https://libarchive.org/downloads/libarchive-3.8.10.tar.gz file://run-ptest file://0004-Convert-RPM-reader-into-a-proper-format.patch file://0005-Disable-RPM-filter-auto-bidding.patch"
packages/x86-64-v3-poky-linux/libarchive: PKGV changed from 3.8.9 [default] to 3.8.10 [default]
packages/x86-64-v3-poky-linux/libarchive: PV changed from "3.8.9" to "3.8.10"
packages/x86-64-v3-poky-linux/libarchive/libarchive-dbg: PKGV changed from 3.8.9 [default] to 3.8.10 [default]
packages/x86-64-v3-poky-linux/libarchive/libarchive-dbg: FILELIST: removed "/usr/lib/.debug/libarchive.so.13.8.9", added "/usr/lib/.debug/libarchive.so.13.8.10"
packages/x86-64-v3-poky-linux/libarchive/libarchive-dbg: PKGSIZE changed from 11923776 to 12284872 (+3%)
packages/x86-64-v3-poky-linux/libarchive/libarchive-dbg: PV changed from "3.8.9" to "3.8.10"
packages/x86-64-v3-poky-linux/libarchive/libarchive-dev: PKGV changed from 3.8.9 [default] to 3.8.10 [default]
packages/x86-64-v3-poky-linux/libarchive/libarchive-dev: PKGSIZE changed from 92043 to 92170 (+0%)
packages/x86-64-v3-poky-linux/libarchive/libarchive-dev: PV changed from "3.8.9" to "3.8.10"
packages/x86-64-v3-poky-linux/libarchive/libarchive-doc: PKGV changed from 3.8.9 [default] to 3.8.10 [default]
packages/x86-64-v3-poky-linux/libarchive/libarchive-doc: PKGSIZE changed from 377565 to 380301 (+1%)
packages/x86-64-v3-poky-linux/libarchive/libarchive-doc: PV changed from "3.8.9" to "3.8.10"
packages/x86-64-v3-poky-linux/libarchive/libarchive-locale: PKGV changed from 3.8.9 [default] to 3.8.10 [default]
packages/x86-64-v3-poky-linux/libarchive/libarchive-locale: PV changed from "3.8.9" to "3.8.10"
packages/x86-64-v3-poky-linux/libarchive/libarchive-ptest: PKGV changed from 3.8.9 [default] to 3.8.10 [default]
packages/x86-64-v3-poky-linux/libarchive/libarchive-ptest: FILELIST: added "/usr/lib/libarchive/ptest/libarchive/test/test_read_format_rar5_redir_overflow.rar.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_7zip_null_client_next.7z.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_rar5_group_name_toolong.rar.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_7zip_lzma1_ia64.7z.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_zip_ntfs_timestamp.c /usr/lib/libarchive/ptest/libarchive/test/test_read_format_zip_lzma_alone_large_size.c /usr/lib/libarchive/ptest/libarchive/test/test_read_format_zip_lzma_alone_large_size.zip.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_mtree_size.c /usr/lib/libarchive/ptest/tar/test/test_edit_pathname_hardlink.c /usr/lib/libarchive/ptest/libarchive/test/test_read_format_rar5_zip_in_rar.rar.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_rar5_varint_near_eof.c /usr/lib/libarchiv
 e/ptest/libarchive/test/test_read_data_into_fd_no_offset_reported.c /usr/lib/libarchive/ptest/libarchive/test/test_read_format_7zip_ppmd_small_block.7z.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_rar5_extra_data_size_toolong.rar.Z.uu /usr/lib/libarchive/ptest/libarchive/test/test_create_child_environment.c /usr/lib/libarchive/ptest/libarchive/test/test_read_format_7zip_lzma1_arm64.7z.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_lha_amiga_script.lha.uu /usr/lib/libarchive/ptest/unzip/test/test_windows_paths.c /usr/lib/libarchive/ptest/libarchive/test/test_read_format_7zip_lzma1_powerpc.7z.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_rar5_redir_varint_2byte.rar.uu /usr/lib/libarchive/ptest/libarchive/test/test_archive_read_open_filenames.c /usr/lib/libarchive/ptest/libarchive/test/test_read_format_zip_unset_times.c /usr/lib/libarchive/ptest/libarchive/test/test_read_format_rar5_redir_overflow.c /usr/lib/libarchive/ptest/libarchive/te
 st/test_read_format_cab_skip_across_folders.c /usr/lib/libarchive/ptest/libarchive/test/test_compat_zstd_3.tar.zst.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_7zip_deflate_arm_arm64.7z.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_rar5_truncated_htime.c /usr/lib/libarchive/ptest/unzip/test/test_windows_paths.zip.uu /usr/lib/libarchive/ptest/libarchive/test/test_archive_crc32.c /usr/lib/libarchive/ptest/libarchive/test/test_read_format_tar_pax_global_header.tar.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_lha_amiga_script.c /usr/lib/libarchive/ptest/libarchive/test/test_read_format_rar5_header_size_wraparound.c /usr/lib/libarchive/ptest/libarchive/test/test_read_format_cab_lzx_invalid_history.cab.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_cab_lzx_invalid_history.c /usr/lib/libarchive/ptest/libarchive/test/test_write_disk_secure_physicaldrive.c /usr/lib/libarchive/ptest/libarchive/test/test_archive_read_open_filenam
 es_split_uaf_2.tar.uu /usr/lib/libarchive/ptest/libarchive/test/test_archive_read_open_filenames_split_uaf_1.tar.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_7zip_ppmd_bcj.7z.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_7zip_lzma1_armthumb.7z.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_rar_filter_incomplete_block.rar.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_gtar_sparse_exceeds_length.tar.Z.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_warc_uri_nul.warc.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_zip_negative_timestamps.c /usr/lib/libarchive/ptest/libarchive/test/test_write_format_iso9660_rr_moved_notdir.c /usr/lib/libarchive/ptest/libarchive/test/test_read_format_iso_rockridge_ce_overflow.c /usr/lib/libarchive/ptest/libarchive/test/test_read_format_7zip_lzma1_arm.7z.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_zip_ambiguous_timestamps.c /usr/lib/libarchive/ptes
 t/libarchive/test/test_read_format_iso_rockridge_cl_re_cycle.iso.Z.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_xar_toc_premature_stream_end.xar.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_7zip_ppmd_arm64.7z.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_7zip_deflate_arm64_large.7z.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_rar_filter_incomplete_block.c /usr/lib/libarchive/ptest/libarchive/test/test_read_format_iso_rockridge_cl_re_control.iso.Z.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_gtar_sparse_exceeds_length.c /usr/lib/libarchive/ptest/libarchive/test/test_read_format_tar_pax_global_header_ignorable.tar.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_filter_uudecode_newlines.c /usr/lib/libarchive/ptest/libarchive/test/test_read_format_zip_dos_mtime_precedence.c /usr/lib/libarchive/ptest/libarchive/test/test_read_format_7zip_lzma1_sparc.7z.uu /usr/lib/libarchive/ptest/tar/test/test_edi
 t_pathname_hardlink.tar.Z.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_rar5_extra_field_underflow.c /usr/lib/libarchive/ptest/libarchive/test/test_read_format_cab_lzx_literal_control.cab.uu /usr/lib/libarchive/ptest/tar/test/test_option_mode.c /usr/lib/libarchive/ptest/libarchive/test/test_read_format_7zip_deflate_armthumb.7z.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_zip_empty.c /usr/lib/libarchive/ptest/libarchive/test/test_read_format_xar_toc_premature_stream_end_control.xar.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_iso_rockridge_ce_overflow.iso.Z.uu /usr/lib/libarchive/ptest/libarchive/test/test_archive_ntfs_time.c /usr/lib/libarchive/ptest/libarchive/test/test_read_format_rar5_owner_name_toolong.rar.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_7zip_lzma1_riscv.7z.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_rar5_extra_field_underflow.rar.uu /usr/lib/libarchive/ptest/libarchive/test/test_re
 ad_format_tar_pax_global_header.c /usr/lib/libarchive/ptest/libarchive/test/test_read_format_7zip_deflate_ia64.7z.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_7zip_deflate_delta.7z.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_xar_empty_xattr.xar.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_7zip_deflate_riscv.7z.uu /usr/lib/libarchive/ptest/libarchive/test/test_read_format_iso_rockridge_cl_re_cycle.c /usr/lib/libarchive/ptest/libarchive/test/test_read_format_zip_ntfs_precedence.c /usr/lib/libarchive/ptest/libarchive/test/test_read_data_block_offset_at_eof.c /usr/lib/libarchive/ptest/libarchive/test/test_read_format_cab_skip_across_folders.cab.uu"
packages/x86-64-v3-poky-linux/libarchive/libarchive-ptest: PKGSIZE changed from 18273789 to 18854575 (+3%)
packages/x86-64-v3-poky-linux/libarchive/libarchive-ptest: PV changed from "3.8.9" to "3.8.10"
packages/x86-64-v3-poky-linux/libarchive/libarchive-src: PKGV changed from 3.8.9 [default] to 3.8.10 [default]
packages/x86-64-v3-poky-linux/libarchive/libarchive-src: FILELIST: directory renamed /usr/src/debug/libarchive/3.8.9/cpio/test -> /usr/src/debug/libarchive/3.8.10/cpio/test, directory renamed /usr/src/debug/libarchive/3.8.9/cat -> /usr/src/debug/libarchive/3.8.10/cat, directory renamed /usr/src/debug/libarchive/3.8.9/cat/test -> /usr/src/debug/libarchive/3.8.10/cat/test, directory renamed /usr/src/debug/libarchive/3.8.9/unzip -> /usr/src/debug/libarchive/3.8.10/unzip, directory renamed /usr/src/debug/libarchive/3.8.9/tar -> /usr/src/debug/libarchive/3.8.10/tar, directory renamed /usr/src/debug/libarchive/3.8.9/cpio -> /usr/src/debug/libarchive/3.8.10/cpio, directory renamed /usr/src/debug/libarchive/3.8.9/test_utils -> /usr/src/debug/libarchive/3.8.10/test_utils, removed "/usr/src/debug/libarchive/3.8.9/tar/test/test_extract_tar_gz.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_rar_overflow.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_archive_parse_date.
 c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_ar.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_disk.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_acl_from_text_overread.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_tar_empty.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_xar_empty.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_zip_empty.c /usr/src/debug/libarchive/3.8.9/tar/test/test_option_nodump.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_tar_sparse.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_archive_read_support.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_acl_posix1e_text.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_gnutar_huge.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_entry_private.h /usr/src/debug/libarchive/3.8.9/libarchive/archive_ppmd7_private.h /usr/src/debug/libarchive/3.8.9/libarchive/
 archive_ppmd8_private.h /usr/src/debug/libarchive/3.8.9/libarchive/archive_write_private.h /usr/src/debug/libarchive/3.8.9/tar/test/test_extract_tar_lzo.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_integer.h /usr/src/debug/libarchive/3.8.9/libarchive/archive_read_support_filter_grzip.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_read_support_filter_lrzip.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_iso9660_filename.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_tar_ustar.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_tar_v7tar.c /usr/src/debug/libarchive/3.8.9/unzip/test/test_p.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_zip_zipx_lzma_oom.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_write_add_filter_program.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_cpio_odc.c /usr/src/debug/libarchive/3.8.9/tar/test/test_option_owner.c /usr/src/debug/libarchive/3.8
 .9/libarchive/archive_options_private.h /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_data_large.c /usr/src/debug/libarchive/3.8.9/unzip/test/test_x.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_7zip_folders_oom.c /usr/src/debug/libarchive/3.8.9/tar/test/test_version.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_zip_high_compression.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_read_append_filter.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_iso_rockridge_zf_overflow.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_archive_string.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_isorr_compress.c /usr/src/debug/libarchive/3.8.9/tar/test/test_patterns.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_archive_seek_data_unsupported.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_write_set_format_cpio_odc.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_disk_secu
 re.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_filter_zstd_raw.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_read_disk_private.h /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_disk_directory_traversals.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_write_open_file.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_tar_pax_timestamps.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_compat_plexus_archiver_tar.c /usr/src/debug/libarchive/3.8.9/unzip/test/test_j.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_zip_zipx_encrypted.c /usr/src/debug/libarchive/3.8.9/tar/test/test_option_passphrase.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_cpio_symlink_trailer.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_disk_secure_noabsolutepaths.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_read_support_filter_bzip2.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_form
 at_7zip_entries_oom.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_cab_lzx_e8.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_write_add_filter_compress.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_archive_read_next_header_empty.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_files_compressed.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_cab_skip_malformed.c /usr/src/debug/libarchive/3.8.9/unzip/test/test_glob.c /usr/src/debug/libarchive/3.8.9/unzip/test/test_t.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_disk_lookup.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_empty.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_mtree_absolute_path.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_iso9660_zisofs_overflow.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_zip_7075_utf8_paths.c /usr/src/debug/libarchive/3.8.9/libarchive/test/t
 est_read_format_lha_symlink_missing_target.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_acl_nfs4_null_id_overflow.c /usr/src/debug/libarchive/3.8.9/tar/test/test_windows.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_compat_tar_hardlink.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_read_support_filter_compress.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_write_add_filter.c /usr/src/debug/libarchive/3.8.9/tar/test/test_list_item.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_zip.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_zip_compression_bzip2.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_zip_compression_store.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_zip_mac_metadata.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_read_extract2.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_tar_invalid_pax_size.c /usr/src/debug/libarchive/3.8.9/libarchi
 ve/archive_entry_strmode.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_virtual.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_archive_pathmatch_oob.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_filter_lzma.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_zip_nested.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_mtree.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_write_set_format_by_name.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_cpio_bin.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_lha_filename_utf16.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_rar.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_read_support_format_empty.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_read_support_format_ar.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_lha_filename.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_form
 at_tar_filename.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_zip_with_invalid_traditional_eocd.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_isorr_ce_loop.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_string.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_filter_program.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_read_support_format_all.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_archive_write_set_options.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_pax_bz2.c /usr/src/debug/libarchive/3.8.9/tar/test/test_crlf_mtree.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_string.h /usr/src/debug/libarchive/3.8.9/libarchive/test/test_compat_xz.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_read_support_format_iso9660.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_rar_filter.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_disk_secure746.c /usr/src/d
 ebug/libarchive/3.8.9/libarchive/archive_check_magic.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_cryptor_private.h /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_cpio_bin_lzma.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_disk_hfs_compression.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_lha_bugfix_0.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_acl_text.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_disk_secure744.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_disk_fixup.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_filter_gzip_recursive.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_tar_pax_large_attr.c /usr/src/debug/libarchive/3.8.9/tar/test/test_symlink_dir.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_acl.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_random_private.h /usr/src/debug/libarchive/3.8.9/libarchive/test/list.h /usr/src/d
 ebug/libarchive/3.8.9/libarchive/test/test_tar_filenames.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_archive_clear_error.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_filter_b64encode.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_filter_lrzip.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_read_support_format_warc.c /usr/src/debug/libarchive/3.8.9/tar/test/test_missing_file.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_zip_file.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_filter_program_signature.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_acl_pax.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_archive_read_multiple_data_objects.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_random.c /usr/src/debug/libarchive/3.8.9/tar/test/test_option_acls.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_mtree_classic.c /usr/src/debug/libarchive/3.8.9/tar/test/test_option_z.c
  /usr/src/debug/libarchive/3.8.9/tar/test/test_option_xz.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_write_set_format_ustar.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_write_set_format_v7tar.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_filter_lzop.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_cab_multi.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_iso_zisofs_overflow.c /usr/src/debug/libarchive/3.8.9/tar/test/test_option_mtime.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_iso9660_rockridge_overflow.c /usr/src/debug/libarchive/3.8.9/tar/test/test_option_lzma.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_disk_symlink.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_zip_size_exceeds_declared.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_filter_gzip.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_zip_compression_lzma_xz.c /u
 sr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_warc.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_cpio.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_write_add_filter_lz4.c /usr/src/debug/libarchive/3.8.9/libarchive/archive.h /usr/src/debug/libarchive/3.8.9/libarchive/archive_entry.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_match.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_pathmatch.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_ppmd7.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_ppmd8.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_write.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_zip_msdos.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_pathmatch.h /usr/src/debug/libarchive/3.8.9/libarchive/archive_entry.h /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_pax_empty_val_no_nl.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_write_set_format_cpio_newc.c /usr/src/d
 ebug/libarchive/3.8.9/libarchive/archive_read_disk_set_standard_lookup.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_write_set_format_iso9660.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_filter_bzip2.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_filter_lrzip.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_cmdline_private.h /usr/src/debug/libarchive/3.8.9/tar/test/test_option_xattrs.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_xar_bugs.c /usr/src/debug/libarchive/3.8.9/tar/test/test_option_newer_than.c /usr/src/debug/libarchive/3.8.9/tar/test/test_option_older_than.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_cab_filename.c /usr/src/debug/libarchive/3.8.9/tar/test/test_option_b64encode.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_write_add_filter_by_name.c /usr/src/debug/libarchive/3.8.9/libarchive/test/read_open_memory.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_ar_mode.c /usr/
 src/debug/libarchive/3.8.9/libarchive/test/test_archive_write_set_format_filter_by_ext.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_read_support_filter_program.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_read_extract.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_archive_read_next_header_raw.c /usr/src/debug/libarchive/3.8.9/unzip/test/test_basic.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_compat_star_acl.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_read_disk_entry_from_file.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_open_failure.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_rar_encryption_header.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_zip_encryption_header.c /usr/src/debug/libarchive/3.8.9/tar/test/test_option_r.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_read_open_file.c /usr/src/debug/libarchive/3.8.9/tar/test/test_option_group.c /usr/src/debug/libarchive/3.8.9/libarch
 ive/test/test_read_format_cpio_bin_Z.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_compat_tar_directory.c /usr/src/debug/libarchive/3.8.9/unzip/test/test_singlefile.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_gtar_filename.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_read_support_format_raw.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_zip_empty_pathname.c /usr/src/debug/libarchive/3.8.9/tar/test/test_option_exclude_vcs.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_read_support_format_by_code.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_isojoliet_compress.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_large.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_blake2.h /usr/src/debug/libarchive/3.8.9/tar/test/test_option_lz4.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_write_add_filter_bzip2.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_iso9660_zisofs.
 c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_xar.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_read_set_options.c /usr/src/debug/libarchive/3.8.9/tar/test/test_help.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_7zip.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_cab_lzx_16bit.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_disk.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_write_set_passphrase.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_archive_read_close_twice.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_zip_winzip_aes_large.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_archive_read_append_filter.c /usr/src/debug/libarchive/3.8.9/tar/test/test_extract_tar_xz.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_filter_gzip_timestamp.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_cpio_svr4c_Z.c /usr/src/debug/libarchive/3.8.9
 /libarchive/test/test_write_filter_zstd.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_entry.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_mtree_dotdot.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_mtree_quoted_filename.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_tar_empty_dirname.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_write_add_filter_b64encode.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_tbz.c /usr/src/debug/libarchive/3.8.9/tar/test/test_extract_tar_grz.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_read_open_memory.c /usr/src/debug/libarchive/3.8.9/unzip/test/test_I.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_entry_strmode.c /usr/src/debug/libarchive/3.8.9/tar/test/test_option_b.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_rar5_loop_bug.c /usr/src/debug/libarchive/3.8.9/tar/test/test_option_j.c /usr/src/debug/libarchive/3.8.9/liba
 rchive/test/test_read_format_isorr_ce.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_string_composition.h /usr/src/debug/libarchive/3.8.9/libarchive/archive_read_support_filter_uu.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_sparse_basic.c /usr/src/debug/libarchive/3.8.9/unzip/test/test_symlink.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_mtree_classic_indent.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_read_add_passphrase.c /usr/src/debug/libarchive/3.8.9/tar/test/test_option_n.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_zip_long_pathname.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_acl_nfs4.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_entry_link_resolver.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_compat_bzip2.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_compat_uudecode.c /usr/src/debug/libarchive/3.8.9/tar/test/test_leading_slash.c /usr/src/debug/libarchive/3.8.9/libarchi
 ve/test/test_archive_write_set_format_by_name.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_isorr_rr_moved.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_read_support_filter_all.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_read_support_format_lha.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_platform_stat.h /usr/src/debug/libarchive/3.8.9/libarchive/test/test_archive_write_set_passphrase.c /usr/src/debug/libarchive/3.8.9/tar/test/test_option_C_mtree.c /usr/src/debug/libarchive/3.8.9/tar/test/test_option_ignore_zeros.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_rar5_block_hdr_fail_loop.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_disk_entry_from_file.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_rar5.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_cab_lzx_oob.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_entry_sparse.c /usr/src/debug/libarchive/3.8.9/libarchiv
 e/test/test_read_filter_compress.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_cpio_afio.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_tlz.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_acl_private.h /usr/src/debug/libarchive/3.8.9/libarchive/archive_entry_xattr.c /usr/src/debug/libarchive/3.8.9/libarchive/filter_fork.h /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_gnutar_filenames.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_xar_fflags.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_read_support_format_rpm.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_cpio_newc.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_zip_entry_size_unset.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_archive_match_path.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_archive_match_time.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_disk_no_hfs_
 compression.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_write_set_format_7zip.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_write_set_format_cpio.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_write_set_format_shar.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_write_set_format_warc.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_archive_match_owner.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_archive_read_add_passphrase.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_position.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_disk_acl_linux.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_zip_windows_path.c /usr/src/debug/libarchive/3.8.9/unzip/test/test_symlink_dotdot.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_read_private.h /usr/src/debug/libarchive/3.8.9/libarchive/archive_time_private.h /usr/src/debug/libarchive/3.8.9/libarchive/archive_hmac_private.h /usr/src/debug/libarchive/3.8.9/unzip/te
 st/test_C.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_ppmd_private.h /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_gtar_sparse.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_open_file.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_gnutar.c /usr/src/debug/libarchive/3.8.9/tar/test/test_print_longpath.c /usr/src/debug/libarchive/3.8.9/unzip/test/test_version.c /usr/src/debug/libarchive/3.8.9/tar/test/test_copy.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_mtree_fflags.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_pax_xattr_schily.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_digest.c /usr/src/debug/libarchive/3.8.9/unzip/test/test_o.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_blake2sp_ref.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_xar_doublelink.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_7zip_empty.c /usr/src/debug/libarchive/3.8
 .9/libarchive/test/test_write_format_cpio_empty.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_shar_empty.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_rb.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_zip_comment_stored.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_warc_empty.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_cpio_bin_xz.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_write_open_filename.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_rb.h /usr/src/debug/libarchive/3.8.9/tar/test/test_extract_tar_lrz.c /usr/src/debug/libarchive/3.8.9/tar/test/list.h /usr/src/debug/libarchive/3.8.9/libarchive/archive_write_disk_private.h /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_7zip_encryption_header.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_tar_empty_with_gnulabel.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_compat_solaris_tar_ac
 l.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_extattr_freebsd.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_pax.c /usr/src/debug/libarchive/3.8.9/libarchive/xxhash.c /usr/src/debug/libarchive/3.8.9/tar/test/test_option_exclude.c /usr/src/debug/libarchive/3.8.9/unzip/test/list.h /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_lha.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_rar_encryption.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_gtar_gz.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_truncated_filter.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_fuzz_consumer.h /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_lha_oversize_header.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_write_set_format_cpio_binary.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_compat_cpio.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_compat_gtar.c /usr/src
 /debug/libarchive/3.8.9/libarchive/test/test_compat_gzip.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_compat_lzip.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_compat_lzma.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_compat_lzop.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_compat_zstd.c /usr/src/debug/libarchive/3.8.9/tar/test/test_extract_tar_Z.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_digest_private.h /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_zip_large.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_entry_locale.h /usr/src/debug/libarchive/3.8.9/libarchive/test/test_fuzz.c /usr/src/debug/libarchive/3.8.9/tar/test/test_extract_tar_lz.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_mtree_absolute.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_write_add_filter_grzip.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_write_add_filter_lrzip.c /usr/src/debug/libarchive/3.8.9/libarc
 hive_fe/lafe_err.h /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_zip_compression_zstd.c /usr/src/debug/libarchive/3.8.9/libarchive_fe/lafe_err.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_iso_Z.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_7zip.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_ustar_filenames.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_open_filename.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_read_disk_posix.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_iso9660_empty.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_tar_acl_oob_read.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_gtar_sparse_length.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_read_format_zip.c /usr/src/debug/libarchive/3.8.9/unzip/test/test_q.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_empty_write.c /usr/src/debug/libarchive/3.8.
 9/libarchive/archive_read_support_filter_by_code.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_raw.c /usr/src/debug/libarchive/3.8.9/libarchive_fe/passphrase.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_write_set_format_ar.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_bad_fd.c /usr/src/debug/libarchive/3.8.9/tar/test/test_option_gid_gname.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_read_support_format_zip.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_rar_encryption_data.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_zip_encryption_data.c /usr/src/debug/libarchive/3.8.9/libarchive_fe/passphrase.h /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_iso_joliet_utf16be_overflow.c /usr/src/debug/libarchive/3.8.9/tar/test/test_extract_tar_zstd.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_tar_pax_negative_time.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_com
 pat_lz4.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_compat_mac.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_compat_zip.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_mtree_preset_digests.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_hmac.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_read.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_time.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_util.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_filter_count.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_entry_stat.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_ustar_filename.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_zip_uncompressed_size_off_by_4gib.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_disk_perms.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_disk_secure745.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_read_open_fd.c /usr/
 src/debug/libarchive/3.8.9/libarchive/test/test_write_format_zip_zip64.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_txz.c /usr/src/debug/libarchive/3.8.9/tar/test/test_option_fflags.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_tar_empty_filename.c /usr/src/debug/libarchive/3.8.9/tar/test/test_option_safe_writes.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_write_open_fd.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_read_support_format_rar5.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_cpio_svr4_bzip2_rpm.c /usr/src/debug/libarchive/3.8.9/tar/test/test_format_newc.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_xxhash.h /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_cab.c /usr/src/debug/libarchive/3.8.9/tar/test/test_extract_tar_lz4.c /usr/src/debug/libarchive/3.8.9/unzip/test/test_u.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_rar_encryption_partially.c /usr/sr
 c/debug/libarchive/3.8.9/libarchive/test/test_read_format_zip_encryption_partially.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_cpio_bin_le.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_too_many_filters.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_endian.h /usr/src/debug/libarchive/3.8.9/libarchive/test/test_archive_api_feature.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_cpio_odc.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_open_fd.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_disk_failures.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_gnutar_filename_encoding.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_pax_align.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_filter_grzip.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_filter_uudecode_raw.c /usr/src/debug/libarchive/3.8.9/unzip/test/test_P_encryption.c /usr/src/debug/libarchive/3.8.9/l
 ibarchive/archive_version_details.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_iso_xorriso.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_compat_uudecode_large.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_mtree_crash747.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_filter_lz4_raw.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_write_set_format_private.h /usr/src/debug/libarchive/3.8.9/libarchive/archive_write_set_format_gnutar.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_7zip_filename_encoding.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_read_support_filter_gzip.c /usr/src/debug/libarchive/3.8.9/tar/test/test_basic.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_tar.c /usr/src/debug/libarchive/3.8.9/tar/test/test_option_stdout_size_exceeds_declared.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_set_format.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read
 _format_rar5_bad_filter.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_rar5_bad_tables.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_read_support_filter_lzop.c /usr/src/debug/libarchive/3.8.9/tar/test/test_option_uid_uname.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_iso9660_bugs.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_raw.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_7zip_issue2765.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_private.h /usr/src/debug/libarchive/3.8.9/tar/test/test_option_uuencode.c /usr/src/debug/libarchive/3.8.9/tar/test/test_0.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_iso9660_boot.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_read_support_filter_none.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_read_support_filter_rpm.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_zip_malformed.c /usr/src/debug/liba
 rchive/3.8.9/libarchive/archive_read_support_format_mtree.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_entry_copy_stat.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_isorr_new_compress.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_tar_V_negative_size.c /usr/src/debug/libarchive/3.8.9/libarchive/filter_fork_posix.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_write_add_filter_uuencode.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_link_resolver.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_pax_xattr_header.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_mtree_null_deref.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_filter_lzop.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_tar_pax_g_large.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_disk_hardlink.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_xar.c /usr/src/debug/libarchive
 /3.8.9/tar/test/test_stdio.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_write_set_format.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_zip_nofiletype.c /usr/src/debug/libarchive/3.8.9/unzip/test/test_0.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_tar_pax_sun_holesdata.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_iso9660_joliet_id.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_isojoliet_rr.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_zip_zip64.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_cpio_bin_lzip.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_pax_truncated.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_archive_string_conversion.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_isojoliet_long.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_tar_concatenated.c /usr/src/debug/libarchive/3.8.
 9/libarchive/test/test_read_format_cpio_bin_gz.c /usr/src/debug/libarchive/3.8.9/tar/test/test_extract_tar_bz2.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_acl_nfs4_text.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_filter_lzip.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_7zip_encryption_partially.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_pax_xattr_rht_security_selinux.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_compat_solaris_pax_sparse.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_7zip_packinfo_digests.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_compat_gtar_large.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_disk_appledouble.c /usr/src/debug/libarchive/3.8.9/tar/test/test_extract_tar_lzma.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_isojoliet_versioned.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_7zip_large.c /usr/s
 rc/debug/libarchive/3.8.9/libarchive/test/test_read_format_cpio_bin_be.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_cryptor.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_read_support_format_rar.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_read_support_format_tar.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_read_support_format_xar.c /usr/src/debug/libarchive/3.8.9/tar/test/test_option_lzop.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_blake2s_ref.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_zip_padded.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_cpio_svr4_gzip.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_compat_perl_archive_tar.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_read_open_filename.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_archive_read.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_zip_empty_zip64.c /usr/src/debug/libarchive/3.8.9/libarchive/t
 est/test_read_format_gtar_lzma.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_read_support_filter_lz4.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_archive_read_open2.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_filter_xz.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_truncated.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_iso_multi_extent.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_archive_pathmatch.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_mtree_no_separator.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_cpio_svr4_gzip_rpm.c /usr/src/debug/libarchive/3.8.9/tar/test/test_option_zstd.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_read_support_format_cpio.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_extract.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_write_disk_set_standard_lookup.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_w
 rite_add_filter_gzip.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_write_add_filter_lzop.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_write_add_filter_none.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_write_add_filter_zstd.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_7zip_malformed.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_cpio_filename.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_archive_string_conversion_overread.c /usr/src/debug/libarchive/3.8.9/tar/test/test_strip_components.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_write_set_format_filter_by_ext.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_isozisofs_compress.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_write_set_format_mtree.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_cab_mszip_oob.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_mtree.c /usr/src/debug/libarchive/3.8.
 9/tar/test/test_option_grzip.c /usr/src/debug/libarchive/3.8.9/tar/test/test_option_lrzip.c /usr/src/debug/libarchive/3.8.9/unzip/test/test_L.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_blake2_impl.h /usr/src/debug/libarchive/3.8.9/libarchive/test/test_archive_write_add_filter_by_name.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_7zip_encryption_data.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_read_set_format.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_disk_times.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_filter_program.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_pax_filename_encoding.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_ustar_filename_encoding.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_v7tar_filename_encoding.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_zip_filename_encoding.c /usr/src/debug/libarchive/3.8.9/tar/test/test_option_C_upper.c /usr/src/debug/libar
 chive/3.8.9/tar/test/test_option_H_upper.c /usr/src/debug/libarchive/3.8.9/tar/test/test_option_L_upper.c /usr/src/debug/libarchive/3.8.9/tar/test/test_option_O_upper.c /usr/src/debug/libarchive/3.8.9/tar/test/test_option_P_upper.c /usr/src/debug/libarchive/3.8.9/tar/test/test_option_T_upper.c /usr/src/debug/libarchive/3.8.9/tar/test/test_option_U_upper.c /usr/src/debug/libarchive/3.8.9/tar/test/test_option_X_upper.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_filter_compress.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_gtar_sparse_skip_entry.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_short_writes.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_zip_traditional_encryption_data.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_gtar_redundant_L.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_archive_cmdline.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_tgz.c /usr/src/debug/l
 ibarchive/3.8.9/libarchive/test/test_read_format_tar_timestamp_overflow.c /usr/src/debug/libarchive/3.8.9/tar/test/test_option_s.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_raw_b64.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_read_support_format_cab.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_filter_lzop_multiple_parts.c /usr/src/debug/libarchive/3.8.9/tar/test/test_option_q.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_ar.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_tar_mac_metadata.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_acl_platform_nfs4.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_disk_mac_metadata.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_archive_read_set_options.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_parse_date.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_tar_empty_pax.c /usr/src/debug/libarchive/3.8.9/unzip/
 test/test_Z1.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_open_memory.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_archive_set_error.c /usr/src/debug/libarchive/3.8.9/unzip/test/test_t_bad.c /usr/src/debug/libarchive/3.8.9/unzip/test/test_doubledash.c /usr/src/debug/libarchive/3.8.9/tar/test/test_empty_mtree.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_filter_uudecode.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_xattr_platform.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_write_add_filter_xz.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_acl_platform_posix1e.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_filter_uuencode.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_iso9660_rockridge.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_zip_extra_padding.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_zip_winzip_aes.c /usr/src/debug/libarchive/3.8.9/li
 barchive/test/test_read_format_zip_symlink_unsupported_compression.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_zip_filename.c /usr/src/debug/libarchive/3.8.9/unzip/test/test_not_exist.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_cmdline.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_disk_sparse.c /usr/src/debug/libarchive/3.8.9/libarchive_fe/line_reader.h /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_zip_jar.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_zip_sfx.c /usr/src/debug/libarchive/3.8.9/unzip/test/test_d.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_read_data_into_fd.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_write_disk_posix.c /usr/src/debug/libarchive/3.8.9/libarchive_fe/line_reader.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_zip_stream.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_read_support_format_7zip.c /usr/src/debug/libarchive/3.8.9/li
 barchive/archive_pack_dev.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_huge_rpm.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_tz.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_archive_digest.c /usr/src/debug/libarchive/3.8.9/tar/test/test_option_keep_newer_files.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_acl_posix1e.c /usr/src/debug/libarchive/3.8.9/unzip/test/test_f.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_pack_dev.h /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_rar_invalid1.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_tar_large.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_format_cpio_bin_bz2.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_warc.c /usr/src/debug/libarchive/3.8.9/unzip/test/test_n.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_string_sprintf.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_zip64_stream.c /
 usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_file_nonexistent.c /usr/src/debug/libarchive/3.8.9/tar/test/test_option_a.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_options.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_write_set_format_pax.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_write_set_format_raw.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_write_set_format_xar.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_write_set_format_zip.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_read_data_into_fd_size_exceeds_declared.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_zip.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_archive_write_add_filter.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_read_support_filter_xz.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_read_support_filter_zstd.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_filter_lz4.c /usr/src/debug/libarchive/3.8.9/ta
 r/test/test_option_k.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_write_open_memory.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_iso9660.c /usr/src/debug/libarchive/3.8.9/libarchive/archive_write_set_options.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_warn_missing_hardlink_target.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_tar.c /usr/src/debug/libarchive/3.8.9/libarchive/test/test_write_format_zip_file_zip64.c", added "/usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_zip_compression_lzma_xz.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_acl_text.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_cpio_bin_Z.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_zip_with_invalid_traditional_eocd.c /usr/src/debug/libarchive/3.8.10/tar/test/test_option_ignore_zeros.c /usr/src/debug/libarchive/3.8.10/tar/test/test_option_lrzip.c /usr/src/debug/libarchive/3.8.10/tar/t
 est/test_option_grzip.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_archive_seek_data_unsupported.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_iso9660_rockridge.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_xar.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_filter_program_signature.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_isozisofs_compress.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_read_support_filter_zstd.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_write_open_file.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_compat_xz.c /usr/src/debug/libarchive/3.8.10/tar/test/test_option_xz.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_write_set_format_filter_by_ext.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_gtar_sparse_length.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_cpio_svr4_bzip2_rpm.c /usr/src/debug/libar
 chive/3.8.10/libarchive/archive_read_add_passphrase.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_tar_concatenated.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_write.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_gnutar_filename_encoding.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_open_fd.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_isojoliet_compress.c /usr/src/debug/libarchive/3.8.10/tar/test/test_stdio.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_open_file.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_disk_secure745.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_xxhash.h /usr/src/debug/libarchive/3.8.10/libarchive/test/test_compat_uudecode_large.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_filter_zstd_raw.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_7zip.c /usr/src/debug/libarchive/3.8.10/tar/test/test_empty_mtree.c /usr/src/debug/lib
 archive/3.8.10/libarchive/test/test_write_read_format_zip.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_data_into_fd_no_offset_reported.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_write_set_format_mtree.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_tar_empty_with_gnulabel.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_write_set_format_ar.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_write_add_filter_zstd.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_rar_filter.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_rar_encryption_data.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_zip_encryption_data.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_ustar_filename_encoding.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_v7tar_filename_encoding.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_mtree_preset_digests.c /usr/src/debug/libar
 chive/3.8.10/libarchive/test/test_read_format_cpio_svr4_gzip.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_7zip.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_truncated_filter.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_cpio.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_warc.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_data_large.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_read_disk_private.h /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_filter_compress.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_read_set_options.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_entry.h /usr/src/debug/libarchive/3.8.10/libarchive/archive_entry.c /usr/src/debug/libarchive/3.8.10/tar/test/test_option_lzma.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_iso9660_rr_moved_notdir.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_i
 so_rockridge_cl_re_cycle.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_cpio_bin_gz.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_archive_string_conversion.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_read_support_format_cab.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_file_nonexistent.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_xar.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_cab_lzx_invalid_history.c /usr/src/debug/libarchive/3.8.10/tar/test/test_option_xattrs.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_write_set_format_7zip.c /usr/src/debug/libarchive/3.8.10/libarchive_fe/lafe_err.h /usr/src/debug/libarchive/3.8.10/libarchive_fe/lafe_err.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_tar_acl_oob_read.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_rar5_truncated_htime.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write
 _filter_uuencode.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_iso9660_empty.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_write_set_format_shar.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_zip_compression_bzip2.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_zip_compression_store.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_cpio_bin_bz2.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_archive_read_open_filenames.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_fuzz_consumer.h /usr/src/debug/libarchive/3.8.10/libarchive/test/test_compat_lz4.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_write_add_filter_gzip.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_write_add_filter_lzop.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_compat_mac.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_compat_zip.c /usr/src/debug/libarchive/3.8.10/libarchive/test/
 test_read_format_tar_invalid_pax_size.c /usr/src/debug/libarchive/3.8.10/tar/test/test_option_lz4.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_read_support_filter_none.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_cpio_bin_be.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_disk_fixup.c /usr/src/debug/libarchive/3.8.10/tar/test/test_option_mode.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_write_set_format_cpio_odc.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_cpio_bin_le.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_write_set_format_by_name.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_acl_pax.c /usr/src/debug/libarchive/3.8.10/tar/test/test_extract_tar_bz2.c /usr/src/debug/libarchive/3.8.10/unzip/test/test_I.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_xar_fflags.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_read_support_filter_lzop.c /usr/src/debug/libarchiv
 e/3.8.10/libarchive/test/test_read_data_into_fd_size_exceeds_declared.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_mtree_absolute_path.c /usr/src/debug/libarchive/3.8.10/tar/test/test_format_newc.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_filter_lzop.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_write_add_filter_b64encode.c /usr/src/debug/libarchive/3.8.10/tar/test/test_extract_tar_gz.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_mtree_null_deref.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_cpio_bin_lzip.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_cpio_bin_lzma.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_tbz.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_cpio_newc.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_read_support_format_empty.c /usr/src/debug/libarchive/3.8.10/unzip/test/test_version.c /usr/src/debug/li
 barchive/3.8.10/libarchive/archive_read_support_format_zip.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_read_support_format_xar.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_isorr_rr_moved.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_digest.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_iso_zisofs_overflow.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_acl_platform_nfs4.c /usr/src/debug/libarchive/3.8.10/tar/test/test_option_safe_writes.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_disk.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_tar_v7tar.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_gtar_sparse_exceeds_length.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_cryptor_private.h /usr/src/debug/libarchive/3.8.10/tar/test/test_list_item.c /usr/src/debug/libarchive/3.8.10/unzip/test/test_0.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_archive_
 read.c /usr/src/debug/libarchive/3.8.10/tar/test/test_option_T_upper.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_zip_zipx_lzma_oom.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_compat_gtar_large.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_zip_compression_zstd.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_tar_mac_metadata.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_blake2.h /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_zip_mac_metadata.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_version_details.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_filter_program.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_write_set_format_cpio_newc.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_read_support_format_rar.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_mtree.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_extra
 ct.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_zip_winzip_aes.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_tlz.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_pax_filename_encoding.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_zip_large.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_pack_dev.c /usr/src/debug/libarchive/3.8.10/unzip/test/test_C.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_pack_dev.h /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_disk_failures.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_entry_link_resolver.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_read_open_fd.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_cryptor.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_write_add_filter.c /usr/src/debug/libarchive/3.8.10/tar/test/test_extract_tar_lrz.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_write_add_filter_bzip2.c /usr/src/
 debug/libarchive/3.8.10/libarchive/archive_read_open_memory.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_archive_read_close_twice.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_zip_empty.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_zip_empty_zip64.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_compat_bzip2.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_cab_filename.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_lha_filename.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_tar_filename.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_zip_filename.c /usr/src/debug/libarchive/3.8.10/tar/test/test_extract_tar_lz4.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_tar_empty_filename.c /usr/src/debug/libarchive/3.8.10/tar/test/test_option_zstd.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_tar_pax_sun_holesda
 ta.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_pax_empty_val_no_nl.c /usr/src/debug/libarchive/3.8.10/unzip/test/test_basic.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_filter_compress.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_entry_stat.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_7zip_encryption_header.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_tar_pax_g_large.c /usr/src/debug/libarchive/3.8.10/tar/test/test_option_older_than.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_umask_private.h /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_gnutar_huge.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_zip_symlink_unsupported_compression.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_virtual.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_cpio_odc.c /usr/src/debug/libarchive/3.8.10/libarchive_fe/passphrase.h /usr/src/debug/lib
 archive/3.8.10/libarchive/archive_digest_private.h /usr/src/debug/libarchive/3.8.10/libarchive/archive_hmac.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_read.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_time.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_util.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_acl_nfs4_text.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_iso9660_zisofs_overflow.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_random.c /usr/src/debug/libarchive/3.8.10/libarchive_fe/passphrase.c /usr/src/debug/libarchive/3.8.10/tar/test/test_windows.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_filter_uudecode_newlines.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_cpio_afio.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_zip_uncompressed_size_off_by_4gib.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_warc_empty.c /usr/src/debug/libarchi
 ve/3.8.10/libarchive/test/test_write_format_7zip_empty.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_cpio_svr4_gzip_rpm.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_iso_joliet_utf16be_overflow.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_cpio_empty.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_shar_empty.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_read_support_filter_uu.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_write_add_filter_xz.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_zip_zipx_encrypted.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_write_disk_private.h /usr/src/debug/libarchive/3.8.10/tar/test/test_crlf_mtree.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_ar_mode.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_write_open_memory.c /usr/src/debug/libarchive/3.8.10/tar/test/test_option_exclude.c /usr/src/debug/libarchive/
 3.8.10/libarchive/test/test_archive_write_set_format_filter_by_ext.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_zip_msdos.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_cab_lzx_oob.c /usr/src/debug/libarchive/3.8.10/tar/test/test_symlink_dir.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_read_support_filter_by_code.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_read_support_format_by_code.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_zip_empty_pathname.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_rar_encryption_partially.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_zip_encryption_partially.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_ppmd7_private.h /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_cpio_svr4c_Z.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_archive_set_error.c /usr/src/debug/libarchive/3.8.10/libarchive/arch
 ive_ppmd7.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_disk_times.c /usr/src/debug/libarchive/3.8.10/tar/test/test_option_acls.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_ar.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_disk_directory_traversals.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_empty.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_short_writes.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_iso_Z.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_mtree.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_archive_read_add_passphrase.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_tz.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_7zip_packinfo_digests.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_disk_secure.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_disk_secure_physicaldri
 ve.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_7zip_folders_oom.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_disk_sparse.c /usr/src/debug/libarchive/3.8.10/tar/test/test_option_keep_newer_files.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_read_support_filter_program.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_7zip_entries_oom.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_lha_filename_utf16.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_rar5_header_size_wraparound.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_archive_crc32.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_string_composition.h /usr/src/debug/libarchive/3.8.10/libarchive/test/test_archive_write_add_filter_by_name.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_read_support_filter_compress.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_filter_count.c /usr/src/debug/libarchive/
 3.8.10/libarchive/archive_write_disk_set_standard_lookup.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_archive_digest.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_zip_high_compression.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_zip_sfx.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_gnutar_filenames.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_gtar_gz.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_tgz.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_gtar_lzma.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_zip_traditional_encryption_data.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_read_support_format_iso9660.c /usr/src/debug/libarchive/3.8.10/unzip/test/test_o.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_raw.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_open_filename.c /usr/src/debu
 g/libarchive/3.8.10/libarchive/test/test_archive_write_set_options.c /usr/src/debug/libarchive/3.8.10/unzip/test/test_q.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_acl_platform_posix1e.c /usr/src/debug/libarchive/3.8.10/tar/test/test_option_exclude_vcs.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_write_add_filter_lz4.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_compat_solaris_pax_sparse.c /usr/src/debug/libarchive/3.8.10/unzip/test/test_u.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_tar_V_negative_size.c /usr/src/debug/libarchive/3.8.10/tar/test/test_option_lzop.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_write_set_format_gnutar.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_mtree_quoted_filename.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_gtar_sparse.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_rar5_bad_tables.c /usr/src/debug/libarchive/3.8.10/libar
 chive/archive_write_add_filter_compress.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_zip_jar.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_archive_api_feature.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_write_set_format_iso9660.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_pax_align.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_isorr_compress.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_options_private.h /usr/src/debug/libarchive/3.8.10/tar/test/test_0.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_pax_truncated.c /usr/src/debug/libarchive/3.8.10/unzip/test/test_t_bad.c /usr/src/debug/libarchive/3.8.10/unzip/test/test_symlink_dotdot.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_gtar_sparse_skip_entry.c /usr/src/debug/libarchive/3.8.10/tar/test/test_extract_tar_lzo.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_cab_multi.c /usr/src/
 debug/libarchive/3.8.10/libarchive/test/test_write_disk_appledouble.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_pax_xattr_schily.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_ustar_filenames.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_compat_tar_hardlink.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_archive_pathmatch.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_write_private.h /usr/src/debug/libarchive/3.8.10/libarchive/archive_read_disk_entry_from_file.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_compat_lzma.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_zip_file.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_read_support_filter_rpm.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_read_support_format_rpm.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_link_resolver.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_zip_comment_stored.c /usr/src/debug/libar
 chive/3.8.10/libarchive/test/test_compat_cpio.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_7zip_encryption_data.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_ustar_filename.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_zip_nofiletype.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_read_extract2.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_string_sprintf.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_read_support_filter_xz.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_disk_perms.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_read_support_format_ar.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_filter_bzip2.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_tar_timestamp_overflow.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_filter_lrzip.c /usr/src/debug/libarchive/3.8.10/tar/test/test_option_owner.c /usr/src/debug/libarchive/3
 .8.10/libarchive/archive_read_extract.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_tar_pax_global_header.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_write_set_passphrase.c /usr/src/debug/libarchive/3.8.10/tar/test/test_extract_tar_xz.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_disk_acl_linux.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_cab.c /usr/src/debug/libarchive/3.8.10/libarchive/filter_fork_posix.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_entry_sparse.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_rar_overflow.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_disk_hardlink.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_match.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_compat_star_acl.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_entry_locale.h /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_zip_unset_times.c /usr/src/debug/l
 ibarchive/3.8.10/libarchive/test/test_read_format_tar.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_pax_xattr_header.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_7zip_encryption_partially.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_truncated.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_read_support_format_lha.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_compat_perl_archive_tar.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_read_support_format_mtree.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_iso9660_zisofs.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_cab_mszip_oob.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_read_support_filter_lz4.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_archive_write_set_passphrase.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_zip_extra_padding.c /usr/src/debug/libarchive/3.8.10/libarchive/test/t
 est_write_format_zip_file_zip64.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_zip64_stream.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_tar_pax_timestamps.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_disk_symlink.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_acl_posix1e.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_rar5.c /usr/src/debug/libarchive/3.8.10/tar/test/test_basic.c /usr/src/debug/libarchive/3.8.10/tar/test/test_option_group.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_write_set_format_cpio_binary.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_archive_read_set_options.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_too_many_filters.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_7zip_malformed.c /usr/src/debug/libarchive/3.8.10/tar/test/test_copy.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_lha.c /usr/src/d
 ebug/libarchive/3.8.10/libarchive/test/test_read_format_rar_filter_incomplete_block.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_gtar_redundant_L.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_compat_tar_directory.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_disk.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_ppmd8_private.h /usr/src/debug/libarchive/3.8.10/libarchive/test/test_acl_from_text_overread.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_zip_entry_size_unset.c /usr/src/debug/libarchive/3.8.10/tar/test/test_option_a.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_disk_secure744.c /usr/src/debug/libarchive/3.8.10/tar/test/test_option_b.c /usr/src/debug/libarchive/3.8.10/tar/test/test_option_j.c /usr/src/debug/libarchive/3.8.10/tar/test/test_option_k.c /usr/src/debug/libarchive/3.8.10/tar/test/test_option_n.c /usr/src/debug/libarchive/3.8.10/tar/test/test_option_q.c /usr/src/debug/libar
 chive/3.8.10/tar/test/test_option_r.c /usr/src/debug/libarchive/3.8.10/tar/test/test_option_s.c /usr/src/debug/libarchive/3.8.10/tar/test/test_option_z.c /usr/src/debug/libarchive/3.8.10/unzip/test/test_windows_paths.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_disk_secure746.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_iso9660_boot.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_iso9660_bugs.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_xattr_platform.c /usr/src/debug/libarchive/3.8.10/unzip/test/test_P_encryption.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_read_disk_posix.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_write_add_filter_program.c /usr/src/debug/libarchive/3.8.10/tar/test/test_missing_file.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_disk_no_hfs_compression.c /usr/src/debug/libarchive/3.8.10/libarchive_fe/lafe_setmode.h /usr/src/debug/libarchive/3.8.10/libarchive
 /test/test_read_format_zip_size_exceeds_declared.c /usr/src/debug/libarchive/3.8.10/libarchive_fe/lafe_setmode.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_archive_read_append_filter.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_large.c /usr/src/debug/libarchive/3.8.10/tar/test/test_option_stdout_size_exceeds_declared.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_cab_skip_malformed.c /usr/src/debug/libarchive/3.8.10/tar/test/test_strip_components.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_open_memory.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_zip_nested.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_read_support_format_tar.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_isorr_ce_loop.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_zip_ntfs_timestamp.c /usr/src/debug/libarchive/3.8.10/tar/test/test_option_b64encode.c /usr/src/debug/libarchive/3.8.
 10/libarchive/archive_read_support_filter_lrzip.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_read_set_format.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_archive_read_next_header_raw.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_files_compressed.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_archive_pathmatch_oob.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_archive_write_set_format_by_name.c /usr/src/debug/libarchive/3.8.10/tar/test/test_extract_tar_grz.c /usr/src/debug/libarchive/3.8.10/tar/test/test_option_passphrase.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_cpio_symlink_trailer.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_tar_large.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_tar_filenames.c /usr/src/debug/libarchive/3.8.10/tar/test/test_print_longpath.c /usr/src/debug/libarchive/3.8.10/tar/test/test_option_nodump.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_form
 at_txz.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_zip_long_pathname.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_iso_rockridge_zf_overflow.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_cpio_odc.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_disk_secure_noabsolutepaths.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_options.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_cmdline.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_pax_xattr_rht_security_selinux.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_archive_string_conversion_overread.c /usr/src/debug/libarchive/3.8.10/unzip/test/test_doubledash.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_isojoliet_long.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_pax_bz2.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_write_open_filename.c /usr/src/debug/libarchive/3.8.10/unzi
 p/test/test_singlefile.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_mtree_fflags.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_write_add_filter_none.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_filter_grzip.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_write_set_format.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_filter_lrzip.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_iso_multi_extent.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_sparse_basic.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_zip_windows_path.c /usr/src/debug/libarchive/3.8.10/libarchive/archive.h /usr/src/debug/libarchive/3.8.10/tar/test/list.h /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_gnutar.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_mtree_classic.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_tar.c /usr/src/debug/libar
 chive/3.8.10/libarchive/archive_write_set_format_cpio.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_write_set_format_pax.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_write_set_format_raw.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_write_set_format_xar.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_write_set_format_zip.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_acl_private.h /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_lha_symlink_missing_target.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_filter_uudecode.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_zip.c /usr/src/debug/libarchive/3.8.10/tar/test/test_option_C_mtree.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_cmdline_private.h /usr/src/debug/libarchive/3.8.10/libarchive/archive_read_support_format_warc.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_write_add_filter_uuencode.c /usr/src/debug/libarchive/3.8.10/libar
 chive/test/test_archive_read_multiple_data_objects.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_iso_xorriso.c /usr/src/debug/libarchive/3.8.10/unzip/test/test_not_exist.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_warn_missing_hardlink_target.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_cpio_bin.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_isojoliet_rr.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_read_support_format_cpio.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_rb.h /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_disk_mac_metadata.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_platform_stat.h /usr/src/debug/libarchive/3.8.10/libarchive/archive_rb.c /usr/src/debug/libarchive/3.8.10/libarchive/test/list.h /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_filter_uudecode_raw.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_zip_negative_tim
 estamps.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_cab_lzx_16bit.c /usr/src/debug/libarchive/3.8.10/tar/test/test_extract_tar_lzma.c /usr/src/debug/libarchive/3.8.10/tar/test/test_extract_tar_zstd.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_filter_lz4.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_lha_oversize_header.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_xar_bugs.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_rar5_varint_near_eof.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_mtree_classic_indent.c /usr/src/debug/libarchive/3.8.10/tar/test/test_option_gid_gname.c /usr/src/debug/libarchive/3.8.10/tar/test/test_option_uid_uname.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_tar_sparse.c /usr/src/debug/libarchive/3.8.10/tar/test/test_option_fflags.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_zip_zip64.c /
 usr/src/debug/libarchive/3.8.10/tar/test/test_extract_tar_Z.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_integer.h /usr/src/debug/libarchive/3.8.10/libarchive/test/test_archive_read_open2.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_empty_write.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_entry_strmode.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_entry_private.h /usr/src/debug/libarchive/3.8.10/libarchive/test/read_open_memory.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_filter_xz.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_write_set_options.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_random_private.h /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_zip_dos_mtime_precedence.c /usr/src/debug/libarchive/3.8.10/tar/test/test_option_uuencode.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_xar_doublelink.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_rar5_b
 lock_hdr_fail_loop.c /usr/src/debug/libarchive/3.8.10/libarchive/filter_fork.h /usr/src/debug/libarchive/3.8.10/libarchive/test/test_compat_solaris_tar_acl.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_7zip_large.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_filter_program.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_zip.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_acl_nfs4.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_blake2sp_ref.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_archive_read_next_header_empty.c /usr/src/debug/libarchive/3.8.10/unzip/test/test_L.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_zip_zip64.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_iso_rockridge_ce_overflow.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_zip_stream.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_archive_match_owner.c /usr/src/d
 ebug/libarchive/3.8.10/libarchive/test/test_read_format_isorr_ce.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_write_set_format_warc.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_write_add_filter_by_name.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_disk_hfs_compression.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_position.c /usr/src/debug/libarchive/3.8.10/tar/test/test_patterns.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_write_add_filter_grzip.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_write_add_filter_lrzip.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_zip_padded.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_string.h /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_cpio_bin_xz.c /usr/src/debug/libarchive/3.8.10/unzip/test/test_symlink.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_read_support_filter_grzip.c /usr/src/debug/libarchive/3.8.10/libarchive/archive
 _read_support_format_raw.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_string.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_raw_b64.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_tar_pax_large_attr.c /usr/src/debug/libarchive/3.8.10/unzip/test/test_f.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_create_child_environment.c /usr/src/debug/libarchive/3.8.10/libarchive/xxhash.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_mtree_crash747.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_rar_encryption.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_extattr_freebsd.c /usr/src/debug/libarchive/3.8.10/unzip/test/test_d.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_open_failure.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_zip_malformed.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_endian.h /usr/src/debug/libarchive/3.8.10/tar/test/test_version.
 c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_compat_uudecode.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_read_disk_set_standard_lookup.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_isojoliet_versioned.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_compat_gzip.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_compat_lzip.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_compat_lzop.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_lha_bugfix_0.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_entry_copy_stat.c /usr/src/debug/libarchive/3.8.10/tar/test/test_option_U_upper.c /usr/src/debug/libarchive/3.8.10/tar/test/test_option_X_upper.c /usr/src/debug/libarchive/3.8.10/tar/test/test_option_C_upper.c /usr/src/debug/libarchive/3.8.10/tar/test/test_option_H_upper.c /usr/src/debug/libarchive/3.8.10/tar/test/test_option_L_upper.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_zip_filename_encoding.
 c /usr/src/debug/libarchive/3.8.10/tar/test/test_option_O_upper.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_read_open_file.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_data_block_offset_at_eof.c /usr/src/debug/libarchive/3.8.10/tar/test/test_option_P_upper.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_set_format.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_archive_cmdline.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_read_support_format_rar5.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_compat_plexus_archiver_tar.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_mtree_absolute.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_tar_empty_pax.c /usr/src/debug/libarchive/3.8.10/tar/test/test_edit_pathname_hardlink.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_archive_parse_date.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_filter_lz4_raw.c /usr/src/debug/li
 barchive/3.8.10/libarchive/archive_acl.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_crc32.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_archive_match_path.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_archive_match_time.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_archive_ntfs_time.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_hmac_private.h /usr/src/debug/libarchive/3.8.10/libarchive/archive_ppmd_private.h /usr/src/debug/libarchive/3.8.10/libarchive/archive_read_private.h /usr/src/debug/libarchive/3.8.10/libarchive/archive_time_private.h /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_7zip_issue2765.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_iso9660.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_read_support_filter_bzip2.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_archive_clear_error.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_compat_gtar.c /usr/src/debug/libar
 chive/3.8.10/tar/test/test_extract_tar_lz.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_rar_invalid1.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_tar_empty_dirname.c /usr/src/debug/libarchive/3.8.10/unzip/test/list.h /usr/src/debug/libarchive/3.8.10/unzip/test/test_glob.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_pax.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_zip_7075_utf8_paths.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_read_support_format_7zip.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_entry_strmode.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_compat_zstd.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_archive_read_support.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_iso9660_filename.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_write_open_fd.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_acl_nfs4_null_i
 d_overflow.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_mtree_dotdot.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_zip_ambiguous_timestamps.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_warc.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_zip_winzip_aes_large.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_read_support_filter_gzip.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_read_append_filter.c /usr/src/debug/libarchive/3.8.10/unzip/test/test_p.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_cab_lzx_e8.c /usr/src/debug/libarchive/3.8.10/unzip/test/test_Z1.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_isorr_new_compress.c /usr/src/debug/libarchive/3.8.10/libarchive_fe/line_reader.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_disk_entry_from_file.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_cpio_filename
 .c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_gtar_filename.c /usr/src/debug/libarchive/3.8.10/libarchive_fe/line_reader.h /usr/src/debug/libarchive/3.8.10/libarchive/archive_write_set_format_private.h /usr/src/debug/libarchive/3.8.10/unzip/test/test_x.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_raw.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_filter_gzip_recursive.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_check_magic.c /usr/src/debug/libarchive/3.8.10/tar/test/test_option_newer_than.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_filter_lzop_multiple_parts.c /usr/src/debug/libarchive/3.8.10/tar/test/test_help.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_private.h /usr/src/debug/libarchive/3.8.10/tar/test/test_option_mtime.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_bad_fd.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_rar_encryption_header.c /usr/src/de
 bug/libarchive/3.8.10/libarchive/test/test_read_format_zip_encryption_header.c /usr/src/debug/libarchive/3.8.10/unzip/test/test_j.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_filter_b64encode.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_mtree_no_separator.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_read_data_into_fd.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_ppmd8.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_7zip_filename_encoding.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_umask.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_iso9660_rockridge_overflow.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_write_disk_posix.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_tar_ustar.c /usr/src/debug/libarchive/3.8.10/tar/test/test_leading_slash.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_fuzz.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_parse
 _date.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_mtree_size.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_rar.c /usr/src/debug/libarchive/3.8.10/unzip/test/test_n.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_filter_gzip.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_filter_lzip.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_filter_lzma.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_tar_pax_negative_time.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_filter_lzop.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_filter_zstd.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_disk_lookup.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_archive_string.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_entry_xattr.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_entry.c /usr/src/debug/libarchive/3.8.10/libarchive/test/tes
 t_read_format_huge_rpm.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_tar_empty.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_xar_empty.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_rar5_loop_bug.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_filter_gzip_timestamp.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_zip_empty.c /usr/src/debug/libarchive/3.8.10/unzip/test/test_t.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_blake2_impl.h /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_rar5_extra_field_underflow.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_blake2s_ref.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_acl_posix1e_text.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_rar5_bad_filter.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_zip_lzma_alone_large_size.c /usr/src/debug/libarchive/3.8.10/libar
 chive/test/test_write_format_ar.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_cab_skip_across_folders.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_rar5_redir_overflow.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_archive_write_add_filter.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_read_format_zip_ntfs_precedence.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_read_support_filter_all.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_read_support_format_all.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_pathmatch.h /usr/src/debug/libarchive/3.8.10/libarchive/archive_read_open_filename.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_pathmatch.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_write_set_format_ustar.c /usr/src/debug/libarchive/3.8.10/libarchive/archive_write_set_format_v7tar.c /usr/src/debug/libarchive/3.8.10/libarchive/test/test_write_format_iso9660_joliet_id.c /usr/src/debug/l
 ibarchive/3.8.10/libarchive/test/test_read_format_lha_amiga_script.c"
packages/x86-64-v3-poky-linux/libarchive/libarchive-src: PKGSIZE changed from 7300332 to 7588723 (+4%)
packages/x86-64-v3-poky-linux/libarchive/libarchive-src: PV changed from "3.8.9" to "3.8.10"
packages/x86-64-v3-poky-linux/libarchive/libarchive-staticdev: PKGV changed from 3.8.9 [default] to 3.8.10 [default]
packages/x86-64-v3-poky-linux/libarchive/libarchive-staticdev: PV changed from "3.8.9" to "3.8.10"
packages/x86-64-v3-poky-linux/libarchive/libarchive: PKGV changed from 3.8.9 [default] to 3.8.10 [default]
packages/x86-64-v3-poky-linux/libarchive/libarchive: FILELIST: removed "/usr/lib/libarchive.so.13.8.9", added "/usr/lib/libarchive.so.13.8.10"
packages/x86-64-v3-poky-linux/libarchive/libarchive: PKGSIZE changed from 903348 to 907445 (+0%)
packages/x86-64-v3-poky-linux/libarchive/libarchive: PV changed from "3.8.9" to "3.8.10"
Changes to packages/x86-64-v3-poky-linux/libarchive (sysroot):
  /usr/lib/libarchive.so.13 changed symlink target from libarchive.so.13.8.9 to libarchive.so.13.8.10
  /usr/lib/libarchive.so changed symlink target from libarchive.so.13.8.9 to libarchive.so.13.8.10
  /usr/lib/libarchive.so.13.8.10 was added
  /usr/lib/libarchive.so.13.8.9 was removed
Changes to packages/x86_64-linux/elfutils-native (sysroot):
  /usr/bin/eu-stackprof was added
Changes to packages/x86_64-linux/libarchive-native (sysroot):
  /usr/lib/libarchive.so.13 changed symlink target from libarchive.so.13.8.9 to libarchive.so.13.8.10
  /usr/lib/libarchive.so changed symlink target from libarchive.so.13.8.9 to libarchive.so.13.8.10
  /usr/lib/libarchive.so.13.8.10 was added
  /usr/lib/libarchive.so.13.8.9 was removed

--===============3735459126619506349==--

