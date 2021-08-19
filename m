Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web09.75308.1629405491154696924
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Aug 2021 13:38:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=K+Q/uuxG;
 spf=pass (domain: linaro.org, ip: 209.85.167.54, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f54.google.com with SMTP id w20so15581921lfu.7
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Aug 2021 13:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c8IhQu25IIOleyzMudYdCvmAzRnzGPqTX9tyIj4/NCw=;
        b=K+Q/uuxGLGnNB5lQa/AR/RghwTXFM2IqWwyYq+C/w7QfEtTgvYJq0AZiGXJaye1YYm
         1XvdRj2Ox8AYRDxBLH94091MKHTVMZ2xriVArW/2ytfSjOeXujb2R22C8INjjkhZW2pf
         Mg8hwf5lqQ20A1C8eE9wuyOPAiwHYLOOm1QYjC8ZZX+uKC19LudQDHHMk2ULofRk23HV
         YqSCI2030htNiCNrJ/17xKMSSuZBCquw3RD+EEkqxGVq0MElSl5+xZZ+1JsDmKPzgB4H
         4oH+VMqZjHKl8TOyNM3ybeYSyGIGJnxRtn1apV3vGe2lsWG+byUJgNtB9uhd4l7mXI0g
         xGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c8IhQu25IIOleyzMudYdCvmAzRnzGPqTX9tyIj4/NCw=;
        b=Fe1a7PmPBCB3hl6yNnAmRpr3KhGTpXBvXwenl8dPIv2zhy1QNPso3UcfILE89CQEoM
         Tw2e9xs12j5ZdRbqnznoG3rLh9dFa5cP11oQEaP+C8SExxQ3KdOgRqpr1A6fVrN1/e0K
         +TdtJiOvZbGj5Xy2tN4IrZHq0+YgLnO6al+vrEX1byRTLCiqRJZv+K5LK7jeiU4X5Zsg
         x+2j+Zh3ziTUo1UeX32Aw3TZsXW8u9izJVrpNOH2RAcBubhywPqIo6tj+OvU5pZzbJ8H
         umvAov0XJTRoTlYez4QLgwG6yJV0MQQgAEqv9NIhuVivL7J6+7cFbdk6wZiM6sxAqVyd
         igpA==
X-Gm-Message-State: AOAM533ffjHdDEk7S8OepX7To9/PDAj4kIOnG3nzihfUknGULpScfrnA
	bL4+Tw5+/i1AHWZNs/jtxINJX3q6jOMGIQ==
X-Google-Smtp-Source: ABdhPJxpJIBdFnJBBPTjmJNy5NFvcQZrTYYUF6b0avN99Cv6t0BY5HI2OOEYxkQ14gV1TwicRmLv6Q==
X-Received: by 2002:ac2:58d4:: with SMTP id u20mr11537112lfo.157.1629405488797;
        Thu, 19 Aug 2021 13:38:08 -0700 (PDT)
Return-Path: <dmitry.baryshkov@linaro.org>
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h21sm346611lji.66.2021.08.19.13.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 13:38:08 -0700 (PDT)
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [hardknott][PATCH] linux-firmware: add more Qualcomm firmware packages
Date: Thu, 19 Aug 2021 23:38:05 +0300
Message-Id: <20210819203805.1206477-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add firmware packages for the recent Qualcomm SoCs:

 - linux-firmware-qcom-adreno-a650, linux-firmware-qcom-adreno-a660,
   containing firmware for Adreno A630 and A650 GPUs

 - linux-firmware-qcom-sm8250-audio, linux-firmware-sm8250-compute,
   containing firmware for audio and comute DSPs on SM8250 (QRB5165)

 - linux-firmware-qcom-vpu-1.0, linux-firmware-qcom-vpu-2.0 containing
   firmware for newer Venus video encoder/decoder

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 31057a9d41a452bdb9e94b4160220f675332ef70)
---
 .../linux-firmware/linux-firmware_20210511.bb   | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20210511.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20210511.bb
index 26091fba7076..513932984e2a 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20210511.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20210511.bb
@@ -303,8 +303,11 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-qat ${PN}-qat-license \
              ${PN}-qcom-license \
              ${PN}-qcom-venus-1.8 ${PN}-qcom-venus-4.2 ${PN}-qcom-venus-5.2 ${PN}-qcom-venus-5.4 \
