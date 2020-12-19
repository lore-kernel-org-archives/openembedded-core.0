Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web08.8487.1608383059743825565
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Dec 2020 05:04:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hHdREC3c;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: dbaryshkov@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id h22so3051620lfu.2
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Dec 2020 05:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iOKNOTiUnJHKJYJJbdK6fXkBsnkJV6N4EHNRUH3dOgM=;
        b=hHdREC3cpggx4F1/2ZFq/yb4uuBBD9kkU55GRMBYhWkf8RCko8t3XpnmCZwTgUNcwx
         WPfQ3q08SFp3n+A9KORvg2hoIUmXBTLarqZJ2tuHGFAUA9eV36NsE8uanaWTBoqEOIgB
         5U5xZduYvjwkyWacymWUGdX3Cz/8iK0LrLnEv4cNPtojC0uknmb5IMOTEGoei0YsNKrv
         OccS4hbECC1ZKheA3kxpZsKGWhsa2vuHvuLXBzILeXNXiWsUgWiQf7bIcZc2Be9mb6s1
         Qg8smKxLWNZQqNaQRjZu0nkF744MLmirbmjB4iB05WGHvy2OLh1XozJcB/+NK5sAhFU2
         Ht+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iOKNOTiUnJHKJYJJbdK6fXkBsnkJV6N4EHNRUH3dOgM=;
        b=DovcZzyJJHJ7kWu1XiHaOVWkR7Lc1xlyUWCJku+lKlAPgZPQTMLaAlt3qji23OFWfA
         SoX+JvagWxFntdvHhUqmhgR0cL5a0t01OiSzK/4ytkQMDu7TY+Iz7cMwKa9qeNglbUgo
         7yz5P309X6ZhBrTLfwUS0EJcLv+07z9ibcI9B/bSbukAdqNZ8WUrsNJJIUSDzgllYt+l
         7KgUcB24p7QgcWoH0qYbaoW+3PlO//rIwvK/cOpIESaVa63E9AlEQifpDCvtpDuRc/vP
         KYzgxv47GOBAdynpExXlUWQCJxYELXBixjyKOmwSpblAzmd32GZnuWehIgy1kIDQ7nJL
         z07w==
X-Gm-Message-State: AOAM532oaY/f6VfwG47++riggQKO7JbIKaHTwJTcEg2VtxEdukeS5B9N
	8zNdWliyPfRZSExjm2XdpkefYRGIkfSjfw==
X-Google-Smtp-Source: ABdhPJxDy1lvm1hBg+1YPXXwiAyEhfC7PbjBunsYFG6bCtGcYDTiONiRMZ2sA2Am0sJfDAu1doNZ5w==
X-Received: by 2002:a19:4941:: with SMTP id l1mr3242261lfj.80.1608383057923;
        Sat, 19 Dec 2020 05:04:17 -0800 (PST)
Return-Path: <dbaryshkov@gmail.com>
Received: from umbar.lan ([94.25.228.250])
        by smtp.gmail.com with ESMTPSA id u30sm1284646lfc.238.2020.12.19.05.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Dec 2020 05:04:17 -0800 (PST)
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 2/2] linux-firmware: package firmware for Lontium lt9611uxc bridge
Date: Sat, 19 Dec 2020 16:04:15 +0300
Message-Id: <20201219130415.99713-2-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201219130415.99713-1-dbaryshkov@gmail.com>
References: <20201219130415.99713-1-dbaryshkov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Package firmware for Lontium lt9611uxc DSI to HDMI bridge, found e.g. on
Qualcomm RB5 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

