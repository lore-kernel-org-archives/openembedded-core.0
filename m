Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0AAF97949C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 17:27:54 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id d4-v6so11191936qtn.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 10:27:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=B6yrcz2cVVP0WbE6TYe50+G07KJvXNu78hj9wbkH8As=;
	b=J79sgSmvjcZEJfXadgHs2l9+TwvLS6BuMx8eh9+fWHxkzbhH125cMi6TvPUbccKLVp
	tx0fw/DD+6J+5zg/wHf5pdivlIvd2UafMt432ev3ONheoIBCsfbGtbcn2Uo4axNd84td
	tBt9qfzmL+pn8rbAnPa/AeJgK5ltIOXODYz5m9k6Jw3yqKWbveWz9PvdYuInsgApRfbD
	vowWNNEDVEfKUPuL+Z0RDjSl0TUTx2caZs17+vJ8ecNXMrohbF05kDHSu4zoY+dgHbde
	KbMFbszBvVmZwMSmpWzYU+i39lV6jHwR6Gc3n5EbW25uyand9HWK6dNuxoa5X0rasrzS
	EP8g==
X-Gm-Message-State: APzg51CoMwzcBgrkaOPxqYkPv7GztjtHualuJFJfz4CCWVZ+BZ29zlqL
	7sLAH94vML6qL1Cdrp+medEQdQiuPGg=
X-Google-Smtp-Source: ANB0VdbtVPt6UJqxIaM9BKPEn7MIuX1OsKxn3KfvTBh1mw81dnN1JwXH1MKYKzt0NXaSMe+vdJ+ICw==
X-Received: by 2002:a0c:88ad:: with SMTP id
	42-v6mr12589939qvn.79.1535650075629; 
	Thu, 30 Aug 2018 10:27:55 -0700 (PDT)
Received: from localhost.localdomain ([177.194.218.61])
	by smtp.gmail.com with ESMTPSA id
	62-v6sm4795910qkx.66.2018.08.30.10.27.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 30 Aug 2018 10:27:54 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Thu, 30 Aug 2018 14:27:47 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Aug 2018 14:27:36 -0300
Message-Id: <20180830172737.26950-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180830172737.26950-1-otavio@ossystems.com.br>
References: <20180830172737.26950-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 2/3] linux-firmware: Update to feb25f3e revision
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
X-List-Received-Date: Thu, 30 Aug 2018 17:27:55 -0000

It includes following changes:

fea76a0 amdgpu: sync up polaris10 firmware with 18.30 release
ffca603 amdgpu: sync up vega10 firmware with 18.30 release
2ed60eb amdgpu: sync up raven firmware with 18.30 release
02cc45f amdgpu: sync up polaris12 firmware with 18.30 release
b860e58 amdgpu: sync up tonga firmware with 18.30 release
15ed096 amdgpu: sync up polaris11 firmware with 18.30 release
005a9fe amdgpu: sync up fiji firmware with 18.30 release
1d17c18 linux-firmware: add firmware for mhdp8546
c2e0d14 qed: Add firmware 8.37.7.0
f1b95fe linux-firmware:Update firmware patch for Intel Bluetooth 7265 (D1)
8813230 linux-firmware: Update firmware file for Intel Bluetooth,9560
c2d8f1b linux-firmware: Update firmware file for Intel Bluetooth,9260
9767096 linux-firmware: Update firmware file for Intel Bluetooth,8265
41bdd3b linux-firmware: Update firmware patch for Intel Bluetooth 8260
fdd3468 linux-firmware: add firmware for mt76x0
eee8208 Merge commit 'c4883661c7eeedd061eb3b483135b47dab39a88d' of https://github.com/Netronome/linux-firmware
6ae7a5b qcom: update venus firmware files for v5.2
c488366 nfp: update Agilio SmartNIC flower firmware to rev AOTC-2.9.A.31
7b5835f linux-firmware: add firmware for mt76x2u
3a5103f wl18xx: update firmware file 8.9.0.0.79
b01151b Mellanox: Add new mlxsw_spectrum firmware 13.1702.6
0ff06f2 WHENCE: Remove reference to amdgpu/vegam_me_2.bin
3fcf221 linux-firmware: mediatek: add MT7622 Bluetooth firmwares and license file
c8d6903 brcm: add 43430 based AP6212 and 1DX NVRAM
fad829d Merge git://git.marvell.com/mwifiex-firmware
0ced724 linux-firmware: update Marvell USB8801 B0 firmware image
8d69bab amdgpu: update copyright date
153a51e amdgpu: add initial VegaM firmware
10e2971 amdgpu: sync up vega10 firmware with 18.20 release
4b05dee amdgpu: sync up raven firmware with 18.20 release
aeec108 amdgpu: sync up polaris12 firmware with 18.20 release
5408150 amdgpu: sync up polaris11 firmware with 18.20 release
34116bf amdgpu: sync up polaris10 firmware with 18.20 release
a8a2884 amdgpu: sync up verde firmware with 18.20 release
bea8c7f amdgpu: sync up pitcairn firmware with 18.20 release
d47f956 amdgpu: sync up tahiti firmware with 18.20 release
1f92e00 amdgpu: sync up oland firmware with 18.20 release
effed45 amdgpu: sync up hainan firmware with 18.20 release
d50a667 amdgpu: sync up kaveri firmware with 18.20 release
5b8eca3 amdgpu: sync up mullins firmware with 18.20 release
b4b5726 amdgpu: sync up kabini firmware with 18.20 release
fc80838 amdgpu: sync up hawaii firmware with 18.20 release
5350953 amdgpu: sync up bonaire firmware with 18.20 release
8c96b0d WHENCE: Fix typo Version
6213586 cxgb4: update firmware to revision 1.20.8.0

