Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web09.2601.1618018210057413530
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Apr 2021 18:30:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nA2qzF0l;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id q10so5166462pgj.2
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Apr 2021 18:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PY+XuZR0ph/mRikK7OoPv4lYE5M9t2Bkdn70I0CAr/I=;
        b=nA2qzF0l2lhe2Ld60i/x9VqqoC8huv27M+57kvOOei9u4qdvSgKI6LXvXROr9/Uclq
         hsMY37q0JeCIi60OLyrrlPhqSTSLB81S5p0vNIp1r2/Xd7t5TOOWDbMFYx8pR+Hr4GBs
         3DMEG8WanLDKrZRLytUqeJ3zkMfOY33VZDAGh8oRcqpceP61/WaE6Ovih4Pu9Mfae1wf
         fllRpMzdvFUvngnXHp48MbpKG890Xf2fUSDta8IJY2UWCZpl1C/X1pYd0IFLjUN67WZ/
         t3BxZ8r64E5sJcb26caZmHne39r+1Uh8hEEAL2nvdvLX/Fn7Bmtp9snM6FINNZZyZYO6
         eQRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PY+XuZR0ph/mRikK7OoPv4lYE5M9t2Bkdn70I0CAr/I=;
        b=bQy3WyMBDSBtvJCOFT1VF5H8sK7f0/4ZEsTFpvQDnXJv3OO5IxCjsxL8z1YG1rNyaB
         oQ17DWW33Ap9d6js3dSHuTfUkYzUJF94xLKvi0JtUG+R2VfY9Tq0MUIT2bjcG7HuOftW
         LMo9rvUgwcFjm8DMQV62vCJVHheJ7KzHB2Pd0jqVT0Smt5S8719NMOS1aTghMBqEpamc
         92L34dHAxUW1fU4gUwZ8x4ytc076C3mJyPe4me3tJb3rNtGM37DCuObw3FMc9ZTs71sL
         lzE+dFNn4SN4PLX38Px1AVTPEntfjX3U2sj3o4FN1gj2DsQy4Pk2abShLQ1vdFHPcBk4
         AR8g==
X-Gm-Message-State: AOAM532gF7zIv58Rbk4KLPZQPn9/00vJ0pezxqU5f93IpUunjfWGT92i
	AQHgFh4tm9XzvcgULc/K9j+Q09EoXNusKw==
X-Google-Smtp-Source: ABdhPJwOA957vapzq3hgZ37JfJDgIhwgJD8EFKsW+/6/LTSHW8NGM0OXYtCiSCPsrpcUGqiIG6nHNw==
X-Received: by 2002:aa7:8dd2:0:b029:247:c334:5e6f with SMTP id j18-20020aa78dd20000b0290247c3345e6fmr3947040pfr.57.1618018209250;
        Fri, 09 Apr 2021 18:30:09 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bc1b])
        by smtp.gmail.com with ESMTPSA id o4sm3360454pfk.15.2021.04.09.18.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 18:30:08 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: wangmy <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] go: upgrade 1.16.2 -> 1.16.3
Date: Fri,  9 Apr 2021 18:30:05 -0700
Message-Id: <20210410013005.2232041-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: wangmy <wangmy@fujitsu.com>

This is bugfix release in 1.16 series [1]

[1] https://github.com/golang/go/issues?q=milestone%3AGo1.16.3+label%3ACherryPickApproved

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix checksums and improve commit msg

 meta/recipes-devtools/go/{go-1.16.2.inc => go-1.16.3.inc}     | 4 ++--
 ...{go-binary-native_1.16.2.bb => go-binary-native_1.16.3.bb} | 4 ++--
 ...o-cross-canadian_1.16.2.bb => go-cross-canadian_1.16.3.bb} | 0
 .../go/{go-cross_1.16.2.bb => go-cross_1.16.3.bb}             | 0
 .../go/{go-crosssdk_1.16.2.bb => go-crosssdk_1.16.3.bb}       | 0
 .../go/{go-native_1.16.2.bb => go-native_1.16.3.bb}           | 0
 .../go/{go-runtime_1.16.2.bb => go-runtime_1.16.3.bb}         | 0
 meta/recipes-devtools/go/{go_1.16.2.bb => go_1.16.3.bb}       | 0
 8 files changed, 4 insertions(+), 4 deletions(-)
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

