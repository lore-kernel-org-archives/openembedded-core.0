Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web10.27386.1601258535520645334
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2020 19:02:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=k4HvVrQW;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.170, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f170.google.com with SMTP id v54so7039607qtj.7
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2020 19:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=L9hqvxFquT9+FWT7OfgkpnzvBDtKJlUsRJ1fjHH3MkI=;
        b=k4HvVrQWejAd4pZzVPWMcyMRTIUWkIEVSfRs9Cy0HhLJql0Hk93QL3PQctVa1IPPyE
         UiGW/p9b3so8LnGEawzHlaqMDU6j2cDjbfOypj0ziJc5puYODIoqC4i5ob38VgoNQH2H
         Haa+fY3SkqFYUqPJRZfKS1JKzC5JIlcnpF6lvWUfy1mcUJ8SulpodPj+9CjL3O5gxcjR
         vHvR9Ty4utDc2DrhkKmWLhLx3gubRhBBJUmAKHPEFTWunu9J1eiFnYjydmqFY4vGjBRT
         i5zg8jl6J1Wcro3X7S7Ng7wLxSq6hpRLaOB1Ggiz0uF/ubiSFKnrPUpAPtXAkq3sBpLR
         n4Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L9hqvxFquT9+FWT7OfgkpnzvBDtKJlUsRJ1fjHH3MkI=;
        b=PUp7xaxveuZ+G+b5ZJXdifEOAbEkFYppBtz9HWNMmPpwK9YzocLpFNMdxucMiAUgN8
         H0DGdvvUkTURZNEhSWoFEMSP2m9aFfgrapaCg1T/wZbnmHjkxKEC8qGyElRpWFIpxjO8
         CR4RPSM3eEDd5Qy5xtpI2XvQs5yeczc0fgZwS5B1mqNC0bv3qfSEUvqflN8WhkVnDCsA
         2QJKSBXNqT+fiw0/5I5Ph5r8jtulcmC3FU9Z3j61mjYINo4S3G20WORAvXHq3CCFIw83
         ZWQ7XaVdqDOrXeERJYpiJ4wNfdgEpBy1ZBhluAQdQe+ORouKQdAVV4AsVBvBqB8zhroS
         +YgQ==
X-Gm-Message-State: AOAM533J3iKnkTG2qRBtgWcRe+lxZyDpWA1QwHu9Odcym/LGZKrGmdfd
	AjZf37zTXo3mNZW0P4QdgGKKA+uWPBtwXT3B
X-Google-Smtp-Source: ABdhPJwW/cSCyOANHPq64uwjhqn8DqJVK6yUgWpwrfAyy5iptsHWhfieGjwZbk2CHeyRxHjoj2fiGw==
X-Received: by 2002:ac8:3241:: with SMTP id y1mr10921646qta.219.1601258533971;
        Sun, 27 Sep 2020 19:02:13 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id 8sm7953502qkd.47.2020.09.27.19.02.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 19:02:13 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe][PATCH v3 3/6] armv8/tunes: reference parent's TUNE_FEATURES
Date: Sun, 27 Sep 2020 22:01:39 -0400
Message-Id: <20200928020142.5706-4-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200928020142.5706-1-jon.mason@arm.com>
References: <20200928020142.5706-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Uniformity clean-up, have the individual tunes reference the armv8a TUNE_FEATURES.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta/conf/machine/include/tune-cortexa32.inc           | 3 +--
 meta/conf/machine/include/tune-cortexa35.inc           | 2 +-
 meta/conf/machine/include/tune-cortexa53.inc           | 3 +--
 meta/conf/machine/include/tune-cortexa55.inc           | 2 +-
 meta/conf/machine/include/tune-cortexa57-cortexa53.inc | 2 +-
 meta/conf/machine/include/tune-cortexa57.inc           | 2 +-
 meta/conf/machine/include/tune-cortexa72-cortexa53.inc | 2 +-
 meta/conf/machine/include/tune-cortexa72.inc           | 2 +-
 meta/conf/machine/include/tune-cortexa73-cortexa53.inc | 2 +-
 9 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/meta/conf/machine/include/tune-cortexa32.inc b/meta/conf/machine/include/tune-cortexa32.inc
index 0ffb3e068855..a11ab7bb0052 100644
--- a/meta/conf/machine/include/tune-cortexa32.inc
+++ b/meta/conf/machine/include/tune-cortexa32.inc
@@ -1,6 +1,5 @@
 DEFAULTTUNE ?= "cortexa32"
 
-
 TUNEVALID[cortexa32] = "Enable Cortex-A32 specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa32', ' -mcpu=cortex-a32', '', d)}"
 
@@ -10,7 +9,7 @@ require conf/machine/include/arm/arch-armv8a.inc
 AVAILTUNES += "cortexa32 cortexa32-crypto"
 ARMPKGARCH_tune-cortexa32             = "cortexa32"
 ARMPKGARCH_tune-cortexa32-crypto      = "cortexa32"
