Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.9675.1590077755122798486
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2020 09:15:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RnrB0V5u;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id m7so3017544plt.5
        for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2020 09:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fxoJRwcNo21wc+UHXBU219f0uH0gKggTskzTI3WcMsQ=;
        b=RnrB0V5uXoDznO92aQijvMhxmQVh1AsruxeRht1mYcoVg10ihA/8jf2P4+Q2LkzaPA
         4uK/KgcKr3nTwvusoCDmXV9nqIH+wZD5901z5dIKGdRUrOongFZIMvl9j7pN8ef/rEb/
         bWvFhYxGiwrA4SaNlD00q79CRuM2s/FXwMddlL++N2x7c4QPF2pq93W3G11XYrAHxuzz
         J5BqOJAea5jzsJ/ctlYmg6mqdCL6IqDEnfbXYXDzYw6aYtWyo4ZWQITrA92ifYmE8RXd
         gkyaArkwwbLGN0ghopqRU1PAh1JyQ27uBgM670pk7GOpMbrhgWFziUpTYYKAMhQK5hkt
         ZtJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fxoJRwcNo21wc+UHXBU219f0uH0gKggTskzTI3WcMsQ=;
        b=U8XqWrG/Gz3ge+THG/+tmYBmtp0i4ecVOxb0nUC/WrB6UKP+vkwYAyby6++WGPKkgT
         whShLn9L+YXaTgE5mz3HRPslbz/KKQLirX83G0Tj0lBrL2UwN5TTTf4cZLM3JgK6jH/M
         q6lrwV91kw1UBSqpIiA9mZbByO33awHZ91h1whZpWvJ/daQDWctwP7he34fV42nPfInv
         CmrgLdYLItFX8blataBHuKI8chox7ZB8SUH2lb8tNFH0Zakv4WorYijZSWNg8S7XWP0g
         DxVMMusAW/uFFtxTV1FMMRjjJuY6yD0HUjxEMkjVLhQy0cBj1b601/Tl9PFYgYLr8WHj
         Z8Dw==
X-Gm-Message-State: AOAM531aQUWuDnzoSqFxkIIeMmnLPahpxpn7MwFlc0j0Ksh0wTwJl/up
	xf3GwT2CwPBmeSFcHpyhT4DM9dSmxWI=
X-Google-Smtp-Source: ABdhPJxAjpRZWCYTj2vCmRbLx9a8XtsFDLetGaYj3xYkHpZzAdYt1TKMhwzxo992Po7vkcDCboN+FQ==
X-Received: by 2002:a17:90b:315:: with SMTP id ay21mr11186635pjb.134.1590077754313;
        Thu, 21 May 2020 09:15:54 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e62a])
        by smtp.gmail.com with ESMTPSA id r24sm3636427pgm.25.2020.05.21.09.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 09:15:53 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][ 05/10] tune-cortexa55.inc: crc and crypto extentions are default on cortex-a55
Date: Thu, 21 May 2020 09:15:38 -0700
Message-Id: <20200521161543.3273063-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200521161543.3273063-1-raj.khem@gmail.com>
References: <20200521161543.3273063-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/machine/include/tune-cortexa55.inc | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/meta/conf/machine/include/tune-cortexa55.inc b/meta/conf/machine/include/tune-cortexa55.inc
index 8242cc9cef..89032b59ec 100644
--- a/meta/conf/machine/include/tune-cortexa55.inc
+++ b/meta/conf/machine/include/tune-cortexa55.inc
@@ -6,12 +6,8 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa55', ' -mcpu=corte
 require conf/machine/include/arm/arch-armv8a.inc
 
 # Little Endian base configs
-AVAILTUNES += "cortexa55 cortexa55-crypto"
+AVAILTUNES += "cortexa55"
 ARMPKGARCH_tune-cortexa55             = "cortexa55"
-ARMPKGARCH_tune-cortexa55-crypto      = "cortexa55"
-TUNE_FEATURES_tune-cortexa55          = "aarch64 cortexa55 crc"
-TUNE_FEATURES_tune-cortexa55-crypto   = "aarch64 cortexa55 crc crypto"
-PACKAGE_EXTRA_ARCHS_tune-cortexa55             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa55"
-PACKAGE_EXTRA_ARCHS_tune-cortexa55-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa55 cortexa55-crypto"
+TUNE_FEATURES_tune-cortexa55          = "aarch64 cortexa55 crc crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa55    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa55"
 BASE_LIB_tune-cortexa55               = "lib64"
-BASE_LIB_tune-cortexa55-crypto        = "lib64"
-- 
2.26.2

