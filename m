Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12268C433FE
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 17:20:12 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web12.12907.1647969611062888126
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 10:20:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=evGGhsXw;
 spf=pass (domain: gmail.com, ip: 209.85.222.179,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id 1so14505781qke.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 10:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TJtOGzlIc8yN37DsSIfLx4Nlt5crJ0zI+Nxn4ikMK4A=;
        b=evGGhsXw7hglmKdyG7reHb4ph6FmBFP9xyyJPCvBxTLbc2Tt7+zUHy++Y3Dof/CFIN
         HsOMf5YhHdP2P+EBs/d/dxC81oedHQDTbCybo0RLCVgMndKqpdXyyFKYdKhmEGyYiVAq
         8651aEGWWRfKKjj+mRaWH44M20BHGAa45h1jJYuPFOeGLZXKN8N3a2gcbogMOuKGS3eT
         MIasgK89rQrfqFYWyjMfYTH/XyHewNAWtIlQrsoOPYWIxzHNkkGQi7qk+YasQqz/vykD
         pQcN17zyvwxNVKsDZTJjLAQmET0YFV7F0pSJ6rDgnRkLHRy0zrq+fbaDP/XmetiasYI6
         Ynhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TJtOGzlIc8yN37DsSIfLx4Nlt5crJ0zI+Nxn4ikMK4A=;
        b=3q/HHXJ4eNofe1bV2grh0J5O7Z2f/RGss1G770R2mwr/5rmVRQUVGYgvv0ujkyPD7D
         M9EGB7p8rHYs+3SlZNFbLuK4Xzx9+qqX5EILDCAYcLAiuUd7AaS6r+gScrKUTMzDCoFj
         b3rmgZSsY1+qUSGpe6MqLMETYmjlNBMsTlLGO4jj4rqvnfz46gpxBxwibUszMPmgWMFm
         N1suE+4J2N208JDsW3ujb2Iq1SH4Wf7+pnEhMNBmDdOgfsGMUZ5S2Nam0E7kf1HCCtfl
         zw2+1Z32F1eXbqyCNI53cFS+CDdld92O3lM4RQ8cbGUfQtRSq6vSrV3AKqNJWvJwl2Fr
         1TLA==
X-Gm-Message-State: AOAM532rZrqxzOH235btejT/ZYU8dagv3mClgRA9JvxFO+nfybsF7iJy
	LHzOcXCxCeFLJ1a1ff3+EibWbWbsuMxuvg==
X-Google-Smtp-Source: 
 ABdhPJzv8wFfc16vfFliy/9+UXiLMhT66XItpq9B9X5GYfW9HbVf/6VWaSnHvseyQYjYwLeFnbTuxw==
X-Received: by 2002:a05:620a:4403:b0:67d:b751:361f with SMTP id
 v3-20020a05620a440300b0067db751361fmr16507466qkp.347.1647969610144;
        Tue, 22 Mar 2022 10:20:10 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 q8-20020a05622a04c800b002e06d7c1eabsm14019648qtx.16.2022.03.22.10.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 10:20:08 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/10] linux-yocto-rt/5.15: update to -rt34
Date: Tue, 22 Mar 2022 13:19:56 -0400
Message-Id: 
 <4bb784f3526763dc491703c2440809be51ff6ca0.1647969481.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1647969481.git.bruce.ashfield@gmail.com>
References: <cover.1647969481.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Mar 2022 17:20:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163564

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto-rt/5.15:

    931d5079b9fc Linux 5.15.26-rt34
    c5c22d2fdb7b Linux 5.15.25-rt33
    6a2e3e6c9401 staging: greybus: gpio: Use generic_handle_irq_safe().
    cb17d0820286 net: usb: lan78xx: Use generic_handle_irq_safe().
    a4040e8669d8 mfd: ezx-pcap: Use generic_handle_irq_safe().
    870d69c5f090 misc: hi6421-spmi-pmic: Use generic_handle_irq_safe().
    3718dd5011f4 i2c: cht-wc: Use generic_handle_irq_safe().
    1252887f9872 i2c: core: Use generic_handle_irq_safe() in i2c_handle_smbus_host_notify().
    5aa6ecf9212a genirq: Provide generic_handle_irq_safe().
    1c73db1779a6 Linux 5.15.25-rt32
    2e68dcd8d632 Linux 5.15.24-rt31
    5ec703bf5ccc net: Write lock dev_base_lock without disabling bottom halves.
    15bd5dea95e6 Linux 5.15.21-rt30
    88c15a185ab7 Linux 5.15.19-rt29
    a70f09a4d312 Linux 5.15.18-rt28
    771d328d2646 Linux 5.15.14-rt27
    b56e1f0d87ba Linux 5.15.13-rt26
    5e8adc085a2b Linux 5.15.12-rt25
    ea0f771b9442 Linux 5.15.10-rt24
    269b39adfb2c Linux 5.15.7-rt23

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 3ccd308bbf..51ef3b2a4f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "3a5aeefb2543901e06f3ad90b690c2c01e846a20"
+SRCREV_machine ?= "931d5079b9fc28bf11bf0a13e2fd49049422674c"
 SRCREV_meta ?= "2f5c61a31c735701fdb4fb9615a31c43db40cf11"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-- 
2.19.1


