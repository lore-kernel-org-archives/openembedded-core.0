Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web12.5909.1589859312552308924
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2020 20:35:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=JJt0zuva;
 spf=pass (domain: linaro.org, ip: 209.85.210.43, mailfrom: anibal.limon@linaro.org)
Received: by mail-ot1-f43.google.com with SMTP id v17so10071179ote.0
        for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2020 20:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+MZVF4kXVZxn/Sq7kyTP7AtQv4yBja17aC/l/hsl+a8=;
        b=JJt0zuvazYUJadJKNc0CB/uy8RFmMnJSMwfctlOV+tA1NWCpl75xoF9R9fdornhayy
         6bvu9+h2vlzV1g4fKYnnNDh45jXPnAn6MwdDXOqUcGsLL9VN6idIoJoF4+v96gHiKhDH
         qGAauBJSB4GMtp1OvFpnttxSdQlfRgC6hmsJRYoA1XeOzo/bAR3HTayPa+YrkB3oFaeL
         Zeqz+oqjWhaTDPtvwfH79k6z38BWDskPOfRsefUzwrCa7P+BE4IUn0XbfsAvHkXcAQzj
         j0h/Vxax2YFBGhdjnvZoBmpT88Ykw25kXltXo6Ld3O5IWikUomavD1xdmaUdJcQHATAz
         Kwhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+MZVF4kXVZxn/Sq7kyTP7AtQv4yBja17aC/l/hsl+a8=;
        b=UOLic8jLD2dLDfxLZ3KrI1noET/hcYsA2gTyaiLNFMeMtsNDJ+bQdQUcoCpuMJEU+P
         nvG58Y12OG0Cdr6tOXrfslbmHkpA5yOrQmEhe/Jp2o3BnTdwy+FxfqbV5XthnfK8I71l
         6q0dBCGr0cuL326JlhaxDauGx4DChtdK31KKukQsH1Mwg+3BMlYwmqRxi8tUzebOtxr/
         lLQtQaeZbZyn0o5rTdIq7LWeTpuvpZ6xuWmlcy27TTaYa9cSPopRj4oW/vtYQd9FBgYt
         YsL1uX0/iFrr0NkjDnvLGNjWIr3IGoTaTztabspgJlva5jbsIGDedcVbnNa7cZAm0/AP
         2q5Q==
X-Gm-Message-State: AOAM533k5qgeaH22fWoryNq0cBvy9jt6k9ZGkeC37QZimi3PKAhmOgii
	IMYoj3frR1yqsbaCuq50OSOmSBKTe5U=
X-Google-Smtp-Source: ABdhPJwByWZxARa9HH39pkqmer1ZbfrLdkJ9adlOdqtMx64cDmwndcIvUJZhM/NPpSbXTXp5Zjpvpg==
X-Received: by 2002:a05:6830:148c:: with SMTP id s12mr14825914otq.39.1589859311650;
        Mon, 18 May 2020 20:35:11 -0700 (PDT)
Return-Path: <anibal.limon@linaro.org>
Received: from blackbox.rga.ip ([2806:109f:4:9c4c:908a:c7ff:fe6a:e9f5])
        by smtp.gmail.com with ESMTPSA id 33sm3481866otx.31.2020.05.18.20.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 20:35:10 -0700 (PDT)
From: "Anibal Limon" <anibal.limon@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	nicolas.dechesne@linaro.org,
	=?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
Subject: [PATCH 2/3] recipes-kernel/linux-firmware: Add adreno-a630 firmware package
Date: Mon, 18 May 2020 22:35:04 -0500
Message-Id: <20200519033505.357681-2-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519033505.357681-1-anibal.limon@linaro.org>
References: <20200519033505.357681-1-anibal.limon@linaro.org>
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

