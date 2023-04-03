Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ACB4C76188
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 20:50:17 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web10.83746.1680555014498177226
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Apr 2023 13:50:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=IbZXcX0b;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: festevam@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6a11f365f87so900974a34.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 13:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680555013; x=1683147013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t/43WWys0gxFvRRDBs9jYyL9GnuGZnCv83XudHkjiA0=;
        b=IbZXcX0b1ra/H2/9H21r/xdrxVrddNB47it5JGJFjGdkka51Y4x6TViDUVZEhcF6kX
         jX2NCGhz2j7x2O+NTqsF89dXB3IXXg7S9riQGo/7O02dDPFV/K2lw5AX9eUV8UPz7ogR
         dn6D+eTNNuiZytP8XFMiE6cGaRyVxD5WNIXlEP+cWgxBD+faKqklbccJ4I4kV7Rz0m4H
         MmerJCyLSat/q596wO6qtrg2qLS+L11od8FxCqvkgWjVH8ZVeHlp5f+bvou1Ov/YS9O6
         K6bCDc+SMfB0GUkf0UFGpu/iAto8JVoX+h7KitM2ZLuIH+x3ylQG02AQbpKJFqCPKx2V
         x8WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680555013; x=1683147013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t/43WWys0gxFvRRDBs9jYyL9GnuGZnCv83XudHkjiA0=;
        b=dj5OBuon7DRIX3q8AAFOIH1HvQt08WiWBkkSrMo5nvoJ+Q1qLFyTCGjpk2/6ZPZPh5
         D0+0/kEu40z/iAjG4IqkGBh7Gl2UWbuAkHdz94tn4qcDx3XEGqRDyJeVOg1GkB+pGvpE
         U9ahye+bvb7s2pFSjwnMEMELAUbIwwjZOYKpoOWns5A2h2g37YkMyvGtEJ0kRcAxXUPs
         SrW9yZQ0fIwpG8bEunwPlcHW5W678H0Ev2wLBVFPokpVFZup4McF5RT05KyqaZxjGLVp
         rVJRRDnRpSJ33VP1TA8Hr1Q3rB/WVLNEncfG1+MPF4uXdbbFDcXIyd8spwiuAud4FgqK
         +EKQ==
X-Gm-Message-State: AAQBX9dQi0FgUi+C51ORW1+Vz8STr7PDH9MC4Elub6ao+GJ1Lz0sg52x
	7jPE4nys82tYni1m45v+JzI3hzA5q7O9bQ==
X-Google-Smtp-Source: AKy350ac62phtA1ilr/40d7WOPgazQAIM86aWt8273zXgLuKWEgXTkOMH4rQjwZbWRFLkM8Qhhbvlg==
X-Received: by 2002:a4a:e145:0:b0:51a:182f:65e3 with SMTP id p5-20020a4ae145000000b0051a182f65e3mr340626oot.1.1680555013266;
        Mon, 03 Apr 2023 13:50:13 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b69:c650:9d7b:32b8:8187])
        by smtp.gmail.com with ESMTPSA id j36-20020a4a9467000000b0052005fd50a4sm4500974ooi.35.2023.04.03.13.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 13:50:12 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>
Subject: [PATCH] u-boot: Upgrade to 2023.04
Date: Mon,  3 Apr 2023 17:50:00 -0300
Message-Id: <20230403205000.436458-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 20:50:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179654

From: Fabio Estevam <festevam@denx.de>

Upgrade to U-Boot 2023.04.

