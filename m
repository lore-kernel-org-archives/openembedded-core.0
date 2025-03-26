Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8B51C36008
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 20:29:21 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.33387.1743020953768278262
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 13:29:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PSk5is71;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: hiagofranco@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3018e2d042bso226429a91.2
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 13:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743020953; x=1743625753; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H0f6NyIuvjhV5Tq1TpH//9KjHpM+2QTBWlRzCXtxooY=;
        b=PSk5is717ySrW7VkuZfqoR7nVjVnEhcPnz/LCtgi8fmcwAiTX3C00S2moTacJ7KWN7
         wQKXBG9R+H36HikkeW0b/LQD3/9m9ztnnNrABk8g+v8a57VBGlXYbpGv+oMfVt+7jOwu
         0z/i7KojKo3gej7CkZua4xM6nq4kVUklaJDl8Jtp8KucG1QcXpupQGT/5DCNmb1GsVzk
         FU8+ePAV2MdGKNGOf+RkvUE6vMQ3hU+bwFH0pDDtrcWh8P1e6gmps6DNAY/mvEs+04K/
         p4Tgc19h6ZJDgWz7GEo7sjwQKu6Bs6pZ2Hh+ytDutLD8eWcjlodIlULJcGe8tfrxPB1F
         nHJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743020953; x=1743625753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H0f6NyIuvjhV5Tq1TpH//9KjHpM+2QTBWlRzCXtxooY=;
        b=UZ+bvBeXFucjlQOZ77N55/GM+VPXPR/nj/zmjBp4kJtIzfELrqXGtC/16VeS2h5W/X
         ruTTvX4E/ZY/TgcVBef0Ir/DVldOkHkW54lXYpRJDR2VMt3z/0iVMs7jg4H4lLfaMbKk
         coHynwNZQCIRkdiLnhjUZEIUPbnpa97xmVp2whAs7jMEsMYLTGwENZ1E2NH1ush06UIj
         +dirtA3k8uajzAHIjVe8fIhrx8FlvaBa69CFXSw6ylbsjXxWSIAVjpeFuE6CiGuVW13U
         rVzEDbjpZx5SIwe0aUL/SaPGx3FXBr59k91GnIgHR/yDuKNXH/1se0cm+sHM+1BjFh4U
         O9Tw==
X-Gm-Message-State: AOJu0Ywmo/Tgmjjw9KY4zQJcWpFOIgkxnfmHviQJr1aVi+UYtHExBufH
	19vrsDD+tody3lyG3P56XXgazuBZkItizVPoAxNHAGD6cPTwJW5EPR6iW/78
X-Gm-Gg: ASbGncsqyawo0h0i9/r+kj2nte3Cp3rC5dDwfShKrbs4KTbiBsMwDOhkOJiHr3p6QiI
	SrIFMhuHiwW5P/FAMdey0nFSZj0/DQp15UdurbMMgHy134swEVb/vYbIrQntHfQyrBRNINS+vJL
	0JSD1wOrdmt/9S1SsoLPzPKGZ2fl4j8Zpv9bOCNKe2tn6sTZyufsZIZojSvehYL1nREwhf3TtJD
	krHjZDGnzy46PjyU7pARAcltvABtEuVdN/Hj8BrzGMlkqOtsIleT83ir9HOl6BP+CYjOyqXPPS7
	zhkTkjC2DzkVVMVWIyWlIVybFHTl28e8TWMwd0uJvxPOj9rcRbpZPq5W9a3Aoy1vF3A=
X-Google-Smtp-Source: AGHT+IFiASrCGuPVfsFkMYlGigITfwHlBZp62FNn9eXvco+RbglgXGkchgGpyL5UlgzY0mobWjx6Fg==
X-Received: by 2002:a17:90b:5242:b0:2fa:228d:5af2 with SMTP id 98e67ed59e1d1-303a7f65133mr1630583a91.15.1743020953030;
        Wed, 26 Mar 2025 13:29:13 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f1d4b6asm661625a91.38.2025.03.26.13.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 13:29:12 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: quentin.schulz@cherry.de,
	steve@sakoman.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Vivek Puar <quic_vpuar@quicinc.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [styhead][PATCH v2 03/31] linux-firmware: Add qcom-qcm6490-{audio,compute} firmware packages
