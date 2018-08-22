Return-Path: <ryan.harkin@linaro.org>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id B46687945F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 16:30:49 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id y139-v6so2562538wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 09:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SKSxHaDmPd/u54t5dAS9gcLNN4Fp0fs5LcKIh4+B8gY=;
	b=TV+TWnnddsP4FU6KpmRn87rKLS9db0+wvHiBEekGXsEznxkaE/ZFbBn9I3xqrjpmy3
	KLrioHZ0F1bwhj6edTFS730gTZWO1Gvn9PaM6XFv1iP5lQMbeLH6pZHo+HFVj5Pd/OcV
	6d3gh7yvB+hgsWmV7vbvwdKarUdCuLHF2eRPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=SKSxHaDmPd/u54t5dAS9gcLNN4Fp0fs5LcKIh4+B8gY=;
	b=NxOgOSkhtr/+yp+XfI+GzVQYlMixuK6OnemU84c61I1H+lgUhgZV7ZQa8NIeMzW0xp
	mnv9PhTti/4AkLk2NIKOZhPaieNaHb0Z05KUbd4sXUoRK6beMkUGcM9OW67Z04DamoFz
	rjFUKQnNXG3LpgnwM5WccFllI/jJ8rnO17vt0imzgP2KiZVRJhm0tBlEz3sAEAuMWOaX
	Zf5nph68qeFGEWEssu2Rl5iqStadj3NRo4T17yc2CNy+ch/kuE+smKOzCpaDxkdqddR7
	5cdbEGl72rBgOjHbpWs4zfSxu5KzlskA9at8fqWsBxP80F3Q+2d1BNbX0qgdcFgL/lta
	Y5Rg==
X-Gm-Message-State: APzg51CX/9hF38s9DPoitzlZNpbec0Y/TVFvug28awpWjkz2Th6sxxqG
	EzMx53NZI+LprJBz24tqjLINy9kU7G0=
X-Google-Smtp-Source: ANB0VdYLsMEBmvp5Ra16o8fox696e2T26bqqBh8rtjrkx9U2SgKEzo2iwDQ5+Qo687P8KvRnXcFZwA==
X-Received: by 2002:a1c:92:: with SMTP id 140-v6mr2597060wma.87.1534955450077; 
	Wed, 22 Aug 2018 09:30:50 -0700 (PDT)
Received: from localhost.localdomain (82-69-54-187.dsl.in-addr.zen.co.uk.
	[82.69.54.187]) by smtp.gmail.com with ESMTPSA id
	m8-v6sm2802229wrf.93.2018.08.22.09.30.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 09:30:48 -0700 (PDT)
From: Ryan Harkin <ryan.harkin@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 17:30:34 +0100
Message-Id: <1534955436-729-2-git-send-email-ryan.harkin@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534955436-729-1-git-send-email-ryan.harkin@linaro.org>
References: <1534955436-729-1-git-send-email-ryan.harkin@linaro.org>
Cc: daiane.angolini@nxp.com, patches@linaro.org
Subject: [RFC 1/3] linux-firmware: upgrade to 1d17c18 revision
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
X-List-Received-Date: Wed, 22 Aug 2018 16:30:50 -0000

Following changes are applied:

1d17c18 linux-firmware: add firmware for mhdp8546
c2e0d14 qed: Add firmware 8.37.7.0
f1b95fe linux-firmware:Update firmware patch for Intel Bluetooth 7265
8813230 linux-firmware: Update firmware file for Intel Bluetooth,9560
c2d8f1b linux-firmware: Update firmware file for Intel Bluetooth,9260
9767096 linux-firmware: Update firmware file for Intel Bluetooth,8265
41bdd3b linux-firmware: Update firmware patch for Intel Bluetooth 8260
fdd3468 linux-firmware: add firmware for mt76x0
eee8208 Merge commit 'c4883661c7eeedd061eb3b483135b47dab39a88d' of
6ae7a5b qcom: update venus firmware files for v5.2
c488366 nfp: update Agilio SmartNIC flower firmware to rev AOTC-2.9.A.31
7b5835f linux-firmware: add firmware for mt76x2u
3a5103f wl18xx: update firmware file 8.9.0.0.79
b01151b Mellanox: Add new mlxsw_spectrum firmware 13.1702.6
0ff06f2 WHENCE: Remove reference to amdgpu/vegam_me_2.bin
3fcf221 linux-firmware: mediatek: add MT7622 Bluetooth firmwares and
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

Signed-off-by: Ryan Harkin <ryan.harkin@linaro.org>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 69f9a2a..4e0f1cc 100644
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
+SRCREV = "1d17c18226c2ddf5bc127b3f934cfa88e0c0c29f"
 PE = "1"
 PV = "0.0+git${SRCPV}"
 
-- 
2.7.4


