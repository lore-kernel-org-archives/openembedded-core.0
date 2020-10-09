Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web12.14847.1602253148364372682
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2020 07:19:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=h3xWvr7U;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id g9so7283285pgh.8
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2020 07:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=oZynIdMGDU0YrQzeLTIDw2qJnNqAMLxbwm/gB0GbKJo=;
        b=h3xWvr7UcRWSKMazDZblFG1k0yWyMbXnC9noDUZodLlU1+fqy8xbtmJ34hnzcNWQEh
         3dRCe2wODcWFNzDATWV+N+FetVlxZdEnf3d9RjCp+DM8TkNGpx3MIlxN4sqicZJGaA1c
         MAJ7ZvAZp+JAboZm7TUvYr49MDndAlKA6NSarf3TIKvrJNsA8E76vnq4cS+0KDS7r3i8
         uuVJPk+YhjoWqohTzKowsMMGjPNuIC/vGfp568JPQxNUB4AUMe0KoERGw/AXtjJbRkDq
         LFAgyPAZRHSkBdFGIN1emCNwNxGxaYQbEGbAoV71XXfWWe+fwzDBrKaTf5rS/3kuaLBs
         ydBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=oZynIdMGDU0YrQzeLTIDw2qJnNqAMLxbwm/gB0GbKJo=;
        b=OAB0cUPC5t29iUnYiImLBT7fBwzReNvbcAha8gb0EIsiiaBCOzlA/IJcIW9IH14MtY
         BNi2DzexZJJXAcka7p9nrlhLt6x9gOze3Y/JyvMunnCk9nU6O5JDkZnilWH3kAXZiJ00
         PX+vvSTBXR6l/Yl7EmxXpWHjCVih34Aweyqym8/UPRzQxws+//EsCCrD2a1LABI4s39e
         XU4bdJIV6L8knnGDW7mYE7KVJ0OlN9et1AhjlNI2vgfhstUewoBv1LNq/vTc0JDdaI31
         0OoaQlPjTrhuYsM9tXduszJuptFW5qPXZ4KSeOAPHU4zzrAXZeEolicgjdx7pccD8nB+
         RSsw==
X-Gm-Message-State: AOAM532C/O2eYTWHgoKDBLorQbo3ZcuPOBMitjkaCV12wWqglk0kAHxL
	neXYV+XQ5Jse3JPCqAqhsbjpQEdFZoYEEPJL
X-Google-Smtp-Source: ABdhPJwIsWv+4cHtBRQHA1WfbM9SIxgM6q7C2/W0d5zx1wd7hfUFQiBSLEK/JRcbAZkTaxV0eLjAQg==
X-Received: by 2002:a63:d245:: with SMTP id t5mr3381359pgi.283.1602253147301;
        Fri, 09 Oct 2020 07:19:07 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id n127sm10736116pfn.155.2020.10.09.07.19.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 07:19:06 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/14] Revert "lttng-modules: backport writeback.h changes from 2.12.x to fix kernel 5.4.62+"
Date: Fri,  9 Oct 2020 04:18:36 -1000
Message-Id: <49ab42d4dc93cee75ac7e9b3a4623ff1f42b306f.1602253014.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1602253014.git.steve@sakoman.com>
References: <cover.1602253014.git.steve@sakoman.com>

We'll be using an upstream version bump instead of this backport

This reverts commit 348c666b2dca230308c8462dac2117b04cca6ae7.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ckport-writeback.h-changes-from-2.12.patch | 128 ------------------
 .../lttng/lttng-modules_2.11.2.bb             |   7 +-
 2 files changed, 3 insertions(+), 132 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-lttng-modules-backport-writeback.h-changes-from-2.12.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-lttng-modules-backport-writeback.h-changes-from-2.12.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-lttng-modules-backport-writeback.h-changes-from-2.12.patch
