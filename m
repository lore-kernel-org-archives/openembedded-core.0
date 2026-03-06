Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05C3DFCB602
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 22:34:26 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.681.1772836458840537354
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Mar 2026 14:34:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=KUCrZjZX;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20260306223416a6b5132d0400020717-xppulk@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260306223416a6b5132d0400020717
        for <openembedded-core@lists.openembedded.org>;
        Fri, 06 Mar 2026 23:34:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=5qEnk7lp+mNga6404pIsg+BWxFEJ4xfOj/j6gk28Q4Q=;
 b=KUCrZjZXwbFmAhrp4havxFSZhwoXbNloxUwmhCp1Mrny0DzJaghmlPEb0NBAYXyn1lIME6
 hrXa/vtUonIKnKvdE++HvFTKPfzFQjM8mk9OanvXULeTbXt5amlqagrUKbY3OdSuy9UZGrxf
 ZGgDOaJS/PbeMfYnKaU6f8B3BZBKNXPGOdxSPOMisb7W0gD3X21xxdfkJ7ZlxfRWJExudbyl
 pXkhTkbjFoKcw0oagkJc+/nguIsay+D5CTNsZzLmoxvpu9xeR2X+jTBCkm9eTOynM8K5a3p2
 4qUuM2pd3nFp5/K9wFMzATqcyyiEbcSKdabGti9svck7JLhBGQRzYL6A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][whinlatter][PATCH] go: upgrade 1.25.7 -> 1.25.8
Date: Fri,  6 Mar 2026 23:34:11 +0100
Message-Id: <20260306223411.2004469-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 22:34:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232601

From: Peter Marko <peter.marko@siemens.com>

Upgrade to latest 1.25.x release [1]:

$ git --no-pager log --oneline go1.25.7..go1.25.8
439ff996f0 (tag: go1.25.8) [release-branch.go1.25] go1.25.8
a9db31e6d9 [release-branch.go1.25] html/template: properly escape URLs in meta content attributes
d8174a9500 [release-branch.go1.25] net/url: reject IPv6 literal not at start of host
4091800393 [release-branch.go1.25] os: avoid escape from Root via ReadDir or Readdir
0ee4ab4c3f [release-branch.go1.25] internal/syscall/windows: correct some enums and syscall signatures
9f8fa93be5 [release-branch.go1.25] os: support deleting inaccessible files in RemoveAll
df7331dc32 [release-branch.go1.25] all: update x/sys
92544bbc98 [release-branch.go1.25] runtime: don't negate eventfd errno
0c56fa2818 [release-branch.go1.25] net/smtp: prevent test failures due to expired test certificate
592530ed6b [release-branch.go1.25] cmd/go: fix pkg-config flag sanitization
0222717377 [release-branch.go1.25] cmd/compile: fix mis-compilation for static array initialization

Fixes CVE-2026-27137, CVE-2026-27138, CVE-2026-27142, CVE-2026-25679 and
      CVE-2026-27139.

Release information: [2]

[1] https://github.com/golang/go/compare/go1.25.7...go1.25.8
[2] https://groups.google.com/g/golang-announce/c/EdhZqrQ98hk

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/go/{go-1.25.7.inc => go-1.25.8.inc}   | 2 +-
 ...o-binary-native_1.25.7.bb => go-binary-native_1.25.8.bb} | 6 +++---
 ...cross-canadian_1.25.7.bb => go-cross-canadian_1.25.8.bb} | 0
 .../go/{go-cross_1.25.7.bb => go-cross_1.25.8.bb}           | 0
 .../go/{go-crosssdk_1.25.7.bb => go-crosssdk_1.25.8.bb}     | 0
 .../go/{go-runtime_1.25.7.bb => go-runtime_1.25.8.bb}       | 0
 meta/recipes-devtools/go/{go_1.25.7.bb => go_1.25.8.bb}     | 0
 7 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.25.7.inc => go-1.25.8.inc} (91%)
 rename meta/recipes-devtools/go/{go-binary-native_1.25.7.bb => go-binary-native_1.25.8.bb} (79%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.25.7.bb => go-cross-canadian_1.25.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.25.7.bb => go-cross_1.25.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.25.7.bb => go-crosssdk_1.25.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.25.7.bb => go-runtime_1.25.8.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.25.7.bb => go_1.25.8.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.25.7.inc b/meta/recipes-devtools/go/go-1.25.8.inc
similarity index 91%
rename from meta/recipes-devtools/go/go-1.25.7.inc
rename to meta/recipes-devtools/go/go-1.25.8.inc
index ab58f712ef..5db1b1c04c 100644
--- a/meta/recipes-devtools/go/go-1.25.7.inc
+++ b/meta/recipes-devtools/go/go-1.25.8.inc
@@ -18,4 +18,4 @@ SRC_URI += "\
     file://0011-cmd-link-stop-forcing-binutils-gold-dependency-on-aa.patch \
     file://0001-runtime-when-using-cgo-on-386-call-C-sigaction-funct.patch \
 "
-SRC_URI[main.sha256sum] = "178f2832820274b43e177d32f06a3ebb0129e427dd20a5e4c88df2c1763cf10a"
+SRC_URI[main.sha256sum] = "e988d4a2446ac7fe3f6daa089a58e9936a52a381355adec1c8983230a8d6c59e"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.25.7.bb b/meta/recipes-devtools/go/go-binary-native_1.25.8.bb
similarity index 79%
rename from meta/recipes-devtools/go/go-binary-native_1.25.7.bb
rename to meta/recipes-devtools/go/go-binary-native_1.25.8.bb
index 1995134481..df6cb542fb 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.25.7.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.25.8.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "12e6d6a191091ae27dc31f6efc630e3a3b8ba409baf3573d955b196fdf086005"
-SRC_URI[go_linux_arm64.sha256sum] = "ba611a53534135a81067240eff9508cd7e256c560edd5d8c2fef54f083c07129"
-SRC_URI[go_linux_ppc64le.sha256sum] = "42124c0edc92464e2b37b2d7fcd3658f0c47ebd6a098732415a522be8cb88e3f"
+SRC_URI[go_linux_amd64.sha256sum] = "ceb5e041bbc3893846bd1614d76cb4681c91dadee579426cf21a63f2d7e03be6"
+SRC_URI[go_linux_arm64.sha256sum] = "7d137f59f66bb93f40a6b2b11e713adc2a9d0c8d9ae581718e3fad19e5295dc7"
+SRC_URI[go_linux_ppc64le.sha256sum] = "28ed144a945e4d7188c93f8d85fb772a98ed18f8f9f8d3a650696b739f8cc57c"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.25.7.bb b/meta/recipes-devtools/go/go-cross-canadian_1.25.8.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.25.7.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.25.8.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.25.7.bb b/meta/recipes-devtools/go/go-cross_1.25.8.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.25.7.bb
rename to meta/recipes-devtools/go/go-cross_1.25.8.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.25.7.bb b/meta/recipes-devtools/go/go-crosssdk_1.25.8.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.25.7.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.25.8.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.25.7.bb b/meta/recipes-devtools/go/go-runtime_1.25.8.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.25.7.bb
rename to meta/recipes-devtools/go/go-runtime_1.25.8.bb
diff --git a/meta/recipes-devtools/go/go_1.25.7.bb b/meta/recipes-devtools/go/go_1.25.8.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.25.7.bb
rename to meta/recipes-devtools/go/go_1.25.8.bb

