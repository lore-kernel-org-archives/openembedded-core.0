Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3159BC433F5
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 01:44:37 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web08.2686.1639608054974940505
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 14:40:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cq6kme1F;
 spf=pass (domain: gmail.com, ip: 209.85.128.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id
 a83-20020a1c9856000000b00344731e044bso4083378wme.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 14:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fsmUWfb82CmtiZw7GP/2/5JYkc26FFxWUvSWfLw0mqo=;
        b=cq6kme1FpzyKThdS2LV49XlG8P2xw4EjoqOg8bjLQcQJNNnYTwBR3ViaYeOkVWGBig
         f1PqBz09e/uDEezr6u2IfGcpgTAv9WW26Onqbli755yeIzX28TglFMdxhTi664NZIvX8
         1YuOxIfD4JVdwqmzzid0fTYiHnTsIQwtJBEGyso9VJR5LAvZRpWJeK6X2Nkp0E0XLvxh
         YbS0KLoCo+Crf8p1nHAGBgWRzp32B0ReaaF/uT3uuDL+r7h2EkTYN+UDAY1UMNT3biDR
         713umQNVRCTr9R/SOuxUWAJMtQLVWF3Vq9WS78W5jgP2MDBiMgsVp/r5HACWy7akQeGH
         52xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fsmUWfb82CmtiZw7GP/2/5JYkc26FFxWUvSWfLw0mqo=;
        b=mIoxg6pqjuL6VRLo1QOK9CSwZFpuRTtu2SZZJTFD0wNB1V5ewqaWN4Dp1T4xEnF3t8
         dlF2XxIFWnhMN/YDPDfwlnwz9dMCA9lOrN4yYP6oMwsBr4PDxvR28gFTSzEAPHRTKNQ5
         8vWNpH0tIeHt9xngLRs86JcR51HBFlwQ0shPiisPa9464Nf8UzQxY0cHPssCTpP1q8K/
         6WCtKtHDGKVSjbMua1PlGujIoSY+Ji1gzqs/yDl1QQdYBzvMskIByGxr2kcq0/MrDYwo
         p/l7FreChlkbTmMvY1dp9maOpS67+RXH+kziihabkjoh6xwO5S2bgGl2cM6FPrbaq9ek
         oCHA==
X-Gm-Message-State: AOAM530zaot5PA8ZJhCjOCrCxG7zTSkZVSSQv5T8JoDn6oCsZTvgDQE+
	RsLcO4TEDqJelY6Zp7b/FNHxNagXGVzhdA==
X-Google-Smtp-Source: 
 ABdhPJz9i860I5Op1HlNOd6AkRWvv2Vm1+3W1OqxQn8m3tdpdTm9JBCseS7E1/hWGGupCn09bolGeg==
X-Received: by 2002:a1c:a755:: with SMTP id q82mr2183694wme.157.1639608053653;
        Wed, 15 Dec 2021 14:40:53 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 u2sm3587269wrs.17.2021.12.15.14.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 14:40:53 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 23/26] libx11: update 1.7.3 -> 1.7.3.1
Date: Wed, 15 Dec 2021 23:40:31 +0100
Message-Id: <20211215224034.1814148-23-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211215224034.1814148-1-alex@linutronix.de>
References: <20211215224034.1814148-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 01:44:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159765

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xorg-lib/{libx11_1.7.3.bb => libx11_1.7.3.1.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libx11_1.7.3.bb => libx11_1.7.3.1.bb} (94%)

diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.7.3.bb b/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb
similarity index 94%
rename from meta/recipes-graphics/xorg-lib/libx11_1.7.3.bb
rename to meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb
index f55252b924..be9b8df6ce 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.7.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb
@@ -16,7 +16,7 @@ SRC_URI = "${XORG_MIRROR}/individual/lib/${XORG_PN}-${PV}.tar.xz"
 
 SRC_URI += "file://disable_tests.patch \
            "
-SRC_URI[sha256sum] = "dfd1343db3a0e523f1bb97d5ba71453c79eee78a77e51ca9f8dfef7131c6f0fe"
+SRC_URI[sha256sum] = "2ffd417266fb875028fdc0ef349694f63dbcd76d0b0cfacfb52e6151f4b60989"
 
 PROVIDES = "virtual/libx11"
 
-- 
2.20.1


