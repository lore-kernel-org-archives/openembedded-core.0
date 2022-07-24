Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0433C43334
	for <webhook@archiver.kernel.org>; Sun, 24 Jul 2022 13:44:10 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.16724.1658670242099179734
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jul 2022 06:44:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Zj8NgAbD;
 spf=pass (domain: gmail.com, ip: 209.85.215.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id bf13so8115102pgb.11
        for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jul 2022 06:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3yzAK4FRjhOV/bFk+mx8G/IQN5FdaTEFxBlU/dQXRiI=;
        b=Zj8NgAbD+plhT0TiNV+P17G5aBcg1LbkkcRMjTavqxNNxbypInaObE1t4RHPqu+2IS
         lDA8RURVbQNA9WfFRNy8W37g0HvQiU0BPd/FDAYODcuHktn3tPsz6bfUo7WgIGmKb9Vo
         wz6XO/uVpmRqbN/GkSzYzY0PN8nGMjDfxfTWJzky+8XEo1TIGRPN26LDTDWbb/o0HjDm
         NZnQrWeO5BQx8vLoKrRE3XfpMH4XMhEcRhUTbDTOJ0jMWlTmPeDFJSTfG9Jg55afhwhQ
         Nk96a3EqhXMOrYfBePz+KPNueCz6OzzB7NpqXJpv4ubHiQi6OrZOZamUHQRD9lUewH2n
         eIzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3yzAK4FRjhOV/bFk+mx8G/IQN5FdaTEFxBlU/dQXRiI=;
        b=iGnwpgWIdCSUHroouj7AoaxgLbt7gyrcF3GEvEpM99vIhI950rfTKJ4odoCxDcdstt
         azkkvMyVAXDZtRz8DW8ZS7hqEzhnqIzgJEW1M+99Qfv+rHfyS+mxf4reN2Z/dK1NP97e
         YykcJOtoTKNmLlVsfzcZgovFXuxjSxj7o4hZPVg2j1cpF1VIN6wu0CUN6SkFX4fnrdQm
         30mBeu/jaS1l44L73p3xrddXTc9MnYK35ddMwOfDEhdC/C3UAAMGQQTwZpXl9dUloDDt
         Ky3Hm/GB+J6qrR4MbUd5nMRARJ52G4ZdrmELJTWIDsO4KEQ8fLpUHl8OCNDIw1NbU3r0
         siMQ==
X-Gm-Message-State: AJIora9CYnDudHYoWiuE7efzE3SglMoGyIp1VZ4yX5J+CKirpQaFDgmg
	j1tbah+UZadKH3nWrmKzyN3XkDYe+t5G5Q==
X-Google-Smtp-Source: 
 AGRyM1ub+vTt46LIce6yycMSmT7UYFpTvwe8lxOFDgnN5cdGffULinIc2uINxJ6K3oCJnT7mHNYV8Q==
X-Received: by 2002:a05:6a00:1747:b0:52b:1cee:1384 with SMTP id
 j7-20020a056a00174700b0052b1cee1384mr8470344pfc.41.1658670240963;
        Sun, 24 Jul 2022 06:44:00 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a78c])
        by smtp.gmail.com with ESMTPSA id
 m4-20020a170902d18400b0016d1ab31b05sm7181578plb.42.2022.07.24.06.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jul 2022 06:44:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] systemd: Drop backported patch applied in 251.3
Date: Sun, 24 Jul 2022 06:43:57 -0700
Message-Id: <20220724134357.839977-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Jul 2022 13:44:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168455

This was added to musl specific backport patchset so it escaped testing

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Add-sys-file.h-for-LOCK_.patch       | 78 -------------------
 meta/recipes-core/systemd/systemd_251.3.bb    |  1 -
 2 files changed, 79 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-Add-sys-file.h-for-LOCK_.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-Add-sys-file.h-for-LOCK_.patch b/meta/recipes-core/systemd/systemd/0001-Add-sys-file.h-for-LOCK_.patch
