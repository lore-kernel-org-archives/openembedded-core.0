Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ED74C32772
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 07:05:03 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web12.25909.1660719895894409743
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 00:04:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ehFd7Utb;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id
 ch17-20020a17090af41100b001fa74771f61so2995101pjb.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 00:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=lu9sXCO19s01VrWDYPgoQ4rUF+/ujTUYUfXNgyiUa6Y=;
        b=ehFd7UtbUFW6cq6mjHg/TDExYIb5HysmI0S0wcGXRHTtTd9Eiz7Mtaro3QpKuOSv+D
         9Q+6Aj0Uld1thKfKWB8/JQ9E6XDBLNWEdynloxqxyyaHyHhyI6prmJgAPNj2SlzA5PA6
         pXKvTuy3UZIY8S+Sm21YmAFzjAFDb2KoXf2UQ87jybx8TzgG2DIjghVf79QFNk+0lc+n
         VEoLs2CV94KsBZVdNoVXxU/9sMJX64924tVAKsAJwT1I77KcY5LKCJnx+Akb+HF9o1js
         /VflzfekfFcInXVoL8MroJM4oUhyj5jUWz98RnOXxgm3wowETgfQQdNAwjeJCh8D+tY5
         c85w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=lu9sXCO19s01VrWDYPgoQ4rUF+/ujTUYUfXNgyiUa6Y=;
        b=3crjykITIcOhQjmoKVAAWlM56nr0jq8OIoEtChq+TwNPqniUwY2wUHz3rxCRfkdHr6
         vOza0HxzhTH7BZNjBFPshRNgqLnw7+hZ5lGiDh0nCBlysEC3k0KAt6t4HOE+kViY31Ig
         SSoIexiJaWuuqHoBOfhMCcgluS15ZJWXHNjkmVMZJR2mDqNZvAI7YtKoApRFLZW+3ShO
         wA/YzR1OThcuSWutk+mZAg5pu3GlovLYqT2chBVnegzenKj9G1Lcqi7bp6qf0Cx3CfEQ
         uHDTlxhy+joj0m9XWwRNiq17ChUx3J+Vu1Het3j1IBBusZZKR+P7NzxChU50N9hbHY/S
         +TRQ==
X-Gm-Message-State: ACgBeo0Veyie5u8lXTwjewxeu0c2tCNbOhJKkr9ePc9KWqDEwfBZCLuz
	ADUdRoCufI5gxyDQnTdfuqQHdEuL6r6rlA==
X-Google-Smtp-Source: 
 AA6agR5zLb1NCiMzQxL0u7KfTTDvkLtobVIRHWLN3fTEN1A9uaNJLKPFzkggKQNSS84M1T9Fj9IOyA==
X-Received: by 2002:a17:90a:be01:b0:1fa:9fe7:d5a6 with SMTP id
 a1-20020a17090abe0100b001fa9fe7d5a6mr2340102pjs.139.1660719894813;
        Wed, 17 Aug 2022 00:04:54 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 196-20020a6218cd000000b0052b94e757ecsm9638546pfy.213.2022.08.17.00.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 00:04:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 7/7] rsync: Add missing prototypes to function declarations
Date: Wed, 17 Aug 2022 00:04:40 -0700
Message-Id: <20220817070440.537761-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220817070440.537761-1-raj.khem@gmail.com>
References: <20220817070440.537761-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Aug 2022 07:05:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169473

Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
index a1ba5ea44d..2c2dbc4600 100644
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
2.37.2


