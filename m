Return-Path: <belouargamohamed@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15F41C0015E
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 19:07:02 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.15859.1690484821075760369
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 12:07:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=J31xsYRH;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: belouargamohamed@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-317786befa2so1339143f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 12:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690484819; x=1691089619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=caBTnizjhnESP2dIxFlInxzwz3uqhIrN3Ayi44lDG10=;
        b=J31xsYRHq8tNJSjxviR06SgAX2XNQA6Mt3LjImo8A0AP3Mo8Cs3OsDcC3OL4EpTV5y
         7T6SpwnLqr6/1gq/zFF+jHZQPwBatsCgAKjEmGt0RBQQlNMXglEmcjO9d29wGNnYqpGR
         ejMDwUWJHlo1y2r6YA+t8gNvo221uRK81Bo9uy0XhuunSnHFv524LR02VR9OvRVYGIGU
         4YW69FeH1iewOtaKqbmnGFuqMFeBuOtIxBQes5/yfVf8jnagDxC2czVM3am6F5YCtJQE
         MIM3GkHXdsTayOVm2Y2TKhWWky/ReAYgBvlf1hQJwdD/8no/nJtSwIlQucQ6b2QuuR+F
         3/hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690484819; x=1691089619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=caBTnizjhnESP2dIxFlInxzwz3uqhIrN3Ayi44lDG10=;
        b=cmYdwXty+djDR/ZrdMJNVVetJAYNQt+k66Iob1+a032iPMPNSPplMnoclhyFYBO+2L
         JCa1kLbvW1gYXc31u1OFGgxhsGT+aebbZIhxbLXprZnx/KeqUGa2DLS2dhVWG15U5A8v
         dKhkkehGWuT8f6JiLobUyCqc+U/1fBtTBWEVT6xdHrSj0Fk7dxHwnUK58QBIV3iK7ouB
         f3hLg3O9GyUFhgJ8b+oLBeoVdDwwYjWQEUKV3cUMgI4CfzvT6PsWklEc92p/DO3KpdKU
         9z+0iTNg8DAwlVdzoIBsr0C9hyq95+dqT6I+c9UXcUF5GfKzEBy0UmGOwmjn4mWhZbrU
         1erQ==
X-Gm-Message-State: ABy/qLYv9GBv0N6TO67zLwuNYM34pDmv3l9HerVQJNxES7Mxc6e/0OjS
	2i6H9KdrScL8ObSFFDD8MsbJVG1+On8=
X-Google-Smtp-Source: APBJJlH+aA8f9l2EBgR+gi29IzaxmnUjbvI6yNNCYKYodqw9k6x29EvVJByTI1cFlRCXtkM+ewPe7g==
X-Received: by 2002:adf:f5cb:0:b0:314:350a:6912 with SMTP id k11-20020adff5cb000000b00314350a6912mr42993wrp.36.1690484818708;
        Thu, 27 Jul 2023 12:06:58 -0700 (PDT)
Received: from localhost.localdomain ([2a02:842a:2e:7001:996a:7262:8144:271e])
        by smtp.gmail.com with ESMTPSA id s18-20020a5d5112000000b00313e59cb371sm2868304wrt.12.2023.07.27.12.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 12:06:58 -0700 (PDT)
From: belouargamohamed@gmail.com
X-Google-Original-From: m.belouarga@technologyandstrategy.com
To: openembedded-core@lists.openembedded.org
Cc: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
Subject: [PATCH] linux-firmware : Add firmware of RTL8822 serie
Date: Thu, 27 Jul 2023 21:06:54 +0200
Message-Id: <20230727190654.414447-1-m.belouarga@technologyandstrategy.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 19:07:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184973

From: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>

RTL8822 is a serie of wireless modules that need firmwares to function correctly.
The linux firmware recipe does not have a package of these firmwares, and this commit add them.

Signed-off-by: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
---
 .../linux-firmware/linux-firmware_20230625.bb             | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
index 329a3e3c9a..3d6645579a 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
@@ -241,6 +241,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-rtl-license ${PN}-rtl8188 ${PN}-rtl8192cu ${PN}-rtl8192ce ${PN}-rtl8192su ${PN}-rtl8723 ${PN}-rtl8821 \
              ${PN}-rtl8761 \
              ${PN}-rtl8168 \
+             ${PN}-rtl8822 \
              ${PN}-cypress-license \
              ${PN}-broadcom-license \
              ${PN}-bcm-0bb4-0306 \
@@ -581,6 +582,7 @@ LICENSE:${PN}-rtl8192su = "Firmware-rtlwifi_firmware"
 LICENSE:${PN}-rtl8723 = "Firmware-rtlwifi_firmware"
 LICENSE:${PN}-rtl8761 = "Firmware-rtlwifi_firmware"
 LICENSE:${PN}-rtl8821 = "Firmware-rtlwifi_firmware"
+LICENSE:${PN}-rtl8822 = "Firmware-rtlwifi_firmware"
 LICENSE:${PN}-rtl-license = "Firmware-rtlwifi_firmware"
 LICENSE:${PN}-rtl8168 = "WHENCE"
 
@@ -611,6 +613,11 @@ FILES:${PN}-rtl8761 = " \
 FILES:${PN}-rtl8168 = " \
   ${nonarch_base_libdir}/firmware/rtl_nic/rtl8168*.fw \
 "
+FILES:${PN}-rtl8822 = " \
+  ${nonarch_base_libdir}/firmware/rtl_bt/rtl8822*.bin \
+  ${nonarch_base_libdir}/firmware/rtw88/rtw8822*.bin \
+  ${nonarch_base_libdir}/firmware/rtlwifi/rtl8822*.bin \
+"
 
 RDEPENDS:${PN}-rtl8188 += "${PN}-rtl-license"
 RDEPENDS:${PN}-rtl8192ce += "${PN}-rtl-license"
@@ -619,6 +626,7 @@ RDEPENDS:${PN}-rtl8192su = "${PN}-rtl-license"
 RDEPENDS:${PN}-rtl8723 += "${PN}-rtl-license"
 RDEPENDS:${PN}-rtl8821 += "${PN}-rtl-license"
 RDEPENDS:${PN}-rtl8761 += "${PN}-rtl-license"
+RDEPENDS:${PN}-rtl8822 += "${PN}-rtl-license"
 RDEPENDS:${PN}-rtl8168 += "${PN}-whence-license"
 
 # For ti-connectivity
-- 
2.25.1


