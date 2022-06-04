Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAB14CCA47F
	for <webhook@archiver.kernel.org>; Sat,  4 Jun 2022 10:26:49 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.8696.1654338401323341527
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jun 2022 03:26:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZXGLh546;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id k19so13281646wrd.8
        for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jun 2022 03:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Jf2E5L+dBdBhQMYkj2/crI16c/IbR3seRr00cEFBoNo=;
        b=ZXGLh546GISfmhkz9RwyseMM5WwWWSQs3iCnkvxKzlJXA8wkuunrcSUiiMfxRxADTF
         9Zc4ijVEBIKnVbdzURBCwTBfekEL5iPOusFjjbmTqpAAIeXOJ6yAM5UF+sMnUR5e0dYy
         1Xa3p2hpLY7AxIRwkaA8d7syTtwxN5pJ3lNxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Jf2E5L+dBdBhQMYkj2/crI16c/IbR3seRr00cEFBoNo=;
        b=SB6imZx69M5dRWGhaa0qZT7ARD1hzsKpKiU5/I0jhscJay5/nlLYajanD5sCQDFYyR
         2HFyk+EBs7ewtgr9pUJnrJwC5RX83XgCi8MmoMM011Feg5qotE6lj9Lv+97ZgZ99V2d0
         +1wV8VgpQBwQFL/0JqkpnAvTovQo7xHyJ87eyI9+/oBNP3UIIZg0FW7xgYmpE3jkSScW
         pewBr/tZZhgc+QRa+z65rGVANTPW1OfKcLTr+p5tQjp1OjYeEEwCn0UoUaNocoXa3sWk
         dxFyqkEPHrmVvkgi74iD4/BQu16PSDuCkcXSNPTHDuc3PXQcQWhcUuM21e+bPPUdNGYi
         hGrw==
X-Gm-Message-State: AOAM5324pD1iHRAlJAhY36B1edIWncQHD8YnbDKfMVQYOrmgZ6UB/9tN
	jbmcYbSazJFHjKqynCykHoOyhoPq5+6wsFG1
X-Google-Smtp-Source: 
 ABdhPJxEXWjfwDNdwl4jBueDjkz0OJPmsm25ix8gTUraKbeGhQenub5yfQ9rCdBAt1ICShaR4Vphnw==
X-Received: by 2002:a5d:5272:0:b0:210:33b8:ac4a with SMTP id
 l18-20020a5d5272000000b0021033b8ac4amr12076333wrc.483.1654338399550;
        Sat, 04 Jun 2022 03:26:39 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9b17:e3e6:3e93:a118])
        by smtp.gmail.com with ESMTPSA id
 t15-20020a05600c198f00b003942a244f40sm16323151wmq.25.2022.06.04.03.26.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jun 2022 03:26:38 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 14/17] alsa-ucm-conf: upgrade 1.2.6.3 -> 1.2.7
Date: Sat,  4 Jun 2022 11:26:22 +0100
Message-Id: <20220604102625.199845-14-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220604102625.199845-1-richard.purdie@linuxfoundation.org>
References: <20220604102625.199845-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jun 2022 10:26:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166560

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../alsa/{alsa-ucm-conf_1.2.6.3.bb => alsa-ucm-conf_1.2.7.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/alsa/{alsa-ucm-conf_1.2.6.3.bb => alsa-ucm-conf_1.2.7.bb} (89%)

diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.6.3.bb b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.7.bb
similarity index 89%
rename from meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.6.3.bb
rename to meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.7.bb
index a493269063b..d60f22e7c7a 100644
--- a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.6.3.bb
+++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.7.bb
@@ -8,7 +8,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=20d74d74db9741697903372ad001d3b4"
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "b8a03aa387a624a2f65edc201bf777421190b60529a92087646823afbd96c5cd"
+SRC_URI[sha256sum] = "b97f2395ca2c1fd9bfab7627f0178f9069868e2a42a35894dacd280e7e40680e"
 # Something went wrong at upstream tarballing
 
 inherit allarch
-- 
2.34.1


