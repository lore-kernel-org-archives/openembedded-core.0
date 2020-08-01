Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web12.4509.1596317028379978801
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Aug 2020 14:23:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iFWRhmpi;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id o18so34828048eje.7
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2020 14:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Onosa/1YZNErzfOPj4YNm830v5WlFmt/kVTcoPxDoO0=;
        b=iFWRhmpi3Vo4uMB6R03EEqBqhmSk6Yf88DZuIkHlHh2C0ZhUcHXyZHYJBGMT7zth8F
         h9LfH5xoB+pFYZDauEgkigg5qt0VCLvKwVDg/XIKkzJ2BD+kRTKt8i6WDIXJxCZWQIYK
         OczL03CdMcL2d+0ApntwKkdDGV7tZt1kvuHFrzvw6Gffzr1VSoe0sb7rh6f4u7C1hHk/
         yWPoGpoU9WwQnPV349DDLCaxl/4vh6KixECU9O2fn+RnButJWHad4nMSr0OacEMzeG49
         tTFkpa8S5qrKEyZ6QwllJ4p9AzmEZmVsIpRjjlACEONP89KWpFadRwbezfCnkSbmiCYs
         +fiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Onosa/1YZNErzfOPj4YNm830v5WlFmt/kVTcoPxDoO0=;
        b=O0LwHMiG57LuhC4FrT50TaPruZNMF0HMRsBJvPmOcGjsQI9R2ET0vppjekwzkFwFoP
         sXtXMa9LVT1eYHl9/ECb/j5Mh/QLnf0vUJaK83N/GabFNN6sFTaNzJhsq8k001WyZ1I+
         fx7Ie7ONVu7mUjYYUOED/S1zbvbSKIAMy/R5bnffB0bPHwMA/K8aEXNXHH2/1fZCHYEY
         AvwcdbkUBNPtCNpVJ5iFJ54oCD6r5+tOI6DB53EUi0U6stBzJGIYDGiODetCC056e07i
         8XMSjQ3oUhIWuXCEo7ySpgnR8XZ9LuCp6kiKNYkVnL/MYmyftOeWRXAvW66HH36G08Sd
         XN1g==
X-Gm-Message-State: AOAM533eFQR5tDCC7RtwhxHEMvS+LJnD7972Cz/DPXXkJNYFbUF8osGF
	SBz9NRjCm4obb7yKjEuHJH9DL0ouiMg=
X-Google-Smtp-Source: ABdhPJyOzBUIokx34L/dqPT5qbOTcJpiw6vZyvSMUL52///LjWoahS0LRORouDLbxHykADJGrttCYQ==
X-Received: by 2002:a17:906:fac1:: with SMTP id lu1mr10521159ejb.427.1596317026754;
        Sat, 01 Aug 2020 14:23:46 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box (cable-95-168-130-13.cust.telecolumbus.net. [95.168.130.13])
        by smtp.gmail.com with ESMTPSA id cm22sm12168803edb.44.2020.08.01.14.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2020 14:23:46 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 04/13] go: update 1.14.4 -> 1.14.6
Date: Sat,  1 Aug 2020 23:23:26 +0200
Message-Id: <20200801212335.14922-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200801212335.14922-1-alex.kanavin@gmail.com>
References: <20200801212335.14922-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/go/go-1.14.inc                          | 4 ++--
 ...{go-binary-native_1.14.4.bb => go-binary-native_1.14.6.bb} | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-binary-native_1.14.4.bb => go-binary-native_1.14.6.bb} (83%)

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index 1050116950..64c2768f7e 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.14"
-GO_MINOR = ".4"
+GO_MINOR = ".6"
 PV .= "${GO_MINOR}"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
@@ -18,4 +18,4 @@ SRC_URI += "\
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
 "
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
-SRC_URI[main.sha256sum] = "7011af3bbc2ac108d1b82ea8abb87b2e63f78844f0259be20cde4d42c5c40584"
+SRC_URI[main.sha256sum] = "73fc9d781815d411928eccb92bf20d5b4264797be69410eac854babe44c94c09"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.14.4.bb b/meta/recipes-devtools/go/go-binary-native_1.14.6.bb
similarity index 83%
rename from meta/recipes-devtools/go/go-binary-native_1.14.4.bb
rename to meta/recipes-devtools/go/go-binary-native_1.14.6.bb
index 72c988944f..694c597a72 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.14.4.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.14.6.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 PROVIDES = "go-native"
 
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "aed845e4185a0b2a3c3d5e1d0a35491702c55889192bb9c30e67a3de6849c067"
-SRC_URI[go_linux_arm64.sha256sum] = "05dc46ada4e23a1f58e72349f7c366aae2e9c7a7f1e7653095538bc5bba5e077"
+SRC_URI[go_linux_amd64.sha256sum] = "5c566ddc2e0bcfc25c26a5dc44a440fcc0177f7350c1f01952b34d5989a0d287"
+SRC_URI[go_linux_arm64.sha256sum] = "291bccfd7d7f1915599bbcc90e49d9fccfcb0004b7c62a2f5cdf0f96a09d6a3e"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
-- 
2.27.0

