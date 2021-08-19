Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web12.74644.1629400166454112312
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Aug 2021 12:09:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=jU/f67e7;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.45, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f45.google.com with SMTP id r17-20020a0568302371b0290504f3f418fbso9939034oth.12
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Aug 2021 12:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=NTdFc8aFyO4nZv6i1+TMhvHXrj1rMbjG+Xu7UtZyQK8=;
        b=jU/f67e7gv245bYbzTeoNpGTBuglytJF/MSrXNhfiIHU4VFF91XZtjCp3zqp8TRXxU
         ABJ3nr4GYyLmdczdgE4KD1OqI1e95sSxcKyxFBGK+pdDWesqyWvyKAjPyC4QhXiZ9qLl
         kCmAOun0+A34E/zXQgY7MCuzlfZGPIEvC0gRMguNIe7uXhpunRYmYSky0pwxyTVL2MUu
         IOUcavF6GKEL8Doj9J0ahv1SF0i4p/h7gslRVgSVtVKwW07H2rc7CJF8coB8ilYtZMEp
         kGONWN5wlMycDt0Fpi8JCnGPKM+RTMiOGm4ltcKRNnxh1fA2Lsg0U+eAO9seje4l3abR
         SxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NTdFc8aFyO4nZv6i1+TMhvHXrj1rMbjG+Xu7UtZyQK8=;
        b=IyZDeA7cgeelWl0OBjzfWKYNr2WdTYpSOnNvzurQfzRCvlu0oPADeEWTrwcIJnaw7e
         ne8nqqn0/y/4rC1qTleg1cekK3J0wUuIBNwc6H7fRsZRJsXQLJJqCVTBAphhtel3OirR
         glJ5dOO13MLri8L0I6QWOhmUykWLIYqNp3R9T2FhQZCoSfFsW0yY7m9X57lXxXAn+WD1
         ygHajC1Zj6hvfpxOt9VFQtlRU/Ajvi0/4LYYMZ4sWZSdJozSFsql2q37hnQ8W2EUSLUe
         WxvqYYpnAf8dgt8EwbRB+bxiAMWFhehO9IhiV02VrZuVfmFRtguqVz5MsOGm9JIb/oux
         i7tg==
X-Gm-Message-State: AOAM531keDTqW4GwMstwJEZx04Dk2dZaSzPIFWaBOndrCfbFTuRpWq5T
	zFS1Rtt+S9VEfN2wb4y0hKPf+BGAM8ihAklC
X-Google-Smtp-Source: ABdhPJwDCtVMCLRBXPb2K0CaNfa0pHsBUlfLH/HZSH31MJweB9lzrpcmvXD+R/cxHLCFH/3FQhOfJg==
X-Received: by 2002:a9d:5603:: with SMTP id e3mr13174824oti.178.1629400165419;
        Thu, 19 Aug 2021 12:09:25 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id s10sm765080oog.14.2021.08.19.12.09.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 12:09:24 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/12] linux-firmware: add more Qualcomm firmware packages
Date: Thu, 19 Aug 2021 09:08:01 -1000
Message-Id: <bfce637144302fa7dd7f31a63a736b05eb62203b.1629399953.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1629399953.git.steve@sakoman.com>
References: <cover.1629399953.git.steve@sakoman.com>
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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux-firmware/linux-firmware_20210511.bb   | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20210511.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20210511.bb
index 26091fba70..513932984e 100644
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
2.25.1