-TUNE_FEATURES_tune-cortexa32          = "armv8a cortexa32 crc"
+TUNE_FEATURES_tune-cortexa32          = "${TUNE_FEATURES_tune-armv8a-crc} cortexa32"
 TUNE_FEATURES_tune-cortexa32-crypto   = "${TUNE_FEATURES_tune-cortexa32} crypto"
 PACKAGE_EXTRA_ARCHS_tune-cortexa32             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa32"
 PACKAGE_EXTRA_ARCHS_tune-cortexa32-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa32 cortexa32-crypto"
diff --git a/meta/conf/machine/include/tune-cortexa35.inc b/meta/conf/machine/include/tune-cortexa35.inc
index 61696da540cc..cb3ad4c11ea6 100644
--- a/meta/conf/machine/include/tune-cortexa35.inc
+++ b/meta/conf/machine/include/tune-cortexa35.inc
@@ -9,7 +9,7 @@ require conf/machine/include/arm/arch-armv8a.inc
 AVAILTUNES += "cortexa35 cortexa35-crypto"
 ARMPKGARCH_tune-cortexa35             = "cortexa35"
 ARMPKGARCH_tune-cortexa35-crypto      = "cortexa35"
-TUNE_FEATURES_tune-cortexa35          = "aarch64 cortexa35 crc"
+TUNE_FEATURES_tune-cortexa35          = "${TUNE_FEATURES_tune-armv8a-crc} cortexa35"
 TUNE_FEATURES_tune-cortexa35-crypto   = "${TUNE_FEATURES_tune-cortexa35} crypto"
 PACKAGE_EXTRA_ARCHS_tune-cortexa35             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa35"
 PACKAGE_EXTRA_ARCHS_tune-cortexa35-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa35 cortexa35-crypto"
diff --git a/meta/conf/machine/include/tune-cortexa53.inc b/meta/conf/machine/include/tune-cortexa53.inc
index 79ce7c4b1c21..7f8863a2fa75 100644
--- a/meta/conf/machine/include/tune-cortexa53.inc
+++ b/meta/conf/machine/include/tune-cortexa53.inc
@@ -9,10 +9,9 @@ require conf/machine/include/arm/arch-armv8a.inc
 AVAILTUNES += "cortexa53 cortexa53-crypto"
 ARMPKGARCH_tune-cortexa53             = "cortexa53"
 ARMPKGARCH_tune-cortexa53-crypto      = "cortexa53-crypto"
-TUNE_FEATURES_tune-cortexa53          = "aarch64 cortexa53 crc"
+TUNE_FEATURES_tune-cortexa53          = "${TUNE_FEATURES_tune-armv8a-crc} cortexa53"
 TUNE_FEATURES_tune-cortexa53-crypto   = "${TUNE_FEATURES_tune-cortexa53} crypto"
 PACKAGE_EXTRA_ARCHS_tune-cortexa53             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa53"
 PACKAGE_EXTRA_ARCHS_tune-cortexa53-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa53 cortexa53-crypto"
-
 BASE_LIB_tune-cortexa53               = "lib64"
 BASE_LIB_tune-cortexa53-crypto        = "lib64"
diff --git a/meta/conf/machine/include/tune-cortexa55.inc b/meta/conf/machine/include/tune-cortexa55.inc
index 66a5d0c437ee..51842e9edda9 100644
--- a/meta/conf/machine/include/tune-cortexa55.inc
+++ b/meta/conf/machine/include/tune-cortexa55.inc
@@ -8,6 +8,6 @@ require conf/machine/include/arm/arch-armv8-2a.inc
 # Little Endian base configs
 AVAILTUNES += "cortexa55"
 ARMPKGARCH_tune-cortexa55             = "cortexa55"
-TUNE_FEATURES_tune-cortexa55          = "aarch64 cortexa55 crypto"
+TUNE_FEATURES_tune-cortexa53          = "${TUNE_FEATURES_tune-armv8-2a-crypto} cortexa53"
 PACKAGE_EXTRA_ARCHS_tune-cortexa55    = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} cortexa55"
 BASE_LIB_tune-cortexa55               = "lib64"
diff --git a/meta/conf/machine/include/tune-cortexa57-cortexa53.inc b/meta/conf/machine/include/tune-cortexa57-cortexa53.inc
index d4b27cc14f94..d329d6199fa9 100644
--- a/meta/conf/machine/include/tune-cortexa57-cortexa53.inc
+++ b/meta/conf/machine/include/tune-cortexa57-cortexa53.inc
@@ -9,6 +9,6 @@ require conf/machine/include/arm/arch-armv8a.inc
 # Little Endian base configs
 AVAILTUNES += "cortexa57-cortexa53"
 ARMPKGARCH_tune-cortexa57-cortexa53 = "cortexa57-cortexa53"
-TUNE_FEATURES_tune-cortexa57-cortexa53 = "aarch64 crc cortexa57-cortexa53"
+TUNE_FEATURES_tune-cortexa57-cortexa53 = "${TUNE_FEATURES_tune-armv8a-crc} cortexa57-cortexa53"
 PACKAGE_EXTRA_ARCHS_tune-cortexa57-cortexa53 = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa57-cortexa53"
 BASE_LIB_tune-cortexa57-cortexa53 = "lib64"
