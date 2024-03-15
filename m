Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1952DC54E67
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 11:24:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.19615.1710501880659943233
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 04:24:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ioKkk8MT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3804d916cc=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42F7xlo8025857
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 11:24:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=WuKQn
	mqtY/uiN4YIelYgR9mCZRPeF+77TrLQ7XrzMFU=; b=ioKkk8MTjY68E1DyjXEfb
	TjiUVrU/3bNWpN0OWMbLiq0zZbFZZ7NIPHfuUnPLdD63yc57C0YWi+XmE3RE4zuw
	skzczkujs720Iw4gzxcSbGEefEW8swfH7qDvnX24pyOzQsZ2Dk0kQiv52SooZVqB
	qlE16CAVMPAHk1p0lbwB2Y0wxmj8iyyF0Sh4yR+/VM2H/apChdCzBKD5WSAefEBc
	C+wZCHlDHBrX7OssX8GS3pt75kHe5sk/TWH1C70wWFr136tODTdL5knq9rbdfPMT
	h5/3MkavL5JkP2Df5VXiA07YiGC/4eB8NzQm7RzI783SOQSrkTKtbOHv1I7ZDgD4
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wv9x98g85-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 11:24:39 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Fri, 15 Mar 2024 04:24:37 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH 1/1] go: Upgrade 1.22.0 -> 1.22.1
Date: Fri, 15 Mar 2024 11:24:22 +0000
Message-ID: <20240315112422.1165901-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: yLsQSD2EJphWLx1mYgllNTa_Ekuek_m2
X-Proofpoint-ORIG-GUID: yLsQSD2EJphWLx1mYgllNTa_Ekuek_m2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-14_13,2024-03-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403140001
 definitions=main-2403150093
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 11:24:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197130

From: Soumya Sambu <soumya.sambu@windriver.com>

Upgrade to latest 1.22.x release [1]:

$git log --oneline go1.22.0..go1.22.1
db6097f8cb (tag: go1.22.1, origin/release-branch.go1.22) [release-branch.go1.22] go1.22.1
041a47712e [release-branch.go1.22] net/textproto, mime/multipart: avoid unbounded read in MIME header
3a855208e3 [release-branch.go1.22] net/http, net/http/cookiejar: avoid subdomain matches on IPv6 zones
337b8e9cbf [release-branch.go1.22] crypto/x509: make sure pub key is non-nil before interface conversion
16830ab48a [release-branch.go1.22] net/http: add missing call to decConnsPerHost
056b0edcb8 [release-branch.go1.22] html/template: escape additional tokens in MarshalJSON errors
f73eba76a0 [release-branch.go1.22] net: work around runtime scheduler starvation on js and wasip1
5330cd225b [release-branch.go1.22] net/mail: properly handle special characters in phrase and obs-phrase
d8c4239f08 [release-branch.go1.22] cmd/go/internal/modcmd: correctly filter out main modules in verify
c33adf44ff [release-branch.go1.22] cmd/trace/v2,internal/trace: use correct frame for identifying goroutines
3b71998078 [release-branch.go1.22] go/types, types2: ensure that Alias.actual is set in NewAlias
8fe2ad6494 [release-branch.go1.22] runtime/internal/atomic: correct GOARM=7 guard at a DMB instruction
686662f3a4 [release-branch.go1.22] cmd/compile: make jump table symbol static
6cbe522fe1 [release-branch.go1.22] cmd/compile: fail noder.LookupFunc gracefully if function generic
fb86598cd3 [release-branch.go1.22] cmd/compile: accept -lang=go1 as -lang=go1.0
6fbd01a711 [release-branch.go1.22] runtime: don't call traceReadCPU on the system stack
d6a271939f [release-branch.go1.22] cmd/cgo/internal/testsanitizers: disable location checking for clang
20107e05a6 [release-branch.go1.22] internal/testenv: support the LUCI mobile builders in tests
53d1b73dff [release-branch.go1.22] internal/testenv: allow "-noopt" anywhere in builder name in test
dd31ad7e9f [release-branch.go1.22] spec: fix typo in year (it's 2024 now)

[1] https://github.com/golang/go/compare/go1.22.0...go1.22.1

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 meta/recipes-devtools/go/{go-1.22.0.inc => go-1.22.1.inc}   | 2 +-
 ...o-binary-native_1.22.0.bb => go-binary-native_1.22.1.bb} | 6 +++---
 ...cross-canadian_1.22.0.bb => go-cross-canadian_1.22.1.bb} | 0
 .../go/{go-cross_1.22.0.bb => go-cross_1.22.1.bb}           | 0
 .../go/{go-crosssdk_1.22.0.bb => go-crosssdk_1.22.1.bb}     | 0
 .../go/{go-native_1.22.0.bb => go-native_1.22.1.bb}         | 0
 .../go/{go-runtime_1.22.0.bb => go-runtime_1.22.1.bb}       | 0
 meta/recipes-devtools/go/{go_1.22.0.bb => go_1.22.1.bb}     | 0
 8 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.22.0.inc => go-1.22.1.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.22.0.bb => go-binary-native_1.22.1.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.22.0.bb => go-cross-canadian_1.22.1.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.22.0.bb => go-cross_1.22.1.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.22.0.bb => go-crosssdk_1.22.1.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.22.0.bb => go-native_1.22.1.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.22.0.bb => go-runtime_1.22.1.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.22.0.bb => go_1.22.1.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.22.0.inc b/meta/recipes-devtools/go/go-1.22.1.inc
