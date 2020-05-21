Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web12.9564.1590077756290198309
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2020 09:15:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=H5X57/g7;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id v63so3531311pfb.10
        for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2020 09:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nCyXUfgSP3Cr+D7ALAMKVhHsB/4tQgtEEKXefSVKEbE=;
        b=H5X57/g77zTkpcG3vsOaLp+PPAxgcOvtUUSBtYnmDXTupKMa3Jc7NoDbdxk+ygftvu
         aCnoQ93oCoxkWkvFIDXwssnw1/fM4R0XpYELiG6ZwOdSFg8FKsZgOOp55lpp5flHI7lV
         0jF/Oz7F3Tz9I7qB1qaZm0OCZnBsNrjxilP8tdyUmMdtxu6IFHkir7ebU/idrCAwIlLc
         yMed0veRVrTG9P6U1NUC2KgS5UuYzKcT22IV8e3Ye/fxa6ZrXYmjcYuQkqdK11TLvGlE
         hZSX9j7+d8oDL8C3uSxRFdf9oCcK1n8Ixy45HlLsnUc7IvwGHGmwAmMEy63Y0a+U3xOZ
         vwqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nCyXUfgSP3Cr+D7ALAMKVhHsB/4tQgtEEKXefSVKEbE=;
        b=Z6vZiTqbVx0UoYOD3YwaVW7ZboGPNAueFT75UOq68i+PSsA2JaPUzfjGw0pgfjl0c3
         9cfcPGJFCAgaNfhsFEkpE0X7HZe3bYdSw37wy7kRTmhmtgAQzi43GesqcwnH5slvk+K2
         qxwNK+VEmjP+41V5UDjFUjyj83oGK0cXkxriDO/wr0bfYHvSa7Y3bka0+AL/3LdZPQ7b
         4xRut6A0cumIQ/jtjuhyAGv0Kk5U1OmGcIiW8TNFzy0qYF14zuTO40diR79COFtA2JS8
         QfahXxBjW3U32lf7Byh4eJoNOyz0tZDtJxpoWgwT6AVeP8UG+WgGUggT6Sod4KMWlMcK
         x6HQ==
X-Gm-Message-State: AOAM533/1lgO5iO5L6MepuEdBBMQajRuDu7JMNxJw5upPAB9dD+6ogxh
	PJvSp8lyHPxbpGJhKI/3v3Tn51A7ZAg=
X-Google-Smtp-Source: ABdhPJx5FLwuhQ4ShvIzc6yL0e1lJbgulW96n6FAygeSXs8p/ZynUap30nbsMfMYlXw5yewTS/TPCw==
X-Received: by 2002:a63:f610:: with SMTP id m16mr9419844pgh.174.1590077755372;
        Thu, 21 May 2020 09:15:55 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e62a])
        by smtp.gmail.com with ESMTPSA id r24sm3636427pgm.25.2020.05.21.09.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 09:15:54 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][ 06/10] tune-cortexa57.inc: Add new tune file
Date: Thu, 21 May 2020 09:15:39 -0700
Message-Id: <20200521161543.3273063-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200521161543.3273063-1-raj.khem@gmail.com>
References: <20200521161543.3273063-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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

