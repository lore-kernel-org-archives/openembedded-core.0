Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 647C0C87FD3
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 05:50:06 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.15063.1754632201847868415
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Aug 2025 22:50:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=OyOPQY67;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20250808054957ae9bbb73a9754dee0a-gz7ufn@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20250808054957ae9bbb73a9754dee0a
        for <openembedded-core@lists.openembedded.org>;
        Fri, 08 Aug 2025 07:49:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=NySoLDM59kh2mPFSIr/OXxn6ppdQkw+XeQkYg0FTIGE=;
 b=OyOPQY67d2HdJ7g0Z0Y25QOOSncNU/Kj+LOlcKgtLkVhnxy7pzWILvOpOcpTfZXxpohQ7v
 ia7VJ316zbSYJiq9GGVtK/H0FNfnxtXAS9t9O4GG6sd8NtduKKxaPwgI2JknM6hhxltF6dt8
 YY+TezApN8j8x5uB9L80X8hMDWxv8iX4og94VUoJq4Os+J1jJpfIwzznSvaSvwijJ7IMu6p9
 VXgm25lOcT2S55TOvbmJk2tsd0I3tr3EAO2hia2XO5c1hM4N+ep3FUsnqzb84RihiZkl9JYG
 YuCIOOUv9GIRpjyGnNRDpn2U0Uf/KPEccP4AQp302ZFcOeppxt6YBQMA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] go: upgrade 1.24.5 -> 1.24.6
Date: Fri,  8 Aug 2025 07:49:21 +0200
Message-Id: <20250808054921.8670-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 05:50:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221590

From: Peter Marko <peter.marko@siemens.com>

Upgrade to latest 1.24.x release [1]:

$ git --no-pager log --oneline go1.24.5..go1.24.6
7f36edc26d [release-branch.go1.24] go1.24.6
83b4a5db24 [release-branch.go1.24] database/sql: avoid closing Rows while scan is in progress
0f5133b742 [release-branch.go1.24] os/exec: fix incorrect expansion of "", "." and ".." in LookPath
6e1c4529e4 [release-branch.go1.24] cmd/compile: for arm64 epilog, do SP increment with a single instruction
731de13dc3 [release-branch.go1.24] os/user: user random name for the test user account
390ffce7d6 [release-branch.go1.24] runtime: prevent unnecessary zeroing of large objects with pointers
b454859a8a [release-branch.go1.24] runtime: stash allpSnapshot on the M

Fixes CVE-2025-47906 and CVE-2025-47907 [2].

[1] https://github.com/golang/go/compare/go1.24.5...go1.24.6
[2] https://groups.google.com/g/golang-announce/c/x5MKroML2yM

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/go/{go-1.24.5.inc => go-1.24.6.inc}   | 2 +-
 ...o-binary-native_1.24.5.bb => go-binary-native_1.24.6.bb} | 6 +++---
 ...cross-canadian_1.24.5.bb => go-cross-canadian_1.24.6.bb} | 0
 .../go/{go-cross_1.24.5.bb => go-cross_1.24.6.bb}           | 0
 .../go/{go-crosssdk_1.24.5.bb => go-crosssdk_1.24.6.bb}     | 0
 .../go/{go-runtime_1.24.5.bb => go-runtime_1.24.6.bb}       | 0
 meta/recipes-devtools/go/{go_1.24.5.bb => go_1.24.6.bb}     | 0
 7 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.24.5.inc => go-1.24.6.inc} (91%)
 rename meta/recipes-devtools/go/{go-binary-native_1.24.5.bb => go-binary-native_1.24.6.bb} (79%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.24.5.bb => go-cross-canadian_1.24.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.24.5.bb => go-cross_1.24.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.24.5.bb => go-crosssdk_1.24.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.24.5.bb => go-runtime_1.24.6.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.24.5.bb => go_1.24.6.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.24.5.inc b/meta/recipes-devtools/go/go-1.24.6.inc
similarity index 91%
rename from meta/recipes-devtools/go/go-1.24.5.inc
rename to meta/recipes-devtools/go/go-1.24.6.inc
index fae0d3f333..a3933c2a61 100644
--- a/meta/recipes-devtools/go/go-1.24.5.inc
+++ b/meta/recipes-devtools/go/go-1.24.6.inc
@@ -17,4 +17,4 @@ SRC_URI += "\
     file://0010-cmd-go-clear-GOROOT-for-func-ldShared-when-trimpath-.patch \
     file://6d265b008e3d106b2706645e5a88cd8e2fb98953.patch \
 "
-SRC_URI[main.sha256sum] = "74fdb09f2352e2b25b7943e56836c9b47363d28dec1c8b56c4a9570f30b8f59f"
+SRC_URI[main.sha256sum] = "e1cb5582aab588668bc04c07de18688070f6b8c9b2aaf361f821e19bd47cfdbd"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.24.5.bb b/meta/recipes-devtools/go/go-binary-native_1.24.6.bb
similarity index 79%
rename from meta/recipes-devtools/go/go-binary-native_1.24.5.bb
rename to meta/recipes-devtools/go/go-binary-native_1.24.6.bb
index f052c44566..d5c92bdea5 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.24.5.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.24.6.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "10ad9e86233e74c0f6590fe5426895de6bf388964210eac34a6d83f38918ecdc"
-SRC_URI[go_linux_arm64.sha256sum] = "0df02e6aeb3d3c06c95ff201d575907c736d6c62cfa4b6934c11203f1d600ffa"
-SRC_URI[go_linux_ppc64le.sha256sum] = "00bdfb16d1094e78473b681d2d09d42c19c886d4dfed743853769f1665c7a552"
+SRC_URI[go_linux_amd64.sha256sum] = "bbca37cc395c974ffa4893ee35819ad23ebb27426df87af92e93a9ec66ef8712"
+SRC_URI[go_linux_arm64.sha256sum] = "124ea6033a8bf98aa9fbab53e58d134905262d45a022af3a90b73320f3c3afd5"
+SRC_URI[go_linux_ppc64le.sha256sum] = "63fc9559a3d6dfd63aa902f714375b879bbc848466181c035c122489b9646e27"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.24.5.bb b/meta/recipes-devtools/go/go-cross-canadian_1.24.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.24.5.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.24.6.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.24.5.bb b/meta/recipes-devtools/go/go-cross_1.24.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.24.5.bb
rename to meta/recipes-devtools/go/go-cross_1.24.6.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.24.5.bb b/meta/recipes-devtools/go/go-crosssdk_1.24.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.24.5.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.24.6.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.24.5.bb b/meta/recipes-devtools/go/go-runtime_1.24.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.24.5.bb
rename to meta/recipes-devtools/go/go-runtime_1.24.6.bb
diff --git a/meta/recipes-devtools/go/go_1.24.5.bb b/meta/recipes-devtools/go/go_1.24.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.24.5.bb
rename to meta/recipes-devtools/go/go_1.24.6.bb

