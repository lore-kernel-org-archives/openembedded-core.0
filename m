Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B613C36012
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 20:30:12 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.33434.1743021009642335979
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 13:30:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c+0g+Mmr;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: hiagofranco@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-301302a328bso375862a91.2
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 13:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743021009; x=1743625809; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vlNL2CssR6eMbsd/Gb7fbgqlstdDQ00VPwI7lNWC0fY=;
        b=c+0g+Mmrh8ygvhGJmyun93JaScoILS/7nkv0owBZ03z8OYGpCxLowdRtynligSVncq
         i7ARlwAQ9UIK0/nZxXSnZ+PqAsKkrxzfwCTzKCPTc89WskP2KblnlaohKax4Eb2VDNhW
         +1L1NtJQCDFZbZxU3xHtBTByk3l3Hb6AFuzEO6QcqjDoF7pyVLWU424F114kLafKQk4X
         Hy46SQkYTXcErC6jbQTaZ2F5vraosjQUUx5prZfy+QGrig/AI1yR0+Agps7X6zHhccZR
         kv+6A+o1Y3Zmy/otMjzkg57YRWdSiHq3fT4Pzo3T4cdUfthZuOHDJ5d06ZcSJl9N8PQV
         fmdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743021009; x=1743625809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vlNL2CssR6eMbsd/Gb7fbgqlstdDQ00VPwI7lNWC0fY=;
        b=Z3/0WDtxz0Z16xESr4mhIJxNDDL7f88R2Xh0nAINjIx+y8p/bnIUP8W4IvuHPwsge+
         VR0F5lji5jxh78fWa674/ktdZ9QaolhI5aJ1QhTtOZ1AN/Q0+D4LCe5Pvh5q7IOLTNb9
         LADIV4MWKyTW+62Drs41xIVsIoToN8bxidjZbjKSVNRnW6ux3whtZsAvslPqYShP6L9t
         o+r7I1Cakx2VRx8U81Wf7urFdiizAIFI2TQjq28+/CJJ8SqjRPlkjjzm3/kVt+LRwIPk
         mDQrDM/QyxzYDRGlnN/qXYGgPplnJo7+u4N+Fmlm0CQ2K1d6Uxty9Cw1HWgs/U3si8E8
         QznQ==
X-Gm-Message-State: AOJu0YzBmNTXqAMuz/Ct0nWdnDTZx2CuubMd0taFOi0vKhA3BMvTEEfM
	gQC+u+L3ZS55VBjgIwL+ZaXiNocOyjmXkoSVKnK4c8vfSftCarHef1WECiMs
X-Gm-Gg: ASbGncsjt4+38/RB2xogGY9Gf/fRjNe/9EcKvnYPfvmNH79CoThplPxwi7upC3RYwmV
	earz1mCxGbwiAHZnVXtnTPo6FDszPPei1d+yriwlhiUciJBuapIYqdb5VV5D0hhHOlqNlJOMmH9
	fgPX7o2A8Qffj3XkL97SQn+uBHKDf6herPhle2paeLm9WIJXPOjM4l2LFLElX1E8U3z+l+f8Zqj
	BTDMIwCOfp6ZJLiRgtqJelHHVk/onX/DB9ndhK0Bd5synT79zTHhWufXW+awcYcAJHK5UC976rn
	rief42mqhXz4eZbln2oxRnl3XFmdEkf/JNekTcmTJ+iJtBvTlD6Nn5e69pUncVjW8cA=
X-Google-Smtp-Source: AGHT+IGH7oQtQRmURGlxnE/yfKndttGBQqebqGaOZ0xZxoWLs88ydcdcECPjLew3/czGEWDuWbFd8Q==
X-Received: by 2002:a17:90b:520a:b0:2f4:4003:f3d4 with SMTP id 98e67ed59e1d1-303a91859b6mr1619916a91.30.1743021008635;
        Wed, 26 Mar 2025 13:30:08 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f1d4b6asm661625a91.38.2025.03.26.13.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 13:30:07 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: quentin.schulz@cherry.de,
	steve@sakoman.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Dmitry Baryshkov <dbaryshkov@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [styhead][PATCH v2 25/31] linux-firmware: further split qca61x4 package
Date: Wed, 26 Mar 2025 17:28:11 -0300
Message-Id: <20250326202817.64437-26-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250326202817.64437-1-hiagofranco@gmail.com>
References: <20250326202817.64437-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 20:30:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213685

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

