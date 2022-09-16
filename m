Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 065D4C6FA90
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 21:08:45 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web12.896.1663362508609705737
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 14:08:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=W/HeK0mR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id n10so7349362wrw.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 14:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=oCd0WnjHYqWH/Rm5v0suLFr1vYTwtxnJtZi09Ip3n5w=;
        b=W/HeK0mRrmar3KGS1giCmXCjKTSjzLJXml3lUpsn+C9zTpABthXDgA/xvMef2wnv8H
         S2lk+ANI9roNMacFO7CsMTCpPS8uE3w0PJ2kBMGM5wt1aEA7FREYZcM817ghgN+iYizg
         fnQGdlOwaE/gTYoO62e/C4x/v7Ar33th4xN/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=oCd0WnjHYqWH/Rm5v0suLFr1vYTwtxnJtZi09Ip3n5w=;
        b=WrwnthUsm8ZlVPQyVG/cLUHt+A+yeqt2bdCKx1H0E9qSHYe9hPVhcPx+KRlyOSQOEb
         uYi5JcTMEBpA/Cke84F2BKTf4OsGPkglKi/xIdzVaCN75jqcKQbuay650FUNy4l8jRLI
         /j47aIdYX4TveXX5G8TnrJOwqb3o6FlH2ubSeGgbYNoleyuJv4usfpZoYGlNMlwIbBax
         tPK7QlMqZFGKcPWQEQPOY6TNDlWNG1qM3btGsO/ZhS+BxBHjprjIMD+bdrkW7iJVZtmq
         YUCnNJBaaz5ohbu8k/7mAIbbkZBR0IXHtjJ7YoyZy2D1bodtewDrYc1mKXfHkIJwtCub
         EvTA==
X-Gm-Message-State: ACrzQf1PN/5E+Up+pnXAqUARHZsmkdLcgxPhh/BG9vBnVemKc5qpfq7r
	DCpsRbpQDH2AZvt3QQKWZDiR5FiYI2D79w==
X-Google-Smtp-Source: 
 AMsMyM6qjzT6aZ/3U91tefDSC4ZGpCu9hujpW6V8eht4K0am5FJSg3ncTBQE7Q1i5Ug1FCjzwm0A/A==
X-Received: by 2002:adf:eb89:0:b0:22a:c7fc:27c8 with SMTP id
 t9-20020adfeb89000000b0022ac7fc27c8mr4094065wrn.397.1663362516905;
        Fri, 16 Sep 2022 14:08:36 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2f11:4b9d:cda7:29e6])
        by smtp.gmail.com with ESMTPSA id
 j16-20020a05600c191000b003a8434530bbsm3411533wmq.13.2022.09.16.14.08.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 14:08:36 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 15/24] python3-hypothesis: upgrade 6.46.11 -> 6.54.5
Date: Fri, 16 Sep 2022 22:08:09 +0100
Message-Id: <20220916210818.1228761-15-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220916210818.1228761-1-richard.purdie@linuxfoundation.org>
References: <20220916210818.1228761-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Sep 2022 21:08:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170813

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...thon3-hypothesis_6.46.11.bb => python3-hypothesis_6.54.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.46.11.bb => python3-hypothesis_6.54.5.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb b/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb
index 1d9772d4ff0..9adb614493e 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "f5c1cf61b24b094355577a6b8fbbb8eb54c1b0216fbc0519af97c46bddf43c42"
+SRC_URI[sha256sum] = "8a9056825695f415bfad4e808ae719fc01383a9ab659775319724365afcc7ec7"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.34.1


