Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BDDDC5475B
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 03:23:46 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.3987.1709695417143852019
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Mar 2024 19:23:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PbjntRd3;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: festevam@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1db9cb6dcb5so19231445ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Mar 2024 19:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709695416; x=1710300216; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0D+B03o7DikROLcslbUnK6KhMBGsByoMEUBnM/9k7gM=;
        b=PbjntRd32XCr3eoHSqvArXdkp9Y1c7E2PObqMmOMARUwskU4bR3rrAUl8IHvQrp5XT
         /ddQZS0grZAs3pD/462n/75tCopgqInB051L38CJagAe3EIv09shaVdbU3NIOoV2eom9
         pmK7Yh/DXAsAG0imFgZEmhWmIbhKMoanHBX/nR6mEKGQec5A445z7/WqzWmihVWLHk6s
         o4YMBGSTOS7af4YEenJYwaAhGH620t66dopTsTKUSmPc69hRMKAb4OlwJTTUr0QucvQg
         HMThme2Pp6eDlMUS8RxcWDbvI9W67+jODrIJ53IJxq6qhz9gffqtXHZUHBXNdz1cLGX3
         5H6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709695416; x=1710300216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0D+B03o7DikROLcslbUnK6KhMBGsByoMEUBnM/9k7gM=;
        b=ngiT1tS6Alr3kQqv8aer3vmMiqhA2H6rpQq2G8tXcfHXSWsryK2Eqb0xVC9dO4R40j
         BZ//L7Hmz+fzvNux1CYajGajPx/yWHslDGBfCxBtPvCy/VTU2bWYKiQwqszLUDe+9hOX
         JjWY1rXNgqyBtGFGMvFYczlsaG/scAqvWYfic2Ccurn04E/NNCKvFjC3qNd/adm6B+X5
         ZNNTOZU7aWyIXSjcuIipcVWrmWtCeJwsECBgFfbTGcecdAT983nxJsSrwn0nBBIHqu1K
         wyUhThQuVQQHEcaQ1X+1wzhvLePciGqqG7o2cAGUewDfT99oj5BZewr2FDwfWuDQzp2I
         Ma0g==
X-Gm-Message-State: AOJu0YxBmlm9Fwsmf6mD9IrxFpEygvrtqCzVM0whSQLa21eO00q0644/
	Fg9rd+wDHjxkxVS7Yak3f1nJyWqYvUp9nYQNj3cUoqi66tbcAssk11IoWPp8
X-Google-Smtp-Source: AGHT+IE5k4+l9gSu4v5FPAIybKv9ZyCp6IZSqGiySM1lYM9Kwy2b4McBp4gRoCip5/s2r41ksMwkRQ==
X-Received: by 2002:a17:902:ea8a:b0:1dc:825e:42a with SMTP id x10-20020a170902ea8a00b001dc825e042amr2551311plb.3.1709695416143;
        Tue, 05 Mar 2024 19:23:36 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:3698:9a75:d5b6:44fb])
        by smtp.gmail.com with ESMTPSA id i3-20020a170902c94300b001dc95205b56sm11341144pla.53.2024.03.05.19.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 19:23:35 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>
Subject: [PATCH] mesa: update 24.0.1 -> 24.0.2
Date: Wed,  6 Mar 2024 00:23:31 -0300
Message-Id: <20240306032331.1158192-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 03:23:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196656

From: Fabio Estevam <festevam@denx.de>

Mesa 24.0.2 release notes:

https://lists.freedesktop.org/archives/mesa-announce/2024-February/000751.html

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 .../mesa/{mesa-gl_24.0.1.bb => mesa-gl_24.0.2.bb}               | 0
 meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
 meta/recipes-graphics/mesa/{mesa_24.0.1.bb => mesa_24.0.2.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_24.0.1.bb => mesa-gl_24.0.2.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_24.0.1.bb => mesa_24.0.2.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_24.0.1.bb b/meta/recipes-graphics/mesa/mesa-gl_24.0.2.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_24.0.1.bb
rename to meta/recipes-graphics/mesa/mesa-gl_24.0.2.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index e5fa0a76d2b8..12d7a18eb82a 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -22,7 +22,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch \
 "
 
-SRC_URI[sha256sum] = "f387192b08c471c545590dd12230a2a343244804b5fe866fec6aea02eab57613"
+SRC_URI[sha256sum] = "94e28a8edad06d8ed2b83eb53f253b9eb5aa62c3080f939702e1b3039b56c9e8"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_24.0.1.bb b/meta/recipes-graphics/mesa/mesa_24.0.2.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_24.0.1.bb
rename to meta/recipes-graphics/mesa/mesa_24.0.2.bb
-- 
2.34.1


