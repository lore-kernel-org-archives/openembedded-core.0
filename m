Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53453C43219
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 18:28:17 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.2250.1643826495801463229
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kKHm30td;
 spf=pass (domain: gmail.com, ip: 209.85.218.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id p15so226679ejc.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D1hiM2MJuI2QFCJVTRXeajJOQgIVGMoF3r/NQdymTYg=;
        b=kKHm30tdMiRpdreG/EfUAX8tn1jg7F/Fqp4nNX+ej+KVZWTrJQFsNy2z0rxowFMOZp
         qiBSxv7lBtavod2JJmobF/mI0EPrKQkS1aPGwTROO/l4x15dOelhfkTIKVcyM6EGuESP
         leOUlf5L3wPmZ/wrPBj8RX9XSOobdgpeLwKMd4SQdcSrV+kVEKmaSnBPLc4FSoHrFf9/
         Q30CLVywj+f7ZaIVuaflIU/vmNwmx6lnAHkrz8Yz+ZJVUmU7TK7WJ9HAO8dfbcrNBRQY
         pFVNmdpRVwfNTrPCBLl4bNzVQYMvfC6SLisdxpm9rklIXjSzjQYC8epd/tJnk/fjvLb2
         yyLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D1hiM2MJuI2QFCJVTRXeajJOQgIVGMoF3r/NQdymTYg=;
        b=Mjrtaz+41F42XqU4lmMZbpCU6aR1/qhxWQEVH5nuEdCtRRfnhtPtUr9yNGP1rc/mNo
         RE7UZUDJGTwtrULMo54fUGdSG8vf4571ekY3LC+DvHqX9cOEDR0j22fBGs0PNfPLPcCs
         9iET/RI0eJi3X/BDSS8bQnJG7H18VouOkE/zY5kuHvaanFLjtljSUEzJNrUYnda59aM6
         mDkyA7HoMzERfcE/CzpZuSYrEnFQF1afEPDnshbAijQ2DQHnizQNYin3mjYlXubmwh8Y
         v2jPuzmGcyuNfZ479MjWbI+VhdgCDDXtGQk4RkGBIyY1/C787CD95GxtaFU7n/eojem3
         u+ug==
X-Gm-Message-State: AOAM53015D02MwHuTwuQ+/V4X9AbV8Xpa+06aUxsndBFTH15aOCFX5NE
	fIn8DQMrNMuFJIPEgwXsR9xysWKsldI=
X-Google-Smtp-Source: 
 ABdhPJz8M+DIZwkwKpuFAYLgv8VUIxQPGPjz3xqeZL74jM/9LByCQ5Di9mwoXKsSsKmsJ0lcpsjdZA==
X-Received: by 2002:a17:907:1b11:: with SMTP id
 mp17mr26032167ejc.541.1643826494415;
        Wed, 02 Feb 2022 10:28:14 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 i12sm15644203ejy.43.2022.02.02.10.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 10:28:13 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/33] xf86-input-libinput: update 1.2.0 -> 1.2.1
Date: Wed,  2 Feb 2022 19:27:38 +0100
Message-Id: <20220202182758.919991-13-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220202182758.919991-1-alex@linutronix.de>
References: <20220202182758.919991-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 18:28:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161238

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...86-input-libinput_1.2.0.bb => xf86-input-libinput_1.2.1.bb} | 3 ++-
 meta/recipes-graphics/xorg-driver/xorg-driver-common.inc       | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-libinput_1.2.0.bb => xf86-input-libinput_1.2.1.bb} (67%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.0.bb b/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb
similarity index 67%
rename from meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.0.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb
index b0168df8d1..e1c47aa5e7 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a22925127bd3c827c384cedd23ed2309"
 
 DEPENDS += "libinput"
 
-SRC_URI[sha256sum] = "f80da3c514fe1cbf57fa1b1bd6ff97f6b0a1f87466ad89247bac59cd0a5869f6"
+XORG_DRIVER_COMPRESSOR = ".tar.xz"
+SRC_URI[sha256sum] = "8151db5b9ddb317c0ce92dcb62da9a8db5079e5b8a95b60abc854da21e7e971b"
 
 FILES:${PN} += "${datadir}/X11/xorg.conf.d"
diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
index 65c5e3c48a..0b1df44fe0 100644
--- a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
+++ b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
@@ -8,7 +8,8 @@ PE = "2"
 
 DEPENDS = "virtual/xserver xorgproto util-macros"
 
-SRC_URI = "${XORG_MIRROR}/individual/driver/${BPN}-${PV}.tar.bz2"
+XORG_DRIVER_COMPRESSOR ?= ".tar.bz2"
+SRC_URI = "${XORG_MIRROR}/individual/driver/${BPN}-${PV}${XORG_DRIVER_COMPRESSOR}"
 
 FILES:${PN} += " ${libdir}/xorg/modules/drivers/*.so"
 
-- 
2.20.1


