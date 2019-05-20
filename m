Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7ADA47DE3E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 14:12:00 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id i3so13491145wml.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 07:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=iyz53SJeBU9FqVmBNCf7ZIYVKKRu0zubmbG9KurIAYA=;
	b=D1UnYoeAIa6VcIeSJtVy9B3MSEeYmshr2lTJLB6MFw2vDpW/ySoBFZHfEjTg5iAdTQ
	mFU9bfQpntT+G5MoGFIZaiEV1hflf8ftrHIaeEiHBTkf/wDkzJ0viijJ9LpPyuvYOccj
	rHViTuj7lDeB+pCTjl0GsQlSObaB2MWA88l15WFyk/4J/rFLRV929nL1qPXpEThm0Hw3
	h1Gz39OQNK7JBcjwAvytzeZca8b8tOfFry0+i1qlJOM6riEDa3DfCB90Eo4Tg9d5qBrv
	dpnfhh1j8feSdiAP1OqtKSQtUIlAOA6pP5OLJ8r3yRtqsRsAKyCJj9ggN5+f58rh75yI
	utDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=iyz53SJeBU9FqVmBNCf7ZIYVKKRu0zubmbG9KurIAYA=;
	b=Yznf15r1+7h2ZiXUdeAZ7wWFU6b8T7irHFNHZNd+R0QvXjdu+Z7PjUX5Hk/ViiW3o7
	4W6IfYltszdwPG7SEYW/Y5bZCa/pCs4na64qKyqOV5DRYBPOuomorB7Qp3ZQp5unFeAj
	r1ZM8zV7uHp9dezPi5iotivgjyeJdPuRTe0gvgiJSMh4dDhEPtqtSOVrzjCyNvA3kVxI
	ZrWZruegad9j2YMDqyFdCNEE5eNiK/89zSBnNJI2KOA5hXf54TZL4FfJlLrJxJTrt44E
	zWZoEJbue9lHi5B6D32wvhZcHH8moeSz/XbrNMMKiKUl/vrEPhwEikLiqBh4CddyyAZx
	L/kQ==
X-Gm-Message-State: APjAAAUuhqQE9Gb+mzNtmdir4goeHn/K5dEp/L54Vr/mXzf9g766dUQR
	LENypkcxzK2/1bbxgVWFdojBNwK6
X-Google-Smtp-Source: APXvYqzyZdomS4OAarS9A2OYvLGKi0TyzdjyuYqiZHxJqLoqaty4ZGG8eMIPoWr3CgO1n3dRehrbLA==
X-Received: by 2002:a1c:7008:: with SMTP id l8mr11782648wmc.49.1558361521125; 
	Mon, 20 May 2019 07:12:01 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	v5sm36242015wra.83.2019.05.20.07.12.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 07:12:00 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 16:11:12 +0200
Message-Id: <20190520141125.10805-29-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190520141125.10805-1-alex.kanavin@gmail.com>
References: <20190520141125.10805-1-alex.kanavin@gmail.com>
Subject: [PATCH 29/42] linux-firmware: upgrade to latest revision
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
X-List-Received-Date: Mon, 20 May 2019 14:12:00 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../linux-firmware/linux-firmware_git.bb      | 128 +++++++++---------
 1 file changed, 65 insertions(+), 63 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index ad7babf7aa4..8b6ad96dba4 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -7,6 +7,7 @@ LICENSE = "\
     & Firmware-agere \
     & Firmware-amdgpu \
     & Firmware-amd-ucode \
+    & Firmware-amlogic_vdec \
     & Firmware-atheros_firmware \
     & Firmware-atmel \
     & Firmware-broadcom_bcm43xx \
@@ -62,68 +63,68 @@ LICENSE = "\
     & WHENCE \
 "
 
