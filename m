Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web11.36213.1601298379897176080
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2020 06:06:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=E/jLUrp6;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.65, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f65.google.com with SMTP id db4so379659qvb.4
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2020 06:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=R7t132d2/3XMARTExRO66NBlulNCgBnhaScaK99kkGE=;
        b=E/jLUrp6dixmgkq7sSm5Qhh2rDhuJFU8idEOBa9pFmQcph5HkVKnEcCbXDNhZdp9zr
         MdVNy36hq6fShghSQ33pB5dOfPleN+8YZkespnQqVfMzrQ7nR83cPXMPU/7//EGx9qgy
         PYCwSQFbW/xT+3ZYdYE4e9f2Bthe9fjnx+dPa3PjM7+Fn5G6F14rW/ASVXAuqdjzYQI/
         uapIi/eTCIUY58+eMT4ShBwib1uqUHqZ2Pvtsl/Adk2IDy6rbmGf4sTlt9nVqLYIlEZR
         utT7JY5RMDxG5rYajbOMmv+wdIspVcXe25XHd7BhO5fofL1391sx7DrpflRta+ODdGlB
         4VDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R7t132d2/3XMARTExRO66NBlulNCgBnhaScaK99kkGE=;
        b=hHe+YIS/8dkqNTUcq8qTlCi/cWXFMNWKXXj6avT9P7e9+GsG29MUQb9jZZ7+BXipN5
         PTB1TDKDZagtU56uM+PPUjPB0QS+we0QvIgPxZymo6NyHVaKJU3P5GE7Pl9CfsnH+eaz
         /E+X4mPLS7mJSDUlEV8XpFlM1/zDTByv/5mlsXhquf7ioEqWCkkiibjov699Gqygoz3F
         v88V8e2PfwtDu1SwmfUXJ5NRcQlUwnW55KilXGXoG1NBcCxOvfl9A7Uo8KCEN0MOJoRX
         481xtTrrHVfJRpKXzSMxpVjb3NYwthCdDSWMZ4AqobYNislSRLhzc/PhhibJvzZKj6+b
         Q9Hw==
X-Gm-Message-State: AOAM533t1NwLuwa8ZIrr/je1ZHxFgLzJFtY0XJBtvAsiCbckB2+Iyur0
	apaWBxMyP0LwmRizo5tAZX6iOdZ4BY4TsxrQ
X-Google-Smtp-Source: ABdhPJz+BOB6hqC1v+8MN2eDH0r6y4Q1tg08HkgUy+qrkMuyN5XNXLg6b+cBePkmEldRygz9hp26Nw==
X-Received: by 2002:a0c:e904:: with SMTP id a4mr11625931qvo.24.1601298377726;
        Mon, 28 Sep 2020 06:06:17 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id d22sm883413qkj.93.2020.09.28.06.06.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 06:06:17 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe][PATCH v4 5/6] armv8/tunes: Add tunes for supported ARMv8.2a cores
Date: Mon, 28 Sep 2020 09:05:50 -0400
Message-Id: <20200928130551.21346-6-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200928130551.21346-1-jon.mason@arm.com>
References: <20200928130551.21346-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add tunes for all the ARMv8.2a cores currently supported in GCC.  This
is: Cortex-A65, Cortex-A65AE, Cortex-A75, Cortex-A76, Cortex-A76AE,
Cortex-A77, Neoverse-E1, Neoverse-N1, Cortex-A75-Cortex-A55, and
Cortex-A76-Cortex-A55.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta/conf/machine/include/tune-cortexa65.inc  | 16 +++++++++++++++
 .../conf/machine/include/tune-cortexa65ae.inc | 16 +++++++++++++++
 .../include/tune-cortexa75-cortexa55.inc      | 20 +++++++++++++++++++
 meta/conf/machine/include/tune-cortexa75.inc  | 16 +++++++++++++++
 .../include/tune-cortexa76-cortexa55.inc      | 20 +++++++++++++++++++
 meta/conf/machine/include/tune-cortexa76.inc  | 16 +++++++++++++++
 .../conf/machine/include/tune-cortexa76ae.inc | 16 +++++++++++++++
 meta/conf/machine/include/tune-cortexa77.inc  | 16 +++++++++++++++
 meta/conf/machine/include/tune-neoversee1.inc | 16 +++++++++++++++
 meta/conf/machine/include/tune-neoversen1.inc | 17 ++++++++++++++++
 10 files changed, 169 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-cortexa65.inc
 create mode 100644 meta/conf/machine/include/tune-cortexa65ae.inc
 create mode 100644 meta/conf/machine/include/tune-cortexa75-cortexa55.inc
 create mode 100644 meta/conf/machine/include/tune-cortexa75.inc
 create mode 100644 meta/conf/machine/include/tune-cortexa76-cortexa55.inc
 create mode 100644 meta/conf/machine/include/tune-cortexa76.inc
 create mode 100644 meta/conf/machine/include/tune-cortexa76ae.inc
 create mode 100644 meta/conf/machine/include/tune-cortexa77.inc
 create mode 100644 meta/conf/machine/include/tune-neoversee1.inc
 create mode 100644 meta/conf/machine/include/tune-neoversen1.inc

