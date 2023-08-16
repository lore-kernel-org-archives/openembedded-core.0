Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EA5BC41513
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 22:38:55 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.174264.1692225529039096411
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 15:38:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eeeZge/o;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3178dd81ac4so5927508f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 15:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1692225527; x=1692830327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=DnKHt7H7zFYLGWnU/hhSh/G7olqmYNTb0gUrl4kqefQ=;
        b=eeeZge/oDhBq20gZHSXi5GymPZX54ITGzLopVPRRnj6mFIytXLRciO5JPB4d91NMY7
         2daUjflJFAmDWUMPNhv7DHsDudqHaKnlxFGr/wLPoZXoFgBt/fUKb1xVdfESgOiwe6++
         7e9L1ib0ZeMKYggu+AxWk/aR45m0PQ/4beY2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692225527; x=1692830327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DnKHt7H7zFYLGWnU/hhSh/G7olqmYNTb0gUrl4kqefQ=;
        b=KtSS+XOfDYg6YGY4Vu9bsIez2k7gnx20MMBJTcqHyfJP4LohOqlThtQnnPQzebLJp4
         NZeBPgq+2k+M1A8KXJ2zq/Z24GiQRdfrEa5I2cHy56qtyNkRBJHh2nBuNwrGX5Ki+8so
         3t+3wFm70a7bjmzvrpTtOiQGKntupKR0jLaZ2KeNLa8f594JrNatVTiAeFpUXF4JdNmI
         zy8kRK0YQqOzDbf5dqFCRx75j8KRoywfLlRJdTFUSocX2GWyQiCdhIXl//3cI37Bnzm3
         GmsTnD7z9vlSHeLGFmNIlbZngASoTW/fm01BevpiKB0wVOkzq11az8jwMi16s9J5Isd/
         q9uQ==
X-Gm-Message-State: AOJu0YxKLQwnnWx4K28WMi3595i5oWc9I5lfwkJTC4zAKYp6IvQ3dCaE
	wuRGQC4OMybxWBIC6Oyx+EcBnw/pcA84s1If/CU=
X-Google-Smtp-Source: AGHT+IFMzE2gG4bD5HuqE3NaP6lfvV+mSJTMpVr3llhHAwO7HSV1tcwv5reuupMLc22MuKcDui0pnw==
X-Received: by 2002:adf:ef0b:0:b0:319:6e43:7f6a with SMTP id e11-20020adfef0b000000b003196e437f6amr2509857wro.30.1692225526908;
        Wed, 16 Aug 2023 15:38:46 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ce81:b365:d63f:4c86])
        by smtp.gmail.com with ESMTPSA id g6-20020a5d5546000000b003142e438e8csm22620389wrw.26.2023.08.16.15.38.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 15:38:46 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] lttng-modules: Upgrade 2.13.9 -> 2.13.10
