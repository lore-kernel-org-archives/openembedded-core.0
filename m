Return-Path: <andrew.goodbody@cambrionix.com>
Received: from mail1.bemta3.messagelabs.com (mail1.bemta3.messagelabs.com
	[195.245.230.161])
	by mail.openembedded.org (Postfix) with ESMTP id EFC07601B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 14:07:00 +0000 (UTC)
Received: from [85.158.137.35] by server-1.bemta-3.messagelabs.com id
	36/3A-17152-484E6C75; Wed, 31 Aug 2016 14:07:00 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGIsWRWlGSWpSXmKPExsVyU6aHU7flybF
	wgy3nRSzObGhmt7jz8x27A5PHuY0rGD32fv7NEsAUxZqZl5RfkcCaMenwW5aCx2wVq+9NZW9g
	/M3axcjFISSwgVHi57QOti5GTg42ATOJXa/WsYPYIgKREov/nGcFsZkFTCSWX+1jBrGFBZwkF
	j++BxZnEVCVONjZCtTLwcEr4CfxfG0eSFhCQE7i5rlOsHJeAUGJkzOfsECMkZA4+OIFWFxIQF
	ti+Z4+doh6BYnZqzYwQdipEifnLYGKW0u0/f3APoGRbxaSUbOQjFrAyLSKUb04tagstUjXTC+
	pKDM9oyQ3MTNH19DAWC83tbg4MT01JzGpWC85P3cTIzDM6hkYGHcwXmlzPsQoycGkJMrLNvtY
	uBBfUn5KZUZicUZ8UWlOavEhRhkODiUJXuPHQDnBotT01Iq0zBxgwMOkJTh4lER4mUDSvMUFi
	bnFmekQqVOMuhwLftxeyyTEkpeflyolzvv9EVCRAEhRRmke3AhY9F1ilJUS5mVkYGAQ4ilILc
	rNLEGVf8UozsGoJMy7DGQKT2ZeCdymV0BHMAEdUXDnMMgRJYkIKakGxqcvDmtfZ218vWf3Ayu
	B/KPxXkHKcVfOsq1apFZ0QyxsXU1tD/ehds669gN5LK5cE1fuaJZPqLz3890/LYYKgz3u5Y0n
	/jpwWhYGvTV4JR3S8m1/3twl/92mLHE+/mJpktCpM7WXnf7WVy/j8ctPe3/gd8/9Vses56WuL
	v+/RNtVRbJ5vFnxWYmlOCPRUIu5qDgRAMf0g0q5AgAA
X-Env-Sender: andrew.goodbody@cambrionix.com
X-Msg-Ref: server-7.tower-134.messagelabs.com!1472652419!45828889!2
X-Originating-IP: [217.28.140.9]
X-StarScan-Received: 
X-StarScan-Version: 8.84; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1409 invoked from network); 31 Aug 2016 14:07:00 -0000
Received: from smtp.hs20.net (HELO outlook.hs20.net) (217.28.140.9)
	by server-7.tower-134.messagelabs.com with AES256-SHA256 encrypted SMTP;
	31 Aug 2016 14:07:00 -0000
Received: from cbrx-fw01.CBRX.LOCAL (46.17.166.30) by THHSTE15D2BE2.hs20.net
	(192.168.251.32) with Microsoft SMTP Server (TLS) id 15.0.1178.4;
	Wed, 31 Aug 2016 15:06:58 +0100
From: Andrew Goodbody <andrew.goodbody@cambrionix.com>
To: <openembedded-core@lists.openembedded.org>,
	<manjukumar.harthikote-matha@xilinx.com>
Date: Wed, 31 Aug 2016 15:05:56 +0100
Message-ID: <1472652356-18756-1-git-send-email-andrew.goodbody@cambrionix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [46.17.166.30]
X-ClientProxiedBy: THHSTE15FE06.hs20.net (192.168.251.46) To
	THHSTE15D2BE2.hs20.net (192.168.251.32)
X-EXCLAIMER-MD-CONFIG: 266e7a57-cddd-49fd-bdea-19bca6d40303
Subject: [PATCH] Fix out of tree builds of u-boot with gold linker
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
X-List-Received-Date: Wed, 31 Aug 2016 14:07:01 -0000
Content-Type: text/plain

Need to reference config.mk file in source tree which is no longer
the current directory when using out of tree builds.

Signed-off-by: Andrew Goodbody <andrew.goodbody@cambrionix.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 9e19c4f..915da8e 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -67,7 +67,7 @@ UBOOT_ENV_SYMLINK ?= "${UBOOT_ENV}-${MACHINE}.${UBOOT_ENV_SUFFIX}"
 
 do_compile () {
 	if [ "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', 'ld-is-gold', '', d)}" = "ld-is-gold" ] ; then
-		sed -i 's/$(CROSS_COMPILE)ld$/$(CROSS_COMPILE)ld.bfd/g' config.mk
+		sed -i 's/$(CROSS_COMPILE)ld$/$(CROSS_COMPILE)ld.bfd/g' ${S}/config.mk
 	fi
 
 	unset LDFLAGS
-- 
2.7.4


