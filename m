Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web09.6320.1604890622564524893
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2020 18:57:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=vXnOi+Aa;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id c20so6687700pfr.8
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2020 18:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=ID9qxOLMXK/2theo1WHT6rirfG1BwK+zk2PGsBoRFTY=;
        b=vXnOi+AanMRgL9gL3i2jfFqvppobKsYgoNVjtmbEjKg0AwoDAFbSopziLRXBcaEFOb
         7KItsONvD3gr26xDtKOp4Mf2Xn7vRkG/CE9Sim6i9vjFtK4Gt03CfZbSsuJdX/NpsaB5
         C9rQc+qBOy/uu6hWuN8IqScTJPZzB+QGBS+4/iCpYzu58ZbXEgJlXe+Q+9jfKanj/qS1
         r+e/vw8x/f568oJlU6NYPJ+xu603vhyA4rLiJ/vaPA3q7l0IIMap7L0SqiLizDu6/JLC
         LV7y8zOx3sfW78DF4OGhLc7kVwcn/RB4uezX3JxaCFZ1sDiJHk1J0W1FtsHqT4KDfcCi
         Zeyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=ID9qxOLMXK/2theo1WHT6rirfG1BwK+zk2PGsBoRFTY=;
        b=JLmfXWNUXbZw44PqG23uOxrBycbkdnMBSAHzJCDYNgy96vPs6lCfj5/2G0kOirbIHM
         yvFQm7ukVkMM4POF5SqbCR1uiaIeVcMD/tbIAULcpsUXfv6v4trV9eHbDxLPNL/jjYUu
         IsXTHPCMQNjC7RscAouIAWc8XynfSWKTIHoFdYgsYTlTXT6HxFGEDdcrGawwZMJHLsjg
         6dftQDz2x69fX+F1hYVNNSk3TrmHtTtaxWSCJJJ3zmUN8+pbBwHawnzRUFpfPbttgN1y
         fh4yf6x7eW5sK/vq3OOn2kKaZ+kFOHOin7GTLBHF7CNQr/GBNmo44IanfCc4TWttW9tt
         QQbw==
X-Gm-Message-State: AOAM532Il7iqIJOYvhZhvpUuCoxUqJbsIiXvJif7YwKwvy0Kcxqq090/
	4x2T0d0eVloPDpJV4mUvgeyA7Rddnocg12cn
X-Google-Smtp-Source: ABdhPJyLHlu+EVbzpTiQo3JcllSfAOujpPIzc8HR2H2zUP56yp5Cri5v9O5Sdi/DDq/0QJJ+oWaa+Q==
X-Received: by 2002:a63:42c2:: with SMTP id p185mr11058516pga.245.1604890621728;
        Sun, 08 Nov 2020 18:57:01 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s4sm9107037pjp.17.2020.11.08.18.57.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2020 18:57:01 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/12] linux-firmware: add Amlogic VDEC firmware package
Date: Sun,  8 Nov 2020 16:56:11 -1000
Message-Id: <9d30f3ff95ba3461f473903a79a1ca5a334c9a07.1604890441.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1604890441.git.steve@sakoman.com>
References: <cover.1604890441.git.steve@sakoman.com>

From: Neil Armstrong <narmstrong@baylibre.com>

Add package for the Amlogic VDEC firmwares.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit aeb014b50433f254ced275711bee940cde9c1c8a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux-firmware/linux-firmware_20200817.bb             | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20200817.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20200817.bb
index ffeb8e6926..5c9d4c3e04 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200817.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200817.bb
@@ -294,6 +294,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-qcom-venus-1.8 ${PN}-qcom-venus-4.2 ${PN}-qcom-venus-5.2 ${PN}-qcom-venus-5.4 \
              ${PN}-qcom-adreno-a3xx ${PN}-qcom-adreno-a530 ${PN}-qcom-adreno-a630 \
              ${PN}-qcom-sdm845-audio ${PN}-qcom-sdm845-compute ${PN}-qcom-sdm845-modem \
+             ${PN}-amlogic-vdec-license ${PN}-amlogic-vdec \
              ${PN}-whence-license \
              ${PN}-license \
              "
@@ -881,6 +882,12 @@ RDEPENDS_${PN}-qcom-sdm845-modem = "${PN}-qcom-license"
 
 FILES_${PN}-liquidio = "${nonarch_base_libdir}/firmware/liquidio"
 
+# For Amlogic VDEC
+LICENSE_${PN}-amlogic-vdec = "Firmware-amlogic_vdec"
+FILES_${PN}-amlogic-vdec-license = "${nonarch_base_libdir}/firmware/LICENSE.amlogic_vdec"
+FILES_${PN}-amlogic-vdec = "${nonarch_base_libdir}/firmware/meson/vdec/*"
+RDEPENDS_${PN}-amlogic-vdec = "${PN}-amlogic-vdec-license"
+
 # For other firmwares
 # Maybe split out to separate packages when needed.
 LICENSE_${PN} = "\
@@ -888,6 +895,7 @@ LICENSE_${PN} = "\
     & Firmware-agere \
     & Firmware-amdgpu \
     & Firmware-amd-ucode \
+    & Firmware-amlogic_vdec \
     & Firmware-atmel \
     & Firmware-ca0132 \
     & Firmware-cavium \
-- 
2.17.1

