Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.35809.1607956654849973287
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 06:37:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=pq+bpJhc;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id x12so8247153plr.10
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 06:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=O8kTZP0OJUqUcTnv9eK19ZX5DohddeWAFA8yqAPuqro=;
        b=pq+bpJhcG3KD+REX6dpdWBb0I01nDfGnEZbevYaBfCF7JB+bS9fS5cC5jtmRtfG9aR
         34oIqo9KZ0UNf8YTEABJklCNk/z+MTSO6XtlcXVeGKXGstqwXdvHPcWEhQ0Pe9wfwOU4
         M5QD7+OUZQWQzrgkt6MURcl0FQeoptr9kHF5+/Dy+CvLLb+RawiN/YPkmtvPO773faev
         N/Dz+Z00PH/ilqq9w7i+9cQYVie/qiQK6147Pb6EM5uQO3tq7rf/htlm2l/uGfKa5j2P
         Yonb0nN7xHy/AnFG3dZhKFZ8oANvTljS2I9OObkMBpzKzvOtNh1TYvsAQXLQHQYl0OKS
         4Rwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=O8kTZP0OJUqUcTnv9eK19ZX5DohddeWAFA8yqAPuqro=;
        b=ePyBaEpy0Qxg2FZgm4EHGczOkDUibTezF25bDsqMlgLGisF+22uknlyWmFI4osasdP
         /m6wf79I1AOUMRLAWakc6PpEyjRXqRRy/umQ94CyaSWmSps8vH6kOWShkxxcuP8BA8o7
         8nnpqk8HuzfpKEzEGf65lXFIp1vTou5SBuaWunqjxYcB0mroTq5wXGFpzWs3AzxJG+EC
         Z6Iwsn1UyNa6TWGD+OV5iMWCSTBIKj213jcipyYgVSjS+yBV4ujHu9WrcG6TTgIQhfbI
         gmxD4neqLhS9raB+FyRISU1A5PGY1d/VBoP527QvUxmEtWC6arNzpASunX1AZ47Prpx9
         Dd0w==
X-Gm-Message-State: AOAM530XmqhJ5cQd33d93W5wasZz5MUj+joBCJSDraDe54YD1sKO/CbZ
	xA2+1jIHrPrck3/Hd+L+3lT9PRDW0iq3391h
X-Google-Smtp-Source: ABdhPJyghXXHVleeUqgHJleaX/I9fJl5W8GncUaAt7NvbbFhfhWAWCW6LpFYri5bFqCsNQ+sjwkgdg==
X-Received: by 2002:a17:90a:9304:: with SMTP id p4mr25029381pjo.220.1607956653927;
        Mon, 14 Dec 2020 06:37:33 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y2sm18859439pfe.10.2020.12.14.06.37.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 06:37:33 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/25] linux-firmware: package ath11k firmware
Date: Mon, 14 Dec 2020 04:36:38 -1000
Message-Id: <411d481a1935f23099337f16a5799f8d5d22fc6f.1607956164.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607956164.git.steve@sakoman.com>
References: <cover.1607956164.git.steve@sakoman.com>

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Package firmware for new generation of Atheros WiFi cards.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 23c606e41e49a93289b7bd5c5c7d5eec962a3ffa)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux-firmware/linux-firmware_20201118.bb              | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20201118.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20201118.bb
index 5de7157f3a..baac26c510 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20201118.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20201118.bb
@@ -261,7 +261,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-bcm43xx-hdr \
              ${PN}-atheros-license ${PN}-ar9170 ${PN}-ath6k ${PN}-ath9k \
              ${PN}-gplv2-license ${PN}-carl9170 \
-             ${PN}-ar3k-license ${PN}-ar3k ${PN}-ath10k-license ${PN}-ath10k ${PN}-qca \
+             ${PN}-ar3k-license ${PN}-ar3k ${PN}-ath10k-license ${PN}-ath10k ${PN}-ath11k ${PN}-qca \
              \
              ${PN}-imx-sdma-license ${PN}-imx-sdma-imx6q ${PN}-imx-sdma-imx7d \
              \
@@ -356,12 +356,17 @@ FILES_${PN}-ath10k = " \
   ${nonarch_base_libdir}/firmware/ath10k \
 "
 
+FILES_${PN}-ath11k = " \
+  ${nonarch_base_libdir}/firmware/ath11k \
+"
+
 FILES_${PN}-qca = " \
   ${nonarch_base_libdir}/firmware/qca \
 "
 
 RDEPENDS_${PN}-ar3k += "${PN}-ar3k-license"
 RDEPENDS_${PN}-ath10k += "${PN}-ath10k-license"
+RDEPENDS_${PN}-ath11k += "${PN}-ath10k-license"
 RDEPENDS_${PN}-qca += "${PN}-ath10k-license"
 
 # For ralink
-- 
2.17.1

