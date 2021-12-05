Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B778C433F5
	for <webhook@archiver.kernel.org>; Sun,  5 Dec 2021 23:45:38 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web09.44374.1638747937579261549
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Dec 2021 15:45:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HCQR3wpZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id
 m25-20020a7bcb99000000b0033aa12cdd33so7274141wmi.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Dec 2021 15:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=n/KVfs00sx5W8EB+goW9+V8u+V3b+WABUgL19vOMOe8=;
        b=HCQR3wpZFE63RUZa9UP99LmFmd0L27pPjsGFhwwOHJAy13ajqMdK1PuYzoURsi8AYy
         Bo9lJao2iEhCnb1vPRNh95IVQlg2ERWudCcR3saA+ZlEgj4YHX1dms+NiXBMa0iffkl5
         ztgIJs9wbiEr/hb9u+rx6/Zx3pGzKWSZTp8W4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n/KVfs00sx5W8EB+goW9+V8u+V3b+WABUgL19vOMOe8=;
        b=7pyz9vnCgNOz+HPQGi5FNSL83e1ob77N5TNTOdqHVyPyfWXPlt4JMc+Fk9MX2hMUkx
         TdKpO9G0+IbOQ+35ApePAK+jfQ3CJlpl0nYTQDV3M99pUX+GT44+kiGouBhmi1oMxPNH
         OmGl49eGbzdMVukQ6wgolofv6S6AhoGoFi1+R3NIdtRlCo6PeJrjTOgfuUOutQ0uxMCg
         HXIm8EYS8yOUaGA9IvMy/srvJNYh1QrUYxtfLNnFnoh8YMNS41TRJV71SM0/XfT8K5rI
         2bnJQJbttF22m91yq5FVXmW8qY1KGxKxkqzAuSSFWq7po4E4ZAO1t6Nf8Clixhgjoym4
         6MvA==
X-Gm-Message-State: AOAM532TOYoe+VoraMSfMLwqQ0oXzIkXGPGMTh4YcP8HSvJcUWWohGLr
	IjC5jjiy/EaGfxY5NOEItwEiYdzIURUNFw==
X-Google-Smtp-Source: 
 ABdhPJzl0c9H28DEksDWEcA1zPhQQDZICyiJ1CyruKis4QalRv/FBAdd3cqoZd1IGMuZWi/JEQCA3w==
X-Received: by 2002:a05:600c:19cc:: with SMTP id
 u12mr34496777wmq.24.1638747935725;
        Sun, 05 Dec 2021 15:45:35 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:50e7:dab5:2141:24aa])
        by smtp.gmail.com with ESMTPSA id
 b15sm11984071wri.62.2021.12.05.15.45.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 15:45:35 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] patchelf: Upgrade 0.14.1 -> 0.14.2
Date: Sun,  5 Dec 2021 23:45:32 +0000
Message-Id: <20211205234534.480206-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211205234534.480206-1-richard.purdie@linuxfoundation.org>
References: <20211205234534.480206-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Dec 2021 23:45:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159203

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../patchelf/{patchelf_0.14.1.bb => patchelf_0.14.2.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/patchelf/{patchelf_0.14.1.bb => patchelf_0.14.2.bb} (91%)

diff --git a/meta/recipes-devtools/patchelf/patchelf_0.14.1.bb b/meta/recipes-devtools/patchelf/patchelf_0.14.2.bb
similarity index 91%
rename from meta/recipes-devtools/patchelf/patchelf_0.14.1.bb
rename to meta/recipes-devtools/patchelf/patchelf_0.14.2.bb
index 2b63fbfbc3f..2cd51298435 100644
--- a/meta/recipes-devtools/patchelf/patchelf_0.14.1.bb
+++ b/meta/recipes-devtools/patchelf/patchelf_0.14.2.bb
@@ -7,7 +7,7 @@ LICENSE = "GPLv3"
 SRC_URI = "git://github.com/NixOS/patchelf;protocol=https;branch=master \
            file://handle-read-only-files.patch \
            "
-SRCREV = "8f7b4a7a3648970fe55824cfee2afd3808626a3f"
+SRCREV = "2ac5798fdc79762ceee520b2b3b4758f7f97b17e"
 
 S = "${WORKDIR}/git"
 
-- 
2.32.0