License-Update:
 - LICENSE.amdgpu has a copyright year bump
 - LICENCE.cadence is new
 - LICENCE.mediatek is new
 - WHENCE list the version bumps as well as the new Cadence and
   MediaTek license files and its respective firmware files.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2:
- add new license files
- improve commit log to include License-Update field

 .../linux-firmware/linux-firmware_git.bb               | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 69f9a2adea..1b6be054a2 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -66,12 +66,13 @@ LIC_FILES_CHKSUM = "\
     file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
     file://LICENCE.adsp_sst;md5=615c45b91a5a4a9fe046d6ab9a2df728 \
     file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31 \
-    file://LICENSE.amdgpu;md5=0aa3c2f3e736af320a08a3aeeccecf29 \
+    file://LICENSE.amdgpu;md5=88b865bc74f3ffcc54640b4ea8540b46 \
     file://LICENSE.amd-ucode;md5=3c5399dc9148d7f0e1f41e34b69cf14f \
     file://LICENCE.atheros_firmware;md5=30a14c7823beedac9fa39c64fdd01a13 \
     file://LICENSE.atmel;md5=aa74ac0c60595dee4d4e239107ea77a3 \
     file://LICENCE.broadcom_bcm43xx;md5=3160c14df7228891b868060e1951dfbc \
     file://LICENCE.ca0132;md5=209b33e66ee5be0461f13d31da392198 \
+    file://LICENCE.cadence;md5=009f46816f6956cfb75ede13d3e1cee0 \
     file://LICENCE.cavium;md5=c37aaffb1ebe5939b2580d073a95daea \
     file://LICENCE.chelsio_firmware;md5=819aa8c3fa453f1b258ed8d168a9d903 \
     file://LICENCE.cw1200;md5=f0f770864e7a8444a5c5aa9d12a3a7ed \
@@ -91,6 +92,7 @@ LIC_FILES_CHKSUM = "\
     file://LICENCE.iwlwifi_firmware;md5=3fd842911ea93c29cd32679aa23e1c88 \
     file://LICENCE.kaweth;md5=b1d876e562f4b3b8d391ad8395dfe03f \
     file://LICENCE.Marvell;md5=9ddea1734a4baf3c78d845151f42a37a \
+    file://LICENCE.mediatek;md5=7c1976b63217d76ce47d0a11d8a79cf2 \
     file://LICENCE.moxa;md5=1086614767d8ccf744a923289d3d4261 \
     file://LICENCE.myri10ge_firmware;md5=42e32fb89f6b959ca222e25ac8df8fed \
     file://LICENCE.Netronome;md5=4add08f2577086d44447996503cddf5f \
@@ -120,7 +122,7 @@ LIC_FILES_CHKSUM = "\
     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-    file://WHENCE;md5=eaaf310bac02fee05ea1b334f58c5caf \
+    file://WHENCE;md5=feb25f3efdbe10fcc121005d02d407d6 \
 "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -134,6 +136,7 @@ NO_GENERIC_LICENSE[Firmware-atheros_firmware] = "LICENCE.atheros_firmware"
 NO_GENERIC_LICENSE[Firmware-atmel] = "LICENSE.atmel"
 NO_GENERIC_LICENSE[Firmware-broadcom_bcm43xx] = "LICENCE.broadcom_bcm43xx"
 NO_GENERIC_LICENSE[Firmware-ca0132] = "LICENCE.ca0132"
+NO_GENERIC_LICENSE[Firmware-cadence] = "LICENCE.cadence"
 NO_GENERIC_LICENSE[Firmware-cavium] = "LICENCE.cavium"
 NO_GENERIC_LICENSE[Firmware-chelsio_firmware] = "LICENCE.chelsio_firmware"
 NO_GENERIC_LICENSE[Firmware-cw1200] = "LICENCE.cw1200"
@@ -153,6 +156,7 @@ NO_GENERIC_LICENSE[Firmware-it913x] = "LICENCE.it913x"
 NO_GENERIC_LICENSE[Firmware-iwlwifi_firmware] = "LICENCE.iwlwifi_firmware"
 NO_GENERIC_LICENSE[Firmware-kaweth] = "LICENCE.kaweth"
 NO_GENERIC_LICENSE[Firmware-Marvell] = "LICENCE.Marvell"
+NO_GENERIC_LICENSE[Firmware-mediatek] = "LICENCE.mediatek"
 NO_GENERIC_LICENSE[Firmware-moxa] = "LICENCE.moxa"
 NO_GENERIC_LICENSE[Firmware-myri10ge_firmware] = "LICENCE.myri10ge_firmware"
 NO_GENERIC_LICENSE[Firmware-netronome] = "LICENCE.Netronome"
@@ -184,7 +188,7 @@ NO_GENERIC_LICENSE[Firmware-xc5000] = "LICENCE.xc5000"
 NO_GENERIC_LICENSE[Firmware-xc5000c] = "LICENCE.xc5000c"
 NO_GENERIC_LICENSE[WHENCE] = "WHENCE"
 
-SRCREV = "d1147327232ec4616a66ab898df84f9700c816c1"
+SRCREV = "fea76a04f25fd0a217c0d566ff5ff8f23ad3e648"
 PE = "1"
 PV = "0.0+git${SRCPV}"
 
-- 
2.18.0


