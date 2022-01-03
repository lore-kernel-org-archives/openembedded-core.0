Return-Path: <otavio.salvador@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6F4FC433EF
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 16:19:55 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web08.30363.1641226795462322911
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 08:19:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id q3so31414097qvc.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 08:19:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=tH+b2PkDiG9VQjnUAEV64R1KM+Ov+FnoszVkRjQSvCo=;
        b=4xBzWFt1H1Vm1ZXkDyjFm2XJqgDsXkA0VXSoL+Td0arTS/IWQjzUKSzQjY5oFrHojS
         Ywito+nPm3sClHipmVGZlToqgBKUWfxHiZzWK8CV0hYwWhV9CV8pqXnl3wlyGFTZIJcB
         sgCxwR7zMGugsGxLLfKWEAEtGDWZAoH480iq6U6gA/8TvhgB5jTLbvILVgAV0pXfqDXB
         q0GppH4YuQ6vO+qP5mKhbsK2rk47tmk9OWXBzbLMfiuNfKGOgWoiYWGdwHIjcCMemQva
         bTVpuJm67+dSeWqdaHwq4I0ikMqAEC39RwnD454VWXC6kTpmmGmn15XzSYUak1rHlpoV
         2CZg==
X-Gm-Message-State: AOAM532/cgB9wf0AEr/vTELXpDASKncDRYLIWv92Em4pDw7pq6H6Worc
	ewBSEDxAHqAN7reTDaxwibImk9kf4gw3+JCd
X-Google-Smtp-Source: 
 ABdhPJy/PnBVhaYg2E+lathvajqle0EbWTbZyqhxB1khsRh2lJK16v+PRDdcmWbmAZd1ECxEq25O6g==
X-Received: by 2002:a05:6214:1349:: with SMTP id
 b9mr42441734qvw.124.1641226794388;
        Mon, 03 Jan 2022 08:19:54 -0800 (PST)
Received: from localhost (201-34-65-230.user3p.brasiltelecom.net.br.
 [201.34.65.230])
        by smtp.gmail.com with ESMTPSA id
 f21sm29749396qte.52.2022.01.03.08.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 08:19:54 -0800 (PST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 16/24] python3-hypothesis: upgrade 6.31.4 -> 6.34.1
Date: Mon,  3 Jan 2022 13:18:46 -0300
Message-Id: <20220103161854.301148-16-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220103161854.301148-1-otavio@ossystems.com.br>
References: <20220103161854.301148-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jan 2022 16:19:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160133

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 ...ython3-hypothesis_6.31.4.bb => python3-hypothesis_6.34.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.31.4.bb => python3-hypothesis_6.34.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.31.4.bb b/meta/recipes-devtools/python/python3-hypothesis_6.34.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.31.4.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.34.1.bb
index 6af290d8ca..eebca57631 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.31.4.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.34.1.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "7fa3911d7be699a3139dfa1d9625deed649f651beaab3422c0339742e66d32d0"
+SRC_URI[sha256sum] = "5002ce1f27fd94b53b0046ac7d20dab17fd74ebc6c90d401979588eadc46f84e"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.34.0


