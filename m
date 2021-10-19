Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5787CC433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 19:54:20 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.15511.1634673259330914885
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:54:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=jIgmHvLd;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id g5so14479770plg.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=tJWMu68aQi++gj2rTC0kgf5HD/e97gjYkyGIPpsCAoA=;
        b=jIgmHvLdTSWx1t1mAYVC3rGXaPnfyEcqpMo0z9Jg5uuP+lI5R44cszF2D3Pdj71gpe
         JjhwH0etLOSe2OMKX83WE3B89txKU0P1qGC7dmdJrrLg19OFmo39iRMo4OK9c7khOPRL
         VAGteL6drS2KBqDrcD7/qqLe7gw8V/QxATzC8nYy36SkH8uXYiVMHcKoRCpLWITmHlMc
         ApcKubJv4Mo/vgeCwhkDK1KrPTgAqmF0Pk0hRbtYOJtMC1mL+Jx1NigxHDzeiNrlxmpw
         Si47DFt7wOmbOIRrlM8IBWFWuF/eF6KLHRJznoRVkvzVBedXGP51vsqSgMnxt1AuPMrU
         gidg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tJWMu68aQi++gj2rTC0kgf5HD/e97gjYkyGIPpsCAoA=;
        b=dfGF60BJol2tk3HWyONNoqpgEmyxMuvysH+fvrUvYJnAkT7gyu4fZfy5f/Y01V/kvn
         USsSiOWslwny3eEKjDGr6GxHpA4cODl/SQVbg7yaMJqKGqxTqgTR5RAvqVOGHmznm/fl
         x8YpNuKWaTouYOfMgOWpZ+DnnF5buAqqo4BeaBjiYlDDbKKYiiFc+XWwasbnx9u+HlN2
         IyR4RM3CxV9Z3lZqQHTp/nhUhqIiHhNHbWe4C12UAosluAm5QQo9bRVGgkpf9LFA2ZAu
         e808ykmEn/kh0S36QA8SUDNSEJk7dNncMtsoWfTLtZNjx4kK9UrcsyDKt5cZj4iginHf
         VThA==
X-Gm-Message-State: AOAM533ZA4SmiBoMyATAFXL78TcsL3OrLK+3dRGxP+LTzdYPH7GFVA2W
	2KCHWZUHGXuRAsgvsmS+Nk9zuwAJhIBK3w81Vn4=
X-Google-Smtp-Source: 
 ABdhPJwTg/ey4fiW38yiRbARlT6k0kTXxIPhVYwgZB9KmX1Afw7GmF544zs4++RDEfkoUgABJCn0ag==
X-Received: by 2002:a17:902:7246:b0:138:a6ed:66cc with SMTP id
 c6-20020a170902724600b00138a6ed66ccmr36224427pll.22.1634673258133;
        Tue, 19 Oct 2021 12:54:18 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q14sm67104pfk.3.2021.10.19.12.54.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 12:54:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/38] e2fsprogs: update to 1.45.6
Date: Tue, 19 Oct 2021 09:53:16 -1000
Message-Id: 
 <53947537ed5ab5f9fd213a6fb4295740b5a2ca6b.1634665675.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634665675.git.steve@sakoman.com>
References: <cover.1634665675.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 19:54:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157210

From: Alexander Kanavin <alex.kanavin@gmail.com>

