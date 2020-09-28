Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web12.27577.1601258539200838399
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2020 19:02:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=sR3r4eny;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.196, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f196.google.com with SMTP id s131so4196787qke.0
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2020 19:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=cD1lw+KGIib/UZHmXbnQ2Q2QbelHoFxmVPVgqLMzTGY=;
        b=sR3r4enyOKjftfBL5pDhDQHpiF2Vk0LfPsfSk/9r1LQrdNJjXBNBrrfuDQpx5JSBIv
         Nmdun8u10xzX1ULS1GHaFRgCW70J2KJ181yUrQBhG+JhmEq2MFMV8+DhVlDG6K5i81C/
         TfuiaPwX82/eCGXdaqbAh+3QUeQP7inlragTyOMp44+lJj3Wv9P1oXOrwRxgO7fkhlYF
         8jI+q6joAViHMdiKMr8Zgeo0vE+o5mBT8yJktLn7jWu9Cch/v2Wls425uO4guRgDC8dV
         i+GFEiqX/BLSZCkUxa9euvic8ReNmhz2sbLIgB6cU7TujTAjLxVbdM1Zv4YNflnsEvV0
         jqLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cD1lw+KGIib/UZHmXbnQ2Q2QbelHoFxmVPVgqLMzTGY=;
        b=U97NeyshAfik6+cCeI1ZxoCkKa5RU7GFw+NCrbb5WzwQ1YOwwpbQZsPsLcM6yBJI/e
         VWlRExLjTO99bhSIuT25DP9T3UNwsFqTw93zoD+PSYdHVutLxGth9jSD1UYSm84uEJhI
         8+nxCmBesHZTX1AXHOv1gmD8vdqGNWYgnLjspezLYhp2fLIIb74ZEPOCyCpaQrwG8FPi
         4jcATUZDNgfDxZWfnNWMblYrcmkArDQ5mp+i2DFwmdLrpWtWUL22eBhyabIi7bytA3KV
         qpAfPK5KgbHmp9JzyLN4aFhuln1+oOES+t1Nh9ebbiYMK4MmEDhwy9bvK/WUwYWqTM7t
         tzmA==
X-Gm-Message-State: AOAM533Gv9OKIOy8jnPKAhD90bHctSAClvKKfrVsLl7SbXHcEqRkuN20
	nLTSYJbXlaQ3tD1hTBD9XVGtohV23qTJ4UaB
X-Google-Smtp-Source: ABdhPJzhWjKoXGNlf3cFBedDcn5mc93UnMiIiwydrMTiGx+bQEk5gPlzWMysREvgN3w5qU+tBjfbSw==
X-Received: by 2002:ae9:e30f:: with SMTP id v15mr9624371qkf.132.1601258538105;
        Sun, 27 Sep 2020 19:02:18 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id m196sm7888597qke.87.2020.09.27.19.02.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 19:02:17 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe][PATCH v3 4/6] armv8/tunes: Add tunes for supported ARMv8a cores
Date: Sun, 27 Sep 2020 22:01:40 -0400
Message-Id: <20200928020142.5706-5-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200928020142.5706-1-jon.mason@arm.com>
References: <20200928020142.5706-1-jon.mason@arm.com>
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

