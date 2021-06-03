Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.658.1622735008688156346
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jun 2021 08:43:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gqswnQFH;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id b9so9860148ejc.13
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Jun 2021 08:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=woIo7toYD0aBNLmC5y8Ogzf8CCFi8d6HwXNnnEi6Pj8=;
        b=gqswnQFHINqkqzf14W+kuBW7j2WZ1R30zA7pQMnFRPTwwa3//josPzVZN4rRVzsuNw
         W8aaE0buwC/GLCR4Bdxs4h1aSmqRPGmUQFr+i4WDUKEIrCO7vh8fiCH0M8SMzhJqz80X
         ZxYsFMierWdrugozOd+JX1xBN1LiiEXP9fGA4yN7uTsn5SW4AJsercdj262+/THGGxF4
         Fex+3n6nrqEyHEbEgkErfW8fTbg7IoVQ05eYCQJhGv+cfAIbEclZ++Y7vfiocKQokeQD
         3nvHfiLH44m4U7kLCDdY6mIBCO14VNy+qWwlkikqRhoyxLLt5RkdO/0cFQwRXKRPkEVF
         5OQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=woIo7toYD0aBNLmC5y8Ogzf8CCFi8d6HwXNnnEi6Pj8=;
        b=oV8VEmnQt074g9L/OVCu8ZwhfAF1mtH0qPnbcuwCzs22w6F8G3c7wYknM+T1XTz1Bg
         JuqCrICC6YbqFHf2r9hk3ykYI3Hu6NqxVhch5p5ai7yB62s0uVsedeO3PDN26BNMjWty
         hUli+OipXsC3L3gz9uBPEY+RjbxAQZK5qiDMTp8ZZ+JTxhQIcGz694gLaL90K/cC0ndf
         Ia+VWoEsR0ct4MreZyap9J57V0oC7P9iKJbABB0PhNHkX6wuUb4xvNY0VMrYXNqtA+KM
         hSPK/VIYbMyfYPlpTEKtVT3fTbO9f+7gJDC+xUN/cUyv5Kyh/pvtdkgs3EmFuwpc2mYa
         iWig==
X-Gm-Message-State: AOAM5304DjxWM4O4JWdqKTkvu01BXoNrssyDCxW2nmy9Dmn8kyzKcq32
	9WlnI9JQ2ERPUrd9sih4mel7uBS4JpgYPQ==
X-Google-Smtp-Source: ABdhPJxAPOAyGnRqTBJpnUtBzZl3Hng5G/Lac5Bxre2PTexxG4KONP+9PfWD0Kv1al3e2k/ZoiWwvQ==
X-Received: by 2002:a17:906:6dc5:: with SMTP id j5mr32826ejt.364.1622735007333;
        Thu, 03 Jun 2021 08:43:27 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f11f861d707ea86d7bc33dd.dip0.t-ipconnect.de. [2003:f0:7f11:f861:d707:ea86:d7bc:33dd])
        by smtp.gmail.com with ESMTPSA id d17sm1644338ejp.90.2021.06.03.08.43.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 08:43:26 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/8] alsa-tools: upgrade 1.2.2 -> 1.2.5
Date: Thu,  3 Jun 2021 17:43:10 +0200
Message-Id: <20210603154313.2894136-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603154313.2894136-1-schnitzeltony@gmail.com>
References: <20210603154313.2894136-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changelog:
Core
 - Release v1.2.5
hdspmixer
 - hdspmixer: add output loopback buttons
 - hdspmixer: enhance saving of presets

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../alsa/{alsa-tools_1.2.2.bb => alsa-tools_1.2.5.bb}          | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-tools_1.2.2.bb => alsa-tools_1.2.5.bb} (95%)

diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.2.2.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb
similarity index 95%
rename from meta/recipes-multimedia/alsa/alsa-tools_1.2.2.bb
rename to meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb
index 0a25d809b0..8f9c77e4fc 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.2.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb
@@ -14,8 +14,7 @@ LIC_FILES_CHKSUM = "file://hdsploader/COPYING;md5=59530bdf33659b29e73d4adb9f9f65
 
 SRC_URI = "https://www.alsa-project.org/files/pub/tools/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "4e6187d2c3a8c73a9d75d66a72faed27"
-SRC_URI[sha256sum] = "bfd3c7aae1289269605d3da02279159b10e3dabdd31e658cbceaa30170957349"
+SRC_URI[sha256sum] = "35a71027a01f4d7de4722e223520e940de68b3c570b6c671691567ae28f9893e"
 
 inherit autotools-brokensep pkgconfig
 # brokensep as as10k1 (and probably more) fail out of tree
-- 
2.31.1

