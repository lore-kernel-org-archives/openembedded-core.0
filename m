Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4ADBC02182
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 18:45:32 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.18782.1737657932132536492
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jan 2025 10:45:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=S0LacnKE;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202501231845282c16fdd30a980f9e8f-un5wlc@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202501231845282c16fdd30a980f9e8f
        for <openembedded-core@lists.openembedded.org>;
        Thu, 23 Jan 2025 19:45:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=FQvfW4tUgeHMFXJAPCgOxZvhvjbxEbVM5iUUIH5QVrU=;
 b=S0LacnKE+8b+5ccKaKBaU3yAWEC2bSYOpCUQUqROuaxR0OYTSwkf8CJ1HywWfqTcDGRbva
 DG5Ou56V6ba6/SJJmRJk1aNEnWPCBeOdJO6sb7Wv7fZ0DcG6CMmeZ7ODK69YgpbNt997LTTR
 dC2Obg9ax2rcB8ctO8cpgdc017x+N+JaHWU9ooAuaERkuo20QBaKPu9XbMIHFpiRiyRxdiUJ
 UxHp3rprt9wAhO+jkO8kNyjqO5/VsF+uglz8OjcLHdbsgfoKzNOPwmdeR/PRzBzi95GtWw+k
 SOV+aIM6H2cukteAx/cdIku23rP4v/ZCMZ+jznlKC6Or359i5o56yCxQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 1/3] go: upgrade 1.22.8 -> 1.22.9
Date: Thu, 23 Jan 2025 19:44:38 +0100
Message-Id: <20250123184440.2431629-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 18:45:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210205

From: Peter Marko <peter.marko@siemens.com>

Upgrade to latest 1.22.x release [1]:

$ git --no-pager log --oneline go1.22.8..go1.22.9
8af39d30a4 (tag: go1.22.9) [release-branch.go1.22] go1.22.9
c19e5887f4 [release-branch.go1.22] cmd/cgo/internal/testcarchive: remove 1-minute timeout
e3fd4ba7f9 [release-branch.go1.22] cmd/link: generate Mach-O UUID when -B flag is specified
29252e4c5a [release-branch.go1.22] runtime: fix TestGdbAutotmpTypes on gdb version 15

[1] https://github.com/golang/go/compare/go1.22.8...go1.22.9

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/go/{go-1.22.8.inc => go-1.22.9.inc}   | 2 +-
 ...o-binary-native_1.22.8.bb => go-binary-native_1.22.9.bb} | 6 +++---
 ...cross-canadian_1.22.8.bb => go-cross-canadian_1.22.9.bb} | 0
 .../go/{go-cross_1.22.8.bb => go-cross_1.22.9.bb}           | 0
 .../go/{go-crosssdk_1.22.8.bb => go-crosssdk_1.22.9.bb}     | 0
 .../go/{go-runtime_1.22.8.bb => go-runtime_1.22.9.bb}       | 0
 meta/recipes-devtools/go/{go_1.22.8.bb => go_1.22.9.bb}     | 0
 7 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.22.8.inc => go-1.22.9.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.22.8.bb => go-binary-native_1.22.9.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.22.8.bb => go-cross-canadian_1.22.9.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.22.8.bb => go-cross_1.22.9.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.22.8.bb => go-crosssdk_1.22.9.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.22.8.bb => go-runtime_1.22.9.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.22.8.bb => go_1.22.9.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.22.8.inc b/meta/recipes-devtools/go/go-1.22.9.inc
similarity index 89%
rename from meta/recipes-devtools/go/go-1.22.8.inc
rename to meta/recipes-devtools/go/go-1.22.9.inc
index 542519b9308..8fe2a8e39c9 100644
--- a/meta/recipes-devtools/go/go-1.22.8.inc
+++ b/meta/recipes-devtools/go/go-1.22.9.inc
@@ -15,4 +15,4 @@ SRC_URI += "\
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
 "
-SRC_URI[main.sha256sum] = "df12c23ebf19dea0f4bf46a22cbeda4a3eca6f474f318390ce774974278440b8"
+SRC_URI[main.sha256sum] = "e81a362f51aee2125722b018e46714e6a055a1954283414c0f937e737013db22"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.22.8.bb b/meta/recipes-devtools/go/go-binary-native_1.22.9.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.22.8.bb
rename to meta/recipes-devtools/go/go-binary-native_1.22.9.bb
index 98799eb5031..040091be797 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.22.8.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.22.9.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "5f467d29fc67c7ae6468cb6ad5b047a274bae8180cac5e0b7ddbfeba3e47e18f"
-SRC_URI[go_linux_arm64.sha256sum] = "5c616b32dab04bb8c4c8700478381daea0174dc70083e4026321163879278a4a"
-SRC_URI[go_linux_ppc64le.sha256sum] = "c546f27866510bf8e54e86fe6f58c705af0e894341e5572c91f197a734152c27"
+SRC_URI[go_linux_amd64.sha256sum] = "84a8f05b7b969d8acfcaf194ce9298ad5d3ddbfc7034930c280006b5c85a574c"
+SRC_URI[go_linux_arm64.sha256sum] = "5beec5ef9f019e1779727ef0d9643fa8bf2495e7222014d2fc4fbfce5999bf01"
+SRC_URI[go_linux_ppc64le.sha256sum] = "dcee55b402eaf46e7ffb2018b9e30b27ae5e821367697d8f8ff1ed1cecfd7948"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.22.8.bb b/meta/recipes-devtools/go/go-cross-canadian_1.22.9.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.22.8.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.22.9.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.22.8.bb b/meta/recipes-devtools/go/go-cross_1.22.9.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.22.8.bb
rename to meta/recipes-devtools/go/go-cross_1.22.9.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.22.8.bb b/meta/recipes-devtools/go/go-crosssdk_1.22.9.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.22.8.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.22.9.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.22.8.bb b/meta/recipes-devtools/go/go-runtime_1.22.9.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.22.8.bb
rename to meta/recipes-devtools/go/go-runtime_1.22.9.bb
diff --git a/meta/recipes-devtools/go/go_1.22.8.bb b/meta/recipes-devtools/go/go_1.22.9.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.22.8.bb
rename to meta/recipes-devtools/go/go_1.22.9.bb
-- 
2.30.2


