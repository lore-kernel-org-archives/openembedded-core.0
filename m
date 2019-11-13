Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id A4D297F7B0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:32:25 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id r4so1893637pfl.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=5VNTrcjy3K6kZvfv6FsTv/N/gn7vve/wWQhPyiOzdIs=;
	b=KvQfok8cPGnO4Cf2ytaOq7zA3DIfPHA3lQiSNlEPRHS9AH75KB8YqADoOmfMeC99Bm
	+dZd6tO+lj4xjmDwfqlqAkQ61L4lKtaurQU0w/gVftT8hYyo8ei0yqUq/ZlOKpItE99r
	s3aBeyLjEiSQdWnyh8ZM31593g+/e+mw5AHqi95RS+nHu91TKVEf9//c+HEMpUoSOvXc
	hnAxxDxCJdJtDpC0nEzv4/rSVYbxyIghHM57tVR0ktDFz+0xLqB75Sxj2bQDwpLBDlPe
	nxLsyViJRvDLOiDUg/F5wWHZ/omGQ9peFWQ6sXIHRH7IinEcoRpiKf6Nlkgu3QM2gEag
	FW8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=5VNTrcjy3K6kZvfv6FsTv/N/gn7vve/wWQhPyiOzdIs=;
	b=d15nJR0fMWJPO1XdJaQlxzoOPUwuJL9Wwa/9WgCXoVIF8bnmalNpMeQgmK+tq8cM6W
	gVC+M/O2dYd3nXkn9ZgW9VhltR4amR4hvvfhe1/U5dJZjL4eM4OP1Lunw69Y0chRDBxi
	rRt34jwf5Lt/lisKx7B8kqsHJVdW49sUmuuMDwuovE7WkFdNFf5ceSN4MZvw4mMbAIbi
	2QugN+JpaPgdLIY8ZSYeJ9Xl5lPbK0KD8GwGe9rkpapEWHXdZiFTuUITB3dy5DF7gQXu
	mkXso1t/mxAITSkGVChVDBahLPm22CL4xsUePi+wg4gYUnknUb9V4so9auf20y28hLh5
	yA0Q==
X-Gm-Message-State: APjAAAWJHlbQFMwIExfUdNUbPzFDzIJ9GYeg0pTMGYgUsetpTSlW8rqN
	jnd4/gTVa5OqIcayBJwegLmnECsV
X-Google-Smtp-Source: APXvYqzgZo43ohYuYHd+WCh+55HhcQ3G8ynt9bOLkk1K96c3N/qyL7kvr7XWOgH0H8JbuCPQbxPsMA==
X-Received: by 2002:a17:90a:b292:: with SMTP id
	c18mr5785390pjr.107.1573659146414; 
	Wed, 13 Nov 2019 07:32:26 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id
	s18sm3713613pfm.27.2019.11.13.07.32.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Nov 2019 07:32:25 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 07:31:43 -0800
Message-Id: <56f38b042d68528009283491b9d40c75f13b8f16.1573658916.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573658915.git.akuster808@gmail.com>
References: <cover.1573658915.git.akuster808@gmail.com>
Subject: [zeus 01/31] e2fsprogs: fix CVE-2019-5094
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Nov 2019 15:32:25 -0000

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../e2fsprogs/e2fsprogs/CVE-2019-5094.patch        | 217 +++++++++++++++++++++
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.45.3.bb |   1 +
 2 files changed, 218 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/CVE-2019-5094.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/CVE-2019-5094.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/CVE-2019-5094.patch
