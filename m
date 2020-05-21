Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
 by mx.groups.io with SMTP id smtpd.web12.9568.1590077758796820149
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2020 09:15:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JmkXKIVZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f195.google.com with SMTP id 23so3531114pfy.8
        for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2020 09:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ODxMj+M+YxMFL/7oaDtQRhJI66eJGuiNMoxYg4T+sUU=;
        b=JmkXKIVZzcvgH/rpywsDN49VKiagNp+tLhdgdeV0sx2Mbq7rFFI30IM0auFecQFtTf
         NXXLyG2NGL0o7d0BaikhpHioI1H/oeaJriyAhzuVXYNAhhxzhTJXePuKYexYxRwWBc7B
         8VZHOnbVuqRtoZmeFhdAKm9flpgUmaiskDevIpgpzOujCmQ+qD5jLmDGCiY85ejO9hNc
         Y954+LckNGCPaW7DAUM0pRC7Ej0vgiqviJIK8UNv/HSSL3uJz7S7wwJVEqwDL/sgQZ0r
         KFXYkJ0/fY5MpRzvZq5aUeZVbiJVN6CMewhF9n7zWf7bTUGDfk3wITKozP9XvWTLFCSe
         w/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ODxMj+M+YxMFL/7oaDtQRhJI66eJGuiNMoxYg4T+sUU=;
        b=qQ0cfxccJDTZlNsleI9QD1ChtE24V77BuER2a/pe55NXUx5Ms2OjhEDTB3giqKHvAS
         pGPLHq8gtn1GSZLEUE6PfAAHNxz9WQ6BvJL4759N/CBOeNN+DtFoGkbfVYPXxqgvmtT+
         dmJywd2623cVNsSJLdmYBjaGjisZna3hthgWbd9cvORhgobZk4W8ZYxMP2Gzs3CpYP3L
         NJsH93tBoyH1zJuKUjEQ5rcuvpQMc5vVJgGVsHhp8/mV5EmQlmcgoKNbMDAR0wAxcxeg
         fM8qNtdrIJX1RpYw8hW4RoT22KN1x8OYayEpAjAnp0m46sX6UUAVn+qkqC+HGBcRxaif
         Slww==
X-Gm-Message-State: AOAM532KQRSFSyOS199Z4x+tsWhM493P5hpxFGmgoFtAb7R3egzF3Lkz
	E+of5cRSJe1A+FA+NsPFNaGuFyLBSuY=
X-Google-Smtp-Source: ABdhPJxicMr5MDff2lXuD+AsatrVuxIF5tEfz4ik0J5KdYNIRCflXKC5AsDoYSeOERzxuISKKsOZXg==
X-Received: by 2002:a63:3545:: with SMTP id c66mr9160927pga.82.1590077757919;
        Thu, 21 May 2020 09:15:57 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e62a])
        by smtp.gmail.com with ESMTPSA id r24sm3636427pgm.25.2020.05.21.09.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 09:15:57 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][ 08/10] armv8/tunes: Define TUNE_PKGARCH
Date: Thu, 21 May 2020 09:15:41 -0700
Message-Id: <20200521161543.3273063-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200521161543.3273063-1-raj.khem@gmail.com>
References: <20200521161543.3273063-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that they uses -mcpu, its better to have tune specific build
directories, since aarch64 wont be appropriate any longer

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/machine/include/tune-cortexa53.inc           | 4 ++++
 meta/conf/machine/include/tune-cortexa55.inc           | 1 +
 meta/conf/machine/include/tune-cortexa57-cortexa53.inc | 1 +
 meta/conf/machine/include/tune-cortexa57.inc           | 2 ++
 meta/conf/machine/include/tune-cortexa72-cortexa53.inc | 2 ++
 meta/conf/machine/include/tune-cortexa72.inc           | 1 +
 meta/conf/machine/include/tune-cortexa73-cortexa53.inc | 2 ++
 7 files changed, 13 insertions(+)

diff --git a/meta/conf/machine/include/tune-cortexa53.inc b/meta/conf/machine/include/tune-cortexa53.inc
index 6c0b443eaf..b7327d00c4 100644
--- a/meta/conf/machine/include/tune-cortexa53.inc
+++ b/meta/conf/machine/include/tune-cortexa53.inc
@@ -13,5 +13,9 @@ TUNE_FEATURES_tune-cortexa53          = "aarch64 cortexa53 crc"
 TUNE_FEATURES_tune-cortexa53-crypto   = "aarch64 cortexa53 crc crypto"
 PACKAGE_EXTRA_ARCHS_tune-cortexa53             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa53"
 PACKAGE_EXTRA_ARCHS_tune-cortexa53-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa53 cortexa53-crypto"
+
+TUNE_PKGARCH_tune-cortexa53 = "cortexa53"
+TUNE_PKGARCH_tune-cortexa53-crypto = "cortexa53-crypto"
+
 BASE_LIB_tune-cortexa53               = "lib64"
 BASE_LIB_tune-cortexa53-crypto        = "lib64"
diff --git a/meta/conf/machine/include/tune-cortexa55.inc b/meta/conf/machine/include/tune-cortexa55.inc
index 89032b59ec..274944819e 100644
--- a/meta/conf/machine/include/tune-cortexa55.inc
+++ b/meta/conf/machine/include/tune-cortexa55.inc
@@ -9,5 +9,6 @@ require conf/machine/include/arm/arch-armv8a.inc
 AVAILTUNES += "cortexa55"
 ARMPKGARCH_tune-cortexa55             = "cortexa55"
 TUNE_FEATURES_tune-cortexa55          = "aarch64 cortexa55 crc crypto"
