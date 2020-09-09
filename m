Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web10.8340.1599689842076839281
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 15:17:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=o4eOg8Xw;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.68, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f68.google.com with SMTP id j3so2403984qvi.7
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2020 15:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=tv3dGA+OErUCxs2Kerbc6JIyPV0pESB7Be47UVmnGLg=;
        b=o4eOg8Xw1VZ1UuOPm6Eaz1FP38rvLvv3nN1i4kUmnbxzMcEdeSSJ7XNULDG6RtoJN+
         16OjDQ1UCqYTNmZT4udQxwqrWIDAXplMZ3UEKsOi109wGQrg2FOpd+FeoNEcFwSzlBsA
         RCklZ2Z3rOoVz6qEqW2ab/4qvn02p/0NWSczBUQ7zxtwsD2W+jK/Q4q8OZ5zK4Iy7yAN
         kD2GeTuDmUyxn1vqvZadDSDrWcxiQoaTrah2IaQxHOd94vJ7+ncOtId8Efm4fIfXDUdt
         0nG2MxqH/jbXRAngH7Ye80QfHqgoNat1w/Q4647TDGShkJQ0eKfWBKqVyFpANKVRS7ZH
         qC/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tv3dGA+OErUCxs2Kerbc6JIyPV0pESB7Be47UVmnGLg=;
        b=j40VoUm2q9+mMr4bB2zXFoZlFTT6oiGdGMfx+NyDHeyCNyzrb22IQvpphnAxtbDXR/
         QMBHMW0Cx7Spa1CRfELPRy7+T0tV6gCqU4f8dEhkNIHhCqwlWWJbpcsRhdSa4ya0qgKH
         HHO3hGNcUUP5qy7oMrmgUR1WYkBJLfhctV3wxBVo+Kp6o/T2PUYeAuDmtp+mkWj0poJ1
         74TQdy8UY/pKEo1QqGpjbhgMDQqutcsyrdkoIVsxu4hzLYmi7m82miY13cTZhwA1mDbu
         daI1MZh9mQdHXGfEFkxEhGMZQB6TRv6PlKudpOZrKbAoCbEC9cHunEUHPOTZ8Tw7IfaX
         f+oQ==
X-Gm-Message-State: AOAM533+CjtEplXiJoSLnC51XvHL9pdyofogM5vEHXSIhoGRq8/zrUtY
	YqRM/sizyR9ctV6dglHPOXEKf+JNmNClP53K
X-Google-Smtp-Source: ABdhPJyqyGqM0XCoG5/pS7VKjqw8msCAkz4IcnBVAu8r4R0pv0/ye4GVJuEmGgcahHH+gbkgJeS0WQ==
X-Received: by 2002:ad4:5a53:: with SMTP id ej19mr6342856qvb.54.1599689840901;
        Wed, 09 Sep 2020 15:17:20 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id a52sm4801431qtc.22.2020.09.09.15.17.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 15:17:20 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe][PATCH 4/4] tune-cortexa*: Cleanups
Date: Wed,  9 Sep 2020 18:16:52 -0400
Message-Id: <20200909221652.6750-5-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200909221652.6750-1-jon.mason@arm.com>
References: <20200909221652.6750-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the existing ARMv8 Cortex-A tunings similar in the way the cascade
the settings.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta/conf/machine/include/tune-cortexa32.inc           | 2 +-
 meta/conf/machine/include/tune-cortexa35.inc           | 2 +-
 meta/conf/machine/include/tune-cortexa53.inc           | 2 +-
 meta/conf/machine/include/tune-cortexa57.inc           | 2 +-
 meta/conf/machine/include/tune-cortexa72-cortexa53.inc | 2 +-
 meta/conf/machine/include/tune-cortexa73-cortexa53.inc | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/conf/machine/include/tune-cortexa32.inc b/meta/conf/machine/include/tune-cortexa32.inc
index 3ab1addd9189..0ffb3e068855 100644
--- a/meta/conf/machine/include/tune-cortexa32.inc
+++ b/meta/conf/machine/include/tune-cortexa32.inc
@@ -11,7 +11,7 @@ AVAILTUNES += "cortexa32 cortexa32-crypto"
 ARMPKGARCH_tune-cortexa32             = "cortexa32"
 ARMPKGARCH_tune-cortexa32-crypto      = "cortexa32"
 TUNE_FEATURES_tune-cortexa32          = "armv8a cortexa32 crc"
-TUNE_FEATURES_tune-cortexa32-crypto   = "armv8a cortexa32 crc crypto"
+TUNE_FEATURES_tune-cortexa32-crypto   = "${TUNE_FEATURES_tune-cortexa32} crypto"
 PACKAGE_EXTRA_ARCHS_tune-cortexa32             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa32"
 PACKAGE_EXTRA_ARCHS_tune-cortexa32-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa32 cortexa32-crypto"
 BASE_LIB_tune-cortexa32               = "lib"
diff --git a/meta/conf/machine/include/tune-cortexa35.inc b/meta/conf/machine/include/tune-cortexa35.inc
index d6df6cd6bda3..61696da540cc 100644
--- a/meta/conf/machine/include/tune-cortexa35.inc
+++ b/meta/conf/machine/include/tune-cortexa35.inc
@@ -10,7 +10,7 @@ AVAILTUNES += "cortexa35 cortexa35-crypto"
 ARMPKGARCH_tune-cortexa35             = "cortexa35"
 ARMPKGARCH_tune-cortexa35-crypto      = "cortexa35"
 TUNE_FEATURES_tune-cortexa35          = "aarch64 cortexa35 crc"
