Return-Path: <lianux.mm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E2D2C4450A
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 07:20:14 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7287.1784186412583155945
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 00:20:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RAz8o8HF;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: lianux.mm@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-848743155bcso1254456b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 00:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784186412; x=1784791212; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P6c0DC04p9i1ZBMlX2fceIFD9WX0f+pw/T2qGoemtEA=;
        b=RAz8o8HFbEdYmF0WbLKPXgWUiPgZIVoHnRj+HalAdOp6e6Qp+iQ9SgPoI/jsINksg9
         UXoymAC7pZl85e3BadB3RkRCcJy0D/YDpu/EgXPyjv8Y43msHs0B7NbAj6QH3MMNUptP
         6Ia8V61Z/g8w2A0XTmeNTK6GVNxjlK2ucCgDH0jx5QeSqmuzWO6i4naN7BaAGAlJCa4C
         x8ak5mmG+WVDoeYZKL+/xeNYNfFI+OoZgoXH2eLFdDsIi8omOKC412DuRIydjcz9PQgi
         vO0Lrn/ElQSJcg6dVzoSxvBFIS7nXz13n+1koCkWEwGL/JbgO7IxxkHFiNGtVsBv1KLD
         FDDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784186412; x=1784791212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P6c0DC04p9i1ZBMlX2fceIFD9WX0f+pw/T2qGoemtEA=;
        b=CeXKF5LYva+zV9Q23q2BdDfQRu2aq/C2pS3jgmdlYI9GeOsDVQX39jx54qS36/ANJN
         MKs0ZM2RRVootDIQRkfHZb/qg/aiROdBgyTQFmnn/wxQ2ufCinRm3AaX8yWZPeclXq7F
         utgnCa8dBR+6+IfF9GNZPBaO7oJGv4xmVLWiswQXCHRQraIyllrxivBDlSCkiJlirF6y
         RVhHV8cEE8FsE6qCOqTzkGIOoZv8uIaw88RIrXamcTUF/gdqUsTdlBMCCiHw33fdis69
         wuxa5XwWd5+i+cuPMLD/unBKFeeNpnKml4y0s/2FZ7Mz5qH9n7dprkHZiJTt3hVKWptD
         QVxg==
X-Gm-Message-State: AOJu0YzKWE/EiYWxlBr8nMWpsAWFsY5hoN48Qg/gwHVP3GpKyIliabun
	GBuvWWFBM8jMyNLb8CVTfLF2oBd5+2dgipzabYOWp2d4cvWwmpjNBCYX1PYdXPXNEB4QuQ==
X-Gm-Gg: AfdE7cldW3tzPKWc1GRAfv20ETdCYAbwzDYfQd4vbyMMTRSPkTCrTLmg5+8RQA+nWwJ
	B0saTKcivVHRAbNfN5mZrF8EQQBrtlkSDgkJLUcUiHKwgeq3EgBFcmZNJyPYy39ru1VDu7DnlJq
	3GVc3SabInj/eBgNr2lWcqNhiJ+pAyyTxs6SutgPgiuwv4+KwaOR2boQVO343yKFtLzzkyGuh19
	XmiO2GxuafR/6v8N5+Q7sBuv6MK/8VoiAyrqHTpbw7Isi9sO9bJISjAwhVpOk1g1cCRRg+AuZVk
	SxCEmeA9D7hmFRD808e29cV28EnWuCdTjQslEiGmAD7R+J5W7t6vEAFdh33lecrfWkyyeW5EG1g
	N2KKRaw+unCKNGDtYpe2sE6X5xhd5mYzHCaEeAlvihksNdQMgGCDCVTv4EcbIjr2bUZs0osklAE
	pg89YjFxn1/g==
X-Received: by 2002:a05:6a21:32a2:b0:3bf:6237:4d4a with SMTP id adf61e73a8af0-3c1108c0ad0mr23893458637.24.1784186411223;
        Thu, 16 Jul 2026 00:20:11 -0700 (PDT)
