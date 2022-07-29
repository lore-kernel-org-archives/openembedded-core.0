Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93058C19F29
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 14:47:58 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.63.1659106071338299079
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:47:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=m03PwXWA;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id 12so4207194pga.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=dMz1TClVEgVlT7kwSaP1lYBSC6+EbzcEHR/sTAZq/Ms=;
        b=m03PwXWAKyaqLmTqlxfbTCq4r3TS9WU8GzsLikjf9H51sRQVPmMzjC//ox5lyiVMmv
         lh3D4kvmu5Uy9DoQdjpc16dFYMLnPhnDL3HxXxedlo+EURMACW6NyTcaV0ZRK93c73bO
         FQCOFpz99DGdIaXL7B8vYi9/IpPB3l/IpFJvZZgJbJvhFB6cCcopHHcIgJHwxwQtyuVh
         7qPhhMHButzChyWeDdPjSD+4tzM2X2faBwDPlcg912ONoDVLtxgQUzUVubVTzJB+a8Ai
         den072GVrqmX5PYGXMMsxOmvZHcxgffb3FI3XauABUqOObcvFfw2QDrD6gCtb9d3o9fh
         qgug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dMz1TClVEgVlT7kwSaP1lYBSC6+EbzcEHR/sTAZq/Ms=;
        b=lCGlZLIZMZkeGRC9eBnxD50Tmtemeu40MhW88OcZbdr94oZEvdUHuqpjhTL+G0OEaJ
         G5VOQocCW1xhPOZNfJFjvMOGn3zO81rPuH1XmEmBedQIPK4n6bfMT5utnkNGhLok8RkR
         QlOc9LccWYp21NiJaFX8OvVDJ5WbkBJAE/Sjqb1PiIG/1i6XofoLOZUpfF0j+GYhGXEe
         6NUrN3uQoN6f3lk4So2rfQfovyRIsAkwWzZ6u3eEuVxSJ/8QK3C4t+A7FCq7dzUUd4dz
         YenwSYoqx2ZlN5cdTeDzOHvC33LCEAP9AkHPQxyi+0U0674MkNoFuGC1Jucd6AlhAXVN
         dK4Q==
X-Gm-Message-State: AJIora/xXLG0wQPtYlTW8YaML3SVpWZDwPVmYLMEczmpFbp6knFT1VHc
	ymJyjxaiCL8W1no793xoFT3QR+kR+o0dSyKS
X-Google-Smtp-Source: 
 AGRyM1siv1TGW3VFFsVj5+VE2xefJW0IOFlGbmJjgH8uykxllxi17nGxOPyzo0AnASOb+c+ldxalFg==
X-Received: by 2002:a63:e348:0:b0:41b:444f:ff5f with SMTP id
 o8-20020a63e348000000b0041b444fff5fmr3144633pgj.333.1659106070291;
        Fri, 29 Jul 2022 07:47:50 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x24-20020aa79418000000b00528c6c7bf37sm2958782pfo.129.2022.07.29.07.47.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 07:47:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/29] linux-firmware: update 20220610 ->
 20220708
Date: Fri, 29 Jul 2022 04:46:28 -1000
Message-Id: 
 <c74c2658e5451488fe3c38c7787bdfee075ab52c.1659105705.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659105705.git.steve@sakoman.com>
References: <cover.1659105705.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Jul 2022 14:47:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168647

From: Alexander Kanavin <alex.kanavin@gmail.com>

