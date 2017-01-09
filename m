Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9EA8A71A81
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 11:02:28 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id c206so26337257wme.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jan 2017 03:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=EXUTd2mVyzzj+gkxzqqK5w/59+9xPzrdgz0W/bfJfus=;
	b=KepcdSseW2PWkUbdM5ve1883J99b1BldIsxTz8FCENeHvqytsQ0geTNq/e0SQcuEla
	YotrZOAEws/4f8uLWBih1M5ertRHb1P5makT42uuMK/oVJBQgSeJx6n6PhB5ZB+zJ/5z
	3HavHi2841ERqzeaq2mWhbsZXrMZB7JL5H9O81qKBZ9HCZNAWj/XStkX6LHOsjJw7B/b
	z8ntYQLRJOu0lIAjtetRR3BAzA+dwZi3aE9xo4ni8sfx2mDkdCLI+hGYljv9s2fOw0qc
	dMDXeGcOCsfdcfvYPl7896JPzQoemkZHcWXsqtof7+z0anZAtlFt1IBpeoCguCivIQpc
	YMOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=EXUTd2mVyzzj+gkxzqqK5w/59+9xPzrdgz0W/bfJfus=;
	b=BykvxcPvV4oi7z6Ha/Y04nWFIPZyUib9tjZKuc7Btp3eczaoAZfjuBqBJmc99yNOB8
	t8I0dMATkqEprANaeK2HjJ+IoFj++ye0tN9/6Mar1chT+dQlFKOghIiP3BRTGVO0eka4
	pH2UECa4gj4v6jlS9/axVY8DXryAJenp9t+o4DQf0w1zrA0olA58NK65S8DM69LydJkQ
	RZ0yCsq++VlOGhsnK2TIoEx0JqTi+aYH9nsrZKs9GEoXFAEloVFSW3a7xy3eR5e48PuU
	xuR0mYATBdPC0O7wqUNEOpNEfyIUDXL+Y4oa/S70uTXW4VtEkB3V5H7CmXK/NCAyddNS
	yB+Q==
X-Gm-Message-State: AIkVDXLSxv9pmXUgKq8ooIqziRBrCvzDGggFzaw/VKYV4GHySuGQHZLWijfsk23vt2RW53xQ
X-Received: by 10.28.11.208 with SMTP id 199mr4559353wml.97.1483959748266;
	Mon, 09 Jan 2017 03:02:28 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 6sm122984148wjt.5.2017.01.09.03.02.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 Jan 2017 03:02:27 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jan 2017 11:02:20 +0000
Message-Id: <1483959740-15564-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] linux-firmware: remove alternatives for brcmfmac-stdio.bin
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
X-List-Received-Date: Mon, 09 Jan 2017 11:02:32 -0000

These alternatives are only used to provide an unversioned brcmfmac-sdio.bin,
which was required by kernels prior to 3.13.  As these alternatives all have the
same priority there's no determinism in which one is selected, and current
kernels (since January 2014) use the appropriately versioned firmware names.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../linux-firmware/linux-firmware_git.bb           | 24 +---------------------
 1 file changed, 1 insertion(+), 23 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 1d881d7..4fedcfb 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -186,7 +186,7 @@ SRC_URI[iwlwifi-19.sha256sum] = "2034470df64d323b827c4f2d4d0d55be2846b7360179b55
 
 S = "${WORKDIR}/git"
 
-inherit allarch update-alternatives
+inherit allarch
 
 CLEANBROKEN = "1"
 
@@ -413,10 +413,6 @@ FILES_${PN}-vt6656 = " \
 RDEPENDS_${PN}-vt6656 = "${PN}-vt6656-license"
 
 # For broadcom
-#
-# WARNING: The ALTERNATIVE_* variables are not using ${PN} because of
-# a bug in bitbake; when this is fixed and bitbake learns how to proper
-# pass variable flags with expansion we can rework this patch.
 
 LICENSE_${PN}-bcm4329 = "Firmware-broadcom_bcm43xx"
 LICENSE_${PN}-bcm4330 = "Firmware-broadcom_bcm43xx"
@@ -452,24 +448,6 @@ FILES_${PN}-bcm4354 = " \
   /lib/firmware/brcm/brcmfmac4354-sdio.bin \
 "
 
-ALTERNATIVE_LINK_NAME[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac-sdio.bin"
-
-ALTERNATIVE_linux-firmware-bcm4334 = "brcmfmac-sdio.bin"
-ALTERNATIVE_TARGET_linux-firmware-bcm4334[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac4334-sdio.bin"
-ALTERNATIVE_linux-firmware-bcm43340 = "brcmfmac-sdio.bin"
-ALTERNATIVE_TARGET_linux-firmware-bcm43340[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac43340-sdio.bin"
-ALTERNATIVE_linux_firmware-bcm4354 = "brcmfmac-sdio.bin"
-ALTERNATIVE_TARGET_linux-firmware-bcm4354[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac4354-sdio.bin"
-ALTERNATIVE_linux-firmware-bcm4329 = "brcmfmac-sdio.bin"
-ALTERNATIVE_TARGET_linux-firmware-bcm4329[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac4329-sdio.bin"
-ALTERNATIVE_linux-firmware-bcm4330 = "brcmfmac-sdio.bin"
-ALTERNATIVE_TARGET_linux-firmware-bcm4330[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac4330-sdio.bin"
-ALTERNATIVE_linux-firmware-bcm4339 = "brcmfmac-sdio.bin"
-ALTERNATIVE_TARGET_linux-firmware-bcm4339[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac4339-sdio.bin"
-ALTERNATIVE_PRIORITY_linux-firmware-bcm4339[brcmfmac-sdio.bin] = "20"
-ALTERNATIVE_linux-firmware-bcm43430 = "brcmfmac-sdio.bin"
-ALTERNATIVE_TARGET_linux-firmware-bcm43430[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac43430-sdio.bin"
-
 RDEPENDS_${PN}-bcm4329 += "${PN}-broadcom-license"
 RDEPENDS_${PN}-bcm4330 += "${PN}-broadcom-license"
 RDEPENDS_${PN}-bcm4334 += "${PN}-broadcom-license"
-- 
2.8.1


