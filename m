Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58F3FC6379F
	for <webhook@archiver.kernel.org>; Sat,  4 Feb 2023 21:49:03 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.16754.1675547335084070219
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Feb 2023 13:48:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=l1T9LA98;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id bd15so6016241pfb.8
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Feb 2023 13:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zUwkf46KcVa3s7ov+pC313d8u7+vudbKFK9COaMMHx0=;
        b=l1T9LA98JYNQHNzgSqpsx6qIRDvqUnYymKHHH2qFN9Rd0P7HopprJIEoapGuFXykce
         wLWZS/olbBMozr0eGZbpS3kev8d0pT/8cdAXlQwIHVzcBsZzPWnBLzT1BrKYcGcU519J
         MdRHJcUx7GFeCOkkEk7fnkpmKoMH7QHZXKNuFej1URr32suIyRWjUzqYwNHRKYgFCVZ0
         55d8IydSawNGlDgNyZqCPNMZa7bzH94xhbgWFm0MUJsghNSJHwJxc36x/cGq5JsVQ6wC
         C4h6DRWlVtPCcDjp2hBrjBrFrUhFEPcmUc3nHP5H2dvc8fbInlzfw24/XM+f/3il72PR
         mFYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zUwkf46KcVa3s7ov+pC313d8u7+vudbKFK9COaMMHx0=;
        b=oH+Lx8LxwkItioYLDSffgoD79VxoP1oxxsaC7kMrgaQyTE30SWYUCzrC2KgdYnyC9p
         Wq5YbZsQLBTpLLmoNfYAkj4M8IEhJTLkTGs1wQi+OFBwe663TT7DY/nZSWyIUAV8iQYP
         8P2ExJPbkWQAL2/ULQlb+jZAb0lbwF4b5anca2cdibXkuhC+73YLamAQODtHvja3JOqP
         gvt4PktLMfixmQ0uOKHjURr4iDTUIwJfFokHWzB10kuBKcpd8euEWfGfS+WQ8Wp7eClP
         GMNr9f95VG4c3zt4Rq1mlZDdjJidsrGb6zTunaLUZMipJ0x/CYj+trkPKsKkzNJQN6YE
         g1CA==
X-Gm-Message-State: AO0yUKVEqDOc5d0DjwaBbUsrwr7k6i3tJV/4v2h/CPL/IoojoD7cdPsH
	+6AsSrleuUBYgGG8dkbTU9a32FzhH9yRnNEA2dA=
X-Google-Smtp-Source: AK7set9h7WJqxFhPzXyuIOMv+HJ5sCXoptDFke8lFQaeBr2I48Xu0Nq3k83tXBiYHHdQYJnDlLkf+g==
X-Received: by 2002:a05:6a00:248c:b0:58d:abd5:504a with SMTP id c12-20020a056a00248c00b0058dabd5504amr16634233pfv.31.1675547333002;
        Sat, 04 Feb 2023 13:48:53 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h4-20020a056a001a4400b00590774b9ea1sm4150960pfv.107.2023.02.04.13.48.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Feb 2023 13:48:52 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/12] lttng-modules: update 2.11.6 -> 2.11.7
Date: Sat,  4 Feb 2023 11:48:29 -1000
Message-Id: <f3c18d4eda42debf40dcd7de02b2f761c476dcca.1675547139.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675547139.git.steve@sakoman.com>
References: <cover.1675547139.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Feb 2023 21:49:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176771

2021-01-11 (National Clean Off Your Desk Day) LTTng modules 2.11.7
	* fix: adjust version range for trace_find_free_extent()
	* fix: backport of fix: tracepoint: Optimize using static_call() (v5.10)
	* Revert "fix: include order for older kernels"
	* fix: backport of fix: ext4: fast commit recovery path (v5.10)
	* Improve the release script
	* Add release maintainer script
	* fix: include order for older kernels
	* fix: tracepoint: Optimize using static_call() (v5.10)
	* fix: KVM: x86/mmu: Return unique RET_PF_* values if the fault was fixed (v5.10)
	* fix: kvm: x86/mmu: Add TDP MMU PF handler (v5.10)
	* fix: KVM: x86: Add intr/vectoring info and error code to kvm_exit tracepoint (v5.10)
	* fix: ext4: fast commit recovery path (v5.10)
	* fix: btrfs: make ordered extent tracepoint take btrfs_inode (v5.10)
	* fix: btrfs: tracepoints: output proper root owner for trace_find_free_extent() (v5.10)
	* fix: objtool: Rename frame.h -> objtool.h (v5.10)
	* fix: strncpy equals destination size warning