+TUNE_PKGARCH_tune-cortexa55           = "cortexa55"
 PACKAGE_EXTRA_ARCHS_tune-cortexa55    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa55"
 BASE_LIB_tune-cortexa55               = "lib64"
diff --git a/meta/conf/machine/include/tune-cortexa57-cortexa53.inc b/meta/conf/machine/include/tune-cortexa57-cortexa53.inc
index ba4b073852..b95d63e86b 100644
--- a/meta/conf/machine/include/tune-cortexa57-cortexa53.inc
+++ b/meta/conf/machine/include/tune-cortexa57-cortexa53.inc
@@ -11,5 +11,6 @@ require conf/machine/include/arm/arch-armv8a.inc
 AVAILTUNES += "cortexa57-cortexa53"
 ARMPKGARCH_tune-cortexa57-cortexa53 = "cortexa57-cortexa53"
 TUNE_FEATURES_tune-cortexa57-cortexa53 = "aarch64 cortexa57-cortexa53"
+TUNE_PKGARCH_tune-cortexa57-cortexa53 = "cortexa57-cortexa53"
 PACKAGE_EXTRA_ARCHS_tune-cortexa57-cortexa53 = "${PACKAGE_EXTRA_ARCHS_tune-aarch64} cortexa57-cortexa53"
 BASE_LIB_tune-cortexa57-cortexa53 = "lib64"
diff --git a/meta/conf/machine/include/tune-cortexa57.inc b/meta/conf/machine/include/tune-cortexa57.inc
index 645a5a7ef6..e8ddeb5786 100644
--- a/meta/conf/machine/include/tune-cortexa57.inc
+++ b/meta/conf/machine/include/tune-cortexa57.inc
@@ -13,5 +13,7 @@ TUNE_FEATURES_tune-cortexa57          = "aarch64 cortexa57 crc"
 TUNE_FEATURES_tune-cortexa57-crypto   = "aarch64 cortexa57 crc crypto"
 PACKAGE_EXTRA_ARCHS_tune-cortexa57             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa57"
 PACKAGE_EXTRA_ARCHS_tune-cortexa57-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa57 cortexa57-crypto"
+TUNE_PKGARCH_tune-cortexa57 = "cortexa57"
+TUNE_PKGARCH_tune-cortexa57-crypto = "cortexa57-crypto"
 BASE_LIB_tune-cortexa57               = "lib64"
 BASE_LIB_tune-cortexa57-crypto        = "lib64"
diff --git a/meta/conf/machine/include/tune-cortexa72-cortexa53.inc b/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
index 5c54aa33ea..fd1ffeb177 100644
--- a/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
+++ b/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
@@ -15,6 +15,8 @@ TUNE_FEATURES_tune-cortexa72-cortexa53               = "aarch64 crc cortexa72-co
 TUNE_FEATURES_tune-cortexa72-cortexa53-crypto        = "aarch64 crc crypto cortexa72-cortexa53"
 PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa72-cortexa53"
 PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72-cortexa53 cortexa72-cortexa53-crypto"
+TUNE_PKGARCH_tune-cortexa72-cortexa53                = "cortexa72-cortexa53"
+TUNE_PKGARCH_tune-cortexa72-cortexa53-crypto         = "cortexa72-cortexa53-crypto"
 BASE_LIB_tune-cortexa72-cortexa53                    = "lib64"
 BASE_LIB_tune-cortexa72-cortexa53-crypto             = "lib64"
 
diff --git a/meta/conf/machine/include/tune-cortexa72.inc b/meta/conf/machine/include/tune-cortexa72.inc
index 00f7745a22..23640d5c1f 100644
--- a/meta/conf/machine/include/tune-cortexa72.inc
+++ b/meta/conf/machine/include/tune-cortexa72.inc
@@ -10,4 +10,5 @@ AVAILTUNES += "cortexa72"
 ARMPKGARCH_tune-cortexa72             = "cortexa72"
 TUNE_FEATURES_tune-cortexa72          = "aarch64 cortexa72 crc crypto"
 PACKAGE_EXTRA_ARCHS_tune-cortexa72    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72"
+TUNE_PKGARCH_tune-cortexa72           = "cortexa72"
 BASE_LIB_tune-cortexa72               = "lib64"
diff --git a/meta/conf/machine/include/tune-cortexa73-cortexa53.inc b/meta/conf/machine/include/tune-cortexa73-cortexa53.inc
index 431d244fe2..ab87c88747 100644
--- a/meta/conf/machine/include/tune-cortexa73-cortexa53.inc
+++ b/meta/conf/machine/include/tune-cortexa73-cortexa53.inc
@@ -15,6 +15,8 @@ TUNE_FEATURES_tune-cortexa73-cortexa53               = "aarch64 crc cortexa73-co
 TUNE_FEATURES_tune-cortexa73-cortexa53-crypto        = "aarch64 crc crypto cortexa73-cortexa53"
 PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa53         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa73-cortexa53"
 PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa53-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa73-cortexa53 cortexa73-cortexa53-crypto"
+TUNE_PKGARCH_tune-cortexa73-cortexa53                = "cortexa73-cortexa53"
+TUNE_PKGARCH_tune-cortexa73-cortexa53-crypto         = "cortexa73-cortexa53-crypto"
 BASE_LIB_tune-cortexa73-cortexa53                    = "lib64"
 BASE_LIB_tune-cortexa73-cortexa53-crypto             = "lib64"
 
-- 
2.26.2

