Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BBFBC4332F
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 08:43:20 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web12.6556.1635842599299543650
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DtsN40LD;
 spf=pass (domain: gmail.com, ip: 209.85.221.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id d5so16720859wrc.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l9tsfo90J82ox5OL2ndy60F+xLDM0Rzeg8XYP+4zkSM=;
        b=DtsN40LD8XbIM0bajPlqb2PPdTWfHNcyz2RF6Y1cOoKXxM4tDQMGpbmbwqErRdEoc8
         bNzBpWjln5ZqWx/GklwdIVbBmy3ABkQUmOPrlgLr+r4HLH4AzB22XTAQe/rlUe4+qlMY
         EV0UH/2rihJHeFeeg3xbteowb0GXjoVxT9xvG/0/+xIUWMJwRdgRXwlW/mmSGxgq2Jwf
         lH0bFGiXcaD+MNUaNSYy4+/YrEJLEjsx4y+HS4llqOaiwEtnxtO105+tXZIHSY/7ROoF
         duf1DVMTaMQ7PD0FSbU6l3OUKIAsle+aRc+clMmgPpKZYN1v3+vpkgQBVpnFzxukf4pT
         VQHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l9tsfo90J82ox5OL2ndy60F+xLDM0Rzeg8XYP+4zkSM=;
        b=N7Ntcaxj+6StUNfQy0Hyjk7vFqCVuAvv83/Zz5pmJX6gfMaW4m3pHoE3SpaHAwS7ha
         dM0OrsT3Gkxh69BF8SNQWHRgakrzn8mFtfzEmCy8yONPMzmE9TF1H/4Eh24oAzHL+Yaq
         6zjzbE0dxOB+3KW5mlbUtqmDDdmPfCKeKUFJB0q1zimMKbu/Pnai9ByU0n2Qk36DGeL8
         fC/kP73xhk6tHhEosQEmcsliouWmPpDZwDw6IC+/K/n5h8sAx+qypIL5T51CTx1Cxrpr
         HF8xv+qU5i6jmgRM8Zd+fgkHJ3ggkb4JXlzkRAQKnkBhmNe/cNT/TZWE3G6RmelQU8S1
         uS7w==
X-Gm-Message-State: AOAM531ZB0XP3rUXJcoCubWlOZ3koT16QKTP071NwPAaa2D9ijOxnXkL
	mLOwyRbkHLiOv8utQrKvR54Bx6bC6U8=
X-Google-Smtp-Source: 
 ABdhPJwvgQwBqHcZA8+L98WsrY32SNSYFyDRtcxdK9C4u8pQyfOPWWvwEklA0llXoX16OQgW+JxtGw==
X-Received: by 2002:a05:6000:2a4:: with SMTP id
 l4mr18805457wry.238.1635842597853;
        Tue, 02 Nov 2021 01:43:17 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 v191sm1761890wme.36.2021.11.02.01.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 01:43:17 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 20/33] libsoup-2.4: upgrade 2.74.0 -> 2.74.1
Date: Tue,  2 Nov 2021 09:42:50 +0100
Message-Id: <20211102084303.2974802-20-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211102084303.2974802-1-alex@linutronix.de>
References: <20211102084303.2974802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 08:43:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157758

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libsoup/{libsoup-2.4_2.74.0.bb => libsoup-2.4_2.74.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.74.0.bb => libsoup-2.4_2.74.1.bb} (94%)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.0.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.1.bb
similarity index 94%
rename from meta/recipes-support/libsoup/libsoup-2.4_2.74.0.bb
rename to meta/recipes-support/libsoup/libsoup-2.4_2.74.1.bb
index ea34373a67..7f1ceab431 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.0.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.1.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl"
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
-SRC_URI[sha256sum] = "33b1d4e0d639456c675c227877e94a8078d731233e2d57689c11abcef7d3c48e"
+SRC_URI[sha256sum] = "dc27a3b8fa30bc8ff950b5a75958757d2242e3e51e4e2d9c4e623ef75f793bf8"
 
 CVE_PRODUCT = "libsoup"
 
-- 
2.20.1


