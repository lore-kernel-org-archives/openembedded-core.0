Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
	[209.85.160.180])
	by mail.openembedded.org (Postfix) with ESMTP id 3FEE76C54B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Dec 2018 13:31:49 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id y20so13621994qtm.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Dec 2018 05:31:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=XuHS6GpFPGKhLz62i1VZlMtYtnuiIcP1vFJIRUIDIXo=;
	b=GoTzE8VOY4bXzIuNYGj77YGae/o8XHQwbDaCD7DXORaoJSesViW0ls1+28+05UD1ei
	pj5pRCUuowltUWBb1qaob0SP7329ZkrnTf1cvJR3m2F3otTczn6dU9aVzEGi7e4xZ9kg
	3YL67kxWddnVAEdrFQLFyOE3o1jKk/aUhrATWcDspalmYxpSouwlzy+pxAxGVFjtVsJy
	RJSlcAt8Ndchj/A3b7L/93n+G+M5PNiKWSvWrIKesewIrrdliLa7XhKks85VHnMeosJd
	32uKMtDmBmGvK2JKl6iP9T5DRQa4Ii/aQBPhPoAr6xwFLdAVYG+Vt2l2X77A7r7uk7LH
	va+A==
X-Gm-Message-State: AA+aEWawjfBzkZYBQhRBZV/LppilKcNXkZfyVDdRjX5UZf0ROTahvVrA
	FA2KW1UiUEGOOjP2dUOI0aFkpHnI
X-Google-Smtp-Source: AFSGD/X6GsRN7b1+t+foe9MWeFDTxj/aKMGrsuhw5jP3i+NcwMWpKu862B7/xg6+KZp+Uv2nr4L6QQ==
X-Received: by 2002:a0c:8b64:: with SMTP id d36mr15382432qvc.233.1543843909801;
	Mon, 03 Dec 2018 05:31:49 -0800 (PST)
Received: from localhost.localdomain ([181.220.65.91])
	by smtp.gmail.com with ESMTPSA id
	q5sm13957316qtq.20.2018.12.03.05.31.47
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 03 Dec 2018 05:31:49 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 03 Dec 2018 11:31:44 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon,  3 Dec 2018 11:31:43 -0200
Message-Id: <20181203133144.18726-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] linux-firmware: Bump revision to 1baa348
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
X-List-Received-Date: Mon, 03 Dec 2018 13:31:49 -0000
Content-Transfer-Encoding: 8bit

This adds following changes:

1baa348 Merge branch 'nxp_mc' of https://github.com/NXP/linux-firmware
c7ba355 qed: Add 8.37.7.0 firmware image
1cb4e51 amdgpu: add raven dmcu firmware
aa71b2d amdgpu: update raven firmware to 18.40
fcd5a5f amdgpu: update fiji firmware to 18.40
453caa3 amdgpu: update tonga firmware to 18.40
7ceb224 amdgpu: update carrizo firmware to 18.40
a136e78 amdgpu: update polaris10 firmware to 18.40
ac5f8bd amdgpu: update vega10 firmware to 18.40
8d3825c linux-firmware: add firmware for mt7650e
96d6db5 linux-firmware: add MC firmware for NXP DPAA2 SoCs
d877533 linux-firmware: liquidio: fix GPL compliance issue
2618544 linux-firmware: Update firmware file for Intel Bluetooth,8265
c34a52a linux-firmware: Update firmware patch for Intel Bluetooth 8260
d8e8163 linux-firmware: Update firmware file for Intel Bluetooth,9260
66b58d4 linux-firmware: Update firmware file for Intel Bluetooth,9560
50b8b0b linux-firmware: add firmware for mt7610e
de9cefa Merge branch 'firmware-update' of https://github.com/01org/opa-firmware
951cd9e Merge branch 'ath10k-20181010' of git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/linux-firmware
c6398e3 Update Intel OPA hfi1 firmware
eaceb79 ath10k: QCA9984 hw1.0: update board-2.bin
a00e61b ath10k: QCA9984 hw1.0: update firmware-5.bin to 10.4-3.6.0.1-00003
50d4180 ath10k: QCA988X hw2.0: update firmware-5.bin to 10.2.4-1.0-00041
427d31d ath10k: QCA9888 hw2.0: update board-2.bin
d87e815 ath10k: QCA9888 hw2.0: update firmware-5.bin to 10.4-3.6-00140
097bbdf ath10k: QCA9887 hw1.0: update firmware-5.bin to 10.2.4-1.0-00041
3e2e5d3 ath10k: QCA9377 hw1.0: add firmware-6.bin to WLAN.TF.2.1-00021-QCARMSWP-1
a87eb5f ath10k: QCA6174 hw3.0: update firmware-6.bin to RM.4.4.1.c2-00057-QCARMSWP-1
14024d3 ath10k: QCA4019 hw1.0: update board-2.bin
2ac415e ath10k: QCA4019 hw1.0: update firmware-5.bin to 10.4-3.6-00140
f503e1d nfp: Add Agilio BPF firmware rev 2.0.6.124
c6b6265 Merge tag 'iwlwifi-fw-2018-10-03' of git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware
338684a rtw88: Add firmware file for driver rtw88
68a4930 nfp: update Agilio SmartNIC flower firmware to rev AOTC-2.9.A.37
da110f2 iwlwifi: add -41.ucode firmwares for 9000 series
b1ac8f4 iwlwifi: update firmwares for 9000 series
58265e0 iwlwifi: update firmwares for 7000, 8000 and 9000 series
dc638d6 nfp: update Agilio SmartNIC firmware to rev 2.1.13
7c81f23 ti-connectivity: add firmware for CC2560(A) Bluetooth
f0a1cbf linux-firmware: mediatek: add firmware for mt7668u Bluetooth
eb6419c nvidia: add GV100 signed firmware
1ab9095 Merge git://git.marvell.com/mwifiex-firmware
2ddd8f0 Merge branch 'master' of https://github.com/bgodavar/qca_rome_firmware
18c4c8a firmware/icl/dmc: Add v1.07 of DMC for Icelake
52b23a9 linux-firmware: add Marvell SD8997 firmware image
534daf4 qca: update BT firmware files for QCA ROME chip.

License-Update: new firmware files additions
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 2525545bdd..2f2e780bd1 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -122,7 +122,7 @@ LIC_FILES_CHKSUM = "\
     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-    file://WHENCE;md5=36ef3e9887bb8b38ff265c602de6740e \
+    file://WHENCE;md5=cecb9bd279516f42a589647557e806f2 \
 "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -188,7 +188,7 @@ NO_GENERIC_LICENSE[Firmware-xc5000] = "LICENCE.xc5000"
 NO_GENERIC_LICENSE[Firmware-xc5000c] = "LICENCE.xc5000c"
 NO_GENERIC_LICENSE[WHENCE] = "WHENCE"
 
-SRCREV = "44d4fca9922a252a0bd81f6307bcc072a78da54a"
+SRCREV = "1baa34868b2c0a004dc595b20678145e3fff83e7"
 PE = "1"
 PV = "0.0+git${SRCPV}"
 
-- 
2.19.2