diff --git a/meta/conf/machine/include/tune-cortexa65.inc b/meta/conf/machine/include/tune-cortexa65.inc
new file mode 100644
index 000000000000..ecf17fbbe7dc
--- /dev/null
+++ b/meta/conf/machine/include/tune-cortexa65.inc
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
diff --git a/meta/conf/machine/include/tune-cortexa65ae.inc b/meta/conf/machine/include/tune-cortexa65ae.inc
new file mode 100644
index 000000000000..aea47d077894
--- /dev/null
+++ b/meta/conf/machine/include/tune-cortexa65ae.inc
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
diff --git a/meta/conf/machine/include/tune-cortexa75-cortexa55.inc b/meta/conf/machine/include/tune-cortexa75-cortexa55.inc
new file mode 100644
index 000000000000..9c45fe9c9617
--- /dev/null
+++ b/meta/conf/machine/include/tune-cortexa75-cortexa55.inc
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
diff --git a/meta/conf/machine/include/tune-cortexa75.inc b/meta/conf/machine/include/tune-cortexa75.inc
new file mode 100644
index 000000000000..d019450da7b1
--- /dev/null
+++ b/meta/conf/machine/include/tune-cortexa75.inc
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
diff --git a/meta/conf/machine/include/tune-cortexa76-cortexa55.inc b/meta/conf/machine/include/tune-cortexa76-cortexa55.inc
new file mode 100644
index 000000000000..cae8ffed745a
--- /dev/null
+++ b/meta/conf/machine/include/tune-cortexa76-cortexa55.inc
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
diff --git a/meta/conf/machine/include/tune-cortexa76.inc b/meta/conf/machine/include/tune-cortexa76.inc
new file mode 100644
index 000000000000..ae3661a0c42c
--- /dev/null
+++ b/meta/conf/machine/include/tune-cortexa76.inc
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
diff --git a/meta/conf/machine/include/tune-cortexa76ae.inc b/meta/conf/machine/include/tune-cortexa76ae.inc
new file mode 100644
index 000000000000..d368aa104d0f
--- /dev/null
+++ b/meta/conf/machine/include/tune-cortexa76ae.inc
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
diff --git a/meta/conf/machine/include/tune-cortexa77.inc b/meta/conf/machine/include/tune-cortexa77.inc
new file mode 100644
index 000000000000..048fa319e200
--- /dev/null
+++ b/meta/conf/machine/include/tune-cortexa77.inc
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
diff --git a/meta/conf/machine/include/tune-neoversee1.inc b/meta/conf/machine/include/tune-neoversee1.inc
new file mode 100644
index 000000000000..b82c9acb6c4d
--- /dev/null
+++ b/meta/conf/machine/include/tune-neoversee1.inc
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
diff --git a/meta/conf/machine/include/tune-neoversen1.inc b/meta/conf/machine/include/tune-neoversen1.inc
new file mode 100644
index 000000000000..6c6e889c0f2d
--- /dev/null
+++ b/meta/conf/machine/include/tune-neoversen1.inc
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