-TUNE_FEATURES_tune-cortexa35-crypto   = "aarch64 cortexa35 crc crypto"
+TUNE_FEATURES_tune-cortexa35-crypto   = "${TUNE_FEATURES_tune-cortexa35} crypto"
 PACKAGE_EXTRA_ARCHS_tune-cortexa35             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa35"
 PACKAGE_EXTRA_ARCHS_tune-cortexa35-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa35 cortexa35-crypto"
 BASE_LIB_tune-cortexa35               = "lib64"
diff --git a/meta/conf/machine/include/tune-cortexa53.inc b/meta/conf/machine/include/tune-cortexa53.inc
index c0bb28a19e30..79ce7c4b1c21 100644
--- a/meta/conf/machine/include/tune-cortexa53.inc
+++ b/meta/conf/machine/include/tune-cortexa53.inc
@@ -10,7 +10,7 @@ AVAILTUNES += "cortexa53 cortexa53-crypto"
 ARMPKGARCH_tune-cortexa53             = "cortexa53"
 ARMPKGARCH_tune-cortexa53-crypto      = "cortexa53-crypto"
 TUNE_FEATURES_tune-cortexa53          = "aarch64 cortexa53 crc"
-TUNE_FEATURES_tune-cortexa53-crypto   = "aarch64 cortexa53 crc crypto"
+TUNE_FEATURES_tune-cortexa53-crypto   = "${TUNE_FEATURES_tune-cortexa53} crypto"
 PACKAGE_EXTRA_ARCHS_tune-cortexa53             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa53"
 PACKAGE_EXTRA_ARCHS_tune-cortexa53-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa53 cortexa53-crypto"
 
diff --git a/meta/conf/machine/include/tune-cortexa57.inc b/meta/conf/machine/include/tune-cortexa57.inc
index 0811d503cc28..3206ce75a6b6 100644
--- a/meta/conf/machine/include/tune-cortexa57.inc
+++ b/meta/conf/machine/include/tune-cortexa57.inc
@@ -10,7 +10,7 @@ AVAILTUNES += "cortexa57 cortexa57-crypto"
 ARMPKGARCH_tune-cortexa57             = "cortexa57"
 ARMPKGARCH_tune-cortexa57-crypto      = "cortexa57-crypto"
 TUNE_FEATURES_tune-cortexa57          = "aarch64 cortexa57 crc"
-TUNE_FEATURES_tune-cortexa57-crypto   = "aarch64 cortexa57 crc crypto"
+TUNE_FEATURES_tune-cortexa57-crypto   = "${TUNE_FEATURES_tune-cortexa57} crypto"
 PACKAGE_EXTRA_ARCHS_tune-cortexa57             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa57"
 PACKAGE_EXTRA_ARCHS_tune-cortexa57-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa57 cortexa57-crypto"
 BASE_LIB_tune-cortexa57               = "lib64"
diff --git a/meta/conf/machine/include/tune-cortexa72-cortexa53.inc b/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
index e857f875ff27..feb1df5c178d 100644
--- a/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
+++ b/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
@@ -12,7 +12,7 @@ AVAILTUNES += "cortexa72-cortexa53 cortexa72-cortexa53-crypto"
 ARMPKGARCH_tune-cortexa72-cortexa53                  = "cortexa72-cortexa53"
 ARMPKGARCH_tune-cortexa72-cortexa53-crypto           = "cortexa72-cortexa53-crypto"
 TUNE_FEATURES_tune-cortexa72-cortexa53               = "aarch64 crc cortexa72-cortexa53"
-TUNE_FEATURES_tune-cortexa72-cortexa53-crypto        = "aarch64 crc crypto cortexa72-cortexa53"
+TUNE_FEATURES_tune-cortexa72-cortexa53-crypto        = "${TUNE_FEATURES_tune-cortexa72-cortexa53} crypto"
 PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa72-cortexa53"
 PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72-cortexa53 cortexa72-cortexa53-crypto"
 BASE_LIB_tune-cortexa72-cortexa53                    = "lib64"
diff --git a/meta/conf/machine/include/tune-cortexa73-cortexa53.inc b/meta/conf/machine/include/tune-cortexa73-cortexa53.inc
index ba2b9b1951bc..1c221999f408 100644
--- a/meta/conf/machine/include/tune-cortexa73-cortexa53.inc
+++ b/meta/conf/machine/include/tune-cortexa73-cortexa53.inc
@@ -12,7 +12,7 @@ AVAILTUNES += "cortexa73-cortexa53 cortexa73-cortexa53-crypto"
 ARMPKGARCH_tune-cortexa73-cortexa53                  = "cortexa73-cortexa53"
 ARMPKGARCH_tune-cortexa73-cortexa53-crypto           = "cortexa73-cortexa53-crypto"
 TUNE_FEATURES_tune-cortexa73-cortexa53               = "aarch64 crc cortexa73-cortexa53"
-TUNE_FEATURES_tune-cortexa73-cortexa53-crypto        = "aarch64 crc crypto cortexa73-cortexa53"
+TUNE_FEATURES_tune-cortexa73-cortexa53-crypto        = "${TUNE_FEATURES_tune-cortexa73-cortexa53} crypto"
 PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa53         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa73-cortexa53"
 PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa53-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa73-cortexa53 cortexa73-cortexa53-crypto"
 BASE_LIB_tune-cortexa73-cortexa53                    = "lib64"
-- 
2.20.1

