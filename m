Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com [209.85.167.195])
 by mx.groups.io with SMTP id smtpd.web12.60437.1598899747293245082
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2020 11:49:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=tzHic54R;
 spf=pass (domain: linaro.org, ip: 209.85.167.195, mailfrom: anibal.limon@linaro.org)
Received: by mail-oi1-f195.google.com with SMTP id d189so1846632oig.12
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2020 11:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zc3XMpAwW14GPO8TcU8M5AO5NZ/6iF3xlmrR86qxUCQ=;
        b=tzHic54RZrzFY87/nkq5UP3x8pD1682oM4OT8zN48Q4hRu+Y5NoYuOBhwyeOOwcNZn
         F3QGwQ+mmhH275NZrTYe5ZHGy32RgWrevyoK2T2ZqGRvPJC74mgYAulF2Y9dzEkBxYEz
         CWiRMNm3h5eMQESuIu/QIfsoZ/vakhXhOTdiCsXu0wMuvKA69Z5LIkUMU0GpTE/20Bge
         GxCnA5Aw+OdIAMecoVGRU3UB6mmXRk5+twKTD/2j/t5TG9Wv+/TMSTW2w79ln10kzvL4
         f16L59cP817CLW20J3Z0PaztmNSDY0KWC75r5fMAQhgkiMzDT4uSYOXnCKFxcsl9R/25
         Ceng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zc3XMpAwW14GPO8TcU8M5AO5NZ/6iF3xlmrR86qxUCQ=;
        b=ixEAzchMhChpjhZXmW5wCNaw744Ql/A69ibpuM6AfXohsheHydtmHBUNDHFoLE6vt6
         n0MlJZAHp/2PgsRRR3pzmkmK0viFohvBlZW4aIt2lOBvvcQ6N1iLs9DCkNvwYkYOsn2h
         NoLmh/y2nSI0eF4m6i9v9Gw1mGyxSFjy7XnwoPwCu+LCSFzdjMSSLqNe6Nqh/b7naGQC
         4u6tWbfOkB2KsfAR4MKFhEFJd8413Q/elrSm2Aow2u2s/7kSOz2d1peANsE+EZeZcfSz
         jlwbnKfnSdqwIsYjGABwfI/hrWpfnAO+4jT8grKFCLdypYRJ/evAMUH/ruHyKuHzOk7Q
         hgFA==
X-Gm-Message-State: AOAM531FlqVlUOzgf/glFSFr1HSAg/hu0KNwPP4raAhdWBzUW3CJFQkO
	Hc9Z/uOAsiWO/C7EHot9Kv6OVYGQntX+Pg==
X-Google-Smtp-Source: ABdhPJy/Ick6B5EC34H31/5r+DjiKbRRRZkXESGWaLae09BJ/PQ72kXRSwWKhU9tRYXDVEEGmLaHng==
X-Received: by 2002:aca:1016:: with SMTP id 22mr430750oiq.63.1598899746203;
        Mon, 31 Aug 2020 11:49:06 -0700 (PDT)
Return-Path: <anibal.limon@linaro.org>
Received: from blackbox.rga.ip ([2806:109f:4:c88e:908a:c7ff:fe6a:e9f5])
        by smtp.gmail.com with ESMTPSA id r33sm800109ooi.48.2020.08.31.11.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 11:49:05 -0700 (PDT)
From: "Anibal Limon" <anibal.limon@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: nicolas.dechesne@linaro.org,
	alex.kanavin@gmail.com,
	=?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
Subject: [PATCH] recipes-kernel: linux-firmware add qcom-venus-{5.2,5.4} packages
Date: Mon, 31 Aug 2020 13:49:02 -0500
Message-Id: <20200831184903.118295-1-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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

