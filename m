Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 609DF78DEC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 20:02:04 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id p81-v6so21755043itp.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 13:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=wj98XhMi7+EOhNrCJ/MaZ2OZN0Ckd3KdVSFRhkrI3TY=;
	b=SOxZhMLGHVQsLZ88I04O3bZ99P6QHBUt5zv1RX3k/BMnQOLVsldRzb/iIB1Nf9RBQ8
	hREmsmGzZAHPeYm2r/vHuZzJM3h9AIam8Lh46//jQJQB3df6huKquGFrJ6/+EjQnPf7m
	1oEKRjxd7Q3Isbf8zjeOlk7yVNnNXugATXrVltvStN08NQ3QKon5hL+gk/sx22MUTPmr
	hLTvFdF34pGki+twz3EFqqng/Ek8JIwa8W65jvyA6XKbGu0BrlsiWFMIoYEoL7UzqUhe
	KYRB6TK58reWZkL8VMd3Qrj2zBkdiEljpVCoJq+sdQC967kWfhqxBZABE9xUvlo9qObS
	HDLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wj98XhMi7+EOhNrCJ/MaZ2OZN0Ckd3KdVSFRhkrI3TY=;
	b=HpmjC7nPOTMxDOmsIhZ88GzEyHhUDrme1Ha7CTb3MUZrrIv11xbBF4DiEra/p7tdIz
	yEZxu4NOVQMyEnmrACq1esctEgM5qFVhHyHHmub3UUF3BwzLXbTxUtgLlzg2v690OD00
	zDTv3tdemFE2/QC/cdv9YW1ckg5rWWG/2+qcIoSQMOnIeVQ1W4SI3Wr02QVk5vqb+wwl
	R1Hv7VLHrQcZr5/jJdJPE5Oidw/WKykNGeqVVPGFjk/vxFFKb1nIG54eU+BpOVOwlzIe
	DmB4hMxv/K0cDVnzOzpNczcHsxAmQE0xwvDjbBSnSUsBCXQyP7C9SIhcWP0NEZp086xh
	d66Q==
X-Gm-Message-State: AOUpUlEGNaQnfW/xHDkYr4GgziVmeAZGbg1ui7/9O8RK03eEAY64I5qe
	NUMVlj+96L3rF2dh3udlM7oP5Ksu
X-Google-Smtp-Source: AA+uWPxSBiFEG3L1bYp2gg2XX8o720SoPLRloza+dPgndqLnae8XzizbQDAg1DFfpR88L8QP44welA==
X-Received: by 2002:a24:22cf:: with SMTP id
	o198-v6mr15989753ito.53.1534276925121; 
	Tue, 14 Aug 2018 13:02:05 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	b11-v6sm9066438ioc.16.2018.08.14.13.02.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 14 Aug 2018 13:02:04 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2018 15:01:51 -0500
Message-Id: <20180814200151.21169-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>
Subject: [PATCH] linux-firmware: package Marvel usb 8997 firmware
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Aug 2018 20:02:04 -0000

Add package for the firmware required by the Marvell 8997 chipset when
connected over USB.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index cf7abb0f96a..69f9a2adeab 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -232,6 +232,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-radeon-license ${PN}-radeon \
              ${PN}-marvell-license ${PN}-pcie8897 ${PN}-pcie8997 \
              ${PN}-sd8686 ${PN}-sd8688 ${PN}-sd8787 ${PN}-sd8797 ${PN}-sd8801 ${PN}-sd8887 ${PN}-sd8897 \
+             ${PN}-usb8997 \
              ${PN}-ti-connectivity-license ${PN}-wl12xx ${PN}-wl18xx \
              ${PN}-vt6656-license ${PN}-vt6656 \
              ${PN}-rtl-license ${PN}-rtl8188 ${PN}-rtl8192cu ${PN}-rtl8192ce ${PN}-rtl8192su ${PN}-rtl8723 ${PN}-rtl8821 \
@@ -409,6 +410,7 @@ LICENSE_${PN}-sd8797 = "Firmware-Marvell"
 LICENSE_${PN}-sd8801 = "Firmware-Marvell"
 LICENSE_${PN}-sd8887 = "Firmware-Marvell"
 LICENSE_${PN}-sd8897 = "Firmware-Marvell"
+LICENSE_${PN}-usb8997 = "Firmware-Marvell"
 LICENSE_${PN}-marvell-license = "Firmware-Marvell"
 
 FILES_${PN}-marvell-license = "${nonarch_base_libdir}/firmware/LICENCE.Marvell"
@@ -443,6 +445,9 @@ FILES_${PN}-sd8887 = " \
 FILES_${PN}-sd8897 = " \
   ${nonarch_base_libdir}/firmware/mrvl/sd8897_uapsta.bin \
 "
+FILES_${PN}-usb8997 = " \
+  ${nonarch_base_libdir}/firmware/mrvl/usbusb8997_combo_v4.bin \
+"
 
 RDEPENDS_${PN}-sd8686 += "${PN}-marvell-license"
 RDEPENDS_${PN}-sd8688 += "${PN}-marvell-license"
@@ -451,6 +456,7 @@ RDEPENDS_${PN}-sd8797 += "${PN}-marvell-license"
 RDEPENDS_${PN}-sd8801 += "${PN}-marvell-license"
 RDEPENDS_${PN}-sd8887 += "${PN}-marvell-license"
 RDEPENDS_${PN}-sd8897 += "${PN}-marvell-license"
+RDEPENDS_${PN}-usb8997 += "${PN}-marvell-license"
 
 # For netronome
 LICENSE_${PN}-netronome = "Firmware-netronome"
-- 
2.17.1


