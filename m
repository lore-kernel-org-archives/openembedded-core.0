Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7A92C433FE
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 14:30:16 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.7510.1653489011352087718
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:30:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=mwATC2bS;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id s14so18714597plk.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=pW4lgeDsTv4vbFterzTVs6yOMoA0by7FWmKBZmCEr+M=;
        b=mwATC2bS6vXOboG+80pOi4MRyBceQLnkqBQasIXSrKfvw6ahJuhJrhbCUf2B5tnMGd
         IIre7vGR1wj/x3IMiY2ZPLdq9TEHagO5fv/7Sq6FSKtqda2MT0YZdnNSNDlqptXY/54H
         q5vHxtfpg9bTZIxSyDyCM77b3jbITY8h565y9NHgqITgZCcV18GkNxrpjWzwU8yf+mSp
         ejSeMPvGtTD4UwV20l23OGp54riXNxvDHsS3nwlM3ITAl6lYGnqS6nk4LxpRJQjiJ7Be
         EHn5fi8zmlKt8uVn+ybWImBy0vR6+nei2in13dfw6olHhvJceqACaE1wWBvy0IwrTzkM
         BTlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pW4lgeDsTv4vbFterzTVs6yOMoA0by7FWmKBZmCEr+M=;
        b=un0y4B75EHzSQhYYtKIbnCKFg8fujN5GOzb1HURbIfCYdoQl8mmiT4RGiewo6RkahW
         DMR2w1MZKOyKYbg0wiXtl30VULwKE9pO8fusFj40FYwNCVeYkXkLWJlA5T9Q3/s5I5y2
         O5odVuQjU5GVa/IQvZs6BQeMIMTiADkBH7z1qKTAxPrhclDglcp1FJwAxes47mQ+1bds
         f9Zsfa5OQALPpwJ/6Xg6yAowRpd/TJK4rUw36kmhp07rZVs2ruD5XzSArhkj9lSzfxlM
         /g1TPM/4I47VHfZbgBeu0K8Ti9G0mDE16auLBqFULJqoOqCQMTol/1KG2mx0jfvVBEqj
         ORHw==
X-Gm-Message-State: AOAM53188yKFypwrPZl0Vf+mWWIHlU9Vc29ZElaGN9i7n2ZugTXbyCiN
	HxI4fuObQyTfOXl19YRsxbKRI3PgRdQNnJbd
X-Google-Smtp-Source: 
 ABdhPJwggFbtfoZsbfE/2VZuAIGgSr8DZ0ydDup3pfgRj7siLGFG2ska1H5laSEo66bqDuANY3Defg==
X-Received: by 2002:a17:903:124a:b0:154:c7a4:9374 with SMTP id
 u10-20020a170903124a00b00154c7a49374mr33302332plh.68.1653489009969;
        Wed, 25 May 2022 07:30:09 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a8-20020a656408000000b003db141a5f26sm8553837pgv.1.2022.05.25.07.30.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 07:30:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/19] go: upgrade 1.17.8 -> 1.17.10
Date: Wed, 25 May 2022 04:29:31 -1000
Message-Id: 
 <bcbfff47e212627b355c54ab782f38708ed12d4c.1653488418.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1653488418.git.steve@sakoman.com>
References: <cover.1653488418.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 14:30:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166129

go1.17.9 (released 2022-04-12) includes security fixes to the crypto/elliptic and
encoding/pem packages, as well as bug fixes to the linker and runtime.

