Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 02A9678D6A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 09:17:23 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id y2-v6so12316612wma.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 02:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=c2Tw1hkGg1DSH1/UjxI66SpzWQ1wuvw5x9k9yhzEgQE=;
	b=LUKAd/nNMVnKmrLPKJl/rTxOlc+QQnonWYxUPmux3/DVGZb8obFp5YZcvm/HuRFSc0
	Y+72DX1Rtn/8DZiDWmmiNyMat+Aew3Y8jtkv+lwMnbtwQ64kP1zjMuvW+nPxBaFhdjwK
	8i4g+2URESSGyxYN8mZAYLPRHhH0cBprKSMbavt2bvlSOMcXPOLu35YHChnJ+JVwgE55
	B7rgaHlZ8GtpAi8YHAoUemMxkC8zCpO9PVzQJoLuO4HNIIDJqlmBAk6tob2rQcz/u9rJ
	5r3pxxsgby3KDB9QtUkA7pplRdr63pJkHQkAQ+SHf2wn796lH5O1t0Vdj0NufvVz3yZw
	3n3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=c2Tw1hkGg1DSH1/UjxI66SpzWQ1wuvw5x9k9yhzEgQE=;
	b=ay2I4lRG0pQp9H2fPS/PTH003KYxhL3L2/faj65wZsbjNHJrAC5aVSa5uSdHrYx/OG
	UiewzWMKvdXiiQxaWpIcr4Rny3RWbj5eMIgXI1E2IGMe7M5IiyP1WenyGoE3c9sSOlIq
	7M4jF62FEid6NMmqDa44YGAjEtIvPrHJ1yA6U0l9pwW3ePb1WEVQpT7zzzf+4aEWRlWM
	JsiQiMfNbQe8tsBfAl0EYlff2iVBk+ZQbE2wiKKgWzInAFmMHMCxIIgdBmkfInRH2SnO
	nxu5/BzgCVvaxgBYuNvKoRejsdCQ+x0+QVG08DRImMZRsqOS8ZbeouXlFcc1GC6XfWmv
	tsNA==
X-Gm-Message-State: AOUpUlHrQhRVAsx/uAS5fVEhGDJXKKvp+DskWa3zCSVgI3vxXxG7wXUe
	1nzP1dGKG709apXZDE/zIkKXKDrp
X-Google-Smtp-Source: AAOMgpdNSSNkigc2XEBwN4deHa8eajHAq7tJvjvuX86yUhbkLtiNlD2aDTFeenm7+M8pJ/bbvQkJPQ==
X-Received: by 2002:a1c:b157:: with SMTP id
	a84-v6mr13829195wmf.18.1532942244379; 
	Mon, 30 Jul 2018 02:17:24 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	z3-v6sm15001543wru.27.2018.07.30.02.17.23
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 30 Jul 2018 02:17:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jul 2018 09:17:23 +0000
Message-Id: <20180730091725.857-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH][sumo 1/3] linux-firmware: add ${PN}-cypress-license handling from meta-raspberrypi
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
X-List-Received-Date: Mon, 30 Jul 2018 09:17:24 -0000

* this will break meta-raspberrypi once more, by including
  ${PN}-cypress-license package twice in PACKAGES
  I've sent fix here:
  https://github.com/agherzan/meta-raspberrypi/pull/295

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../linux-firmware/linux-firmware_git.bb             | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index dff34e3e3a..898c87dcd1 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -14,6 +14,7 @@ LICENSE = "\
     & Firmware-cavium \
     & Firmware-chelsio_firmware \
     & Firmware-cw1200 \
+    & Firmware-cypress \
     & Firmware-dib0700 \
     & Firmware-e100 \
     & Firmware-ene_firmware \
@@ -74,6 +75,7 @@ LIC_FILES_CHKSUM = "\
     file://LICENCE.cavium;md5=c37aaffb1ebe5939b2580d073a95daea \
     file://LICENCE.chelsio_firmware;md5=819aa8c3fa453f1b258ed8d168a9d903 \
     file://LICENCE.cw1200;md5=f0f770864e7a8444a5c5aa9d12a3a7ed \
+    file://LICENCE.cypress;md5=48cd9436c763bf873961f9ed7b5c147b \
     file://LICENSE.dib0700;md5=f7411825c8a555a1a3e5eab9ca773431 \
     file://LICENCE.e100;md5=ec0f84136766df159a3ae6d02acdf5a8 \
     file://LICENCE.ene_firmware;md5=ed67f0f62f8f798130c296720b7d3921 \
@@ -135,6 +137,7 @@ NO_GENERIC_LICENSE[Firmware-ca0132] = "LICENCE.ca0132"
 NO_GENERIC_LICENSE[Firmware-cavium] = "LICENCE.cavium"
 NO_GENERIC_LICENSE[Firmware-chelsio_firmware] = "LICENCE.chelsio_firmware"
 NO_GENERIC_LICENSE[Firmware-cw1200] = "LICENCE.cw1200"
+NO_GENERIC_LICENSE[Firmware-cypress] = "LICENCE.cypress"
 NO_GENERIC_LICENSE[Firmware-dib0700] = "LICENSE.dib0700"
 NO_GENERIC_LICENSE[Firmware-e100] = "LICENCE.e100"
 NO_GENERIC_LICENSE[Firmware-ene_firmware] = "LICENCE.ene_firmware"
@@ -233,6 +236,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-vt6656-license ${PN}-vt6656 \
              ${PN}-rtl-license ${PN}-rtl8188 ${PN}-rtl8192cu ${PN}-rtl8192ce ${PN}-rtl8192su ${PN}-rtl8723 ${PN}-rtl8821 \
              ${PN}-rtl8168 \
+             ${PN}-cypress-license \
              ${PN}-broadcom-license \
              ${PN}-bcm4329 ${PN}-bcm4330 ${PN}-bcm4334 ${PN}-bcm43340 \
              ${PN}-bcm43362 ${PN}-bcm4339 ${PN}-bcm43430 ${PN}-bcm4354 \
@@ -556,6 +560,14 @@ RDEPENDS_${PN}-bcm4339 += "${PN}-broadcom-license"
 RDEPENDS_${PN}-bcm43430 += "${PN}-broadcom-license"
 RDEPENDS_${PN}-bcm4354 += "${PN}-broadcom-license"
 
+# For broadcom cypress
+
+LICENSE_${PN}-cypress-license = "Firmware-cypress"
+
+FILES_${PN}-cypress-license = "\
+  ${nonarch_base_libdir}/firmware/LICENCE.cypress \
+"
+
 # For Broadcom bnx2-mips
 #
 # which is a separate case to the other Broadcom firmwares since its
-- 
2.17.1


