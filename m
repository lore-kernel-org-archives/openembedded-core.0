Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24DA8CCA48A
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 08:45:15 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web09.51383.1658306706167762581
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EB6MgZ5C;
 spf=pass (domain: gmail.com, ip: 209.85.208.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id t3so22903167edd.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x0bOCrE/vrmPRYdKTnsphhQVhX794nPbGUiESsleMSE=;
        b=EB6MgZ5C0JXbZokNfn30vTz4dFQNzKYC8ulOgVtgroYe3THazb2IkScm8uYaNug8Hu
         NQxFt+rMO8HzwaWd+d2JXkMnjz0AYTu+v6eSyU1H/7cqoxUa4RbJvld3YCchxAVSIDJf
         +cQVsgysF7iLAk7Ax98pbZAYKTgQt2hlMr44svkaGY0lfO7TqxeSaLMq05JnA9WUc9OH
         9LCz+SFX40RoGH9OxYVb8MEb2qMJ/uMi0UhCrrgakTxi9t455krjHJVrUBQ7ZD+HYQaB
         8KzZk1cANI7nxGiLNEiIurTTCRH0sxIQIqldfb0jHnk8UN6PVOrLG93+Gl8r4abDV+pu
         GKpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x0bOCrE/vrmPRYdKTnsphhQVhX794nPbGUiESsleMSE=;
        b=vsV06E5dZPSvk0Vp4j5m5gpT3R+KGLHmKhZht7/LXW9phPczBOT8t5T++l2SE/qELd
         +NUb9ZeHtnP5NcRrSQ6vXqLss/m8uK2EcIDAhuULZBELL88AUwRmjEUOy96Z/8qO3bL1
         ZbjT1hzgNsyqIiN/qI5kIENgd+c5N/3+rf+1YtwzWoRrzeix0KxYnJJQh1xis32ulKVl
         f5cHZGrCmnTefrgRkeN0aFVqqFIoX6iivCk2pkajdszO9A1oudMWeKMUy90/sXM1kdpY
         88i0/W9ZJPeUvbxZpj3e4o2APuj53LYso/3jWtCDDBtKgr3o5LFXNve7AU3SKf3EPoXr
         tGKA==
X-Gm-Message-State: AJIora/NuIr3/cM2OoSkMDsDJd46YyS6KTlxTw5vsH7M5xwZAgvfTuQc
	j87ILu1vHtv0NSBbp6q/kIJZLsTbLZQ=
X-Google-Smtp-Source: 
 AGRyM1u7j/pJ50Ov4RZhoZMzJdF60WU6K68e8KobsGpsClguGjEr2tmaUtrvRUEBGbOpp//9H/EACw==
X-Received: by 2002:a05:6402:e96:b0:43a:f21f:42a0 with SMTP id
 h22-20020a0564020e9600b0043af21f42a0mr50072622eda.382.1658306704644;
        Wed, 20 Jul 2022 01:45:04 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 s9-20020a170906a18900b00722e5b234basm7781784ejy.179.2022.07.20.01.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 01:45:04 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 15/51] linux-firmware: update 20220610 -> 20220708
Date: Wed, 20 Jul 2022 10:44:06 +0200
Message-Id: <20220720084442.2940187-15-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220720084442.2940187-1-alex@linutronix.de>
References: <20220720084442.2940187-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 08:45:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168309

License-Update: a few obsolete firmware were dropped
(particularly i2400m and tda7706), file list updates.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
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
2.30.2


