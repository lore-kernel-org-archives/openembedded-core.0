Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0820D1171B
	for <webhook@archiver.kernel.org>; Sun, 27 Oct 2024 13:40:03 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.29780.1730036399576579626
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Oct 2024 06:40:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=DLJHjySH;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20241027133955ce953401727bb88440-2z2mzq@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20241027133955ce953401727bb88440
        for <openembedded-core@lists.openembedded.org>;
        Sun, 27 Oct 2024 14:39:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=TtJOKwmJEE05sLsGkuaeyG5/N3A8DMhxxVplEtTE6pY=;
 b=DLJHjySHEOvYp8/DXUpwoJETDtvSOPno7mmXskg7Noa/lLIWiicch+pK5CVpQfmuzvNxG4
 UFk3FFDwuR/933OHL+ZH0CrYGme4/dDmWiWtEsuNO5aaZfYn61lf/APMkCBWA3M1rfCtLDTS
 ou8r9G5Wq9KeLol0zrrkVEGJJKwL3u93DE+znp+39N0lV1AITJDsSGA0SzwOAl6HwhuezFSs
 GdgrMF8HxHhUtwAtlD8dsJIVwF/qrYMSLrzIg7hlnOw4XG0TyI6nO0ReWUPDriN7t384qJ6q
 s4CQcdLQKerx8et49g1Zo+uJoMZ0XLSdkDtxEgx137RBS/RFDQsRtviQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 1/2] go: upgrade 1.22.6 -> 1.22.7
Date: Sun, 27 Oct 2024 14:39:05 +0100
Message-Id: <20241027133906.367260-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Oct 2024 13:40:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206400

From: Peter Marko <peter.marko@siemens.com>

Upgrade to latest 1.22.x release [1]:

$ git --no-pager log --oneline go1.22.6..go1.22.7
7529d09a11 (tag: go1.22.7) [release-branch.go1.22] go1.22.7
d4c53812e6 [release-branch.go1.22] go/build/constraint: add parsing limits
2092294f2b [release-branch.go1.22] encoding/gob: cover missed cases when checking ignore depth
b232596139 [release-branch.go1.22] go/parser: track depth in nested element lists
e87be9833e [release-branch.go1.22] runtime: on AIX, fix call to _cgo_sys_thread_create in _rt0_ppc64_aix_lib
676d6100d8 [release-branch.go1.22] cmd/fix: support go versions with patch release
0a525a3ed0 [release-branch.go1.22] os: fix Chtimes test flakes

Fixes CVE-2024-34155, CVE-2024-34156 and CVE-2024-34158

[1] https://github.com/golang/go/compare/go1.22.6...go1.22.7

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/go/{go-1.22.6.inc => go-1.22.7.inc}   | 2 +-
 ...o-binary-native_1.22.6.bb => go-binary-native_1.22.7.bb} | 6 +++---
 ...cross-canadian_1.22.6.bb => go-cross-canadian_1.22.7.bb} | 0
 .../go/{go-cross_1.22.6.bb => go-cross_1.22.7.bb}           | 0
 .../go/{go-crosssdk_1.22.6.bb => go-crosssdk_1.22.7.bb}     | 0
 .../go/{go-runtime_1.22.6.bb => go-runtime_1.22.7.bb}       | 0
 meta/recipes-devtools/go/{go_1.22.6.bb => go_1.22.7.bb}     | 0
 7 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.22.6.inc => go-1.22.7.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.22.6.bb => go-binary-native_1.22.7.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.22.6.bb => go-cross-canadian_1.22.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.22.6.bb => go-cross_1.22.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.22.6.bb => go-crosssdk_1.22.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.22.6.bb => go-runtime_1.22.7.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.22.6.bb => go_1.22.7.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.22.6.inc b/meta/recipes-devtools/go/go-1.22.7.inc
similarity index 89%
rename from meta/recipes-devtools/go/go-1.22.6.inc
rename to meta/recipes-devtools/go/go-1.22.7.inc
index 834debaf9b..e54a902741 100644
--- a/meta/recipes-devtools/go/go-1.22.6.inc
+++ b/meta/recipes-devtools/go/go-1.22.7.inc
@@ -15,4 +15,4 @@ SRC_URI += "\
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
 "
-SRC_URI[main.sha256sum] = "9e48d99d519882579917d8189c17e98c373ce25abaebb98772e2927088992a51"
+SRC_URI[main.sha256sum] = "66432d87d85e0cfac3edffe637d5930fc4ddf5793313fe11e4a0f333023c879f"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.22.6.bb b/meta/recipes-devtools/go/go-binary-native_1.22.7.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.22.6.bb
rename to meta/recipes-devtools/go/go-binary-native_1.22.7.bb
index ea4577f20a..aba317fd38 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.22.6.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.22.7.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "999805bed7d9039ec3da1a53bfbcafc13e367da52aa823cb60b68ba22d44c616"
-SRC_URI[go_linux_arm64.sha256sum] = "c15fa895341b8eaf7f219fada25c36a610eb042985dc1a912410c1c90098eaf2"
-SRC_URI[go_linux_ppc64le.sha256sum] = "9d99fce3f6f72a76630fe91ec0884dfe3db828def4713368424900fa98bb2bd6"
+SRC_URI[go_linux_amd64.sha256sum] = "fc5d49b7a5035f1f1b265c17aa86e9819e6dc9af8260ad61430ee7fbe27881bb"
+SRC_URI[go_linux_arm64.sha256sum] = "ed695684438facbd7e0f286c30b7bc2411cfc605516d8127dc25c62fe5b03885"
+SRC_URI[go_linux_ppc64le.sha256sum] = "a6441d5da40a961039ec22b0aadbc8b513f52b31bb8919c359a7e2c3c5bcf26a"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.22.6.bb b/meta/recipes-devtools/go/go-cross-canadian_1.22.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.22.6.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.22.7.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.22.6.bb b/meta/recipes-devtools/go/go-cross_1.22.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.22.6.bb
rename to meta/recipes-devtools/go/go-cross_1.22.7.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.22.6.bb b/meta/recipes-devtools/go/go-crosssdk_1.22.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.22.6.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.22.7.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.22.6.bb b/meta/recipes-devtools/go/go-runtime_1.22.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.22.6.bb
rename to meta/recipes-devtools/go/go-runtime_1.22.7.bb
diff --git a/meta/recipes-devtools/go/go_1.22.6.bb b/meta/recipes-devtools/go/go_1.22.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.22.6.bb
rename to meta/recipes-devtools/go/go_1.22.7.bb
-- 
2.30.2


