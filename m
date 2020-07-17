Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
 by mx.groups.io with SMTP id smtpd.web10.188.1595006598148869999
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2020 10:23:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MA6G14aw;
 spf=pass (domain: gmail.com, ip: 209.85.216.67, mailfrom: kekiefer@gmail.com)
Received: by mail-pj1-f67.google.com with SMTP id a9so1227236pjd.3
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2020 10:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=zBAhCwBNwcvzMpbUJW63TfeE7wcBcoUips2cSldpW+A=;
        b=MA6G14awFgD3GJ09lYFJZlMb2Hkhxia6FTdZtVw/UQje0EZTF/dnBy2L7X7xi3o0Tf
         nLQqeGU4zJjIeaKLzpGwYX5dwp9VhjcBqZjnPVueUhAd8LqxOzWlhIerbiH6Gl7RjgSH
         vEjviLMkXspGOz6yzQYB4beb3AOc5kUyq3ZHoSHCEeBNWzY05ybOKfDEeEc8DyXK9bXF
         5+HdGe0syGXLXDhHs4Y1GyZgcqIHb2TF79NseMj5HRvYqWipcH3dVK/76y6ZYveAzSnz
         a2R3BnvbliN9Vh6ZTCfHC6qxgMzZcwWQwOrNC4NOdAn0qcBLQCEgkxLRYAV3FFTFLpqH
         jBqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=zBAhCwBNwcvzMpbUJW63TfeE7wcBcoUips2cSldpW+A=;
        b=sRKWTxek7hjy2smiSIJX2AvGhPzvub+h/56DzBC5h32KEn9s1pbo9IMFoPkMfXXbh6
         S2Q5t7dXkUV0BCBneD3N1H11/GtwoTpsCHrTGHbho/Pzua65SUUJZ2muA23gy9E+EIuA
         EmYGS637PIamcVPRtKLXk74jfITrFsU7o6sQmN+RagIjoN2h2KanWFLNRPvfYwXVIUBv
         KHoPKRR1mVWMHe6QlLKPN/G86TzdtUQAVmjf6nDLTBKB/JK/7nOFFr1G6fe5uykYXG1c
         vgvUWiEvSso+UvWzl5HOiHyqj4kf2tHvSr65lIFinTF2J2lxSPm2Ivuev3KhAjgX8bSn
         UwsQ==
X-Gm-Message-State: AOAM531MFzjdYYr3WSUJpDlBccRc/aS3+nsM8WhfDdWVCxJv6Nz24H2R
	aCXeSr7PuuE6xG7EbVnURIxKQjg6cOo=
X-Google-Smtp-Source: ABdhPJxjnTmffeoSz3yERuvtYKc0EELHbD4xsIj5nFLIUspDdaznb12S6wEV08M2sxCGACsbYwkj4A==
X-Received: by 2002:a17:902:7441:: with SMTP id e1mr8348063plt.23.1595006597352;
        Fri, 17 Jul 2020 10:23:17 -0700 (PDT)
Return-Path: <kekiefer@gmail.com>
Received: from localhost.localdomain (ip184-189-236-128.sb.sd.cox.net. [184.189.236.128])
        by smtp.gmail.com with ESMTPSA id d14sm3456587pjc.20.2020.07.17.10.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 10:23:16 -0700 (PDT)
From: kekiefer@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Kurt Kiefer <kurt.kiefer@arthrex.com>
Subject: [oe-core][PATCH] linux-firmware: add ibt-20 package
Date: Fri, 17 Jul 2020 10:23:02 -0700
Message-Id: <20200717172302.2845-1-kekiefer@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Kurt Kiefer <kurt.kiefer@arthrex.com>

Add the firmware packaging for Intel Bluetooth AX200, also known
as Intel CyclonePeak (CcP).

Signed-off-by: Kurt Kiefer <kurt.kiefer@arthrex.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20200619.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20200619.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20200619.bb
index 2b5963c0c8..bf25ff8b70 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200619.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200619.bb
@@ -281,6 +281,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-ibt-license ${PN}-ibt \
              ${PN}-ibt-11-5 ${PN}-ibt-12-16 ${PN}-ibt-hw-37-7 ${PN}-ibt-hw-37-8 \
              ${PN}-ibt-17 \
+             ${PN}-ibt-20 \
              ${PN}-ibt-misc \
              ${PN}-i915-license ${PN}-i915 \
              ${PN}-ice-license ${PN}-ice \
@@ -806,6 +807,7 @@ LICENSE_${PN}-ibt-hw-37-8 = "Firmware-ibt_firmware"
 LICENSE_${PN}-ibt-11-5    = "Firmware-ibt_firmware"
 LICENSE_${PN}-ibt-12-16   = "Firmware-ibt_firmware"
 LICENSE_${PN}-ibt-17 = "Firmware-ibt_firmware"
+LICENSE_${PN}-ibt-20 = "Firmware-ibt_firmware"
 LICENSE_${PN}-ibt-misc    = "Firmware-ibt_firmware"
 
 FILES_${PN}-ibt-license = "${nonarch_base_libdir}/firmware/LICENCE.ibt_firmware"
@@ -814,6 +816,7 @@ FILES_${PN}-ibt-hw-37-8 = "${nonarch_base_libdir}/firmware/intel/ibt-hw-37.8*.bs
 FILES_${PN}-ibt-11-5    = "${nonarch_base_libdir}/firmware/intel/ibt-11-5.sfi ${nonarch_base_libdir}/firmware/intel/ibt-11-5.ddc"
 FILES_${PN}-ibt-12-16   = "${nonarch_base_libdir}/firmware/intel/ibt-12-16.sfi ${nonarch_base_libdir}/firmware/intel/ibt-12-16.ddc"
 FILES_${PN}-ibt-17 = "${nonarch_base_libdir}/firmware/intel/ibt-17-*.sfi ${nonarch_base_libdir}/firmware/intel/ibt-17-*.ddc"
+FILES_${PN}-ibt-20 = "${nonarch_base_libdir}/firmware/intel/ibt-20-*.sfi ${nonarch_base_libdir}/firmware/intel/ibt-20-*.ddc"
 FILES_${PN}-ibt-misc    = "${nonarch_base_libdir}/firmware/intel/ibt-*"
 
 RDEPENDS_${PN}-ibt-hw-37-7 = "${PN}-ibt-license"
@@ -821,6 +824,7 @@ RDEPENDS_${PN}-ibt-hw-37.8 = "${PN}-ibt-license"
 RDEPENDS_${PN}-ibt-11-5    = "${PN}-ibt-license"
 RDEPENDS_${PN}-ibt-12-16   = "${PN}-ibt-license"
 RDEPENDS_${PN}-ibt-17 = "${PN}-ibt-license"
+RDEPENDS_${PN}-ibt-20 = "${PN}-ibt-license"
 RDEPENDS_${PN}-ibt-misc    = "${PN}-ibt-license"
 
 ALLOW_EMPTY_${PN}-ibt= "1"
-- 
2.17.1

