Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 62A8E78D68
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 09:17:26 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id h15-v6so12012257wrs.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 02:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kCDmt52bThRGotB7QfKyD56dlJn67aj+1VKLfUg0TQk=;
	b=Q0gIHIhfbMPkxnQn+RIfGTmCiY3PbUAbNwv9WACcOShCwfEha6CsSSrURiWTH14tHO
	DKxMN8cegxTnGtxSG/wRAisbKQ3deKJvRAL5GW8Mx/F5XK1h/RtmhtnMIEd9LcYlpb8S
	konSr9LlJJIlgo84kwnDiSSJsRWb1s+XWJSIR/RHvG5zUYAO0fvbcaYjfaNcTCMrHNtp
	OF3/xbGYsuazzYJR75makgEIuQ3fqTNZjxqceFdXmUd4e80VlTT7BhtgusYC37p6HO27
	EvTQCzdnLJ8EHVLGP9F2iQlIj420HmcvV4nn/1V8tw/IwO/iXlASSpiPzkODBxEaQbC6
	cI+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=kCDmt52bThRGotB7QfKyD56dlJn67aj+1VKLfUg0TQk=;
	b=DP0P+2J8Ge53TSlYz/G+nAg7UP6sFmmltD4HBy8eerqoBqolQ8i5hWccRiRkPa137Z
	RzF/LtDBJ9catf7A+rRsL3Np3SlDkjHqw0pUXwNLWWTJa7VaTcKSuLoialRu/dvfC7LQ
	n3gbGKRK3DCJt3vkA+AjHn5mi4tUYQ9W7MEOBUbkHZy+inAKqtgwUCyQNBieipwSrRjr
	e6RcC2Pi7hOaBbvCO6dkb2WCSohqDhY0EmD3wEZAYxU1NQCfOi0vWdgzyw+/AfHAWSep
	HxgLNOlOGXr6CFeGcBXKoo/34T9m8kLDxVQBhkYoyziNFqeKVJiUk624HPentsfvFHFe
	r1qQ==
X-Gm-Message-State: AOUpUlF/P7uDJkPlmkyD8V+DYAAjk1lESW9E6BMLKXCjVNUu481EsoFF
	ogpwWstEFPejG+h3VUqaxL/1dvLH
X-Google-Smtp-Source: AAOMgpf7Zd347snZSykSerptdqERKTtCMPgZsYebD3gA2A9vk7Q5ZVK1fpBQuujZ10+4zwgiMHE3YA==
X-Received: by 2002:a5d:4785:: with SMTP id
	w5-v6mr16255858wrq.188.1532942246882; 
	Mon, 30 Jul 2018 02:17:26 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	m2-v6sm10224074wrw.76.2018.07.30.02.17.25
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 30 Jul 2018 02:17:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jul 2018 09:17:25 +0000
Message-Id: <20180730091725.857-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180730091725.857-1-Martin.Jansa@gmail.com>
References: <20180730091725.857-1-Martin.Jansa@gmail.com>
Subject: [PATCH][sumo 3/3] linux-firmware: add separate packages for all brcm files
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
X-List-Received-Date: Mon, 30 Jul 2018 09:17:26 -0000

* no changes in the content of previously existing packages

* include some silly commands I've used to "parse" WHENCE file to
  generate these, some manual changes are still needed, like separating
  cypress licensed files, removing duplicates when 2 files are included
  in the same package (bcm4356-pcie is exception because sdio and pcie
  files have different license).

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../linux-firmware/linux-firmware_git.bb      | 177 ++++++++++++++----
 1 file changed, 136 insertions(+), 41 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 480018a7e9..cf7abb0f96 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -238,8 +238,38 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-rtl8168 \
              ${PN}-cypress-license \
              ${PN}-broadcom-license \
-             ${PN}-bcm4329 ${PN}-bcm4330 ${PN}-bcm4334 ${PN}-bcm43340 \
-             ${PN}-bcm43362 ${PN}-bcm4339 ${PN}-bcm43430 ${PN}-bcm4354 \
+             ${PN}-bcm-0bb4-0306 \
+             ${PN}-bcm43143 \
+             ${PN}-bcm43236b \
+             ${PN}-bcm43241b0 \
+             ${PN}-bcm43241b4 \
+             ${PN}-bcm43241b5 \
+             ${PN}-bcm43242a \
+             ${PN}-bcm4329 \
+             ${PN}-bcm4329-fullmac \
+             ${PN}-bcm4330 \
+             ${PN}-bcm4334 \
+             ${PN}-bcm43340 \
+             ${PN}-bcm4335 \
+             ${PN}-bcm43362 \
+             ${PN}-bcm4339 \
+             ${PN}-bcm43430 \
+             ${PN}-bcm43430a0 \
+             ${PN}-bcm43455 \
+             ${PN}-bcm4350 \
+             ${PN}-bcm4350c2 \
+             ${PN}-bcm4354 \
+             ${PN}-bcm4356 \
+             ${PN}-bcm4356-pcie \
+             ${PN}-bcm43569 \
+             ${PN}-bcm43570 \
+             ${PN}-bcm4358 \
+             ${PN}-bcm43602 \
+             ${PN}-bcm4366b \
+             ${PN}-bcm4371 \
+             ${PN}-bcm4373 \
+             ${PN}-bcm43xx \
+             ${PN}-bcm43xx-hdr \
              ${PN}-atheros-license ${PN}-ar9170 ${PN}-ath6k ${PN}-ath9k \
              ${PN}-gplv2-license ${PN}-carl9170 \
              ${PN}-ar3k-license ${PN}-ar3k ${PN}-ath10k-license ${PN}-ath10k ${PN}-qca \
