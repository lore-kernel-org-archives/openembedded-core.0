Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DA1AC61DA4
	for <webhook@archiver.kernel.org>; Sat, 18 Mar 2023 15:32:15 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web10.8535.1679153526448256931
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Mar 2023 08:32:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HVSUi8ke;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id r5so8717963qtp.4
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Mar 2023 08:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679153525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SPJC7gyPDxhmriofIru1r+f2V8DWpB5p9M3/3idT5Xk=;
        b=HVSUi8keocHdqUb21gup8dm8yY8cXTJmr7A0XKCS5xfLwAX+njz0aVsMkcoqzvn5NT
         pWrAJGKoT7/HAvPdRVDAZ602cZZT7P/jsSQM28NotgKafcdu5NzqLCZ9AP8sLJH3Uymj
         K2wThg3WmanaGt1ecQR/4vulcfwJ/PGWPBdg1jLlLp2dlmM4G2uZRB9ReIStp5W1tsKy
         fJYA57zo9wH3dq5i8p3oFlg9FHZ0jYpvH+pgwEfcAoURvxmBQeqpoyFDB08IyRtD7BAw
         4sXh4oBJYOjwCTRLSS56qCr9e6fyhDze6L3a4BOyd/GJh0nYcDyFmFIMphaf3eWMF53a
         Khdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679153525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SPJC7gyPDxhmriofIru1r+f2V8DWpB5p9M3/3idT5Xk=;
        b=LpYspkScYyUbSi/LgIqsBfMxFQNtDSGac3iPMpD5IadR0uYf6UwQQetNCuBkXyzeaR
         c700fs8C+2GzPaR8BI4Vi8pp+ayWNjGMj08ESyOq36rjp7IOtwm/OlybQou/xGEcuh7P
         yxDUWuhdKIZsvFULoYSJ2kzVgyqxrl7YDLu0+a5JNE8k1SbNV3uDXh/A/yddi+By8Y/i
         803N0PU98S7cXYLF3/+Km61BEVWWJ0/09EUjcI1sMAsC6jZGg+WZ+7OtKu6wk4Dqi8OE
         oMcCm2BbMdeagzWWaTZhwDHxjElE5YYQKeUKnob4ism26auC+UsEGh59xUCVYM2djyIC
         s3XA==
X-Gm-Message-State: AO0yUKVvY56/W7AhJtkK0hgm72tNvjBfzIfiBHll7kXJfiFu3g4fUZc3
	R8hM7qQ3AVJkssVaHGQz68+yvpKZfCF5dw==
X-Google-Smtp-Source: AK7set9OCHCztu/g0Uxf0OlZZTyft5cMoj/eBs6vlQAqkafEJOPsOesXxW5Q6EVj78imW06HYECjPg==
X-Received: by 2002:a05:622a:1cb:b0:3dc:91cc:384b with SMTP id t11-20020a05622a01cb00b003dc91cc384bmr5254135qtw.5.1679153525282;
        Sat, 18 Mar 2023 08:32:05 -0700 (PDT)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id z12-20020ac875cc000000b003d2298d847bsm3108714qtq.67.2023.03.18.08.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Mar 2023 08:32:04 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] lttng-modules: update to v2.13.9
Date: Sat, 18 Mar 2023 11:32:01 -0400
Message-Id: <20230318153202.1697998-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Mar 2023 15:32:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178789

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Bumping lttng-modules to version v2.13.9-4-g12f43cab, which comprises the following commits:

    da1f5a26 Version 2.13.9
    dc2d1294 fix: jbd2: use the correct print format (v5.4.229)
    d04c1211 fix: jbd2 upper bound for v5.10.163
    4b8864fc fix: jbd2: use the correct print format (v5.10.163)
    69d3aa79 fix: btrfs: move accessor helpers into accessors.h (v6.2)

