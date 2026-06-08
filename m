Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E284CD8C9F
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 18:24:26 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61733.1780943059722585610
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2026 11:24:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=QaKTDBL2;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20260608182423cbf66a4dea000207cc-zt7vf1@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20260608182423cbf66a4dea000207cc
        for <openembedded-core@lists.openembedded.org>;
        Mon, 08 Jun 2026 20:24:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=UVCGzSTbmCCVe7xlhPlydktgcmM9wByRQFXPlq2yCsQ=;
 b=QaKTDBL2F+cwOnz3Psf0PJsy2GbVab0gWlQsiquMxljoVbO8EAAwO3U7YkjZ9bXb46YHwl
 TTpkvw4GLedO/SFeDpCSfY5HB6F4O8kZuIRxzGBaxznI20XSKWTXA7BBAevQ+LZ3kE2Aq6Qh
 9hSmgJApNAuz1Rhcu/Z0xfZsM0FfRuwyhKqw4FCAgXwrs+7n72GH8Enf9Sg6yhD2S1BI9KJI
 ZEMmawEv/FOAYU+AzB05e1N9LAXOyXY8g4GWqRN3OD6p9jeo29af4VTh2a/amgEGdxUQes8T
 G9bsq1u9AbJ+nMz0TevR5Cslantz6jpn+lPt3s3tjtebe9EM3okvYfhw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [wrynose][PATCH 2/2] go: upgrade 1.26.3 -> 1.26.4
Date: Mon,  8 Jun 2026 20:23:21 +0200
Message-ID: <20260608182325.5900-2-peter.marko@siemens.com>
In-Reply-To: <20260608182325.5900-1-peter.marko@siemens.com>
References: <20260608182325.5900-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2026 18:24:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238258

From: Peter Marko <peter.marko@siemens.com>

Upgrade to latest 1.26.x release [1]:

$ git --no-pager log --oneline go1.26.3..go1.26.4
a9ce111d58 (tag: go1.26.4) [release-branch.go1.26] go1.26.4
babc19e1ad [release-branch.go1.26] cmd/compile: do not misscompile x+x << 63 to x << 0 on amd64
7d24489b2b [release-branch.go1.26] runtime/race: build race detector linux/arm64 syso with no-outline-atomics
ce5a3e718c [release-branch.go1.26] crypto/x509: split candidate hostname only once
ec1c380418 [release-branch.go1.26] net/textproto: escape arbitrary input when including them in errors
7f24db453a [release-branch.go1.26] mime: avoid quadratic complexity in WordDecoder.DecodeHeader
ccffd99f3c [release-branch.go1.26] cmd/fix: pull in CL 783960
26c2ac5f94 [release-branch.go1.26] crypto/internal/fips140/drbg: fix Wasm stub

Fixes CVE-2026-42504, CVE-2026-42507 and CVE-2026-27145.

Release information: [2]

[1] https://github.com/golang/go/compare/go1.26.3...go1.26.4
[2] https://groups.google.com/g/golang-announce/c/tKs3rmcBcKw

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: b9b3b3098eece17d29d41b1923ae5a26511d9b4b)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/go/{go-1.26.3.inc => go-1.26.4.inc}   | 2 +-
 ...o-binary-native_1.26.3.bb => go-binary-native_1.26.4.bb} | 6 +++---
 ...cross-canadian_1.26.3.bb => go-cross-canadian_1.26.4.bb} | 0
 .../go/{go-cross_1.26.3.bb => go-cross_1.26.4.bb}           | 0
 .../go/{go-crosssdk_1.26.3.bb => go-crosssdk_1.26.4.bb}     | 0
 .../go/{go-runtime_1.26.3.bb => go-runtime_1.26.4.bb}       | 0
 meta/recipes-devtools/go/{go_1.26.3.bb => go_1.26.4.bb}     | 0
 7 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.26.3.inc => go-1.26.4.inc} (90%)
 rename meta/recipes-devtools/go/{go-binary-native_1.26.3.bb => go-binary-native_1.26.4.bb} (80%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.26.3.bb => go-cross-canadian_1.26.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.26.3.bb => go-cross_1.26.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.26.3.bb => go-crosssdk_1.26.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.26.3.bb => go-runtime_1.26.4.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.26.3.bb => go_1.26.4.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.26.3.inc b/meta/recipes-devtools/go/go-1.26.4.inc
similarity index 90%
rename from meta/recipes-devtools/go/go-1.26.3.inc
rename to meta/recipes-devtools/go/go-1.26.4.inc
index db7b18ed2d..8bc6f4d4de 100644
--- a/meta/recipes-devtools/go/go-1.26.3.inc
+++ b/meta/recipes-devtools/go/go-1.26.4.inc
@@ -16,4 +16,4 @@ SRC_URI += "\
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
     file://0010-cmd-go-clear-GOROOT-for-func-ldShared-when-trimpath-.patch \
 "
-SRC_URI[main.sha256sum] = "1c646875d0aa8799133184ed57cf79ff24bdefe8c8820470602a9d3d6d9192b8"
+SRC_URI[main.sha256sum] = "4f668a32fbfc1132e6a881fb968c2f1dada631492a339211735fbb255a42602d"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.26.3.bb b/meta/recipes-devtools/go/go-binary-native_1.26.4.bb
similarity index 80%
rename from meta/recipes-devtools/go/go-binary-native_1.26.3.bb
rename to meta/recipes-devtools/go/go-binary-native_1.26.4.bb
index 135c7fbf5e..3757b9f6a5 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.26.3.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.26.4.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "2b2cfc7148493da5e73981bffbf3353af381d5f93e789c82c79aff64962eb556"
-SRC_URI[go_linux_arm64.sha256sum] = "9d89a3ea57d141c2b22d70083f2c8459ba3890f2d9e818e7e933b75614936565"
-SRC_URI[go_linux_ppc64le.sha256sum] = "dbd82b50530ead2beb1fd72215117380df3cb16332b51467116dc35b3691dd75"
+SRC_URI[go_linux_amd64.sha256sum] = "1153d3d50e0ac764b447adfe05c2bcf08e889d42a02e0fe0259bd47f6733ad7f"
+SRC_URI[go_linux_arm64.sha256sum] = "ef758ae7c6cf9267c9c0ef080b8965f453d89ab2d25d9eb22de4405925238768"
+SRC_URI[go_linux_ppc64le.sha256sum] = "53f49b8c7eace2d30389327b4a516b13321f90377fdf5929a6b63174609bc22e"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.26.3.bb b/meta/recipes-devtools/go/go-cross-canadian_1.26.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.26.3.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.26.4.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.26.3.bb b/meta/recipes-devtools/go/go-cross_1.26.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.26.3.bb
rename to meta/recipes-devtools/go/go-cross_1.26.4.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.26.3.bb b/meta/recipes-devtools/go/go-crosssdk_1.26.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.26.3.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.26.4.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.26.3.bb b/meta/recipes-devtools/go/go-runtime_1.26.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.26.3.bb
rename to meta/recipes-devtools/go/go-runtime_1.26.4.bb
diff --git a/meta/recipes-devtools/go/go_1.26.3.bb b/meta/recipes-devtools/go/go_1.26.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.26.3.bb
rename to meta/recipes-devtools/go/go_1.26.4.bb

