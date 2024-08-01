Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BBF1C3DA4A
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 15:09:08 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.70833.1722524938565215844
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 08:08:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LXTu7QRy;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7a1d3959ad5so212572285a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 08:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722524937; x=1723129737; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WRLm8DP3CbxS9QCrAmZRmXi4SHyTZoeAEThWzEuAD2E=;
        b=LXTu7QRypLW0TDOLuOHPymhfQpvdYlV3B4IVgq0EtudnbpY5gyCQi8+vRE5QAHoYcW
         IG9syXeTT2jj6qSypikDgj4jHHAp67sJoAXMbdW0nBjps6atG7EQbLg/2Sd07Womo2/s
         zX8LzTEjOdKoH1vOAgsiR3imAR2L1v2fS2ufwuetLV4mLHm8WhiKnTl4tAjoqjHEJfZL
         WAuZ+SAkSy2EMfE1U+Y4HpiKW+xr1YKoDWveg5qZaDCBA/ogbAyq4OibejmAawvtWWwK
         sxP8JlLfRm3IzrWPuWLtwxYw7c4+uqapwilL2hmVbmXixZZQ5/FIBDJ2oFXVPpVpLEWD
         RXVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722524937; x=1723129737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WRLm8DP3CbxS9QCrAmZRmXi4SHyTZoeAEThWzEuAD2E=;
        b=TE2kfXNdNf206REETjgn51ZPj5K1GyJ7ax2D07lao2CQRYyD9ztxhuInr+nYlfgA9f
         DxpY1yZi/arUOgV07mHzqgPiCEZUoy0HizjjzG8rJXqpUBO3wCBgVcqOmnOkHLbGX+6f
         D2b3sxquuJXxDRYB85u6xGYNgUPZdj2dy1NjvG2/Gsmuen8zzyq8Ght/N9vOoe6/b+C+
         jSZnLtW7HDIOCLJQo0ZQtsht4XdI1iQxkVD2cJa6RL0TD4SzNZcD543eMTiBFiurk6Fz
         ysBMZLn1uB5HhcTzxn0s6VjHlaaRfxeb2reZWryIPKI2mt/fC206vJP6q+NnV2aW0zXq
         gvvw==
X-Gm-Message-State: AOJu0YzuHbuy60NnRboAP4hQIQ9cJZMZgFTiTkcqewvqL7cD3n2KesBG
	1OunWa5fk0E200s/0wXzkOIqDo3daTCYfMlFJjdZ21S2q8HtGhF0YSQMjBcH
X-Google-Smtp-Source: AGHT+IFu2OCZe7yC62WoZvwiyqglzBOdZC0JoeHcGNpcdGMvHWX3aryFsdb37piX8E34RPhKyMSALQ==
X-Received: by 2002:a05:620a:44d5:b0:79c:ad5:cd7d with SMTP id af79cd13be357-7a34efde648mr44658685a.23.1722524937312;
        Thu, 01 Aug 2024 08:08:57 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a1d73b5003sm859343985a.43.2024.08.01.08.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 08:08:56 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/10] poky/poky-tiny: bump preferred version to 6.10
Date: Thu,  1 Aug 2024 11:08:42 -0400
Message-Id: <a3686b85dccbd8e4a53f65871eac02f81042fb58.1722524523.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1722524523.git.bruce.ashfield@gmail.com>
References: <cover.1722524523.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 15:09:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202750

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


