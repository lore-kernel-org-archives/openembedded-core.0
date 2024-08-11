Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48F6BC531DA
	for <webhook@archiver.kernel.org>; Sun, 11 Aug 2024 18:04:38 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web10.29120.1723399472443503283
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Aug 2024 11:04:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mIcCPnrw;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7095bfd6346so1744476a34.0
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Aug 2024 11:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723399472; x=1724004272; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WRLm8DP3CbxS9QCrAmZRmXi4SHyTZoeAEThWzEuAD2E=;
        b=mIcCPnrwb38t4jB80F+tghpW41oMznEnsbI5cYpTNl0jhBdwH8XvcP2RyFyUy/LILt
         +9qlCWXduW3PG/p0ZryXfxY6fOI1bVvOOJx9q7bblkGR4IanG7WstES7dVWynqg5zeD1
         kBZApwxlc24Typao1KHs04gIMuam0HFkVFx3kRoFWmmByPhAg/BuNvUuEkBGZT6JVhXi
         mWsE97h91o/kmAgCB3/6MDRFzHDur2gjsnXORWptLPEyAwAakUET+4PSS8CvOrSdfxI+
         1pwNbiGumx8NbQCTpsVWhAY/NQ1oS9A2I3d4dx9t+njnAAFG8QWXpnyRNPL/Hvueciw9
         6I5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723399472; x=1724004272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WRLm8DP3CbxS9QCrAmZRmXi4SHyTZoeAEThWzEuAD2E=;
        b=cxQIrm0/DYz2Tl2UoT7qZ636na3wRHS3fEjPPZrrk1ZOXvqxTDKxNuSg2s8vwwiAM4
         BuiN4OOTbNQhHVlpcbVKipjYWfW0XwVWAZ6uZyJLbFQZ93bd25VhpTgAhvkPuEuZKwG/
         zWeYyGRz0BCW/L0v+4vAW/MBPST88LfBUopo/9d9U9vKB1ejRUGX3WxGYTBLyJ/FI3Ht
         3TZl4qct4lnFSYZ0rgHui7xe298N3WHDGB/ttMSauueZoZpUhAaWXF/8JM2J67M20nel
         EGEEZbtdxAQPFYJo2c6T2LqCu3LWc4DO+INpmzB0RPIi2SnNl1THWhyqMMOdKJDx4Pxo
         oLWg==
X-Gm-Message-State: AOJu0YzRS3AYNNUpD4U9JbT6iBi2HlyfIKkGRjru5V2bYw/axP6X3XYd
	ZwEQYa5i+sa3xpbzQSqni9Hfz4uBJDiaM4oajZqlmL1jETozHzCVy6QzGfCF
X-Google-Smtp-Source: AGHT+IF4aPd80EBIpjLiP3+fniEXetLbeW2rqZiSrMIXdGDLQ0GHcspndv7IPc+REh6njJuPId0WAw==
X-Received: by 2002:a05:6830:660c:b0:708:b29e:e95 with SMTP id 46e09a7af769-70b7483cb4cmr7986654a34.20.1723399471570;
        Sun, 11 Aug 2024 11:04:31 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bf42f4276esm1383996d6.66.2024.08.11.11.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 11:04:31 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] poky/poky-tiny: bump preferred version to 6.10
Date: Sun, 11 Aug 2024 14:04:23 -0400
Message-Id: <c4c9ddc0a8e01ee12e29399a9f7c0be2017a6a1a.1723399246.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1723399246.git.bruce.ashfield@gmail.com>
References: <cover.1723399246.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Aug 2024 18:04:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203190

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Make 6.10 the preferred kernel for these two distro
configurations. We leave -altcfg on 6.6 for LTS kernel
coverage and testing.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta-poky/conf/distro/poky-tiny.conf | 2 +-
 meta-poky/conf/distro/poky.conf      | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-poky/conf/distro/poky-tiny.conf b/meta-poky/conf/distro/poky-tiny.conf
index c85a8b5b31..29588e4913 100644
--- a/meta-poky/conf/distro/poky-tiny.conf
+++ b/meta-poky/conf/distro/poky-tiny.conf
@@ -44,7 +44,7 @@ FULL_OPTIMIZATION = "-Os"
 # Distro config is evaluated after the machine config, so we have to explicitly
 # set the kernel provider to override a machine config.
 PREFERRED_PROVIDER_virtual/kernel = "linux-yocto-tiny"
-PREFERRED_VERSION_linux-yocto-tiny ?= "6.6%"
+PREFERRED_VERSION_linux-yocto-tiny ?= "6.10%"
 
 # We can use packagegroup-core-boot, but in the future we may need a new packagegroup-core-tiny
 #POKY_DEFAULT_EXTRA_RDEPENDS += "packagegroup-core-boot"
diff --git a/meta-poky/conf/distro/poky.conf b/meta-poky/conf/distro/poky.conf
index bf5aa6035c..8270313109 100644
--- a/meta-poky/conf/distro/poky.conf
+++ b/meta-poky/conf/distro/poky.conf
@@ -19,8 +19,8 @@ POKY_DEFAULT_EXTRA_RRECOMMENDS = "kernel-module-af-packet"
 
 DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT} ${POKY_DEFAULT_DISTRO_FEATURES}"
 
-PREFERRED_VERSION_linux-yocto ?= "6.6%"
-PREFERRED_VERSION_linux-yocto-rt ?= "6.6%"
+PREFERRED_VERSION_linux-yocto ?= "6.10%"
+PREFERRED_VERSION_linux-yocto-rt ?= "6.10%"
 
 SDK_NAME = "${DISTRO}-${TCLIBC}-${SDKMACHINE}-${IMAGE_BASENAME}-${TUNE_PKGARCH}-${MACHINE}"
 SDKPATHINSTALL = "/opt/${DISTRO}/${SDK_VERSION}"
-- 
2.39.2


