Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com [209.85.210.65])
 by mx.groups.io with SMTP id smtpd.web10.1251.1585620079232036079
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2020 19:01:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=zpTSh47g;
 spf=pass (domain: linaro.org, ip: 209.85.210.65, mailfrom: anibal.limon@linaro.org)
Received: by mail-ot1-f65.google.com with SMTP id x11so20444530otp.6
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2020 19:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r6Bfl8cx8zLfnnzIg0O0dkwoC+ZPxNHHxYIJi89DiVE=;
        b=zpTSh47gchFbremePN8FmBrnphOv8eX+BoorjrwaX4OHLdn2P0942tMEH+jHCn9Lnc
         hCrfd+VqW3lnksd2Kd0Y7kOjD1mwKp0zDqiV0RiAhgAtzcwSiqZJwPrxumBmf+15s6TJ
         vqrvmhfmidrFkHHN5WxIKSnOyqm3dUK8RW2R4yN8Y/SgmVyb6d2u3BD0QB5g+8847veg
         1s01tE8gdyjIwei6ValdhF2rtXY8vVYCvoM1E+GEcgyVlmrUFdtIh5JeBPrAz3TsKpmv
         IOXg8IArr68r2TeVX2hT9kNJ4nXSYpa8EshTzGPcBLsFQpK7O5y1XbQq8dTEq/QOl2+4
         b4EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r6Bfl8cx8zLfnnzIg0O0dkwoC+ZPxNHHxYIJi89DiVE=;
        b=cI8ycRDPlsvlXxIk5RrWzzn/Ak7hD3kLC9h+SDo6EEvhWtPN0IPxHKzMcpskaeEtVw
         q0ZVdHVuw1Z3CPPR5D1TO66b6OfFgPgQEtitSBOuguQcNxLEj2MTigFh9JnF9yx4CWkA
         2wvuG7psBkuLmm/MWM1YyOIB0g0XJJA78KHBxYbkm329E4pGNT86eoMtWntaJQHv1LX9
         mJc8t5EqdgjAQFznMYLMZ8t9urrrCGPhB0NR/9k8EbpKbN2IXshYWOFLHRhVl/pLO+Pz
         8Nb7AYCzQbWYHZN1s/azTB7e3MK39xxPCREnTRWZdQWZCOFz+SkG0tStlDqBC71g5Rn9
         ZvSA==
X-Gm-Message-State: ANhLgQ1rxWL/ny5x1ux5z7QBxHj0o1DFF1iN3jtKaA/SRN/fPas3y/ez
	U2Bs8b4zmOElh9jijHPG8GPqI+b25a4=
X-Google-Smtp-Source: ADFU+vvtLbISe6+yRapcZQ4S+9/ggioYPBMiltjrL8TXRnUflF4lO9RS2/4MryPFf9KbXDhVf2HYfA==
X-Received: by 2002:a05:6830:2314:: with SMTP id u20mr11505348ote.166.1585620078254;
        Mon, 30 Mar 2020 19:01:18 -0700 (PDT)
Return-Path: <anibal.limon@linaro.org>
Received: from blackbox.rga.ip ([2806:109f:4:66a1:908a:c7ff:fe6a:e9f5])
        by smtp.gmail.com with ESMTPSA id y207sm4767497oia.6.2020.03.30.19.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 19:01:17 -0700 (PDT)
From: "Anibal Limon" <anibal.limon@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: nicolas.dechesne@linaro.org,
	richard.purdie@linuxfoundation.org,
	=?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
Subject: [PATCH] recipes-kernel/linux-firmware: Add qcom-sdm845 firmware package
Date: Mon, 30 Mar 2020 20:01:13 -0600
Message-Id: <20200331020114.25468-1-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Contains the firmware for the modem and wireless in SDM845 platforms.

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
index a7406e48de..3e03aafb6b 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
@@ -289,6 +289,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-qcom-license \
              ${PN}-qcom-venus-1.8 ${PN}-qcom-venus-4.2 \
              ${PN}-qcom-adreno-a3xx ${PN}-qcom-adreno-a530 \
+             ${PN}-qcom-sdm845 \
              ${PN}-whence-license \
              ${PN}-license \
              "
@@ -848,10 +849,12 @@ FILES_${PN}-qcom-venus-1.8 = "${nonarch_base_libdir}/firmware/qcom/venus-1.8/*"
 FILES_${PN}-qcom-venus-4.2 = "${nonarch_base_libdir}/firmware/qcom/venus-4.2/*"
 FILES_${PN}-qcom-adreno-a3xx = "${nonarch_base_libdir}/firmware/qcom/a300_*.fw ${nonarch_base_libdir}/firmware/a300_*.fw"
 FILES_${PN}-qcom-adreno-a530 = "${nonarch_base_libdir}/firmware/qcom/a530*.*"
+FILES_${PN}-qcom-sdm845 = "${nonarch_base_libdir}/firmware/qcom/sdm845/*"
 RDEPENDS_${PN}-qcom-venus-1.8 = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-venus-4.2 = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-adreno-a3xx = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-adreno-a530 = "${PN}-qcom-license"
+RDEPENDS_${PN}-qcom-sdm845 = "${PN}-qcom-license"
 
 FILES_${PN}-liquidio = "${nonarch_base_libdir}/firmware/liquidio"
 
-- 
2.26.0