Drop backports, and also 0001-misc-create_inode.c-set-dir-s-mode-correctly.patch
as upstream code has been refactored.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit da9fec8592db913d13af3a936ab518e93496be3e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...-t-try-to-rehash-a-deleted-directory.patch | 49 ------------
 ...ate_inode.c-set-dir-s-mode-correctly.patch | 41 ----------
 .../e2fsprogs/e2fsprogs/CVE-2019-5188.patch   | 57 --------------
 ...fix-use-after-free-in-calculate_tree.patch | 76 -------------------
 ...-missing-check-for-permission-denied.patch |  2 +-
 .../e2fsprogs/e2fsprogs/quiet-debugfs.patch   |  2 +-
 ...2fsprogs_1.45.4.bb => e2fsprogs_1.45.6.bb} |  6 +-
 7 files changed, 3 insertions(+), 230 deletions(-)
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsck-don-t-try-to-rehash-a-deleted-directory.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-create_inode.c-set-dir-s-mode-correctly.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/CVE-2019-5188.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsck-fix-use-after-free-in-calculate_tree.patch
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.45.4.bb => e2fsprogs_1.45.6.bb} (94%)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsck-don-t-try-to-rehash-a-deleted-directory.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsck-don-t-try-to-rehash-a-deleted-directory.patch
deleted file mode 100644
index ba4e3a3c97..0000000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsck-don-t-try-to-rehash-a-deleted-directory.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 71ba13755337e19c9a826dfc874562a36e1b24d3 Mon Sep 17 00:00:00 2001
-From: Theodore Ts'o <tytso@mit.edu>
-Date: Thu, 19 Dec 2019 19:45:06 -0500
-Subject: [PATCH] e2fsck: don't try to rehash a deleted directory
-
-If directory has been deleted in pass1[bcd] processing, then we
-shouldn't try to rehash the directory in pass 3a when we try to
-rehash/reoptimize directories.
-
-Signed-off-by: Theodore Ts'o <tytso@mit.edu>
-
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/commit/?id=71ba13755337e19c9a826dfc874562a36e1b24d3]
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- e2fsck/pass1b.c | 4 ++++
- e2fsck/rehash.c | 2 ++
- 2 files changed, 6 insertions(+)
-
-diff --git a/e2fsck/pass1b.c b/e2fsck/pass1b.c
-index 5693b9cf..bca701ca 100644
---- a/e2fsck/pass1b.c
-+++ b/e2fsck/pass1b.c
-@@ -705,6 +705,10 @@ static void delete_file(e2fsck_t ctx, ext2_ino_t ino,
- 		fix_problem(ctx, PR_1B_BLOCK_ITERATE, &pctx);
- 	if (ctx->inode_bad_map)
- 		ext2fs_unmark_inode_bitmap2(ctx->inode_bad_map, ino);
-+	if (ctx->inode_reg_map)
-+		ext2fs_unmark_inode_bitmap2(ctx->inode_reg_map, ino);
-+	ext2fs_unmark_inode_bitmap2(ctx->inode_dir_map, ino);
-+	ext2fs_unmark_inode_bitmap2(ctx->inode_used_map, ino);
- 	ext2fs_inode_alloc_stats2(fs, ino, -1, LINUX_S_ISDIR(dp->inode.i_mode));
- 	quota_data_sub(ctx->qctx, &dp->inode, ino,
- 		       pb.dup_blocks * fs->blocksize);
-diff --git a/e2fsck/rehash.c b/e2fsck/rehash.c
-index 3dd1e941..2c908be0 100644
---- a/e2fsck/rehash.c
-+++ b/e2fsck/rehash.c
-@@ -1028,6 +1028,8 @@ void e2fsck_rehash_directories(e2fsck_t ctx)
- 			if (!ext2fs_u32_list_iterate(iter, &ino))
- 				break;
- 		}
-+		if (!ext2fs_test_inode_bitmap2(ctx->inode_dir_map, ino))
-+			continue;
- 
- 		pctx.dir = ino;
- 		if (first) {
--- 
-2.24.1
-
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-create_inode.c-set-dir-s-mode-correctly.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-create_inode.c-set-dir-s-mode-correctly.patch
deleted file mode 100644
index fc4a540986..0000000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-create_inode.c-set-dir-s-mode-correctly.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From f6d188580c2c9599319076fee22f2424652c711c Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Wed, 13 Sep 2017 19:55:35 -0700
-Subject: [PATCH] misc/create_inode.c: set dir's mode correctly
-
-The dir's mode has been set by ext2fs_mkdir() with umask, so
-reset it to the source's mode in set_inode_extra().
-
-Fixed when source dir's mode is 521, but tarball would be 721, this was
-incorrect.
-
-Upstream-Status: Submitted
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- misc/create_inode.c | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/misc/create_inode.c b/misc/create_inode.c
-index 8ce3faf..50fbaa8 100644
---- a/misc/create_inode.c
-+++ b/misc/create_inode.c
-@@ -116,7 +116,14 @@ static errcode_t set_inode_extra(ext2_filsys fs, ext2_ino_t ino,
- 
- 	inode.i_uid = st->st_uid;
- 	inode.i_gid = st->st_gid;
--	inode.i_mode |= st->st_mode;
-+	/*
-+	 * The dir's mode has been set by ext2fs_mkdir() with umask, so
-+	 * reset it to the source's mode
-+	 */
-+	if S_ISDIR(st->st_mode)
-+		inode.i_mode = LINUX_S_IFDIR | st->st_mode;
-+	else
-+		inode.i_mode |= st->st_mode;
- 	inode.i_atime = st->st_atime;
- 	inode.i_mtime = st->st_mtime;
- 	inode.i_ctime = st->st_ctime;
--- 
-2.10.2
-
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/CVE-2019-5188.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/CVE-2019-5188.patch
deleted file mode 100644
index de4bce0037..0000000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/CVE-2019-5188.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 8dd73c149f418238f19791f9d666089ef9734dff Mon Sep 17 00:00:00 2001
-From: Theodore Ts'o <tytso@mit.edu>
-Date: Thu, 19 Dec 2019 19:37:34 -0500
-Subject: [PATCH] e2fsck: abort if there is a corrupted directory block when
- rehashing
-
-In e2fsck pass 3a, when we are rehashing directories, at least in
-theory, all of the directories should have had corruptions with
-respect to directory entry structure fixed.  However, it's possible
-(for example, if the user declined a fix) that we can reach this stage
-of processing with a corrupted directory entries.
-
-So check for that case and don't try to process a corrupted directory
-block so we don't run into trouble in mutate_name() if there is a
-zero-length file name.
-
-Addresses: TALOS-2019-0973
-Addresses: CVE-2019-5188
-Signed-off-by: Theodore Ts'o <tytso@mit.edu>
-
-CVE: CVE-2019-5188
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/commit/?id=8dd73c149f418238f19791f9d666089ef9734dff]
----
- e2fsck/rehash.c | 9 +++++++++
- 1 file changed, 9 insertions(+)
-
-diff --git a/e2fsck/rehash.c b/e2fsck/rehash.c
-index a5fc1be1..3dd1e941 100644
---- a/e2fsck/rehash.c
-+++ b/e2fsck/rehash.c
-@@ -160,6 +160,10 @@ static int fill_dir_block(ext2_filsys fs,
- 		dir_offset += rec_len;
- 		if (dirent->inode == 0)
- 			continue;
-+		if ((name_len) == 0) {
-+			fd->err = EXT2_ET_DIR_CORRUPTED;
-+			return BLOCK_ABORT;
-+		}
- 		if (!fd->compress && (name_len == 1) &&
- 		    (dirent->name[0] == '.'))
- 			continue;
-@@ -401,6 +405,11 @@ static int duplicate_search_and_fix(e2fsck_t ctx, ext2_filsys fs,
- 			continue;
- 		}
- 		new_len = ext2fs_dirent_name_len(ent->dir);
-+		if (new_len == 0) {
-+			 /* should never happen */
-+			ext2fs_unmark_valid(fs);
-+			continue;
-+		}
- 		memcpy(new_name, ent->dir->name, new_len);
- 		mutate_name(new_name, &new_len);
- 		for (j=0; j < fd->num_array; j++) {
--- 
-2.24.1
-
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsck-fix-use-after-free-in-calculate_tree.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsck-fix-use-after-free-in-calculate_tree.patch
deleted file mode 100644
index 342a2b855b..0000000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsck-fix-use-after-free-in-calculate_tree.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From: Wang Shilong <wshilong@ddn.com>
-Date: Mon, 30 Dec 2019 19:52:39 -0500
-Subject: e2fsck: fix use after free in calculate_tree()
-
-The problem is alloc_blocks() will call get_next_block() which might
-reallocate outdir->buf, and memory address could be changed after
-this.  To fix this, pointers that point into outdir->buf, such as
-int_limit and root need to be recaulated based on the new starting
-address of outdir->buf.
-
-[ Changed to correctly recalculate int_limit, and to optimize how we
-  reallocate outdir->buf.  -TYT ]
-
-Addresses-Debian-Bug: 948517
-Signed-off-by: Wang Shilong <wshilong@ddn.com>
-Signed-off-by: Theodore Ts'o <tytso@mit.edu>
-(cherry picked from commit 101e73e99ccafa0403fcb27dd7413033b587ca01)
-
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/commit/?id=101e73e99ccafa0403fcb27dd7413033b587ca01]
----
- e2fsck/rehash.c | 17 ++++++++++++++++-
- 1 file changed, 16 insertions(+), 1 deletion(-)
-
-diff --git a/e2fsck/rehash.c b/e2fsck/rehash.c
-index 0a5888a9..2574e151 100644
---- a/e2fsck/rehash.c
-+++ b/e2fsck/rehash.c
-@@ -295,7 +295,11 @@ static errcode_t get_next_block(ext2_filsys fs, struct out_dir *outdir,
- 	errcode_t	retval;
- 
- 	if (outdir->num >= outdir->max) {
--		retval = alloc_size_dir(fs, outdir, outdir->max + 50);
-+		int increment = outdir->max / 10;
-+
-+		if (increment < 50)
-+			increment = 50;
-+		retval = alloc_size_dir(fs, outdir, outdir->max + increment);
- 		if (retval)
- 			return retval;
- 	}
-@@ -637,6 +641,9 @@ static int alloc_blocks(ext2_filsys fs,
- 	if (retval)
- 		return retval;
- 
-+	/* outdir->buf might be reallocated */
-+	*prev_ent = (struct ext2_dx_entry *) (outdir->buf + *prev_offset);
-+
- 	*next_ent = set_int_node(fs, block_start);
- 	*limit = (struct ext2_dx_countlimit *)(*next_ent);
- 	if (next_offset)
-@@ -726,6 +733,9 @@ static errcode_t calculate_tree(ext2_filsys fs,
- 					return retval;
- 			}
- 			if (c3 == 0) {
-+				int delta1 = (char *)int_limit - outdir->buf;
-+				int delta2 = (char *)root - outdir->buf;
-+
- 				retval = alloc_blocks(fs, &limit, &int_ent,
- 						      &dx_ent, &int_offset,
- 						      NULL, outdir, i, &c2,
-@@ -733,6 +743,11 @@ static errcode_t calculate_tree(ext2_filsys fs,
- 				if (retval)
- 					return retval;
- 
-+				/* outdir->buf might be reallocated */
-+				int_limit = (struct ext2_dx_countlimit *)
-+					(outdir->buf + delta1);
-+				root = (struct ext2_dx_entry *)
-+					(outdir->buf + delta2);
- 			}
- 			dx_ent->block = ext2fs_cpu_to_le32(i);
- 			if (c3 != limit->limit)
--- 
-2.24.1
-
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch
index 4d335af4cf..284ac90196 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch
@@ -1,4 +1,4 @@
-From e8331a76983e839a3d193446ab8ae9c1b09daa07 Mon Sep 17 00:00:00 2001
+From b55dfb4b62e507ae4f0814aec7597b56f9d6292a Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Wed, 10 Aug 2016 11:19:44 +0800
 Subject: [PATCH] Fix missing check for permission denied.
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
index 95e6a7a2d5..aac88eed98 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
@@ -1,4 +1,4 @@
-From de6d6f0dd010f5b9d917553acb9430278f448f23 Mon Sep 17 00:00:00 2001
+From 9aa68ad81b97847dda3493145f4b0a7cc580c551 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Mon, 23 Dec 2013 13:38:34 +0000
 Subject: [PATCH] e2fsprogs: silence debugfs
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.4.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb
similarity index 94%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.4.bb
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb
index 2eae9cd892..4f5ad78154 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.4.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb
@@ -4,12 +4,8 @@ SRC_URI += "file://remove.ldconfig.call.patch \
            file://run-ptest \
            file://ptest.patch \
            file://mkdir_p.patch \
-           file://0001-misc-create_inode.c-set-dir-s-mode-correctly.patch \
            file://0001-configure.ac-correct-AM_GNU_GETTEXT.patch \
            file://0001-intl-do-not-try-to-use-gettext-defines-that-no-longe.patch \
-           file://CVE-2019-5188.patch \
-           file://0001-e2fsck-don-t-try-to-rehash-a-deleted-directory.patch \
-           file://e2fsck-fix-use-after-free-in-calculate_tree.patch \
            "
 
 SRC_URI_append_class-native = " file://e2fsprogs-fix-missing-check-for-permission-denied.patch \
@@ -17,7 +13,7 @@ SRC_URI_append_class-native = " file://e2fsprogs-fix-missing-check-for-permissio
                                 file://big-inodes-for-small-fs.patch \
 "
 
-SRCREV = "984ff8d6a0a1d5dc300505f67b38ed5047d51dac"
+SRCREV = "506d96fe640f76ab04276e0a7c578aa108ce19f8"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+(\.\d+)*)$"
 
 EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
-- 
2.25.1


