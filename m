Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60B51C47089
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 14:23:52 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.44640.1669904625505004408
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 06:23:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=76jfMaZz;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id w4-20020a17090ac98400b002186f5d7a4cso5416862pjt.0
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 06:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/wthRAa93hvYf8cpUJgFFoE9aQ11V/eVxwEaLlVsnro=;
        b=76jfMaZzD7o265irDFXZhvOZDhoJv18Gdkq7dLkBOmDwGXeXzrJQa1FY8rbyJBm2oA
         eZ8xb4wuF9iEUD/hQJI6vQkhRB56Chiv7LM4scfxRIDA2Ivoo9QCJ0W1QTu3B8EoNPOB
         Hmgaisk70zTd7oxNsGr0TZepL2ytixCgOVAZDgvR95eVUeI9lWy37eO9UnHoumX9017T
         q36binLvrwGU9BLJev7iA1UNGIwaM6tIUu/ySOLoC7krPZhQ2YrvESbHv7vMEH35HstC
         kVmPlyOYpLhIY4YKHD76opITruQqSAZBuR6bzqz869xegOYKjApLFC5/ggg7aJ2N5Sp0
         ulhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/wthRAa93hvYf8cpUJgFFoE9aQ11V/eVxwEaLlVsnro=;
        b=qK/abFTI5hQCYykqrEpqimf3Muzu7bVzI4R5oqUyFiDTgMuvs1PAdGb4Jfoanaq7gT
         HHmicKxdU58wxKpxUKRpPvKSWGvbdwQM0sz+3wmPYb2eCpR0iP1Rznd7DGlezD3OTJ9V
         Ge6RE4J/qv1PA0CtskSy1csykSgr3kF82fSr2UjbUHc0yMBfMZY3YVywPDEFg6DehfTb
         lRk1umwORwaKiZYiOnC6H8/PQjmo9P+CQubzmdFInDaZ//fGmfc0DNGt4D7JErOUBuXj
         W8oIxHUOuDchfx9Z7mIWl5IVxFWsIunhScyHPdGhZoShc37eANKXwoK+Bw7n17xQNPfy
         Ri8Q==
X-Gm-Message-State: ANoB5pkzWu81krz1RZSEAxxCeGD0W0U3g4O2yyIzmHQn3flGvuoU+cz+
	gapct2+CCLID4xOumrfiW8iBdE/Z5M4ZnqpgNxM=
X-Google-Smtp-Source: AA0mqf5V2CzHiwNsSQfTd7Tdupk1K2GCixw8VqlJTmizl6E5yNJRtV//mC12dNdP2ffgC+2/5347ig==
X-Received: by 2002:a17:90a:f011:b0:212:e996:704d with SMTP id bt17-20020a17090af01100b00212e996704dmr70819161pjb.132.1669904624496;
        Thu, 01 Dec 2022 06:23:44 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id p2-20020a622902000000b00575acb243besm3300615pfp.1.2022.12.01.06.23.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 06:23:43 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 18/22] linux-firmware: add new fw file to ${PN}-qcom-adreno-a530
Date: Thu,  1 Dec 2022 04:22:48 -1000
Message-Id: <fd3702355259b0e633c2e96fa65afab32c035e36.1669904433.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669904433.git.steve@sakoman.com>
References: <cover.1669904433.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 14:23:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174081

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

Extend the linux-firmware-qcom-adreno-a530 package with the squashed
Adreno 530 zap shader.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 920bf119f35824a3531801f5e41158a8ad1bca4c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20221109.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20221109.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20221109.bb
index dc977c2bb7..b05b960ebd 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20221109.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20221109.bb
@@ -993,7 +993,7 @@ FILES:${PN}-qcom-vpu-2.0 = "${nonarch_base_libdir}/firmware/qcom/vpu-2.0/*"
 FILES:${PN}-qcom-adreno-a2xx = "${nonarch_base_libdir}/firmware/qcom/leia_*.fw"
 FILES:${PN}-qcom-adreno-a3xx = "${nonarch_base_libdir}/firmware/qcom/a3*_*.fw ${nonarch_base_libdir}/firmware/a300_*.fw"
 FILES:${PN}-qcom-adreno-a4xx = "${nonarch_base_libdir}/firmware/qcom/a4*_*.fw"
-FILES:${PN}-qcom-adreno-a530 = "${nonarch_base_libdir}/firmware/qcom/a530*.*"
+FILES:${PN}-qcom-adreno-a530 = "${nonarch_base_libdir}/firmware/qcom/a530*.* ${nonarch_base_libdir}/firmware/qcom/apq8096/a530*.*"
 FILES:${PN}-qcom-adreno-a630 = "${nonarch_base_libdir}/firmware/qcom/a630*.* ${nonarch_base_libdir}/firmware/qcom/sdm845/a630*.*"
 FILES:${PN}-qcom-adreno-a650 = "${nonarch_base_libdir}/firmware/qcom/a650*.* ${nonarch_base_libdir}/firmware/qcom/sm8250/a650*.*"
 FILES:${PN}-qcom-adreno-a660 = "${nonarch_base_libdir}/firmware/qcom/a660*.*"
-- 
2.25.1


