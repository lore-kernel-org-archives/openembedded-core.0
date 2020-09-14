Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web12.62850.1600096480028729610
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 08:14:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=yrzl6EMx;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f195.google.com with SMTP id q63so447796qkf.3
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 08:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7CHqqUccqhSdVK1g0L3ls32gUG1kv0/blTfxC7CvkUs=;
        b=yrzl6EMxMStJqiQ5TGpNPqdIKHrTT9Pp0PdgFk22DJQChAJ++TszXpAcRraoI/jfAj
         nhACMdysLhjmGH4JoZQ1xqpSoQbHqmr2D7LbETNDIHJJ5OTsEvjuecnRiDyXoqR3hIZB
         0W7ZzUogKID+GWEOB/NvGIeAVxXBwrosP2cgZrBtAXkUuB+2TYmmNdjlc05Vkd5tSye4
         tFmi5JlU5dujuVxBuc5ZEXXLARiLrMPC1pr6tNJCW384es4GFsBOOGMPMFsjNHDFGS+a
         BUeaL7Fc0U24rW138N3CqM94ruC/euRaEVYnLnbtl9pz0Ff/ysSY3Mgsvkh1dGawj6MV
         aDFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7CHqqUccqhSdVK1g0L3ls32gUG1kv0/blTfxC7CvkUs=;
        b=Ys+WNBR+Xab3HgyHkpLGs8S04mYisjjuv+f25CeN7WIN6wwxcuzeD8MEiGPOp34Ayn
         2+5k74QD2gODx7He9zBSd4pjQ/XYvmy4g4sL8ovarsmT1M//3uID4ZEdAppsBaFfOYaX
         m5oopOpVXubsvrYtVv0zoxZ/3ujdkwZBEb4+5Qjog5Dn5C+9HIXauqvEPaRsh89oKguf
         7aDcEo894S75vQ//zUbv2stIt8WOr9fZMmqLLIKrAPTCIg7tXWmDx0uEpBVeTeKIeXYB
         QnuF/D2nELVc9wja2VBrZfOzQSlTxhw5xQ3k9+xMw3II+Zndcf9kcP4a2ZhXvz8qBa1I
         /JlA==
X-Gm-Message-State: AOAM533IvXuItqlRAvrSnVM5RN8aahwNdbYoxKmFbqWhjj3uHzPvn7Ze
	SCJlym6FvE0VShbm1UwJMf2VoVayBfjTQzsV
X-Google-Smtp-Source: ABdhPJxEuUIFiMh4EnctQ8J6zIRaaO7NvwqJBoutsJZI0PdtBnDpxPn7CKb8/RnmN8nkTlyaFyGzxA==
X-Received: by 2002:a37:a514:: with SMTP id o20mr12514461qke.374.1600096464163;
        Mon, 14 Sep 2020 08:14:24 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id g64sm14900510qkf.71.2020.09.14.08.14.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 08:14:23 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe][PATCH 5/5] arch-armv8-2a.inc: Add tunes for supported ARMv8.2a cores
Date: Mon, 14 Sep 2020 11:13:59 -0400
Message-Id: <20200914151359.11240-6-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200914151359.11240-1-jon.mason@arm.com>
References: <20200914151359.11240-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add tunes for all the ARMv8.2a cores currently supported in GCC.  This
is: Cortex-A65, Cortex-A65AE, Cortex-A75, Cortex-A76, Cortex-A76AE,
Cortex-A77, Neoverse-E1, Neoverse-N1, Cortex-A75-Cortex-A55, and
Cortex-A76-Cortex-A55.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../machine/include/arm/arch-armv8-2a.inc     | 139 ++++++++++++++++++
 1 file changed, 139 insertions(+)

diff --git a/meta/conf/machine/include/arm/arch-armv8-2a.inc b/meta/conf/machine/include/arm/arch-armv8-2a.inc
index 3fc9658400a3..f620eafa013b 100644
--- a/meta/conf/machine/include/arm/arch-armv8-2a.inc
+++ b/meta/conf/machine/include/arm/arch-armv8-2a.inc
@@ -11,6 +11,145 @@ TUNE_FEATURES_tune-cortexa55                        = "aarch64 cortexa55 crypto"
 PACKAGE_EXTRA_ARCHS_tune-cortexa55                  = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} cortexa55"
 BASE_LIB_tune-cortexa55                             = "lib64"
 