new file mode 100644
index 0000000..56925cb
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/CVE-2019-5094.patch
@@ -0,0 +1,217 @@
+From 8dbe7b475ec5e91ed767239f0e85880f416fc384 Mon Sep 17 00:00:00 2001
+From: Theodore Ts'o <tytso@mit.edu>
+Date: Sun, 1 Sep 2019 00:59:16 -0400
+Subject: libsupport: add checks to prevent buffer overrun bugs in quota code
+
+A maliciously corrupted file systems can trigger buffer overruns in
+the quota code used by e2fsck.  To fix this, add sanity checks to the
+quota header fields as well as to block number references in the quota
+tree.
+
+Addresses: CVE-2019-5094
+Addresses: TALOS-2019-0887
+Signed-off-by: Theodore Ts'o <tytso@mit.edu>
+
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/commit/?h=maint&id=8dbe7b475ec5e91ed767239f0e85880f416fc384]
+CVE: CVE-2019-5094
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ lib/support/mkquota.c      |  1 +
+ lib/support/quotaio_tree.c | 71 ++++++++++++++++++++++++++++++----------------
+ lib/support/quotaio_v2.c   | 28 ++++++++++++++++++
+ 3 files changed, 76 insertions(+), 24 deletions(-)
+
+diff --git a/lib/support/mkquota.c b/lib/support/mkquota.c
+index 0b9e7665..ddb53124 100644
+--- a/lib/support/mkquota.c
++++ b/lib/support/mkquota.c
+@@ -671,6 +671,7 @@ errcode_t quota_compare_and_update(quota_ctx_t qctx, enum quota_type qtype,
+ 	err = qh.qh_ops->scan_dquots(&qh, scan_dquots_callback, &scan_data);
+ 	if (err) {
+ 		log_debug("Error scanning dquots");
++		*usage_inconsistent = 1;
+ 		goto out_close_qh;
+ 	}
+ 
+diff --git a/lib/support/quotaio_tree.c b/lib/support/quotaio_tree.c
+index a7c2028c..6cc4fb5b 100644
+--- a/lib/support/quotaio_tree.c
++++ b/lib/support/quotaio_tree.c
+@@ -540,6 +540,17 @@ struct dquot *qtree_read_dquot(struct quota_handle *h, qid_t id)
+ 	return dquot;
+ }
+ 
++static int check_reference(struct quota_handle *h, unsigned int blk)
++{
++	if (blk >= h->qh_info.u.v2_mdqi.dqi_qtree.dqi_blocks) {
++		log_err("Illegal reference (%u >= %u) in %s quota file",
++			blk, h->qh_info.u.v2_mdqi.dqi_qtree.dqi_blocks,
++			quota_type2name(h->qh_type));
++		return -1;
++	}
++	return 0;
++}
++
+ /*
+  * Scan all dquots in file and call callback on each
+  */
+@@ -558,7 +569,7 @@ static int report_block(struct dquot *dquot, unsigned int blk, char *bitmap,
+ 	int entries, i;
+ 
+ 	if (!buf)
+-		return 0;
++		return -1;
+ 
+ 	set_bit(bitmap, blk);
+ 	read_blk(dquot->dq_h, blk, buf);
+@@ -580,23 +591,12 @@ static int report_block(struct dquot *dquot, unsigned int blk, char *bitmap,
+ 	return entries;
+ }
+ 
+-static void check_reference(struct quota_handle *h, unsigned int blk)
+-{
+-	if (blk >= h->qh_info.u.v2_mdqi.dqi_qtree.dqi_blocks)
+-		log_err("Illegal reference (%u >= %u) in %s quota file. "
+-			"Quota file is probably corrupted.\n"
+-			"Please run e2fsck (8) to fix it.",
+-			blk,
+-			h->qh_info.u.v2_mdqi.dqi_qtree.dqi_blocks,
+-			quota_type2name(h->qh_type));
+-}
+-
+ static int report_tree(struct dquot *dquot, unsigned int blk, int depth,
+ 		       char *bitmap,
+ 		       int (*process_dquot) (struct dquot *, void *),
+ 		       void *data)
+ {
+-	int entries = 0, i;
++	int entries = 0, ret, i;
+ 	dqbuf_t buf = getdqbuf();
+ 	__le32 *ref = (__le32 *) buf;
+ 
+@@ -607,22 +607,40 @@ static int report_tree(struct dquot *dquot, unsigned int blk, int depth,
+ 	if (depth == QT_TREEDEPTH - 1) {
+ 		for (i = 0; i < QT_BLKSIZE >> 2; i++) {
+ 			blk = ext2fs_le32_to_cpu(ref[i]);
+-			check_reference(dquot->dq_h, blk);
+-			if (blk && !get_bit(bitmap, blk))
+-				entries += report_block(dquot, blk, bitmap,
+-							process_dquot, data);
++			if (check_reference(dquot->dq_h, blk)) {
++				entries = -1;
++				goto errout;
++			}
++			if (blk && !get_bit(bitmap, blk)) {
++				ret = report_block(dquot, blk, bitmap,
++						   process_dquot, data);
++				if (ret < 0) {
++					entries = ret;
++					goto errout;
++				}
++				entries += ret;
++			}
+ 		}
+ 	} else {
+ 		for (i = 0; i < QT_BLKSIZE >> 2; i++) {
+ 			blk = ext2fs_le32_to_cpu(ref[i]);
+ 			if (blk) {
+-				check_reference(dquot->dq_h, blk);
+-				entries += report_tree(dquot, blk, depth + 1,
+-						       bitmap, process_dquot,
+-						       data);
++				if (check_reference(dquot->dq_h, blk)) {
++					entries = -1;
++					goto errout;
++				}
++				ret = report_tree(dquot, blk, depth + 1,
++						  bitmap, process_dquot,
++						  data);
++				if (ret < 0) {
++					entries = ret;
++					goto errout;
++				}
++				entries += ret;
+ 			}
+ 		}
+ 	}
++errout:
+ 	freedqbuf(buf);
+ 	return entries;
+ }
+@@ -642,6 +660,7 @@ int qtree_scan_dquots(struct quota_handle *h,
+ 		      int (*process_dquot) (struct dquot *, void *),
+ 		      void *data)
+ {
++	int ret;
+ 	char *bitmap;
+ 	struct v2_mem_dqinfo *v2info = &h->qh_info.u.v2_mdqi;
+ 	struct qtree_mem_dqinfo *info = &v2info->dqi_qtree;
+@@ -655,10 +674,14 @@ int qtree_scan_dquots(struct quota_handle *h,
+ 		ext2fs_free_mem(&dquot);
+ 		return -1;
+ 	}
+-	v2info->dqi_used_entries = report_tree(dquot, QT_TREEOFF, 0, bitmap,
+-					       process_dquot, data);
++	ret = report_tree(dquot, QT_TREEOFF, 0, bitmap, process_dquot, data);
++	if (ret < 0)
++		goto errout;
++	v2info->dqi_used_entries = ret;
+ 	v2info->dqi_data_blocks = find_set_bits(bitmap, info->dqi_blocks);
++	ret = 0;
++errout:
+ 	ext2fs_free_mem(&bitmap);
+ 	ext2fs_free_mem(&dquot);
+-	return 0;
++	return ret;
+ }
+diff --git a/lib/support/quotaio_v2.c b/lib/support/quotaio_v2.c
+index 38be2a34..73906676 100644
+--- a/lib/support/quotaio_v2.c
++++ b/lib/support/quotaio_v2.c
+@@ -175,6 +175,8 @@ static int v2_check_file(struct quota_handle *h, int type, int fmt)
+ static int v2_init_io(struct quota_handle *h)
+ {
+ 	struct v2_disk_dqinfo ddqinfo;
++	struct v2_mem_dqinfo *info;
++	__u64 filesize;
+ 
+ 	h->qh_info.u.v2_mdqi.dqi_qtree.dqi_entry_size =
+ 		sizeof(struct v2r1_disk_dqblk);
+@@ -185,6 +187,32 @@ static int v2_init_io(struct quota_handle *h)
+ 			 sizeof(ddqinfo)) != sizeof(ddqinfo))
+ 		return -1;
+ 	v2_disk2memdqinfo(&h->qh_info, &ddqinfo);
++
++	/* Check to make sure quota file info is sane */
++	info = &h->qh_info.u.v2_mdqi;
++	if (ext2fs_file_get_lsize(h->qh_qf.e2_file, &filesize))
++		return -1;
++	if ((filesize > (1U << 31)) ||
++	    (info->dqi_qtree.dqi_blocks >
++	     (filesize + QT_BLKSIZE - 1) >> QT_BLKSIZE_BITS)) {
++		log_err("Quota inode %u corrupted: file size %llu; "
++			"dqi_blocks %u", h->qh_qf.ino,
++			filesize, info->dqi_qtree.dqi_blocks);
++		return -1;
++	}
++	if (info->dqi_qtree.dqi_free_blk >= info->dqi_qtree.dqi_blocks) {
++		log_err("Quota inode %u corrupted: free_blk %u; dqi_blocks %u",
++			h->qh_qf.ino, info->dqi_qtree.dqi_free_blk,
++			info->dqi_qtree.dqi_blocks);
++		return -1;
++	}
++	if (info->dqi_qtree.dqi_free_entry >= info->dqi_qtree.dqi_blocks) {
++		log_err("Quota inode %u corrupted: free_entry %u; "
++			"dqi_blocks %u", h->qh_qf.ino,
++			info->dqi_qtree.dqi_free_entry,
++			info->dqi_qtree.dqi_blocks);
++		return -1;
++	}
+ 	return 0;
+ }
+ 
+-- 
+cgit 1.2-0.3.lf.el7
+
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.3.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.3.bb
index fdc9454..14c05a4 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.3.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.3.bb
@@ -5,6 +5,7 @@ SRC_URI += "file://remove.ldconfig.call.patch \
             file://ptest.patch \
             file://mkdir_p.patch \
             file://0001-misc-create_inode.c-set-dir-s-mode-correctly.patch \
+            file://CVE-2019-5094.patch \
             "
 
 SRC_URI_append_class-native = " file://e2fsprogs-fix-missing-check-for-permission-denied.patch \
-- 
2.7.4


