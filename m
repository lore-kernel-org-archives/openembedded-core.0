Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04DF4C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 15:57:29 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.35055.1701878243375093470
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 07:57:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JDLOBfwe;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40b5155e154so77467215e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 07:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701878241; x=1702483041; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=utG50Db66CXRQGD+pZf2uud+3xZBCoEGI7Gpzlk0H3g=;
        b=JDLOBfwew0qgEgR8diYo5aCC73QeotGeyUJtWt0oFysZNXtNfgb+SO0yRtltU0Y1u2
         F18w1Jx0USNg6G0jN9nugt1T+Ees/g+N81wvcYQVCV2PymCI/BujnmGzPDkISXlZck4m
         lomZkrf0gUxQU7WdcJdnc2m3LTasjlphf2rCxP6/lQm0ySMQJtXM8/k2WGTc0tl8mhUv
         Gcp7iGhM5PMS5usTEgBUGcByZBKVR8wvwren9DpRk+3hbV4HJvlJGDeFs+J53ETeqXVg
         kCZ1PpNeyW8Ofv1gpVoAnBvRkxBkLSQFvKBG36nSEym36R3zDoMNc5WBSZLzRHqi9zOw
         6ntQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701878241; x=1702483041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=utG50Db66CXRQGD+pZf2uud+3xZBCoEGI7Gpzlk0H3g=;
        b=VdFN67LENZrIpGysBJ043WfLBJErpJSQUqUO+SpLAiZgJbMexC/NlQQ3NfiM5rqFbM
         J2pZ3SELj17qOv43s8HxqJcfCX039ABCN7gkTMdqZu47GhucjNk41XIfGtAb4QRIcgLf
         7pjAEIRN3VIiniFtye4GSdu1O5lhwZOMmMq5R/5RRJ3D3vSwnfw2TwfhQmiL0LQvl97J
         8tzknl3QTXAxhMUItCDVkvWrfTaqL1D4eQV484jylJyU/lT1bmPKcvnuW2Gx+R7T3//C
         PNO0W1/t2t6VADAgj5eaj8lU2p655GFAYHNf7+wgoJCtRSR1hgkXdYB21348t9ens23/
         mQqw==
X-Gm-Message-State: AOJu0YyWt4QFO08VDG4BRavixKD2zh3CJYrHclFShdc94+BSgPKGwlHo
	2N770H8SHFaRfwmw7MyQuKtmkfQX+Pc=
X-Google-Smtp-Source: AGHT+IEXh6+sthHPfppM4kCVhWDzJsPXCgKgpFUjf+Emy71II0D3+fjaqQQTuC4XNbhEofGzBs37Uw==
X-Received: by 2002:a05:600c:211a:b0:40c:1d9f:aeb4 with SMTP id u26-20020a05600c211a00b0040c1d9faeb4mr606717wml.220.1701878241236;
        Wed, 06 Dec 2023 07:57:21 -0800 (PST)
Received: from toster.lan (bl23-105-200.dsl.telepac.pt. [144.64.105.200])
        by smtp.gmail.com with ESMTPSA id n14-20020a5d6b8e000000b00334b302e97fsm5202wrx.96.2023.12.06.07.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 07:57:20 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: ricardo@foundries.io,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [PATCH 1/2] go: update 1.20.10 -> 1.20.11
Date: Wed,  6 Dec 2023 15:56:52 +0000
Message-ID: <20231206155653.1035655-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 15:57:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191902

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


