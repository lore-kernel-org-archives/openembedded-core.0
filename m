Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web10.5783.1589859310633758500
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2020 20:35:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=jnMPbkM9;
 spf=pass (domain: linaro.org, ip: 209.85.210.53, mailfrom: anibal.limon@linaro.org)
Received: by mail-ot1-f53.google.com with SMTP id z3so8366681otp.9
        for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2020 20:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+AeHRdr+p0ZGt1PrxqY9NC9jhYiYx1X+35z24j2ws1s=;
        b=jnMPbkM9UWXnmnYODB1TRbzJtMO7wyu4ibnGAA5Fgn24mGVRg38avYuehrzlZpBfbn
         TBZ5585nYU0iqO3gW6FWcJxVxOtctIIPqWSFlnVkxwZ2smYznJXBnvYLa623UUYd8Aqc
         IZI1tTvUqqPqipXNdhoTBUQlzQaLEnj2LnzeP0FFf/0dIiY12dYIxv8e8ZBqviiPMW1i
         XnSSNrfLMwqO/qlOqY+k+AhDOkqUlIBWGI6of0hmm016ke2YGSDSas0B7A73qznAGFTW
         DTeGEsngmavuexK7ekF+iLsX5P3dHqwc/sqfHcMfkEVheC+uHvqrEqJwS33nqTl+dlpz
         UHDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+AeHRdr+p0ZGt1PrxqY9NC9jhYiYx1X+35z24j2ws1s=;
        b=Ct+HQdjbzNQEmI7aMPiSGZKkxXKqWxmaR2rHpKSLrJvHQ9PNYYB42c7aYhnrVGATnT
         sBZvEJKcbq/PezLgkvv48N8j8RV+MVfQ9FrBYhzm8FOSiuxidqT73/TL6IY9HvMPqrmP
         dW1olS/KIdBzZnAL/uv8nJWPd4GNREI8n7wt2si42diX4n95+j2rRX2ABYun3Y2Jc8l8
         cGEG9U2788iZchhQT57dQpmhU8gSkBrA3IEJmUofr/3rDbfyUGXN93hv5X0H33DINaYw
         I1pHcJURE8WQdyrnBGOcuAOXSo4O131NLWazQvoqTEfyVcI0IgYRw1g5IF5r40iR41f/
         klWw==
X-Gm-Message-State: AOAM533jywvw/1v+XMdEHPQ6jNBKWbAOeJXal15Lcv4TBe99EkOEUaNt
	kDg+oqflJuQXlB7dGCI6TpsHW7ugGAs=
X-Google-Smtp-Source: ABdhPJxQ0pO7yPUp2sQXLECv3b+Mxt0+nO6LP5cUQMVGpxtuiYSzO3LSkF1wRh/91/SOZcffdB7jEw==
X-Received: by 2002:a9d:a4c:: with SMTP id 70mr15465738otg.334.1589859309694;
        Mon, 18 May 2020 20:35:09 -0700 (PDT)
Return-Path: <anibal.limon@linaro.org>
Received: from blackbox.rga.ip ([2806:109f:4:9c4c:908a:c7ff:fe6a:e9f5])
        by smtp.gmail.com with ESMTPSA id 33sm3481866otx.31.2020.05.18.20.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 20:35:08 -0700 (PDT)
From: "Anibal Limon" <anibal.limon@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	nicolas.dechesne@linaro.org,
	=?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
Subject: [PATCH 1/3] recipes-kernel/linux-firmware: Add wlanmdsp.mbn to qcom-modem package
Date: Mon, 18 May 2020 22:35:03 -0500
Message-Id: <20200519033505.357681-1-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
index 7173409e05..139307cda3 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
@@ -851,7 +851,7 @@ FILES_${PN}-qcom-adreno-a3xx = "${nonarch_base_libdir}/firmware/qcom/a300_*.fw $
 FILES_${PN}-qcom-adreno-a530 = "${nonarch_base_libdir}/firmware/qcom/a530*.*"
 FILES_${PN}-qcom-sdm845-audio = "${nonarch_base_libdir}/firmware/qcom/sdm845/adsp*.*"
 FILES_${PN}-qcom-sdm845-compute = "${nonarch_base_libdir}/firmware/qcom/sdm845/cdsp*.*"
-FILES_${PN}-qcom-sdm845-modem = "${nonarch_base_libdir}/firmware/qcom/sdm845/mba.mbn ${nonarch_base_libdir}/firmware/qcom/sdm845/modem*.*"
+FILES_${PN}-qcom-sdm845-modem = "${nonarch_base_libdir}/firmware/qcom/sdm845/mba.mbn ${nonarch_base_libdir}/firmware/qcom/sdm845/modem*.* ${nonarch_base_libdir}/firmware/qcom/sdm845/wlanmdsp.mbn"
 RDEPENDS_${PN}-qcom-venus-1.8 = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-venus-4.2 = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-adreno-a3xx = "${PN}-qcom-license"
-- 
2.26.2

