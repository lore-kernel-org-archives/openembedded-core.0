Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web09.994.1618449908878591638
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Apr 2021 18:25:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sbFvDaWN;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id x21-20020a17090a5315b029012c4a622e4aso11763945pjh.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Apr 2021 18:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lf4cm8AUhiMG0XpfTCExgCUhht8iONX9Qr0nLtTb7sU=;
        b=sbFvDaWNh1W4gHivh2jIEW6ohQ6h1tsHvYZu1LHmbfGe7np9otblCPUfWnHRWNZqpo
         6LfBn2Tspm/JqnzlX6TTIKeBwIBcvLvSQDE9DwjGPdt3atHw9rMRulcXMU7MaoR5Ayqm
         R1/lc+RtzeoAAtJre4xHOCacq3GRBWP7h5ZXe/neBbedCtJ9hKYhLFk9TgbPn0OAsopf
         1cDdVE+WpKMH84Vh0VF+iNUON0h/kUleYtAOFIrQtrUPG/rbxtwNnoajvU4kXY/40k64
         9/JAxxITD/jiurjj8Qdj/kfkBQvWyiwNdggf9Ry1z0hkyhIHiVFmSKAV5UKRO5uysklB
         +UiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lf4cm8AUhiMG0XpfTCExgCUhht8iONX9Qr0nLtTb7sU=;
        b=lSquRcaOU2kKKEjflVnqp31a9dqzQBCFCwff62njDZK1l9oXBOBlenOMtqKIFbh8ZM
         G3TQGTaCsNjXZ7KV3aabxRyeR2tGGHsgDKzQkMdlKWBrn92WG4IAGoEl/bVQ9APeizEJ
         IW4oNLWhq6wDEnnfmP8ddUBbN849iW+Rrxpm4f4JAK+UcStGyRIYEhDDwD8LpWrzFfPw
         rIkLX83AsV0Ea56Bc5U5ddVYWSXPXSZwEKIp73WLtJ6/PGz+1vherBJmCYfDZybhLjf7
         9fu8/Psa24QcO+4Uxv1MvInwh791AEji21nqYR6q0igIKDIEnjoPiX6af2+qOGpdKAkJ
         ORdA==
X-Gm-Message-State: AOAM533ht/iHqZ5vDrd/zhuGhB85gnUdRKvOd+IRnJYNcChzeCuHTfDT
	fKCAIuQdzL5bEHAhfCclaVFXc02VnTrhdQ==
X-Google-Smtp-Source: ABdhPJzriG+FxL2tG/Lzy1uAIuTGMJCRxn7qJeiD2pmczu1oIDECsyZmjpi5F/rGrTs/CS6qfXelYQ==
X-Received: by 2002:a17:902:8693:b029:eb:53f:1336 with SMTP id g19-20020a1709028693b02900eb053f1336mr1175444plo.52.1618449908002;
        Wed, 14 Apr 2021 18:25:08 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::630])
        by smtp.gmail.com with ESMTPSA id a185sm493122pfd.70.2021.04.14.18.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 18:25:07 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: wangmy <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>
Subject: [PATCH v3] go: upgrade 1.16.2 -> 1.16.3
Date: Wed, 14 Apr 2021 18:25:04 -0700
Message-Id: <20210415012504.2763716-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: wangmy <wangmy@fujitsu.com>

This is bugfix release in 1.16 series [1]
Switch SRC_URI to use https

