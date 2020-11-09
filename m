Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
 by mx.groups.io with SMTP id smtpd.web10.6197.1604890625277705994
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2020 18:57:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=mQq6ZYsg;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.195, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f195.google.com with SMTP id v12so6669616pfm.13
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2020 18:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=6+r1bqtrPMGaV5utfo7SzPTznA0gdo2bZ5JbWReOBnc=;
        b=mQq6ZYsgrfnniqSNeg7rFu5SgHsrNSOUzJJLPwdu3vesv9EkeXpuKf1yJfL9zDHIQ+
         MU5Pq4XYPdfkDEifYIGMUpvBXRgeoyxuXkcbYmJmYbK+m3AgQr7gep8x3220CBd3N2GF
         hNMSX0Xk2DydAc3GKbFZJHYdpTkSKAmQCoEh09jZuSIsKc356qhASJkQqVXtCNm1uMvD
         2xqNhjSEuXaZP50aDig16O0ZPo8S5jzcxmJCH4firvi0rO3J+psYdxq8ejaBjrlWqr4N
         BZPSOWv6vSTIR838jhSHrVtd0+KKJzrc0KtYFpvsQtn/MYLqnXEOP2j2QklHzazdYwQc
         MyOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=6+r1bqtrPMGaV5utfo7SzPTznA0gdo2bZ5JbWReOBnc=;
        b=uoRSAwLGgZ4m8UMoTXNHWy9Zx7gm1xT/glV3ofdZ+Q3wzorQ5s29by2+vgyvtU1BaM
         UL4FlbbwvemPMqs+eZ0ZAVY3hM94m+BwFCy+yQKyMROROnUKiuzfaGSZSg+HkiZhJmev
         IAjoiy/fpYtyNKk25LrsyZC5MDdw2Fp87kXBnTA18sy2AA2KA+3yr/gG97BFVzNol27x
         m6G94XXpUK4niOzgGiBkvF5cnKv7aEnbtwxFb2nt+K+tZLaTFv6HYOB4E9kaS4wdNSgZ
         P5N6dq3uRqvsG/lqVuE3/oFEx4RmLYJ4DACjU5leEVzR9U8Cb2MlbrMMqCrhdc2w4Vox
         fWXg==
X-Gm-Message-State: AOAM531PR16EDgNrAFcpHFPv4WTpRYas0LEp2NljnCTeosSvCsqw897W
	3VPWIa/HnyOBNEc0lteKoYD1CvYyrI42dpjC
X-Google-Smtp-Source: ABdhPJyVhXWudqQesBtLJithq9XY2tJQfC/fPaBWd2JUHpSQqH2jHLMHu+D8nn6bxGZx+LuiY/ZMfQ==
X-Received: by 2002:a17:90a:d3d5:: with SMTP id d21mr10541330pjw.168.1604890624486;
        Sun, 08 Nov 2020 18:57:04 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s4sm9107037pjp.17.2020.11.08.18.57.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2020 18:57:03 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/12] linux-firmware: package marvel sdio 8997 firmware
Date: Sun,  8 Nov 2020 16:56:12 -1000
Message-Id: <37a815399aaa216b1c498dd8b82416c4df471755.1604890441.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1604890441.git.steve@sakoman.com>
References: <cover.1604890441.git.steve@sakoman.com>

From: Max Krummenacher <max.oss.09@gmail.com>

Add package for the firmware required by the Marvell 8997 chipset when
connected over SDIO.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d8b69d826702db9f5a3482754db8967c924a156d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.17.1

