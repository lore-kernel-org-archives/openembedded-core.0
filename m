Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09AD0C3600E
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 20:29:32 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.33350.1743020963891892241
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 13:29:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nMa52gU4;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: hiagofranco@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-30185d00446so421125a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 13:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743020963; x=1743625763; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5L+hox97vQilG2h0LyePYG+r8Tov4oJFLYJQbcgIVI0=;
        b=nMa52gU40WXQgadUizFf7vZ/ElzrjhgGLYw8FgGIMUzMuur91ZfwLH3qiwBSAyhaTn
         iNv7LGmaablZaaRS2y6Asv2PqKux+pOud4q1x64hVZ6rYjix+nH/UOgEwmv8C8aYkW1e
         g/iReDkByNHcFFCP0TLCdnbkdmsHZDuSprW2yjAL1tqPob/I1pj2hOVL6JelNFAPhEgb
         pxGjyzWaVV+RgX4LuA1AYbJNbZ6lWneDJ8iCWX8lSTv3+KLibB8n9I8vCeYCx4JzoH6N
         PW5MjjuVGAjC4/5ppLKirtH1Y+lueFQxla0TueF5s/ijl2rNH2BlwCGXPLpVd+vBnhnB
         W+RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743020963; x=1743625763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5L+hox97vQilG2h0LyePYG+r8Tov4oJFLYJQbcgIVI0=;
        b=uAzIIKdZ4sfPmv00dn5gN8J9RUPzA697hEo2x5QzHrPq+qIIGDUW60A9YustQJwgLd
         QUnVaJUdu1oVcQwp44/9vorjkPi9UjdEJubW598dQYlFIdu22iAnKIMseSsq53lFLlkK
         1wOKl9jzFXuwk62YOpT/4ZS8qfwIsWu5MNMwjZ5ISuuAjeXaA/P78SJqf5brfwkD7dlC
         y1SOCXRrc6q8WwmsmeVlwP83TxtzK2xSFviUbx3fdYx20YLljHcanCtdXSTWL3vKoiWD
         IU449QIsYAbjDqnZPTvmsGHJ/avVjlHxuwJsmc5RAW5D1q9Xls4EK5aplKLb6kFSyIq2
         gHzA==
X-Gm-Message-State: AOJu0YwX7Lw1MP5J2kYXiwgwYU6Sg5h1jzO1sulvs5KzJWwcM9wUSeEa
	45aJqrd+jX1Mf2ZF5fjq25SREqfuNmVfZ5iugqKlpH8NB5ZzDYpFSGhhOK4y
X-Gm-Gg: ASbGncsgSI3Vfm0UWuHzMnY3d0oE7SzaACJJxlM6sCOXa9FhvYBj3DnmkAvPmlyojJf
	kqCYKlJp3pa2vdGQ9yHJrr7z1W3dC0ClzuK4zaKgzQims54ME5ECnUOcsJ3ZjAotSxnH35AKbIw
	2oOxoLDnwqOawdvfMolqAp4+kF6i2T4tz0ssQetZ+ozhLbRA1hkCAMcboCFHzK6hLVuRZIeHnEa
	d+DVDhJ1OPBmdO0PTXtm9WIbcUVDjAOSHfiYHlrq8zgoo5jDeku9hg0ceI5u+G6lrenV0JtQjzK
	SPWKHGvw0QaY5vaw4H1LC3+Lzsw6ydJHkdtbttYbf1qu7wCfESryk8Vx9D1i2GKBheM=
X-Google-Smtp-Source: AGHT+IEBpBpmUjPtelS6zM06UBMpBoZXvCnnrlVzPz1/+gqlSPas2yvUwMJ53RDHF6IjrRByfxQn5A==
X-Received: by 2002:a17:90b:5685:b0:2ff:6e58:89f5 with SMTP id 98e67ed59e1d1-303a5fba736mr1925890a91.6.1743020962976;
        Wed, 26 Mar 2025 13:29:22 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f1d4b6asm661625a91.38.2025.03.26.13.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 13:29:22 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: quentin.schulz@cherry.de,
	steve@sakoman.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Dmitry Baryshkov <dbaryshkov@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [styhead][PATCH v2 07/31] linux-firmware: split sa8775p ZAP shader to separate package
Date: Wed, 26 Mar 2025 17:27:53 -0300
Message-Id: <20250326202817.64437-8-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250326202817.64437-1-hiagofranco@gmail.com>
References: <20250326202817.64437-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 20:29:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213667

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

Adreno zap.mbn files are platform-specific. As such they shouldn't be a
part of the generic ${PN}-qcom-adreno-aNNN packages. Move it to the
${PN}-qcom-sa8775p-adreno package.

