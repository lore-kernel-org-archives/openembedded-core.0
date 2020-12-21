Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.37608.1608547527081205325
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Dec 2020 02:45:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=n4hCjPtw;
 spf=pass (domain: linaro.org, ip: 209.85.167.42, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f42.google.com with SMTP id m12so22529520lfo.7
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Dec 2020 02:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Vxb3OqYA7kILKSYLMb7QOpkflNs8+1209tNw4IYUuK8=;
        b=n4hCjPtwz+16GvTG6LFPdojj4HPkH6dBLtf8pwggv85V9UA4yguY5JP/gJoQhnQZZQ
         D/Xf715WE3S7F7ukHjuDywfFTQRc3NsDVa/f/tJdiE+qqwOic7zTpq/+Azb7dIzqzuRs
         EnRrmKhZx/9li4dpywwm2aPQ+q8hFfpnfEUR2zlbB56v03X0+fuFwFpBEt/0KBDR72jN
         UplysRbNo77GuMqLqxN3JeefN+q6FLa/GABPlBhaFY64NCTCcKXsarEDNQsAI1P1uV11
         71iIlyrMVvDJTwxMtgapQLWilga8R7Il0wRNRxwg3ftA/5aNhmkzUF0csWuKeAPExNYo
         eN9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Vxb3OqYA7kILKSYLMb7QOpkflNs8+1209tNw4IYUuK8=;
        b=tcDK19rtimM91W4a+g/oCLyWa2mg92cFr4cakP06McaekatDUv9RPPhbycBzEAqVji
         ITh3lO3Zx920Msk9qGdKpGB5i6Cnw2jb6fdhIYWPaymNydZMY43Lsn+u6f6fZoDKIfT8
         HIXe1Wu6u6ZvchYxn0Z3qmj22kvL4TGLH42+IT0ceIDaRSg63e1CP7Ae8NM41POgKMQ/
         EJ7UyzAafnTRBzFUpXnWJ91zL7S4jXfSp2I2fhcns//X8jDg5RWH4TG56JQn7ceLuelm
         iNS7HTyc9Igu52+e8BdoToxkjHeA3O/tKBkDgIZY03pFodL5FoHky+X/6+cMCn9oHL2K
         tBxg==
X-Gm-Message-State: AOAM532eU9pp2c/WfRHUcVJm1aOIpRVhCpbX7STYv4yiY9l41dlPtqDI
	b656+zKYyPMUORMJExH5qu4MVZODOJWRoQ==
X-Google-Smtp-Source: ABdhPJw62J7bQgCttgBbRLuL+7PAuZIbicp3ev59cvFABoOG5NTp+lHshwJeqWemzQL14N2gkqRE3A==
X-Received: by 2002:a05:6512:94f:: with SMTP id u15mr6011668lft.389.1608547525083;
        Mon, 21 Dec 2020 02:45:25 -0800 (PST)
Return-Path: <dmitry.baryshkov@linaro.org>
Received: from umbar.lan ([188.162.64.15])
        by smtp.gmail.com with ESMTPSA id y124sm1986793lff.104.2020.12.21.02.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 02:45:24 -0800 (PST)
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH 2/2] linux-firmware: package firmware for Lontium lt9611uxc bridge
Date: Mon, 21 Dec 2020 13:45:21 +0300
Message-Id: <20201221104521.3661081-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221104521.3661081-1-dmitry.baryshkov@linaro.org>
References: <20201221104521.3661081-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Package firmware for Lontium lt9611uxc DSI to HDMI bridge, found e.g. on
Qualcomm RB5 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4d16922943ffa6003d611c367b934d199c549c4c)
---
 .../linux-firmware/linux-firmware_20201218.bb          | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20201218.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20201218.bb
index bc9daa2d4e7e..700a79b118a7 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20201218.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20201218.bb
@@ -31,6 +31,7 @@ LICENSE = "\
     & Firmware-iwlwifi_firmware \
     & Firmware-IntcSST2 \
     & Firmware-kaweth \
+    & Firmware-Lontium \
     & Firmware-Marvell \
     & Firmware-moxa \
     & Firmware-myri10ge_firmware \
@@ -94,6 +95,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.it913x;md5=1fbf727bfb6a949810c4dbfa7e6ce4f8 \
                     file://LICENCE.iwlwifi_firmware;md5=3fd842911ea93c29cd32679aa23e1c88 \
                     file://LICENCE.kaweth;md5=b1d876e562f4b3b8d391ad8395dfe03f \
+                    file://LICENSE.Lontium;md5=4ec8dc582ff7295f39e2ca6a7b0be2b6 \
                     file://LICENCE.Marvell;md5=28b6ed8bd04ba105af6e4dcd6e997772 \
                     file://LICENCE.mediatek;md5=7c1976b63217d76ce47d0a11d8a79cf2 \
                     file://LICENCE.moxa;md5=1086614767d8ccf744a923289d3d4261 \
@@ -161,6 +163,7 @@ NO_GENERIC_LICENSE[Firmware-IntcSST2] = "LICENCE.IntcSST2"
 NO_GENERIC_LICENSE[Firmware-it913x] = "LICENCE.it913x"
 NO_GENERIC_LICENSE[Firmware-iwlwifi_firmware] = "LICENCE.iwlwifi_firmware"
 NO_GENERIC_LICENSE[Firmware-kaweth] = "LICENCE.kaweth"
+NO_GENERIC_LICENSE[Firmware-Lontium] = "LICENSE.Lontium"
 NO_GENERIC_LICENSE[Firmware-Marvell] = "LICENCE.Marvell"
 NO_GENERIC_LICENSE[Firmware-mediatek] = "LICENCE.mediatek"
 NO_GENERIC_LICENSE[Firmware-moxa] = "LICENCE.moxa"
@@ -298,6 +301,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-qcom-adreno-a3xx ${PN}-qcom-adreno-a530 ${PN}-qcom-adreno-a630 \
              ${PN}-qcom-sdm845-audio ${PN}-qcom-sdm845-compute ${PN}-qcom-sdm845-modem \
              ${PN}-amlogic-vdec-license ${PN}-amlogic-vdec \
+             ${PN}-lt9611uxc ${PN}-lontium-license \
              ${PN}-whence-license \
              ${PN}-license \
              "
@@ -402,6 +406,12 @@ FILES_${PN}-radeon = " \
 
 RDEPENDS_${PN}-radeon += "${PN}-radeon-license"
 
+# For lontium
+LICENSE_${PN}-lt9611uxc = "Firmware-Lontium"
+
+FILES_${PN}-lontium-license = "${nonarch_base_libdir}/firmware/LICENSE.Lontium"
+FILES_${PN}-lt9611uxc = "${nonarch_base_libdir}/firmware/lt9611uxc_fw.bin"
+
 # For marvell
 LICENSE_${PN}-pcie8897 = "Firmware-Marvell"
 LICENSE_${PN}-pcie8997 = "Firmware-Marvell"
-- 
2.29.2

