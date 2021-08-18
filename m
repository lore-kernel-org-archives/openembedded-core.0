Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.55802.1629298342578434333
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Aug 2021 07:52:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=FpCUgTb2;
 spf=pass (domain: linaro.org, ip: 209.85.167.42, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f42.google.com with SMTP id x27so5233219lfu.5
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Aug 2021 07:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z8CnjIQ6zvydxgpfgMjDr27g3hDuarhJA1LPLH15mCY=;
        b=FpCUgTb2oP+knb44BEup5FV57QWVInq/X071U3bXp/fiZXGT9lEHL+k0fKd1Hgvtn6
         NzH4FIm9P+jXtKcCkPCKQLs1TesEWvoFEPp5d49L83Oz81N7ic3ePfUv7J1xEiQMMS/W
         5DJm88Qs/V7NGaP8FJCRV/N72ZMHTbRlAm/YiwxW4xm/Z4AVjkLC1qMWtreGxzTfP7VP
         EMgk4bP1nPLVpSYCvaUPod0K+qghX7ByXjac5waISWHSHxUKnnWiogLL7xiSo3o8J9ib
         TIl1RFwoFDys8P3rmfVWJCpu0nci7Uquzew2iR1MFgXsyahgqPEEimYQdJQRT95CeYlB
         8TKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z8CnjIQ6zvydxgpfgMjDr27g3hDuarhJA1LPLH15mCY=;
        b=b46wj4suFTHG3ZPLmJIwWbGOox8xO5m4caWf0lTZlGRnJsU/tIoQ/5PWyJNnv4s+Xy
         8r9gwQppdwZDeITLx0V65rHzeF4RNIlbE6LdHT29sdwvLJUlZzAxtWHoQ2Ebb1cr/tDH
         dGUeYKCkWhF+87DuDOSHJpV6tIvDwPIITv244Heut7in+oCQqyh4r6RkiDuPtdFZUN/Y
         XkRh3UZxELFITJvCmJXeD5OvnZwYDpmFZ/T7uQLuHjn0cAD3MILXY8iD3tfPjJImgBQ8
         MOBXfFlWEv3tWqB6/RQxfv4N/kQDGI8NV8fo2yhrrrN6Tt/8cAwcWOl/g/ZBi3bM4U5Y
         GXiw==
X-Gm-Message-State: AOAM532d/T5pAer+3qGcZObiXu0ain1+w//FaQOr1uvY75AaCB6EnpjZ
	Pf8SM96mBuFPcJORRaeb+4J5tzj875sAyg==
X-Google-Smtp-Source: ABdhPJyHpCTBUqjzy1iDgOdTvIW3tFlROtC7VhQ97Rsn4fiKIu2JPTwtHGpRoEPuRnXRwoT8H3s1Dw==
X-Received: by 2002:ac2:4469:: with SMTP id y9mr6760555lfl.158.1629298340693;
        Wed, 18 Aug 2021 07:52:20 -0700 (PDT)
Return-Path: <dmitry.baryshkov@linaro.org>
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c28sm513701lfm.189.2021.08.18.07.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 07:52:20 -0700 (PDT)
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH] linux-firmware: add more Qualcomm firmware packages
Date: Wed, 18 Aug 2021 17:52:18 +0300
Message-Id: <20210818145218.3298129-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

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

