Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id DC2657C6EA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 13:55:09 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id a15so5742111qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 05:55:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=N8skjAc+V2P9Ax7FO1qFAGy6HD+ZJsRGyQsY9NlfX/Y=;
	b=sFGIMrh2MjdTMs6rhDfB1hEi5SK30e+eQJE+gi/5DhMBPZJ/Qdttm/ejQx/uDWU8JU
	1IesPVty2XCXxjT4kJYlYViJyrecO0Kr2uDcyHS/PsbRDyCuzYlCdj2QFegfKGMxlznM
	XeSMAcLF5ToHmIZdDVr3UxBuTWHJvpIYTGM9vORc+FfQyLUew9bkpHjXMgIAtkDaW0dn
	dRZdnPXWwJ/rd0fxndjyjLDPh9UZnfJ+ciVSNBXywJqG4/mC88gijWvki1nCMJNPYqQu
	ciyX+bYFijJQJ1XyFQ3ig5PKNPH6wChB/JU76Ech/3bMBcZ9efucsfyOpLsHbYpj4lOK
	pjPw==
X-Gm-Message-State: AHQUAuaR84Smz0c2PrjIqF8Ie2SqGNXqYBk4bAEh0W63EjyeL95892WQ
	hQb3cC8afq4A461onuIYgTJOs85T
X-Google-Smtp-Source: AHgI3IZdwgk9FHpTZxe7/swm+E8VQl/QWwh+aE63ECyyFCrd1pl5wWw/+mzQA3fC25ydCSPex/TSIg==
X-Received: by 2002:ae9:c20f:: with SMTP id j15mr6570133qkg.132.1550238910104; 
	Fri, 15 Feb 2019 05:55:10 -0800 (PST)
Received: from localhost.localdomain ([177.194.204.148])
	by smtp.gmail.com with ESMTPSA id
	u64sm2763021qkc.74.2019.02.15.05.55.07
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 15 Feb 2019 05:55:09 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 15 Feb 2019 11:55:04 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Feb 2019 11:55:03 -0200
Message-Id: <20190215135503.5908-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] linux-firmware: Bump to 710963f revision
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
X-List-Received-Date: Fri, 15 Feb 2019 13:55:10 -0000
Content-Transfer-Encoding: 8bit

Following changes are applied:

