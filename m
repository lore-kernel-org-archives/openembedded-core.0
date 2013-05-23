Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f43.google.com (mail-yh0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id 760FF6086B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 21:43:50 +0000 (UTC)
Received: by mail-yh0-f43.google.com with SMTP id a41so173575yho.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 14:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=UeDyxferO93ot1MU0ZMWrsBnSNdxSMnRsOl77mWy2Fs=;
	b=odTzpjHBSvKkZbXjcdf4AiuJhvR2l51YKrB3WDyjCdkYBb0YAt0SUKBS1tx9gwdpV/
	2Vs+gZqM6QJMX8agTiL1cWVO7lvbEWdClSUzKc3NJiBjHImLQ2GbpUfiL+r2pKhALuil
	srNNTAmghj3LvSr15w+TROAdZra5xHxLbsnLnRNCzdZaV70uvMewLW/2QYAOmD+DX+OH
	6071Z9sWDWUuZVnpC0LRnW6dt/MyoIM6mTGrLFhj58MloGHCNmp1ywDps8eqJwWx2jXU
	5m8Z0ZF3uPLgYYnK3v4xsAZTZbNHgqiNcb6dL2Zya9XDCLSWof/trLCn0Ut4wlkxx1L9
	d/Ag==
X-Received: by 10.236.207.162 with SMTP id n22mr9305536yho.45.1369345430746;
	Thu, 23 May 2013 14:43:50 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.194.146])
	by mx.google.com with ESMTPSA id
	j27sm19813811yhf.18.2013.05.23.14.43.48 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 23 May 2013 14:43:50 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 23 May 2013 18:43:29 -0300
Message-Id: <1369345409-19343-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.1
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] linux-firmware: Split 'ar3k' in a linux-firmware-ar3k package
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
X-List-Received-Date: Thu, 23 May 2013 21:43:51 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 414f47a..8b27f14 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -55,7 +55,7 @@ do_install() {
 PACKAGES =+ "${PN}-ralink ${PN}-sd8686 ${PN}-wl12xx ${PN}-vt6656 \
              ${PN}-rtl-license ${PN}-rtl8192cu ${PN}-rtl8192ce ${PN}-rtl8192su \
              ${PN}-broadcom-license ${PN}-bcm4329 ${PN}-bcm4330 ${PN}-bcm4334 \
-             ${PN}-atheros-license ${PN}-ar9170 ${PN}-ath6k ${PN}-ath9k"
+             ${PN}-atheros-license ${PN}-ar9170 ${PN}-ar3k ${PN}-ath6k ${PN}-ath9k"
 
 FILES_${PN}-atheros-license = "/lib/firmware/LICENCE.atheros_firmware"
 
@@ -65,6 +65,12 @@ FILES_${PN}-ar9170 = " \
 "
 RDEPENDS_${PN}-ar9170 += "${PN}-atheros-license"
 
+LICENSE_${PN}-ar3k = "Firmware-atheros_firmware"
+FILES_${PN}-ar3k = " \
+  /lib/firmware/ar3k \
+"
+RDEPENDS_${PN}-ath6k += "${PN}-atheros-license"
+
 LICENSE_${PN}-ath6k = "Firmware-atheros_firmware"
 FILES_${PN}-ath6k = " \
   /lib/firmware/ath6k \
-- 
1.8.1


