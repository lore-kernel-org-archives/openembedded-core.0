Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id CB28771BF2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 19:14:54 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id s9-v6so16188740qtg.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 12:14:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=eWC6k4OdhacDYW/5OhiyJ+a/88xD+InOAp+xOAnfUyg=;
	b=U3iksjuj0Hdd1oZHGi4/M2L6NtfSQYsf1XcU0TSLZtyKKc2ksAy0sjQd5btvjfq8Ys
	/i04IBK4+xhzBJK+lCk0qqRTpAl6aY5eID4dOJFJzvUteHP+h0zcPo/6yx9o64okzwgp
	SvVSv4jT7uJRe78uJN/Yhyhp2upU3+xKcfG1VSzeaJiihvnPTcCVxm+pYGxuZJxlqCJv
	zHVqGXRY6WN/WLManCFE+V+hHtUUo0ZGYgucl/w+xsLLRr3SadqW3XF6wMtplZ+5o0gX
	NqR8Nf3mT4NGUDzQls5bcLbsbiaW5JgojWZW6cHqkunyVUbD8LmjCs+OOl6t/y5YFzai
	k58g==
X-Gm-Message-State: APt69E3iGhD1hG6PyzXbxho0TSeHuAsJZsMc3JcexLRr2eGospgxkSyE
	0ZvyBwMLTs+Jb6f0e28CveefDQ==
X-Google-Smtp-Source: ADUXVKKqGlNaCPquEDtkgsqTsqi3Z0Is0ZZROjKOMqfTKqIqqW9mJWSNjL6JISZ4SBF/cUDkf6+xtw==
X-Received: by 2002:a0c:cd89:: with SMTP id
	v9-v6mr11900480qvm.124.1529349295391; 
	Mon, 18 Jun 2018 12:14:55 -0700 (PDT)
Received: from localhost.localdomain ([187.23.153.102])
	by smtp.gmail.com with ESMTPSA id
	m16-v6sm9308167qtn.92.2018.06.18.12.14.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Jun 2018 12:14:54 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 18 Jun 2018 16:14:48 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Jun 2018 16:14:46 -0300
Message-Id: <20180618191447.12465-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.17.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/2] linux-firmware: upgrade to d114732 revision
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
X-List-Received-Date: Mon, 18 Jun 2018 19:14:55 -0000

Following changes are applied:

d114732 Merge branch 'for-upstreaming-v1.7.2-vsw' of https://github.com/felix-cavium/linux-firmware
fe4a9d4 brcm: update firmware for bcm4356 pcie
a292181 brcm: update firmware for bcm4354 sdio
be1c535 brcm: update firmware for bcm43362 sdio
5ac5ad5 brcm: update firmware for bcm43340 sdio
ec734a3 brcm: update firmware for bcm43430 sdio
ba51e86 Update Cypress license termination clause
1fa9ce3 amdgpu: update vega10 VCE firmware to version 55.3
9489f55 linux-firmware: Update firmware patch for Intel Bluetooth 7265 (D0)
6be4747 linux-firmware:Update firmware patch for Intel Bluetooth 7265 (D1)
4949d88 Merge branch 'master' of https://github.com/vgarodia/linux-firmware
7602644 qcom: add venus firmware files for v5.2
7518922 Update AMD cpu microcode for family 15h
3f8243c linux-firmware: Update firmware patch for Intel Bluetooth 8260
2c4f7c1 qed: Add firmware 8.37.2.0
0e193ca linux-firmware: liquidio: update vswitch firmware to v1.7.2
2a9b2cf Merge branch 'for-upstreaming-v1.7.2' of https://github.com/felix-cavium/linux-firmware
112d300 linux-firmware: Update firmware file for Intel Bluetooth,8265
629a5e0 linux-firmware: Update firmware patch for Intel Bluetooth 7260 (B5/B6)
7035335 linux-firmware: Update firmware patch for Intel Bluetooth 7260 (B3/B4)
c84bd66 linux-firmware: Update firmware file for Intel Bluetooth,9260
897330f linux-firmware:Update firmware patch for Intel Bluetooth 7265 (D1)
e94352c linux-firmware: Update firmware file for Intel Bluetooth,9560
7710151 linux-firmware: Update AMD cpu microcode
be1e8c5 Merge commit 'a6327c5a5f74c3d11da76d0dcb51c6f5db7f8a35' of https://github.com/Netronome/linux-firmware
86d39f8 amdgpu: sync up polaris12 firmware with 18.10 release
b5320a9 amdgpu: sync up polaris11 firmware with 18.10 release
152c924 amdgpu: sync up polaris10 firmware with 18.10 release
0d672f7 amdgpu: sync up vega10 firmware with 18.10 release
30447b1 amdgpu: sync up carrizo firmware with 18.10 release
dd6f936 amdgpu: sync up topaz firmware with 18.10 release
de9c175 amdgpu: sync up stoney firmware with 18.10 release
5e22609 amdgpu: sync up tonga firmware with 18.10 release
499042e amdgpu: sync up fiji firmware with 18.10 release
1db3eec amdgpu: sync up raven firmware with 18.10 release
a6327c5 nfp: Add symlink for Agilio CX 1x40GbE flower firmware
8b78780 nfp: update Agilio SmartNIC flower firmware to rev AOTC-2.9.A.16
d3b6941 linux-firmware: liquidio: update firmware to v1.7.2

License-Update: copyright years updated and filelist updated.
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 7d34f421a1..dff34e3e3a 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -66,7 +66,7 @@ LIC_FILES_CHKSUM = "\
     file://LICENCE.adsp_sst;md5=615c45b91a5a4a9fe046d6ab9a2df728 \
     file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31 \
     file://LICENSE.amdgpu;md5=0aa3c2f3e736af320a08a3aeeccecf29 \
-    file://LICENSE.amd-ucode;md5=3a0de451253cc1edbf30a3c621effee3 \
+    file://LICENSE.amd-ucode;md5=3c5399dc9148d7f0e1f41e34b69cf14f \
     file://LICENCE.atheros_firmware;md5=30a14c7823beedac9fa39c64fdd01a13 \
     file://LICENSE.atmel;md5=aa74ac0c60595dee4d4e239107ea77a3 \
     file://LICENCE.broadcom_bcm43xx;md5=3160c14df7228891b868060e1951dfbc \
@@ -118,7 +118,7 @@ LIC_FILES_CHKSUM = "\
     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-    file://WHENCE;md5=6f46986f4e913ef16b765c2319cc5141 \
+    file://WHENCE;md5=eaaf310bac02fee05ea1b334f58c5caf \
 "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -181,7 +181,7 @@ NO_GENERIC_LICENSE[Firmware-xc5000] = "LICENCE.xc5000"
 NO_GENERIC_LICENSE[Firmware-xc5000c] = "LICENCE.xc5000c"
 NO_GENERIC_LICENSE[WHENCE] = "WHENCE"
 
-SRCREV = "8fc2d4e55685bf73b6f7752383da9067404a74bb"
+SRCREV = "d1147327232ec4616a66ab898df84f9700c816c1"
 PE = "1"
 PV = "0.0+git${SRCPV}"
 
-- 
2.17.1