Date: Wed, 16 Aug 2023 23:38:44 +0100
Message-Id: <20230816223845.590090-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:38:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186262

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...-vma-vm_flags-wrapper-functions-v6.3.patch |  82 -------------
 ...e-guid_t-and-uuid_le-types-and-respe.patch |  60 ---------
 ...ind_free_extent_ctl-to-allocator-tra.patch | 116 ------------------
 ...d-location-to-trace_consume_skb-v6.3.patch |  62 ----------
 .../0009-Rename-genhd-wrapper-to-blkdev.patch |  76 ------------
 ...les_2.13.9.bb => lttng-modules_2.13.10.bb} |   7 +-
 6 files changed, 1 insertion(+), 402 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-introduce-vma-vm_flags-wrapper-functions-v6.3.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-fix-uuid-Decouple-guid_t-and-uuid_le-types-and-respe.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-fix-btrfs-pass-find_free_extent_ctl-to-allocator-tra.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0004-fix-net-add-location-to-trace_consume_skb-v6.3.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0009-Rename-genhd-wrapper-to-blkdev.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.13.9.bb => lttng-modules_2.13.10.bb} (75%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-introduce-vma-vm_flags-wrapper-functions-v6.3.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-introduce-vma-vm_flags-wrapper-functions-v6.3.patch
deleted file mode 100644
index 976eecc3ab5..00000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-introduce-vma-vm_flags-wrapper-functions-v6.3.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From 939200ef160c95c8a9d71fd80c99f42a1de0a9f0 Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Tue, 7 Mar 2023 11:41:14 -0500
-Subject: [PATCH 1/4] fix: mm: introduce vma->vm_flags wrapper functions (v6.3)
-
-See upstream commit :
-
-  commit bc292ab00f6c7a661a8a605c714e8a148f629ef6
-  Author: Suren Baghdasaryan <surenb@google.com>
-  Date:   Thu Jan 26 11:37:47 2023 -0800
-
-    mm: introduce vma->vm_flags wrapper functions
-
-    vm_flags are among VMA attributes which affect decisions like VMA merging
-    and splitting.  Therefore all vm_flags modifications are performed after
-    taking exclusive mmap_lock to prevent vm_flags updates racing with such
-    operations.  Introduce modifier functions for vm_flags to be used whenever
-    flags are updated.  This way we can better check and control correct
-    locking behavior during these updates.
-
-Upstream-Status: Backport
-
-Change-Id: I2cf662420d9d7748e5e310d3ea4bac98ba7d7f94
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- include/wrapper/mm.h                  | 16 ++++++++++++++++
- src/lib/ringbuffer/ring_buffer_mmap.c |  4 +++-
- 2 files changed, 19 insertions(+), 1 deletion(-)
-
-diff --git a/include/wrapper/mm.h b/include/wrapper/mm.h
-index d3bdda66..61ac8127 100644
---- a/include/wrapper/mm.h
-+++ b/include/wrapper/mm.h
-@@ -13,6 +13,22 @@
- 
- #include <lttng/kernel-version.h>
- 
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,3,0))
-+static inline
-+void wrapper_vm_flags_set(struct vm_area_struct *vma,
-+		vm_flags_t flags)
-+{
-+	vm_flags_set(vma, flags);
-+}
-+#else
-+static inline
-+void wrapper_vm_flags_set(struct vm_area_struct *vma,
-+		vm_flags_t flags)
-+{
-+	vma->vm_flags |= flags;
-+}
-+#endif
-+
- #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,6,0) \
- 		|| LTTNG_UBUNTU_KERNEL_RANGE(4,4,25,44, 4,5,0,0))
- 
-diff --git a/src/lib/ringbuffer/ring_buffer_mmap.c b/src/lib/ringbuffer/ring_buffer_mmap.c
-index 25e2d8d5..d24b76a3 100644
---- a/src/lib/ringbuffer/ring_buffer_mmap.c
-+++ b/src/lib/ringbuffer/ring_buffer_mmap.c
-@@ -17,6 +17,8 @@
- #include <ringbuffer/frontend.h>
- #include <ringbuffer/vfs.h>
- 
-+#include <wrapper/mm.h>
-+
- /*
-  * fault() vm_op implementation for ring buffer file mapping.
-  */
-@@ -113,7 +115,7 @@ static int lib_ring_buffer_mmap_buf(struct lttng_kernel_ring_buffer *buf,
- 		return -EINVAL;
- 
- 	vma->vm_ops = &lib_ring_buffer_mmap_ops;
--	vma->vm_flags |= VM_DONTEXPAND;
-+	wrapper_vm_flags_set(vma, VM_DONTEXPAND);
- 	vma->vm_private_data = buf;
- 
- 	return 0;
--- 
-2.34.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0002-fix-uuid-Decouple-guid_t-and-uuid_le-types-and-respe.patch b/meta/recipes-kernel/lttng/lttng-modules/0002-fix-uuid-Decouple-guid_t-and-uuid_le-types-and-respe.patch
deleted file mode 100644
index 00aa34ed9f9..00000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0002-fix-uuid-Decouple-guid_t-and-uuid_le-types-and-respe.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From b3756eaa49a3de2f388bc269b2928a0233358fea Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Tue, 7 Mar 2023 12:05:00 -0500
-Subject: [PATCH 2/4] fix: uuid: Decouple guid_t and uuid_le types and
- respective macros (v6.3)
-
-See upstream commit :
-
-  commit 5e6a51787fef20b849682d8c49ec9c2beed5c373
-  Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
-  Date:   Tue Jan 24 15:38:38 2023 +0200
-
-    uuid: Decouple guid_t and uuid_le types and respective macros
-
-    The guid_t type and respective macros are being used internally only.
-    The uuid_le has its user outside the kernel. Decouple these types and
-    macros, and make guid_t completely internal type to the kernel.
-
-Upstream-Status: Backport
-
-Change-Id: I8644fd139b0630e9cf18886b84e33bffab1e5abd
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- include/lttng/events-internal.h | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/include/lttng/events-internal.h b/include/lttng/events-internal.h
-index e31e6abb..a91a659e 100644
---- a/include/lttng/events-internal.h
-+++ b/include/lttng/events-internal.h
-@@ -9,6 +9,7 @@
- #define _LTTNG_EVENTS_INTERNAL_H
- 
- #include <wrapper/compiler_attributes.h>
-+#include <wrapper/uuid.h>
- 
- #include <lttng/events.h>
- 
-@@ -289,7 +290,7 @@ struct lttng_metadata_cache {
- 	atomic_t producing;		/* Metadata being produced (incomplete) */
- 	struct kref refcount;		/* Metadata cache usage */
- 	struct list_head metadata_stream;	/* Metadata stream list */
--	uuid_le uuid;			/* Trace session unique ID (copy) */
-+	guid_t uuid;			/* Trace session unique ID (copy) */
- 	struct mutex lock;		/* Produce/consume lock */
- 	uint64_t version;		/* Current version of the metadata */
- };
-@@ -463,7 +464,7 @@ struct lttng_kernel_session_private {
- 	struct list_head events;		/* Event list head */
- 	struct list_head list;			/* Session list */
- 	unsigned int free_chan_id;		/* Next chan ID to allocate */
--	uuid_le uuid;				/* Trace session unique ID */
-+	guid_t uuid;				/* Trace session unique ID */
- 	struct lttng_metadata_cache *metadata_cache;
- 	unsigned int metadata_dumped:1,
- 		tstate:1;			/* Transient enable state */
--- 
-2.34.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0003-fix-btrfs-pass-find_free_extent_ctl-to-allocator-tra.patch b/meta/recipes-kernel/lttng/lttng-modules/0003-fix-btrfs-pass-find_free_extent_ctl-to-allocator-tra.patch
deleted file mode 100644
index 8ecdccf609c..00000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0003-fix-btrfs-pass-find_free_extent_ctl-to-allocator-tra.patch
+++ /dev/null
@@ -1,116 +0,0 @@
-From d0eeda3f84ba1643831561a2488ca2e99e9472b1 Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Tue, 7 Mar 2023 11:26:25 -0500
-Subject: [PATCH 3/4] fix: btrfs: pass find_free_extent_ctl to allocator
- tracepoints (v6.3)
-
-See upstream commit :
-
-  commit cfc2de0fce015d4249c674ef9f5e0b4817ba5c53
-  Author: Boris Burkov <boris@bur.io>
-  Date:   Thu Dec 15 16:06:31 2022 -0800
-
-    btrfs: pass find_free_extent_ctl to allocator tracepoints
-
-    The allocator tracepoints currently have a pile of values from ffe_ctl.
-    In modifying the allocator and adding more tracepoints, I found myself
-    adding to the already long argument list of the tracepoints. It makes it
-    a lot simpler to just send in the ffe_ctl itself.
-
-Upstream-Status: Backport
-
-Change-Id: Iab4132a9d3df3a6369591a50fb75374b1e399fa4
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- include/instrumentation/events/btrfs.h | 60 +++++++++++++++++++++++++-
- 1 file changed, 58 insertions(+), 2 deletions(-)
-
-diff --git a/include/instrumentation/events/btrfs.h b/include/instrumentation/events/btrfs.h
-index 01157107..7c7b9b0c 100644
---- a/include/instrumentation/events/btrfs.h
-+++ b/include/instrumentation/events/btrfs.h
-@@ -13,6 +13,10 @@
- #include <../fs/btrfs/accessors.h>
- #endif
- 
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,3,0))
-+#include <../fs/btrfs/extent-tree.h>
-+#endif
-+
- #ifndef _TRACE_BTRFS_DEF_
- #define _TRACE_BTRFS_DEF_
- struct btrfs_root;
-@@ -1963,7 +1967,26 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__reserved_extent,  btrfs_reserved_extent_f
- 
- #endif /* #else #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,10,0)) */
- 
--#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,10,0) || \
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,3,0))
-+LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
-+
-+	btrfs_find_free_extent,
-+
-+	TP_PROTO(const struct btrfs_root *root,
-+		const struct find_free_extent_ctl *ffe_ctl),
-+
-+	TP_ARGS(root, ffe_ctl),
-+
-+	TP_FIELDS(
-+		ctf_array(u8, fsid, root->lttng_fs_info_fsid, BTRFS_UUID_SIZE)
-+		ctf_integer(u64, root_objectid, root->root_key.objectid)
-+		ctf_integer(u64, num_bytes, ffe_ctl->num_bytes)
-+		ctf_integer(u64, empty_size, ffe_ctl->empty_size)
-+		ctf_integer(u64, flags, ffe_ctl->flags)
-+	)
-+)
-+
-+#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,10,0) || \
- 	LTTNG_KERNEL_RANGE(5,9,5, 5,10,0) || \
- 	LTTNG_KERNEL_RANGE(5,4,78, 5,5,0) || \
- 	LTTNG_UBUNTU_KERNEL_RANGE(5,8,18,44, 5,9,0,0))
-@@ -2102,7 +2125,40 @@ LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
- )
- #endif
- 
--#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,5,0))
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,3,0))
-+LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__reserve_extent,
-+
-+	TP_PROTO(const struct btrfs_block_group *block_group,
-+		const struct find_free_extent_ctl *ffe_ctl),
-+
-+	TP_ARGS(block_group, ffe_ctl),
-+
-+	TP_FIELDS(
-+		ctf_array(u8, fsid, block_group->lttng_fs_info_fsid, BTRFS_UUID_SIZE)
-+		ctf_integer(u64, bg_objectid, block_group->start)
-+		ctf_integer(u64, flags, block_group->flags)
-+		ctf_integer(u64, start, ffe_ctl->search_start)
-+		ctf_integer(u64, len, ffe_ctl->num_bytes)
-+	)
-+)
-+
-+LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__reserve_extent, btrfs_reserve_extent,
-+
-+	TP_PROTO(const struct btrfs_block_group *block_group,
-+		const struct find_free_extent_ctl *ffe_ctl),
-+
-+	TP_ARGS(block_group, ffe_ctl)
-+)
-+
-+LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__reserve_extent, btrfs_reserve_extent_cluster,
-+
-+	TP_PROTO(const struct btrfs_block_group *block_group,
-+		const struct find_free_extent_ctl *ffe_ctl),
-+
-+	TP_ARGS(block_group, ffe_ctl)
-+)
-+
-+#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,5,0))
- LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__reserve_extent,
- 
- 	TP_PROTO(const struct btrfs_block_group *block_group, u64 start,
--- 
-2.34.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0004-fix-net-add-location-to-trace_consume_skb-v6.3.patch b/meta/recipes-kernel/lttng/lttng-modules/0004-fix-net-add-location-to-trace_consume_skb-v6.3.patch
deleted file mode 100644
index 59d96dc22d0..00000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0004-fix-net-add-location-to-trace_consume_skb-v6.3.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 12f43cab7daceff0c73c78276b5a5b9cc1d5056f Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Tue, 7 Mar 2023 11:10:26 -0500
-Subject: [PATCH 4/4] fix: net: add location to trace_consume_skb() (v6.3)
-
-See upstream commit :
-
-  commit dd1b527831a3ed659afa01b672d8e1f7e6ca95a5
-  Author: Eric Dumazet <edumazet@google.com>
-  Date:   Thu Feb 16 15:47:18 2023 +0000
-
-    net: add location to trace_consume_skb()
-
-    kfree_skb() includes the location, it makes sense
-    to add it to consume_skb() as well.
-
-Upstream-Status: Backport
-
-Change-Id: I8d871187d90e7fe113a63e209b00aebe0df475f3
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- include/instrumentation/events/skb.h | 16 ++++++++++++++++
- 1 file changed, 16 insertions(+)
-
-diff --git a/include/instrumentation/events/skb.h b/include/instrumentation/events/skb.h
-index 186732ea..3c43f32d 100644
---- a/include/instrumentation/events/skb.h
-+++ b/include/instrumentation/events/skb.h
-@@ -61,6 +61,21 @@ LTTNG_TRACEPOINT_EVENT_MAP(kfree_skb,
- )
- #endif
- 
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,3,0))
-+LTTNG_TRACEPOINT_EVENT_MAP(consume_skb,
-+
-+	skb_consume,
-+
-+	TP_PROTO(struct sk_buff *skb, void *location),
-+
-+	TP_ARGS(skb, location),
-+
-+	TP_FIELDS(
-+		ctf_integer_hex(void *, skbaddr, skb)
-+		ctf_integer_hex(void *, location, location)
-+	)
-+)
-+#else
- LTTNG_TRACEPOINT_EVENT_MAP(consume_skb,
- 
- 	skb_consume,
-@@ -73,6 +88,7 @@ LTTNG_TRACEPOINT_EVENT_MAP(consume_skb,
- 		ctf_integer_hex(void *, skbaddr, skb)
- 	)
- )
-+#endif
- 
- LTTNG_TRACEPOINT_EVENT(skb_copy_datagram_iovec,
- 
--- 
-2.34.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0009-Rename-genhd-wrapper-to-blkdev.patch b/meta/recipes-kernel/lttng/lttng-modules/0009-Rename-genhd-wrapper-to-blkdev.patch
deleted file mode 100644
index 90fec9dc58d..00000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0009-Rename-genhd-wrapper-to-blkdev.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From 82fbf9d383ff9069808fb0f5f75c660098dbae52 Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Tue, 5 Apr 2022 14:57:41 -0400
-Subject: [PATCH 09/10] Rename genhd wrapper to blkdev
-
-The genhd.h header was folded into blkdev.h in v5.18, rename our wrapper
-to follow upstream.
-
-Upstream-Status: Backport
-
-Change-Id: I4ec94fb94d11712dd20f0680aea1de77fbfa9d17
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- include/wrapper/{genhd.h => blkdev.h} | 10 +++++-----
- src/lttng-statedump-impl.c            |  2 +-
- 2 files changed, 6 insertions(+), 6 deletions(-)
- rename include/wrapper/{genhd.h => blkdev.h} (93%)
-
-diff --git a/include/wrapper/genhd.h b/include/wrapper/blkdev.h
-similarity index 93%
-rename from include/wrapper/genhd.h
-rename to include/wrapper/blkdev.h
-index 4a59b68e..0d5ad90f 100644
---- a/include/wrapper/genhd.h
-+++ b/include/wrapper/blkdev.h
-@@ -1,6 +1,6 @@
- /* SPDX-License-Identifier: (GPL-2.0-only or LGPL-2.1-only)
-  *
-- * wrapper/genhd.h
-+ * wrapper/blkdev.h
-  *
-  * wrapper around block layer functions and data structures. Using
-  * KALLSYMS to get its address when available, else we need to have a
-@@ -9,8 +9,8 @@
-  * Copyright (C) 2011-2014 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-  */
- 
--#ifndef _LTTNG_WRAPPER_GENHD_H
--#define _LTTNG_WRAPPER_GENHD_H
-+#ifndef _LTTNG_WRAPPER_BLKDEV_H
-+#define _LTTNG_WRAPPER_BLKDEV_H
- 
- #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,18,0))
- #include <linux/blkdev.h>
-@@ -45,7 +45,7 @@ struct class *wrapper_get_block_class(void)
- /*
-  * Canary function to check for 'block_class' at compile time.
-  *
-- * From 'include/linux/genhd.h':
-+ * From 'include/linux/blkdev.h':
-  *
-  *   extern struct class block_class;
-  */
-@@ -104,4 +104,4 @@ struct device_type *wrapper_get_disk_type(void)
- 
- #endif
- 
--#endif /* _LTTNG_WRAPPER_GENHD_H */
-+#endif /* _LTTNG_WRAPPER_BLKDEV_H */
-diff --git a/src/lttng-statedump-impl.c b/src/lttng-statedump-impl.c
-index 4d7b2921..0e753090 100644
---- a/src/lttng-statedump-impl.c
-+++ b/src/lttng-statedump-impl.c
-@@ -41,7 +41,7 @@
- #include <wrapper/namespace.h>
- #include <wrapper/irq.h>
- #include <wrapper/tracepoint.h>
--#include <wrapper/genhd.h>
-+#include <wrapper/blkdev.h>
- #include <wrapper/file.h>
- #include <wrapper/fdtable.h>
- #include <wrapper/sched.h>
--- 
-2.19.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.9.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb
similarity index 75%
rename from meta/recipes-kernel/lttng/lttng-modules_2.13.9.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb
index 8500f168ffd..4c0e37ebc72 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.9.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb
@@ -10,17 +10,12 @@ inherit module
 include lttng-platforms.inc
 
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
-           file://0009-Rename-genhd-wrapper-to-blkdev.patch \
-           file://0001-fix-mm-introduce-vma-vm_flags-wrapper-functions-v6.3.patch \
-           file://0002-fix-uuid-Decouple-guid_t-and-uuid_le-types-and-respe.patch \
-           file://0003-fix-btrfs-pass-find_free_extent_ctl-to-allocator-tra.patch \
-           file://0004-fix-net-add-location-to-trace_consume_skb-v6.3.patch \
            "
 
 # Use :append here so that the patch is applied also when using devupstream
 SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch"
 
-SRC_URI[sha256sum] = "bf808b113544287cfe837a6382887fa66354ef5cc8216460cebbef3d27dc3581"
+SRC_URI[sha256sum] = "13abfb1ac870711f0d0adfa88e53b17deb2e3052173715a260a6ef14aa45b0a7"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
-- 
2.39.2


