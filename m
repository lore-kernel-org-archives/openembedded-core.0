Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.37032.1622412539028108067
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 May 2021 15:08:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KkCB+De8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id l11-20020a05600c4f0bb029017a7cd488f5so5467153wmq.0
        for <openembedded-core@lists.openembedded.org>; Sun, 30 May 2021 15:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7ycNs7BlIjrKyuJ/AyDl2X5Ny+AzhQ6ZVml3HbII+iI=;
        b=KkCB+De8AFZdGJDqZFsURtj02cw1lQFdY5dm6diXGt5ONxJzdLS6maoN1X3wB3/C7q
         d3zBUyJ7nKcYB5S6ZWW6i4Mb0MbCAOYiakmZnLjYtzWeG9Qwmvtv1at1e+9/yncRrS+r
         eQqgNzIriMJJdmm9u+9+yK9FrFO7BiiDmJ2fw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7ycNs7BlIjrKyuJ/AyDl2X5Ny+AzhQ6ZVml3HbII+iI=;
        b=Cjjy72kkDALTX10vr0wNLr/Zrg2GATDzIrGnVORvPQ/D3cjoIgSjDzE7FxUvnk+RNn
         h742+eB1f93bT2SiofhzFcxkaPuxuRIZrxdipspRIJSPSQNwdEGPalHlCcul3qXrY+cF
         HvMXQ7tw9ssi65dikmix/rK41IstD9pTAZRyS+GAD2piU7OWZBttQ9FeZLZZFEe1bhlj
         ek3izotNi/Q30rY9BHjpei+4/YN6a3lOAE/28GCkIcrL0OYG85ldVFiHbj6xVRub3ERV
         K9yoe8ZvCX/gkcZ2yTK7oSUC2iWFFnp9+bJVrzitMN9oOx25xjvnunEATo6lPi/L/WiW
         7gpg==
X-Gm-Message-State: AOAM5327MNUGV1XteBZxAZIIAANvEXglu2tnxBnCvVAyKuWxb8kHcT3o
	bp4HXD22ajuq83sd9gCdjeUW8qHR7NQoTw==
X-Google-Smtp-Source: ABdhPJzec0WPxOGreV2hvS0Mpr6DONQRigrJUN1CZVIC1SelEMwS0pXhYXOu7Uy7KNaZiD9C0o2/Ag==
X-Received: by 2002:a05:600c:4e8c:: with SMTP id f12mr18683073wmq.187.1622412537264;
        Sun, 30 May 2021 15:08:57 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:fcab:51bf:ac39:992c])
        by smtp.gmail.com with ESMTPSA id j10sm14721102wrt.32.2021.05.30.15.08.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 15:08:57 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/16] linux-firmware: upgrade 20210315 -> 20210511
Date: Sun, 30 May 2021 23:08:41 +0100
Message-Id: <20210530220856.2830501-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There were additional links and new firmware versions added but these
were not under any additional licenses.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...{linux-firmware_20210315.bb => linux-firmware_20210511.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20210315.bb => linux-firmware_20210511.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20210315.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20210511.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20210315.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20210511.bb
index 1e32d1c8b69..26091fba707 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20210315.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20210511.bb
@@ -132,7 +132,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=e21a8cbddc1612bce56f06fe154a0743 \
+                    file://WHENCE;md5=727d0d4e2d420f41d89d098f6322e779 \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -205,7 +205,7 @@ PE = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "a2348f03492713dca9aef202496c6e58f5e63ee5bec6a7bdfcf8b18ce7155e70"
+SRC_URI[sha256sum] = "2aa6ae8b9808408f9811ac38f00c188e53e984a2b3990254f6c9c02c1ab13417"
 
 inherit allarch
 
-- 
2.30.2

