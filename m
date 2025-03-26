Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 056F7C36011
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 20:29:22 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.33348.1743020961397916246
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 13:29:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cg/oBtck;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: hiagofranco@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-223fb0f619dso6686805ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 13:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743020960; x=1743625760; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qAJFo2CgrMzcq4U/sdV9LdPnFbp7uOyerdqPVJKWUNc=;
        b=cg/oBtckfWb8qpbDATOiee4+zzR4C6ZIhrWaUKcdTx6Hhp5KCmjXLYefEE7vT5bCFC
         pVn3+oJQRHaRGO+u16PzS8bo2o5gJ3THwhgvAfrRmWd+LsMuyZ0Npvh5zr68agrPGk4M
         BEtGW6E2gkm/HMDTUqpxIhX6+MnmkD4DIlRoEQnansFh1pAb/A2duWsWrVkJxmOujly6
         3YM3vG4QsbL+6c9Kks3qX//ufEgnKtdAUgIx04tJ6gEfwjdFDd1/RMFPhCkTMkx1dHxn
         8ypcU6Hu8X79lpuy7juDElsIhIBXnwvzu1bsiJ1i0hiQ1QEiIed/YKJpN0SOwj3E+/xe
         M/NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743020960; x=1743625760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qAJFo2CgrMzcq4U/sdV9LdPnFbp7uOyerdqPVJKWUNc=;
        b=SXe7shvDWTulykRQg7nJkhmeziX9IyFXRsXwLWSca6/2n40Kx406Vm3OOo9te+0n7D
         /Hgqvd8UBWltZE+sNjMOgBTZy5I5iP9SvhpAfPgpSS6jYUe143AaTN0J/l4oN/LXPkYA
         6tBo8XXk1pi1epNNYj1AZb+NXCO3jWI8sFFemY2Xuh4LAiMHkmY914zMtLb0MoCIHXQf
         7d1gJBaKm7pAs8Pjw+gUytslnL5Zm9jv/SXGrhmDs9aDrPYT4pqg8k3J0wOAbosdYqyA
         hsgRW1lFnAK4xSsgpp6HSuz6HkS7e3uza5AklNiiB6inBt5TFRwvp+P8YNCpJvignpfW
         WEqw==
X-Gm-Message-State: AOJu0YxqqY1vIAb2YtXfB+AReWps/iZSEo5unREUgOYRwhTz8Up0Xcsn
	PEurJQNuwR5Ng16fZ5RdyoF9BOBk9A1lMp9qFruE9UYnMFBL+sz5dVOH1eRJ
X-Gm-Gg: ASbGncs8AZkh92fF79OcxOL8962tsFQ4VPlnihnG+cu34k0w0vMP+2iwQrjwqcLgkc+
	OF6jhgfLQ/v9Oztn3iMl0KLnOc2qEDJAIjQFkyQQthvPYBlT3XY8FI3irKxXLo45XCZbq+49bTW
	H73jEZ+/hR/8gvHmcPTD7VOnyrInQ5eZyACgd8ZuU/SEZCi4V6RXzx5157RtiAf885zHcJe4n85
	Q0hQsJpXhKxx4kDCuyAw6X++IXlXN1JrqWWZ/DoewbpSv2yINVA4eeyKfZHwByPvfUIPUiovtI5
	XXA/vAXU+DWM/GDwFOsPvtGFZWxLT+EjDfKgZ7tEhgW4lwQbyNSUJ0Y4LmRi5Fvu4n0=
X-Google-Smtp-Source: AGHT+IEZiXcz0YsaKEAeixuP+RHALGLOUFuwmKiXDsHw5HSs3R/LnSZn6aJuwTXw9m2/joDxV1kz5A==
X-Received: by 2002:a17:90b:2d46:b0:2fe:99cf:f579 with SMTP id 98e67ed59e1d1-303a7b59fa7mr1415627a91.4.1743020960447;
        Wed, 26 Mar 2025 13:29:20 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f1d4b6asm661625a91.38.2025.03.26.13.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 13:29:19 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: quentin.schulz@cherry.de,
	steve@sakoman.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Dmitry Baryshkov <dbaryshkov@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [styhead][PATCH v2 06/31] linux-firmware: split qcm6490 ZAP shader to separate package
Date: Wed, 26 Mar 2025 17:27:52 -0300
Message-Id: <20250326202817.64437-7-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250326202817.64437-1-hiagofranco@gmail.com>
References: <20250326202817.64437-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 20:29:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213666

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

Adreno zap.mbn files are platform-specific. As such they shouldn't be a
part of the generic ${PN}-qcom-adreno-aNNN packages. Move it to the
${PN}-qcom-qcm6490-adreno package.

