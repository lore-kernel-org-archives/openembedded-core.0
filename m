Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F06FC4167B
	for <webhook@archiver.kernel.org>; Sat, 26 Nov 2022 14:15:06 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.70814.1669472102717248967
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Nov 2022 06:15:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=cIgczd2J;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id md8so1713300pjb.4
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 06:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uknTsxd9yseChXNo9M3Hy/cBk4n02keF2F+rs7SIRZo=;
        b=cIgczd2JUck/hP1ONBA+aVTZQt9HhWy1Et+d7xvC9tKNhc08qJE0xzgn8Mf3uS2VN0
         F1kgTr05CEQc5ISbC2o2FkGIH+a9yt1BzbkiVeQ+p2t427LdeFaYc6iKpvj1B+YPS+vl
         ntI+kDwS2v6eAplvVVSa0jq31B+fqxjBhagFs/gT3VmAQzkNZTcpziFRxkdeTP8bVwpG
         0TiD8zYqICIJe3tj2OPD3M+cHnhImBrVN0xa1J1G06RpsU/MWQK7N2Oi5fH8N/4RD/UO
         r0UZ/JlzUBUnwAbW5PaxxNpjwSDTN4c+GRpnZOBzBuqdB/9NVUewW0XtuUVk/Zo6n67o
         p2AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uknTsxd9yseChXNo9M3Hy/cBk4n02keF2F+rs7SIRZo=;
        b=wYFZEZMS1otiiU3/6l5sFonEeaFFMVAqWvCwE+11TuibmL0SKHyjy8a5Mr65VO8W/R
         UB/G2j9zQNyA4aCGIBtT1guWzv/AG7dBSqo9eU8CimuvNJfLtJfkpwOgIeYegBZiBg3g
         iFDVwZ8ogEaR7LVU0CmT0g0lTcRes/EL8vPFCVVjIQW3F4Lm0gvi0UFS9UVy1eq1FVtb
         87L6VK+vjWBxTFn7TKYnUhbq3ia3k127AE68vDk5XIwfUdN0y/i3Ecfcj1GXUe4gARXv
         czpFr74wHcnvaPvRBgMbO9pf9j6VIxM7s4ETr5pGqDGiv/A4rohatOJZAR7/g9/vZhua
         frKg==
X-Gm-Message-State: ANoB5pn+uLVNLuGXs6n/74/H4J8QoH0V4O004HZ4mHYdEPTa3+DvaiB0
	81+Z0ueiTrWWCcOf46qeNkZN92ki9sPo3p/E/5o=
X-Google-Smtp-Source: AA0mqf5EdlYwY6TgGJ2uywEeaLhOYv2xYQ0qVnq9M+JUVeDJLJmRHZxqto69Q0X5ZYrLFPRSE2SixA==
X-Received: by 2002:a17:902:ec01:b0:186:878e:3b0d with SMTP id l1-20020a170902ec0100b00186878e3b0dmr23340466pld.149.1669472101775;
        Sat, 26 Nov 2022 06:15:01 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id im22-20020a170902bb1600b001895f7c8a71sm4649177plb.97.2022.11.26.06.15.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 06:15:01 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 02/37] linux-firmware: upgrade 20220913 -> 20221012
Date: Sat, 26 Nov 2022 04:14:06 -1000
Message-Id: <75b852fa9cce9c331821aed9018eeb1679f58f2b.1669471990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669471990.git.steve@sakoman.com>
References: <cover.1669471990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 14:15:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173795

From: Alexander Kanavin <alex.kanavin@gmail.com>

License-Update: copyright years, additional firmwares

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 9f658c724b6635e5745f30b25601bcc51a004be4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...inux-firmware_20220913.bb => linux-firmware_20221012.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20220913.bb => linux-firmware_20221012.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20221012.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20221012.bb
index 8f921e2d0e..6ba59a34c2 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20221012.bb
@@ -71,7 +71,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.adsp_sst;md5=615c45b91a5a4a9fe046d6ab9a2df728 \
                     file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31 \
                     file://LICENSE.amdgpu;md5=44c1166d052226cb2d6c8d7400090203 \
-                    file://LICENSE.amd-ucode;md5=3c5399dc9148d7f0e1f41e34b69cf14f \
+                    file://LICENSE.amd-ucode;md5=6ca90c57f7b248de1e25c7f68ffc4698 \
                     file://LICENSE.amlogic_vdec;md5=dc44f59bf64a81643e500ad3f39a468a \
                     file://LICENCE.atheros_firmware;md5=30a14c7823beedac9fa39c64fdd01a13 \
                     file://LICENSE.atmel;md5=aa74ac0c60595dee4d4e239107ea77a3 \
@@ -132,7 +132,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "98ecc3d3223df7ebdc23b0ec56aafb20"
+WHENCE_CHKSUM  = "d6d9d74a344a78028e6b0f1df80db14b"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -209,7 +209,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "26fd00f2d8e96c4af6f44269a6b893eb857253044f75ad28ef6706a2250cd8e9"
+SRC_URI[sha256sum] = "e9d174af729511c8cccb60ec4e0b223b3c44b67d813b42d1ab9813acfa667fa5"
 
 inherit allarch
 
-- 
2.25.1


