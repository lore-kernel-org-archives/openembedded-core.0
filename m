Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD3B5C0218D
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 18:45:42 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.18787.1737657940335807174
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jan 2025 10:45:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=bG1JOp5a;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20250123184538220e66ed3016eb00cf-_63nww@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20250123184538220e66ed3016eb00cf
        for <openembedded-core@lists.openembedded.org>;
        Thu, 23 Jan 2025 19:45:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Hth3LHkqZzu4QIf7/22aVutAe6vQch2QKViVODjedRI=;
 b=bG1JOp5a4BZ8zVKND0Q3gNZWLqIh9mgi/sWKzNLmCy3MAZgIee+0OewmPY4QfWgYpOt2Yn
 Al8ocmtnrGsJ7T/q7b8kRoa7H4hrd9aFura37HsuNqe0IEFhpkW0pCnCNoUTz0/2GOVMS39n
 l1IIh/onMLF3pS6T/QqGdW52S3BSSBTuKimqupbSnyCD9bjAWRiKwK7QCw+pHKTj+KYsqVJQ
 Pq/9uaBhrt6r0JyNIoocUPh3JwT9l1I9o10yvx80Pa0Xdb34WKCBMB8sAqHvg26jmYmZDWr3
 9hVywlpTPprql5Yu1MSi6ILs/+Yq7Wy7o8tMW3K7cbI+x3HsKl5g3tHA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 3/3] go: upgrade 1.22.10 -> 1.22.11
Date: Thu, 23 Jan 2025 19:44:40 +0100
Message-Id: <20250123184440.2431629-3-peter.marko@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210207

From: Peter Marko <peter.marko@siemens.com>

Upgrade to latest 1.22.x release [1]:

$ git --no-pager log --oneline go1.22.10..go1.22.11
f072884354 (tag: go1.22.11) [release-branch.go1.22] go1.22.11
b72d56f98d [release-branch.go1.22] net/http: persist header stripping across repeated redirects
19d2103415 [release-branch.go1.22] crypto/x509: properly check for IPv6 hosts in URIs
ae9996f965 [release-branch.go1.22] runtime: hold traceAcquire across casgstatus in injectglist
223260bc63 [release-branch.go1.22] crypto/tls: fix Config.Time in tests using expired certificates

Fixes CVE-2024-45336 and CVE-2024-45341

[1] https://github.com/golang/go/compare/go1.22.10...go1.22.11

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/go/{go-1.22.10.inc => go-1.22.11.inc} | 2 +-
 ...binary-native_1.22.10.bb => go-binary-native_1.22.11.bb} | 6 +++---
 ...oss-canadian_1.22.10.bb => go-cross-canadian_1.22.11.bb} | 0
 .../go/{go-cross_1.22.10.bb => go-cross_1.22.11.bb}         | 0
 .../go/{go-crosssdk_1.22.10.bb => go-crosssdk_1.22.11.bb}   | 0
 .../go/{go-runtime_1.22.10.bb => go-runtime_1.22.11.bb}     | 0
 meta/recipes-devtools/go/{go_1.22.10.bb => go_1.22.11.bb}   | 0
 7 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.22.10.inc => go-1.22.11.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.22.10.bb => go-binary-native_1.22.11.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.22.10.bb => go-cross-canadian_1.22.11.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.22.10.bb => go-cross_1.22.11.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.22.10.bb => go-crosssdk_1.22.11.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.22.10.bb => go-runtime_1.22.11.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.22.10.bb => go_1.22.11.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.22.10.inc b/meta/recipes-devtools/go/go-1.22.11.inc
similarity index 89%
rename from meta/recipes-devtools/go/go-1.22.10.inc
rename to meta/recipes-devtools/go/go-1.22.11.inc
index 2abe7d0f3e3..21222bea4ec 100644
--- a/meta/recipes-devtools/go/go-1.22.10.inc
+++ b/meta/recipes-devtools/go/go-1.22.11.inc
@@ -15,4 +15,4 @@ SRC_URI += "\
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
 "
-SRC_URI[main.sha256sum] = "1e94fd48be750d1fafb4d9b3b6dd31a6e9d2735d339bf2462bc97b64ca4c1037"
+SRC_URI[main.sha256sum] = "a60c23dec95d10a2576265ce580f57869d5ac2471c4f4aca805addc9ea0fc9fe"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.22.10.bb b/meta/recipes-devtools/go/go-binary-native_1.22.11.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.22.10.bb
rename to meta/recipes-devtools/go/go-binary-native_1.22.11.bb
index 8c8fe5bff9f..a526cc88bc2 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.22.10.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.22.11.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "736ce492a19d756a92719a6121226087ccd91b652ed5caec40ad6dbfb2252092"
-SRC_URI[go_linux_arm64.sha256sum] = "5213c5e32fde3bd7da65516467b7ffbfe40d2bb5a5f58105e387eef450583eec"
-SRC_URI[go_linux_ppc64le.sha256sum] = "db05b9838f69d741fb9a5301220b1a62014aee025b0baf341aba3d280087b981"
+SRC_URI[go_linux_amd64.sha256sum] = "0fc88d966d33896384fbde56e9a8d80a305dc17a9f48f1832e061724b1719991"
+SRC_URI[go_linux_arm64.sha256sum] = "9ebfcab26801fa4cf0627c6439db7a4da4d3c6766142a3dd83508240e4f21031"
+SRC_URI[go_linux_ppc64le.sha256sum] = "963a0ec973640b23ee8bb7a462cc415276fd8436111a03df8c34eb3b1ae29f12"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.22.10.bb b/meta/recipes-devtools/go/go-cross-canadian_1.22.11.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.22.10.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.22.11.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.22.10.bb b/meta/recipes-devtools/go/go-cross_1.22.11.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.22.10.bb
rename to meta/recipes-devtools/go/go-cross_1.22.11.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.22.10.bb b/meta/recipes-devtools/go/go-crosssdk_1.22.11.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.22.10.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.22.11.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.22.10.bb b/meta/recipes-devtools/go/go-runtime_1.22.11.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.22.10.bb
rename to meta/recipes-devtools/go/go-runtime_1.22.11.bb
diff --git a/meta/recipes-devtools/go/go_1.22.10.bb b/meta/recipes-devtools/go/go_1.22.11.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.22.10.bb
rename to meta/recipes-devtools/go/go_1.22.11.bb
-- 
2.30.2


