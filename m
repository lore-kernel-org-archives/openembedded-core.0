Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E14FDC433FE
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 12:12:56 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.9999.1647346375462611784
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 05:12:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vdAQkPD2;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647346373; i=@fujitsu.com;
	bh=/BH15yGDuy0XBgBPze2kMgdkENU2mNgWEz2vRY4OXLo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=vdAQkPD2VtDZykGy0wFgEr46s2CR88Zy7vXwGQRqXRSRlMr5e3s9naELUVxuruXaN
	 HDqt2woU7edEnmMDFBZgNu4MUjrRJFHN3uC7MMgp48EfLGpvZnFyxS5c6zToG2NcjZ
	 TQLxWzAWpeVxy7p8ET1i6uE4bBi2UXOcyBEE/nPfEcSxR7kFifzuQFL0pgFpmdFosw
	 Bd5VnfFWPuU1sTq2m8DQPbomLpMJZNtwNgkTK0oKNqU18umBHAVXSv8VHHn4HY/PA+
	 brn/AsjCb7TK7HcHT19QkEkQMCBkQLzMwib4X+NtHG+h74zdX+wqrn3YYGOxTbdz9g
	 j6mgOQaBesaXQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8MxRfdok0G
  Swf2tXBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bnZbOYCz68YazYc3wqSwPjkcuMXYxcHEIC
  M5gkZj37zwrhnGCUuNe8mqmLkZODTUBNYvqtG0AJDg4RAT2Jq/9EQcLMAioSL373sIPYwgJOE
  ldPbWIBsVkEVCUmH97JCGLzAsW/tB8Hq5EQUJCY8vA9M4jNKeAs0TilDywuBFRz/OANqHpBiZ
  Mzn7BAzJeQOPjiBTNEr6LE7MvNLBB2hcSsWW1MExj5ZyFpmYWkZQEj0ypG66SizPSMktzEzBx
  dQwMDXUNDU11jE10jQwu9xCrdRL3UUt3y1OISXSO9xPJivdTiYr3iytzknBS9vNSSTYzAwEwp
  Vrq1g3HDqp96hxglOZiURHkLyw2ShPiS8lMqMxKLM+KLSnNSiw8xynBwKEnwptQD5QSLUtNTK
  9Iyc4BRApOW4OBREuF9WQqU5i0uSMwtzkyHSJ1itOfYd+DKXmaOq1dA5A0wueD3tb3MQix5+X
  mpUuK8asC4FBIAacsozYMbCovqS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEed1BpvBk5pX
  A7X4FdBYT0FnzpPVAzipJREhJNTBt5pd4/z/sknbXgy/XH8dv6T0cEzNp+f9TsffjNSUVA75k
  7WE5e/DH3xyNabbFVTadt8uOFDZ6r/2xNObH4i0Ok6ZqmD38t18vYzHbdavD1Xrnzyt+ivE57
  Olg6J/S/erUx4jM95deBn3he+5/aGUGa4G0TFimvSevwlTTiL0KS9pPP5ISkD/x8bLoWzlm5h
  UtuhGbtxor3pCYm8++tY/jusL+3i1P+u5v9m6d4Rz3/fdsBpln3Zv5G/P/mm7c9+BQ43qNfkW
  1b1ZvVp04FJz2+L4G4yF3wwOti2VDdlu8eep+iu31vpd+qp8bdnhF3D1+ymG7797gnrUG6rcZ
  O+f6GQdE1Xukhm9485GRacceJZbijERDLeai4kQA0ApG22UDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-565.messagelabs.com!1647346372!20086!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24357 invoked from network); 15 Mar 2022 12:12:53 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-10.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Mar 2022 12:12:53 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 22FCClF5010308
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 12:12:52 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 15 Mar 2022 12:12:48 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] lttng-modules: upgrade 2.13.1 -> 2.13.2
Date: Tue, 15 Mar 2022 20:12:29 +0800
Message-ID: <1647346351-79061-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1647346351-79061-1-git-send-email-wangmy@fujitsu.com>
References: <1647346351-79061-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 12:12:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163238

The following patches removed since they're included in 2.13.2
0001-fix-block-remove-GENHD_FL_SUPPRESS_PARTITION_INFO-v5.patch
0002-fix-block-remove-the-rq_disk-field-in-struct-request.patch
0003-fix-mm-compaction-fix-the-migration-stats-in-trace_m.patch
0004-fix-btrfs-pass-fs_info-to-trace_btrfs_transaction_co.patch
0005-fix-random-rather-than-entropy_store-abstraction-use.patch
0006-fix-net-skb-introduce-kfree_skb_reason-v5.17.patch
0007-fix-net-socket-rename-SKB_DROP_REASON_SOCKET_FILTER-.patch

