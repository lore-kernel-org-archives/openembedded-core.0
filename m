Return-Path: <badganchipv@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1A23C74A5B
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 06:03:49 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.18478.1680156228278085121
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Mar 2023 23:03:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QfcU/eOb;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: badganchipv@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id f6-20020a17090ac28600b0023b9bf9eb63so18534338pjt.5
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 23:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680156227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+XPV8rxjKMQPoJT5bdqfUwa2C72IFt5RYio+c2BSsuY=;
        b=QfcU/eObz54CxL6iS7LfZLRdNm3Xslx8/twq9jByrV85HBI6eOslVVQ0nMIEjJxnuH
         Kefq25z/e98cIGjD7Tc7azlLH8NCFueDDkhImtMPv4DGNb9J3o6ChMXkv5RE3NyzZLYW
         mGNX/XJEmvBd5XnEKaKdLGg4hH7m4tifeyyEtxYQJtdoJi233BSCd17NU8NYmd9tz16S
         1FtYQ610UpefOpofkLBF3LTizSAnyMIg2GfE7mKHQbgxWFWCB0XtJTXrrtLlzEOdtvdZ
         JpaTVmyaX9uPpCPYpGbYAx+xhEg91uRZ/bbKBb7nSka+Mrmj1yGp/sAmpUjPZUsPEtap
         sGNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680156227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+XPV8rxjKMQPoJT5bdqfUwa2C72IFt5RYio+c2BSsuY=;
        b=keFHaET2w+kExm+TFB6M8eLlILiwu10oXIkhJ2f3ehUPTeTSYsyk0Y7/EkbKPO0htj
         a2Lsvp2fG9SlOdaNkgrl4U86goXohKHmD1UkFjOdjLCcUv/uR8nIkLGIPFUPZa3X7X55
         QI2jwgT6c/6D8Mb27GTH7iyaGeX4mjOu9SHMajEZhAmhfcaHkYjVLKAMsBIvk6moOdRM
         IyMznrzo0ZtAL+S2tcKslQIsGyfDCRnkGLbNEM/tnCthlm/eoEAJssi4SHTqYzyBl+//
         l18Yqv1m7PfbYRpEBlFap3wOkiCtygayN2LvnkJsPT2vtQ+eqYycs2knB4kbnDxLcZ6F
         dxEQ==
X-Gm-Message-State: AAQBX9euDpv2iVNDpNiXPkunMw8FoQYRRhmqK6bmP94H5C1LNmIn/cn6
	AFTJURblfb4RbvE3inRtZ28nMa/0YsQ/UA==
X-Google-Smtp-Source: AKy350abl92ohpNsVvucBnatFE7JvyoshjnggtOHnhNtKmtR3xkKEskhNmcR41veFnBwZwzNURQ9Eg==
X-Received: by 2002:a17:903:11ce:b0:19c:b11b:ffca with SMTP id q14-20020a17090311ce00b0019cb11bffcamr30045977plh.23.1680156227484;
        Wed, 29 Mar 2023 23:03:47 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c2d:7ffa:ed57:edb6:bb36:e481])
        by smtp.gmail.com with ESMTPSA id g8-20020a1709026b4800b001a1f5dc64e5sm2406011plt.177.2023.03.29.23.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 23:03:47 -0700 (PDT)
From: pawan <badganchipv@gmail.com>
To: openembedded-core@lists.openembedded.org,
	badganchipv@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	Khem Raj <raj.khem@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [meta][kirkstone][PATCH 1/2] rsync: Add missing prototypes to function declarations
Date: Thu, 30 Mar 2023 11:33:27 +0530
Message-Id: <20230330060328.8654-1-badganchipv@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 06:03:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179303

From: Khem Raj <raj.khem@gmail.com>

(From OE-Core rev: c53d465865d4a9c109322074c2653a3a8b665238)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 51d8e0e20e2965517a64e954d51a23be52e5f4f3)
Signed-off-by: pawan <badganchipv@gmail.com>
---
 ...-prototypes-to-function-declarations.patch | 182 ++++++++++++++++++
 meta/recipes-devtools/rsync/rsync_3.2.5.bb    |   1 +
 2 files changed, 183 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch

