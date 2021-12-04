Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18063C433F5
	for <webhook@archiver.kernel.org>; Sat,  4 Dec 2021 07:13:40 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.22669.1638602019563850858
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 23:13:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BblDR1m9;
 spf=pass (domain: gmail.com, ip: 209.85.221.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id a18so10563582wrn.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 23:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U43LksQTGUB3gGhqjnjbjueGqPK70m10EgovynhaQdk=;
        b=BblDR1m9b8ZNRFRy8ae3Z5/Zlch7XyKVFquXA9o9YV2wG2w/RinuMP5MDpE8YWP0H2
         kACO/b4x651DBbywqTs32+G+04au6b9dnHoGLkgb2nOSsweQDvGmlGUxChpPkDC5LLff
         rnEujgE3yLHNLQ6A/p0Pt5+H+HbKOpSSB12cL8tj3r6qocLlUHOkWBaTGj+tTvwkPdix
         wtJJwEXWbWNWyPuC/xgnLwFyYJ65jN2Yxw2dWrZ1uyZEwhl6ftzm/zjHGBVzI5eldvXH
         5bFrxAYaW1iuo7pN8VV5bGk0H9Fay7g1UUP1nwcvRd7B8tAhlei+e0xCEpXKPKjdvMEF
         87IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U43LksQTGUB3gGhqjnjbjueGqPK70m10EgovynhaQdk=;
        b=HwZuIqVT4GOZQDB2BqdLhBlDREHQyKMWZmyLdS1fitXisp3un6rVP3Mj1SItVkc5nJ
         2tSRhNSjpNe9kPvVtB5INxtBC9MyWnOQ5blJDvyf2D5gNF99DhJj+jjVHmWO7WAXXSfW
         /b6Kreg4nXhmfGH74HIXCxTQuX3+5JHus2VDf4KTTbCXIpp8/OyZ7BAN6Oa7IE4MeCU8
         BFuisM9H/39cFK17Ww4uIklvClDSsTQsZ24n0PdDo2wqAOzvaF+sjopnSjjjtoDCPTvL
         sB0/ERaQVkD3LtQ+ce9Z245Yjhr1Lei4P1hPFTX/qkvnT1GlYEcqqsS729RSRgOAixVd
         wSkw==
X-Gm-Message-State: AOAM532hZYh/BBvkp/TJVA0shEvNycSP3dPO666wawj/AukACSVQkSRm
	rC/GlCiGEJJLCGkAozCWFjCwxUxuRs+kOg==
X-Google-Smtp-Source: 
 ABdhPJzx6WIv5JHJH4ufD+sLxjMjqHnfthj7SpB5nTWMdZJT/9aegP/FB89xtpYwnoL2dXwXSs3kgg==
X-Received: by 2002:adf:f40b:: with SMTP id
 g11mr26822318wro.296.1638602018099;
        Fri, 03 Dec 2021 23:13:38 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 y15sm5837992wry.72.2021.12.03.23.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 23:13:37 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 16/26] xserver-xorg: remove unneeded patch
Date: Sat,  4 Dec 2021 08:13:13 +0100
Message-Id: <20211204071323.2480163-16-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211204071323.2480163-1-alex@linutronix.de>
References: <20211204071323.2480163-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Dec 2021 07:13:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159163

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...e_display.c-add-missing-mi.h-include.patch | 23 -------------------
 .../xorg-xserver/xserver-xorg_21.1.1.bb       |  1 -
 2 files changed, 24 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-drmmode_display.c-add-missing-mi.h-include.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-drmmode_display.c-add-missing-mi.h-include.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-drmmode_display.c-add-missing-mi.h-include.patch
deleted file mode 100644
index 4b8e43f1e4..0000000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-drmmode_display.c-add-missing-mi.h-include.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From 84338444179cab7ede1252a11b66e3b8f657e6a4 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 7 Feb 2020 20:36:45 +0100
-Subject: [PATCH] drmmode_display.c: add missing mi.h include
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- hw/xfree86/drivers/modesetting/drmmode_display.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/hw/xfree86/drivers/modesetting/drmmode_display.c b/hw/xfree86/drivers/modesetting/drmmode_display.c
-index e18cc37..3445cce 100644
---- a/hw/xfree86/drivers/modesetting/drmmode_display.c
-+++ b/hw/xfree86/drivers/modesetting/drmmode_display.c
-@@ -46,6 +46,7 @@
- #include "xf86Crtc.h"
- #include "drmmode_display.h"
- #include "present.h"
-+#include "mi.h"
- 
- #include <cursorstr.h>
- 
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.1.bb
index 5793e078ee..196d1edff5 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.1.bb
@@ -1,7 +1,6 @@
 require xserver-xorg.inc
 
 SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
-           file://0001-drmmode_display.c-add-missing-mi.h-include.patch \
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
            "
 SRC_URI[sha256sum] = "782e7fef2ca0c7cbe60a937b8bf42dac69c904fb841950fd0363e1c2346ea755"
-- 
2.20.1


