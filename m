Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com [209.85.210.66])
 by mx.groups.io with SMTP id smtpd.web12.450.1592848915738293516
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 11:01:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=I/kBWCQr;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.66, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f66.google.com with SMTP id 64so2883768oti.5
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 11:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=YcY/BncQVE1nwAeuJxev/nowdg+rdsksBF+Ohy/tx+0=;
        b=I/kBWCQrpflmwWMM0g0OStg7QEPreUh8+k6z16ALshcIcAD13wXqAMEvRFf0XVYyKW
         9JazXo94gF7Mx/HmeEv3tvdH4YGFjCIkYx1ngnG+6Lph2EveCSuieMF2vdkLnXEjvkHN
         q7bioPRoiBiJ574WURTH6Q//9ibJ5DK1N3vr/LIT01GlY7v08InzUBGvNCEk2h9EeEaH
         Xp/rS8ccCWn7uYAl9Ga1Xu+IbjL7UvGCqvI2T+1CHW+NUw9kDUiuuSusADt4oowsG85/
         MUukZMN8vRk58nJ4VnOuVO8XL/cA+S+Zxs3TC8jolIKelq9shFavJjPK0pWiEWFsTq0I
         PAXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=YcY/BncQVE1nwAeuJxev/nowdg+rdsksBF+Ohy/tx+0=;
        b=KKhc2X7PKDD5VEUJBR4XNMVs7zhpbl8BgRt8z9gjBj67ZlqTUFtzXq30C/Rzqui7KH
         g9CRPOmKkS+S4JjfOUVGeQGr9v9B+oyCv0IEyz5E5GogwX/NmcVyoXo12e+DiKj234yy
         LAKjtXglVhfeOnGyrXCzprTsKYLAg9gapx3513yBbiRjfrCgSsCWVfVG5V+SFMB9Q9eO
         fB7j8uYRbubDjJAPJTH8VapzYpQX43cJVglwFot5eOla6Xw7BnweyKKm4BDBIf2mLqY4
         i3PsmTNsrS3DU0NeYsY4Otp2R+n4k0Lp7uo/raNxHyvErBNEx6ZUuiaqiQte+9xt+vI4
         zBcg==
X-Gm-Message-State: AOAM532CSgRmS/30i1Mnt9GhZjmM5te+jgREPKHNCRUY+kNhdrhHE/S9
	ccwzSTC8OB2yRkxG/ZPuHCoV1SDHxpgl3g==
X-Google-Smtp-Source: ABdhPJwHxeuWJnggzmonMijAbykBvxMOIzStZBphNNr1iP9Nc5E+WHPndp6lIjMX7Azi+F4BpusagQ==
X-Received: by 2002:a9d:7dd3:: with SMTP id k19mr15373672otn.278.1592848914533;
        Mon, 22 Jun 2020 11:01:54 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id n60sm3422659otn.75.2020.06.22.11.01.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 11:01:54 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 29/33] linux-firmware: add ice for Intel E800 series driver
Date: Mon, 22 Jun 2020 07:58:23 -1000
Message-Id: <975523044487d0c2708d91732fe014792a89e77e.1592848337.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592848337.git.steve@sakoman.com>
References: <cover.1592848337.git.steve@sakoman.com>

From: Yongxin Liu <yongxin.liu@windriver.com>

Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cdc65ddba0258be0c82deb4c174cd26005e7c32a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux-firmware/linux-firmware_20200519.bb            | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20200519.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20200519.bb
index fcad7df629..18f44bccae 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200519.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200519.bb
@@ -26,6 +26,7 @@ LICENSE = "\
     & Firmware-i2400m \
     & Firmware-i915 \
     & Firmware-ibt_firmware \
+    & Firmware-ice \
     & Firmware-it913x \
     & Firmware-iwlwifi_firmware \
     & Firmware-IntcSST2 \
@@ -155,6 +156,7 @@ NO_GENERIC_LICENSE[Firmware-hfi1_firmware] = "LICENSE.hfi1_firmware"
 NO_GENERIC_LICENSE[Firmware-i2400m] = "LICENCE.i2400m"
 NO_GENERIC_LICENSE[Firmware-i915] = "LICENSE.i915"
 NO_GENERIC_LICENSE[Firmware-ibt_firmware] = "LICENCE.ibt_firmware"
+NO_GENERIC_LICENSE[Firmware-ice] = "LICENSE.ice"
 NO_GENERIC_LICENSE[Firmware-IntcSST2] = "LICENCE.IntcSST2"
 NO_GENERIC_LICENSE[Firmware-it913x] = "LICENCE.it913x"
 NO_GENERIC_LICENSE[Firmware-iwlwifi_firmware] = "LICENCE.iwlwifi_firmware"
@@ -280,6 +282,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-ibt-11-5 ${PN}-ibt-12-16 ${PN}-ibt-hw-37-7 ${PN}-ibt-hw-37-8 \
              ${PN}-ibt-17 \
              ${PN}-i915-license ${PN}-i915 \
+             ${PN}-ice-license ${PN}-ice \
              ${PN}-adsp-sst-license ${PN}-adsp-sst \
              ${PN}-bnx2-mips \
              ${PN}-liquidio \
@@ -828,6 +831,12 @@ FILES_${PN}-i915-license = "${nonarch_base_libdir}/firmware/LICENSE.i915"
 FILES_${PN}-i915         = "${nonarch_base_libdir}/firmware/i915"
 RDEPENDS_${PN}-i915      = "${PN}-i915-license"
 
+LICENSE_${PN}-ice       = "Firmware-ice"
+LICENSE_${PN}-ice-license = "Firmware-ice"
+FILES_${PN}-ice-license = "${nonarch_base_libdir}/firmware/LICENSE.ice"
+FILES_${PN}-ice         = "${nonarch_base_libdir}/firmware/intel/ice"
+RDEPENDS_${PN}-ice      = "${PN}-ice-license"
+
 FILES_${PN}-adsp-sst-license      = "${nonarch_base_libdir}/firmware/LICENCE.adsp_sst"
 LICENSE_${PN}-adsp-sst            = "Firmware-adsp_sst"
 LICENSE_${PN}-adsp-sst-license    = "Firmware-adsp_sst"
-- 
2.17.1

