Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72FAEC18E72
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 07:54:09 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.129638.1692086041509693475
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 00:54:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ArKzeish;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=qZ4eNlgC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010189f83005aa-1952dae6-ec4d-4924-bd38-b89727e26f10-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692086044;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pIK2srV9yVf8U85N0Uen7j+yqq58SxmnlaYh/X1HBwI=;
	b=ArKzeishOBMiMap9oqa5mySlA7ZETcs3742VO0LD1/L+zrfBrj9EufFJBfFFY+qY
	/+AjWzkMw1+wviAU8k5yV0L6vWkTlMdOC5UsVocr4LnjJ/WvrdMqJTv64lNOV0DawNT
	y8sYLCJpx1yASYHFXA6r4mOFTHBdphFZNAvcWW3Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692086044;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pIK2srV9yVf8U85N0Uen7j+yqq58SxmnlaYh/X1HBwI=;
	b=qZ4eNlgCcUqGg2MmcaiX8z+KUr9ybyI2Bju3eJPOKWOGi2ZqAuwLCDongkuhbgRI
	daYSHN4RVjXoWKq35TagkBjh+NsSUEApe7c3PBde4m5+13tIxXxSJ1cHZyd5x6rTN7R
	yFLlfgY/Uul4XR+kQv9+mdrn/9eySImVtCqQ418A=
Content-Type: multipart/mixed; boundary="===============3881933785926807959=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lttng-modules: upgrading to 2.13.10 FAILED
Message-ID: <01010189f83005aa-1952dae6-ec4d-4924-bd38-b89727e26f10-000000@us-west-2.amazonses.com>
Date: Tue, 15 Aug 2023 07:54:04 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 07:54:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186033

--===============3881933785926807959==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *lttng-modules* to *2.13.10* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-lttng-modules-upgrade-2.13.9-2.13.10.patch
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
From 4cfbe22fd6bfa2bb10b1ecfe392678261a2186f4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Aug 2023 07:33:38 +0000
Subject: [PATCH] lttng-modules: upgrade 2.13.9 -> 2.13.10

---
 ...-vma-vm_flags-wrapper-functions-v6.3.patch |  82 -------------
 ...e-guid_t-and-uuid_le-types-and-respe.patch |  60 ---------
 ...ind_free_extent_ctl-to-allocator-tra.patch | 116 ------------------
 ...d-location-to-trace_consume_skb-v6.3.patch |  62 ----------
 .../0009-Rename-genhd-wrapper-to-blkdev.patch |  20 ++-
 ...les_2.13.9.bb => lttng-modules_2.13.10.bb} |   7 +-
 6 files changed, 11 insertions(+), 336 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-introduce-vma-vm_flags-wrapper-functions-v6.3.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-fix-uuid-Decouple-guid_t-and-uuid_le-types-and-respe.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-fix-btrfs-pass-find_free_extent_ctl-to-allocator-tra.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0004-fix-net-add-location-to-trace_consume_skb-v6.3.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.13.9.bb => lttng-modules_2.13.10.bb} (78%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-introduce-vma-vm_flags-wrapper-functions-v6.3.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-introduce-vma-vm_flags-wrapper-functions-v6.3.patch
deleted file mode 100644
index 976eecc3ab..0000000000
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
index 00aa34ed9f..0000000000
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
index 8ecdccf609..0000000000
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
index 59d96dc22d..0000000000
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
index 90fec9dc58..4c05157f06 100644
--- a/meta/recipes-kernel/lttng/lttng-modules/0009-Rename-genhd-wrapper-to-blkdev.patch
+++ b/meta/recipes-kernel/lttng/lttng-modules/0009-Rename-genhd-wrapper-to-blkdev.patch
@@ -1,7 +1,7 @@
-From 82fbf9d383ff9069808fb0f5f75c660098dbae52 Mon Sep 17 00:00:00 2001
+From 2dd5e15f1a39ff20b93e6bf4189e3d9aaee23adc Mon Sep 17 00:00:00 2001
 From: Michael Jeanson <mjeanson@efficios.com>
 Date: Tue, 5 Apr 2022 14:57:41 -0400
-Subject: [PATCH 09/10] Rename genhd wrapper to blkdev
+Subject: [PATCH] Rename genhd wrapper to blkdev
 
 The genhd.h header was folded into blkdev.h in v5.18, rename our wrapper
 to follow upstream.
@@ -11,6 +11,7 @@ Upstream-Status: Backport
 Change-Id: I4ec94fb94d11712dd20f0680aea1de77fbfa9d17
 Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
 Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+
 ---
  include/wrapper/{genhd.h => blkdev.h} | 10 +++++-----
  src/lttng-statedump-impl.c            |  2 +-
@@ -21,7 +22,7 @@ diff --git a/include/wrapper/genhd.h b/include/wrapper/blkdev.h
 similarity index 93%
 rename from include/wrapper/genhd.h
 rename to include/wrapper/blkdev.h
-index 4a59b68e..0d5ad90f 100644
+index 2992cb4..b637bb9 100644
 --- a/include/wrapper/genhd.h
 +++ b/include/wrapper/blkdev.h
 @@ -1,6 +1,6 @@
@@ -41,9 +42,9 @@ index 4a59b68e..0d5ad90f 100644
 +#ifndef _LTTNG_WRAPPER_BLKDEV_H
 +#define _LTTNG_WRAPPER_BLKDEV_H
  
- #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,18,0))
- #include <linux/blkdev.h>
-@@ -45,7 +45,7 @@ struct class *wrapper_get_block_class(void)
+ #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,18,0) \
+ 	|| LTTNG_RHEL_KERNEL_RANGE(5,14,0,162,0,0, 5,15,0,0,0,0))
+@@ -47,7 +47,7 @@ struct class *wrapper_get_block_class(void)
  /*
   * Canary function to check for 'block_class' at compile time.
   *
@@ -52,14 +53,14 @@ index 4a59b68e..0d5ad90f 100644
   *
   *   extern struct class block_class;
   */
-@@ -104,4 +104,4 @@ struct device_type *wrapper_get_disk_type(void)
+@@ -106,4 +106,4 @@ struct device_type *wrapper_get_disk_type(void)
  
  #endif
  
 -#endif /* _LTTNG_WRAPPER_GENHD_H */
 +#endif /* _LTTNG_WRAPPER_BLKDEV_H */
 diff --git a/src/lttng-statedump-impl.c b/src/lttng-statedump-impl.c
-index 4d7b2921..0e753090 100644
+index 06088ad..4a46598 100644
 --- a/src/lttng-statedump-impl.c
 +++ b/src/lttng-statedump-impl.c
 @@ -41,7 +41,7 @@
@@ -71,6 +72,3 @@ index 4d7b2921..0e753090 100644
  #include <wrapper/file.h>
  #include <wrapper/fdtable.h>
  #include <wrapper/sched.h>
--- 
-2.19.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.9.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb
similarity index 78%
rename from meta/recipes-kernel/lttng/lttng-modules_2.13.9.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb
index 8500f168ff..908c505d5d 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.9.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb
@@ -11,16 +11,13 @@ include lttng-platforms.inc
 
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0009-Rename-genhd-wrapper-to-blkdev.patch \
-           file://0001-fix-mm-introduce-vma-vm_flags-wrapper-functions-v6.3.patch \
-           file://0002-fix-uuid-Decouple-guid_t-and-uuid_le-types-and-respe.patch \
-           file://0003-fix-btrfs-pass-find_free_extent_ctl-to-allocator-tra.patch \
-           file://0004-fix-net-add-location-to-trace_consume_skb-v6.3.patch \
+           file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch \
            "
 
 # Use :append here so that the patch is applied also when using devupstream
 SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch"
 
