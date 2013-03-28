Received: from mail-qe0-f54.google.com ([209.85.128.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1ULGKX-0000zT-FW
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Mar 2013 18:09:40 +0100
Received: by mail-qe0-f54.google.com with SMTP id i11so5280961qej.41
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2013 09:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=3evtCyOant/LiLzljlAWiQ0gVx8873PO0vOae8WmnSY=;
	b=PUOTsZ8IBRtfEa61fRhQ9hYbVhHQs9rt638bJ9qN5eNbJ+ebpJKAuSG8wwJ7PjXi6e
	kttp69FBVXefwMqR5FfRg8U06bYM6vJ/0NjXT23DRZL1bg6ddZjq8yNh96MNf/r71MYF
	43bfQYSrl6jhaJrJu7kxLjSgFz5a8CFTKsJz5vJ6130uWb1bXjAk2HmCjBwJesSqwr0T
	TF33XJA5b4EyoGDUX5pVTXjBw3SCu2WNVnwTFwGhj3ugcTGVhN84BMbdky8AwvS90AV0
	rPU1m/LiGIwgWb/0wMs0Kf0+47FYiSqBEzEDk7CjIvUFGfaD5cFG6m6M+K4tGm0KLX4d
	0kkw==
X-Received: by 10.224.17.72 with SMTP id r8mr19769257qaa.48.1364489554465;
	Thu, 28 Mar 2013 09:52:34 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([187.23.144.59])
	by mx.google.com with ESMTPS id eb7sm27757987qab.11.2013.03.28.09.52.31
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 28 Mar 2013 09:52:33 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Mar 2013 13:58:15 -0300
Message-Id: <1364489896-25975-4-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.1
In-Reply-To: <1364489896-25975-1-git-send-email-otavio@ossystems.com.br>
References: <1364489896-25975-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 4/5] linux-firmware: Package vt6656, ath6k, ath9k and ar9170
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
X-List-Received-Date: Thu, 28 Mar 2013 17:09:51 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../linux-firmware/linux-firmware_git.bb           | 35 ++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index a2e12f2..6077fad 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -18,6 +18,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.radeon;md5=e56b405656593a0c97e478513051ea0e \
                     file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31 \
                     file://LICENCE.rtlwifi_firmware.txt;md5=00d06cfd3eddd5a2698948ead2ad54a5 \
                     file://LICENCE.broadcom_bcm43xx;md5=3160c14df7228891b868060e1951dfbc \
+                    file://LICENCE.atheros_firmware;md5=30a14c7823beedac9fa39c64fdd01a13 \
+                    file://LICENCE.via_vt6656;md5=e4159694cba42d4377a912e78a6e850f \
                    "
 
 SRCREV = "c530a75c1e6a472b0eb9558310b518f0dfcd8860"
@@ -49,9 +51,33 @@ do_install() {
 	( cd ${D}/lib/firmware ; ln -sf ti-connectivity/* . )
 }
 
-PACKAGES =+ "${PN}-ralink ${PN}-sd8686 ${PN}-wl12xx \
+PACKAGES =+ "${PN}-ralink ${PN}-sd8686 ${PN}-wl12xx ${PN}-vt6656 \
              ${PN}-rtl-license ${PN}-rtl8192cu ${PN}-rtl8192ce ${PN}-rtl8192su \
-             ${PN}-broadcom-license ${PN}-bcm4329 ${PN}-bcm4330 ${PN}-bcm4334"
+             ${PN}-broadcom-license ${PN}-bcm4329 ${PN}-bcm4330 ${PN}-bcm4334 \
+             ${PN}-atheros-license ${PN}-ar9170 ${PN}-ath6k ${PN}-ath9k"
+
+FILES_${PN}-atheros-license = "/lib/firmware/LICENCE.atheros_firmware"
+
+LICENSE_${PN}-9170 = "Firmware-atheros_firmware"
+FILES_${PN}-ar9170 = " \
+  /lib/firmware/ar9170*.fw \
+"
+RDEPENDS_${PN}-ar9170 += "${PN}-atheros-license"
+
+LICENSE_${PN}-ath6k = "Firmware-atheros_firmware"
+FILES_${PN}-ath6k = " \
+  /lib/firmware/ath6k \
+"
+RDEPENDS_${PN}-ath6k += "${PN}-atheros-license"
+
+LICENSE_${PN}-ath9k = "Firmware-atheros_firmware"
+FILES_${PN}-ath9k = " \
+  /lib/firmware/ar9271.fw \
+  /lib/firmware/ar7010*.fw \
+  /lib/firmware/htc_9271.fw \
+  /lib/firmware/htc_7010.fw \
+"
+RDEPENDS_${PN}-ath9k += "${PN}-atheros-license"
 
 LICENSE_${PN}-ralink = "Firmware-ralink"
 FILES_${PN}-ralink = " \
@@ -94,6 +120,11 @@ FILES_${PN}-wl12xx = " \
   /lib/firmware/ti-connectivity \
 "
 
+LICENSE_${PN}-vt6656 = "Firmware-via_vt6656"
+FILES_${PN}-vt6656 = " \
+  /lib/firmware/vntwusb.fw \
+"
+
 # WARNING: The ALTERNATIVE_* variables are not using ${PN} because of
 # a bug in bitbake; when this is fixed and bitbake learns how to proper
 # pass variable flags with expansion we can rework this patch.
-- 
1.8.1



