Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFF36C4332F
	for <webhook@archiver.kernel.org>; Wed, 28 Dec 2022 07:37:42 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.176136.1672213061056705164
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Dec 2022 23:37:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hmY/1+Ox;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id i17-20020a05600c355100b003d99434b1cfso558447wmq.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Dec 2022 23:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HmBRFX9XqW5GNZN/iI5r2qxkmskYQuhpvefAhIRcoyg=;
        b=hmY/1+OxfvYGwVkAyBhol6XsdbRdVWJhTU+JIooixtw4izfp3pWc9ZDZOHdaH7IB8v
         dgpoJHSuoCYjV+0PPefAhXUHBxAeQXwrHqEk4S4npPvPcOO33L00XcKvAZyhCZfOrNop
         dbtGJJH7R/doj+o9ylM0Rg7GtD73r/Li3khd3EbGp7XH/XD/+qMbgHIzsxj+QqepLAYK
         GPkGo/fxd+96np49jFY9g85Kwq/h4L6wWuMLDC4PoJwIoVnTclSZKca8KauKHt1JHHGz
         K03CbcT7eKciB3KAxeV2D5mvlBEu9W9Z7QbzkTHlYtSqgiJEfsGmseb0eEhlB2etQYqU
         J/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HmBRFX9XqW5GNZN/iI5r2qxkmskYQuhpvefAhIRcoyg=;
        b=YQ3vcR1RPgfHoTdz+FlxOQLofE2kKqOZVJrj3wtuQ22b3uMxc9aekTXM4tnH/177vT
         RyQ0T3Wvb2trMNSXYjr8YEV9HVCx77RyTD1//sH5l24QkQbfTVoGTMY+jP8IzGuju0XN
         uRyxIHsFhxjE9sMSRmf3PTlTUtye2T8hAQqEzsZLuEeCsJpEy7fhQLJjGeNYNMhQShPE
         X6V6XbqrRdYQei+liEoFF9bMs7+aNeZm7tgQin5okqtze6ydAo9IzR8A2hKunGHGOISe
         4PU4RMQR5kxurrHf0HrZbNfMxtIoqSL9Thh5YQdL/41sqw9z4I8cYICVxlv3KP8pTesn
         LPBg==
X-Gm-Message-State: AFqh2koHs3ry6FWKORmV5InrocROaQoMcDbq/x+S4ZPoi69pG9CxHejJ
	ACNxOPUTeCMHYJOVAEeGeTbxT3QOERg=
X-Google-Smtp-Source: AMrXdXvrZ7Gtj8u4nMaT68qBaTxuDGj3hbgTGeikxN1EOlOCFSYxLuP7sC+TdkSxjhp1SIu51DyQUA==
X-Received: by 2002:a05:600c:3209:b0:3cf:5fd2:87a0 with SMTP id r9-20020a05600c320900b003cf5fd287a0mr16704084wmp.40.1672213059636;
        Tue, 27 Dec 2022 23:37:39 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id t15-20020a5d534f000000b002365254ea42sm14802040wrv.1.2022.12.27.23.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 23:37:39 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 15/25] libxdamage: update 1.1.5 -> 1.1.6
Date: Wed, 28 Dec 2022 08:37:11 +0100
Message-Id: <20221228073721.3454255-15-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221228073721.3454255-1-alex@linutronix.de>
References: <20221228073721.3454255-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 07:37:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175055

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xorg-lib/{libxdamage_1.1.5.bb => libxdamage_1.1.6.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxdamage_1.1.5.bb => libxdamage_1.1.6.bb} (87%)

diff --git a/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb b/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb
similarity index 87%
rename from meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb
rename to meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb
index b201124d86..1d297ecd80 100644
--- a/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb
+++ b/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb
@@ -23,7 +23,7 @@ PE = "1"
 
 XORG_PN = "libXdamage"
 
-SRC_URI[md5sum] = "e3f554267a7a04b042dc1f6352bd6d99"
-SRC_URI[sha256sum] = "b734068643cac3b5f3d2c8279dd366b5bf28c7219d9e9d8717e1383995e0ea45"
+XORG_EXT = "tar.xz"
+SRC_URI[sha256sum] = "52733c1f5262fca35f64e7d5060c6fcd81a880ba8e1e65c9621cf0727afb5d11"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2


