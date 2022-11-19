Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A532C4332F
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 21:15:29 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.30641.1668892526757522533
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 13:15:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=bfYUkdHk;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id w4-20020a17090ac98400b002186f5d7a4cso7676275pjt.0
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 13:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BxDz8tD+W2rGnKgi9xbTQQHv0HzkCj/yex/X+/9QsUE=;
        b=bfYUkdHkAPRB2rnsvr0zU5rDqj6lmco+KKVCy7tknVWVOGUdmpuT7nLK/Ya9JDtqVV
         cyd+yc9xRQtin8kliKprnH9K3jtyTpRFTiYXg0PXMbehbo6bv/SI8Cihz0yyTpF0/hKE
         CQ/lfhUSThcaQk9btGv8fSfonHNHlxAnQ9m2PaJzL7+zaSrJHCOVUeJsdxV1Twu7qDwl
         iWDZAF0Ebdmutk/op/xJS6TxpOKixZzppOBFPUNYpFRRAn/bT9x4SPEH/TONrBhUdWUh
         ymzLrvVpk2cLfus07IboOPbk2DC0Ofw2FehuZ2jnt+wAakaZg2VIkBMqpNxRRF+Cg7fz
         3fhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BxDz8tD+W2rGnKgi9xbTQQHv0HzkCj/yex/X+/9QsUE=;
        b=I7t4xPuKIfpi2CTDdxzT9ew0zdcYfFcucAoAnXuMPmwZN1RphYytdGIYaa1oEYkDS6
         EhSaTGKfbo8/DXv+ICj5ka99pTnRbBQEka9aJN5VZtpadqWKIR3z2oFhkUah8xy770kz
         i7938bZwnN2/wcKNmtusjwzuTi+ByMLTGfRX++r3RLVM9fKaXZRFNrjqVXB3f//2KQUQ
         ByxMay0KXFwraufGm73lLQu2/tMjOQtN/VPN2gIq81ITN2ylEQlKRlQHSBd+zOiZbi4B
         DKXhQwCUy+e6dgkdIM2bfhCsvX2qr2EKAox3uzv0ycwipSX60Tl6zN/fAkHAVw5Q8s8V
         mMPQ==
X-Gm-Message-State: ANoB5pmiHV5yPUkrad09mSre5GWabuuI+GncGA8jCQrkUhZDutzMDie5
	24zvwWv8OzZGqiLRrKSvc5fZPwJ1tSk7EGXqYzI=
X-Google-Smtp-Source: AA0mqf4UOpZgfoepOkp2sUQZcm5xEEdr9QON4cnfhQ5OQTnPZt/mg8KPRzcURvwoJcJAPYwyZsPgiw==
X-Received: by 2002:a17:902:6943:b0:188:ab16:2393 with SMTP id k3-20020a170902694300b00188ab162393mr5297748plt.87.1668892525830;
        Sat, 19 Nov 2022 13:15:25 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s16-20020a170902a51000b001869f2120a5sm6197735plq.34.2022.11.19.13.15.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 13:15:25 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 02/35] go: submit patch upstream
Date: Sat, 19 Nov 2022 11:14:41 -1000
Message-Id: <e917306e0d45cff7c840e2954c95a495b1bfb38f.1668892398.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668892398.git.steve@sakoman.com>
References: <cover.1668892398.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 21:15:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173542

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 40d24b0b5c7a405bf9fd7ec7fa57ec61a6af3d01)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go/filter-build-paths.patch | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/go/go/filter-build-paths.patch b/meta/recipes-devtools/go/go/filter-build-paths.patch
index a1aa37c2a4..280f911a21 100644
--- a/meta/recipes-devtools/go/go/filter-build-paths.patch
+++ b/meta/recipes-devtools/go/go/filter-build-paths.patch
@@ -8,7 +8,8 @@ embedded in the go binary so that builds are reproducible regardless of build
 location. This codepath is hit for statically linked go binaries such as those
 on mips/ppc.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/golang/go/pull/56410]
+
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
 ---
-- 
2.25.1


