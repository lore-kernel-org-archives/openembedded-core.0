Return-Path: <sabeeh-khan@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C705C021B3
	for <webhook@archiver.kernel.org>; Sat, 14 Sep 2024 20:18:30 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.102666.1726345108569031717
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Sep 2024 13:18:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=TfNaiPNc;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: sabeeh-khan@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 48EKIRCE023759;
	Sat, 14 Sep 2024 15:18:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1726345107;
	bh=sSoEt5MzwZqJlinm6s3gggK3ysKuQvdRozCZwuqP7Bc=;
	h=From:To:CC:Subject:Date;
	b=TfNaiPNcm4dweGvfi4nDHnPyScncuPKaqmnQZ85IGb03a612n33yr4/3mI0BOQfMn
	 EFZU+/4N/skvXQ73Dz+VWiF575bxyHAPLULtoP/5dw8AD7M9bW5kZmiutGXYOgTSbn
	 pijUyI4y59dcib02mnbFsFFegyabqyUrupMBCEww=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 48EKIRO9106437
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 14 Sep 2024 15:18:27 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 14
 Sep 2024 15:18:27 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 14 Sep 2024 15:18:27 -0500
Received: from thinkstationp3.dhcp.ti.com (thinkstationp3.dhcp.ti.com [128.247.83.36])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 48EKIRln022974;
	Sat, 14 Sep 2024 15:18:27 -0500
From: Sabeeh Khan <sabeeh-khan@ti.com>
To: <openembedded-core@lists.openembedded.org>
CC: Otavio Salvador <otavio.salvador@ossystems.com.br>,
        Sabeeh Khan
	<sabeeh-khan@ti.com>
Subject: [master][PATCH] linux-firmware: add new package for cc33xx firmware
Date: Sat, 14 Sep 2024 15:17:17 -0500
Message-ID: <20240914201716.2624053-1-sabeeh-khan@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Sep 2024 20:18:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204496

Add the firmware package for the TI CC33xx firmware.
The TI CC33xx family are combo WLAN and BLE devices
supporting 802.11ax and BLE 5.4.

Signed-off-by: Sabeeh Khan <sabeeh-khan@ti.com>
---
 .../linux-firmware/linux-firmware_20240909.bb             | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20240909.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20240909.bb
index 5ec57b7e3b..4bcda67c8f 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20240909.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20240909.bb
@@ -281,7 +281,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-moxa-license ${PN}-moxa \
              ${PN}-sd8686 ${PN}-sd8688 ${PN}-sd8787 ${PN}-sd8797 ${PN}-sd8801 \
              ${PN}-sd8887 ${PN}-sd8897 ${PN}-sd8997 ${PN}-usb8997 \
-             ${PN}-ti-connectivity-license ${PN}-wlcommon ${PN}-wl12xx ${PN}-wl18xx \
+             ${PN}-ti-connectivity-license ${PN}-wlcommon ${PN}-wl12xx ${PN}-wl18xx ${PN}-cc33xx \
              ${PN}-ti-keystone-license ${PN}-ti-keystone \
              ${PN}-vt6656-license ${PN}-vt6656 \
              ${PN}-rs9113 ${PN}-rs9116 \
@@ -935,6 +935,7 @@ RDEPENDS:${PN}-wl1251 += "${PN}-wl1251-license"
 LICENSE:${PN}-wlcommon = "Firmware-ti-connectivity"
 LICENSE:${PN}-wl12xx = "Firmware-ti-connectivity"
 LICENSE:${PN}-wl18xx = "Firmware-ti-connectivity"
+LICENSE:${PN}-cc33xx = "Firmware-ti-connectivity"
 LICENSE:${PN}-ti-connectivity-license = "Firmware-ti-connectivity"
 
 FILES:${PN}-ti-connectivity-license = "${nonarch_base_libdir}/firmware/LICENCE.ti-connectivity"
@@ -957,8 +958,13 @@ FILES:${PN}-wl18xx = " \
   ${nonarch_base_libdir}/firmware/ti-connectivity/wl18* \
 "
 
+FILES:${PN}-cc33xx = " \
+  ${nonarch_base_libdir}/firmware/ti-connectivity/cc33* \
+"
+
 RDEPENDS:${PN}-wl12xx = "${PN}-ti-connectivity-license ${PN}-wlcommon"
 RDEPENDS:${PN}-wl18xx = "${PN}-ti-connectivity-license ${PN}-wlcommon"
+RDEPENDS:${PN}-cc33xx = "${PN}-ti-connectivity-license"
 
 # For ti-keystone
 LICENSE:${PN}-ti-keystone = "Firmware-ti-keystone"
-- 
2.34.1