Date: Wed, 26 Mar 2025 17:27:49 -0300
Message-Id: <20250326202817.64437-4-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250326202817.64437-1-hiagofranco@gmail.com>
References: <20250326202817.64437-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 20:29:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213663

From: Vivek Puar <quic_vpuar@quicinc.com>

linux-firmware-qcom-qcm6490-{audio,compute} contains
ADSP and CDSP firmware for qcom QCM6490 variant

Signed-off-by: Vivek Puar <quic_vpuar@quicinc.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1d421fa263bc6f13702dc66d146256de1565d4c2)
---
 .../linux-firmware/linux-firmware_20241017.bb          | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
index d18e7414dbc6..60d24efca44b 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
@@ -408,8 +408,8 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-apq8016-modem ${PN}-qcom-apq8016-wifi \
              ${PN}-qcom-apq8096-adreno ${PN}-qcom-apq8096-audio ${PN}-qcom-apq8096-modem \
              ${PN}-qcom-qcm2290-adreno ${PN}-qcom-qcm2290-audio ${PN}-qcom-qcm2290-modem \
-             ${PN}-qcom-qrb4210-adreno ${PN}-qcom-qrb4210-audio ${PN}-qcom-qrb4210-compute \
-             ${PN}-qcom-qrb4210-modem \
+             ${PN}-qcom-qcm6490-audio ${PN}-qcom-qcm6490-compute ${PN}-qcom-qrb4210-adreno \
+             ${PN}-qcom-qrb4210-audio ${PN}-qcom-qrb4210-compute ${PN}-qcom-qrb4210-modem \
              ${PN}-qcom-sc8280xp-lenovo-x13s-compat \
              ${PN}-qcom-sc8280xp-lenovo-x13s-audio \
              ${PN}-qcom-sc8280xp-lenovo-x13s-adreno \
@@ -1442,6 +1442,8 @@ LICENSE:${PN}-qcom-qcm2290-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcm2290-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcm2290-modem = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcm2290-wifi = "Firmware-qcom"
+LICENSE:${PN}-qcom-qcm6490-audio = "Firmware-qcom"
+LICENSE:${PN}-qcom-qcm6490-compute  = "Firmware-qcom"
 LICENSE:${PN}-qcom-qrb4210-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-qrb4210-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-qrb4210-compute  = "Firmware-qcom"
@@ -1494,6 +1496,8 @@ FILES:${PN}-qcom-qcm2290-adreno = "${nonarch_base_libdir}/firmware/qcom/qcm2290/
 FILES:${PN}-qcom-qcm2290-audio = "${nonarch_base_libdir}/firmware/qcom/qcm2290/adsp*.*"
 FILES:${PN}-qcom-qcm2290-modem = "${nonarch_base_libdir}/firmware/qcom/qcm2290/modem*.*"
 FILES:${PN}-qcom-qcm2290-wifi = "${nonarch_base_libdir}/firmware/qcom/qcm2290/wlanmdsp.mbn* ${nonarch_base_libdir}/firmware/ath10k/WCN3990/hw1.0/qcm2290/*"
+FILES:${PN}-qcom-qcm6490-audio = "${nonarch_base_libdir}/firmware/qcom/qcm6490/adsp*.*"
+FILES:${PN}-qcom-qcm6490-compute = "${nonarch_base_libdir}/firmware/qcom/qcm6490/cdsp*.*"
 FILES:${PN}-qcom-qrb4210-adreno = "${nonarch_base_libdir}/firmware/qcom/qrb4210/a610_zap.mbn*"
 FILES:${PN}-qcom-qrb4210-audio = "${nonarch_base_libdir}/firmware/qcom/qrb4210/adsp*.*"
 FILES:${PN}-qcom-qrb4210-compute = "${nonarch_base_libdir}/firmware/qcom/qrb4210/cdsp*.*"
@@ -1542,6 +1546,8 @@ RDEPENDS:${PN}-qcom-qcm2290-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcm2290-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcm2290-modem = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcm2290-wifi = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-qcm6490-audio = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-qcm6490-compute = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qrb4210-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qrb4210-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qrb4210-compute = "${PN}-qcom-license"
-- 
2.39.5


