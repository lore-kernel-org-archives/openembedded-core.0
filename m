Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EA42C88E72
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 19:07:42 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5687.1789412858078200350
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2026 12:07:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=MJMJHdYa;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-2026091419073398dbe183c9000207b0-hbsmvp@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2026091419073398dbe183c9000207b0
        for <openembedded-core@lists.openembedded.org>;
        Mon, 14 Sep 2026 21:07:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=mKZ6GPIKPHOcB4n9peFc5PCDnu9cbk17wNbFmPsyq50=;
 b=MJMJHdYaOZZMNK4zIuKwyAQUIm2Bn7H/tjOeFoF7HePvQ6EBwZ9dcZOtZIWlXmKP+rRphP
 Fj51kDO/mLaKso0kFALWE2Pgu/9xTQrPsXJFwDljbgTVXN5PcaYXKVmMZjXQzcLcibBcfBsf
 zDp+qu49f2hqyax2m6MkvbZ2vbAsolDr3nrB8pX7Iwetpqp1n6h/fxY7CFOcneY1TIolT1PS
 EzjpAYCXT2hvIQaUMhdzvciTxpW8qzFqQMCsc1Ix6znW/eNX00lvgdfVt1K6oTiooDg50Cj+
 0ZlIt81Dktf4MtM6KseBVkIn+scy5OsOQk9ZsxtT34BzOBTCZP4QuMng==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH] go: upgrade 1.26.7 -> 1.26.8
Date: Mon, 14 Sep 2026 21:07:26 +0200
Message-ID: <20260914190726.1065869-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 19:07:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245794

From: Peter Marko <peter.marko@siemens.com>

Upgrade to latest 1.26.x release [1]:

$ git --no-pager log --oneline go1.26.7..go1.26.8
c293dd49cb (tag: go1.26.8) [release-branch.go1.26] go1.26.8
3cc00d9c2b [release-branch.go1.26] cmd/compile: fix mergelocals for arm32/s390x/riscv64
e9fde2dea1 [release-branch.go1.26] debug/elf: use addend when applying ppc relocations
d19a1e81bc [release-branch.go1.26] cmd/go/internal: fix copy paste error
dbe8fd98d7 [release-branch.go1.26] os: don't symlink on Root.Mkdir("symlink/") on openbsd
d1434dbd34 [release-branch.go1.26] internal/cpu: disable AVX+ on netbsd/amd64

This is a bugfix release.

Release information: [2]

[1] https://github.com/golang/go/compare/go1.26.7...go1.26.8
[2] https://groups.google.com/g/golang-announce/c/QiTRm-HGGtI

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/go/{go-1.26.7.inc => go-1.26.8.inc}   | 2 +-
 ...o-binary-native_1.26.7.bb => go-binary-native_1.26.8.bb} | 6 +++---
 ...cross-canadian_1.26.7.bb => go-cross-canadian_1.26.8.bb} | 0
 .../go/{go-cross_1.26.7.bb => go-cross_1.26.8.bb}           | 0
 .../go/{go-crosssdk_1.26.7.bb => go-crosssdk_1.26.8.bb}     | 0
 .../go/{go-runtime_1.26.7.bb => go-runtime_1.26.8.bb}       | 0
 meta/recipes-devtools/go/{go_1.26.7.bb => go_1.26.8.bb}     | 0
 7 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.26.7.inc => go-1.26.8.inc} (90%)
 rename meta/recipes-devtools/go/{go-binary-native_1.26.7.bb => go-binary-native_1.26.8.bb} (80%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.26.7.bb => go-cross-canadian_1.26.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.26.7.bb => go-cross_1.26.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.26.7.bb => go-crosssdk_1.26.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.26.7.bb => go-runtime_1.26.8.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.26.7.bb => go_1.26.8.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.26.7.inc b/meta/recipes-devtools/go/go-1.26.8.inc
similarity index 90%
rename from meta/recipes-devtools/go/go-1.26.7.inc
rename to meta/recipes-devtools/go/go-1.26.8.inc
index fed87015b2..7fa02ad710 100644
--- a/meta/recipes-devtools/go/go-1.26.7.inc
+++ b/meta/recipes-devtools/go/go-1.26.8.inc
@@ -16,4 +16,4 @@ SRC_URI += "\
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
     file://0010-cmd-go-clear-GOROOT-for-func-ldShared-when-trimpath-.patch \
 "
-SRC_URI[main.sha256sum] = "0ed24eac755105085b89fe9cabc2742b91a0ad7b94b59d3ad364918ebc8956ad"
+SRC_URI[main.sha256sum] = "4e39b98e42f946fa05ac8bc5b71877df97dbdb7cbb1a777b541667ad7117fd2e"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.26.7.bb b/meta/recipes-devtools/go/go-binary-native_1.26.8.bb
similarity index 80%
rename from meta/recipes-devtools/go/go-binary-native_1.26.7.bb
rename to meta/recipes-devtools/go/go-binary-native_1.26.8.bb
index 753f1b13bb..67937cd051 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.26.7.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.26.8.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "ffb5f8de10c62550dfddab66b36b57030721e0a44a3218e9e1181d7b59f121ca"
-SRC_URI[go_linux_arm64.sha256sum] = "5a4ec883379d51ee9ce1040d5e87f8d35e20387574dd8c947feb01eabc3c1b37"
-SRC_URI[go_linux_ppc64le.sha256sum] = "22d3b362d557175fd16b79651cab0cad64f8aaaedca745f66d16f44d56bc5de1"
+SRC_URI[go_linux_amd64.sha256sum] = "d0f743b33e8d8945e6b1f432edd15785c70507121d6e2a723b21285eddf8b57b"
+SRC_URI[go_linux_arm64.sha256sum] = "211ffced9dcb9633a55eac6364816ec0ddd951389a740e88fa8b3337971bdda0"
+SRC_URI[go_linux_ppc64le.sha256sum] = "0ddf3ecab842013e6bd618602823a0b8158a18d3e9362f2540463ea5aa184975"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.26.7.bb b/meta/recipes-devtools/go/go-cross-canadian_1.26.8.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.26.7.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.26.8.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.26.7.bb b/meta/recipes-devtools/go/go-cross_1.26.8.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.26.7.bb
rename to meta/recipes-devtools/go/go-cross_1.26.8.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.26.7.bb b/meta/recipes-devtools/go/go-crosssdk_1.26.8.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.26.7.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.26.8.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.26.7.bb b/meta/recipes-devtools/go/go-runtime_1.26.8.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.26.7.bb
rename to meta/recipes-devtools/go/go-runtime_1.26.8.bb
diff --git a/meta/recipes-devtools/go/go_1.26.7.bb b/meta/recipes-devtools/go/go_1.26.8.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.26.7.bb
rename to meta/recipes-devtools/go/go_1.26.8.bb

