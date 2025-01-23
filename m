Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC400C0218C
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 18:45:42 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.19334.1737657933389053017
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jan 2025 10:45:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=P3Xy0g0/;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-202501231845318b880336830c8f36cd-oafh_h@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202501231845318b880336830c8f36cd
        for <openembedded-core@lists.openembedded.org>;
        Thu, 23 Jan 2025 19:45:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=stGoi4VE7KPSesAQqKyxlTld/daPrBa8Twwf/JYzNUY=;
 b=P3Xy0g0/S0xMyDeQ3tWxyAZ7aCs4TmtuxPiNpCa1pyS9q3nBPEcAhr/m+wsiFNhbW78r/5
 9vmnSt1liWLCtCQM0v3pJqNbuj6PX6cQosdIu90QImFwFI4Bdt9QpL2BGgmIXWr8/bI/CWfF
 dM/mMhDDzNJn/G6BcjtZMmgi6tmPfjUJywBYRDw0k1WZpNrhlT5Ym7sSE+e10iflya00n5z7
 N2zI2LJQ3suMwSJ356Unhkh7HC3QLLJ5/IG4eEtJGuthqWFLtOwtNj7sJhMnF14wrtNDiGSf
 w59z4iw3b/LfqKCd7ERFiU0D1viQ4VszZLji5yW1ZAyKyxn3BTaGWNGQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 2/3] go: upgrade 1.22.9 -> 1.22.10
Date: Thu, 23 Jan 2025 19:44:39 +0100
Message-Id: <20250123184440.2431629-2-peter.marko@siemens.com>
In-Reply-To: <20250123184440.2431629-1-peter.marko@siemens.com>
References: <20250123184440.2431629-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 18:45:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210206

From: Peter Marko <peter.marko@siemens.com>

Upgrade to latest 1.22.x release [1]:

$ git --no-pager log --oneline go1.22.9..go1.22.10
8f3f22eef8 (tag: go1.22.10) [release-branch.go1.22] go1.22.10
6d7a95abca [release-branch.go1.22] runtime: reserve 4kB for system stack on windows-386
6f05fa7a4f [release-branch.go1.22] syscall: mark SyscallN as noescape
3355db9690 [release-branch.go1.22] time: accept "+01" in TestLoadFixed on OpenBSD

[1] https://github.com/golang/go/compare/go1.22.9...go1.22.10

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/go/{go-1.22.9.inc => go-1.22.10.inc}  | 2 +-
 ...-binary-native_1.22.9.bb => go-binary-native_1.22.10.bb} | 6 +++---
 ...ross-canadian_1.22.9.bb => go-cross-canadian_1.22.10.bb} | 0
 .../go/{go-cross_1.22.9.bb => go-cross_1.22.10.bb}          | 0
 .../go/{go-crosssdk_1.22.9.bb => go-crosssdk_1.22.10.bb}    | 0
 .../go/{go-runtime_1.22.9.bb => go-runtime_1.22.10.bb}      | 0
 meta/recipes-devtools/go/{go_1.22.9.bb => go_1.22.10.bb}    | 0
 7 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.22.9.inc => go-1.22.10.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.22.9.bb => go-binary-native_1.22.10.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.22.9.bb => go-cross-canadian_1.22.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.22.9.bb => go-cross_1.22.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.22.9.bb => go-crosssdk_1.22.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.22.9.bb => go-runtime_1.22.10.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.22.9.bb => go_1.22.10.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.22.9.inc b/meta/recipes-devtools/go/go-1.22.10.inc
similarity index 89%
rename from meta/recipes-devtools/go/go-1.22.9.inc
rename to meta/recipes-devtools/go/go-1.22.10.inc
index 8fe2a8e39c9..2abe7d0f3e3 100644
--- a/meta/recipes-devtools/go/go-1.22.9.inc
+++ b/meta/recipes-devtools/go/go-1.22.10.inc
@@ -15,4 +15,4 @@ SRC_URI += "\
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
 "
-SRC_URI[main.sha256sum] = "e81a362f51aee2125722b018e46714e6a055a1954283414c0f937e737013db22"
+SRC_URI[main.sha256sum] = "1e94fd48be750d1fafb4d9b3b6dd31a6e9d2735d339bf2462bc97b64ca4c1037"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.22.9.bb b/meta/recipes-devtools/go/go-binary-native_1.22.10.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.22.9.bb
rename to meta/recipes-devtools/go/go-binary-native_1.22.10.bb
index 040091be797..8c8fe5bff9f 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.22.9.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.22.10.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "84a8f05b7b969d8acfcaf194ce9298ad5d3ddbfc7034930c280006b5c85a574c"
-SRC_URI[go_linux_arm64.sha256sum] = "5beec5ef9f019e1779727ef0d9643fa8bf2495e7222014d2fc4fbfce5999bf01"
-SRC_URI[go_linux_ppc64le.sha256sum] = "dcee55b402eaf46e7ffb2018b9e30b27ae5e821367697d8f8ff1ed1cecfd7948"
+SRC_URI[go_linux_amd64.sha256sum] = "736ce492a19d756a92719a6121226087ccd91b652ed5caec40ad6dbfb2252092"
+SRC_URI[go_linux_arm64.sha256sum] = "5213c5e32fde3bd7da65516467b7ffbfe40d2bb5a5f58105e387eef450583eec"
+SRC_URI[go_linux_ppc64le.sha256sum] = "db05b9838f69d741fb9a5301220b1a62014aee025b0baf341aba3d280087b981"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.22.9.bb b/meta/recipes-devtools/go/go-cross-canadian_1.22.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.22.9.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.22.10.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.22.9.bb b/meta/recipes-devtools/go/go-cross_1.22.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.22.9.bb
rename to meta/recipes-devtools/go/go-cross_1.22.10.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.22.9.bb b/meta/recipes-devtools/go/go-crosssdk_1.22.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.22.9.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.22.10.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.22.9.bb b/meta/recipes-devtools/go/go-runtime_1.22.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.22.9.bb
rename to meta/recipes-devtools/go/go-runtime_1.22.10.bb
diff --git a/meta/recipes-devtools/go/go_1.22.9.bb b/meta/recipes-devtools/go/go_1.22.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.22.9.bb
rename to meta/recipes-devtools/go/go_1.22.10.bb
-- 
2.30.2