[1] https://github.com/golang/go/issues?q=milestone%3AGo1.16.3+label%3ACherryPickApproved

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>
---
v2: Fix checksums and improve commit msg
v3: Switch to using https for SRC_URI

 meta/recipes-devtools/go/{go-1.16.2.inc => go-1.16.3.inc}     | 4 ++--
 ...{go-binary-native_1.16.2.bb => go-binary-native_1.16.3.bb} | 4 ++--
 meta/recipes-devtools/go/go-common.inc                        | 2 +-
 ...o-cross-canadian_1.16.2.bb => go-cross-canadian_1.16.3.bb} | 0
 .../go/{go-cross_1.16.2.bb => go-cross_1.16.3.bb}             | 0
 .../go/{go-crosssdk_1.16.2.bb => go-crosssdk_1.16.3.bb}       | 0
 .../go/{go-native_1.16.2.bb => go-native_1.16.3.bb}           | 0
 .../go/{go-runtime_1.16.2.bb => go-runtime_1.16.3.bb}         | 0
 meta/recipes-devtools/go/{go_1.16.2.bb => go_1.16.3.bb}       | 0
 9 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/go/{go-1.16.2.inc => go-1.16.3.inc} (88%)
 rename meta/recipes-devtools/go/{go-binary-native_1.16.2.bb => go-binary-native_1.16.3.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.16.2.bb => go-cross-canadian_1.16.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.16.2.bb => go-cross_1.16.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.16.2.bb => go-crosssdk_1.16.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.16.2.bb => go-native_1.16.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.16.2.bb => go-runtime_1.16.3.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.16.2.bb => go_1.16.3.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.16.2.inc b/meta/recipes-devtools/go/go-1.16.3.inc
similarity index 88%
rename from meta/recipes-devtools/go/go-1.16.2.inc
rename to meta/recipes-devtools/go/go-1.16.3.inc
index e65caf8197..ebd25a5eaa 100644
--- a/meta/recipes-devtools/go/go-1.16.2.inc
+++ b/meta/recipes-devtools/go/go-1.16.3.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.16"
-PV = "1.16.2"
+PV = "1.16.3"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
@@ -17,4 +17,4 @@ SRC_URI += "\
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
     file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch \
 "
-SRC_URI[main.sha256sum] = "37ca14287a23cb8ba2ac3f5c3dd8adbc1f7a54b9701a57824bf19a0b271f83ea"
+SRC_URI[main.sha256sum] = "b298d29de9236ca47a023e382313bcc2d2eed31dfa706b60a04103ce83a71a25"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.16.2.bb b/meta/recipes-devtools/go/go-binary-native_1.16.3.bb
similarity index 83%
rename from meta/recipes-devtools/go/go-binary-native_1.16.2.bb
rename to meta/recipes-devtools/go/go-binary-native_1.16.3.bb
index 4fb060173c..d01a2bd8f1 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.16.2.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.16.3.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 PROVIDES = "go-native"
 
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "542e936b19542e62679766194364f45141fde55169db2d8d01046555ca9eb4b8"
-SRC_URI[go_linux_arm64.sha256sum] = "6924601d998a0917694fd14261347e3798bd2ad6b13c4d7f2edd70c9d57f62ab"
+SRC_URI[go_linux_amd64.sha256sum] = "951a3c7c6ce4e56ad883f97d9db74d3d6d80d5fec77455c6ada6c1f7ac4776d2"
+SRC_URI[go_linux_arm64.sha256sum] = "566b1d6f17d2bc4ad5f81486f0df44f3088c3ed47a3bec4099d8ed9939e90d5d"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-devtools/go/go-common.inc
index f18d928c70..39a681a712 100644
--- a/meta/recipes-devtools/go/go-common.inc
+++ b/meta/recipes-devtools/go/go-common.inc
@@ -14,7 +14,7 @@ LICENSE = "BSD-3-Clause"
 
 inherit goarch
 
-SRC_URI = "http://golang.org/dl/go${PV}.src.tar.gz;name=main"
+SRC_URI = "https://golang.org/dl/go${PV}.src.tar.gz;name=main"
 S = "${WORKDIR}/go"
 B = "${S}"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.src\.tar"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.16.2.bb b/meta/recipes-devtools/go/go-cross-canadian_1.16.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.16.2.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.16.3.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.16.2.bb b/meta/recipes-devtools/go/go-cross_1.16.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.16.2.bb
rename to meta/recipes-devtools/go/go-cross_1.16.3.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.16.2.bb b/meta/recipes-devtools/go/go-crosssdk_1.16.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.16.2.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.16.3.bb
diff --git a/meta/recipes-devtools/go/go-native_1.16.2.bb b/meta/recipes-devtools/go/go-native_1.16.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.16.2.bb
rename to meta/recipes-devtools/go/go-native_1.16.3.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.16.2.bb b/meta/recipes-devtools/go/go-runtime_1.16.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.16.2.bb
rename to meta/recipes-devtools/go/go-runtime_1.16.3.bb
diff --git a/meta/recipes-devtools/go/go_1.16.2.bb b/meta/recipes-devtools/go/go_1.16.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.16.2.bb
rename to meta/recipes-devtools/go/go_1.16.3.bb
-- 
2.31.1

