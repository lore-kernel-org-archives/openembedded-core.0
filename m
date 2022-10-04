Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CB0EC43219
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 17:28:09 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web12.13678.1664904482711544072
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 10:28:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=M+YQ8+c1;
 spf=pass (domain: gmail.com, ip: 209.85.160.180,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id cn9so1028944qtb.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 10:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=1n6oJAsuTuL4uJ/c0clYVQsTR1xSVP6664aGQY9lwkY=;
        b=M+YQ8+c1GZ0l12iW+hnIUlPlx4fbo6eyVFNAmIdPaHoO8qM0upyK7UxaNV+/NwP6Hq
         j4k4HJaUiQt2i3zWl5S2I2KqM5HbKlmVun5pGLf9j6/8wYvaj3YfJF8vzIZXG/pVXaHJ
         ZISv+D1iWwIbLjyqhvOoBlBHQaDmtnZf/ryC6X66iZyfa+hJYQrKH1Q/gSYNO0MOOuGf
         Z8Vprb1WFDqCPW3BD8rv2DTy84qMZIRHlpPWT1zfMhsEWN+hTsEX+DYPoQKHhHNGDMk0
         Hx604lyaSQ4c+uELDgJrU5QwVXzfChPpz3z0ysWaJ9swfRyFbrIrZROgMy3d2Kqm3mvG
         ilOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=1n6oJAsuTuL4uJ/c0clYVQsTR1xSVP6664aGQY9lwkY=;
        b=M8cg72mNBIWzyjZCkr3zn1qR6A8vyO5EOSkAxgLaAsIDpxp5wlEMhFZ4q8qG04GLQs
         GUk4v5qlIdKeK8u8yrUOZnv2djEuqwFPg5DhmvYl6XqloMg5u2a7PUvcjkmoDme89EWc
         2jc6g3kLqSgqXaR59jLnMXMMGZhdPbxsJYPtzY2k6hU1Vw7TE811KqfuyRh38otq/AiG
         ifC7QpI9P6kla4cOJcRyOs6Gj535nzxdSTXNnaH88WL4HjiC6VePiy2ArZy+NQC8Snaz
         F5lq8RWg0kJuxqM3zYCaDr+kCG+O6AnJZT2stWwAEcl1Mmhv268X9INGLOTE3S1wyY2Y
         JMcQ==
X-Gm-Message-State: ACrzQf3MYtMR4agS0fc/zATZ4zF1djJ9at/sO38Im4qxxOM9msv+EmQF
	n8tPBnYzGpjL3N6+JYwRYz89ahXrHG8FtQ==
X-Google-Smtp-Source: 
 AMsMyM7c4aLzSTvP3C63WqgfTT8Zin3bb1asINKsIOVxtXHxQnpdkh8HScUXb/zB6HMgDJWWQIKDQw==
X-Received: by 2002:ac8:47c4:0:b0:38a:ab44:5230 with SMTP id
 d4-20020ac847c4000000b0038aab445230mr2245196qtr.41.1664904481379;
        Tue, 04 Oct 2022 10:28:01 -0700 (PDT)
Received: from build.lan
 (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id
 y3-20020ac81283000000b0035a6b89412bsm12037878qti.46.2022.10.04.10.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 10:28:00 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] lttng-modules: update to 2.13.7
Date: Tue,  4 Oct 2022 13:27:55 -0400
Message-Id: 
 <e3f510eaa6b7fab9c080881d43db6b556b46d9cf.1664904217.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1664904217.git.bruce.ashfield@gmail.com>
References: <cover.1664904217.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Oct 2022 17:28:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171430

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating to the latest 2.13 -stable release of lttng-modules. This
contains fixes needed to build against the 6.0+ kernel.

We also drop our backported patches as they are part of the release.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../lttng-modules/0001-fix-compaction.patch   |  68 ----------
 ...c-fix-tracepoint-mm_page_alloc_zone_.patch | 106 ---------------
 ...oduce-kfree_skb_reason-v5.15.58.v5.1.patch |  53 --------
 ...ags-parameter-from-aops-write_begin-.patch |  76 -----------
 ...Fix-type-of-cpu-in-trace-event-v5.19.patch | 124 ------------------
 .../0009-Rename-genhd-wrapper-to-blkdev.patch |  76 -----------
 ...ules_2.13.4.bb => lttng-modules_2.13.7.bb} |   8 +-
 7 files changed, 1 insertion(+), 510 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-compaction.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-page_alloc-fix-tracepoint-mm_page_alloc_zone_.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-net-skb-introduce-kfree_skb_reason-v5.15.58.v5.1.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-fix-fs-Remove-flags-parameter-from-aops-write_begin-.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-fix-workqueue-Fix-type-of-cpu-in-trace-event-v5.19.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0009-Rename-genhd-wrapper-to-blkdev.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.13.4.bb => lttng-modules_2.13.7.bb} (73%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-compaction.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-compaction.patch
deleted file mode 100644
index 21e27ffc5e..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-compaction.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From 8e42c4821fb5f5cb816b6ddf73d9a13ba3298a63 Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Wed, 10 Aug 2022 11:07:14 -0400
-Subject: [PATCH] fix: tie compaction probe build to CONFIG_COMPACTION
-
-The definition of 'struct compact_control' in 'mm/internal.h' depends on
-CONFIG_COMPACTION being defined. Only build the compaction probe when
-this configuration option is enabled.
-
-Thanks to Bruce Ashfield <bruce.ashfield@gmail.com> for reporting this
-issue.
-
-Upstream-Status: Backport [https://review.lttng.org/c/lttng-modules/+/8660]
-
-Change-Id: I81e77aa9c1bf10452c152d432fe5224df0db42c9
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
----
- src/probes/Kbuild | 34 ++++++++++++++++++----------------
- 1 file changed, 18 insertions(+), 16 deletions(-)
-
-diff --git a/src/probes/Kbuild b/src/probes/Kbuild
-index 2908cf75..3e556b8e 100644
---- a/src/probes/Kbuild
-+++ b/src/probes/Kbuild
-@@ -167,22 +167,24 @@ ifneq ($(CONFIG_BTRFS_FS),)
-   endif # $(wildcard $(btrfs_dep))
- endif # CONFIG_BTRFS_FS
- 
--# A dependency on internal header 'mm/internal.h' was introduced in v5.18
--compaction_dep = $(srctree)/mm/internal.h
--compaction_dep_wildcard = $(wildcard $(compaction_dep))
--compaction_dep_check = $(shell \
--if [ \( $(VERSION) -ge 6 \
--   -o \( $(VERSION) -eq 5 -a $(PATCHLEVEL) -ge 18 \) \) -a \
--   -z "$(compaction_dep_wildcard)" ] ; then \
--  echo "warn" ; \
--else \
--  echo "ok" ; \
--fi ;)
--ifeq ($(compaction_dep_check),ok)
--  obj-$(CONFIG_LTTNG) += lttng-probe-compaction.o
--else
--  $(warning Files $(compaction_dep) not found. Probe "compaction" is disabled. Use full kernel source tree to enable it.)
--endif # $(wildcard $(compaction_dep))
-+ifneq ($(CONFIG_COMPACTION),)
-+  # A dependency on internal header 'mm/internal.h' was introduced in v5.18
-+  compaction_dep = $(srctree)/mm/internal.h
-+  compaction_dep_wildcard = $(wildcard $(compaction_dep))
-+  compaction_dep_check = $(shell \
-+  if [ \( $(VERSION) -ge 6 \
-+     -o \( $(VERSION) -eq 5 -a $(PATCHLEVEL) -ge 18 \) \) -a \
-+     -z "$(compaction_dep_wildcard)" ] ; then \
-+    echo "warn" ; \
-+  else \
-+    echo "ok" ; \
-+  fi ;)
-+  ifeq ($(compaction_dep_check),ok)
-+    obj-$(CONFIG_LTTNG) += lttng-probe-compaction.o
-+  else
-+    $(warning Files $(compaction_dep) not found. Probe "compaction" is disabled. Use full kernel source tree to enable it.)
-+  endif # $(wildcard $(compaction_dep))
-+endif # CONFIG_COMPACTION
- 
- ifneq ($(CONFIG_EXT4_FS),)
-   ext4_dep = $(srctree)/fs/ext4/*.h
--- 
-2.34.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-page_alloc-fix-tracepoint-mm_page_alloc_zone_.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-page_alloc-fix-tracepoint-mm_page_alloc_zone_.patch
deleted file mode 100644
index 62376806c8..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-page_alloc-fix-tracepoint-mm_page_alloc_zone_.patch
+++ /dev/null
@@ -1,106 +0,0 @@
-From 8d5da4d2a3d7d9173208f4e8dc7a709f0bfc9820 Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Wed, 8 Jun 2022 12:56:36 -0400
-Subject: [PATCH 1/3] fix: mm/page_alloc: fix tracepoint
- mm_page_alloc_zone_locked() (v5.19)
-
-See upstream commit :
-
-  commit 10e0f7530205799e7e971aba699a7cb3a47456de
-  Author: Wonhyuk Yang <vvghjk1234@gmail.com>
-  Date:   Thu May 19 14:08:54 2022 -0700
-
-    mm/page_alloc: fix tracepoint mm_page_alloc_zone_locked()
-
-    Currently, trace point mm_page_alloc_zone_locked() doesn't show correct
-    information.
-
-    First, when alloc_flag has ALLOC_HARDER/ALLOC_CMA, page can be allocated
-    from MIGRATE_HIGHATOMIC/MIGRATE_CMA.  Nevertheless, tracepoint use
-    requested migration type not MIGRATE_HIGHATOMIC and MIGRATE_CMA.
-
-    Second, after commit 44042b4498728 ("mm/page_alloc: allow high-order pages
-    to be stored on the per-cpu lists") percpu-list can store high order
-    pages.  But trace point determine whether it is a refiil of percpu-list by
-    comparing requested order and 0.
-
-    To handle these problems, make mm_page_alloc_zone_locked() only be called
-    by __rmqueue_smallest with correct migration type.  With a new argument
-    called percpu_refill, it can show roughly whether it is a refill of
-    percpu-list.
-
-Upstream-Status: Backport
-
-Change-Id: I2e4a57393757f12b9c5a4566c4d1102ee2474a09
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- include/instrumentation/events/kmem.h | 45 +++++++++++++++++++++++++++
- 1 file changed, 45 insertions(+)
-
-diff --git a/include/instrumentation/events/kmem.h b/include/instrumentation/events/kmem.h
-index 29c0fb7f..8c19e962 100644
---- a/include/instrumentation/events/kmem.h
-+++ b/include/instrumentation/events/kmem.h
-@@ -218,6 +218,50 @@ LTTNG_TRACEPOINT_EVENT_MAP(mm_page_alloc, kmem_mm_page_alloc,
- 	)
- )
- 
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,19,0))
-+LTTNG_TRACEPOINT_EVENT_CLASS(kmem_mm_page,
-+
-+	TP_PROTO(struct page *page, unsigned int order, int migratetype,
-+			int percpu_refill),
-+
-+	TP_ARGS(page, order, migratetype, percpu_refill),
-+
-+	TP_FIELDS(
-+		ctf_integer_hex(struct page *, page, page)
-+		ctf_integer(unsigned long, pfn,
-+			page ? page_to_pfn(page) : -1UL)
-+		ctf_integer(unsigned int, order, order)
-+		ctf_integer(int, migratetype, migratetype)
-+		ctf_integer(int, percpu_refill, percpu_refill)
-+	)
-+)
-+
-+LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(kmem_mm_page, mm_page_alloc_zone_locked,
-+
-+	kmem_mm_page_alloc_zone_locked,
-+
-+	TP_PROTO(struct page *page, unsigned int order, int migratetype,
-+			int percpu_refill),
-+
-+	TP_ARGS(page, order, migratetype, percpu_refill)
-+)
-+
-+LTTNG_TRACEPOINT_EVENT_MAP(mm_page_pcpu_drain,
-+
-+	kmem_mm_page_pcpu_drain,
-+
-+	TP_PROTO(struct page *page, unsigned int order, int migratetype),
-+
-+	TP_ARGS(page, order, migratetype),
-+
-+	TP_FIELDS(
-+		ctf_integer(unsigned long, pfn,
-+			page ? page_to_pfn(page) : -1UL)
-+		ctf_integer(unsigned int, order, order)
-+		ctf_integer(int, migratetype, migratetype)
-+	)
-+)
-+#else
- LTTNG_TRACEPOINT_EVENT_CLASS(kmem_mm_page,
- 
- 	TP_PROTO(struct page *page, unsigned int order, int migratetype),
-@@ -250,6 +294,7 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(kmem_mm_page, mm_page_pcpu_drain,
- 
- 	TP_ARGS(page, order, migratetype)
- )
-+#endif
- 
- #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(3,19,2)	\
- 	|| LTTNG_KERNEL_RANGE(3,14,36, 3,15,0)		\
--- 
-2.19.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-net-skb-introduce-kfree_skb_reason-v5.15.58.v5.1.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-net-skb-introduce-kfree_skb_reason-v5.15.58.v5.1.patch
deleted file mode 100644
index ca6abea9c0..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-net-skb-introduce-kfree_skb_reason-v5.15.58.v5.1.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From d8254360c7f2ff9b3f945e9668d89c0b56b9bd91 Mon Sep 17 00:00:00 2001
-From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Date: Fri, 29 Jul 2022 15:37:43 -0400
-Subject: [PATCH] fix: net: skb: introduce kfree_skb_reason() (v5.15.58..v5.16)
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
-Upstream-Status: Backport
-
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Change-Id: Ib3c039207739dad10f097cf76474e0822e351273
----
- include/instrumentation/events/skb.h | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/include/instrumentation/events/skb.h b/include/instrumentation/events/skb.h
-index 237e54ad..186732ea 100644
---- a/include/instrumentation/events/skb.h
-+++ b/include/instrumentation/events/skb.h
-@@ -13,7 +13,9 @@
- /*
-  * Tracepoint for free an sk_buff:
-  */
--#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,17,0))
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,17,0) \
-+	|| LTTNG_KERNEL_RANGE(5,15,58, 5,16,0))
-+
- LTTNG_TRACEPOINT_ENUM(skb_drop_reason,
- 	TP_ENUM_VALUES(
- 		ctf_enum_value("NOT_SPECIFIED",	SKB_DROP_REASON_NOT_SPECIFIED)
--- 
-2.17.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0002-fix-fs-Remove-flags-parameter-from-aops-write_begin-.patch b/meta/recipes-kernel/lttng/lttng-modules/0002-fix-fs-Remove-flags-parameter-from-aops-write_begin-.patch
deleted file mode 100644
index 84c97d5f90..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0002-fix-fs-Remove-flags-parameter-from-aops-write_begin-.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From b5d1c38665cd69d7d1c94231fe0609da5c8afbc3 Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Wed, 8 Jun 2022 13:07:59 -0400
-Subject: [PATCH 2/3] fix: fs: Remove flags parameter from aops->write_begin
- (v5.19)
-
-See upstream commit :
-
-  commit 9d6b0cd7579844761ed68926eb3073bab1dca87b
-  Author: Matthew Wilcox (Oracle) <willy@infradead.org>
-  Date:   Tue Feb 22 14:31:43 2022 -0500
-
-    fs: Remove flags parameter from aops->write_begin
-
-    There are no more aop flags left, so remove the parameter.
-
-Upstream-Status: Backport
-
-Change-Id: I82725b93e13d749f52a631b2ac60df81a5e839f8
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- include/instrumentation/events/ext4.h | 30 +++++++++++++++++++++++++++
- 1 file changed, 30 insertions(+)
-
-diff --git a/include/instrumentation/events/ext4.h b/include/instrumentation/events/ext4.h
-index 513762c0..222416ec 100644
---- a/include/instrumentation/events/ext4.h
-+++ b/include/instrumentation/events/ext4.h
-@@ -122,6 +122,35 @@ LTTNG_TRACEPOINT_EVENT(ext4_begin_ordered_truncate,
- 	)
- )
- 
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,19,0))
-+LTTNG_TRACEPOINT_EVENT_CLASS(ext4__write_begin,
-+
-+	TP_PROTO(struct inode *inode, loff_t pos, unsigned int len),
-+
-+	TP_ARGS(inode, pos, len),
-+
-+	TP_FIELDS(
-+		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
-+		ctf_integer(ino_t, ino, inode->i_ino)
-+		ctf_integer(loff_t, pos, pos)
-+		ctf_integer(unsigned int, len, len)
-+	)
-+)
-+
-+LTTNG_TRACEPOINT_EVENT_INSTANCE(ext4__write_begin, ext4_write_begin,
-+
-+	TP_PROTO(struct inode *inode, loff_t pos, unsigned int len),
-+
-+	TP_ARGS(inode, pos, len)
-+)
-+
-+LTTNG_TRACEPOINT_EVENT_INSTANCE(ext4__write_begin, ext4_da_write_begin,
-+
-+	TP_PROTO(struct inode *inode, loff_t pos, unsigned int len),
-+
-+	TP_ARGS(inode, pos, len)
-+)
-+#else
- LTTNG_TRACEPOINT_EVENT_CLASS(ext4__write_begin,
- 
- 	TP_PROTO(struct inode *inode, loff_t pos, unsigned int len,
-@@ -153,6 +182,7 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(ext4__write_begin, ext4_da_write_begin,
- 
- 	TP_ARGS(inode, pos, len, flags)
- )
-+#endif
- 
- LTTNG_TRACEPOINT_EVENT_CLASS(ext4__write_end,
- 	TP_PROTO(struct inode *inode, loff_t pos, unsigned int len,
--- 
-2.19.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0003-fix-workqueue-Fix-type-of-cpu-in-trace-event-v5.19.patch b/meta/recipes-kernel/lttng/lttng-modules/0003-fix-workqueue-Fix-type-of-cpu-in-trace-event-v5.19.patch
deleted file mode 100644
index 63f9c40d92..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0003-fix-workqueue-Fix-type-of-cpu-in-trace-event-v5.19.patch
+++ /dev/null
@@ -1,124 +0,0 @@
-From 526f13c844cd29f89bd3e924867d9ddfe3c40ade Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Wed, 15 Jun 2022 12:07:16 -0400
-Subject: [PATCH 3/3] fix: workqueue: Fix type of cpu in trace event (v5.19)
-
-See upstream commit :
-
-  commit 873a400938b31a1e443c4d94b560b78300787540
-  Author: Wonhyuk Yang <vvghjk1234@gmail.com>
-  Date:   Wed May 4 11:32:03 2022 +0900
-
-    workqueue: Fix type of cpu in trace event
-
-    The trace event "workqueue_queue_work" use unsigned int type for
-    req_cpu, cpu. This casue confusing cpu number like below log.
-
-    $ cat /sys/kernel/debug/tracing/trace
-    cat-317  [001] ...: workqueue_queue_work: ... req_cpu=8192 cpu=4294967295
-
-    So, change unsigned type to signed type in the trace event. After
-    applying this patch, cpu number will be printed as -1 instead of
-    4294967295 as folllows.
-
-    $ cat /sys/kernel/debug/tracing/trace
-    cat-1338  [002] ...: workqueue_queue_work: ... req_cpu=8192 cpu=-1
-
-Upstream-Status: Backport
-
-Change-Id: I478083c350b6ec314d87e9159dc5b342b96daed7
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- include/instrumentation/events/workqueue.h | 49 ++++++++++++++++++++--
- 1 file changed, 46 insertions(+), 3 deletions(-)
-
-diff --git a/include/instrumentation/events/workqueue.h b/include/instrumentation/events/workqueue.h
-index 023b65a8..5693cf89 100644
---- a/include/instrumentation/events/workqueue.h
-+++ b/include/instrumentation/events/workqueue.h
-@@ -28,10 +28,35 @@ LTTNG_TRACEPOINT_EVENT_CLASS(workqueue_work,
- 	)
- )
- 
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,19,0))
- /**
-  * workqueue_queue_work - called when a work gets queued
-  * @req_cpu:	the requested cpu
-- * @cwq:	pointer to struct cpu_workqueue_struct
-+ * @pwq:	pointer to struct pool_workqueue
-+ * @work:	pointer to struct work_struct
-+ *
-+ * This event occurs when a work is queued immediately or once a
-+ * delayed work is actually queued on a workqueue (ie: once the delay
-+ * has been reached).
-+ */
-+LTTNG_TRACEPOINT_EVENT(workqueue_queue_work,
-+
-+	TP_PROTO(int req_cpu, struct pool_workqueue *pwq,
-+		 struct work_struct *work),
-+
-+	TP_ARGS(req_cpu, pwq, work),
-+
-+	TP_FIELDS(
-+		ctf_integer_hex(void *, work, work)
-+		ctf_integer_hex(void *, function, work->func)
-+		ctf_integer(int, req_cpu, req_cpu)
-+	)
-+)
-+#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(3,9,0))
-+/**
-+ * workqueue_queue_work - called when a work gets queued
-+ * @req_cpu:	the requested cpu
-+ * @pwq:	pointer to struct pool_workqueue
-  * @work:	pointer to struct work_struct
-  *
-  * This event occurs when a work is queued immediately or once a
-@@ -40,17 +65,34 @@ LTTNG_TRACEPOINT_EVENT_CLASS(workqueue_work,
-  */
- LTTNG_TRACEPOINT_EVENT(workqueue_queue_work,
- 
--#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(3,9,0))
- 	TP_PROTO(unsigned int req_cpu, struct pool_workqueue *pwq,
- 		 struct work_struct *work),
- 
- 	TP_ARGS(req_cpu, pwq, work),
-+
-+	TP_FIELDS(
-+		ctf_integer_hex(void *, work, work)
-+		ctf_integer_hex(void *, function, work->func)
-+		ctf_integer(unsigned int, req_cpu, req_cpu)
-+	)
-+)
- #else
-+/**
-+ * workqueue_queue_work - called when a work gets queued
-+ * @req_cpu:	the requested cpu
-+ * @cwq:	pointer to struct cpu_workqueue_struct
-+ * @work:	pointer to struct work_struct
-+ *
-+ * This event occurs when a work is queued immediately or once a
-+ * delayed work is actually queued on a workqueue (ie: once the delay
-+ * has been reached).
-+ */
-+LTTNG_TRACEPOINT_EVENT(workqueue_queue_work,
-+
- 	TP_PROTO(unsigned int req_cpu, struct cpu_workqueue_struct *cwq,
- 		 struct work_struct *work),
- 
- 	TP_ARGS(req_cpu, cwq, work),
--#endif
- 
- 	TP_FIELDS(
- 		ctf_integer_hex(void *, work, work)
-@@ -58,6 +100,7 @@ LTTNG_TRACEPOINT_EVENT(workqueue_queue_work,
- 		ctf_integer(unsigned int, req_cpu, req_cpu)
- 	)
- )
-+#endif
- 
- /**
-  * workqueue_activate_work - called when a work gets activated
--- 
-2.19.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0009-Rename-genhd-wrapper-to-blkdev.patch b/meta/recipes-kernel/lttng/lttng-modules/0009-Rename-genhd-wrapper-to-blkdev.patch
deleted file mode 100644
index 90fec9dc58..0000000000
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
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.4.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.7.bb
similarity index 73%
rename from meta/recipes-kernel/lttng/lttng-modules_2.13.4.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.13.7.bb
index f60ab3b5f5..83b9b12e82 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.4.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.7.bb
@@ -10,18 +10,12 @@ inherit module
 include lttng-platforms.inc
 
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
-           file://0009-Rename-genhd-wrapper-to-blkdev.patch \
-           file://0001-fix-mm-page_alloc-fix-tracepoint-mm_page_alloc_zone_.patch \
-           file://0002-fix-fs-Remove-flags-parameter-from-aops-write_begin-.patch \
-           file://0003-fix-workqueue-Fix-type-of-cpu-in-trace-event-v5.19.patch \
-           file://0001-fix-net-skb-introduce-kfree_skb_reason-v5.15.58.v5.1.patch \
-           file://0001-fix-compaction.patch \
            "
 
 # Use :append here so that the patch is applied also when using devupstream
 SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch"
 
-SRC_URI[sha256sum] = "6159d00e4e1d59546eec8d4a67e1aa39c1084ceb5e5afeb666eab4b8a5b5a9ee"
+SRC_URI[sha256sum] = "5a99679df7903160cbde3918fee5af90ffafc90fc96ccdefaa57cf230492b234"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
-- 
2.19.1