Changelog:
=========
* Fix: incorrect in/out direction for syscall exit
* fix: net: socket: rename SKB_DROP_REASON_SOCKET_FILTER (v5.17)
* fix: net: skb: introduce kfree_skb_reason() (v5.17)
* fix: random: rather than entropy_store abstraction, use global (v5.17)
* fix: btrfs: pass fs_info to trace_btrfs_transaction_commit (v5.17)
* fix: mm: compaction: fix the migration stats in trace_mm_compaction_migratepages() (v5.17)
* fix: block: remove the ->rq_disk field in struct request (v5.17)
* fix: block: remove GENHD_FL_SUPPRESS_PARTITION_INFO (v5.17)
* Copyright ownership transfer

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-GENHD_FL_SUPPRESS_PARTITION_INFO-v5.patch |  63 -------
 ...-the-rq_disk-field-in-struct-request.patch | 157 ------------------
 ...n-fix-the-migration-stats-in-trace_m.patch |  61 -------
 ...s_info-to-trace_btrfs_transaction_co.patch | 103 ------------
 ...r-than-entropy_store-abstraction-use.patch | 147 ----------------
 ...skb-introduce-kfree_skb_reason-v5.17.patch |  88 ----------
 ...ename-SKB_DROP_REASON_SOCKET_FILTER-.patch |  47 ------
 ...ules_2.13.1.bb => lttng-modules_2.13.2.bb} |  12 +-
 8 files changed, 2 insertions(+), 676 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-block-remove-GENHD_FL_SUPPRESS_PARTITION_INFO-v5.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-fix-block-remove-the-rq_disk-field-in-struct-request.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-fix-mm-compaction-fix-the-migration-stats-in-trace_m.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0004-fix-btrfs-pass-fs_info-to-trace_btrfs_transaction_co.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0005-fix-random-rather-than-entropy_store-abstraction-use.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0006-fix-net-skb-introduce-kfree_skb_reason-v5.17.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0007-fix-net-socket-rename-SKB_DROP_REASON_SOCKET_FILTER-.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.13.1.bb => lttng-modules_2.13.2.bb} (68%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-block-remove-GENHD_FL_SUPPRESS_PARTITION_INFO-v5.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-block-remove-GENHD_FL_SUPPRESS_PARTITION_INFO-v5.patch
deleted file mode 100644
index 61c56c84ce..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-block-remove-GENHD_FL_SUPPRESS_PARTITION_INFO-v5.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From a88ee460b93c67ca756bd91ee9a8660813f65bd8 Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Sun, 23 Jan 2022 13:04:47 -0500
-Subject: [PATCH 1/7] fix: block: remove GENHD_FL_SUPPRESS_PARTITION_INFO
- (v5.17)
-
-See upstream commit :
-
-  commit 3b5149ac50970669ee0ddb9629ec77ffd5c0622d
-  Author: Christoph Hellwig <hch@lst.de>
-  Date:   Mon Nov 22 14:06:21 2021 +0100
-
-    block: remove GENHD_FL_SUPPRESS_PARTITION_INFO
-
-    This flag is not set directly anywhere and only inherited from
-    GENHD_FL_HIDDEN.  Just check for GENHD_FL_HIDDEN instead.
-
-    Link: https://lore.kernel.org/r/20211122130625.1136848-11-hch@lst.de
-
-
-Upstream-Status: Backport [lttng-modules commit a88ee460b93c67ca756bd91ee9a8660813f65bd8]
-
-Change-Id: Ide92bdaaff7d16e96be23aaf00cebeaa601235b7
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- include/wrapper/genhd.h    | 6 ++++++
- src/lttng-statedump-impl.c | 2 +-
- 2 files changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/include/wrapper/genhd.h b/include/wrapper/genhd.h
-index 68980388..3c6dbcbe 100644
---- a/include/wrapper/genhd.h
-+++ b/include/wrapper/genhd.h
-@@ -14,6 +14,12 @@
- 
- #include <linux/genhd.h>
- 
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,17,0))
-+#define LTTNG_GENHD_FL_HIDDEN GENHD_FL_HIDDEN
-+#else
-+#define LTTNG_GENHD_FL_HIDDEN GENHD_FL_SUPPRESS_PARTITION_INFO
-+#endif
-+
- #ifdef CONFIG_KALLSYMS_ALL
- 
- #include <linux/kallsyms.h>
-diff --git a/src/lttng-statedump-impl.c b/src/lttng-statedump-impl.c
-index c5fca89d..4d7b2921 100644
---- a/src/lttng-statedump-impl.c
-+++ b/src/lttng-statedump-impl.c
-@@ -334,7 +334,7 @@ int lttng_enumerate_block_devices(struct lttng_kernel_session *session)
- 		 * suppressed
- 		 */
- 		if (get_capacity(disk) == 0 ||
--		    (disk->flags & GENHD_FL_SUPPRESS_PARTITION_INFO))
-+		    (disk->flags & LTTNG_GENHD_FL_HIDDEN))
- 			continue;
- 
- 		ret = lttng_statedump_each_block_device(session, disk);
--- 
-2.19.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0002-fix-block-remove-the-rq_disk-field-in-struct-request.patch b/meta/recipes-kernel/lttng/lttng-modules/0002-fix-block-remove-the-rq_disk-field-in-struct-request.patch
deleted file mode 100644
index 37a169a2e9..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0002-fix-block-remove-the-rq_disk-field-in-struct-request.patch
+++ /dev/null
@@ -1,157 +0,0 @@
-From 4b1945d3c055de4b49e310f799e6f92c57546349 Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Sun, 23 Jan 2022 13:11:47 -0500
-Subject: [PATCH 2/7] fix: block: remove the ->rq_disk field in struct request
- (v5.17)
-
-See upstream commit :
-
-  commit f3fa33acca9f0058157214800f68b10d8e71ab7a
-  Author: Christoph Hellwig <hch@lst.de>
-  Date:   Fri Nov 26 13:18:00 2021 +0100
-
-    block: remove the ->rq_disk field in struct request
-
-    Just use the disk attached to the request_queue instead.
-
-    Link: https://lore.kernel.org/r/20211126121802.2090656-4-hch@lst.de
-
-Upstream-Status: Backport [lttng-modules commit 4b1945d3c055de4b49e310f799e6f92c57546349]
-
-Change-Id: I24263be519d1b51f4b00bd95f14a9aeb8457889a
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- include/instrumentation/events/block.h | 95 ++++++++++++++++++++++++--
- 1 file changed, 91 insertions(+), 4 deletions(-)
-
-diff --git a/include/instrumentation/events/block.h b/include/instrumentation/events/block.h
-index 6782c36f..3e1104d7 100644
---- a/include/instrumentation/events/block.h
-+++ b/include/instrumentation/events/block.h
-@@ -310,7 +310,31 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(block_rq_with_error, block_rq_abort,
- )
- #endif
- 
--#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,11,0))
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,17,0))
-+/**
-+ * block_rq_requeue - place block IO request back on a queue
-+ * @rq: block IO operation request
-+ *
-+ * The block operation request @rq is being placed back into queue
-+ * @q.  For some reason the request was not completed and needs to be
-+ * put back in the queue.
-+ */
-+LTTNG_TRACEPOINT_EVENT(block_rq_requeue,
-+
-+	TP_PROTO(struct request *rq),
-+
-+	TP_ARGS(rq),
-+
-+	TP_FIELDS(
-+		ctf_integer(dev_t, dev,
-+			rq->q->disk ? disk_devt(rq->q->disk) : 0)
-+		ctf_integer(sector_t, sector, blk_rq_trace_sector(rq))
-+		ctf_integer(unsigned int, nr_sector, blk_rq_trace_nr_sectors(rq))
-+		blk_rwbs_ctf_integer(unsigned int, rwbs,
-+			lttng_req_op(rq), lttng_req_rw(rq), blk_rq_bytes(rq))
-+	)
-+)
-+#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,11,0))
- /**
-  * block_rq_requeue - place block IO request back on a queue
-  * @rq: block IO operation request
-@@ -380,7 +404,24 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(block_rq_with_error, block_rq_requeue,
-  * do for the request. If @rq->bio is non-NULL then there is
-  * additional work required to complete the request.
-  */
--#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,16,0))
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,17,0))
-+LTTNG_TRACEPOINT_EVENT(block_rq_complete,
-+
-+	TP_PROTO(struct request *rq, blk_status_t error, unsigned int nr_bytes),
-+
-+	TP_ARGS(rq, error, nr_bytes),
-+
-+	TP_FIELDS(
-+		ctf_integer(dev_t, dev,
-+			rq->q->disk ? disk_devt(rq->q->disk) : 0)
-+		ctf_integer(sector_t, sector, blk_rq_pos(rq))
-+		ctf_integer(unsigned int, nr_sector, nr_bytes >> 9)
-+		ctf_integer(int, error, blk_status_to_errno(error))
-+		blk_rwbs_ctf_integer(unsigned int, rwbs,
-+			lttng_req_op(rq), lttng_req_rw(rq), nr_bytes)
-+	)
-+)
-+#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,16,0))
- LTTNG_TRACEPOINT_EVENT(block_rq_complete,
- 
- 	TP_PROTO(struct request *rq, blk_status_t error, unsigned int nr_bytes),
-@@ -519,7 +560,26 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(block_rq_with_error, block_rq_complete,
- 
- #endif /* #else #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(3,15,0)) */
- 
--#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,11,0))
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,17,0))
-+LTTNG_TRACEPOINT_EVENT_CLASS(block_rq,
-+
-+	TP_PROTO(struct request *rq),
-+
-+	TP_ARGS(rq),
-+
-+	TP_FIELDS(
-+		ctf_integer(dev_t, dev,
-+			rq->q->disk ? disk_devt(rq->q->disk) : 0)
-+		ctf_integer(sector_t, sector, blk_rq_trace_sector(rq))
-+		ctf_integer(unsigned int, nr_sector, blk_rq_trace_nr_sectors(rq))
-+		ctf_integer(unsigned int, bytes, blk_rq_bytes(rq))
-+		ctf_integer(pid_t, tid, current->pid)
-+		blk_rwbs_ctf_integer(unsigned int, rwbs,
-+			lttng_req_op(rq), lttng_req_rw(rq), blk_rq_bytes(rq))
-+		ctf_array_text(char, comm, current->comm, TASK_COMM_LEN)
-+	)
-+)
-+#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,11,0))
- LTTNG_TRACEPOINT_EVENT_CLASS(block_rq,
- 
- 	TP_PROTO(struct request *rq),
-@@ -1513,7 +1573,34 @@ LTTNG_TRACEPOINT_EVENT(block_bio_remap,
- )
- #endif
- 
--#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,11,0))
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,17,0))
-+/**
-+ * block_rq_remap - map request for a block operation request
-+ * @rq: block IO operation request
-+ * @dev: device for the operation
-+ * @from: original sector for the operation
-+ *
-+ * The block operation request @rq in @q has been remapped.  The block
-+ * operation request @rq holds the current information and @from hold
-+ * the original sector.
-+ */
-+LTTNG_TRACEPOINT_EVENT(block_rq_remap,
-+
-+	TP_PROTO(struct request *rq, dev_t dev, sector_t from),
-+
-+	TP_ARGS(rq, dev, from),
-+
-+	TP_FIELDS(
-+		ctf_integer(dev_t, dev, disk_devt(rq->q->disk))
-+		ctf_integer(sector_t, sector, blk_rq_pos(rq))
-+		ctf_integer(unsigned int, nr_sector, blk_rq_sectors(rq))
-+		ctf_integer(dev_t, old_dev, dev)
-+		ctf_integer(sector_t, old_sector, from)
-+		blk_rwbs_ctf_integer(unsigned int, rwbs,
-+			lttng_req_op(rq), lttng_req_rw(rq), blk_rq_bytes(rq))
-+	)
-+)
-+#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,11,0))
- /**
-  * block_rq_remap - map request for a block operation request
-  * @rq: block IO operation request
--- 
-2.19.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0003-fix-mm-compaction-fix-the-migration-stats-in-trace_m.patch b/meta/recipes-kernel/lttng/lttng-modules/0003-fix-mm-compaction-fix-the-migration-stats-in-trace_m.patch
deleted file mode 100644
index 522753be28..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0003-fix-mm-compaction-fix-the-migration-stats-in-trace_m.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From afc4fe8905620a3eb14a5ed16146dac1db0f8111 Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Sun, 23 Jan 2022 13:26:17 -0500
-Subject: [PATCH 3/7] fix: mm: compaction: fix the migration stats in
- trace_mm_compaction_migratepages() (v5.17)
-
-See upstream commit :
-
-  commit 84b328aa81216e08804d8875d63f26bda1298788
-  Author: Baolin Wang <baolin.wang@linux.alibaba.com>
-  Date:   Fri Jan 14 14:08:40 2022 -0800
-
-    mm: compaction: fix the migration stats in trace_mm_compaction_migratepages()
-
-    Now the migrate_pages() has changed to return the number of {normal
-    page, THP, hugetlb} instead, thus we should not use the return value to
-    calculate the number of pages migrated successfully.  Instead we can
-    just use the 'nr_succeeded' which indicates the number of normal pages
-    migrated successfully to calculate the non-migrated pages in
-    trace_mm_compaction_migratepages().
-
-    Link: https://lkml.kernel.org/r/b4225251c4bec068dcd90d275ab7de88a39e2bd7.1636275127.git.baolin.wang@linux.alibaba.com
-
-Upstream-Status: Backport [lttng-modules commit afc4fe8905620a3eb14a5ed16146dac1db0f8111]
-
-Change-Id: Ib8e8f2a16a273f16cd73fe63afbbfc25c0a2540c
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- include/instrumentation/events/compaction.h | 15 ++++++++++++++-
- 1 file changed, 14 insertions(+), 1 deletion(-)
-
-diff --git a/include/instrumentation/events/compaction.h b/include/instrumentation/events/compaction.h
-index 3cc25537..340e41f5 100644
---- a/include/instrumentation/events/compaction.h
-+++ b/include/instrumentation/events/compaction.h
-@@ -97,7 +97,20 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(compaction_isolate_template,
- 
- #endif /* #else #if LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,0,0) */
- 
--#if LTTNG_KERNEL_RANGE(3,12,30, 3,13,0) || \
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,17,0))
-+LTTNG_TRACEPOINT_EVENT(mm_compaction_migratepages,
-+
-+	TP_PROTO(unsigned long nr_all,
-+		unsigned int nr_succeeded),
-+
-+	TP_ARGS(nr_all, nr_succeeded),
-+
-+	TP_FIELDS(
-+		ctf_integer(unsigned long, nr_migrated, nr_succeeded)
-+		ctf_integer(unsigned long, nr_failed, nr_all - nr_succeeded)
-+	)
-+)
-+#elif LTTNG_KERNEL_RANGE(3,12,30, 3,13,0) || \
- 	LTTNG_KERNEL_RANGE(3,14,25, 3,15,0) || \
- 	(LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(3,16,0))
- LTTNG_TRACEPOINT_EVENT_CODE_MAP(mm_compaction_migratepages,
--- 
-2.19.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0004-fix-btrfs-pass-fs_info-to-trace_btrfs_transaction_co.patch b/meta/recipes-kernel/lttng/lttng-modules/0004-fix-btrfs-pass-fs_info-to-trace_btrfs_transaction_co.patch
deleted file mode 100644
index f33d15f900..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0004-fix-btrfs-pass-fs_info-to-trace_btrfs_transaction_co.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-From c8f96e7716404549b19b9a774f5d9987325608bc Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Wed, 26 Jan 2022 14:37:52 -0500
-Subject: [PATCH 4/7] fix: btrfs: pass fs_info to
- trace_btrfs_transaction_commit (v5.17)
-
-See upstream commit :
-
-  commit 2e4e97abac4c95f8b87b2912ea013f7836a6f10b
-  Author: Josef Bacik <josef@toxicpanda.com>
-  Date:   Fri Nov 5 16:45:29 2021 -0400
-
-    btrfs: pass fs_info to trace_btrfs_transaction_commit
-
-    The root on the trans->root can be anything, and generally we're
-    committing from the transaction kthread so it's usually the tree_root.
-    Change this to just take an fs_info, and to maintain compatibility
-    simply put the ROOT_TREE_OBJECTID as the root objectid for the
-    tracepoint.  This will allow use to remove trans->root.
-
-
-Upstream-Status: Backport [lttng-modules commit c8f96e7716404549b19b9a774f5d9987325608bc]
-
-Change-Id: Ie5a4804330edabffac0714fcb9c25b8c8599e424
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- include/instrumentation/events/btrfs.h | 44 ++++++++++++++++++--------
- 1 file changed, 31 insertions(+), 13 deletions(-)
-
-diff --git a/include/instrumentation/events/btrfs.h b/include/instrumentation/events/btrfs.h
-index 0a0e085a..785f16ac 100644
---- a/include/instrumentation/events/btrfs.h
-+++ b/include/instrumentation/events/btrfs.h
-@@ -43,7 +43,19 @@ struct extent_state;
- #define lttng_fs_info_fsid fs_info->fsid
- #endif
- 
--#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,14,0) || \
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,17,0))
-+LTTNG_TRACEPOINT_EVENT(btrfs_transaction_commit,
-+
-+	TP_PROTO(const struct btrfs_fs_info *fs_info),
-+
-+	TP_ARGS(fs_info),
-+
-+	TP_FIELDS(
-+		ctf_integer(u64, generation, fs_info->generation)
-+		ctf_integer(u64, root_objectid, BTRFS_ROOT_TREE_OBJECTID)
-+	)
-+)
-+#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,14,0) || \
- 	LTTNG_SLE_KERNEL_RANGE(4,4,73,5,0,0, 4,4,73,6,0,0) || \
- 	LTTNG_SLE_KERNEL_RANGE(4,4,82,6,0,0, 4,4,82,7,0,0) || \
- 	LTTNG_SLE_KERNEL_RANGE(4,4,92,6,0,0, 4,4,92,7,0,0) || \
-@@ -59,7 +71,25 @@ LTTNG_TRACEPOINT_EVENT(btrfs_transaction_commit,
- 		ctf_integer(u64, root_objectid, root->root_key.objectid)
- 	)
- )
-+#else
-+LTTNG_TRACEPOINT_EVENT(btrfs_transaction_commit,
-+
-+	TP_PROTO(struct btrfs_root *root),
-+
-+	TP_ARGS(root),
- 
-+	TP_FIELDS(
-+		ctf_integer(u64, generation, root->fs_info->generation)
-+		ctf_integer(u64, root_objectid, root->root_key.objectid)
-+	)
-+)
-+#endif
-+
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,14,0) || \
-+	LTTNG_SLE_KERNEL_RANGE(4,4,73,5,0,0, 4,4,73,6,0,0) || \
-+	LTTNG_SLE_KERNEL_RANGE(4,4,82,6,0,0, 4,4,82,7,0,0) || \
-+	LTTNG_SLE_KERNEL_RANGE(4,4,92,6,0,0, 4,4,92,7,0,0) || \
-+	LTTNG_SLE_KERNEL_RANGE(4,4,103,6,0,0, 4,5,0,0,0,0))
- LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__inode,
- 
- 	TP_PROTO(const struct inode *inode),
-@@ -99,18 +129,6 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__inode, btrfs_inode_evict,
- 	TP_ARGS(inode)
- )
- #else
--LTTNG_TRACEPOINT_EVENT(btrfs_transaction_commit,
--
--	TP_PROTO(struct btrfs_root *root),
--
--	TP_ARGS(root),
--
--	TP_FIELDS(
--		ctf_integer(u64, generation, root->fs_info->generation)
--		ctf_integer(u64, root_objectid, root->root_key.objectid)
--	)
--)
--
- LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__inode,
- 
- 	TP_PROTO(struct inode *inode),
--- 
-2.19.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0005-fix-random-rather-than-entropy_store-abstraction-use.patch b/meta/recipes-kernel/lttng/lttng-modules/0005-fix-random-rather-than-entropy_store-abstraction-use.patch
deleted file mode 100644
index 9159e62119..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0005-fix-random-rather-than-entropy_store-abstraction-use.patch
+++ /dev/null
@@ -1,147 +0,0 @@
-From 98b7729a776bc5babb39345eeeba3cd1f60d8c9a Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Wed, 26 Jan 2022 14:53:41 -0500
-Subject: [PATCH 5/7] fix: random: rather than entropy_store abstraction, use
- global (v5.17)
-
-See upstream commit :
-
-  commit 90ed1e67e896cc8040a523f8428fc02f9b164394
-  Author: Jason A. Donenfeld <Jason@zx2c4.com>
-  Date:   Wed Jan 12 17:18:08 2022 +0100
-
-    random: rather than entropy_store abstraction, use global
-
-    Originally, the RNG used several pools, so having things abstracted out
-    over a generic entropy_store object made sense. These days, there's only
-    one input pool, and then an uneven mix of usage via the abstraction and
-    usage via &input_pool. Rather than this uneasy mixture, just get rid of
-    the abstraction entirely and have things always use the global. This
-    simplifies the code and makes reading it a bit easier.
-
-Upstream-Status: Backport [lttng-modules commit 98b7729a776bc5babb39345eeeba3cd1f60d8c9a]
-
-Change-Id: I1a2a14d7b6e69a047804e1e91e00fe002f757431
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- include/instrumentation/events/random.h | 81 ++++++++++++++++++++++++-
- 1 file changed, 80 insertions(+), 1 deletion(-)
-
-diff --git a/include/instrumentation/events/random.h b/include/instrumentation/events/random.h
-index ed05d26a..8cc88adb 100644
---- a/include/instrumentation/events/random.h
-+++ b/include/instrumentation/events/random.h
-@@ -8,6 +8,36 @@
- #include <lttng/tracepoint-event.h>
- #include <linux/writeback.h>
- 
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,17,0))
-+LTTNG_TRACEPOINT_EVENT_CLASS(random__mix_pool_bytes,
-+	TP_PROTO(int bytes, unsigned long IP),
-+
-+	TP_ARGS(bytes, IP),
-+
-+	TP_FIELDS(
-+		ctf_integer(int, bytes, bytes)
-+		ctf_integer_hex(unsigned long, IP, IP)
-+	)
-+)
-+
-+LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(random__mix_pool_bytes, mix_pool_bytes,
-+
-+	random_mix_pool_bytes,
-+
-+	TP_PROTO(int bytes, unsigned long IP),
-+
-+	TP_ARGS(bytes, IP)
-+)
-+
-+LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(random__mix_pool_bytes, mix_pool_bytes_nolock,
-+
-+	random_mix_pool_bytes_nolock,
-+
-+	TP_PROTO(int bytes, unsigned long IP),
-+
-+	TP_ARGS(bytes, IP)
-+)
-+#else
- LTTNG_TRACEPOINT_EVENT_CLASS(random__mix_pool_bytes,
- 	TP_PROTO(const char *pool_name, int bytes, unsigned long IP),
- 
-@@ -37,8 +67,24 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(random__mix_pool_bytes, mix_pool_bytes_noloc
- 
- 	TP_ARGS(pool_name, bytes, IP)
- )
-+#endif
- 
--#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,2,0))
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,17,0))
-+LTTNG_TRACEPOINT_EVENT_MAP(credit_entropy_bits,
-+
-+	random_credit_entropy_bits,
-+
-+	TP_PROTO(int bits, int entropy_count, unsigned long IP),
-+
-+	TP_ARGS(bits, entropy_count, IP),
-+
-+	TP_FIELDS(
-+		ctf_integer(int, bits, bits)
-+		ctf_integer(int, entropy_count, entropy_count)
-+		ctf_integer_hex(unsigned long, IP, IP)
-+	)
-+)
-+#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,2,0))
- LTTNG_TRACEPOINT_EVENT_MAP(credit_entropy_bits,
- 
- 	random_credit_entropy_bits,
-@@ -89,6 +135,38 @@ LTTNG_TRACEPOINT_EVENT_MAP(get_random_bytes,
- 	)
- )
- 
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,17,0))
-+LTTNG_TRACEPOINT_EVENT_CLASS(random__extract_entropy,
-+	TP_PROTO(int nbytes, int entropy_count, unsigned long IP),
-+
-+	TP_ARGS(nbytes, entropy_count, IP),
-+
-+	TP_FIELDS(
-+		ctf_integer(int, nbytes, nbytes)
-+		ctf_integer(int, entropy_count, entropy_count)
-+		ctf_integer_hex(unsigned long, IP, IP)
-+	)
-+)
-+
-+
-+LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(random__extract_entropy, extract_entropy,
-+
-+	random_extract_entropy,
-+
-+	TP_PROTO(int nbytes, int entropy_count, unsigned long IP),
-+
-+	TP_ARGS(nbytes, entropy_count, IP)
-+)
-+
-+LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(random__extract_entropy, extract_entropy_user,
-+
-+	random_extract_entropy_user,
-+
-+	TP_PROTO(int nbytes, int entropy_count, unsigned long IP),
-+
-+	TP_ARGS(nbytes, entropy_count, IP)
-+)
-+#else
- LTTNG_TRACEPOINT_EVENT_CLASS(random__extract_entropy,
- 	TP_PROTO(const char *pool_name, int nbytes, int entropy_count,
- 		 unsigned long IP),
-@@ -123,6 +201,7 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(random__extract_entropy, extract_entropy_use
- 
- 	TP_ARGS(pool_name, nbytes, entropy_count, IP)
- )
-+#endif
- 
- 
- 
--- 
-2.19.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0006-fix-net-skb-introduce-kfree_skb_reason-v5.17.patch b/meta/recipes-kernel/lttng/lttng-modules/0006-fix-net-skb-introduce-kfree_skb_reason-v5.17.patch
deleted file mode 100644
index abf74e8441..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0006-fix-net-skb-introduce-kfree_skb_reason-v5.17.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-From 6e9d0d578fdf90901507dd9f9929d0e6fcdd3211 Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Wed, 26 Jan 2022 14:49:11 -0500
-Subject: [PATCH 6/7] fix: net: skb: introduce kfree_skb_reason() (v5.17)
-
-See upstream commit :
-
-  commit c504e5c2f9648a1e5c2be01e8c3f59d394192bd3
-  Author: Menglong Dong <imagedong@tencent.com>
-  Date:   Sun Jan 9 14:36:26 2022 +0800
-
-    net: skb: introduce kfree_skb_reason()
-
-    Introduce the interface kfree_skb_reason(), which is able to pass
-    the reason why the skb is dropped to 'kfree_skb' tracepoint.
-
-    Add the 'reason' field to 'trace_kfree_skb', therefor user can get
-    more detail information about abnormal skb with 'drop_monitor' or
-    eBPF.
-
-    All drop reasons are defined in the enum 'skb_drop_reason', and
-    they will be print as string in 'kfree_skb' tracepoint in format
-    of 'reason: XXX'.
-
-    ( Maybe the reasons should be defined in a uapi header file, so that
-    user space can use them? )
-
-Upstream-Status: Backport [lttng-modules commit 6e9d0d578fdf90901507dd9f9929d0e6fcdd3211]
-
-Change-Id: I6766678a288da959498a4736fc3f95bf239c3e94
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- include/instrumentation/events/skb.h | 31 ++++++++++++++++++++++++++++
- 1 file changed, 31 insertions(+)
-
-diff --git a/include/instrumentation/events/skb.h b/include/instrumentation/events/skb.h
-index d6579363..c6d7095d 100644
---- a/include/instrumentation/events/skb.h
-+++ b/include/instrumentation/events/skb.h
-@@ -13,6 +13,36 @@
- /*
-  * Tracepoint for free an sk_buff:
-  */
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,17,0))
-+LTTNG_TRACEPOINT_ENUM(skb_drop_reason,
-+	TP_ENUM_VALUES(
-+		ctf_enum_value("NOT_SPECIFIED",	SKB_DROP_REASON_NOT_SPECIFIED)
-+		ctf_enum_value("NO_SOCKET",	SKB_DROP_REASON_NO_SOCKET)
-+		ctf_enum_value("PKT_TOO_SMALL",	SKB_DROP_REASON_PKT_TOO_SMALL)
-+		ctf_enum_value("TCP_CSUM",	SKB_DROP_REASON_TCP_CSUM)
-+		ctf_enum_value("TCP_FILTER",	SKB_DROP_REASON_TCP_FILTER)
-+		ctf_enum_value("UDP_CSUM",	SKB_DROP_REASON_UDP_CSUM)
-+		ctf_enum_value("MAX",		SKB_DROP_REASON_MAX)
-+	)
-+)
-+
-+LTTNG_TRACEPOINT_EVENT_MAP(kfree_skb,
-+
-+	skb_kfree,
-+
-+	TP_PROTO(struct sk_buff *skb, void *location,
-+		enum skb_drop_reason reason),
-+
-+	TP_ARGS(skb, location, reason),
-+
-+	TP_FIELDS(
-+		ctf_integer_hex(void *, skbaddr, skb)
-+		ctf_integer_hex(void *, location, location)
-+		ctf_integer_network(unsigned short, protocol, skb->protocol)
-+		ctf_enum(skb_drop_reason, uint8_t, reason, reason)
-+	)
-+)
-+#else
- LTTNG_TRACEPOINT_EVENT_MAP(kfree_skb,
- 
- 	skb_kfree,
-@@ -27,6 +57,7 @@ LTTNG_TRACEPOINT_EVENT_MAP(kfree_skb,
- 		ctf_integer_network(unsigned short, protocol, skb->protocol)
- 	)
- )
-+#endif
- 
- LTTNG_TRACEPOINT_EVENT_MAP(consume_skb,
- 
--- 
-2.19.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0007-fix-net-socket-rename-SKB_DROP_REASON_SOCKET_FILTER-.patch b/meta/recipes-kernel/lttng/lttng-modules/0007-fix-net-socket-rename-SKB_DROP_REASON_SOCKET_FILTER-.patch
deleted file mode 100644
index d1d8728027..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0007-fix-net-socket-rename-SKB_DROP_REASON_SOCKET_FILTER-.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 7584cfc04914cb0842a986e9808686858b9c8630 Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Mon, 31 Jan 2022 10:47:53 -0500
-Subject: [PATCH 7/7] fix: net: socket: rename SKB_DROP_REASON_SOCKET_FILTER
- (v5.17)
-
-No version check needed since this change is between two RCs, see
-upstream commit :
-
-  commit 364df53c081d93fcfd6b91085ff2650c7f17b3c7
-  Author: Menglong Dong <imagedong@tencent.com>
-  Date:   Thu Jan 27 17:13:01 2022 +0800
-
-    net: socket: rename SKB_DROP_REASON_SOCKET_FILTER
-
-    Rename SKB_DROP_REASON_SOCKET_FILTER, which is used
-    as the reason of skb drop out of socket filter before
-    it's part of a released kernel. It will be used for
-    more protocols than just TCP in future series.
-
-    Link: https://lore.kernel.org/all/20220127091308.91401-2-imagedong@tencent.com/
-
-Upstream-Status: Backport [lttng-modules commit 7584cfc04914cb0842a986e9808686858b9c8630]
-
-Change-Id: I666461a5b541fe9e0bf53ad996ce33237af4bfbb
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- include/instrumentation/events/skb.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/include/instrumentation/events/skb.h b/include/instrumentation/events/skb.h
-index c6d7095d..237e54ad 100644
---- a/include/instrumentation/events/skb.h
-+++ b/include/instrumentation/events/skb.h
-@@ -20,7 +20,7 @@ LTTNG_TRACEPOINT_ENUM(skb_drop_reason,
- 		ctf_enum_value("NO_SOCKET",	SKB_DROP_REASON_NO_SOCKET)
- 		ctf_enum_value("PKT_TOO_SMALL",	SKB_DROP_REASON_PKT_TOO_SMALL)
- 		ctf_enum_value("TCP_CSUM",	SKB_DROP_REASON_TCP_CSUM)
--		ctf_enum_value("TCP_FILTER",	SKB_DROP_REASON_TCP_FILTER)
-+		ctf_enum_value("SOCKET_FILTER",	SKB_DROP_REASON_SOCKET_FILTER)
- 		ctf_enum_value("UDP_CSUM",	SKB_DROP_REASON_UDP_CSUM)
- 		ctf_enum_value("MAX",		SKB_DROP_REASON_MAX)
- 	)
--- 
-2.19.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.1.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.2.bb
similarity index 68%
rename from meta/recipes-kernel/lttng/lttng-modules_2.13.1.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.13.2.bb
index a8e4cc5afa..78b9b7943a 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.2.bb
@@ -9,19 +9,11 @@ inherit module
 
 include lttng-platforms.inc
 
-SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
-           file://0001-fix-block-remove-GENHD_FL_SUPPRESS_PARTITION_INFO-v5.patch \
-           file://0002-fix-block-remove-the-rq_disk-field-in-struct-request.patch \
-           file://0003-fix-mm-compaction-fix-the-migration-stats-in-trace_m.patch \
-           file://0004-fix-btrfs-pass-fs_info-to-trace_btrfs_transaction_co.patch \
-           file://0005-fix-random-rather-than-entropy_store-abstraction-use.patch \
-           file://0006-fix-net-skb-introduce-kfree_skb_reason-v5.17.patch \
-           file://0007-fix-net-socket-rename-SKB_DROP_REASON_SOCKET_FILTER-.patch \
-          "
+SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2"
 # Use :append here so that the patch is applied also when using devupstream
 SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch"
 
-SRC_URI[sha256sum] = "a7c86d91c9bbe66d27f025aa04b8cfc6d7785ed2fc7ef774930800ee44d7f343"
+SRC_URI[sha256sum] = "dfd547d9041c8c545ae5b7bfef3f0ef2d9f2520d6ab44188c9ea8de56d5d298a"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
-- 
2.25.1


