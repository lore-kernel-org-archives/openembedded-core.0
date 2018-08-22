Return-Path: <ryan.harkin@linaro.org>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 03DEA79459
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 16:30:50 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id i134-v6so9741wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 09:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cfjax3+dDu4wFw77uqn0Uk98gUXBP1x9fD3sFJVMTMs=;
	b=CIEAulsc/XCpen5ycR0M7ClB336zqmlPkUTyPs5H2pu8KXNOGLZNVtwFrqW5SGqSz6
	Fbwzoc72Tt1dAcWro2vV1fmfJQRVAkaTkObbc8IsIqai8oKgAYmNKjnPMmzvaAqLR7Zf
	BSqCgvmtt91Jk1oJKj8r9LBIT1Llq1Vd8OOtE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=cfjax3+dDu4wFw77uqn0Uk98gUXBP1x9fD3sFJVMTMs=;
	b=rp56NdGMp/ncIihp8wAkCP3gKZ18OpNvqwXB84cDIlT0r5rsJLfgC/bTAqi8lvQNYi
	4RR0GNwK+DCn6Pp2nhnQwcNuwYHuDeBltpfDd/I9n2+1CtOBp7o1exlY+HS+fNzKXr/S
	AKtOEh108rK93lwP7DDB7vVBHYFGsUG5qRhheUShfauC6UWQ8P6lZeW97UxnFr074f/S
	bn8rWo1vHdPvIv43IPZI0BQSWGYsy5syZTPqDFL5LnoVMZ59ncfAXx5vB0/v2Y8sHFcj
	ITD4Xe1GIdUfUajiD2IIMogrp1ta9/1BVYcazmA3+8e26WA9c18xIcHNmgVLZfjCQ8xc
	m26A==
X-Gm-Message-State: APzg51D9F72F4J1ovC4LK8P6ByKbxAlY+E6qifqybkDvZzo6/EbgGLM7
	Wr/zTj7wjMVrcG2fPYx94hbERQsO59c=
X-Google-Smtp-Source: ANB0VdbX5lliSnyGXh4JmCCuQ2gpE19/mpDRGZ1UhnppUAhubJLz1C/os+iDwwiuFC5abpBBhBEVgg==
X-Received: by 2002:a1c:9692:: with SMTP id
	y140-v6mr2758566wmd.82.1534955451543; 
	Wed, 22 Aug 2018 09:30:51 -0700 (PDT)
Received: from localhost.localdomain (82-69-54-187.dsl.in-addr.zen.co.uk.
	[82.69.54.187]) by smtp.gmail.com with ESMTPSA id
	m8-v6sm2802229wrf.93.2018.08.22.09.30.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 09:30:50 -0700 (PDT)
From: Ryan Harkin <ryan.harkin@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 17:30:35 +0100
Message-Id: <1534955436-729-3-git-send-email-ryan.harkin@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534955436-729-1-git-send-email-ryan.harkin@linaro.org>
References: <1534955436-729-1-git-send-email-ryan.harkin@linaro.org>
Cc: daiane.angolini@nxp.com, patches@linaro.org
Subject: [RFC 2/3] linux-firmware: add BCM43430 nvram files
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
X-List-Received-Date: Wed, 22 Aug 2018 16:30:51 -0000

Add the new BCM43430 NVRAM files into the recipe.

Signed-off-by: Ryan Harkin <ryan.harkin@linaro.org>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 4e0f1cc..8c54f28 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -255,6 +255,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-bcm43362 \
              ${PN}-bcm4339 \
              ${PN}-bcm43430 \
+             ${PN}-bcm43430-nvram \
              ${PN}-bcm43430a0 \
              ${PN}-bcm43455 \
              ${PN}-bcm4350 \
@@ -649,6 +650,9 @@ FILES_${PN}-bcm-0bb4-0306 = "${nonarch_base_libdir}/firmware/brcm/BCM-0bb4-0306.
 FILES_${PN}-bcm43340 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43340-sdio.bin"
 FILES_${PN}-bcm43362 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43362-sdio.bin"
 FILES_${PN}-bcm43430 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.bin"
+FILES_${PN}-bcm43430-nvram = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.MUR1DX.txt \
+  ${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.AP6212.txt \
+"
 FILES_${PN}-bcm4354 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4354-sdio.bin"
 FILES_${PN}-bcm4356-pcie = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4356-pcie.bin"
 FILES_${PN}-bcm4373 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4373-sdio.bin \
@@ -662,6 +666,8 @@ RDEPENDS_${PN}-bcm43340 += "${PN}-cypress-license"
 LICENSE_${PN}-bcm43362 = "Firmware-cypress"
 RDEPENDS_${PN}-bcm43362 += "${PN}-cypress-license"
 LICENSE_${PN}-bcm43430 = "Firmware-cypress"
+LICENSE_${PN}-bcm43430-nvram = "Firmware-GPLv2"
+RDEPENDS_${PN}-bcm43430-nvram += "${PN}-gplv2-license"
 RDEPENDS_${PN}-bcm43430 += "${PN}-cypress-license"
 LICENSE_${PN}-bcm4354 = "Firmware-cypress"
 RDEPENDS_${PN}-bcm4354 += "${PN}-cypress-license"
-- 
2.7.4


