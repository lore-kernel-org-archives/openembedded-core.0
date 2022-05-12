Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF93CC433F5
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 14:54:27 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web08.187.1652367265847212551
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 May 2022 07:54:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FpQdeo/T;
 spf=pass (domain: gmail.com, ip: 209.85.218.41,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id m20so10716962ejj.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 12 May 2022 07:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eW/uSe4VoQ6QHWWvLo3aG/ISWdHnn2wKRLZQbOBhpvs=;
        b=FpQdeo/Typo2HrtbTBtZO+1Czlud6pl0B7poR0+ISI29nR3uZVt8ezjnS1shnRMMVr
         WdPmk/E9+AbdI46ZNCtuxbI6YumGu5OR7pexmwPfQOxL+C6C4E4LNIHPwrD1qe8mjg4g
         Ga+jTdt0pXICn0bkvCt2hIb263pmqL0Iw+YKbdQxTFaWM68oTAdDxdS4WqXLmucmJU3e
         XkU0IT4uoSLEs/FUk3cRmC1LLGvbp+JqoE/N63ycSxz4jOKgbQDvBs1StDANMFU9upxy
         oUl/dr6ykVrf+Isq8Od6lP030u7VPQQXWix3AahneoW9sjhQd39mD855kt+q2do0Bcqi
         M7/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eW/uSe4VoQ6QHWWvLo3aG/ISWdHnn2wKRLZQbOBhpvs=;
        b=pmeGPVzXXfar39X3NC2clrh49uyjQsv4WzBC34a6iP8oCQwR0kHDzlA6HWgGwGssak
         xemPJ7vGr6bJx3YA7DfThY2rOFfEt/svS1FwKabvS9SMhxd9LhhNjBchVqt/mZbWiXSK
         RCn7UE9VEJ0wV5di017k+LhnbpRThv5TttB8k2Sb96ngu7CX28EY5w0FvBX8pxD5mk0U
         Kgq0N59yJgiuupkv7tHjHGJK4wN5P8B0kFVgWeE410GQNubsn0xv5Gt28pARZDNfr2RE
         K83Cj4E9BAcPF9zLyO37deE4iAwQzlaOPXijhXWaqvqvwE9zdQvdRhfcL/7CGZoKbMI0
         aDpg==
X-Gm-Message-State: AOAM533k04rzQ1dB9hyGDu5nfP+MjnWT7LbwUJc9HeWTZMYzwc3/XkBC
	BogjM4zrdsO6VgIkOxJES0gSYcafkhU=
X-Google-Smtp-Source: 
 ABdhPJxD/T4pFyze0vlkHml5eac1YoOh8DlMR9a/MWXLhU9vwrKTBF2mBCDRTB2eqKskAp0v/w2iwQ==
X-Received: by 2002:a17:907:7282:b0:6fa:9365:f922 with SMTP id
 dt2-20020a170907728200b006fa9365f922mr286476ejc.262.1652367263952;
        Thu, 12 May 2022 07:54:23 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-87-5-19-80.retail.telecomitalia.it. [87.5.19.80])
        by smtp.gmail.com with ESMTPSA id
 y20-20020aa7d514000000b0042617ba63basm2598530edq.68.2022.05.12.07.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 07:54:23 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-core@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [kirstone][PATCH] go: minor upgrade 1.17.8 -> 1.17.9
Date: Thu, 12 May 2022 16:54:09 +0200
Message-Id: <20220512145410.786397-1-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 May 2022 14:54:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165540

This minor update include fixes to the following CVE

