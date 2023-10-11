Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 431B8CD6E5D
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 12:26:11 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.15132.1697027165934157519
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Oct 2023 05:26:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KMe3XqMM;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-406402933edso63636595e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 05:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697027164; x=1697631964; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ISLicB02xu/EPKHlF63M/Q1odNwjaUYNPr/p8Zykv7A=;
        b=KMe3XqMMVB3ZTUtJ7Mb82sqohvIuC+n+6pXw8JzbJSiZ2hwqMLylAYBXQkmT8MBMSS
         k4f8o5rRmvEoOhk00iJAXNcOtmFhvBwcWBexqlMV4AE8BofFUAN3XOqXXWIgUo5MhWFu
         e1HprAlMrFRjed1gJ75cjYpLyFSaQOKaSt/zDxB0Em2LcqGv7qUu4omrLKXfNYTxfYQr
         ZLoAwahvIEHoA3GP9YiQ/0I5CwoLTSWXhAMQULr/bOjzRtl+KZXFiYqhcBj3qzcetX4u
         18v8M1YDSyM6GwKfX5snNhBxOEg2zL+imKyu67EcoesLfUYES4o0GrUkcYQzQw8S5zqo
         cKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697027164; x=1697631964;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ISLicB02xu/EPKHlF63M/Q1odNwjaUYNPr/p8Zykv7A=;
        b=bIRfwVaCSu+6wttRPrdIxQhCY1FZBzERYNdtn+gKBxdv7cBcorv0WgyhS84APZUy9d
         nfGCerlUo4a9X/MGBrMD/S91CBNBYfE0E6DFHVjTVIXidFUF6/roM4NtgmMyYm3uTcer
         oQLNWp3x3WTQ6f31QzPmSIpMbXQp2MByYUBXeO3LlmDgwvJKjUHXqTJWEHP1DOmlJm/r
         Tu8qSFy+XFEKO4uAISxBVy3d/uflQ9+pN1JuOkQPkshUWnvCj00TiJJxPKQUtQKAPAjy
         O7PcUbLORGXffb70QRAFyzC0WqXglVmbj6nmFGVrMtjFZBkgO4jAt5I7mBwFmzrvOyN6
         JunA==
X-Gm-Message-State: AOJu0Yw2jJ9fIQt7qAKL5xHbpzCNKTReNtjmN5kK1lO9Y3tIlq573kb+
	49yOjvgU3DCB7HzcCLJKwA0CS2j0cNviuQ==
X-Google-Smtp-Source: AGHT+IGxpXTcKl6NkGgEjT1Op6mJFJXhqDvqfuMtBIcnc0XS+WVbbKkFqFgEV8ddD08dKkk6BVXLiw==
X-Received: by 2002:a7b:c7d7:0:b0:3fd:2e89:31bd with SMTP id z23-20020a7bc7d7000000b003fd2e8931bdmr18411253wmk.14.1697027163610;
        Wed, 11 Oct 2023 05:26:03 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.net ([2001:bc8:6005:6:8218:44ff:fef2:ade0])
        by smtp.gmail.com with ESMTPSA id f19-20020a7bc8d3000000b00405959469afsm16796969wml.3.2023.10.11.05.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 05:26:03 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH] go: update 1.20.9 -> 1.20.10
Date: Wed, 11 Oct 2023 12:16:21 +0000
Message-Id: <20231011121621.3122304-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 12:26:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188955

Upgrade to latest 1.20.x release [1]:

$ git log --oneline go1.20.9..go1.20.10
8042fd87f3 (tag: go1.20.10) [release-branch.go1.20] go1.20.10
e175f27f58 [release-branch.go1.20] net/http: regenerate h2_bundle.go

[1] https://github.com/golang/go/compare/go1.20.9...go1.20.10

