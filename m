Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E302C47092
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:07 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.5940.1650449492169761465
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 03:11:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=P1raGVqO;
 spf=pass (domain: linaro.org, ip: 209.85.167.44,
 mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f44.google.com with SMTP id y32so2035114lfa.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 03:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MGYsNHK+f8G2Qin+qoEC+5aKiSa1aUf47PwWNSTysQY=;
        b=P1raGVqOoje6V74zGRxORiw/lbSS0RmWxwcXVHy6LBUZNhSH0f5WNZRdn5t6ytJVdL
         5Qbb+i+Q68ocoETQgp00+roJD1SFTszxs9F3cUwlG75uty77kIlzJaVuk8lPam/6Mw0r
         HpKVSdjoxZ7JCiStPI/ys9Q3PuCXsK0u1G1COkLG+I+AssnBpiYIGqbs7OAL7M3jydcI
         iife1B5+vEo0aLkIUPutnXziMbVVZE8x+ti2rtdp483oySM8NetsKnS1UTu571iylXWV
         EpQLB/lkc5kPS1i2i5xjb1Jc4KV0z6FE24jmXsJV//wA3Fww9YAtbtCIFkEuPd09algY
         gjGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MGYsNHK+f8G2Qin+qoEC+5aKiSa1aUf47PwWNSTysQY=;
        b=u1I/Dz7T3yp7f8D0ImF6qqs8x9g2kzp54/kAFYkTMhCaoFJlqhKUX4km8nxT9+Obqh
         3i07w1KbVGRMBpw6f9SpTzCdksiMXWzT9p1rax9NJf2Pju+VX2Uiy5/Dx98GDo+1+uG1
         SJas9eZWf3IY6JonMRmUiLg8UVPhmzJ2D6+H4Ovgj7MK3io3Zmqn77tY8z4JJfKNpIiJ
         9r79S+hjKrFSH19aVMB+KQiaOAKgjN4uM3rly3epZCo0aLvhmbCsCZIMxYdSN5dZ7cqu
         fup2eLccO1d/hLojdgk/Z96ciyO5BWPgpPa6IJRV5ZB6CRwJLGZZjyIBe8wtVVlI/mN1
         GS8w==
X-Gm-Message-State: AOAM531GY/J5NDRLQYS55OjtxfXtKONqRj4s+8/rTgwrX4SBoIqyBlZA
	8L/Oux0ZcCprUfFQrs6GC07HKzM8G6z3zw==
X-Google-Smtp-Source: 
 ABdhPJxFc+WhKXbQYaA3udGo4PKkZWRlCwQh4yLDd2IP2Lj/PLthKY/kUvAVx5VYLG35W2aR8Ayo7g==
X-Received: by 2002:a19:7401:0:b0:46e:bf86:3a26 with SMTP id
 v1-20020a197401000000b0046ebf863a26mr14447927lfe.271.1650449489881;
        Wed, 20 Apr 2022 03:11:29 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id
 j10-20020a2ea90a000000b0024d9ee09661sm1660499ljq.27.2022.04.20.03.11.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 03:11:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] linux-firmware: correct license for ar3k firmware
Date: Wed, 20 Apr 2022 13:11:28 +0300
Message-Id: <20220420101129.2960823-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164660

According to the WHENCE file, some a3k firmware files are licensed
under the special ar3k license, while others are licensed under the more
generic Atheros license. Document this by adding extending the
LICENSE:${PN}-ar3k and depending on both of them.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb
index c7d9e1126e7f..4a443d14d177 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb
@@ -352,7 +352,7 @@ FILES:${PN}-carl9170 = " \
 RDEPENDS:${PN}-carl9170 += "${PN}-gplv2-license"
 
 # For QualCommAthos
-LICENSE:${PN}-ar3k = "Firmware-qualcommAthos_ar3k"
+LICENSE:${PN}-ar3k = "Firmware-qualcommAthos_ar3k & Firmware-atheros_firmware"
 LICENSE:${PN}-ar3k-license = "Firmware-qualcommAthos_ar3k"
 LICENSE:${PN}-ath10k = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath10k-license = "Firmware-qualcommAthos_ath10k"
@@ -376,7 +376,7 @@ FILES:${PN}-qca = " \
   ${nonarch_base_libdir}/firmware/qca \
 "
 
-RDEPENDS:${PN}-ar3k += "${PN}-ar3k-license"
+RDEPENDS:${PN}-ar3k += "${PN}-ar3k-license ${PN}-atheros-license"
 RDEPENDS:${PN}-ath10k += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath11k += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca += "${PN}-ath10k-license"
-- 
2.30.2