Remove patches now included in 2.11.7

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ncpy-equals-destination-size-warning.patch |  42 ---
 ...jtool-Rename-frame.h-objtool.h-v5.10.patch |  88 -----
 ...oints-output-proper-root-owner-for-t.patch | 316 ------------------
 ...rdered-extent-tracepoint-take-btrfs_.patch | 179 ----------
 ...ext4-fast-commit-recovery-path-v5.10.patch |  91 -----
 ...intr-vectoring-info-and-error-code-t.patch | 124 -------
 ...x86-mmu-Add-TDP-MMU-PF-handler-v5.10.patch |  82 -----
 ...Return-unique-RET_PF_-values-if-the-.patch |  71 ----
 ...int-Optimize-using-static_call-v5.10.patch | 155 ---------
 ...-fix-include-order-for-older-kernels.patch |  31 --
 .../0011-Add-release-maintainer-script.patch  |  59 ----
 .../0012-Improve-the-release-script.patch     | 173 ----------
 ...fix-ext4-fast-commit-recovery-path-v.patch |  32 --
 ...-fix-include-order-for-older-kernels.patch |  32 --
 ...fix-tracepoint-Optimize-using-static.patch |  46 ---
 ...ion-range-for-trace_find_free_extent.patch |  30 --
 ...ules_2.11.6.bb => lttng-modules_2.11.7.bb} |  20 +-
 17 files changed, 2 insertions(+), 1569 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-strncpy-equals-destination-size-warning.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-fix-objtool-Rename-frame.h-objtool.h-v5.10.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-fix-btrfs-tracepoints-output-proper-root-owner-for-t.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0004-fix-btrfs-make-ordered-extent-tracepoint-take-btrfs_.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0005-fix-ext4-fast-commit-recovery-path-v5.10.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0006-fix-KVM-x86-Add-intr-vectoring-info-and-error-code-t.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0007-fix-kvm-x86-mmu-Add-TDP-MMU-PF-handler-v5.10.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0008-fix-KVM-x86-mmu-Return-unique-RET_PF_-values-if-the-.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0009-fix-tracepoint-Optimize-using-static_call-v5.10.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0010-fix-include-order-for-older-kernels.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0011-Add-release-maintainer-script.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0012-Improve-the-release-script.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0013-fix-backport-of-fix-ext4-fast-commit-recovery-path-v.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0014-Revert-fix-include-order-for-older-kernels.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0015-fix-backport-of-fix-tracepoint-Optimize-using-static.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0016-fix-adjust-version-range-for-trace_find_free_extent.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.11.6.bb => lttng-modules_2.11.7.bb} (59%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-strncpy-equals-destination-size-warning.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-strncpy-equals-destination-size-warning.patch
deleted file mode 100644
index 6f82488772..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-strncpy-equals-destination-size-warning.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From cb78974394a9af865e1d2d606e838dbec0de80e8 Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Mon, 5 Oct 2020 15:31:42 -0400
-Subject: [PATCH 01/16] fix: strncpy equals destination size warning
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Some versions of GCC when called with -Wstringop-truncation will warn
-when doing a copy of the same size as the destination buffer with
-strncpy :
-
-  ‘strncpy’ specified bound 256 equals destination size [-Werror=stringop-truncation]
-
-Since we unconditionally write '\0' in the last byte, reduce the copy
-size by one.
-
-Upstream-Status: Backport
-
-Change-Id: Idb907c9550817a06fc0dffc489740f63d440e7d4
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
----
- lttng-syscalls.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lttng-syscalls.c b/lttng-syscalls.c
-index 49c0d81b..b43dd570 100644
---- a/lttng-syscalls.c
-+++ b/lttng-syscalls.c
-@@ -719,7 +719,7 @@ int fill_table(const struct trace_syscall_entry *table, size_t table_len,
- 			ev.u.syscall.abi = LTTNG_KERNEL_SYSCALL_ABI_COMPAT;
- 			break;
- 		}
--		strncpy(ev.name, desc->name, LTTNG_KERNEL_SYM_NAME_LEN);
-+		strncpy(ev.name, desc->name, LTTNG_KERNEL_SYM_NAME_LEN - 1);
- 		ev.name[LTTNG_KERNEL_SYM_NAME_LEN - 1] = '\0';
- 		ev.instrumentation = LTTNG_KERNEL_SYSCALL;
- 		chan_table[i] = _lttng_event_create(chan, &ev, filter,
--- 
-2.25.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0002-fix-objtool-Rename-frame.h-objtool.h-v5.10.patch b/meta/recipes-kernel/lttng/lttng-modules/0002-fix-objtool-Rename-frame.h-objtool.h-v5.10.patch
deleted file mode 100644
index 90d7b0cf9c..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0002-fix-objtool-Rename-frame.h-objtool.h-v5.10.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-From 8e4e8641961df32bfe519fd18d899250951acd1a Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Mon, 26 Oct 2020 13:41:02 -0400
-Subject: [PATCH 02/16] fix: objtool: Rename frame.h -> objtool.h (v5.10)
-
-See upstream commit :
-
-  commit 00089c048eb4a8250325efb32a2724fd0da68cce
-  Author: Julien Thierry <jthierry@redhat.com>
-  Date:   Fri Sep 4 16:30:25 2020 +0100
-
-    objtool: Rename frame.h -> objtool.h
-
-    Header frame.h is getting more code annotations to help objtool analyze
-    object files.
-
-    Rename the file to objtool.h.
-
-Upstream-Status: Backport
-
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Change-Id: Ic2283161bebcbf1e33b72805eb4d2628f4ae3e89
----
- lttng-filter-interpreter.c     |  2 +-
- wrapper/{frame.h => objtool.h} | 19 ++++++++++++-------
- 2 files changed, 13 insertions(+), 8 deletions(-)
- rename wrapper/{frame.h => objtool.h} (50%)
-
-diff --git a/lttng-filter-interpreter.c b/lttng-filter-interpreter.c
-index 21169f01..5d572437 100644
---- a/lttng-filter-interpreter.c
-+++ b/lttng-filter-interpreter.c
-@@ -8,7 +8,7 @@
-  */
- 
- #include <wrapper/uaccess.h>
--#include <wrapper/frame.h>
-+#include <wrapper/objtool.h>
- #include <wrapper/types.h>
- #include <linux/swab.h>
- 
-diff --git a/wrapper/frame.h b/wrapper/objtool.h
-similarity index 50%
-rename from wrapper/frame.h
-rename to wrapper/objtool.h
-index 6e6dc811..3b997cae 100644
---- a/wrapper/frame.h
-+++ b/wrapper/objtool.h
-@@ -1,18 +1,23 @@
--/* SPDX-License-Identifier: (GPL-2.0 or LGPL-2.1)
-+/* SPDX-License-Identifier: (GPL-2.0-only or LGPL-2.1-only)
-  *
-- * wrapper/frame.h
-+ * wrapper/objtool.h
-  *
-  * Copyright (C) 2016 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-  */
- 
--#ifndef _LTTNG_WRAPPER_FRAME_H
--#define _LTTNG_WRAPPER_FRAME_H
-+#ifndef _LTTNG_WRAPPER_OBJTOOL_H
-+#define _LTTNG_WRAPPER_OBJTOOL_H
- 
- #include <linux/version.h>
- 
--#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,6,0))
--
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,10,0))
-+#include <linux/objtool.h>
-+#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(4,6,0))
- #include <linux/frame.h>
-+#endif
-+
-+
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,6,0))
- 
- #define LTTNG_STACK_FRAME_NON_STANDARD(func) \
- 	STACK_FRAME_NON_STANDARD(func)
-@@ -23,4 +28,4 @@
- 
- #endif
- 
--#endif /* _LTTNG_WRAPPER_FRAME_H */
-+#endif /* _LTTNG_WRAPPER_OBJTOOL_H */
--- 
-2.25.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0003-fix-btrfs-tracepoints-output-proper-root-owner-for-t.patch b/meta/recipes-kernel/lttng/lttng-modules/0003-fix-btrfs-tracepoints-output-proper-root-owner-for-t.patch
deleted file mode 100644
index 2a100361ea..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0003-fix-btrfs-tracepoints-output-proper-root-owner-for-t.patch
+++ /dev/null
@@ -1,316 +0,0 @@
-From 5a3b76a81fd3df52405700d369223d64c7a04dc8 Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Tue, 27 Oct 2020 11:42:23 -0400
-Subject: [PATCH 03/16] fix: btrfs: tracepoints: output proper root owner for
- trace_find_free_extent() (v5.10)
-
-See upstream commit :
-
-  commit 437490fed3b0c9ae21af8f70e0f338d34560842b
-  Author: Qu Wenruo <wqu@suse.com>
-  Date:   Tue Jul 28 09:42:49 2020 +0800
-
-    btrfs: tracepoints: output proper root owner for trace_find_free_extent()
-
-    The current trace event always output result like this:
-
-     find_free_extent: root=2(EXTENT_TREE) len=16384 empty_size=0 flags=4(METADATA)
-     find_free_extent: root=2(EXTENT_TREE) len=16384 empty_size=0 flags=4(METADATA)
-     find_free_extent: root=2(EXTENT_TREE) len=8192 empty_size=0 flags=1(DATA)
-     find_free_extent: root=2(EXTENT_TREE) len=8192 empty_size=0 flags=1(DATA)
-     find_free_extent: root=2(EXTENT_TREE) len=4096 empty_size=0 flags=1(DATA)
-     find_free_extent: root=2(EXTENT_TREE) len=4096 empty_size=0 flags=1(DATA)
-
-    T's saying we're allocating data extent for EXTENT tree, which is not
-    even possible.
-
-    It's because we always use EXTENT tree as the owner for
-    trace_find_free_extent() without using the @root from
-    btrfs_reserve_extent().
-
-    This patch will change the parameter to use proper @root for
-    trace_find_free_extent():
-
-    Now it looks much better:
-
-     find_free_extent: root=5(FS_TREE) len=16384 empty_size=0 flags=36(METADATA|DUP)
-     find_free_extent: root=5(FS_TREE) len=8192 empty_size=0 flags=1(DATA)
-     find_free_extent: root=5(FS_TREE) len=16384 empty_size=0 flags=1(DATA)
-     find_free_extent: root=5(FS_TREE) len=4096 empty_size=0 flags=1(DATA)
-     find_free_extent: root=5(FS_TREE) len=8192 empty_size=0 flags=1(DATA)
-     find_free_extent: root=5(FS_TREE) len=16384 empty_size=0 flags=36(METADATA|DUP)
-     find_free_extent: root=7(CSUM_TREE) len=16384 empty_size=0 flags=36(METADATA|DUP)
-     find_free_extent: root=2(EXTENT_TREE) len=16384 empty_size=0 flags=36(METADATA|DUP)
-     find_free_extent: root=1(ROOT_TREE) len=16384 empty_size=0 flags=36(METADATA|DUP)
-
-Upstream-Status: Backport
-
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Change-Id: I1d674064d29b31417e2acffdeb735f5052a87032
----
- instrumentation/events/lttng-module/btrfs.h | 206 ++++++++++++--------
- 1 file changed, 122 insertions(+), 84 deletions(-)
-
-diff --git a/instrumentation/events/lttng-module/btrfs.h b/instrumentation/events/lttng-module/btrfs.h
-index 7b290085..52fcfd0d 100644
---- a/instrumentation/events/lttng-module/btrfs.h
-+++ b/instrumentation/events/lttng-module/btrfs.h
-@@ -1856,7 +1856,29 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__reserved_extent,  btrfs_reserved_extent_f
- 
- #endif /* #else #if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,10,0)) */
- 
--#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,5,0))
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,10,0) || \
-+	LTTNG_KERNEL_RANGE(5,9,6, 5,10,0) || \
-+	LTTNG_KERNEL_RANGE(5,4,78, 5,5,0))
-+LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
-+
-+	btrfs_find_free_extent,
-+
-+	TP_PROTO(const struct btrfs_root *root, u64 num_bytes, u64 empty_size,
-+		 u64 data),
-+
-+	TP_ARGS(root, num_bytes, empty_size, data),
-+
-+	TP_FIELDS(
-+		ctf_array(u8, fsid, root->lttng_fs_info_fsid, BTRFS_UUID_SIZE)
-+		ctf_integer(u64, root_objectid, root->root_key.objectid)
-+		ctf_integer(u64, num_bytes, num_bytes)
-+		ctf_integer(u64, empty_size, empty_size)
-+		ctf_integer(u64, data, data)
-+	)
-+)
-+
-+#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(5,5,0))
-+
- LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
- 
- 	btrfs_find_free_extent,
-@@ -1874,6 +1896,105 @@ LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
- 	)
- )
- 
-+#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(4,18,0))
-+
-+LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
-+
-+	btrfs_find_free_extent,
-+
-+	TP_PROTO(const struct btrfs_fs_info *fs_info, u64 num_bytes, u64 empty_size,
-+		 u64 data),
-+
-+	TP_ARGS(fs_info, num_bytes, empty_size, data),
-+
-+	TP_FIELDS(
-+		ctf_array(u8, fsid, lttng_fs_info_fsid, BTRFS_UUID_SIZE)
-+		ctf_integer(u64, num_bytes, num_bytes)
-+		ctf_integer(u64, empty_size, empty_size)
-+		ctf_integer(u64, data, data)
-+	)
-+)
-+
-+#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(4,14,0))
-+
-+LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
-+
-+	btrfs_find_free_extent,
-+
-+	TP_PROTO(const struct btrfs_fs_info *fs_info, u64 num_bytes, u64 empty_size,
-+		 u64 data),
-+
-+	TP_ARGS(fs_info, num_bytes, empty_size, data),
-+
-+	TP_FIELDS(
-+		ctf_array(u8, fsid, lttng_fs_info_fsid, BTRFS_UUID_SIZE)
-+		ctf_integer(u64, num_bytes, num_bytes)
-+		ctf_integer(u64, empty_size, empty_size)
-+		ctf_integer(u64, data, data)
-+	)
-+)
-+
-+#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(4,10,0))
-+
-+LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
-+
-+	btrfs_find_free_extent,
-+
-+	TP_PROTO(struct btrfs_fs_info *fs_info, u64 num_bytes, u64 empty_size,
-+		 u64 data),
-+
-+	TP_ARGS(fs_info, num_bytes, empty_size, data),
-+
-+	TP_FIELDS(
-+		ctf_array(u8, fsid, lttng_fs_info_fsid, BTRFS_UUID_SIZE)
-+		ctf_integer(u64, num_bytes, num_bytes)
-+		ctf_integer(u64, empty_size, empty_size)
-+		ctf_integer(u64, data, data)
-+	)
-+)
-+
-+#elif (LTTNG_SLE_KERNEL_RANGE(4,4,73,5,0,0, 4,4,73,6,0,0) || \
-+	LTTNG_SLE_KERNEL_RANGE(4,4,82,6,0,0, 4,4,82,7,0,0) || \
-+	LTTNG_SLE_KERNEL_RANGE(4,4,92,6,0,0, 4,4,92,7,0,0) || \
-+	LTTNG_SLE_KERNEL_RANGE(4,4,103,6,0,0, 4,5,0,0,0,0))
-+
-+LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
-+
-+	btrfs_find_free_extent,
-+
-+	TP_PROTO(const struct btrfs_root *root, u64 num_bytes, u64 empty_size,
-+		 u64 data),
-+
-+	TP_ARGS(root, num_bytes, empty_size, data),
-+
-+	TP_FIELDS(
-+		ctf_integer(u64, root_objectid, root->root_key.objectid)
-+		ctf_integer(u64, num_bytes, num_bytes)
-+		ctf_integer(u64, empty_size, empty_size)
-+		ctf_integer(u64, data, data)
-+	)
-+)
-+#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3,3,0))
-+
-+LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
-+
-+	btrfs_find_free_extent,
-+
-+	TP_PROTO(struct btrfs_root *root, u64 num_bytes, u64 empty_size,
-+		 u64 data),
-+
-+	TP_ARGS(root, num_bytes, empty_size, data),
-+
-+	TP_FIELDS(
-+		ctf_integer(u64, root_objectid, root->root_key.objectid)
-+		ctf_integer(u64, num_bytes, num_bytes)
-+		ctf_integer(u64, empty_size, empty_size)
-+		ctf_integer(u64, data, data)
-+	)
-+)
-+#endif
-+
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,5,0))
- LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__reserve_extent,
- 
- 	TP_PROTO(const struct btrfs_block_group *block_group, u64 start,
-@@ -1907,22 +2028,6 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__reserve_extent, btrfs_reserve_extent_clus
- )
- 
- #elif (LINUX_VERSION_CODE >= KERNEL_VERSION(4,18,0))
--LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
--
--	btrfs_find_free_extent,
--
--	TP_PROTO(const struct btrfs_fs_info *fs_info, u64 num_bytes, u64 empty_size,
--		 u64 data),
--
--	TP_ARGS(fs_info, num_bytes, empty_size, data),
--
--	TP_FIELDS(
--		ctf_array(u8, fsid, lttng_fs_info_fsid, BTRFS_UUID_SIZE)
--		ctf_integer(u64, num_bytes, num_bytes)
--		ctf_integer(u64, empty_size, empty_size)
--		ctf_integer(u64, data, data)
--	)
--)
- 
- LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__reserve_extent,
- 
-@@ -1957,22 +2062,6 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__reserve_extent, btrfs_reserve_extent_clus
- )
- 
- #elif (LINUX_VERSION_CODE >= KERNEL_VERSION(4,14,0))
--LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
--
--	btrfs_find_free_extent,
--
--	TP_PROTO(const struct btrfs_fs_info *fs_info, u64 num_bytes, u64 empty_size,
--		 u64 data),
--
--	TP_ARGS(fs_info, num_bytes, empty_size, data),
--
--	TP_FIELDS(
--		ctf_array(u8, fsid, lttng_fs_info_fsid, BTRFS_UUID_SIZE)
--		ctf_integer(u64, num_bytes, num_bytes)
--		ctf_integer(u64, empty_size, empty_size)
--		ctf_integer(u64, data, data)
--	)
--)
- 
- LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__reserve_extent,
- 
-@@ -2011,23 +2100,6 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__reserve_extent, btrfs_reserve_extent_clus
- 
- #elif (LINUX_VERSION_CODE >= KERNEL_VERSION(4,10,0))
- 
--LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
--
--	btrfs_find_free_extent,
--
--	TP_PROTO(struct btrfs_fs_info *fs_info, u64 num_bytes, u64 empty_size,
--		 u64 data),
--
--	TP_ARGS(fs_info, num_bytes, empty_size, data),
--
--	TP_FIELDS(
--		ctf_array(u8, fsid, lttng_fs_info_fsid, BTRFS_UUID_SIZE)
--		ctf_integer(u64, num_bytes, num_bytes)
--		ctf_integer(u64, empty_size, empty_size)
--		ctf_integer(u64, data, data)
--	)
--)
--
- LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__reserve_extent,
- 
- 	TP_PROTO(struct btrfs_fs_info *fs_info,
-@@ -2066,23 +2138,6 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__reserve_extent, btrfs_reserve_extent_clus
- 	LTTNG_SLE_KERNEL_RANGE(4,4,92,6,0,0, 4,4,92,7,0,0) || \
- 	LTTNG_SLE_KERNEL_RANGE(4,4,103,6,0,0, 4,5,0,0,0,0))
- 
--LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
--
--	btrfs_find_free_extent,
--
--	TP_PROTO(const struct btrfs_root *root, u64 num_bytes, u64 empty_size,
--		 u64 data),
--
--	TP_ARGS(root, num_bytes, empty_size, data),
--
--	TP_FIELDS(
--		ctf_integer(u64, root_objectid, root->root_key.objectid)
--		ctf_integer(u64, num_bytes, num_bytes)
--		ctf_integer(u64, empty_size, empty_size)
--		ctf_integer(u64, data, data)
--	)
--)
--
- LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__reserve_extent,
- 
- 	TP_PROTO(const struct btrfs_root *root,
-@@ -2120,23 +2175,6 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__reserve_extent, btrfs_reserve_extent_clus
- 
- #elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3,3,0))
- 
--LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
--
--	btrfs_find_free_extent,
--
--	TP_PROTO(struct btrfs_root *root, u64 num_bytes, u64 empty_size,
--		 u64 data),
--
--	TP_ARGS(root, num_bytes, empty_size, data),
--
--	TP_FIELDS(
--		ctf_integer(u64, root_objectid, root->root_key.objectid)
--		ctf_integer(u64, num_bytes, num_bytes)
--		ctf_integer(u64, empty_size, empty_size)
--		ctf_integer(u64, data, data)
--	)
--)
--
- LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__reserve_extent,
- 
- 	TP_PROTO(struct btrfs_root *root,
--- 
-2.25.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0004-fix-btrfs-make-ordered-extent-tracepoint-take-btrfs_.patch b/meta/recipes-kernel/lttng/lttng-modules/0004-fix-btrfs-make-ordered-extent-tracepoint-take-btrfs_.patch
deleted file mode 100644
index 67025418c3..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0004-fix-btrfs-make-ordered-extent-tracepoint-take-btrfs_.patch
+++ /dev/null
@@ -1,179 +0,0 @@
-From d51a3332909ff034c8ec16ead0090bd6a4e2bc38 Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Tue, 27 Oct 2020 12:10:05 -0400
-Subject: [PATCH 04/16] fix: btrfs: make ordered extent tracepoint take
- btrfs_inode (v5.10)
-
-See upstream commit :
-
-  commit acbf1dd0fcbd10c67826a19958f55a053b32f532
-  Author: Nikolay Borisov <nborisov@suse.com>
-  Date:   Mon Aug 31 14:42:40 2020 +0300
-
-    btrfs: make ordered extent tracepoint take btrfs_inode
-
-Upstream-Status: Backport
-
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Change-Id: I096d0801ffe0ad826cfe414cdd1c0857cbd2b624
----
- instrumentation/events/lttng-module/btrfs.h | 120 +++++++++++++++-----
- 1 file changed, 90 insertions(+), 30 deletions(-)
-
-diff --git a/instrumentation/events/lttng-module/btrfs.h b/instrumentation/events/lttng-module/btrfs.h
-index 52fcfd0d..d47f3280 100644
---- a/instrumentation/events/lttng-module/btrfs.h
-+++ b/instrumentation/events/lttng-module/btrfs.h
-@@ -346,7 +346,29 @@ LTTNG_TRACEPOINT_EVENT(btrfs_handle_em_exist,
- )
- #endif
- 
--#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,6,0))
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,10,0))
-+LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__ordered_extent,
-+
-+	TP_PROTO(const struct btrfs_inode *inode,
-+		 const struct btrfs_ordered_extent *ordered),
-+
-+	TP_ARGS(inode, ordered),
-+
-+	TP_FIELDS(
-+		ctf_array(u8, fsid, inode->root->lttng_fs_info_fsid, BTRFS_UUID_SIZE)
-+		ctf_integer(ino_t, ino, btrfs_ino(inode))
-+		ctf_integer(u64, file_offset, ordered->file_offset)
-+		ctf_integer(u64, start, ordered->disk_bytenr)
-+		ctf_integer(u64, len, ordered->num_bytes)
-+		ctf_integer(u64, disk_len, ordered->disk_num_bytes)
-+		ctf_integer(u64, bytes_left, ordered->bytes_left)
-+		ctf_integer(unsigned long, flags, ordered->flags)
-+		ctf_integer(int, compress_type, ordered->compress_type)
-+		ctf_integer(int, refs, refcount_read(&ordered->refs))
-+		ctf_integer(u64, root_objectid, inode->root->root_key.objectid)
-+	)
-+)
-+#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(5,6,0))
- LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__ordered_extent,
- 
- 	TP_PROTO(const struct inode *inode,
-@@ -458,7 +480,39 @@ LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__ordered_extent,
- )
- #endif
- 
--#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,14,0) || \
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,10,0))
-+LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__ordered_extent, btrfs_ordered_extent_add,
-+
-+	TP_PROTO(const struct btrfs_inode *inode,
-+		 const struct btrfs_ordered_extent *ordered),
-+
-+	TP_ARGS(inode, ordered)
-+)
-+
-+LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__ordered_extent, btrfs_ordered_extent_remove,
-+
-+	TP_PROTO(const struct btrfs_inode *inode,
-+		 const struct btrfs_ordered_extent *ordered),
-+
-+	TP_ARGS(inode, ordered)
-+)
-+
-+LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__ordered_extent, btrfs_ordered_extent_start,
-+
-+	TP_PROTO(const struct btrfs_inode *inode,
-+		 const struct btrfs_ordered_extent *ordered),
-+
-+	TP_ARGS(inode, ordered)
-+)
-+
-+LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__ordered_extent, btrfs_ordered_extent_put,
-+
-+	TP_PROTO(const struct btrfs_inode *inode,
-+		 const struct btrfs_ordered_extent *ordered),
-+
-+	TP_ARGS(inode, ordered)
-+)
-+#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(4,14,0) || \
- 	LTTNG_SLE_KERNEL_RANGE(4,4,73,5,0,0, 4,4,73,6,0,0) || \
- 	LTTNG_SLE_KERNEL_RANGE(4,4,82,6,0,0, 4,4,82,7,0,0) || \
- 	LTTNG_SLE_KERNEL_RANGE(4,4,92,6,0,0, 4,4,92,7,0,0) || \
-@@ -494,7 +548,41 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__ordered_extent, btrfs_ordered_extent_put,
- 
- 	TP_ARGS(inode, ordered)
- )
-+#else
-+LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__ordered_extent, btrfs_ordered_extent_add,
-+
-+	TP_PROTO(struct inode *inode, struct btrfs_ordered_extent *ordered),
-+
-+	TP_ARGS(inode, ordered)
-+)
-+
-+LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__ordered_extent, btrfs_ordered_extent_remove,
-+
-+	TP_PROTO(struct inode *inode, struct btrfs_ordered_extent *ordered),
-+
-+	TP_ARGS(inode, ordered)
-+)
-+
-+LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__ordered_extent, btrfs_ordered_extent_start,
-+
-+	TP_PROTO(struct inode *inode, struct btrfs_ordered_extent *ordered),
-+
-+	TP_ARGS(inode, ordered)
-+)
- 
-+LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__ordered_extent, btrfs_ordered_extent_put,
-+
-+	TP_PROTO(struct inode *inode, struct btrfs_ordered_extent *ordered),
-+
-+	TP_ARGS(inode, ordered)
-+)
-+#endif
-+
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,14,0) || \
-+	LTTNG_SLE_KERNEL_RANGE(4,4,73,5,0,0, 4,4,73,6,0,0) || \
-+	LTTNG_SLE_KERNEL_RANGE(4,4,82,6,0,0, 4,4,82,7,0,0) || \
-+	LTTNG_SLE_KERNEL_RANGE(4,4,92,6,0,0, 4,4,92,7,0,0) || \
-+	LTTNG_SLE_KERNEL_RANGE(4,4,103,6,0,0, 4,5,0,0,0,0))
- LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__writepage,
- 
- 	TP_PROTO(const struct page *page, const struct inode *inode,
-@@ -563,34 +651,6 @@ LTTNG_TRACEPOINT_EVENT(btrfs_sync_file,
- 	)
- )
- #else
--LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__ordered_extent, btrfs_ordered_extent_add,
--
--	TP_PROTO(struct inode *inode, struct btrfs_ordered_extent *ordered),
--
--	TP_ARGS(inode, ordered)
--)
--
--LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__ordered_extent, btrfs_ordered_extent_remove,
--
--	TP_PROTO(struct inode *inode, struct btrfs_ordered_extent *ordered),
--
--	TP_ARGS(inode, ordered)
--)
--
--LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__ordered_extent, btrfs_ordered_extent_start,
--
--	TP_PROTO(struct inode *inode, struct btrfs_ordered_extent *ordered),
--
--	TP_ARGS(inode, ordered)
--)
--
--LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__ordered_extent, btrfs_ordered_extent_put,
--
--	TP_PROTO(struct inode *inode, struct btrfs_ordered_extent *ordered),
--
--	TP_ARGS(inode, ordered)
--)
--
- LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__writepage,
- 
- 	TP_PROTO(struct page *page, struct inode *inode,
--- 
-2.25.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0005-fix-ext4-fast-commit-recovery-path-v5.10.patch b/meta/recipes-kernel/lttng/lttng-modules/0005-fix-ext4-fast-commit-recovery-path-v5.10.patch
deleted file mode 100644
index 63d97fa4a3..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0005-fix-ext4-fast-commit-recovery-path-v5.10.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From b96f5364ba4d5a8b9e8159fe0b9e20d598a1c0f5 Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Mon, 26 Oct 2020 17:03:23 -0400
-Subject: [PATCH 05/16] fix: ext4: fast commit recovery path (v5.10)
-
-See upstream commit :
-
-  commit 8016e29f4362e285f0f7e38fadc61a5b7bdfdfa2
-  Author: Harshad Shirwadkar <harshadshirwadkar@gmail.com>
-  Date:   Thu Oct 15 13:37:59 2020 -0700
-
-    ext4: fast commit recovery path
-
-    This patch adds fast commit recovery path support for Ext4 file
-    system. We add several helper functions that are similar in spirit to
-    e2fsprogs journal recovery path handlers. Example of such functions
-    include - a simple block allocator, idempotent block bitmap update
-    function etc. Using these routines and the fast commit log in the fast
-    commit area, the recovery path (ext4_fc_replay()) performs fast commit
-    log recovery.
-
-Upstream-Status: Backport
-
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Change-Id: Ia65cf44e108f2df0b458f0d335f33a8f18f50baa
----
- instrumentation/events/lttng-module/ext4.h | 40 ++++++++++++++++++++++
- 1 file changed, 40 insertions(+)
-
-diff --git a/instrumentation/events/lttng-module/ext4.h b/instrumentation/events/lttng-module/ext4.h
-index f9a55e29..5fddccad 100644
---- a/instrumentation/events/lttng-module/ext4.h
-+++ b/instrumentation/events/lttng-module/ext4.h
-@@ -1423,6 +1423,18 @@ LTTNG_TRACEPOINT_EVENT(ext4_ext_load_extent,
- 	)
- )
- 
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,10,0))
-+LTTNG_TRACEPOINT_EVENT(ext4_load_inode,
-+	TP_PROTO(struct super_block *sb, unsigned long ino),
-+
-+	TP_ARGS(sb, ino),
-+
-+	TP_FIELDS(
-+		ctf_integer(dev_t, dev, sb->s_dev)
-+		ctf_integer(ino_t, ino, ino)
-+	)
-+)
-+#else
- LTTNG_TRACEPOINT_EVENT(ext4_load_inode,
- 	TP_PROTO(struct inode *inode),
- 
-@@ -2045,6 +2057,34 @@ LTTNG_TRACEPOINT_EVENT(ext4_es_shrink_exit,
- 
- #endif
- 
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,10,0))
-+LTTNG_TRACEPOINT_EVENT(ext4_fc_replay_scan,
-+	TP_PROTO(struct super_block *sb, int error, int off),
-+
-+	TP_ARGS(sb, error, off),
-+
-+	TP_FIELDS(
-+		ctf_integer(dev_t, dev, sb->s_dev)
-+		ctf_integer(int, error, error)
-+		ctf_integer(int, off, off)
-+	)
-+)
-+
-+LTTNG_TRACEPOINT_EVENT(ext4_fc_replay,
-+	TP_PROTO(struct super_block *sb, int tag, int ino, int priv1, int priv2),
-+
-+	TP_ARGS(sb, tag, ino, priv1, priv2),
-+
-+	TP_FIELDS(
-+		ctf_integer(dev_t, dev, sb->s_dev)
-+		ctf_integer(int, tag, tag)
-+		ctf_integer(int, ino, ino)
-+		ctf_integer(int, priv1, priv1)
-+		ctf_integer(int, priv2, priv2)
-+	)
-+)
-+#endif
-+
- #endif /* LTTNG_TRACE_EXT4_H */
- 
- /* This part must be outside protection */
--- 
-2.25.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0006-fix-KVM-x86-Add-intr-vectoring-info-and-error-code-t.patch b/meta/recipes-kernel/lttng/lttng-modules/0006-fix-KVM-x86-Add-intr-vectoring-info-and-error-code-t.patch
deleted file mode 100644
index 56c563cea3..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0006-fix-KVM-x86-Add-intr-vectoring-info-and-error-code-t.patch
+++ /dev/null
@@ -1,124 +0,0 @@
-From a6334775b763c187d84914e89a0b835a793ae0fd Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Mon, 26 Oct 2020 14:11:17 -0400
-Subject: [PATCH 06/16] fix: KVM: x86: Add intr/vectoring info and error code
- to kvm_exit tracepoint (v5.10)
-
-See upstream commit :
-
-  commit 235ba74f008d2e0936b29f77f68d4e2f73ffd24a
-  Author: Sean Christopherson <sean.j.christopherson@intel.com>
-  Date:   Wed Sep 23 13:13:46 2020 -0700
-
-    KVM: x86: Add intr/vectoring info and error code to kvm_exit tracepoint
-
-    Extend the kvm_exit tracepoint to align it with kvm_nested_vmexit in
-    terms of what information is captured.  On SVM, add interrupt info and
-    error code, while on VMX it add IDT vectoring and error code.  This
-    sets the stage for macrofying the kvm_exit tracepoint definition so that
-    it can be reused for kvm_nested_vmexit without loss of information.
-
-    Opportunistically stuff a zero for VM_EXIT_INTR_INFO if the VM-Enter
-    failed, as the field is guaranteed to be invalid.  Note, it'd be
-    possible to further filter the interrupt/exception fields based on the
-    VM-Exit reason, but the helper is intended only for tracepoints, i.e.
-    an extra VMREAD or two is a non-issue, the failed VM-Enter case is just
-    low hanging fruit.
-
-Upstream-Status: Backport
-
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Change-Id: I638fa29ef7d8bb432de42a33f9ae4db43259b915
----
- .../events/lttng-module/arch/x86/kvm/trace.h  | 55 ++++++++++++++++++-
- 1 file changed, 53 insertions(+), 2 deletions(-)
-
-diff --git a/instrumentation/events/lttng-module/arch/x86/kvm/trace.h b/instrumentation/events/lttng-module/arch/x86/kvm/trace.h
-index 4416ae02..0917b51f 100644
---- a/instrumentation/events/lttng-module/arch/x86/kvm/trace.h
-+++ b/instrumentation/events/lttng-module/arch/x86/kvm/trace.h
-@@ -115,6 +115,37 @@ LTTNG_TRACEPOINT_EVENT_MAP(kvm_apic, kvm_x86_apic,
- /*
-  * Tracepoint for kvm guest exit:
-  */
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,10,0))
-+LTTNG_TRACEPOINT_EVENT_CODE_MAP(kvm_exit, kvm_x86_exit,
-+	TP_PROTO(unsigned int exit_reason, struct kvm_vcpu *vcpu, u32 isa),
-+	TP_ARGS(exit_reason, vcpu, isa),
-+
-+	TP_locvar(
-+		u64 info1, info2;
-+		u32 intr_info, error_code;
-+	),
-+
-+	TP_code_pre(
-+		kvm_x86_ops.get_exit_info(vcpu, &tp_locvar->info1,
-+				&tp_locvar->info2,
-+				&tp_locvar->intr_info,
-+				&tp_locvar->error_code);
-+	),
-+
-+	TP_FIELDS(
-+		ctf_integer(unsigned int, exit_reason, exit_reason)
-+		ctf_integer(unsigned long, guest_rip, kvm_rip_read(vcpu))
-+		ctf_integer(u32, isa, isa)
-+		ctf_integer(u64, info1, tp_locvar->info1)
-+		ctf_integer(u64, info2, tp_locvar->info2)
-+		ctf_integer(u32, intr_info, tp_locvar->intr_info)
-+		ctf_integer(u32, error_code, tp_locvar->error_code)
-+		ctf_integer(unsigned int, vcpu_id, vcpu->vcpu_id)
-+	),
-+
-+	TP_code_post()
-+)
-+#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(5,7,0))
- LTTNG_TRACEPOINT_EVENT_CODE_MAP(kvm_exit, kvm_x86_exit,
- 	TP_PROTO(unsigned int exit_reason, struct kvm_vcpu *vcpu, u32 isa),
- 	TP_ARGS(exit_reason, vcpu, isa),
-@@ -124,13 +155,32 @@ LTTNG_TRACEPOINT_EVENT_CODE_MAP(kvm_exit, kvm_x86_exit,
- 	),
- 
- 	TP_code_pre(
--#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,7,0))
- 		kvm_x86_ops.get_exit_info(vcpu, &tp_locvar->info1,
- 				&tp_locvar->info2);
-+	),
-+
-+	TP_FIELDS(
-+		ctf_integer(unsigned int, exit_reason, exit_reason)
-+		ctf_integer(unsigned long, guest_rip, kvm_rip_read(vcpu))
-+		ctf_integer(u32, isa, isa)
-+		ctf_integer(u64, info1, tp_locvar->info1)
-+		ctf_integer(u64, info2, tp_locvar->info2)
-+	),
-+
-+	TP_code_post()
-+)
- #else
-+LTTNG_TRACEPOINT_EVENT_CODE_MAP(kvm_exit, kvm_x86_exit,
-+	TP_PROTO(unsigned int exit_reason, struct kvm_vcpu *vcpu, u32 isa),
-+	TP_ARGS(exit_reason, vcpu, isa),
-+
-+	TP_locvar(
-+		u64 info1, info2;
-+	),
-+
-+	TP_code_pre(
- 		kvm_x86_ops->get_exit_info(vcpu, &tp_locvar->info1,
- 				&tp_locvar->info2);
--#endif
- 	),
- 
- 	TP_FIELDS(
-@@ -143,6 +193,7 @@ LTTNG_TRACEPOINT_EVENT_CODE_MAP(kvm_exit, kvm_x86_exit,
- 
- 	TP_code_post()
- )
-+#endif
- 
- /*
-  * Tracepoint for kvm interrupt injection:
--- 
-2.25.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0007-fix-kvm-x86-mmu-Add-TDP-MMU-PF-handler-v5.10.patch b/meta/recipes-kernel/lttng/lttng-modules/0007-fix-kvm-x86-mmu-Add-TDP-MMU-PF-handler-v5.10.patch
deleted file mode 100644
index d78a8c25c7..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0007-fix-kvm-x86-mmu-Add-TDP-MMU-PF-handler-v5.10.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From 2f421c43c60b2c9d3ed63c1a363320e98a536a35 Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Mon, 26 Oct 2020 14:28:35 -0400
-Subject: [PATCH 07/16] fix: kvm: x86/mmu: Add TDP MMU PF handler (v5.10)
-
-See upstream commit :
-
-  commit bb18842e21111a979e2e0e1c5d85c09646f18d51
-  Author: Ben Gardon <bgardon@google.com>
-  Date:   Wed Oct 14 11:26:50 2020 -0700
-
-    kvm: x86/mmu: Add TDP MMU PF handler
-
-    Add functions to handle page faults in the TDP MMU. These page faults
-    are currently handled in much the same way as the x86 shadow paging
-    based MMU, however the ordering of some operations is slightly
-    different. Future patches will add eager NX splitting, a fast page fault
-    handler, and parallel page faults.
-
-    Tested by running kvm-unit-tests and KVM selftests on an Intel Haswell
-    machine. This series introduced no new failures.
-
-Upstream-Status: Backport
-
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Change-Id: Ie56959cb6c77913d2f1188b0ca15da9114623a4e
----
- .../lttng-module/arch/x86/kvm/mmutrace.h      | 20 ++++++++++++++++++-
- probes/lttng-probe-kvm-x86-mmu.c              |  5 +++++
- 2 files changed, 24 insertions(+), 1 deletion(-)
-
-diff --git a/instrumentation/events/lttng-module/arch/x86/kvm/mmutrace.h b/instrumentation/events/lttng-module/arch/x86/kvm/mmutrace.h
-index e5470400..86717835 100644
---- a/instrumentation/events/lttng-module/arch/x86/kvm/mmutrace.h
-+++ b/instrumentation/events/lttng-module/arch/x86/kvm/mmutrace.h
-@@ -163,7 +163,25 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(kvm_mmu_page_class, kvm_mmu_prepare_zap_page,
- 	TP_ARGS(sp)
- )
- 
--#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,11,0))
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,10,0))
-+
-+LTTNG_TRACEPOINT_EVENT_MAP(
-+	mark_mmio_spte,
-+
-+	kvm_mmu_mark_mmio_spte,
-+
-+	TP_PROTO(u64 *sptep, gfn_t gfn, u64 spte),
-+	TP_ARGS(sptep, gfn, spte),
-+
-+	TP_FIELDS(
-+		ctf_integer_hex(void *, sptep, sptep)
-+		ctf_integer(gfn_t, gfn, gfn)
-+		ctf_integer(unsigned, access, spte & ACC_ALL)
-+		ctf_integer(unsigned int, gen, get_mmio_spte_generation(spte))
-+	)
-+)
-+
-+#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3,11,0))
- 
- LTTNG_TRACEPOINT_EVENT_MAP(
- 	mark_mmio_spte,
-diff --git a/probes/lttng-probe-kvm-x86-mmu.c b/probes/lttng-probe-kvm-x86-mmu.c
-index 8f981865..5043c776 100644
---- a/probes/lttng-probe-kvm-x86-mmu.c
-+++ b/probes/lttng-probe-kvm-x86-mmu.c
-@@ -31,6 +31,11 @@
- #include <../../arch/x86/kvm/mmutrace.h>
- #endif
- 
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,10,0))
-+#include <../arch/x86/kvm/mmu.h>
-+#include <../arch/x86/kvm/mmu/spte.h>
-+#endif
-+
- #undef TRACE_INCLUDE_PATH
- #undef TRACE_INCLUDE_FILE
- 
--- 
-2.25.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0008-fix-KVM-x86-mmu-Return-unique-RET_PF_-values-if-the-.patch b/meta/recipes-kernel/lttng/lttng-modules/0008-fix-KVM-x86-mmu-Return-unique-RET_PF_-values-if-the-.patch
deleted file mode 100644
index a71bb728f0..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0008-fix-KVM-x86-mmu-Return-unique-RET_PF_-values-if-the-.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 14bbccffa579f4d66e2900843d6afae1294ce7c8 Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Mon, 26 Oct 2020 17:07:13 -0400
-Subject: [PATCH 08/16] fix: KVM: x86/mmu: Return unique RET_PF_* values if the
- fault was fixed (v5.10)
-
-See upstream commit :
-
-  commit c4371c2a682e0da1ed2cd7e3c5496f055d873554
-  Author: Sean Christopherson <sean.j.christopherson@intel.com>
-  Date:   Wed Sep 23 15:04:24 2020 -0700
-
-    KVM: x86/mmu: Return unique RET_PF_* values if the fault was fixed
-
-    Introduce RET_PF_FIXED and RET_PF_SPURIOUS to provide unique return
-    values instead of overloading RET_PF_RETRY.  In the short term, the
-    unique values add clarity to the code and RET_PF_SPURIOUS will be used
-    by set_spte() to avoid unnecessary work for spurious faults.
-
-    In the long term, TDX will use RET_PF_FIXED to deterministically map
-    memory during pre-boot.  The page fault flow may bail early for benign
-    reasons, e.g. if the mmu_notifier fires for an unrelated address.  With
-    only RET_PF_RETRY, it's impossible for the caller to distinguish between
-    "cool, page is mapped" and "darn, need to try again", and thus cannot
-    handle benign cases like the mmu_notifier retry.
-
-Upstream-Status: Backport
-
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Change-Id: Ie0855c78852b45f588e131fe2463e15aae1bc023
----
- .../lttng-module/arch/x86/kvm/mmutrace.h      | 22 ++++++++++++++++++-
- 1 file changed, 21 insertions(+), 1 deletion(-)
-
-diff --git a/instrumentation/events/lttng-module/arch/x86/kvm/mmutrace.h b/instrumentation/events/lttng-module/arch/x86/kvm/mmutrace.h
-index 86717835..cdf0609f 100644
---- a/instrumentation/events/lttng-module/arch/x86/kvm/mmutrace.h
-+++ b/instrumentation/events/lttng-module/arch/x86/kvm/mmutrace.h
-@@ -233,7 +233,27 @@ LTTNG_TRACEPOINT_EVENT_MAP(
- 	)
- )
- 
--#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,6,0) || \
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,10,0))
-+LTTNG_TRACEPOINT_EVENT_MAP(
-+	fast_page_fault,
-+
-+	kvm_mmu_fast_page_fault,
-+
-+	TP_PROTO(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa, u32 error_code,
-+		 u64 *sptep, u64 old_spte, int ret),
-+	TP_ARGS(vcpu, cr2_or_gpa, error_code, sptep, old_spte, ret),
-+
-+	TP_FIELDS(
-+		ctf_integer(int, vcpu_id, vcpu->vcpu_id)
-+		ctf_integer(gpa_t, cr2_or_gpa, cr2_or_gpa)
-+		ctf_integer(u32, error_code, error_code)
-+		ctf_integer_hex(u64 *, sptep, sptep)
-+		ctf_integer(u64, old_spte, old_spte)
-+		ctf_integer(u64, new_spte, *sptep)
-+		ctf_integer(int, ret, ret)
-+	)
-+)
-+#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(5,6,0) || \
- 	LTTNG_KERNEL_RANGE(4,19,103, 4,20,0) || \
- 	LTTNG_KERNEL_RANGE(5,4,19, 5,5,0) || \
- 	LTTNG_KERNEL_RANGE(5,5,3, 5,6,0) || \
--- 
-2.25.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0009-fix-tracepoint-Optimize-using-static_call-v5.10.patch b/meta/recipes-kernel/lttng/lttng-modules/0009-fix-tracepoint-Optimize-using-static_call-v5.10.patch
deleted file mode 100644
index b942aa5c95..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0009-fix-tracepoint-Optimize-using-static_call-v5.10.patch
+++ /dev/null
@@ -1,155 +0,0 @@
-From c6b31b349fe901a8f586a66064f9e9b15449ac1c Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Mon, 26 Oct 2020 17:09:05 -0400
-Subject: [PATCH 09/16] fix: tracepoint: Optimize using static_call() (v5.10)
-
-See upstream commit :
-
-  commit d25e37d89dd2f41d7acae0429039d2f0ae8b4a07
-  Author: Steven Rostedt (VMware) <rostedt@goodmis.org>
-  Date:   Tue Aug 18 15:57:52 2020 +0200
-
-    tracepoint: Optimize using static_call()
-
-    Currently the tracepoint site will iterate a vector and issue indirect
-    calls to however many handlers are registered (ie. the vector is
-    long).
-
-    Using static_call() it is possible to optimize this for the common
-    case of only having a single handler registered. In this case the
-    static_call() can directly call this handler. Otherwise, if the vector
-    is longer than 1, call a function that iterates the whole vector like
-    the current code.
-
-Upstream-Status: Backport
-
-Change-Id: I739dd84d62cc1a821b8bd8acff74fa29aa25d22f
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- lttng-statedump-impl.c    | 44 ++++++++++++++++++++++++++++++++-------
- probes/lttng.c            |  7 +++++--
- tests/probes/lttng-test.c |  7 ++++++-
- wrapper/tracepoint.h      |  8 +++++++
- 4 files changed, 56 insertions(+), 10 deletions(-)
-
-diff --git a/lttng-statedump-impl.c b/lttng-statedump-impl.c
-index 54a309d1..e0b19b42 100644
---- a/lttng-statedump-impl.c
-+++ b/lttng-statedump-impl.c
-@@ -55,13 +55,43 @@
- #define LTTNG_INSTRUMENTATION
- #include <instrumentation/events/lttng-module/lttng-statedump.h>
- 
--DEFINE_TRACE(lttng_statedump_block_device);
--DEFINE_TRACE(lttng_statedump_end);
--DEFINE_TRACE(lttng_statedump_interrupt);
--DEFINE_TRACE(lttng_statedump_file_descriptor);
--DEFINE_TRACE(lttng_statedump_start);
--DEFINE_TRACE(lttng_statedump_process_state);
--DEFINE_TRACE(lttng_statedump_network_interface);
-+LTTNG_DEFINE_TRACE(lttng_statedump_block_device,
-+	TP_PROTO(struct lttng_session *session,
-+		dev_t dev, const char *diskname),
-+	TP_ARGS(session, dev, diskname));
-+
-+LTTNG_DEFINE_TRACE(lttng_statedump_end,
-+	TP_PROTO(struct lttng_session *session),
-+	TP_ARGS(session));
-+
-+LTTNG_DEFINE_TRACE(lttng_statedump_interrupt,
-+	TP_PROTO(struct lttng_session *session,
-+		unsigned int irq, const char *chip_name,
-+		struct irqaction *action),
-+	TP_ARGS(session, irq, chip_name, action));
-+
-+LTTNG_DEFINE_TRACE(lttng_statedump_file_descriptor,
-+	TP_PROTO(struct lttng_session *session,
-+		struct files_struct *files,
-+		int fd, const char *filename,
-+		unsigned int flags, fmode_t fmode),
-+	TP_ARGS(session, files, fd, filename, flags, fmode));
-+
-+LTTNG_DEFINE_TRACE(lttng_statedump_start,
-+	TP_PROTO(struct lttng_session *session),
-+	TP_ARGS(session));
-+
-+LTTNG_DEFINE_TRACE(lttng_statedump_process_state,
-+	TP_PROTO(struct lttng_session *session,
-+		struct task_struct *p,
-+		int type, int mode, int submode, int status,
-+		struct files_struct *files),
-+	TP_ARGS(session, p, type, mode, submode, status, files));
-+
-+LTTNG_DEFINE_TRACE(lttng_statedump_network_interface,
-+	TP_PROTO(struct lttng_session *session,
-+		struct net_device *dev, struct in_ifaddr *ifa),
-+	TP_ARGS(session, dev, ifa));
- 
- struct lttng_fd_ctx {
- 	char *page;
-diff --git a/probes/lttng.c b/probes/lttng.c
-index 05bc1388..7ddaa69f 100644
---- a/probes/lttng.c
-+++ b/probes/lttng.c
-@@ -8,7 +8,7 @@
-  */
- 
- #include <linux/module.h>
--#include <linux/tracepoint.h>
-+#include <wrapper/tracepoint.h>
- #include <linux/uaccess.h>
- #include <linux/gfp.h>
- #include <linux/fs.h>
-@@ -32,7 +32,10 @@
- #define LTTNG_LOGGER_COUNT_MAX	1024
- #define LTTNG_LOGGER_FILE	"lttng-logger"
- 
--DEFINE_TRACE(lttng_logger);
-+LTTNG_DEFINE_TRACE(lttng_logger,
-+	PARAMS(const char __user *text, size_t len),
-+	PARAMS(text, len)
-+);
- 
- static struct proc_dir_entry *lttng_logger_dentry;
- 
-diff --git a/tests/probes/lttng-test.c b/tests/probes/lttng-test.c
-index c728bed5..8f2d3feb 100644
---- a/tests/probes/lttng-test.c
-+++ b/tests/probes/lttng-test.c
-@@ -26,7 +26,12 @@
- #define LTTNG_INSTRUMENTATION
- #include <instrumentation/events/lttng-module/lttng-test.h>
- 
--DEFINE_TRACE(lttng_test_filter_event);
-+LTTNG_DEFINE_TRACE(lttng_test_filter_event,
-+	PARAMS(int anint, int netint, long *values,
-+		char *text, size_t textlen,
-+		char *etext, uint32_t * net_values),
-+	PARAMS(anint, netint, values, text, textlen, etext, net_values)
-+);
- 
- #define LTTNG_TEST_FILTER_EVENT_FILE	"lttng-test-filter-event"
- 
-diff --git a/wrapper/tracepoint.h b/wrapper/tracepoint.h
-index 3883e11a..758038b6 100644
---- a/wrapper/tracepoint.h
-+++ b/wrapper/tracepoint.h
-@@ -20,6 +20,14 @@
- 
- #endif
- 
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,10,0))
-+#define LTTNG_DEFINE_TRACE(name, proto, args)		\
-+	DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
-+#else
-+#define LTTNG_DEFINE_TRACE(name, proto, args)		\
-+	DEFINE_TRACE(name)
-+#endif
-+
- #ifndef HAVE_KABI_2635_TRACEPOINT
- 
- #define kabi_2635_tracepoint_probe_register tracepoint_probe_register
--- 
-2.25.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0010-fix-include-order-for-older-kernels.patch b/meta/recipes-kernel/lttng/lttng-modules/0010-fix-include-order-for-older-kernels.patch
deleted file mode 100644
index 250e9c6261..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0010-fix-include-order-for-older-kernels.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 2ce89d35c9477d8c17c00489c72e1548e16af9b9 Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Fri, 20 Nov 2020 11:42:30 -0500
-Subject: [PATCH 10/16] fix: include order for older kernels
-
-Fixes a build failure on v3.0 and v3.1.
-
-Upstream-Status: Backport
-
-Change-Id: Ic48512d2aa5ee46678e67d147b92dba6d0959615
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- lttng-events.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/lttng-events.h b/lttng-events.h
-index 099fd78b..f5cc57c6 100644
---- a/lttng-events.h
-+++ b/lttng-events.h
-@@ -16,6 +16,7 @@
- #include <linux/kref.h>
- #include <lttng-cpuhotplug.h>
- #include <linux/uuid.h>
-+#include <linux/irq_work.h>
- #include <wrapper/uprobes.h>
- #include <lttng-tracer.h>
- #include <lttng-abi.h>
--- 
-2.25.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0011-Add-release-maintainer-script.patch b/meta/recipes-kernel/lttng/lttng-modules/0011-Add-release-maintainer-script.patch
deleted file mode 100644
index d25d64b9de..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0011-Add-release-maintainer-script.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 22ffa48439e617a32556365e00827fba062c5688 Mon Sep 17 00:00:00 2001
-From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Date: Mon, 23 Nov 2020 10:49:57 -0500
-Subject: [PATCH 11/16] Add release maintainer script
-
-Upstream-Status: Backport
-
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- scripts/maintainer/do-release.sh | 37 ++++++++++++++++++++++++++++++++
- 1 file changed, 37 insertions(+)
- create mode 100755 scripts/maintainer/do-release.sh
-
-diff --git a/scripts/maintainer/do-release.sh b/scripts/maintainer/do-release.sh
-new file mode 100755
-index 00000000..e0cec167
---- /dev/null
-+++ b/scripts/maintainer/do-release.sh
-@@ -0,0 +1,37 @@
-+#!/bin/sh
-+
-+# invoke with do-release 2.N.M, or 2.N.M-rcXX
-+
-+REL=$1
-+SRCDIR=~/git/lttng-modules
-+# The output files are created in ${HOME}/stable/
-+OUTPUTDIR=${HOME}/stable
-+
-+if [ x"$1" = x"" ]; then
-+	echo "1 arg : VERSION";
-+	exit 1;
-+fi
-+
-+cd ${OUTPUTDIR}
-+
-+echo Doing LTTng modules release ${REL}
-+
-+mkdir lttng-modules-${REL}
-+cd lttng-modules-${REL}
-+cp -ax ${SRCDIR}/. .
-+
-+#cleanup
-+make clean
-+git clean -xdf
-+
-+for a in \*.orig \*.rej Module.markers Module.symvers; do
-+	find . -name "${a}" -exec rm '{}' \;;
-+done
-+for a in outgoing .tmp_versions .git .pc; do
-+	find . -name "${a}" -exec rm -rf '{}' \;;
-+done
-+
-+cd ..
-+tar cvfj lttng-modules-${REL}.tar.bz2 lttng-modules-${REL}
-+mksums lttng-modules-${REL}.tar.bz2
-+signpkg lttng-modules-${REL}.tar.bz2
--- 
-2.25.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0012-Improve-the-release-script.patch b/meta/recipes-kernel/lttng/lttng-modules/0012-Improve-the-release-script.patch
deleted file mode 100644
index f5e7fb55a2..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0012-Improve-the-release-script.patch
+++ /dev/null
@@ -1,173 +0,0 @@
-From a241d30fa82ed0be1026f14e36e8bd2b0e65740d Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Mon, 23 Nov 2020 12:15:43 -0500
-Subject: [PATCH 12/16] Improve the release script
-
-  * Use git-archive, this removes all custom code to cleanup the repo, it
-    can now be used in an unclean repo as the code will be exported from
-    a specific tag.
-  * Add parameters, this will allow using the script on any machine
-    while keeping the default behavior for the maintainer.
-
-Upstream-Status: Backport
-
-Change-Id: I9f29d0e1afdbf475d0bbaeb9946ca3216f725e86
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- .gitattributes                   |   3 +
- scripts/maintainer/do-release.sh | 121 +++++++++++++++++++++++++------
- 2 files changed, 100 insertions(+), 24 deletions(-)
- create mode 100644 .gitattributes
-
-diff --git a/.gitattributes b/.gitattributes
-new file mode 100644
-index 00000000..7839355a
---- /dev/null
-+++ b/.gitattributes
-@@ -0,0 +1,3 @@
-+.gitattributes export-ignore
-+.gitignore export-ignore
-+.gitreview export-ignore
-diff --git a/scripts/maintainer/do-release.sh b/scripts/maintainer/do-release.sh
-index e0cec167..5e94e136 100755
---- a/scripts/maintainer/do-release.sh
-+++ b/scripts/maintainer/do-release.sh
-@@ -1,37 +1,110 @@
--#!/bin/sh
-+#!/bin/bash
-+
-+set -eu
-+set -o pipefail
- 
- # invoke with do-release 2.N.M, or 2.N.M-rcXX
- 
--REL=$1
--SRCDIR=~/git/lttng-modules
-+# Default maintainer values
-+SRCDIR="${HOME}/git/lttng-modules"
- # The output files are created in ${HOME}/stable/
--OUTPUTDIR=${HOME}/stable
-+OUTPUTDIR="${HOME}/stable"
-+SIGN="yes"
-+VERBOSE=""
-+
-+usage() {
-+	echo "Usage: do-release.sh [OPTION]... RELEASE"
-+	echo
-+	echo "Mandatory arguments to long options are mandatory for short options too."
-+	echo "  -s, --srcdir DIR               source directory"
-+	echo "  -o, --outputdir DIR            output directory, must exist"
-+	echo "  -n, --no-sign                  don't GPG sign the output archive"
-+	echo "  -v, --verbose                  verbose command output"
-+}
-+
-+POS_ARGS=()
-+while [[ $# -gt 0 ]]
-+do
-+	arg="$1"
-+
-+	case $arg in
-+	-n|--no-sign)
-+		SIGN="no"
-+		shift 1
-+	;;
-+
-+	-s|--srcdir)
-+		SRCDIR="$2"
-+		shift 2
-+	;;
-+
-+	-o|--outputdir)
-+		OUTPUTDIR="$2"
-+		shift 2
-+	;;
-+
-+	-v|--verbose)
-+		VERBOSE="-v"
-+		shift 1
-+	;;
-+
-+	# Catch unknown arguments
-+	-*)
-+		usage
-+		exit 1
-+	;;
-+
-+	*)
-+	POS_ARGS+=("$1")
-+	shift
-+	;;
-+	esac
-+done
-+set -- "${POS_ARGS[@]}"
- 
--if [ x"$1" = x"" ]; then
--	echo "1 arg : VERSION";
-+REL=${1:-}
-+
-+if [ x"${REL}" = x"" ]; then
-+	usage
- 	exit 1;
- fi
- 
--cd ${OUTPUTDIR}
-+echo "Doing LTTng modules release ${REL}"
-+echo "  Source dir: ${SRCDIR}"
-+echo "  Output dir: ${OUTPUTDIR}"
-+echo "  GPG sign: ${SIGN}"
- 
--echo Doing LTTng modules release ${REL}
-+# Make sure the output directory exists
-+if [ ! -d "${OUTPUTDIR}" ]; then
-+	echo "Output directory '${OUTPUTDIR}' doesn't exist."
-+	exit 1
-+fi
- 
--mkdir lttng-modules-${REL}
--cd lttng-modules-${REL}
--cp -ax ${SRCDIR}/. .
-+# Make sure the source directory is a git repository
-+if [ ! -r "${SRCDIR}/.git/config" ]; then
-+	echo "Source directory '${SRCDIR}' isn't a git repository."
-+	exit 1
-+fi
- 
--#cleanup
--make clean
--git clean -xdf
-+# Set the git repo directory for all further git commands
-+export GIT_DIR="${SRCDIR}/.git/"
- 
--for a in \*.orig \*.rej Module.markers Module.symvers; do
--	find . -name "${a}" -exec rm '{}' \;;
--done
--for a in outgoing .tmp_versions .git .pc; do
--	find . -name "${a}" -exec rm -rf '{}' \;;
--done
-+# Check if the release tag exists
-+if ! git rev-parse "refs/tags/v${REL}" >/dev/null 2>&1; then
-+	echo "Release tag 'v${REL}' doesn't exist."
-+	exit 1
-+fi
-+
-+# Generate the compressed tar archive, the git attributes from the tag will be used.
-+git archive $VERBOSE --format=tar --prefix="lttng-modules-${REL}/" "v${REL}" | bzip2 > "${OUTPUTDIR}/lttng-modules-${REL}.tar.bz2"
- 
--cd ..
--tar cvfj lttng-modules-${REL}.tar.bz2 lttng-modules-${REL}
--mksums lttng-modules-${REL}.tar.bz2
--signpkg lttng-modules-${REL}.tar.bz2
-+pushd "${OUTPUTDIR}" >/dev/null
-+# Generate the hashes
-+md5sum "lttng-modules-${REL}.tar.bz2" > "lttng-modules-${REL}.tar.bz2.md5"
-+sha256sum "lttng-modules-${REL}.tar.bz2" > "lttng-modules-${REL}.tar.bz2.sha256"
-+
-+if [ "x${SIGN}" = "xyes" ]; then
-+	# Sign with the default key
-+	gpg --armor -b "lttng-modules-${REL}.tar.bz2"
-+fi
-+popd >/dev/null
--- 
-2.25.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0013-fix-backport-of-fix-ext4-fast-commit-recovery-path-v.patch b/meta/recipes-kernel/lttng/lttng-modules/0013-fix-backport-of-fix-ext4-fast-commit-recovery-path-v.patch
deleted file mode 100644
index f6288923e1..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0013-fix-backport-of-fix-ext4-fast-commit-recovery-path-v.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 59fcc704bea8ecf4bd401e744df41e3331359524 Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Mon, 23 Nov 2020 10:19:52 -0500
-Subject: [PATCH 13/16] fix: backport of fix: ext4: fast commit recovery path
- (v5.10)
-
-Add missing '#endif'.
-
-Upstream-Status: Backport
-
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Change-Id: I43349d685d7ed740b32ce992be0c2e7e6f12c799
----
- instrumentation/events/lttng-module/ext4.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/instrumentation/events/lttng-module/ext4.h b/instrumentation/events/lttng-module/ext4.h
-index 5fddccad..d454fa6e 100644
---- a/instrumentation/events/lttng-module/ext4.h
-+++ b/instrumentation/events/lttng-module/ext4.h
-@@ -1446,6 +1446,7 @@ LTTNG_TRACEPOINT_EVENT(ext4_load_inode,
- 	)
- )
- #endif
-+#endif
- 
- #if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,5,0))
- 
--- 
-2.25.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0014-Revert-fix-include-order-for-older-kernels.patch b/meta/recipes-kernel/lttng/lttng-modules/0014-Revert-fix-include-order-for-older-kernels.patch
deleted file mode 100644
index 446391a832..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0014-Revert-fix-include-order-for-older-kernels.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From b2df75dd378ce5260bb51872e43ac1d76fbf4588 Mon Sep 17 00:00:00 2001
-From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Date: Mon, 23 Nov 2020 14:21:51 -0500
-Subject: [PATCH 14/16] Revert "fix: include order for older kernels"
-
-This reverts commit 2ce89d35c9477d8c17c00489c72e1548e16af9b9.
-
-This commit is only needed for master and stable-2.12, because
-stable-2.11 does not include irq_work.h.
-
-Upstream-Status: Backport
-
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- lttng-events.h | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/lttng-events.h b/lttng-events.h
-index f5cc57c6..099fd78b 100644
---- a/lttng-events.h
-+++ b/lttng-events.h
-@@ -16,7 +16,6 @@
- #include <linux/kref.h>
- #include <lttng-cpuhotplug.h>
- #include <linux/uuid.h>
--#include <linux/irq_work.h>
- #include <wrapper/uprobes.h>
- #include <lttng-tracer.h>
- #include <lttng-abi.h>
--- 
-2.25.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0015-fix-backport-of-fix-tracepoint-Optimize-using-static.patch b/meta/recipes-kernel/lttng/lttng-modules/0015-fix-backport-of-fix-tracepoint-Optimize-using-static.patch
deleted file mode 100644
index 1ff10d48da..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0015-fix-backport-of-fix-tracepoint-Optimize-using-static.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From f8922333020aaa267e17fb23180b56c4c16ebe9e Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Tue, 24 Nov 2020 11:11:42 -0500
-Subject: [PATCH 15/16] fix: backport of fix: tracepoint: Optimize using
- static_call() (v5.10)
-
-Upstream-Status: Backport
-
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Change-Id: I94f2b845f11654e639f03254185980de527a4ca8
----
- lttng-statedump-impl.c | 9 ++++-----
- 1 file changed, 4 insertions(+), 5 deletions(-)
-
-diff --git a/lttng-statedump-impl.c b/lttng-statedump-impl.c
-index e0b19b42..a8c32db5 100644
---- a/lttng-statedump-impl.c
-+++ b/lttng-statedump-impl.c
-@@ -72,10 +72,9 @@ LTTNG_DEFINE_TRACE(lttng_statedump_interrupt,
- 
- LTTNG_DEFINE_TRACE(lttng_statedump_file_descriptor,
- 	TP_PROTO(struct lttng_session *session,
--		struct files_struct *files,
--		int fd, const char *filename,
-+		struct task_struct *p, int fd, const char *filename,
- 		unsigned int flags, fmode_t fmode),
--	TP_ARGS(session, files, fd, filename, flags, fmode));
-+	TP_ARGS(session, p, fd, filename, flags, fmode));
- 
- LTTNG_DEFINE_TRACE(lttng_statedump_start,
- 	TP_PROTO(struct lttng_session *session),
-@@ -85,8 +84,8 @@ LTTNG_DEFINE_TRACE(lttng_statedump_process_state,
- 	TP_PROTO(struct lttng_session *session,
- 		struct task_struct *p,
- 		int type, int mode, int submode, int status,
--		struct files_struct *files),
--	TP_ARGS(session, p, type, mode, submode, status, files));
-+		struct pid_namespace *pid_ns),
-+	TP_ARGS(session, p, type, mode, submode, status, pid_ns));
- 
- LTTNG_DEFINE_TRACE(lttng_statedump_network_interface,
- 	TP_PROTO(struct lttng_session *session,
--- 
-2.25.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0016-fix-adjust-version-range-for-trace_find_free_extent.patch b/meta/recipes-kernel/lttng/lttng-modules/0016-fix-adjust-version-range-for-trace_find_free_extent.patch
deleted file mode 100644
index 59d4d7afa7..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0016-fix-adjust-version-range-for-trace_find_free_extent.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 5c3e67d7994097cc75f45258b7518aacb55dde1b Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Tue, 24 Nov 2020 11:27:18 -0500
-Subject: [PATCH 16/16] fix: adjust version range for trace_find_free_extent()
-
-Upstream-Status: Backport
-
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Change-Id: Iaa6088092cf58b4d29d55f3ff9586c57ae272302
----
- instrumentation/events/lttng-module/btrfs.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/instrumentation/events/lttng-module/btrfs.h b/instrumentation/events/lttng-module/btrfs.h
-index d47f3280..efe7af96 100644
---- a/instrumentation/events/lttng-module/btrfs.h
-+++ b/instrumentation/events/lttng-module/btrfs.h
-@@ -1917,7 +1917,7 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__reserved_extent,  btrfs_reserved_extent_f
- #endif /* #else #if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,10,0)) */
- 
- #if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,10,0) || \
--	LTTNG_KERNEL_RANGE(5,9,6, 5,10,0) || \
-+	LTTNG_KERNEL_RANGE(5,9,5, 5,10,0) || \
- 	LTTNG_KERNEL_RANGE(5,4,78, 5,5,0))
- LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
- 
--- 
-2.25.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.11.6.bb b/meta/recipes-kernel/lttng/lttng-modules_2.11.7.bb
similarity index 59%
rename from meta/recipes-kernel/lttng/lttng-modules_2.11.6.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.11.7.bb
index 76b9f13618..d95613ba97 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.11.6.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.11.7.bb
@@ -12,29 +12,13 @@ COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|nios2|arm|riscv).*-linux'
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
            file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