similarity index 89%
rename from meta/recipes-devtools/go/go-1.22.0.inc
rename to meta/recipes-devtools/go/go-1.22.1.inc
index 5b94051fc2..4330853450 100644
--- a/meta/recipes-devtools/go/go-1.22.0.inc
+++ b/meta/recipes-devtools/go/go-1.22.1.inc
@@ -15,4 +15,4 @@ SRC_URI += "\
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
     file://0001-exec.go-filter-out-build-specific-paths-from-linker-.patch \
 "
-SRC_URI[main.sha256sum] = "4d196c3d41a0d6c1dfc64d04e3cc1f608b0c436bd87b7060ce3e23234e1f4d5c"
+SRC_URI[main.sha256sum] = "79c9b91d7f109515a25fc3ecdaad125d67e6bdb54f6d4d98580f46799caea321"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.22.0.bb b/meta/recipes-devtools/go/go-binary-native_1.22.1.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.22.0.bb
rename to meta/recipes-devtools/go/go-binary-native_1.22.1.bb
index acd2018dc3..8d8248df8a 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.22.0.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.22.1.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "f6c8a87aa03b92c4b0bf3d558e28ea03006eb29db78917daec5cfb6ec1046265"
-SRC_URI[go_linux_arm64.sha256sum] = "6a63fef0e050146f275bf02a0896badfe77c11b6f05499bb647e7bd613a45a10"
-SRC_URI[go_linux_ppc64le.sha256sum] = "0e57f421df9449066f00155ce98a5be93744b3d81b00ee4c2c9b511be2a31d93"
+SRC_URI[go_linux_amd64.sha256sum] = "aab8e15785c997ae20f9c88422ee35d962c4562212bb0f879d052a35c8307c7f"
+SRC_URI[go_linux_arm64.sha256sum] = "e56685a245b6a0c592fc4a55f0b7803af5b3f827aaa29feab1f40e491acf35b8"
+SRC_URI[go_linux_ppc64le.sha256sum] = "ac775e19d93cc1668999b77cfe8c8964abfbc658718feccfe6e0eb87663cd668"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.22.0.bb b/meta/recipes-devtools/go/go-cross-canadian_1.22.1.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.22.0.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.22.1.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.22.0.bb b/meta/recipes-devtools/go/go-cross_1.22.1.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.22.0.bb
rename to meta/recipes-devtools/go/go-cross_1.22.1.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.22.0.bb b/meta/recipes-devtools/go/go-crosssdk_1.22.1.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.22.0.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.22.1.bb
diff --git a/meta/recipes-devtools/go/go-native_1.22.0.bb b/meta/recipes-devtools/go/go-native_1.22.1.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.22.0.bb
rename to meta/recipes-devtools/go/go-native_1.22.1.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.22.0.bb b/meta/recipes-devtools/go/go-runtime_1.22.1.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.22.0.bb
rename to meta/recipes-devtools/go/go-runtime_1.22.1.bb
diff --git a/meta/recipes-devtools/go/go_1.22.0.bb b/meta/recipes-devtools/go/go_1.22.1.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.22.0.bb
rename to meta/recipes-devtools/go/go_1.22.1.bb
-- 
2.40.0