-SRC_URI[sha256sum] = "bf808b113544287cfe837a6382887fa66354ef5cc8216460cebbef3d27dc3581"
+SRC_URI[sha256sum] = "13abfb1ac870711f0d0adfa88e53b17deb2e3052173715a260a6ef14aa45b0a7"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
-- 
2.39.2


--===============3881933785926807959==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-lttng-modules-upgrade-2.13.9-2.13.10.patch"

RnJvbSA0Y2ZiZTIyZmQ2YmZhMmJiMTBiMWVjZmUzOTI2NzgyNjFhMjE4NmY0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgQXVnIDIwMjMgMDc6MzM6MzggKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
dHRuZy1tb2R1bGVzOiB1cGdyYWRlIDIuMTMuOSAtPiAyLjEzLjEwCgotLS0KIC4uLi12bWEtdm1f
ZmxhZ3Mtd3JhcHBlci1mdW5jdGlvbnMtdjYuMy5wYXRjaCB8ICA4MiAtLS0tLS0tLS0tLS0tCiAu
Li5lLWd1aWRfdC1hbmQtdXVpZF9sZS10eXBlcy1hbmQtcmVzcGUucGF0Y2ggfCAgNjAgLS0tLS0t
LS0tCiAuLi5pbmRfZnJlZV9leHRlbnRfY3RsLXRvLWFsbG9jYXRvci10cmEucGF0Y2ggfCAxMTYg
LS0tLS0tLS0tLS0tLS0tLS0tCiAuLi5kLWxvY2F0aW9uLXRvLXRyYWNlX2NvbnN1bWVfc2tiLXY2
LjMucGF0Y2ggfCAgNjIgLS0tLS0tLS0tLQogLi4uLzAwMDktUmVuYW1lLWdlbmhkLXdyYXBwZXIt
dG8tYmxrZGV2LnBhdGNoIHwgIDIwICsrLQogLi4ubGVzXzIuMTMuOS5iYiA9PiBsdHRuZy1tb2R1
bGVzXzIuMTMuMTAuYmJ9IHwgICA3ICstCiA2IGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMo
KyksIDMzNiBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMta2Vy
bmVsL2x0dG5nL2x0dG5nLW1vZHVsZXMvMDAwMS1maXgtbW0taW50cm9kdWNlLXZtYS12bV9mbGFn
cy13cmFwcGVyLWZ1bmN0aW9ucy12Ni4zLnBhdGNoCiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9y
ZWNpcGVzLWtlcm5lbC9sdHRuZy9sdHRuZy1tb2R1bGVzLzAwMDItZml4LXV1aWQtRGVjb3VwbGUt
Z3VpZF90LWFuZC11dWlkX2xlLXR5cGVzLWFuZC1yZXNwZS5wYXRjaAogZGVsZXRlIG1vZGUgMTAw
NjQ0IG1ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvbHR0bmctbW9kdWxlcy8wMDAzLWZpeC1idHJm
cy1wYXNzLWZpbmRfZnJlZV9leHRlbnRfY3RsLXRvLWFsbG9jYXRvci10cmEucGF0Y2gKIGRlbGV0
ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2x0dG5nLW1vZHVsZXMvMDAw
NC1maXgtbmV0LWFkZC1sb2NhdGlvbi10by10cmFjZV9jb25zdW1lX3NrYi12Ni4zLnBhdGNoCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy97bHR0bmctbW9kdWxlc18yLjEzLjkuYmIg
PT4gbHR0bmctbW9kdWxlc18yLjEzLjEwLmJifSAoNzglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1rZXJuZWwvbHR0bmcvbHR0bmctbW9kdWxlcy8wMDAxLWZpeC1tbS1pbnRyb2R1Y2Utdm1h
LXZtX2ZsYWdzLXdyYXBwZXItZnVuY3Rpb25zLXY2LjMucGF0Y2ggYi9tZXRhL3JlY2lwZXMta2Vy
bmVsL2x0dG5nL2x0dG5nLW1vZHVsZXMvMDAwMS1maXgtbW0taW50cm9kdWNlLXZtYS12bV9mbGFn
cy13cmFwcGVyLWZ1bmN0aW9ucy12Ni4zLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NApp
bmRleCA5NzZlZWNjM2FiLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0
bmcvbHR0bmctbW9kdWxlcy8wMDAxLWZpeC1tbS1pbnRyb2R1Y2Utdm1hLXZtX2ZsYWdzLXdyYXBw
ZXItZnVuY3Rpb25zLXY2LjMucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSw4MiArMCwwIEBACi1G
cm9tIDkzOTIwMGVmMTYwYzk1YzhhOWQ3MWZkODBjOTlmNDJhMWRlMGE5ZjAgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCi1Gcm9tOiBNaWNoYWVsIEplYW5zb24gPG1qZWFuc29uQGVmZmljaW9zLmNv
bT4KLURhdGU6IFR1ZSwgNyBNYXIgMjAyMyAxMTo0MToxNCAtMDUwMAotU3ViamVjdDogW1BBVENI
IDEvNF0gZml4OiBtbTogaW50cm9kdWNlIHZtYS0+dm1fZmxhZ3Mgd3JhcHBlciBmdW5jdGlvbnMg
KHY2LjMpCi0KLVNlZSB1cHN0cmVhbSBjb21taXQgOgotCi0gIGNvbW1pdCBiYzI5MmFiMDBmNmM3
YTY2MWE4YTYwNWM3MTRlOGExNDhmNjI5ZWY2Ci0gIEF1dGhvcjogU3VyZW4gQmFnaGRhc2FyeWFu
IDxzdXJlbmJAZ29vZ2xlLmNvbT4KLSAgRGF0ZTogICBUaHUgSmFuIDI2IDExOjM3OjQ3IDIwMjMg
LTA4MDAKLQotICAgIG1tOiBpbnRyb2R1Y2Ugdm1hLT52bV9mbGFncyB3cmFwcGVyIGZ1bmN0aW9u
cwotCi0gICAgdm1fZmxhZ3MgYXJlIGFtb25nIFZNQSBhdHRyaWJ1dGVzIHdoaWNoIGFmZmVjdCBk
ZWNpc2lvbnMgbGlrZSBWTUEgbWVyZ2luZwotICAgIGFuZCBzcGxpdHRpbmcuICBUaGVyZWZvcmUg
YWxsIHZtX2ZsYWdzIG1vZGlmaWNhdGlvbnMgYXJlIHBlcmZvcm1lZCBhZnRlcgotICAgIHRha2lu
ZyBleGNsdXNpdmUgbW1hcF9sb2NrIHRvIHByZXZlbnQgdm1fZmxhZ3MgdXBkYXRlcyByYWNpbmcg
d2l0aCBzdWNoCi0gICAgb3BlcmF0aW9ucy4gIEludHJvZHVjZSBtb2RpZmllciBmdW5jdGlvbnMg
Zm9yIHZtX2ZsYWdzIHRvIGJlIHVzZWQgd2hlbmV2ZXIKLSAgICBmbGFncyBhcmUgdXBkYXRlZC4g
IFRoaXMgd2F5IHdlIGNhbiBiZXR0ZXIgY2hlY2sgYW5kIGNvbnRyb2wgY29ycmVjdAotICAgIGxv
Y2tpbmcgYmVoYXZpb3IgZHVyaW5nIHRoZXNlIHVwZGF0ZXMuCi0KLVVwc3RyZWFtLVN0YXR1czog
QmFja3BvcnQKLQotQ2hhbmdlLUlkOiBJMmNmNjYyNDIwZDlkNzc0OGU1ZTMxMGQzZWE0YmFjOThi
YTdkN2Y5NAotU2lnbmVkLW9mZi1ieTogTWljaGFlbCBKZWFuc29uIDxtamVhbnNvbkBlZmZpY2lv
cy5jb20+Ci1TaWduZWQtb2ZmLWJ5OiBNYXRoaWV1IERlc25veWVycyA8bWF0aGlldS5kZXNub3ll
cnNAZWZmaWNpb3MuY29tPgotLS0tCi0gaW5jbHVkZS93cmFwcGVyL21tLmggICAgICAgICAgICAg
ICAgICB8IDE2ICsrKysrKysrKysrKysrKysKLSBzcmMvbGliL3JpbmdidWZmZXIvcmluZ19idWZm
ZXJfbW1hcC5jIHwgIDQgKysrLQotIDIgZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQotCi1kaWZmIC0tZ2l0IGEvaW5jbHVkZS93cmFwcGVyL21tLmggYi9pbmNs
dWRlL3dyYXBwZXIvbW0uaAotaW5kZXggZDNiZGRhNjYuLjYxYWM4MTI3IDEwMDY0NAotLS0tIGEv
aW5jbHVkZS93cmFwcGVyL21tLmgKLSsrKyBiL2luY2x1ZGUvd3JhcHBlci9tbS5oCi1AQCAtMTMs
NiArMTMsMjIgQEAKLSAKLSAjaW5jbHVkZSA8bHR0bmcva2VybmVsLXZlcnNpb24uaD4KLSAKLSsj
aWYgKExUVE5HX0xJTlVYX1ZFUlNJT05fQ09ERSA+PSBMVFROR19LRVJORUxfVkVSU0lPTig2LDMs
MCkpCi0rc3RhdGljIGlubGluZQotK3ZvaWQgd3JhcHBlcl92bV9mbGFnc19zZXQoc3RydWN0IHZt
X2FyZWFfc3RydWN0ICp2bWEsCi0rCQl2bV9mbGFnc190IGZsYWdzKQotK3sKLSsJdm1fZmxhZ3Nf
c2V0KHZtYSwgZmxhZ3MpOwotK30KLSsjZWxzZQotK3N0YXRpYyBpbmxpbmUKLSt2b2lkIHdyYXBw
ZXJfdm1fZmxhZ3Nfc2V0KHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLAotKwkJdm1fZmxhZ3Nf
dCBmbGFncykKLSt7Ci0rCXZtYS0+dm1fZmxhZ3MgfD0gZmxhZ3M7Ci0rfQotKyNlbmRpZgotKwot
ICNpZiAoTFRUTkdfTElOVVhfVkVSU0lPTl9DT0RFID49IExUVE5HX0tFUk5FTF9WRVJTSU9OKDQs
NiwwKSBcCi0gCQl8fCBMVFROR19VQlVOVFVfS0VSTkVMX1JBTkdFKDQsNCwyNSw0NCwgNCw1LDAs
MCkpCi0gCi1kaWZmIC0tZ2l0IGEvc3JjL2xpYi9yaW5nYnVmZmVyL3JpbmdfYnVmZmVyX21tYXAu
YyBiL3NyYy9saWIvcmluZ2J1ZmZlci9yaW5nX2J1ZmZlcl9tbWFwLmMKLWluZGV4IDI1ZTJkOGQ1
Li5kMjRiNzZhMyAxMDA2NDQKLS0tLSBhL3NyYy9saWIvcmluZ2J1ZmZlci9yaW5nX2J1ZmZlcl9t
bWFwLmMKLSsrKyBiL3NyYy9saWIvcmluZ2J1ZmZlci9yaW5nX2J1ZmZlcl9tbWFwLmMKLUBAIC0x
Nyw2ICsxNyw4IEBACi0gI2luY2x1ZGUgPHJpbmdidWZmZXIvZnJvbnRlbmQuaD4KLSAjaW5jbHVk
ZSA8cmluZ2J1ZmZlci92ZnMuaD4KLSAKLSsjaW5jbHVkZSA8d3JhcHBlci9tbS5oPgotKwotIC8q
Ci0gICogZmF1bHQoKSB2bV9vcCBpbXBsZW1lbnRhdGlvbiBmb3IgcmluZyBidWZmZXIgZmlsZSBt
YXBwaW5nLgotICAqLwotQEAgLTExMyw3ICsxMTUsNyBAQCBzdGF0aWMgaW50IGxpYl9yaW5nX2J1
ZmZlcl9tbWFwX2J1ZihzdHJ1Y3QgbHR0bmdfa2VybmVsX3JpbmdfYnVmZmVyICpidWYsCi0gCQly
ZXR1cm4gLUVJTlZBTDsKLSAKLSAJdm1hLT52bV9vcHMgPSAmbGliX3JpbmdfYnVmZmVyX21tYXBf
b3BzOwotLQl2bWEtPnZtX2ZsYWdzIHw9IFZNX0RPTlRFWFBBTkQ7Ci0rCXdyYXBwZXJfdm1fZmxh
Z3Nfc2V0KHZtYSwgVk1fRE9OVEVYUEFORCk7Ci0gCXZtYS0+dm1fcHJpdmF0ZV9kYXRhID0gYnVm
OwotIAotIAlyZXR1cm4gMDsKLS0tIAotMi4zNC4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1rZXJuZWwvbHR0bmcvbHR0bmctbW9kdWxlcy8wMDAyLWZpeC11dWlkLURlY291cGxlLWd1aWRf
dC1hbmQtdXVpZF9sZS10eXBlcy1hbmQtcmVzcGUucGF0Y2ggYi9tZXRhL3JlY2lwZXMta2VybmVs
L2x0dG5nL2x0dG5nLW1vZHVsZXMvMDAwMi1maXgtdXVpZC1EZWNvdXBsZS1ndWlkX3QtYW5kLXV1
aWRfbGUtdHlwZXMtYW5kLXJlc3BlLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRl
eCAwMGFhMzRlZDlmLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcv
bHR0bmctbW9kdWxlcy8wMDAyLWZpeC11dWlkLURlY291cGxlLWd1aWRfdC1hbmQtdXVpZF9sZS10
eXBlcy1hbmQtcmVzcGUucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSw2MCArMCwwIEBACi1Gcm9t
IGIzNzU2ZWFhNDlhM2RlMmYzODhiYzI2OWIyOTI4YTAyMzMzNThmZWEgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCi1Gcm9tOiBNaWNoYWVsIEplYW5zb24gPG1qZWFuc29uQGVmZmljaW9zLmNvbT4K
LURhdGU6IFR1ZSwgNyBNYXIgMjAyMyAxMjowNTowMCAtMDUwMAotU3ViamVjdDogW1BBVENIIDIv
NF0gZml4OiB1dWlkOiBEZWNvdXBsZSBndWlkX3QgYW5kIHV1aWRfbGUgdHlwZXMgYW5kCi0gcmVz
cGVjdGl2ZSBtYWNyb3MgKHY2LjMpCi0KLVNlZSB1cHN0cmVhbSBjb21taXQgOgotCi0gIGNvbW1p
dCA1ZTZhNTE3ODdmZWYyMGI4NDk2ODJkOGM0OWVjOWMyYmVlZDVjMzczCi0gIEF1dGhvcjogQW5k
eSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+Ci0gIERhdGU6
ICAgVHVlIEphbiAyNCAxNTozODozOCAyMDIzICswMjAwCi0KLSAgICB1dWlkOiBEZWNvdXBsZSBn
dWlkX3QgYW5kIHV1aWRfbGUgdHlwZXMgYW5kIHJlc3BlY3RpdmUgbWFjcm9zCi0KLSAgICBUaGUg
Z3VpZF90IHR5cGUgYW5kIHJlc3BlY3RpdmUgbWFjcm9zIGFyZSBiZWluZyB1c2VkIGludGVybmFs
bHkgb25seS4KLSAgICBUaGUgdXVpZF9sZSBoYXMgaXRzIHVzZXIgb3V0c2lkZSB0aGUga2VybmVs
LiBEZWNvdXBsZSB0aGVzZSB0eXBlcyBhbmQKLSAgICBtYWNyb3MsIGFuZCBtYWtlIGd1aWRfdCBj
b21wbGV0ZWx5IGludGVybmFsIHR5cGUgdG8gdGhlIGtlcm5lbC4KLQotVXBzdHJlYW0tU3RhdHVz
OiBCYWNrcG9ydAotCi1DaGFuZ2UtSWQ6IEk4NjQ0ZmQxMzliMDYzMGU5Y2YxODg4NmI4NGUzM2Jm
ZmFiMWU1YWJkCi1TaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIEplYW5zb24gPG1qZWFuc29uQGVmZmlj
aW9zLmNvbT4KLVNpZ25lZC1vZmYtYnk6IE1hdGhpZXUgRGVzbm95ZXJzIDxtYXRoaWV1LmRlc25v
eWVyc0BlZmZpY2lvcy5jb20+Ci0tLS0KLSBpbmNsdWRlL2x0dG5nL2V2ZW50cy1pbnRlcm5hbC5o
IHwgNSArKystLQotIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCi0KLWRpZmYgLS1naXQgYS9pbmNsdWRlL2x0dG5nL2V2ZW50cy1pbnRlcm5hbC5oIGIvaW5j
bHVkZS9sdHRuZy9ldmVudHMtaW50ZXJuYWwuaAotaW5kZXggZTMxZTZhYmIuLmE5MWE2NTllIDEw
MDY0NAotLS0tIGEvaW5jbHVkZS9sdHRuZy9ldmVudHMtaW50ZXJuYWwuaAotKysrIGIvaW5jbHVk
ZS9sdHRuZy9ldmVudHMtaW50ZXJuYWwuaAotQEAgLTksNiArOSw3IEBACi0gI2RlZmluZSBfTFRU
TkdfRVZFTlRTX0lOVEVSTkFMX0gKLSAKLSAjaW5jbHVkZSA8d3JhcHBlci9jb21waWxlcl9hdHRy
aWJ1dGVzLmg+Ci0rI2luY2x1ZGUgPHdyYXBwZXIvdXVpZC5oPgotIAotICNpbmNsdWRlIDxsdHRu
Zy9ldmVudHMuaD4KLSAKLUBAIC0yODksNyArMjkwLDcgQEAgc3RydWN0IGx0dG5nX21ldGFkYXRh
X2NhY2hlIHsKLSAJYXRvbWljX3QgcHJvZHVjaW5nOwkJLyogTWV0YWRhdGEgYmVpbmcgcHJvZHVj
ZWQgKGluY29tcGxldGUpICovCi0gCXN0cnVjdCBrcmVmIHJlZmNvdW50OwkJLyogTWV0YWRhdGEg
Y2FjaGUgdXNhZ2UgKi8KLSAJc3RydWN0IGxpc3RfaGVhZCBtZXRhZGF0YV9zdHJlYW07CS8qIE1l
dGFkYXRhIHN0cmVhbSBsaXN0ICovCi0tCXV1aWRfbGUgdXVpZDsJCQkvKiBUcmFjZSBzZXNzaW9u
IHVuaXF1ZSBJRCAoY29weSkgKi8KLSsJZ3VpZF90IHV1aWQ7CQkJLyogVHJhY2Ugc2Vzc2lvbiB1
bmlxdWUgSUQgKGNvcHkpICovCi0gCXN0cnVjdCBtdXRleCBsb2NrOwkJLyogUHJvZHVjZS9jb25z
dW1lIGxvY2sgKi8KLSAJdWludDY0X3QgdmVyc2lvbjsJCS8qIEN1cnJlbnQgdmVyc2lvbiBvZiB0
aGUgbWV0YWRhdGEgKi8KLSB9OwotQEAgLTQ2Myw3ICs0NjQsNyBAQCBzdHJ1Y3QgbHR0bmdfa2Vy
bmVsX3Nlc3Npb25fcHJpdmF0ZSB7Ci0gCXN0cnVjdCBsaXN0X2hlYWQgZXZlbnRzOwkJLyogRXZl
bnQgbGlzdCBoZWFkICovCi0gCXN0cnVjdCBsaXN0X2hlYWQgbGlzdDsJCQkvKiBTZXNzaW9uIGxp
c3QgKi8KLSAJdW5zaWduZWQgaW50IGZyZWVfY2hhbl9pZDsJCS8qIE5leHQgY2hhbiBJRCB0byBh
bGxvY2F0ZSAqLwotLQl1dWlkX2xlIHV1aWQ7CQkJCS8qIFRyYWNlIHNlc3Npb24gdW5pcXVlIElE
ICovCi0rCWd1aWRfdCB1dWlkOwkJCQkvKiBUcmFjZSBzZXNzaW9uIHVuaXF1ZSBJRCAqLwotIAlz
dHJ1Y3QgbHR0bmdfbWV0YWRhdGFfY2FjaGUgKm1ldGFkYXRhX2NhY2hlOwotIAl1bnNpZ25lZCBp
bnQgbWV0YWRhdGFfZHVtcGVkOjEsCi0gCQl0c3RhdGU6MTsJCQkvKiBUcmFuc2llbnQgZW5hYmxl
IHN0YXRlICovCi0tLSAKLTIuMzQuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVs
L2x0dG5nL2x0dG5nLW1vZHVsZXMvMDAwMy1maXgtYnRyZnMtcGFzcy1maW5kX2ZyZWVfZXh0ZW50
X2N0bC10by1hbGxvY2F0b3ItdHJhLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9s
dHRuZy1tb2R1bGVzLzAwMDMtZml4LWJ0cmZzLXBhc3MtZmluZF9mcmVlX2V4dGVudF9jdGwtdG8t
YWxsb2NhdG9yLXRyYS5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggOGVjZGNj
ZjYwOS4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2x0dG5nLW1v
ZHVsZXMvMDAwMy1maXgtYnRyZnMtcGFzcy1maW5kX2ZyZWVfZXh0ZW50X2N0bC10by1hbGxvY2F0
b3ItdHJhLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsMTE2ICswLDAgQEAKLUZyb20gZDBlZWRh
M2Y4NGJhMTY0MzgzMTU2MWEyNDg4Y2EyZTk5ZTk0NzJiMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKLUZyb206IE1pY2hhZWwgSmVhbnNvbiA8bWplYW5zb25AZWZmaWNpb3MuY29tPgotRGF0ZTog
VHVlLCA3IE1hciAyMDIzIDExOjI2OjI1IC0wNTAwCi1TdWJqZWN0OiBbUEFUQ0ggMy80XSBmaXg6
IGJ0cmZzOiBwYXNzIGZpbmRfZnJlZV9leHRlbnRfY3RsIHRvIGFsbG9jYXRvcgotIHRyYWNlcG9p
bnRzICh2Ni4zKQotCi1TZWUgdXBzdHJlYW0gY29tbWl0IDoKLQotICBjb21taXQgY2ZjMmRlMGZj
ZTAxNWQ0MjQ5YzY3NGVmOWY1ZTBiNDgxN2JhNWM1MwotICBBdXRob3I6IEJvcmlzIEJ1cmtvdiA8
Ym9yaXNAYnVyLmlvPgotICBEYXRlOiAgIFRodSBEZWMgMTUgMTY6MDY6MzEgMjAyMiAtMDgwMAot
Ci0gICAgYnRyZnM6IHBhc3MgZmluZF9mcmVlX2V4dGVudF9jdGwgdG8gYWxsb2NhdG9yIHRyYWNl
cG9pbnRzCi0KLSAgICBUaGUgYWxsb2NhdG9yIHRyYWNlcG9pbnRzIGN1cnJlbnRseSBoYXZlIGEg
cGlsZSBvZiB2YWx1ZXMgZnJvbSBmZmVfY3RsLgotICAgIEluIG1vZGlmeWluZyB0aGUgYWxsb2Nh
dG9yIGFuZCBhZGRpbmcgbW9yZSB0cmFjZXBvaW50cywgSSBmb3VuZCBteXNlbGYKLSAgICBhZGRp
bmcgdG8gdGhlIGFscmVhZHkgbG9uZyBhcmd1bWVudCBsaXN0IG9mIHRoZSB0cmFjZXBvaW50cy4g
SXQgbWFrZXMgaXQKLSAgICBhIGxvdCBzaW1wbGVyIHRvIGp1c3Qgc2VuZCBpbiB0aGUgZmZlX2N0
bCBpdHNlbGYuCi0KLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQKLQotQ2hhbmdlLUlkOiBJYWI0
MTMyYTlkM2RmM2E2MzY5NTkxYTUwZmI3NTM3NGIxZTM5OWZhNAotU2lnbmVkLW9mZi1ieTogTWlj
aGFlbCBKZWFuc29uIDxtamVhbnNvbkBlZmZpY2lvcy5jb20+Ci1TaWduZWQtb2ZmLWJ5OiBNYXRo
aWV1IERlc25veWVycyA8bWF0aGlldS5kZXNub3llcnNAZWZmaWNpb3MuY29tPgotLS0tCi0gaW5j
bHVkZS9pbnN0cnVtZW50YXRpb24vZXZlbnRzL2J0cmZzLmggfCA2MCArKysrKysrKysrKysrKysr
KysrKysrKysrLQotIDEgZmlsZSBjaGFuZ2VkLCA1OCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQotCi1kaWZmIC0tZ2l0IGEvaW5jbHVkZS9pbnN0cnVtZW50YXRpb24vZXZlbnRzL2J0cmZz
LmggYi9pbmNsdWRlL2luc3RydW1lbnRhdGlvbi9ldmVudHMvYnRyZnMuaAotaW5kZXggMDExNTcx
MDcuLjdjN2I5YjBjIDEwMDY0NAotLS0tIGEvaW5jbHVkZS9pbnN0cnVtZW50YXRpb24vZXZlbnRz
L2J0cmZzLmgKLSsrKyBiL2luY2x1ZGUvaW5zdHJ1bWVudGF0aW9uL2V2ZW50cy9idHJmcy5oCi1A
QCAtMTMsNiArMTMsMTAgQEAKLSAjaW5jbHVkZSA8Li4vZnMvYnRyZnMvYWNjZXNzb3JzLmg+Ci0g
I2VuZGlmCi0gCi0rI2lmIChMVFROR19MSU5VWF9WRVJTSU9OX0NPREUgPj0gTFRUTkdfS0VSTkVM
X1ZFUlNJT04oNiwzLDApKQotKyNpbmNsdWRlIDwuLi9mcy9idHJmcy9leHRlbnQtdHJlZS5oPgot
KyNlbmRpZgotKwotICNpZm5kZWYgX1RSQUNFX0JUUkZTX0RFRl8KLSAjZGVmaW5lIF9UUkFDRV9C
VFJGU19ERUZfCi0gc3RydWN0IGJ0cmZzX3Jvb3Q7Ci1AQCAtMTk2Myw3ICsxOTY3LDI2IEBAIExU
VE5HX1RSQUNFUE9JTlRfRVZFTlRfSU5TVEFOQ0UoYnRyZnNfX3Jlc2VydmVkX2V4dGVudCwgIGJ0
cmZzX3Jlc2VydmVkX2V4dGVudF9mCi0gCi0gI2VuZGlmIC8qICNlbHNlICNpZiAoTFRUTkdfTElO
VVhfVkVSU0lPTl9DT0RFID49IExUVE5HX0tFUk5FTF9WRVJTSU9OKDQsMTAsMCkpICovCi0gCi0t
I2lmIChMVFROR19MSU5VWF9WRVJTSU9OX0NPREUgPj0gTFRUTkdfS0VSTkVMX1ZFUlNJT04oNSwx
MCwwKSB8fCBcCi0rI2lmIChMVFROR19MSU5VWF9WRVJTSU9OX0NPREUgPj0gTFRUTkdfS0VSTkVM
X1ZFUlNJT04oNiwzLDApKQotK0xUVE5HX1RSQUNFUE9JTlRfRVZFTlRfTUFQKGZpbmRfZnJlZV9l
eHRlbnQsCi0rCi0rCWJ0cmZzX2ZpbmRfZnJlZV9leHRlbnQsCi0rCi0rCVRQX1BST1RPKGNvbnN0
IHN0cnVjdCBidHJmc19yb290ICpyb290LAotKwkJY29uc3Qgc3RydWN0IGZpbmRfZnJlZV9leHRl
bnRfY3RsICpmZmVfY3RsKSwKLSsKLSsJVFBfQVJHUyhyb290LCBmZmVfY3RsKSwKLSsKLSsJVFBf
RklFTERTKAotKwkJY3RmX2FycmF5KHU4LCBmc2lkLCByb290LT5sdHRuZ19mc19pbmZvX2ZzaWQs
IEJUUkZTX1VVSURfU0laRSkKLSsJCWN0Zl9pbnRlZ2VyKHU2NCwgcm9vdF9vYmplY3RpZCwgcm9v
dC0+cm9vdF9rZXkub2JqZWN0aWQpCi0rCQljdGZfaW50ZWdlcih1NjQsIG51bV9ieXRlcywgZmZl
X2N0bC0+bnVtX2J5dGVzKQotKwkJY3RmX2ludGVnZXIodTY0LCBlbXB0eV9zaXplLCBmZmVfY3Rs
LT5lbXB0eV9zaXplKQotKwkJY3RmX2ludGVnZXIodTY0LCBmbGFncywgZmZlX2N0bC0+ZmxhZ3Mp
Ci0rCSkKLSspCi0rCi0rI2VsaWYgKExUVE5HX0xJTlVYX1ZFUlNJT05fQ09ERSA+PSBMVFROR19L
RVJORUxfVkVSU0lPTig1LDEwLDApIHx8IFwKLSAJTFRUTkdfS0VSTkVMX1JBTkdFKDUsOSw1LCA1
LDEwLDApIHx8IFwKLSAJTFRUTkdfS0VSTkVMX1JBTkdFKDUsNCw3OCwgNSw1LDApIHx8IFwKLSAJ
TFRUTkdfVUJVTlRVX0tFUk5FTF9SQU5HRSg1LDgsMTgsNDQsIDUsOSwwLDApKQotQEAgLTIxMDIs
NyArMjEyNSw0MCBAQCBMVFROR19UUkFDRVBPSU5UX0VWRU5UX01BUChmaW5kX2ZyZWVfZXh0ZW50
LAotICkKLSAjZW5kaWYKLSAKLS0jaWYgKExUVE5HX0xJTlVYX1ZFUlNJT05fQ09ERSA+PSBMVFRO
R19LRVJORUxfVkVSU0lPTig1LDUsMCkpCi0rI2lmIChMVFROR19MSU5VWF9WRVJTSU9OX0NPREUg
Pj0gTFRUTkdfS0VSTkVMX1ZFUlNJT04oNiwzLDApKQotK0xUVE5HX1RSQUNFUE9JTlRfRVZFTlRf
Q0xBU1MoYnRyZnNfX3Jlc2VydmVfZXh0ZW50LAotKwotKwlUUF9QUk9UTyhjb25zdCBzdHJ1Y3Qg
YnRyZnNfYmxvY2tfZ3JvdXAgKmJsb2NrX2dyb3VwLAotKwkJY29uc3Qgc3RydWN0IGZpbmRfZnJl
ZV9leHRlbnRfY3RsICpmZmVfY3RsKSwKLSsKLSsJVFBfQVJHUyhibG9ja19ncm91cCwgZmZlX2N0
bCksCi0rCi0rCVRQX0ZJRUxEUygKLSsJCWN0Zl9hcnJheSh1OCwgZnNpZCwgYmxvY2tfZ3JvdXAt
Pmx0dG5nX2ZzX2luZm9fZnNpZCwgQlRSRlNfVVVJRF9TSVpFKQotKwkJY3RmX2ludGVnZXIodTY0
LCBiZ19vYmplY3RpZCwgYmxvY2tfZ3JvdXAtPnN0YXJ0KQotKwkJY3RmX2ludGVnZXIodTY0LCBm
bGFncywgYmxvY2tfZ3JvdXAtPmZsYWdzKQotKwkJY3RmX2ludGVnZXIodTY0LCBzdGFydCwgZmZl
X2N0bC0+c2VhcmNoX3N0YXJ0KQotKwkJY3RmX2ludGVnZXIodTY0LCBsZW4sIGZmZV9jdGwtPm51
bV9ieXRlcykKLSsJKQotKykKLSsKLStMVFROR19UUkFDRVBPSU5UX0VWRU5UX0lOU1RBTkNFKGJ0
cmZzX19yZXNlcnZlX2V4dGVudCwgYnRyZnNfcmVzZXJ2ZV9leHRlbnQsCi0rCi0rCVRQX1BST1RP
KGNvbnN0IHN0cnVjdCBidHJmc19ibG9ja19ncm91cCAqYmxvY2tfZ3JvdXAsCi0rCQljb25zdCBz
dHJ1Y3QgZmluZF9mcmVlX2V4dGVudF9jdGwgKmZmZV9jdGwpLAotKwotKwlUUF9BUkdTKGJsb2Nr
X2dyb3VwLCBmZmVfY3RsKQotKykKLSsKLStMVFROR19UUkFDRVBPSU5UX0VWRU5UX0lOU1RBTkNF
KGJ0cmZzX19yZXNlcnZlX2V4dGVudCwgYnRyZnNfcmVzZXJ2ZV9leHRlbnRfY2x1c3RlciwKLSsK
LSsJVFBfUFJPVE8oY29uc3Qgc3RydWN0IGJ0cmZzX2Jsb2NrX2dyb3VwICpibG9ja19ncm91cCwK
LSsJCWNvbnN0IHN0cnVjdCBmaW5kX2ZyZWVfZXh0ZW50X2N0bCAqZmZlX2N0bCksCi0rCi0rCVRQ
X0FSR1MoYmxvY2tfZ3JvdXAsIGZmZV9jdGwpCi0rKQotKwotKyNlbGlmIChMVFROR19MSU5VWF9W
RVJTSU9OX0NPREUgPj0gTFRUTkdfS0VSTkVMX1ZFUlNJT04oNSw1LDApKQotIExUVE5HX1RSQUNF
UE9JTlRfRVZFTlRfQ0xBU1MoYnRyZnNfX3Jlc2VydmVfZXh0ZW50LAotIAotIAlUUF9QUk9UTyhj
b25zdCBzdHJ1Y3QgYnRyZnNfYmxvY2tfZ3JvdXAgKmJsb2NrX2dyb3VwLCB1NjQgc3RhcnQsCi0t
LSAKLTIuMzQuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2x0dG5n
LW1vZHVsZXMvMDAwNC1maXgtbmV0LWFkZC1sb2NhdGlvbi10by10cmFjZV9jb25zdW1lX3NrYi12
Ni4zLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9sdHRuZy1tb2R1bGVzLzAwMDQt
Zml4LW5ldC1hZGQtbG9jYXRpb24tdG8tdHJhY2VfY29uc3VtZV9za2ItdjYuMy5wYXRjaApkZWxl
dGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggNTlkOTZkYzIyZC4uMDAwMDAwMDAwMAotLS0gYS9t
ZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2x0dG5nLW1vZHVsZXMvMDAwNC1maXgtbmV0LWFkZC1s
b2NhdGlvbi10by10cmFjZV9jb25zdW1lX3NrYi12Ni4zLnBhdGNoCisrKyAvZGV2L251bGwKQEAg
LTEsNjIgKzAsMCBAQAotRnJvbSAxMmY0M2NhYjdkYWNlZmYwYzczYzc4Mjc2YjVhNWI5Y2MxZDUw
NTZmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogTWljaGFlbCBKZWFuc29uIDxtamVh
bnNvbkBlZmZpY2lvcy5jb20+Ci1EYXRlOiBUdWUsIDcgTWFyIDIwMjMgMTE6MTA6MjYgLTA1MDAK
LVN1YmplY3Q6IFtQQVRDSCA0LzRdIGZpeDogbmV0OiBhZGQgbG9jYXRpb24gdG8gdHJhY2VfY29u
c3VtZV9za2IoKSAodjYuMykKLQotU2VlIHVwc3RyZWFtIGNvbW1pdCA6Ci0KLSAgY29tbWl0IGRk
MWI1Mjc4MzFhM2VkNjU5YWZhMDFiNjcyZDhlMWY3ZTZjYTk1YTUKLSAgQXV0aG9yOiBFcmljIER1
bWF6ZXQgPGVkdW1hemV0QGdvb2dsZS5jb20+Ci0gIERhdGU6ICAgVGh1IEZlYiAxNiAxNTo0Nzox
OCAyMDIzICswMDAwCi0KLSAgICBuZXQ6IGFkZCBsb2NhdGlvbiB0byB0cmFjZV9jb25zdW1lX3Nr
YigpCi0KLSAgICBrZnJlZV9za2IoKSBpbmNsdWRlcyB0aGUgbG9jYXRpb24sIGl0IG1ha2VzIHNl
bnNlCi0gICAgdG8gYWRkIGl0IHRvIGNvbnN1bWVfc2tiKCkgYXMgd2VsbC4KLQotVXBzdHJlYW0t
U3RhdHVzOiBCYWNrcG9ydAotCi1DaGFuZ2UtSWQ6IEk4ZDg3MTE4N2Q5MGU3ZmUxMTNhNjNlMjA5
YjAwYWViZTBkZjQ3NWYzCi1TaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIEplYW5zb24gPG1qZWFuc29u
QGVmZmljaW9zLmNvbT4KLVNpZ25lZC1vZmYtYnk6IE1hdGhpZXUgRGVzbm95ZXJzIDxtYXRoaWV1
LmRlc25veWVyc0BlZmZpY2lvcy5jb20+Ci0tLS0KLSBpbmNsdWRlL2luc3RydW1lbnRhdGlvbi9l
dmVudHMvc2tiLmggfCAxNiArKysrKysrKysrKysrKysrCi0gMSBmaWxlIGNoYW5nZWQsIDE2IGlu
c2VydGlvbnMoKykKLQotZGlmZiAtLWdpdCBhL2luY2x1ZGUvaW5zdHJ1bWVudGF0aW9uL2V2ZW50
cy9za2IuaCBiL2luY2x1ZGUvaW5zdHJ1bWVudGF0aW9uL2V2ZW50cy9za2IuaAotaW5kZXggMTg2
NzMyZWEuLjNjNDNmMzJkIDEwMDY0NAotLS0tIGEvaW5jbHVkZS9pbnN0cnVtZW50YXRpb24vZXZl
bnRzL3NrYi5oCi0rKysgYi9pbmNsdWRlL2luc3RydW1lbnRhdGlvbi9ldmVudHMvc2tiLmgKLUBA
IC02MSw2ICs2MSwyMSBAQCBMVFROR19UUkFDRVBPSU5UX0VWRU5UX01BUChrZnJlZV9za2IsCi0g
KQotICNlbmRpZgotIAotKyNpZiAoTFRUTkdfTElOVVhfVkVSU0lPTl9DT0RFID49IExUVE5HX0tF
Uk5FTF9WRVJTSU9OKDYsMywwKSkKLStMVFROR19UUkFDRVBPSU5UX0VWRU5UX01BUChjb25zdW1l
X3NrYiwKLSsKLSsJc2tiX2NvbnN1bWUsCi0rCi0rCVRQX1BST1RPKHN0cnVjdCBza19idWZmICpz
a2IsIHZvaWQgKmxvY2F0aW9uKSwKLSsKLSsJVFBfQVJHUyhza2IsIGxvY2F0aW9uKSwKLSsKLSsJ
VFBfRklFTERTKAotKwkJY3RmX2ludGVnZXJfaGV4KHZvaWQgKiwgc2tiYWRkciwgc2tiKQotKwkJ
Y3RmX2ludGVnZXJfaGV4KHZvaWQgKiwgbG9jYXRpb24sIGxvY2F0aW9uKQotKwkpCi0rKQotKyNl
bHNlCi0gTFRUTkdfVFJBQ0VQT0lOVF9FVkVOVF9NQVAoY29uc3VtZV9za2IsCi0gCi0gCXNrYl9j
b25zdW1lLAotQEAgLTczLDYgKzg4LDcgQEAgTFRUTkdfVFJBQ0VQT0lOVF9FVkVOVF9NQVAoY29u
c3VtZV9za2IsCi0gCQljdGZfaW50ZWdlcl9oZXgodm9pZCAqLCBza2JhZGRyLCBza2IpCi0gCSkK
LSApCi0rI2VuZGlmCi0gCi0gTFRUTkdfVFJBQ0VQT0lOVF9FVkVOVChza2JfY29weV9kYXRhZ3Jh
bV9pb3ZlYywKLSAKLS0tIAotMi4zNC4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJu
ZWwvbHR0bmcvbHR0bmctbW9kdWxlcy8wMDA5LVJlbmFtZS1nZW5oZC13cmFwcGVyLXRvLWJsa2Rl
di5wYXRjaCBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvbHR0bmctbW9kdWxlcy8wMDA5LVJl
bmFtZS1nZW5oZC13cmFwcGVyLXRvLWJsa2Rldi5wYXRjaAppbmRleCA5MGZlYzlkYzU4Li40YzA1
MTU3ZjA2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2x0dG5nLW1vZHVs
ZXMvMDAwOS1SZW5hbWUtZ2VuaGQtd3JhcHBlci10by1ibGtkZXYucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLWtlcm5lbC9sdHRuZy9sdHRuZy1tb2R1bGVzLzAwMDktUmVuYW1lLWdlbmhkLXdyYXBw
ZXItdG8tYmxrZGV2LnBhdGNoCkBAIC0xLDcgKzEsNyBAQAotRnJvbSA4MmZiZjlkMzgzZmY5MDY5
ODA4ZmIwZjVmNzVjNjYwMDk4ZGJhZTUyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAy
ZGQ1ZTE1ZjFhMzlmZjIwYjkzZTZiZjQxODllM2Q5YWFlZTIzYWRjIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogTWljaGFlbCBKZWFuc29uIDxtamVhbnNvbkBlZmZpY2lvcy5jb20+CiBE
YXRlOiBUdWUsIDUgQXByIDIwMjIgMTQ6NTc6NDEgLTA0MDAKLVN1YmplY3Q6IFtQQVRDSCAwOS8x
MF0gUmVuYW1lIGdlbmhkIHdyYXBwZXIgdG8gYmxrZGV2CitTdWJqZWN0OiBbUEFUQ0hdIFJlbmFt
ZSBnZW5oZCB3cmFwcGVyIHRvIGJsa2RldgogCiBUaGUgZ2VuaGQuaCBoZWFkZXIgd2FzIGZvbGRl
ZCBpbnRvIGJsa2Rldi5oIGluIHY1LjE4LCByZW5hbWUgb3VyIHdyYXBwZXIKIHRvIGZvbGxvdyB1
cHN0cmVhbS4KQEAgLTExLDYgKzExLDcgQEAgVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydAogQ2hh
bmdlLUlkOiBJNGVjOTRmYjk0ZDExNzEyZGQyMGYwNjgwYWVhMWRlNzdmYmZhOWQxNwogU2lnbmVk
LW9mZi1ieTogTWljaGFlbCBKZWFuc29uIDxtamVhbnNvbkBlZmZpY2lvcy5jb20+CiBTaWduZWQt
b2ZmLWJ5OiBNYXRoaWV1IERlc25veWVycyA8bWF0aGlldS5kZXNub3llcnNAZWZmaWNpb3MuY29t
PgorCiAtLS0KICBpbmNsdWRlL3dyYXBwZXIve2dlbmhkLmggPT4gYmxrZGV2Lmh9IHwgMTAgKysr
KystLS0tLQogIHNyYy9sdHRuZy1zdGF0ZWR1bXAtaW1wbC5jICAgICAgICAgICAgfCAgMiArLQpA
QCAtMjEsNyArMjIsNyBAQCBkaWZmIC0tZ2l0IGEvaW5jbHVkZS93cmFwcGVyL2dlbmhkLmggYi9p
bmNsdWRlL3dyYXBwZXIvYmxrZGV2LmgKIHNpbWlsYXJpdHkgaW5kZXggOTMlCiByZW5hbWUgZnJv
bSBpbmNsdWRlL3dyYXBwZXIvZ2VuaGQuaAogcmVuYW1lIHRvIGluY2x1ZGUvd3JhcHBlci9ibGtk
ZXYuaAotaW5kZXggNGE1OWI2OGUuLjBkNWFkOTBmIDEwMDY0NAoraW5kZXggMjk5MmNiNC4uYjYz
N2JiOSAxMDA2NDQKIC0tLSBhL2luY2x1ZGUvd3JhcHBlci9nZW5oZC5oCiArKysgYi9pbmNsdWRl
L3dyYXBwZXIvYmxrZGV2LmgKIEBAIC0xLDYgKzEsNiBAQApAQCAtNDEsOSArNDIsOSBAQCBpbmRl
eCA0YTU5YjY4ZS4uMGQ1YWQ5MGYgMTAwNjQ0CiArI2lmbmRlZiBfTFRUTkdfV1JBUFBFUl9CTEtE
RVZfSAogKyNkZWZpbmUgX0xUVE5HX1dSQVBQRVJfQkxLREVWX0gKICAKLSAjaWYgKExUVE5HX0xJ
TlVYX1ZFUlNJT05fQ09ERSA+PSBMVFROR19LRVJORUxfVkVSU0lPTig1LDE4LDApKQotICNpbmNs
dWRlIDxsaW51eC9ibGtkZXYuaD4KLUBAIC00NSw3ICs0NSw3IEBAIHN0cnVjdCBjbGFzcyAqd3Jh
cHBlcl9nZXRfYmxvY2tfY2xhc3Modm9pZCkKKyAjaWYgKExUVE5HX0xJTlVYX1ZFUlNJT05fQ09E
RSA+PSBMVFROR19LRVJORUxfVkVSU0lPTig1LDE4LDApIFwKKyAJfHwgTFRUTkdfUkhFTF9LRVJO
RUxfUkFOR0UoNSwxNCwwLDE2MiwwLDAsIDUsMTUsMCwwLDAsMCkpCitAQCAtNDcsNyArNDcsNyBA
QCBzdHJ1Y3QgY2xhc3MgKndyYXBwZXJfZ2V0X2Jsb2NrX2NsYXNzKHZvaWQpCiAgLyoKICAgKiBD
YW5hcnkgZnVuY3Rpb24gdG8gY2hlY2sgZm9yICdibG9ja19jbGFzcycgYXQgY29tcGlsZSB0aW1l
LgogICAqCkBAIC01MiwxNCArNTMsMTQgQEAgaW5kZXggNGE1OWI2OGUuLjBkNWFkOTBmIDEwMDY0
NAogICAqCiAgICogICBleHRlcm4gc3RydWN0IGNsYXNzIGJsb2NrX2NsYXNzOwogICAqLwotQEAg
LTEwNCw0ICsxMDQsNCBAQCBzdHJ1Y3QgZGV2aWNlX3R5cGUgKndyYXBwZXJfZ2V0X2Rpc2tfdHlw
ZSh2b2lkKQorQEAgLTEwNiw0ICsxMDYsNCBAQCBzdHJ1Y3QgZGV2aWNlX3R5cGUgKndyYXBwZXJf
Z2V0X2Rpc2tfdHlwZSh2b2lkKQogIAogICNlbmRpZgogIAogLSNlbmRpZiAvKiBfTFRUTkdfV1JB
UFBFUl9HRU5IRF9IICovCiArI2VuZGlmIC8qIF9MVFROR19XUkFQUEVSX0JMS0RFVl9IICovCiBk
aWZmIC0tZ2l0IGEvc3JjL2x0dG5nLXN0YXRlZHVtcC1pbXBsLmMgYi9zcmMvbHR0bmctc3RhdGVk
dW1wLWltcGwuYwotaW5kZXggNGQ3YjI5MjEuLjBlNzUzMDkwIDEwMDY0NAoraW5kZXggMDYwODhh
ZC4uNGE0NjU5OCAxMDA2NDQKIC0tLSBhL3NyYy9sdHRuZy1zdGF0ZWR1bXAtaW1wbC5jCiArKysg
Yi9zcmMvbHR0bmctc3RhdGVkdW1wLWltcGwuYwogQEAgLTQxLDcgKzQxLDcgQEAKQEAgLTcxLDYg
KzcyLDMgQEAgaW5kZXggNGQ3YjI5MjEuLjBlNzUzMDkwIDEwMDY0NAogICNpbmNsdWRlIDx3cmFw
cGVyL2ZpbGUuaD4KICAjaW5jbHVkZSA8d3JhcHBlci9mZHRhYmxlLmg+CiAgI2luY2x1ZGUgPHdy
YXBwZXIvc2NoZWQuaD4KLS0tIAotMi4xOS4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1r
ZXJuZWwvbHR0bmcvbHR0bmctbW9kdWxlc18yLjEzLjkuYmIgYi9tZXRhL3JlY2lwZXMta2VybmVs
L2x0dG5nL2x0dG5nLW1vZHVsZXNfMi4xMy4xMC5iYgpzaW1pbGFyaXR5IGluZGV4IDc4JQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2x0dG5nLW1vZHVsZXNfMi4xMy45LmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2x0dG5nLW1vZHVsZXNfMi4xMy4x
MC5iYgppbmRleCA4NTAwZjE2OGZmLi45MDhjNTA1ZDVkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMta2VybmVsL2x0dG5nL2x0dG5nLW1vZHVsZXNfMi4xMy45LmJiCisrKyBiL21ldGEvcmVjaXBl
cy1rZXJuZWwvbHR0bmcvbHR0bmctbW9kdWxlc18yLjEzLjEwLmJiCkBAIC0xMSwxNiArMTEsMTMg
QEAgaW5jbHVkZSBsdHRuZy1wbGF0Zm9ybXMuaW5jCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly9sdHRu
Zy5vcmcvZmlsZXMvJHtCUE59LyR7QlBOfS0ke1BWfS50YXIuYnoyIFwKICAgICAgICAgICAgZmls
ZTovLzAwMDktUmVuYW1lLWdlbmhkLXdyYXBwZXItdG8tYmxrZGV2LnBhdGNoIFwKLSAgICAgICAg
ICAgZmlsZTovLzAwMDEtZml4LW1tLWludHJvZHVjZS12bWEtdm1fZmxhZ3Mtd3JhcHBlci1mdW5j
dGlvbnMtdjYuMy5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDAyLWZpeC11dWlkLURlY291
cGxlLWd1aWRfdC1hbmQtdXVpZF9sZS10eXBlcy1hbmQtcmVzcGUucGF0Y2ggXAotICAgICAgICAg
ICBmaWxlOi8vMDAwMy1maXgtYnRyZnMtcGFzcy1maW5kX2ZyZWVfZXh0ZW50X2N0bC10by1hbGxv
Y2F0b3ItdHJhLnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovLzAwMDQtZml4LW5ldC1hZGQtbG9j
YXRpb24tdG8tdHJhY2VfY29uc3VtZV9za2ItdjYuMy5wYXRjaCBcCisgICAgICAgICAgIGZpbGU6
Ly8wMDAxLXNyYy1LYnVpbGQtY2hhbmdlLW1pc3NpbmctQ09ORklHX1RSQUNFUE9JTlRTLXRvLXdh
cm4ucGF0Y2ggXAogICAgICAgICAgICAiCiAKICMgVXNlIDphcHBlbmQgaGVyZSBzbyB0aGF0IHRo
ZSBwYXRjaCBpcyBhcHBsaWVkIGFsc28gd2hlbiB1c2luZyBkZXZ1cHN0cmVhbQogU1JDX1VSSTph
cHBlbmQgPSAiIGZpbGU6Ly8wMDAxLXNyYy1LYnVpbGQtY2hhbmdlLW1pc3NpbmctQ09ORklHX1RS
QUNFUE9JTlRTLXRvLXdhcm4ucGF0Y2giCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJiZjgwOGIx
MTM1NDQyODdjZmU4MzdhNjM4Mjg4N2ZhNjYzNTRlZjVjYzgyMTY0NjBjZWJiZWYzZDI3ZGMzNTgx
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjEzYWJmYjFhYzg3MDcxMWYwZDBhZGZhODhlNTNiMTdk
ZWIyZTMwNTIxNzM3MTVhMjYwYTZlZjE0YWE0NWIwYTciCiAKIGV4cG9ydCBJTlNUQUxMX01PRF9E
SVI9Imtlcm5lbC9sdHRuZy1tb2R1bGVzIgogCi0tIAoyLjM5LjIKCg==

