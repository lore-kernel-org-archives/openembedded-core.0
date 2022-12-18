Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D456C4167B
	for <webhook@archiver.kernel.org>; Sun, 18 Dec 2022 16:13:29 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.32480.1671380001459210334
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Dec 2022 08:13:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Fd7Ioysy;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d15so6868531pls.6
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Dec 2022 08:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DHYtmkq3jtvuWpQvf7pM5SaSr3B6Q8gGbdNQrkzxxPA=;
        b=Fd7IoysyGMJLUiIGU/VIK2YPxxT+epmQru1VoJQ/0uGE47joNwF7N0QqEyUnwOxbJ0
         cy3kKVHSt0tmAbzDNz0Qt2nLXob5E8AV0FDwxeUSWIxhSnXhEp39ubDJI2ysg4eA/9st
         5PTrwRr0Rx/aM9a7jVkSaq32sFy7MuKSvDE86cOT7ig1bxPq3L4Urdr9mdY/Jbm7GYH4
         uZ44JSw0qzIt7bi8756IQa2EfEZQ2X8VjCqgbV35uATf0wx8fFZW2mMTbTVHud5snZ80
         ChiA6h4ERK567t22p+RyBoE6c92UbG9qeGv3Zpo6Eu4BZbTVSiKW/bpz7Ktb/GPpd1LU
         9AaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DHYtmkq3jtvuWpQvf7pM5SaSr3B6Q8gGbdNQrkzxxPA=;
        b=6bu/mh7uMCeVZLPirlGALSEpGn87cgcioOg/TiZiASoIF11d2lCRtmAnG5sdVlZGIE
         BQPT+1NTVrgdLy6irUExEri9W/k9uz/Wcz0jR7xzLrGVURxFs1C/LJQ8k4/EbEDGgCS7
         WV5iPx+jNubp8sxH0xxPZku8lbUVGLvPQDToxp7Eom/igLF9GkqZB2i1Jg7h7o1ysBZr
         +v10Zu99EZdttoRyyLV5seW7E/A2Nfb7baIZNGPdkutd0lJPNmagXYZYzDF7Z5Rbt51t
         9JjCgfDvFd4Mqr6AE2YBQSy/K4QN+VYC5K1bidXDXcBma07bv5Lm6+saSPo1/X0dsO/t
         NZsA==
X-Gm-Message-State: AFqh2kqMWTlYev4Q5pXCEMjne9Tc5dep1x6XH/N9x6yn+ivsX5zX20eL
	ZfJWUF1SaYA+MkRZo6zX5shDp8iixTsywMSkgTw=
X-Google-Smtp-Source: AMrXdXt7XDmomrV8eWl32Feb7AxdmKVxP7AuuBN9uDDbsvx/xaJ0EDWR3elyh7FXkQhc9whH0xbFKw==
X-Received: by 2002:a17:902:d346:b0:189:e909:32e3 with SMTP id l6-20020a170902d34600b00189e90932e3mr5769127plk.40.1671380000539;
        Sun, 18 Dec 2022 08:13:20 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id c7-20020a170902d48700b001896522a23bsm5278763plg.39.2022.12.18.08.13.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Dec 2022 08:13:20 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/19] dbus: Add missing CVE product name
Date: Sun, 18 Dec 2022 06:12:47 -1000
Message-Id: <655fc82974478b5986dc58f898d818bba692c2c6.1671379841.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671379841.git.steve@sakoman.com>
References: <cover.1671379841.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Dec 2022 16:13:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174790

From: Mathieu Dubois-Briand <mathieu.dubois-briand@hyprua.org>

Signed-off-by: Mathieu Dubois-Briand <mbriand@witekio.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 67b2db202834f1213bed3580badda2a67655ab7d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/dbus/dbus_1.14.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/dbus/dbus_1.14.4.bb b/meta/recipes-core/dbus/dbus_1.14.4.bb
index 9684f0c6e2..85db58e214 100644
--- a/meta/recipes-core/dbus/dbus_1.14.4.bb
+++ b/meta/recipes-core/dbus/dbus_1.14.4.bb
@@ -182,3 +182,5 @@ do_install:class-nativesdk() {
 	rm -rf ${D}${localstatedir}/run
 }
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_PRODUCT += "d-bus_project:d-bus"
-- 
2.25.1


