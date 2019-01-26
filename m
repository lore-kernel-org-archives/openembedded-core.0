Return-Path: <>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id E535B7C35C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jan 2019 13:00:02 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id a8so8806229lfk.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jan 2019 05:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2J8Riy8ld7kF4GkP3R1mnPJcS3yXyMIGuKg6JfUwPQw=;
	b=Va6CYImdLfmYM3zEgREN8o8/zn/vlXNBAfgYCYZE0cGxOzgWJWVwAaHwIA6+Jjglty
	CvUl2FEuFwAdBeGpJaD7CYnGyBA9nKu11JUfId+1oza8+FLbQUm9g3vYTD+A8v1Y5jJW
	8KzzBm7AtcYsjesZtg1M/ife/V4Ycf1kBE8oyv5uNiDrO+peMS0RL+Gmd1u7aF0XbKD5
	bjs2+tmhfxx2StWdCSpz9yuh8I7SpIog02IYTeHqLYVXx/1kua0BYjQ661Vc4z8ojhzJ
	gavLK/e8cXUhWmQK7gVFlK8LAsTWf8Epeuwejz1GwdWx2i39dfSLnoMHkfLNFZKPQZW5
	ZzoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2J8Riy8ld7kF4GkP3R1mnPJcS3yXyMIGuKg6JfUwPQw=;
	b=RAmYMWPaC+uPUQpFUHz5TYASBcj2lVmjy2/0u1g8C9iNJ8iIgnvQi4joXj3NClmx5C
	tJ85GRVsK7FgLQpwNSL62vpy5VqnqO/SiPxxv+Cx1xVNT6/agwnD37rH2eRNTVDlx6nH
	u4lrx2hnd8/NP0ujjwJEmP6+ffGsXTbfrIBM+91zYAKQ0evUDCn6UoDwn+levqEUtbtF
	/BcELFGDiK3rLiIHFqzhxkb3FhwrmGAhjO1b0e8eGEXDVc8jUo9x+8pGPONshKkFwtIY
	gI8a5hQ1eyNptZHXfQUXczTFR0bR+TOvWGGd0fOQ7K0/iZy3c+R02MYsd8dGwOplZfbl
	Q8HA==
X-Gm-Message-State: AJcUukflr3+Ak1ClQRNkKnwHzaBfWTswJeAncWgG/Cyg2g4ikkCB14oT
	q261VOYRnVxNn0nG0Ox70+o=
X-Google-Smtp-Source: ALg8bN6/RM5Xuk/c8zYFF041rhVhXFKU3bW2NWY4zyllU0qm9fRfLfTVJXatFJF6Vf4em03gUgfjDw==
X-Received: by 2002:a19:f718:: with SMTP id z24mr12040359lfe.97.1548507603325; 
	Sat, 26 Jan 2019 05:00:03 -0800 (PST)
Received: from localhost ([80.64.92.72]) by smtp.gmail.com with ESMTPSA id
	a62sm2093621lfa.37.2019.01.26.05.00.02
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Sat, 26 Jan 2019 05:00:02 -0800 (PST)
From: Ruslan Bilovol <ruslan.bilovol@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Date: Sat, 26 Jan 2019 14:57:55 +0200
Message-Id: <1548507480-22805-2-git-send-email-ruslan.bilovol@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1548507480-22805-1-git-send-email-ruslan.bilovol@gmail.com>
References: <1548507480-22805-1-git-send-email-ruslan.bilovol@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
Subject: [PATCH 1/6] lttng: drop lost patch
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
X-List-Received-Date: Sat, 26 Jan 2019 13:00:03 -0000

Commit "f63965c0f9fc lttng: uprev to 2.10.7" dropped
0001-Fix-btrfs-Remove-unnecessary-fs_info-parameter.patch
from recipe, but left the patch itself in source tree.
Remove this patch since nobody uses it.

Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
---
 ...trfs-Remove-unnecessary-fs_info-parameter.patch | 116 ---------------------
 1 file changed, 116 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Fix-btrfs-Remove-unnecessary-fs_info-parameter.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-btrfs-Remove-unnecessary-fs_info-parameter.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-btrfs-Remove-unnecessary-fs_info-parameter.patch
