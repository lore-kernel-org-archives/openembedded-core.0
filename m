Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 4742278B55
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 11:15:28 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id h10-v6so10950154wre.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 04:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=c2Tw1hkGg1DSH1/UjxI66SpzWQ1wuvw5x9k9yhzEgQE=;
	b=aMTixHgbcmUQAYlkkt7CgC7/z9yGWT1YkNowrKoQiV0IWrbZ/1UEm+4ZkQ4uNi+xBe
	/Xu4UO03Xzav+8jkhjnLyoI1JQnKTLW41NaJEAFADB8sbxHxuGMnTMiuSiE7doTWoa+W
	G9wC9hgFkYvKDAE59a9K0wEkakts/9krdaO0/SZ1JN8usvrqZmJA7482AsXCw2IeidvI
	VkBJSDvg0gvxsqbHc/r5yYVAVQ38UPYRMXj849mOJU5LFIZmG5VdetdEqMlYGwUD8gUl
	p0DdQIFW+WIeILKqU37Kxg2LmDhNkPMXQTDWqQHCl1Sdy/bnTSMNoqE35+chiCNdeMBN
	z/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=c2Tw1hkGg1DSH1/UjxI66SpzWQ1wuvw5x9k9yhzEgQE=;
	b=k/1YGXnF93/wis3A3jttKbba8bd6YiiWkeNF6XsFv/hBH3UNUhGWVOcTo9QUkgvqmg
	kzaUB7y3+XtM+QLYXyg2i+oDZJ+qZ4zB2vHKZGFX8x1vZM6ZORgA08BnOsdPfTUO33va
	K52QkxAPneCDq9xrZM9lab0H1nkUlTqboTZSAgLRDpdOEXTQiPv0PbXNRJev2siQLB1Z
	YEgaO6ejsPVCZ4cVQI+inWSg3sDmE6G8qtcXzycmURTIkd/XJggf7QAKsh0sl4dYrE7N
	wylwVMCa2E7IlwAFEOBy3lb6OVqV5aV5HE6//x6eWJPAbcYsLx+hSjIorpc+ADLv2hBx
	em0A==
X-Gm-Message-State: AOUpUlH4JMCsRXW4TrQGF7M2BnTb//eiQvVsMmvagzT8bdzvNToG/bHA
	xoWHkJqEeA42qEdrwZvNyTCp7sAD
X-Google-Smtp-Source: AAOMgpfLrCWHh6QHhn7tLDGvhfe67AcR3w+Tp20ftHrOKFv+iL5Oa0SwyoekpH43UbVS6TmByVR6Iw==
X-Received: by 2002:adf:fb43:: with SMTP id c3-v6mr1249806wrs.32.1532085328819;
	Fri, 20 Jul 2018 04:15:28 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	c5-v6sm1729862wrh.36.2018.07.20.04.15.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 20 Jul 2018 04:15:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jul 2018 11:15:25 +0000
Message-Id: <81f848e5d760fdfa20b99a2087afdd44c0bfb515.1532085117.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1532085117.git.Martin.Jansa@gmail.com>
References: <cover.1532085117.git.Martin.Jansa@gmail.com>
Subject: [PATCH 1/3] linux-firmware: add ${PN}-cypress-license handling from meta-raspberrypi
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
X-List-Received-Date: Fri, 20 Jul 2018 11:15:28 -0000

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


