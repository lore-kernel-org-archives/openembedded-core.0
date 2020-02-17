Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7FF5E614FE
	for <openembedded-core@openembedded.org>;
	Mon, 17 Feb 2020 16:01:10 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id d9so6892109plo.11
	for <openembedded-core@openembedded.org>;
	Mon, 17 Feb 2020 08:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=XMZBjD0DLjtCAuHf+LqOvIZUmibB73dsHa2uUXI9OTw=;
	b=W8/ToYYg3bgmxvN+1XIW+itBWEuEqTboD0PBbzh/OosF/CpZNC/pbILQxPqu7Yw3Al
	MbRFWoRJWUSxRMuZFsc2mecMsEPAlwn28erzH73PQODrTkgzYd8/LKbk56IpogqZkp+D
	Y0Lu7w1ZPhALlzdXUFqTee95TfpBPfhXejknDhFu/EHEhK+IJJi++8+93Z374rEkvhMD
	St9EYUhF3NUhCjgCzD90pzRsKNs/Ngz5/AFXEUuql+v0kC1nr3t+LbyTMFFPEG0bCjF5
	Kit8q2Yyi1lWS7IBqGgVOmzXmhrUNPuKUAVv3RYPAlGZS17rkI9SQ7JQuQtdi0qbB05K
	RC2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=XMZBjD0DLjtCAuHf+LqOvIZUmibB73dsHa2uUXI9OTw=;
	b=jy6F9dBuld/0IziegL7XVW99MuMUXjcNHWOi1siMhx6jf/sWRylDpCgGpAauSkx5hb
	D74zosCz5BFsEOToUvSHaBKlfQ27/4pWV50rB/50T4bheKmGDlUq/SaxgKTwAR82EiYo
	R7W69Rdqkbiu8+jXwlIK1GjnGjWJHc+apAQxoPnswCE2TnHEi+FRK2GN5aCLmOC7LvYX
	rQofkJdif0itOENSEDeNmpL/oWIHBu8zSDuTHezoEWA9f7w5GKHPZL8c51JJYjkTP8cX
	4H9s4kmFnj3a3Vg2BmC98346cp0roLX7iapA9Sq/ojEWRxpi2tYAMoXNRAxLJEUmbOsb
	nFLg==
X-Gm-Message-State: APjAAAWXu4I4+GfbDXvZmur3WeqHq0iSRR5iKVdZjfAJ3055R4vLNrIY
	CCyg+c6DaN+gwvMkgPaXvbaG0iiR
X-Google-Smtp-Source: APXvYqwWmD/NKZMc8YJBNG4PygA3hnQdNKKWIy9QbdibFsCaYssVoGRtdnPH0B2KCiKJ7RLpV7YRsg==
X-Received: by 2002:a17:902:7283:: with SMTP id
	d3mr16479480pll.118.1581955271470; 
	Mon, 17 Feb 2020 08:01:11 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:9144:9b3e:b52:fa29])
	by smtp.gmail.com with ESMTPSA id
	a22sm928041pfk.108.2020.02.17.08.01.10
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 17 Feb 2020 08:01:11 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon, 17 Feb 2020 08:00:52 -0800
Message-Id: <8063a1277433c58a9df43f0185bb89c79f865aa9.1581955142.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581955142.git.akuster808@gmail.com>
References: <cover.1581955142.git.akuster808@gmail.com>
Subject: [warrior 14/14] linux-firmware: update packaging for brcm files
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
X-List-Received-Date: Mon, 17 Feb 2020 16:01:11 -0000

From: Samuli Piippo <samuli.piippo@qt.io>

Add new package for bcm4366c and include available NVRAM config files
into the corrent bcm* packages.

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit 957c3d39b63f57d896ee89d727007ac2ce6672e3)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../linux-firmware/linux-firmware_20190815.bb  | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20190815.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20190815.bb
index 518638806f..d83000b64f 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20190815.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20190815.bb
@@ -273,6 +273,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-bcm4358 \
              ${PN}-bcm43602 \
              ${PN}-bcm4366b \
+             ${PN}-bcm4366c \
              ${PN}-bcm4371 \
              ${PN}-bcm4373 \
              ${PN}-bcm43xx \