deleted file mode 100644
index 08e8af0a5b4..00000000000
--- a/meta/recipes-core/systemd/systemd/0001-Add-sys-file.h-for-LOCK_.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From c193380a08f5adea1fd514e0a20abd1d7b50d08c Mon Sep 17 00:00:00 2001
-From: Pavel Zhukov <pavel.zhukov@huawei.com>
-Date: Mon, 20 Jun 2022 11:24:52 +0200
-Subject: [PATCH] Add sys/file.h for LOCK_
-
-Upstream-Status: Backport [19df770fe14da601d4e54e1592c11c10ffe4df5a]
-
-Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
-
----
- src/core/namespace.c       | 1 +
- src/dissect/dissect.c      | 1 +
- src/shared/dissect-image.c | 2 ++
- src/sysext/sysext.c        | 1 +
- src/test/test-loop-block.c | 1 +
- 5 files changed, 6 insertions(+)
-
-diff --git a/src/core/namespace.c b/src/core/namespace.c
-index 926aa96174..39f9e21c93 100644
---- a/src/core/namespace.c
-+++ b/src/core/namespace.c
-@@ -7,6 +7,7 @@
- #include <sys/mount.h>
- #include <unistd.h>
- #include <linux/fs.h>
-+#include <sys/file.h>
- 
- #include "alloc-util.h"
- #include "base-filesystem.h"
-diff --git a/src/dissect/dissect.c b/src/dissect/dissect.c
-index bd94a755db..a0d2a6f287 100644
---- a/src/dissect/dissect.c
-+++ b/src/dissect/dissect.c
-@@ -6,6 +6,7 @@
- #include <stdio.h>
- #include <sys/ioctl.h>
- #include <sys/mount.h>
-+#include <sys/file.h>
- 
- #include "architecture.h"
- #include "chase-symlinks.h"
-diff --git a/src/shared/dissect-image.c b/src/shared/dissect-image.c
-index 1ab88839aa..a9e3fe4b44 100644
---- a/src/shared/dissect-image.c
-+++ b/src/shared/dissect-image.c
-@@ -4,6 +4,8 @@
- #include <valgrind/memcheck.h>
- #endif
- 
-+#include <sys/file.h>
-+
- #include <linux/blkpg.h>
- #include <linux/dm-ioctl.h>
- #include <linux/loop.h>
-diff --git a/src/sysext/sysext.c b/src/sysext/sysext.c
-index 364af195e0..85686c0fab 100644
---- a/src/sysext/sysext.c
-+++ b/src/sysext/sysext.c
-@@ -5,6 +5,7 @@
- #include <linux/loop.h>
- #include <sys/mount.h>
- #include <unistd.h>
-+#include <sys/file.h>
- 
- #include "capability-util.h"
- #include "chase-symlinks.h"
-diff --git a/src/test/test-loop-block.c b/src/test/test-loop-block.c
-index d1793222f0..6886c4cd31 100644
---- a/src/test/test-loop-block.c
-+++ b/src/test/test-loop-block.c
-@@ -3,6 +3,7 @@
- #include <fcntl.h>
- #include <linux/loop.h>
- #include <pthread.h>
-+#include <sys/file.h>
- 
- #include "alloc-util.h"
- #include "dissect-image.h"
diff --git a/meta/recipes-core/systemd/systemd_251.3.bb b/meta/recipes-core/systemd/systemd_251.3.bb
index 326c7ba967a..8497e24af97 100644
--- a/meta/recipes-core/systemd/systemd_251.3.bb
+++ b/meta/recipes-core/systemd/systemd_251.3.bb
@@ -49,7 +49,6 @@ SRC_URI_MUSL = "\
                file://0001-pass-correct-parameters-to-getdents64.patch \
                file://0002-Add-sys-stat.h-for-S_IFDIR.patch \
                file://0001-Adjust-for-musl-headers.patch \
-               file://0001-Add-sys-file.h-for-LOCK_.patch \
                "
 
 PAM_PLUGINS = " \
-- 
2.37.1