Fixes CVE-2023-39325

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/recipes-devtools/go/{go-1.20.9.inc => go-1.20.10.inc}  | 2 +-
 ...-binary-native_1.20.9.bb => go-binary-native_1.20.10.bb} | 6 +++---
 ...ross-canadian_1.20.9.bb => go-cross-canadian_1.20.10.bb} | 0
 .../go/{go-cross_1.20.9.bb => go-cross_1.20.10.bb}          | 0
 .../go/{go-crosssdk_1.20.9.bb => go-crosssdk_1.20.10.bb}    | 0
 .../go/{go-native_1.20.9.bb => go-native_1.20.10.bb}        | 0
 .../go/{go-runtime_1.20.9.bb => go-runtime_1.20.10.bb}      | 0
 meta/recipes-devtools/go/{go_1.20.9.bb => go_1.20.10.bb}    | 0
 8 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.20.9.inc => go-1.20.10.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.20.9.bb => go-binary-native_1.20.10.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.20.9.bb => go-cross-canadian_1.20.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.20.9.bb => go-cross_1.20.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.20.9.bb => go-crosssdk_1.20.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.20.9.bb => go-native_1.20.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.20.9.bb => go-runtime_1.20.10.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.20.9.bb => go_1.20.10.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.20.9.inc b/meta/recipes-devtools/go/go-1.20.10.inc
similarity index 89%
rename from meta/recipes-devtools/go/go-1.20.9.inc
rename to meta/recipes-devtools/go/go-1.20.10.inc
index 775208c007..39509ed986 100644
--- a/meta/recipes-devtools/go/go-1.20.9.inc
+++ b/meta/recipes-devtools/go/go-1.20.10.inc
@@ -15,4 +15,4 @@ SRC_URI += "\
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
 "
-SRC_URI[main.sha256sum] = "4923920381cd71d68b527761afefa523ea18c5831b4795034c827e18b685cdcf"
+SRC_URI[main.sha256sum] = "72d2f51805c47150066c103754c75fddb2c19d48c9219fa33d1e46696c841dbb"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.20.9.bb b/meta/recipes-devtools/go/go-binary-native_1.20.10.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.20.9.bb
rename to meta/recipes-devtools/go/go-binary-native_1.20.10.bb
index 3fcb923ca0..691670c31e 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.20.9.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.20.10.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "8921369701afa749b07232d2c34d514510c32dbfd79c65adb379451b5f0d7216"
-SRC_URI[go_linux_arm64.sha256sum] = "da7fca78f85b90b495382cd74b2d0a1c0b6aaa200e7feb27ae7198352b2317fa"
-SRC_URI[go_linux_ppc64le.sha256sum] = "2db0628914522d9d2dbc7070877131dd9d1f8f74387f2f32314b5cfb5e45ff82"
+SRC_URI[go_linux_amd64.sha256sum] = "80d34f1fd74e382d86c2d6102e0e60d4318461a7c2f457ec1efc4042752d4248"
+SRC_URI[go_linux_arm64.sha256sum] = "fb3c7e15fc4413c5b81eb9f26dbd7cd4faedd5c720b30fa8e2ff77457f74cab6"
+SRC_URI[go_linux_ppc64le.sha256sum] = "ebac6e713810174f9ffd7f48c17c373fbf359d50d8e6233b1dfbbdebd524fd1c"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.20.9.bb b/meta/recipes-devtools/go/go-cross-canadian_1.20.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.20.9.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.20.10.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.20.9.bb b/meta/recipes-devtools/go/go-cross_1.20.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.20.9.bb
rename to meta/recipes-devtools/go/go-cross_1.20.10.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.20.9.bb b/meta/recipes-devtools/go/go-crosssdk_1.20.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.20.9.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.20.10.bb
diff --git a/meta/recipes-devtools/go/go-native_1.20.9.bb b/meta/recipes-devtools/go/go-native_1.20.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.20.9.bb
rename to meta/recipes-devtools/go/go-native_1.20.10.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.20.9.bb b/meta/recipes-devtools/go/go-runtime_1.20.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.20.9.bb
rename to meta/recipes-devtools/go/go-runtime_1.20.10.bb
diff --git a/meta/recipes-devtools/go/go_1.20.9.bb b/meta/recipes-devtools/go/go_1.20.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.20.9.bb
rename to meta/recipes-devtools/go/go_1.20.10.bb
-- 
2.34.1


