Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id EB2777842F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 01:24:35 +0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id 93-v6so4729612qks.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 18:24:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=CAS/xFeJYdLZ68DVqCMRwen3Q80/bM4TcRESe2i56TA=;
	b=ed4+F1Py0pZWIhXM5Ph4UWwXltpU/+LZtz1b9IYXlv+04Rzyg3yfzNsgT2P/EHTsYj
	AB0jYFGbo6M6nDCnyBI7F5bB/07rvIiQViyzyl76ZwmOKWIUo6qdTiMzPWXIGkvVeO1+
	UeOoO+daKtRC+nPfZ8x7WEbIVacSSNOSf2IadMmR45GB7Sr3ufa7uYZCqOi3fQfcIwG4
	KXf81lcNY1PF4pbleXV7GW1adBnN4MksvyTfhFTTxV2IoUnklmT/AlV0J6hYIc/oFE0w
	1PQjaORtoq6tFKEXt1voryzD7z+mVZgScphcI0v1rVO8JOrqvEHOGnA8+kwUsqNXnqIA
	2hpw==
X-Gm-Message-State: APzg51BYrm7o6QaMhv6QrIpoBeJIPZny9QbMLfKhHFtg3uhKqHHWyzNR
	rm2rkoFrlUPqnwY2yivTHqZYiZYw9ew=
X-Google-Smtp-Source: ANB0VdY/5k32R3NzadGe8m0yLmnY6HOGlHBnBNPYEYO9rdVfx4cUocnWAGQOtCPAOTsYMfCe7vCodA==
X-Received: by 2002:a37:e216:: with SMTP id
	g22-v6mr9168926qki.61.1535592276464; 
	Wed, 29 Aug 2018 18:24:36 -0700 (PDT)
Received: from localhost.localdomain ([177.194.218.61])
	by smtp.gmail.com with ESMTPSA id
	x32-v6sm3675489qtb.70.2018.08.29.18.24.33
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 29 Aug 2018 18:24:35 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Wed, 29 Aug 2018 22:24:31 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Aug 2018 22:24:21 -0300
Message-Id: <20180830012422.7886-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180830012422.7886-1-otavio@ossystems.com.br>
References: <20180830012422.7886-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/3] linux-firmware: Update to feb25f3e revision
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
X-List-Received-Date: Thu, 30 Aug 2018 01:24:36 -0000

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

The LICENSE.amdgpu changes is just a copyright year bump and the
WHENCE list the version bumps as well as the new Cadence and MediaTek
license files and its respective firmware files.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 69f9a2adea..38faa53e5d 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -66,7 +66,7 @@ LIC_FILES_CHKSUM = "\
     file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
     file://LICENCE.adsp_sst;md5=615c45b91a5a4a9fe046d6ab9a2df728 \
     file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31 \
-    file://LICENSE.amdgpu;md5=0aa3c2f3e736af320a08a3aeeccecf29 \
+    file://LICENSE.amdgpu;md5=88b865bc74f3ffcc54640b4ea8540b46 \
     file://LICENSE.amd-ucode;md5=3c5399dc9148d7f0e1f41e34b69cf14f \
     file://LICENCE.atheros_firmware;md5=30a14c7823beedac9fa39c64fdd01a13 \
     file://LICENSE.atmel;md5=aa74ac0c60595dee4d4e239107ea77a3 \
@@ -120,7 +120,7 @@ LIC_FILES_CHKSUM = "\
     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-    file://WHENCE;md5=eaaf310bac02fee05ea1b334f58c5caf \
+    file://WHENCE;md5=feb25f3efdbe10fcc121005d02d407d6 \
 "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -184,7 +184,7 @@ NO_GENERIC_LICENSE[Firmware-xc5000] = "LICENCE.xc5000"
 NO_GENERIC_LICENSE[Firmware-xc5000c] = "LICENCE.xc5000c"
 NO_GENERIC_LICENSE[WHENCE] = "WHENCE"
 
-SRCREV = "d1147327232ec4616a66ab898df84f9700c816c1"
+SRCREV = "fea76a04f25fd0a217c0d566ff5ff8f23ad3e648"
 PE = "1"
 PV = "0.0+git${SRCPV}"
 
-- 
2.18.0