-             ${PN}-qcom-adreno-a3xx ${PN}-qcom-adreno-a530 ${PN}-qcom-adreno-a630 \
+             ${PN}-qcom-vpu-1.0 ${PN}-qcom-vpu-2.0 \
+             ${PN}-qcom-adreno-a3xx ${PN}-qcom-adreno-a530 \
+             ${PN}-qcom-adreno-a630 ${PN}-qcom-adreno-a650 ${PN}-qcom-adreno-a660 \
              ${PN}-qcom-sdm845-audio ${PN}-qcom-sdm845-compute ${PN}-qcom-sdm845-modem \
+             ${PN}-qcom-sm8250-audio ${PN}-qcom-sm8250-compute \
              ${PN}-amlogic-vdec-license ${PN}-amlogic-vdec \
              ${PN}-lt9611uxc ${PN}-lontium-license \
              ${PN}-whence-license \
@@ -952,22 +955,34 @@ FILES_${PN}-qcom-venus-1.8 = "${nonarch_base_libdir}/firmware/qcom/venus-1.8/*"
 FILES_${PN}-qcom-venus-4.2 = "${nonarch_base_libdir}/firmware/qcom/venus-4.2/*"
 FILES_${PN}-qcom-venus-5.2 = "${nonarch_base_libdir}/firmware/qcom/venus-5.2/*"
 FILES_${PN}-qcom-venus-5.4 = "${nonarch_base_libdir}/firmware/qcom/venus-5.4/*"
+FILES_${PN}-qcom-vpu-1.0 = "${nonarch_base_libdir}/firmware/qcom/vpu-1.0/*"
+FILES_${PN}-qcom-vpu-2.0 = "${nonarch_base_libdir}/firmware/qcom/vpu-2.0/*"
 FILES_${PN}-qcom-adreno-a3xx = "${nonarch_base_libdir}/firmware/qcom/a300_*.fw ${nonarch_base_libdir}/firmware/a300_*.fw"
 FILES_${PN}-qcom-adreno-a530 = "${nonarch_base_libdir}/firmware/qcom/a530*.*"
 FILES_${PN}-qcom-adreno-a630 = "${nonarch_base_libdir}/firmware/qcom/a630*.* ${nonarch_base_libdir}/firmware/qcom/sdm845/a630*.*"
+FILES_${PN}-qcom-adreno-a650 = "${nonarch_base_libdir}/firmware/qcom/a650*.* ${nonarch_base_libdir}/firmware/qcom/sm8250/a650*.*"
+FILES_${PN}-qcom-adreno-a660 = "${nonarch_base_libdir}/firmware/qcom/a660*.*"
 FILES_${PN}-qcom-sdm845-audio = "${nonarch_base_libdir}/firmware/qcom/sdm845/adsp*.*"
 FILES_${PN}-qcom-sdm845-compute = "${nonarch_base_libdir}/firmware/qcom/sdm845/cdsp*.*"
 FILES_${PN}-qcom-sdm845-modem = "${nonarch_base_libdir}/firmware/qcom/sdm845/mba.mbn ${nonarch_base_libdir}/firmware/qcom/sdm845/modem*.* ${nonarch_base_libdir}/firmware/qcom/sdm845/wlanmdsp.mbn"
+FILES_${PN}-qcom-sm8250-audio = "${nonarch_base_libdir}/firmware/qcom/sm8250/adsp*.*"
+FILES_${PN}-qcom-sm8250-compute = "${nonarch_base_libdir}/firmware/qcom/sm8250/cdsp*.*"
 RDEPENDS_${PN}-qcom-venus-1.8 = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-venus-4.2 = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-venus-5.2 = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-venus-5.4 = "${PN}-qcom-license"
+RDEPENDS_${PN}-qcom-vpu-1.0 = "${PN}-qcom-license"
+RDEPENDS_${PN}-qcom-vpu-2.0 = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-adreno-a3xx = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-adreno-a530 = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-adreno-a630 = "${PN}-qcom-license"
+RDEPENDS_${PN}-qcom-adreno-a650 = "${PN}-qcom-license"
+RDEPENDS_${PN}-qcom-adreno-a660 = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-sdm845-audio = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-sdm845-compute = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-sdm845-modem = "${PN}-qcom-license"
+RDEPENDS_${PN}-qcom-sm8250-audio = "${PN}-qcom-license"
+RDEPENDS_${PN}-qcom-sm8250-compute = "${PN}-qcom-license"
 
 FILES_${PN}-liquidio = "${nonarch_base_libdir}/firmware/liquidio"
 
-- 
2.30.2

