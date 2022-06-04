Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDA9FCCA47C
	for <webhook@archiver.kernel.org>; Sat,  4 Jun 2022 10:26:49 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.8695.1654338399653704583
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jun 2022 03:26:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Lczv1KMC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id
 k36-20020a05600c1ca400b0039c2a3394caso3833314wms.2
        for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jun 2022 03:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=oKBwxI21/YPHFprfFf+jPNtIiZkS+X+m6mpI0oV+rUQ=;
        b=Lczv1KMCU4J04hP0OUbMqeLyD6pliJLsGkrR1D4Lp/WuK43gRZEWSZRFx9Yi4ncT9H
         HIFtPwUYoLrMuMwbbnQdn862djvGR+6Dcau4seX3ARzdd56dfBQBNeDYdiTtK0AvX0gX
         dQ3DD//8sFIugcNO9rG8GmGuZ9iWH7GAEDNsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oKBwxI21/YPHFprfFf+jPNtIiZkS+X+m6mpI0oV+rUQ=;
        b=qWt/8V5DfZOfGE5Sz6D5mK7BlatfQ+ccPUUvG6mBV2YbGkuZJUFL1qtenITh7ZEUSI
         yOXdTkt2N6OhzFLIa77y73OwXnvmDtEzRuDwMSRXz8YVYjbVlQkJWBpfvgaaz7D0dAb1
         /bx0xs0HSCdR4FGdk/h6Z48trCfnewgMNyRjZwDtKGO4vMjeMQ8mltSyp/o8zejJHZiP
         1ueF4+ia/f9mH587nBW4UVwLSNX+cX9Mv8de7Ea8cjyh3VnLuZQMMnfj0MUp6bbsuWYa
         AhYAHhkyBhJBZ3wCTask3oBwhoeunttzuxn0tLSJKS3lSAJsTAs+XHg9+NQczVZinQSG
         JJDQ==
X-Gm-Message-State: AOAM533SdkVEztBZlL5KM623KLGu500XNaNKd8Mn+wSKjXVc05R9u0VY
	epF+h/943z+UjC3B6m1gklnR7lRYsgLRp4Py
X-Google-Smtp-Source: 
 ABdhPJwJWl04/zn3ifBRxV7OmXQy6FyoqFVYcH4b3PDhQhbK1zF66uA51owuC2bcrNBYlJObW9IkaQ==
X-Received: by 2002:a05:600c:1d20:b0:397:5a8b:a30a with SMTP id
 l32-20020a05600c1d2000b003975a8ba30amr13004527wms.89.1654338397948;
        Sat, 04 Jun 2022 03:26:37 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9b17:e3e6:3e93:a118])
        by smtp.gmail.com with ESMTPSA id
 t15-20020a05600c198f00b003942a244f40sm16323151wmq.25.2022.06.04.03.26.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jun 2022 03:26:37 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 12/17] gtk+3: upgrade 3.24.33 -> 3.24.34
Date: Sat,  4 Jun 2022 11:26:20 +0100
Message-Id: <20220604102625.199845-12-richard.purdie@linuxfoundation.org>
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
 https://lists.openembedded.org/g/openembedded-core/message/166558

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-gnome/gtk+/{gtk+3_3.24.33.bb => gtk+3_3.24.34.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.24.33.bb => gtk+3_3.24.34.bb} (89%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb b/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb
similarity index 89%
rename from meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb
index fb9e29dd8cc..f862e143d48 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb
@@ -7,7 +7,7 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar
            file://0003-Add-disable-opengl-configure-option.patch \
            file://link_fribidi.patch \
            "
-SRC_URI[sha256sum] = "588b06522e25d1579e989b6f9d8a1bdbf2fe13cde01a04e904ff346a225e7801"
+SRC_URI[sha256sum] = "dbc69f90ddc821b8d1441f00374dc1da4323a2eafa9078e61edbe5eeefa852ec"
 
 S = "${WORKDIR}/gtk+-${PV}"
 
-- 
2.34.1


