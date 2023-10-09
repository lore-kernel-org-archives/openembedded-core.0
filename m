Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32286CD6109
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 16:41:01 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.68201.1696869655961999808
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Oct 2023 09:40:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A0m5+dEc;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40572aeb73cso43556975e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Oct 2023 09:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696869654; x=1697474454; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R1Mu2dgf7/+5ioAtkozimttoOVx/WrwqHli7y+fWSdw=;
        b=A0m5+dEcLpR1LPTMW3FlQL/FSNuIuRMTcJtcrOg932tucLeIhJ89G0QY6sfvfGbCXA
         HyI9kpX25uBcmG/koDE8Lp8b3D/UC13kbbi1AQPKiLFeHghHF+lL9CQtrh8Etehk1ZWH
         w+xtTe/28SJArabu7l308waWce+mBM/4W6rl9gXymMxlWa0FEMZMfh3WEGM4a2DatAqB
         8X3Xq/fdhTnxTMVs8Rgfda/byCXHgYrsT+yUCtjEVwJOFfLW2iUDtu8Ohbi648yjrH/b
         Ayn6hU8jl6FqPA3QFLIzxPopTGbi1t9KmCUJCpnJ9+rBGu9SfZuZjiv6k1LiUw3ynJLx
         ajyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696869654; x=1697474454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R1Mu2dgf7/+5ioAtkozimttoOVx/WrwqHli7y+fWSdw=;
        b=bymW4EM8I7Px4b63TjNdRnbYytyMcfWb+5jBL0VJq9xAJTyiEos22dIqfW3m+zhGvT
         FSrlgoNp1HxeKk9d/11dLWlUzhPcnK+VivYIMBmdNCx8PE4k5GsurSz+TEWmXdz4+eDm
         vmKbjy9ueFsaFoOB1kN3Sneays+9cre30zlzsNeYF71OBWNC0jMl672JI8+LHDGHUyiY
         4z0M75gNeYRMvPcp+x629qViROqgPzKbrJ6w5HU4Ctdh82T2gZFfWzFQ3Xg5tE5vEGGz
         USsOn9qsi0DdgZVnqUXwEW855Ca6G4qZ3fKYP0qWssVbr8XhhSbCA4u36WuUovWTutyc
         zMZQ==
X-Gm-Message-State: AOJu0YyVSEGhCD7x2lvqngrkGwUVStBQXK/727Z7EHJS9TV+9IMjr4wg
	YZMoSXWtGzJgJhHgx1ePf1TkGBhUl94KBg==
X-Google-Smtp-Source: AGHT+IFSul3RbToS1q4HwnDu58oTIwVwXe8q9kuVMStyTJCjY1ioN6xgaPaXMahHfhkMsehnZLKxfQ==
X-Received: by 2002:a05:600c:3b20:b0:406:847a:2934 with SMTP id m32-20020a05600c3b2000b00406847a2934mr12577459wms.28.1696869653797;
        Mon, 09 Oct 2023 09:40:53 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.net ([2001:bc8:6005:6:8218:44ff:fef2:ade0])
        by smtp.gmail.com with ESMTPSA id y6-20020a1c4b06000000b00405588aa40asm11652950wma.24.2023.10.09.09.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 09:40:53 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH 2/2] go: update 1.20.8 -> 1.20.9
Date: Mon,  9 Oct 2023 16:40:37 +0000
Message-Id: <20231009164037.1076346-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231009164037.1076346-1-jose.quaresma@foundries.io>
References: <20231009164037.1076346-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Oct 2023 16:41:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188850

Upgrade to latest 1.20.x release [1]:

$ git log --oneline go1.20.8..go1.20.9
68f9a6e2ad (tag: go1.20.9) [release-branch.go1.20] go1.20.9
31d5b604ac [release-branch.go1.20] cmd/compile: use absolute file name in isCgo check
83dce45959 [release-branch.go1.20] cmd/link: suppress -bind_at_load deprecation warning for ld-prime
08c544db98 [release-branch.go1.20] cmd/link: disable DWARF by default in c-shared mode on darwin
071f03a8e5 [release-branch.go1.20] cmd/link: force old Apple linker in plugin mode

[1] https://github.com/golang/go/compare/go1.20.8...go1.20.9

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---

