Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28B94C433FE
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 21:15:39 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.30927.1668892528831002082
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 13:15:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=U4TiD4V2;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id h14so7355139pjv.4
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 13:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1KBVX8n6bzzMoxmfwAbyxPwDgDeXY8wtlVqKs8w/vX0=;
        b=U4TiD4V2zTcbE9wFv49QmLFeXOJ0M3Ue5MkiJpzwQ/vZzaLUmC0b7+gW1po+0c6F41
         B6Q0/y9hQV20S14Gwpom18eOte5j6NBCi/UlhEghSnvMZe3NVv2qB1yofXy0bYzftMzK
         38mCExFxXVsOK0mSsh0Kdfq+whJDltJlmjZ+IYPBsEa/WZ6QgE0uN3z4Lozm8RZJ8dvB
         59qbjbyARbj+/G1uhpMDRWaD2P1K+oMVCUEjGZMud/fjYzQkCW837QNzR26BYKz/tmdT
         ELvDL0E8il3hDA6ISQgwhtwDiArDqOCeX0RRRfSMCEZxMyyJMXJ98Rs7HN3Gci+Wljzm
         Z4zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1KBVX8n6bzzMoxmfwAbyxPwDgDeXY8wtlVqKs8w/vX0=;
        b=nrGJQ6vRRLhfJ63KzpexW3E/8yh6OHy8K2OgVwwNMga36UYOQ+YaPwkC829IiO2F9p
         k/wkT5p6Ypyh8oJ0zFO3eHAvMdEa55/isLMW0udNExNYb9J2yXBC1f0+cqOmkdMgpVMr
         15b39OxZ76nwDP1JI319jig6ojJsk5RrS4xLMCfOfS/5F3jfAwf7XrNGl1JkRlm21rmD
         KCLddtoGpGMO2i7c/KJzTxYRYPp6BMk0iXQpZEbopClKbL/eUWWM5W3MBsR9MFwRkf3t
         TCLq/rtSd52+GuGeh/zFh0oukSjJd34xqeHcRHtfkuQTrdpwj6KOMQ+drBLOyC68VISS
         udgw==
X-Gm-Message-State: ANoB5pkIsscophuoW8BK3R6tcxlXkZvLQH0+YKoWYOu+cz47P0aI9GsD
	IEdbY3W/oJYhnIq4FwLPbBe6ElP3G/Sxl7BU7V8=
X-Google-Smtp-Source: AA0mqf5i4J9Mv877nECgNkQTPoQp4Sfwg98Uh7yCLyAiyUKzfka2dKaZAotGCkE2GxGF6K2BB7dNYg==
X-Received: by 2002:a17:903:2783:b0:186:a97d:6bc8 with SMTP id jw3-20020a170903278300b00186a97d6bc8mr5260929plb.101.1668892527775;
        Sat, 19 Nov 2022 13:15:27 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s16-20020a170902a51000b001869f2120a5sm6197735plq.34.2022.11.19.13.15.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 13:15:27 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 03/35] go: update 1.19 -> 1.19.2
Date: Sat, 19 Nov 2022 11:14:42 -1000
Message-Id: <a5cfa272ee1aa1a836ddf5face54fd6072e789c0.1668892398.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668892398.git.steve@sakoman.com>
References: <cover.1668892398.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 21:15:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173543

From: Alexander Kanavin <alex.kanavin@gmail.com>

go1.19.2 (released 2022-10-04) includes security fixes to the archive/tar,
net/http/httputil, and regexp packages, as well as bug fixes to the compiler,
the linker, the runtime, and the go/types package.

Drop stack-protector.patch as issue fixed upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1b79d63a0703deb341f7693bd7b7c080a553b876)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../go/{go-1.19.inc => go-1.19.2.inc}         |  3 +-
 ...ive_1.19.bb => go-binary-native_1.19.2.bb} |  5 +--
 ...an_1.19.bb => go-cross-canadian_1.19.2.bb} |  0
 .../{go-cross_1.19.bb => go-cross_1.19.2.bb}  |  0
 ...crosssdk_1.19.bb => go-crosssdk_1.19.2.bb} |  0
 ...{go-native_1.19.bb => go-native_1.19.2.bb} |  0
 ...o-runtime_1.19.bb => go-runtime_1.19.2.bb} |  0
 ...ent-based-hash-generation-less-pedan.patch |  8 ++---
 .../go/go/stack-protector.patch               | 32 -------------------
 .../go/{go_1.19.bb => go_1.19.2.bb}           |  0
 10 files changed, 8 insertions(+), 40 deletions(-)
 rename meta/recipes-devtools/go/{go-1.19.inc => go-1.19.2.inc} (85%)
 rename meta/recipes-devtools/go/{go-binary-native_1.19.bb => go-binary-native_1.19.2.bb} (81%)
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
similarity index 81%
rename from meta/recipes-devtools/go/go-binary-native_1.19.bb
rename to meta/recipes-devtools/go/go-binary-native_1.19.2.bb
index ca424a66b8..80c24095dd 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.19.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.19.2.bb
@@ -7,9 +7,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 
 PROVIDES = "go-native"
 
+# Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "464b6b66591f6cf055bc5df90a9750bf5fbc9d038722bb84a9d56a2bea974be6"
-SRC_URI[go_linux_arm64.sha256sum] = "efa97fac9574fc6ef6c9ff3e3758fb85f1439b046573bf434cccb5e012bd00c8"
+SRC_URI[go_linux_amd64.sha256sum] = "5e8c5a74fe6470dd7e055a461acda8bb4050ead8c2df70f227e3ff7d8eb7eeb6"
+SRC_URI[go_linux_arm64.sha256sum] = "b62a8d9654436c67c14a0c91e931d50440541f09eb991a987536cb982903126d"
 
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
2.25.1