@@ -513,61 +543,126 @@ RDEPENDS_${PN}-vt6656 = "${PN}-vt6656-license"
 
 # For broadcom
 
-LICENSE_${PN}-bcm4329 = "Firmware-broadcom_bcm43xx"
-LICENSE_${PN}-bcm4330 = "Firmware-broadcom_bcm43xx"
-LICENSE_${PN}-bcm4334 = "Firmware-broadcom_bcm43xx"
-LICENSE_${PN}-bcm4339 = "Firmware-broadcom_bcm43xx"
-LICENSE_${PN}-broadcom-license = "Firmware-broadcom_bcm43xx"
-
-FILES_${PN}-broadcom-license = " \
-  ${nonarch_base_libdir}/firmware/LICENCE.broadcom_bcm43xx \
-"
-FILES_${PN}-bcm4329 = " \
-  ${nonarch_base_libdir}/firmware/brcm/brcmfmac4329-sdio.bin \
-"
-FILES_${PN}-bcm4330 = " \
-  ${nonarch_base_libdir}/firmware/brcm/brcmfmac4330-sdio.bin \
-"
-FILES_${PN}-bcm4334 = " \
-  ${nonarch_base_libdir}/firmware/brcm/brcmfmac4334-sdio.bin \
-"
-FILES_${PN}-bcm4339 = " \
-  ${nonarch_base_libdir}/firmware/brcm/brcmfmac4339-sdio.bin \
-"
+# for i in `grep brcm WHENCE  | grep ^File | sed 's/File: brcm.//g'`; do pkg=`echo $i | sed 's/-[sp40].*//g; s/\.bin//g; s/brcmfmac/bcm/g; s/_hdr/-hdr/g; s/BCM/bcm-0bb4-0306/g'`; echo -e "             \${PN}-$pkg \\"; done  | sort -u
 
