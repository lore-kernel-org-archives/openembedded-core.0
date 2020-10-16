Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web10.17025.1602858500154773303
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 07:28:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20150623.gappssmtp.com header.s=20150623 header.b=k8VSYcgx;
 spf=pass (domain: baylibre.com, ip: 209.85.128.67, mailfrom: narmstrong@baylibre.com)
Received: by mail-wm1-f67.google.com with SMTP id k18so3161659wmj.5
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 07:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=HFfGDkL53XFYCiBEhaCX0e7lSfsSpW9Ovfv7mQjalr4=;
        b=k8VSYcgxcN5SMD1ddJhDdh6qJeEQyFo3PJUVOP1sjKpzspKtwTTaBdkYp4UpgXEO7d
         vKNAKG7K9alNba4q7iNWj7rDVCzRljI+wpOvdS/ObSx/wB3PcJUxLFBypK8TpIltopzC
         qbduiBmLQQDXzhe/5LeBznWbue5Pubj8iWq1eOPsV/44pY909VQu35HppGqdY9CG0R79
         3Icv/6isgwuj5QK22nyNXWp6e9LZwnHeS8xnC2mxCOzvep9kEWcC5/XOAAhDwRMxPFoW
         F4ls+I3ffs3YrXRnjqlDgr/BQCtsYgJfgb3TEYKBSMrCQW2sVt1SBUja7+ogLUyNWEsj
         5lyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=HFfGDkL53XFYCiBEhaCX0e7lSfsSpW9Ovfv7mQjalr4=;
        b=L9iDbzf9aW4gThKOH0P0C5Zk90EB/0+csEdJwb7swCuADkzEJdZe0ll3vvfysxQLaa
         MiNxjlbk+xdJ0Q9CgJVksIsOwBoD2/6n4jPColTM1zmBgQ2qQG3WZcN/V40jYWNS+YwT
         ebY2W4nWKfVx9OQYGai2LsvjXpua0AMDQoe9vKqw6PDYnOyde1JsyvaAhm3Y8xRCnB1Q
         8PLZiEGY0A/nRLsZS/Xm87OAcxACTX0BKEfqMWS/y3WvBjfT3VPpB/RXg5ooQEHcW/q5
         wWKEKTYXGnx4UVW6u6LIWmMIzgIavAyGxv1/YUrKcku2oxURolWLZA3oR2qLaZ4v1wGe
         3t/A==
X-Gm-Message-State: AOAM530veyhXBgOT88wdS3126YtxbmnyQxX7poFqRo8j+MT6ibBUkX7p
	o0s/PNwaLhAL6fmTezB0iXx6Go69LGMTDA==
X-Google-Smtp-Source: ABdhPJwZ1wrQUfhL3q2yFgRgafXggEDLxks6kQMOaSHHOSwLPAs3rPhLwhFWKQDTil15jqfS+yQYkQ==
X-Received: by 2002:a7b:c20e:: with SMTP id x14mr3971365wmi.76.1602858498128;
        Fri, 16 Oct 2020 07:28:18 -0700 (PDT)
Return-Path: <narmstrong@baylibre.com>
Received: from localhost.localdomain ([163.172.76.58])
        by smtp.gmail.com with ESMTPSA id i10sm3893298wrq.27.2020.10.16.07.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 07:28:17 -0700 (PDT)
From: "Neil Armstrong" <narmstrong@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH] linux-firmware: add Amlogic VDEC firmware package
Date: Fri, 16 Oct 2020 14:28:14 +0000
Message-Id: <20201016142814.18879-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.17.1

Add package for the Amlogic VDEC firmwares.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
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

