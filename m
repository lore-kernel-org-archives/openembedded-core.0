Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DA3CCCA47E
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 14:40:29 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web12.7283.1654699222504648117
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:40:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Xjk5YSDB;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id g186so10194863pgc.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=R6Aa/EmHgICQcRHyFtzR0757QCGmW7KDSKC4os3+dQs=;
        b=Xjk5YSDB/PfxSFariPmraXn+GHEiLWgHkTFUMmcftl2qU8t4RkLSO0YJa2iAuUS+GE
         Dr7OlmHVltpnLlel0LZ0uqaT6o6dDVd4MnuaXBAZWeVOsYKZtetF0e7HN3ZdjJ/LaL/q
         Q1EYZ5VfRHeD5CfUv979tWfERxdjEHG4TmRoMqkM23Vz0G0R2Rr3VBn2kGl0yRaJ6hzJ
         7ZljwtFce0wtRGl8i6uMuA4ZUYCOmOgMiyNGpzZSRE19AVTBObTMp5TJfuuaGgeGmu2O
         W2qgex885sehQetbR0q3mqOOCzgN4LLb/mCrWBnD0TjojoKzpS7x7yxLe5AXlIoRium0
         Q88Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R6Aa/EmHgICQcRHyFtzR0757QCGmW7KDSKC4os3+dQs=;
        b=Fl1by1j3/bAgr5+52lWelqg3qS74JC2wnONHA9DltTGoQKhsdo0l3roGoZuZWUYZNk
         cBu1B4fyBlASHPcPKXQlejyMMlutL0CbT1y/npwpgX2Cn2RJ00Ek1YEGSseskdtbidkH
         zPtetWNhOIGYDhe1wJci7D4m0kZvu/KeSR+LEYexcer7X+B/B48zbYW/r7tqn8Z1SN05
         l8PWeIcXsK5xCOWKWaxP6mW7nWaFPgeFStHugHUvus/hcXmegbh8sWrPHAO4rhXGF5Yp
         g9/x6eOw9ui+e++j6gBS+xTtCgZRoGX9yp8w1g/yo4Te+mDapDvWy+GZo6AcZ96LjRZH
         1VDQ==
X-Gm-Message-State: AOAM533cFAyKJ55Xw4nUzkXiiz28bYxnOzUk+lWFy003MN4zEeytPlXz
	SlCNaMfEQPpXxcNTeEexCNMa4b34tJCQ06Nk
X-Google-Smtp-Source: 
 ABdhPJz6PYOuvByaFASG2euuqo70wY5feQoqOJztcB1aw0QKMai+KzhiMbUIA931Pjruo3bz4zphaQ==
X-Received: by 2002:a63:2bc4:0:b0:3fa:cc63:415e with SMTP id
 r187-20020a632bc4000000b003facc63415emr30353540pgr.465.1654699221440;
        Wed, 08 Jun 2022 07:40:21 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i4-20020aa787c4000000b0051bc581b62asm12945213pfo.121.2022.06.08.07.40.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 07:40:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/22] linux-firmware: package new Qualcomm
 firmware
Date: Wed,  8 Jun 2022 04:39:24 -1000
Message-Id: 
 <99c0d4b8f91c647f53b778a1802b856a64617a40.1654698895.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654698895.git.steve@sakoman.com>
References: <cover.1654698895.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 14:40:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166722

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

Create separate packages with firmware files for APQ8096 SoC and for
Adreno 2xx/4xx. Include A330 firmware into the 3xx package.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1a0cb8f9131d1f238dc150e583a7ff816645765f)
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux-firmware/linux-firmware_20220509.bb       | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20220509.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20220509.bb
index 87d2efef12..7da5eca893 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20220509.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20220509.bb
@@ -307,8 +307,9 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-qcom-license \
              ${PN}-qcom-venus-1.8 ${PN}-qcom-venus-4.2 ${PN}-qcom-venus-5.2 ${PN}-qcom-venus-5.4 \
              ${PN}-qcom-vpu-1.0 ${PN}-qcom-vpu-2.0 \