License-Update: a few obsolete firmware were dropped
(particularly i2400m and tda7706), file list updates.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e89fb37e13fcb832ee7d35e7d92d45eaca20689e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...mware_20220610.bb => linux-firmware_20220708.bb} | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20220610.bb => linux-firmware_20220708.bb} (98%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20220610.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20220708.bb
similarity index 98%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20220610.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20220708.bb
index 78b38df461..bde7178164 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20220610.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20220708.bb
@@ -27,7 +27,6 @@ LICENSE = "\
     & Firmware-go7007 \
     & Firmware-GPLv2 \
     & Firmware-hfi1_firmware \
-    & Firmware-i2400m \
     & Firmware-i915 \
     & Firmware-ibt_firmware \
     & Firmware-ice \
@@ -57,7 +56,6 @@ LICENSE = "\
     & Firmware-rtlwifi_firmware \
     & Firmware-imx-sdma_firmware \
     & Firmware-siano \
-    & Firmware-tda7706-firmware \
     & Firmware-ti-connectivity \
     & Firmware-ti-keystone \
     & Firmware-ueagle-atm4-firmware \
@@ -69,7 +67,6 @@ LICENSE = "\
     & WHENCE \
 "
 
-WHENCE_CHKSUM = "385947b278a6646ae4c3d39ba8c9b1bb"
 LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.adsp_sst;md5=615c45b91a5a4a9fe046d6ab9a2df728 \
                     file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31 \
@@ -92,7 +89,6 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.go7007;md5=c0bb9f6aaaba55b0529ee9b30aa66beb \
                     file://GPL-2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE.hfi1_firmware;md5=5e7b6e586ce7339d12689e49931ad444 \
-                    file://LICENCE.i2400m;md5=14b901969e23c41881327c0d9e4b7d36 \
                     file://LICENSE.i915;md5=2b0b2e0d20984affd4490ba2cba02570 \
                     file://LICENCE.ibt_firmware;md5=fdbee1ddfe0fb7ab0b2fcd6b454a366b \
                     file://LICENSE.ice;md5=742ab4850f2670792940e6d15c974b2f \
@@ -124,7 +120,6 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.rtlwifi_firmware.txt;md5=00d06cfd3eddd5a2698948ead2ad54a5 \
                     file://LICENSE.sdma_firmware;md5=51e8c19ecc2270f4b8ea30341ad63ce9 \
                     file://LICENCE.siano;md5=4556c1bf830067f12ca151ad953ec2a5 \
-                    file://LICENCE.tda7706-firmware.txt;md5=835997cf5e3c131d0dddd695c7d9103e \
                     file://LICENCE.ti-connectivity;md5=c5e02be633f1499c109d1652514d85ec \
                     file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c \
                     file://LICENCE.ueagle-atm4-firmware;md5=4ed7ea6b507ccc583b9d594417714118 \
@@ -133,7 +128,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=${WHENCE_CHKSUM} \
+                    file://WHENCE;md5=def08711eb23ba967fb7e1f8cff66178 \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -160,7 +155,6 @@ NO_GENERIC_LICENSE[Firmware-fw_sst_0f28] = "LICENCE.fw_sst_0f28"
 NO_GENERIC_LICENSE[Firmware-go7007] = "LICENCE.go7007"
 NO_GENERIC_LICENSE[Firmware-GPLv2] = "GPL-2"
 NO_GENERIC_LICENSE[Firmware-hfi1_firmware] = "LICENSE.hfi1_firmware"
-NO_GENERIC_LICENSE[Firmware-i2400m] = "LICENCE.i2400m"
 NO_GENERIC_LICENSE[Firmware-i915] = "LICENSE.i915"
 NO_GENERIC_LICENSE[Firmware-ibt_firmware] = "LICENCE.ibt_firmware"
 NO_GENERIC_LICENSE[Firmware-ice] = "LICENSE.ice"
@@ -191,7 +185,6 @@ NO_GENERIC_LICENSE[Firmware-ralink-firmware] = "LICENCE.ralink-firmware.txt"
 NO_GENERIC_LICENSE[Firmware-rtlwifi_firmware] = "LICENCE.rtlwifi_firmware.txt"
 NO_GENERIC_LICENSE[Firmware-siano] = "LICENCE.siano"
 NO_GENERIC_LICENSE[Firmware-imx-sdma_firmware] = "LICENSE.sdma_firmware"
-NO_GENERIC_LICENSE[Firmware-tda7706-firmware] = "LICENCE.tda7706-firmware.txt"
 NO_GENERIC_LICENSE[Firmware-ti-connectivity] = "LICENCE.ti-connectivity"
 NO_GENERIC_LICENSE[Firmware-ti-keystone] = "LICENCE.ti-keystone"
 NO_GENERIC_LICENSE[Firmware-ueagle-atm4-firmware] = "LICENCE.ueagle-atm4-firmware"
@@ -213,7 +206,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "faf3aedf89530e61f4fa1e8c7303dead9127cc24416945647797d079feb12837"
+SRC_URI[sha256sum] = "0abec827a035c82bdcabdf82aa37ded247bc682ef05861bd409ea6f477bab81d"
 
 inherit allarch
 
@@ -1033,7 +1026,6 @@ LICENSE:${PN} = "\
     & Firmware-fw_sst_0f28 \
     & Firmware-go7007 \
     & Firmware-hfi1_firmware \
-    & Firmware-i2400m \
     & Firmware-ibt_firmware \
     & Firmware-it913x \
     & Firmware-IntcSST2 \
@@ -1054,7 +1046,6 @@ LICENSE:${PN} = "\
     & Firmware-ralink-firmware \
     & Firmware-imx-sdma_firmware \
     & Firmware-siano \
-    & Firmware-tda7706-firmware \
     & Firmware-ti-connectivity \
     & Firmware-ti-keystone \
     & Firmware-ueagle-atm4-firmware \
-- 
2.25.1