diff --git a/meta/conf/machine/include/tune-cortexa57.inc b/meta/conf/machine/include/tune-cortexa57.inc
index 3206ce75a6b6..91fa6685f5ee 100644
--- a/meta/conf/machine/include/tune-cortexa57.inc
+++ b/meta/conf/machine/include/tune-cortexa57.inc
@@ -9,7 +9,7 @@ require conf/machine/include/arm/arch-armv8a.inc
 AVAILTUNES += "cortexa57 cortexa57-crypto"
 ARMPKGARCH_tune-cortexa57             = "cortexa57"
 ARMPKGARCH_tune-cortexa57-crypto      = "cortexa57-crypto"
-TUNE_FEATURES_tune-cortexa57          = "aarch64 cortexa57 crc"
+TUNE_FEATURES_tune-cortexa57          = "${TUNE_FEATURES_tune-armv8a-crc} cortexa57"
 TUNE_FEATURES_tune-cortexa57-crypto   = "${TUNE_FEATURES_tune-cortexa57} crypto"
 PACKAGE_EXTRA_ARCHS_tune-cortexa57             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa57"
 PACKAGE_EXTRA_ARCHS_tune-cortexa57-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa57 cortexa57-crypto"
diff --git a/meta/conf/machine/include/tune-cortexa72-cortexa53.inc b/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
index 52a96516af02..98e8ebacff79 100644
--- a/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
+++ b/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
@@ -10,7 +10,7 @@ require conf/machine/include/arm/arch-armv8a.inc
 AVAILTUNES += "cortexa72-cortexa53 cortexa72-cortexa53-crypto"
 ARMPKGARCH_tune-cortexa72-cortexa53                  = "cortexa72-cortexa53"
 ARMPKGARCH_tune-cortexa72-cortexa53-crypto           = "cortexa72-cortexa53-crypto"
-TUNE_FEATURES_tune-cortexa72-cortexa53               = "aarch64 crc cortexa72-cortexa53"
+TUNE_FEATURES_tune-cortexa72-cortexa53               = "${TUNE_FEATURES_tune-armv8a-crc} cortexa72-cortexa53"
 TUNE_FEATURES_tune-cortexa72-cortexa53-crypto        = "${TUNE_FEATURES_tune-cortexa72-cortexa53} crypto"
 PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa72-cortexa53"
 PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72-cortexa53 cortexa72-cortexa53-crypto"
diff --git a/meta/conf/machine/include/tune-cortexa72.inc b/meta/conf/machine/include/tune-cortexa72.inc
index 00f7745a22fd..b3f68ab6e3be 100644
--- a/meta/conf/machine/include/tune-cortexa72.inc
+++ b/meta/conf/machine/include/tune-cortexa72.inc
@@ -8,6 +8,6 @@ require conf/machine/include/arm/arch-armv8a.inc
 # Little Endian base configs
 AVAILTUNES += "cortexa72"
 ARMPKGARCH_tune-cortexa72             = "cortexa72"
-TUNE_FEATURES_tune-cortexa72          = "aarch64 cortexa72 crc crypto"
+TUNE_FEATURES_tune-cortexa72          = "${TUNE_FEATURES_tune-armv8a-crc-crypto} cortexa72"
 PACKAGE_EXTRA_ARCHS_tune-cortexa72    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72"
 BASE_LIB_tune-cortexa72               = "lib64"
diff --git a/meta/conf/machine/include/tune-cortexa73-cortexa53.inc b/meta/conf/machine/include/tune-cortexa73-cortexa53.inc
index 765e8ebb92ea..3750f0762d2d 100644
--- a/meta/conf/machine/include/tune-cortexa73-cortexa53.inc
+++ b/meta/conf/machine/include/tune-cortexa73-cortexa53.inc
@@ -10,7 +10,7 @@ require conf/machine/include/arm/arch-armv8a.inc
 AVAILTUNES += "cortexa73-cortexa53 cortexa73-cortexa53-crypto"
 ARMPKGARCH_tune-cortexa73-cortexa53                  = "cortexa73-cortexa53"
 ARMPKGARCH_tune-cortexa73-cortexa53-crypto           = "cortexa73-cortexa53-crypto"
-TUNE_FEATURES_tune-cortexa73-cortexa53               = "aarch64 crc cortexa73-cortexa53"
+TUNE_FEATURES_tune-cortexa73-cortexa53               = "${TUNE_FEATURES_tune-armv8a-crc} cortexa73-cortexa53"
 TUNE_FEATURES_tune-cortexa73-cortexa53-crypto        = "${TUNE_FEATURES_tune-cortexa73-cortexa53} crypto"
 PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa53         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa73-cortexa53"
 PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa53-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa73-cortexa53 cortexa73-cortexa53-crypto"
-- 
2.20.1

