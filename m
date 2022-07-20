Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFF85C43334
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 08:45:04 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.51618.1658306703300838153
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=j1ZeXZ78;
 spf=pass (domain: gmail.com, ip: 209.85.208.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id w12so22818387edd.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1GeGlcinsClpF/q2SGzFbybIGw2WqQbjsMXKWeTTWAk=;
        b=j1ZeXZ78rUFpc66hMEcMXhJRgoAzymCLDcM7ijT9p3RY7OKWQFGiUaURF4GPREWfIX
         JbuDaRyNl4ep5LZTxWvdLg7rOMIK/FpSZT0Bckvq6AmYu3oLRD147TuGaiI7P4XrC4r+
         p3qbNwK6ycNviOYQ+Siffp/c+PZC6V2/5S6IezqQdHyY06rHRYI1lXDamgZR04F9Ls6c
         +GuZW/z/CSsdK1AI8pjFsFLmsMokNM+9hQMZ7HtjJ1siCEaJFQR/Ear8gAs6hvteq8/q
         mmM4gn6eN11oUJciQmgBrMD35cNYsuULaKK+FgXTEFrp1Rsg/jqMLHXlBoxZxvLk42NG
         0I/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1GeGlcinsClpF/q2SGzFbybIGw2WqQbjsMXKWeTTWAk=;
        b=UeYjYOPUmf26N5dj9yLDSLpA41/Yrz7vEnugD3Ht25M4MM/0wsfgToyJuUdX+4vqV9
         ceD9D9L2AkRr+bOWb4eG7Yh2fgMe1frgMIt+5IeJcdbonmfKLhwozxmHX9cVdQpjuqYj
         th20xSjjqX9U+QsXNES+z5xrgRl+niynn3UgyZ2US08cnOn3cUHTsZKYz6tl54DUoh+Q
         iZdrnQbb+9V5SjHFdGL0v25fO9VcM2J4hHqjC8LZBIy98C0nHJ3a/BPBiX7RN4NK/1Bt
         fI91zZLtGEFJMBV8S562Mv4N5liWlRU1AyqrQS3+R50PGNtnWUfDMsaLGG+TUQVo69hK
         cTdg==
X-Gm-Message-State: AJIora80a46lmgDRPBCh/LUPqvL9bH9fXLL4WgkEFjlET7KDLDdGAOXn
	EbooKg4PjM/W+j9EPcfhbzU2oY3geHQ=
X-Google-Smtp-Source: 
 AGRyM1uWgMlreR6vZWwuI5CsSt3bybS6JfwXIXjA6XB7gToowAzwtawexW1Ms7xEre629LRQsEpQ5w==
X-Received: by 2002:a05:6402:3301:b0:43a:9ad4:633 with SMTP id
 e1-20020a056402330100b0043a9ad40633mr51334254eda.261.1658306701821;
        Wed, 20 Jul 2022 01:45:01 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 s9-20020a170906a18900b00722e5b234basm7781784ejy.179.2022.07.20.01.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 01:45:00 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/51] xf86-video-cirrus: update 1.5.3 -> 1.6.0
Date: Wed, 20 Jul 2022 10:44:03 +0200
Message-Id: <20220720084442.2940187-12-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220720084442.2940187-1-alex@linutronix.de>
References: <20220720084442.2940187-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 08:45:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168306

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...xf86-video-cirrus_1.5.3.bb => xf86-video-cirrus_1.6.0.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-cirrus_1.5.3.bb => xf86-video-cirrus_1.6.0.bb} (72%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-cirrus_1.5.3.bb b/meta/recipes-graphics/xorg-driver/xf86-video-cirrus_1.6.0.bb
similarity index 72%
rename from meta/recipes-graphics/xorg-driver/xf86-video-cirrus_1.5.3.bb
rename to meta/recipes-graphics/xorg-driver/xf86-video-cirrus_1.6.0.bb
index c498477604..32eb8a4816 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-cirrus_1.5.3.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-cirrus_1.6.0.bb
@@ -7,7 +7,8 @@ the driver is still useful."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6ddc7ca860dc5fd014e7f160ea699295"
 
-SRC_URI[md5sum] = "7d7dfd4cdc42aa8b6e923510fa00ad2b"
-SRC_URI[sha256sum] = "edc87b20a55259126b5239b5c1ef913419eab7ded0ed12ae9ae989460d7351ab"
+SRC_URI[sha256sum] = "0ef3fa0083de3d9a040f11b3af38598d8405f1165b908fdd6712c30038326401"
 
 DEPENDS += "libpciaccess"
+
+XORG_DRIVER_COMPRESSOR = ".tar.xz"
-- 
2.30.2