-             ${PN}-qcom-adreno-a3xx ${PN}-qcom-adreno-a530 \
+             ${PN}-qcom-adreno-a2xx ${PN}-qcom-adreno-a3xx ${PN}-qcom-adreno-a4xx ${PN}-qcom-adreno-a530 \
              ${PN}-qcom-adreno-a630 ${PN}-qcom-adreno-a650 ${PN}-qcom-adreno-a660 \
+             ${PN}-qcom-apq8096-audio ${PN}-qcom-apq8096-modem \
              ${PN}-qcom-sdm845-audio ${PN}-qcom-sdm845-compute ${PN}-qcom-sdm845-modem \
              ${PN}-qcom-sm8250-audio ${PN}-qcom-sm8250-compute \
              ${PN}-amlogic-vdec-license ${PN}-amlogic-vdec \
@@ -961,11 +962,15 @@ FILES:${PN}-qcom-venus-5.2 = "${nonarch_base_libdir}/firmware/qcom/venus-5.2/*"
 FILES:${PN}-qcom-venus-5.4 = "${nonarch_base_libdir}/firmware/qcom/venus-5.4/*"
 FILES:${PN}-qcom-vpu-1.0 = "${nonarch_base_libdir}/firmware/qcom/vpu-1.0/*"
 FILES:${PN}-qcom-vpu-2.0 = "${nonarch_base_libdir}/firmware/qcom/vpu-2.0/*"
-FILES:${PN}-qcom-adreno-a3xx = "${nonarch_base_libdir}/firmware/qcom/a300_*.fw ${nonarch_base_libdir}/firmware/a300_*.fw"
+FILES:${PN}-qcom-adreno-a2xx = "${nonarch_base_libdir}/firmware/qcom/leia_*.fw"
+FILES:${PN}-qcom-adreno-a3xx = "${nonarch_base_libdir}/firmware/qcom/a3*_*.fw ${nonarch_base_libdir}/firmware/a300_*.fw"
+FILES:${PN}-qcom-adreno-a4xx = "${nonarch_base_libdir}/firmware/qcom/a4*_*.fw"
 FILES:${PN}-qcom-adreno-a530 = "${nonarch_base_libdir}/firmware/qcom/a530*.*"
 FILES:${PN}-qcom-adreno-a630 = "${nonarch_base_libdir}/firmware/qcom/a630*.* ${nonarch_base_libdir}/firmware/qcom/sdm845/a630*.*"
 FILES:${PN}-qcom-adreno-a650 = "${nonarch_base_libdir}/firmware/qcom/a650*.* ${nonarch_base_libdir}/firmware/qcom/sm8250/a650*.*"
 FILES:${PN}-qcom-adreno-a660 = "${nonarch_base_libdir}/firmware/qcom/a660*.*"
+FILES:${PN}-qcom-apq8096-audio = "${nonarch_base_libdir}/firmware/qcom/apq8096/adsp*.*"
+FILES:${PN}-qcom-apq8096-modem = "${nonarch_base_libdir}/firmware/qcom/apq8096/mba.mbn ${nonarch_base_libdir}/firmware/qcom/apq8096/modem*.* ${nonarch_base_libdir}/firmware/qcom/apq8096/wlanmdsp.mbn"
 FILES:${PN}-qcom-sdm845-audio = "${nonarch_base_libdir}/firmware/qcom/sdm845/adsp*.*"
 FILES:${PN}-qcom-sdm845-compute = "${nonarch_base_libdir}/firmware/qcom/sdm845/cdsp*.*"
 FILES:${PN}-qcom-sdm845-modem = "${nonarch_base_libdir}/firmware/qcom/sdm845/mba.mbn ${nonarch_base_libdir}/firmware/qcom/sdm845/modem*.* ${nonarch_base_libdir}/firmware/qcom/sdm845/wlanmdsp.mbn"
@@ -977,11 +982,15 @@ RDEPENDS:${PN}-qcom-venus-5.2 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-venus-5.4 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-vpu-1.0 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-vpu-2.0 = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-adreno-a2xx = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a3xx = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-adreno-a4xx = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a530 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a630 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a650 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a660 = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-apq8096-audio = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-apq8096-modem = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-compute = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-modem = "${PN}-qcom-license"
-- 
2.25.1


