Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 525DBC4332F
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:35:03 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web08.11536.1634657702349379977
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:35:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=I6zucNwf;
 spf=pass (domain: gmail.com, ip: 209.85.128.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id
 67-20020a1c1946000000b0030d4c90fa87so3639468wmz.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fZTYNMaqtrG5B14teL4wmmvM6AyJu+1mFsWjS5/he7U=;
        b=I6zucNwfVwTcL1khjP4+LHdzxb6nTdDwvh1Q9n/g3EyEsb9UnW5Et87Q96vokSEXUr
         bYEgJ1KWmt1HFw8IWpvjfQp1IrfdG3hBqIcWZA5r8wD0sB5Z/2/bL1/jty1bYk1FIqPa
         fb4QHz+cexbGRPWyss9D9ttUnIpzNzTOJE3fJhRcLPmntsiL9Bs2j1VVCJcklXYY40K1
         tUrKwoTmsnYdvt70rTirjpR61FJPm6NW9e0eAjCWcOKjUcQJB+Zg3Jr7H8lImgZddzM4
         K8i5IX9VdWcL7c1CE2QTDMNHJgrq/lNH/GQuNsm0vmoaWXiGrDkPrAgvhjbfMZioJzQN
         IZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fZTYNMaqtrG5B14teL4wmmvM6AyJu+1mFsWjS5/he7U=;
        b=k1ZFmVZ3oNTgeuYc94bkpG2mwPEzK09SS7qFXKeKiiEIDvBILVI/3RVNhATRl4jSL3
         QgsRrjDOF2+JF/t44+ginN+y5kTK7fql2LF1ghXWtKI9ZWJs7XOOlfHEATJy6UxlEYNo
         SqDyHbEKVAGXbU6bB+3kNkYtJTdGQcC5ateFTihiY6gn38liYO5HbHTzGIHpO6arv82q
         z0RHxb+goBMY3vJBp1BIvyntqkx0lYBuI2F3351qg2fnurOmf/DM8Ly9iiqlHbpqJEvN
         qaKcVowAtSZQZ+jVW2K9cDgFMCfSD77hwae8JzxHQgIx2SJnHNz2sQ5UbtNNH+pizqEm
         MmyQ==
X-Gm-Message-State: AOAM533HUv0RYF1HDo0TKfInOZVNLDdRe16v4sFgj0acdD22l+xOpUqm
	tStAtADIoj5SCZS8joKlzYJNXjrZNcc=
X-Google-Smtp-Source: 
 ABdhPJwrROvD5YjK+WxXm0kuBtUsyCDWa3U7FuxPa5JeKNzFMdrgj/yhkbKQjKEMPnw2cMhK6pzC7Q==
X-Received: by 2002:adf:a2d8:: with SMTP id t24mr44406665wra.91.1634657700980;
        Tue, 19 Oct 2021 08:35:00 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:35:00 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 51/65] linux-firmware: upgrade 20210818 -> 20210919
Date: Tue, 19 Oct 2021 17:34:05 +0200
Message-Id: <20211019153419.3319802-51-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:35:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157170

From: Alexander Kanavin <alex.kanavin@gmail.com>

License-Update: additional files
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...{linux-firmware_20210818.bb => linux-firmware_20210919.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20210818.bb => linux-firmware_20210919.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20210818.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20210919.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20210818.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20210919.bb
index 0249332fca..48c01d99fe 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20210818.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20210919.bb
@@ -132,7 +132,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=15ad289bf2359e8ecf613f3b04f72fab \
+                    file://WHENCE;md5=76f012f7e9b2260d34eccf5726374f08 \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -205,7 +205,7 @@ PE = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "bef3d317c348d962b3a1b95cb4e19ea4f282e18112b2c669cff74f9267ce3893"
+SRC_URI[sha256sum] = "2fb22a5d7d23bf1f5800ab8152b39a00a445fbf4923de5a01b59d3f6253f0a9f"
 
 inherit allarch
 
-- 
2.20.1