710963f Merge https://github.com/ajaykuee/linux-firmware
c24aec4 nvidia: add TU10x typec controller firmware
28f5f7d Merge git://git.marvell.com/mwifiex-firmware
f30a319 Merge branch 'ath10k-20190201' of git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/linux-firmware
8fcf0ec bnx2x: Add FW 7.13.11.0.
8bf607c amdgpu: add firmware for vega20 from 18.50
578aee3 amdgpu: bump year on license
bd72387 linux-firmware: update Marvell PCIe-USB8997 firmware image
6cfdd52 linux-firmware: update Marvell SD8897-B0 firmware image
2206320 linux-firmware: add Marvell SD8977 firmware image
6b5e23a ath10k: QCA9984 hw1.0: update firmware-5.bin to 10.4-3.9.0.2-00021
0eef77d ath10k: QCA988X hw2.0: update firmware-5.bin to 10.2.4-1.0-00043
1bd5312 ath10k: QCA9888 hw2.0: update firmware-5.bin to 10.4-3.9.0.2-00024
97b1f93 ath10k: QCA6174 hw3.0: update board-2.bin
a8b75ca Merge tag 'add-rpi-fw' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux-firmware
56483ad brcm: Add BCM43455 NVRAM for Raspberry Pi 3 B+
638a91a brcm: Fix filename for BCM43430 NVRAM for the Raspberry Pi 3 Model B
bc65650 amdgpu: add raven2 fw for 18.50 release
32201bb amdgpu: add picasso fw for 18.50 release
b1eae29 Revert "brcm: Add BCM43455 NVRAM for Raspberry Pi 3 B+"
89d37c6 linux-firmware: Update firmware file for Intel Bluetooth,8265
f089658 linux-firmware: Update firmware patch for Intel Bluetooth 8260
ae90c3b linux-firmware: Update firmware file for Intel Bluetooth,9260
9723ba4 linux-firmware: Update firmware file for Intel Bluetooth,9560
c7148ed Merge tag 'add-rpi-fw' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux-firmware
128441e Merge tag 'iwlwifi-fw-2018-12-30' of git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware
56cbf41 Merge git://git.marvell.com/mwifiex-firmware
930f276 brcm: Add BCM43430 NVRAM for the Raspberry Pi 3 Model B
fca5958 brcm: Add BCM43455 NVRAM for Raspberry Pi 3 B+
63ca64a linux-firmware: update Marvell USB8801 B0 firmware image
b727739 iwlwifi: update firmwares for 9000 series
80dee31 cxgb4: update firmware to revision 1.22.9.0
0f22c85 Revert "amdgpu: update vega10 fw for 18.50 release"
117d211 brcm: Add 4330 NVRAM for the Prowise PT301 tablet
912d6a5 brcm: Add 43430 NVRAM for the Chuwi Vi8 Plus tablet
f16cf5e brcm: Add 43340 based AP6234 NVRAM for the Meegopad T08 HDMI stick
5a2766c brcm: Add 43430a0 based AP6212 NVRAM for the Jumper EZpad mini 3 tablet
867ac13 brcm: Add 43430a0 based AP6212 NVRAM for the Onda V80 Plus tablet
a5662fb brcm: Add 4356 based AP6356 NVRAM for the GPD win handheld
f055ceb brcm: Add brcmfmac43362-sdio.lemaker,bananapro.txt symlink
d9430ac brcm: Add 43362 based AP6210 NVRAM for the Cubietech Cubietruck
eb34562 WHENCE: Put quotes around brcmfmac NVRAM filenames
be15035 check_whence.py: Add support for filenames with spaces in them
e6b9001 rtl_bt: Add firmware and configuration files for the Bluetooth part of RTL8723BS
3de2546 Merge git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware
494709e Merge branch 'BXT_HUC' of git://anongit.freedesktop.org/drm/drm-firmware
8707ef3 iwlwifi: update firmwares for 8000 series
156b549 iwlwifi: add -43.ucode for 9000 series
8a396b6 iwlwifi: update -41.ucode for 9000 series
211de16 brcm: provide new firmwares for BCM4366 chipset
813fa1f Mellanox: Add new mlxsw_spectrum firmware 13.1910.622
a330ddb Merge branch 'for-upstream' of https://github.com/crojewsk/linux-firmware
8de1d88 cavium: Update firmware for CNN55XX crypto driver
a7ea5a8 amdgpu: update vega12 fw for 18.50 release
ec4b0cd amdgpu: update vega10 fw for 18.50 release
1abe3c3 amdgpu: update raven fw for 18.50 release
6e38fef amdgpu: update polaris11 fw for 18.50 release
df89864 amdgpu: update polaris10 fw for 18.50 release
a91e850 amdgpu: add firmware for vega12
6cca138 amdgpu: Add new polaris MC firmwares
e8404a6 amdgpu: Add new polaris SMC firmwares
8aa9e3e linux-firmware: Update AMD cpu microcode
f3f6ada Merge branch 'MSCC-PHYs' of https://github.com/QSchulz/linux-firmware
4bbd950 Merge branch 'for-upstream' of git://git.chelsio.net/pub/git/linux-firmware
d9fb2ee nfp: update Agilio SmartNIC flower firmware to rev AOTC-2.10.A.13
57d49d5 microchip: add firmware for VSC8574 and VSC8584 Ethernet PHYs
82f6dbf linux-firmware: intel: Update Cannonlake audio firmware.
69f153b firmware/huc/bxt: Add huC Update for BXT
5904eab nfp: update Agilio SmartNIC firmware to rev 2.1.16
e7cdec4 cxgb4: update firmware to revision 1.21.5.0

License-Update:
  - LICENSE.amdgpu: Copyright year update;
  - WHENCE: New firmware files additions and version updates;

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index d337d07a53..fdf8f19490 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -66,7 +66,7 @@ LIC_FILES_CHKSUM = "\
     file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
     file://LICENCE.adsp_sst;md5=615c45b91a5a4a9fe046d6ab9a2df728 \
     file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31 \
-    file://LICENSE.amdgpu;md5=88b865bc74f3ffcc54640b4ea8540b46 \
+    file://LICENSE.amdgpu;md5=ab515ef6495ab5c5a3b08ab2db62df11 \
     file://LICENSE.amd-ucode;md5=3c5399dc9148d7f0e1f41e34b69cf14f \
     file://LICENCE.atheros_firmware;md5=30a14c7823beedac9fa39c64fdd01a13 \
     file://LICENSE.atmel;md5=aa74ac0c60595dee4d4e239107ea77a3 \
@@ -122,7 +122,7 @@ LIC_FILES_CHKSUM = "\
     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-    file://WHENCE;md5=cecb9bd279516f42a589647557e806f2 \
+    file://WHENCE;md5=66abf0fb69b09d6f3d2db6088594c808 \
 "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -188,7 +188,7 @@ NO_GENERIC_LICENSE[Firmware-xc5000] = "LICENCE.xc5000"
 NO_GENERIC_LICENSE[Firmware-xc5000c] = "LICENCE.xc5000c"
 NO_GENERIC_LICENSE[WHENCE] = "WHENCE"
 
-SRCREV = "1baa34868b2c0a004dc595b20678145e3fff83e7"
+SRCREV = "710963fe53ee3f227556d36839df3858daf6e232"
 PE = "1"
 PV = "0.0+git${SRCPV}"
 
-- 
2.20.1


