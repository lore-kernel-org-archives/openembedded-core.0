Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web10.8868.1599691560835366061
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 15:46:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=ObgHEFp7;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.173, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f173.google.com with SMTP id w12so4150636qki.6
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2020 15:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=AyQN9Iyw002tQiSfH2lCKgYvK+M7b0NSqaH85QXzUno=;
        b=ObgHEFp75MJjHQQagcYjIPYmebzxAndwZtRb3j4lqpXkn7w3PnuYWTp80/rCMpw/Cp
         aUBazqTjhtjdpU+dafAC+pRLfa/xCYgu0IkNVpYzT3oNoGDBg5jbzuBLcXxw4iY1hWo2
         g3NhvNVmvDjiyYVdgdRFVOjTkLnJuGlW+LhsBd41xZ553Jm5Gd2NYIjnVddHyUA5ssIH
         07I0j6EysD9G/1NyTRJC8AhO26D8AWpMAFvqDOllG/WeD1f1WfPpM3cpGw4V6Zs1Ckru
         x3hG16LJa5AALVQZEhY8h2ZfvONyQxdDq/epNXXR+6qr1M1oXBOMRS6KIfMbD5bQWjUn
         4UgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AyQN9Iyw002tQiSfH2lCKgYvK+M7b0NSqaH85QXzUno=;
        b=MsDMEdBwNGKTxU/vT+SYlrUBGCAUth56bRJBAdfWl2Iqe6+iJW+0HzOnO4yA44o+zo
         rXyN3IQzd1hIJC4dNaAceLiyII3G7Z1ez8m7pX/ssSuZaP/LIA9Kz5O+bR23Bxzev8ss
         aomPwYYXebSgL9BSfIabIWHDuCUCcdsRtYgCy6amJaXvC6j7yEmrmdEUVoe2Jur9gKv2
         VEeJEPjYV481zU3q8rgvydug6r/kENqrLf28tEwT0E+VL6lCt9rkxj8dh5W2qDWJARUa
         AIQx9LCLw7hd2lbRTi83WL7Qt8DRdUvlG+vEMcldLM4WzrUmtP0A35wb5FCJM3p3Ae1o
         dkIQ==
X-Gm-Message-State: AOAM530iaMTxhhLg7vj6Q59gkM6tA+aJm6QCxAyoaOdMTDtUgv4FQ+SO
	jsMZXfOv2dMBfGZ4TZwGW5HQcDFHD/Bsvp1W
X-Google-Smtp-Source: ABdhPJw/qQFQpFZlAlsG+nSXwvLk+pb4Bc7X45FnVi6LSr878QB6yvLK1UWwe4WHpc4vlunjbXGhZw==
X-Received: by 2002:ae9:f209:: with SMTP id m9mr5254923qkg.301.1599691559630;
        Wed, 09 Sep 2020 15:45:59 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id 8sm3100531qkd.47.2020.09.09.15.45.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 15:45:59 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe][RFC 1/6] arm64: set BASE_LIB to lib64
Date: Wed,  9 Sep 2020 18:45:30 -0400
Message-Id: <20200909224535.27164-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200909224535.27164-1-jon.mason@arm.com>
References: <20200909224535.27164-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set BASE_LIB for all arm64 systems to be lib64 by default.  This can be
overridden for those that want something else (see tune-cortexa32.inc).

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta/conf/machine/include/arm/arch-arm64.inc           | 3 +--
 meta/conf/machine/include/arm/arch-armv8-2a.inc        | 2 --
 meta/conf/machine/include/arm/arch-armv8a.inc          | 4 ----
 meta/conf/machine/include/tune-cortexa32.inc           | 1 +
 meta/conf/machine/include/tune-cortexa35.inc           | 2 --
 meta/conf/machine/include/tune-cortexa53.inc           | 2 --
 meta/conf/machine/include/tune-cortexa55.inc           | 1 -
 meta/conf/machine/include/tune-cortexa57-cortexa53.inc | 1 -
 meta/conf/machine/include/tune-cortexa57.inc           | 2 --
 meta/conf/machine/include/tune-cortexa72-cortexa53.inc | 2 --
 meta/conf/machine/include/tune-cortexa72.inc           | 1 -
 meta/conf/machine/include/tune-cortexa73-cortexa53.inc | 2 --
 12 files changed, 2 insertions(+), 21 deletions(-)

diff --git a/meta/conf/machine/include/arm/arch-arm64.inc b/meta/conf/machine/include/arm/arch-arm64.inc
index 6d5b22fff081..8c3764186ec4 100644
--- a/meta/conf/machine/include/arm/arch-arm64.inc
+++ b/meta/conf/machine/include/arm/arch-arm64.inc
@@ -1,4 +1,5 @@
 DEFAULTTUNE ?= "aarch64"
+BASE_LIB ?= "lib64"
 
 require conf/machine/include/arm/arch-armv7ve.inc
 
@@ -14,8 +15,6 @@ TUNE_FEATURES_tune-aarch64 = "aarch64"
 TUNE_FEATURES_tune-aarch64_be = "${TUNE_FEATURES_tune-aarch64} bigendian"
 TUNE_PKGARCH_64_tune-aarch64 = "aarch64"
 TUNE_PKGARCH_64_tune-aarch64_be = "aarch64_be"
