Received: from mail-qe0-f46.google.com ([209.85.128.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1ULGKU-0000yu-AC
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Mar 2013 18:09:40 +0100
Received: by mail-qe0-f46.google.com with SMTP id a11so5318756qen.19
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2013 09:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=/eqzhlx6g0+AcQsUCkSK07edJVOGSaK8v2XHoWcdN2k=;
	b=dR2GexBbALTaE++E5NOdqDqXbqzNV6cp5/kqy6bNHE3H8XBEKiOAlFfk2RYUqAtE9G
	7BuRKhxmEYHWhe2gijJhbRdQ6ZuOGwesb0lTiiTLgwwNTTeY/JpkLaHM56fERHZsUqhD
	FPsop/mVMrQCQH6VD2q1tysvVHkryZrpzCXcZzysyyaD9vh5NntHWYyaZXQ4IozJ+g1L
	lq5KRAEDfzaQJxv9v1IgQH82U8ld5GLaVrqLdV/9G0LvexCr/szQSyXbjwSXBdRGPeMF
	B33zvP1zQ8k6tEUosum+Z6QxO7fdC51L4KY4vUBHTs/e56ldXkYni5oqf6oqLWYhBhQS
	kzOw==
X-Received: by 10.229.76.95 with SMTP id b31mr1609263qck.83.1364489551199;
	Thu, 28 Mar 2013 09:52:31 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([187.23.144.59])
	by mx.google.com with ESMTPS id eb7sm27757987qab.11.2013.03.28.09.52.28
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 28 Mar 2013 09:52:30 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Mar 2013 13:58:14 -0300
Message-Id: <1364489896-25975-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.1
In-Reply-To: <1364489896-25975-1-git-send-email-otavio@ossystems.com.br>
References: <1364489896-25975-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 3/5] linux-firmware: Package Reaktek and Broadcom licenses
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Mar 2013 17:09:51 -0000

The licenses need to be included onto rootfs so we have a new package
for license file when we have multiple packages for same vendor. This
patch does this change for current packages in this specific case.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../linux-firmware/linux-firmware_git.bb           | 26 ++++++++++++++--------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index a75a0e1..a2e12f2 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -49,9 +49,9 @@ do_install() {
 	( cd ${D}/lib/firmware ; ln -sf ti-connectivity/* . )
 }
 
-PACKAGES =+ "${PN}-ralink ${PN}-sd8686 ${PN}-rtl8192cu \
-             ${PN}-rtl8192ce ${PN}-rtl8192su ${PN}-wl12xx \
-             ${PN}-bcm4329 ${PN}-bcm4330 ${PN}-bcm4334"
+PACKAGES =+ "${PN}-ralink ${PN}-sd8686 ${PN}-wl12xx \
+             ${PN}-rtl-license ${PN}-rtl8192cu ${PN}-rtl8192ce ${PN}-rtl8192su \
+             ${PN}-broadcom-license ${PN}-bcm4329 ${PN}-bcm4330 ${PN}-bcm4334"
 
 LICENSE_${PN}-ralink = "Firmware-ralink"
 FILES_${PN}-ralink = " \
@@ -66,16 +66,22 @@ FILES_${PN}-sd8686 = " \
   /lib/firmware/LICENCE.libertas \
 "
 
+FILES_${PN}-rtl-license = " \
+  /lib/firmware/rtlwifi/LICENCE.rtlwifi_firmware.txt \
+"
+
 LICENSE_${PN}-rtl8192cu = "Firmware-rtlwifi"
 FILES_${PN}-rtl8192cu = " \
   /lib/firmware/rtlwifi/rtl8192cufw.bin \
-  /lib/firmware/rtlwifi/LICENCE.rtlwifi_firmware.txt \
 "
+RDEPENDS_${PN}-rtl8192cu += "${PN}-rtl-license"
 
 LICENSE_${PN}-rtl8192ce = "Firmware-rtlwifi"
 FILES_${PN}-rtl8192ce = " \
   /lib/firmware/rtlwifi/rtl8192cfw.bin \
 "
+RDEPENDS_${PN}-rtl8192ce += "${PN}-rtl-license"
+
 
 LICENSE_${PN}-rtl8192su = "Firmware-rtlwifi"
 FILES_${PN}-rtl8192su = " \
@@ -94,29 +100,31 @@ FILES_${PN}-wl12xx = " \
 
 ALTERNATIVE_LINK_NAME[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac-sdio.bin"
 
+FILES_${PN}-broadcom-license = " \
+  /lib/firmware/LICENCE.broadcom_bcm43xx \
+"
+
 LICENSE_${PN}-bcm4329 = "Firmware-bcm4329"
 FILES_${PN}-bcm4329 = " \
   /lib/firmware/brcm/brcmfmac4329.bin \
-  /lib/firmware/LICENCE.broadcom_bcm43xx \
 "
+RDEPENDS_${PN}-bcm4329 += "${PN}-broadcom-license"
 ALTERNATIVE_linux-firmware-bcm4329 = "brcmfmac-sdio.bin"
 ALTERNATIVE_TARGET_linux-firmware-bcm4329[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac4329.bin"
 
 LICENSE_${PN}-bcm4330 = "Firmware-bcm4330"
 FILES_${PN}-bcm4330 = " \
   /lib/firmware/brcm/brcmfmac4330.bin \
-  /lib/firmware/LICENCE.broadcom_bcm43xx \
 "
-
+RDEPENDS_${PN}-bcm4330 += "${PN}-broadcom-license"
 ALTERNATIVE_linux-firmware-bcm4330 = "brcmfmac-sdio.bin"
 ALTERNATIVE_TARGET_linux-firmware-bcm4330[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac4330.bin"
 
 LICENSE_${PN}-bcm4334 = "Firmware-bcm4334"
 FILES_${PN}-bcm4334 = " \
   /lib/firmware/brcm/brcmfmac4334.bin \
-  /lib/firmware/LICENCE.broadcom_bcm43xx \
 "
-
+RDEPENDS_${PN}-bcm4334 += "${PN}-broadcom-license"
 ALTERNATIVE_linux-firmware-bcm4334 = "brcmfmac-sdio.bin"
 ALTERNATIVE_TARGET_linux-firmware-bcm4334[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac4334.bin"
 
-- 
1.8.1



