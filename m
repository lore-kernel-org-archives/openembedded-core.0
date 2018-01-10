Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id D65857017B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jan 2018 17:31:38 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id u76so5068405qku.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jan 2018 09:31:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=N87yZufEOeWEoI1S3qvJz+fbddwY5+OtOKSywZgo09k=;
	b=qWp+ocXCTt5AeFLMLsc46dMjSIMoF3NJE94V5aoH8mIlILmNKH3i9yW3FwUvMrO2fX
	x9kUafNTGXVme3SzxYJlXqLuVQZKcGiy2OeOGLRgGjBccN0mBmtzv51Wv8d4RxxAyDBW
	RizsfNIoje6L4EhH+bJvpsJipOoN1SmMwmIGFGVcpm8CGpgif2I0AI9VHy+ukiX7uIrZ
	bOxgxpE24YyRxyLj21t/W18yRd/cPUpdVIGadY/bZ0kvmYheEuy7wAMcl9fHQXbPkrP5
	+SYhpfQ2wsqqQy5jF8o/h1O5SxNFa/uKVwopsSMQrKQTBfxjV/xJceDheIou/4sLlMw4
	idiQ==
X-Gm-Message-State: AKwxyteSWANXs/ywI5Tu7KgiNxFqnKAPbYMr23mqXQFAGvPx/5UdJC2f
	0gfRTJkQ/GlQkf0YP1JPdMvk6A==
X-Google-Smtp-Source: ACJfBoteqZwPrnC2AgDMt8eZdVPPMOZLQtQGS+aoHbHR0hCH8ZqGh2CXUg6j3Dza6bVyd0gTjlYKnA==
X-Received: by 10.55.133.2 with SMTP id h2mr27380027qkd.329.1515605499343;
	Wed, 10 Jan 2018 09:31:39 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	p7sm10869042qkd.57.2018.01.10.09.31.36
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 10 Jan 2018 09:31:38 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Wed, 10 Jan 2018 15:31:31 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Jan 2018 15:31:29 -0200
Message-Id: <20180110173129.25574-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.15.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] linux-firmware: Bump revision to 65b1c68c
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
X-List-Received-Date: Wed, 10 Jan 2018 17:31:39 -0000

The bump includes following changes:

