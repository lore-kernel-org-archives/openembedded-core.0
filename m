Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id E10B07FA45
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 18:30:23 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id z24so9961712pgu.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 10:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=FChGnWCysWX+Joa61SLndq+UPqhnJtJh5EsXKFTmjco=;
	b=bXZi1ETo5b4epfm/dvBvxEDYDQrZNv191kKi8c0b4nsq7bhk/UznOMHMByKfi12Bvq
	DMgPLvE86GoL5LRKApRCZpBkYv+CKniiSWObx3agj32SVghX5P9jpTqeTyb19TJAsv9t
	1Unrv/c2qaQA7TnWSXv8cpM63pSQmSQTaAPQmzSyYqJq+wqYWitXmFgkezrhzaYNYArh
	NEcQUcXWRtf6DbM8TPgwPHzQpQXUBNV7KygpKwXV12Rc62zuu/zPRt9tVhgCJfqGA/Ii
	UoDULVp/UKGMFQINuxxWcDkNoa/1n44KiiMJjGgcpPPivDkjvWcfEdx7ERLe+ZIoQXGh
	3UTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=FChGnWCysWX+Joa61SLndq+UPqhnJtJh5EsXKFTmjco=;
	b=J0C5BzLnqNUuCY/P+4VYRT5QCemO/R0qgI/7XlAoy4hIBMmJ+GrLDXPk7iAPzDuQbh
	LqP2JFCB5Xxm+DlY6+VyXb7NHmAErfF2pQZ0mjlpUVqYLGr/YlLpecDVke7jMSqnKi3Q
	HejGMEn9IaM1eLckOSwnD6ZYdS0tp+XfI2RmfYVd04z9aBQBdb//GzydzXTwexdrQrxE
	l1lY2QJH2OenTlkQrmdCjUeFxSCgWT9QcUhTpFOnqZsytgzgl8UJoc3or8fyV74mzlFu
	+o+vk/WLqGuO7lLI8+jQGU4uVoxaGQKhygcvecZ44mUE8yqJVRF6Px5r8KtxoVfBMyvm
	KCeg==
X-Gm-Message-State: APjAAAXVteISjOFKamTnZbEkT2SPuSvZsyUDTvJAB5NQ0VeGcaPPTwMy
	fN92CloX2PcHaliVoRsvrJphg6PK
X-Google-Smtp-Source: APXvYqzKGd+71i1rD/6eKZzXxVsNkKee2My6S9m/1goOEHz4adMrpB+/IfnT8a8PBGwhFhh71Rj35A==
X-Received: by 2002:aa7:8815:: with SMTP id c21mr31157902pfo.66.1573497024856; 
	Mon, 11 Nov 2019 10:30:24 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:604a:b703:29ca:5c7d])
	by smtp.gmail.com with ESMTPSA id
	l62sm17731698pgl.24.2019.11.11.10.30.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Nov 2019 10:30:24 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2019 10:29:59 -0800
Message-Id: <957c3d39b63f57d896ee89d727007ac2ce6672e3.1573496794.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573496794.git.akuster808@gmail.com>
References: <cover.1573496794.git.akuster808@gmail.com>
Subject: [zeus 17/21] linux-firmware: update packaging for brcm files
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
X-List-Received-Date: Mon, 11 Nov 2019 18:30:24 -0000

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


