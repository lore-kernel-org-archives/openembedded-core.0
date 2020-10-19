Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web12.9936.1603100328534421481
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2020 02:38:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pR62Jjxz;
 spf=pass (domain: gmail.com, ip: 209.85.221.68, mailfrom: max.oss.09@gmail.com)
Received: by mail-wr1-f68.google.com with SMTP id n15so10623698wrq.2
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2020 02:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l+/1yICCieWmhusiY1p/s+5roVr0kgNmhJeBmEiQJoA=;
        b=pR62JjxzIhB8mwUtkTHuhZnFpSO/XzN7CQg0zhjQjJENhj1vxlVOwjdLCUWiecdwMh
         Xw6UUe7nYmuTJ++nDPEd5Mf4r6Zy4ngSwjmNDUyinf4/vaW1r6Q7O/wTgpHCfUj2UNx9
         rBVB6J9mI/5xwr8x4fWl31I/5c5gYd4oHmvYcLH8958fLNfbjTwSjvCprXv2GtomAg49
         Rb84xTdP5yycKFT0kPWiD83sEJIU6m00BkwaIy+m9td7YvTJpkf9tdKLGbnwcLz/KiAA
         1OXTxSx31SkRDGDjWhKMKUWKO5tgJE9C1P84RL/LEM5I0XWTB3iShcPzMBJxGe/yx3Fg
         ZTHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l+/1yICCieWmhusiY1p/s+5roVr0kgNmhJeBmEiQJoA=;
        b=icLVTYUa1dBqB4prOkQYT7QuH+HH2X0FQORJxnlU9OkDqo42Y0fHGFmd9su15h843P
         iQi81S23d88DLA0kImukvyREjKKYA9/yr8oD+1t8CAXaTNuG6fCbM4t1+OEE+9TGN6wc
         yzyc746dbRU7DyPV3l3+o+onMqsiIITqDwTJrDfgXIB29UvQKVh24skHTfUN8WhMIqRe
         kUwxzfG7zhq+Ro1Pa1MRJlP67HnLzghhmH+itp5lATmo8oe76+Cr+W+6ePRXMabhcLEU
         2SUcyjwkdfQbyMGBMZ/TwuSWbvtJuzK8fJv5v14Ct+wZM/n6W5P5okqWQ8D1lAj/fWaN
         GBBA==
X-Gm-Message-State: AOAM532GBJMw53dWcZXyXFhlRvFHUKKyUWmEp2b8Sa7lxSIHsHnZn9r7
	yukzcWu9uTjSl1Z7f1ARSzMrHkj338E=
X-Google-Smtp-Source: ABdhPJwCKLMfdAAvXYohqCGIevo4zzhAdeorFsA+S26tepbfKqzZ1MSduddv5bySJ8U1RQwtbAUuXg==
X-Received: by 2002:adf:e88a:: with SMTP id d10mr19632509wrm.247.1603100326764;
        Mon, 19 Oct 2020 02:38:46 -0700 (PDT)
Return-Path: <max.oss.09@gmail.com>
Received: from linuxdev2.toradex.int (31-10-206-124.static.upc.ch. [31.10.206.124])
        by smtp.gmail.com with ESMTPSA id v11sm14700081wml.26.2020.10.19.02.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 02:38:46 -0700 (PDT)
From: "Max Krummenacher" <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-core@lists.openembedded.org
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [PATCH 1/2] linux-firmware: package marvel sdio 8997 firmware
Date: Mon, 19 Oct 2020 11:38:00 +0200
Message-Id: <20201019093801.55488-1-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add package for the firmware required by the Marvell 8997 chipset when
connected over SDIO.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 .../linux-firmware/linux-firmware_20200817.bb     | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20200817.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20200817.bb
index 5c9d4c3e04..3d6644e504 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200817.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200817.bb
@@ -218,8 +218,8 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-mt7601u-license ${PN}-mt7601u \
              ${PN}-radeon-license ${PN}-radeon \
              ${PN}-marvell-license ${PN}-pcie8897 ${PN}-pcie8997 \
-             ${PN}-sd8686 ${PN}-sd8688 ${PN}-sd8787 ${PN}-sd8797 ${PN}-sd8801 ${PN}-sd8887 ${PN}-sd8897 \
-             ${PN}-usb8997 \
+             ${PN}-sd8686 ${PN}-sd8688 ${PN}-sd8787 ${PN}-sd8797 ${PN}-sd8801 \
+             ${PN}-sd8887 ${PN}-sd8897 ${PN}-sd8997 ${PN}-usb8997 \
              ${PN}-ti-connectivity-license ${PN}-wlcommon ${PN}-wl12xx ${PN}-wl18xx \
              ${PN}-vt6656-license ${PN}-vt6656 \
              ${PN}-rtl-license ${PN}-rtl8188 ${PN}-rtl8192cu ${PN}-rtl8192ce ${PN}-rtl8192su ${PN}-rtl8723 ${PN}-rtl8821 \
@@ -404,6 +404,7 @@ LICENSE_${PN}-sd8797 = "Firmware-Marvell"
 LICENSE_${PN}-sd8801 = "Firmware-Marvell"
 LICENSE_${PN}-sd8887 = "Firmware-Marvell"
 LICENSE_${PN}-sd8897 = "Firmware-Marvell"
+LICENSE_${PN}-sd8997 = "Firmware-Marvell"
 LICENSE_${PN}-usb8997 = "Firmware-Marvell"
 LICENSE_${PN}-marvell-license = "Firmware-Marvell"
 
@@ -439,6 +440,15 @@ FILES_${PN}-sd8887 = " \
 FILES_${PN}-sd8897 = " \
   ${nonarch_base_libdir}/firmware/mrvl/sd8897_uapsta.bin \
 "
+do_install_append() {
+    # The kernel 5.6.x driver still uses the old name, provide a symlink for
+    # older kernels
+    ln -fs sdsd8997_combo_v4.bin ${D}${nonarch_base_libdir}/firmware/mrvl/sd8997_uapsta.bin
+}
+FILES_${PN}-sd8997 = " \
+  ${nonarch_base_libdir}/firmware/mrvl/sd8997_uapsta.bin \
+  ${nonarch_base_libdir}/firmware/mrvl/sdsd8997_combo_v4.bin \
+"
 FILES_${PN}-usb8997 = " \
   ${nonarch_base_libdir}/firmware/mrvl/usbusb8997_combo_v4.bin \
 "
@@ -450,6 +460,7 @@ RDEPENDS_${PN}-sd8797 += "${PN}-marvell-license"
 RDEPENDS_${PN}-sd8801 += "${PN}-marvell-license"
 RDEPENDS_${PN}-sd8887 += "${PN}-marvell-license"
 RDEPENDS_${PN}-sd8897 += "${PN}-marvell-license"
+RDEPENDS_${PN}-sd8997 += "${PN}-marvell-license"
 RDEPENDS_${PN}-usb8997 += "${PN}-marvell-license"
 
 # For netronome
-- 
2.20.1

