Return-Path: <rsalveti@rsalveti.net>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 64DF777D80
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 May 2017 20:02:41 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id u75so2328302qka.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 May 2017 13:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rsalveti-net.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=SpjT4bDZ17Qwjhw29nAclnZNle3lf4XWgNaJKwOMCyM=;
	b=LDCLmOlw2ug+KpSxoVq0/PJ+mSVHBKlA7IakjQ9gzKjtREFhEU/Ox571mceejZFsax
	wZmyiNi23D1v72HHFGnumOWnOe7O0GzN01xEMq0lVT2ukZpCRp2K/lJZJhAW04UXIMGD
	7LvWHQaNF3yeSrzppabZN+6ljSUMFXlb7ROuj9dTsStN8CWsjIWSs2RcU7/JvDnjATzk
	0eCmnqUZHqKDy9opfNvcgkJ0953xIN7sjU0onv1EJvJqfU1UifWN0hrShu/1l/TzcTFM
	1RqpcqAV7b9O2/Yxo9dAh3TEHsaMcLmhf7qy2KNgNT7+IipZqoIfHO3sTB+vpyDoxrlz
	bQoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=SpjT4bDZ17Qwjhw29nAclnZNle3lf4XWgNaJKwOMCyM=;
	b=dSy4merBRLxe4xhLkLuiWUeU3z1+p1h9uKyxhHbuuA/xCx1YVTWa5wx4/n0mVTSeoi
	nM5PBX1vhnlR89rKFXEfaDvh1CWND4onTN67mOe5XcnSNk172pciEVWi0Ly0xBlLzisN
	E1hsDH4wWCZTtLm8khDz/0AKFEmnNKNhj35YbVhZSkqcOAlUHRLcf2NVFN8OP3hoRGd1
	RVE495ARRdjmJnGiFwgH7gNBBRCzToYw90dZNTqOAw+PBLdhDb54p/+djQTFQLjwpGHB
	VGaDNFdpY8bByRoznC5WcpG1CTfSJuvZVds97J1Ip47MR3X/QGjoAJwfBXEWlsyQQG2r
	fI/g==
X-Gm-Message-State: AODbwcAPlOdfBeZJmENxeSb3ijQJaSq6XummaHuRmaucQX8kyRG+gFUc
	Eyy7By1uGNrmUz3m
X-Received: by 10.55.215.2 with SMTP id m2mr15687214qki.176.1494014562618;
	Fri, 05 May 2017 13:02:42 -0700 (PDT)
Received: from localhost.localdomain ([189.101.222.224])
	by smtp.gmail.com with ESMTPSA id
	e34sm3828358qtb.43.2017.05.05.13.02.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 May 2017 13:02:41 -0700 (PDT)
From: Ricardo Salveti <rsalveti@rsalveti.net>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 May 2017 17:02:34 -0300
Message-Id: <1494014554-8069-1-git-send-email-rsalveti@rsalveti.net>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] linux-firmware: package Qualcomm QCA firmware
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
X-List-Received-Date: Fri, 05 May 2017 20:02:42 -0000

Firmware files for the QCA61x4 ROME BT family chips. Firmware shares the
same license as used by ath10k.

Signed-off-by: Ricardo Salveti <rsalveti@rsalveti.net>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index be5bdbd..143e8dd 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -231,7 +231,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-broadcom-license ${PN}-bcm4329 ${PN}-bcm4330 ${PN}-bcm4334 ${PN}-bcm43340 ${PN}-bcm4339 ${PN}-bcm43430 ${PN}-bcm4354 \
              ${PN}-atheros-license ${PN}-ar9170 ${PN}-ath6k ${PN}-ath9k \
              ${PN}-gplv2-license ${PN}-carl9170 \
-             ${PN}-ar3k-license  ${PN}-ar3k  ${PN}-ath10k-license  ${PN}-ath10k  \
+             ${PN}-ar3k-license ${PN}-ar3k ${PN}-ath10k-license ${PN}-ath10k ${PN}-qca \
              \
              ${PN}-iwlwifi-license ${PN}-iwlwifi \
              ${PN}-iwlwifi-135-6 \
@@ -292,6 +292,7 @@ LICENSE_${PN}-ar3k = "Firmware-qualcommAthos_ar3k"
 LICENSE_${PN}-ar3k-license = "Firmware-qualcommAthos_ar3k"
 LICENSE_${PN}-ath10k = "Firmware-qualcommAthos_ath10k"
 LICENSE_${PN}-ath10k-license = "Firmware-qualcommAthos_ath10k"
+LICENSE_${PN}-qca = "Firmware-qualcommAthos_ath10k"
 
 FILES_${PN}-ar3k-license = "${nonarch_base_libdir}/firmware/LICENSE.QualcommAtheros_ar3k"
 FILES_${PN}-ar3k = " \
@@ -303,8 +304,13 @@ FILES_${PN}-ath10k = " \
   ${nonarch_base_libdir}/firmware/ath10k \
 "
 
+FILES_${PN}-qca = " \
+  ${nonarch_base_libdir}/firmware/qca \
+"
+
 RDEPENDS_${PN}-ar3k += "${PN}-ar3k-license"
 RDEPENDS_${PN}-ath10k += "${PN}-ath10k-license"
+RDEPENDS_${PN}-qca += "${PN}-ath10k-license"
 
 # For ralink
 LICENSE_${PN}-ralink = "Firmware-ralink-firmware"
-- 
2.7.4


