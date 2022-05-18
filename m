Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AAFDC4332F
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 10:59:36 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web09.3573.1652871530816043440
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gXAsDk3Z;
 spf=pass (domain: gmail.com, ip: 209.85.218.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id n13so1166743ejv.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fNSplHVv9NAeBtcFNpVGf81Xg8mk470Azd2Oe6KAsUU=;
        b=gXAsDk3Zk2dLE4FSWdQJzlW7D4yY0umBWaUoFJjLK6xNWQgLQLMNAiVDO9Zu2ish20
         B63Q2zQOqX1riPQKm2IKLzqOc2CSU3aRmYd25kXf/DP82PLd6EbPPjt33qB2LXALZMeL
         RWCoGKCcfudTN3se2lpNp9eo3k4h9tRhA3x2V+yyN4Y1sA530VsWNapylReS5iUA4k4c
         kQ1aNfZDiWARDU2yfbAQn6Rps0lapV2Yd9rO+5FDcDubtO2LbJE625kk2WLxFLzPxTdh
         tyn1tJZxYsSo11JEy+G3iHCO5WJFVkAvnSzutgLz/LZLp1l1ATLALdiWhqjuA0hRK9Az
         q8Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fNSplHVv9NAeBtcFNpVGf81Xg8mk470Azd2Oe6KAsUU=;
        b=P9mdSwW+lZnDZEb82rjCJmLS5HjDWr5D5UmAXpr0WQouUecgWAv5U1ymXiHZwNevWx
         /QFRCHzgKchw39YKXCC0NSo5ckavuczv8JoJbw0lA4bgCJbrKAe4jWa7FgDqycL5sIwp
         kt1p2fW9rzXV1qq7uXpqH45VXmrBLMmnn3ygiSZW78HcD+OQ3MjpDokJsGi0i7p4TQ92
         CNfECY55Zz6p6fIoL8WwW2cyYhQ5BYA3OvxJK+8W/V7AnZKs96WrdWegRqlZA+0WddcD
         CJm2huykYLeFANyUnKCgASOC9pIsKKmrjL5vYj4WhU0G4lLRU8pxOJ/8VNc0OOaXX0Tl
         vKFQ==
X-Gm-Message-State: AOAM531kCbz1GvT+iGSnQGZDly8xPXWFMWoIoThQ3LgIVKvTci9Xkk7g
	eImRgaq6hv91WpXuUsF+MgULUoCSvcw=
X-Google-Smtp-Source: 
 ABdhPJyR+p04l2/2iLq85iHAMPRLa/5C5P5eKf6kV2OVAM7YAXy5NVOvSiHbJllwqCDI8wwEWzMuRQ==
X-Received: by 2002:a17:907:6d04:b0:6f5:a48:e063 with SMTP id
 sa4-20020a1709076d0400b006f50a48e063mr24219713ejc.302.1652871566847;
        Wed, 18 May 2022 03:59:26 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 qs24-20020a170906459800b006f3ef214da9sm861524ejc.15.2022.05.18.03.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 03:59:26 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 39/49] python3-hypothesis: upgrade 6.46.0 -> 6.46.4
Date: Wed, 18 May 2022 12:58:33 +0200
Message-Id: <20220518105843.3299331-39-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220518105843.3299331-1-alex@linutronix.de>
References: <20220518105843.3299331-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 10:59:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165836

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ython3-hypothesis_6.46.0.bb => python3-hypothesis_6.46.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.46.0.bb => python3-hypothesis_6.46.4.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb b/meta/recipes-devtools/python/python3-hypothesis_6.46.4.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.46.4.bb
index fb58297c27..86d6793670 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.46.4.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "349e4a94926c91377fa3806ff363c6b9b65f95bec67d146066a16610501bf067"
+SRC_URI[sha256sum] = "f5c24a3d3f8a0d8de2dd33079bf1580a3cfbfe74763187d47570fc9beea84c9b"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.30.2


