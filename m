Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.295.1588721637151220045
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 16:33:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=koxYqI8K;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id a5so35759pjh.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2020 16:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j2Hj0+/Cu73RsEPzY7a1RRtmkO7a+8FV9KOq982lxdo=;
        b=koxYqI8KYmRGIm6q2EEWMBa60t6eHZ6POy7cQpmn4ipCsJPBUHyvVeU877FEip6wsS
         A2B8NFlpc8l6GPFksHQNALeLG5SFEuMng09rwrrnCT3FpAcDIOMMeHKe3RUZ7cD6dGhM
         yoyljWpViJCQWoSzxm8Va9SRH0XcMnMhB0o1BQhbqkdFFhwp/SJZR/v7rRU19pFunIxn
         52HiBYVvcmhrWDQvfqgH5hmhs4deadSyDV6+9y3N5XVvDXwEaTUE8/6oN8QmiSM+L8tY
         Ku9PLeXA+ZbHhatckVc6Mq9kPQtZPDWbCg7+caVog/qAUNYkWlc03R/QnKdvLcJLHqpI
         VeVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j2Hj0+/Cu73RsEPzY7a1RRtmkO7a+8FV9KOq982lxdo=;
        b=rVW+cNRTxhNyJ2t6Nb4HyksYHBl0PbBfOdHv81IYsJuCUJpU8FqvpD1ZMcljYeboKg
         lEtPJ9K5Fu0nCEx7/vyPgb1e/dn7Zzbp2z3YmYqgHRno4ywiUsrXFFJT1AqWOuqwmt6K
         ZiFec976CJiUYa3mo8nR4Z/IDNmuXUeDuqsYtYtQ8wtM/QDzjWVsO2wyt1+Nr8aDRLTo
         Z+WfqVfa+jgablXPc3BSmgIv1Cdvp1Ni0XDcGK93ly/aVAGJua7nRlBzPmDE9ZTiQcSe
         z5oeoSdWoMl4+Rs5vAmDk2l7TwvmIpzXL+IR0UdEAYt79ds10piDsrR58IPxEQwOCWFz
         H0Aw==
X-Gm-Message-State: AGi0Pub76bQqbdmyv0bf/RkhVbd1yOEGbJEnPDTWCS2bQ0CsQIf54vXN
	spTusvZBviFH9f2/iBTwskmbYVeKBwg=
X-Google-Smtp-Source: APiQypKTzv7dD0oXSPchsKFYzv2kIEvC+4V91Jg2tLSkX6lClQQIrHXH8eV1pxfbzValJouEpjDWqQ==
X-Received: by 2002:a17:90b:155:: with SMTP id em21mr5819803pjb.59.1588721635793;
        Tue, 05 May 2020 16:33:55 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::b962])
        by smtp.gmail.com with ESMTPSA id 185sm7050pfv.9.2020.05.05.16.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 16:33:55 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] tunes: Add new tune files for cortexa55 and cortexa73-cortexa53
Date: Tue,  5 May 2020 16:33:52 -0700
Message-Id: <20200505233353.1836668-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/tune-cortexa55.inc  | 17 ++++++++++++++
 .../include/tune-cortexa73-cortexa53.inc      | 23 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-cortexa55.inc
 create mode 100644 meta/conf/machine/include/tune-cortexa73-cortexa53.inc

diff --git a/meta/conf/machine/include/tune-cortexa55.inc b/meta/conf/machine/include/tune-cortexa55.inc
new file mode 100644
index 0000000000..8242cc9cef
--- /dev/null
+++ b/meta/conf/machine/include/tune-cortexa55.inc
@@ -0,0 +1,17 @@
+DEFAULTTUNE ?= "cortexa55"
+
+TUNEVALID[cortexa55] = "Enable Cortex-A55 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa55', ' -mcpu=cortex-a55', '', d)}"
+
+require conf/machine/include/arm/arch-armv8a.inc
+
+# Little Endian base configs
+AVAILTUNES += "cortexa55 cortexa55-crypto"
+ARMPKGARCH_tune-cortexa55             = "cortexa55"
+ARMPKGARCH_tune-cortexa55-crypto      = "cortexa55"
+TUNE_FEATURES_tune-cortexa55          = "aarch64 cortexa55 crc"
+TUNE_FEATURES_tune-cortexa55-crypto   = "aarch64 cortexa55 crc crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa55             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa55"
+PACKAGE_EXTRA_ARCHS_tune-cortexa55-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa55 cortexa55-crypto"
+BASE_LIB_tune-cortexa55               = "lib64"
+BASE_LIB_tune-cortexa55-crypto        = "lib64"
diff --git a/meta/conf/machine/include/tune-cortexa73-cortexa53.inc b/meta/conf/machine/include/tune-cortexa73-cortexa53.inc
new file mode 100644
index 0000000000..8df418227f
--- /dev/null
+++ b/meta/conf/machine/include/tune-cortexa73-cortexa53.inc
@@ -0,0 +1,23 @@
+DEFAULTTUNE ?= "cortexa73-cortexa53"
+
+require conf/machine/include/arm/arch-armv8a.inc
+
+TUNEVALID[cortexa73-cortexa53] = "Enable big.LITTLE Cortex-A73.Cortex-A53 specific processor optimizations"
+
+TUNECONFLICTS[aarch64] = "armv4 armv5 armv6 armv7 armv7a"
+
+MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-cortexa53", "cortexa73-cortexa53:", "" ,d)}"
+
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-cortexa53", " -mtune=cortex-a73.cortex-a53", "", d)}"
+
+# cortexa73.cortexa53 implies crc support
+AVAILTUNES += "cortexa73-cortexa53 cortexa73-cortexa53-crypto"
+ARMPKGARCH_tune-cortexa73-cortexa53                  = "cortexa73-cortexa53"
+ARMPKGARCH_tune-cortexa73-cortexa53-crypto           = "cortexa73-cortexa53"
+TUNE_FEATURES_tune-cortexa73-cortexa53               = "${TUNE_FEATURES_tune-armv8a-crc} cortexa73-cortexa53"
+TUNE_FEATURES_tune-cortexa73-cortexa53-crypto        = "${TUNE_FEATURES_tune-armv8a-crc-crypto} cortexa73-cortexa53"
+PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa53         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa73-cortexa53"
+PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa53-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa73-cortexa53 cortexa73-cortexa53-crypto"
+BASE_LIB_tune-cortexa73-cortexa53                    = "lib64"
+BASE_LIB_tune-cortexa73-cortexa53-crypto             = "lib64"
+
-- 
2.26.2

