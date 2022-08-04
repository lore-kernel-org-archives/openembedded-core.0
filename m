Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CB79C25B08
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 22:58:25 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web11.727.1659653896479839107
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 15:58:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EUb6JJtT;
 spf=pass (domain: gmail.com, ip: 209.85.222.169,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id o1so739114qkg.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 15:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=at3BGstpCKeDXogHsRY7MMlvD+Z/RYNPmdaSQRgborU=;
        b=EUb6JJtTIFf9EHSXy7FmR9haDTkarNuYc1vTdV4FabWQg+csLYMiiWheeySThazs+l
         Y0fhsZV4gXyeUwAA5q09b0F14Zb6Cfsv9GA7V/Zvtipp9T8xtA7xFUdfo5kYH3F9OGx7
         BwA2uftsPh4pyUFRc508o8XifMfc6gGooHztb9hOxSyqKqQdKj1ALJ2uFNHPRTD0zCUR
         oTGGvlKeleLuMD2aprKOeXyVkIhWIxUYddqDp2qhF6fwWb7P/IlgvrW/iP7NrFhVy0kX
         7cMbknSf3d6AMNnA+an1jrOV++KH8/PHg7TeW9N98cvFnbTZ4qPMC2PQg+TkjTLRUWcl
         w/zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=at3BGstpCKeDXogHsRY7MMlvD+Z/RYNPmdaSQRgborU=;
        b=ToDJ9jYzPK7si4ym9DWJ3/Z1cbWKIZ9NMNqPqvY7yf/LbwJ0AGx5xsZBoxKfWLBlN7
         IxZe0fU9uzwImWe4nw3JF2qExOYmi1IkVjlF3kJToPhwcj3ZxwvkuLCl3+xovYhoiyHO
         kmmIxDR2abUIbzWMqqeVDvzO1wuT5jMfqpP9E1zeAk5YxFA9a8sOcxicFrml8z14fjLA
         IcP+fv+LUISlkIVS1+wN5ZCIMYagXUPzyu3qmCIu8CS1XyBgYPMAgTgX2laaMvp6z7p7
         r63fUgR2rPwQ5rzbpsRY7/1Abv0iX/Va45izxQKNTYAHmW2W49IIC2jG4sYeMC1Gpo4Y
         OV1g==
X-Gm-Message-State: ACgBeo3sLIePK5m0Hvy48pj004IRz7PQ4RpDWI1mDwFW75tGOuNPJKKw
	BKfaE1Wg9LPayIIbtRTYrUVPCBWLEfxV4A==
X-Google-Smtp-Source: 
 AA6agR5Ajbn/c3eWjhn81UrsqRChW3+qO1jNFksO/2zkn97kcnMI1GUSpqhaZjVFwY/Jfv9J1Djz1g==
X-Received: by 2002:a05:620a:f0d:b0:6b5:473d:d4b with SMTP id
 v13-20020a05620a0f0d00b006b5473d0d4bmr3217002qkl.6.1659653895482;
        Thu, 04 Aug 2022 15:58:15 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 bl38-20020a05620a1aa600b006b8df80471csm1500818qkb.119.2022.08.04.15.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 15:58:14 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/13] poky: update preferred version to v5.19
Date: Thu,  4 Aug 2022 18:57:48 -0400
Message-Id: 
 <4e8c377793162a1718a5afef7e827221fa3973a8.1659653543.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1659653543.git.bruce.ashfield@gmail.com>
References: <cover.1659653543.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Aug 2022 22:58:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168875

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta-poky/conf/distro/poky-tiny.conf | 2 +-
 meta-poky/conf/distro/poky.conf      | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-poky/conf/distro/poky-tiny.conf b/meta-poky/conf/distro/poky-tiny.conf
index 2fe0d478ff..5772661588 100644
--- a/meta-poky/conf/distro/poky-tiny.conf
+++ b/meta-poky/conf/distro/poky-tiny.conf
@@ -44,7 +44,7 @@ FULL_OPTIMIZATION="-Os -pipe ${DEBUG_FLAGS}"
 # Distro config is evaluated after the machine config, so we have to explicitly
 # set the kernel provider to override a machine config.
 PREFERRED_PROVIDER_virtual/kernel = "linux-yocto-tiny"
-PREFERRED_VERSION_linux-yocto-tiny ?= "5.15%"
+PREFERRED_VERSION_linux-yocto-tiny ?= "5.19%"
 
 # We can use packagegroup-core-boot, but in the future we may need a new packagegroup-core-tiny
 #POKY_DEFAULT_EXTRA_RDEPENDS += "packagegroup-core-boot"
diff --git a/meta-poky/conf/distro/poky.conf b/meta-poky/conf/distro/poky.conf
index b4c64c495f..46600aa5d2 100644
--- a/meta-poky/conf/distro/poky.conf
+++ b/meta-poky/conf/distro/poky.conf
@@ -19,8 +19,8 @@ POKY_DEFAULT_EXTRA_RRECOMMENDS = "kernel-module-af-packet"
 
 DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT} ${POKY_DEFAULT_DISTRO_FEATURES}"
 
-PREFERRED_VERSION_linux-yocto ?= "5.15%"
-PREFERRED_VERSION_linux-yocto-rt ?= "5.15%"
+PREFERRED_VERSION_linux-yocto ?= "5.19%"
+PREFERRED_VERSION_linux-yocto-rt ?= "5.19%"
 
 SDK_NAME = "${DISTRO}-${TCLIBC}-${SDKMACHINE}-${IMAGE_BASENAME}-${TUNE_PKGARCH}-${MACHINE}"
 SDKPATHINSTALL = "/opt/${DISTRO}/${SDK_VERSION}"
-- 
2.19.1