deleted file mode 100644
index 0fe4ee8..0000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-btrfs-Remove-unnecessary-fs_info-parameter.patch
+++ /dev/null
@@ -1,116 +0,0 @@
-From 51ab0b1da29354375a19f865abcd233dd2178295 Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Mon, 18 Jun 2018 14:53:19 -0400
-Subject: [PATCH] Fix: btrfs: Remove unnecessary fs_info parameter
-
-See upstream commit:
-
-  commit 3dca5c942dac60164e6a6e89172f25b86af07ce7
-  Author: Qu Wenruo <wqu@suse.com>
-  Date:   Thu Apr 26 14:24:25 2018 +0800
-
-    btrfs: trace: Remove unnecessary fs_info parameter for btrfs__reserve_extent event class
-
-    fs_info can be extracted from btrfs_block_group_cache, and all
-    btrfs_block_group_cache is created by btrfs_create_block_group_cache()
-    with fs_info initialized, no need to worry about NULL pointer
-    dereference.
-
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Upstream-Status: Backport
-Signed-off-by: He Zhe <zhe.he@windriver.com>
----
- instrumentation/events/lttng-module/btrfs.h | 54 ++++++++++++++++++++++++++++-
- 1 file changed, 53 insertions(+), 1 deletion(-)
-
-diff --git a/instrumentation/events/lttng-module/btrfs.h b/instrumentation/events/lttng-module/btrfs.h
-index 75cc73b..fd1b6b8 100644
---- a/instrumentation/events/lttng-module/btrfs.h
-+++ b/instrumentation/events/lttng-module/btrfs.h
-@@ -1658,8 +1658,57 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__reserved_extent,  btrfs_reserved_extent_f
- 
- #endif /* #else #if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,10,0)) */
- 
--#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,14,0))
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,18,0))
-+LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
-+
-+	btrfs_find_free_extent,
-+
-+	TP_PROTO(const struct btrfs_fs_info *info, u64 num_bytes, u64 empty_size,
-+		 u64 data),
-+
-+	TP_ARGS(info, num_bytes, empty_size, data),
-+
-+	TP_FIELDS(
-+		ctf_array(u8, fsid, info->fsid, BTRFS_UUID_SIZE)
-+		ctf_integer(u64, num_bytes, num_bytes)
-+		ctf_integer(u64, empty_size, empty_size)
-+		ctf_integer(u64, data, data)
-+	)
-+)
-+
-+LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__reserve_extent,
-+
-+	TP_PROTO(const struct btrfs_block_group_cache *block_group, u64 start,
-+		 u64 len),
-+
-+	TP_ARGS(block_group, start, len),
-+
-+	TP_FIELDS(
-+		ctf_array(u8, fsid, block_group->fs_info->fsid, BTRFS_UUID_SIZE)
-+		ctf_integer(u64, bg_objectid, block_group->key.objectid)
-+		ctf_integer(u64, flags, block_group->flags)
-+		ctf_integer(u64, start, start)
-+		ctf_integer(u64, len, len)
-+	)
-+)
-+
-+LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__reserve_extent, btrfs_reserve_extent,
-+
-+	TP_PROTO(const struct btrfs_block_group_cache *block_group, u64 start,
-+		 u64 len),
-+
-+	TP_ARGS(block_group, start, len)
-+)
-+
-+LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__reserve_extent, btrfs_reserve_extent_cluster,
-+
-+	TP_PROTO(const struct btrfs_block_group_cache *block_group, u64 start,
-+		 u64 len),
-+
-+	TP_ARGS(block_group, start, len)
-+)
- 
-+#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(4,14,0))
- LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
- 
- 	btrfs_find_free_extent,
-@@ -1670,6 +1719,7 @@ LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
- 	TP_ARGS(info, num_bytes, empty_size, data),
- 
- 	TP_FIELDS(
-+		ctf_array(u8, fsid, info->fsid, BTRFS_UUID_SIZE)
- 		ctf_integer(u64, num_bytes, num_bytes)
- 		ctf_integer(u64, empty_size, empty_size)
- 		ctf_integer(u64, data, data)
-@@ -1685,6 +1735,7 @@ LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__reserve_extent,
- 	TP_ARGS(info, block_group, start, len),
- 
- 	TP_FIELDS(
-+		ctf_array(u8, fsid, info->fsid, BTRFS_UUID_SIZE)
- 		ctf_integer(u64, bg_objectid, block_group->key.objectid)
- 		ctf_integer(u64, flags, block_group->flags)
- 		ctf_integer(u64, start, start)
-@@ -1722,6 +1773,7 @@ LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
- 	TP_ARGS(info, num_bytes, empty_size, data),
- 
- 	TP_FIELDS(
-+		ctf_array(u8, fsid, info->fsid, BTRFS_UUID_SIZE)
- 		ctf_integer(u64, num_bytes, num_bytes)
- 		ctf_integer(u64, empty_size, empty_size)
- 		ctf_integer(u64, data, data)
--- 
-2.13.3
-
-- 
1.9.1


