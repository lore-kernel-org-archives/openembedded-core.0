Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D87A8C0015E
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 05:03:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.26353.1690520582446864212
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 22:03:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=MHdgs3TO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=65738cf1bd=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36S4lSMn019621
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 22:03:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=HCzgZ
	PA2bsDCOr8GZq9Gr5ehwJpIIL7ECjJFvyrQSIQ=; b=MHdgs3TO+l2xwgFUpnTx8
	evdjEy4q+8TURV/ql0LINVWQzXqpp5MWVLASjGd5A1ymhqcVedvCvpSec5AouozG
	3W56ZoHHyOUvQ4l/Kcj+EXteuUrkeIZ/E07sMwDBmIjDrQ5da2u5PJ9vPLgvLVc8
	6Kc54biKE/SMJl8TwrSkFQdMG9UjkqR4IER4/RqKqtow/eZFKIKW4Sg6UEgk6MOQ
	vJVR2YMuMGOSsn3kjTqGCu7p2grZEeOaeSUNj0yJFS0pagj/06Vy3J6We8//yWmU
	gRJUXkk0RFjKaM8DK/m8+7/w5TqQB6TgGssUSCwF+4A9j91akW0zFCcILyrmTWmf
	A==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s0ad056ab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 22:03:01 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 22:03:02 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Thu, 27 Jul 2023 22:03:01 -0700
From: Sakib Sajal <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [mickledore][PATCH] go: update 1.20.5 -> 1.20.6
Date: Thu, 27 Jul 2023 22:02:57 -0700
Message-ID: <20230728050257.4137126-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: srBlF_aWliSqcruyRSQ8gU9Uc5jcfdLL
X-Proofpoint-GUID: srBlF_aWliSqcruyRSQ8gU9Uc5jcfdLL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 spamscore=0
 impostorscore=0 mlxscore=0 bulkscore=0 phishscore=0 adultscore=0
 clxscore=1015 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2306200000 definitions=main-2307280046
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jul 2023 05:03:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185012

From: Jose Quaresma <quaresma.jose@gmail.com>

Upgrade to latest 1.20.x release [1]:

$ git log --oneline go1.20.5..go1.20.6 origin/release-branch.go1.20
2c358ffe97 (tag: go1.20.6, origin/release-branch.go1.20) [release-branch.go1.20] go1.20.6
312920c00a [release-branch.go1.20] net/http: validate Host header before sending
4db13d762b [release-branch.go1.20] runtime: set raceignore to zero when starting a new goroutine
08a58dd8b6 [release-branch.go1.20] runtime: allow for 5 more threads in TestWindowsStackMemory*
65092835c5 [release-branch.go1.20] cmd/go: skip TestScript/gccgo_link_ldflags on aix/ppc64
bca817594c [release-branch.go1.20] crypto/x509: tolerate multiple matching chains in testVerify
b8e67d1ddd [release-branch.go1.20] cmd/go/internal/test: don't wait for previous test actions when interrupted
3db4f8146c [release-branch.go1.20] runtime: resolve checkdead panic by refining `startm` lock handling in caller context
6b45fb7b73 [release-branch.go1.20] runtime: fallback to TEB arbitrary pointer when TLS slots are full
be30960e58 [release-branch.go1.20] runtime: use 1-byte load for address checking in racecallatomic
b59efe6c34 [release-branch.go1.20] net/mail: permit more characters in mail headers
c32f1afb41 [release-branch.go1.20] all: make safe for new vet analyzer
c7b145655b [release-branch.go1.20] cmd/go: fix tests for new builder environment
03063101a2 [release-branch.go1.20] text/template: set variables correctly in range assignment
d51e322a3f [release-branch.go1.20] go/printer: error out of Fprint when it would write a '//line' directive with a multiline file path
49594244d3 [release-branch.go1.20] cmd/cover: error out if a requested source file contains a newline
4719048211 [release-branch.go1.20] cmd/cgo: error out if the source path used in line directives would contain a newline
6c606fc191 [release-branch.go1.20] cmd/go: fix TestScript/build_cwd_newline with CGO_ENABLED=0
63ad2b5811 [release-branch.go1.20] cmd/compile: do not report division by error during typecheck
95f377daad [release-branch.go1.20] cmd/go: retain extra roots to disambiguate imports in 'go mod tidy'
a7a48fad7e [release-branch.go1.20] crypto/ecdsa: properly truncate P-521 hashes
f5172dcd38 [release-branch.go1.20] go/build: check for invalid import paths again
8b3acefcbe [release-branch.go1.20] cmd/go: omit checksums for go.mod files needed for go version lines more often in pre-1.21 modules
1008486a9f [release-branch.go1.20] cmd/cgo: correct _cgo_flags output