+#
+# Tune Settings for Cortex-A65
+#
+TUNEVALID[cortexa65] = "Enable Cortex-A65 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa65', ' -mcpu=cortex-a65', '', d)}"
+
+# Little Endian base configs
+AVAILTUNES                                         += "cortexa65"
+ARMPKGARCH_tune-cortexa65                           = "cortexa65"
+TUNE_FEATURES_tune-cortexa65                        = "aarch64 cortexa65 crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa65                  = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} cortexa65"
+BASE_LIB_tune-cortexa65                             = "lib64"
+
+#
+# Tune Settings for Cortex-A65AE
+#
+TUNEVALID[cortexa65ae] = "Enable Cortex-A65AE specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa65ae', ' -mcpu=cortex-a65ae', '', d)}"
+
+# Little Endian base configs
+AVAILTUNES                                         += "cortexa65ae"
+ARMPKGARCH_tune-cortexa65ae                         = "cortexa65ae"
+TUNE_FEATURES_tune-cortexa65ae                      = "aarch64 cortexa65ae crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa65ae                = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} cortexa65ae"
+BASE_LIB_tune-cortexa65ae                           = "lib64"
+
+#
+# Tune Settings for Cortex-A75
+#
+TUNEVALID[cortexa75] = "Enable Cortex-A75 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa75', ' -mcpu=cortex-a75', '', d)}"
+
+# Little Endian base configs
+AVAILTUNES                                         += "cortexa75"
+ARMPKGARCH_tune-cortexa75                           = "cortexa75"
+TUNE_FEATURES_tune-cortexa75                        = "aarch64 cortexa75 crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa75                  = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} cortexa75"
+BASE_LIB_tune-cortexa75                             = "lib64"
+
+#
+# Tune Settings for Cortex-A76
+#
+TUNEVALID[cortexa76] = "Enable Cortex-A76 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa76', ' -mcpu=cortex-a76', '', d)}"
+
+# Little Endian base configs
+AVAILTUNES                                         += "cortexa76"
+ARMPKGARCH_tune-cortexa76                           = "cortexa76"
+TUNE_FEATURES_tune-cortexa76                        = "aarch64 cortexa76 crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa76                  = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} cortexa76"
+BASE_LIB_tune-cortexa76                             = "lib64"
+
+#
+# Tune Settings for Cortex-A76AE
+#
+TUNEVALID[cortexa76ae] = "Enable Cortex-A76AE specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa76ae', ' -mcpu=cortex-a76ae', '', d)}"
+
+# Little Endian base configs
+AVAILTUNES                                         += "cortexa76ae"
+ARMPKGARCH_tune-cortexa76ae                         = "cortexa76ae"
+TUNE_FEATURES_tune-cortexa76ae                      = "aarch64 cortexa76ae crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa76ae                = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} cortexa76ae"
+BASE_LIB_tune-cortexa76ae                           = "lib64"
+
+#
+# Tune Settings for Cortex-A77
+#
+TUNEVALID[cortexa77] = "Enable Cortex-A77 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa77', ' -mcpu=cortex-a77', '', d)}"
+
+# Little Endian base configs
+AVAILTUNES                                         += "cortexa77"
+ARMPKGARCH_tune-cortexa77                           = "cortexa77"
+TUNE_FEATURES_tune-cortexa77                        = "aarch64 cortexa77 crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa77                  = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} cortexa77"
+BASE_LIB_tune-cortexa77                             = "lib64"
+
+#
+# Tune Settings for Neoverse-E1
+#
+TUNEVALID[neoversee1] = "Enable Neoverse-E1 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'neoversee1', ' -mcpu=neoverse-e1', '', d)}"
+
+# Little Endian base configs
+AVAILTUNES                                         += "neoversee1"
+ARMPKGARCH_tune-neoversee1                          = "neoversee1"
+TUNE_FEATURES_tune-neoversee1                       = "aarch64 neoversee1 crypto"
+PACKAGE_EXTRA_ARCHS_tune-neoversee1                 = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} neoversee1"
+BASE_LIB_tune-neoversee1                            = "lib64"
+
+#
+# Tune Settings for Neoverse-N1
+#
+TUNEVALID[neoversen1] = "Enable Neoverse-N1 specific processor optimizations"
+# Note: Neoverse was called Ares, and GCC will accept "ares" in place of "neoverse-n1"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'neoversen1', ' -mcpu=neoverse-n1', '', d)}"
+
+# Little Endian base configs
+AVAILTUNES                                         += "neoversen1"
+ARMPKGARCH_tune-neoversen1                          = "neoversen1"
+TUNE_FEATURES_tune-neoversen1                       = "aarch64 neoversen1 crypto"
+PACKAGE_EXTRA_ARCHS_tune-neoversen1                 = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} neoversen1"
+BASE_LIB_tune-neoversen1                            = "lib64"
+
+#
+# Tune Settings for big.LITTLE Cortex-A75 - Cortex-A55
+#
+TUNEVALID[cortexa75-cortexa55] = "Enable big.LITTLE Cortex-A75.Cortex-A55 specific processor optimizations"
+MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa75-cortexa55", "cortexa75-cortexa55:", "" ,d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa75-cortexa55", " -mcpu=cortex-a75.cortex-a55", "", d)}"
+
+AVAILTUNES                                         += "cortexa75-cortexa55 cortexa75-cortexa55-crypto"
+ARMPKGARCH_tune-cortexa75-cortexa55                 = "cortexa75-cortexa55"
+ARMPKGARCH_tune-cortexa75-cortexa55-crypto          = "cortexa75-cortexa55-crypto"
+TUNE_FEATURES_tune-cortexa75-cortexa55              = "aarch64 cortexa75-cortexa55"
+TUNE_FEATURES_tune-cortexa75-cortexa55-crypto       = "${TUNE_FEATURES_tune-cortexa75-cortexa55} crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa75-cortexa55        = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a} cortexa75-cortexa55"
+PACKAGE_EXTRA_ARCHS_tune-cortexa75-cortexa55-crypto = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} cortexa75-cortexa55 cortexa75-cortexa55-crypto"
+BASE_LIB_tune-cortexa75-cortexa55                    = "lib64"
+BASE_LIB_tune-cortexa75-cortexa55-crypto             = "lib64"
+
+#
+# Tune Settings for big.LITTLE Cortex-A76 - Cortex-A55
+#
+TUNEVALID[cortexa76-cortexa55] = "Enable big.LITTLE Cortex-A76.Cortex-A55 specific processor optimizations"
+MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa76-cortexa55", "cortexa76-cortexa55:", "" ,d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa76-cortexa55", " -mcpu=cortex-a76.cortex-a55", "", d)}"
+
+AVAILTUNES                                         += "cortexa76-cortexa55 cortexa76-cortexa55-crypto"
+ARMPKGARCH_tune-cortexa76-cortexa55                 = "cortexa76-cortexa55"
+ARMPKGARCH_tune-cortexa76-cortexa55-crypto          = "cortexa76-cortexa55-crypto"
+TUNE_FEATURES_tune-cortexa76-cortexa55              = "aarch64 cortexa76-cortexa55"
+TUNE_FEATURES_tune-cortexa76-cortexa55-crypto       = "${TUNE_FEATURES_tune-cortexa76-cortexa55} crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa76-cortexa55        = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a} cortexa76-cortexa55"
+PACKAGE_EXTRA_ARCHS_tune-cortexa76-cortexa55-crypto = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} cortexa76-cortexa55 cortexa76-cortexa55-crypto"
+BASE_LIB_tune-cortexa76-cortexa55                    = "lib64"
+BASE_LIB_tune-cortexa76-cortexa55-crypto             = "lib64"
+
 #
 # Defaults for ARMv8-a
 #
-- 
2.20.1

