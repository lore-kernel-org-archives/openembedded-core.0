Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web12.13534.1602167715242233333
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2020 07:35:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=tLj6udiD;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f195.google.com with SMTP id d20so7212131qka.5
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2020 07:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=XBKvlMtuuDeoGHq+zil0slXTVXNhE9VX3EUwNhaORfg=;
        b=tLj6udiDU2ltiwvKDU+PVjaDO4IxwmaDyT42+wuvN9nOHCz+Nt2jnt/C+spTxJQyOF
         IoAkQCFNLVescZGkaAB69qKTTXPLwbopkKS8yjpaAlUKqhUIZFDm1ZpYHi/tZT4XL/Y1
         Zg6lYn27XepwjVPeZ1Kte/lohtLy0oXfCmDcEOQPmCRRK+NdsEJvRBxI17fceaWdss3P
         +DjBZf7gplJSeA7GwuIGySYFEBGDffKazOzDUethgaRs+ZdLXaaXlBYR250YLGE9kY9H
         qKuM1vzII1QxuS95ggLax01HLpHy1LJO0NN0sg3bmrUe6WmaHG3pksr5hwcA9FCOO/gb
         GtTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XBKvlMtuuDeoGHq+zil0slXTVXNhE9VX3EUwNhaORfg=;
        b=jBN4sqcw5URnD6tK9voO/gaHZFl1g4ND0SoW3lm5PLQ5HgfKJ1tCKPSm4E/gBS33Ol
         ejlQPssMXRJHB4sIBdmIJ+IIpQdKNjr0piJaAHTlDmRvNc0jEGnObrzfl3hSbbki46Rb
         is+pGKF1u/A7pTJeZz8Nqyj11Wn+lb+s6BqH9vQbCXifPsIZYlEcytb2jCVYglGDiZpc
         DY/wKE227MdOMvpfCfHrbxrWGJtO2V9yTptgFKaGCFACDio1Et81+zltA1A4Or8An1cD
         d+sRE3KN3MZRdKtQ4XQugkdR5VKcaVQYP8YkzGkyHjtMei5Uio9iXRTwftL+qwY86bFx
         niqg==
X-Gm-Message-State: AOAM5329GkClpvqAm3EbfCyFcmpqo9AZ+0BuJqnSI+Yu91C7vrgWT6WM
	r/lP7hPq/LqoX8GLCijsXGAGJ6YCsLnZwVcL
X-Google-Smtp-Source: ABdhPJzJ6TlebzYXa3njE+AdezMqyZIKGAREc3IHrMG4fUhss68YwS+fs5OtxZtP03/w5Dbfc46X0w==
X-Received: by 2002:a05:620a:98a:: with SMTP id x10mr1188610qkx.328.1602167713756;
        Thu, 08 Oct 2020 07:35:13 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id l92sm3953916qte.38.2020.10.08.07.35.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 07:35:13 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe][PATCH v5 4/4] armv8/tunes: Add tunes for supported ARMv8.2a cores
Date: Thu,  8 Oct 2020 10:34:51 -0400
Message-Id: <20201008143451.18668-5-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201008143451.18668-1-jon.mason@arm.com>
References: <20201008143451.18668-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add tunes for all the ARMv8.2a cores currently supported in GCC.  This
is: Cortex-A65, Cortex-A65AE, Cortex-A75, Cortex-A76, Cortex-A76AE,
Cortex-A77, Neoverse-E1, Neoverse-N1, Cortex-A75-Cortex-A55, and
Cortex-A76-Cortex-A55.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../include/arm/armv8-2a/tune-cortexa65.inc   | 16 +++++++++++++++
 .../include/arm/armv8-2a/tune-cortexa65ae.inc | 16 +++++++++++++++
 .../arm/armv8-2a/tune-cortexa75-cortexa55.inc | 20 +++++++++++++++++++
 .../include/arm/armv8-2a/tune-cortexa75.inc   | 16 +++++++++++++++
 .../arm/armv8-2a/tune-cortexa76-cortexa55.inc | 20 +++++++++++++++++++
 .../include/arm/armv8-2a/tune-cortexa76.inc   | 16 +++++++++++++++
 .../include/arm/armv8-2a/tune-cortexa76ae.inc | 16 +++++++++++++++
 .../include/arm/armv8-2a/tune-cortexa77.inc   | 16 +++++++++++++++
 .../include/arm/armv8-2a/tune-neoversee1.inc  | 16 +++++++++++++++
 .../include/arm/armv8-2a/tune-neoversen1.inc  | 17 ++++++++++++++++
 10 files changed, 169 insertions(+)
 create mode 100644 meta/conf/machine/include/arm/armv8-2a/tune-cortexa65.inc
 create mode 100644 meta/conf/machine/include/arm/armv8-2a/tune-cortexa65ae.inc
 create mode 100644 meta/conf/machine/include/arm/armv8-2a/tune-cortexa75-cortexa55.inc
 create mode 100644 meta/conf/machine/include/arm/armv8-2a/tune-cortexa75.inc
 create mode 100644 meta/conf/machine/include/arm/armv8-2a/tune-cortexa76-cortexa55.inc
 create mode 100644 meta/conf/machine/include/arm/armv8-2a/tune-cortexa76.inc
 create mode 100644 meta/conf/machine/include/arm/armv8-2a/tune-cortexa76ae.inc
 create mode 100644 meta/conf/machine/include/arm/armv8-2a/tune-cortexa77.inc
 create mode 100644 meta/conf/machine/include/arm/armv8-2a/tune-neoversee1.inc
 create mode 100644 meta/conf/machine/include/arm/armv8-2a/tune-neoversen1.inc

diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa65.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa65.inc
new file mode 100644
index 000000000000..ecf17fbbe7dc
--- /dev/null
+++ b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa65.inc
@@ -0,0 +1,16 @@
+#
+# Tune Settings for Cortex-A65
+#
+DEFAULTTUNE ?= "cortexa65"
+
+TUNEVALID[cortexa65] = "Enable Cortex-A65 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa65', ' -mcpu=cortex-a65', '', d)}"
+
+require conf/machine/include/arm/arch-armv8-2a.inc
+
+# Little Endian base configs
+AVAILTUNES                                         += "cortexa65"
+ARMPKGARCH_tune-cortexa65                           = "cortexa65"
+TUNE_FEATURES_tune-cortexa65                        = "${TUNE_FEATURES_tune-armv8-2a-crypto} cortexa55"
+PACKAGE_EXTRA_ARCHS_tune-cortexa65                  = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} cortexa65"
+BASE_LIB_tune-cortexa65                             = "lib64"
diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa65ae.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa65ae.inc
new file mode 100644
index 000000000000..aea47d077894
--- /dev/null
+++ b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa65ae.inc
@@ -0,0 +1,16 @@
+#
+# Tune Settings for Cortex-A65AE
+#
+DEFAULTTUNE                                        ?= "cortexa65ae"
+
+TUNEVALID[cortexa65ae] = "Enable Cortex-A65AE specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa65ae', ' -mcpu=cortex-a65ae', '', d)}"
+
+require conf/machine/include/arm/arch-armv8-2a.inc
+
+# Little Endian base configs
+AVAILTUNES                                         += "cortexa65ae"
+ARMPKGARCH_tune-cortexa65ae                         = "cortexa65ae"
+TUNE_FEATURES_tune-cortexa65ae                      = "${TUNE_FEATURES_tune-armv8-2a-crypto} cortexa65ae"
+PACKAGE_EXTRA_ARCHS_tune-cortexa65ae                = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} cortexa65ae"
+BASE_LIB_tune-cortexa65ae                           = "lib64"
diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa75-cortexa55.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa75-cortexa55.inc
new file mode 100644
index 000000000000..9c45fe9c9617
--- /dev/null
+++ b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa75-cortexa55.inc
@@ -0,0 +1,20 @@
+#
+# Tune Settings for big.LITTLE Cortex-A75 - Cortex-A55
+#
+DEFAULTTUNE                                        ?= "cortexa75-cortexa55"
+
+TUNEVALID[cortexa75-cortexa55] = "Enable big.LITTLE Cortex-A75.Cortex-A55 specific processor optimizations"
+MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa75-cortexa55", "cortexa75-cortexa55:", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa75-cortexa55", " -mcpu=cortex-a75.cortex-a55", "", d)}"
+
+require conf/machine/include/arm/arch-armv8-2a.inc
+
+AVAILTUNES                                         += "cortexa75-cortexa55 cortexa75-cortexa55-crypto"
+ARMPKGARCH_tune-cortexa75-cortexa55                 = "cortexa75-cortexa55"
+ARMPKGARCH_tune-cortexa75-cortexa55-crypto          = "cortexa75-cortexa55-crypto"
+TUNE_FEATURES_tune-cortexa75-cortexa55              = "${TUNE_FEATURES_tune-armv8-2a} cortexa75-cortexa55"
+TUNE_FEATURES_tune-cortexa75-cortexa55-crypto       = "${TUNE_FEATURES_tune-cortexa75-cortexa55} crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa75-cortexa55        = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a} cortexa75-cortexa55"
+PACKAGE_EXTRA_ARCHS_tune-cortexa75-cortexa55-crypto = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} cortexa75-cortexa55 cortexa75-cortexa55-crypto"
+BASE_LIB_tune-cortexa75-cortexa55                   = "lib64"
+BASE_LIB_tune-cortexa75-cortexa55-crypto            = "lib64"
diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa75.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa75.inc
new file mode 100644
index 000000000000..d019450da7b1
--- /dev/null
+++ b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa75.inc
@@ -0,0 +1,16 @@
+#
+# Tune Settings for Cortex-A75
+#
+DEFAULTTUNE ?= "cortexa75"
+
+TUNEVALID[cortexa75] = "Enable Cortex-A75 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa75', ' -mcpu=cortex-a75', '', d)}"
+
+require conf/machine/include/arm/arch-armv8-2a.inc
+
+# Little Endian base configs
+AVAILTUNES                                         += "cortexa75"
+ARMPKGARCH_tune-cortexa75                           = "cortexa75"
+TUNE_FEATURES_tune-cortexa75                        = "${TUNE_FEATURES_tune-armv8-2a-crypto} cortexa75"
+PACKAGE_EXTRA_ARCHS_tune-cortexa75                  = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} cortexa75"
+BASE_LIB_tune-cortexa75                             = "lib64"
diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76-cortexa55.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76-cortexa55.inc
new file mode 100644
index 000000000000..cae8ffed745a
--- /dev/null
+++ b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76-cortexa55.inc
@@ -0,0 +1,20 @@
+#
+# Tune Settings for big.LITTLE Cortex-A76 - Cortex-A55
+#
+DEFAULTTUNE                                        ?= "cortexa76-cortexa55"
+
+TUNEVALID[cortexa76-cortexa55] = "Enable big.LITTLE Cortex-A76.Cortex-A55 specific processor optimizations"
+MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa76-cortexa55", "cortexa76-cortexa55:", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa76-cortexa55", " -mcpu=cortex-a76.cortex-a55", "", d)}"
+
+require conf/machine/include/arm/arch-armv8-2a.inc
+
+AVAILTUNES                                         += "cortexa76-cortexa55 cortexa76-cortexa55-crypto"
+ARMPKGARCH_tune-cortexa76-cortexa55                 = "cortexa76-cortexa55"
+ARMPKGARCH_tune-cortexa76-cortexa55-crypto          = "cortexa76-cortexa55-crypto"
+TUNE_FEATURES_tune-cortexa76-cortexa55              = "${TUNE_FEATURES_tune-armv8-2a} cortexa76-cortexa55"
+TUNE_FEATURES_tune-cortexa76-cortexa55-crypto       = "${TUNE_FEATURES_tune-cortexa76-cortexa55} crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa76-cortexa55        = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a} cortexa76-cortexa55"
+PACKAGE_EXTRA_ARCHS_tune-cortexa76-cortexa55-crypto = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} cortexa76-cortexa55 cortexa76-cortexa55-crypto"
+BASE_LIB_tune-cortexa76-cortexa55                   = "lib64"
+BASE_LIB_tune-cortexa76-cortexa55-crypto            = "lib64"
diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76.inc
new file mode 100644
index 000000000000..ae3661a0c42c
--- /dev/null
+++ b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76.inc
@@ -0,0 +1,16 @@
+#
+# Tune Settings for Cortex-A76
+#
+DEFAULTTUNE                                        ?= "cortexa76"
+
+TUNEVALID[cortexa76] = "Enable Cortex-A76 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa76', ' -mcpu=cortex-a76', '', d)}"
+
+require conf/machine/include/arm/arch-armv8-2a.inc
+
+# Little Endian base configs
+AVAILTUNES                                         += "cortexa76"
+ARMPKGARCH_tune-cortexa76                           = "cortexa76"
+TUNE_FEATURES_tune-cortexa76                        = "${TUNE_FEATURES_tune-armv8-2a-crypto} cortexa76"
+PACKAGE_EXTRA_ARCHS_tune-cortexa76                  = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} cortexa76"
+BASE_LIB_tune-cortexa76                             = "lib64"
diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76ae.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76ae.inc
new file mode 100644
index 000000000000..d368aa104d0f
--- /dev/null
+++ b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76ae.inc
@@ -0,0 +1,16 @@
+#
+# Tune Settings for Cortex-A76AE
+#
+DEFAULTTUNE                                        ?= "cortexa76ae"
+
+TUNEVALID[cortexa76ae] = "Enable Cortex-A76AE specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa76ae', ' -mcpu=cortex-a76ae', '', d)}"
+
+require conf/machine/include/arm/arch-armv8-2a.inc
+
+# Little Endian base configs
+AVAILTUNES                                         += "cortexa76ae"
+ARMPKGARCH_tune-cortexa76ae                         = "cortexa76ae"
+TUNE_FEATURES_tune-cortexa65ae                      = "${TUNE_FEATURES_tune-armv8-2a-crypto} cortexa76ae"
+PACKAGE_EXTRA_ARCHS_tune-cortexa76ae                = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} cortexa76ae"
+BASE_LIB_tune-cortexa76ae                           = "lib64"
diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa77.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa77.inc
new file mode 100644
index 000000000000..048fa319e200
--- /dev/null
+++ b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa77.inc
@@ -0,0 +1,16 @@
+#
+# Tune Settings for Cortex-A77
+#
+DEFAULTTUNE                                        ?= "cortexa77"
+
+TUNEVALID[cortexa77] = "Enable Cortex-A77 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa77', ' -mcpu=cortex-a77', '', d)}"
+
+require conf/machine/include/arm/arch-armv8-2a.inc
+
+# Little Endian base configs
+AVAILTUNES                                         += "cortexa77"
+ARMPKGARCH_tune-cortexa77                           = "cortexa77"
+TUNE_FEATURES_tune-cortexa77                        = "${TUNE_FEATURES_tune-armv8-2a-crypto} cortexa77"
+PACKAGE_EXTRA_ARCHS_tune-cortexa77                  = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} cortexa77"
+BASE_LIB_tune-cortexa77                             = "lib64"
diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-neoversee1.inc b/meta/conf/machine/include/arm/armv8-2a/tune-neoversee1.inc
new file mode 100644
index 000000000000..b82c9acb6c4d
--- /dev/null
+++ b/meta/conf/machine/include/arm/armv8-2a/tune-neoversee1.inc
@@ -0,0 +1,16 @@
+#
+# Tune Settings for Neoverse-E1
+#
+DEFAULTTUNE                                        ?= "neoversee1"
+
+TUNEVALID[neoversee1] = "Enable Neoverse-E1 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'neoversee1', ' -mcpu=neoverse-e1', '', d)}"
+
+require conf/machine/include/arm/arch-armv8-2a.inc
+
+# Little Endian base configs
+AVAILTUNES                                         += "neoversee1"
+ARMPKGARCH_tune-neoversee1                          = "neoversee1"
+TUNE_FEATURES_tune-neoversee1                       = "${TUNE_FEATURES_tune-armv8-2a-crypto} neoversee1"
+PACKAGE_EXTRA_ARCHS_tune-neoversee1                 = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} neoversee1"
+BASE_LIB_tune-neoversee1                            = "lib64"
diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-neoversen1.inc b/meta/conf/machine/include/arm/armv8-2a/tune-neoversen1.inc
new file mode 100644
index 000000000000..6c6e889c0f2d
--- /dev/null
+++ b/meta/conf/machine/include/arm/armv8-2a/tune-neoversen1.inc
@@ -0,0 +1,17 @@
+#
+# Tune Settings for Neoverse-N1
+#
+DEFAULTTUNE                                        ?= "neoversen1"
+
+TUNEVALID[neoversen1] = "Enable Neoverse-N1 specific processor optimizations"
+# Note: Neoverse was called Ares, and GCC will accept "ares" in place of "neoverse-n1"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'neoversen1', ' -mcpu=neoverse-n1', '', d)}"
+
+require conf/machine/include/arm/arch-armv8-2a.inc
+
+# Little Endian base configs
+AVAILTUNES                                         += "neoversen1"
+ARMPKGARCH_tune-neoversen1                          = "neoversen1"
+TUNE_FEATURES_tune-neoversen1                       = "${TUNE_FEATURES_tune-armv8-2a-crypto} neoversen1"
+PACKAGE_EXTRA_ARCHS_tune-neoversen1                 = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} neoversen1"
+BASE_LIB_tune-neoversen1                            = "lib64"
-- 
2.20.1

