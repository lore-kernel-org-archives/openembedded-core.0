Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 500CCC52D70
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 18:56:13 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web11.15310.1722970567794242449
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Aug 2024 11:56:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=imRqyacW;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7a1d42da3baso54465385a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 11:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722970567; x=1723575367; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WRLm8DP3CbxS9QCrAmZRmXi4SHyTZoeAEThWzEuAD2E=;
        b=imRqyacWfvYTDnRAvorkI1wq5grAs1vKtY3lX/V3N1E4Fq9XG+QcnoGbdAsO3B6aU/
         FEZWmd+50U4RDubB23ndhKLXm1Y8QWfZp0nUdOiR5TT6Lt2FGLpwJN6Q8dEweoEjC2ya
         7UjzPp2BBD7sfes7yAoIPSfQu8ovXg0Pf08fUBEKuPP8v5APNXOg/fVCeHJDkEM50Vno
         OWx+OAGPEBuzvCiODWP8qYp/ZAFrbV+NT/pfed0xCiXou834RlmkdGKs6vQn2B7b9yG/
         umvLsFixQaDsjspqUlVfVTjF4DF0Ca5ITGKo4bLAiyvcne5cKvDwvBNIo2GTtB1emcZ9
         /dGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722970567; x=1723575367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WRLm8DP3CbxS9QCrAmZRmXi4SHyTZoeAEThWzEuAD2E=;
        b=uIXtbA5MmQPRKBG0mks65TRD4j+DBzDSfAxcvK32VGtiNNr1tFC4gRAxb4H2CHLiSf
         RgQqKY7S6BDj2VSk7I8vlZtHr+xH/cwxdJ6MX/cbIR5l2lCsR1Op3I9Qct+TmKZUA4kE
         MtWXvLPhD/ZaNT3Jy2qMweKSBJdHHKGiI2NzDSYUn8AIcJ/awXh6yqiu/n5hIe55SvAy
         nQ47jcKlfmkHNErLMrJCSbrwDrZCsDO/poWe66FIA61GNTZ/m8LFf4YlkbL0klYhAZ6v
         /n65g4eFB3WGOyWDFBLv6yKc7ibEDon88o6uUD/V1E6Vzgf8c+YlqU7JKa/fCcF6xmPe
         YdMQ==
X-Gm-Message-State: AOJu0YxfDzjdBjUwofFsxlLzciKgOp0Ybah20DJxO0GYpagKlGfEnr4a
	5TQ9UrFTbw+81jqEw/MvtSqYHkyJQ4oyXSqw0uccBCp5fKR+u2LnLckKImBJ
X-Google-Smtp-Source: AGHT+IG5vgznw1bfKsDpwbcnKKaQoE0sDMBmAWCEme7qhWmZdgbnVIzAVnofXF/NqEFanHiqD1lvXA==
X-Received: by 2002:a05:620a:470c:b0:79f:8a7:eb8c with SMTP id af79cd13be357-7a34efc0629mr2058967185a.52.1722970566674;
        Tue, 06 Aug 2024 11:56:06 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a34f6ebcd3sm481988185a.42.2024.08.06.11.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 11:56:06 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/8] poky/poky-tiny: bump preferred version to 6.10
Date: Tue,  6 Aug 2024 14:55:54 -0400
Message-Id: <2e7e43f550278f7c4a45274759a2ededd32e4d70.1722970092.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1722970092.git.bruce.ashfield@gmail.com>
References: <cover.1722970092.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 18:56:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203047

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


