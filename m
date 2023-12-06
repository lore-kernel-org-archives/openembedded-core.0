Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 209F2C10F05
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 15:59:49 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.35149.1701878383549154956
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 07:59:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HBl2rOL7;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40b27726369so73166355e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 07:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701878382; x=1702483182; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=utG50Db66CXRQGD+pZf2uud+3xZBCoEGI7Gpzlk0H3g=;
        b=HBl2rOL78lURh4AJ5hRLJmhzM3tgSuFdzbkmGTyMxlsrwrkCOlqiUzzSS66kF7mkwJ
         gQ7xIzsYkHOGed1S7G29mdjXytpaB/+sSFniMA7iZ5cD86ncWb1zX4sGJm43vAwuruej
         4JLs9irp7nD68TX6sZ6l9EgI1I2WDEFqyS2ZslKxf8L3RMo3GuboVWGCdzEp86l/eqDN
         kqtGmYL0rMhiyO9uaHYrLPVJMNr6I7ke2TGKF13yWSFL8g6NrQ92qD4fLtYewn8YhOly
         lreoXmOOHbrB/Lzo5vM0vpbhbUA56b/Q0LmqnI3O3ubpGt6A5jpNfy7cHayyu18E76BB
         ui9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701878382; x=1702483182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=utG50Db66CXRQGD+pZf2uud+3xZBCoEGI7Gpzlk0H3g=;
        b=RD8jRBrxgGiTYEA0dUAIRBXbMUZSAcN0fD3Nhl5n322NrYgj5iupCNAZwJ7o22vsBK
         eAMc0sEncLYCzoA1LKaebIpyJ3XCIpalFUgGUe1+y3ezcsuQfL9r/j0Mv/Unrd3i4FwG
         8LqKMJvAO+VpHq/8XH/Cvt/zpoUA52Q0oYuPbFDI8Vj6G0AXqRMRwKxf/giv5XWCKtY8
         kqPfpu2TjSKKVcMOiAMoOBcbdMrZ/Lja+F8rtbkeY9tB7P23ioZq65dATkiJK5iZJfvn
         5rreRAB7SGHiOp+Aitfln4Tl4mN6xqmQWbHPZ2PnArrFtQFGsuDiH7qBejTlgAsD7wFp
         lF3g==
X-Gm-Message-State: AOJu0Yyy8J01a5PnTWdW1GbDtsOtqIi7HZVwALaj45UNcOrj/lukkwSw
	lgEHe7nbRVFxQM6BJtyqUwtfaWFtHYk=
X-Google-Smtp-Source: AGHT+IHwqSxuRvtKNpCbGBqSGw/fjaJFC1o/HNYGB4psgJSP3trY8xOwrnx4dmIB6btqcnWyGAUcgg==
X-Received: by 2002:a05:600c:210:b0:40c:20ce:a020 with SMTP id 16-20020a05600c021000b0040c20cea020mr631491wmi.126.1701878381408;
        Wed, 06 Dec 2023 07:59:41 -0800 (PST)
Received: from toster.lan (bl23-105-200.dsl.telepac.pt. [144.64.105.200])
        by smtp.gmail.com with ESMTPSA id u21-20020a05600c139500b0040839fcb217sm47139wmf.8.2023.12.06.07.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 07:59:41 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: ricardo@foundries.io,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [PATCH v2 1/2] go: update 1.20.10 -> 1.20.11
Date: Wed,  6 Dec 2023 15:59:28 +0000
Message-ID: <20231206155929.1035815-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 15:59:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191904

Upgrade to latest 1.20.x release [1]:

$ git log --oneline go1.20.10..go1.20.11
1d0d4b149c (tag: go1.20.11) [release-branch.go1.20] go1.20.11
46fb781685 [release-branch.go1.20] path/filepath: fix various issues in parsing Windows paths
998fdce3ae [release-branch.go1.20] net/http: pull http2 underflow fix from x/net/http2
d48639094b [release-branch.go1.20] cmd/link: split text sections for arm 32-bit
c8fdffb790 [release-branch.go1.20] all: tidy dependency versioning after release