Received: from localhost.localdomain ([2605:a141:2231:7698::1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb258fcfbafsm1416752a12.21.2026.07.16.00.20.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 16 Jul 2026 00:20:10 -0700 (PDT)
From: Lian Wang <lianux.mm@gmail.com>
X-Google-Original-From: Lian Wang <lianux.wang@processmission.com>
To: openembedded-core@lists.openembedded.org
Cc: Lian Wang <lianux.wang@processmission.com>
Subject: [PATCH] rsync: upgrade 3.2.7 -> 3.4.4
Date: Thu, 16 Jul 2026 15:19:42 +0800
Message-ID: <20260716071942.16681-1-lianux.wang@processmission.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 07:20:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241065

- Drop 14 CVE patches fixed upstream in 3.4.x series
- Refresh prototypes patch for 3.4.4
- All CVE-2024-12084 through CVE-2024-12088, CVE-2024-12747,
  CVE-2025-10158, CVE-2026-41035 resolved in this release

Signed-off-by: Lian Wang <lianux.wang@processmission.com>
---
 ...-prototypes-to-function-declarations.patch | 171 ----------------
 .../files/0001-Add-missing-prototypes.patch   |  81 ++++++++
 .../rsync/files/CVE-2024-12084-0001.patch     | 156 --------------
 .../rsync/files/CVE-2024-12084-0002.patch     |  43 ----
 .../rsync/files/CVE-2024-12085.patch          |  32 ---
 .../rsync/files/CVE-2024-12086-0001.patch     |  42 ----
 .../rsync/files/CVE-2024-12086-0002.patch     | 108 ----------
 .../rsync/files/CVE-2024-12086-0003.patch     | 108 ----------
 .../rsync/files/CVE-2024-12086-0004.patch     |  41 ----
 .../rsync/files/CVE-2024-12087-0001.patch     |  49 -----
 .../rsync/files/CVE-2024-12087-0002.patch     |  31 ---
 .../rsync/files/CVE-2024-12087-0003.patch     |  40 ----
 .../rsync/files/CVE-2024-12088.patch          | 141 -------------
 .../rsync/files/CVE-2024-12747.patch          | 192 ------------------
 .../rsync/files/CVE-2025-10158.patch          |  36 ----
 .../rsync/files/CVE-2026-41035.patch          |  39 ----
 .../rsync/{rsync_3.2.7.bb => rsync_3.4.4.bb}  |  18 +-
 17 files changed, 83 insertions(+), 1245 deletions(-)
 delete mode 100644 meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
 create mode 100644 meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes.patch
 delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12084-0001.patch
 delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12084-0002.patch
 delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12085.patch
 delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12086-0001.patch
 delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12086-0002.patch
 delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12086-0003.patch
 delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12086-0004.patch
 delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12087-0001.patch
 delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12087-0002.patch
 delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12087-0003.patch
 delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12088.patch
 delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12747.patch
 delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2025-10158.patch
 delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-41035.patch
 rename meta/recipes-devtools/rsync/{rsync_3.2.7.bb => rsync_3.4.4.bb} (77%)

diff --git a/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch b/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
deleted file mode 100644
index 8895ada..0000000
--- a/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
+++ /dev/null
@@ -1,171 +0,0 @@
-From 651425fced0691d9063fe417388ba6ca1c38c40b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 29 Aug 2022 19:53:28 -0700
-Subject: [PATCH] Add missing prototypes to function declarations
-
-With Clang 15+ compiler -Wstrict-prototypes is triggering warnings which
-are turned into errors with -Werror, this fixes the problem by adding
-missing prototypes
-
-Fixes errors like
-| log.c:134:24: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
-| static void syslog_init()
-|                        ^
-|                         void
-
-Upstream-Status: Submitted [https://lists.samba.org/archive/rsync/2022-August/032858.html]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- checksum.c       | 2 +-
- exclude.c        | 2 +-
- hlink.c          | 3 +--
- lib/pool_alloc.c | 2 +-
- log.c            | 2 +-
- main.c           | 2 +-
- syscall.c        | 4 ++--
- zlib/crc32.c     | 2 +-
- zlib/trees.c     | 2 +-
- zlib/zutil.c     | 4 ++--
- 10 files changed, 12 insertions(+), 13 deletions(-)
-
-diff --git a/checksum.c b/checksum.c
-index 60de365..67a9e16 100644
---- a/checksum.c
-+++ b/checksum.c
-@@ -778,7 +778,7 @@ static void verify_digest(struct name_num_item *nni, BOOL check_auth_list)
- }
- #endif
- 
--void init_checksum_choices()
-+void init_checksum_choices(void)
- {
- #if defined SUPPORT_XXH3 || defined USE_OPENSSL
- 	struct name_num_item *nni;
-diff --git a/exclude.c b/exclude.c
-index ffe55b1..a85ea76 100644
---- a/exclude.c
-+++ b/exclude.c
-@@ -363,7 +363,7 @@ void implied_include_partial_string(const char *s_start, const char *s_end)
- 	memcpy(partial_string_buf, s_start, partial_string_len);
- }
- 
--void free_implied_include_partial_string()
-+void free_implied_include_partial_string(void)
- {
- 	if (partial_string_buf) {
- 		if (partial_string_len)
-diff --git a/hlink.c b/hlink.c
-index 20291f2..5c26a6b 100644
---- a/hlink.c
-+++ b/hlink.c
-@@ -117,8 +117,7 @@ static void match_gnums(int32 *ndx_list, int ndx_count)
- 	struct ht_int32_node *node = NULL;
- 	int32 gnum, gnum_next;
- 
--	qsort(ndx_list, ndx_count, sizeof ndx_list[0], (int (*)()) hlink_compare_gnum);
--
-+	qsort(ndx_list, ndx_count, sizeof ndx_list[0], (int (*)(const void *, const void *)) hlink_compare_gnum);
- 	for (from = 0; from < ndx_count; from++) {
- 		file = hlink_flist->sorted[ndx_list[from]];
- 		gnum = F_HL_GNUM(file);
-diff --git a/lib/pool_alloc.c b/lib/pool_alloc.c
-index a1a7245..4eae062 100644
---- a/lib/pool_alloc.c
-+++ b/lib/pool_alloc.c
-@@ -9,7 +9,7 @@ struct alloc_pool
- 	size_t			size;		/* extent size		*/
- 	size_t			quantum;	/* allocation quantum	*/
- 	struct pool_extent	*extents;	/* top extent is "live" */
--	void			(*bomb)();	/* called if malloc fails */
-+	void			(*bomb)(const char *, const char *, int);	/* called if malloc fails */
- 	int			flags;
- 
- 	/* statistical data */
-diff --git a/log.c b/log.c
-index e4ba1cc..8482b71 100644
---- a/log.c
-+++ b/log.c
-@@ -131,7 +131,7 @@ static void logit(int priority, const char *buf)
- 	}
- }
- 
--static void syslog_init()
-+static void syslog_init(void)
- {
- 	int options = LOG_PID;
- 
-diff --git a/main.c b/main.c
-index d2a7b9b..c50af45 100644
---- a/main.c
-+++ b/main.c
-@@ -244,7 +244,7 @@ void read_del_stats(int f)
- 	stats.deleted_files += stats.deleted_specials = read_varint(f);
- }
- 
--static void become_copy_as_user()
-+static void become_copy_as_user(void)
- {
- 	char *gname;
- 	uid_t uid;
-diff --git a/syscall.c b/syscall.c
-index d92074a..92ca86d 100644
---- a/syscall.c
-+++ b/syscall.c
-@@ -389,9 +389,9 @@ OFF_T do_lseek(int fd, OFF_T offset, int whence)
- {
- #ifdef HAVE_LSEEK64
- #if !SIZEOF_OFF64_T
--	OFF_T lseek64();
-+	OFF_T lseek64(int fd, OFF_T offset, int whence);
- #else
--	off64_t lseek64();
-+	off64_t lseek64(int fd, off64_t offset, int whence);
- #endif
- 	return lseek64(fd, offset, whence);
- #else
-diff --git a/zlib/crc32.c b/zlib/crc32.c
-index 05733f4..50c6c02 100644
---- a/zlib/crc32.c
-+++ b/zlib/crc32.c
-@@ -187,7 +187,7 @@ local void write_table(out, table)
- /* =========================================================================
-  * This function can be used by asm versions of crc32()
-  */
--const z_crc_t FAR * ZEXPORT get_crc_table()
-+const z_crc_t FAR * ZEXPORT get_crc_table(void)
- {
- #ifdef DYNAMIC_CRC_TABLE
-     if (crc_table_empty)
-diff --git a/zlib/trees.c b/zlib/trees.c
-index 9c66770..0d9047e 100644
---- a/zlib/trees.c
-+++ b/zlib/trees.c
-@@ -231,7 +231,7 @@ local void send_bits(s, value, length)
- /* ===========================================================================
-  * Initialize the various 'constant' tables.
-  */
--local void tr_static_init()
-+local void tr_static_init(void)
- {
- #if defined(GEN_TREES_H) || !defined(STDC)
-     static int static_init_done = 0;
-diff --git a/zlib/zutil.c b/zlib/zutil.c
-index bbba7b2..61f8dc9 100644
---- a/zlib/zutil.c
-+++ b/zlib/zutil.c
-@@ -27,12 +27,12 @@ z_const char * const z_errmsg[10] = {
- ""};
- 
- 
--const char * ZEXPORT zlibVersion()
-+const char * ZEXPORT zlibVersion(void)
- {
-     return ZLIB_VERSION;
- }
- 
--uLong ZEXPORT zlibCompileFlags()
-+uLong ZEXPORT zlibCompileFlags(void)
- {
-     uLong flags;
- 
diff --git a/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes.patch b/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes.patch
new file mode 100644
index 0000000..58fc1f6
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes.patch
@@ -0,0 +1,81 @@
+diff --color -ruN rsync-3.4.4-orig/checksum.c rsync-3.4.4/checksum.c
+--- rsync-3.4.4-orig/checksum.c	2026-07-16 14:25:22
++++ rsync-3.4.4/checksum.c	2026-07-16 14:25:22
+@@ -778,7 +778,7 @@
+ }
+ #endif
+ 
+-void init_checksum_choices()
++void init_checksum_choices(void)
+ {
+ #if defined SUPPORT_XXH3 || defined USE_OPENSSL
+ 	struct name_num_item *nni;
+diff --color -ruN rsync-3.4.4-orig/compat.c rsync-3.4.4/compat.c
+--- rsync-3.4.4-orig/compat.c	2026-07-16 14:25:22
++++ rsync-3.4.4/compat.c	2026-07-16 14:25:22
+@@ -882,7 +882,7 @@
+ 	}
+ }
+ 
+-int get_subprotocol_version()
++int get_subprotocol_version(void)
+ {
+ #if SUBPROTOCOL_VERSION != 0
+ 	return protocol_version < PROTOCOL_VERSION ? 0 : SUBPROTOCOL_VERSION;
+diff --color -ruN rsync-3.4.4-orig/exclude.c rsync-3.4.4/exclude.c
+--- rsync-3.4.4-orig/exclude.c	2026-07-16 14:25:22
++++ rsync-3.4.4/exclude.c	2026-07-16 14:25:22
+@@ -363,7 +363,7 @@
+ 	memcpy(partial_string_buf, s_start, partial_string_len);
+ }
+ 
+-void free_implied_include_partial_string()
++void free_implied_include_partial_string(void)
+ {
+ 	if (partial_string_buf) {
+ 		if (partial_string_len)
+diff --color -ruN rsync-3.4.4-orig/log.c rsync-3.4.4/log.c
+--- rsync-3.4.4-orig/log.c	2026-07-16 14:25:22
++++ rsync-3.4.4/log.c	2026-07-16 14:25:22
+@@ -131,7 +131,7 @@
+ 	}
+ }
+ 
+-static void syslog_init()
++static void syslog_init(void)
+ {
+ 	int options = LOG_PID;
+ 
+diff --color -ruN rsync-3.4.4-orig/main.c rsync-3.4.4/main.c
+--- rsync-3.4.4-orig/main.c	2026-07-16 14:25:22
++++ rsync-3.4.4/main.c	2026-07-16 14:25:22
+@@ -246,7 +246,7 @@
+ 	stats.deleted_files += stats.deleted_specials = read_varint_bounded(f, 0, MAX_WIRE_DEL_STAT, "deleted_specials");
+ }
+ 
+-static void become_copy_as_user()
++static void become_copy_as_user(void)
+ {
+ 	char *gname;
+ 	uid_t uid;
+@@ -673,7 +673,7 @@
+ 
+ /* Older versions turn an empty string as a reference to the current directory.
+  * We now treat this as an error unless --old-args was used. */
+-static char *dot_dir_or_error()
++static char *dot_dir_or_error(void)
+ {
+ 	if (old_style_args || am_server)
+ 		return ".";
+diff --color -ruN rsync-3.4.4-orig/zlib/inflate.c rsync-3.4.4/zlib/inflate.c
+--- rsync-3.4.4-orig/zlib/inflate.c	2026-07-16 14:25:22
++++ rsync-3.4.4/zlib/inflate.c	2026-07-16 14:25:22
+@@ -307,7 +307,7 @@
+ 
+     a.out > inffixed.h
+  */
+-void makefixed()
++void makefixed(void)
+ {
+     unsigned low, size;
+     struct inflate_state state;
diff --git a/meta/recipes-devtools/rsync/files/CVE-2024-12084-0001.patch b/meta/recipes-devtools/rsync/files/CVE-2024-12084-0001.patch
deleted file mode 100644
index d654067..0000000
--- a/meta/recipes-devtools/rsync/files/CVE-2024-12084-0001.patch
+++ /dev/null
@@ -1,156 +0,0 @@
-From 0902b52f6687b1f7952422080d50b93108742e53 Mon Sep 17 00:00:00 2001
-From: Wayne Davison <wayne@opencoder.net>
-Date: Tue, 29 Oct 2024 22:55:29 -0700
-Subject: [PATCH] Some checksum buffer fixes.
-
-- Put sum2_array into sum_struct to hold an array of sum2 checksums
-  that are each xfer_sum_len bytes.
-- Remove sum2 buf from sum_buf.
-- Add macro sum2_at() to access each sum2 array element.
-- Throw an error if a sums header has an s2length larger than
-  xfer_sum_len.
-
-CVE: CVE-2024-12084
-
-Upstream-Status: Backport [https://git.samba.org/?p=rsync.git;a=commit;h=0902b52f6687b1f7952422080d50b93108742e53]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- io.c     | 3 ++-
- match.c  | 8 ++++----
- rsync.c  | 5 ++++-
- rsync.h  | 4 +++-
- sender.c | 4 +++-
- 5 files changed, 16 insertions(+), 8 deletions(-)
-
-diff --git a/io.c b/io.c
-index a99ac0ec..bb60eeca 100644
---- a/io.c
-+++ b/io.c
-@@ -55,6 +55,7 @@ extern int read_batch;
- extern int compat_flags;
- extern int protect_args;
- extern int checksum_seed;
-+extern int xfer_sum_len;
- extern int daemon_connection;
- extern int protocol_version;
- extern int remove_source_files;
-@@ -1977,7 +1978,7 @@ void read_sum_head(int f, struct sum_struct *sum)
-		exit_cleanup(RERR_PROTOCOL);
-	}
-	sum->s2length = protocol_version < 27 ? csum_length : (int)read_int(f);
--	if (sum->s2length < 0 || sum->s2length > MAX_DIGEST_LEN) {
-+	if (sum->s2length < 0 || sum->s2length > xfer_sum_len) {
-		rprintf(FERROR, "Invalid checksum length %d [%s]\n",
-			sum->s2length, who_am_i());
-		exit_cleanup(RERR_PROTOCOL);
-diff --git a/match.c b/match.c
-index cdb30a15..36e78ed2 100644
---- a/match.c
-+++ b/match.c
-@@ -232,7 +232,7 @@ static void hash_search(int f,struct sum_struct *s,
-				done_csum2 = 1;
-			}
-
--			if (memcmp(sum2,s->sums[i].sum2,s->s2length) != 0) {
-+			if (memcmp(sum2, sum2_at(s, i), s->s2length) != 0) {
-				false_alarms++;
-				continue;
-			}
-@@ -252,7 +252,7 @@ static void hash_search(int f,struct sum_struct *s,
-					if (i != aligned_i) {
-						if (sum != s->sums[aligned_i].sum1
-						 || l != s->sums[aligned_i].len
--						 || memcmp(sum2, s->sums[aligned_i].sum2, s->s2length) != 0)
-+						 || memcmp(sum2, sum2_at(s, aligned_i), s->s2length) != 0)
-							goto check_want_i;
-						i = aligned_i;
-					}
-@@ -271,7 +271,7 @@ static void hash_search(int f,struct sum_struct *s,
-						if (sum != s->sums[i].sum1)
-							goto check_want_i;
-						get_checksum2((char *)map, l, sum2);
--						if (memcmp(sum2, s->sums[i].sum2, s->s2length) != 0)
-+						if (memcmp(sum2, sum2_at(s, i), s->s2length) != 0)
-							goto check_want_i;
-						/* OK, we have a re-alignment match.  Bump the offset
-						 * forward to the new match point. */
-@@ -290,7 +290,7 @@ static void hash_search(int f,struct sum_struct *s,
-			 && (!updating_basis_file || s->sums[want_i].offset >= offset
-			  || s->sums[want_i].flags & SUMFLG_SAME_OFFSET)
-			 && sum == s->sums[want_i].sum1
--			 && memcmp(sum2, s->sums[want_i].sum2, s->s2length) == 0) {
-+			 && memcmp(sum2, sum2_at(s, want_i), s->s2length) == 0) {
-				/* we've found an adjacent match - the RLL coder
-				 * will be happy */
-				i = want_i;
-diff --git a/rsync.c b/rsync.c
-index cd288f57..b130aba5 100644
---- a/rsync.c
-+++ b/rsync.c
-@@ -437,7 +437,10 @@ int read_ndx_and_attrs(int f_in, int f_out, int *iflag_ptr, uchar *type_ptr, cha
-   */
- void free_sums(struct sum_struct *s)
- {
--	if (s->sums) free(s->sums);
-+	if (s->sums) {
-+		free(s->sums);
-+		free(s->sum2_array);
-+	}
-	free(s);
- }
-
-diff --git a/rsync.h b/rsync.h
-index d3709fe0..8ddbe702 100644
---- a/rsync.h
-+++ b/rsync.h
-@@ -958,12 +958,12 @@ struct sum_buf {
-	uint32 sum1;	        /**< simple checksum */
-	int32 chain;		/**< next hash-table collision */
-	short flags;		/**< flag bits */
--	char sum2[SUM_LENGTH];	/**< checksum  */
- };
-
- struct sum_struct {
-	OFF_T flength;		/**< total file length */
-	struct sum_buf *sums;	/**< points to info for each chunk */
-+	char *sum2_array;	/**< checksums of length xfer_sum_len */
-	int32 count;		/**< how many chunks */
-	int32 blength;		/**< block_length */
-	int32 remainder;	/**< flength % block_length */
-@@ -982,6 +982,8 @@ struct map_struct {
-	int status;		/* first errno from read errors		*/
- };
-
-+#define sum2_at(s, i)	((s)->sum2_array + ((OFF_T)(i) * xfer_sum_len))
-+
- #define NAME_IS_FILE		(0)    /* filter name as a file */
- #define NAME_IS_DIR		(1<<0) /* filter name as a dir */
- #define NAME_IS_XATTR		(1<<2) /* filter name as an xattr */
-diff --git a/sender.c b/sender.c
-index 3d4f052e..ab205341 100644
---- a/sender.c
-+++ b/sender.c
-@@ -31,6 +31,7 @@ extern int log_before_transfer;
- extern int stdout_format_has_i;
- extern int logfile_format_has_i;
- extern int want_xattr_optim;
-+extern int xfer_sum_len;
- extern int csum_length;
- extern int append_mode;
- extern int copy_links;
-@@ -94,10 +95,11 @@ static struct sum_struct *receive_sums(int f)
-		return(s);
-
-	s->sums = new_array(struct sum_buf, s->count);
-+	s->sum2_array = new_array(char, s->count * xfer_sum_len);
-
-	for (i = 0; i < s->count; i++) {
-		s->sums[i].sum1 = read_int(f);
--		read_buf(f, s->sums[i].sum2, s->s2length);
-+		read_buf(f, sum2_at(s, i), s->s2length);
-
-		s->sums[i].offset = offset;
-		s->sums[i].flags = 0;
---
-2.40.0
diff --git a/meta/recipes-devtools/rsync/files/CVE-2024-12084-0002.patch b/meta/recipes-devtools/rsync/files/CVE-2024-12084-0002.patch
deleted file mode 100644
index 266b80c..0000000
--- a/meta/recipes-devtools/rsync/files/CVE-2024-12084-0002.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 42e2b56c4ede3ab164f9a5c6dae02aa84606a6c1 Mon Sep 17 00:00:00 2001
-From: Wayne Davison <wayne@opencoder.net>
-Date: Tue, 5 Nov 2024 11:01:03 -0800
-Subject: [PATCH] Another cast when multiplying integers.
-
-CVE: CVE-2024-12084
-
-Upstream-Status: Backport [https://git.samba.org/?p=rsync.git;a=commit;h=42e2b56c4ede3ab164f9a5c6dae02aa84606a6c1]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- rsync.h  | 2 +-
- sender.c | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/rsync.h b/rsync.h
-index 8ddbe702..0f9e277f 100644
---- a/rsync.h
-+++ b/rsync.h
-@@ -982,7 +982,7 @@ struct map_struct {
-	int status;		/* first errno from read errors		*/
- };
-
--#define sum2_at(s, i)	((s)->sum2_array + ((OFF_T)(i) * xfer_sum_len))
-+#define sum2_at(s, i)	((s)->sum2_array + ((size_t)(i) * xfer_sum_len))
-
- #define NAME_IS_FILE		(0)    /* filter name as a file */
- #define NAME_IS_DIR		(1<<0) /* filter name as a dir */
-diff --git a/sender.c b/sender.c
-index ab205341..2bbff2fa 100644
---- a/sender.c
-+++ b/sender.c
-@@ -95,7 +95,7 @@ static struct sum_struct *receive_sums(int f)
-		return(s);
-
-	s->sums = new_array(struct sum_buf, s->count);
--	s->sum2_array = new_array(char, s->count * xfer_sum_len);
-+	s->sum2_array = new_array(char, (size_t)s->count * xfer_sum_len);
-
-	for (i = 0; i < s->count; i++) {
-		s->sums[i].sum1 = read_int(f);
---
-2.40.0
diff --git a/meta/recipes-devtools/rsync/files/CVE-2024-12085.patch b/meta/recipes-devtools/rsync/files/CVE-2024-12085.patch
deleted file mode 100644
index 165d5a6..0000000
--- a/meta/recipes-devtools/rsync/files/CVE-2024-12085.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 589b0691e59f761ccb05ddb8e1124991440db2c7 Mon Sep 17 00:00:00 2001
-From: Andrew Tridgell <andrew@tridgell.net>
-Date: Thu, 14 Nov 2024 09:57:08 +1100
-Subject: [PATCH] prevent information leak off the stack
-
-prevent leak of uninitialised stack data in hash_search
-
-CVE: CVE-2024-12085
-
-Upstream-Status: Backport [https://git.samba.org/?p=rsync.git;a=commit;h=589b0691e59f761ccb05ddb8e1124991440db2c7]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- match.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/match.c b/match.c
-index 36e78ed2..dfd6af2c 100644
---- a/match.c
-+++ b/match.c
-@@ -147,6 +147,9 @@ static void hash_search(int f,struct sum_struct *s,
-	int more;
-	schar *map;
-
-+	// prevent possible memory leaks
-+	memset(sum2, 0, sizeof sum2);
-+
-	/* want_i is used to encourage adjacent matches, allowing the RLL
-	 * coding of the output to work more efficiently. */
-	want_i = 0;
---
-2.40.0
diff --git a/meta/recipes-devtools/rsync/files/CVE-2024-12086-0001.patch b/meta/recipes-devtools/rsync/files/CVE-2024-12086-0001.patch
deleted file mode 100644
index 958a25a..0000000
--- a/meta/recipes-devtools/rsync/files/CVE-2024-12086-0001.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 8ad4b5d912fad1df29717dddaa775724da77d299 Mon Sep 17 00:00:00 2001
-From: Andrew Tridgell <andrew@tridgell.net>
-Date: Sat, 23 Nov 2024 11:08:03 +1100
-Subject: [PATCH] refuse fuzzy options when fuzzy not selected
-
-this prevents a malicious server providing a file to compare to when
-the user has not given the fuzzy option
-
-CVE: CVE-2024-12086
-
-Upstream-Status: Backport [https://git.samba.org/?p=rsync.git;a=commit;h=8ad4b5d912fad1df29717dddaa775724da77d299]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- receiver.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/receiver.c b/receiver.c
-index 6b4b369e..2d7f6033 100644
---- a/receiver.c
-+++ b/receiver.c
-@@ -66,6 +66,7 @@ extern char sender_file_sum[MAX_DIGEST_LEN];
- extern struct file_list *cur_flist, *first_flist, *dir_flist;
- extern filter_rule_list daemon_filter_list;
- extern OFF_T preallocated_len;
-+extern int fuzzy_basis;
-
- extern struct name_num_item *xfer_sum_nni;
- extern int xfer_sum_len;
-@@ -716,6 +717,10 @@ int recv_files(int f_in, int f_out, char *local_name)
-				fnamecmp = get_backup_name(fname);
-				break;
-			case FNAMECMP_FUZZY:
-+				if (fuzzy_basis == 0) {
-+					rprintf(FERROR_XFER, "rsync: refusing malicious fuzzy operation for %s\n", xname);
-+					exit_cleanup(RERR_PROTOCOL);
-+				}
-				if (file->dirname) {
-					pathjoin(fnamecmpbuf, sizeof fnamecmpbuf, file->dirname, xname);
-					fnamecmp = fnamecmpbuf;
---
-2.40.0
diff --git a/meta/recipes-devtools/rsync/files/CVE-2024-12086-0002.patch b/meta/recipes-devtools/rsync/files/CVE-2024-12086-0002.patch
deleted file mode 100644
index 5d25f12..0000000
--- a/meta/recipes-devtools/rsync/files/CVE-2024-12086-0002.patch
+++ /dev/null
@@ -1,108 +0,0 @@
-From b4a27ca25d0abb6fcf14f41b7e11f3a6e1d8a4ff Mon Sep 17 00:00:00 2001
-From: Andrew Tridgell <andrew@tridgell.net>
-Date: Sat, 23 Nov 2024 12:26:10 +1100
-Subject: [PATCH] added secure_relative_open()
-
-this is an open that enforces no symlink following for all path
-components in a relative path
-
-CVE: CVE-2024-12086
-
-Upstream-Status: Backport [https://git.samba.org/?p=rsync.git;a=commit;h=b4a27ca25d0abb6fcf14f41b7e11f3a6e1d8a4ff]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- syscall.c | 74 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 74 insertions(+)
-
-diff --git a/syscall.c b/syscall.c
-index b4b0f1f1..cffc814b 100644
---- a/syscall.c
-+++ b/syscall.c
-@@ -33,6 +33,8 @@
- #include <sys/syscall.h>
- #endif
-
-+#include "ifuncs.h"
-+
- extern int dry_run;
- extern int am_root;
- extern int am_sender;
-@@ -707,3 +709,75 @@ int do_open_nofollow(const char *pathname, int flags)
-
-	return fd;
- }
-+
-+/*
-+  open a file relative to a base directory. The basedir can be NULL,
-+  in which case the current working directory is used. The relpath
-+  must be a relative path, and the relpath must not contain any
-+  elements in the path which follow symlinks (ie. like O_NOFOLLOW, but
-+  applies to all path components, not just the last component)
-+*/
-+int secure_relative_open(const char *basedir, const char *relpath, int flags, mode_t mode)
-+{
-+	if (!relpath || relpath[0] == '/') {
-+		// must be a relative path
-+		errno = EINVAL;
-+		return -1;
-+	}
-+
-+#if !defined(O_NOFOLLOW) || !defined(O_DIRECTORY)
-+	// really old system, all we can do is live with the risks
-+	if (!basedir) {
-+		return open(relpath, flags, mode);
-+	}
-+	char fullpath[MAXPATHLEN];
-+	pathjoin(fullpath, sizeof fullpath, basedir, relpath);
-+	return open(fullpath, flags, mode);
-+#else
-+	int dirfd = AT_FDCWD;
-+	if (basedir != NULL) {
-+		dirfd = openat(AT_FDCWD, basedir, O_RDONLY | O_DIRECTORY);
-+		if (dirfd == -1) {
-+			return -1;
-+		}
-+	}
-+	int retfd = -1;
-+
-+	char *path_copy = my_strdup(relpath, __FILE__, __LINE__);
-+	if (!path_copy) {
-+		return -1;
-+	}
-+
-+	for (const char *part = strtok(path_copy, "/");
-+	     part != NULL;
-+	     part = strtok(NULL, "/"))
-+	{
-+		int next_fd = openat(dirfd, part, O_RDONLY | O_DIRECTORY | O_NOFOLLOW);
-+		if (next_fd == -1 && errno == ENOTDIR) {
-+			if (strtok(NULL, "/") != NULL) {
-+				// this is not the last component of the path
-+				errno = ELOOP;
-+				goto cleanup;
-+			}
-+			// this could be the last component of the path, try as a file
-+			retfd = openat(dirfd, part, flags | O_NOFOLLOW, mode);
-+			goto cleanup;
-+		}
-+		if (next_fd == -1) {
-+			goto cleanup;
-+		}
-+		if (dirfd != AT_FDCWD) close(dirfd);
-+		dirfd = next_fd;
-+	}
-+
-+	// the path must be a directory
-+	errno = EINVAL;
-+
-+cleanup:
-+	free(path_copy);
-+	if (dirfd != AT_FDCWD) {
-+		close(dirfd);
-+	}
-+	return retfd;
-+#endif // O_NOFOLLOW, O_DIRECTORY
-+}
---
-2.40.0
diff --git a/meta/recipes-devtools/rsync/files/CVE-2024-12086-0003.patch b/meta/recipes-devtools/rsync/files/CVE-2024-12086-0003.patch
deleted file mode 100644
index de1747a..0000000
--- a/meta/recipes-devtools/rsync/files/CVE-2024-12086-0003.patch
+++ /dev/null
@@ -1,108 +0,0 @@
-From c35e28331f10ba6eba370611abd78bde32d54da7 Mon Sep 17 00:00:00 2001
-From: Andrew Tridgell <andrew@tridgell.net>
-Date: Sat, 23 Nov 2024 12:28:13 +1100
-Subject: [PATCH] receiver: use secure_relative_open() for basis file
-
-this prevents attacks where the basis file is manipulated by a
-malicious sender to gain information about files outside the
-destination tree
-
-CVE: CVE-2024-12086
-
-Upstream-Status: Backport [https://git.samba.org/?p=rsync.git;a=commit;h=c35e28331f10ba6eba370611abd78bde32d54da7]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- receiver.c | 42 ++++++++++++++++++++++++++----------------
- 1 file changed, 26 insertions(+), 16 deletions(-)
-
-diff --git a/receiver.c b/receiver.c
-index 2d7f6033..8031b8f4 100644
---- a/receiver.c
-+++ b/receiver.c
-@@ -552,6 +552,8 @@ int recv_files(int f_in, int f_out, char *local_name)
-	progress_init();
-
-	while (1) {
-+		const char *basedir = NULL;
-+
-		cleanup_disable();
-
-		/* This call also sets cur_flist. */
-@@ -722,27 +724,29 @@ int recv_files(int f_in, int f_out, char *local_name)
-					exit_cleanup(RERR_PROTOCOL);
-				}
-				if (file->dirname) {
--					pathjoin(fnamecmpbuf, sizeof fnamecmpbuf, file->dirname, xname);
--					fnamecmp = fnamecmpbuf;
--				} else
--					fnamecmp = xname;
-+					basedir = file->dirname;
-+				}
-+				fnamecmp = xname;
-				break;
-			default:
-				if (fnamecmp_type > FNAMECMP_FUZZY && fnamecmp_type-FNAMECMP_FUZZY <= basis_dir_cnt) {
-					fnamecmp_type -= FNAMECMP_FUZZY + 1;
-					if (file->dirname) {
--						stringjoin(fnamecmpbuf, sizeof fnamecmpbuf,
--							   basis_dir[fnamecmp_type], "/", file->dirname, "/", xname, NULL);
--					} else
--						pathjoin(fnamecmpbuf, sizeof fnamecmpbuf, basis_dir[fnamecmp_type], xname);
-+						pathjoin(fnamecmpbuf, sizeof fnamecmpbuf, basis_dir[fnamecmp_type], file->dirname);
-+						basedir = fnamecmpbuf;
-+					} else {
-+						basedir = basis_dir[fnamecmp_type];
-+					}
-+					fnamecmp = xname;
-				} else if (fnamecmp_type >= basis_dir_cnt) {
-					rprintf(FERROR,
-						"invalid basis_dir index: %d.\n",
-						fnamecmp_type);
-					exit_cleanup(RERR_PROTOCOL);
--				} else
--					pathjoin(fnamecmpbuf, sizeof fnamecmpbuf, basis_dir[fnamecmp_type], fname);
--				fnamecmp = fnamecmpbuf;
-+				} else {
-+					basedir = basis_dir[fnamecmp_type];
-+					fnamecmp = fname;
-+				}
-				break;
-			}
-			if (!fnamecmp || (daemon_filter_list.head
-@@ -765,7 +769,7 @@ int recv_files(int f_in, int f_out, char *local_name)
-		}
-
-		/* open the file */
--		fd1 = do_open(fnamecmp, O_RDONLY, 0);
-+		fd1 = secure_relative_open(basedir, fnamecmp, O_RDONLY, 0);
-
-		if (fd1 == -1 && protocol_version < 29) {
-			if (fnamecmp != fname) {
-@@ -776,14 +780,20 @@ int recv_files(int f_in, int f_out, char *local_name)
-
-			if (fd1 == -1 && basis_dir[0]) {
-				/* pre-29 allowed only one alternate basis */
--				pathjoin(fnamecmpbuf, sizeof fnamecmpbuf,
--					 basis_dir[0], fname);
--				fnamecmp = fnamecmpbuf;
-+				basedir = basis_dir[0];
-+				fnamecmp = fname;
-				fnamecmp_type = FNAMECMP_BASIS_DIR_LOW;
--				fd1 = do_open(fnamecmp, O_RDONLY, 0);
-+				fd1 = secure_relative_open(basedir, fnamecmp, O_RDONLY, 0);
-			}
-		}
-
-+		if (basedir) {
-+			// for the following code we need the full
-+			// path name as a single string
-+			pathjoin(fnamecmpbuf, sizeof fnamecmpbuf, basedir, fnamecmp);
-+			fnamecmp = fnamecmpbuf;
-+		}
-+
-		one_inplace = inplace_partial && fnamecmp_type == FNAMECMP_PARTIAL_DIR;
-		updating_basis_or_equiv = one_inplace
-		    || (inplace && (fnamecmp == fname || fnamecmp_type == FNAMECMP_BACKUP));
---
-2.40.0
diff --git a/meta/recipes-devtools/rsync/files/CVE-2024-12086-0004.patch b/meta/recipes-devtools/rsync/files/CVE-2024-12086-0004.patch
deleted file mode 100644
index b85e1df..0000000
--- a/meta/recipes-devtools/rsync/files/CVE-2024-12086-0004.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 9f86ddc9652247233f32b241a79d5aa4fb9d4afa Mon Sep 17 00:00:00 2001
-From: Andrew Tridgell <andrew@tridgell.net>
-Date: Tue, 26 Nov 2024 09:16:31 +1100
-Subject: [PATCH] disallow ../ elements in relpath for secure_relative_open
-
-CVE: CVE-2024-12086
-
-Upstream-Status: Backport [https://git.samba.org/?p=rsync.git;a=commit;h=9f86ddc9652247233f32b241a79d5aa4fb9d4afa]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- syscall.c | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/syscall.c b/syscall.c
-index cffc814b..081357bb 100644
---- a/syscall.c
-+++ b/syscall.c
-@@ -716,6 +716,8 @@ int do_open_nofollow(const char *pathname, int flags)
-   must be a relative path, and the relpath must not contain any
-   elements in the path which follow symlinks (ie. like O_NOFOLLOW, but
-   applies to all path components, not just the last component)
-+
-+  The relpath must also not contain any ../ elements in the path
- */
- int secure_relative_open(const char *basedir, const char *relpath, int flags, mode_t mode)
- {
-@@ -724,6 +726,11 @@ int secure_relative_open(const char *basedir, const char *relpath, int flags, mo
-		errno = EINVAL;
-		return -1;
-	}
-+	if (strncmp(relpath, "../", 3) == 0 || strstr(relpath, "/../")) {
-+		// no ../ elements allowed in the relpath
-+		errno = EINVAL;
-+		return -1;
-+	}
-
- #if !defined(O_NOFOLLOW) || !defined(O_DIRECTORY)
-	// really old system, all we can do is live with the risks
---
-2.40.0
diff --git a/meta/recipes-devtools/rsync/files/CVE-2024-12087-0001.patch b/meta/recipes-devtools/rsync/files/CVE-2024-12087-0001.patch
deleted file mode 100644
index 67abc64..0000000
--- a/meta/recipes-devtools/rsync/files/CVE-2024-12087-0001.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 688f5c379a433038bde36897a156d589be373a98 Mon Sep 17 00:00:00 2001
-From: Wayne Davison <wayne@opencoder.net>
-Date: Thu, 14 Nov 2024 15:46:50 -0800
-Subject: [PATCH] Refuse a duplicate dirlist.
-
-CVE: CVE-2024-12087
-
-Upstream-Status: Backport [https://git.samba.org/?p=rsync.git;a=commit;h=688f5c379a433038bde36897a156d589be373a98]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- flist.c | 9 +++++++++
- rsync.h | 1 +
- 2 files changed, 10 insertions(+)
-
-diff --git a/flist.c b/flist.c
-index 464d556e..847b1054 100644
---- a/flist.c
-+++ b/flist.c
-@@ -2584,6 +2584,15 @@ struct file_list *recv_file_list(int f, int dir_ndx)
-		init_hard_links();
- #endif
-
-+	if (inc_recurse && dir_ndx >= 0) {
-+		struct file_struct *file = dir_flist->files[dir_ndx];
-+		if (file->flags & FLAG_GOT_DIR_FLIST) {
-+			rprintf(FERROR_XFER, "rsync: refusing malicious duplicate flist for dir %d\n", dir_ndx);
-+			exit_cleanup(RERR_PROTOCOL);
-+		}
-+		file->flags |= FLAG_GOT_DIR_FLIST;
-+	}
-+
-	flist = flist_new(0, "recv_file_list");
-	flist_expand(flist, FLIST_START_LARGE);
-
-diff --git a/rsync.h b/rsync.h
-index 0f9e277f..b9a7101a 100644
---- a/rsync.h
-+++ b/rsync.h
-@@ -84,6 +84,7 @@
- #define FLAG_DUPLICATE (1<<4)	/* sender */
- #define FLAG_MISSING_DIR (1<<4)	/* generator */
- #define FLAG_HLINKED (1<<5)	/* receiver/generator (checked on all types) */
-+#define FLAG_GOT_DIR_FLIST (1<<5)/* sender/receiver/generator - dir_flist only */
- #define FLAG_HLINK_FIRST (1<<6)	/* receiver/generator (w/FLAG_HLINKED) */
- #define FLAG_IMPLIED_DIR (1<<6)	/* sender/receiver/generator (dirs only) */
- #define FLAG_HLINK_LAST (1<<7)	/* receiver/generator */
---
-2.40.0
diff --git a/meta/recipes-devtools/rsync/files/CVE-2024-12087-0002.patch b/meta/recipes-devtools/rsync/files/CVE-2024-12087-0002.patch
deleted file mode 100644
index 8a22e0c..0000000
--- a/meta/recipes-devtools/rsync/files/CVE-2024-12087-0002.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 344327385fa47fa5bb67a32c237735e6240cfb93 Mon Sep 17 00:00:00 2001
-From: Andrew Tridgell <andrew@tridgell.net>
-Date: Tue, 26 Nov 2024 16:12:45 +1100
-Subject: [PATCH] range check dir_ndx before use
-
-CVE: CVE-2024-12087
-
-Upstream-Status: Backport [https://git.samba.org/?p=rsync.git;a=commit;h=344327385fa47fa5bb67a32c237735e6240cfb93]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- flist.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/flist.c b/flist.c
-index 847b1054..087f9da6 100644
---- a/flist.c
-+++ b/flist.c
-@@ -2585,6 +2585,10 @@ struct file_list *recv_file_list(int f, int dir_ndx)
- #endif
-
-	if (inc_recurse && dir_ndx >= 0) {
-+		if (dir_ndx >= dir_flist->used) {
-+			rprintf(FERROR_XFER, "rsync: refusing invalid dir_ndx %u >= %u\n", dir_ndx, dir_flist->used);
-+			exit_cleanup(RERR_PROTOCOL);
-+		}
-		struct file_struct *file = dir_flist->files[dir_ndx];
-		if (file->flags & FLAG_GOT_DIR_FLIST) {
-			rprintf(FERROR_XFER, "rsync: refusing malicious duplicate flist for dir %d\n", dir_ndx);
---
-2.40.0
diff --git a/meta/recipes-devtools/rsync/files/CVE-2024-12087-0003.patch b/meta/recipes-devtools/rsync/files/CVE-2024-12087-0003.patch
deleted file mode 100644
index 0ece69c..0000000
--- a/meta/recipes-devtools/rsync/files/CVE-2024-12087-0003.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 996af4a79f9afe4d7158ecdd87c78cee382c6b39 Mon Sep 17 00:00:00 2001
-From: Natanael Copa <ncopa@alpinelinux.org>
-Date: Wed, 15 Jan 2025 15:10:24 +0100
-Subject: [PATCH] Fix FLAG_GOT_DIR_FLIST collission with FLAG_HLINKED
-
-fixes commit 688f5c379a43 (Refuse a duplicate dirlist.)
-
-Fixes: https://github.com/RsyncProject/rsync/issues/702
-Fixes: https://github.com/RsyncProject/rsync/issues/697
-CVE: CVE-2024-12087
-
-Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/996af4a79f9afe4d7158ecdd87c78cee382c6b39]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- rsync.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/rsync.h b/rsync.h
-index 9be1297b..479ac484 100644
---- a/rsync.h
-+++ b/rsync.h
-@@ -84,7 +84,6 @@
- #define FLAG_DUPLICATE (1<<4)	/* sender */
- #define FLAG_MISSING_DIR (1<<4)	/* generator */
- #define FLAG_HLINKED (1<<5)	/* receiver/generator (checked on all types) */
--#define FLAG_GOT_DIR_FLIST (1<<5)/* sender/receiver/generator - dir_flist only */
- #define FLAG_HLINK_FIRST (1<<6)	/* receiver/generator (w/FLAG_HLINKED) */
- #define FLAG_IMPLIED_DIR (1<<6)	/* sender/receiver/generator (dirs only) */
- #define FLAG_HLINK_LAST (1<<7)	/* receiver/generator */
-@@ -93,6 +92,7 @@
- #define FLAG_SKIP_GROUP (1<<10)	/* receiver/generator */
- #define FLAG_TIME_FAILED (1<<11)/* generator */
- #define FLAG_MOD_NSEC (1<<12)	/* sender/receiver/generator */
-+#define FLAG_GOT_DIR_FLIST (1<<13)/* sender/receiver/generator - dir_flist only */
-
- /* These flags are passed to functions but not stored. */
-
---
-2.40.0
diff --git a/meta/recipes-devtools/rsync/files/CVE-2024-12088.patch b/meta/recipes-devtools/rsync/files/CVE-2024-12088.patch
deleted file mode 100644
index b2a3a86..0000000
--- a/meta/recipes-devtools/rsync/files/CVE-2024-12088.patch
+++ /dev/null
@@ -1,141 +0,0 @@
-From 407c71c7ce562137230e8ba19149c81ccc47c387 Mon Sep 17 00:00:00 2001
-From: Andrew Tridgell <andrew@tridgell.net>
-Date: Sat, 23 Nov 2024 15:15:53 +1100
-Subject: [PATCH] make --safe-links stricter
-
-when --safe-links is used also reject links where a '../' component is
-included in the destination as other than the leading part of the
-filename
-
-CVE: CVE-2024-12088
-
-Upstream-Status: Backport [https://git.samba.org/?p=rsync.git;a=commit;h=407c71c7ce562137230e8ba19149c81ccc47c387]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- testsuite/safe-links.test    | 55 ++++++++++++++++++++++++++++++++++++
- testsuite/unsafe-byname.test |  2 +-
- util1.c                      | 26 ++++++++++++++++-
- 3 files changed, 81 insertions(+), 2 deletions(-)
- create mode 100644 testsuite/safe-links.test
-
-diff --git a/testsuite/safe-links.test b/testsuite/safe-links.test
-new file mode 100644
-index 00000000..6e95a4b9
---- /dev/null
-+++ b/testsuite/safe-links.test
-@@ -0,0 +1,55 @@
-+#!/bin/sh
-+
-+. "$suitedir/rsync.fns"
-+
-+test_symlink() {
-+	is_a_link "$1" || test_fail "File $1 is not a symlink"
-+}
-+
-+test_regular() {
-+	if [ ! -f "$1" ]; then
-+		test_fail "File $1 is not regular file or not exists"
-+	fi
-+}
-+
-+test_notexist() {
-+        if [ -e "$1" ]; then
-+                test_fail "File $1 exists"
-+	fi
-+        if [ -h "$1" ]; then
-+                test_fail "File $1 exists as a symlink"
-+	fi
-+}
-+
-+cd "$tmpdir"
-+
-+mkdir from
-+
-+mkdir "from/safe"
-+mkdir "from/unsafe"
-+
-+mkdir "from/safe/files"
-+mkdir "from/safe/links"
-+
-+touch "from/safe/files/file1"
-+touch "from/safe/files/file2"
-+touch "from/unsafe/unsafefile"
-+
-+ln -s ../files/file1 "from/safe/links/"
-+ln -s ../files/file2 "from/safe/links/"
-+ln -s ../../unsafe/unsafefile "from/safe/links/"
-+ln -s a/a/a/../../../unsafe2 "from/safe/links/"
-+
-+#echo "LISTING FROM"
-+#ls -lR from
-+
-+echo "rsync with relative path and just -a"
-+$RSYNC -avv --safe-links from/safe/ to
-+
-+#echo "LISTING TO"
-+#ls -lR to
-+
-+test_symlink to/links/file1
-+test_symlink to/links/file2
-+test_notexist to/links/unsafefile
-+test_notexist to/links/unsafe2
-diff --git a/testsuite/unsafe-byname.test b/testsuite/unsafe-byname.test
-index 75e72014..d2e318ef 100644
---- a/testsuite/unsafe-byname.test
-+++ b/testsuite/unsafe-byname.test
-@@ -40,7 +40,7 @@ test_unsafe ..//../dest 		from/dir			unsafe
- test_unsafe ..				from/file			safe
- test_unsafe ../..			from/file			unsafe
- test_unsafe ..//..			from//file			unsafe
--test_unsafe dir/..			from				safe
-+test_unsafe dir/..			from				unsafe
- test_unsafe dir/../..			from				unsafe
- test_unsafe dir/..//..			from				unsafe
-
-diff --git a/util1.c b/util1.c
-index da50ff1e..f260d398 100644
---- a/util1.c
-+++ b/util1.c
-@@ -1318,7 +1318,14 @@ int handle_partial_dir(const char *fname, int create)
-  *
-  * "src" is the top source directory currently applicable at the level
-  * of the referenced symlink.  This is usually the symlink's full path
-- * (including its name), as referenced from the root of the transfer. */
-+ * (including its name), as referenced from the root of the transfer.
-+ *
-+ * NOTE: this also rejects dest names with a .. component in other
-+ * than the first component of the name ie. it rejects names such as
-+ * a/b/../x/y. This needs to be done as the leading subpaths 'a' or
-+ * 'b' could later be replaced with symlinks such as a link to '.'
-+ * resulting in the link being transferred now becoming unsafe
-+ */
- int unsafe_symlink(const char *dest, const char *src)
- {
-	const char *name, *slash;
-@@ -1328,6 +1335,23 @@ int unsafe_symlink(const char *dest, const char *src)
-	if (!dest || !*dest || *dest == '/')
-		return 1;
-
-+	// reject destinations with /../ in the name other than at the start of the name
-+	const char *dest2 = dest;
-+	while (strncmp(dest2, "../", 3) == 0) {
-+	    dest2 += 3;
-+	    while (*dest2 == '/') {
-+		// allow for ..//..///../foo
-+		dest2++;
-+	    }
-+	}
-+	if (strstr(dest2, "/../"))
-+	    return 1;
-+
-+	// reject if the destination ends in /..
-+	const size_t dlen = strlen(dest);
-+	if (dlen > 3 && strcmp(&dest[dlen-3], "/..") == 0)
-+	    return 1;
-+
-	/* find out what our safety margin is */
-	for (name = src; (slash = strchr(name, '/')) != 0; name = slash+1) {
-		/* ".." segment starts the count over.  "." segment is ignored. */
---
-2.40.0
diff --git a/meta/recipes-devtools/rsync/files/CVE-2024-12747.patch b/meta/recipes-devtools/rsync/files/CVE-2024-12747.patch
deleted file mode 100644
index b1dd0a0..0000000
--- a/meta/recipes-devtools/rsync/files/CVE-2024-12747.patch
+++ /dev/null
@@ -1,192 +0,0 @@
-From 0590b09d9a34ae72741b91ec0708a820650198b0 Mon Sep 17 00:00:00 2001
-From: Andrew Tridgell <andrew@tridgell.net>
-Date: Wed, 18 Dec 2024 08:59:42 +1100
-Subject: [PATCH] fixed symlink race condition in sender
-
-when we open a file that we don't expect to be a symlink use
-O_NOFOLLOW to prevent a race condition where an attacker could change
-a file between being a normal file and a symlink
-
-CVE: CVE-2024-12747
-
-Upstream-Status: Backport [https://git.samba.org/?p=rsync.git;a=commit;h=0590b09d9a34ae72741b91ec0708a820650198b0]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- checksum.c  |  2 +-
- flist.c     |  2 +-
- generator.c |  4 ++--
- receiver.c  |  2 +-
- sender.c    |  2 +-
- syscall.c   | 20 ++++++++++++++++++++
- t_unsafe.c  |  3 +++
- tls.c       |  3 +++
- trimslash.c |  2 ++
- util1.c     |  2 +-
- 10 files changed, 35 insertions(+), 7 deletions(-)
-
-diff --git a/checksum.c b/checksum.c
-index cb21882c..66e80896 100644
---- a/checksum.c
-+++ b/checksum.c
-@@ -406,7 +406,7 @@ void file_checksum(const char *fname, const STRUCT_STAT *st_p, char *sum)
-	int32 remainder;
-	int fd;
-
--	fd = do_open(fname, O_RDONLY, 0);
-+	fd = do_open_checklinks(fname);
-	if (fd == -1) {
-		memset(sum, 0, file_sum_len);
-		return;
-diff --git a/flist.c b/flist.c
-index 087f9da6..17832533 100644
---- a/flist.c
-+++ b/flist.c
-@@ -1390,7 +1390,7 @@ struct file_struct *make_file(const char *fname, struct file_list *flist,
-
-	if (copy_devices && am_sender && IS_DEVICE(st.st_mode)) {
-		if (st.st_size == 0) {
--			int fd = do_open(fname, O_RDONLY, 0);
-+			int fd = do_open_checklinks(fname);
-			if (fd >= 0) {
-				st.st_size = get_device_size(fd, fname);
-				close(fd);
-diff --git a/generator.c b/generator.c
-index 110db28f..3f13bb95 100644
---- a/generator.c
-+++ b/generator.c
-@@ -1798,7 +1798,7 @@ static void recv_generator(char *fname, struct file_struct *file, int ndx,
-
-	if (write_devices && IS_DEVICE(sx.st.st_mode) && sx.st.st_size == 0) {
-		/* This early open into fd skips the regular open below. */
--		if ((fd = do_open(fnamecmp, O_RDONLY, 0)) >= 0)
-+		if ((fd = do_open_nofollow(fnamecmp, O_RDONLY)) >= 0)
-			real_sx.st.st_size = sx.st.st_size = get_device_size(fd, fnamecmp);
-	}
-
-@@ -1867,7 +1867,7 @@ static void recv_generator(char *fname, struct file_struct *file, int ndx,
-	}
-
-	/* open the file */
--	if (fd < 0 && (fd = do_open(fnamecmp, O_RDONLY, 0)) < 0) {
-+	if (fd < 0 && (fd = do_open_checklinks(fnamecmp)) < 0) {
-		rsyserr(FERROR, errno, "failed to open %s, continuing",
-			full_fname(fnamecmp));
-	  pretend_missing:
-diff --git a/receiver.c b/receiver.c
-index 8031b8f4..edfbb210 100644
---- a/receiver.c
-+++ b/receiver.c
-@@ -775,7 +775,7 @@ int recv_files(int f_in, int f_out, char *local_name)
-			if (fnamecmp != fname) {
-				fnamecmp = fname;
-				fnamecmp_type = FNAMECMP_FNAME;
--				fd1 = do_open(fnamecmp, O_RDONLY, 0);
-+				fd1 = do_open_nofollow(fnamecmp, O_RDONLY);
-			}
-
-			if (fd1 == -1 && basis_dir[0]) {
-diff --git a/sender.c b/sender.c
-index 2bbff2fa..a4d46c39 100644
---- a/sender.c
-+++ b/sender.c
-@@ -350,7 +350,7 @@ void send_files(int f_in, int f_out)
-			exit_cleanup(RERR_PROTOCOL);
-		}
-
--		fd = do_open(fname, O_RDONLY, 0);
-+		fd = do_open_checklinks(fname);
-		if (fd == -1) {
-			if (errno == ENOENT) {
-				enum logcode c = am_daemon && protocol_version < 28 ? FERROR : FWARNING;
-diff --git a/syscall.c b/syscall.c
-index 081357bb..8cea2900 100644
---- a/syscall.c
-+++ b/syscall.c
-@@ -45,6 +45,8 @@ extern int preallocate_files;
- extern int preserve_perms;
- extern int preserve_executability;
- extern int open_noatime;
-+extern int copy_links;
-+extern int copy_unsafe_links;
-
- #ifndef S_BLKSIZE
- # if defined hpux || defined __hpux__ || defined __hpux
-@@ -788,3 +790,21 @@ cleanup:
-	return retfd;
- #endif // O_NOFOLLOW, O_DIRECTORY
- }
-+
-+/*
-+  varient of do_open/do_open_nofollow which does do_open() if the
-+  copy_links or copy_unsafe_links options are set and does
-+  do_open_nofollow() otherwise
-+
-+  This is used to prevent a race condition where an attacker could be
-+  switching a file between being a symlink and being a normal file
-+
-+  The open is always done with O_RDONLY flags
-+ */
-+int do_open_checklinks(const char *pathname)
-+{
-+	if (copy_links || copy_unsafe_links) {
-+		return do_open(pathname, O_RDONLY, 0);
-+	}
-+	return do_open_nofollow(pathname, O_RDONLY);
-+}
-diff --git a/t_unsafe.c b/t_unsafe.c
-index 010cac50..e10619a2 100644
---- a/t_unsafe.c
-+++ b/t_unsafe.c
-@@ -28,6 +28,9 @@ int am_root = 0;
- int am_sender = 1;
- int read_only = 0;
- int list_only = 0;
-+int copy_links = 0;
-+int copy_unsafe_links = 0;
-+
- short info_levels[COUNT_INFO], debug_levels[COUNT_DEBUG];
-
- int
-diff --git a/tls.c b/tls.c
-index e6b0708a..858f8f10 100644
---- a/tls.c
-+++ b/tls.c
-@@ -49,6 +49,9 @@ int list_only = 0;
- int link_times = 0;
- int link_owner = 0;
- int nsec_times = 0;
-+int safe_symlinks = 0;
-+int copy_links = 0;
-+int copy_unsafe_links = 0;
-
- #ifdef SUPPORT_XATTRS
-
-diff --git a/trimslash.c b/trimslash.c
-index 1ec928ca..f2774cd7 100644
---- a/trimslash.c
-+++ b/trimslash.c
-@@ -26,6 +26,8 @@ int am_root = 0;
- int am_sender = 1;
- int read_only = 1;
- int list_only = 0;
-+int copy_links = 0;
-+int copy_unsafe_links = 0;
-
- int
- main(int argc, char **argv)
-diff --git a/util1.c b/util1.c
-index f260d398..d84bc414 100644
---- a/util1.c
-+++ b/util1.c
-@@ -365,7 +365,7 @@ int copy_file(const char *source, const char *dest, int tmpfilefd, mode_t mode)
-	int len;   /* Number of bytes read into `buf'. */
-	OFF_T prealloc_len = 0, offset = 0;
-
--	if ((ifd = do_open(source, O_RDONLY, 0)) < 0) {
-+	if ((ifd = do_open_nofollow(source, O_RDONLY)) < 0) {
-		int save_errno = errno;
-		rsyserr(FERROR_XFER, errno, "open %s", full_fname(source));
-		errno = save_errno;
---
-2.40.0
diff --git a/meta/recipes-devtools/rsync/files/CVE-2025-10158.patch b/meta/recipes-devtools/rsync/files/CVE-2025-10158.patch
deleted file mode 100644
index a19cc15..0000000
--- a/meta/recipes-devtools/rsync/files/CVE-2025-10158.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 797e17fc4a6f15e3b1756538a9f812b63942686f Mon Sep 17 00:00:00 2001
-From: Andrew Tridgell <andrew@tridgell.net>
-Date: Sat, 23 Aug 2025 17:26:53 +1000
-Subject: [PATCH] fixed an invalid access to files array
-
-
-this was found by Calum Hutton from Rapid7. It is a real bug, but
-analysis shows it can't be leverged into an exploit. Worth fixing
-though.
-
-Many thanks to Calum and Rapid7 for finding and reporting this
-
-CVE: CVE-2025-10158
-Upstream-Status: Backport
-[https://github.com/RsyncProject/rsync/commit/797e17fc4a6f15e3b1756538a9f812b63942686f]
-Signed-off-by: Adarsh Jagadish Kamini<adarsh.jagadish.kamini@est.tech>
----
- sender.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/sender.c b/sender.c
-index 2bbff2fa..5528071e 100644
---- a/sender.c
-+++ b/sender.c
-@@ -262,6 +262,8 @@ void send_files(int f_in, int f_out)
- 
- 		if (ndx - cur_flist->ndx_start >= 0)
- 			file = cur_flist->files[ndx - cur_flist->ndx_start];
-+		else if (cur_flist->parent_ndx < 0)
-+			exit_cleanup(RERR_PROTOCOL);
- 		else
- 			file = dir_flist->files[cur_flist->parent_ndx];
- 		if (F_PATHNAME(file)) {
--- 
-2.44.1
-
diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-41035.patch b/meta/recipes-devtools/rsync/files/CVE-2026-41035.patch
deleted file mode 100644
index 66b1b93..0000000
--- a/meta/recipes-devtools/rsync/files/CVE-2026-41035.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From bb0a8118c2d2ab01140bac5e4e327e5e1ef90c9c Mon Sep 17 00:00:00 2001
-From: Andrew Tridgell <andrew@tridgell.net>
-Date: Wed, 22 Apr 2026 09:57:45 +1000
-Subject: [PATCH] xattrs: fixed count in qsort
-
-this fixes the count passed to the sort of the xattr list. This issue
-was reported here:
-
-https://www.openwall.com/lists/oss-security/2026/04/16/2
-
-the bug is not exploitable due to the fork-per-connection design of
-rsync, the attack is the equivalent of the user closing the socket
-themselves.
-
-CVE: CVE-2026-41035
-Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/bb0a8118c2d2ab01140bac5e4e327e5e1ef90c9c]
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- xattrs.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/xattrs.c b/xattrs.c
-index 26e50a6..65166ee 100644
---- a/xattrs.c
-+++ b/xattrs.c
-@@ -860,8 +860,8 @@ void receive_xattr(int f, struct file_struct *file)
- 		rxa->num = num;
- 	}
- 
--	if (need_sort && count > 1)
--		qsort(temp_xattr.items, count, sizeof (rsync_xa), rsync_xal_compare_names);
-+	if (need_sort && temp_xattr.count > 1)
-+		qsort(temp_xattr.items, temp_xattr.count, sizeof (rsync_xa), rsync_xal_compare_names);
- 
- 	ndx = rsync_xal_store(&temp_xattr); /* adds item to rsync_xal_l */
- 
--- 
-2.50.1
-
diff --git a/meta/recipes-devtools/rsync/rsync_3.2.7.bb b/meta/recipes-devtools/rsync/rsync_3.4.4.bb
similarity index 77%
rename from meta/recipes-devtools/rsync/rsync_3.2.7.bb
rename to meta/recipes-devtools/rsync/rsync_3.4.4.bb
index 2a1c3d9..c6f3c80 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.7.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.4.4.bb
@@ -14,23 +14,9 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://rsyncd.conf \
            file://makefile-no-rebuild.patch \
            file://determism.patch \
-           file://0001-Add-missing-prototypes-to-function-declarations.patch \
-           file://CVE-2024-12084-0001.patch \
-           file://CVE-2024-12084-0002.patch \
-           file://CVE-2024-12085.patch \
-           file://CVE-2024-12086-0001.patch \
-           file://CVE-2024-12086-0002.patch \
-           file://CVE-2024-12086-0003.patch \
-           file://CVE-2024-12086-0004.patch \
-           file://CVE-2024-12087-0001.patch \
-           file://CVE-2024-12087-0002.patch \
-           file://CVE-2024-12087-0003.patch \
-           file://CVE-2024-12088.patch \
-           file://CVE-2024-12747.patch \
-           file://CVE-2025-10158.patch \
-           file://CVE-2026-41035.patch \
+           file://0001-Add-missing-prototypes.patch \
            "
-SRC_URI[sha256sum] = "4e7d9d3f6ed10878c58c5fb724a67dacf4b6aac7340b13e488fb2dc41346f2bb"
+SRC_URI[sha256sum] = "bd88cf82fa653da32314fb229136407c5c90f80d1758d8f4b091767877d8fa96"
 
 inherit autotools-brokensep
 
-- 
2.55.0