CVE: CVE-2022-28327

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
 meta/recipes-devtools/go/{go-1.17.8.inc => go-1.17.9.inc}     | 2 +-
 ...{go-binary-native_1.17.8.bb => go-binary-native_1.17.9.bb} | 4 ++--
 ...o-cross-canadian_1.17.8.bb => go-cross-canadian_1.17.9.bb} | 0
 .../go/{go-cross_1.17.8.bb => go-cross_1.17.9.bb}             | 0
 .../go/{go-crosssdk_1.17.8.bb => go-crosssdk_1.17.9.bb}       | 0
 .../go/{go-native_1.17.8.bb => go-native_1.17.9.bb}           | 0
 .../go/{go-runtime_1.17.8.bb => go-runtime_1.17.9.bb}         | 0
 meta/recipes-devtools/go/{go_1.17.8.bb => go_1.17.9.bb}       | 0
 8 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/go/{go-1.17.8.inc => go-1.17.9.inc} (92%)
 rename meta/recipes-devtools/go/{go-binary-native_1.17.8.bb => go-binary-native_1.17.9.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.17.8.bb => go-cross-canadian_1.17.9.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.17.8.bb => go-cross_1.17.9.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.17.8.bb => go-crosssdk_1.17.9.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.17.8.bb => go-native_1.17.9.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.17.8.bb => go-runtime_1.17.9.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.17.8.bb => go_1.17.9.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.17.8.inc b/meta/recipes-devtools/go/go-1.17.9.inc
similarity index 92%
rename from meta/recipes-devtools/go/go-1.17.8.inc
rename to meta/recipes-devtools/go/go-1.17.9.inc
index 649c09ec1d..aa2630016b 100644
--- a/meta/recipes-devtools/go/go-1.17.8.inc
+++ b/meta/recipes-devtools/go/go-1.17.9.inc
@@ -17,7 +17,7 @@ SRC_URI += "\
     file://0001-exec.go-do-not-write-linker-flags-into-buildids.patch \
     file://0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
 "
-SRC_URI[main.sha256sum] = "2effcd898140da79a061f3784ca4f8d8b13d811fb2abe9dad2404442dabbdf7a"
+SRC_URI[main.sha256sum] = "763ad4bafb80a9204458c5fa2b8e7327fa971aee454252c0e362c11236156813"
 
 # Upstream don't believe it is a signifiant real world issue and will only
 # fix in 1.17 onwards where we can drop this.
diff --git a/meta/recipes-devtools/go/go-binary-native_1.17.8.bb b/meta/recipes-devtools/go/go-binary-native_1.17.9.bb
similarity index 83%
rename from meta/recipes-devtools/go/go-binary-native_1.17.8.bb
rename to meta/recipes-devtools/go/go-binary-native_1.17.9.bb
index 1b85cd50d6..8a80fd1f69 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.17.8.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.17.9.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 PROVIDES = "go-native"
 
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "980e65a863377e69fd9b67df9d8395fd8e93858e7a24c9f55803421e453f4f99"
-SRC_URI[go_linux_arm64.sha256sum] = "57a9171682e297df1a5bd287be056ed0280195ad079af90af16dcad4f64710cb"
+SRC_URI[go_linux_amd64.sha256sum] = "9dacf782028fdfc79120576c872dee488b81257b1c48e9032d122cfdb379cca6"
+SRC_URI[go_linux_arm64.sha256sum] = "44dcdcd4f0fa6f83c15ef70b31580f1e3f95895c2f11a00e36c440c3554b6ad5"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.17.8.bb b/meta/recipes-devtools/go/go-cross-canadian_1.17.9.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.17.8.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.17.9.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.17.8.bb b/meta/recipes-devtools/go/go-cross_1.17.9.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.17.8.bb
rename to meta/recipes-devtools/go/go-cross_1.17.9.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.17.8.bb b/meta/recipes-devtools/go/go-crosssdk_1.17.9.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.17.8.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.17.9.bb
diff --git a/meta/recipes-devtools/go/go-native_1.17.8.bb b/meta/recipes-devtools/go/go-native_1.17.9.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.17.8.bb
rename to meta/recipes-devtools/go/go-native_1.17.9.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.17.8.bb b/meta/recipes-devtools/go/go-runtime_1.17.9.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.17.8.bb
rename to meta/recipes-devtools/go/go-runtime_1.17.9.bb
diff --git a/meta/recipes-devtools/go/go_1.17.8.bb b/meta/recipes-devtools/go/go_1.17.9.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.17.8.bb
rename to meta/recipes-devtools/go/go_1.17.9.bb
-- 
2.32.0


