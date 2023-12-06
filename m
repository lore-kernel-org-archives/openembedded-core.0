Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05F1AC46CA3
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 15:57:29 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.35369.1701878244007001050
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 07:57:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Um9U6FBK;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3332efd75c9so850555f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 07:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701878242; x=1702483042; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ECoJg9FqGJFikKOrPKj/FwwWRH/FO7ts2MscYgjKFyo=;
        b=Um9U6FBKRb6fn7Hv8HJ2oDU6424AAZ+z9m1OYNdmI+VO7j1gdShznVdZxEGwZ5caBS
         33k/lhONmI6/1RQVbsoQ1YCT+beUzIv4LC+wcE0sXjmdu1n3t5fYjOOQ5OvpX7crtOdj
         Bh5KU+48cqD+qbw73p7Sq+U6X7p7w6FxSSTgJYZ3NCbg+9yxQOvhUW+NtltDtLe+QfTD
         XLUMcnmk8VrHaESwLjFXTwzmXk3L50/xn4H+bS3h6+KAYKBzz5bzD0g8yZ3WsZe54Mwe
         e8wCF3BISQaJ0Q4+0QNatfSDWmJpq5JPG/5HhJ1H49/kGItORJIs0tnnG8y3UrgksZ/E
         DtIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701878242; x=1702483042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ECoJg9FqGJFikKOrPKj/FwwWRH/FO7ts2MscYgjKFyo=;
        b=tWTlDykV7TxuuBFTHFDduftAwCjOnXfBCyrEZOhYbgG09bi8gBKq9zD6yYwy+zyFos
         dOfohwioHFpgTP0Uu3X8lGys7bYlQn06ii6YKre4oh0Y1tQRnDPRKo9jP2pe8/oqK2SC
         iiwCQQS/NKgWr+vwvBPGpT6Az4YbIziq2mtevJFCao1Dnx5l9o7jVR5tAJ/w1wlMM3kJ
         D0pIdjvSqR66tzwYmnSpRyUADzz5eeaEZncQovT01Z7YHHUObqzUIPcYiT50Fr26tegx
         XxmXPEuJ50OMXSFG83ZZ1WzWYg3qZ5sQbwzpZBGQCJIYs7RGBpGACp7y10tYdA8vKWdP
         CkbA==
X-Gm-Message-State: AOJu0Yy2gtoQb7ODblDM85QsMG7gxmA0tzMzqGVFdVor7+LvUCLjb3y2
	40Lwv842fn6n4+zXSbXRBSZLuFTvvUQ=
X-Google-Smtp-Source: AGHT+IEprw9XQe1O2SSijNNkOPKND0DVvknFYZFRwqKQNAn3Ga5KBaZQKUy7afyY3GGC18ggAsmVAQ==
X-Received: by 2002:a5d:4846:0:b0:333:3ffe:dbc5 with SMTP id n6-20020a5d4846000000b003333ffedbc5mr369158wrs.178.1701878241937;
        Wed, 06 Dec 2023 07:57:21 -0800 (PST)
Received: from toster.lan (bl23-105-200.dsl.telepac.pt. [144.64.105.200])
        by smtp.gmail.com with ESMTPSA id n14-20020a5d6b8e000000b00334b302e97fsm5202wrx.96.2023.12.06.07.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 07:57:21 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: ricardo@foundries.io,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [PATCH 2/2] go: update 1.20.11 -> 1.20.12
Date: Wed,  6 Dec 2023 15:56:53 +0000
Message-ID: <20231206155653.1035655-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231206155653.1035655-1-jose.quaresma@foundries.io>
References: <20231206155653.1035655-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 15:57:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191903

Upgrade to latest 1.20.x release [1]:

$ git log --oneline go1.20.11..go1.20.12
97c8ff8d53 (tag: go1.20.12, origin/release-branch.go1.20) [release-branch.go1.20] go1.20.12
6446af942e [release-branch.go1.20] net/http: limit chunked data overhead
77397ffcb2 [release-branch.go1.20] crypto/rand,runtime: revert "switch RtlGenRandom for ProcessPrng"
d77307f855 [release-branch.go1.20] cmd/compile: fix findIndVar so it does not match disjointed loop headers
1bd76576fe [release-branch.go1.20] crypto/rand,runtime: switch RtlGenRandom for ProcessPrng
1b59b017db [release-branch.go1.20] path/filepath: consider \\?\c: as a volume on Windows
46bc33819a [release-branch.go1.20] cmd/go/internal/vcs: error out if the requested repo does not support a secure protocol
e1dc209be8 [release-branch.go1.20] cmd/go/internal/modfetch/codehost: set core.longpaths in Git repos on Windows

