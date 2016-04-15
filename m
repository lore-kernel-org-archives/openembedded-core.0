Return-Path: <christopher.w.clark@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id A06A362137
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2016 03:28:22 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id j9so58401764obd.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 20:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to;
	bh=Q55ltwMMFHu3P685T8uL8pEJmYIRxe/HhpGxxItGyuE=;
	b=c+2qds2HZ3qRg8/ZHuUh3oE2TDeMSzX1wQ3gxk4nm8hjLbB7TlFZSetDhKc2owNqV5
	djlcvEZs1f5ooGiL4kwlqgwtFs7sYZANSDIwsy8n61QiiMkkz3jxrtzTZTZ8VPe/di5M
	U5VkaC4oBqZEE9w10uC+Qv3v8DCqazqrNcVNBl7R+pVZvNEe9U0k7XmFaoxU0TBvt1hZ
	IyJuCfxsrDjB2RxvEjR50+V2JvVEuTWAUKHsl2zUdre0bNPSmLmwzmwgBrlIUA/LP+ei
	iGmiTCt1POAXQoZJwkNB220EHxGSDIQRfXcDmyTmN25A2nEbj3uft8IrkCDzCeggqp4K
	lQYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
	bh=Q55ltwMMFHu3P685T8uL8pEJmYIRxe/HhpGxxItGyuE=;
	b=LN7DITWTRiX1z0Ff3t8/Y6XImxZc0nKC1uPWz7r877SM3zOBQ5sUPZf7kOYQOqPQVj
	ijDenFZ7+KlVmFY5LBMWSGSrT/2I/PwaZwWvFuM5CyDjdF5kubVOL6IPA9yv8sga3J2u
	JA9UuqSQB4trdvZpYCY2jZMMF0JAUeWs16syd0E/stAPebOoqBEjM642kNMpjhCUTXNg
	WC5DiNGYKMF9/ej2mkJfTud/CvQHwWehFWsd9yTO0KFbEtXK0cu4zJK0OKk2l5cslFRF
	ueAQs4sTdRDlSRLY/3+6Q86zJkMehcVdbJtY89Cw+sWgCnqQckct2RtPlBGurxXdRAXJ
	BS4g==
X-Gm-Message-State: AOPr4FX6zBNqQEtLEnj8FI+fo72c0YvfDDW1wBActS6MHKth/LmK5Ra1TxM7LWomNLjJHCIEiybyzY3oTKzugw==
MIME-Version: 1.0
X-Received: by 10.60.173.69 with SMTP id bi5mr10086689oec.59.1460690902609;
	Thu, 14 Apr 2016 20:28:22 -0700 (PDT)
Received: by 10.157.29.249 with HTTP; Thu, 14 Apr 2016 20:28:22 -0700 (PDT)
Date: Thu, 14 Apr 2016 20:28:22 -0700
Message-ID: <CACMJ4GZf4QeyZ3WBdr9rjg-iEz6h7kx0mJcSbp41yoEe+J0fCg@mail.gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-firmware: break out bnx2 mips firmware and WHENCE license
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
X-List-Received-Date: Fri, 15 Apr 2016 03:28:26 -0000
Content-Type: text/plain; charset=UTF-8

commit a19cfee10c1f1762da601125c17035cf7701ce91
Author: Christopher Clark <christopher.clark6@baesystems.com>
Date:   Thu Apr 14 17:00:20 2016 -0700

    linux-firmware: break out bnx2 mips firmware and WHENCE license

    Break out the bnx2 mips firmware into an independent subpackage.

    Since the bnx2 firmware license is contained in the common WHENCE file
    also package that separately so that other firmware that is licensed
    within that file may depend upon a standalone package containing it.

    Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index a4e64d5..95a57d7 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -55,6 +55,7 @@ LICENSE = "\
     & Firmware-xc4000 \
     & Firmware-xc5000 \
     & Firmware-xc5000c \
+    & WHENCE \
 "

 LIC_FILES_CHKSUM = "\
@@ -111,6 +112,7 @@ LIC_FILES_CHKSUM = "\
     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
+    file://WHENCE;md5=2ec7cdcaf7b1f57b77665b4d77b76e50 \
 "

 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -168,6 +170,7 @@ NO_GENERIC_LICENSE[Firmware-wl1251] = "LICENCE.wl1251"
 NO_GENERIC_LICENSE[Firmware-xc4000] = "LICENCE.xc4000"
 NO_GENERIC_LICENSE[Firmware-xc5000] = "LICENCE.xc5000"
 NO_GENERIC_LICENSE[Firmware-xc5000c] = "LICENCE.xc5000c"
+NO_GENERIC_LICENSE[WHENCE] = "WHENCE"

 SRCREV = "5f8ca0c1db6106a2d6d7e85eee778917ff03c3de"
 PE = "1"
@@ -227,6 +230,8 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-iwlwifi-7265d ${PN}-iwlwifi-8000c ${PN}-iwlwifi-8265 \
              ${PN}-i915-license ${PN}-i915 \
              ${PN}-adsp-sst-license ${PN}-adsp-sst \
+             ${PN}-bnx2-mips \
+             ${PN}-whence-license \
              ${PN}-license \
              "

@@ -425,6 +430,19 @@ RDEPENDS_${PN}-bcm43340 += "${PN}-broadcom-license"
 RDEPENDS_${PN}-bcm4339 += "${PN}-broadcom-license"
 RDEPENDS_${PN}-bcm4354 += "${PN}-broadcom-license"

+# For Broadcom bnx2-mips
+#
+# which is a separate case to the other Broadcom firmwares since its
+# license is contained in the shared WHENCE file.
+
+LICENSE_${PN}-bnx2-mips = "WHENCE"
+LICENSE_${PN}-whence-license = "WHENCE"
+
+FILES_${PN}-bnx2-mips = "/lib/firmware/bnx2/bnx2-mips-09-6.2.1b.fw"
+FILES_${PN}-whence-license = "/lib/firmware/WHENCE"
+
+RDEPENDS_${PN}-bnx2-mips += "${PN}-whence-license"
+
 # For iwlwifi
 LICENSE_${PN}-iwlwifi-135-6     = "Firmware-iwlwifi_firmware"
 LICENSE_${PN}-iwlwifi-3160-7    = "Firmware-iwlwifi_firmware"
@@ -543,11 +561,13 @@ LICENSE_${PN} = "\
     & Firmware-xc4000 \
     & Firmware-xc5000 \
     & Firmware-xc5000c \
+    & WHENCE \
 "

 FILES_${PN}-license += "/lib/firmware/LICEN*"
 FILES_${PN} += "/lib/firmware/*"
 RDEPENDS_${PN} += "${PN}-license"
+RDEPENDS_${PN} += "${PN}-whence-license"

 # Make linux-firmware depend on all of the split-out packages.
 python populate_packages_prepend () {

