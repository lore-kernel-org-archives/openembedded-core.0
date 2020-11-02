Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.1226.1604335806450244582
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:50:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NhTKvNMx;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id l16so15052608eds.3
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p1gKXwrMDGAdwM2xRDygWw8cz+2GMVXvojpORLw30u8=;
        b=NhTKvNMxZ/V4boJ/H0Nxrv0VwUCe06U7x80HGpjJqrc+Wukk75h6vaBn0jC+su4Em7
         TfnHrbUWuEhukKwL3VI6bxDvCRqSOYavy6I6qpsE3Pj3hk80kWpBW4A4f0T0bk5eG5i7
         NaOQ46LSvrL4im0VUIvFW77M/Wozsn/AFMKVpdQnwffdTCThsJZbCRRp3LcvKbWvfZqd
         Bprm9lKHHoWt6uZdwD46baQSYXJoJOZHrs6JL0U3p/pROpDMm9/oB5jc4zdRWSvcRiZw
         5wJKra6aJR1+S33lLThyFmwyAM8eGO0n9dFtkzsVOz7U04AP4g88zBvXO2vzl+Ky2Ygd
         SlZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p1gKXwrMDGAdwM2xRDygWw8cz+2GMVXvojpORLw30u8=;
        b=Qc+2wW8ug0wgHwGORFJVGIfdNBwNY4EgcJQbj6Q9f+8cb7CmcLmbP1OXeeNvvMGr0X
         ya9O7MHKofLrSkOjdP651cKR2yn/kLk1e4DNzev8qxmbTcj4vQxS+Halyf5ZcsoDq7Q+
         0Nb1WxQ+Krqb5mpLAyUHaome6RTfdWUqFn1GVwGqtvBG73WWgJLBPRiq1g8nga+caU2I
         ojCNkvfl5CXkBHynOsyxoUHPI8bS9fMdLR4qXdHhg71VMQz0tVXakmp2EcYvnqRZLY5Q
         G8jx99R2tNDdH8v5YTfyGHp1jgRHWfw13eDmk7ua0vei3UB1gqb1nODYeF0WaEb9bCam
         C68g==
X-Gm-Message-State: AOAM5300x0iJ5vQyl9dOn8zoRDS8owXm1vXYgdsrR6hX9K6eK9/SPZj1
	udy+cl8C5BUyd6vWaOSObAdeyC0mkrutVw==
X-Google-Smtp-Source: ABdhPJyWckxVdmZcBPDrVJW9Us5KrTMbdNSLcui1gOfbxcoNv9B1f3H4C2jagOj84dslUQKE7E9BCw==
X-Received: by 2002:a05:6402:21c7:: with SMTP id bi7mr2300454edb.54.1604335804707;
        Mon, 02 Nov 2020 08:50:04 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:50:04 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 53/80] go: upgrade 1.15.2 -> 1.15.3
Date: Mon,  2 Nov 2020 17:48:40 +0100
Message-Id: <20201102164907.27572-53-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set PV directly to allow automated version updates between point releases.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/go/go-1.15.inc                         | 5 ++---
 ...go-binary-native_1.15.2.bb => go-binary-native_1.15.3.bb} | 4 ++--
 meta/recipes-devtools/go/go-runtime_1.15.bb                  | 1 +
 meta/recipes-devtools/go/go_1.15.bb                          | 1 +
 4 files changed, 6 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/go/{go-binary-native_1.15.2.bb => go-binary-native_1.15.3.bb} (83%)

diff --git a/meta/recipes-devtools/go/go-1.15.inc b/meta/recipes-devtools/go/go-1.15.inc
index 97d748b922..a35921c1f8 100644
--- a/meta/recipes-devtools/go/go-1.15.inc
+++ b/meta/recipes-devtools/go/go-1.15.inc
@@ -1,8 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.15"
-GO_MINOR = ".2"
-PV .= "${GO_MINOR}"
+PV = "1.15.3"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
@@ -17,4 +16,4 @@ SRC_URI += "\
     file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
 "
-SRC_URI[main.sha256sum] = "28bf9d0bcde251011caae230a4a05d917b172ea203f2a62f2c2f9533589d4b4d"
+SRC_URI[main.sha256sum] = "896a602570e54c8cdfc2c1348abd4ffd1016758d0bd086ccd9787dbfc9b64888"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.15.2.bb b/meta/recipes-devtools/go/go-binary-native_1.15.3.bb
similarity index 83%
rename from meta/recipes-devtools/go/go-binary-native_1.15.2.bb
rename to meta/recipes-devtools/go/go-binary-native_1.15.3.bb
index ccd2d5ebad..aeab91a80f 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.15.2.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.15.3.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 PROVIDES = "go-native"
 
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "b49fda1ca29a1946d6bb2a5a6982cf07ccd2aba849289508ee0f9918f6bb4552"
-SRC_URI[go_linux_arm64.sha256sum] = "c8ec460cc82d61604b048f9439c06bd591722efce5cd48f49e19b5f6226bd36d"
+SRC_URI[go_linux_amd64.sha256sum] = "010a88df924a81ec21b293b5da8f9b11c176d27c0ee3962dc1738d2352d3c02d"
+SRC_URI[go_linux_arm64.sha256sum] = "b8b88a87ada918ef5189fa5938ef4c46a4f61952a34317612aaac705f4275f80"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-runtime_1.15.bb b/meta/recipes-devtools/go/go-runtime_1.15.bb
index 4eeee65e0c..d6ddb31ed4 100644
--- a/meta/recipes-devtools/go/go-runtime_1.15.bb
+++ b/meta/recipes-devtools/go/go-runtime_1.15.bb
@@ -1,3 +1,4 @@
 export CGO_ENABLED_riscv64 = ""
 require go-${PV}.inc
 require go-runtime.inc
+
diff --git a/meta/recipes-devtools/go/go_1.15.bb b/meta/recipes-devtools/go/go_1.15.bb
index 4bf9dd50b2..cc4c3fe45d 100644
--- a/meta/recipes-devtools/go/go_1.15.bb
+++ b/meta/recipes-devtools/go/go_1.15.bb
@@ -13,3 +13,4 @@ python() {
     if 'mips' in d.getVar('TARGET_ARCH',True) or 'riscv' in d.getVar('TARGET_ARCH',True):
         d.appendVar('INSANE_SKIP_%s' % d.getVar('PN',True), " textrel")
 }
+
-- 
2.29.0

