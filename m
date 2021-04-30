Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.13162.1619796915261341826
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Apr 2021 08:35:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=sAqHqfTm;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id a11so5918701plh.3
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Apr 2021 08:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=bt3Mdyn8/ljUhaLqOnW3VvX7by3S3Qr9u3wHIgMxA8g=;
        b=sAqHqfTmINV/v9JcPpDV0UuUXYvwLfqPDyANV36IlJXRhStwhqb4L5qPAQwDs/mpmp
         Qa0eTLndYjso0tXnaW8eWk9lbrNqjtSgWYD75YZa7a4TWvmCj2x0hhPns6DNhc8Cb6lO
         Cd5OqJU1ShsshGdcQqZSmuXK9fMgNA58N94SSuxXfUYNm2aOroUG1zmTjpKCMSTumh4D
         qyu7j4y7dHRAGnNexs12vkGRsP+oaKjBSM2NdiDgL5yT0x7cyIZfTFtDAQ69Rg+a7whx
         hvLDZQL4iapFwPEpey/H7eVZxpwOQkgc74xnpHSghkvXXn8nKn4JdGWYPYGETdQ9Txv9
         SUEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bt3Mdyn8/ljUhaLqOnW3VvX7by3S3Qr9u3wHIgMxA8g=;
        b=RN9B+CYErB9bG0CImXdbhmZvkCuP9O/hxaHVparq0VMQinNSaBYV04QR0TIYvy/T/R
         RFHiotOvHceWboh8RtzPnJFjzTf6JHV80AIZO2jvSqoWP+29TeFTAB3zIVo6qyyYH1XY
         gIS9XmnAQu+8OV1YH9MeQgbzTomye3emRj4pVydiW6EkeFbHthBx4QnBQgOZlAzk69Mb
         3TdFUcTkzdlx1UntTA6Hu5XZsi42kpCNgWFRKQ2mPhk223IiCq4BL0tkmiHSr89uHzpO
         XHzoqsQ7pyp/d43CfPKmC9CodhfWEjL3sioc4Lcd/VXlW9yk6OiCyOYIDoZ2TIGdYUX2
         FGUQ==
X-Gm-Message-State: AOAM533tQI3U+jh+hzJpzulsg5e5g7Vj9lWdyC2fQsXxDVKU40V9ziS3
	jAp3LOjJO3hV0hp96UD4B+KsxNKJKRnlOjxB
X-Google-Smtp-Source: ABdhPJyM7CzxsXYQauloIFivs+mVBy5AtiFXFuZXWEg1+uq9PvWZ8g1sjboFgKsGCVHr90W7AGYKYQ==
X-Received: by 2002:a17:902:7081:b029:ed:5f:20af with SMTP id z1-20020a1709027081b02900ed005f20afmr5733799plk.60.1619796914385;
        Fri, 30 Apr 2021 08:35:14 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id x9sm2900386pfq.197.2021.04.30.08.35.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 08:35:14 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/12] linux-firmware: Package RSI 911x WiFi firmware
Date: Fri, 30 Apr 2021 05:33:49 -1000
Message-Id: <a520c06eb6631d1b930a694ca9c2f8400b37a26f.1619796615.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1619796615.git.steve@sakoman.com>
References: <cover.1619796615.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Marek Vasut <marex@denx.de>

The RSI 911x WiFi firmware is already part of the linux-firmware
repository, package it to make it easily available.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cc44b71f6ea68ca0f483d635df7dc7b9905b1593)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux-firmware/linux-firmware_20210208.bb         | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20210208.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20210208.bb
index 78856cbf66..a751b92a2f 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20210208.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20210208.bb
@@ -229,6 +229,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-sd8887 ${PN}-sd8897 ${PN}-sd8997 ${PN}-usb8997 \
              ${PN}-ti-connectivity-license ${PN}-wlcommon ${PN}-wl12xx ${PN}-wl18xx \
              ${PN}-vt6656-license ${PN}-vt6656 \
+             ${PN}-rs9113 ${PN}-rs9116 \
              ${PN}-rtl-license ${PN}-rtl8188 ${PN}-rtl8192cu ${PN}-rtl8192ce ${PN}-rtl8192su ${PN}-rtl8723 ${PN}-rtl8821 \
              ${PN}-rtl8168 \
              ${PN}-cypress-license \
@@ -529,6 +530,16 @@ RDEPENDS_${PN}-nvidia-gpu += "${PN}-nvidia-license"
 RDEPENDS_${PN}-nvidia-tegra += "${PN}-nvidia-license"
 RDEPENDS_${PN}-nvidia-tegra-k1 += "${PN}-nvidia-license"
 
+# For RSI RS911x WiFi
+LICENSE_${PN}-rs9113 = "WHENCE"
+LICENSE_${PN}-rs9116 = "WHENCE"
+
+FILES_${PN}-rs9113 = " ${nonarch_base_libdir}/firmware/rsi/rs9113*.rps "
+FILES_${PN}-rs9116 = " ${nonarch_base_libdir}/firmware/rsi/rs9116*.rps "
+
+RDEPENDS_${PN}-rs9113 += "${PN}-whence-license"
+RDEPENDS_${PN}-rs9116 += "${PN}-whence-license"
+
 # For rtl
 LICENSE_${PN}-rtl8188 = "Firmware-rtlwifi_firmware"
 LICENSE_${PN}-rtl8192cu = "Firmware-rtlwifi_firmware"
-- 
2.25.1

