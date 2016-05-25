Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B9075606BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 14:09:07 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 25 May 2016 07:06:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,364,1459839600"; d="scan'208";a="708737259"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 25 May 2016 07:06:59 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 8045F6A4006
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 07:54:28 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 May 2016 17:07:40 +0300
Message-Id: <1464185260-892-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1464185260-892-1-git-send-email-maxin.john@intel.com>
References: <1464185260-892-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/2] linux-firmware: update to git rev 80d463be82
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
X-List-Received-Date: Wed, 25 May 2016 14:09:07 -0000

- change in amdgpu firmware copyright year
- change in radeon firmware copyright year

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 95a57d7..52fd176 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -62,7 +62,7 @@ LIC_FILES_CHKSUM = "\
     file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
     file://LICENCE.adsp_sst;md5=615c45b91a5a4a9fe046d6ab9a2df728 \
     file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31 \
-    file://LICENSE.amdgpu;md5=a8592c24c2672062e03c7392fc7fe3bc \
+    file://LICENSE.amdgpu;md5=3fe8a3430700a518990c3b3d75297209 \
     file://LICENSE.amd-ucode;md5=3a0de451253cc1edbf30a3c621effee3 \
     file://LICENCE.atheros_firmware;md5=30a14c7823beedac9fa39c64fdd01a13 \
     file://LICENSE.atmel;md5=aa74ac0c60595dee4d4e239107ea77a3 \
@@ -98,7 +98,7 @@ LIC_FILES_CHKSUM = "\
     file://LICENSE.QualcommAtheros_ar3k;md5=b5fe244fb2b532311de1472a3bc06da5 \
     file://LICENSE.QualcommAtheros_ath10k;md5=b5fe244fb2b532311de1472a3bc06da5 \
     file://LICENCE.r8a779x_usb3;md5=4c1671656153025d7076105a5da7e498 \
-    file://LICENSE.radeon;md5=6c7f97c6c62bdd9596d0238bb205118c \
+    file://LICENSE.radeon;md5=69612f4f7b141a97659cb1d609a1bde2 \
     file://LICENCE.ralink_a_mediatek_company_firmware;md5=728f1a85fd53fd67fa8d7afb080bc435 \
     file://LICENCE.ralink-firmware.txt;md5=ab2c269277c45476fb449673911a2dfd \
     file://LICENCE.rtlwifi_firmware.txt;md5=00d06cfd3eddd5a2698948ead2ad54a5 \
@@ -112,7 +112,7 @@ LIC_FILES_CHKSUM = "\
     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-    file://WHENCE;md5=2ec7cdcaf7b1f57b77665b4d77b76e50 \
+    file://WHENCE;md5=d4c5506dce2fe59ec0faa20bbd1a89bb \
 "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -172,7 +172,7 @@ NO_GENERIC_LICENSE[Firmware-xc5000] = "LICENCE.xc5000"
 NO_GENERIC_LICENSE[Firmware-xc5000c] = "LICENCE.xc5000c"
 NO_GENERIC_LICENSE[WHENCE] = "WHENCE"
 
-SRCREV = "5f8ca0c1db6106a2d6d7e85eee778917ff03c3de"
+SRCREV = "80d463be829abcee4dbdca8432b9a69452e2021d"
 PE = "1"
 PV = "0.0+git${SRCPV}"
 
-- 
2.4.0


