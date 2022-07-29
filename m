Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CE49C19F2B
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 14:48:08 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web08.57.1659106087045263279
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:48:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=rNyAp7eY;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id g12so4836678pfb.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=lAhKVM9gTgxmGLkrzQw4zqs53xAmQ4/aiqbtp5tZgqE=;
        b=rNyAp7eY8o1RY2f1cPJjSRtOnMcT7L+yyIJrufqwutEHyPkGDuL5pAIswgSMfSSz6m
         dvWkFy17Wez3qAlDiK3uiq5bIDhRD5YH8NwjQ0cZEJHOVis0rSxUzjdxMtUXYdDOIpkB
         zkOIK4VQjw8Q1YsnKka8h3Tvglf4gs/28pqGWwmcuOCH6ybYCc7PFaGqy/CH2hSzVDiM
         MrZZoQY7OcHHGBoj+vmYcp5FWGsBiJDdlMj1+U1a/n+j4vTcwmRfofuxQTkVWyojD/1p
         9JUvpbYGkDOQaZFUGbFQ3SuNiCbE2YZ5d8hO195luAXYM5gUatl3/fcJnGotYIqouJdv
         4rGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lAhKVM9gTgxmGLkrzQw4zqs53xAmQ4/aiqbtp5tZgqE=;
        b=g88JDdhNVMm2AolQITVajJv/F30hBSBO4WZ9b2sRoTns7H0ZNBVH/Bzr4zpP5ECBsh
         Q7qGOLwu822qy/TrAUS81gfY+EnE+aHBlVsqYynHwNyO4CwwaDKBofneEnIlekZRnJv+
         +K/x2mcXw1E6TNUOmvSpwfNteIa1SsJOpuM/3qmb4ehxGviO7ydCOBEvI48UksTpwroT
         tboFA8w9JDEqkwX366DsmnYuQiZKbVXdAwDKmEClxd64vAtcEbaGlX9+RQUQt/tGfWNy
         U1e7UFHXckxLMGwcjk2mH6aziuMvJ0XS12vYDr0EZwjLtN31FpB0Mr2YcxGghjMrhPCH
         anNg==
X-Gm-Message-State: AJIora/fLmNA6f8dLnPSxYTfhVNnz3eBfdp6F4wXc17za0v7Cx0uJs/J
	tVVMPgNaTwrUcCCsKRAdN2jgkWFKZTn6GcUO
X-Google-Smtp-Source: 
 AGRyM1vkmAjakcq+jF6jQ4Ejz0e6dCTlnHATRd7mTMOP4kDpguU9prCiO9w8k1i07m0Pl/epWq3WyQ==
X-Received: by 2002:a63:c158:0:b0:41a:6685:59de with SMTP id
 p24-20020a63c158000000b0041a668559demr3341565pgi.95.1659106086011;
        Fri, 29 Jul 2022 07:48:06 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x24-20020aa79418000000b00528c6c7bf37sm2958782pfo.129.2022.07.29.07.48.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 07:48:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 19/29] xwayland: upgrade 22.1.2 -> 22.1.3
Date: Fri, 29 Jul 2022 04:46:35 -1000
Message-Id: 
 <df37259b600a3458957ddc7c90418d85021a107b.1659105705.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659105705.git.steve@sakoman.com>
References: <cover.1659105705.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Jul 2022 14:48:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168654

From: Alexander Kanavin <alex.kanavin@gmail.com>

Changes:

       os: print <signal handler called> if unw_is_signal_frame()
       os: print registers in the libunwind version of xorg_backtrace()
       xwayland/present: Do not send two idle notify events for flip pixmaps
       xwayland: Fix check logic in sprite_check_lost_focus()
       xkb: switch to array index loops to moving pointers
       xkb: swap XkbSetDeviceInfo and XkbSetDeviceInfoCheck
       xkb: add request length validation for XkbSetGeometry
       xwayland: Change randr_output status when call xwl_output_remove()

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 229e3ad289a5e2c890b25497857140952acc3d67)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xwayland/{xwayland_22.1.2.bb => xwayland_22.1.3.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_22.1.2.bb => xwayland_22.1.3.bb} (95%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.2.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.3.bb
similarity index 95%
rename from meta/recipes-graphics/xwayland/xwayland_22.1.2.bb
rename to meta/recipes-graphics/xwayland/xwayland_22.1.3.bb
index 8c52613109..da1b27525d 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.2.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.3.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "743c4d56cfc0818755e2281d625d51860b41a473c641e179649a4f41776d1fca"
+SRC_URI[sha256sum] = "a712eb7bce32cd934df36814b5dd046aa670899c16fe98f2afb003578f86a1c5"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.25.1


