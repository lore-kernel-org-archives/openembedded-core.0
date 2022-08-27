Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32A59C0502F
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 18:26:34 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web08.51894.1661624773344796387
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:26:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=HDI6+MZU;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id l5so494682pjy.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=MGZZ2sqiscooN1uTkAvFe52Tj2mTW+dNQ4WZVPnT26w=;
        b=HDI6+MZUpyfMozwv82NKXy6lsjNHF/Is5dUaNeqfDaeITDPzElK4SFO02cmBw+i9/R
         ZYbiUpGHMvoHb+wUUuuzWQPnLvYRzdX//9Ae2qrcob10mLD2rm9nMLfZmwznDyNqRUoG
         VPv76AW+XiuX5Oiyj9qGo8SOsSYfkihW3VU9ddxHfVa7GByvBX5I6AQJny64hyIoDLcD
         wB64ZoLJn4qAalS1Ap3uuCshxe8xlWKFHPh0zVQAPhm7/9ysuJg/613zMpTwphpIQxjq
         tyArfNWhFhixfpm3V55YnDSJRyCOXb6WI7ObrNlk1PUPL4MO54nJutkpkVS4SPO6oj9p
         GLMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=MGZZ2sqiscooN1uTkAvFe52Tj2mTW+dNQ4WZVPnT26w=;
        b=U/akufWHqc50n5urikVLkKmuBXcVuHh7FXQ6o2dxE5Isz0bMMIZTKoE9vEfEKGCixM
         wGIRuu9IYX8asiwGE84kSRHVJMGl3KAiEJZy0sIY/AzxN9kXSl1WFco9Ss3Qr4I3l1NG
         RL33/cwx8ofkiT+odQte+D/cEYAyY+avEtyCsIhTLPKQzwqYJDvPJR+mOg+AQ0/BUFOM
         nU4hGJxQBX2vJd+ZO+rh3UiNyercbD9UCzjpx+8P9gvpcAeygR3cA9fNI7veAJ9exPYL
         MbPXLw4rcFBSujZhUdFyLi032xi5mj0RXA/GIJSyj7zjjRtE7XJNtuu/MnUjW5KJbi2E
         1iqQ==
X-Gm-Message-State: ACgBeo3cm6wlxeJZVZlrXiYu5NoET1jMUhKhEitNoOVWh0s5XTYCeE3T
	CqO4FlfQoGfqSTDA0FdPUot0gECjRo20JUiQ
X-Google-Smtp-Source: 
 AA6agR7KhI605xHi7q5lRjlXNuyjJoOHBFAHM1MDvwIkZXzt4T3ix2sHS/ulyJwk+7g84KT4kAfwBg==
X-Received: by 2002:a17:903:2d1:b0:171:3773:b95 with SMTP id
 s17-20020a17090302d100b0017137730b95mr8800577plk.173.1661624784846;
        Sat, 27 Aug 2022 11:26:24 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 r21-20020a170902ea5500b001708c4ebbaesm3864716plg.309.2022.08.27.11.26.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Aug 2022 11:26:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/24] libwebp: upgrade 1.2.3 -> 1.2.4
Date: Sat, 27 Aug 2022 08:25:34 -1000
Message-Id: 
 <e2f8758bd9a64dffc68482dda3a2b99a3fddc0d5.1661624569.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661624569.git.steve@sakoman.com>
References: <cover.1661624569.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Aug 2022 18:26:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169951

From: Alexander Kanavin <alex.kanavin@gmail.com>

- 8/4/2022: version 1.2.4
  This is a binary compatible release.
  * restore CMake libwebpmux target name for compatibility with 1.2.2 (#575)
  * fix lossless crunch mode encoding with WEBP_REDUCE_SIZE
    (chromium: #1345547, #1345595, #1345772, #1345804)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit efabd3d0d72220f17249abc13d2ca758bdd0141a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../webp/{libwebp_1.2.3.bb => libwebp_1.2.4.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/webp/{libwebp_1.2.3.bb => libwebp_1.2.4.bb} (95%)

diff --git a/meta/recipes-multimedia/webp/libwebp_1.2.3.bb b/meta/recipes-multimedia/webp/libwebp_1.2.4.bb
similarity index 95%
rename from meta/recipes-multimedia/webp/libwebp_1.2.3.bb
rename to meta/recipes-multimedia/webp/libwebp_1.2.4.bb
index 2d523df749..263589846a 100644
--- a/meta/recipes-multimedia/webp/libwebp_1.2.3.bb
+++ b/meta/recipes-multimedia/webp/libwebp_1.2.4.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6e8dee932c26f2dab503abf70c96d8bb \
                     file://PATENTS;md5=c6926d0cb07d296f886ab6e0cc5a85b7"
 
 SRC_URI = "http://downloads.webmproject.org/releases/webp/${BP}.tar.gz"
-SRC_URI[sha256sum] = "f5d7ab2390b06b8a934a4fc35784291b3885b557780d099bd32f09241f9d83f9"
+SRC_URI[sha256sum] = "7bf5a8a28cc69bcfa8cb214f2c3095703c6b73ac5fba4d5480c205331d9494df"
 
 UPSTREAM_CHECK_URI = "http://downloads.webmproject.org/releases/webp/index.html"
 
-- 
2.25.1


