Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09A9FC36008
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 20:29:32 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.33351.1743020966204119070
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 13:29:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ti4A8fSE;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: hiagofranco@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3014cb646ecso275868a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 13:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743020965; x=1743625765; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mMu44ASmMTqn/E9RWfWo7GOVFe5CMJUFS0SiwJySe5g=;
        b=Ti4A8fSEIvxf9XjpOIeFwiUbpRV2m4sOln2csUWOr4ohp7JJjj5rA77CHxXup+3LW9
         gspGtuuVFul0rmek0DipNd+Be8wO20qDXH+TFQbS7ge832wwphYpmhacLBybGYWHT8KP
         41OjyLkZ/2DuLlMhSVLyROKtIT55tdmpDdPKwhsx0aE3vzJ9TaTJq5bco3XswdwVYRXh
         fTuQHqKwQ4m6rp6XLdauLmiBTu0MOlYX9qIlR7uLYHynkmcSourrA1foWIPVkDocbYDc
         epn9Dg4zTVQe8ZO1OPwFXNpllM7KWnBe4u8BE3DMeZ1xW+TpMuuPqD/5RN1U5iv5m+0e
         Ex7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743020965; x=1743625765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mMu44ASmMTqn/E9RWfWo7GOVFe5CMJUFS0SiwJySe5g=;
        b=UbKLtQWGWZ5k3jUIwWIWSB4EbWlvOhNO8xaGvFwn3nKMZcsCjumbaKhd8lgUCp6uJW
         A7Ct8eTcdEQM2nFQETrjDzUFIraWjQod/D5Zhw8tZOUDOW/gDKo0Uomex3yNztvTxC13
         +NZXGFbbycWzB9I25lidx7U2SMujUTAPdcoi8gbJz//CqWVyo3DqFrcKEAP+vgbCDqZx
         v1yrCersyeY1XeaUNnCVFP48xLOmY0ehSfgpIqXfHVU72ACDls2CAO53tISYbTp0WQYo
         kJwIOF1qW5xU59pXJKi5/ffvD7YzZC2IoFBENz3hGKoY1IERAOcj5+eya3AOPVbW26dA
         LNWQ==
X-Gm-Message-State: AOJu0YxQ9JG/sPhnTT1NuYjsXQ+g1ihVic4tO9JkxDsA753uczJ3s5VD
	RFOJJ8nGsbR9H57oWozqgdm23tGMAZO2erpWDHtqOAFCR9+kFhEOjQaEaKFp
X-Gm-Gg: ASbGnctQuEzSw2o7Qk1HCJvkTAy4vWts4dZCOU9AmVOBl9Jnlo0it2N+T5t24b+rKWK
	UuAQeMN3MbMDc+Wgm8rIhbWKEU471cOW6rt24Z1zU7dmE07BVyT0QzsSc18D1RoAvb54mQ7l7Ip
	LyNsftfUqplnxpW4xCE9QzMxLDaH3FOR3V69NKPrYM2cWI365tfG/msCwaZhMTyZ69LUrXYe7dw
	cCK6+N7x5qaORIRfd8RTrI/qIxemp8XKexeQSNlayYR4zbp4IrLKHxsIas2o/p6B0DMvtLarnm9
	+eDpyLvVijDt4b2t8kjw/gY+UvORqGPefO7PugZG4E5lYuEYYCKCrqMujOVlpdUun08=
X-Google-Smtp-Source: AGHT+IFwUHW34askaC7S2t5d/JaAwlyvWsf5qwcCcPilWgvWb2cYrhbvAHl+I6YIujIGRP0rM76zPQ==
X-Received: by 2002:a17:90b:1f81:b0:2ee:af31:a7bd with SMTP id 98e67ed59e1d1-303a7c5b94fmr1502417a91.5.1743020965256;
        Wed, 26 Mar 2025 13:29:25 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f1d4b6asm661625a91.38.2025.03.26.13.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 13:29:24 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: quentin.schulz@cherry.de,
	steve@sakoman.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Dmitry Baryshkov <dbaryshkov@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [styhead][PATCH v2 08/31] linux-firmware: make ${PN}-qcom-adreno-a663 depend on -a660
Date: Wed, 26 Mar 2025 17:27:54 -0300
Message-Id: <20250326202817.64437-9-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250326202817.64437-1-hiagofranco@gmail.com>
References: <20250326202817.64437-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 20:29:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213668

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

Adreno A663 requires two files to function: one is a663_gmu.bin,
provided by the ${PN}-qcom-adreno-a663 package, another one is
a660_sqe.fw, provided by the ${PN}-qcom-adreno-a660 package.

Make the ${PN}-qcom-adreno-a663 depend on -a660, so that the platforms
requiring A663 firmware don't have to care about the details and can
simply require the A663 firmware package.

Fixes: 02dec6af254c ("linux-firmware: Add qcom-adreno-a663 package")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 26db3e9d3627d45097371e39ef5b43e479e34119)
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
index b40c33d5ada8..c99a1ea997f8 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
@@ -1543,7 +1543,7 @@ RDEPENDS:${PN}-qcom-adreno-a530 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a630 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a650 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a660 = "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-adreno-a663 = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-adreno-a663 = "${PN}-qcom-license ${PN}-qcom-adreno-a660"
 RDEPENDS:${PN}-qcom-adreno-a702 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-g750 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8016-modem = "${PN}-qcom-license"
-- 
2.39.5