--===============3881933785926807959==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1804 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1804 targets, 42 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:56c39360a752e5a43036843336cdcac5e9886102"
workspace            = "master:d151ba95f69d7224241fb8c76c90bbe4b2fd9563"

Initialising tasks...done.
Sstate summary: Wanted 31 Local 21 Mirrors 0 Missed 10 Current 267 (67% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 816 of 917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb:do_recipe_qa)
NOTE: recipe lttng-modules-2.13.10-r0: task do_recipe_qa: Started
NOTE: recipe lttng-modules-2.13.10-r0: task do_recipe_qa: Succeeded
NOTE: Running task 900 of 917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb:do_fetch)
NOTE: recipe lttng-modules-2.13.10-r0: task do_fetch: Started
NOTE: recipe lttng-modules-2.13.10-r0: task do_fetch: Succeeded
NOTE: Running task 901 of 917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb:do_unpack)
NOTE: Running task 902 of 917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-modules-2.13.10-r0: task do_unpack: Started
NOTE: recipe lttng-modules-2.13.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lttng-modules-2.13.10-r0: task do_unpack: Succeeded
NOTE: Running task 903 of 917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb:do_patch)
NOTE: Running task 904 of 917 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb:do_collect_spdx_deps)
NOTE: recipe lttng-modules-2.13.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lttng-modules-2.13.10-r0: task do_patch: Started
NOTE: recipe lttng-modules-2.13.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe lttng-modules-2.13.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe lttng-modules-2.13.10-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 904 tasks of which 898 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb:do_patch
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: lttng-modules-2.13.10-r0 do_patch: Applying patch '0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch' on target directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/qemux86-poky-linux/lttng-modules/2.13.10/lttng-modules-2.13.10'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/qemux86-poky-linux/lttng-modules/2.13.10/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Patch 0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch is already applied; check your series file

stderr: ')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/qemux86-poky-linux/lttng-modules/2.13.10/temp/log.do_patch.3007978
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb:do_patch) failed with exit code '1'

--===============3881933785926807959==--

