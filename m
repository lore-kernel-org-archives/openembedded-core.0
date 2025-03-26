Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17376C36011
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 20:29:42 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.33407.1743020978656813510
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 13:29:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bCfvxMxV;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: hiagofranco@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-301a4d5156aso331047a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 13:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743020978; x=1743625778; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4zlKWhRV5W51Dck93MMZeHg0zjfuI//VoO59/46yXZ8=;
        b=bCfvxMxVXTYJcZl2ccO1ZIcY+S7CdFnkb1bYTzlZF65RjFgLKrb6ADGadwcNTcCtOr
         KhWAfhhaXxG2b7NL8MnvDUxhaFyEdiS0Tdd6hRLLZalMzrt2mVqSusqlh1GwM09JSslI
         hcUTAvgMxYMNoBs7KvHtQXtuxzpPPMOgl/hA9OipA5I5LqgevtEtLu6U1fTpDfnVKVDv
         jY6Ql4h6IPX1vs4XQiMpcEJgvrR2Kv0lTf0inDVoDUcUTKBuuAoLbPFone07DZFOuGmD
         llissaduNWdEwyu1nUVC1i5IgYBwoPOHqN70NmobuL2zHhsGdSmjRsKKsphenoTvK8lH
         bZcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743020978; x=1743625778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4zlKWhRV5W51Dck93MMZeHg0zjfuI//VoO59/46yXZ8=;
        b=km1vEEfWiU+0xVemIOd7h6ko7yBP4ZzKaYSsw5uUiXOjPxFrz2BZmowJ36Bi/eOkHL
         hsCrVVVqLh8e1PXBw1jZzr8Z8pZdRVv4aeg7sVT6/902Z5EQ1Jjb/+wk6BeDvcGjc54F
         O1t7AIoRnDOZfpwFNmubvFY5KjKyrb2iuCVpWoxwmYvt17eiweshYESZ3QCU++1RCT1b
         ItagB1igL7X1YLIEK80NHXnYZVKzZ3kJuq72GuaL+QPxIXx6i/O9Vln/asLng92Ti+fN
         ebNolgKGiAp49wAmjHYc8eDfmd6XyqJBLhV/yhImesu0ZIOUfTxNA2oAeeYdQRly2Fqc
         MgCA==
X-Gm-Message-State: AOJu0YxbgzfpAvroDWgpAe3kclzyRgOQkU2fNyPN3hpc2Yp5N4yAnL8U
	GBrleSqellT5OQMoeZtP/z3kIEZixy3ukwZhfZj4IYIffPl7bybL5Byrgxeb
X-Gm-Gg: ASbGncsaa2Msljanod8FSAuFGhDr0lecO3bpjZ/7UWdzxfRnaqIj2Sj0ZCzEwqEDkff
	TIeZiAr5aEj3ezXEt2jiy7Abr+CQbcIF0uUNUHpQ2A29OhUp8G6kTT3BB8pPjBHKLOwGAYp1mgZ
	V6kvACgASpnF709p7FfcuPXRS9lhT4QUGEUN8mMkvygtwnIGhemp5H3RsTBQ+DU4mU0+EhEVxBz
	s8IyFo9WFheLC4t3mMd55kD7qbdb4DMX9fSK1gF9hKRek9G3GJ4pmSayJSBCPsCFWJokNZRDGNd
	RZocBJh/oV/jSkJ1FIVaEtaUG0GRt+uHAQ37EnNR5aq9ZaKnivPfqwBDRXHg5VpjVnA=
X-Google-Smtp-Source: AGHT+IEAVBdzcOcyRcrxwK1IMsosg+Z/14YPIQFLpqncYH69IeQKzHEJPYdHBhqJ48y2D3WY43oRRw==
X-Received: by 2002:a17:90b:5450:b0:2ff:64a0:4a58 with SMTP id 98e67ed59e1d1-303a83c3c41mr1176839a91.22.1743020977888;
        Wed, 26 Mar 2025 13:29:37 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f1d4b6asm661625a91.38.2025.03.26.13.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 13:29:37 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: quentin.schulz@cherry.de,
	steve@sakoman.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [styhead][PATCH v2 13/31] linux-firmware: package QCS615 Adreno ZAP shader
Date: Wed, 26 Mar 2025 17:27:59 -0300
Message-Id: <20250326202817.64437-14-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250326202817.64437-1-hiagofranco@gmail.com>
References: <20250326202817.64437-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 20:29:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213673

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Add a new package with the Adreno ZAP shader for the Qualcomm QCS615
platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8d36621f0a931c36045d02a006500a602b5b8865)
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20241110.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20241110.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20241110.bb
index daebdca13273..7b23f989e569 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20241110.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20241110.bb
@@ -410,6 +410,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-qcm2290-adreno ${PN}-qcom-qcm2290-audio ${PN}-qcom-qcm2290-modem \
              ${PN}-qcom-qcm6490-adreno \
              ${PN}-qcom-qcm6490-audio ${PN}-qcom-qcm6490-compute ${PN}-qcom-qcm6490-ipa \
+             ${PN}-qcom-qcs615-adreno \
              ${PN}-qcom-qrb4210-adreno \
              ${PN}-qcom-qrb4210-audio ${PN}-qcom-qrb4210-compute ${PN}-qcom-qrb4210-modem \
              ${PN}-qcom-sa8775p-adreno \
@@ -1450,6 +1451,7 @@ LICENSE:${PN}-qcom-qcm6490-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcm6490-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcm6490-compute  = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcm6490-ipa  = "Firmware-qcom"
+LICENSE:${PN}-qcom-qcs615-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-qrb4210-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-qrb4210-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-qrb4210-compute  = "Firmware-qcom"
@@ -1509,6 +1511,7 @@ FILES:${PN}-qcom-qcm6490-adreno = "${nonarch_base_libdir}/firmware/qcom/qc[ms]64
 FILES:${PN}-qcom-qcm6490-audio = "${nonarch_base_libdir}/firmware/qcom/qc[ms]6490/adsp*.* ${nonarch_base_libdir}/firmware/qcom/qc[ms]6490/battmgr.jsn"
 FILES:${PN}-qcom-qcm6490-compute = "${nonarch_base_libdir}/firmware/qcom/qc[ms]6490/cdsp*.*"
 FILES:${PN}-qcom-qcm6490-ipa = "${nonarch_base_libdir}/firmware/qcom/qcm6490/ipa_fws.mbn"
+FILES:${PN}-qcom-qcs615-adreno = "${nonarch_base_libdir}/firmware/qcom/qcs615/a612_zap.mbn*"
 FILES:${PN}-qcom-qrb4210-adreno = "${nonarch_base_libdir}/firmware/qcom/qrb4210/a610_zap.mbn*"
 FILES:${PN}-qcom-qrb4210-audio = "${nonarch_base_libdir}/firmware/qcom/qrb4210/adsp*.*"
 FILES:${PN}-qcom-qrb4210-compute = "${nonarch_base_libdir}/firmware/qcom/qrb4210/cdsp*.*"
@@ -1567,6 +1570,7 @@ RPROVIDES:${PN}-qcom-qcm6490-audio = "${PN}-qcom-qcs6490-audio"
 RDEPENDS:${PN}-qcom-qcm6490-compute = "${PN}-qcom-license"
 RPROVIDES:${PN}-qcom-qcm6490-compute = "${PN}-qcom-qcs6490-compute"
 RDEPENDS:${PN}-qcom-qcm6490-ipa = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-qcs615-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qrb4210-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qrb4210-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qrb4210-compute = "${PN}-qcom-license"
-- 
2.39.5