[1] https://github.com/golang/go/compare/go1.20.5...go1.20.6

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8d8216d8c4d37cc0d9508eb644653f94fff8989c)
Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/go/{go-1.20.5.inc => go-1.20.6.inc}   | 2 +-
 ...o-binary-native_1.20.5.bb => go-binary-native_1.20.6.bb} | 6 +++---
 ...cross-canadian_1.20.5.bb => go-cross-canadian_1.20.6.bb} | 0
 .../go/{go-cross_1.20.5.bb => go-cross_1.20.6.bb}           | 0
 .../go/{go-crosssdk_1.20.5.bb => go-crosssdk_1.20.6.bb}     | 0
 .../go/{go-native_1.20.5.bb => go-native_1.20.6.bb}         | 0
 .../go/{go-runtime_1.20.5.bb => go-runtime_1.20.6.bb}       | 0
 meta/recipes-devtools/go/{go_1.20.5.bb => go_1.20.6.bb}     | 0
 8 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.20.5.inc => go-1.20.6.inc} (90%)
 rename meta/recipes-devtools/go/{go-binary-native_1.20.5.bb => go-binary-native_1.20.6.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.20.5.bb => go-cross-canadian_1.20.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.20.5.bb => go-cross_1.20.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.20.5.bb => go-crosssdk_1.20.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.20.5.bb => go-native_1.20.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.20.5.bb => go-runtime_1.20.6.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.20.5.bb => go_1.20.6.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.20.5.inc b/meta/recipes-devtools/go/go-1.20.6.inc
similarity index 90%
rename from meta/recipes-devtools/go/go-1.20.5.inc
rename to meta/recipes-devtools/go/go-1.20.6.inc
index 9cc79a8073..6277020fec 100644
--- a/meta/recipes-devtools/go/go-1.20.5.inc
+++ b/meta/recipes-devtools/go/go-1.20.6.inc
@@ -17,4 +17,4 @@ SRC_URI += "\
     file://CVE-2023-24531_1.patch \
     file://CVE-2023-24531_2.patch \
 "
-SRC_URI[main.sha256sum] = "9a15c133ba2cfafe79652f4815b62e7cfc267f68df1b9454c6ab2a3ca8b96a88"
+SRC_URI[main.sha256sum] = "62ee5bc6fb55b8bae8f705e0cb8df86d6453626b4ecf93279e2867092e0b7f70"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.20.5.bb b/meta/recipes-devtools/go/go-binary-native_1.20.6.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.20.5.bb
rename to meta/recipes-devtools/go/go-binary-native_1.20.6.bb
index a98be4af1b..5b2f8f4352 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.20.5.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.20.6.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "d7ec48cde0d3d2be2c69203bc3e0a44de8660b9c09a6e85c4732a3f7dc442612"
-SRC_URI[go_linux_arm64.sha256sum] = "aa2fab0a7da20213ff975fa7876a66d47b48351558d98851b87d1cfef4360d09"
-SRC_URI[go_linux_ppc64le.sha256sum] = "049b8ab07d34077b90c0642138e10207f6db14bdd1743ea994a21e228f8ca53d"
+SRC_URI[go_linux_amd64.sha256sum] = "b945ae2bb5db01a0fb4786afde64e6fbab50b67f6fa0eb6cfa4924f16a7ff1eb"
+SRC_URI[go_linux_arm64.sha256sum] = "4e15ab37556e979181a1a1cc60f6d796932223a0f5351d7c83768b356f84429b"
+SRC_URI[go_linux_ppc64le.sha256sum] = "a1b91a42a40bba54bfd5c96c23d72250e0c424038d0d2b5c7950b828b4905822"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.20.5.bb b/meta/recipes-devtools/go/go-cross-canadian_1.20.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.20.5.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.20.6.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.20.5.bb b/meta/recipes-devtools/go/go-cross_1.20.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.20.5.bb
rename to meta/recipes-devtools/go/go-cross_1.20.6.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.20.5.bb b/meta/recipes-devtools/go/go-crosssdk_1.20.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.20.5.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.20.6.bb
diff --git a/meta/recipes-devtools/go/go-native_1.20.5.bb b/meta/recipes-devtools/go/go-native_1.20.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.20.5.bb
rename to meta/recipes-devtools/go/go-native_1.20.6.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.20.5.bb b/meta/recipes-devtools/go/go-runtime_1.20.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.20.5.bb
rename to meta/recipes-devtools/go/go-runtime_1.20.6.bb
diff --git a/meta/recipes-devtools/go/go_1.20.5.bb b/meta/recipes-devtools/go/go_1.20.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.20.5.bb
rename to meta/recipes-devtools/go/go_1.20.6.bb
-- 
2.39.0