[1] https://github.com/golang/go/compare/go1.20.11...go1.20.12

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/recipes-devtools/go/go-1.20.11.inc       | 18 ------
 .../go/go-binary-native_1.20.11.bb            | 50 ----------------
 .../go/go-cross-canadian_1.20.11.bb           |  2 -
 meta/recipes-devtools/go/go-cross_1.20.11.bb  |  2 -
 .../go/go-crosssdk_1.20.11.bb                 |  2 -
 meta/recipes-devtools/go/go-native_1.20.11.bb | 58 -------------------
 .../recipes-devtools/go/go-runtime_1.20.11.bb |  3 -
 meta/recipes-devtools/go/go_1.20.11.bb        | 18 ------
 8 files changed, 153 deletions(-)
 delete mode 100644 meta/recipes-devtools/go/go-1.20.11.inc
 delete mode 100644 meta/recipes-devtools/go/go-binary-native_1.20.11.bb
 delete mode 100644 meta/recipes-devtools/go/go-cross-canadian_1.20.11.bb
 delete mode 100644 meta/recipes-devtools/go/go-cross_1.20.11.bb
 delete mode 100644 meta/recipes-devtools/go/go-crosssdk_1.20.11.bb
 delete mode 100644 meta/recipes-devtools/go/go-native_1.20.11.bb
 delete mode 100644 meta/recipes-devtools/go/go-runtime_1.20.11.bb
 delete mode 100644 meta/recipes-devtools/go/go_1.20.11.bb

