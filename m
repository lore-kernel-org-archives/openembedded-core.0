Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 6B58178B53
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 11:15:29 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id s9-v6so9138127wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 04:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=i3Rc0nq+kzz6QuCgoURENxMWMoaepS4ZH5j4a96eTwU=;
	b=Wu+wJU4+bRl1PatMmwxLxJaeSe5yx1bcarHCxIna1b6NVr49/BhIA5WNQCviGjG0DF
	yeUSBT8hmSjenTcQnVDZX9oGmVaoSAT8O3hTHGlKo5uJacpz68uQcoVQ2+0teuPwLf1g
	wm1BWxHEq4iSprBMRAqNDb1V/TXR6SFoEVyrp5ZdC1u9d2pHu17eZt7rkQr+gWesRDud
	gKP7IrgF5yMHj7jEtMB8Ad6CGLsNiZoO49q/2wFT6zNZg+kWn0D9U1cZ90XjAOoQX9Xi
	2k6OvnsBwtIpE/zKAF0RqXt/5gBSU+QX2Zu7qq003fZ9ebXPK6CsjF+GB+kDdShiYIsJ
	Bx+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=i3Rc0nq+kzz6QuCgoURENxMWMoaepS4ZH5j4a96eTwU=;
	b=mit8jdzoUfdJtB9b59D7SdgUymQX3jAczaqDHphrjvgOiPfTxfyYqcEJtlgxenAEQj
	mQdvEzOC7lCzGxpQRVrdj1/hRPDKPRf0QmXnL71SruWRpseLig/5KrqYN/ne+5Xi3wbU
	0CJOB5xCA4B6pU9bKUsXaehp6WjCqkYrOfQxtAaFCFebo+N3SwBYOcJRJ4CXpKqVnVB5
	ZgYp5gQq6ZLWAty99v2zhSxshv9M+Z0RbygL8g5u9qBQ7tJV+1CLFquvQxlEFFhZURsm
	obq/nQzU3RxMwxO6ddKeRYAGZSV5szjnqaNuAAV6lf6VWEZI7gaI2C9gdRG++ANtFlkd
	RlLg==
X-Gm-Message-State: AOUpUlHAFLIqW2XfsBeZdxSwDhOo6guEjU+0iZRFhLSQfeGaXmEBrVtW
	zva4TgQjOnZzfFIxwf0x8Ll8uILI
X-Google-Smtp-Source: AAOMgpfMe1nHNcvcItzs78uFivUhSWTaQf5BcGxx4BIFzDps8hUr9aS1hch6d88FhBBVeB3kukjsrA==
X-Received: by 2002:a1c:b586:: with SMTP id
	e128-v6mr1182916wmf.141.1532085330094; 
	Fri, 20 Jul 2018 04:15:30 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	67-v6sm1404665wmg.34.2018.07.20.04.15.29
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 20 Jul 2018 04:15:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jul 2018 11:15:26 +0000
Message-Id: <f0c42b1dcae7712bb5de0a57e75a25194ef938b1.1532085117.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1532085117.git.Martin.Jansa@gmail.com>
References: <cover.1532085117.git.Martin.Jansa@gmail.com>
Subject: [PATCH 2/3] linux-firmware: update LICENSE for bcm43* packages according to WHENCE file
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
X-List-Received-Date: Fri, 20 Jul 2018 11:15:29 -0000

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


