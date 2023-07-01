Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0258C001DF
	for <webhook@archiver.kernel.org>; Sat,  1 Jul 2023 16:02:06 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.10779.1688227324462019540
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jul 2023 09:02:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=e45JIqYI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018912309f59-67397307-d751-4fd8-8dba-67fa9e0ff05a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1688227324;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=d/ZCNqyop5CuwtkcSNVoJXoJu85GWwiOCmQxLRzA90w=;
	b=e45JIqYIAKXO7KQ4QqnP2rKs02NMRq04dV5dlLecF91Z9bzMDqh1JBaBelDeSyPs
	VpXh+ff8u9jByJRuu/vvbwtokUK3hya5AIz1wxUBZuhGwoOuOyXarkg2U0+bF5iosaE
	9nJ0+Ssb4/gSK/lT7jNiNs6jd3NR5RD6fK1hH5vg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1688227324;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=d/ZCNqyop5CuwtkcSNVoJXoJu85GWwiOCmQxLRzA90w=;
	b=A1hnMW6F/vJM9zp398DHDySBX8dg46wsjtFTgbe+3tpombj6f9gkwKPqxFpaZMPO
	+obqaDZDRqhfS8uGDTtxcg47VXsaM+UlXqX8Cf42NAyA2Sk6ektlW3FTm5diEdGYNiJ
	EeE1/cmYflDo6kWoZqN7R+4squpg5FuLUrnNySVw=
Content-Type: multipart/mixed; boundary="===============3913594981392603901=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lttng-modules: upgrading to 2.13.10 FAILED
Message-ID: <0101018912309f59-67397307-d751-4fd8-8dba-67fa9e0ff05a-000000@us-west-2.amazonses.com>
Date: Sat, 1 Jul 2023 16:02:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jul 2023 16:02:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183761

--===============3913594981392603901==
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
From c2c7fdfd9e0a486f263c1d03cad84f2737005b83 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Jul 2023 14:00:17 +0000
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
index 90fec9dc58..eae034841f 100644
--- a/meta/recipes-kernel/lttng/lttng-modules/0009-Rename-genhd-wrapper-to-blkdev.patch
+++ b/meta/recipes-kernel/lttng/lttng-modules/0009-Rename-genhd-wrapper-to-blkdev.patch
@@ -1,7 +1,7 @@
-From 82fbf9d383ff9069808fb0f5f75c660098dbae52 Mon Sep 17 00:00:00 2001
+From 8bf98a97fa0cbd39942fb52fb71f072b4b9f99cc Mon Sep 17 00:00:00 2001
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


--===============3913594981392603901==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1798 entries from dependency cache.
Parsing recipes...done.
Parsing of 896 .bb files complete (895 cached, 1 parsed). 1798 targets, 34 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:a898d0d32d0355b440fc8f4cc56128fb9982f3c4"
workspace            = "master:d221e59a5067266c3f620259a1e56a56823df1fb"

Initialising tasks...done.
Sstate summary: Wanted 35 Local 26 Mirrors 0 Missed 9 Current 180 (74% match, 95% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 738 of 834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb:do_fetch)
NOTE: recipe lttng-modules-2.13.10-r0: task do_fetch: Started
NOTE: recipe lttng-modules-2.13.10-r0: task do_fetch: Succeeded
NOTE: Running task 818 of 834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb:do_unpack)
NOTE: Running task 819 of 834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-modules-2.13.10-r0: task do_unpack: Started
NOTE: recipe lttng-modules-2.13.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lttng-modules-2.13.10-r0: task do_unpack: Succeeded
NOTE: Running task 820 of 834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb:do_patch)
NOTE: Running task 821 of 834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb:do_collect_spdx_deps)
NOTE: recipe lttng-modules-2.13.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lttng-modules-2.13.10-r0: task do_patch: Started
NOTE: recipe lttng-modules-2.13.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe lttng-modules-2.13.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe lttng-modules-2.13.10-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 821 tasks of which 816 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb:do_patch
Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: lttng-modules-2.13.10-r0 do_patch: Applying patch '0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch' on target directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/qemux86-poky-linux/lttng-modules/2.13.10-r0/lttng-modules-2.13.10'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/qemux86-poky-linux/lttng-modules/2.13.10-r0/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Patch 0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch is already applied; check your series file

stderr: ')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/qemux86-poky-linux/lttng-modules/2.13.10-r0/temp/log.do_patch.3418744
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb:do_patch) failed with exit code '1'

--===============3913594981392603901==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-lttng-modules-upgrade-2.13.9-2.13.10.patch"