-BASE_LIB_tune-aarch64 = "lib64"
-BASE_LIB_tune-aarch64_be = "lib64"
 
 PACKAGE_EXTRA_ARCHS_tune-aarch64 = "aarch64"
 PACKAGE_EXTRA_ARCHS_tune-aarch64_be = "aarch64_be"
diff --git a/meta/conf/machine/include/arm/arch-armv8-2a.inc b/meta/conf/machine/include/arm/arch-armv8-2a.inc
index 1c095256d185..b40ebf176e43 100644
--- a/meta/conf/machine/include/arm/arch-armv8-2a.inc
+++ b/meta/conf/machine/include/arm/arch-armv8-2a.inc
@@ -15,5 +15,3 @@ TUNE_FEATURES_tune-armv8-2a                  = "aarch64 armv8-2a"
 TUNE_FEATURES_tune-armv8-2a-crypto           = "${TUNE_FEATURES_tune-armv8-2a} crypto"
 PACKAGE_EXTRA_ARCHS_tune-armv8-2a            = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8-2a"
 PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto     = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a} armv8-2a-crypto"
-BASE_LIB_tune-armv8-2a                       = "lib64"
-BASE_LIB_tune-armv8-2a-crypto                = "lib64"
diff --git a/meta/conf/machine/include/arm/arch-armv8a.inc b/meta/conf/machine/include/arm/arch-armv8a.inc
index f810a1e8fc98..5584005f7009 100644
--- a/meta/conf/machine/include/arm/arch-armv8a.inc
+++ b/meta/conf/machine/include/arm/arch-armv8a.inc
@@ -24,7 +24,3 @@ PACKAGE_EXTRA_ARCHS_tune-armv8a            = "aarch64 armv8a"
 PACKAGE_EXTRA_ARCHS_tune-armv8a-crc        = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8a-crc"
 PACKAGE_EXTRA_ARCHS_tune-armv8a-crypto     = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8a-crypto"
 PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} armv8a-crypto armv8a-crc-crypto"
-BASE_LIB_tune-armv8a                       = "lib64"
-BASE_LIB_tune-armv8a-crc                   = "lib64"
-BASE_LIB_tune-armv8a-crypto                = "lib64"
-BASE_LIB_tune-armv8a-crc-crypto            = "lib64"
diff --git a/meta/conf/machine/include/tune-cortexa32.inc b/meta/conf/machine/include/tune-cortexa32.inc
index 0ffb3e068855..78dab8bed6e1 100644
--- a/meta/conf/machine/include/tune-cortexa32.inc
+++ b/meta/conf/machine/include/tune-cortexa32.inc
@@ -14,5 +14,6 @@ TUNE_FEATURES_tune-cortexa32          = "armv8a cortexa32 crc"
 TUNE_FEATURES_tune-cortexa32-crypto   = "${TUNE_FEATURES_tune-cortexa32} crypto"
 PACKAGE_EXTRA_ARCHS_tune-cortexa32             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa32"
 PACKAGE_EXTRA_ARCHS_tune-cortexa32-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa32 cortexa32-crypto"
+# Cortex-A32 is 32bit only
 BASE_LIB_tune-cortexa32               = "lib"
 BASE_LIB_tune-cortexa32-crypto        = "lib"
diff --git a/meta/conf/machine/include/tune-cortexa35.inc b/meta/conf/machine/include/tune-cortexa35.inc
index 61696da540cc..80825972b612 100644
--- a/meta/conf/machine/include/tune-cortexa35.inc
+++ b/meta/conf/machine/include/tune-cortexa35.inc
@@ -13,5 +13,3 @@ TUNE_FEATURES_tune-cortexa35          = "aarch64 cortexa35 crc"
 TUNE_FEATURES_tune-cortexa35-crypto   = "${TUNE_FEATURES_tune-cortexa35} crypto"
 PACKAGE_EXTRA_ARCHS_tune-cortexa35             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa35"
 PACKAGE_EXTRA_ARCHS_tune-cortexa35-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa35 cortexa35-crypto"
-BASE_LIB_tune-cortexa35               = "lib64"
-BASE_LIB_tune-cortexa35-crypto        = "lib64"
diff --git a/meta/conf/machine/include/tune-cortexa53.inc b/meta/conf/machine/include/tune-cortexa53.inc
index 79ce7c4b1c21..385c2d225777 100644
--- a/meta/conf/machine/include/tune-cortexa53.inc
+++ b/meta/conf/machine/include/tune-cortexa53.inc
@@ -14,5 +14,3 @@ TUNE_FEATURES_tune-cortexa53-crypto   = "${TUNE_FEATURES_tune-cortexa53} crypto"
 PACKAGE_EXTRA_ARCHS_tune-cortexa53             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa53"
 PACKAGE_EXTRA_ARCHS_tune-cortexa53-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa53 cortexa53-crypto"
 
