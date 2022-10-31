Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64729FA3743
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 15:56:12 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web09.10888.1667231767799672694
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Oct 2022 08:56:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EdBvV1eE;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id bk15so16557540wrb.13
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 08:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6+Lo3EO4ysRDWIt9GLHzLFIUKWGsyl3i0zFIKD+tsCE=;
        b=EdBvV1eE87DBfHo/KjAT1ChlIyCoaJRvoUFUrFUiOhoLQ4Ahi9qAOkM0FlYYoAY3Bt
         KjRbVsyy4wEqcOmDQZ8KaFG7FLY2zDMMhL2c+EJ6rP6dS5n2iElX4h91JuwzlYC6Wdv6
         1+N9GE2NV1dPAhrVkuMe94AhLanIOVZuRp/NlA4t3byzCOuXDLj/9g53YA652OVf5Yk8
         IPCkI87Ez2x6dmu/8AARM0zbczCo1xgKfgRxhz3AWKQOM3PFnEzWZanMQKd4cylvBM4i
         3V4dX2Qe4J6AjNefZUE2A106W25Tvuct4fGtiTx9vRThFyC/9SC2NNnAo8CcsNGPLbU5
         IdNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6+Lo3EO4ysRDWIt9GLHzLFIUKWGsyl3i0zFIKD+tsCE=;
        b=sRsSnGBjxyQ9/mQxhujFz8DMFuADSNzp5E6p4/7yB+CU5XRgbJcwvmUzoVl3ZJbAML
         c2BtyOLJdmmTJuTc93pffIWlFu5ZqpeI3uhilJCFfj606nq7Ev/dKyWaOP4mMd5WwK68
         xte664fZyp/02hPSFEVfBP0TYNH/XjzIu0p3rSzRcYBTVCbAVU1mjkYjVl7ICNm1YBku
         kX3jymORN6/HYtg+VFJ6CYprN5S6F0UaebLnl86fHPL0DfVxPBXYYnOPfdOw7bIqIvKm
         1tA7xUtybUi1hgIRyrXcorIDKw0G0mqxKvibZHk9mYq5TCl+Wqx7GomVcnLORXdu7n6e
         fpWw==
X-Gm-Message-State: ACrzQf2/aZeVW7+LDGL8tV/VFEGZfxWjvNQ07bHJZ2U78a5B8oegUPo7
	gETkcLIG9WmMcGZMP/A23npcXb6kfsQ=
X-Google-Smtp-Source: AMsMyM7QoJ+H0ph3TYHcmfI4Qq6CZvhtsWXEUWECifD9lxFsQkZXRa1rVSOjHzsCBUaRkx6GchJ+OQ==
X-Received: by 2002:adf:e8cb:0:b0:236:7ae2:918e with SMTP id k11-20020adfe8cb000000b002367ae2918emr8725516wrn.613.1667231766074;
        Mon, 31 Oct 2022 08:56:06 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l15-20020a5d480f000000b002366eb01e07sm7420712wrq.114.2022.10.31.08.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 08:56:05 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] go: update 1.19 -> 1.19.2
Date: Mon, 31 Oct 2022 16:56:02 +0100
Message-Id: <20221031155602.968767-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 15:56:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172327