@@ -571,7 +572,7 @@ FILES_${PN}-bcm43xx-hdr = "${nonarch_base_libdir}/firmware/brcm/bcm43xx_hdr-0.fw
 FILES_${PN}-bcm4329-fullmac = "${nonarch_base_libdir}/firmware/brcm/bcm4329-fullmac-4.bin"
 FILES_${PN}-bcm43236b = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43236b.bin"
 FILES_${PN}-bcm4329 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4329-sdio.bin"
-FILES_${PN}-bcm4330 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4330-sdio.bin"
+FILES_${PN}-bcm4330 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4330-sdio.*"
 FILES_${PN}-bcm4334 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4334-sdio.bin"
 FILES_${PN}-bcm4335 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4335-sdio.bin"
 FILES_${PN}-bcm4339 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4339-sdio.bin"
@@ -582,8 +583,8 @@ FILES_${PN}-bcm43242a = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43242a.bin
 FILES_${PN}-bcm43143 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43143.bin \
   ${nonarch_base_libdir}/firmware/brcm/brcmfmac43143-sdio.bin \
 "
-FILES_${PN}-bcm43430a0 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43430a0-sdio.bin"
-FILES_${PN}-bcm43455 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43455-sdio.bin"
+FILES_${PN}-bcm43430a0 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43430a0-sdio.*"
+FILES_${PN}-bcm43455 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43455-sdio.*"
 FILES_${PN}-bcm4350c2 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4350c2-pcie.bin"
 FILES_${PN}-bcm4350 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4350-pcie.bin"
 FILES_${PN}-bcm4356 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4356-sdio.bin"
@@ -594,6 +595,7 @@ FILES_${PN}-bcm43602 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43602-pcie.
   ${nonarch_base_libdir}/firmware/brcm/brcmfmac43602-pcie.ap.bin \
 "
 FILES_${PN}-bcm4366b = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4366b-pcie.bin"
+FILES_${PN}-bcm4366c = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4366c-pcie.bin"
 FILES_${PN}-bcm4371 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4371-pcie.bin"
 
 # for i in `grep brcm WHENCE  | grep ^File | sed 's/File: brcm.//g'`; do pkg=`echo $i | sed 's/-[sp40].*//g; s/\.bin//g; s/brcmfmac/bcm/g; s/_hdr/-hdr/g; s/BCM/bcm-0bb4-0306/g'`; echo -e "LICENSE_\${PN}-$pkg = \"Firmware-broadcom_bcm43xx\"\nRDEPENDS_\${PN}-$pkg += \"\${PN}-broadcom-license\""; done
@@ -647,6 +649,8 @@ LICENSE_${PN}-bcm43602 = "Firmware-broadcom_bcm43xx"
 RDEPENDS_${PN}-bcm43602 += "${PN}-broadcom-license"
 LICENSE_${PN}-bcm4366b = "Firmware-broadcom_bcm43xx"
 RDEPENDS_${PN}-bcm4366b += "${PN}-broadcom-license"
+LICENSE_${PN}-bcm4366c = "Firmware-broadcom_bcm43xx"
+RDEPENDS_${PN}-bcm4366c += "${PN}-broadcom-license"
 LICENSE_${PN}-bcm4371 = "Firmware-broadcom_bcm43xx"
 RDEPENDS_${PN}-bcm4371 += "${PN}-broadcom-license"
 
@@ -656,11 +660,11 @@ LICENSE_${PN}-cypress-license = "Firmware-cypress"
 FILES_${PN}-cypress-license = "${nonarch_base_libdir}/firmware/LICENCE.cypress"
 
 FILES_${PN}-bcm-0bb4-0306 = "${nonarch_base_libdir}/firmware/brcm/BCM-0bb4-0306.hcd"
-FILES_${PN}-bcm43340 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43340-sdio.bin"
-FILES_${PN}-bcm43362 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43362-sdio.bin"
-FILES_${PN}-bcm43430 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.bin"
+FILES_${PN}-bcm43340 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43340-sdio.*"
+FILES_${PN}-bcm43362 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43362-sdio.*"
+FILES_${PN}-bcm43430 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.*"
 FILES_${PN}-bcm4354 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4354-sdio.bin"
-FILES_${PN}-bcm4356-pcie = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4356-pcie.bin"
+FILES_${PN}-bcm4356-pcie = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4356-pcie.*"
 FILES_${PN}-bcm4373 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4373-sdio.bin \
   ${nonarch_base_libdir}/firmware/brcm/brcmfmac4373.bin \
 "
-- 
2.17.1


