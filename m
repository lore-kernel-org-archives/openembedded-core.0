Received: from mail-ye0-f178.google.com ([209.85.213.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UJVGk-0005ON-9n
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Mar 2013 21:42:37 +0100
Received: by mail-ye0-f178.google.com with SMTP id q7so266099yen.23
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Mar 2013 13:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=aeSfeVYsxrO/V3P/i/fRXKgV98BSmOTsxPKZQ7RIL2I=;
	b=aXcHm/+fELv9t1ZPDgUEAj+XoduVSmrm0sUIrp66HM3vcj+/1wkLz1e3V+7kiKPS6d
	QKJ23rb54jdkkxmgqrU2WVDDmqNQhQ2ejHxOgTdeaRyWJdPfseV3NlyMB3KiJxXBIll8
	pZeVMcdc4jSfjjeLn1bbPI6ZVQu/myeiLIqzpdH9TAwh7JnnXtwx7E/z+k9cSkHpriyD
	AldThWDc1+Fs24VNmFQYdT7LdvNmkQ3By+wW74mOJUlGT6MNfTsANeYpPs+aAIjAvklF
	hQwuJU7wrV7yKAjdxy3mESQ6dGJ8gV9z8qN4/tGddLmNwtO12gaRVy53ezpioIn4GAir
	ke9w==
X-Received: by 10.236.128.194 with SMTP id f42mr3856368yhi.197.1364070330349; 
	Sat, 23 Mar 2013 13:25:30 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([187.23.144.59])
	by mx.google.com with ESMTPS id t47sm10040150yhe.22.2013.03.23.13.25.28
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 23 Mar 2013 13:25:29 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Sat, 23 Mar 2013 17:31:00 -0300
Message-Id: <1364070660-13157-4-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.1
In-Reply-To: <1364070660-13157-1-git-send-email-otavio@ossystems.com.br>
References: <1364070660-13157-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 4/4] linux-firmware: Add missing license information for wl12xx
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
X-List-Received-Date: Sat, 23 Mar 2013 20:43:07 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index b181a6b..c1f40fe 100644
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
@@ -98,6 +99,7 @@ FILES_${PN}-rtl8192su = " \
   /lib/firmware/rtlwifi/rtl8712u.bin \
 "
 
+LICENSE_${PN}-wl12xx = "Firmware-ti-connectivity"
 FILES_${PN}-wl12xx = " \
   /lib/firmware/wl12* \
   /lib/firmware/TI* \
-- 
1.8.1