diff --git a/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch b/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
new file mode 100644
index 0000000000..629b786d62
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
@@ -0,0 +1,182 @@
+From 704a240443ca5d8024cc3b01ae6c1440fa41f54a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 16 Aug 2022 23:42:24 -0700
+Subject: [PATCH] Add missing prototypes to function declarations
+
+With Clang 15+ compiler -Wstrict-prototypes is triggering warnings which
+are turned into errors with -Werror, this fixes the problem by adding
+missing prototypes
+
+Fixes errors like
+| log.c:134:24: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
+| static void syslog_init()
+|                        ^
+|                         void
+
+Upstream-Status: Submitted [https://lists.samba.org/archive/rsync/2022-August/032858.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ checksum.c       | 2 +-
+ exclude.c        | 2 +-
+ hlink.c          | 2 +-
+ lib/compat.c     | 1 +
+ lib/pool_alloc.c | 2 +-
+ log.c            | 2 +-
+ main.c           | 2 +-
+ syscall.c        | 4 ++--
+ zlib/crc32.c     | 2 +-
+ zlib/trees.c     | 2 +-
+ zlib/zutil.c     | 4 ++--
+ 11 files changed, 13 insertions(+), 12 deletions(-)
+
+diff --git a/checksum.c b/checksum.c
+index fb8c0a0..174c28c 100644
+--- a/checksum.c
++++ b/checksum.c
+@@ -629,7 +629,7 @@ int sum_end(char *sum)
+ 	return csum_len_for_type(cursum_type, 0);
+ }
+ 
+-void init_checksum_choices()
++void init_checksum_choices(void)
+ {
+ #ifdef SUPPORT_XXH3
+ 	char buf[32816];
+diff --git a/exclude.c b/exclude.c
+index adc82e2..79f5a82 100644
+--- a/exclude.c
++++ b/exclude.c
+@@ -358,7 +358,7 @@ void implied_include_partial_string(const char *s_start, const char *s_end)
+ 	memcpy(partial_string_buf, s_start, partial_string_len);
+ }
+ 
+-void free_implied_include_partial_string()
++void free_implied_include_partial_string(void)
+ {
+ 	if (partial_string_buf) {
+ 		free(partial_string_buf);
+diff --git a/hlink.c b/hlink.c
+index 66810a3..aea142b 100644
+--- a/hlink.c
++++ b/hlink.c
+@@ -117,7 +117,7 @@ static void match_gnums(int32 *ndx_list, int ndx_count)
+ 	struct ht_int32_node *node = NULL;
+ 	int32 gnum, gnum_next;
+ 
+-	qsort(ndx_list, ndx_count, sizeof ndx_list[0], (int (*)()) hlink_compare_gnum);
++	qsort(ndx_list, ndx_count, sizeof ndx_list[0], (int (*)(const void *, const void *)) hlink_compare_gnum);
+ 
+ 	for (from = 0; from < ndx_count; from++) {
+ 		file = hlink_flist->sorted[ndx_list[from]];
+diff --git a/lib/compat.c b/lib/compat.c
+index 513d79b..89b337e 100644
+--- a/lib/compat.c
++++ b/lib/compat.c
+@@ -19,6 +19,7 @@
+  * with this program; if not, visit the http://fsf.org website.
+  */
+ 
++#include <sys/time.h>
+ #include "rsync.h"
+ #include "itypes.h"
+ 
+diff --git a/lib/pool_alloc.c b/lib/pool_alloc.c
+index a1a7245..4eae062 100644
+--- a/lib/pool_alloc.c
++++ b/lib/pool_alloc.c
+@@ -9,7 +9,7 @@ struct alloc_pool
+ 	size_t			size;		/* extent size		*/
+ 	size_t			quantum;	/* allocation quantum	*/
+ 	struct pool_extent	*extents;	/* top extent is "live" */
+-	void			(*bomb)();	/* called if malloc fails */
++	void			(*bomb)(const char *, const char *, int);	/* called if malloc fails */
+ 	int			flags;
+ 
+ 	/* statistical data */
+diff --git a/log.c b/log.c
+index 44344e2..991e359 100644
+--- a/log.c
++++ b/log.c
+@@ -131,7 +131,7 @@ static void logit(int priority, const char *buf)
+ 	}
+ }
+ 
+-static void syslog_init()
++static void syslog_init(void)
+ {
+ 	int options = LOG_PID;
+ 
+diff --git a/main.c b/main.c
+index 9ebfbea..affa244 100644
+--- a/main.c
++++ b/main.c
+@@ -244,7 +244,7 @@ void read_del_stats(int f)
+ 	stats.deleted_files += stats.deleted_specials = read_varint(f);
+ }
+ 
+-static void become_copy_as_user()
++static void become_copy_as_user(void)
+ {
+ 	char *gname;
+ 	uid_t uid;
+diff --git a/syscall.c b/syscall.c
+index d92074a..92ca86d 100644
+--- a/syscall.c
++++ b/syscall.c
+@@ -389,9 +389,9 @@ OFF_T do_lseek(int fd, OFF_T offset, int whence)
+ {
+ #ifdef HAVE_LSEEK64
+ #if !SIZEOF_OFF64_T
+-	OFF_T lseek64();
++	OFF_T lseek64(int fd, OFF_T offset, int whence);
+ #else
+-	off64_t lseek64();
++	off64_t lseek64(int fd, off64_t offset, int whence);
+ #endif
+ 	return lseek64(fd, offset, whence);
+ #else
+diff --git a/zlib/crc32.c b/zlib/crc32.c
+index 05733f4..50c6c02 100644
+--- a/zlib/crc32.c
++++ b/zlib/crc32.c
+@@ -187,7 +187,7 @@ local void write_table(out, table)
+ /* =========================================================================
+  * This function can be used by asm versions of crc32()
+  */
+-const z_crc_t FAR * ZEXPORT get_crc_table()
++const z_crc_t FAR * ZEXPORT get_crc_table(void)
+ {
+ #ifdef DYNAMIC_CRC_TABLE
+     if (crc_table_empty)
+diff --git a/zlib/trees.c b/zlib/trees.c
+index 9c66770..0d9047e 100644
+--- a/zlib/trees.c
++++ b/zlib/trees.c
+@@ -231,7 +231,7 @@ local void send_bits(s, value, length)
+ /* ===========================================================================
+  * Initialize the various 'constant' tables.
+  */
+-local void tr_static_init()
++local void tr_static_init(void)
+ {
+ #if defined(GEN_TREES_H) || !defined(STDC)
+     static int static_init_done = 0;
+diff --git a/zlib/zutil.c b/zlib/zutil.c
+index bbba7b2..61f8dc9 100644
+--- a/zlib/zutil.c
++++ b/zlib/zutil.c
+@@ -27,12 +27,12 @@ z_const char * const z_errmsg[10] = {
+ ""};
+ 
+ 
+-const char * ZEXPORT zlibVersion()
++const char * ZEXPORT zlibVersion(void)
+ {
+     return ZLIB_VERSION;
+ }
+ 
+-uLong ZEXPORT zlibCompileFlags()
++uLong ZEXPORT zlibCompileFlags(void)
+ {
+     uLong flags;
+ 
diff --git a/meta/recipes-devtools/rsync/rsync_3.2.5.bb b/meta/recipes-devtools/rsync/rsync_3.2.5.bb
index e43f35ea2f..6a7e6e559f 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.5.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.2.5.bb
@@ -14,6 +14,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://rsyncd.conf \
            file://makefile-no-rebuild.patch \
            file://determism.patch \
+           file://0001-Add-missing-prototypes-to-function-declarations.patch \
            "
 
 SRC_URI[sha256sum] = "2ac4d21635cdf791867bc377c35ca6dda7f50d919a58be45057fd51600c69aba"
-- 
2.38.1


