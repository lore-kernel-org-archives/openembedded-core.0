Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0961C3ABC3
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 10:22:45 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.11120.1746786156813631887
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 03:22:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7224ebccee=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54950Kov029334
	for <openembedded-core@lists.openembedded.org>; Fri, 9 May 2025 03:22:36 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46djnjxyd6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 03:22:36 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 9 May 2025 03:22:35 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 9 May 2025 03:22:34 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][Walnascar][PATCH  3/5] go: upgrade 1.24.1 -> 1.24.2
Date: Fri, 9 May 2025 10:22:26 +0000
Message-ID: <20250509102228.3422688-3-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250509102228.3422688-1-archana.polampalli@windriver.com>
References: <20250509102228.3422688-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDEwMCBTYWx0ZWRfX/fybQUgXRQyl qOavlK0usyi38OUulVCswSAOFtrK7t9bMbEdz0Pe/ODbAcJuC3vh0AGIE28lfJNBhk/ng15AhwH orF9chx68+jiU249nCJYnjBseHPQVQvz1K6CnbjxHuFFbeEqR4JLdK9UO5rlJ8z6T9G2KEKh4+r
 7C8uiHEF2dF1lJc46cdF5uf/CqMPg+RVbZvbnqH5GxvuCALzdGQlfixcyHzXMZUDnJkECfK/dUJ jQRx64MxYVIMxtHWbDQlxkHcmGBfG+itQamQuf2do2v1i4m1VgbceaTPoBoA5jfv3iqAJp+CK7w puUO8CM9uZCCet/uSCYTaMQBv0qspeoixUzv6mUH8NQ6r0EZ+8kEKGlvSLCqgGhhLd5WDsaP+mB
 3f7SH/BNpV3KAXwwFQ9op1HudinGzPRth6J8Mmut0b44JfK41jlRNbH+lrefQB+y4xnTVBfF
X-Proofpoint-ORIG-GUID: FORopTGLWjYt9-uvGirqHNxlb89NMe4Q
X-Proofpoint-GUID: FORopTGLWjYt9-uvGirqHNxlb89NMe4Q
X-Authority-Analysis: v=2.4 cv=KdHSsRYD c=1 sm=1 tr=0 ts=681dd76c cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=dt9VzEwgFbYA:10 a=NEAV23lmAAAA:8 a=plf8rDjJAAAA:8 a=1XWaLZrsAAAA:8 a=pM9yUfARAAAA:8 a=t7CeM3EgAAAA:8
 a=wTbFulhFaOLR5d1XN8EA:9 a=rDGJdTlHWfUGzjU4:21 a=JWTSs7K9Rhv-lrTctFka:22 a=YH-7kEGJnRg4CV3apUU-:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_04,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2505090100
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 10:22:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216194

From: Archana Polampalli <archana.polampalli@windriver.com>

Fixes CVE-2025-22871

https://github.com/golang/go/compare/go1.24.1...go1.24.2

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 meta/recipes-devtools/go/{go-1.24.1.inc => go-1.24.2.inc}   | 2 +-
 ...o-binary-native_1.24.1.bb => go-binary-native_1.24.2.bb} | 6 +++---
 ...cross-canadian_1.24.1.bb => go-cross-canadian_1.24.2.bb} | 0
 .../go/{go-cross_1.24.1.bb => go-cross_1.24.2.bb}           | 0
 .../go/{go-crosssdk_1.24.1.bb => go-crosssdk_1.24.2.bb}     | 0
 .../go/{go-runtime_1.24.1.bb => go-runtime_1.24.2.bb}       | 0
 meta/recipes-devtools/go/{go_1.24.1.bb => go_1.24.2.bb}     | 0
 7 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.24.1.inc => go-1.24.2.inc} (91%)
 rename meta/recipes-devtools/go/{go-binary-native_1.24.1.bb => go-binary-native_1.24.2.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.24.1.bb => go-cross-canadian_1.24.2.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.24.1.bb => go-cross_1.24.2.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.24.1.bb => go-crosssdk_1.24.2.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.24.1.bb => go-runtime_1.24.2.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.24.1.bb => go_1.24.2.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.24.1.inc b/meta/recipes-devtools/go/go-1.24.2.inc
similarity index 91%
rename from meta/recipes-devtools/go/go-1.24.1.inc
rename to meta/recipes-devtools/go/go-1.24.2.inc
index 4cf66e705a..cb4ae9ef80 100644
--- a/meta/recipes-devtools/go/go-1.24.1.inc
+++ b/meta/recipes-devtools/go/go-1.24.2.inc
@@ -17,4 +17,4 @@ SRC_URI += "\
     file://0010-cmd-go-clear-GOROOT-for-func-ldShared-when-trimpath-.patch \
     file://6d265b008e3d106b2706645e5a88cd8e2fb98953.patch \
 "
-SRC_URI[main.sha256sum] = "8244ebf46c65607db10222b5806aeb31c1fcf8979c1b6b12f60c677e9a3c0656"
+SRC_URI[main.sha256sum] = "9dc77ffadc16d837a1bf32d99c624cb4df0647cee7b119edd9e7b1bcc05f2e00"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.24.1.bb b/meta/recipes-devtools/go/go-binary-native_1.24.2.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.24.1.bb
rename to meta/recipes-devtools/go/go-binary-native_1.24.2.bb
index ffe3d50b7b..65ef93e2e0 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.24.1.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.24.2.bb
@@ -9,10 +9,10 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "cb2396bae64183cdccf81a9a6df0aea3bce9511fc21469fb89a0c00470088073"
-SRC_URI[go_linux_arm64.sha256sum] = "8df5750ffc0281017fb6070fba450f5d22b600a02081dceef47966ffaf36a3af"
-SRC_URI[go_linux_ppc64le.sha256sum] = "0fb522efcefabae6e37e69bdc444094e75bfe824ea6d4cc3cbc70c7ae1b16858"
 
+SRC_URI[go_linux_amd64.sha256sum] = "68097bd680839cbc9d464a0edce4f7c333975e27a90246890e9f1078c7e702ad"
+SRC_URI[go_linux_arm64.sha256sum] = "756274ea4b68fa5535eb9fe2559889287d725a8da63c6aae4d5f23778c229f4b"
+SRC_URI[go_linux_ppc64le.sha256sum] = "5fff857791d541c71d8ea0171c73f6f99770d15ff7e2ad979104856d01f36563"
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
 
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.24.1.bb b/meta/recipes-devtools/go/go-cross-canadian_1.24.2.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.24.1.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.24.2.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.24.1.bb b/meta/recipes-devtools/go/go-cross_1.24.2.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.24.1.bb
rename to meta/recipes-devtools/go/go-cross_1.24.2.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.24.1.bb b/meta/recipes-devtools/go/go-crosssdk_1.24.2.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.24.1.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.24.2.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.24.1.bb b/meta/recipes-devtools/go/go-runtime_1.24.2.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.24.1.bb
rename to meta/recipes-devtools/go/go-runtime_1.24.2.bb
diff --git a/meta/recipes-devtools/go/go_1.24.1.bb b/meta/recipes-devtools/go/go_1.24.2.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.24.1.bb
rename to meta/recipes-devtools/go/go_1.24.2.bb
-- 
2.40.0


