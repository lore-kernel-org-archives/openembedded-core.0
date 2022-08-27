Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 329CAECAAD1
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 18:26:34 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web12.51629.1661624789829470818
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:26:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=lnTBlqlv;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id
 h11-20020a17090a470b00b001fbc5ba5224so4962089pjg.2
        for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=OiP1CKauhHAe2rcerbgr2igFlnwNU7d7Hnyn1fONq8M=;
        b=lnTBlqlvn2L1mpXdDS7wUAQHl/b8beEEdRRxCx2PMW3ric+e4C2fMCHKQREiwxOG35
         5T/eB8UylscL97dul1wKs7DqcmQdy8c2XqV/sU28t/3V+TVzVWuMGri1zLm3bpauvj+0
         2kJ3Gf+srKUIZU3Th3h4olGzikwIkrIbyUmnsfHOR+ihYLhaDuhqzvUvFz55qA5nebuX
         si/8txac9NgZuNzt7xf3dnBbNjzeVVughRXB7sjKbutWAsRdVTUzvhTqVfDq3YmqVWbY
         s02DMmmst5GM6D42MU4hngbAPHM/Ow1murlgFWidjplvMXGN8ZBUpauEsCpua9HAw2UP
         fcxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=OiP1CKauhHAe2rcerbgr2igFlnwNU7d7Hnyn1fONq8M=;
        b=M1+eQRDMtwsP7/9yGP18nWzIqv0d7z/qJA+1xcgQ12oA5QZce+kQvVbIJsE/NTIetK
         RGCfyNoqe+T8uYMduGN3mM3fjKrKeaaB+HAgCrPXsECKiTlzT/VMsP47vJVyzy6qrOxb
         L9wglDC1CLpLnzb2sYNb3flKj5GitvcfDmdfNqOOAADXLuKvxmqGhDF5Msa0FMIoA9M1
         CZCbtctg5BrCSxxs1GxW2HM1lo41hjSnehWKU6Ep4Vziaf6g5rzrKQcUzJWtoCV1mKpb
         jVWI2hyAVeFVg3I73ESDYr2FkmTn6y5TzPoMhDK1HG6j9azcfyyfsgTWlxnWzyQX6osy
         8qag==
X-Gm-Message-State: ACgBeo3NEiZJ6Us5diT0t/05pHov5pJUu+hPXGTYuEW8sV7zav7bLly5
	w+/N+Oth0kpN6nu5fS6vNphCN7JOLjsnJSOb
X-Google-Smtp-Source: 
 AA6agR4b9eCImwRPya31c3vwDY4kmHnFuH28voKiQGlE3jRhBmeleQD9gyeFo621w0qolJcmRzZozg==
X-Received: by 2002:a17:902:ea02:b0:16f:11bf:f018 with SMTP id
 s2-20020a170902ea0200b0016f11bff018mr9119349plg.150.1661624788899;
        Sat, 27 Aug 2022 11:26:28 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 r21-20020a170902ea5500b001708c4ebbaesm3864716plg.309.2022.08.27.11.26.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Aug 2022 11:26:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/24] wpebackend-fdo: upgrade 1.12.0 -> 1.12.1
Date: Sat, 27 Aug 2022 08:25:36 -1000
Message-Id: 
 <01488610c4582a2be3211d1d3018550df759ec90.1661624569.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661624569.git.steve@sakoman.com>
References: <cover.1661624569.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Aug 2022 18:26:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169953

From: Alexander Kanavin <alex.kanavin@gmail.com>

This is the first bug fix release in the stable 1.12 series.

Fixed a crash caused by trying to deallocate already freed graphics
buffers in certain situations.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a614bb96fab31049614d8cb24062fe77c76c8e30)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{wpebackend-fdo_1.12.0.bb => wpebackend-fdo_1.12.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{wpebackend-fdo_1.12.0.bb => wpebackend-fdo_1.12.1.bb} (90%)

diff --git a/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb b/meta/recipes-sato/webkit/wpebackend-fdo_1.12.1.bb
similarity index 90%
rename from meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb
rename to meta/recipes-sato/webkit/wpebackend-fdo_1.12.1.bb
index 4a18467ea4..5f776c13e6 100644
--- a/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb
+++ b/meta/recipes-sato/webkit/wpebackend-fdo_1.12.1.bb
@@ -13,7 +13,7 @@ inherit meson features_check pkgconfig
 REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "6239c9c15523410798d66315de6b491712ab30009ba180f3e0dd076d9b0074ac"
+SRC_URI[sha256sum] = "45aa833c44ec292f31fa943b01b8cc75e54eb623ad7ba6a66fc2f118fe69e629"
 
 # Especially helps compiling with clang which enable this as error when
 # using c++11
-- 
2.25.1


