Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57AE3C433F5
	for <webhook@archiver.kernel.org>; Sat, 27 Nov 2021 09:54:19 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web08.34528.1638006851116938742
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Nov 2021 01:54:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gXhB2Qff;
 spf=pass (domain: gmail.com, ip: 209.85.221.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id a18so24056137wrn.6
        for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Nov 2021 01:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FORYkV8iaQHupPIL/w9yEojFziJc71U0HyVbmX3ZCMY=;
        b=gXhB2Qff0XHm7ldmnQ4gH5hVx/SL4RVnYZe5dYi/cnvPPUD8SyURScTYJM+5GKW0/V
         kOW+WFokvJKoqUdiCWtkiwqAYzY2g8HwgU7ZHEpUXuUbPPes/NRHryZbMKv5bnvLcMEz
         r0hqP7UQuH291KFBke/IezeSpcsrzFpLZPlIuU/HHQbrDrTz7BeiEn4J2mbecEfxRC5/
         Dska5HUu/NMAtU98mC/fLV6PAbEk10cPimsY4GTJK1ZBh5Lepi8nF/OjpdOJFDsaYDu9
         OtB128krdYCT44hQMIG5sSCnJmydZsv4SOIl5QEd6ee2or7cFByE+R4LHIHTjNEzMgY3
         aKXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FORYkV8iaQHupPIL/w9yEojFziJc71U0HyVbmX3ZCMY=;
        b=06wX6omlf9mE/eU6NiH/U4XEvNHhfyrNYXmqvITfcfh+3PgxwhLgsbaMQVRlhfFtrH
         qetXvnUixi1Ck2UU3a4MKi7IJZJCR6NrisMsg0mXPlHbV64IZDhpNj/72zyNxLnIJiuc
         W4YmAddPNhII0x7WuCIoV/K9X3Jic42xVDAxCe+EfRXcZZac6OTWOvFqgzqok0i9nI2y
         Ssm0fW7Fc5Q0jPkj41IcHaoB8JetM/QOtFea5p5zTogRdKT+rEkRCmgW4R7qebuj6KJi
         CAbSnknc4GyOe+PsBNeJ5cXbn+Vy/KVBoM0pWfWFbtwut/W4fK23ldEJ8Nx2uUv0rjxW
         xYmw==
X-Gm-Message-State: AOAM532Gpd6toUi9jRihPu7xjRV20oVvU+7a/FlM3OegsJWYPjNNeuUa
	ou2tKwQo2X3/jaG/fRsXBBIo11yfDxZxiQ==
X-Google-Smtp-Source: 
 ABdhPJwAWmZV53gH3vA+ntBVGcNgcXj/kuWIvJA/LLOXvPDRu2oxtKkh4TEH4RNwW1BZxk0j3F8ykQ==
X-Received: by 2002:a5d:4343:: with SMTP id u3mr20010537wrr.450.1638006849720;
        Sat, 27 Nov 2021 01:54:09 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 w4sm8484302wrs.88.2021.11.27.01.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Nov 2021 01:54:09 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Ross Burton <ross.burton@arm.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 03/13] ovmf: remove patch merged upstream
Date: Sat, 27 Nov 2021 10:53:47 +0100
Message-Id: <20211127095357.1748429-3-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211127095357.1748429-1-alex@linutronix.de>
References: <20211127095357.1748429-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Nov 2021 09:54:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158852

See here:
https://github.com/tianocore/edk2/pull/1513/files

The change was thus applied twice to the same file.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../ovmf/ovmf/0004-Strip-build-paths.patch    | 32 -------------------
 meta/recipes-core/ovmf/ovmf_git.bb            |  1 -
 2 files changed, 33 deletions(-)
 delete mode 100644 meta/recipes-core/ovmf/ovmf/0004-Strip-build-paths.patch

diff --git a/meta/recipes-core/ovmf/ovmf/0004-Strip-build-paths.patch b/meta/recipes-core/ovmf/ovmf/0004-Strip-build-paths.patch
deleted file mode 100644
index dfb8a73398..0000000000
--- a/meta/recipes-core/ovmf/ovmf/0004-Strip-build-paths.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From b7cfe97895e0586d14403ba98e62a0cd9373da96 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Mon, 14 Jun 2021 19:55:08 +0200
-Subject: [PATCH 4/6] Strip build paths
-
-Pass --zero to GenFw in release builds so that the sections that link back to
-the intermediate binaries (containing build paths) are removed.
-
-Upstream-Status: Pending (discussion at https://bugzilla.tianocore.org/show_bug.cgi?id=3256)
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- OvmfPkg/OvmfPkgIa32.dsc | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/OvmfPkg/OvmfPkgIa32.dsc b/OvmfPkg/OvmfPkgIa32.dsc
-index 33fbd76790..06c6d5ce60 100644
---- a/OvmfPkg/OvmfPkgIa32.dsc
-+++ b/OvmfPkg/OvmfPkgIa32.dsc
-@@ -91,6 +91,8 @@
- 
- !include NetworkPkg/NetworkBuildOptions.dsc.inc
- 
-+  RELEASE_*_*_GENFW_FLAGS = --zero
-+
- [BuildOptions.common.EDKII.DXE_RUNTIME_DRIVER]
-   GCC:*_*_*_DLINK_FLAGS = -z common-page-size=0x1000
-   XCODE:*_*_*_DLINK_FLAGS = -seg1addr 0x1000 -segalign 0x1000
--- 
-2.32.0
-
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index ce3b650ddf..80b9c1447f 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -19,7 +19,6 @@ SRC_URI = "gitsm://github.com/tianocore/edk2.git;branch=master;protocol=https \
            file://0001-ovmf-update-path-to-native-BaseTools.patch \
            file://0002-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch \
            file://0003-ovmf-Update-to-latest.patch \
-           file://0004-Strip-build-paths.patch \
            file://0005-debug-prefix-map.patch \
            file://0006-reproducible.patch \
            file://0001-Fix-VLA-parameter-warning.patch \
-- 
2.20.1


