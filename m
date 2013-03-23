Received: from mail-ye0-f170.google.com ([209.85.213.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UJVGh-0005O6-PT
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Mar 2013 21:42:24 +0100
Received: by mail-ye0-f170.google.com with SMTP id q9so264099yen.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Mar 2013 13:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=NcRqC3wn0F072S5xRFYLWn887uR1JuDyRdinYJUWlto=;
	b=vVvyh1w4foEfnJZyUipI57dSgpJ7FKrCxv0d9e5PQUvT6A1S6JCndboo7tn7dljD00
	7wtO7Gp4YBxOug9AMOrekE65odQCa4XD/F0SP7iO92h2hlf13IbP42LDaEZRwg5a4ftU
	VJtcU75MRzKHtoYcnmP8VgJUjsucs1rW0V5SdfCe632lJjMHXXlfKkwzGe0RZbJgVx1E
	pB+9UmjUTpDVrYOXHOpE6NyrVdpL28g6wvtqEBPuBxyktik7srnKhbQDElYKy6xjj3XC
	enBdaYv7QFxLwaN62uOw15dJrqQfYaSu41cXq3Uv315UrAeryMZanKrTRcSQrSHBPS7/
	f8Ow==
X-Received: by 10.236.0.20 with SMTP id 20mr3886294yha.182.1364070327825;
	Sat, 23 Mar 2013 13:25:27 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([187.23.144.59])
	by mx.google.com with ESMTPS id t47sm10040150yhe.22.2013.03.23.13.25.26
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 23 Mar 2013 13:25:27 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Sat, 23 Mar 2013 17:30:59 -0300
Message-Id: <1364070660-13157-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.1
In-Reply-To: <1364070660-13157-1-git-send-email-otavio@ossystems.com.br>
References: <1364070660-13157-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 3/4] linux-firmware: Package vt6656, ath6k, ath9k and ar9170
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
X-List-Received-Date: Sat, 23 Mar 2013 20:42:25 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../linux-firmware/linux-firmware_git.bb           | 29 +++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 99c226c..b181a6b 100644
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
@@ -48,7 +50,27 @@ do_install() {
 
 PACKAGES =+ "${PN}-ralink ${PN}-sd8686 ${PN}-rtl8192cu \
              ${PN}-rtl8192ce ${PN}-rtl8192su ${PN}-wl12xx \
-             ${PN}-bcm4329 ${PN}-bcm4330 ${PN}-bcm4334"
+             ${PN}-bcm4329 ${PN}-bcm4330 ${PN}-bcm4334 \
+             ${PN}-vt6656 ${PN}-ar9170 ${PN}-ath6k \
+             ${PN}-ath9k"
+
+LICENSE_${PN}-9170 = "Firmware-atheros_firmware"
+FILES_${PN}-ar9170 = " \
+  /lib/firmware/ar9170*.fw \
+"
+
+LICENSE_${PN}-ath6k = "Firmware-atheros_firmware"
+FILES_${PN}-ath6k = " \
+  /lib/firmware/ath6k \
+"
+
+LICENSE_${PN}-ath9k = "Firmware-atheros_firmware"
+FILES_${PN}-ath9k = " \
+  /lib/firmware/ar9271.fw \
+  /lib/firmware/ar7010*.fw \
+  /lib/firmware/htc_9271.fw \
+  /lib/firmware/htc_7010.fw \
+"
 
 LICENSE_${PN}-ralink = "Firmware-ralink"
 FILES_${PN}-ralink = " \
@@ -82,6 +104,11 @@ FILES_${PN}-wl12xx = " \
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



