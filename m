Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.4055.1609193791956501462
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 14:16:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=iC+EICwy;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id n25so8077365pgb.0
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Dec 2020 14:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=/AX27MmWLNabkXuOk085b1QKU7nQaWcI0BcG1tjhAcE=;
        b=iC+EICwyfPEfpXD+wZ1mCWGKkGzUoiiVvuOSKHhNo/XSYOfZIVyueGDueKd64LxWhA
         p54sCwYSiuCxN+Ni/th46lMCc3ydqecHAJpMiFtY0sBBrsCzuO2xFHDxM6W804P5clUv
         hcxxlk1oytkiGzwQ0noRDlZHCd6lCpg2EzmrFms5mtj4nVXTdEXh7OfiTmqvih990hVI
         tpXPOwSLviIhw98DYu4u02uVZSU3ATSLaLMpaoEhG6TzLkAHGQn6JrQr2Jb5mXNwF/5b
         D3iGetHca3d7keYhwsLRLab43FO+o5axWvyaL8icXD6XibzN7LuTwDiwM5q+GntNn0uT
         oiQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=/AX27MmWLNabkXuOk085b1QKU7nQaWcI0BcG1tjhAcE=;
        b=Ta9scMW2CbNGXWY1co+bHxkecuNkAWyuOTbtbeDaUEqfabTahh2YT6mzUIqhDMXdtX
         IjtKKl8BBBTG4ysGsDMVep/i8EUVYXD098XCu3poJGuNkfbVVo2WqDW7lXPT+zXLC078
         ScFsVnXY8HRH3wSbEhKJiUoyrhpfDqYabnuQEP09jjaFdxnAgJBigS4ZXiAE5YnCHsFw
         cq1wr9b9Q/u3BoSFLzsX+rO0zeso0U0556v7BsGLgI6E4xARI080SsdQFJ+eX26cLiYx
         YklnpWyLoUBWyfllpGmIBtPuLH1qouvCbctiQ+EfCv+tL3EZ/UenEl/ZRIWMJ1sQdoOI
         mrLA==
X-Gm-Message-State: AOAM530wnOKMtNOpAgwGODx1DmmPbnCNgRs1V2ryjBvsyxx1L244sFxX
	z2pb0VQbnp2wKdHdkFz92pG5B53HK4Th6LOx5Z0=
X-Google-Smtp-Source: ABdhPJzAqjvdIsxy/HFY8iMyRVrsCgBd+3WvBSUwWxCDX3ub64dOfVYC+TOMRPi7GFSfDDEnslrJQA==
X-Received: by 2002:a63:3d4b:: with SMTP id k72mr45094231pga.241.1609193791057;
        Mon, 28 Dec 2020 14:16:31 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id o32sm41425455pgm.10.2020.12.28.14.16.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 14:16:30 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/17] linux-firmware: package firmware for Lontium lt9611uxc bridge
Date: Mon, 28 Dec 2020 12:15:47 -1000
Message-Id: <e0dbe716b580b8b8628b81bc5a2d75bb8c1e2489.1609193554.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609193554.git.steve@sakoman.com>
References: <cover.1609193554.git.steve@sakoman.com>

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Package firmware for Lontium lt9611uxc DSI to HDMI bridge, found e.g. on
Qualcomm RB5 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4d16922943ffa6003d611c367b934d199c549c4c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux-firmware/linux-firmware_20201218.bb          | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20201218.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20201218.bb
index bc9daa2d4e..700a79b118 100644
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
2.17.1

