Return-Path: <otavio.salvador@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F909C433F5
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 16:19:25 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web09.30339.1641226764510853364
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 08:19:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id fo11so31381873qvb.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 08:19:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=rESzoUzLlB94TuWXPWXDJ0BF9QLbQIiipPtRKGGYSig=;
        b=DphOspyl7BFhNYcFacLsvho4Lj8PPnI09daPf/L0BOByXK+zR7q8F2tVzyOx+49vXm
         3l8U11O1yInaVodYLdGwsqNDPSDcRhGPh6y3Z2YFIv4KOI4fQQDgE00VuwfAdOkypEaP
         C0REYkYlkRXT8IPt9nv6z8iKv/tTypXaqDRRUKxW24zEVDf7Nat3OUiJ7886gE6jB8Y4
         OTs9SCUeXv5sSods6fP9sn6di2cvM4GzswS+tOUifnSYzzp6vUcq/GtcLs5zDxEZTbjy
         +rrjRe6iypkUiTjyLa/Gf2lG2ptXyqFOOegb5TUP3mmcnl0QwAk8KzE3S1wnbxxurBu7
         86JQ==
X-Gm-Message-State: AOAM5320c55zjagghccvnvt5OgExMAZ83kpbmrJAE/FLq+mSzg+U3RSV
	kayu3HEG6DTRwTbwbnBwjZuG5MXuJ9ah4wGD
X-Google-Smtp-Source: 
 ABdhPJy0nc9jdxcVThuqlWBOxAAI5/ZOnV7IWLannHwrsKXS1M7+V6x4l0mzaBVyTZQTkTveCYOgbA==
X-Received: by 2002:a05:6214:1bc6:: with SMTP id
 m6mr41824815qvc.30.1641226763520;
        Mon, 03 Jan 2022 08:19:23 -0800 (PST)
Received: from localhost (201-34-65-230.user3p.brasiltelecom.net.br.
 [201.34.65.230])
        by smtp.gmail.com with ESMTPSA id
 x1sm28826143qtj.9.2022.01.03.08.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 08:19:23 -0800 (PST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 06/24] expat: upgrade 2.4.1 -> 2.4.2
Date: Mon,  3 Jan 2022 13:18:36 -0300
Message-Id: <20220103161854.301148-6-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220103161854.301148-1-otavio@ossystems.com.br>
References: <20220103161854.301148-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jan 2022 16:19:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160123

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-core/expat/{expat_2.4.1.bb => expat_2.4.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/expat/{expat_2.4.1.bb => expat_2.4.2.bb} (91%)

diff --git a/meta/recipes-core/expat/expat_2.4.1.bb b/meta/recipes-core/expat/expat_2.4.2.bb
similarity index 91%
rename from meta/recipes-core/expat/expat_2.4.1.bb
rename to meta/recipes-core/expat/expat_2.4.2.bb
index 14e5aca9e6..771f14eb3e 100644
--- a/meta/recipes-core/expat/expat_2.4.1.bb
+++ b/meta/recipes-core/expat/expat_2.4.2.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://github.com/libexpat/libexpat/releases/download/R_${VERSION_TA
 
 UPSTREAM_CHECK_URI = "https://github.com/libexpat/libexpat/releases/"
 
-SRC_URI[sha256sum] = "2f9b6a580b94577b150a7d5617ad4643a4301a6616ff459307df3e225bcfbf40"
+SRC_URI[sha256sum] = "e40737134bdc08b8ea7d23a2c0a5cd11c04d5be152fe562d3253c1e4a0be6686"
 
 EXTRA_OECMAKE:class-native += "-DEXPAT_BUILD_DOCS=OFF"
 
-- 
2.34.0


