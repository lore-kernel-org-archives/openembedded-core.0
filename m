Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4447FCCA480
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 08:45:35 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.51640.1658306692472670656
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mefU7F7Q;
 spf=pass (domain: gmail.com, ip: 209.85.218.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id os14so31836117ejb.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yddJIaeTkJheKDQTUQUoS/enTo4WzwZ/08i83dXtIGE=;
        b=mefU7F7QELHcDdaLCVMnIg7ynYaSlrG8CASaTPMl8QnzXPDMItm14il6p4lrZDHNuW
         3vNLywN1zrdPwk+vLp1VZ/L8h7JFlRlPvhqmeD/32yrYWQe+FgxOSsTfReebMPVwyfI5
         yOzcRNCdtzJyurkqocWzu5r7ql+Xzq1oajbch7/iUv+YBLIm6vwVxn8wLtC5/+KJn3rz
         vmdST3/JCQfiF/oI635jOgzBuElMONlaFFHsjPN0JD2XSRdmtzZpnUUUq1W9VOITLNFQ
         USKQVDo3LcEl9Iw7TQZirextz3yPSLk6MIF0Zy22AUT9kN79YwBINPl/gZfqIje0hywh
         wuFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yddJIaeTkJheKDQTUQUoS/enTo4WzwZ/08i83dXtIGE=;
        b=irrxBO+SQsMgK7TxTjcARCeVqcJbf+07D6ZN4dlFp44Wifszc5xEcS2si0JOLCKszr
         1Zu/Uw6oi2kjYLBMRl3kb43A+NcRyjXGel1jLgoN1pst2zhdnW82jNtxkx0HNCZzDaV7
         BI5JRPit4yV+ZF0G5EA/VniwOWwcvW/MHbl8yfbj8I/0rkh2gVMBlsfLcQ/8n7GMwkmv
         2X1K5dtXirdky/4Ssp+8ShK+7mKTspS0HWcQdV6e8uUODTWN+cr4sqtsnW7iZnWjwQ1O
         7JXB5Ph0+HEVlpVVbYP4x+biagL8PgQbftNQseggFcBXtCgaqmJLIDyEbiWj6yFyoQNw
         UsKg==
X-Gm-Message-State: AJIora8NNEzWePhvBVL3ziZhnmE487vaC48P3ZxTAJh09n0ujGi+wABh
	SOiDrbuucRa5G/AH4nbY4lBfpQErKes=
X-Google-Smtp-Source: 
 AGRyM1toQMzf6johaXaI7kBKm60DoIa7pcAuHl8Y1XYhDcS1Ug5UA/qh6up569m+lyyTzGoZ6ecvog==
X-Received: by 2002:a17:907:a05b:b0:72b:33f9:f927 with SMTP id
 gz27-20020a170907a05b00b0072b33f9f927mr34611397ejc.707.1658306730330;
        Wed, 20 Jul 2022 01:45:30 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 s9-20020a170906a18900b00722e5b234basm7781784ejy.179.2022.07.20.01.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 01:45:29 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 41/51] python3-hypothesis: upgrade 6.48.2 -> 6.50.1
Date: Wed, 20 Jul 2022 10:44:32 +0200
Message-Id: <20220720084442.2940187-41-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220720084442.2940187-1-alex@linutronix.de>
References: <20220720084442.2940187-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 08:45:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168335

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ython3-hypothesis_6.48.2.bb => python3-hypothesis_6.50.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.48.2.bb => python3-hypothesis_6.50.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.48.2.bb b/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.48.2.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb
index 9e74e2c1cd..0c93c12493 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.48.2.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "ef548f10438095678af7fcfa369b882390355a6329db73174a65749b677677ec"
+SRC_URI[sha256sum] = "1a19ade3b27825cab622c95fcf25182a27a42f97589c163173fcbdafb8621d1e"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.30.2