Separate linux-firmware-qca-qca61x4 package into two independent pieces:
serial and USB. Serial part is going to be used for Qualcomm
Dragonboard820c and similar devices, where QCA6174 is attached over a
serial line, while USB package is required for devices where BT part of
the QCA chip is attached over USB.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 93b3d61b657ce7d07c78a75b1b3ae4c81189e19a)
---
 .../linux-firmware/linux-firmware_20250109.bb | 57 +++++--------------
 1 file changed, 13 insertions(+), 44 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
index 80c94c5db3b5..b9323007420c 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
@@ -398,7 +398,8 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-ath12k-wcn7850 \
              ${PN}-ath12k-misc \
              ${PN}-qca \
-             ${PN}-qca-qca61x4 \
+             ${PN}-qca-qca61x4-serial \
+             ${PN}-qca-qca61x4-usb \
              ${PN}-qca-qca6390 \
              ${PN}-qca-wcn3988 \
              ${PN}-qca-wcn399x \
@@ -591,7 +592,8 @@ LICENSE:${PN}-ath12k = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath12k-qcn9274 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath12k-wcn7850 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath12k-misc = "Firmware-qualcommAthos_ath10k"
-LICENSE:${PN}-qca-qca61x4 = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-qca-qca61x4-serial = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-qca-qca61x4-usb = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-qca-qca6390 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-qca-wcn3988 = "Firmware-qcom"
 LICENSE:${PN}-qca-wcn399x = "Firmware-qualcommAthos_ath10k"
@@ -646,47 +648,13 @@ ALLOW_EMPTY:${PN}-ath12k = "1"
 # firmwares that are not already included in other -ath12k- packages.
 ALLOW_EMPTY:${PN}-ath12k-misc = "1"
 
-FILES:${PN}-qca-qca61x4 = " \
-  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00000201.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00000200.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00000300.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00000302.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_00130300.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_00130302.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_00230302.bin \
-  ${nonarch_base_libdir}/firmware/qca/rampatch_usb_00000200.bin \
-  ${nonarch_base_libdir}/firmware/qca/rampatch_usb_00000201.bin \
-  ${nonarch_base_libdir}/firmware/qca/rampatch_usb_00000300.bin \
-  ${nonarch_base_libdir}/firmware/qca/rampatch_usb_00000302.bin \
-  ${nonarch_base_libdir}/firmware/qca/rampatch_00130300.bin \
-  ${nonarch_base_libdir}/firmware/qca/rampatch_00130302.bin \
-  ${nonarch_base_libdir}/firmware/qca/rampatch_00230302.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_00440302.bin \
-  ${nonarch_base_libdir}/firmware/qca/rampatch_00440302.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_00440302_eu.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_00440302_i2s_eu.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00000302_eu.bin \
-  ${nonarch_base_libdir}/firmware/qca/rampatch_usb_00130200.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130200.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130200_0104.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130200_0105.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130200_0106.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130200_0107.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130200_0109.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130200_0110.bin \
-  ${nonarch_base_libdir}/firmware/qca/rampatch_usb_00130201.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130201.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130201_010a.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130201_010b.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130201_0303.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130201_gf.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130201_gf_010a.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130201_gf_010b.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130201_gf_0303.bin \
-  ${nonarch_base_libdir}/firmware/qca/rampatch_usb_00190200.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00190200.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00190200_010e.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00190200_0112.bin \
+FILES:${PN}-qca-qca61x4-serial = " \
+  ${nonarch_base_libdir}/firmware/qca/nvm_0*.bin \
+  ${nonarch_base_libdir}/firmware/qca/rampatch_0*.bin \
+"
+FILES:${PN}-qca-qca61x4-usb = " \
+  ${nonarch_base_libdir}/firmware/qca/rampatch_usb_*.bin \
+  ${nonarch_base_libdir}/firmware/qca/rampatch_usb_*.bin \
 "
 FILES:${PN}-qca-qca6390 = " \
   ${nonarch_base_libdir}/firmware/qca/htbtfw20.tlv \
@@ -786,7 +754,8 @@ RDEPENDS:${PN}-ath12k-qcn9274 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath12k-wcn7850 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath12k-misc += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca += "${PN}-ath10k-license ${PN}-qcom-license"
-RDEPENDS:${PN}-qca-qca61x4 += "${PN}-ath10k-license"
+RDEPENDS:${PN}-qca-qca61x4-serial += "${PN}-ath10k-license"
+RDEPENDS:${PN}-qca-qca61x4-usb += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca-qca6390 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca-wcn3988 += "${PN}-qcom-license"
 RDEPENDS:${PN}-qca-wcn399x += "${PN}-ath10k-license"
-- 
2.39.5


