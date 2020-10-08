Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web11.13371.1602167710665447135
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2020 07:35:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=buCVktJ0;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.67, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f67.google.com with SMTP id ev17so3166463qvb.3
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2020 07:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=O7SRXJvp7F+MqEFwWrnbyE/d2laae8Y3sSkr6cK7rXg=;
        b=buCVktJ08ZYWIRSaS9x5KvQVM+tHqpWoZmOOOZMAbE0fW12BTIJ4Uhlhsdt23LfM2B
         0wO0LVRibvUlR629P/0RC6KAXlg0r/NAM5BvVhVUVFWdzgKBCfAwCVO09pKCVsYGStJv
         EcuRWgs0h2Rz5dUW/K0P3hT+u0YFwaceZlb+JfhyypJfQ98LFsh71URL8C8KmWHGWvhY
         rsVLZJCCJ8D6wEpjyQtUkRKqEhbHVxezP8JdDkIOt5jerhtDGLTfyzxTEyFF0QCfdy1/
         0/W4gOoAmeYmlujL+Ef3MgXYy7t4rlQ6PDgPLP2eHdcgdq+4SAJsipXsB1cAAe5htWcP
         JORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O7SRXJvp7F+MqEFwWrnbyE/d2laae8Y3sSkr6cK7rXg=;
        b=aRgP3CxNgUAjYh4XVnJo8fOIWz8UNnyXH4q//5bq80GnCMpFBW40sW1D3BYKIJHU6Y
         iRAkxIuyRdigH+WOc2JtzyjJhZnWnVxFgXOGyJJSuMlOx86J+ts1zQUUCknvDAz3QP01
         sFDjPFUfPNk7/43f34AXPc7n0x0gydblfPY6a6VHq8/NuG6xQCvY5WhyZN38IwwfgaP7
         rn3QRAMi7fukhTA+eGMYK3hHLq75YRzDrGzILqKy2wTk7KupzY5PTNxgdQ7FpxVUdwV2
         yUCEYieqGZ91L76hTL4X2OJhRaIDmtKLvzDU+8jfLuIzAIz8fsMnTu/CRzCKWW5mZwaM
         8dgg==
X-Gm-Message-State: AOAM530hcU5+sPTHpsVDW8lqGc/Q2mPB4FNDUHtDBGjUoV6R/JCFYgfT
	vdgVufdfOB5fOR/rkQwIPeeXGSJRn4FXz1/9
X-Google-Smtp-Source: ABdhPJzBoTiFVvixGC0xqbZvLuujFFpO731YPycw1ABcQOLJRx3s/5cHloyzOVmHZgkXiexN6oPbrg==
X-Received: by 2002:ad4:55ea:: with SMTP id bu10mr1345647qvb.28.1602167709385;
        Thu, 08 Oct 2020 07:35:09 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id s10sm3990130qkg.61.2020.10.08.07.35.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 07:35:08 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe][PATCH v5 3/4] armv8/tunes: Add tunes for supported ARMv8a cores
Date: Thu,  8 Oct 2020 10:34:50 -0400
Message-Id: <20201008143451.18668-4-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201008143451.18668-1-jon.mason@arm.com>
References: <20201008143451.18668-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add tunes for all the ARMv8a cores currently supported in GCC.  This
is: Cortex-A34, Cortex-A73, and Cortex-A73-Cortex-A35.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../include/arm/armv8a/tune-cortexa34.inc     | 20 ++++++++++++++++++
 .../arm/armv8a/tune-cortexa73-cortexa35.inc   | 21 +++++++++++++++++++
 .../include/arm/armv8a/tune-cortexa73.inc     | 16 ++++++++++++++
 3 files changed, 57 insertions(+)
 create mode 100644 meta/conf/machine/include/arm/armv8a/tune-cortexa34.inc
 create mode 100644 meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa35.inc
 create mode 100644 meta/conf/machine/include/arm/armv8a/tune-cortexa73.inc

diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa34.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa34.inc
new file mode 100644
index 000000000000..f7d4c87df8a3
--- /dev/null
+++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa34.inc
@@ -0,0 +1,20 @@
+#
+# Tune Settings for Cortex-A34
+#
+DEFAULTTUNE ?= "cortexa34"
+
+TUNEVALID[cortexa34] = "Enable Cortex-A34 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa34', ' -mcpu=cortex-a34', '', d)}"
+
+require conf/machine/include/arm/arch-armv8a.inc
+
+# Little Endian base configs
+AVAILTUNES                                += "cortexa34 cortexa34-crypto"
+ARMPKGARCH_tune-cortexa34                  = "cortexa34"
+ARMPKGARCH_tune-cortexa34-crypto           = "cortexa34"
+TUNE_FEATURES_tune-cortexa34               = "${TUNE_FEATURES_tune-armv8a-crc} cortexa34"
+TUNE_FEATURES_tune-cortexa34-crypto        = "${TUNE_FEATURES_tune-cortexa34} crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa34         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa34"
+PACKAGE_EXTRA_ARCHS_tune-cortexa34-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa34 cortexa34-crypto"
+BASE_LIB_tune-cortexa34                    = "lib64"
+BASE_LIB_tune-cortexa34-crypto             = "lib64"
diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa35.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa35.inc
new file mode 100644
index 000000000000..927296c2223a
--- /dev/null
+++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa35.inc
@@ -0,0 +1,21 @@
+#
+# Tune Settings for big.LITTLE Cortex-A73 - Cortex-A35
+#
+DEFAULTTUNE ?= "cortexa73-cortexa35"
+
+TUNEVALID[cortexa73-cortexa35] = "Enable big.LITTLE Cortex-A73.Cortex-A35 specific processor optimizations"
+MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-cortexa35", "cortexa73-cortexa35:", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-cortexa35", " -mcpu=cortex-a73.cortex-a35", "", d)}"
+
+require conf/machine/include/arm/arch-armv8a.inc
+
+# cortexa73.cortexa35 implies crc support
+AVAILTUNES                                          += "cortexa73-cortexa35 cortexa73-cortexa35-crypto"
+ARMPKGARCH_tune-cortexa73-cortexa35                  = "cortexa73-cortexa35"
+ARMPKGARCH_tune-cortexa73-cortexa35-crypto           = "cortexa73-cortexa35-crypto"
+TUNE_FEATURES_tune-cortexa73-cortexa35               = "${TUNE_FEATURES_tune-armv8a-crc} cortexa73-cortexa35"
+TUNE_FEATURES_tune-cortexa73-cortexa35-crypto        = "${TUNE_FEATURES_tune-cortexa73-cortexa35} crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa35         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa73-cortexa35"
+PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa35-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa73-cortexa35 cortexa73-cortexa35-crypto"
+BASE_LIB_tune-cortexa73-cortexa35                    = "lib64"
+BASE_LIB_tune-cortexa73-cortexa35-crypto             = "lib64"
diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa73.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa73.inc
new file mode 100644
index 000000000000..ed2deb96b0c3
--- /dev/null
+++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa73.inc
@@ -0,0 +1,16 @@
+#
+# Tune Settings for Cortex-A73
+#
+DEFAULTTUNE ?= "cortexa73"
+
+TUNEVALID[cortexa73] = "Enable Cortex-A73 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa73', ' -mcpu=cortex-a73', '', d)}"
+
+require conf/machine/include/arm/arch-armv8a.inc
+
+# Little Endian base configs
+AVAILTUNES                                += "cortexa73"
+ARMPKGARCH_tune-cortexa73                  = "cortexa73"
+TUNE_FEATURES_tune-cortexa73               = "${TUNE_FEATURES_tune-armv8a-crc-crypto} cortexa73"
+PACKAGE_EXTRA_ARCHS_tune-cortexa73         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa73"
+BASE_LIB_tune-cortexa73                    = "lib64"
-- 
2.20.1