go1.17.10 (released 2022-05-10) includes security fixes to the syscall package,
as well as bug fixes to the compiler, runtime, and the crypto/x509 and
net/http/httptest packages.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/{go-1.17.8.inc => go-1.17.10.inc}    | 2 +-
 ...go-binary-native_1.17.8.bb => go-binary-native_1.17.10.bb} | 4 ++--
 ...-cross-canadian_1.17.8.bb => go-cross-canadian_1.17.10.bb} | 0
 .../go/{go-cross_1.17.8.bb => go-cross_1.17.10.bb}            | 0
 .../go/{go-crosssdk_1.17.8.bb => go-crosssdk_1.17.10.bb}      | 0
 .../go/{go-native_1.17.8.bb => go-native_1.17.10.bb}          | 0
 .../go/{go-runtime_1.17.8.bb => go-runtime_1.17.10.bb}        | 0
 meta/recipes-devtools/go/{go_1.17.8.bb => go_1.17.10.bb}      | 0
 8 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/go/{go-1.17.8.inc => go-1.17.10.inc} (92%)
 rename meta/recipes-devtools/go/{go-binary-native_1.17.8.bb => go-binary-native_1.17.10.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.17.8.bb => go-cross-canadian_1.17.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.17.8.bb => go-cross_1.17.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.17.8.bb => go-crosssdk_1.17.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.17.8.bb => go-native_1.17.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.17.8.bb => go-runtime_1.17.10.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.17.8.bb => go_1.17.10.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.17.8.inc b/meta/recipes-devtools/go/go-1.17.10.inc
similarity index 92%
rename from meta/recipes-devtools/go/go-1.17.8.inc
rename to meta/recipes-devtools/go/go-1.17.10.inc
index 649c09ec1d..e71feb5d02 100644
--- a/meta/recipes-devtools/go/go-1.17.8.inc
+++ b/meta/recipes-devtools/go/go-1.17.10.inc
@@ -17,7 +17,7 @@ SRC_URI += "\
     file://0001-exec.go-do-not-write-linker-flags-into-buildids.patch \
     file://0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
 "
-SRC_URI[main.sha256sum] = "2effcd898140da79a061f3784ca4f8d8b13d811fb2abe9dad2404442dabbdf7a"
+SRC_URI[main.sha256sum] = "299e55af30f15691b015d8dcf8ecae72412412569e5b2ece20361753a456f2f9"
 
 # Upstream don't believe it is a signifiant real world issue and will only
 # fix in 1.17 onwards where we can drop this.
diff --git a/meta/recipes-devtools/go/go-binary-native_1.17.8.bb b/meta/recipes-devtools/go/go-binary-native_1.17.10.bb
similarity index 83%
rename from meta/recipes-devtools/go/go-binary-native_1.17.8.bb
rename to meta/recipes-devtools/go/go-binary-native_1.17.10.bb
index 1b85cd50d6..0f49cebcb7 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.17.8.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.17.10.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 PROVIDES = "go-native"
 
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "980e65a863377e69fd9b67df9d8395fd8e93858e7a24c9f55803421e453f4f99"
-SRC_URI[go_linux_arm64.sha256sum] = "57a9171682e297df1a5bd287be056ed0280195ad079af90af16dcad4f64710cb"
+SRC_URI[go_linux_amd64.sha256sum] = "87fc728c9c731e2f74e4a999ef53cf07302d7ed3504b0839027bd9c10edaa3fd"
+SRC_URI[go_linux_arm64.sha256sum] = "649141201efa7195403eb1301b95dc79c5b3e65968986a391da1370521701b0c"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.17.8.bb b/meta/recipes-devtools/go/go-cross-canadian_1.17.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.17.8.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.17.10.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.17.8.bb b/meta/recipes-devtools/go/go-cross_1.17.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.17.8.bb
rename to meta/recipes-devtools/go/go-cross_1.17.10.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.17.8.bb b/meta/recipes-devtools/go/go-crosssdk_1.17.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.17.8.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.17.10.bb
diff --git a/meta/recipes-devtools/go/go-native_1.17.8.bb b/meta/recipes-devtools/go/go-native_1.17.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.17.8.bb
rename to meta/recipes-devtools/go/go-native_1.17.10.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.17.8.bb b/meta/recipes-devtools/go/go-runtime_1.17.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.17.8.bb
rename to meta/recipes-devtools/go/go-runtime_1.17.10.bb
diff --git a/meta/recipes-devtools/go/go_1.17.8.bb b/meta/recipes-devtools/go/go_1.17.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.17.8.bb
rename to meta/recipes-devtools/go/go_1.17.10.bb
-- 
2.25.1


