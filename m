Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 380F460116
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 15:57:07 +0000 (UTC)
Received: by pacwq6 with SMTP id wq6so13846028pac.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Dec 2015 07:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=Fp13d6jNR0DkqK0QgRA7HEQRzG0FsdqCTma4qFFpruc=;
	b=fQEPBoWFeIh1z+xZLCH7NTABS+fECBov7Kq6nHJ/3JMea8RgDLbZx/be9U0sj2JTXb
	WfFR+L7MhkcRf6qCoOEBfe2vatTwI/B+dZnR2sUrSdxRcakVjh2PMDMJmcVTuBuS7B5Y
	3k9CylxNfKQey1kVzwXW2I6LplUIG1Pkuai6ljdApj4xbNtMYb6znuD2GPWk25uB1P64
	9Nk2D0MAvZG0q7Ud+l29zcgaoC2tcNCQc/XM0n2Frh9LLh9o9HYsZDxtvXxKqq89oAtI
	ct4/Za+ptl8HtK7Wefxx+ZTr/JQL0Bj4Qdu2VjzQzvFkegAcMQ39iyLUGATo2daVOOui
	xNLA==
X-Received: by 10.66.193.36 with SMTP id hl4mr808181pac.153.1449590228602;
	Tue, 08 Dec 2015 07:57:08 -0800 (PST)
Received: from Pahoa2.hsd1.ca.comcast.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id w8sm5641143pfi.41.2015.12.08.07.57.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Dec 2015 07:57:07 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Dec 2015 07:57:05 -0800
Message-Id: <1449590225-29133-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [PATCH] linux-firmware: update to latest
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
X-List-Received-Date: Tue, 08 Dec 2015 15:57:08 -0000

Update to latest linux-firmware
Fix ar3k license to be QualcommAtheros
Add ath10K firmware package

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../linux-firmware/linux-firmware_git.bb           | 33 +++++++++++++++++-----
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 3c5729d..76ad522 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -40,6 +40,8 @@ LICENSE = "\
     & Firmware-xc5000 \
     & Firmware-xc5000c \
     & Firmware-siano \
+    & Firmware-qualcommAthos_ar3k \
+    & Firmware-qualcommAthos_ath10k \
 "
 
 LIC_FILES_CHKSUM = "\
@@ -81,6 +83,8 @@ LIC_FILES_CHKSUM = "\
     file://LICENSE.dib0700;md5=f7411825c8a555a1a3e5eab9ca773431 \
     file://LICENSE.radeon;md5=6c7f97c6c62bdd9596d0238bb205118c \
     file://LICENCE.siano;md5=602c79ae3f98f1e73d880fd9f940a418 \
+    file://LICENSE.QualcommAtheros_ar3k;md5=b5fe244fb2b532311de1472a3bc06da5 \
+    file://LICENSE.QualcommAtheros_ath10k;md5=b5fe244fb2b532311de1472a3bc06da5 \
 "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -123,8 +127,10 @@ NO_GENERIC_LICENSE[Firmware-amd-ucode] = "LICENSE.amd-ucode"
 NO_GENERIC_LICENSE[Firmware-dib0700] = "LICENSE.dib0700"
 NO_GENERIC_LICENSE[Firmware-radeon] = "LICENSE.radeon"
 NO_GENERIC_LICENSE[Firmware-siano] = "LICENCE.siano"
+NO_GENERIC_LICENSE[Firmware-qualcommAthos_ar3k] = "LICENSE.QualcommAtheros_ar3k"
+NO_GENERIC_LICENSE[Firmware-qualcommAthos_ath10k] = "LICENSE.QualcommAtheros_ath10k"
 
-SRCREV = "75cc3ef8ba6712fd72c073b17a790282136cc743"
+SRCREV = "bbe4917c054eb0a73e250c6363341e3bf6725839"
 PE = "1"
 PV = "0.0+git${SRCPV}"
 
@@ -169,7 +175,8 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-vt6656-license ${PN}-vt6656 \
              ${PN}-rtl-license ${PN}-rtl8192cu ${PN}-rtl8192ce ${PN}-rtl8192su \
              ${PN}-broadcom-license ${PN}-bcm4329 ${PN}-bcm4330 ${PN}-bcm4334 ${PN}-bcm4339 ${PN}-bcm4354 \
-             ${PN}-atheros-license ${PN}-ar9170 ${PN}-ar3k ${PN}-ath6k ${PN}-ath9k \
+             ${PN}-atheros-license ${PN}-ar9170 ${PN}-ath6k ${PN}-ath9k \
+             ${PN}-ar3k-license  ${PN}-ar3k  ${PN}-ath10k-license  ${PN}-ath10k  \
              \
              ${PN}-iwlwifi-license ${PN}-iwlwifi-135-6 \
              ${PN}-iwlwifi-3160-7 ${PN}-iwlwifi-3160-8 ${PN}-iwlwifi-3160-9 \
@@ -184,7 +191,6 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
 
 # For atheros
 LICENSE_${PN}-ar9170 = "Firmware-atheros_firmware"
-LICENSE_${PN}-ar3k = "Firmware-atheros_firmware"
 LICENSE_${PN}-ath6k = "Firmware-atheros_firmware"
 LICENSE_${PN}-ath9k = "Firmware-atheros_firmware"
 
@@ -192,9 +198,6 @@ FILES_${PN}-atheros-license = "/lib/firmware/LICENCE.atheros_firmware"
 FILES_${PN}-ar9170 = " \
   /lib/firmware/ar9170*.fw \
 "
-FILES_${PN}-ar3k = " \
-  /lib/firmware/ar3k \
-"
 FILES_${PN}-ath6k = " \
   /lib/firmware/ath6k \
 "
@@ -206,10 +209,26 @@ FILES_${PN}-ath9k = " \
 "
 
 RDEPENDS_${PN}-ar9170 += "${PN}-atheros-license"
-RDEPENDS_${PN}-ar3k += "${PN}-atheros-license"
 RDEPENDS_${PN}-ath6k += "${PN}-atheros-license"
 RDEPENDS_${PN}-ath9k += "${PN}-atheros-license"
 
+# For QualCommAthos
+LICENSE_${PN}-ar3k = "Firmware-qualcommAthos_ar3k"
+LICENSE_${PN}-ath10k = "Firmware-qualcommAthos_ath10k"
+
+FILES_${PN}-ar3k-license = "/lib/firmware/LICENSE.QualcommAtheros_ar3k"
+FILES_${PN}-ar3k = " \
+  /lib/firmware/ar3k \
+"
+
+FILES_${PN}-ath10k-license = "/lib/firmware/LICENSE.QualcommAtheros_ath10k"
+FILES_${PN}-ath10k = " \
+  /lib/firmware/ath10k \
+"
+
+RDEPENDS_${PN}-ar3k += "${PN}-ar3k-license"
+RDEPENDS_${PN}-ath10k += "${PN}-ath10k-license"
+
 # For ralink
 LICENSE_${PN}-ralink = "Firmware-ralink-firmware"
 
-- 
2.3.5