[1] https://github.com/golang/go/compare/go1.20.10...go1.20.11

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/recipes-devtools/go/{go-1.20.10.inc => go-1.20.11.inc} | 2 +-
 ...binary-native_1.20.10.bb => go-binary-native_1.20.11.bb} | 6 +++---
 ...oss-canadian_1.20.10.bb => go-cross-canadian_1.20.11.bb} | 0
 .../go/{go-cross_1.20.10.bb => go-cross_1.20.11.bb}         | 0
 .../go/{go-crosssdk_1.20.10.bb => go-crosssdk_1.20.11.bb}   | 0
 .../go/{go-native_1.20.10.bb => go-native_1.20.11.bb}       | 0
 .../go/{go-runtime_1.20.10.bb => go-runtime_1.20.11.bb}     | 0
 meta/recipes-devtools/go/{go_1.20.10.bb => go_1.20.11.bb}   | 0
 8 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.20.10.inc => go-1.20.11.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.20.10.bb => go-binary-native_1.20.11.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.20.10.bb => go-cross-canadian_1.20.11.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.20.10.bb => go-cross_1.20.11.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.20.10.bb => go-crosssdk_1.20.11.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.20.10.bb => go-native_1.20.11.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.20.10.bb => go-runtime_1.20.11.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.20.10.bb => go_1.20.11.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.20.10.inc b/meta/recipes-devtools/go/go-1.20.11.inc
similarity index 89%
rename from meta/recipes-devtools/go/go-1.20.10.inc
rename to meta/recipes-devtools/go/go-1.20.11.inc
index 39509ed986..2f510b1791 100644
--- a/meta/recipes-devtools/go/go-1.20.10.inc
+++ b/meta/recipes-devtools/go/go-1.20.11.inc
@@ -15,4 +15,4 @@ SRC_URI += "\
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
 "
-SRC_URI[main.sha256sum] = "72d2f51805c47150066c103754c75fddb2c19d48c9219fa33d1e46696c841dbb"
+SRC_URI[main.sha256sum] = "d355c5ae3a8f7763c9ec9dc25153aae373958cbcb60dd09e91a8b56c7621b2fc"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.20.10.bb b/meta/recipes-devtools/go/go-binary-native_1.20.11.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.20.10.bb
rename to meta/recipes-devtools/go/go-binary-native_1.20.11.bb
index 691670c31e..bf91067971 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.20.10.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.20.11.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "80d34f1fd74e382d86c2d6102e0e60d4318461a7c2f457ec1efc4042752d4248"
-SRC_URI[go_linux_arm64.sha256sum] = "fb3c7e15fc4413c5b81eb9f26dbd7cd4faedd5c720b30fa8e2ff77457f74cab6"
-SRC_URI[go_linux_ppc64le.sha256sum] = "ebac6e713810174f9ffd7f48c17c373fbf359d50d8e6233b1dfbbdebd524fd1c"
+SRC_URI[go_linux_amd64.sha256sum] = "ef79a11aa095a08772d2a69e4f152f897c4e96ee297b0dc20264b7dec2961abe"
+SRC_URI[go_linux_arm64.sha256sum] = "7908a49c6ce9d48af9b5ba76ccaa0769da45d8b635259a01065b3739acef4ada"
+SRC_URI[go_linux_ppc64le.sha256sum] = "e04676e1aeafe7c415176f330322d43a4be5ea6deb14aca49905bd1449dc7072"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.20.10.bb b/meta/recipes-devtools/go/go-cross-canadian_1.20.11.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.20.10.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.20.11.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.20.10.bb b/meta/recipes-devtools/go/go-cross_1.20.11.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.20.10.bb
rename to meta/recipes-devtools/go/go-cross_1.20.11.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.20.10.bb b/meta/recipes-devtools/go/go-crosssdk_1.20.11.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.20.10.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.20.11.bb
diff --git a/meta/recipes-devtools/go/go-native_1.20.10.bb b/meta/recipes-devtools/go/go-native_1.20.11.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.20.10.bb
rename to meta/recipes-devtools/go/go-native_1.20.11.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.20.10.bb b/meta/recipes-devtools/go/go-runtime_1.20.11.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.20.10.bb
rename to meta/recipes-devtools/go/go-runtime_1.20.11.bb
diff --git a/meta/recipes-devtools/go/go_1.20.10.bb b/meta/recipes-devtools/go/go_1.20.11.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.20.10.bb
rename to meta/recipes-devtools/go/go_1.20.11.bb
-- 
2.43.0


