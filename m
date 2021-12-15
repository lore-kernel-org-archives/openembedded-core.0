Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 974CDC47080
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 01:44:40 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.2583.1639608056266038935
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 14:40:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KEsWc8qT;
 spf=pass (domain: gmail.com, ip: 209.85.128.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id p18so17670485wmq.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 14:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SZiyOR1FsUhy5U5Q2CrtzFf3chkTlbsWMvJ0PKoCMvg=;
        b=KEsWc8qT16O5OPSW46S/MvZ158uT+XO4cub6AtRMZ7n4mVbaS0i+NuhGUvXMUc65Xf
         RTmez+XGroeOHlUWa5/lGdy5+rLMAkNAiwZ6o2Eid3bJaOFpFnCPzDWrQnc3vc8L0y7s
         4VgKROUCnc1cjpl2kZ7wxU6Ow9ZCDnx64lfWZ7J6qCZQkEFcEwzJ8U8d+jdFmfE7d17S
         jW5hnoY4rBpCKMPdfjRaqMJ9/tVc0IZefCxF900kLuRiCHAVA6rCpM2UllbCeuzjDHyV
         9d0PNo004CGiKXZ1gPQFOekvKFiXN0tuF60AyYMKPV7m9Ib76SgIJvxct4BQM77L/LAN
         fCRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SZiyOR1FsUhy5U5Q2CrtzFf3chkTlbsWMvJ0PKoCMvg=;
        b=yk/Dx+RPohxxQA4Gm74GpR/BvbDYVreCWEmDS4xnrJrB+woSX6wjeITKJ3o6YsLhJq
         r6B3ygpPRP1EnKhBgDLhCDfNj1Bs3qOjtdFbVFCckyEqcTOyCFNOZpFDhb6pkmnpWVzr
         DM6istxj/WzhE/E68D+RvkPucUI2YNqgRqUPJDVXmn/ihdWNH/4uxG4uneS0FsgBeLyM
         YAH21P1ebURWX8BFubG3ZNyFx9z+WLSmDjz6STAX1YDmVWn5RFZvg68kjONzGA+qDrGo
         wcXfD7fj4ka/n1ecDp/fB+XOc0hv00ADQeJC3L/kDtfEElTsJKeQY4thHj31ivppuq2F
         1fDA==
X-Gm-Message-State: AOAM532YHmWrjFmlmxJ8zH5TaF90qfHh6aMtiJSMU0cHw9iS7v62yct0
	cm16FcZeYB2bQxeS5+IAMQ2ZW570YCplfQ==
X-Google-Smtp-Source: 
 ABdhPJyqEOvAoYvZf2MXEeMNug5XXj/1kI6ppj5W4Yg3NUj89FkkJqLXoa438Dp/rwb+aqtmBEQAuQ==
X-Received: by 2002:a05:600c:500a:: with SMTP id
 n10mr2307328wmr.136.1639608054883;
        Wed, 15 Dec 2021 14:40:54 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 u2sm3587269wrs.17.2021.12.15.14.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 14:40:54 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 25/26] libsdl2: update 2.0.16 -> 2.0.18
Date: Wed, 15 Dec 2021 23:40:33 +0100
Message-Id: <20211215224034.1814148-25-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211215224034.1814148-1-alex@linutronix.de>
References: <20211215224034.1814148-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 01:44:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159767

sdl-dlopen option is no longer supported.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libsdl2/{libsdl2_2.0.16.bb => libsdl2_2.0.18.bb}           | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.0.16.bb => libsdl2_2.0.18.bb} (96%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.16.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb
similarity index 96%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.0.16.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb
index bd7dea275e..5e645b443c 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.16.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb
@@ -22,7 +22,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
 
 S = "${WORKDIR}/SDL2-${PV}"
 
-SRC_URI[sha256sum] = "65be9ff6004034b5b2ce9927b5a4db1814930f169c4b2dae0a1e4697075f287b"
+SRC_URI[sha256sum] = "94d40cd73dbfa10bb6eadfbc28f355992bb2d6ef6761ad9d4074eff95ee5711c"
 
 inherit autotools lib_package binconfig-disabled pkgconfig
 
@@ -35,7 +35,6 @@ EXTRA_OECONF = "--disable-oss --disable-esd --disable-arts \
                 --disable-video-dummy \
                 --disable-video-rpi \
                 --enable-pthreads \
-                --enable-sdl-dlopen \
                 --disable-rpath \
                 --disable-sndio \
                 --disable-fcitx --disable-ibus \
-- 
2.20.1


