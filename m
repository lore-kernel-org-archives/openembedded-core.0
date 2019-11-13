Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id CB31C7F874
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:32:51 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id n13so1910435pff.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=FChGnWCysWX+Joa61SLndq+UPqhnJtJh5EsXKFTmjco=;
	b=MN+cp2gOUs+Viim4DjIvhRkPKoED6xNrUjQbg7BwJfLvdmb9Q5O68nUfgIBWJXL4XY
	kjs1UGztV7AF9llfGfsH4R+ZPqdVKMbbdzMU9MChNxkrdW0VHxcMmZ/8KBS6fu13GCZH
	AiKIUdZlUfNytRKjlo5YxRrZCA2/wgYP/pu8r4SR5ozk3OkfcgXERUaLjfP6LIlzG5nz
	ZuxcQdLhT9rikgh+K7Xp5PFNKEFvdrUgcHrNRog/QUtHI6RUy0D1uiPNVM6X+rinYE4l
	hXZ5DDu/7ZxJNT7zEJ+L/t9vnyErpJiAW2DaCg/xLlX+TxISRR4GH51bWaLK4xCTR4Rd
	i9GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=FChGnWCysWX+Joa61SLndq+UPqhnJtJh5EsXKFTmjco=;
	b=FHyhaNoRbn5k8NyCpJ0x3G8MsMGfThGvdQVsIGVfvxJwKyxHim4PHPTZ0KiGoX4v3B
	llNV9qHwF46JrwL7aOKMzk+NO6r9pScouXC+rU/+dyUQtwizfyeMxHAdP8RljNGR4ON1
	l246V54A/NaEBiy13kK+OMO06lf7DYxEdpo0MYQZQ7sMUayv5IHc3fFevQl+qHOMfyz7
	m9tbJi/BUoYBFxZMgVaxpycD6RmHoRZlixdNBRXZYGxIuwkUPmQokITfk5sWAAyV3ynw
	Wp1950IbuWMsqhWLEsA9ZMZT4RiTgHn86gZRCl1rPRwA7hqwm/IQ603+sAHWptCBTNdq
	mTrg==
X-Gm-Message-State: APjAAAWGmcb5KzBU3o0/em7NoZJo5COjwwyxyB+utJkH5/EhiuqnE+x4
	UTrQy9nvcfWvf76iDpxpPvQTCNyn
X-Google-Smtp-Source: APXvYqxjFHk74jzkXEny7F/I8pO/YyFkYNvH6hYTsuLeu2DW7C3wLZbxkoWddTScXVkizvHl4V/jJw==
X-Received: by 2002:a63:f852:: with SMTP id v18mr4266647pgj.71.1573659172629; 
	Wed, 13 Nov 2019 07:32:52 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id
	s18sm3713613pfm.27.2019.11.13.07.32.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Nov 2019 07:32:52 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 07:32:09 -0800
Message-Id: <957c3d39b63f57d896ee89d727007ac2ce6672e3.1573658916.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573658915.git.akuster808@gmail.com>
References: <cover.1573658915.git.akuster808@gmail.com>
Subject: [zeus 27/31] linux-firmware: update packaging for brcm files
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
X-List-Received-Date: Wed, 13 Nov 2019 15:32:52 -0000

From: Samuli Piippo <samuli.piippo@qt.io>

Add new package for bcm4366c and include available NVRAM config files
into the corrent bcm* packages.

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../linux-firmware/linux-firmware_20190815.bb          | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20190815.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20190815.bb
index 5186388..d83000b 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20190815.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20190815.bb
@@ -273,6 +273,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-bcm4358 \
              ${PN}-bcm43602 \
              ${PN}-bcm4366b \
+             ${PN}-bcm4366c \
              ${PN}-bcm4371 \
              ${PN}-bcm4373 \
              ${PN}-bcm43xx \
@@ -571,7 +572,7 @@ FILES_${PN}-bcm43xx-hdr = "${nonarch_base_libdir}/firmware/brcm/bcm43xx_hdr-0.fw
 FILES_${PN}-bcm4329-fullmac = "${nonarch_base_libdir}/firmware/brcm/bcm4329-fullmac-4.bin"
 FILES_${PN}-bcm43236b = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43236b.bin"
 FILES_${PN}-bcm4329 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4329-sdio.bin"
