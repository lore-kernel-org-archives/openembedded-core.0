Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web12.5654.1601062113124671828
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2020 12:28:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=t23oNVHT;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.172, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f172.google.com with SMTP id v123so3944109qkd.9
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2020 12:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=cD1lw+KGIib/UZHmXbnQ2Q2QbelHoFxmVPVgqLMzTGY=;
        b=t23oNVHTPpWgLxThktxEQR1M/phB34A1TneMD6rXOCSr45VI1tZtfmFRVjUmxPdI5w
         dQRFDhsglSS46mBkbP0Icxaaw0HxGvm9I9hEOU/M41yJiptdPeVCRY0kpeHA8tjMp3Xw
         0MWqPDyRXWGwZOMeNtdBJ0I1eenY6qY8kKaaSw364EBcZ9/SinTEX6PNPNG8rJ4hyttI
         s3YD0gB2jLBzD7OpFPpnX3OIV3YiYJGCKa2oltj/HFhTC1cRXBUE2PP32pr09LEctUhk
         8YzrWgpSMPbC0/oC68y6z1UU/R+d0ptd0vpu4z9zzrpPUiBY3kz8hyrpv1exbOokaOsX
         HogQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cD1lw+KGIib/UZHmXbnQ2Q2QbelHoFxmVPVgqLMzTGY=;
        b=mmIXmeesRDX65sv99kCZfFTrLHTfYV7FiqZOKJOPUyuHK4YvVwFVuYjaedlSjWTaBf
         FUH1SctDegJCzxjFS+fR25XPzp13TPX9xUpnq/GqMdtXGBgN0gMWNFyQw0MeEiCKGMCt
         HH93PZm8TcoalJ9+Y4QjDP90mOWnGoaATIJa7iQMiFLVnVCY7lCO8yQbxfTyLd44TovT
         yckOnZgsHCjn2b/mEtOUxCwzVW3+8WNrzEkXZvE9/xYCs0/lHPX/F/bokoYI+nJ6/WvZ
         BZykqxzOf9YkFZQKkT2QvAGDOAs3sQqWFAVJAmC8mbEAGiSZo3Z5RrIycfw5EkK6NFiA
         VeVw==
X-Gm-Message-State: AOAM533KyOd3HJtDtbBYtvQLB7hfjyc1Nwoztn3l4hZPksdpnJPlc6hR
	zIjoAOWy0w1NKStqtpGGlIm95mfZTnmvju/i
X-Google-Smtp-Source: ABdhPJzloRzQlqmtuDjUKaLWQUKEnSzHcxX4DERYtNW/6LW8BKJzto2k7FvZNQGgVJJiMhJSR9yAWA==
X-Received: by 2002:a37:a113:: with SMTP id k19mr1521778qke.306.1601062111941;
        Fri, 25 Sep 2020 12:28:31 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id r64sm2330256qkf.119.2020.09.25.12.28.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2020 12:28:31 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe][PATCH v2 4/6] armv8/tunes: Add tunes for supported ARMv8a cores
Date: Fri, 25 Sep 2020 15:28:08 -0400
Message-Id: <20200925192810.1372-5-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200925192810.1372-1-jon.mason@arm.com>
References: <20200925192810.1372-1-jon.mason@arm.com>
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

