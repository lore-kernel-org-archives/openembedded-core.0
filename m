Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B358C0218F
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 10:47:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.9955.1738147631711653805
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 02:47:11 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=41248198a3=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50TAMDbt022546
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 02:47:11 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44enwthgp0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 02:47:11 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 29 Jan 2025 02:47:10 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 29 Jan 2025 02:47:08 -0800
From: Praveen Kumar <praveen.kumar@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Praveen Kumar <praveen.kumar@windriver.com>
Subject: [oe-core][scarthgap][PATCH  1/1] go: upgrade 1.22.8 -> 1.22.11
Date: Wed, 29 Jan 2025 10:47:02 +0000
Message-ID: <20250129104702.3715307-1-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Gou4+l1C c=1 sm=1 tr=0 ts=679a072f cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VdSt8ZQiCzkA:10 a=NEAV23lmAAAA:8 a=plf8rDjJAAAA:8 a=1XWaLZrsAAAA:8 a=pM9yUfARAAAA:8 a=t7CeM3EgAAAA:8
 a=eDyVRCKbE66UsdSdlwQA:9 a=rDGJdTlHWfUGzjU4:21 a=JWTSs7K9Rhv-lrTctFka:22 a=YH-7kEGJnRg4CV3apUU-:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 76y13aLNukfRJcC-5onP-GAuqVUkc_AH
X-Proofpoint-ORIG-GUID: 76y13aLNukfRJcC-5onP-GAuqVUkc_AH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 clxscore=1011 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501290087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 10:47:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210367

Upgrade to latest 1.22.x release [1]:

$ git --no-pager log --oneline go1.22.8..go1.22.11
f072884354 (HEAD, tag: go1.22.11) [release-branch.go1.22] go1.22.11
b72d56f98d [release-branch.go1.22] net/http: persist header stripping across repeated redirects
19d2103415 [release-branch.go1.22] crypto/x509: properly check for IPv6 hosts in URIs
ae9996f965 [release-branch.go1.22] runtime: hold traceAcquire across casgstatus in injectglist
223260bc63 [release-branch.go1.22] crypto/tls: fix Config.Time in tests using expired certificates
8f3f22eef8 (tag: go1.22.10) [release-branch.go1.22] go1.22.10
6d7a95abca [release-branch.go1.22] runtime: reserve 4kB for system stack on windows-386
6f05fa7a4f [release-branch.go1.22] syscall: mark SyscallN as noescape
3355db9690 [release-branch.go1.22] time: accept "+01" in TestLoadFixed on OpenBSD
8af39d30a4 (tag: go1.22.9) [release-branch.go1.22] go1.22.9
c19e5887f4 [release-branch.go1.22] cmd/cgo/internal/testcarchive: remove 1-minute timeout
e3fd4ba7f9 [release-branch.go1.22] cmd/link: generate Mach-O UUID when -B flag is specified
29252e4c5a [release-branch.go1.22] runtime: fix TestGdbAutotmpTypes on gdb version 15

[1] https://github.com/golang/go/compare/go1.22.8...go1.22.11

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
---
 meta/recipes-devtools/go/{go-1.22.8.inc => go-1.22.11.inc}  | 2 +-
 ...-binary-native_1.22.8.bb => go-binary-native_1.22.11.bb} | 6 +++---
 ...ross-canadian_1.22.8.bb => go-cross-canadian_1.22.11.bb} | 0
 .../go/{go-cross_1.22.8.bb => go-cross_1.22.11.bb}          | 0
 .../go/{go-crosssdk_1.22.8.bb => go-crosssdk_1.22.11.bb}    | 0
 .../go/{go-runtime_1.22.8.bb => go-runtime_1.22.11.bb}      | 0
 meta/recipes-devtools/go/{go_1.22.8.bb => go_1.22.11.bb}    | 0
 7 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.22.8.inc => go-1.22.11.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.22.8.bb => go-binary-native_1.22.11.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.22.8.bb => go-cross-canadian_1.22.11.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.22.8.bb => go-cross_1.22.11.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.22.8.bb => go-crosssdk_1.22.11.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.22.8.bb => go-runtime_1.22.11.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.22.8.bb => go_1.22.11.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.22.8.inc b/meta/recipes-devtools/go/go-1.22.11.inc
similarity index 89%
rename from meta/recipes-devtools/go/go-1.22.8.inc
rename to meta/recipes-devtools/go/go-1.22.11.inc
index 542519b930..21222bea4e 100644
--- a/meta/recipes-devtools/go/go-1.22.8.inc
+++ b/meta/recipes-devtools/go/go-1.22.11.inc
@@ -15,4 +15,4 @@ SRC_URI += "\
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
 "
-SRC_URI[main.sha256sum] = "df12c23ebf19dea0f4bf46a22cbeda4a3eca6f474f318390ce774974278440b8"
+SRC_URI[main.sha256sum] = "a60c23dec95d10a2576265ce580f57869d5ac2471c4f4aca805addc9ea0fc9fe"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.22.8.bb b/meta/recipes-devtools/go/go-binary-native_1.22.11.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.22.8.bb
rename to meta/recipes-devtools/go/go-binary-native_1.22.11.bb
index 98799eb503..a526cc88bc 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.22.8.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.22.11.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "5f467d29fc67c7ae6468cb6ad5b047a274bae8180cac5e0b7ddbfeba3e47e18f"
-SRC_URI[go_linux_arm64.sha256sum] = "5c616b32dab04bb8c4c8700478381daea0174dc70083e4026321163879278a4a"
-SRC_URI[go_linux_ppc64le.sha256sum] = "c546f27866510bf8e54e86fe6f58c705af0e894341e5572c91f197a734152c27"
+SRC_URI[go_linux_amd64.sha256sum] = "0fc88d966d33896384fbde56e9a8d80a305dc17a9f48f1832e061724b1719991"
+SRC_URI[go_linux_arm64.sha256sum] = "9ebfcab26801fa4cf0627c6439db7a4da4d3c6766142a3dd83508240e4f21031"
+SRC_URI[go_linux_ppc64le.sha256sum] = "963a0ec973640b23ee8bb7a462cc415276fd8436111a03df8c34eb3b1ae29f12"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.22.8.bb b/meta/recipes-devtools/go/go-cross-canadian_1.22.11.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.22.8.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.22.11.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.22.8.bb b/meta/recipes-devtools/go/go-cross_1.22.11.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.22.8.bb
rename to meta/recipes-devtools/go/go-cross_1.22.11.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.22.8.bb b/meta/recipes-devtools/go/go-crosssdk_1.22.11.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.22.8.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.22.11.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.22.8.bb b/meta/recipes-devtools/go/go-runtime_1.22.11.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.22.8.bb
rename to meta/recipes-devtools/go/go-runtime_1.22.11.bb
diff --git a/meta/recipes-devtools/go/go_1.22.8.bb b/meta/recipes-devtools/go/go_1.22.11.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.22.8.bb
rename to meta/recipes-devtools/go/go_1.22.11.bb
-- 
2.40.0


