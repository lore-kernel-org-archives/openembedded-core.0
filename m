Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C9BEC433FE
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 08:08:40 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.3414.1637741319204752386
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 00:08:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=INnBADIZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id p18so1411240wmq.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 00:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FORYkV8iaQHupPIL/w9yEojFziJc71U0HyVbmX3ZCMY=;
        b=INnBADIZaewArZT/Ys/oWHmX/A9Rgo/nh3rtY1tnO/9Tla48eTCedacmt3pFn2b7TL
         EHQzBSwvHp3LSC6W1po7yb3912IaWUb+/5avw1XTtKGGiwVOTEZ4g7OEgglJDNvNU4az
         qzEnaggcn+5l/+fXdTP7WIXvpSsESI2q7yIAl2Yt1r4Z7EIORir4r7W70EgUXFXjWAFB
         itRldQi3y1LZslBXz14mU/jV4uMbkfb4v6Rd+E4WPRlnF9lQR6xOBu/qSesQX4pEqqF/
         qlnIn19zDmrVzaSqVMZbXKtiX+TQZYOOdKJ2AUCoHKkejydVru0OiEeu0Zmmy2BNHduT
         QJ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FORYkV8iaQHupPIL/w9yEojFziJc71U0HyVbmX3ZCMY=;
        b=rziXlbKh04008TFFZe5teSmttFR6YxfK0khjCT8E/iQnXxP1iKjv/3BQptueXwHaoV
         YTgL8Y2siRXtIBD+N4yM0jgcpkfqnEHS1Et4g33BspOBXG0ixT3SbImf1p2oHflDp/JS
         s+p/qgjhVk8NgFVjRgEzKTMLACeMweRJ0ukiGumHTZBU2dkrsY6LCAG7mu9LZLcmeOcg
         DsL3mXBe/6Mh7pJWOYLd0HrVkxsv1jGtCjy0XErEjOlbnd3YplWcB63HXZkBwNPRKd5r
         YPt3iHQMwa1BoL2CiQ9PvjktTx3l+C3KeURyUvDf3lBRrwCbky2Cgy8jI2Mzt5cz3Ytp
         q/Ig==
X-Gm-Message-State: AOAM532kfjz14VJfyP+ZulTgceqUp5QkAdOljtzLJ8yMQeCj99N4+At4
	MWTE87O3oaZOtfFmLNuLDAFZSeCnUWuF2g==
X-Google-Smtp-Source: 
 ABdhPJwJwHXMNSxhuJ52NVbSLYxO+zi4VzOzU30JfBH0HdOULUGbvrZrRRHuCVBZOUGeoXSKUu0udg==
X-Received: by 2002:a1c:23cb:: with SMTP id
 j194mr12701347wmj.13.1637741317755;
        Wed, 24 Nov 2021 00:08:37 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 k37sm4220205wms.21.2021.11.24.00.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 00:08:37 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Ross Burton <ross.burton@arm.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 08/21] ovmf: remove patch merged upstream
Date: Wed, 24 Nov 2021 09:08:15 +0100
Message-Id: <20211124080828.530981-8-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211124080828.530981-1-alex@linutronix.de>
References: <20211124080828.530981-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 08:08:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158664

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


