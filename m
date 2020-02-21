Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id AF9BB6163D
	for <openembedded-core@openembedded.org>;
	Fri, 21 Feb 2020 02:54:09 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id j7so248514plt.1
	for <openembedded-core@openembedded.org>;
	Thu, 20 Feb 2020 18:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=XMZBjD0DLjtCAuHf+LqOvIZUmibB73dsHa2uUXI9OTw=;
	b=t8s/g3+NJSoYuB9TMzT4zHbibEt+0JR7Vgntnbt/OVrlGvtcsVTS+H+V97Pn+lcvFo
	C2VLbiRq5mcGjSiGZLllAGxIxQEVujA5XCOJV95A2AURoVs4CGT40BGlbAeKMWRM6HcN
	MDMaa9fjlpwRQoo5NPE6f/heI9tdUnKynqpAsgmMDHj5jJs1mR++KbTWFLBspUoJknX9
	aDcmA2NQu0r9rdffPRCpoN7pZ6h+KqCmI2psbvwTTM/p8NV96mm6qyFg1nB2qlau6/Hl
	5G0rNCriLVqL2sH7Pz1AGKkO5yicyCBI4EFxEN4krSUx6Wo1cLntJS6ySMG69o/S0iG7
	ufsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=XMZBjD0DLjtCAuHf+LqOvIZUmibB73dsHa2uUXI9OTw=;
	b=oqAd3fFJUXZFbMK4oFR3BYsUju6pidqt7HwRFI90K6Lq+wxnLGfUH6Gasjnwv769qR
	ImvAw9+A/ouoPpoaGBOdsdRzlnl2MlPLd18UJXkBKcO+oaUNcDFV4JGcvLGseKlsRV0A
	eEfat3VCL62EphTRB6UBnV33bLagmpBI2gNqSZYFa6HgqCGZf8Ue4DM5mwZGIlETOcHu
	/xEUf5JiHEdi+mbkL6bK+syXup5NP0xgr2i9kp0QSzwfH7CeVEzEe/YmgwgQFn9qzg/P
	SXNVkf1pSRS8AAAZPhK7pRM6sjyaV0nvhrtg92ehr9rub3tBm5l3vvrDwwxO3/HJDcM1
	qheQ==
X-Gm-Message-State: APjAAAV2lIMgBId8Vuf9Pp0Fqr7EBTL91RwA3N1VtFqPp0mjLhhm99x3
	aPPywf3gE4YfvEYo30nlr8/5u1Ep
X-Google-Smtp-Source: APXvYqzRYt7/yxS4xbC/ZAjDO5hF2wlwBTFekWsml/bLItFx/u/KtdmJL6f4YVimm8bbMbpQoRb6fQ==
X-Received: by 2002:a17:902:8609:: with SMTP id
	f9mr32567696plo.203.1582253650694; 
	Thu, 20 Feb 2020 18:54:10 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:88be:17f0:935c:9e35])
	by smtp.gmail.com with ESMTPSA id
	y10sm925320pfq.110.2020.02.20.18.54.09
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 20 Feb 2020 18:54:10 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Thu, 20 Feb 2020 18:53:33 -0800
Message-Id: <8063a1277433c58a9df43f0185bb89c79f865aa9.1582253544.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1582253544.git.akuster808@gmail.com>
References: <cover.1582253544.git.akuster808@gmail.com>
Subject: [warrior 14/14] linux-firmware: update packaging for brcm files
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
X-List-Received-Date: Fri, 21 Feb 2020 02:54:10 -0000

From: Samuli Piippo <samuli.piippo@qt.io>

Add new package for bcm4366c and include available NVRAM config files
into the corrent bcm* packages.

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit 957c3d39b63f57d896ee89d727007ac2ce6672e3)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../linux-firmware/linux-firmware_20190815.bb  | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20190815.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20190815.bb
index 518638806f..d83000b64f 100644
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
2.17.1