-BASE_LIB_tune-cortexa53               = "lib64"
-BASE_LIB_tune-cortexa53-crypto        = "lib64"
diff --git a/meta/conf/machine/include/tune-cortexa55.inc b/meta/conf/machine/include/tune-cortexa55.inc
index 66a5d0c437ee..099b6d72851a 100644
--- a/meta/conf/machine/include/tune-cortexa55.inc
+++ b/meta/conf/machine/include/tune-cortexa55.inc
@@ -10,4 +10,3 @@ AVAILTUNES += "cortexa55"
 ARMPKGARCH_tune-cortexa55             = "cortexa55"
 TUNE_FEATURES_tune-cortexa55          = "aarch64 cortexa55 crypto"
 PACKAGE_EXTRA_ARCHS_tune-cortexa55    = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} cortexa55"
-BASE_LIB_tune-cortexa55               = "lib64"
diff --git a/meta/conf/machine/include/tune-cortexa57-cortexa53.inc b/meta/conf/machine/include/tune-cortexa57-cortexa53.inc
index 5880bf203231..02691d0deee2 100644
--- a/meta/conf/machine/include/tune-cortexa57-cortexa53.inc
+++ b/meta/conf/machine/include/tune-cortexa57-cortexa53.inc
@@ -12,4 +12,3 @@ AVAILTUNES += "cortexa57-cortexa53"
 ARMPKGARCH_tune-cortexa57-cortexa53 = "cortexa57-cortexa53"
 TUNE_FEATURES_tune-cortexa57-cortexa53 = "aarch64 crc cortexa57-cortexa53"
 PACKAGE_EXTRA_ARCHS_tune-cortexa57-cortexa53 = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa57-cortexa53"
-BASE_LIB_tune-cortexa57-cortexa53 = "lib64"
diff --git a/meta/conf/machine/include/tune-cortexa57.inc b/meta/conf/machine/include/tune-cortexa57.inc
index 3206ce75a6b6..868939ca10c7 100644
--- a/meta/conf/machine/include/tune-cortexa57.inc
+++ b/meta/conf/machine/include/tune-cortexa57.inc
@@ -13,5 +13,3 @@ TUNE_FEATURES_tune-cortexa57          = "aarch64 cortexa57 crc"
 TUNE_FEATURES_tune-cortexa57-crypto   = "${TUNE_FEATURES_tune-cortexa57} crypto"
 PACKAGE_EXTRA_ARCHS_tune-cortexa57             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa57"
 PACKAGE_EXTRA_ARCHS_tune-cortexa57-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa57 cortexa57-crypto"
-BASE_LIB_tune-cortexa57               = "lib64"
-BASE_LIB_tune-cortexa57-crypto        = "lib64"
diff --git a/meta/conf/machine/include/tune-cortexa72-cortexa53.inc b/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
index feb1df5c178d..34aaa6cc72a7 100644
--- a/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
+++ b/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
@@ -15,6 +15,4 @@ TUNE_FEATURES_tune-cortexa72-cortexa53               = "aarch64 crc cortexa72-co
 TUNE_FEATURES_tune-cortexa72-cortexa53-crypto        = "${TUNE_FEATURES_tune-cortexa72-cortexa53} crypto"
 PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa72-cortexa53"
 PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72-cortexa53 cortexa72-cortexa53-crypto"
-BASE_LIB_tune-cortexa72-cortexa53                    = "lib64"
-BASE_LIB_tune-cortexa72-cortexa53-crypto             = "lib64"
 
diff --git a/meta/conf/machine/include/tune-cortexa72.inc b/meta/conf/machine/include/tune-cortexa72.inc
index 00f7745a22fd..f0f76cad14db 100644
--- a/meta/conf/machine/include/tune-cortexa72.inc
+++ b/meta/conf/machine/include/tune-cortexa72.inc
@@ -10,4 +10,3 @@ AVAILTUNES += "cortexa72"
 ARMPKGARCH_tune-cortexa72             = "cortexa72"
 TUNE_FEATURES_tune-cortexa72          = "aarch64 cortexa72 crc crypto"
 PACKAGE_EXTRA_ARCHS_tune-cortexa72    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72"
-BASE_LIB_tune-cortexa72               = "lib64"
diff --git a/meta/conf/machine/include/tune-cortexa73-cortexa53.inc b/meta/conf/machine/include/tune-cortexa73-cortexa53.inc
index 1c221999f408..6da93ffac0b7 100644
--- a/meta/conf/machine/include/tune-cortexa73-cortexa53.inc
+++ b/meta/conf/machine/include/tune-cortexa73-cortexa53.inc
@@ -15,6 +15,4 @@ TUNE_FEATURES_tune-cortexa73-cortexa53               = "aarch64 crc cortexa73-co
 TUNE_FEATURES_tune-cortexa73-cortexa53-crypto        = "${TUNE_FEATURES_tune-cortexa73-cortexa53} crypto"
 PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa53         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa73-cortexa53"
 PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa53-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa73-cortexa53 cortexa73-cortexa53-crypto"
-BASE_LIB_tune-cortexa73-cortexa53                    = "lib64"
-BASE_LIB_tune-cortexa73-cortexa53-crypto             = "lib64"
 
-- 
2.20.1

