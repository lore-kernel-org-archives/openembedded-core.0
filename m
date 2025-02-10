Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4556C02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 18:15:41 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.59451.1739211332220991535
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Feb 2025 10:15:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=XY1fg8MQ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-2025021018152946b4e633ab0254f65f-ipeoa7@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2025021018152946b4e633ab0254f65f
        for <openembedded-core@lists.openembedded.org>;
        Mon, 10 Feb 2025 19:15:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=KPUtRI8qqeoPoIFpoTmx+nCNMo8R7hWbyUhMILW+tZo=;
 b=XY1fg8MQHftjewYlswvlXci5C1B+4Vgc8BMUpoWtohsSycQRu3hP9My0ml1A2rMTbitdqt
 BQxQU1HTf3XHgwr42ecDAoMEnLNpw8UvYZ9UEZkMkr1X85i6SRi6IqzonSqiy1rHa8pDn7aM
 o/r1yQSO1nEytUEji+cJZRg8ffT1sYJZ0NDfbvlkL16CV49MZQCSv5UaqTfXcLIvnAHlBkcu
 Y2wvX2t7+hztbKXAXia3fkMGvnDk7pGnkrNRyZ+N0FMRniEElEuTp/RyEXTODT52yO0WRYdR
 skD9uNYeQgtrN532Lsb6YIN6B5g/cmym073ZpLDnAcsuzcFEpnyb0zAw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][scarthgap][styhead][PATCH] go: upgrade 1.22.11 -> 1.22.12
Date: Mon, 10 Feb 2025 19:14:36 +0100
Message-Id: <20250210181436.2435421-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 18:15:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211112

From: Peter Marko <peter.marko@siemens.com>

Upgrade to latest 1.22.x release [1]:

$ git --no-pager log --oneline go1.22.11..go1.22.12
5817e65094 (tag: go1.22.12) [release-branch.go1.22] go1.22.12
0cc45e7ca6 [release-branch.go1.22] crypto/internal/fips140/nistec: make p256NegCond constant time on ppc64le
c3c6a50095 [release-branch.go1.22] cmd/go/internal/modfetch: do not trust server to send all tags in shallow fetch
e0a01acd04 [release-branch.go1.22] cmd/compile: fix write barrier coalescing

Fixes CVE-2025-22866

[1] https://github.com/golang/go/compare/go1.22.11...go1.22.12

(From OE-Core rev: 423ad5a67768738dac454b1e2aa27746f74511c5)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/go/{go-1.22.11.inc => go-1.22.12.inc} | 2 +-
 ...binary-native_1.22.11.bb => go-binary-native_1.22.12.bb} | 6 +++---
 ...oss-canadian_1.22.11.bb => go-cross-canadian_1.22.12.bb} | 0
 .../go/{go-cross_1.22.11.bb => go-cross_1.22.12.bb}         | 0
 .../go/{go-crosssdk_1.22.11.bb => go-crosssdk_1.22.12.bb}   | 0
 .../go/{go-runtime_1.22.11.bb => go-runtime_1.22.12.bb}     | 0
 meta/recipes-devtools/go/{go_1.22.11.bb => go_1.22.12.bb}   | 0
 7 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.22.11.inc => go-1.22.12.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.22.11.bb => go-binary-native_1.22.12.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.22.11.bb => go-cross-canadian_1.22.12.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.22.11.bb => go-cross_1.22.12.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.22.11.bb => go-crosssdk_1.22.12.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.22.11.bb => go-runtime_1.22.12.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.22.11.bb => go_1.22.12.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.22.11.inc b/meta/recipes-devtools/go/go-1.22.12.inc
similarity index 89%
rename from meta/recipes-devtools/go/go-1.22.11.inc
rename to meta/recipes-devtools/go/go-1.22.12.inc
index 21222bea4e..05aa3a95b6 100644
--- a/meta/recipes-devtools/go/go-1.22.11.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -15,4 +15,4 @@ SRC_URI += "\
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
 "
-SRC_URI[main.sha256sum] = "a60c23dec95d10a2576265ce580f57869d5ac2471c4f4aca805addc9ea0fc9fe"
+SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.22.11.bb b/meta/recipes-devtools/go/go-binary-native_1.22.12.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.22.11.bb
rename to meta/recipes-devtools/go/go-binary-native_1.22.12.bb
index a526cc88bc..747737ff94 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.22.11.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.22.12.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "0fc88d966d33896384fbde56e9a8d80a305dc17a9f48f1832e061724b1719991"
-SRC_URI[go_linux_arm64.sha256sum] = "9ebfcab26801fa4cf0627c6439db7a4da4d3c6766142a3dd83508240e4f21031"
-SRC_URI[go_linux_ppc64le.sha256sum] = "963a0ec973640b23ee8bb7a462cc415276fd8436111a03df8c34eb3b1ae29f12"
+SRC_URI[go_linux_amd64.sha256sum] = "4fa4f869b0f7fc6bb1eb2660e74657fbf04cdd290b5aef905585c86051b34d43"
+SRC_URI[go_linux_arm64.sha256sum] = "fd017e647ec28525e86ae8203236e0653242722a7436929b1f775744e26278e7"
+SRC_URI[go_linux_ppc64le.sha256sum] = "9573d30003b0796717a99d9e2e96c48fddd4fc0f29d840f212c503b03d7de112"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.22.11.bb b/meta/recipes-devtools/go/go-cross-canadian_1.22.12.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.22.11.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.22.12.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.22.11.bb b/meta/recipes-devtools/go/go-cross_1.22.12.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.22.11.bb
rename to meta/recipes-devtools/go/go-cross_1.22.12.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.22.11.bb b/meta/recipes-devtools/go/go-crosssdk_1.22.12.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.22.11.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.22.12.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.22.11.bb b/meta/recipes-devtools/go/go-runtime_1.22.12.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.22.11.bb
rename to meta/recipes-devtools/go/go-runtime_1.22.12.bb
diff --git a/meta/recipes-devtools/go/go_1.22.11.bb b/meta/recipes-devtools/go/go_1.22.12.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.22.11.bb
rename to meta/recipes-devtools/go/go_1.22.12.bb

