Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54F52C433FE
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 18:25:27 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web08.1185.1652811918865687286
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:25:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Y0gq6+Fn;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id 137so17651844pgb.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=p4Vgf1ge7XyUd3S89VdznqdA0o9lxWdo0Lw6aZR7D/U=;
        b=Y0gq6+FnB1nNFU7KMd1mPJz6Q6YGYBcyA0EOMv1XfBhcii49ZvMhRhkDypcKj/oGPP
         hAbuP3yNcCQvCZHS1BMxo29aey0xLDBHIlyKvbdnu3Qc4guHxwwa7FgDmj8P0UQ2NA92
         UjDjzK46AKLFvsq2YRk5CnOdsNV0f0WexibsLi8vAD1xvkNZ4Bk/46TtcUIriGUA6P8P
         RjkJCLCsKZoJK0KWId5ErhBf07PFhqhFKbFw5aMa36maFp+0Looo36RK1oy25GNRO/jG
         fLd5NKUbkNDk3gUyUjxLlO56AZjFZ22uhNqEtfSOlIig2RHzP91HorP0XKP9iAbxauBu
         MA3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p4Vgf1ge7XyUd3S89VdznqdA0o9lxWdo0Lw6aZR7D/U=;
        b=66Gh8XOpBSQp6GuADbALV2EBZjmBYedLVIPVHujw549luB0+UqL5GYVqjxRuBR2f0w
         m/I0KruIht6FZB4KHEJx9Ux1NmJ9LxM6m/6UcZFkNLcZ9nSqvLzbkmh5ev3kjqJDJGWJ
         CsD77ePDcRpjZyxTlLz9yiwq4zyVXhga4F83gmHPOPglZohIEjCYYh2h4gRNcPDt8jSk
         vSR+aXaBlYvXqyOYisYdqTqWfAzBQxNqcZHSwftrBmnnA4bAoeaHdWdEEUz8+A5ONp8+
         IHo1XzuRlBRq8jCbF0rJG1HAWtl1GWbN+ihwZ84GXng6KK42JEC+bsc5Q3iVmNdRwho1
         8ZNw==
X-Gm-Message-State: AOAM531RLlsRIwVvvI6P0G8W+RLEAXKgpabCC8cKzqRFk3rFNulH51WC
	erW9aFEaz8tC18UYffKQwqmirNCSGWwV3qnj
X-Google-Smtp-Source: 
 ABdhPJwg2KecaT4dcWb9a24O3oyX93FPfu+HdRPj6TB0Vr4rzlYKAFBBnOqmkpnMkro0/yI2oM0FhA==
X-Received: by 2002:a63:f255:0:b0:3c6:afc0:56b4 with SMTP id
 d21-20020a63f255000000b003c6afc056b4mr20708568pgk.407.1652811917641;
        Tue, 17 May 2022 11:25:17 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f9-20020a170902684900b0015e8d4eb1d1sm9408188pln.27.2022.05.17.11.25.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 11:25:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 17/31] xwayland: upgrade 22.1.0 -> 22.1.1
Date: Tue, 17 May 2022 08:24:03 -1000
Message-Id: 
 <8b8f53ebf6bc265d495154fea3050fe8d7fbd256.1652811454.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652811454.git.steve@sakoman.com>
References: <cover.1652811454.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 18:25:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165762

From: Alexander Kanavin <alex.kanavin@gmail.com>

Changes in XWayland 22.1.1 include:

- Not mapping the composite overlay window by default when running in rootless
  mode. This is being done since a client trying to get the COW, the X Server
  will map the window and block all pointer events.

- A change to the XWayland present queue code due to some Vulkan games/apps
  running in windowed mode only running at 58 FPS when in fact at 60 FPS for
  matching a 60Hz refresh rate. Incorrect calculation handling led to the MSC
  ticking at ~58Hz.

- Fixing use-after-free bugs.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit aa0028e19651665f6671d7c57646cfc97c7ba763)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xwayland/{xwayland_22.1.0.bb => xwayland_22.1.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_22.1.0.bb => xwayland_22.1.1.bb} (95%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.0.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb
similarity index 95%
rename from meta/recipes-graphics/xwayland/xwayland_22.1.0.bb
rename to meta/recipes-graphics/xwayland/xwayland_22.1.1.bb
index 9769235ce6..b512b9932d 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.0.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "1752d6d0a930e71292b5a308d3811ebd54d8cc68cacff44de654265b8617a2bf"
+SRC_URI[sha256sum] = "f5d0e0ba37e19bb87c62f61da5970bd204939f2120620964bed4cc8495baa657"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.25.1