-           file://0001-fix-strncpy-equals-destination-size-warning.patch \
-           file://0002-fix-objtool-Rename-frame.h-objtool.h-v5.10.patch \
-           file://0003-fix-btrfs-tracepoints-output-proper-root-owner-for-t.patch \
-           file://0004-fix-btrfs-make-ordered-extent-tracepoint-take-btrfs_.patch \
-           file://0005-fix-ext4-fast-commit-recovery-path-v5.10.patch \
-           file://0006-fix-KVM-x86-Add-intr-vectoring-info-and-error-code-t.patch \
-           file://0007-fix-kvm-x86-mmu-Add-TDP-MMU-PF-handler-v5.10.patch \
-           file://0008-fix-KVM-x86-mmu-Return-unique-RET_PF_-values-if-the-.patch \
-           file://0009-fix-tracepoint-Optimize-using-static_call-v5.10.patch \
-           file://0010-fix-include-order-for-older-kernels.patch \
-           file://0011-Add-release-maintainer-script.patch \
-           file://0012-Improve-the-release-script.patch \
-           file://0013-fix-backport-of-fix-ext4-fast-commit-recovery-path-v.patch \
-           file://0014-Revert-fix-include-order-for-older-kernels.patch \
-           file://0015-fix-backport-of-fix-tracepoint-Optimize-using-static.patch \
-           file://0016-fix-adjust-version-range-for-trace_find_free_extent.patch \
            file://0017-fix-random-remove-unused-tracepoints-v5.18.patch \
            file://0018-fix-random-remove-unused-tracepoints-v5.10-v5.15.patch \
            file://0019-fix-random-tracepoints-removed-in-stable-kernels.patch \
            "
 
-SRC_URI[md5sum] = "8ef09fdfcdec669d33f7fc1c1c80f2c4"
-SRC_URI[sha256sum] = "23372811cdcd2ac28ba8c9d09484ed5f9238cfbd0043f8c663ff3875ba9c8566"
+SRC_URI[md5sum] = "d1f1db78fe6fb6ea159c6e957a5ea6af"
+SRC_URI[sha256sum] = "d7b7170e6af8c5a74dda06d9cf1afaac2519b6d8b7e823acce5bf7b23857a55e"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
-- 
2.25.1