Drop stack-protector.patch as issue fixed upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../go/{go-1.19.inc => go-1.19.2.inc}         |  3 +-
 ...ive_1.19.bb => go-binary-native_1.19.2.bb} |  7 ++--
 ...an_1.19.bb => go-cross-canadian_1.19.2.bb} |  0
 .../{go-cross_1.19.bb => go-cross_1.19.2.bb}  |  0
 ...crosssdk_1.19.bb => go-crosssdk_1.19.2.bb} |  0
 ...{go-native_1.19.bb => go-native_1.19.2.bb} |  0
 ...o-runtime_1.19.bb => go-runtime_1.19.2.bb} |  0
 ...ent-based-hash-generation-less-pedan.patch |  8 ++---
 .../go/go/stack-protector.patch               | 32 -------------------
 .../go/{go_1.19.bb => go_1.19.2.bb}           |  0
 10 files changed, 9 insertions(+), 41 deletions(-)
 rename meta/recipes-devtools/go/{go-1.19.inc => go-1.19.2.inc} (85%)
 rename meta/recipes-devtools/go/{go-binary-native_1.19.bb => go-binary-native_1.19.2.bb} (75%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.19.bb => go-cross-canadian_1.19.2.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.19.bb => go-cross_1.19.2.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.19.bb => go-crosssdk_1.19.2.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.19.bb => go-native_1.19.2.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.19.bb => go-runtime_1.19.2.bb} (100%)
 delete mode 100644 meta/recipes-devtools/go/go/stack-protector.patch
 rename meta/recipes-devtools/go/{go_1.19.bb => go_1.19.2.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.19.inc b/meta/recipes-devtools/go/go-1.19.2.inc
similarity index 85%
rename from meta/recipes-devtools/go/go-1.19.inc
rename to meta/recipes-devtools/go/go-1.19.2.inc
index f733a807b4..206ee3ca45 100644
--- a/meta/recipes-devtools/go/go-1.19.inc
+++ b/meta/recipes-devtools/go/go-1.19.2.inc
@@ -14,6 +14,5 @@ SRC_URI += "\
     file://0001-exec.go-do-not-write-linker-flags-into-buildids.patch \
     file://0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://filter-build-paths.patch \
-    file://stack-protector.patch \
 "
-SRC_URI[main.sha256sum] = "9419cc70dc5a2523f29a77053cafff658ed21ef3561d9b6b020280ebceab28b9"
+SRC_URI[main.sha256sum] = "2ce930d70a931de660fdaf271d70192793b1b240272645bf0275779f6704df6b"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.19.bb b/meta/recipes-devtools/go/go-binary-native_1.19.2.bb
similarity index 75%
rename from meta/recipes-devtools/go/go-binary-native_1.19.bb
rename to meta/recipes-devtools/go/go-binary-native_1.19.2.bb
index eda90f3753..65d7c9de49 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.19.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.19.2.bb
@@ -7,10 +7,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 
 PROVIDES = "go-native"
 
+# Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "464b6b66591f6cf055bc5df90a9750bf5fbc9d038722bb84a9d56a2bea974be6"
-SRC_URI[go_linux_arm64.sha256sum] = "efa97fac9574fc6ef6c9ff3e3758fb85f1439b046573bf434cccb5e012bd00c8"
-SRC_URI[go_linux_ppc64le.sha256sum] = "92bf5aa598a01b279d03847c32788a3a7e0a247a029dedb7c759811c2a4241fc"
+SRC_URI[go_linux_amd64.sha256sum] = "5e8c5a74fe6470dd7e055a461acda8bb4050ead8c2df70f227e3ff7d8eb7eeb6"
+SRC_URI[go_linux_arm64.sha256sum] = "b62a8d9654436c67c14a0c91e931d50440541f09eb991a987536cb982903126d"
+SRC_URI[go_linux_ppc64le.sha256sum] = "37e1d4342f7103aeb9babeabe8c71ef3dba23db28db525071119e94b2aa21d7d"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.19.bb b/meta/recipes-devtools/go/go-cross-canadian_1.19.2.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.19.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.19.2.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.19.bb b/meta/recipes-devtools/go/go-cross_1.19.2.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.19.bb
rename to meta/recipes-devtools/go/go-cross_1.19.2.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.19.bb b/meta/recipes-devtools/go/go-crosssdk_1.19.2.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.19.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.19.2.bb
diff --git a/meta/recipes-devtools/go/go-native_1.19.bb b/meta/recipes-devtools/go/go-native_1.19.2.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.19.bb
rename to meta/recipes-devtools/go/go-native_1.19.2.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.19.bb b/meta/recipes-devtools/go/go-runtime_1.19.2.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.19.bb
rename to meta/recipes-devtools/go/go-runtime_1.19.2.bb
diff --git a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
index 8cbed93017..17fa9d9831 100644
--- a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
+++ b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
@@ -1,4 +1,4 @@
-From a3db4da51df37d163ff9e8c1e1057280c648c545 Mon Sep 17 00:00:00 2001
+From fb22e586871cc6be0b7041e86d2daceee06ea568 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 28 Mar 2022 10:59:03 -0700
 Subject: [PATCH] cmd/go: make content-based hash generation less pedantic
@@ -32,13 +32,13 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 34 insertions(+), 10 deletions(-)
 
 diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/envcmd/env.go
-index 529351d..df791b0 100644
+index 81ee859..2db3898 100644
 --- a/src/cmd/go/internal/envcmd/env.go
 +++ b/src/cmd/go/internal/envcmd/env.go
 @@ -176,7 +176,7 @@ func ExtraEnvVars() []cfg.EnvVar {
  func ExtraEnvVarsCostly() []cfg.EnvVar {
- 	var b work.Builder
- 	b.Init()
+ 	b := work.NewBuilder("")
+ 
 -	cppflags, cflags, cxxflags, fflags, ldflags, err := b.CFlags(&load.Package{})
 +	cppflags, cflags, cxxflags, fflags, ldflags, err := b.CFlags(&load.Package{}, false)
  	if err != nil {
diff --git a/meta/recipes-devtools/go/go/stack-protector.patch b/meta/recipes-devtools/go/go/stack-protector.patch
deleted file mode 100644
index cc92a444a7..0000000000
--- a/meta/recipes-devtools/go/go/stack-protector.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From c537b87782293fe222f2ef5eb1ae818092118e97 Mon Sep 17 00:00:00 2001
-From: Ian Lance Taylor <iant@golang.org>
-Date: Sun, 07 Aug 2022 19:21:15 -0700
-Subject: [PATCH] runtime/cgo: add -fno-stack-protector to CFLAGS
-
-Some compilers default to having -fstack-protector on, which breaks
-when using internal linking because the linker doesn't know how to
-find the support functions.
-
-Fixes #52919
-Fixes #54313
-
-Change-Id: I6f51d5e906503f61fc768ad8e30c163bad135087
-Upstream-Status: Submitted [https://github.com/golang/go/issues/54313]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
-
-diff --git a/src/runtime/cgo/cgo.go b/src/runtime/cgo/cgo.go
-index 298aa63..4b7046e 100644
---- a/src/runtime/cgo/cgo.go
-+++ b/src/runtime/cgo/cgo.go
-@@ -23,7 +23,9 @@
- #cgo solaris LDFLAGS: -lxnet
- #cgo solaris LDFLAGS: -lsocket
- 
--#cgo CFLAGS: -Wall -Werror
-+// We use -fno-stack-protector because internal linking won't find
-+// the support functions. See issues #52919 and #54313.
-+#cgo CFLAGS: -Wall -Werror -fno-stack-protector
- 
- #cgo solaris CPPFLAGS: -D_POSIX_PTHREAD_SEMANTICS
- 
diff --git a/meta/recipes-devtools/go/go_1.19.bb b/meta/recipes-devtools/go/go_1.19.2.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.19.bb
rename to meta/recipes-devtools/go/go_1.19.2.bb
-- 
2.30.2


