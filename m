Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B4E0C87FCF
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 05:04:19 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.93594.1755061458029474055
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Aug 2025 22:04:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fGGoKWC4;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-76bd050184bso7928974b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Aug 2025 22:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755061457; x=1755666257; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lMh+HBmo3fwSagMxxuf5eEtJTNECgjv32zq4s0F94lI=;
        b=fGGoKWC4/24Owl1WNvhMW7vOXIDcDtKLhAgCjInYGQ9eFvJQyX9qz0iGOOB8bIe4VB
         pyU7ka6paHxD/BUuwEBkK/i43Pct3wWhigwP2ucoSOlPMX6XXG4RXGZLF/qhQhehJjih
         +fd9xv3cGRO5VGjspyMCXuDbFeR2IqwpXH6a/Y92aEQwlBsxh9LAIW0x9krFHx8SORmM
         5z98uU8BdksZGBNni+1ephpwZHEfSn6qzmAWA+RmKvwaEuQ+NJV6/6Q370Xk6VFz+nYG
         v68uvrWKfzy+IZyZMmRfBMx1XkICzVqPCeLgbbDivUJ6DOHF8j9W/S/A6KffpP3a8asp
         QINQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755061457; x=1755666257;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lMh+HBmo3fwSagMxxuf5eEtJTNECgjv32zq4s0F94lI=;
        b=G+e9dwm9liSK8+5tY4NjdhXJRqe+bOq4DVXQ+4bgX7aRy0eMbzZTyVij0woW2bkLse
         O5rZv3sqan/9NdDZbdsFD4EztuEO2Y8QIs3k4L2RlqvUrInBA6G4T3tT4HQ1BTT7Cvz6
         2joGilkFLt/ITV6mBKfAnv7vGkLciI5Yaj/pq9yNtMlP+nJLo1/9HBqIt9UM/RFktAgI
         BQIV+x3i0XunOVF5PV+FbTaA+MBdS3Y9Kh8HK2zV8n9sxktOSlUuJG7HvBixSrmJ/c6V
         aP15SjtQioK01ieolscuEuF/qQKgFruK32Op8sz/Cq4ZhSpyC8mpS6OAJnQiKfKo+Wsr
         aWSg==
X-Gm-Message-State: AOJu0Yymt3rNUEhW1WWHR03GBe6uFDmawGiexAwzYKQDDVnqsxWZ57jc
	tBkyFEGjVfKLMQsOagOcGcurKn2AukuJD0dxJso1SNyRS3aDfVT8OFJkbWzZ/wuPVqc=
X-Gm-Gg: ASbGncu8sWh4d7lY0Km9Spxr35Hb94QUdS6+GJmCYvlm7/sSKcgfu7rPg7h2lduRqkJ
	0icoK2l/Jt1BfNZulAc8K7IzMy6GJ+dTfW1iasAswyJHZNLh3n4Fv3XSlRZWcO3hBw56PB9DD41
	0l8khrWzBCfTtc/bwgtSOzAfUAa4DfMLByV/BI87snhNTSp8n1PgiKZqvmo/JpSdLjvvlpw7kra
	z6io5TEqHOGqZuwF1XKGrC6e/IDy7TQD+O+cmmek8RPuCtNJwsA97+wktDenThTip8+BXJxa9QK
	hjv2VCHEIih4UpYckIgWqcq7dyOe3VjVg0YLKwj8Thn+XwLpeTAjlWL2HXJFbnwL5VLWBVh4nbi
	9CgsHMF9n3cPAbx7r+mY4
X-Google-Smtp-Source: AGHT+IHuCZcDBGd4vY/9w/YmdHpgFYELa+edEgCxUiHG2ryPYchYp1I+tP8ABcKUuPkyf72Qjq1PJw==
X-Received: by 2002:a05:6a20:3945:b0:240:1c56:6495 with SMTP id adf61e73a8af0-240a8a439b9mr3054442637.14.1755061457015;
        Tue, 12 Aug 2025 22:04:17 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce8b59esm30569826b3a.37.2025.08.12.22.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 22:04:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Jon Mason <jon.mason@arm.com>
Subject: [PATCH] tune-cortexa72: Add nocrypto tune variant
Date: Tue, 12 Aug 2025 22:04:13 -0700
Message-ID: <20250813050413.3087814-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 05:04:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221786

crypto is optional on cortexa72 and some SOCs e.g. BCM2711 (RPI4-fame)
do take that option to exclude it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Jon Mason <jon.mason@arm.com>
---
 meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
index cbb6418c069..4a516135bab 100644
--- a/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
+++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
@@ -6,13 +6,17 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa72', ' -mcpu=corte
 require conf/machine/include/arm/arch-armv8a.inc
 
 # Little Endian base configs
-AVAILTUNES += "cortexa72 cortexa72-crypto"
+AVAILTUNES += "cortexa72 cortexa72-crypto cortexa72-nocrypto"
 ARMPKGARCH:tune-cortexa72             = "cortexa72"
 ARMPKGARCH:tune-cortexa72-crypto      = "cortexa72"
+ARMPKGARCH:tune-cortexa72-nocrypto    = "cortexa72"
 # We do not want -march since -mcpu is added above to cover for it
 TUNE_FEATURES:tune-cortexa72          = "aarch64 crc cortexa72"
 TUNE_FEATURES:tune-cortexa72-crypto   = "${TUNE_FEATURES:tune-cortexa72} crypto"
+TUNE_FEATURES:tune-cortexa72-nocrypto = "${TUNE_FEATURES:tune-cortexa72} nocrypto"
 PACKAGE_EXTRA_ARCHS:tune-cortexa72        = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc} cortexa72"
 PACKAGE_EXTRA_ARCHS:tune-cortexa72-crypto = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} cortexa72 cortexa72-crypto"
+PACKAGE_EXTRA_ARCHS:tune-cortexa72-nocrypto = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc} cortexa72 cortexa72-nocrypto"
 BASE_LIB:tune-cortexa72            = "lib64"
 BASE_LIB:tune-cortexa72-crypto     = "lib64"
+BASE_LIB:tune-cortexa72-nocrypto   = "lib64"