+LICENSE_${PN}-broadcom-license = "Firmware-broadcom_bcm43xx"
+FILES_${PN}-broadcom-license = "${nonarch_base_libdir}/firmware/LICENCE.broadcom_bcm43xx"
+
+# for i in `grep brcm WHENCE  | grep ^File | sed 's/File: brcm.//g'`; do pkg=`echo $i | sed 's/-[sp40].*//g; s/\.bin//g; s/brcmfmac/bcm/g; s/_hdr/-hdr/g; s/BCM/bcm-0bb4-0306/g'`; echo "$i - $pkg"; echo -e "FILES_\${PN}-$pkg = \"\${nonarch_base_libdir}/firmware/brcm/$i\""; done | grep ^FILES
+
+FILES_${PN}-bcm43xx = "${nonarch_base_libdir}/firmware/brcm/bcm43xx-0.fw"
+FILES_${PN}-bcm43xx-hdr = "${nonarch_base_libdir}/firmware/brcm/bcm43xx_hdr-0.fw"
+FILES_${PN}-bcm4329-fullmac = "${nonarch_base_libdir}/firmware/brcm/bcm4329-fullmac-4.bin"
+FILES_${PN}-bcm43236b = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43236b.bin"
+FILES_${PN}-bcm4329 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4329-sdio.bin"
+FILES_${PN}-bcm4330 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4330-sdio.bin"
+FILES_${PN}-bcm4334 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4334-sdio.bin"
+FILES_${PN}-bcm4335 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4335-sdio.bin"
+FILES_${PN}-bcm4339 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4339-sdio.bin"
+FILES_${PN}-bcm43241b0 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43241b0-sdio.bin"
+FILES_${PN}-bcm43241b4 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43241b4-sdio.bin"
+FILES_${PN}-bcm43241b5 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43241b5-sdio.bin"
+FILES_${PN}-bcm43242a = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43242a.bin"
+FILES_${PN}-bcm43143 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43143.bin \
+  ${nonarch_base_libdir}/firmware/brcm/brcmfmac43143-sdio.bin \
+"
+FILES_${PN}-bcm43430a0 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43430a0-sdio.bin"
+FILES_${PN}-bcm43455 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43455-sdio.bin"
+FILES_${PN}-bcm4350c2 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4350c2-pcie.bin"
+FILES_${PN}-bcm4350 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4350-pcie.bin"
+FILES_${PN}-bcm4356 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4356-sdio.bin"
+FILES_${PN}-bcm43569 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43569.bin"
+FILES_${PN}-bcm43570 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43570-pcie.bin"
+FILES_${PN}-bcm4358 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4358-pcie.bin"
+FILES_${PN}-bcm43602 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43602-pcie.bin \
+  ${nonarch_base_libdir}/firmware/brcm/brcmfmac43602-pcie.ap.bin \
+"
+FILES_${PN}-bcm4366b = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4366b-pcie.bin"
+FILES_${PN}-bcm4371 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4371-pcie.bin"
+
+# for i in `grep brcm WHENCE  | grep ^File | sed 's/File: brcm.//g'`; do pkg=`echo $i | sed 's/-[sp40].*//g; s/\.bin//g; s/brcmfmac/bcm/g; s/_hdr/-hdr/g; s/BCM/bcm-0bb4-0306/g'`; echo -e "LICENSE_\${PN}-$pkg = \"Firmware-broadcom_bcm43xx\"\nRDEPENDS_\${PN}-$pkg += \"\${PN}-broadcom-license\""; done
+# Currently 1st one and last 6 have cypress LICENSE
+
+LICENSE_${PN}-bcm43xx = "Firmware-broadcom_bcm43xx"
+RDEPENDS_${PN}-bcm43xx += "${PN}-broadcom-license"
+LICENSE_${PN}-bcm43xx-hdr = "Firmware-broadcom_bcm43xx"
+RDEPENDS_${PN}-bcm43xx-hdr += "${PN}-broadcom-license"
+LICENSE_${PN}-bcm4329-fullmac = "Firmware-broadcom_bcm43xx"
+RDEPENDS_${PN}-bcm4329-fullmac += "${PN}-broadcom-license"
+LICENSE_${PN}-bcm43236b = "Firmware-broadcom_bcm43xx"
+RDEPENDS_${PN}-bcm43236b += "${PN}-broadcom-license"
+LICENSE_${PN}-bcm4329 = "Firmware-broadcom_bcm43xx"
 RDEPENDS_${PN}-bcm4329 += "${PN}-broadcom-license"
+LICENSE_${PN}-bcm4330 = "Firmware-broadcom_bcm43xx"
 RDEPENDS_${PN}-bcm4330 += "${PN}-broadcom-license"
+LICENSE_${PN}-bcm4334 = "Firmware-broadcom_bcm43xx"
 RDEPENDS_${PN}-bcm4334 += "${PN}-broadcom-license"
+LICENSE_${PN}-bcm4335 = "Firmware-broadcom_bcm43xx"
+RDEPENDS_${PN}-bcm4335 += "${PN}-broadcom-license"
+LICENSE_${PN}-bcm4339 = "Firmware-broadcom_bcm43xx"
 RDEPENDS_${PN}-bcm4339 += "${PN}-broadcom-license"
