Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com [209.85.210.65])
 by mx.groups.io with SMTP id smtpd.web11.3149.1589998854488773795
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2020 11:20:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Xu/RJ8wu;
 spf=pass (domain: linaro.org, ip: 209.85.210.65, mailfrom: anibal.limon@linaro.org)
Received: by mail-ot1-f65.google.com with SMTP id v17so3344566ote.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2020 11:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3Cps8cxW/hSpCv/Qhl+LlP5piwErEtgwNCQthI2qnV0=;
        b=Xu/RJ8wu7LDWTkf041ZOZqjABDJH2/lfW1l2gk7w07znraFp6bju5EEOOjktDS4fxi
         x/5o9xDol7FPKRFRej8ip3RxG8S8hbvddlLgeXyhHh6H+0QYwif8aI5Ruh+r6Bnl31JK
         GusEEgUiWsNKUan8fWb3WxWOQrDRxSsmAKUpWGFVwnRu7mNiCTENpvzQZDJfxTL48f4J
         Xgw5wJIyv7yl6t/CTQsHlEWJLpqIyUIPw/IlN4sWtceUaYnXuMbvN72ZW2wcYX8wXJIn
         ZKXEiOONZ5DMZVYdH7l9q0c80g+RaueMeS1aAmMwDlZPerH6eghbihz6zo2MAp9/g18d
         yeFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3Cps8cxW/hSpCv/Qhl+LlP5piwErEtgwNCQthI2qnV0=;
        b=nY6YRejFpsjdT7gqDlWGOkm9TuFl4lyVCtb2hk7RlMhAtz6HnfYUnJAXNviFrRWLAF
         WaZ4fd28LsVq/UWNZ/rBW80p8huibYn6aiTOLdKXj1YQXgvJQRRbYLBG+YdDPavMJ+fe
         tJaUr6Yty9ckgPjg1IzoYLTl808Dk9hvjDuszdMgo7htcGueZK58SDtoHfdHsXuznuZf
         h5WF7op0QVy8A3mYRJpVcSSrN9MW4y+AedZYO42kV7p6x5djSFwVrwgffpKrbWjDCn6G
         jesC4M1Pv9PHGT5i+NZeC6p52hkKjL6pqXaEsp2fWzChgZcsyS5dSbnS1o4Eo7aEeBQo
         DDcw==
X-Gm-Message-State: AOAM532Be6OF9WoISJcgKm2SY+zUnUiS/1qAZf1jEXhpzJXMLhdLh/Ki
	n0je8yMzp9u/xgKqR5GPyMPrHS1jVLg=
X-Google-Smtp-Source: ABdhPJyV1hutlczDv+i108hZCZOyAwikhltzwHtQNctr5KeXJ84crh4Vgzb0fW2XVKf5HHzcDcpuyg==
X-Received: by 2002:a9d:68d5:: with SMTP id i21mr4525310oto.280.1589998853545;
        Wed, 20 May 2020 11:20:53 -0700 (PDT)
Return-Path: <anibal.limon@linaro.org>
Received: from blackbox.rga.ip ([200.68.141.41])
        by smtp.gmail.com with ESMTPSA id b19sm986589oii.1.2020.05.20.11.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 11:20:52 -0700 (PDT)
From: "Anibal Limon" <anibal.limon@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	nicolas.dechesne@linaro.org,
	=?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCHv2][dunfell 2/3] recipes-kernel/linux-firmware: Add adreno-a630 firmware package
Date: Wed, 20 May 2020 13:20:45 -0500
Message-Id: <20200520182046.2031954-2-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200520182046.2031954-1-anibal.limon@linaro.org>
References: <20200520182046.2031954-1-anibal.limon@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dd5f6de4995fbfad881567137fdefc1a8a3903b4)
Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
index 139307cda3..ac7d6ec431 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
@@ -288,7 +288,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-qat ${PN}-qat-license \
              ${PN}-qcom-license \
              ${PN}-qcom-venus-1.8 ${PN}-qcom-venus-4.2 \
-             ${PN}-qcom-adreno-a3xx ${PN}-qcom-adreno-a530 \
+             ${PN}-qcom-adreno-a3xx ${PN}-qcom-adreno-a530 ${PN}-qcom-adreno-a630 \
              ${PN}-qcom-sdm845-audio ${PN}-qcom-sdm845-compute ${PN}-qcom-sdm845-modem \
              ${PN}-whence-license \
              ${PN}-license \
@@ -849,6 +849,7 @@ FILES_${PN}-qcom-venus-1.8 = "${nonarch_base_libdir}/firmware/qcom/venus-1.8/*"
 FILES_${PN}-qcom-venus-4.2 = "${nonarch_base_libdir}/firmware/qcom/venus-4.2/*"
 FILES_${PN}-qcom-adreno-a3xx = "${nonarch_base_libdir}/firmware/qcom/a300_*.fw ${nonarch_base_libdir}/firmware/a300_*.fw"
 FILES_${PN}-qcom-adreno-a530 = "${nonarch_base_libdir}/firmware/qcom/a530*.*"
+FILES_${PN}-qcom-adreno-a630 = "${nonarch_base_libdir}/firmware/qcom/a630*.* ${nonarch_base_libdir}/firmware/qcom/sdm845/a630*.*"
 FILES_${PN}-qcom-sdm845-audio = "${nonarch_base_libdir}/firmware/qcom/sdm845/adsp*.*"
 FILES_${PN}-qcom-sdm845-compute = "${nonarch_base_libdir}/firmware/qcom/sdm845/cdsp*.*"
 FILES_${PN}-qcom-sdm845-modem = "${nonarch_base_libdir}/firmware/qcom/sdm845/mba.mbn ${nonarch_base_libdir}/firmware/qcom/sdm845/modem*.* ${nonarch_base_libdir}/firmware/qcom/sdm845/wlanmdsp.mbn"
@@ -856,6 +857,7 @@ RDEPENDS_${PN}-qcom-venus-1.8 = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-venus-4.2 = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-adreno-a3xx = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-adreno-a530 = "${PN}-qcom-license"
+RDEPENDS_${PN}-qcom-adreno-a630 = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-sdm845-audio = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-sdm845-compute = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-sdm845-modem = "${PN}-qcom-license"
-- 
2.26.2

