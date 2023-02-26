Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D387C64ED6
	for <webhook@archiver.kernel.org>; Sun, 26 Feb 2023 17:02:46 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.69581.1677430965901450455
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Feb 2023 09:02:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=1jmPhx/Q;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id bn17so2219976pgb.10
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 09:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BBxssKUUCtNR98jAIHYefdIW3aaDb2b3Byhsu4003NY=;
        b=1jmPhx/QTVGpEmrpDyNDzKqowCnaW8LV1+rxyrEgvs6FiILePy+HiFVFK/j7kpVB9o
         omkHYOCRe5ilxN8kz1Ut/eoONUc3Q08lj15o5QDHfRICCMRJP+CBOpWI7qf+Im4hfr1R
         pQujOLPKdHjZ1OphB6qQdBRPuKN3buAg2H6ITXUrvBS1Mxipf42tq6fQ5ZR4hb2noIsl
         DQBKTKUOTRrzIX+4ZLtkhkvELkwJ3g2X7NbVCp3ELwBNfbt9wHgPr8QIFxgg6bJX+cLy
         0wDqlivpq2BHqmrfTLVPKJ84UogtB+pb8eJtdlueNY3LjEZLKicehncRV3ziM7r/ush1
         qyZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BBxssKUUCtNR98jAIHYefdIW3aaDb2b3Byhsu4003NY=;
        b=op43xg4Mewub57hDxnljtemN1U4l9rcxbWQgGO5xrFbsnc+GBrtCT7Vz2hBhwAtbZs
         usULOMCXbbigRN8cPiYLEemSlFA1UTjXB7ySTsoZxnTFGNMw5a+Z+kCBtN/jwqqvEn+N
         FQKy5dHqsLlPMNp8fZsQ1YIOjgAgC7gstP6MJOIAj10IZYEsD+Vc6dbMGRUtEY5CfKAz
         VVEAmr+nvHymlB8hJX3lVhDyNmcHx1TZLngTq5RSBVf114qCOPhUWgz+EoIalKczddf9
         bN4bMuSTu832mfZGfaz0/yHPGOrQc0CF4M6LOk1B7MWpMkiH9wMV6QIO+YPT27579u/B
         du/Q==
X-Gm-Message-State: AO0yUKVybArlkYKLuDAPfse5wKf1+bLLNv5TU1ErDYEkLoIK5U+SZ2co
	8sqaNyjZoQHJ4w2Ze9A4CF1bCVZQXsil2jlSU68=
X-Google-Smtp-Source: AK7set9iONT2HrIMnGUxwf4xxOq5FNDLAQwAum3sOxPpXXIKWuyMVlrgSOvJd7SNadyxsIuIh9IRFQ==
X-Received: by 2002:a62:52c4:0:b0:5dc:6dec:e9d0 with SMTP id g187-20020a6252c4000000b005dc6dece9d0mr10656787pfb.3.1677430964890;
        Sun, 26 Feb 2023 09:02:44 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id s25-20020a63af59000000b004f1cb6ffe81sm2500856pgo.64.2023.02.26.09.02.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 09:02:44 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 08/28] linux-firmware: properly set license for all Qualcomm firmware
Date: Sun, 26 Feb 2023 07:02:04 -1000
Message-Id: <2a9659695b28030a6004d81be1e75e7fd89ebbab.1677430770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677430770.git.steve@sakoman.com>
References: <cover.1677430770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 17:02:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177746

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

It is not enough to depend on the ${PN}-qcom-license package. Set
LICENSE variable for all the qcom packages to point to the proper
license.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9dc41e18dc138a7cce920f8e4c85eb3130c0d553)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux-firmware/linux-firmware_20230117.bb | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230117.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230117.bb
index 1dce06c8f5..9ae0b2be13 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230117.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230117.bb
@@ -983,6 +983,31 @@ RDEPENDS:${PN}-qat        = "${PN}-qat-license"
 
 # For QCOM VPU/GPU and SDM845
 LICENSE:${PN}-qcom-license = "Firmware-qcom"
+LICENSE:${PN}-qcom-venus-1.8 = "Firmware-qcom"
+LICENSE:${PN}-qcom-venus-4.2 = "Firmware-qcom"
+LICENSE:${PN}-qcom-venus-5.2 = "Firmware-qcom"
+LICENSE:${PN}-qcom-venus-5.4 = "Firmware-qcom"
+LICENSE:${PN}-qcom-vpu-1.0 = "Firmware-qcom"
+LICENSE:${PN}-qcom-vpu-2.0 = "Firmware-qcom"
+LICENSE:${PN}-qcom-adreno-a2xx = "Firmware-qcom"
+LICENSE:${PN}-qcom-adreno-a3xx = "Firmware-qcom"
+LICENSE:${PN}-qcom-adreno-a4xx = "Firmware-qcom"
+LICENSE:${PN}-qcom-adreno-a530 = "Firmware-qcom"
+LICENSE:${PN}-qcom-adreno-a630 = "Firmware-qcom"
+LICENSE:${PN}-qcom-adreno-a650 = "Firmware-qcom"
+LICENSE:${PN}-qcom-adreno-a660 = "Firmware-qcom"
+LICENSE:${PN}-qcom-apq8096-audio = "Firmware-qcom"
+LICENSE:${PN}-qcom-apq8096-modem = "Firmware-qcom"
+LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "Firmware-qcom"
+LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "Firmware-qcom"
+LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "Firmware-qcom"
+LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "Firmware-qcom"
+LICENSE:${PN}-qcom-sdm845-audio = "Firmware-qcom"
+LICENSE:${PN}-qcom-sdm845-compute = "Firmware-qcom"
+LICENSE:${PN}-qcom-sdm845-modem = "Firmware-qcom"
+LICENSE:${PN}-qcom-sm8250-audio = "Firmware-qcom"
+LICENSE:${PN}-qcom-sm8250-compute = "Firmware-qcom"
+
 FILES:${PN}-qcom-license   = "${nonarch_base_libdir}/firmware/LICENSE.qcom ${nonarch_base_libdir}/firmware/qcom/NOTICE.txt"
 FILES:${PN}-qcom-venus-1.8 = "${nonarch_base_libdir}/firmware/qcom/venus-1.8/*"
 FILES:${PN}-qcom-venus-4.2 = "${nonarch_base_libdir}/firmware/qcom/venus-4.2/*"
-- 
2.34.1