+LICENSE_${PN}-bcm43241b0 = "Firmware-broadcom_bcm43xx"
+RDEPENDS_${PN}-bcm43241b0 += "${PN}-broadcom-license"
+LICENSE_${PN}-bcm43241b4 = "Firmware-broadcom_bcm43xx"
+RDEPENDS_${PN}-bcm43241b4 += "${PN}-broadcom-license"
+LICENSE_${PN}-bcm43241b5 = "Firmware-broadcom_bcm43xx"
+RDEPENDS_${PN}-bcm43241b5 += "${PN}-broadcom-license"
+LICENSE_${PN}-bcm43242a = "Firmware-broadcom_bcm43xx"
+RDEPENDS_${PN}-bcm43242a += "${PN}-broadcom-license"
+LICENSE_${PN}-bcm43143 = "Firmware-broadcom_bcm43xx"
+RDEPENDS_${PN}-bcm43143 += "${PN}-broadcom-license"
+LICENSE_${PN}-bcm43430a0 = "Firmware-broadcom_bcm43xx"
+RDEPENDS_${PN}-bcm43430a0 += "${PN}-broadcom-license"
+LICENSE_${PN}-bcm43455 = "Firmware-broadcom_bcm43xx"
+RDEPENDS_${PN}-bcm43455 += "${PN}-broadcom-license"
+LICENSE_${PN}-bcm4350c2 = "Firmware-broadcom_bcm43xx"
+RDEPENDS_${PN}-bcm4350c2 += "${PN}-broadcom-license"
+LICENSE_${PN}-bcm4350 = "Firmware-broadcom_bcm43xx"
+RDEPENDS_${PN}-bcm4350 += "${PN}-broadcom-license"
+LICENSE_${PN}-bcm4356 = "Firmware-broadcom_bcm43xx"
+RDEPENDS_${PN}-bcm4356 += "${PN}-broadcom-license"
+LICENSE_${PN}-bcm43569 = "Firmware-broadcom_bcm43xx"
+RDEPENDS_${PN}-bcm43569 += "${PN}-broadcom-license"
+LICENSE_${PN}-bcm43570 = "Firmware-broadcom_bcm43xx"
+RDEPENDS_${PN}-bcm43570 += "${PN}-broadcom-license"
+LICENSE_${PN}-bcm4358 = "Firmware-broadcom_bcm43xx"
+RDEPENDS_${PN}-bcm4358 += "${PN}-broadcom-license"
+LICENSE_${PN}-bcm43602 = "Firmware-broadcom_bcm43xx"
+RDEPENDS_${PN}-bcm43602 += "${PN}-broadcom-license"
+LICENSE_${PN}-bcm4366b = "Firmware-broadcom_bcm43xx"
+RDEPENDS_${PN}-bcm4366b += "${PN}-broadcom-license"
+LICENSE_${PN}-bcm4371 = "Firmware-broadcom_bcm43xx"
+RDEPENDS_${PN}-bcm4371 += "${PN}-broadcom-license"
 
 # For broadcom cypress
 
-LICENSE_${PN}-bcm43340 = "Firmware-cypress"
-LICENSE_${PN}-bcm43362 = "Firmware-cypress"
-LICENSE_${PN}-bcm43430 = "Firmware-cypress"
-LICENSE_${PN}-bcm4354 = "Firmware-cypress"
 LICENSE_${PN}-cypress-license = "Firmware-cypress"
+FILES_${PN}-cypress-license = "${nonarch_base_libdir}/firmware/LICENCE.cypress"
 
-FILES_${PN}-cypress-license = "\
-  ${nonarch_base_libdir}/firmware/LICENCE.cypress \
-"
-FILES_${PN}-bcm43340 = " \
-  ${nonarch_base_libdir}/firmware/brcm/brcmfmac43340-sdio.bin \
-"
-FILES_${PN}-bcm43362 = " \
-  ${nonarch_base_libdir}/firmware/brcm/brcmfmac43362-sdio.bin \
-"
-FILES_${PN}-bcm43430 = " \
-  ${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.bin \
-"
-FILES_${PN}-bcm4354 = " \
-  ${nonarch_base_libdir}/firmware/brcm/brcmfmac4354-sdio.bin \
+FILES_${PN}-bcm-0bb4-0306 = "${nonarch_base_libdir}/firmware/brcm/BCM-0bb4-0306.hcd"
+FILES_${PN}-bcm43340 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43340-sdio.bin"
+FILES_${PN}-bcm43362 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43362-sdio.bin"
+FILES_${PN}-bcm43430 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.bin"
+FILES_${PN}-bcm4354 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4354-sdio.bin"
+FILES_${PN}-bcm4356-pcie = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4356-pcie.bin"
+FILES_${PN}-bcm4373 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4373-sdio.bin \
+  ${nonarch_base_libdir}/firmware/brcm/brcmfmac4373.bin \
 "
 
+LICENSE_${PN}-bcm-0bb4-0306 = "Firmware-cypress"
+RDEPENDS_${PN}-bcm-0bb4-0306 += "${PN}-cypress-license"
+LICENSE_${PN}-bcm43340 = "Firmware-cypress"
 RDEPENDS_${PN}-bcm43340 += "${PN}-cypress-license"
+LICENSE_${PN}-bcm43362 = "Firmware-cypress"
 RDEPENDS_${PN}-bcm43362 += "${PN}-cypress-license"
+LICENSE_${PN}-bcm43430 = "Firmware-cypress"
 RDEPENDS_${PN}-bcm43430 += "${PN}-cypress-license"
+LICENSE_${PN}-bcm4354 = "Firmware-cypress"
 RDEPENDS_${PN}-bcm4354 += "${PN}-cypress-license"
+LICENSE_${PN}-bcm4356-pcie = "Firmware-cypress"
+RDEPENDS_${PN}-bcm4356-pcie += "${PN}-cypress-license"
+LICENSE_${PN}-bcm4373 = "Firmware-cypress"
+RDEPENDS_${PN}-bcm4373 += "${PN}-cypress-license"
 
 # For Broadcom bnx2-mips
 #
-- 
2.17.1


