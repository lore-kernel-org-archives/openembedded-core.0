Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FD62C433EF
	for <webhook@archiver.kernel.org>; Sun, 14 Nov 2021 20:27:25 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web08.13714.1636921644353086516
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Nov 2021 12:27:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Pdy6EVfQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.54,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id d5so26476182wrc.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Nov 2021 12:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ePcezsMpipBI1Y0YP+l0hUmzdcjx3BnU2lCxiT/ZYhg=;
        b=Pdy6EVfQJb46y5zE/7X6ZCEgPA4GT9zFeiPpV7mPq4wMj18gObeIL0v4bzr+b9Kzzf
         AyLGkrs+zcOo+wLydzemBTwIO9Xcozm8Pax2yXypWghQbm/hxxFpP2282sax3am8wCc6
         BuKFxNGKqBELNB8ypxnHdGgz+4me+flAqEQjIbjcJogjmIC2R1iq3qByyNFNzFUkpw/X
         aMIu67OacTbpysPiXpRux6qK158AKnzMVESm03356XV5QrkWYja7Kzdr+wH6KtaLH89I
         qxtaZlxDuKStyO8B0Ud1gPD+q64gitNaDi2zQa6ens5+INxKcAXiCAGuQ8m3QBtloOgG
         bGWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ePcezsMpipBI1Y0YP+l0hUmzdcjx3BnU2lCxiT/ZYhg=;
        b=lkT01bkgKugcW1y7mRQU1NFATe5rTLY6x9ayOOlOQ9tdxsS7wy3FVyZWHbBErsbhz8
         D+Dn8of0MSKOmdw899bG4pzSE6OJ8sSn5TeWmwgse2W1nIEvt8x903IQmCto1veXWwNo
         cqXmBOUCsknD3qjgbYZHAdKzUB/xRu8OeMaRgz+3IFnGoUwxqBQZdseLB3cb0YJ/rQcH
         Ui600qxz21Mmualy+wI3FXcH1zdCzhCU0iSP9PT1KwZvvWCyUIhit0Vl1x7pVhGLdWyL
         x4fe9G/W9Ij635nv7i84vO/gKdUi0+KpOpFwG7A5PH4EU0/uTpeoYYLqNx9SjMXEAn+s
         X0eg==
X-Gm-Message-State: AOAM5328KoMAxBzFu0q1Y4KaJVLA8Mhiy1Pj8w6NZoQhsAoeP1kk4Qhn
	gonBkDwDmf35i6p/Uts+Cdgrf0/+UJQ=
X-Google-Smtp-Source: 
 ABdhPJxu/jz3LptrEGTHbRaw0qjjNf1KTtq/LByjWmmEGsfRjGzZ/7GxinAoy6OS8q2ojfnkJZbgSg==
X-Received: by 2002:adf:f681:: with SMTP id v1mr39186554wrp.367.1636921642531;
        Sun, 14 Nov 2021 12:27:22 -0800 (PST)
Received: from localhost.localdomain (176.57.115.89.rev.vodafone.pt.
 [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 r15sm12733295wru.9.2021.11.14.12.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 12:27:21 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 1/5] spirv-headers: upgrade 1.5.4 -> 1.5.5
Date: Sun, 14 Nov 2021 20:26:44 +0000
Message-Id: <20211114202648.316923-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Nov 2021 20:27:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158267

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../spir/{spirv-headers_1.5.4.bb => spirv-headers_1.5.5.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/spir/{spirv-headers_1.5.4.bb => spirv-headers_1.5.5.bb} (92%)

diff --git a/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb b/meta/recipes-graphics/spir/spirv-headers_1.5.5.bb
similarity index 92%
rename from meta/recipes-graphics/spir/spirv-headers_1.5.4.bb
rename to meta/recipes-graphics/spir/spirv-headers_1.5.5.bb
index 6c978ce51a..101a2e2948 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.5.5.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://www.khronos.org/registry/spir-v"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c938b85bceb8fb26c1a807f28a52ae2d"
 
-SRCREV = "6cae8216a6ea19ff3f237af01e54378c1ff81fcd"
+SRCREV = "c8213b3c5a2cf3a0f5c4d1e7d7b8fc2ac9f4806d"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=master"
 UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
 S = "${WORKDIR}/git"
-- 
2.33.1