diff --git a/meta/recipes-devtools/go/go-1.20.11.inc b/meta/recipes-devtools/go/go-1.20.11.inc
deleted file mode 100644
index 2f510b1791..0000000000
--- a/meta/recipes-devtools/go/go-1.20.11.inc
+++ /dev/null
@@ -1,18 +0,0 @@
-require go-common.inc
-
-FILESEXTRAPATHS:prepend := "${FILE_DIRNAME}/go:"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
-
-SRC_URI += "\
-    file://0001-cmd-go-make-content-based-hash-generation-less-pedan.patch \
-    file://0002-cmd-go-Allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch \
-    file://0003-ld-add-soname-to-shareable-objects.patch \
-    file://0004-make.bash-override-CC-when-building-dist-and-go_boot.patch \
-    file://0005-cmd-dist-separate-host-and-target-builds.patch \
-    file://0006-cmd-go-make-GOROOT-precious-by-default.patch \
-    file://0007-exec.go-do-not-write-linker-flags-into-buildids.patch \
-    file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
-    file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
-"
-SRC_URI[main.sha256sum] = "d355c5ae3a8f7763c9ec9dc25153aae373958cbcb60dd09e91a8b56c7621b2fc"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.20.11.bb b/meta/recipes-devtools/go/go-binary-native_1.20.11.bb
deleted file mode 100644
index bf91067971..0000000000
--- a/meta/recipes-devtools/go/go-binary-native_1.20.11.bb
+++ /dev/null
@@ -1,50 +0,0 @@
-# This recipe is for bootstrapping our go-cross from a prebuilt binary of Go from golang.org.
-
-SUMMARY = "Go programming language compiler (upstream binary for bootstrap)"
-HOMEPAGE = " http://golang.org/"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
-
-PROVIDES = "go-native"
-
-# Checksums available at https://go.dev/dl/
-SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "ef79a11aa095a08772d2a69e4f152f897c4e96ee297b0dc20264b7dec2961abe"
-SRC_URI[go_linux_arm64.sha256sum] = "7908a49c6ce9d48af9b5ba76ccaa0769da45d8b635259a01065b3739acef4ada"
-SRC_URI[go_linux_ppc64le.sha256sum] = "e04676e1aeafe7c415176f330322d43a4be5ea6deb14aca49905bd1449dc7072"
-
-UPSTREAM_CHECK_URI = "https://golang.org/dl/"
-UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
-
-CVE_PRODUCT = "go"
-
-S = "${WORKDIR}/go"
-
-inherit goarch native
-
-do_compile() {
-    :
-}
-
-make_wrapper() {
-	rm -f ${D}${bindir}/$1
-	cat <<END >${D}${bindir}/$1
-#!/bin/bash
-here=\`dirname \$0\`
-export GOROOT="${GOROOT:-\`readlink -f \$here/../lib/go\`}"
-\$here/../lib/go/bin/$1 "\$@"
-END
-	chmod +x ${D}${bindir}/$1
-}
-
-do_install() {
-    find ${S} -depth -type d -name testdata -exec rm -rf {} +
-
-	install -d ${D}${bindir} ${D}${libdir}/go
-	cp --preserve=mode,timestamps -R ${S}/ ${D}${libdir}/
-
-	for f in ${S}/bin/*
-	do
-	  	make_wrapper `basename $f`
-	done
-}
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.20.11.bb b/meta/recipes-devtools/go/go-cross-canadian_1.20.11.bb
deleted file mode 100644
index 7ac9449e47..0000000000
--- a/meta/recipes-devtools/go/go-cross-canadian_1.20.11.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require go-cross-canadian.inc
-require go-${PV}.inc
diff --git a/meta/recipes-devtools/go/go-cross_1.20.11.bb b/meta/recipes-devtools/go/go-cross_1.20.11.bb
deleted file mode 100644
index 80b5a03f6c..0000000000
--- a/meta/recipes-devtools/go/go-cross_1.20.11.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require go-cross.inc
-require go-${PV}.inc
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.20.11.bb b/meta/recipes-devtools/go/go-crosssdk_1.20.11.bb
deleted file mode 100644
index 1857c8a577..0000000000
--- a/meta/recipes-devtools/go/go-crosssdk_1.20.11.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require go-crosssdk.inc
-require go-${PV}.inc
diff --git a/meta/recipes-devtools/go/go-native_1.20.11.bb b/meta/recipes-devtools/go/go-native_1.20.11.bb
deleted file mode 100644
index ddf25b2c9b..0000000000
--- a/meta/recipes-devtools/go/go-native_1.20.11.bb
+++ /dev/null
@@ -1,58 +0,0 @@
-# This recipe builds a native Go (written in Go) by first building an old Go 1.4
-# (written in C). However this old Go does not support all hosts platforms.
-
-require go-${PV}.inc
-
-inherit native
-
-SRC_URI += "https://dl.google.com/go/go1.4-bootstrap-20171003.tar.gz;name=bootstrap;subdir=go1.4"
-SRC_URI[bootstrap.sha256sum] = "f4ff5b5eb3a3cae1c993723f3eab519c5bae18866b5e5f96fe1102f0cb5c3e52"
-
-export GOOS = "${BUILD_GOOS}"
-export GOARCH = "${BUILD_GOARCH}"
-CC = "${@d.getVar('BUILD_CC').strip()}"
-
-GOMAKEARGS ?= "--no-banner"
-
-do_configure() {
-	cd ${WORKDIR}/go1.4/go/src
-	CGO_ENABLED=0 GOROOT=${WORKDIR}/go1.4/go ./make.bash
-}
-
-do_compile() {
-	export GOROOT_FINAL="${libdir_native}/go"
-	export GOROOT_BOOTSTRAP="${WORKDIR}/go1.4/go"
-
-	cd src
-	./make.bash ${GOMAKEARGS}
-	cd ${B}
-}
-do_compile[cleandirs] += "${GOTMPDIR} ${B}/bin"
-
-make_wrapper() {
-	rm -f ${D}${bindir}/$2$3
-	cat <<END >${D}${bindir}/$2$3
-#!/bin/bash
-here=\`dirname \$0\`
-export GOROOT="${GOROOT:-\`readlink -f \$here/../lib/go\`}"
-\$here/../lib/go/bin/$1 "\$@"
-END
-	chmod +x ${D}${bindir}/$2
-}
-
-do_install() {
-	install -d ${D}${libdir}/go
-	cp --preserve=mode,timestamps -R ${B}/pkg ${D}${libdir}/go/
-	install -d ${D}${libdir}/go/src
-	(cd ${S}/src; for d in *; do \
-		[ -d $d ] && cp -a ${S}/src/$d ${D}${libdir}/go/src/; \
-	done)
-	find ${D}${libdir}/go/src -depth -type d -name testdata -exec rm -rf {} \;
-	install -d ${D}${bindir} ${D}${libdir}/go/bin
-	for f in ${B}/bin/*
-	do
-		base=`basename $f`
-		install -m755 $f ${D}${libdir}/go/bin
-		make_wrapper $base $base
-	done
-}
diff --git a/meta/recipes-devtools/go/go-runtime_1.20.11.bb b/meta/recipes-devtools/go/go-runtime_1.20.11.bb
deleted file mode 100644
index 63464a1501..0000000000
--- a/meta/recipes-devtools/go/go-runtime_1.20.11.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require go-${PV}.inc
-require go-runtime.inc
-
diff --git a/meta/recipes-devtools/go/go_1.20.11.bb b/meta/recipes-devtools/go/go_1.20.11.bb
deleted file mode 100644
index 46f5fbc6be..0000000000
--- a/meta/recipes-devtools/go/go_1.20.11.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-require go-${PV}.inc
-require go-target.inc
-
-inherit linuxloader
-
-CGO_LDFLAGS:append = " -no-pie"
-
-export GO_LDSO = "${@get_linuxloader(d)}"
-export CC_FOR_TARGET = "gcc"
-export CXX_FOR_TARGET = "g++"
-
-# mips/rv64 doesn't support -buildmode=pie, so skip the QA checking for mips/riscv32 and its
-# variants.
-python() {
-    if 'mips' in d.getVar('TARGET_ARCH') or 'riscv32' in d.getVar('TARGET_ARCH'):
-        d.appendVar('INSANE_SKIP:%s' % d.getVar('PN'), " textrel")
-}
-
-- 
2.43.0


