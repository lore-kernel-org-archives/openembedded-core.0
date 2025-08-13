Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C1CBC87FCF
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 12:02:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.99006.1755086524405788988
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Aug 2025 05:02:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=03204bc308=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57DAtnCc3347042
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 12:02:03 GMT
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48fv001t8t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 12:02:03 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Wed, 13 Aug 2025 05:02:00 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Wed, 13 Aug 2025 05:01:58 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][walnascar][PATCH 1/1] go: upgrade 1.24.5 -> 1.24.6
Date: Wed, 13 Aug 2025 17:31:52 +0530
Message-ID: <20250813120152.767800-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=JKQ7s9Kb c=1 sm=1 tr=0 ts=689c7ebb cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=2OwXVqhp2XgA:10 a=NEAV23lmAAAA:8 a=1XWaLZrsAAAA:8 a=plf8rDjJAAAA:8
 a=pM9yUfARAAAA:8 a=a_U1oVfrAAAA:8 a=P-IC7800AAAA:8 a=t7CeM3EgAAAA:8
 a=Fo_BUA3C_gjuc6PtYlgA:9 a=rDGJdTlHWfUGzjU4:21 a=JWTSs7K9Rhv-lrTctFka:22
 a=YH-7kEGJnRg4CV3apUU-:22 a=d3PnA9EDa4IxuAV0gXij:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: TaK99DHgtlVA4uYGmV4kiamFtOklXMBK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEzMDExNCBTYWx0ZWRfXz5xAw3Q49dA4
 Fh+Jl5vahzAPLgVZRyVRJIeKYc5LAaQlBy+unmqF+5WX7RviLdbTna6pT4yflPZlmg2elLlqOBN
 R2EjFbch9B8BmELGQIsrTLreICfGsdgMAxTsnVtK4tJlweXeVqO2FQm1VBB/qazsqbH862+SKxH
 je3Th9QZ+4OLRCNTuu3faO0o2BbRHGjaQd03oPnS4WCTwuKayRaUYEQepF0v4i2112Pm5KIkHDQ
 r0WMbe06J4VFN9tiGM35FKYFFmBDqpfzUX1ThoATm5kYhnUEjKAWk1cvbLFj58nwZX17WkHU3js
 w4E2BOz+HGdl06bF9ySDRRfNER+/Wn+rwJdzb7tQiuOVgl28FqOI4u/N4JaZMc=
X-Proofpoint-GUID: TaK99DHgtlVA4uYGmV4kiamFtOklXMBK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 12:02:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221806

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
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit f3072c210ac0a1e4d8046d920c3ebc29f9916b72)
Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
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
index 3de63060c7..86a3ad8556 100644
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
-- 
2.40.0


