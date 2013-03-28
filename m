Received: from mail-qa0-f51.google.com ([209.85.216.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1ULGKa-0000zW-81
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Mar 2013 18:09:43 +0100
Received: by mail-qa0-f51.google.com with SMTP id hg5so1655690qab.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2013 09:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=pk2H4lMOYNIBy4zcSVFDcxwrGXm01aMsRN7BdJ1rV/M=;
	b=OCMroX0e8oAs/lbHEbONYbocvom2WkeE5fhJ/UBfz9nIZpd3hmsiyvsiBKApIpTVZO
	gWhJls7lf8r6Zh3PNTw6Px1qHkatIcss9gr7UBUqdLdvfQADpnfvXJZFj3Wjy1yb12eC
	/z7s/jxcHeAcH4EGLvUlwgQaPqofKg2Db1g1O4YqAoCK+vAZb1H5w8dJBlF5weFJpkxM
	t2LKj9QauAYTJl7Bzw3jlt4JXXzQonVUAWrAjMaB32BmewS3zyJbPn8kpq4U3jN71FCK
	mRIhdfQkY5zU4JYlwG2SKnsnNypTbPwz3jE3LeW3vADB6A492IrpdvEzv9s0Oh7uaf3u
	/6bQ==
X-Received: by 10.224.95.131 with SMTP id d3mr19721997qan.0.1364489557257;
	Thu, 28 Mar 2013 09:52:37 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([187.23.144.59])
	by mx.google.com with ESMTPS id eb7sm27757987qab.11.2013.03.28.09.52.34
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 28 Mar 2013 09:52:36 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Mar 2013 13:58:16 -0300
Message-Id: <1364489896-25975-5-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.1
In-Reply-To: <1364489896-25975-1-git-send-email-otavio@ossystems.com.br>
References: <1364489896-25975-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 5/5] linux-firmware: Add missing license information for wl12xx
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
X-List-Received-Date: Thu, 28 Mar 2013 17:10:27 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 6077fad..5ee3b73 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -18,6 +18,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.radeon;md5=e56b405656593a0c97e478513051ea0e \
                     file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31 \
                     file://LICENCE.rtlwifi_firmware.txt;md5=00d06cfd3eddd5a2698948ead2ad54a5 \
                     file://LICENCE.broadcom_bcm43xx;md5=3160c14df7228891b868060e1951dfbc \
+                    file://LICENCE.ti-connectivity;md5=186e7a43cf6c274283ad81272ca218ea \
                     file://LICENCE.atheros_firmware;md5=30a14c7823beedac9fa39c64fdd01a13 \
                     file://LICENCE.via_vt6656;md5=e4159694cba42d4377a912e78a6e850f \
                    "
@@ -114,6 +115,7 @@ FILES_${PN}-rtl8192su = " \
   /lib/firmware/rtlwifi/rtl8712u.bin \
 "
 
+LICENSE_${PN}-wl12xx = "Firmware-ti-connectivity"
 FILES_${PN}-wl12xx = " \
   /lib/firmware/wl12* \
   /lib/firmware/TI* \
-- 
1.8.1



