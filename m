Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com [209.85.167.196])
 by mx.groups.io with SMTP id smtpd.web10.14339.1589986747520125328
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2020 07:59:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Ja2d7Hzb;
 spf=pass (domain: linaro.org, ip: 209.85.167.196, mailfrom: anibal.limon@linaro.org)
Received: by mail-oi1-f196.google.com with SMTP id r25so3191999oij.4
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2020 07:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+MZVF4kXVZxn/Sq7kyTP7AtQv4yBja17aC/l/hsl+a8=;
        b=Ja2d7HzbxhEAbiYHA2SWagO0lK0h/kvq3KCGiFlOr9oNYy7iudKJdHs4bLdpSRGqBB
         /jT/uEMSnKARWzh04uhFjzahr3rhBqK+y26KRgWpV2hXSxOXg9hjfqySryGuqUzFmVh0
         PYBD+gqi5hbudje5CvMQDKpY2LipTm4A+304stegV6N0fn0Fn7J6sEyy6pE3qRev44Ee
         ggxZNH9ySG9G2UYBjeVI0pMlEhVklpFOch4FB4wS/UFztw7G6Yh9rCT9G6Bn6gEylS0s
         mo77pLmitSqI3luxOpx2JXkhGmQRF2gC+fDHdDhFNd6sL9GlZAMkY9UaDpV3PV5aEfSz
         +DcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+MZVF4kXVZxn/Sq7kyTP7AtQv4yBja17aC/l/hsl+a8=;
        b=FHA90FaErtVqLG0dn4Px5txphTzp3jTVA3a7EA9z/i0psQvjE1dVRJFCjEqqgoV04J
         ePfx879SE/TPWrPax+uDjruB5U2X1cTGNbcW2GkgYPq2Z4jASuB4p4XTuJcm3o5ccfZ9
         Ibsiasyequo/JLWCBGymnFibh8Xb8E77B/1yklQfunqQmiSbAZuSe/53gxGv3S/3BFnR
         qEqP2GeIgWiiiz+mVfba5MuHenCO3bFqy5fp8T15XKbsEWE/filjqgP9DJgq5SLfeI+n
         gbTw0Wsr4NQR2YAs01ihr43bbKKJoevfEDvseueX6lE+60gy38B132Vpo9rE4zz93xWb
         hnBQ==
X-Gm-Message-State: AOAM532s0hsl7aI6ZWAA5nI4G77aqrMx8qbYREZTjwyskOIhoMeEtBel
	Br7fyIXSB7YYTP+iP3DCpQVl9OY40mg=
X-Google-Smtp-Source: ABdhPJxX89GwMqp/mbhWBpWmIJQ+StdvSsFkOZ+XB2YyDflA8cRpRq7lXTipJXgTVivUqSR4DBP90w==
X-Received: by 2002:aca:4904:: with SMTP id w4mr3299103oia.67.1589986744496;
        Wed, 20 May 2020 07:59:04 -0700 (PDT)
Return-Path: <anibal.limon@linaro.org>
Received: from blackbox.rga.ip ([200.68.141.41])
        by smtp.gmail.com with ESMTPSA id s198sm828174oos.18.2020.05.20.07.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 07:59:03 -0700 (PDT)
From: "Anibal Limon" <anibal.limon@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	nicolas.dechesne@linaro.org,
	=?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
Subject: [PATCH][dunfell 2/3] recipes-kernel/linux-firmware: Add adreno-a630 firmware package
Date: Wed, 20 May 2020 09:58:57 -0500
Message-Id: <20200520145859.622161-2-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200520145859.622161-1-anibal.limon@linaro.org>
References: <20200520145859.622161-1-anibal.limon@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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

