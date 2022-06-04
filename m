Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC05AC3F2D4
	for <webhook@archiver.kernel.org>; Sat,  4 Jun 2022 10:26:39 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.8694.1654338395348315824
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jun 2022 03:26:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Cqtq3RMS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id x17so13298560wrg.6
        for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jun 2022 03:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=YoLbpR634SP3RDLOftx79ijkK4oddOY9bjuRNQR9IEY=;
        b=Cqtq3RMSi0ig05OQCM5cAoujUXj/KS0kqfWn/IjS5UXZB2s3vNcDydTVbmi77MKcGn
         ffeQlk3PlKWX1KT7gBuo6xjcqe5TDv86d78Os7uN0OkNPy58Mu7iGVyxo05wWP8EW19K
         fc8UsDoD+fz+HBEEmGMbAJMe8A87yl4mz7870=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YoLbpR634SP3RDLOftx79ijkK4oddOY9bjuRNQR9IEY=;
        b=Xv5Z1DGKq89JVXBltepsB98ptgOjXLRzaNBBEoXTx5DbccGxw8AghnXccI3cHQUETr
         TtumfBEGOwEx8bQBTkJINtasi5ya0/ZcB5MKxAianfYbtit0BZzpKaV/vfuawLwJ60se
         WVq+Uov7wmIDY3kqZfivKwV4E0Ut0naIJBfXRnFSjGptqBimxr8ju90VHlu5uDE5GAgm
         xyCfy0RA3tINxaa3ajtUVMMxX9j8tpC9ZnIZCoVbd0UWu1WgrjqppxSExLENUMVdaVn1
         3A27b1vnv5UNSh0zom6RtYnl59KI81qfBHdQEyGIylZar107aSAu3IYTotXiQhrpnZQ9
         J4ZQ==
X-Gm-Message-State: AOAM532F6F+O4TyIH1FlxI1Ca3zm50RaFMRaoxJeqRxzEnMpdy2NDiJ0
	4ZgOgGM1eC9sl2d3PYjOWS0Gm+C2BK+aKkP2
X-Google-Smtp-Source: 
 ABdhPJxTZFWHpNObYElb3YfyQx9QFR+Bputg6OIxFgejRNGGc13SnFTyiywe1kGnQ3+HLPfqdEoY2Q==
X-Received: by 2002:a05:6000:15c3:b0:216:79fe:a09f with SMTP id
 y3-20020a05600015c300b0021679fea09fmr1645058wry.208.1654338393618;
        Sat, 04 Jun 2022 03:26:33 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9b17:e3e6:3e93:a118])
        by smtp.gmail.com with ESMTPSA id
 t15-20020a05600c198f00b003942a244f40sm16323151wmq.25.2022.06.04.03.26.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jun 2022 03:26:33 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/17] libxkbcommon: upgrade 1.4.0 -> 1.4.1
Date: Sat,  4 Jun 2022 11:26:16 +0100
Message-Id: <20220604102625.199845-8-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220604102625.199845-1-richard.purdie@linuxfoundation.org>
References: <20220604102625.199845-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jun 2022 10:26:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166554

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../xorg-lib/{libxkbcommon_1.4.0.bb => libxkbcommon_1.4.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_1.4.0.bb => libxkbcommon_1.4.1.bb} (94%)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb
similarity index 94%
rename from meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb
rename to meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb
index 34652e9c4ec..89093e6786b 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb
@@ -9,7 +9,7 @@ DEPENDS = "flex-native bison-native"
 
 SRC_URI = "http://xkbcommon.org/download/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "106cec5263f9100a7e79b5f7220f889bc78e7d7ffc55d2b6fdb1efefb8024031"
+SRC_URI[sha256sum] = "943c07a1e2198026d8102b17270a1f406e4d3d6bbc4ae105b9e1b82d7d136b39"
 
 UPSTREAM_CHECK_URI = "http://xkbcommon.org/"
 
-- 
2.34.1


