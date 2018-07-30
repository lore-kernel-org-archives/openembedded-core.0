Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id 10E1A78D6B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 09:17:24 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id h9-v6so12035810wro.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 02:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=i3Rc0nq+kzz6QuCgoURENxMWMoaepS4ZH5j4a96eTwU=;
	b=fgBOPBT32atyuECEMbIakl+aVOSElYolvM7OQCd900hdzIypWQy56CzKlmXLciuFlA
	jJ6O3xeT+W+Pw0Sf3v+wwSPea7eDIVCSWIIszL6BYaO3v4jAizdtDErnqhmOdZqQxOHS
	Rpqi+DqkS5YbLd4yZgk97AXu94om5fnNAqQMlB2eWi34firxqR/MqGB2EJorTN+m2e4e
	rbDwM5pI/zYfHJn0GPk+9vjzxKHvIlHh+Lw+SMUZLOidlve4NPHuZdcM+0bqH27RCCcU
	gYiUEAvoCAICsQMV9E0CWEFXVMJF5+TMpe0bKVHdf+UOnBYJjmDmveutG58/fZIcyapg
	lffQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=i3Rc0nq+kzz6QuCgoURENxMWMoaepS4ZH5j4a96eTwU=;
	b=MYiEQTBDJ2eaDp6b8CZ9N9I29GDx9eZLz+xZn4KHLXnq73heDBeapPo1hjsYOEALVj
	B/aaX5LrjhGwnY81vdz1RIjZiLA48yjjxHfbFbi/7kUgaFNTl7HckEI/8U3tGcfDVleQ
	NnlfT1WeJgiCkBCkk84gqMsLfO7FNLiIq3VpmcI/dKqE40F4JryHG5thGZNPtUh+4+f9
	XBZDUIX97Be4Ugk1LfstAkraRX2AsOMCwxe/YnocwdhDrEJE8z3+i5+LuaAOYY+m8mHl
	RnANig7FmQHcb7MJXL87U5yJMZIKt+R8uQL/+CleumbD8JC7+HdcLkfvIBsSXrVT9QaA
	cMew==
X-Gm-Message-State: AOUpUlFArSCo5t03P9g30g4BONZsskXf9IRtlcTGfdSIEoXOLC6MGWe/
	Hq6pk9D2+JRq8fGurnNzE++0FVF0
X-Google-Smtp-Source: AAOMgpfdQxGa/c/tONavsoRces/30s7JThxtKPwBXleBosHDWLvw+J7tsPb/4YiriejElZo6mJMFIA==
X-Received: by 2002:adf:e24d:: with SMTP id
	n13-v6mr17027324wri.205.1532942245613; 
	Mon, 30 Jul 2018 02:17:25 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	m2-v6sm10224027wrw.76.2018.07.30.02.17.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 30 Jul 2018 02:17:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jul 2018 09:17:24 +0000
Message-Id: <20180730091725.857-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180730091725.857-1-Martin.Jansa@gmail.com>
References: <20180730091725.857-1-Martin.Jansa@gmail.com>
Subject: [PATCH][sumo 2/3] linux-firmware: update LICENSE for bcm43* packages according to WHENCE file
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
X-List-Received-Date: Mon, 30 Jul 2018 09:17:25 -0000

* the license was updated
  brcm/brcmfmac43430-sdio.bin:
  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=ec734a30
  brcm/brcmfmac43340-sdio.bin:
  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=5ac5ad5c
  brcm/brcmfmac43362-sdio.bin:
  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=be1c535e
  brcm/brcmfmac4354-sdio.bin:
  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=a2921812

* this shows that with every upgrade the changes in WHENCE file should
  checked carefully

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../linux-firmware/linux-firmware_git.bb      | 41 ++++++++++---------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 898c87dcd1..480018a7e9 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -516,11 +516,7 @@ RDEPENDS_${PN}-vt6656 = "${PN}-vt6656-license"
 LICENSE_${PN}-bcm4329 = "Firmware-broadcom_bcm43xx"
 LICENSE_${PN}-bcm4330 = "Firmware-broadcom_bcm43xx"
 LICENSE_${PN}-bcm4334 = "Firmware-broadcom_bcm43xx"
