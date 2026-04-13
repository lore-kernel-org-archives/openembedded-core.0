Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71B07F34C56
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 14:09:51 +0000 (UTC)
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.273440.1776089389448050109
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2026 07:09:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KZ4rr7AJ;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: festevam@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2d17b8fbedaso1767269eec.1
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 07:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776089388; x=1776694188; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zrWZn82wzmNKKbC4E9TgvcbXCTvSkrd4gqS8YQ3xJMY=;
        b=KZ4rr7AJT2XpNVesCkMBbcz4q0g3zmEi4MBdUNZt5ALqOyI2sN5Ho3pulm6CifWxgo
         DmbcHOqmIdUORVsi1159TWYauCyJPjUSqxtR8icDwCPYH+V0VhN/A2uPWkFt1NrKJctS
         TFiTE1VGDkaO6bPm8BSbodFE33eI1zQ30P7o0NPmEtT0UDm6t09LGQIGeuLDgsYVGtHp
         WUGHlg72uliMCZQVjC8STJNBi3t6xpymjCvyZELpDas4PGE8h6zJlYjmrm9uvFh1xwEM
         tDJlYFWhEHVCRZWSGuWQWWjXI9BL23CGZEwxM4/sESos84NzzbzyzHEhK7zlIJlVRftU
         /ZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776089388; x=1776694188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zrWZn82wzmNKKbC4E9TgvcbXCTvSkrd4gqS8YQ3xJMY=;
        b=GmWYkkSlvyhF40ftelExv4e8MTaesKXtkZkpBARmMad3k9FHd5YEdHxA2PhIqasf/H
         axz00+YyekHq19lf0CfvuHxBPo0+Iw1gpoJNofI+Dqn294T2xKHG9RwsQXfhpLqlMheF
         az5rzBwKU/B3HOw+X8PJ4IKY0Uh5u2PplffYUxikc+m5bDHo/C4gl4Vof7YtSnb11vkF
         2vsaiFiw0Od3NOHfWyvEY05Bi4nbC8TpUy3t8iXGQNqgnKrGU9udz/ZdkKUUHH3audJP
         RE0mPCa6tAWEUERhz2+vdPM6XD4PLq34Isu/2mtVO+pfpeDV5lacytxxz4rjpbFvyG9L
         WscQ==
X-Gm-Message-State: AOJu0YwdcjsW+0T8/E0x2Q5+9eYIDkZsibxXBWNQ4ARs5yRQEPOJ9Ek+
	xVnL4+UODcS25xRbOh/unGisTqx0By4RQ57wz1HiL1mtM4ehcaiQ1m72/V0DRQ==
X-Gm-Gg: AeBDiesnUeDo9+QvcTfYcGOhbNHg812Y6xJRLpWuqs3d1XPI/TzlshbDS/oU8D+Zt2z
	e1MuUiSOh61FIRlbt8+N9RkseCtFvUe+a85AQx+pL0P+iVmx/7pk+fHMNRXsM3n6AJym0k37vgy
	vlwOdZRtsaUdc55t6AruD0H5rp9mQtvwGcQpRffNeOrL34Zb0dhf4DTqX1QVcjPFGosIm0IaSsh
	44Hf9JE/JgB6WTzfqR7h9Njfksihs+8n+M3nCLR0WdJADmyNIpaTLW+VckS3oJMfmrWwqANUl6B
	EQFd2ybCiYqmDBCvgf1DcYfx8SbAGwk3Ypa+O10+VVJ+fUAjH8BlEokfTmZrN2EkOL7EOLFGEH5
	sVC2zRg98lGwjAXkvCSAoi1ZttLGsqSyV9yYxaT0jLkv/WzF/qslkvfak62a/QStbsRgrSqMJRS
	0gq9fF7mnwql8zL0rEk/oH6+nDRQM+H348h00rXDQtAtj3yjWssiGCLdDndEzFagWT3HOJ
X-Received: by 2002:a05:7300:a40e:b0:2d9:6652:524b with SMTP id 5a478bee46e88-2d96652663cmr1419693eec.17.1776089387991;
        Mon, 13 Apr 2026 07:09:47 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:1b3:a800:5c22:6e06:383:9a0b:8abd])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55ce46a65sm16668162eec.0.2026.04.13.07.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 07:09:46 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] mtd-utils: Upgrade to 2.3.1
Date: Mon, 13 Apr 2026 11:09:11 -0300
Message-ID: <20260413140911.705141-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 14:09:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235113

