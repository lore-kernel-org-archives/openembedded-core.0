Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web10.8883.1599691583311510974
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 15:46:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=G3EgN4wH;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.193, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f193.google.com with SMTP id 19so3376316qtp.1
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2020 15:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=azcpzum9FiM74+YksfoQb+j1y2JCbKv2FFv14KFIhp0=;
        b=G3EgN4wHFbnlTyyWIQQLTZ0qOIFTpLm4qBs1mpEGeeC6jxEoW2ANPr6+T8+oOFaBrq
         aWShShg7ykqK+rmrflDjPTeCoFJF+G3EJQOlTBSKojXDlOSQ9mdsskkv9FWou0eGUS/7
         xyRjdhgsBg/sA5w+pdzDwdKNsX+Z3SqWmzZ/ogYc5O38dg/R+3BimrtwJ+hcMZoo0FP2
         gNBK6dy96aKQSqR9/a4r1R2sVxx0lo10Qdi5tqgY2dsHixOYq7Aw/oZ6YkBSOSEPtf90
         7c/68jGT5f3UJoZUZILpmh2zRdnXDZe41jE22O51CeN6ULR0XVEJ4uzwjMKkNhxAchqQ
         sn1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=azcpzum9FiM74+YksfoQb+j1y2JCbKv2FFv14KFIhp0=;
        b=imJShtiPQuwgZJXdEE7g1uwDCOpFzz3p4O43dRFijb/RVIvM97ZryUXDd+cktTy7VJ
         5FIdSxdN9eOatHgh1iS4tcKCKKrt9I++YYqMWy2YW0VFHJrHx5uKsSRpjFmwkeKGzW5M
         ThiuSUSvjt6ol4HN/9el/CaaGK/QeKAm9DeM6GOSnIlm+qaBdQOeVZuUoMfXHEX1N4EJ
         s/r7z93xC289yHBEpfnd9w6MmCRid5oNkOlLeGg76cFxtEWUjrHRtFCjgQO9yWq01wyv
         VLH29glRYb+AU6wfay4E8Hs6YLHLlMl18r4WQJXrfZYlvI1QZvDmi7Gx/tdBVSPas/1x
         LJKg==
X-Gm-Message-State: AOAM532bIYKjjETQoSEfbGEAnk/+AWOskfg5sbAgOo4kr4n2tF6Ly+bm
	pTAZ21+9wjm1O5QezMRpTe3aofyFYSjhwzuv
X-Google-Smtp-Source: ABdhPJzVMngc/CY2HZEqQPpS2uyKmYWmvVgf6TvKMLNjyHtlh4JwAPQlC1Zbt+Eqolij3KUAfbBhKQ==
X-Received: by 2002:ac8:1aae:: with SMTP id x43mr5354401qtj.30.1599691581940;
        Wed, 09 Sep 2020 15:46:21 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id v56sm4907431qtc.49.2020.09.09.15.46.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 15:46:21 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe][RFC 6/6] arch-armv8-2a.inc: Add tunes for supported ARMv8.2a cores
Date: Wed,  9 Sep 2020 18:45:35 -0400
Message-Id: <20200909224535.27164-7-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200909224535.27164-1-jon.mason@arm.com>
References: <20200909224535.27164-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add tunes for all the ARMv8.2a cores currently supported in GCC.  This
is: Cortex-A65, Cortex-A65AE, Cortex-A75, Cortex-A76, Cortex-A76AE,
Cortex-A77, Neoverse-E1, Neoverse-N1, Cortex-A75-Cortex-A55, and
Cortex-A76-Cortex-A55.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../machine/include/arm/arch-armv8-2a.inc     | 127 ++++++++++++++++++
 1 file changed, 127 insertions(+)

diff --git a/meta/conf/machine/include/arm/arch-armv8-2a.inc b/meta/conf/machine/include/arm/arch-armv8-2a.inc
index 38564a17d98b..6e46b9104813 100644
--- a/meta/conf/machine/include/arm/arch-armv8-2a.inc
+++ b/meta/conf/machine/include/arm/arch-armv8-2a.inc
@@ -10,6 +10,133 @@ ARMPKGARCH_tune-cortexa55                           = "cortexa55"
 TUNE_FEATURES_tune-cortexa55                        = "aarch64 cortexa55 crypto"
 PACKAGE_EXTRA_ARCHS_tune-cortexa55                  = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} cortexa55"
 
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
+
 #
 # Defaults for ARMv8-a
 #
-- 
2.20.1

