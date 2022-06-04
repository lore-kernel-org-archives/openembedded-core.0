Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF6E4CCA482
	for <webhook@archiver.kernel.org>; Sat,  4 Jun 2022 10:26:39 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web12.8741.1654338392965262361
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jun 2022 03:26:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BEib0em8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id r129so5184537wmr.3
        for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jun 2022 03:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=dmNFdujulQXUzH8lIFCtc0a01oYVNXLeQwt/JVeCYTg=;
        b=BEib0em8ywDppcheWV/crT5DSzcznQkAcVNQ4jvtBmwf2eWs3btsMv58xctlLoAQRC
         tL9eo9JMZpzQEmpdIV6/hXWTbE4Omlb+JOLoh684/yNKTyIHUL9d+ei5W46jOLM1OUAj
         K9bz4lqRkxcbOguCZw9DZDdECX/NX95Iav9Vw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dmNFdujulQXUzH8lIFCtc0a01oYVNXLeQwt/JVeCYTg=;
        b=32oDpcSOoWu7yC4huodgBAcSGXz7stb9hbPjrUHNuDQW99JstBvJw3DQMsxS6Wq8da
         tIeHmRckCL6zXoBKCZKkoRevTtQJ/Z9Kk/cjKD/tjnd0Fu+ROLakL4AJQqNyFFEtjk0Q
         3fop+f+WrChTQ7XpYWkBrr0FB+e9SAxIVYw56KpkO/AkQCeHXgdqU8+c8OKIEB0hq2gY
         Cci37QaUd/dz+CU6twEBfRMgisJZxGTu8oTgCPRR5mTrZ8st6toYXBlUaKRnOpcZW8r2
         7kU4vSx9th6BG9JzDi8ogCyVkVYNhDvwzX07QL1U2TqAt2IiJXvOaaDQ2jZa4oUVL688
         GjEA==
X-Gm-Message-State: AOAM5338eYoGnu7g/3pEKrX5PQnT5qmOhMr8fTOvr8uOEuf/3C1ZA7Bd
	UbLM5r0yfbEVoWgf8SiW71evaRS/RnDoCuAV
X-Google-Smtp-Source: 
 ABdhPJzcd0y0Gq5MFCjCQY1uCZb6VqowqHcNwQXr1591/m307LMpHaWw93JC24S6mpS6fz+aMV1Zgg==
X-Received: by 2002:a1c:29c3:0:b0:350:9797:b38f with SMTP id
 p186-20020a1c29c3000000b003509797b38fmr42539610wmp.22.1654338391219;
        Sat, 04 Jun 2022 03:26:31 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9b17:e3e6:3e93:a118])
        by smtp.gmail.com with ESMTPSA id
 t15-20020a05600c198f00b003942a244f40sm16323151wmq.25.2022.06.04.03.26.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jun 2022 03:26:30 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/17] python3-pip: upgrade 22.1.1 -> 22.1.2
Date: Sat,  4 Jun 2022 11:26:13 +0100
Message-Id: <20220604102625.199845-5-richard.purdie@linuxfoundation.org>
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
 https://lists.openembedded.org/g/openembedded-core/message/166551

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/{python3-pip_22.1.1.bb => python3-pip_22.1.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pip_22.1.1.bb => python3-pip_22.1.2.bb} (97%)

diff --git a/meta/recipes-devtools/python/python3-pip_22.1.1.bb b/meta/recipes-devtools/python/python3-pip_22.1.2.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3-pip_22.1.1.bb
rename to meta/recipes-devtools/python/python3-pip_22.1.2.bb
index ad239e952a5..0573db603d1 100644
--- a/meta/recipes-devtools/python/python3-pip_22.1.1.bb
+++ b/meta/recipes-devtools/python/python3-pip_22.1.2.bb
@@ -37,7 +37,7 @@ SRC_URI += "file://0001-change-shebang-to-python3.patch"
 SRC_URI += "file://no_shebang_mangling.patch"
 SRC_URI += "file://reproducible.patch"
 
-SRC_URI[sha256sum] = "8dfb15d8a1c3d3085a4cbe11f29e19527dfaf2ba99354326fd62cec013eaee81"
+SRC_URI[sha256sum] = "6d55b27e10f506312894a87ccc59f280136bad9061719fac9101bdad5a6bce69"
 
 do_install:append() {
     rm -f ${D}/${bindir}/pip
-- 
2.34.1