Upgrade to mtd-utils 2.3.1.

Remove all the local patches as they have all landed in 2.3.1.

Details about the 2.3.1 release:

https://lore.kernel.org/linux-mtd/73da3205-694e-422a-ac73-d7bcb054aa1e@sigma-star.at/T/#u

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 ...prove-check-for-GCC-compiler-version.patch | 34 ----------
 ...-ubifs-utils-ubifs.h-Include-fcntl.h.patch | 53 ---------------
 ...ifs-utils-journal-Include-sys-stat.h.patch | 41 ------------
 ...-libmissing.a-in-case-execinfo.h-isn.patch | 66 -------------------
 ...extract_files-Include-linux-limits.h.patch | 41 ------------
 ...{mtd-utils_2.3.0.bb => mtd-utils_2.3.1.bb} |  7 +-
 6 files changed, 1 insertion(+), 241 deletions(-)
 delete mode 100644 meta/recipes-devtools/mtd/files/0001-Improve-check-for-GCC-compiler-version.patch
 delete mode 100644 meta/recipes-devtools/mtd/files/0001-ubifs-utils-ubifs.h-Include-fcntl.h.patch
 delete mode 100644 meta/recipes-devtools/mtd/files/0002-ubifs-utils-journal-Include-sys-stat.h.patch
 delete mode 100644 meta/recipes-devtools/mtd/files/0003-ubifs-utils-link-libmissing.a-in-case-execinfo.h-isn.patch
 delete mode 100644 meta/recipes-devtools/mtd/files/0004-ubifs-utils-extract_files-Include-linux-limits.h.patch
 rename meta/recipes-devtools/mtd/{mtd-utils_2.3.0.bb => mtd-utils_2.3.1.bb} (91%)

