Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web09.8044.1603148851588071455
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2020 16:07:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EjHdkgfo;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: max.oss.09@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id cm24so1045090edb.0
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2020 16:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l+/1yICCieWmhusiY1p/s+5roVr0kgNmhJeBmEiQJoA=;
        b=EjHdkgfoJ58mYYKO3WVNJzhYdjFJGVg11BxgsF06458hkxZTp99x7t8L+cOGebwtsi
         KjAzAb37UbAxsWTqyrFSir+e3A6H42H3Hlev6VJPAGxY36pQIR20bR1kPc6p2tpBYHVr
         rhj5tRjsR1D7GAL58zF2JYV05bXbDfMTPWcL2LHKpRtuMyWGo8HPqv4M6M6RjRSDeM2d
         pHTAfMDLgc8tc9UH6QXG2TVN/lAU3quGJm0xAS2XmDDlt5bcN74Uejy/eTB+i9aTM3QK
         kVTt3kgt+w5hADmKm3KOlxoVJDHRjMRHkcnM9CfFboZmzfmyvcUHHCsBa4EshYtfp/QK
         V7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l+/1yICCieWmhusiY1p/s+5roVr0kgNmhJeBmEiQJoA=;
        b=e6RxBSxoi39CNcXXROpemghPPUxOAWvcDmJWS2nkKDx9v9T3RPjTRDGvxc9nrwO2ZL
         ABHdFkBSRwDU0gZdeHMF9+UHjC8xJqhLNPk4sos498HhxdTS44lmSWCSXN3QPmvfO1ph
         AFHH4RJb5x75xByDyVULK2acqB4C96NYLQur630g9KHQa5IvAg/oxZy71u449Az/6sa5
         IX13MfjJwVXX9eCNZHdr72smMSK9atmm4zDIE5KvUzeE0Ee+hMcTLFSN8wUqZ0WYDFWb
         jtdc02opv8SrASJnFiXFbrVBsSCoJgpwGKTjJyoTRYPIHgdCTZh80NnhZITaqWgqr/8M
         2dXQ==
X-Gm-Message-State: AOAM531QbzH6OuIw8owKMwd/HNNU5YhvVnW286NprfY1FszdeFNHd3SH
	EzIRoPmxy3NzBcjtTdNJo3S+4V6Z3Y8=
X-Google-Smtp-Source: ABdhPJyxZ/VIG7NU/xwAAUD5zs6cUFXAkvX41Dtt0oBYBtB673jUOiujYlVLOW2Q6x5Go4WFjagw1w==
X-Received: by 2002:a50:aa84:: with SMTP id q4mr2203095edc.331.1603148849849;
        Mon, 19 Oct 2020 16:07:29 -0700 (PDT)
Return-Path: <max.oss.09@gmail.com>
Received: from linuxdev2.toradex.int (31-10-206-124.static.upc.ch. [31.10.206.124])
        by smtp.gmail.com with ESMTPSA id k9sm1765183ejv.113.2020.10.19.16.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 16:07:29 -0700 (PDT)
From: "Max Krummenacher" <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-core@lists.openembedded.org
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [OE-core][PATCH v2 1/2] linux-firmware: package marvel sdio 8997 firmware
Date: Tue, 20 Oct 2020 01:06:07 +0200
Message-Id: <20201019230608.47668-1-max.krummenacher@toradex.com>
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

