Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com [209.85.210.68])
 by mx.groups.io with SMTP id smtpd.web11.17495.1599078050529735140
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2020 13:20:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=LWmXXpYg;
 spf=pass (domain: linaro.org, ip: 209.85.210.68, mailfrom: anibal.limon@linaro.org)
Received: by mail-ot1-f68.google.com with SMTP id k20so481457otr.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2020 13:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P2XDIk8NhSGdEPSA5TpbOPDI17tED40p+LEmYin5eq0=;
        b=LWmXXpYg4cxWqKqbtFfatjEU670fYjRxnQ6VdsupN05yEc4ug72b1I3dpGBxWp2uY9
         +yHJBF7zVixuuuM201sOWS+/bMjl1EMTXi9CMtl90BNm+Eoyl9xaOF1IFX725c1EM/P4
         BtybhED8JqCaVgkq36O0w9CAKLR/k5kUWm2fnI6kBdmBBQD2Off97d+7DoH4iXE+EAsP
         Ar8DzR2hmk1P4ekaKTyVlxO7Vqw6QTYZOc4Bh9D2hoSlL0vR0XgOMrpUymdnIrxj8Z+J
         l61IqVjdBDDtCtP89ZHK7bzxWnwefgDNTfOLhvNFZ5dYmCHxs13HfseRjsYLSx8gy8KN
         JPNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P2XDIk8NhSGdEPSA5TpbOPDI17tED40p+LEmYin5eq0=;
        b=ATaeWLZGPUYj9zlKww0iZkqMSj1WofNgGD++5CrJDsgrAXglr2Tz+9bXaoIir4Z+Ce
         nyGZAGM/Mn2xQxL04cTZz97JI+mFnBcn18HdIgI+aDwHPC8UNgfAE9aK0Sv6pqdOkiZv
         o8oAB+ep32v7A34uW9VpZae2tDD4838XMEs3IC6TxIXRntWLod1J2VdLMUcJ43LrplKU
         TAhBsttgXjdxxGqvkJB7ILg+plVdfu/BIi21RNbHxaiS+Na5bukup/4H3tBl/0zJV9xX
         +WrMxGeUnp829NG7xNcOTVSPNi1bFL1fSvUm5wEX7jEclpnqF6QzapOFNmxFgp3nASxR
         U15g==
X-Gm-Message-State: AOAM533gDOIG25dhNdKrwDmOl9PX5SGwaeCAKwJQcyk8Hy3VPiHppKxK
	Awx//UFAAn9rZRKyWNPAi/GTv3SGM4MJAQ==
X-Google-Smtp-Source: ABdhPJwQes4PuDpe44bwGuiRqblsl1RVwyRNIJtzjCis8D/EHfRKflgzLMybdU6bcL0xw0CC1/7aTQ==
X-Received: by 2002:a9d:7a96:: with SMTP id l22mr37988otn.220.1599078049523;
        Wed, 02 Sep 2020 13:20:49 -0700 (PDT)
Return-Path: <anibal.limon@linaro.org>
Received: from blackbox.rga.ip ([2806:109f:4:c88e:908a:c7ff:fe6a:e9f5])
        by smtp.gmail.com with ESMTPSA id f194sm74893oib.44.2020.09.02.13.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 13:20:48 -0700 (PDT)
From: "Anibal Limon" <anibal.limon@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	nicolas.dechesne@linaro.org,
	Anibal Limon <anibal.limon@linaro.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH] recipes-kernel: linux-firmware add qcom-venus-{5.2,5.4} packages
Date: Wed,  2 Sep 2020 15:20:45 -0500
Message-Id: <20200902202045.256129-1-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Anibal Limon <anibal.limon@linaro.org>

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e20c1e07a807f66f028104d8491d974a36734192)
Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
---
 .../linux-firmware/linux-firmware_20200817.bb               | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20200817.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20200817.bb
index 22e71059d8..ffeb8e6926 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200817.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200817.bb
@@ -291,7 +291,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-netronome-license ${PN}-netronome \
              ${PN}-qat ${PN}-qat-license \
              ${PN}-qcom-license \
-             ${PN}-qcom-venus-1.8 ${PN}-qcom-venus-4.2 \
+             ${PN}-qcom-venus-1.8 ${PN}-qcom-venus-4.2 ${PN}-qcom-venus-5.2 ${PN}-qcom-venus-5.4 \
              ${PN}-qcom-adreno-a3xx ${PN}-qcom-adreno-a530 ${PN}-qcom-adreno-a630 \
              ${PN}-qcom-sdm845-audio ${PN}-qcom-sdm845-compute ${PN}-qcom-sdm845-modem \
              ${PN}-whence-license \
@@ -860,6 +860,8 @@ LICENSE_${PN}-qcom-license = "Firmware-qcom"
 FILES_${PN}-qcom-license   = "${nonarch_base_libdir}/firmware/LICENSE.qcom ${nonarch_base_libdir}/firmware/qcom/NOTICE.txt"
 FILES_${PN}-qcom-venus-1.8 = "${nonarch_base_libdir}/firmware/qcom/venus-1.8/*"
 FILES_${PN}-qcom-venus-4.2 = "${nonarch_base_libdir}/firmware/qcom/venus-4.2/*"
+FILES_${PN}-qcom-venus-5.2 = "${nonarch_base_libdir}/firmware/qcom/venus-5.2/*"
+FILES_${PN}-qcom-venus-5.4 = "${nonarch_base_libdir}/firmware/qcom/venus-5.4/*"
 FILES_${PN}-qcom-adreno-a3xx = "${nonarch_base_libdir}/firmware/qcom/a300_*.fw ${nonarch_base_libdir}/firmware/a300_*.fw"
 FILES_${PN}-qcom-adreno-a530 = "${nonarch_base_libdir}/firmware/qcom/a530*.*"
 FILES_${PN}-qcom-adreno-a630 = "${nonarch_base_libdir}/firmware/qcom/a630*.* ${nonarch_base_libdir}/firmware/qcom/sdm845/a630*.*"
@@ -868,6 +870,8 @@ FILES_${PN}-qcom-sdm845-compute = "${nonarch_base_libdir}/firmware/qcom/sdm845/c
 FILES_${PN}-qcom-sdm845-modem = "${nonarch_base_libdir}/firmware/qcom/sdm845/mba.mbn ${nonarch_base_libdir}/firmware/qcom/sdm845/modem*.* ${nonarch_base_libdir}/firmware/qcom/sdm845/wlanmdsp.mbn"
 RDEPENDS_${PN}-qcom-venus-1.8 = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-venus-4.2 = "${PN}-qcom-license"
+RDEPENDS_${PN}-qcom-venus-5.2 = "${PN}-qcom-license"
+RDEPENDS_${PN}-qcom-venus-5.4 = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-adreno-a3xx = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-adreno-a530 = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-adreno-a630 = "${PN}-qcom-license"
-- 
2.28.0

