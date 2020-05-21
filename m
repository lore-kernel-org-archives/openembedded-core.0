Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.9671.1590077748846698384
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2020 09:15:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Kl8l9mcD;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id u5so3394486pgn.5
        for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2020 09:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VYqMWgTUvXdwgWU0TMnjp8yTCxT/iz3mk0i8aKYXKGo=;
        b=Kl8l9mcDlCqxkkJnrl8uJX7pndFj68bXuIfLrGMsxMYJKwzpZsvKCN9k7PqsnEiEr3
         hJ2eJus72hbAZp+IcvdSh4WQ0dMTc5aij+e3EddP3aP1/VSzxF3NdUj1NYT5qJFO+U3R
         dc6HsOGTIV02jQnjo+jBZII0HuJU9kh6i2NgTXKUpuKx86RQfYyCjYlzvAysL0vf4NUH
         ZdbMYq3QVPYjR1w03cmE8RbTczCNB/py2pcSfJq2W6kIpeKYBQcZdmI7mvuziUAWKhZV
         wLJrKvYNmiSpVObBpN+e3eKa+04ztIsnXZi40KtCixSXnySRBg4R5SgzkYZcJ4muXbf4
         ulrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VYqMWgTUvXdwgWU0TMnjp8yTCxT/iz3mk0i8aKYXKGo=;
        b=sGCw8+HbNW8hoa0/dHv/rTJ6gsxgT7dnoguddyZ736DyCG096N8cJtlZFoBADYP5Mx
         3SLsykZnNhCIMGVT1z2f+zUQJwnqKAx1ytQaKEgV4hHkqyzY+NhwPJ2GQtp7bhIk78tV
         PX3NsprvvmZQWJD+trYJSCH7H9soKiFyWvvGwm9/YCCiZkbH0nYSAYzbcdpa1RHqzAD1
         ETK3FvjgrtQKM0eSN4OkWgLk5a/AeQBdOnxUNd5I3BDV31xzl/vFUajGmjHa3zuPtPis
         09OakielGyQYXXgMD+VVm0XWCqF4dDoYFBar32WBgSNz6VgvxXXa40gU+OkJKVKsxzIf
         5+qQ==
X-Gm-Message-State: AOAM5329CKZUrOEmD4SG4+2ViEP/f8/rauPggXqwwJAQ5UU3ZP29L00C
	pw/4jLkBpd70IZrKLH+uW6P+BDVm3TI=
X-Google-Smtp-Source: ABdhPJxSdWBPb7N9CiIeSY10B2v/KUK+YJcVdA+iV9Vk1AxPVegNFyMTGRluazaDt5SUbDNs7DHC0w==
X-Received: by 2002:a63:801:: with SMTP id 1mr9179755pgi.278.1590077747870;
        Thu, 21 May 2020 09:15:47 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e62a])
        by smtp.gmail.com with ESMTPSA id r24sm3636427pgm.25.2020.05.21.09.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 09:15:47 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][ 01/10] tunes: Add new tune files for cortexa55 and cortexa73-cortexa53
Date: Thu, 21 May 2020 09:15:34 -0700
Message-Id: <20200521161543.3273063-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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