Fixes: 02dec6af254c ("linux-firmware: Add qcom-adreno-a663 package")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5280c01f93a7c8cf2ca7996965377fc10d24027e)
---
 .../linux-firmware/linux-firmware_20241017.bb               | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
index 957452947d5e..b40c33d5ada8 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
@@ -411,6 +411,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-qcm6490-adreno \
              ${PN}-qcom-qcm6490-audio ${PN}-qcom-qcm6490-compute ${PN}-qcom-qrb4210-adreno \
              ${PN}-qcom-qrb4210-audio ${PN}-qcom-qrb4210-compute ${PN}-qcom-qrb4210-modem \
+             ${PN}-qcom-sa8775p-adreno \
              ${PN}-qcom-sc8280xp-lenovo-x13s-compat \
              ${PN}-qcom-sc8280xp-lenovo-x13s-audio \
              ${PN}-qcom-sc8280xp-lenovo-x13s-adreno \
@@ -1452,6 +1453,7 @@ LICENSE:${PN}-qcom-qrb4210-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-qrb4210-compute  = "Firmware-qcom"
 LICENSE:${PN}-qcom-qrb4210-modem = "Firmware-qcom"
 LICENSE:${PN}-qcom-qrb4210-wifi = "Firmware-qcom"
+LICENSE:${PN}-qcom-sa8775p-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "Firmware-qcom & Firmware-linaro"
 LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "Firmware-qcom"
@@ -1488,7 +1490,7 @@ FILES:${PN}-qcom-adreno-a530 = "${nonarch_base_libdir}/firmware/qcom/a530*.fw*"
 FILES:${PN}-qcom-adreno-a630 = "${nonarch_base_libdir}/firmware/qcom/a630*.*"
 FILES:${PN}-qcom-adreno-a650 = "${nonarch_base_libdir}/firmware/qcom/a650*.*"
 FILES:${PN}-qcom-adreno-a660 = "${nonarch_base_libdir}/firmware/qcom/a660*.*"
-FILES:${PN}-qcom-adreno-a663 = "${nonarch_base_libdir}/firmware/qcom/a663*.* ${nonarch_base_libdir}/firmware/qcom/sa8775p/a663_zap.mbn*"
+FILES:${PN}-qcom-adreno-a663 = "${nonarch_base_libdir}/firmware/qcom/a663*.*"
 FILES:${PN}-qcom-adreno-a702 = "${nonarch_base_libdir}/firmware/qcom/a702*.*"
 FILES:${PN}-qcom-adreno-g750 = "${nonarch_base_libdir}/firmware/qcom/gen70500_*.*"
 FILES:${PN}-qcom-apq8016-modem = "${nonarch_base_libdir}/firmware/qcom/apq8016/mba.mbn* ${nonarch_base_libdir}/firmware/qcom/apq8016/modem.mbn*"
@@ -1508,6 +1510,7 @@ FILES:${PN}-qcom-qrb4210-audio = "${nonarch_base_libdir}/firmware/qcom/qrb4210/a
 FILES:${PN}-qcom-qrb4210-compute = "${nonarch_base_libdir}/firmware/qcom/qrb4210/cdsp*.*"
 FILES:${PN}-qcom-qrb4210-modem = "${nonarch_base_libdir}/firmware/qcom/qrb4210/modem*.*"
 FILES:${PN}-qcom-qrb4210-wifi = "${nonarch_base_libdir}/firmware/qcom/qrb4210/wlanmdsp.mbn* ${nonarch_base_libdir}/firmware/ath10k/WCN3990/hw1.0/qrb4210/*"
+FILES:${PN}-qcom-sa8775p-adreno = "${nonarch_base_libdir}/firmware/qcom/sa8775p/a663_zap.mbn*"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-compat = "${nonarch_base_libdir}/firmware/qcom/LENOVO/21BX"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/*adsp*.* ${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/battmgr.jsn* ${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/audioreach-tplg.bin* ${nonarch_base_libdir}/firmware/qcom/sc8280xp/SC8280XP-LENOVO-X13S-tplg.bin*"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn*"
@@ -1562,6 +1565,7 @@ RDEPENDS:${PN}-qcom-qrb4210-modem = "${PN}-qcom-license"
 # Only symlinks in qcom-qrb4210-wifi, firmware is in qcom-qcm2290-wifi
 # c.f. https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=650e88378e76d5fad3997a5398f1ade47a74d924
 RDEPENDS:${PN}-qcom-qrb4210-wifi = "${PN}-qcom-license ${PN}-qcom-qcm2290-wifi"
+RDEPENDS:${PN}-qcom-sa8775p-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${PN}-qcom-license ${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "${PN}-qcom-license"
-- 
2.39.5


