Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.58346.1622557166802208055
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jun 2021 07:19:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=GC5APTs6;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id u7so6948869plq.4
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jun 2021 07:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=FKV5FQ6WkBepBlU2hbjdljDB3p/20xE/C+rcOn4Q5JA=;
        b=GC5APTs67EAszlpF7LafifcZKuNxepYWH8b+V/RncHZRb6wZOJuS9Vozfpn4XY1CWw
         ey2FsqMk6vArtLvNNbMdBULUvSnsQm59KJUkpDS9Rph0S5FTbNBihb19jxZPMIYDJLnf
         /h6v7rd6LDgE6HRzI/bYMzzL04G7uxFVhKpshS+JAV0PBxNBPWItjP8e3k3osFijSROt
         Axr96Zik0XE7vTpQvFae2w5J4YxJ7THFjsjbeF3RHJGuN2xHPg4R3OfatAbZ2hqSIisT
         r+LiVV7wKYNYAkRBYAuqIFaQlrn36kePtQskW+FaOm4thtCyrLX8RfmOZhHz6zavgolJ
         9FLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FKV5FQ6WkBepBlU2hbjdljDB3p/20xE/C+rcOn4Q5JA=;
        b=XFRr3PhbF9b4aZi0yME4qebrFLSIGz4WtrBvf4AmUcXv6m16p5Usl2MAi3lC+X39fH
         386IZrZAZjekvmjoiFlk0VKJJlN3BEe08eHRAijSZujfTOiUKySyQk04slHfcMQNZpjr
         7QV2zglFzCwTkuMiRasTP0JIbERB1YEyT4DmzRa/OeRzgfTjzDHAmmvhKXfStrU4y9rV
         gTymBFy5JDX52BwGCHpKayFqAbAgjTKCXzwgdR1B7C/h+okgpS0Wq1PRQ/6HfFLE3cMe
         aCHrfNKqmMl1VtnCCWwhDN5FeJtu9mxrvJGf1ehQq41aqyOH2MYufXdSl1h+vJyTVOLC
         CZLg==
X-Gm-Message-State: AOAM532eFWnHDXOvov732P36mpzmmNioa0CxxkbCiiROzTyw34oPEKyH
	mbm8UJgSr3sazoYmO5OMp0pRMg1WJ108g1oOUKI=
X-Google-Smtp-Source: ABdhPJyEdeO+KSEtgfxa8Q7OTvUrklDZGXYujWzvsmLgvRTgGBkngH7o0agKJ7kjtEdum0G/IQXc+w==
X-Received: by 2002:a17:902:70c1:b029:ef:652c:cbb5 with SMTP id l1-20020a17090270c1b02900ef652ccbb5mr26048046plt.14.1622557165911;
        Tue, 01 Jun 2021 07:19:25 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id bb18sm2307875pjb.44.2021.06.01.07.19.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 07:19:25 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 26/26] linux-firmware: upgrade 20210315 -> 20210511
Date: Tue,  1 Jun 2021 04:18:14 -1000
Message-Id: <b48cfe9148e8f9bbc942899455215e8f9c8e2728.1622556919.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1622556919.git.steve@sakoman.com>
References: <cover.1622556919.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

There were additional links and new firmware versions added but these
were not under any additional licenses.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b0562c526817501a494a3674fed006ba40c8f164)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...{linux-firmware_20210315.bb => linux-firmware_20210511.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20210315.bb => linux-firmware_20210511.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20210315.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20210511.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20210315.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20210511.bb
index 1e32d1c8b6..26091fba70 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20210315.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20210511.bb
@@ -132,7 +132,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=e21a8cbddc1612bce56f06fe154a0743 \
+                    file://WHENCE;md5=727d0d4e2d420f41d89d098f6322e779 \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -205,7 +205,7 @@ PE = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "a2348f03492713dca9aef202496c6e58f5e63ee5bec6a7bdfcf8b18ce7155e70"
+SRC_URI[sha256sum] = "2aa6ae8b9808408f9811ac38f00c188e53e984a2b3990254f6c9c02c1ab13417"
 
 inherit allarch
 
-- 
2.25.1

