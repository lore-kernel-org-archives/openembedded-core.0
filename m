Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web11.5730.1601062109256210056
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2020 12:28:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=FdcvwdHo;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.179, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f179.google.com with SMTP id a4so2971392qth.0
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2020 12:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=L9hqvxFquT9+FWT7OfgkpnzvBDtKJlUsRJ1fjHH3MkI=;
        b=FdcvwdHoOP5yDDALn0R4yjCjnPMtOj0qW3uDuPHnhkZtgb3GH/8aQX+Bx4KD1z6Rxh
         0kznx6VzfJRRcMAf0KOUrieDbiN7hJzSompSqu+UQLLnTxMOEMyox2XmT1brUXwnBSq7
         rmqLOcJHd+N1kJXFSUtmq4wRMuNctJIRTPgRBn994ZmM1eTyahL+HprEZu+rRO9rZulq
         zdlliA4ogkLSiTT3SrVIREcMUZPByC+1DCp06/AVlFeJHw3XLCCNSIIyo0htSXsuLjMv
         zXsokYK2BVza146M85GngE57nLNBMX8/kd9h0efN7KbVL3QeorZ6qDrBjbbTawVKvVM/
         +5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L9hqvxFquT9+FWT7OfgkpnzvBDtKJlUsRJ1fjHH3MkI=;
        b=LuwJJOCRU3sshp38LdJKzEIqHFXy/zQY5t/5Qua8b/IywK4JrpavKew2nNT7Fsq+cA
         l1e/Hc/54OI157UYdxpUdBASu02XkmnUMHxpeQ1NFR0b226iOuLPYSwF6xJO7PuOGZZM
         i5PHOfMkPwUVgIkH0rqnGH3kSoJUia/7fNXwos0scZHvH49RkPc0Kbz7lxJcfOAsA16T
         G7wo0EpVKxK2KQHpSNr8mPFLhbDWLCRLx/NZr+7eZ44Ix0DJ2Xtl0mBEEl8rW97ia6rT
         d9KHB6MWU3AlxO6bXvkg5bY8mAOHW1czoGc8KjkTnXXfc3Lljih9iP+MkboL6FWv8Bro
         kN+A==
X-Gm-Message-State: AOAM530GFyfUtr7fPEZpdDCN62qhhEHZ8Ua4UpGVNGYq6VmLS7HubTRx
	3eFzMZV5JleaA6l6CZv0l1/aFUm37yptwA4y
X-Google-Smtp-Source: ABdhPJwMtFHpMDjtKjas9bx2bvvX2hx9Vli9ywTqqn96cLDGLKZTKrCgtVghrhPJz+bGPMXhRtv4pA==
X-Received: by 2002:ac8:bc7:: with SMTP id p7mr1289088qti.15.1601062107838;
        Fri, 25 Sep 2020 12:28:27 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id f24sm2322032qka.5.2020.09.25.12.28.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2020 12:28:27 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe][PATCH v2 3/6] armv8/tunes: reference parent's TUNE_FEATURES
Date: Fri, 25 Sep 2020 15:28:07 -0400
Message-Id: <20200925192810.1372-4-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200925192810.1372-1-jon.mason@arm.com>
References: <20200925192810.1372-1-jon.mason@arm.com>
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

