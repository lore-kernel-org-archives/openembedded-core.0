Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4577CD98E4
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 21:18:23 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3708.1763068699296867625
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Nov 2025 13:18:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=eQKg+Xuk;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20251113211814a076e2f9e500020719-azsh5f@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20251113211814a076e2f9e500020719
        for <openembedded-core@lists.openembedded.org>;
        Thu, 13 Nov 2025 22:18:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=2QO2gqwv8NNVkUp60rxdbBeT/8LTiAMleGVfF6VV0PM=;
 b=eQKg+XukMFZmyJOnk2LNUKWRVCUy/fVAJxS5x96yHlY4ON8/pxd2l+VDf1qlSXuZv6KqoB
 XfPOlPurSFup2GfUZeqOK5aDKPMK1ZP8iFWP1HTH/aTVblffZqUHTJe4L4kwh6dw4wzoFnD2
 rTWIHGPCeT+1XF2QIDDpL72rZtirVrIHYp0O6smTs+BWqUDDbaZi9tHlWanVfj3QD4kjfb1s
 AqB6qgy0EE1Qa+l6z944cazNbnj8QM6vXB1do86pHP/bbZMPbE3zL2kk8lWATHlJDMWwBWS0
 6t187iTVozycg/qgbEZYNa4bMCU8rFpiuRm1uY7uscEXPtpi+2EEDYow==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] go: upgrade 1.25.3 -> 1.25.4
Date: Thu, 13 Nov 2025 22:18:09 +0100
Message-Id: <20251113211809.327632-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 21:18:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226268

From: Peter Marko <peter.marko@siemens.com>

Upgrade to latest 1.25.x release [1]:

$ git --no-pager log --oneline go1.25.3..go1.25.4
f2cd93aa05 (tag: go1.25.4) [release-branch.go1.25] go1.25.4
83885f3c22 [release-branch.go1.25] encoding/pem: properly calculate end indexes
5ba37a3677 [release-branch.go1.25] cmd/compile: don't optimize away a panicing interface comparison
8097b1915f [release-branch.go1.25] os: support deleting read-only files in RemoveAll on older Windows versions
4942c74d04 [release-branch.go1.25] Revert "crypto/internal/fips140/subtle: add assembly implementation of xorBytes for mips64x"
cd21a7b31b [release-branch.go1.25] Revert "crypto/internal/fips140/subtle: add assembly implementation of xorBytes for mipsx"
bf95b76739 [release-branch.go1.25] runtime: use one more address bit for tagged pointers
bbb7627123 [release-branch.go1.25] cmd/compile: prevent shapifying of pointer shape type
7e049e5c31 [release-branch.go1.25] encoding/pem: properly decode strange PEM data
f6db7350e1 [release-branch.go1.25] net/url: allow IP-literals with IPv4-mapped IPv6 addresses

Release information: [2]

[1] https://github.com/golang/go/compare/go1.25.3...go1.25.4
[2] https://groups.google.com/g/golang-announce/c/tVVHm9gnwl8

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/go/{go-1.25.3.inc => go-1.25.4.inc}   | 2 +-
 ...o-binary-native_1.25.3.bb => go-binary-native_1.25.4.bb} | 6 +++---
 ...cross-canadian_1.25.3.bb => go-cross-canadian_1.25.4.bb} | 0
 .../go/{go-cross_1.25.3.bb => go-cross_1.25.4.bb}           | 0
 .../go/{go-crosssdk_1.25.3.bb => go-crosssdk_1.25.4.bb}     | 0
 .../go/{go-runtime_1.25.3.bb => go-runtime_1.25.4.bb}       | 0
 meta/recipes-devtools/go/{go_1.25.3.bb => go_1.25.4.bb}     | 0
 7 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.25.3.inc => go-1.25.4.inc} (91%)
 rename meta/recipes-devtools/go/{go-binary-native_1.25.3.bb => go-binary-native_1.25.4.bb} (79%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.25.3.bb => go-cross-canadian_1.25.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.25.3.bb => go-cross_1.25.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.25.3.bb => go-crosssdk_1.25.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.25.3.bb => go-runtime_1.25.4.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.25.3.bb => go_1.25.4.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.25.3.inc b/meta/recipes-devtools/go/go-1.25.4.inc
similarity index 91%
rename from meta/recipes-devtools/go/go-1.25.3.inc
rename to meta/recipes-devtools/go/go-1.25.4.inc
index c29f4d6ece..f88d7feef1 100644
--- a/meta/recipes-devtools/go/go-1.25.3.inc
+++ b/meta/recipes-devtools/go/go-1.25.4.inc
@@ -18,4 +18,4 @@ SRC_URI += "\
     file://0011-cmd-link-stop-forcing-binutils-gold-dependency-on-aa.patch \
     file://0001-runtime-when-using-cgo-on-386-call-C-sigaction-funct.patch \
 "
-SRC_URI[main.sha256sum] = "a81a4ba593d0015e10c51e267de3ff07c7ac914dfca037d9517d029517097795"
+SRC_URI[main.sha256sum] = "160043b7f17b6d60b50369436917fda8d5034640ba39ae2431c6b95a889cc98c"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.25.3.bb b/meta/recipes-devtools/go/go-binary-native_1.25.4.bb
similarity index 79%
rename from meta/recipes-devtools/go/go-binary-native_1.25.3.bb
rename to meta/recipes-devtools/go/go-binary-native_1.25.4.bb
index b1d9522cb6..921005c21b 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.25.3.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.25.4.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "0335f314b6e7bfe08c3d0cfaa7c19db961b7b99fb20be62b0a826c992ad14e0f"
-SRC_URI[go_linux_arm64.sha256sum] = "1d42ebc84999b5e2069f5e31b67d6fc5d67308adad3e178d5a2ee2c9ff2001f5"
-SRC_URI[go_linux_ppc64le.sha256sum] = "68d1a08bf3567f330717d821b266a0be1c5080bd05dc238b5a43a24ca0c47d7c"
+SRC_URI[go_linux_amd64.sha256sum] = "9fa5ffeda4170de60f67f3aa0f824e426421ba724c21e133c1e35d6159ca1bec"
+SRC_URI[go_linux_arm64.sha256sum] = "a68e86d4b72c2c2fecf7dfed667680b6c2a071221bbdb6913cf83ce3f80d9ff0"
+SRC_URI[go_linux_ppc64le.sha256sum] = "38c8ac8463537c99fbc1ef368f243b626144446c09db71b1d20634a4237c966d"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.25.3.bb b/meta/recipes-devtools/go/go-cross-canadian_1.25.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.25.3.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.25.4.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.25.3.bb b/meta/recipes-devtools/go/go-cross_1.25.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.25.3.bb
rename to meta/recipes-devtools/go/go-cross_1.25.4.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.25.3.bb b/meta/recipes-devtools/go/go-crosssdk_1.25.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.25.3.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.25.4.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.25.3.bb b/meta/recipes-devtools/go/go-runtime_1.25.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.25.3.bb
rename to meta/recipes-devtools/go/go-runtime_1.25.4.bb
diff --git a/meta/recipes-devtools/go/go_1.25.3.bb b/meta/recipes-devtools/go/go_1.25.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.25.3.bb
rename to meta/recipes-devtools/go/go_1.25.4.bb