Fixes: 6026fdda9021 ("linux-firmware: add new fw file to ${PN}-qcom-adreno-a660")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit af95f7e3d9db9b8a1b2f503f6c6ff14bebaeb583)
---
 .../linux-firmware/linux-firmware_20241017.bb               | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
index d75a587db931..957452947d5e 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
@@ -408,6 +408,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-apq8016-modem ${PN}-qcom-apq8016-wifi \
              ${PN}-qcom-apq8096-adreno ${PN}-qcom-apq8096-audio ${PN}-qcom-apq8096-modem \
              ${PN}-qcom-qcm2290-adreno ${PN}-qcom-qcm2290-audio ${PN}-qcom-qcm2290-modem \
+             ${PN}-qcom-qcm6490-adreno \
              ${PN}-qcom-qcm6490-audio ${PN}-qcom-qcm6490-compute ${PN}-qcom-qrb4210-adreno \
              ${PN}-qcom-qrb4210-audio ${PN}-qcom-qrb4210-compute ${PN}-qcom-qrb4210-modem \
              ${PN}-qcom-sc8280xp-lenovo-x13s-compat \
@@ -1443,6 +1444,7 @@ LICENSE:${PN}-qcom-qcm2290-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcm2290-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcm2290-modem = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcm2290-wifi = "Firmware-qcom"
+LICENSE:${PN}-qcom-qcm6490-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcm6490-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcm6490-compute  = "Firmware-qcom"
 LICENSE:${PN}-qcom-qrb4210-adreno = "Firmware-qcom"
@@ -1485,7 +1487,7 @@ FILES:${PN}-qcom-adreno-a4xx = "${nonarch_base_libdir}/firmware/qcom/a4*_*.fw*"
 FILES:${PN}-qcom-adreno-a530 = "${nonarch_base_libdir}/firmware/qcom/a530*.fw*"
 FILES:${PN}-qcom-adreno-a630 = "${nonarch_base_libdir}/firmware/qcom/a630*.*"
 FILES:${PN}-qcom-adreno-a650 = "${nonarch_base_libdir}/firmware/qcom/a650*.*"
-FILES:${PN}-qcom-adreno-a660 = "${nonarch_base_libdir}/firmware/qcom/a660*.* ${nonarch_base_libdir}/firmware/qcom/qcm6490/a660_zap.mbn*"
+FILES:${PN}-qcom-adreno-a660 = "${nonarch_base_libdir}/firmware/qcom/a660*.*"
 FILES:${PN}-qcom-adreno-a663 = "${nonarch_base_libdir}/firmware/qcom/a663*.* ${nonarch_base_libdir}/firmware/qcom/sa8775p/a663_zap.mbn*"
 FILES:${PN}-qcom-adreno-a702 = "${nonarch_base_libdir}/firmware/qcom/a702*.*"
 FILES:${PN}-qcom-adreno-g750 = "${nonarch_base_libdir}/firmware/qcom/gen70500_*.*"
@@ -1498,6 +1500,7 @@ FILES:${PN}-qcom-qcm2290-adreno = "${nonarch_base_libdir}/firmware/qcom/qcm2290/
 FILES:${PN}-qcom-qcm2290-audio = "${nonarch_base_libdir}/firmware/qcom/qcm2290/adsp*.*"
 FILES:${PN}-qcom-qcm2290-modem = "${nonarch_base_libdir}/firmware/qcom/qcm2290/modem*.*"
 FILES:${PN}-qcom-qcm2290-wifi = "${nonarch_base_libdir}/firmware/qcom/qcm2290/wlanmdsp.mbn* ${nonarch_base_libdir}/firmware/ath10k/WCN3990/hw1.0/qcm2290/*"
+FILES:${PN}-qcom-qcm6490-adreno = "${nonarch_base_libdir}/firmware/qcom/qcm6490/a660_zap.mbn*"
 FILES:${PN}-qcom-qcm6490-audio = "${nonarch_base_libdir}/firmware/qcom/qcm6490/adsp*.* ${nonarch_base_libdir}/firmware/qcom/qcm6490/battmgr.jsn"
 FILES:${PN}-qcom-qcm6490-compute = "${nonarch_base_libdir}/firmware/qcom/qcm6490/cdsp*.*"
 FILES:${PN}-qcom-qrb4210-adreno = "${nonarch_base_libdir}/firmware/qcom/qrb4210/a610_zap.mbn*"
@@ -1549,6 +1552,7 @@ RDEPENDS:${PN}-qcom-qcm2290-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcm2290-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcm2290-modem = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcm2290-wifi = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-qcm6490-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcm6490-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcm6490-compute = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qrb4210-adreno = "${PN}-qcom-license"
-- 
2.39.5


