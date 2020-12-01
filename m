Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web08.2957.1606782973848301839
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Nov 2020 16:36:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dl3xGpSE;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: dbaryshkov@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id o24so21113341ljj.6
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Nov 2020 16:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vn9jwztAjTzXECHpNQn6SVbnmAvqXuGQA7FXhmxgwt0=;
        b=dl3xGpSEEmpgJH4TIkwKq2pUp6SZpp5WPn2Za4qnOzvXT46Dn+0xURAIEMBJre3v1K
         5hKpbMLvl2JzettdwnPI2kYxq8E6H9vDT1WIzC0dJzcmAXwGjfkcu2Lq4uGEZ2dNIV1L
         Z7Km0FH4s8WgPUpx7xNzWPnoBrXyWfCVxXIjZ1EI4NhVEHoqg5eMkJErkJ9G4JcMxKXA
         kqso7IKZ9DM/G2K5PabkplBLdzeDcJNFXPWsiQ2tWJ3eew3JcpSqLTarQVj9789tZ4yI
         40+naj9712smACda6EXjgCLQguYbw14HRhb+7NATrvmNjQObnUvD2MsRMzoI+cqsFEtR
         1RMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vn9jwztAjTzXECHpNQn6SVbnmAvqXuGQA7FXhmxgwt0=;
        b=UH/M/gOs/67HKNUhmjy1fqh4jmw5jwSCe83YBk9k3k+fViRavPaD+5xjChuMmxLLCU
         pcEWSuLp+ZojQ4Eb6LesFloQ2NLEw29oV6lKK2vcy/bbK3tN01s08ctjqo0aO9zDYrFI
         uK0nAVXsrWatJnMLyiI9IvPiRFyur4C5MSVBWykYKQCF9uyi0vq2BUfF1difhY4tjauS
         KoqRW7qsGhDrdR7840AHh4X1Vh3nlmPfPsxuoUOVn1cuvRJFRmO/hE+RSomMtJ+mrmzF
         b4d72KAS/pYoUI2uJeEfb9mhhx1oMRpu40g6NPwK+zhIbMpoDIF0fraxlplItv5Ye+4u
         nezw==
X-Gm-Message-State: AOAM531TD07h2rN/dPpI44sbScGVTw3Ia/XYhywkQgUJwhcvO0yC4Cxh
	Y08MnBc0o2hgGeL/iMCTZxY79stLiMw=
X-Google-Smtp-Source: ABdhPJw9smOz2lnHq0W8//hT9YXLtCbaykq1O/s/K9npwkuUGY71+8dOnNiLZwWT+V1bRpCOTSTYJg==
X-Received: by 2002:a2e:858b:: with SMTP id b11mr108927lji.90.1606782971796;
        Mon, 30 Nov 2020 16:36:11 -0800 (PST)
Return-Path: <dbaryshkov@gmail.com>
Received: from umbar.lan ([188.162.65.76])
        by smtp.gmail.com with ESMTPSA id m21sm25037ljh.82.2020.11.30.16.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 16:36:11 -0800 (PST)
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 2/2] linux-firmware: package ath11k firmware
Date: Tue,  1 Dec 2020 03:36:05 +0300
Message-Id: <20201201003605.768732-2-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201201003605.768732-1-dbaryshkov@gmail.com>
References: <20201201003605.768732-1-dbaryshkov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Package firmware for new generation of Atheros WiFi cards.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../linux-firmware/linux-firmware_20201118.bb              | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20201118.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20201118.bb
index 5de7157f3a84..baac26c51053 100644
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
2.29.2