deleted file mode 100644
index 25b0a57bc6..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-lttng-modules-backport-writeback.h-changes-from-2.12.patch
+++ /dev/null
@@ -1,128 +0,0 @@
-From 66d0869cf54ed79a33345f537dce2f7840e279f0 Mon Sep 17 00:00:00 2001
-From: Bruce Ashfield <bruce.ashfield@gmail.com>
-Date: Tue, 29 Sep 2020 10:28:20 -0400
-Subject: [PATCH] lttng-modules: backport writeback.h changes from 2.12.x to
- fix kernel 5.4.62+
-
-Backporting the kernel version changes for writeback.h to fix
-compilation against kernel stable versions 5.4.62+
-
-This is a combination of upstream commits:
-
- 87b2aff [fix: writeback: Fix sync livelock due to b_dirty_time processing (v5.9)]
- b74b25f [fix: version ranges for ext4_discard_preallocations and writeback_queue_io
-
-Upstream-status: Backport
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
----
- .../events/lttng-module/writeback.h           | 48 +++++++++++++------
- 1 file changed, 33 insertions(+), 15 deletions(-)
-
-diff --git a/instrumentation/events/lttng-module/writeback.h b/instrumentation/events/lttng-module/writeback.h
-index 3327a0f..8d2250e 100644
---- a/instrumentation/events/lttng-module/writeback.h
-+++ b/instrumentation/events/lttng-module/writeback.h
-@@ -372,34 +372,55 @@ LTTNG_TRACEPOINT_EVENT_WBC_INSTANCE(wbc_balance_dirty_wait, writeback_wbc_balanc
- #endif
- LTTNG_TRACEPOINT_EVENT_WBC_INSTANCE(wbc_writepage, writeback_wbc_writepage)
- 
--#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,1,0))
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,9,0) || \
-+	LTTNG_KERNEL_RANGE(5,8,6, 5,9,0) || \
-+	LTTNG_KERNEL_RANGE(5,4,62, 5,5,0) || \
-+	LTTNG_KERNEL_RANGE(4,19,143, 4,20,0) || \
-+	LTTNG_KERNEL_RANGE(4,14,196, 4,15,0) || \
-+	LTTNG_KERNEL_RANGE(4,9,235, 4,10,0) || \
-+	LTTNG_KERNEL_RANGE(4,4,235, 4,5,0) || \
-+	LTTNG_UBUNTU_KERNEL_RANGE(4,15,18,119, 4,16,0,0))
-+LTTNG_TRACEPOINT_EVENT(writeback_queue_io,
-+	TP_PROTO(struct bdi_writeback *wb,
-+		 struct wb_writeback_work *work,
-+		 unsigned long dirtied_before,
-+		 int moved),
-+	TP_ARGS(wb, work, dirtied_before, moved),
-+	TP_FIELDS(
-+		ctf_array_text(char, name, dev_name(wb->bdi->dev), 32)
-+		ctf_integer(unsigned long, older, dirtied_before)
-+		ctf_integer(int, moved, moved)
-+	)
-+)
-+#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3,2,0))
- LTTNG_TRACEPOINT_EVENT(writeback_queue_io,
- 	TP_PROTO(struct bdi_writeback *wb,
--#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,2,0))
- 		 struct wb_writeback_work *work,
--#else
--		 unsigned long *older_than_this,
--#endif
- 		 int moved),
--#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,2,0))
- 	TP_ARGS(wb, work, moved),
--#else
-+	TP_FIELDS(
-+		ctf_array_text(char, name, dev_name(wb->bdi->dev), 32)
-+		ctf_integer(int, moved, moved)
-+	)
-+)
-+#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3,1,0))
-+LTTNG_TRACEPOINT_EVENT(writeback_queue_io,
-+	TP_PROTO(struct bdi_writeback *wb,
-+		 unsigned long *older_than_this,
-+		 int moved),
- 	TP_ARGS(wb, older_than_this, moved),
--#endif
- 	TP_FIELDS(
- 		ctf_array_text(char, name, dev_name(wb->bdi->dev), 32)
--#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,2,0))
--#else
- 		ctf_integer(unsigned long, older,
- 			older_than_this ? *older_than_this : 0)
- 		ctf_integer(long, age,
- 			older_than_this ?
- 				(jiffies - *older_than_this) * 1000 / HZ
- 				: -1)
--#endif
- 		ctf_integer(int, moved, moved)
- 	)
- )
-+#endif
- 
- #if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,14,0))
- LTTNG_TRACEPOINT_EVENT_MAP(global_dirty_state,
-@@ -425,7 +446,7 @@ LTTNG_TRACEPOINT_EVENT_MAP(global_dirty_state,
- 		ctf_integer(unsigned long, dirty_limit, global_dirty_limit)
- 	)
- )
--#else
-+#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3,1,0))
- LTTNG_TRACEPOINT_EVENT_MAP(global_dirty_state,
- 
- 	writeback_global_dirty_state,
-@@ -450,7 +471,6 @@ LTTNG_TRACEPOINT_EVENT_MAP(global_dirty_state,
- 	)
- )
- #endif
--#endif
- 
- #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,2,0))
- 
-@@ -661,7 +681,6 @@ LTTNG_TRACEPOINT_EVENT(writeback_sb_inodes_requeue,
- )
- #endif
- 
--#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,37))
- LTTNG_TRACEPOINT_EVENT_CLASS(writeback_congest_waited_template,
- 
- 	TP_PROTO(unsigned int usec_timeout, unsigned int usec_delayed),
-@@ -687,7 +706,6 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(writeback_congest_waited_template, writeback_wai
- 
- 	TP_ARGS(usec_timeout, usec_delayed)
- )
--#endif
- 
- #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,1,0))
- LTTNG_TRACEPOINT_EVENT_CLASS(writeback_single_inode_template,
--- 
-2.25.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.11.2.bb b/meta/recipes-kernel/lttng/lttng-modules_2.11.2.bb
index 8e56a3c10a..6fff096a37 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.11.2.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.11.2.bb
@@ -11,7 +11,6 @@ COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|nios2|arm|riscv).*-linux'
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
            file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
-           file://0001-lttng-modules-backport-writeback.h-changes-from-2.12.patch \
            "
 
 SRC_URI[md5sum] = "2e3bc8cfb264fa13f374618b46f170e7"
@@ -34,11 +33,11 @@ python do_package_prepend() {
 BBCLASSEXTEND = "devupstream:target"
 LIC_FILES_CHKSUM_class-devupstream = "file://LICENSE;md5=3f882d431dc0f32f1f44c0707aa41128"
 DEFAULT_PREFERENCE_class-devupstream = "-1"
-SRC_URI_class-devupstream = "git://git.lttng.org/lttng-modules;branch=stable-2.12 \
+SRC_URI_class-devupstream = "git://git.lttng.org/lttng-modules;branch=stable-2.11 \
            file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
            file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
            "
-SRCREV_class-devupstream = "01a12501e0b0395b60c7e392cb7dded51ae572ca"
-PV_class-devupstream = "2.12.2+git${SRCPV}"
+SRCREV_class-devupstream = "17c413953603f063f2a9d6c3788bec914ce6f955"
+PV_class-devupstream = "2.11.2+git${SRCPV}"
 S_class-devupstream = "${WORKDIR}/git"
 SRCREV_FORMAT ?= "lttng_git"
-- 
2.17.1