v2: add bump to 1.20.9

 meta/recipes-devtools/go/{go-1.20.8.inc => go-1.20.9.inc}   | 2 +-
 ...o-binary-native_1.20.8.bb => go-binary-native_1.20.9.bb} | 6 +++---
 ...cross-canadian_1.20.8.bb => go-cross-canadian_1.20.9.bb} | 0
 .../go/{go-cross_1.20.8.bb => go-cross_1.20.9.bb}           | 0
 .../go/{go-crosssdk_1.20.8.bb => go-crosssdk_1.20.9.bb}     | 0
 .../go/{go-native_1.20.8.bb => go-native_1.20.9.bb}         | 0
 .../go/{go-runtime_1.20.8.bb => go-runtime_1.20.9.bb}       | 0
 meta/recipes-devtools/go/{go_1.20.8.bb => go_1.20.9.bb}     | 0
 8 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.20.8.inc => go-1.20.9.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.20.8.bb => go-binary-native_1.20.9.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.20.8.bb => go-cross-canadian_1.20.9.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.20.8.bb => go-cross_1.20.9.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.20.8.bb => go-crosssdk_1.20.9.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.20.8.bb => go-native_1.20.9.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.20.8.bb => go-runtime_1.20.9.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.20.8.bb => go_1.20.9.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.20.8.inc b/meta/recipes-devtools/go/go-1.20.9.inc
similarity index 89%
rename from meta/recipes-devtools/go/go-1.20.8.inc
rename to meta/recipes-devtools/go/go-1.20.9.inc
index 958d751323..775208c007 100644
--- a/meta/recipes-devtools/go/go-1.20.8.inc
+++ b/meta/recipes-devtools/go/go-1.20.9.inc
@@ -15,4 +15,4 @@ SRC_URI += "\
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
 "
-SRC_URI[main.sha256sum] = "38d71714fa5279f97240451956d8e47e3c1b6a5de7cb84137949d62b5dd3182e"
+SRC_URI[main.sha256sum] = "4923920381cd71d68b527761afefa523ea18c5831b4795034c827e18b685cdcf"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.20.8.bb b/meta/recipes-devtools/go/go-binary-native_1.20.9.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.20.8.bb
rename to meta/recipes-devtools/go/go-binary-native_1.20.9.bb
index cd6dbcb5e9..3fcb923ca0 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.20.8.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.20.9.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "cc97c28d9c252fbf28f91950d830201aa403836cbed702a05932e63f7f0c7bc4"
-SRC_URI[go_linux_arm64.sha256sum] = "15ab379c6a2b0d086fe3e74be4599420e66549edf7426a300ee0f3809500f89e"
-SRC_URI[go_linux_ppc64le.sha256sum] = "a5034a9c7eac6c5bcc650c2605c5edb4039c7b6064e2a2ea43c415c8af91f5f6"
+SRC_URI[go_linux_amd64.sha256sum] = "8921369701afa749b07232d2c34d514510c32dbfd79c65adb379451b5f0d7216"
+SRC_URI[go_linux_arm64.sha256sum] = "da7fca78f85b90b495382cd74b2d0a1c0b6aaa200e7feb27ae7198352b2317fa"
+SRC_URI[go_linux_ppc64le.sha256sum] = "2db0628914522d9d2dbc7070877131dd9d1f8f74387f2f32314b5cfb5e45ff82"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.20.8.bb b/meta/recipes-devtools/go/go-cross-canadian_1.20.9.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.20.8.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.20.9.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.20.8.bb b/meta/recipes-devtools/go/go-cross_1.20.9.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.20.8.bb
rename to meta/recipes-devtools/go/go-cross_1.20.9.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.20.8.bb b/meta/recipes-devtools/go/go-crosssdk_1.20.9.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.20.8.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.20.9.bb
diff --git a/meta/recipes-devtools/go/go-native_1.20.8.bb b/meta/recipes-devtools/go/go-native_1.20.9.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.20.8.bb
rename to meta/recipes-devtools/go/go-native_1.20.9.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.20.8.bb b/meta/recipes-devtools/go/go-runtime_1.20.9.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.20.8.bb
rename to meta/recipes-devtools/go/go-runtime_1.20.9.bb
diff --git a/meta/recipes-devtools/go/go_1.20.8.bb b/meta/recipes-devtools/go/go_1.20.9.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.20.8.bb
rename to meta/recipes-devtools/go/go_1.20.9.bb
-- 
2.34.1


