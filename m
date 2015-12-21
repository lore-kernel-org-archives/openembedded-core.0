Return-Path: <roylee17@currantlabs.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id ADAD2605BB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Dec 2015 05:38:23 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id cy9so11669561pac.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Dec 2015 21:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=currantlabs-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=/hSrlGt9w7nZt3kpF1pZGxKxFMo84kQ8TunfFxvVdcM=;
	b=PqM4/ACX0NFCWPst2voscPqkQ2/gL/yXUyCrpXAvbT29rG+kG3WK/+0mnftUTnrcr5
	eWmF4Js++yhSrcxEkw0nRSnMFfM3Zr9QcDCodJkJFJepbB7H+cgOprHpaSf7FnJbIuGn
	5+HSuM+0O/9BcgrDKHOufxSRWpWv5A7vHYTvE4/oMO3RATPFZPfH2AsqYXAeCzLajzUU
	7kyxGixXaOA6jfwwmXgsm9kTsiZW6Xmmcg4FKzyVpnaLADtU1HL3ju9xU7nYGwv1jJek
	Ew8jRFNVAphZVnqnQj1ygvRk/eCvcgTWz9B395ohC8SQNzv1wtknO6+96jXpr1cAkifc
	lQbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/hSrlGt9w7nZt3kpF1pZGxKxFMo84kQ8TunfFxvVdcM=;
	b=cYvlmy/w9HN0qo54C4DlKaSFi38+i4ij/jYuXSAzLMBhfrPpaeQt/Ei+L6D9SrmWYQ
	y+oZ4aDbt2pZvTxoJnHN8ePlg5DRfYNELW6bW64wPLUJj0WnC5n0r5PaNpZ37n9T0s1i
	rq1gQLXyklt15SNEZCZtsICvRi0E+9Rr6Nav2wADBNYrptbSvVx0PRU7i+yk16hzilOs
	1kDOhcHtrcIipwUz6gQerafuj6+X6zYBVxPVWoCZkIxStAV8+I/PmIejdxHbT3eYBE3E
	fqiP6IVG6afsdrV2PQxX8mJOwmmJUjDpeB46gxzjZtA0DdAtd9U5DmErMf2ph7iYqhvB
	ZUtA==
X-Gm-Message-State: ALoCoQnqpbu3bY3GVcMaUBcz8E9HuqV/OCe9slKmgnLdiySy7jTfxA1CvFfrO2/RxY+VlWtzYzcXx0FwKyMzDfadKd/EbyDCrw==
X-Received: by 10.66.237.102 with SMTP id vb6mr24393986pac.133.1450676303784; 
	Sun, 20 Dec 2015 21:38:23 -0800 (PST)
Received: from Tzu-Jungs-iMac.local.net (c-67-169-68-81.hsd1.ca.comcast.net.
	[67.169.68.81]) by smtp.gmail.com with ESMTPSA id
	n64sm31601030pfi.19.2015.12.20.21.38.22
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 20 Dec 2015 21:38:23 -0800 (PST)
From: Tzu-Jung Lee <roylee17@currantlabs.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 20 Dec 2015 21:38:18 -0800
Message-Id: <1450676298-15503-1-git-send-email-roylee17@currantlabs.com>
X-Mailer: git-send-email 2.6.3
Subject: [PATCH] linux-firmware: package Broadcom BCM43340 firmware
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
X-List-Received-Date: Mon, 21 Dec 2015 05:38:25 -0000

Signed-off-by: Tzu-Jung Lee <roylee17@currantlabs.com>

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 76ad522..0ed3970 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -174,7 +174,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-ti-connectivity-license ${PN}-wl12xx ${PN}-wl18xx \
              ${PN}-vt6656-license ${PN}-vt6656 \
              ${PN}-rtl-license ${PN}-rtl8192cu ${PN}-rtl8192ce ${PN}-rtl8192su \
-             ${PN}-broadcom-license ${PN}-bcm4329 ${PN}-bcm4330 ${PN}-bcm4334 ${PN}-bcm4339 ${PN}-bcm4354 \
+             ${PN}-broadcom-license ${PN}-bcm4329 ${PN}-bcm4330 ${PN}-bcm4334 ${PN}-bcm43340 ${PN}-bcm4339 ${PN}-bcm4354 \
              ${PN}-atheros-license ${PN}-ar9170 ${PN}-ath6k ${PN}-ath9k \
              ${PN}-ar3k-license  ${PN}-ar3k  ${PN}-ath10k-license  ${PN}-ath10k  \
              \
@@ -330,6 +330,7 @@ RDEPENDS_${PN}-vt6656 = "${PN}-vt6656-license"
 LICENSE_${PN}-bcm4329 = "Firmware-broadcom_bcm43xx"
 LICENSE_${PN}-bcm4330 = "Firmware-broadcom_bcm43xx"
 LICENSE_${PN}-bcm4334 = "Firmware-broadcom_bcm43xx"
+LICENSE_${PN}-bcm43340 = "Firmware-broadcom_bcm43xx"
 LICENSE_${PN}-bcm4339 = "Firmware-broadcom_bcm43xx"
 LICENSE_${PN}-bcm4354 = "Firmware-broadcom_bcm43xx"
 
@@ -345,6 +346,9 @@ FILES_${PN}-bcm4330 = " \
 FILES_${PN}-bcm4334 = " \
   /lib/firmware/brcm/brcmfmac4334-sdio.bin \
 "
+FILES_${PN}-bcm43340 = " \
+  /lib/firmware/brcm/brcmfmac43340-sdio.bin \
+"
 FILES_${PN}-bcm4339 = " \
   /lib/firmware/brcm/brcmfmac4339-sdio.bin \
 "
@@ -356,6 +360,8 @@ ALTERNATIVE_LINK_NAME[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac-sdio.bin
 
 ALTERNATIVE_linux-firmware-bcm4334 = "brcmfmac-sdio.bin"
 ALTERNATIVE_TARGET_linux-firmware-bcm4334[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac4334-sdio.bin"
+ALTERNATIVE_linux-firmware-bcm43340 = "brcmfmac-sdio.bin"
+ALTERNATIVE_TARGET_linux-firmware-bcm43340[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac43340-sdio.bin"
 ALTERNATIVE_linux_firmware-bcm4354 = "brcmfmac-sdio.bin"
 ALTERNATIVE_TARGET_linux-firmware-bcm4354[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac4354-sdio.bin"
 ALTERNATIVE_linux-firmware-bcm4329 = "brcmfmac-sdio.bin"
@@ -368,6 +374,7 @@ ALTERNATIVE_TARGET_linux-firmware-bcm4339[brcmfmac-sdio.bin] = "/lib/firmware/br
 RDEPENDS_${PN}-bcm4329 += "${PN}-broadcom-license"
 RDEPENDS_${PN}-bcm4330 += "${PN}-broadcom-license"
 RDEPENDS_${PN}-bcm4334 += "${PN}-broadcom-license"
+RDEPENDS_${PN}-bcm43340 += "${PN}-broadcom-license"
 RDEPENDS_${PN}-bcm4339 += "${PN}-broadcom-license"
 RDEPENDS_${PN}-bcm4354 += "${PN}-broadcom-license"
 
-- 
2.6.3


