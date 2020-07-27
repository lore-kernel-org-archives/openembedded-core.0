Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web10.57881.1595862625760916767
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2020 08:10:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=PGEacL0V;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.196, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f196.google.com with SMTP id q17so8136908pls.9
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2020 08:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=EVtYJN3q17Q4dsxPJEgcITX6mX+XEpI7KSpJrszP2DE=;
        b=PGEacL0VGCb6bSwW7yudyYF9GMz0lR8fkDVesOcyyArcXHGG+HZ+4Wb3zHtHHWjK9A
         FDhKvq0kEKSAn2+Wl111NRY4ijsPeE0Mi0NSWc74kw5sWpfDKjUpc4X7ThNU0z1QvH7L
         +7JgXo0sb229z7yL0nMD764FvZRvNLaJHNXxbDskEJWEu2/Hzf/Qi9d9QLCh7R+LrORg
         CKB493ywY3u2ss4jgyXsJ9D7NgOK8GZDAa5ByzDJGK0WWiTpU95Qi2tPpYwoq5cQsAJ7
         LPJ+0JQ68iOreNzAY44XyU+gJjlvQVNwsYXqihy0YLvbDsBRQOz08K4wFwW37Uwj2T6Z
         4bJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=EVtYJN3q17Q4dsxPJEgcITX6mX+XEpI7KSpJrszP2DE=;
        b=G2mjmTYTVe+oyaIruyAAPhC8cwF7RSK7ahrLDW3PMVY+AyqkxtbZ1zMtUIFvUz+fTP
         z1C1HAX1PqTwnz/QZEUFB8ro/aOLMU44s7mnYzdxdkQhi/ctGuO8SyYYO5yM592SPOLr
         fLIiOOvBc2Rp0374hNeRZ2djaMx4ujNjCFpcC+Pio2Id8zsmEzgkbOtxq/ZPE8tdo/Oe
         yhr96BB832m6YrP07LcCAoKt8uw8b2qACPMPSupsvxSW0Y/2y/+L3PXvk0VSOz5sIc3M
         +EUB3T0+A1n4b+smt21fPzBmbhhCP5VbQfZhJ5VxO4pCIQ/deq+3rpWCKZXFSwRbHBjX
         ycHQ==
X-Gm-Message-State: AOAM530+V3ZA5kzg6LdV7KjMbDqo7+ByQDydHb717iwGAvqlaH2A+vqz
	y6in2kfWOsdPYJo826DhKbK9KU31zbM=
X-Google-Smtp-Source: ABdhPJw8u82Ml+l3aJjsa4gU+aTWGQP/FmpoLPeFS09riSl8gOSkpT1Eq8AkOHged/X23s/cnHxgWg==
X-Received: by 2002:a17:90a:eb01:: with SMTP id j1mr19348359pjz.29.1595862624770;
        Mon, 27 Jul 2020 08:10:24 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id p127sm14929495pfb.17.2020.07.27.08.10.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 08:10:24 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/18] linux-firmware: add ibt-20 package
Date: Mon, 27 Jul 2020 05:09:44 -1000
Message-Id: <a53e9fd2d50d92c138c3f72aef0a9d0e59e823e6.1595862361.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1595862361.git.steve@sakoman.com>
References: <cover.1595862361.git.steve@sakoman.com>

From: Kurt Kiefer <kurt.kiefer@arthrex.com>

Add the firmware packaging for Intel Bluetooth AX200, also known
as Intel CyclonePeak (CcP).

Signed-off-by: Kurt Kiefer <kurt.kiefer@arthrex.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a701625a95ccb15a9db1a50a02143ba1ac8e6f1d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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

