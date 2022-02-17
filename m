Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1787C4332F
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 16:10:01 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web09.1772.1645114200459647748
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 08:10:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nRgnClIX;
 spf=pass (domain: gmail.com, ip: 209.85.218.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id bg10so8461970ejb.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 08:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZgRAVFFpG+XXNDaJ+L9XsG/HhCmDLp1mvC55x6Mhd3w=;
        b=nRgnClIXV8dQNDqsgvSdU9UP1kS/hM5T2Lca03wTxmfWTqG0yCr7G1dV3WSMp8Y2nb
         fefulK/WtHGxi/ktp5fLC/on5XYcQZ6GbRL4DiifxxudAIbhBkRH5hfVw705iTZxBuRz
         YMfvGqDMD5JWVWi6IV23uAuUn3NhMxi5cismJBNV9USn98tRlSkoilvbht1FYGv4T/E0
         FbPejSIjSJ/T+DTbuuuq1gg6aHQUePrY+0eP8TA+BkxVitId9eSkoAM/mCSm1nVmIyM8
         HTrFZqBmuOsRZyAWnENoZoIHlDK6fwzgZHoTo4sS4TBMupJIQk1IJTvsR/RO50des1PJ
         BolA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZgRAVFFpG+XXNDaJ+L9XsG/HhCmDLp1mvC55x6Mhd3w=;
        b=G3WzpXqpQOss51IjJl7LTnDEUpGCt8wrH+bQHHym70aVCAIdVcp31s5Z9SpF1xSBZh
         QwAHmSrcnLRBuBY46FoLJ27eeh+cmGi5R91yNZlPqPzpazdedX9yMA6LjG+5ifJslA0b
         4i2h0zr6lCiPftsBhi7Qh4Vx6h7ypEvRUUsqUV6RvC6Rz3HabFEISqviqobLSFVs/w8E
         IInUqJiikBmsgMeHqsOTAXsCf+toHjxJeh2WjfBfL1BLzhQzTqUWqPC40wkUTFbAJLDS
         Vq7f7vI6f18pRIunUOsL0pB5jAjO3e1VIFafr7c1hlMZOxWWjxYk5SzKo24azDNkGSx+
         iJFQ==
X-Gm-Message-State: AOAM531qtlAxoyHAgucXI14C6w9Fpu6gjVaaDiXd8Wl5JIRn3Wh+V3Bw
	9Tr3XeFKpM6h7pAniW9piROXpSDkdYI=
X-Google-Smtp-Source: 
 ABdhPJzOGNYp+7rhuKRSfGVfUHVXFZukAWdI5nqsIbD89NKc0bE2by71Dyd2xbhWydOLWkUTGZtWiA==
X-Received: by 2002:a17:906:2991:b0:6cd:ac19:ce34 with SMTP id
 x17-20020a170906299100b006cdac19ce34mr2932150eje.746.1645114198989;
        Thu, 17 Feb 2022 08:09:58 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 n2sm1381297ejl.55.2022.02.17.08.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 08:09:58 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/28] xkeyboard-config: update 2.34 -> 2.35.1
Date: Thu, 17 Feb 2022 17:09:22 +0100
Message-Id: <20220217160939.1424397-11-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220217160939.1424397-1-alex@linutronix.de>
References: <20220217160939.1424397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 16:10:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161828

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...{xkeyboard-config_2.34.bb => xkeyboard-config_2.35.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.34.bb => xkeyboard-config_2.35.1.bb} (86%)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.34.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb
similarity index 86%
rename from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.34.bb
rename to meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb
index 5d431a4172..6d40266ec3 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.34.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb
@@ -12,8 +12,8 @@ BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=xkeyboard-confi
 LICENSE = "MIT & MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0e7f21ca7db975c63467d2e7624a12f9"
 
-SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "b321d27686ee7e6610ffe7b56e28d5bbf60625a1f595124cd320c0caa717b8ce"
+SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.xz"
+SRC_URI[sha256sum] = "18ce50ff0c74ae6093062bce1aeab3d363913ea35162fe271f8a0ce399de85cc"
 
 SECTION = "x11/libs"
 DEPENDS = "util-macros libxslt-native"
@@ -22,7 +22,7 @@ EXTRA_OECONF = "--with-xkb-rules-symlink=xorg --disable-runtime-deps"
 
 FILES:${PN} += "${datadir}/X11/xkb"
 
-inherit autotools pkgconfig gettext python3native
+inherit meson pkgconfig gettext python3native
 
 do_install:append () {
     install -d ${D}${datadir}/X11/xkb/compiled
-- 
2.20.1


