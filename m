Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web12.36234.1601298374556430746
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2020 06:06:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=TmkpW7Av;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f195.google.com with SMTP id f142so804562qke.13
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2020 06:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=cD1lw+KGIib/UZHmXbnQ2Q2QbelHoFxmVPVgqLMzTGY=;
        b=TmkpW7AvQYG3phfvJ6RrUqg6lwZK1XZInD/u3Idxm5OEF2iqAyQtCtoXgSsjFm56uM
         KMSePIiBNlGgBYT5yOR1g8fC6cMot1LoOy5kPsqwsI4tZau5uZ0fwwbXXb7nK9GujUln
         2+aQAbS56UOqvFPjv/xBfERyhDD/lpRDgCie65EIYlvwBa44Prh855e/mGnkvQLTGCMr
         rnCaVxDDWWAUN5suASnirWtis2N8zyG7uOl8/QQXiBSceQbqfBpCXKEvB87xFI62GLOg
         4U0iGCmi1ug/XMIq9H1GUGFsuksrMA1i1nNHGtkhAElpaKtUlz9jBSnSgTK6Z6KfbLH/
         RTzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cD1lw+KGIib/UZHmXbnQ2Q2QbelHoFxmVPVgqLMzTGY=;
        b=mKVPSeor3AdeH+LgxnZfpiV9S6653wBCPfoITvW115z7U8+PphxgErQNyEpmjoqgxQ
         JxwKRxZjBtlQuV6tLpYRdJGfP4h5wUuFbE/XIQO8i+2Bwngs9VLWhO+jePhRon8VaLYt
         E8UIUKbXXKSdb3qKmBleB3c/qOszWTKl+e/EY2p/lwC/jLGIRsxlhCvfScK1E0F/Zyia
         r5t5ZStrEqu+Tzb3G6I8xoyFZiq+woYkQe8UFTMhl8/MtevwW5oSMVMXT7iVpiDAlEs5
         aWcIhn1YPWYD8GcbPyHOXqv7aH0tZMFbVoLLzyNNaZenymRktv8sPtYVfupS1dCYGHYV
         tb8A==
X-Gm-Message-State: AOAM533FihDPV0ZR+vlztOMkXJwSHL6yTm7CsW3kmBOH8xBHVw9Mojjk
	S54eg8nl74rbQkrDGImJHVahMmkgBa3KJSOU
X-Google-Smtp-Source: ABdhPJxbYT5UauoF6CdYYihO2VN4Jo9R4gYuabWLS8pKP6NXBw3GYOWPkicBU2WO07hYGgbEYyw3+A==
X-Received: by 2002:a05:620a:f89:: with SMTP id b9mr1283485qkn.75.1601298373340;
        Mon, 28 Sep 2020 06:06:13 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id u23sm914804qka.43.2020.09.28.06.06.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 06:06:12 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe][PATCH v4 4/6] armv8/tunes: Add tunes for supported ARMv8a cores
Date: Mon, 28 Sep 2020 09:05:49 -0400
Message-Id: <20200928130551.21346-5-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200928130551.21346-1-jon.mason@arm.com>
References: <20200928130551.21346-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add tunes for all the ARMv8a cores currently supported in GCC.  This
is: Cortex-A34, Cortex-A73, and Cortex-A73-Cortex-A35.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta/conf/machine/include/tune-cortexa34.inc  | 20 ++++++++++++++++++
 .../include/tune-cortexa73-cortexa35.inc      | 21 +++++++++++++++++++
 meta/conf/machine/include/tune-cortexa73.inc  | 16 ++++++++++++++
 3 files changed, 57 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-cortexa34.inc
 create mode 100644 meta/conf/machine/include/tune-cortexa73-cortexa35.inc
 create mode 100644 meta/conf/machine/include/tune-cortexa73.inc

diff --git a/meta/conf/machine/include/tune-cortexa34.inc b/meta/conf/machine/include/tune-cortexa34.inc
new file mode 100644
index 000000000000..f7d4c87df8a3
--- /dev/null
+++ b/meta/conf/machine/include/tune-cortexa34.inc
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
diff --git a/meta/conf/machine/include/tune-cortexa73-cortexa35.inc b/meta/conf/machine/include/tune-cortexa73-cortexa35.inc
new file mode 100644
index 000000000000..927296c2223a
--- /dev/null
+++ b/meta/conf/machine/include/tune-cortexa73-cortexa35.inc
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
diff --git a/meta/conf/machine/include/tune-cortexa73.inc b/meta/conf/machine/include/tune-cortexa73.inc
new file mode 100644
index 000000000000..ed2deb96b0c3
--- /dev/null
+++ b/meta/conf/machine/include/tune-cortexa73.inc
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