-LICENSE_${PN}-bcm43340 = "Firmware-broadcom_bcm43xx"
-LICENSE_${PN}-bcm43362 = "Firmware-broadcom_bcm43xx"
 LICENSE_${PN}-bcm4339 = "Firmware-broadcom_bcm43xx"
-LICENSE_${PN}-bcm43430 = "Firmware-broadcom_bcm43xx"
-LICENSE_${PN}-bcm4354 = "Firmware-broadcom_bcm43xx"
 LICENSE_${PN}-broadcom-license = "Firmware-broadcom_bcm43xx"
 
 FILES_${PN}-broadcom-license = " \
@@ -535,38 +531,43 @@ FILES_${PN}-bcm4330 = " \
 FILES_${PN}-bcm4334 = " \
   ${nonarch_base_libdir}/firmware/brcm/brcmfmac4334-sdio.bin \
 "
-FILES_${PN}-bcm43340 = " \
-  ${nonarch_base_libdir}/firmware/brcm/brcmfmac43340-sdio.bin \
-"
-FILES_${PN}-bcm43362 = " \
-  ${nonarch_base_libdir}/firmware/brcm/brcmfmac43362-sdio.bin \
-"
 FILES_${PN}-bcm4339 = " \
   ${nonarch_base_libdir}/firmware/brcm/brcmfmac4339-sdio.bin \
 "
-FILES_${PN}-bcm43430 = " \
-  ${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.bin \
-"
-FILES_${PN}-bcm4354 = " \
-  ${nonarch_base_libdir}/firmware/brcm/brcmfmac4354-sdio.bin \
-"
 
 RDEPENDS_${PN}-bcm4329 += "${PN}-broadcom-license"
 RDEPENDS_${PN}-bcm4330 += "${PN}-broadcom-license"
 RDEPENDS_${PN}-bcm4334 += "${PN}-broadcom-license"
-RDEPENDS_${PN}-bcm43340 += "${PN}-broadcom-license"
-RDEPENDS_${PN}-bcm43362 += "${PN}-broadcom-license"
 RDEPENDS_${PN}-bcm4339 += "${PN}-broadcom-license"
-RDEPENDS_${PN}-bcm43430 += "${PN}-broadcom-license"
-RDEPENDS_${PN}-bcm4354 += "${PN}-broadcom-license"
 
 # For broadcom cypress
 
+LICENSE_${PN}-bcm43340 = "Firmware-cypress"
+LICENSE_${PN}-bcm43362 = "Firmware-cypress"
+LICENSE_${PN}-bcm43430 = "Firmware-cypress"
+LICENSE_${PN}-bcm4354 = "Firmware-cypress"
 LICENSE_${PN}-cypress-license = "Firmware-cypress"
 
 FILES_${PN}-cypress-license = "\
   ${nonarch_base_libdir}/firmware/LICENCE.cypress \
 "
+FILES_${PN}-bcm43340 = " \
+  ${nonarch_base_libdir}/firmware/brcm/brcmfmac43340-sdio.bin \
+"
+FILES_${PN}-bcm43362 = " \
+  ${nonarch_base_libdir}/firmware/brcm/brcmfmac43362-sdio.bin \
+"
+FILES_${PN}-bcm43430 = " \
+  ${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.bin \
+"
+FILES_${PN}-bcm4354 = " \
+  ${nonarch_base_libdir}/firmware/brcm/brcmfmac4354-sdio.bin \
+"
+
+RDEPENDS_${PN}-bcm43340 += "${PN}-cypress-license"
+RDEPENDS_${PN}-bcm43362 += "${PN}-cypress-license"
+RDEPENDS_${PN}-bcm43430 += "${PN}-cypress-license"
+RDEPENDS_${PN}-bcm4354 += "${PN}-cypress-license"
 
 # For Broadcom bnx2-mips
 #
-- 
2.17.1


