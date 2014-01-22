Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id D1E476E4CC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 19:37:18 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id hi8so6062910wib.15
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 11:37:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kN6oIjaLQpbMyeo/QPd46JXPikZoGLsywjXI1Gjq2bQ=;
	b=DYZ32kz599gM1sBB6lQNyXhv6GsnLOuTcLmfXYYfRt4GCm07ylPOKtY+caoqM1Awyi
	fHBqZBAKPHRF45tSuOKc6ZDJkMwK9o1lHM9/wanxbRxRTt90g+S6Mp7O1Ae9WwtqD+YI
	IQAO/skcjbffR3tAaR7OinfIs3K/1GV5rGnSADmPk+exAOllSgBlGUE1LcN8pN8H++Y4
	eud6/TdA+OUTtfx7h2Z4rmtQxOU5/xRnAJx0heCClrUtjK721ER02yUgd4clCHUKmBko
	KOxuXas2oviecn+wy6BUCLQhUyrgmxmY31jFKzkWSlDf3n/zt5iVUtaORYB8J2Ij2Sy6
	wtKQ==
X-Gm-Message-State: ALoCoQn0zGJI2UFLka/SJ5EvQ6nHe2TVMR9QTyKF//J3iV18/Rr620VOT1e5UgmWPrSIfC7t2jA4
X-Received: by 10.194.60.103 with SMTP id g7mr3317886wjr.37.1390419439027;
	Wed, 22 Jan 2014 11:37:19 -0800 (PST)
Received: from localhost ([2001:610:612:0:21f:c6ff:feaa:c5fb])
	by mx.google.com with ESMTPSA id v7sm21405920wix.5.2014.01.22.11.37.17
	for <multiple recipients>
	(version=TLSv1.1 cipher=RC4-SHA bits=128/128);
	Wed, 22 Jan 2014 11:37:18 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jan 2014 20:37:12 +0100
Message-Id: <1390419432-19402-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] linux-firmware: split out ATI/AMD Radeon firmware
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
X-List-Received-Date: Wed, 22 Jan 2014 19:37:19 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 3b5c7eb..470f930 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -61,6 +61,7 @@ do_install() {
 
 
 PACKAGES =+ "${PN}-ralink \
+             ${PN}-radeon \
              ${PN}-marvell-license ${PN}-sd8686 ${PN}-sd8787 ${PN}-sd8797 \
              ${PN}-wl12xx ${PN}-vt6656 \
              ${PN}-rtl-license ${PN}-rtl8192cu ${PN}-rtl8192ce ${PN}-rtl8192su \
@@ -105,6 +106,12 @@ FILES_${PN}-ralink = " \
   /lib/firmware/LICENCE.ralink-firmware.txt \
 "
 
+LICENSE_${PN}-radeon = "Firmware-radeon"
+FILES_${PN}-radeon = " \
+  /lib/firmware/radeon \
+  /lib/firmware/LICENCE.radeon \
+"
+
 FILES_${PN}-marvell-license = "/lib/firmware/LICENCE.Marvell"
 
 LICENSE_${PN}-sd8686 = "Firmware-Marvell"
-- 
1.8.3.4


