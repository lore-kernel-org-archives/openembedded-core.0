Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id EE7A57869C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jan 2018 10:05:19 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id v123so1490287wmd.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jan 2018 02:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=YDBU6J549GYD7rvawdTJ4rIzkUVnb4mHiNJKFLc2T14=;
	b=kYO+DO93vjw45jtstN/Vnys2cL28XEgvELGINUkVJdiXjBCjTL/KXVJZk6Oqo2pdMd
	2ErcX3OMVm9QgEeRyb6Zf4QwcAGhyM8+w9PhismffjwjL9opqZM8PZvf+LUDzaanhtas
	KiAeHc4+detp/KJuuEwx8lyRzP2S+xgr72qDc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YDBU6J549GYD7rvawdTJ4rIzkUVnb4mHiNJKFLc2T14=;
	b=ZqlAkuwGN4coLxOWAopVM/SjvvNzHCcqOpwl22pl5hsCM1z2fEbRWNJ2axrCPENuD7
	7m3mqES4MUywmtNrYSt9ZHsN15mIKUjzJ86jcMG0SUGBO+K2iY+u0mhy55rbaL/yCpFx
	DKNZHReGreLve/Y4gm4iWOam+HYBjnhO/8Aa+F3FQVQUntXmlEhgjU1EL0SYfF26W5UL
	VGT7Ioa4V5u24HofKBptTZ9JLo5Caazo0cyZQ8QjL5TG/embbmhOXVDzWQSodWVQVK7/
	0DbdVUQwVafF6LodKEdAe3cczJZgcydBVgSys+nH718wfm81YJMyDIIyKJd92nSnsk2i
	FtSQ==
X-Gm-Message-State: AKwxytfno0H7xVUZKkE+72nww3XdYUzwLTWu1kKy2034MOl0qvFmWXXN
	B7ZIpAjBU/4/xZnfPNeTc26CP99dLLw=
X-Google-Smtp-Source: ACJfBosdPMrKVp/Q0ciCgezQqqaRx1L23JwgAPXbYugtmf0zVnI2CxBT+Jz4yEi7jeoxWdv2oLTbQQ==
X-Received: by 10.28.230.13 with SMTP id d13mr3715452wmh.125.1515751520025;
	Fri, 12 Jan 2018 02:05:20 -0800 (PST)
Received: from localhost.localdomain (static.8.26.4.46.clients.your-server.de.
	[46.4.26.8]) by smtp.gmail.com with ESMTPSA id
	m20sm8821819wrg.55.2018.01.12.02.05.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 12 Jan 2018 02:05:19 -0800 (PST)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Jan 2018 11:05:07 +0100
Message-Id: <20180112100507.20531-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.11.0
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH] linux-firmware: add packaging for QCOM firmware for APQ8016 and APQ8096
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
X-List-Received-Date: Fri, 12 Jan 2018 10:05:20 -0000

Firmware files for VPU and GPU found on various Qualcomm based devices, such as
Dragonboard 410c and/or Dragonboard 820c.

* venus-1.8 and adreno-a3xx firmware are VPU and GPU for Qualcomm APQ8016 SoC
* venus-4.2 and adreno-a530 firmware are VPU and GPU for Qualcomm APQ8096 SoC

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 .../linux-firmware/linux-firmware_git.bb              | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index b194a59ecb..d5aff5fc84 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -37,6 +37,7 @@ LICENSE = "\
     & Firmware-ath9k-htc \
     & Firmware-phanfw \
     & Firmware-qat \
+    & Firmware-qcom \
     & Firmware-qla1280 \
     & Firmware-qla2xxx \
     & Firmware-qualcommAthos_ar3k \
@@ -96,6 +97,7 @@ LIC_FILES_CHKSUM = "\
     file://LICENCE.open-ath9k-htc-firmware;md5=1b33c9f4d17bc4d457bdb23727046837 \
     file://LICENCE.phanfw;md5=954dcec0e051f9409812b561ea743bfa \
     file://LICENCE.qat_firmware;md5=9e7d8bea77612d7cc7d9e9b54b623062 \
