Return-Path: <roylee17@currantlabs.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0442475EE7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 18:27:31 +0000 (UTC)
Received: by padhx2 with SMTP id hx2so4265806pad.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 10:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=currantlabs_com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=kEFH8OjmtsSGXERCYwSCZ6BqlYh2eW4TDu6jnGiF+ls=;
	b=NdW0FH3uBR9WbbIMSPQb71BZHAQF2+E6dk1LJrupJ5nabFlPUg5g9JEiUAVOlMjvzi
	+4D7oc8ozLVSBkfdPbSDeDAzGSFcnECgVzFA0CaL67z95jbrJGqB3zCHB6AXoNVPjbZH
	HrdzWbDONPFjyHrMFS1dA46/mmooz3m5YC29OitzYuVMpFQNJ39CLa5uZScW6405sx7D
	hHS6Ch4sjkZZ3Euqb+6BcBtXOZzKvIJyNuNwUhoZQ2EKSluscBjD5v4anb0vq4fgbpCR
	6yotBYzk+xjjJho26EDq1e+DEMwZae8x6ZAddwx/mjmAvK5G2X3vS//nTXtESsHFV4kJ
	RHww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kEFH8OjmtsSGXERCYwSCZ6BqlYh2eW4TDu6jnGiF+ls=;
	b=SkNBNw5HiufDNB2QL+67Foodk1HOxo/iSznxNs30MOj/N5ArFZq3BQCjchYe4BZ79a
	FNPyfLWiov1BMn6NfP3BePYmBwcV26c1acEjsVGF0hGdV4dvgAdYcKuhUHH7l8L0tC1P
	XOWpVC80ZDrSD0aU4UBeqZ6thzbzptiJqtYZJV1+4ZnlWzP7jtAf5tCvGMQpcD+pu1Kv
	R3QzeHzCkNn0cicFHtmxlY45B6g4spyIhTdcxy3dYMQQOuuQfiw3yNqKuI/IsMSD2s3i
	WP152AM7vCb3WPDGHMfJm7j1UqkNauQoty6g+gPN5lHUnfm7d88qd7EYXoCCHegn2IFZ
	/ZVQ==
X-Gm-Message-State: ALoCoQliet4vELt68Q7yOj4/sgUU9E/SsUn/Xkx6gH6gLaAegT0NNZcmf7JNZnYTNufrv+8SaiY+
X-Received: by 10.68.175.193 with SMTP id cc1mr8062685pbc.16.1447180051884;
	Tue, 10 Nov 2015 10:27:31 -0800 (PST)
Received: from localhost.localdomain (c-73-222-19-194.hsd1.ca.comcast.net.
	[73.222.19.194])
	by smtp.gmail.com with ESMTPSA id ia3sm5392764pbb.5.2015.11.10.10.27.30
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Nov 2015 10:27:31 -0800 (PST)
From: Tzu-Jung Lee <roylee17@currantlabs.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Nov 2015 10:27:04 -0800
Message-Id: <1447180024-15630-1-git-send-email-roylee17@currantlabs.com>
X-Mailer: git-send-email 2.6.2
Subject: [PATCH] linux-firmware: package Broadcom BCM4339 firmware
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
X-List-Received-Date: Tue, 10 Nov 2015 18:27:32 -0000

Signed-off-by: Tzu-Jung Lee <roylee17@currantlabs.com>

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 4939ca6..615fbdb 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -168,7 +168,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-ti-connectivity-license ${PN}-wl12xx ${PN}-wl18xx \
              ${PN}-vt6656-license ${PN}-vt6656 \
              ${PN}-rtl-license ${PN}-rtl8192cu ${PN}-rtl8192ce ${PN}-rtl8192su \
-             ${PN}-broadcom-license ${PN}-bcm4329 ${PN}-bcm4330 ${PN}-bcm4334 ${PN}-bcm4354 \
+             ${PN}-broadcom-license ${PN}-bcm4329 ${PN}-bcm4330 ${PN}-bcm4334 ${PN}-bcm4339 ${PN}-bcm4354 \
              ${PN}-atheros-license ${PN}-ar9170 ${PN}-ar3k ${PN}-ath6k ${PN}-ath9k \
              \
              ${PN}-iwlwifi-license ${PN}-iwlwifi-135-6 \
@@ -311,6 +311,7 @@ RDEPENDS_${PN}-vt6656 = "${PN}-vt6656-license"
 LICENSE_${PN}-bcm4329 = "Firmware-broadcom_bcm43xx"
 LICENSE_${PN}-bcm4330 = "Firmware-broadcom_bcm43xx"
 LICENSE_${PN}-bcm4334 = "Firmware-broadcom_bcm43xx"
+LICENSE_${PN}-bcm4339 = "Firmware-broadcom_bcm43xx"
 LICENSE_${PN}-bcm4354 = "Firmware-broadcom_bcm43xx"
 
 FILES_${PN}-broadcom-license = " \
@@ -325,6 +326,9 @@ FILES_${PN}-bcm4330 = " \
 FILES_${PN}-bcm4334 = " \
   /lib/firmware/brcm/brcmfmac4334-sdio.bin \
 "
+FILES_${PN}-bcm4339 = " \
+  /lib/firmware/brcm/brcmfmac4339-sdio.bin \
+"
 FILES_${PN}-bcm4354 = " \
   /lib/firmware/brcm/brcmfmac4354-sdio.bin \
 "
@@ -339,10 +343,13 @@ ALTERNATIVE_linux-firmware-bcm4329 = "brcmfmac-sdio.bin"
 ALTERNATIVE_TARGET_linux-firmware-bcm4329[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac4329-sdio.bin"
 ALTERNATIVE_linux-firmware-bcm4330 = "brcmfmac-sdio.bin"
 ALTERNATIVE_TARGET_linux-firmware-bcm4330[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac4330-sdio.bin"
+ALTERNATIVE_linux-firmware-bcm4339 = "brcmfmac-sdio.bin"
+ALTERNATIVE_TARGET_linux-firmware-bcm4339[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac4339-sdio.bin"
 
 RDEPENDS_${PN}-bcm4329 += "${PN}-broadcom-license"
 RDEPENDS_${PN}-bcm4330 += "${PN}-broadcom-license"
 RDEPENDS_${PN}-bcm4334 += "${PN}-broadcom-license"
+RDEPENDS_${PN}-bcm4339 += "${PN}-broadcom-license"
 RDEPENDS_${PN}-bcm4354 += "${PN}-broadcom-license"
 
 # For iwlwifi
-- 
2.6.2