Remove the patch that is now upstream.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 ...ols-only-add-VIDEO-to-build-bmp_logo.patch | 39 -------------------
 meta/recipes-bsp/u-boot/u-boot-common.inc     |  2 +-
 .../u-boot/u-boot-tools_2023.01.bb            |  4 --
 .../u-boot/u-boot-tools_2023.04.bb            |  2 +
 .../{u-boot_2023.01.bb => u-boot_2023.04.bb}  |  0
 5 files changed, 3 insertions(+), 44 deletions(-)
 delete mode 100644 meta/recipes-bsp/u-boot/files/0001-Revert-config-tools-only-add-VIDEO-to-build-bmp_logo.patch
 delete mode 100644 meta/recipes-bsp/u-boot/u-boot-tools_2023.01.bb
 create mode 100644 meta/recipes-bsp/u-boot/u-boot-tools_2023.04.bb
 rename meta/recipes-bsp/u-boot/{u-boot_2023.01.bb => u-boot_2023.04.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/files/0001-Revert-config-tools-only-add-VIDEO-to-build-bmp_logo.patch b/meta/recipes-bsp/u-boot/files/0001-Revert-config-tools-only-add-VIDEO-to-build-bmp_logo.patch
deleted file mode 100644
index ab057611464c..000000000000
--- a/meta/recipes-bsp/u-boot/files/0001-Revert-config-tools-only-add-VIDEO-to-build-bmp_logo.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 5d663e105f5affbe1ba771a1124855bff748b829 Mon Sep 17 00:00:00 2001
-From: Fabio Estevam <festevam@denx.de>
-Date: Wed, 18 Jan 2023 22:15:04 -0300
-Subject: [PATCH] Revert "config: tools only: add VIDEO to build bmp_logo"
-
-This reverts commit 1cfba53ca46cade2dbf4e067afc8c19e72909a4b.
-
-Since commit 1cfba53ca46c ("config: tools only: add VIDEO to build
-bmp_logo") the build of tools-only_defconfig fails:
-
-| /bin/sh: line 1: tools/bmp_logo: No such file or directory
-
-This has been noticed in OpenEmbedded and Debian [1].
-
-Revert it for now.
-
-[1] https://lists.denx.de/pipermail/u-boot/2023-January/504758.html
-
-Upstream-Status: Backport [https://source.denx.de/u-boot/u-boot/-/commit/6333acb961b6fcaa60c6e5b623d676b332481cfa]
-Signed-off-by: Fabio Estevam <festevam@denx.de>
----
- configs/tools-only_defconfig | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/configs/tools-only_defconfig b/configs/tools-only_defconfig
-index 2197063112..fb75235e3d 100644
---- a/configs/tools-only_defconfig
-+++ b/configs/tools-only_defconfig
-@@ -29,7 +29,6 @@ CONFIG_DM_RTC=y
- CONFIG_SOUND=y
- CONFIG_SYSRESET=y
- CONFIG_TIMER=y
--CONFIG_VIDEO=y
- # CONFIG_VIRTIO_MMIO is not set
- # CONFIG_VIRTIO_PCI is not set
- # CONFIG_VIRTIO_SANDBOX is not set
--- 
-2.25.1
-
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index d72f6d3ba253..8a2e9aef94d5 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -12,7 +12,7 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "62e2ad1ceafbfdf2c44d3dc1b6efc81e768a96b9"
+SRCREV = "fd4ed6b7e83ec3aea9a2ce21baea8ca9676f40dd"
 
 SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2023.01.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2023.01.bb
deleted file mode 100644
index 3484b359ad8f..000000000000
--- a/meta/recipes-bsp/u-boot/u-boot-tools_2023.01.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require u-boot-common.inc
-require u-boot-tools.inc
-
-SRC_URI += "file://0001-Revert-config-tools-only-add-VIDEO-to-build-bmp_logo.patch"
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2023.04.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2023.04.bb
new file mode 100644
index 000000000000..7eaf721ca837
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2023.04.bb
@@ -0,0 +1,2 @@
+require u-boot-common.inc
+require u-boot-tools.inc
diff --git a/meta/recipes-bsp/u-boot/u-boot_2023.01.bb b/meta/recipes-bsp/u-boot/u-boot_2023.04.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2023.01.bb
rename to meta/recipes-bsp/u-boot/u-boot_2023.04.bb
-- 
2.34.1