65b1c68 wl18xx: update firmware file 8.9.0.0.76
8650396 wl127x/wl128x: update firmwares
2eefafb rtlwifi: rtl8723de: Add firmware for new driver/device
4a77cab linux-firmware: DMC firmware for cannonlake v1.07
2567e09 nvidia: add GP108 signed firmware
2451bb2 linux-firmware: liquidio: add v1.7.0 vswitch firmware
7f93c9d brcm: add CYW4373 firmwares and Cypress license file
fdee922 linux-firmware: Update firmware patch for Intel Bluetooth 8260
9a843a1 linux-firmware: Update firmware file for Intel Bluetooth 8265
97339b3 linux-firmware: Add firmware file for Intel Bluetooth 9260
db9964e linux-firmware: Add firmware file for Intel Bluetooth 9560
e4252cf Revert commits a42f895, c113d33, 041aff8, 73d13b5
a42f895 linux-firmware: Update firmware patch for Intel Bluetooth 8260
c113d33 linux-firmware: Update firmware file for Intel Bluetooth 8265
041aff8 linux-firmware: Add firmware file for Intel Bluetooth 9260
73d13b5 linux-firmware: Add firmware file for Intel Bluetooth 9560
30946b9 amdgpu: add firmware for Raven
71a4800 amdgpu: update vega10 vce firmware
89c6211 linux-firmware: intel: Add Cannonlake audio firmware
b39260f nfp: add firmware for tc-flower
c752e24 nfp: change firmware directory layout
00a92a3 nfp: update firmware for Agilio CX SmartNICs
02d857e linux-firmware: DMC firmware for skylake v1.27
17e6288 brcm: update firmware for bcm4358
1841cec brcm: update firmware for bcm4356
b3f4e74 brcm: update firmware for bcm4354
cd86989 brcm: introduce firmware for bcm43430 revision 0
5ee46c2 brcm: update firmware for bcm4339
8e864c2 Mellanox: Add new mlxsw_spectrum firmware 13.1530.152
fd45000 WHENCE: Add missing entry for mlxsw_spectrum firmware
7f9bbc7 WHENCE: Fix typo in entry for iwlwifi-8265-34.ucode
284de20 s2255drv: f2255usb: firmware version 1.2.8
7c705a4 amdgpu: add new CP firmware for polaris chips
5582ca4 qed: Add firmware 8.33.1.0
e721933 qcom: add venus firmware files for v4.2
f36a8e2 qcom: add firmware files for Adreno a530
85313b4 iwlwifi: add firmware version 34 for new 9000 series
6c161c5 linux-firmware: liquidio: update firmware to v1.7.0
b964279 linux-firmware: intel: Update Geminilake audio firmware
c4276b6 iwlwifi: add firmware version 33 for new 9000 series
5a05332 iwlwifi: add new firmware version 34 for 8000C and 8265
1a5fd94 iwlwifi: update firmwares for 3160, 3168, 7260, 7265 and 7265D
796c912 iwlwifi: update firmwares for 3160, 3168, 7265D, 8000C and 8265
1156e62 linux-firmware: DMC firmware for kabylake v1.04
db3e185 linux-firmware: update Marvell PCIe-USB8997 firmware image
de81715 linux-firmware: GuC firmware for kabylake v9.39
434e712 linux-firmware: GuC firmware for Broxton v9.29
0aebd9f linux-firmware: GuC firmware for Skylake v9.33
de5b4c2 linux-firmware/i915: Add Cannonlake DMC version 1.06
8e7c787 linux-firmware/i915: Add Geminilake DMC version 1.04
e0494e9 linux-firmware: update Marvell PCIe-USB8997 firmware image
11db131 linux-firmware: update Marvell PCIe-USB8897-A2 firmware image

Included in those changes, two license checksums has been changed:

 - LICENCE.Netronome: minimal change dropping a word in license name;
 - WHENCE: adjustments due the new firmware versions;

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 8433308a86..b194a59ecb 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -90,7 +90,7 @@ LIC_FILES_CHKSUM = "\
     file://LICENCE.Marvell;md5=9ddea1734a4baf3c78d845151f42a37a \
     file://LICENCE.moxa;md5=1086614767d8ccf744a923289d3d4261 \
     file://LICENCE.myri10ge_firmware;md5=42e32fb89f6b959ca222e25ac8df8fed \
-    file://LICENCE.Netronome;md5=cd2a3e6effe3cdf42731575b8e9477ed \
+    file://LICENCE.Netronome;md5=4add08f2577086d44447996503cddf5f \
     file://LICENCE.nvidia;md5=4428a922ed3ba2ceec95f076a488ce07 \
     file://LICENCE.OLPC;md5=5b917f9d8c061991be4f6f5f108719cd \
     file://LICENCE.open-ath9k-htc-firmware;md5=1b33c9f4d17bc4d457bdb23727046837 \
@@ -116,7 +116,7 @@ LIC_FILES_CHKSUM = "\
     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-    file://WHENCE;md5=038edbc9e744171d8b6235e0224028ba \
+    file://WHENCE;md5=99d352987a7e29460bcf9b26d146a95a \
 "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -178,7 +178,7 @@ NO_GENERIC_LICENSE[Firmware-xc5000] = "LICENCE.xc5000"
 NO_GENERIC_LICENSE[Firmware-xc5000c] = "LICENCE.xc5000c"
 NO_GENERIC_LICENSE[WHENCE] = "WHENCE"
 
-SRCREV = "bf04291309d3169c0ad3b8db52564235bbd08e30"
+SRCREV = "65b1c68c63f974d72610db38dfae49861117cae2"
 PE = "1"
 PV = "0.0+git${SRCPV}"
 
-- 
2.15.1


