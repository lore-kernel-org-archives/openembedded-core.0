Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB223C3600E
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 20:29:21 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.33345.1743020956098459057
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 13:29:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ds49EyZI;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: hiagofranco@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ff6e91cff5so325902a91.2
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 13:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743020955; x=1743625755; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fMhUBO2uWYUlv9o8PrTfoofXsYs5h0zCXV35eFfFdFg=;
        b=Ds49EyZIy3YY4tCg+pzQbNNtuZfSAGNDH6GPWMv1S/ZPm6XAJtmpiEN0qCUstHinN4
         AF5Nje/ZYE/Buai2p5DUem74PXvE00O2ij/i5p1erI0OUJuR+y+CltqrN58+obgswFO4
         ZZ6UqySifuBtLFjal61TeMQkjMApgCOyF5htqkoSmcMxhZt1gCh/Wymh0/Db4+neabOr
         s/b23IaPcEnUjVSGx2jCD4vUE8/0tOBdvk7iRjoNej4xEU7FwBHlPOX0Yo4LGHfmFW8u
         ZZxEs7wogJubzMLHQUdkhOgnN6Bn6PM/bmsCPYxspsGNKyTH9dQ40CnM2TrjN1wDX3nH
         7d6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743020955; x=1743625755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fMhUBO2uWYUlv9o8PrTfoofXsYs5h0zCXV35eFfFdFg=;
        b=FecCnJyD57UfLSm4v5eCMhiyQ82k5464uPhg4YObaB0QzJWO8RnDwbs1d5aT8b9/ta
         tRcfYq6/6NcWJHYcCi5pwduhCfauEjkoBWLoLkMUZcz6DLs136Rv22gw6O0vesXcqCJX
         i5X+BDRb8QFzS2XjoBwzSOeLKrOG/XC6peWPn/e5p9m2RpDtRrvEgGOEngv6On2YF/pN
         a3ko0NJgttl3FG4Y5oluriHdsbXfhz72vn+zHs3UT3QjkOHqQMound+1ySR+FL8ZWJh8
         dtTcR9Agmm5+nFXHA7BB9n70Uiojb7MhHVYYM/uTwWpHmSvmuBz79eAaYQQWr7i15zKi
         QAig==
X-Gm-Message-State: AOJu0Yw0RH2Ysz6tb5TynUumbnmDDOQZVpqxdOS8lqdhbv20pmW28+9p
	2AHfqGNFvhBaiN1O69elM1S6++CuNF5nWhBnxV6mKyqEF8T6ZjK2rOiVgzv1
X-Gm-Gg: ASbGncv3SBTgnWi8e5IjxStLLLKOqujFVbkiDG8oPiXnRZjPEKU88fRyTATsX5Dtuig
	9er2CQSAlczY+sOhbLEfUowskCa417K/JNyvSIguey8w2O6N4ZQihZ/eArD9GvzLwN6GEgHg0dO
	ZsmPBgszXKECwmUD7bDkn8wLzQ4qa5I4toqk2QxMHqA1pwkPj6RagaX6RERuAkHPkmX6krk1pHz
	+JrEv3xy/Zxzhy7vadZ+Ov1HM9XXaigqIArxLoPv0KV6+qvIupy8Dn1TWwAIjADl5ke0RlZWbMO
	JNosDm/KeQIXxHR/hiCmnpvuRekGoGwjqj0/04zZ7MmzJRvQeuagBjDzS48xVKQsgWo=
X-Google-Smtp-Source: AGHT+IEHRQ1pofcyQ8NSKRFpqzkxcVahk1ouWm80DaVR82CoNup1gHmsP2wxvLqQmp0goA2LVkFZaQ==
X-Received: by 2002:a17:90b:1ccd:b0:2ee:b875:6d30 with SMTP id 98e67ed59e1d1-303a7d73279mr1546631a91.9.1743020955340;
        Wed, 26 Mar 2025 13:29:15 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f1d4b6asm661625a91.38.2025.03.26.13.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 13:29:14 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: quentin.schulz@cherry.de,
	steve@sakoman.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Vivek Puar <quic_vpuar@quicinc.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [styhead][PATCH v2 04/31] linux-firmware: Add qcom-adreno-a663 package