RnJvbSBjMmM3ZmRmZDllMGE0ODZmMjYzYzFkMDNjYWQ4NGYyNzM3MDA1YjgzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBKdWwgMjAyMyAxNDowMDoxNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGx0
dG5nLW1vZHVsZXM6IHVwZ3JhZGUgMi4xMy45IC0+IDIuMTMuMTAKCi0tLQogLi4uLXZtYS12bV9m
bGFncy13cmFwcGVyLWZ1bmN0aW9ucy12Ni4zLnBhdGNoIHwgIDgyIC0tLS0tLS0tLS0tLS0KIC4u
LmUtZ3VpZF90LWFuZC11dWlkX2xlLXR5cGVzLWFuZC1yZXNwZS5wYXRjaCB8ICA2MCAtLS0tLS0t
LS0KIC4uLmluZF9mcmVlX2V4dGVudF9jdGwtdG8tYWxsb2NhdG9yLXRyYS5wYXRjaCB8IDExNiAt
LS0tLS0tLS0tLS0tLS0tLS0KIC4uLmQtbG9jYXRpb24tdG8tdHJhY2VfY29uc3VtZV9za2ItdjYu
My5wYXRjaCB8ICA2MiAtLS0tLS0tLS0tCiAuLi4vMDAwOS1SZW5hbWUtZ2VuaGQtd3JhcHBlci10
by1ibGtkZXYucGF0Y2ggfCAgMjAgKystCiAuLi5sZXNfMi4xMy45LmJiID0+IGx0dG5nLW1vZHVs
ZXNfMi4xMy4xMC5iYn0gfCAgIDcgKy0KIDYgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygr
KSwgMzM2IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1rZXJu
ZWwvbHR0bmcvbHR0bmctbW9kdWxlcy8wMDAxLWZpeC1tbS1pbnRyb2R1Y2Utdm1hLXZtX2ZsYWdz
LXdyYXBwZXItZnVuY3Rpb25zLXY2LjMucGF0Y2gKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3Jl
Y2lwZXMta2VybmVsL2x0dG5nL2x0dG5nLW1vZHVsZXMvMDAwMi1maXgtdXVpZC1EZWNvdXBsZS1n
dWlkX3QtYW5kLXV1aWRfbGUtdHlwZXMtYW5kLXJlc3BlLnBhdGNoCiBkZWxldGUgbW9kZSAxMDA2
NDQgbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9sdHRuZy1tb2R1bGVzLzAwMDMtZml4LWJ0cmZz
LXBhc3MtZmluZF9mcmVlX2V4dGVudF9jdGwtdG8tYWxsb2NhdG9yLXRyYS5wYXRjaAogZGVsZXRl
IG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvbHR0bmctbW9kdWxlcy8wMDA0
LWZpeC1uZXQtYWRkLWxvY2F0aW9uLXRvLXRyYWNlX2NvbnN1bWVfc2tiLXY2LjMucGF0Y2gKIHJl
bmFtZSBtZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL3tsdHRuZy1tb2R1bGVzXzIuMTMuOS5iYiA9
PiBsdHRuZy1tb2R1bGVzXzIuMTMuMTAuYmJ9ICg3OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWtlcm5lbC9sdHRuZy9sdHRuZy1tb2R1bGVzLzAwMDEtZml4LW1tLWludHJvZHVjZS12bWEt
dm1fZmxhZ3Mtd3JhcHBlci1mdW5jdGlvbnMtdjYuMy5wYXRjaCBiL21ldGEvcmVjaXBlcy1rZXJu
ZWwvbHR0bmcvbHR0bmctbW9kdWxlcy8wMDAxLWZpeC1tbS1pbnRyb2R1Y2Utdm1hLXZtX2ZsYWdz
LXdyYXBwZXItZnVuY3Rpb25zLXY2LjMucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IDk3NmVlY2MzYWIuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRu
Zy9sdHRuZy1tb2R1bGVzLzAwMDEtZml4LW1tLWludHJvZHVjZS12bWEtdm1fZmxhZ3Mtd3JhcHBl
ci1mdW5jdGlvbnMtdjYuMy5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDgyICswLDAgQEAKLUZy
b20gOTM5MjAwZWYxNjBjOTVjOGE5ZDcxZmQ4MGM5OWY0MmExZGUwYTlmMCBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKLUZyb206IE1pY2hhZWwgSmVhbnNvbiA8bWplYW5zb25AZWZmaWNpb3MuY29t
PgotRGF0ZTogVHVlLCA3IE1hciAyMDIzIDExOjQxOjE0IC0wNTAwCi1TdWJqZWN0OiBbUEFUQ0gg
MS80XSBmaXg6IG1tOiBpbnRyb2R1Y2Ugdm1hLT52bV9mbGFncyB3cmFwcGVyIGZ1bmN0aW9ucyAo
djYuMykKLQotU2VlIHVwc3RyZWFtIGNvbW1pdCA6Ci0KLSAgY29tbWl0IGJjMjkyYWIwMGY2Yzdh
NjYxYThhNjA1YzcxNGU4YTE0OGY2MjllZjYKLSAgQXV0aG9yOiBTdXJlbiBCYWdoZGFzYXJ5YW4g
PHN1cmVuYkBnb29nbGUuY29tPgotICBEYXRlOiAgIFRodSBKYW4gMjYgMTE6Mzc6NDcgMjAyMyAt
MDgwMAotCi0gICAgbW06IGludHJvZHVjZSB2bWEtPnZtX2ZsYWdzIHdyYXBwZXIgZnVuY3Rpb25z
Ci0KLSAgICB2bV9mbGFncyBhcmUgYW1vbmcgVk1BIGF0dHJpYnV0ZXMgd2hpY2ggYWZmZWN0IGRl
Y2lzaW9ucyBsaWtlIFZNQSBtZXJnaW5nCi0gICAgYW5kIHNwbGl0dGluZy4gIFRoZXJlZm9yZSBh
bGwgdm1fZmxhZ3MgbW9kaWZpY2F0aW9ucyBhcmUgcGVyZm9ybWVkIGFmdGVyCi0gICAgdGFraW5n
IGV4Y2x1c2l2ZSBtbWFwX2xvY2sgdG8gcHJldmVudCB2bV9mbGFncyB1cGRhdGVzIHJhY2luZyB3
aXRoIHN1Y2gKLSAgICBvcGVyYXRpb25zLiAgSW50cm9kdWNlIG1vZGlmaWVyIGZ1bmN0aW9ucyBm
b3Igdm1fZmxhZ3MgdG8gYmUgdXNlZCB3aGVuZXZlcgotICAgIGZsYWdzIGFyZSB1cGRhdGVkLiAg
VGhpcyB3YXkgd2UgY2FuIGJldHRlciBjaGVjayBhbmQgY29udHJvbCBjb3JyZWN0Ci0gICAgbG9j
a2luZyBiZWhhdmlvciBkdXJpbmcgdGhlc2UgdXBkYXRlcy4KLQotVXBzdHJlYW0tU3RhdHVzOiBC
YWNrcG9ydAotCi1DaGFuZ2UtSWQ6IEkyY2Y2NjI0MjBkOWQ3NzQ4ZTVlMzEwZDNlYTRiYWM5OGJh
N2Q3Zjk0Ci1TaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIEplYW5zb24gPG1qZWFuc29uQGVmZmljaW9z
LmNvbT4KLVNpZ25lZC1vZmYtYnk6IE1hdGhpZXUgRGVzbm95ZXJzIDxtYXRoaWV1LmRlc25veWVy
c0BlZmZpY2lvcy5jb20+Ci0tLS0KLSBpbmNsdWRlL3dyYXBwZXIvbW0uaCAgICAgICAgICAgICAg
ICAgIHwgMTYgKysrKysrKysrKysrKysrKwotIHNyYy9saWIvcmluZ2J1ZmZlci9yaW5nX2J1ZmZl
cl9tbWFwLmMgfCAgNCArKystCi0gMiBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCi0KLWRpZmYgLS1naXQgYS9pbmNsdWRlL3dyYXBwZXIvbW0uaCBiL2luY2x1
ZGUvd3JhcHBlci9tbS5oCi1pbmRleCBkM2JkZGE2Ni4uNjFhYzgxMjcgMTAwNjQ0Ci0tLS0gYS9p
bmNsdWRlL3dyYXBwZXIvbW0uaAotKysrIGIvaW5jbHVkZS93cmFwcGVyL21tLmgKLUBAIC0xMyw2
ICsxMywyMiBAQAotIAotICNpbmNsdWRlIDxsdHRuZy9rZXJuZWwtdmVyc2lvbi5oPgotIAotKyNp
ZiAoTFRUTkdfTElOVVhfVkVSU0lPTl9DT0RFID49IExUVE5HX0tFUk5FTF9WRVJTSU9OKDYsMyww
KSkKLStzdGF0aWMgaW5saW5lCi0rdm9pZCB3cmFwcGVyX3ZtX2ZsYWdzX3NldChzdHJ1Y3Qgdm1f
YXJlYV9zdHJ1Y3QgKnZtYSwKLSsJCXZtX2ZsYWdzX3QgZmxhZ3MpCi0rewotKwl2bV9mbGFnc19z
ZXQodm1hLCBmbGFncyk7Ci0rfQotKyNlbHNlCi0rc3RhdGljIGlubGluZQotK3ZvaWQgd3JhcHBl
cl92bV9mbGFnc19zZXQoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCi0rCQl2bV9mbGFnc190
IGZsYWdzKQotK3sKLSsJdm1hLT52bV9mbGFncyB8PSBmbGFnczsKLSt9Ci0rI2VuZGlmCi0rCi0g
I2lmIChMVFROR19MSU5VWF9WRVJTSU9OX0NPREUgPj0gTFRUTkdfS0VSTkVMX1ZFUlNJT04oNCw2
LDApIFwKLSAJCXx8IExUVE5HX1VCVU5UVV9LRVJORUxfUkFOR0UoNCw0LDI1LDQ0LCA0LDUsMCww
KSkKLSAKLWRpZmYgLS1naXQgYS9zcmMvbGliL3JpbmdidWZmZXIvcmluZ19idWZmZXJfbW1hcC5j
IGIvc3JjL2xpYi9yaW5nYnVmZmVyL3JpbmdfYnVmZmVyX21tYXAuYwotaW5kZXggMjVlMmQ4ZDUu
LmQyNGI3NmEzIDEwMDY0NAotLS0tIGEvc3JjL2xpYi9yaW5nYnVmZmVyL3JpbmdfYnVmZmVyX21t
YXAuYwotKysrIGIvc3JjL2xpYi9yaW5nYnVmZmVyL3JpbmdfYnVmZmVyX21tYXAuYwotQEAgLTE3
LDYgKzE3LDggQEAKLSAjaW5jbHVkZSA8cmluZ2J1ZmZlci9mcm9udGVuZC5oPgotICNpbmNsdWRl
IDxyaW5nYnVmZmVyL3Zmcy5oPgotIAotKyNpbmNsdWRlIDx3cmFwcGVyL21tLmg+Ci0rCi0gLyoK
LSAgKiBmYXVsdCgpIHZtX29wIGltcGxlbWVudGF0aW9uIGZvciByaW5nIGJ1ZmZlciBmaWxlIG1h
cHBpbmcuCi0gICovCi1AQCAtMTEzLDcgKzExNSw3IEBAIHN0YXRpYyBpbnQgbGliX3JpbmdfYnVm
ZmVyX21tYXBfYnVmKHN0cnVjdCBsdHRuZ19rZXJuZWxfcmluZ19idWZmZXIgKmJ1ZiwKLSAJCXJl
dHVybiAtRUlOVkFMOwotIAotIAl2bWEtPnZtX29wcyA9ICZsaWJfcmluZ19idWZmZXJfbW1hcF9v
cHM7Ci0tCXZtYS0+dm1fZmxhZ3MgfD0gVk1fRE9OVEVYUEFORDsKLSsJd3JhcHBlcl92bV9mbGFn
c19zZXQodm1hLCBWTV9ET05URVhQQU5EKTsKLSAJdm1hLT52bV9wcml2YXRlX2RhdGEgPSBidWY7
Ci0gCi0gCXJldHVybiAwOwotLS0gCi0yLjM0LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWtlcm5lbC9sdHRuZy9sdHRuZy1tb2R1bGVzLzAwMDItZml4LXV1aWQtRGVjb3VwbGUtZ3VpZF90
LWFuZC11dWlkX2xlLXR5cGVzLWFuZC1yZXNwZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1rZXJuZWwv
bHR0bmcvbHR0bmctbW9kdWxlcy8wMDAyLWZpeC11dWlkLURlY291cGxlLWd1aWRfdC1hbmQtdXVp
ZF9sZS10eXBlcy1hbmQtcmVzcGUucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4
IDAwYWEzNGVkOWYuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9s
dHRuZy1tb2R1bGVzLzAwMDItZml4LXV1aWQtRGVjb3VwbGUtZ3VpZF90LWFuZC11dWlkX2xlLXR5
cGVzLWFuZC1yZXNwZS5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDYwICswLDAgQEAKLUZyb20g
YjM3NTZlYWE0OWEzZGUyZjM4OGJjMjY5YjI5MjhhMDIzMzM1OGZlYSBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKLUZyb206IE1pY2hhZWwgSmVhbnNvbiA8bWplYW5zb25AZWZmaWNpb3MuY29tPgot
RGF0ZTogVHVlLCA3IE1hciAyMDIzIDEyOjA1OjAwIC0wNTAwCi1TdWJqZWN0OiBbUEFUQ0ggMi80
XSBmaXg6IHV1aWQ6IERlY291cGxlIGd1aWRfdCBhbmQgdXVpZF9sZSB0eXBlcyBhbmQKLSByZXNw
ZWN0aXZlIG1hY3JvcyAodjYuMykKLQotU2VlIHVwc3RyZWFtIGNvbW1pdCA6Ci0KLSAgY29tbWl0
IDVlNmE1MTc4N2ZlZjIwYjg0OTY4MmQ4YzQ5ZWM5YzJiZWVkNWMzNzMKLSAgQXV0aG9yOiBBbmR5
IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4KLSAgRGF0ZTog
ICBUdWUgSmFuIDI0IDE1OjM4OjM4IDIwMjMgKzAyMDAKLQotICAgIHV1aWQ6IERlY291cGxlIGd1
aWRfdCBhbmQgdXVpZF9sZSB0eXBlcyBhbmQgcmVzcGVjdGl2ZSBtYWNyb3MKLQotICAgIFRoZSBn
dWlkX3QgdHlwZSBhbmQgcmVzcGVjdGl2ZSBtYWNyb3MgYXJlIGJlaW5nIHVzZWQgaW50ZXJuYWxs
eSBvbmx5LgotICAgIFRoZSB1dWlkX2xlIGhhcyBpdHMgdXNlciBvdXRzaWRlIHRoZSBrZXJuZWwu
IERlY291cGxlIHRoZXNlIHR5cGVzIGFuZAotICAgIG1hY3JvcywgYW5kIG1ha2UgZ3VpZF90IGNv
bXBsZXRlbHkgaW50ZXJuYWwgdHlwZSB0byB0aGUga2VybmVsLgotCi1VcHN0cmVhbS1TdGF0dXM6
IEJhY2twb3J0Ci0KLUNoYW5nZS1JZDogSTg2NDRmZDEzOWIwNjMwZTljZjE4ODg2Yjg0ZTMzYmZm
YWIxZTVhYmQKLVNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgSmVhbnNvbiA8bWplYW5zb25AZWZmaWNp
b3MuY29tPgotU2lnbmVkLW9mZi1ieTogTWF0aGlldSBEZXNub3llcnMgPG1hdGhpZXUuZGVzbm95
ZXJzQGVmZmljaW9zLmNvbT4KLS0tLQotIGluY2x1ZGUvbHR0bmcvZXZlbnRzLWludGVybmFsLmgg
fCA1ICsrKy0tCi0gMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKLQotZGlmZiAtLWdpdCBhL2luY2x1ZGUvbHR0bmcvZXZlbnRzLWludGVybmFsLmggYi9pbmNs
dWRlL2x0dG5nL2V2ZW50cy1pbnRlcm5hbC5oCi1pbmRleCBlMzFlNmFiYi4uYTkxYTY1OWUgMTAw
NjQ0Ci0tLS0gYS9pbmNsdWRlL2x0dG5nL2V2ZW50cy1pbnRlcm5hbC5oCi0rKysgYi9pbmNsdWRl
L2x0dG5nL2V2ZW50cy1pbnRlcm5hbC5oCi1AQCAtOSw2ICs5LDcgQEAKLSAjZGVmaW5lIF9MVFRO
R19FVkVOVFNfSU5URVJOQUxfSAotIAotICNpbmNsdWRlIDx3cmFwcGVyL2NvbXBpbGVyX2F0dHJp
YnV0ZXMuaD4KLSsjaW5jbHVkZSA8d3JhcHBlci91dWlkLmg+Ci0gCi0gI2luY2x1ZGUgPGx0dG5n
L2V2ZW50cy5oPgotIAotQEAgLTI4OSw3ICsyOTAsNyBAQCBzdHJ1Y3QgbHR0bmdfbWV0YWRhdGFf
Y2FjaGUgewotIAlhdG9taWNfdCBwcm9kdWNpbmc7CQkvKiBNZXRhZGF0YSBiZWluZyBwcm9kdWNl
ZCAoaW5jb21wbGV0ZSkgKi8KLSAJc3RydWN0IGtyZWYgcmVmY291bnQ7CQkvKiBNZXRhZGF0YSBj
YWNoZSB1c2FnZSAqLwotIAlzdHJ1Y3QgbGlzdF9oZWFkIG1ldGFkYXRhX3N0cmVhbTsJLyogTWV0
YWRhdGEgc3RyZWFtIGxpc3QgKi8KLS0JdXVpZF9sZSB1dWlkOwkJCS8qIFRyYWNlIHNlc3Npb24g
dW5pcXVlIElEIChjb3B5KSAqLwotKwlndWlkX3QgdXVpZDsJCQkvKiBUcmFjZSBzZXNzaW9uIHVu
aXF1ZSBJRCAoY29weSkgKi8KLSAJc3RydWN0IG11dGV4IGxvY2s7CQkvKiBQcm9kdWNlL2NvbnN1
bWUgbG9jayAqLwotIAl1aW50NjRfdCB2ZXJzaW9uOwkJLyogQ3VycmVudCB2ZXJzaW9uIG9mIHRo
ZSBtZXRhZGF0YSAqLwotIH07Ci1AQCAtNDYzLDcgKzQ2NCw3IEBAIHN0cnVjdCBsdHRuZ19rZXJu
ZWxfc2Vzc2lvbl9wcml2YXRlIHsKLSAJc3RydWN0IGxpc3RfaGVhZCBldmVudHM7CQkvKiBFdmVu
dCBsaXN0IGhlYWQgKi8KLSAJc3RydWN0IGxpc3RfaGVhZCBsaXN0OwkJCS8qIFNlc3Npb24gbGlz
dCAqLwotIAl1bnNpZ25lZCBpbnQgZnJlZV9jaGFuX2lkOwkJLyogTmV4dCBjaGFuIElEIHRvIGFs
bG9jYXRlICovCi0tCXV1aWRfbGUgdXVpZDsJCQkJLyogVHJhY2Ugc2Vzc2lvbiB1bmlxdWUgSUQg
Ki8KLSsJZ3VpZF90IHV1aWQ7CQkJCS8qIFRyYWNlIHNlc3Npb24gdW5pcXVlIElEICovCi0gCXN0
cnVjdCBsdHRuZ19tZXRhZGF0YV9jYWNoZSAqbWV0YWRhdGFfY2FjaGU7Ci0gCXVuc2lnbmVkIGlu
dCBtZXRhZGF0YV9kdW1wZWQ6MSwKLSAJCXRzdGF0ZToxOwkJCS8qIFRyYW5zaWVudCBlbmFibGUg
c3RhdGUgKi8KLS0tIAotMi4zNC4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwv
bHR0bmcvbHR0bmctbW9kdWxlcy8wMDAzLWZpeC1idHJmcy1wYXNzLWZpbmRfZnJlZV9leHRlbnRf
Y3RsLXRvLWFsbG9jYXRvci10cmEucGF0Y2ggYi9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2x0
dG5nLW1vZHVsZXMvMDAwMy1maXgtYnRyZnMtcGFzcy1maW5kX2ZyZWVfZXh0ZW50X2N0bC10by1h
bGxvY2F0b3ItdHJhLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA4ZWNkY2Nm
NjA5Li4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvbHR0bmctbW9k
dWxlcy8wMDAzLWZpeC1idHJmcy1wYXNzLWZpbmRfZnJlZV9leHRlbnRfY3RsLXRvLWFsbG9jYXRv
ci10cmEucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwxMTYgKzAsMCBAQAotRnJvbSBkMGVlZGEz
Zjg0YmExNjQzODMxNTYxYTI0ODhjYTJlOTllOTQ3MmIxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQotRnJvbTogTWljaGFlbCBKZWFuc29uIDxtamVhbnNvbkBlZmZpY2lvcy5jb20+Ci1EYXRlOiBU
dWUsIDcgTWFyIDIwMjMgMTE6MjY6MjUgLTA1MDAKLVN1YmplY3Q6IFtQQVRDSCAzLzRdIGZpeDog
YnRyZnM6IHBhc3MgZmluZF9mcmVlX2V4dGVudF9jdGwgdG8gYWxsb2NhdG9yCi0gdHJhY2Vwb2lu
dHMgKHY2LjMpCi0KLVNlZSB1cHN0cmVhbSBjb21taXQgOgotCi0gIGNvbW1pdCBjZmMyZGUwZmNl
MDE1ZDQyNDljNjc0ZWY5ZjVlMGI0ODE3YmE1YzUzCi0gIEF1dGhvcjogQm9yaXMgQnVya292IDxi
b3Jpc0BidXIuaW8+Ci0gIERhdGU6ICAgVGh1IERlYyAxNSAxNjowNjozMSAyMDIyIC0wODAwCi0K
LSAgICBidHJmczogcGFzcyBmaW5kX2ZyZWVfZXh0ZW50X2N0bCB0byBhbGxvY2F0b3IgdHJhY2Vw
b2ludHMKLQotICAgIFRoZSBhbGxvY2F0b3IgdHJhY2Vwb2ludHMgY3VycmVudGx5IGhhdmUgYSBw
aWxlIG9mIHZhbHVlcyBmcm9tIGZmZV9jdGwuCi0gICAgSW4gbW9kaWZ5aW5nIHRoZSBhbGxvY2F0
b3IgYW5kIGFkZGluZyBtb3JlIHRyYWNlcG9pbnRzLCBJIGZvdW5kIG15c2VsZgotICAgIGFkZGlu
ZyB0byB0aGUgYWxyZWFkeSBsb25nIGFyZ3VtZW50IGxpc3Qgb2YgdGhlIHRyYWNlcG9pbnRzLiBJ
dCBtYWtlcyBpdAotICAgIGEgbG90IHNpbXBsZXIgdG8ganVzdCBzZW5kIGluIHRoZSBmZmVfY3Rs
IGl0c2VsZi4KLQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydAotCi1DaGFuZ2UtSWQ6IElhYjQx
MzJhOWQzZGYzYTYzNjk1OTFhNTBmYjc1Mzc0YjFlMzk5ZmE0Ci1TaWduZWQtb2ZmLWJ5OiBNaWNo
YWVsIEplYW5zb24gPG1qZWFuc29uQGVmZmljaW9zLmNvbT4KLVNpZ25lZC1vZmYtYnk6IE1hdGhp
ZXUgRGVzbm95ZXJzIDxtYXRoaWV1LmRlc25veWVyc0BlZmZpY2lvcy5jb20+Ci0tLS0KLSBpbmNs
dWRlL2luc3RydW1lbnRhdGlvbi9ldmVudHMvYnRyZnMuaCB8IDYwICsrKysrKysrKysrKysrKysr
KysrKysrKystCi0gMSBmaWxlIGNoYW5nZWQsIDU4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCi0KLWRpZmYgLS1naXQgYS9pbmNsdWRlL2luc3RydW1lbnRhdGlvbi9ldmVudHMvYnRyZnMu
aCBiL2luY2x1ZGUvaW5zdHJ1bWVudGF0aW9uL2V2ZW50cy9idHJmcy5oCi1pbmRleCAwMTE1NzEw
Ny4uN2M3YjliMGMgMTAwNjQ0Ci0tLS0gYS9pbmNsdWRlL2luc3RydW1lbnRhdGlvbi9ldmVudHMv
YnRyZnMuaAotKysrIGIvaW5jbHVkZS9pbnN0cnVtZW50YXRpb24vZXZlbnRzL2J0cmZzLmgKLUBA
IC0xMyw2ICsxMywxMCBAQAotICNpbmNsdWRlIDwuLi9mcy9idHJmcy9hY2Nlc3NvcnMuaD4KLSAj
ZW5kaWYKLSAKLSsjaWYgKExUVE5HX0xJTlVYX1ZFUlNJT05fQ09ERSA+PSBMVFROR19LRVJORUxf
VkVSU0lPTig2LDMsMCkpCi0rI2luY2x1ZGUgPC4uL2ZzL2J0cmZzL2V4dGVudC10cmVlLmg+Ci0r
I2VuZGlmCi0rCi0gI2lmbmRlZiBfVFJBQ0VfQlRSRlNfREVGXwotICNkZWZpbmUgX1RSQUNFX0JU
UkZTX0RFRl8KLSBzdHJ1Y3QgYnRyZnNfcm9vdDsKLUBAIC0xOTYzLDcgKzE5NjcsMjYgQEAgTFRU
TkdfVFJBQ0VQT0lOVF9FVkVOVF9JTlNUQU5DRShidHJmc19fcmVzZXJ2ZWRfZXh0ZW50LCAgYnRy
ZnNfcmVzZXJ2ZWRfZXh0ZW50X2YKLSAKLSAjZW5kaWYgLyogI2Vsc2UgI2lmIChMVFROR19MSU5V
WF9WRVJTSU9OX0NPREUgPj0gTFRUTkdfS0VSTkVMX1ZFUlNJT04oNCwxMCwwKSkgKi8KLSAKLS0j
aWYgKExUVE5HX0xJTlVYX1ZFUlNJT05fQ09ERSA+PSBMVFROR19LRVJORUxfVkVSU0lPTig1LDEw
LDApIHx8IFwKLSsjaWYgKExUVE5HX0xJTlVYX1ZFUlNJT05fQ09ERSA+PSBMVFROR19LRVJORUxf
VkVSU0lPTig2LDMsMCkpCi0rTFRUTkdfVFJBQ0VQT0lOVF9FVkVOVF9NQVAoZmluZF9mcmVlX2V4
dGVudCwKLSsKLSsJYnRyZnNfZmluZF9mcmVlX2V4dGVudCwKLSsKLSsJVFBfUFJPVE8oY29uc3Qg
c3RydWN0IGJ0cmZzX3Jvb3QgKnJvb3QsCi0rCQljb25zdCBzdHJ1Y3QgZmluZF9mcmVlX2V4dGVu
dF9jdGwgKmZmZV9jdGwpLAotKwotKwlUUF9BUkdTKHJvb3QsIGZmZV9jdGwpLAotKwotKwlUUF9G
SUVMRFMoCi0rCQljdGZfYXJyYXkodTgsIGZzaWQsIHJvb3QtPmx0dG5nX2ZzX2luZm9fZnNpZCwg
QlRSRlNfVVVJRF9TSVpFKQotKwkJY3RmX2ludGVnZXIodTY0LCByb290X29iamVjdGlkLCByb290
LT5yb290X2tleS5vYmplY3RpZCkKLSsJCWN0Zl9pbnRlZ2VyKHU2NCwgbnVtX2J5dGVzLCBmZmVf
Y3RsLT5udW1fYnl0ZXMpCi0rCQljdGZfaW50ZWdlcih1NjQsIGVtcHR5X3NpemUsIGZmZV9jdGwt
PmVtcHR5X3NpemUpCi0rCQljdGZfaW50ZWdlcih1NjQsIGZsYWdzLCBmZmVfY3RsLT5mbGFncykK
LSsJKQotKykKLSsKLSsjZWxpZiAoTFRUTkdfTElOVVhfVkVSU0lPTl9DT0RFID49IExUVE5HX0tF
Uk5FTF9WRVJTSU9OKDUsMTAsMCkgfHwgXAotIAlMVFROR19LRVJORUxfUkFOR0UoNSw5LDUsIDUs
MTAsMCkgfHwgXAotIAlMVFROR19LRVJORUxfUkFOR0UoNSw0LDc4LCA1LDUsMCkgfHwgXAotIAlM
VFROR19VQlVOVFVfS0VSTkVMX1JBTkdFKDUsOCwxOCw0NCwgNSw5LDAsMCkpCi1AQCAtMjEwMiw3
ICsyMTI1LDQwIEBAIExUVE5HX1RSQUNFUE9JTlRfRVZFTlRfTUFQKGZpbmRfZnJlZV9leHRlbnQs
Ci0gKQotICNlbmRpZgotIAotLSNpZiAoTFRUTkdfTElOVVhfVkVSU0lPTl9DT0RFID49IExUVE5H
X0tFUk5FTF9WRVJTSU9OKDUsNSwwKSkKLSsjaWYgKExUVE5HX0xJTlVYX1ZFUlNJT05fQ09ERSA+
PSBMVFROR19LRVJORUxfVkVSU0lPTig2LDMsMCkpCi0rTFRUTkdfVFJBQ0VQT0lOVF9FVkVOVF9D
TEFTUyhidHJmc19fcmVzZXJ2ZV9leHRlbnQsCi0rCi0rCVRQX1BST1RPKGNvbnN0IHN0cnVjdCBi
dHJmc19ibG9ja19ncm91cCAqYmxvY2tfZ3JvdXAsCi0rCQljb25zdCBzdHJ1Y3QgZmluZF9mcmVl
X2V4dGVudF9jdGwgKmZmZV9jdGwpLAotKwotKwlUUF9BUkdTKGJsb2NrX2dyb3VwLCBmZmVfY3Rs
KSwKLSsKLSsJVFBfRklFTERTKAotKwkJY3RmX2FycmF5KHU4LCBmc2lkLCBibG9ja19ncm91cC0+
bHR0bmdfZnNfaW5mb19mc2lkLCBCVFJGU19VVUlEX1NJWkUpCi0rCQljdGZfaW50ZWdlcih1NjQs
IGJnX29iamVjdGlkLCBibG9ja19ncm91cC0+c3RhcnQpCi0rCQljdGZfaW50ZWdlcih1NjQsIGZs
YWdzLCBibG9ja19ncm91cC0+ZmxhZ3MpCi0rCQljdGZfaW50ZWdlcih1NjQsIHN0YXJ0LCBmZmVf
Y3RsLT5zZWFyY2hfc3RhcnQpCi0rCQljdGZfaW50ZWdlcih1NjQsIGxlbiwgZmZlX2N0bC0+bnVt
X2J5dGVzKQotKwkpCi0rKQotKwotK0xUVE5HX1RSQUNFUE9JTlRfRVZFTlRfSU5TVEFOQ0UoYnRy
ZnNfX3Jlc2VydmVfZXh0ZW50LCBidHJmc19yZXNlcnZlX2V4dGVudCwKLSsKLSsJVFBfUFJPVE8o
Y29uc3Qgc3RydWN0IGJ0cmZzX2Jsb2NrX2dyb3VwICpibG9ja19ncm91cCwKLSsJCWNvbnN0IHN0
cnVjdCBmaW5kX2ZyZWVfZXh0ZW50X2N0bCAqZmZlX2N0bCksCi0rCi0rCVRQX0FSR1MoYmxvY2tf
Z3JvdXAsIGZmZV9jdGwpCi0rKQotKwotK0xUVE5HX1RSQUNFUE9JTlRfRVZFTlRfSU5TVEFOQ0Uo
YnRyZnNfX3Jlc2VydmVfZXh0ZW50LCBidHJmc19yZXNlcnZlX2V4dGVudF9jbHVzdGVyLAotKwot
KwlUUF9QUk9UTyhjb25zdCBzdHJ1Y3QgYnRyZnNfYmxvY2tfZ3JvdXAgKmJsb2NrX2dyb3VwLAot
KwkJY29uc3Qgc3RydWN0IGZpbmRfZnJlZV9leHRlbnRfY3RsICpmZmVfY3RsKSwKLSsKLSsJVFBf
QVJHUyhibG9ja19ncm91cCwgZmZlX2N0bCkKLSspCi0rCi0rI2VsaWYgKExUVE5HX0xJTlVYX1ZF
UlNJT05fQ09ERSA+PSBMVFROR19LRVJORUxfVkVSU0lPTig1LDUsMCkpCi0gTFRUTkdfVFJBQ0VQ
T0lOVF9FVkVOVF9DTEFTUyhidHJmc19fcmVzZXJ2ZV9leHRlbnQsCi0gCi0gCVRQX1BST1RPKGNv
bnN0IHN0cnVjdCBidHJmc19ibG9ja19ncm91cCAqYmxvY2tfZ3JvdXAsIHU2NCBzdGFydCwKLS0t
IAotMi4zNC4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvbHR0bmct
bW9kdWxlcy8wMDA0LWZpeC1uZXQtYWRkLWxvY2F0aW9uLXRvLXRyYWNlX2NvbnN1bWVfc2tiLXY2
LjMucGF0Y2ggYi9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2x0dG5nLW1vZHVsZXMvMDAwNC1m
aXgtbmV0LWFkZC1sb2NhdGlvbi10by10cmFjZV9jb25zdW1lX3NrYi12Ni4zLnBhdGNoCmRlbGV0
ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA1OWQ5NmRjMjJkLi4wMDAwMDAwMDAwCi0tLSBhL21l
dGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvbHR0bmctbW9kdWxlcy8wMDA0LWZpeC1uZXQtYWRkLWxv
Y2F0aW9uLXRvLXRyYWNlX2NvbnN1bWVfc2tiLXY2LjMucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAt
MSw2MiArMCwwIEBACi1Gcm9tIDEyZjQzY2FiN2RhY2VmZjBjNzNjNzgyNzZiNWE1YjljYzFkNTA1
NmYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBNaWNoYWVsIEplYW5zb24gPG1qZWFu
c29uQGVmZmljaW9zLmNvbT4KLURhdGU6IFR1ZSwgNyBNYXIgMjAyMyAxMToxMDoyNiAtMDUwMAot
U3ViamVjdDogW1BBVENIIDQvNF0gZml4OiBuZXQ6IGFkZCBsb2NhdGlvbiB0byB0cmFjZV9jb25z
dW1lX3NrYigpICh2Ni4zKQotCi1TZWUgdXBzdHJlYW0gY29tbWl0IDoKLQotICBjb21taXQgZGQx
YjUyNzgzMWEzZWQ2NTlhZmEwMWI2NzJkOGUxZjdlNmNhOTVhNQotICBBdXRob3I6IEVyaWMgRHVt
YXpldCA8ZWR1bWF6ZXRAZ29vZ2xlLmNvbT4KLSAgRGF0ZTogICBUaHUgRmViIDE2IDE1OjQ3OjE4
IDIwMjMgKzAwMDAKLQotICAgIG5ldDogYWRkIGxvY2F0aW9uIHRvIHRyYWNlX2NvbnN1bWVfc2ti
KCkKLQotICAgIGtmcmVlX3NrYigpIGluY2x1ZGVzIHRoZSBsb2NhdGlvbiwgaXQgbWFrZXMgc2Vu
c2UKLSAgICB0byBhZGQgaXQgdG8gY29uc3VtZV9za2IoKSBhcyB3ZWxsLgotCi1VcHN0cmVhbS1T
dGF0dXM6IEJhY2twb3J0Ci0KLUNoYW5nZS1JZDogSThkODcxMTg3ZDkwZTdmZTExM2E2M2UyMDli
MDBhZWJlMGRmNDc1ZjMKLVNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgSmVhbnNvbiA8bWplYW5zb25A
ZWZmaWNpb3MuY29tPgotU2lnbmVkLW9mZi1ieTogTWF0aGlldSBEZXNub3llcnMgPG1hdGhpZXUu
ZGVzbm95ZXJzQGVmZmljaW9zLmNvbT4KLS0tLQotIGluY2x1ZGUvaW5zdHJ1bWVudGF0aW9uL2V2
ZW50cy9za2IuaCB8IDE2ICsrKysrKysrKysrKysrKysKLSAxIGZpbGUgY2hhbmdlZCwgMTYgaW5z
ZXJ0aW9ucygrKQotCi1kaWZmIC0tZ2l0IGEvaW5jbHVkZS9pbnN0cnVtZW50YXRpb24vZXZlbnRz
L3NrYi5oIGIvaW5jbHVkZS9pbnN0cnVtZW50YXRpb24vZXZlbnRzL3NrYi5oCi1pbmRleCAxODY3
MzJlYS4uM2M0M2YzMmQgMTAwNjQ0Ci0tLS0gYS9pbmNsdWRlL2luc3RydW1lbnRhdGlvbi9ldmVu
dHMvc2tiLmgKLSsrKyBiL2luY2x1ZGUvaW5zdHJ1bWVudGF0aW9uL2V2ZW50cy9za2IuaAotQEAg
LTYxLDYgKzYxLDIxIEBAIExUVE5HX1RSQUNFUE9JTlRfRVZFTlRfTUFQKGtmcmVlX3NrYiwKLSAp
Ci0gI2VuZGlmCi0gCi0rI2lmIChMVFROR19MSU5VWF9WRVJTSU9OX0NPREUgPj0gTFRUTkdfS0VS
TkVMX1ZFUlNJT04oNiwzLDApKQotK0xUVE5HX1RSQUNFUE9JTlRfRVZFTlRfTUFQKGNvbnN1bWVf
c2tiLAotKwotKwlza2JfY29uc3VtZSwKLSsKLSsJVFBfUFJPVE8oc3RydWN0IHNrX2J1ZmYgKnNr
Yiwgdm9pZCAqbG9jYXRpb24pLAotKwotKwlUUF9BUkdTKHNrYiwgbG9jYXRpb24pLAotKwotKwlU
UF9GSUVMRFMoCi0rCQljdGZfaW50ZWdlcl9oZXgodm9pZCAqLCBza2JhZGRyLCBza2IpCi0rCQlj
dGZfaW50ZWdlcl9oZXgodm9pZCAqLCBsb2NhdGlvbiwgbG9jYXRpb24pCi0rCSkKLSspCi0rI2Vs
c2UKLSBMVFROR19UUkFDRVBPSU5UX0VWRU5UX01BUChjb25zdW1lX3NrYiwKLSAKLSAJc2tiX2Nv
bnN1bWUsCi1AQCAtNzMsNiArODgsNyBAQCBMVFROR19UUkFDRVBPSU5UX0VWRU5UX01BUChjb25z
dW1lX3NrYiwKLSAJCWN0Zl9pbnRlZ2VyX2hleCh2b2lkICosIHNrYmFkZHIsIHNrYikKLSAJKQot
ICkKLSsjZW5kaWYKLSAKLSBMVFROR19UUkFDRVBPSU5UX0VWRU5UKHNrYl9jb3B5X2RhdGFncmFt
X2lvdmVjLAotIAotLS0gCi0yLjM0LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5l
bC9sdHRuZy9sdHRuZy1tb2R1bGVzLzAwMDktUmVuYW1lLWdlbmhkLXdyYXBwZXItdG8tYmxrZGV2
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9sdHRuZy1tb2R1bGVzLzAwMDktUmVu
YW1lLWdlbmhkLXdyYXBwZXItdG8tYmxrZGV2LnBhdGNoCmluZGV4IDkwZmVjOWRjNTguLmVhZTAz
NDg0MWYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvbHR0bmctbW9kdWxl
cy8wMDA5LVJlbmFtZS1nZW5oZC13cmFwcGVyLXRvLWJsa2Rldi5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMta2VybmVsL2x0dG5nL2x0dG5nLW1vZHVsZXMvMDAwOS1SZW5hbWUtZ2VuaGQtd3JhcHBl
ci10by1ibGtkZXYucGF0Y2gKQEAgLTEsNyArMSw3IEBACi1Gcm9tIDgyZmJmOWQzODNmZjkwNjk4
MDhmYjBmNWY3NWM2NjAwOThkYmFlNTIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDhi
Zjk4YTk3ZmEwY2JkMzk5NDJmYjUyZmI3MWYwNzJiNGI5Zjk5Y2MgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCiBGcm9tOiBNaWNoYWVsIEplYW5zb24gPG1qZWFuc29uQGVmZmljaW9zLmNvbT4KIERh
dGU6IFR1ZSwgNSBBcHIgMjAyMiAxNDo1Nzo0MSAtMDQwMAotU3ViamVjdDogW1BBVENIIDA5LzEw
XSBSZW5hbWUgZ2VuaGQgd3JhcHBlciB0byBibGtkZXYKK1N1YmplY3Q6IFtQQVRDSF0gUmVuYW1l
IGdlbmhkIHdyYXBwZXIgdG8gYmxrZGV2CiAKIFRoZSBnZW5oZC5oIGhlYWRlciB3YXMgZm9sZGVk
IGludG8gYmxrZGV2LmggaW4gdjUuMTgsIHJlbmFtZSBvdXIgd3JhcHBlcgogdG8gZm9sbG93IHVw
c3RyZWFtLgpAQCAtMTEsNiArMTEsNyBAQCBVcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0CiBDaGFu
Z2UtSWQ6IEk0ZWM5NGZiOTRkMTE3MTJkZDIwZjA2ODBhZWExZGU3N2ZiZmE5ZDE3CiBTaWduZWQt
b2ZmLWJ5OiBNaWNoYWVsIEplYW5zb24gPG1qZWFuc29uQGVmZmljaW9zLmNvbT4KIFNpZ25lZC1v
ZmYtYnk6IE1hdGhpZXUgRGVzbm95ZXJzIDxtYXRoaWV1LmRlc25veWVyc0BlZmZpY2lvcy5jb20+
CisKIC0tLQogIGluY2x1ZGUvd3JhcHBlci97Z2VuaGQuaCA9PiBibGtkZXYuaH0gfCAxMCArKysr
Ky0tLS0tCiAgc3JjL2x0dG5nLXN0YXRlZHVtcC1pbXBsLmMgICAgICAgICAgICB8ICAyICstCkBA
IC0yMSw3ICsyMiw3IEBAIGRpZmYgLS1naXQgYS9pbmNsdWRlL3dyYXBwZXIvZ2VuaGQuaCBiL2lu
Y2x1ZGUvd3JhcHBlci9ibGtkZXYuaAogc2ltaWxhcml0eSBpbmRleCA5MyUKIHJlbmFtZSBmcm9t
IGluY2x1ZGUvd3JhcHBlci9nZW5oZC5oCiByZW5hbWUgdG8gaW5jbHVkZS93cmFwcGVyL2Jsa2Rl
di5oCi1pbmRleCA0YTU5YjY4ZS4uMGQ1YWQ5MGYgMTAwNjQ0CitpbmRleCAyOTkyY2I0Li5iNjM3
YmI5IDEwMDY0NAogLS0tIGEvaW5jbHVkZS93cmFwcGVyL2dlbmhkLmgKICsrKyBiL2luY2x1ZGUv
d3JhcHBlci9ibGtkZXYuaAogQEAgLTEsNiArMSw2IEBACkBAIC00MSw5ICs0Miw5IEBAIGluZGV4
IDRhNTliNjhlLi4wZDVhZDkwZiAxMDA2NDQKICsjaWZuZGVmIF9MVFROR19XUkFQUEVSX0JMS0RF
Vl9ICiArI2RlZmluZSBfTFRUTkdfV1JBUFBFUl9CTEtERVZfSAogIAotICNpZiAoTFRUTkdfTElO
VVhfVkVSU0lPTl9DT0RFID49IExUVE5HX0tFUk5FTF9WRVJTSU9OKDUsMTgsMCkpCi0gI2luY2x1
ZGUgPGxpbnV4L2Jsa2Rldi5oPgotQEAgLTQ1LDcgKzQ1LDcgQEAgc3RydWN0IGNsYXNzICp3cmFw
cGVyX2dldF9ibG9ja19jbGFzcyh2b2lkKQorICNpZiAoTFRUTkdfTElOVVhfVkVSU0lPTl9DT0RF
ID49IExUVE5HX0tFUk5FTF9WRVJTSU9OKDUsMTgsMCkgXAorIAl8fCBMVFROR19SSEVMX0tFUk5F
TF9SQU5HRSg1LDE0LDAsMTYyLDAsMCwgNSwxNSwwLDAsMCwwKSkKK0BAIC00Nyw3ICs0Nyw3IEBA
IHN0cnVjdCBjbGFzcyAqd3JhcHBlcl9nZXRfYmxvY2tfY2xhc3Modm9pZCkKICAvKgogICAqIENh
bmFyeSBmdW5jdGlvbiB0byBjaGVjayBmb3IgJ2Jsb2NrX2NsYXNzJyBhdCBjb21waWxlIHRpbWUu
CiAgICoKQEAgLTUyLDE0ICs1MywxNCBAQCBpbmRleCA0YTU5YjY4ZS4uMGQ1YWQ5MGYgMTAwNjQ0
CiAgICoKICAgKiAgIGV4dGVybiBzdHJ1Y3QgY2xhc3MgYmxvY2tfY2xhc3M7CiAgICovCi1AQCAt
MTA0LDQgKzEwNCw0IEBAIHN0cnVjdCBkZXZpY2VfdHlwZSAqd3JhcHBlcl9nZXRfZGlza190eXBl
KHZvaWQpCitAQCAtMTA2LDQgKzEwNiw0IEBAIHN0cnVjdCBkZXZpY2VfdHlwZSAqd3JhcHBlcl9n
ZXRfZGlza190eXBlKHZvaWQpCiAgCiAgI2VuZGlmCiAgCiAtI2VuZGlmIC8qIF9MVFROR19XUkFQ
UEVSX0dFTkhEX0ggKi8KICsjZW5kaWYgLyogX0xUVE5HX1dSQVBQRVJfQkxLREVWX0ggKi8KIGRp
ZmYgLS1naXQgYS9zcmMvbHR0bmctc3RhdGVkdW1wLWltcGwuYyBiL3NyYy9sdHRuZy1zdGF0ZWR1
bXAtaW1wbC5jCi1pbmRleCA0ZDdiMjkyMS4uMGU3NTMwOTAgMTAwNjQ0CitpbmRleCAwNjA4OGFk
Li40YTQ2NTk4IDEwMDY0NAogLS0tIGEvc3JjL2x0dG5nLXN0YXRlZHVtcC1pbXBsLmMKICsrKyBi
L3NyYy9sdHRuZy1zdGF0ZWR1bXAtaW1wbC5jCiBAQCAtNDEsNyArNDEsNyBAQApAQCAtNzEsNiAr
NzIsMyBAQCBpbmRleCA0ZDdiMjkyMS4uMGU3NTMwOTAgMTAwNjQ0CiAgI2luY2x1ZGUgPHdyYXBw
ZXIvZmlsZS5oPgogICNpbmNsdWRlIDx3cmFwcGVyL2ZkdGFibGUuaD4KICAjaW5jbHVkZSA8d3Jh
cHBlci9zY2hlZC5oPgotLS0gCi0yLjE5LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtl
cm5lbC9sdHRuZy9sdHRuZy1tb2R1bGVzXzIuMTMuOS5iYiBiL21ldGEvcmVjaXBlcy1rZXJuZWwv
bHR0bmcvbHR0bmctbW9kdWxlc18yLjEzLjEwLmJiCnNpbWlsYXJpdHkgaW5kZXggNzglCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvbHR0bmctbW9kdWxlc18yLjEzLjkuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvbHR0bmctbW9kdWxlc18yLjEzLjEw
LmJiCmluZGV4IDg1MDBmMTY4ZmYuLjkwOGM1MDVkNWQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1rZXJuZWwvbHR0bmcvbHR0bmctbW9kdWxlc18yLjEzLjkuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWtlcm5lbC9sdHRuZy9sdHRuZy1tb2R1bGVzXzIuMTMuMTAuYmIKQEAgLTExLDE2ICsxMSwxMyBA
QCBpbmNsdWRlIGx0dG5nLXBsYXRmb3Jtcy5pbmMKIAogU1JDX1VSSSA9ICJodHRwczovL2x0dG5n
Lm9yZy9maWxlcy8ke0JQTn0vJHtCUE59LSR7UFZ9LnRhci5iejIgXAogICAgICAgICAgICBmaWxl
Oi8vMDAwOS1SZW5hbWUtZ2VuaGQtd3JhcHBlci10by1ibGtkZXYucGF0Y2ggXAotICAgICAgICAg
ICBmaWxlOi8vMDAwMS1maXgtbW0taW50cm9kdWNlLXZtYS12bV9mbGFncy13cmFwcGVyLWZ1bmN0
aW9ucy12Ni4zLnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovLzAwMDItZml4LXV1aWQtRGVjb3Vw
bGUtZ3VpZF90LWFuZC11dWlkX2xlLXR5cGVzLWFuZC1yZXNwZS5wYXRjaCBcCi0gICAgICAgICAg
IGZpbGU6Ly8wMDAzLWZpeC1idHJmcy1wYXNzLWZpbmRfZnJlZV9leHRlbnRfY3RsLXRvLWFsbG9j
YXRvci10cmEucGF0Y2ggXAotICAgICAgICAgICBmaWxlOi8vMDAwNC1maXgtbmV0LWFkZC1sb2Nh
dGlvbi10by10cmFjZV9jb25zdW1lX3NrYi12Ni4zLnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTov
LzAwMDEtc3JjLUtidWlsZC1jaGFuZ2UtbWlzc2luZy1DT05GSUdfVFJBQ0VQT0lOVFMtdG8td2Fy
bi5wYXRjaCBcCiAgICAgICAgICAgICIKIAogIyBVc2UgOmFwcGVuZCBoZXJlIHNvIHRoYXQgdGhl
IHBhdGNoIGlzIGFwcGxpZWQgYWxzbyB3aGVuIHVzaW5nIGRldnVwc3RyZWFtCiBTUkNfVVJJOmFw
cGVuZCA9ICIgZmlsZTovLzAwMDEtc3JjLUtidWlsZC1jaGFuZ2UtbWlzc2luZy1DT05GSUdfVFJB
Q0VQT0lOVFMtdG8td2Fybi5wYXRjaCIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImJmODA4YjEx
MzU0NDI4N2NmZTgzN2E2MzgyODg3ZmE2NjM1NGVmNWNjODIxNjQ2MGNlYmJlZjNkMjdkYzM1ODEi
CitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMTNhYmZiMWFjODcwNzExZjBkMGFkZmE4OGU1M2IxN2Rl
YjJlMzA1MjE3MzcxNWEyNjBhNmVmMTRhYTQ1YjBhNyIKIAogZXhwb3J0IElOU1RBTExfTU9EX0RJ
Uj0ia2VybmVsL2x0dG5nLW1vZHVsZXMiCiAKLS0gCjIuMzkuMgoK

--===============3913594981392603901==--