We drop our previously backported commits as well, since they are part
of the release.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 ...ccessor-helpers-into-accessors.h-v6..patch | 45 --------------
 .../fix-jbd2-upper-bound-for-v5.10.163.patch  | 52 ----------------
 ...e-the-correct-print-format-v5.10.163.patch | 61 -------------------
 ...ules_2.13.8.bb => lttng-modules_2.13.9.bb} |  5 +-
 4 files changed, 1 insertion(+), 162 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-btrfs-move-accessor-helpers-into-accessors.h-v6..patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-upper-bound-for-v5.10.163.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-use-the-correct-print-format-v5.10.163.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.13.8.bb => lttng-modules_2.13.9.bb} (83%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-btrfs-move-accessor-helpers-into-accessors.h-v6..patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-btrfs-move-accessor-helpers-into-accessors.h-v6..patch
deleted file mode 100644
index 26ae605b31..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-btrfs-move-accessor-helpers-into-accessors.h-v6..patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 69d3aa79a641f539cfd5c11b46b2dd9b4df9b0f0 Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Mon, 16 Jan 2023 15:01:51 -0500
-Subject: [PATCH] fix: btrfs: move accessor helpers into accessors.h (v6.2)
-
-See upstream commit :
-
-  commit 07e81dc94474eb62705c6f96d9ab1a5a797b8703
-  Author: Josef Bacik <josef@toxicpanda.com>
-  Date:   Wed Oct 19 10:51:00 2022 -0400
-
-    btrfs: move accessor helpers into accessors.h
-
-    This is a large patch, but because they're all macros it's impossible to
-    split up.  Simply copy all of the item accessors in ctree.h and paste
-    them in accessors.h, and then update any files to include the header so
-    everything compiles.
-
-Upstream-Status: Backport
-
-Change-Id: I1f0876dd8b7a8687f6802b60c3e3baabd017cc52
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- include/instrumentation/events/btrfs.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/include/instrumentation/events/btrfs.h b/include/instrumentation/events/btrfs.h
-index 785f16ac..01157107 100644
---- a/include/instrumentation/events/btrfs.h
-+++ b/include/instrumentation/events/btrfs.h
-@@ -9,6 +9,10 @@
- #include <linux/writeback.h>
- #include <lttng/kernel-version.h>
- 
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,2,0))
-+#include <../fs/btrfs/accessors.h>
-+#endif
-+
- #ifndef _TRACE_BTRFS_DEF_
- #define _TRACE_BTRFS_DEF_
- struct btrfs_root;
--- 
-2.34.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-upper-bound-for-v5.10.163.patch b/meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-upper-bound-for-v5.10.163.patch
deleted file mode 100644
index bfc49294b0..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-upper-bound-for-v5.10.163.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 4fd2615b87b3cac0fd5bdc5fc82db05f6fcfdecf Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Tue, 17 Jan 2023 12:16:04 -0500
-Subject: [PATCH] fix: jbd2 upper bound for v5.10.163
-
-Use the correct upper bound of 5,11,0.
-
-Change-Id: I435b44b940c7346ed8c3ef0d445365ed156702d0
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-
-Upstream-Status: Backport
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- include/instrumentation/events/jbd2.h | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/include/instrumentation/events/jbd2.h b/include/instrumentation/events/jbd2.h
-index f7993511..9b77ab92 100644
---- a/include/instrumentation/events/jbd2.h
-+++ b/include/instrumentation/events/jbd2.h
-@@ -28,7 +28,7 @@ LTTNG_TRACEPOINT_EVENT(jbd2_checkpoint,
- )
- 
- #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,2,0) \
--	|| LTTNG_KERNEL_RANGE(5,10,163, 6,0,0) \
-+	|| LTTNG_KERNEL_RANGE(5,10,163, 5,11,0) \
- 	|| LTTNG_KERNEL_RANGE(5,15,87, 5,16,0) \
- 	|| LTTNG_KERNEL_RANGE(6,0,18, 6,1,0) \
- 	|| LTTNG_KERNEL_RANGE(6,1,4, 6,2,0))
-@@ -97,7 +97,7 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(jbd2_commit, jbd2_drop_transaction,
- #endif
- 
- #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,2,0) \
--	|| LTTNG_KERNEL_RANGE(5,10,163, 6,0,0) \
-+	|| LTTNG_KERNEL_RANGE(5,10,163, 5,11,0) \
- 	|| LTTNG_KERNEL_RANGE(5,15,87, 5,16,0) \
- 	|| LTTNG_KERNEL_RANGE(6,0,18, 6,1,0) \
- 	|| LTTNG_KERNEL_RANGE(6,1,4, 6,2,0))
-@@ -140,7 +140,7 @@ LTTNG_TRACEPOINT_EVENT(jbd2_submit_inode_data,
- )
- 
- #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,2,0) \
--	|| LTTNG_KERNEL_RANGE(5,10,163, 6,0,0) \
-+	|| LTTNG_KERNEL_RANGE(5,10,163, 5,11,0) \
- 	|| LTTNG_KERNEL_RANGE(5,15,87, 5,16,0) \
- 	|| LTTNG_KERNEL_RANGE(6,0,18, 6,1,0) \
- 	|| LTTNG_KERNEL_RANGE(6,1,4, 6,2,0))
--- 
-2.35.4
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-use-the-correct-print-format-v5.10.163.patch b/meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-use-the-correct-print-format-v5.10.163.patch
deleted file mode 100644
index 8067cffaab..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-use-the-correct-print-format-v5.10.163.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From dd7be14bd04c1de309ba267097b03a308da87dae Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Tue, 17 Jan 2023 11:03:12 -0500
-Subject: [PATCH] fix: jbd2: use the correct print format (v5.10.163)
-
-See upstream commit :
-
-  commit d87a7b4c77a997d5388566dd511ca8e6b8e8a0a8
-  Author: Bixuan Cui <cuibixuan@linux.alibaba.com>
-  Date:   Tue Oct 11 19:33:44 2022 +0800
-
-    jbd2: use the correct print format
-
-    The print format error was found when using ftrace event:
-        <...>-1406 [000] .... 23599442.895823: jbd2_end_commit: dev 252,8 transaction -1866216965 sync 0 head -1866217368
-        <...>-1406 [000] .... 23599442.896299: jbd2_start_commit: dev 252,8 transaction -1866216964 sync 0
-
-    Use the correct print format for transaction, head and tid.
-
-Change-Id: I7601f5cbb86495c2607be7b11e02724c90b3ebf9
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-
-Upstream-Status: Backport
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- include/instrumentation/events/jbd2.h | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/include/instrumentation/events/jbd2.h b/include/instrumentation/events/jbd2.h
-index d5d8ea0c..f7993511 100644
---- a/include/instrumentation/events/jbd2.h
-+++ b/include/instrumentation/events/jbd2.h
-@@ -28,6 +28,7 @@ LTTNG_TRACEPOINT_EVENT(jbd2_checkpoint,
- )
- 
- #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,2,0) \
-+	|| LTTNG_KERNEL_RANGE(5,10,163, 6,0,0) \
- 	|| LTTNG_KERNEL_RANGE(5,15,87, 5,16,0) \
- 	|| LTTNG_KERNEL_RANGE(6,0,18, 6,1,0) \
- 	|| LTTNG_KERNEL_RANGE(6,1,4, 6,2,0))
-@@ -96,6 +97,7 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(jbd2_commit, jbd2_drop_transaction,
- #endif
- 
- #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,2,0) \
-+	|| LTTNG_KERNEL_RANGE(5,10,163, 6,0,0) \
- 	|| LTTNG_KERNEL_RANGE(5,15,87, 5,16,0) \
- 	|| LTTNG_KERNEL_RANGE(6,0,18, 6,1,0) \
- 	|| LTTNG_KERNEL_RANGE(6,1,4, 6,2,0))
-@@ -138,6 +140,7 @@ LTTNG_TRACEPOINT_EVENT(jbd2_submit_inode_data,
- )
- 
- #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,2,0) \
-+	|| LTTNG_KERNEL_RANGE(5,10,163, 6,0,0) \
- 	|| LTTNG_KERNEL_RANGE(5,15,87, 5,16,0) \
- 	|| LTTNG_KERNEL_RANGE(6,0,18, 6,1,0) \
- 	|| LTTNG_KERNEL_RANGE(6,1,4, 6,2,0))
--- 
-2.35.4
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.8.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.9.bb
similarity index 83%
rename from meta/recipes-kernel/lttng/lttng-modules_2.13.8.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.13.9.bb
index c04796be16..a08386b053 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.8.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.9.bb
@@ -11,15 +11,12 @@ include lttng-platforms.inc
 
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0009-Rename-genhd-wrapper-to-blkdev.patch \
-           file://fix-jbd2-use-the-correct-print-format-v5.10.163.patch \
-           file://fix-jbd2-upper-bound-for-v5.10.163.patch \
-           file://0001-fix-btrfs-move-accessor-helpers-into-accessors.h-v6..patch \
            "
 
 # Use :append here so that the patch is applied also when using devupstream
 SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch"
 
-SRC_URI[sha256sum] = "f525d3d48ea3a475cb535339c201666d0e4c75ec8c46d29837bcf381ea02cb19"
+SRC_URI[sha256sum] = "bf808b113544287cfe837a6382887fa66354ef5cc8216460cebbef3d27dc3581"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
-- 
2.34.1