diff --git a/meta/recipes-devtools/mtd/files/0001-Improve-check-for-GCC-compiler-version.patch b/meta/recipes-devtools/mtd/files/0001-Improve-check-for-GCC-compiler-version.patch
deleted file mode 100644
index 2329dfece3..0000000000
--- a/meta/recipes-devtools/mtd/files/0001-Improve-check-for-GCC-compiler-version.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From e7adb21350ff3b96dbd2de56a127e9d916c08d62 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 22 Mar 2025 19:05:32 -0700
-Subject: [PATCH] Improve check for GCC compiler version
-
-When using unreleased compiler has version like
-15.0.1 and that test fails because __GNUC_MINOR__ < 1
-becomes true, therefore check for full version string
-which is more rubust.
-
-Upstream-Status: Backport [https://github.com/sigma-star/mtd-utils/commit/ac0ab65ebcd7b11739986b81343457469fbb43b0]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- ubifs-utils/common/atomic.h | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/ubifs-utils/common/atomic.h b/ubifs-utils/common/atomic.h
-index f287d43..95754b2 100644
---- a/ubifs-utils/common/atomic.h
-+++ b/ubifs-utils/common/atomic.h
-@@ -2,8 +2,12 @@
- #ifndef __ATOMIC_H__
- #define __ATOMIC_H__
- 
-+#define GCC_VERSION (__GNUC__ * 10000 \
-+                     + __GNUC_MINOR__ * 100 \
-+                     + __GNUC_PATCHLEVEL__)
-+
- /* Check GCC version, just to be safe */
--#if !defined(__GNUC__) || (__GNUC__ < 4) || (__GNUC_MINOR__ < 1)
-+#if GCC_VERSION < 40100
- # error atomic.h works only with GCC newer than version 4.1
- #endif /* GNUC >= 4.1 */
- 
diff --git a/meta/recipes-devtools/mtd/files/0001-ubifs-utils-ubifs.h-Include-fcntl.h.patch b/meta/recipes-devtools/mtd/files/0001-ubifs-utils-ubifs.h-Include-fcntl.h.patch
deleted file mode 100644
index b603ac8fd6..0000000000
--- a/meta/recipes-devtools/mtd/files/0001-ubifs-utils-ubifs.h-Include-fcntl.h.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 2fc872697f72214e1e3efc6c2523e374fa5d681d Mon Sep 17 00:00:00 2001
-From: Fabio Estevam <festevam@gmail.com>
-Date: Mon, 17 Feb 2025 16:02:04 -0300
-Subject: [PATCH v4 mtd-utils 1/4] ubifs-utils: ubifs.h: Include <fcntl.h>
-
-Include the <fcntl.h> header file to fix the following error
-when building with musl:
-
-| In file included from ../git/ubifs-utils/common/compr.c:42:
-| ../git/ubifs-utils/libubifs/ubifs.h:313:9: error: unknown type name 'loff_t'; did you mean 'off_t'?
-|   313 |         loff_t ui_size;
-|       |         ^~~~~~
-|       |         off_t
-| ../git/ubifs-utils/libubifs/ubifs.h:1341:9: error: unknown type name 'loff_t'; did you mean 'off_t'?
-|  1341 |         loff_t i_size;
-|       |         ^~~~~~
-|       |         off_t
-| ../git/ubifs-utils/libubifs/ubifs.h:1342:9: error: unknown type name 'loff_t'; did you mean 'off_t'?
-|  1342 |         loff_t d_size;
-|       |         ^~~~~~
-|       |         off_t
-| ../git/ubifs-utils/libubifs/ubifs.h:1899:44: error: unknown type name 'loff_t'; did you mean 'off_t'?
-|  1899 |                              int deletion, loff_t new_size);
-|       |                                            ^~~~~~
-|       |                                            off_t
-| make: *** [Makefile:4878: ubifs-utils/common/mkfs_ubifs-compr.o] Error 1
-
-Upstream-Status: Backport [https://github.com/sigma-star/mtd-utils/commit/12bc9ad824bd8f18a5ec9c7154ad2374cf8c7ae3]
-Signed-off-by: Fabio Estevam <festevam@gmail.com>
-Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
-Reviewed-by: Khem Raj <raj.khem@gmail.com>
----
-Changes since v3:
-- Removed Upstream-Status tag.
-
- ubifs-utils/libubifs/ubifs.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/ubifs-utils/libubifs/ubifs.h b/ubifs-utils/libubifs/ubifs.h
-index 0908a2289208..1c7bc7bd0c80 100644
---- a/ubifs-utils/libubifs/ubifs.h
-+++ b/ubifs-utils/libubifs/ubifs.h
-@@ -11,6 +11,7 @@
- #ifndef __UBIFS_H__
- #define __UBIFS_H__
- 
-+#include <fcntl.h>
- #include <string.h>
- 
- #include "linux_types.h"
--- 
-2.34.1
-
diff --git a/meta/recipes-devtools/mtd/files/0002-ubifs-utils-journal-Include-sys-stat.h.patch b/meta/recipes-devtools/mtd/files/0002-ubifs-utils-journal-Include-sys-stat.h.patch
deleted file mode 100644
index d92a3fb4b6..0000000000
--- a/meta/recipes-devtools/mtd/files/0002-ubifs-utils-journal-Include-sys-stat.h.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 65077d8d664821e323d011956049c1c1b97d9560 Mon Sep 17 00:00:00 2001
-From: Fabio Estevam <festevam@gmail.com>
-Date: Mon, 17 Feb 2025 16:07:49 -0300
-Subject: [PATCH v4 mtd-utils 2/4] ubifs-utils: journal: Include <sys/stat.h>
-
-Include the <sys/stat.h> header file to fix the following error
-when building with musl:
-
-| ../git/ubifs-utils/libubifs/journal.c: In function 'ubifs_get_dent_type':
-| ../git/ubifs-utils/libubifs/journal.c:414:24: error: 'S_IFMT' undeclared (first use in this function)
-|   414 |         switch (mode & S_IFMT) {
-|       |                        ^~~~~~
-| ../git/ubifs-utils/libubifs/journal.c:414:24: note: each undeclared identifier is reported only once for each function it appears in
-| ../git/ubifs-utils/libubifs/journal.c:415:14: error: 'S_IFREG' undeclared (first use in this function)
-|   415 |         case S_IFREG:
-
-Upstream-Status: Backport [https://github.com/sigma-star/mtd-utils/commit/173f9714c8da1d685bfa951d43b9310d16bbab3c]
-Signed-off-by: Fabio Estevam <festevam@gmail.com>
-Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
----
-Changes since v3:
-- Removed Upstream-Status tag.
-
- ubifs-utils/libubifs/journal.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/ubifs-utils/libubifs/journal.c b/ubifs-utils/libubifs/journal.c
-index e78ea14f3e69..45d82fd54bdb 100644
---- a/ubifs-utils/libubifs/journal.c
-+++ b/ubifs-utils/libubifs/journal.c
-@@ -46,6 +46,7 @@
-  * all the nodes.
-  */
- 
-+#include <sys/stat.h>
- #include "bitops.h"
- #include "kmem.h"
- #include "ubifs.h"
--- 
-2.34.1
-
diff --git a/meta/recipes-devtools/mtd/files/0003-ubifs-utils-link-libmissing.a-in-case-execinfo.h-isn.patch b/meta/recipes-devtools/mtd/files/0003-ubifs-utils-link-libmissing.a-in-case-execinfo.h-isn.patch
deleted file mode 100644
index efaedad70b..0000000000
--- a/meta/recipes-devtools/mtd/files/0003-ubifs-utils-link-libmissing.a-in-case-execinfo.h-isn.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From 52db447c94974cd946de8d9d7031b91d41ad1280 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Wed, 26 Feb 2025 18:24:00 +0000
-Subject: [PATCH 3/4] ubifs-utils: link libmissing.a in case execinfo.h isn't
- present
-
-On musl execinfo.h doesn't exist, but ubifs-utils uses backtrace() when
-reporting errors.  This results in build failures under musl.
-
-Handily, libmissing.a already exists with a stub implementation of
-backtrace().
-
-Guard the execinfo.h include and if it isn't available instead include
-libmissing.h, and link to libmissing.a to provide backtrace() if needed.
-
-Upstream-Status: Backport [https://github.com/sigma-star/mtd-utils/commit/8a83b306db64d6f60186d4396b0b770163b85b6e]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
-Signed-off-by: Fabio Estevam <festevam@gmail.com>
----
- ubifs-utils/Makemodule.am | 4 ++--
- ubifs-utils/common/defs.h | 5 ++++-
- 2 files changed, 6 insertions(+), 3 deletions(-)
-
-diff --git a/ubifs-utils/Makemodule.am b/ubifs-utils/Makemodule.am
-index 21ba0597d84a..f84569a6da44 100644
---- a/ubifs-utils/Makemodule.am
-+++ b/ubifs-utils/Makemodule.am
-@@ -72,7 +72,7 @@ mkfs_ubifs_SOURCES = \
- 	ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
- 
- mkfs_ubifs_LDADD = libmtd.a libubi.a $(ZLIB_LIBS) $(LZO_LIBS) $(ZSTD_LIBS) $(UUID_LIBS) $(LIBSELINUX_LIBS) $(OPENSSL_LIBS) \
--		   $(DUMP_STACK_LD) $(ASAN_LIBS) -lm -lpthread
-+		   $(DUMP_STACK_LD) $(ASAN_LIBS) -lm -lpthread libmissing.a
- mkfs_ubifs_CPPFLAGS = $(AM_CPPFLAGS) $(ZLIB_CFLAGS) $(LZO_CFLAGS) $(ZSTD_CFLAGS) $(UUID_CFLAGS) $(LIBSELINUX_CFLAGS) \
- 	-I$(top_srcdir)/ubi-utils/include -I$(top_srcdir)/ubifs-utils/common -I $(top_srcdir)/ubifs-utils/libubifs
- 
-@@ -90,7 +90,7 @@ fsck_ubifs_SOURCES = \
- 	ubifs-utils/fsck.ubifs/handle_disconnected.c
- 
- fsck_ubifs_LDADD = libmtd.a libubi.a $(ZLIB_LIBS) $(LZO_LIBS) $(ZSTD_LIBS) $(UUID_LIBS) $(LIBSELINUX_LIBS) $(OPENSSL_LIBS) \
--		   $(DUMP_STACK_LD) $(ASAN_LIBS) -lm -lpthread
-+		   $(DUMP_STACK_LD) $(ASAN_LIBS) -lm -lpthread libmissing.a
- fsck_ubifs_CPPFLAGS = $(AM_CPPFLAGS) $(ZLIB_CFLAGS) $(LZO_CFLAGS) $(ZSTD_CFLAGS) $(UUID_CFLAGS) $(LIBSELINUX_CFLAGS) \
- 	-I$(top_srcdir)/ubi-utils/include -I$(top_srcdir)/ubifs-utils/common -I $(top_srcdir)/ubifs-utils/libubifs \
- 	-I$(top_srcdir)/ubifs-utils/fsck.ubifs
-diff --git a/ubifs-utils/common/defs.h b/ubifs-utils/common/defs.h
-index 7ff1771674d9..d5edbf67439a 100644
---- a/ubifs-utils/common/defs.h
-+++ b/ubifs-utils/common/defs.h
-@@ -13,8 +13,11 @@
- #include <errno.h>
- #include <time.h>
- #include <assert.h>
-+#if HAVE_EXECINFO_H
- #include <execinfo.h>
--
-+#else
-+#include "libmissing.h"
-+#endif
- #include "ubifs.h"
- 
- /* common.h requires the PROGRAM_NAME macro */
--- 
-2.34.1
-
diff --git a/meta/recipes-devtools/mtd/files/0004-ubifs-utils-extract_files-Include-linux-limits.h.patch b/meta/recipes-devtools/mtd/files/0004-ubifs-utils-extract_files-Include-linux-limits.h.patch
deleted file mode 100644
index 3444f330dc..0000000000
--- a/meta/recipes-devtools/mtd/files/0004-ubifs-utils-extract_files-Include-linux-limits.h.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From f218be1ce0c8923d690221160a3dd9f1492acaf1 Mon Sep 17 00:00:00 2001
-From: Fabio Estevam <festevam@gmail.com>
-Date: Tue, 18 Feb 2025 08:17:30 -0300
-Subject: [PATCH v4 mtd-utils 4/4] ubifs-utils: extract_files: Include <linux/limits.h>
-
-Include <linux/limits.h> to fix the following build error when building
-with musl:
-
-| ../git/ubifs-utils/fsck.ubifs/extract_files.c: In function 'parse_ino_node':
-| ../git/ubifs-utils/fsck.ubifs/extract_files.c:144:47: error: 'XATTR_LIST_MAX' undeclared (first use in this function)
-|   144 |         if (ino_node->xnms + ino_node->xcnt > XATTR_LIST_MAX) {
-|       |                                               ^~~~~~~~~~~~~~
-| ../git/ubifs-utils/fsck.ubifs/extract_files.c:144:47: note: each undeclared identifier is reported only once for each function it appears in
-| make: *** [Makefile:4374: ubifs-utils/fsck.ubifs/fsck_ubifs-extract_files.o] Error 1
-
-Upstream-Status: Backport [https://github.com/sigma-star/mtd-utils/commit/77981a2888c711268b0e7f32af6af159c2288e23]
-Signed-off-by: Fabio Estevam <festevam@gmail.com>
-Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
----
-Changes since v3:
-- None.
-
- ubifs-utils/fsck.ubifs/extract_files.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/ubifs-utils/fsck.ubifs/extract_files.c b/ubifs-utils/fsck.ubifs/extract_files.c
-index c83d37749bc0..000ef5d10565 100644
---- a/ubifs-utils/fsck.ubifs/extract_files.c
-+++ b/ubifs-utils/fsck.ubifs/extract_files.c
-@@ -10,6 +10,8 @@
- #include <getopt.h>
- #include <sys/stat.h>
- 
-+#include <linux/limits.h>
-+
- #include "linux_err.h"
- #include "bitops.h"
- #include "kmem.h"
--- 
-2.34.1
-
diff --git a/meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb b/meta/recipes-devtools/mtd/mtd-utils_2.3.1.bb
similarity index 91%
rename from meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb
rename to meta/recipes-devtools/mtd/mtd-utils_2.3.1.bb
index 545f0d68d5..e831ebb1d7 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_2.3.1.bb
@@ -11,13 +11,8 @@ inherit autotools pkgconfig systemd update-alternatives
 DEPENDS = "zlib e2fsprogs util-linux"
 RDEPENDS:mtd-utils-tests += "bash"
 
-SRCREV = "4594fc1f4496a0ed55cabd31fbeba4e3fbf05602"
+SRCREV = "053ee1038e5dedae61a88cadfb7bdfe9894d8bb6"
 SRC_URI = "git://git.infradead.org/mtd-utils.git;branch=master \
-           file://0001-ubifs-utils-ubifs.h-Include-fcntl.h.patch \
-           file://0002-ubifs-utils-journal-Include-sys-stat.h.patch \
-           file://0003-ubifs-utils-link-libmissing.a-in-case-execinfo.h-isn.patch \
-           file://0004-ubifs-utils-extract_files-Include-linux-limits.h.patch \
-           file://0001-Improve-check-for-GCC-compiler-version.patch \
            file://ubihealthd.service"
 
 # xattr support creates an additional compile-time dependency on acl because
-- 
2.43.0


