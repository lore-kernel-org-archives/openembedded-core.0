Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.6820.1589432611678749695
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2020 22:03:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=V+NvbGh1;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id u22so707808plq.12
        for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2020 22:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j2+JoE203/XXjdnk9NFGdI+120SGPZRJ/CEq0xzrB7A=;
        b=V+NvbGh1ZHatdo9cQVELluHb7Dqf7gKRxKjoOX0SX4eqoHgyLummr6c5T2CyZpNnD2
         eqiKR8FvX+9Nb+f7sxm4EPrBlw74/RajH5tGGaPxYvlok1/VN6rx/grI43wSJ+jNm6FL
         YDUe77y4wsRojs4XzKNj8nglSkrpx8HWk7++wbdaFJzpZteuGZMuSfqBrVkL8CGUsFdL
         KB7Bh5oq8ZADgYsXEsiGk7W2ccGsYt/Hm10O0CD1dKmSy7eGqVdnPx/5ZAa/OUKU7XnP
         //xB6cC+ChSQP9iFX/z+M+xgAJO/m3KJHBNZ7Hw19riI4fTWjKjVBUMR4Wnx7JS9kA2o
         gUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j2+JoE203/XXjdnk9NFGdI+120SGPZRJ/CEq0xzrB7A=;
        b=PXgoqmhI5waDjjm5RQYZYoDX9k5MXcm2sXdUOk2Zxb5fnA/n8m777UKek/p/q/sXAK
         KqhNC8n8VFzq8nRxozwWmPUcta71zbCiaKeGq7y3wobPv9uYSi6xR0U8PYeWsx6DascW
         kt55P69t/7XyoGeIckZvZUowadWsQN7lYYOikvTefTX/OKz592iK5xoeLU+qdbn/oelc
         +un3jXrJk34qbwGIG3hdTTXf4g3kjqCQ4AWVzHxS2bZ9Lv2uNZNRvec1P5NgAY/y9mlT
         byBd+FNyXywY4w0H+bes8oum4ck0h9Lx8lJ3o5xbtawqATMVz+jiDnnHNVn+xveb/se3
         cMjg==
X-Gm-Message-State: AOAM533P5+bOdZBieLFEpOr8UZZTAPxTiqyca3rcrzU0ZvzobGmdbawR
	EiNsfKoxtGW6mqByz4LpcSy9iUfAzFc=
X-Google-Smtp-Source: ABdhPJyKwHKO1ku+2zleklCNcUH2I37pxZyJo68UVlNO6EDZ+h+APfpeZtPWHFRlCscHISgn5fjo5g==
X-Received: by 2002:a17:902:6503:: with SMTP id b3mr2274811plk.165.1589432610823;
        Wed, 13 May 2020 22:03:30 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net (c-73-63-224-124.hsd1.ca.comcast.net. [73.63.224.124])
        by smtp.gmail.com with ESMTPSA id z7sm1067649pff.47.2020.05.13.22.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 22:03:30 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 6/6] armv8/tunes: Define TUNE_PKGARCH
Date: Wed, 13 May 2020 22:03:21 -0700
Message-Id: <20200514050321.1292228-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200514050321.1292228-1-raj.khem@gmail.com>
References: <20200514050321.1292228-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that they uses -mcpu, its better to have tune specific build
directories, since aarch64 wont be appropriate any longer

Signed-off-by: Khem Raj <raj.khem@gmail.com>
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

