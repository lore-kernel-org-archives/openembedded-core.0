Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45AAFC4332F
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 18:28:23 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.2253.1643826501844198219
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DbiRCswC;
 spf=pass (domain: gmail.com, ip: 209.85.218.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id k25so253741ejp.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BqHYQ0jWM8X3ViRay+rswwkvvS4GvDO//z1sy/KdoUA=;
        b=DbiRCswCR6vsHa9O2EFZ8ExTuVsTp96of7zlN37ICxEvCkESz1PmQoL1dDS9q1Kslg
         zhHobZG+u+15mnYen4Uu359K2w8xa+TkXDe857lWtrXnBgbthVnyNWq6AeU2xMnSaFvi
         r1JWoBFPYspAic289wL+lMVEyKvS0gwcdTyzIoaBtlDLePYdpInm1wBQVckbt95tjKYL
         HrO/MCkVcbHsSWe2wSNlzxfwLv3OZvIn8dN4pqt9o4YgJkTMmfIIr9D0bj+1HeOq689J
         otoqjaWpbYtjkyDbnMv5pfoJthEQcfLHKQLAZLU3yPQVrQx8dyVRmdiyJsdwaigUa7tB
         Nh+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BqHYQ0jWM8X3ViRay+rswwkvvS4GvDO//z1sy/KdoUA=;
        b=wuo2V/EtDuvxZh8lCshZ2OKInH8RSj7g2rUkyDbZaTRAYrcJy3EH6nfO1aIUahZ2kB
         DW5uMt/LWB7FAdF1VIe6rOErPHIPQOJ+fcm/FvSHcQHQxVmaOvcANBIrTfD8dN5YXZ96
         x5wJYmylRBmitQXHdorQZTBSIRnXtptzu/ZiGDQr7OIeGLwWnXf3mgRfhN3jE2OUvCIl
         gPNIlgYqhedI+eRUVUpzQvc0g5P0qVtv8dslJ5/iPSou+JV3kVCYZN+3NnMXb/Aivjdy
         xyKkH1+E/PKCA8D6+IEj9Q5IgWSiL8NtUn92Wygyq0wlLGF713HBZSNV2y/YqZPpmZZs
         Cw4Q==
X-Gm-Message-State: AOAM533m3Ryie17WhfjG3JVTV7f83gMhVxe/TnRuuoOX2o0xPQGAXjpy
	9y6yBj+FNZZ42wFP+fx5MA19CfVk+ow=
X-Google-Smtp-Source: 
 ABdhPJzi7tuOVGqDjdkRL4TNicR1vH3F0BMwTWSZAJM9bC6R34tKK1bbxPEi0i/7xVUvr2O4GFH2TA==
X-Received: by 2002:a17:907:da3:: with SMTP id
 go35mr25924132ejc.456.1643826500442;
        Wed, 02 Feb 2022 10:28:20 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 i12sm15644203ejy.43.2022.02.02.10.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 10:28:19 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 20/33] python3-hypothesis: upgrade 6.36.0 -> 6.36.1
Date: Wed,  2 Feb 2022 19:27:45 +0100
Message-Id: <20220202182758.919991-20-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220202182758.919991-1-alex@linutronix.de>
References: <20220202182758.919991-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 18:28:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161245

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ython3-hypothesis_6.36.0.bb => python3-hypothesis_6.36.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.36.0.bb => python3-hypothesis_6.36.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.36.0.bb b/meta/recipes-devtools/python/python3-hypothesis_6.36.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.36.0.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.36.1.bb
index 3918d7d15c..24def74905 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.36.0.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.36.1.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "2b9c56faa067d660f0802679689f825bf142eec8261ab9e2e6ea916b1d8278a1"
+SRC_URI[sha256sum] = "46cbee9d7aed822149af75ec63d5f86cd1042df69b2e8eae17b26a56a4dda781"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.20.1