-LIC_FILES_CHKSUM = "\
-    file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
-    file://LICENCE.adsp_sst;md5=615c45b91a5a4a9fe046d6ab9a2df728 \
-    file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31 \
-    file://LICENSE.amdgpu;md5=ab515ef6495ab5c5a3b08ab2db62df11 \
-    file://LICENSE.amd-ucode;md5=3c5399dc9148d7f0e1f41e34b69cf14f \
-    file://LICENCE.atheros_firmware;md5=30a14c7823beedac9fa39c64fdd01a13 \
-    file://LICENSE.atmel;md5=aa74ac0c60595dee4d4e239107ea77a3 \
-    file://LICENCE.broadcom_bcm43xx;md5=3160c14df7228891b868060e1951dfbc \
-    file://LICENCE.ca0132;md5=209b33e66ee5be0461f13d31da392198 \
-    file://LICENCE.cadence;md5=009f46816f6956cfb75ede13d3e1cee0 \
-    file://LICENCE.cavium;md5=c37aaffb1ebe5939b2580d073a95daea \
-    file://LICENCE.chelsio_firmware;md5=819aa8c3fa453f1b258ed8d168a9d903 \
-    file://LICENCE.cw1200;md5=f0f770864e7a8444a5c5aa9d12a3a7ed \
-    file://LICENCE.cypress;md5=48cd9436c763bf873961f9ed7b5c147b \
-    file://LICENSE.dib0700;md5=f7411825c8a555a1a3e5eab9ca773431 \
-    file://LICENCE.e100;md5=ec0f84136766df159a3ae6d02acdf5a8 \
-    file://LICENCE.ene_firmware;md5=ed67f0f62f8f798130c296720b7d3921 \
-    file://LICENCE.fw_sst_0f28;md5=6353931c988ad52818ae733ac61cd293 \
-    file://LICENCE.go7007;md5=c0bb9f6aaaba55b0529ee9b30aa66beb \
-    file://GPL-2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-    file://LICENSE.hfi1_firmware;md5=5e7b6e586ce7339d12689e49931ad444 \
-    file://LICENCE.i2400m;md5=14b901969e23c41881327c0d9e4b7d36 \
-    file://LICENSE.i915;md5=2b0b2e0d20984affd4490ba2cba02570 \
-    file://LICENCE.ibt_firmware;md5=fdbee1ddfe0fb7ab0b2fcd6b454a366b \
-    file://LICENCE.IntcSST2;md5=9e7d8bea77612d7cc7d9e9b54b623062 \
-    file://LICENCE.it913x;md5=1fbf727bfb6a949810c4dbfa7e6ce4f8 \
-    file://LICENCE.iwlwifi_firmware;md5=3fd842911ea93c29cd32679aa23e1c88 \
-    file://LICENCE.kaweth;md5=b1d876e562f4b3b8d391ad8395dfe03f \
-    file://LICENCE.Marvell;md5=9ddea1734a4baf3c78d845151f42a37a \
-    file://LICENCE.mediatek;md5=7c1976b63217d76ce47d0a11d8a79cf2 \
-    file://LICENCE.moxa;md5=1086614767d8ccf744a923289d3d4261 \
-    file://LICENCE.myri10ge_firmware;md5=42e32fb89f6b959ca222e25ac8df8fed \
-    file://LICENCE.Netronome;md5=4add08f2577086d44447996503cddf5f \
-    file://LICENCE.nvidia;md5=4428a922ed3ba2ceec95f076a488ce07 \
-    file://LICENCE.OLPC;md5=5b917f9d8c061991be4f6f5f108719cd \
-    file://LICENCE.open-ath9k-htc-firmware;md5=1b33c9f4d17bc4d457bdb23727046837 \
-    file://LICENCE.phanfw;md5=954dcec0e051f9409812b561ea743bfa \
-    file://LICENCE.qat_firmware;md5=9e7d8bea77612d7cc7d9e9b54b623062 \
-    file://LICENSE.qcom;md5=164e3362a538eb11d3ac51e8e134294b \
-    file://LICENCE.qla1280;md5=d6895732e622d950609093223a2c4f5d \
-    file://LICENCE.qla2xxx;md5=505855e921b75f1be4a437ad9b79dff0 \
-    file://LICENSE.QualcommAtheros_ar3k;md5=b5fe244fb2b532311de1472a3bc06da5 \
-    file://LICENSE.QualcommAtheros_ath10k;md5=cb42b686ee5f5cb890275e4321db60a8 \
-    file://LICENCE.r8a779x_usb3;md5=4c1671656153025d7076105a5da7e498 \
-    file://LICENSE.radeon;md5=68ec28bacb3613200bca44f404c69b16 \
-    file://LICENCE.ralink_a_mediatek_company_firmware;md5=728f1a85fd53fd67fa8d7afb080bc435 \
-    file://LICENCE.ralink-firmware.txt;md5=ab2c269277c45476fb449673911a2dfd \
-    file://LICENCE.rtlwifi_firmware.txt;md5=00d06cfd3eddd5a2698948ead2ad54a5 \
-    file://LICENSE.sdma_firmware;md5=51e8c19ecc2270f4b8ea30341ad63ce9 \
-    file://LICENCE.siano;md5=4556c1bf830067f12ca151ad953ec2a5 \
-    file://LICENCE.tda7706-firmware.txt;md5=835997cf5e3c131d0dddd695c7d9103e \
-    file://LICENCE.ti-connectivity;md5=c5e02be633f1499c109d1652514d85ec \
-    file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c \
-    file://LICENCE.ueagle-atm4-firmware;md5=4ed7ea6b507ccc583b9d594417714118 \
-    file://LICENCE.via_vt6656;md5=e4159694cba42d4377a912e78a6e850f \
-    file://LICENCE.wl1251;md5=ad3f81922bb9e197014bb187289d3b5b \
-    file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
-    file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
-    file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-    file://WHENCE;md5=ef36d3383becd18f36ce32d84109386f \
-"
+LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
+                    file://LICENCE.adsp_sst;md5=615c45b91a5a4a9fe046d6ab9a2df728 \
+                    file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31 \
+                    file://LICENSE.amdgpu;md5=ab515ef6495ab5c5a3b08ab2db62df11 \
+                    file://LICENSE.amd-ucode;md5=3c5399dc9148d7f0e1f41e34b69cf14f \
+                    file://LICENSE.amlogic_vdec;md5=dc44f59bf64a81643e500ad3f39a468a \
+                    file://LICENCE.atheros_firmware;md5=30a14c7823beedac9fa39c64fdd01a13 \
+                    file://LICENSE.atmel;md5=aa74ac0c60595dee4d4e239107ea77a3 \
+                    file://LICENCE.broadcom_bcm43xx;md5=3160c14df7228891b868060e1951dfbc \
+                    file://LICENCE.ca0132;md5=209b33e66ee5be0461f13d31da392198 \
+                    file://LICENCE.cadence;md5=009f46816f6956cfb75ede13d3e1cee0 \
+                    file://LICENCE.cavium;md5=c37aaffb1ebe5939b2580d073a95daea \
+                    file://LICENCE.chelsio_firmware;md5=819aa8c3fa453f1b258ed8d168a9d903 \
+                    file://LICENCE.cw1200;md5=f0f770864e7a8444a5c5aa9d12a3a7ed \
+                    file://LICENCE.cypress;md5=48cd9436c763bf873961f9ed7b5c147b \
+                    file://LICENSE.dib0700;md5=f7411825c8a555a1a3e5eab9ca773431 \
+                    file://LICENCE.e100;md5=ec0f84136766df159a3ae6d02acdf5a8 \
+                    file://LICENCE.ene_firmware;md5=ed67f0f62f8f798130c296720b7d3921 \
+                    file://LICENCE.fw_sst_0f28;md5=6353931c988ad52818ae733ac61cd293 \
+                    file://LICENCE.go7007;md5=c0bb9f6aaaba55b0529ee9b30aa66beb \
+                    file://GPL-2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://LICENSE.hfi1_firmware;md5=5e7b6e586ce7339d12689e49931ad444 \
+                    file://LICENCE.i2400m;md5=14b901969e23c41881327c0d9e4b7d36 \
+                    file://LICENSE.i915;md5=2b0b2e0d20984affd4490ba2cba02570 \
+                    file://LICENCE.ibt_firmware;md5=fdbee1ddfe0fb7ab0b2fcd6b454a366b \
+                    file://LICENCE.IntcSST2;md5=9e7d8bea77612d7cc7d9e9b54b623062 \
+                    file://LICENCE.it913x;md5=1fbf727bfb6a949810c4dbfa7e6ce4f8 \
+                    file://LICENCE.iwlwifi_firmware;md5=3fd842911ea93c29cd32679aa23e1c88 \
+                    file://LICENCE.kaweth;md5=b1d876e562f4b3b8d391ad8395dfe03f \
+                    file://LICENCE.Marvell;md5=9ddea1734a4baf3c78d845151f42a37a \
+                    file://LICENCE.mediatek;md5=7c1976b63217d76ce47d0a11d8a79cf2 \
+                    file://LICENCE.moxa;md5=1086614767d8ccf744a923289d3d4261 \
+                    file://LICENCE.myri10ge_firmware;md5=42e32fb89f6b959ca222e25ac8df8fed \
+                    file://LICENCE.Netronome;md5=4add08f2577086d44447996503cddf5f \
+                    file://LICENCE.nvidia;md5=4428a922ed3ba2ceec95f076a488ce07 \
+                    file://LICENCE.OLPC;md5=5b917f9d8c061991be4f6f5f108719cd \
+                    file://LICENCE.open-ath9k-htc-firmware;md5=1b33c9f4d17bc4d457bdb23727046837 \
+                    file://LICENCE.phanfw;md5=954dcec0e051f9409812b561ea743bfa \
+                    file://LICENCE.qat_firmware;md5=9e7d8bea77612d7cc7d9e9b54b623062 \
+                    file://LICENSE.qcom;md5=164e3362a538eb11d3ac51e8e134294b \
+                    file://LICENCE.qla1280;md5=d6895732e622d950609093223a2c4f5d \
+                    file://LICENCE.qla2xxx;md5=505855e921b75f1be4a437ad9b79dff0 \
+                    file://LICENSE.QualcommAtheros_ar3k;md5=b5fe244fb2b532311de1472a3bc06da5 \
+                    file://LICENSE.QualcommAtheros_ath10k;md5=cb42b686ee5f5cb890275e4321db60a8 \
+                    file://LICENCE.r8a779x_usb3;md5=4c1671656153025d7076105a5da7e498 \
+                    file://LICENSE.radeon;md5=68ec28bacb3613200bca44f404c69b16 \
+                    file://LICENCE.ralink_a_mediatek_company_firmware;md5=728f1a85fd53fd67fa8d7afb080bc435 \
+                    file://LICENCE.ralink-firmware.txt;md5=ab2c269277c45476fb449673911a2dfd \
+                    file://LICENCE.rtlwifi_firmware.txt;md5=00d06cfd3eddd5a2698948ead2ad54a5 \
+                    file://LICENSE.sdma_firmware;md5=51e8c19ecc2270f4b8ea30341ad63ce9 \
+                    file://LICENCE.siano;md5=4556c1bf830067f12ca151ad953ec2a5 \
+                    file://LICENCE.tda7706-firmware.txt;md5=835997cf5e3c131d0dddd695c7d9103e \
+                    file://LICENCE.ti-connectivity;md5=c5e02be633f1499c109d1652514d85ec \
+                    file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c \
+                    file://LICENCE.ueagle-atm4-firmware;md5=4ed7ea6b507ccc583b9d594417714118 \
+                    file://LICENCE.via_vt6656;md5=e4159694cba42d4377a912e78a6e850f \
+                    file://LICENCE.wl1251;md5=ad3f81922bb9e197014bb187289d3b5b \
+                    file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
+                    file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
+                    file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
+                    file://WHENCE;md5=b6e44adf71bc37e5f26ebfe5a08b5490 \
+                    "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -132,6 +133,7 @@ NO_GENERIC_LICENSE[Firmware-adsp_sst] = "LICENCE.adsp_sst"
 NO_GENERIC_LICENSE[Firmware-agere] = "LICENCE.agere"
 NO_GENERIC_LICENSE[Firmware-amdgpu] = "LICENSE.amdgpu"
 NO_GENERIC_LICENSE[Firmware-amd-ucode] = "LICENSE.amd-ucode"
+NO_GENERIC_LICENSE[Firmware-amlogic_vdec] = "LICENSE.amlogic_vdec"
 NO_GENERIC_LICENSE[Firmware-atheros_firmware] = "LICENCE.atheros_firmware"
 NO_GENERIC_LICENSE[Firmware-atmel] = "LICENSE.atmel"
 NO_GENERIC_LICENSE[Firmware-broadcom_bcm43xx] = "LICENCE.broadcom_bcm43xx"
@@ -188,7 +190,7 @@ NO_GENERIC_LICENSE[Firmware-xc5000] = "LICENCE.xc5000"
 NO_GENERIC_LICENSE[Firmware-xc5000c] = "LICENCE.xc5000c"
 NO_GENERIC_LICENSE[WHENCE] = "WHENCE"
 
-SRCREV = "7bc246451318b3536d9bfd3c4e46d541a9831b33"
+SRCREV = "711d3297bac870af42088a467459a0634c1970ca"
 PE = "1"
 PV = "0.0+git${SRCPV}"
 
-- 
2.17.1


