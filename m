Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.6199.1604890628379857859
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2020 18:57:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=omX21glm;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id q10so6709607pfn.0
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2020 18:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=VAjE855VlEplMHnumBcx5MSdi/+ddIyiaypVFrchKm4=;
        b=omX21glmyz+iGuAVTU5r4JxpSBO7dNJjsg1w8qmZguXws8fvtl0CRdauBQ99RQjPMZ
         J417UB0XaB+FMCDpgBnKT9bjus5iXmcczeg7O4K7sNQ0mxxgP5MHKleRUGEuyedsNADT
         G9GoOzaXue5BxvH8igpjOErG8YeIRLAvFSyeGbz9oExhBVHHkeWQVIUjwecTWyg8de5o
         pQhK9K0dBw6WQ0lIByMJ9kMHqKkQbf0wy1ilR0aWHOOV8qK+am7jbndR/7plosOhyvo2
         /3PIVgJusW/Nyr6U6rOynyfNphO+CFaIEKKpb4WMaBZLjciHTaCG/YJQOpgGVKJqNtDl
         KFbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=VAjE855VlEplMHnumBcx5MSdi/+ddIyiaypVFrchKm4=;
        b=XybjdE1h4/1vdnt+B95iIsRhJhoN5o5FXPCICVmlTKW8wedU8FX8jwhExD2hwTIc48
         b6dIT4WfGVIb2OP4CZ9TG9y4BSN34r5NNgUW9KCuV72NCQahx6ruWplIwQEeFrkrBGxi
         7O9KjrLAoKIoT8ilO+drEYaCska3M/oh+OgpflQrjhJHgP0gsYa8kH+2SdXFUG4p7v6b
         i4eT1q0gB6JC4mxWUfdW2VYmXAeEoF8yO1J4IYIpi/CqJ8b7StDhAtXzQRnzWXiCHJel
         8U58WiiGf9DMcICXKdqhqylTg3I4X39rmKCfPl+QgUZANl2zhN0km0YnAzm9pIT6Kgvt
         O6AA==
X-Gm-Message-State: AOAM5316HsBP2iNZ2Fi2RP169EDsmdjyKZ9p1Yoj5Gmt+5bGdmLWTL/A
	/cnITiftvow0QOWDyaCVwjMbgsj2uDtqdJz0
X-Google-Smtp-Source: ABdhPJxXOj9q65NR4KhZzrpHOjdJkQqaEWQm3iVsWgnVGzrAYcA01BVBBunPBn2IRr/qbLPDjO6hVA==
X-Received: by 2002:a62:e40c:0:b029:18b:ad5:18a8 with SMTP id r12-20020a62e40c0000b029018b0ad518a8mr11948422pfh.16.1604890627540;
        Sun, 08 Nov 2020 18:57:07 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s4sm9107037pjp.17.2020.11.08.18.57.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2020 18:57:06 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/12] linux-firmware: package nvidia firmware
Date: Sun,  8 Nov 2020 16:56:13 -1000
Message-Id: <0671d049785708044491927ce65ef527d2603639.1604890441.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1604890441.git.steve@sakoman.com>
References: <cover.1604890441.git.steve@sakoman.com>

From: Max Krummenacher <max.oss.09@gmail.com>

Add packages for the firmware required by the Nvidia chipsets.
Split it in Tegra K1, all other Tegras and desktop GPU packages.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f03b7bc5f164afd9cbb0c2bd3a932bb85d968bf7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux-firmware/linux-firmware_20200817.bb | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20200817.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20200817.bb
index 3d6644e504..0abd28c9fa 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200817.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200817.bb
@@ -288,6 +288,9 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-adsp-sst-license ${PN}-adsp-sst \
              ${PN}-bnx2-mips \
              ${PN}-liquidio \
+             ${PN}-nvidia-license \
+             ${PN}-nvidia-tegra-k1 ${PN}-nvidia-tegra \
+             ${PN}-nvidia-gpu \
              ${PN}-netronome-license ${PN}-netronome \
              ${PN}-qat ${PN}-qat-license \
              ${PN}-qcom-license \
@@ -478,6 +481,27 @@ FILES_${PN}-netronome = " \
 
 RDEPENDS_${PN}-netronome += "${PN}-netronome-license"
 
+# For Nvidia
+LICENSE_${PN}-nvidia-gpu = "Firmware-nvidia"
+LICENSE_${PN}-nvidia-tegra = "Firmware-nvidia"
+LICENSE_${PN}-nvidia-tegra-k1 = "Firmware-nvidia"
+LICENSE_${PN}-nvidia-license = "Firmware-nvidia"
+
+FILES_${PN}-nvidia-gpu = "${nonarch_base_libdir}/firmware/nvidia"
+FILES_${PN}-nvidia-tegra = " \
+  ${nonarch_base_libdir}/firmware/nvidia/tegra* \
+  ${nonarch_base_libdir}/firmware/nvidia/gm20b \
+  ${nonarch_base_libdir}/firmware/nvidia/gp10b \
+"
+FILES_${PN}-nvidia-tegra-k1 = " \
+  ${nonarch_base_libdir}/firmware/nvidia/tegra124 \
+  ${nonarch_base_libdir}/firmware/nvidia/gk20a \
+"
+FILES_${PN}-nvidia-license = "${nonarch_base_libdir}/firmware/LICENCE.nvidia"
+
+RDEPENDS_${PN}-nvidia-gpu += "${PN}-nvidia-license"
+RDEPENDS_${PN}-nvidia-tegra += "${PN}-nvidia-license"
+
 # For rtl
 LICENSE_${PN}-rtl8188 = "Firmware-rtlwifi_firmware"
 LICENSE_${PN}-rtl8192cu = "Firmware-rtlwifi_firmware"
-- 
2.17.1

