Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
 by mx.groups.io with SMTP id smtpd.web11.6604.1589432607461771969
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2020 22:03:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ht0MV9iA;
 spf=pass (domain: gmail.com, ip: 209.85.216.68, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f68.google.com with SMTP id t9so12067589pjw.0
        for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2020 22:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Jtr/meYlJPE7ZZC9PJKhg5qy1LfBSVpIRovIDUAjIjQ=;
        b=Ht0MV9iABnYRVe4cmQI3RFp8sRbUzP2hMG3hz/jeh8MkbSyeoCaGrP0YwlkkYtIN0h
         wAHHO1Ltq4U9Ac24f8w1CIjOwVd4I/uJSTHA9mJqxQilZlMPF/3yZ1rzLZutv4isPubN
         HRo6akInOtawyhZ2LB3x7b7GwENipMBKm2l3Tox7J9ikWU5swH+aNYtNXQEQcZSzh2cv
         lpGQDbHqSXDPn+3K8sL+xdtpU+vLmiQRa1GrK9dHUdx/PL+T0fzsBD0139D4LMXAfst1
         M8GDEAhGjQoy1N4T75b3YHHyO29abld1UaEik129oMdIRewJuPnkQZ+gsERRuiwH6vA0
         Os+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Jtr/meYlJPE7ZZC9PJKhg5qy1LfBSVpIRovIDUAjIjQ=;
        b=uivDb/tUgLPrF4wLLrSvpo+v/wCTz71Ukf8nipcA2ffLPP2apg8frjPBneryf2ja+e
         ykRgItK7x/g8pjMUwKLLdpbvmG+hEXQpzmq7BPLKIKT//L2LgFrvwB3sSmrGMGlg+gfv
         mW/bJKjCAjAnCdAwANfgFkIIpTslio5f1Ti4A2hCdrsNZzMg3hhvK6JpYe71nNhmmQrm
         iQOg7snN75EZLaOhCIBVyJTiHLpP6E79jEzjd8w6yfoV7v2tCXDlPNeIWUbh1+sUT5rK
         RuTxVMTtGrBP58iV26nVrKJ4WvgIpUczW8PQXa0IEu5cAZ6rdCaW3KMC3GtOGIgabgUS
         0yig==
X-Gm-Message-State: AGi0PuabObYDT4zPth0U918HuDCu5rqibQTLQhoGD7hiuKQaOTCEX0R0
	BUCjW2YznUJqX2MqU1+s8HOg8tm2pBE=
X-Google-Smtp-Source: APiQypIdWdANbNLqS/6o7D0a4ls+O1ql9RqWCzKAMbVBax79TGLtnhaZ6q49Z8jdkS38sC3T0Agb1A==
X-Received: by 2002:a17:90a:2ac2:: with SMTP id i2mr38054006pjg.91.1589432606735;
        Wed, 13 May 2020 22:03:26 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net (c-73-63-224-124.hsd1.ca.comcast.net. [73.63.224.124])
        by smtp.gmail.com with ESMTPSA id z7sm1067649pff.47.2020.05.13.22.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 22:03:26 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/6] tune-cortexa57.inc: Add new tune file
Date: Wed, 13 May 2020 22:03:17 -0700
Message-Id: <20200514050321.1292228-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200514050321.1292228-1-raj.khem@gmail.com>
References: <20200514050321.1292228-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/tune-cortexa57.inc | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-cortexa57.inc

diff --git a/meta/conf/machine/include/tune-cortexa57.inc b/meta/conf/machine/include/tune-cortexa57.inc
new file mode 100644
index 0000000000..645a5a7ef6
--- /dev/null
+++ b/meta/conf/machine/include/tune-cortexa57.inc
@@ -0,0 +1,17 @@
+DEFAULTTUNE ?= "cortexa57"
+
+TUNEVALID[cortexa57] = "Enable Cortex-A57 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa57', ' -mcpu=cortex-a57', '', d)}"
+
+require conf/machine/include/arm/arch-armv8a.inc
+
+# Little Endian base configs
+AVAILTUNES += "cortexa57 cortexa57-crypto"
+ARMPKGARCH_tune-cortexa57             = "cortexa57"
+ARMPKGARCH_tune-cortexa57-crypto      = "cortexa57"
+TUNE_FEATURES_tune-cortexa57          = "aarch64 cortexa57 crc"
+TUNE_FEATURES_tune-cortexa57-crypto   = "aarch64 cortexa57 crc crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa57             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa57"
+PACKAGE_EXTRA_ARCHS_tune-cortexa57-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa57 cortexa57-crypto"
+BASE_LIB_tune-cortexa57               = "lib64"
+BASE_LIB_tune-cortexa57-crypto        = "lib64"
-- 
2.26.2

