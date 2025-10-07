Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58849CCA476
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 20:13:27 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.29062.1759868005095702912
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Oct 2025 13:13:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=b0rHjNfX;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-2025100720131980b424b0440002070b-ovshoh@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2025100720131980b424b0440002070b
        for <openembedded-core@lists.openembedded.org>;
        Tue, 07 Oct 2025 22:13:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=C1ExpKcXwgYFiNagn2sN155+uzIK8yYu/eeF1ACk0ME=;
 b=b0rHjNfX9IX1V/EZcXexvMTPY0ofoWW5w7nGGTQhhGKk1idKLD4cYkbBtbx2iWt+2BxxSV
 idRFDe9/B2NV7YHLOtHUD6kfCnX+bzuXqwGEtRjvLgi1Q0qoxkzGopnzFMv/Eih3fC77thSm
 kH5AONiykl3Xegp0bB521vM3YfCEkkugvE2nFPPzx0uSBMrOGInXNEqH5S99Hryh5lR23QON
 FyatOXBOn/H1KsLVPwI7iCJjvLe/ViU3hFDBDKaIrdTn/P5TAhE29WIZRwJVexQ6y5+f6Q8L
 emEdieqMB0T155K9SAs2j9seUNaq3jk3VrtEGsP1EmBGkX9npYKZ4JIw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 1/2] go: upgrade 1.25.0 -> 1.25.1
Date: Tue,  7 Oct 2025 22:13:14 +0200
Message-Id: <20251007201315.1565539-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 20:13:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224556

From: Peter Marko <peter.marko@siemens.com>

Upgrade to latest 1.25.x release [1]:

$ git --no-pager log --oneline go1.25.0..go1.25.1
56ebf80e57 (tag: go1.25.1) [release-branch.go1.25] go1.25.1
b1959cf6f7 [release-branch.go1.25] net/http: require exact match for CrossSiteProtection bypass patterns
cdd8cf4988 [release-branch.go1.25] net: fix WriteMsgUDPAddrPort addr handling on IPv4 sockets
8995e84ac6 [release-branch.go1.25] internal/poll: set the correct file offset in FD.Seek for Windows overlapped handles
749dff880a [release-branch.go1.25] runtime: make all synctest bubble violations fatal panics
21ac81c1e1 [release-branch.go1.25] os/exec: fix incorrect expansion of ".." in LookPath on plan9
c72fcab6d6 [release-branch.go1.25] cmd/go/internal/gover: fix ModIsPrerelease for toolchain versions

Fixes CVE-2025-47910 [2].

[1] https://github.com/golang/go/compare/go1.25.0...go1.25.1
[2] https://groups.google.com/g/golang-announce/c/PtW9VW21NPs

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/go/{go-1.25.0.inc => go-1.25.1.inc}   | 2 +-
 ...o-binary-native_1.25.0.bb => go-binary-native_1.25.1.bb} | 6 +++---
 ...cross-canadian_1.25.0.bb => go-cross-canadian_1.25.1.bb} | 0
 .../go/{go-cross_1.25.0.bb => go-cross_1.25.1.bb}           | 0
 .../go/{go-crosssdk_1.25.0.bb => go-crosssdk_1.25.1.bb}     | 0
 .../go/{go-runtime_1.25.0.bb => go-runtime_1.25.1.bb}       | 0
 meta/recipes-devtools/go/{go_1.25.0.bb => go_1.25.1.bb}     | 0
 7 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.25.0.inc => go-1.25.1.inc} (91%)
 rename meta/recipes-devtools/go/{go-binary-native_1.25.0.bb => go-binary-native_1.25.1.bb} (79%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.25.0.bb => go-cross-canadian_1.25.1.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.25.0.bb => go-cross_1.25.1.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.25.0.bb => go-crosssdk_1.25.1.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.25.0.bb => go-runtime_1.25.1.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.25.0.bb => go_1.25.1.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.25.0.inc b/meta/recipes-devtools/go/go-1.25.1.inc
similarity index 91%
rename from meta/recipes-devtools/go/go-1.25.0.inc
rename to meta/recipes-devtools/go/go-1.25.1.inc
index 1558b4623d1..ca36caed0fb 100644
--- a/meta/recipes-devtools/go/go-1.25.0.inc
+++ b/meta/recipes-devtools/go/go-1.25.1.inc
@@ -18,4 +18,4 @@ SRC_URI += "\
     file://0011-cmd-link-stop-forcing-binutils-gold-dependency-on-aa.patch \
     file://0001-runtime-when-using-cgo-on-386-call-C-sigaction-funct.patch \
 "
-SRC_URI[main.sha256sum] = "4bd01e91297207bfa450ea40d4d5a93b1b531a5e438473b2a06e18e077227225"
+SRC_URI[main.sha256sum] = "d010c109cee94d80efe681eab46bdea491ac906bf46583c32e9f0dbb0bd1a594"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.25.0.bb b/meta/recipes-devtools/go/go-binary-native_1.25.1.bb
similarity index 79%
rename from meta/recipes-devtools/go/go-binary-native_1.25.0.bb
rename to meta/recipes-devtools/go/go-binary-native_1.25.1.bb
index 2b9ad19d702..f82a23d62fd 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.25.0.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.25.1.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "2852af0cb20a13139b3448992e69b868e50ed0f8a1e5940ee1de9e19a123b613"
-SRC_URI[go_linux_arm64.sha256sum] = "05de75d6994a2783699815ee553bd5a9327d8b79991de36e38b66862782f54ae"
-SRC_URI[go_linux_ppc64le.sha256sum] = "0f18a89e7576cf2c5fa0b487a1635d9bcbf843df5f110e9982c64df52a983ad0"
+SRC_URI[go_linux_amd64.sha256sum] = "7716a0d940a0f6ae8e1f3b3f4f36299dc53e31b16840dbd171254312c41ca12e"
+SRC_URI[go_linux_arm64.sha256sum] = "65a3e34fb2126f55b34e1edfc709121660e1be2dee6bdf405fc399a63a95a87d"
+SRC_URI[go_linux_ppc64le.sha256sum] = "8b0c8d3ee5b1b5c28b6bd63dc4438792012e01d03b4bf7a61d985c87edab7d1f"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.25.0.bb b/meta/recipes-devtools/go/go-cross-canadian_1.25.1.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.25.0.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.25.1.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.25.0.bb b/meta/recipes-devtools/go/go-cross_1.25.1.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.25.0.bb
rename to meta/recipes-devtools/go/go-cross_1.25.1.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.25.0.bb b/meta/recipes-devtools/go/go-crosssdk_1.25.1.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.25.0.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.25.1.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.25.0.bb b/meta/recipes-devtools/go/go-runtime_1.25.1.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.25.0.bb
rename to meta/recipes-devtools/go/go-runtime_1.25.1.bb
diff --git a/meta/recipes-devtools/go/go_1.25.0.bb b/meta/recipes-devtools/go/go_1.25.1.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.25.0.bb
rename to meta/recipes-devtools/go/go_1.25.1.bb