Date: Wed, 26 Mar 2025 17:27:50 -0300
Message-Id: <20250326202817.64437-5-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250326202817.64437-1-hiagofranco@gmail.com>
References: <20250326202817.64437-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 20:29:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213664

From: Vivek Puar <quic_vpuar@quicinc.com>

Adding new package containing firmware for Adreno
A663 GPU

Signed-off-by: Vivek Puar <quic_vpuar@quicinc.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 02dec6af254cbabfb29e23e3f44e51bc1b989070)
---
 .../linux-firmware/linux-firmware_20241017.bb              | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
index 60d24efca44b..9dcb0313a9a1 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
@@ -403,8 +403,8 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-venus-1.8 ${PN}-qcom-venus-4.2 ${PN}-qcom-venus-5.2 ${PN}-qcom-venus-5.4 ${PN}-qcom-venus-6.0 \
              ${PN}-qcom-vpu \
              ${PN}-qcom-adreno-a2xx ${PN}-qcom-adreno-a3xx ${PN}-qcom-adreno-a4xx ${PN}-qcom-adreno-a530 \
-             ${PN}-qcom-adreno-a630 ${PN}-qcom-adreno-a650 ${PN}-qcom-adreno-a660 ${PN}-qcom-adreno-a702 \
-             ${PN}-qcom-adreno-g750 \
+             ${PN}-qcom-adreno-a630 ${PN}-qcom-adreno-a650 ${PN}-qcom-adreno-a660 ${PN}-qcom-adreno-a663 \
+             ${PN}-qcom-adreno-a702 ${PN}-qcom-adreno-g750 \
              ${PN}-qcom-apq8016-modem ${PN}-qcom-apq8016-wifi \
              ${PN}-qcom-apq8096-adreno ${PN}-qcom-apq8096-audio ${PN}-qcom-apq8096-modem \
              ${PN}-qcom-qcm2290-adreno ${PN}-qcom-qcm2290-audio ${PN}-qcom-qcm2290-modem \
@@ -1431,6 +1431,7 @@ LICENSE:${PN}-qcom-adreno-a530 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a630 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a650 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a660 = "Firmware-qcom"
+LICENSE:${PN}-qcom-adreno-a663 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a702 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-g750 = "Firmware-qcom"
 LICENSE:${PN}-qcom-apq8016-modem = "Firmware-qcom"
@@ -1485,6 +1486,7 @@ FILES:${PN}-qcom-adreno-a530 = "${nonarch_base_libdir}/firmware/qcom/a530*.fw*"
 FILES:${PN}-qcom-adreno-a630 = "${nonarch_base_libdir}/firmware/qcom/a630*.*"
 FILES:${PN}-qcom-adreno-a650 = "${nonarch_base_libdir}/firmware/qcom/a650*.*"
 FILES:${PN}-qcom-adreno-a660 = "${nonarch_base_libdir}/firmware/qcom/a660*.* ${nonarch_base_libdir}/firmware/qcom/qcm6490/a660_zap.mbn*"
+FILES:${PN}-qcom-adreno-a663 = "${nonarch_base_libdir}/firmware/qcom/a663*.* ${nonarch_base_libdir}/firmware/qcom/sa8775p/a663_zap.mbn*"
 FILES:${PN}-qcom-adreno-a702 = "${nonarch_base_libdir}/firmware/qcom/a702*.*"
 FILES:${PN}-qcom-adreno-g750 = "${nonarch_base_libdir}/firmware/qcom/gen70500_*.*"
 FILES:${PN}-qcom-apq8016-modem = "${nonarch_base_libdir}/firmware/qcom/apq8016/mba.mbn* ${nonarch_base_libdir}/firmware/qcom/apq8016/modem.mbn*"
@@ -1535,6 +1537,7 @@ RDEPENDS:${PN}-qcom-adreno-a530 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a630 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a650 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a660 = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-adreno-a663 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a702 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-g750 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8016-modem = "${PN}-qcom-license"
-- 
2.39.5