+    file://LICENSE.qcom;md5=164e3362a538eb11d3ac51e8e134294b \
     file://LICENCE.qla1280;md5=d6895732e622d950609093223a2c4f5d \
     file://LICENCE.qla2xxx;md5=505855e921b75f1be4a437ad9b79dff0 \
     file://LICENSE.QualcommAtheros_ar3k;md5=b5fe244fb2b532311de1472a3bc06da5 \
@@ -156,6 +158,7 @@ NO_GENERIC_LICENSE[Firmware-OLPC] = "LICENCE.OLPC"
 NO_GENERIC_LICENSE[Firmware-ath9k-htc] = "LICENCE.open-ath9k-htc-firmware"
 NO_GENERIC_LICENSE[Firmware-phanfw] = "LICENCE.phanfw"
 NO_GENERIC_LICENSE[Firmware-qat] = "LICENCE.qat_firmware"
+NO_GENERIC_LICENSE[Firmware-qcom] = "LICENSE.qcom"
 NO_GENERIC_LICENSE[Firmware-qla1280] = "LICENCE.qla1280"
 NO_GENERIC_LICENSE[Firmware-qla2xxx] = "LICENCE.qla2xxx"
 NO_GENERIC_LICENSE[Firmware-qualcommAthos_ar3k] = "LICENSE.QualcommAtheros_ar3k"
@@ -257,6 +260,9 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-bnx2-mips \
              ${PN}-netronome-license ${PN}-netronome \
              ${PN}-qat ${PN}-qat-license \
+             ${PN}-qcom-license \
+             ${PN}-qcom-venus-1.8 ${PN}-qcom-venus-4.2 \
+             ${PN}-qcom-adreno-a3xx ${PN}-qcom-adreno-a530 \
              ${PN}-whence-license \
              ${PN}-license \
              "
@@ -707,6 +713,18 @@ FILES_${PN}-qat-license   = "${nonarch_base_libdir}/firmware/LICENCE.qat_firmwar
 FILES_${PN}-qat           = "${nonarch_base_libdir}/firmware/qat*.bin"
 RDEPENDS_${PN}-qat        = "${PN}-qat-license"
 
+# For QCOM VPU/GPU
+LICENSE_${PN}-qcom-license = "Firmware-qcom"
+FILES_${PN}-qcom-license   = "${nonarch_base_libdir}/firmware/LICENSE.qcom ${nonarch_base_libdir}/firmware/qcom/NOTICE.txt"
+FILES_${PN}-qcom-venus-1.8 = "${nonarch_base_libdir}/firmware/qcom/venus-1.8/*"
+FILES_${PN}-qcom-venus-4.2 = "${nonarch_base_libdir}/firmware/qcom/venus-4.2/*"
+FILES_${PN}-qcom-adreno-a3xx = "${nonarch_base_libdir}/firmware/qcom/a300_*.fw ${nonarch_base_libdir}/firmware/a300_*.fw"
+FILES_${PN}-qcom-adreno-a530 = "${nonarch_base_libdir}/firmware/qcom/a530*.*"
+RDEPENDS_${PN}-qcom-venus-1.8 = "${PN}-qcom-license"
+RDEPENDS_${PN}-qcom-venus-1.8 = "${PN}-qcom-license"
+RDEPENDS_${PN}-qcom-adreno-a3xx = "${PN}-qcom-license"
+RDEPENDS_${PN}-qcom-adreno-a530 = "${PN}-qcom-license"
+
 # For other firmwares
 # Maybe split out to separate packages when needed.
 LICENSE_${PN} = "\
@@ -737,6 +755,7 @@ LICENSE_${PN} = "\
     & Firmware-ath9k-htc \
     & Firmware-phanfw \
     & Firmware-qat \
+    & Firmware-qcom \
     & Firmware-qla1280 \
     & Firmware-qla2xxx \
     & Firmware-r8a779x_usb3 \
-- 
2.11.0