-FILES_${PN}-bcm4330 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4330-sdio.bin"
+FILES_${PN}-bcm4330 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4330-sdio.*"
 FILES_${PN}-bcm4334 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4334-sdio.bin"
 FILES_${PN}-bcm4335 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4335-sdio.bin"
 FILES_${PN}-bcm4339 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4339-sdio.bin"
@@ -582,8 +583,8 @@ FILES_${PN}-bcm43242a = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43242a.bin
 FILES_${PN}-bcm43143 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43143.bin \
   ${nonarch_base_libdir}/firmware/brcm/brcmfmac43143-sdio.bin \
 "
-FILES_${PN}-bcm43430a0 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43430a0-sdio.bin"
-FILES_${PN}-bcm43455 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43455-sdio.bin"
+FILES_${PN}-bcm43430a0 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43430a0-sdio.*"
+FILES_${PN}-bcm43455 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43455-sdio.*"
 FILES_${PN}-bcm4350c2 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4350c2-pcie.bin"
 FILES_${PN}-bcm4350 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4350-pcie.bin"
 FILES_${PN}-bcm4356 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4356-sdio.bin"
@@ -594,6 +595,7 @@ FILES_${PN}-bcm43602 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43602-pcie.
   ${nonarch_base_libdir}/firmware/brcm/brcmfmac43602-pcie.ap.bin \
 "
 FILES_${PN}-bcm4366b = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4366b-pcie.bin"
+FILES_${PN}-bcm4366c = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4366c-pcie.bin"
 FILES_${PN}-bcm4371 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4371-pcie.bin"
 
 # for i in `grep brcm WHENCE  | grep ^File | sed 's/File: brcm.//g'`; do pkg=`echo $i | sed 's/-[sp40].*//g; s/\.bin//g; s/brcmfmac/bcm/g; s/_hdr/-hdr/g; s/BCM/bcm-0bb4-0306/g'`; echo -e "LICENSE_\${PN}-$pkg = \"Firmware-broadcom_bcm43xx\"\nRDEPENDS_\${PN}-$pkg += \"\${PN}-broadcom-license\""; done
@@ -647,6 +649,8 @@ LICENSE_${PN}-bcm43602 = "Firmware-broadcom_bcm43xx"
 RDEPENDS_${PN}-bcm43602 += "${PN}-broadcom-license"
 LICENSE_${PN}-bcm4366b = "Firmware-broadcom_bcm43xx"
 RDEPENDS_${PN}-bcm4366b += "${PN}-broadcom-license"
+LICENSE_${PN}-bcm4366c = "Firmware-broadcom_bcm43xx"
+RDEPENDS_${PN}-bcm4366c += "${PN}-broadcom-license"
 LICENSE_${PN}-bcm4371 = "Firmware-broadcom_bcm43xx"
 RDEPENDS_${PN}-bcm4371 += "${PN}-broadcom-license"
 
@@ -656,11 +660,11 @@ LICENSE_${PN}-cypress-license = "Firmware-cypress"
 FILES_${PN}-cypress-license = "${nonarch_base_libdir}/firmware/LICENCE.cypress"
 
 FILES_${PN}-bcm-0bb4-0306 = "${nonarch_base_libdir}/firmware/brcm/BCM-0bb4-0306.hcd"
-FILES_${PN}-bcm43340 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43340-sdio.bin"
-FILES_${PN}-bcm43362 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43362-sdio.bin"
-FILES_${PN}-bcm43430 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.bin"
+FILES_${PN}-bcm43340 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43340-sdio.*"
+FILES_${PN}-bcm43362 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43362-sdio.*"
+FILES_${PN}-bcm43430 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.*"
 FILES_${PN}-bcm4354 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4354-sdio.bin"
-FILES_${PN}-bcm4356-pcie = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4356-pcie.bin"
+FILES_${PN}-bcm4356-pcie = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4356-pcie.*"
 FILES_${PN}-bcm4373 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4373-sdio.bin \
   ${nonarch_base_libdir}/firmware/brcm/brcmfmac4373.bin \
 "
-- 
2.7.4


