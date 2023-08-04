Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58BDFC001DB
	for <webhook@archiver.kernel.org>; Fri,  4 Aug 2023 21:30:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.471.1691184623191342373
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Aug 2023 14:30:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fxuSraDV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7580881f1b=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 374LU1cS018317
	for <openembedded-core@lists.openembedded.org>; Fri, 4 Aug 2023 14:30:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=jzk1i
	GnytjjSNFJVPHqCfWjOFRqUxzQTeeZ8zVFMVUs=; b=fxuSraDV0df6PO3sPkwY2
	IiN9uC5+9VSphI/FzqgpVTeSWMkBmm0nTMfkWfyY3iSw9gqWWqB/anx0Kp62Q2oU
	kgDry0hFVFCre3D2PDkqvCFpSOp8Bg9ap90/9Pz7V0AougiW4qS7hnESoLfIbpja
	QURMfGb9q1mGSe+uySYSKmO2WYXrHSSypGj3j6cXjApGJmtbgccQVxVkkF7JXfnD
	5KjE5MfSwc2ky79RQ5fF6qiIavsM9ZjEuFvQLCJo2k7emHQIqU/UCOlGs4xZSrwK
	wFKx/YsnuDOOJVVtiEEJbwbXvGYgo0/IcJot5oQ15AolZ2QXyeLAWrW8kREGyOnj
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s6daqvh1u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 14:30:22 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 4 Aug 2023 14:30:21 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Fri, 4 Aug 2023 14:30:21 -0700
From: Sakib Sajal <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] go: upgrade 1.20.6 -> 1.20.7
Date: Fri, 4 Aug 2023 14:30:20 -0700
Message-ID: <20230804213020.3368378-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: XXUNAnAGMfq0-pq8cWsQqRnYOQfUpHAG
X-Proofpoint-GUID: XXUNAnAGMfq0-pq8cWsQqRnYOQfUpHAG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-04_21,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 malwarescore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2308040194
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 21:30:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185543

Upgrade to latest 1.20.x release [1]:

$ git log --oneline go1.20.6..go1.20.7 origin/release-branch.go1.20
adb775e309 (tag: go1.20.7, origin/release-branch.go1.20) [release-branch.go1.20] go1.20.7
659f2a2207 [release-branch.go1.20] crypto/tls: restrict RSA keys in certificates to <= 8192 bits
10d85fa0f6 [release-branch.go1.20] cmd/asm, cmd/internal/obj: generate proper atomic ops for riscv64
bd3a1f24e7 [release-branch.go1.20] net: tolerate permission errors in interface tests
6211a024b4 [release-branch.go1.20] cmd/compile: on PPC64, fix sign/zero extension when masking

[1] https://github.com/golang/go/compare/go1.20.6...go1.20.7

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/go/{go-1.20.6.inc => go-1.20.7.inc}   | 2 +-
 ...o-binary-native_1.20.6.bb => go-binary-native_1.20.7.bb} | 6 +++---
 ...cross-canadian_1.20.6.bb => go-cross-canadian_1.20.7.bb} | 0
 .../go/{go-cross_1.20.6.bb => go-cross_1.20.7.bb}           | 0
 .../go/{go-crosssdk_1.20.6.bb => go-crosssdk_1.20.7.bb}     | 0
 .../go/{go-native_1.20.6.bb => go-native_1.20.7.bb}         | 0
 .../go/{go-runtime_1.20.6.bb => go-runtime_1.20.7.bb}       | 0
 meta/recipes-devtools/go/{go_1.20.6.bb => go_1.20.7.bb}     | 0
 8 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.20.6.inc => go-1.20.7.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.20.6.bb => go-binary-native_1.20.7.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.20.6.bb => go-cross-canadian_1.20.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.20.6.bb => go-cross_1.20.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.20.6.bb => go-crosssdk_1.20.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.20.6.bb => go-native_1.20.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.20.6.bb => go-runtime_1.20.7.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.20.6.bb => go_1.20.7.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.20.6.inc b/meta/recipes-devtools/go/go-1.20.7.inc
similarity index 89%
rename from meta/recipes-devtools/go/go-1.20.6.inc
rename to meta/recipes-devtools/go/go-1.20.7.inc
index 551171b255..f7974367cc 100644
--- a/meta/recipes-devtools/go/go-1.20.6.inc
+++ b/meta/recipes-devtools/go/go-1.20.7.inc
@@ -15,4 +15,4 @@ SRC_URI += "\
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
 "
-SRC_URI[main.sha256sum] = "62ee5bc6fb55b8bae8f705e0cb8df86d6453626b4ecf93279e2867092e0b7f70"
+SRC_URI[main.sha256sum] = "2c5ee9c9ec1e733b0dbbc2bdfed3f62306e51d8172bf38f4f4e542b27520f597"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.20.6.bb b/meta/recipes-devtools/go/go-binary-native_1.20.7.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.20.6.bb
rename to meta/recipes-devtools/go/go-binary-native_1.20.7.bb
index 5b2f8f4352..3decde1954 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.20.6.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.20.7.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "b945ae2bb5db01a0fb4786afde64e6fbab50b67f6fa0eb6cfa4924f16a7ff1eb"
-SRC_URI[go_linux_arm64.sha256sum] = "4e15ab37556e979181a1a1cc60f6d796932223a0f5351d7c83768b356f84429b"
-SRC_URI[go_linux_ppc64le.sha256sum] = "a1b91a42a40bba54bfd5c96c23d72250e0c424038d0d2b5c7950b828b4905822"
+SRC_URI[go_linux_amd64.sha256sum] = "f0a87f1bcae91c4b69f8dc2bc6d7e6bfcd7524fceec130af525058c0c17b1b44"
+SRC_URI[go_linux_arm64.sha256sum] = "44781ae3b153c3b07651d93b6bc554e835a36e2d72a696281c1e4dad9efffe43"
+SRC_URI[go_linux_ppc64le.sha256sum] = "6318a1db307c12b8afe68808bd6fae4fba1e558a85b958216096869ed506dcb3"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.20.6.bb b/meta/recipes-devtools/go/go-cross-canadian_1.20.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.20.6.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.20.7.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.20.6.bb b/meta/recipes-devtools/go/go-cross_1.20.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.20.6.bb
rename to meta/recipes-devtools/go/go-cross_1.20.7.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.20.6.bb b/meta/recipes-devtools/go/go-crosssdk_1.20.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.20.6.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.20.7.bb
diff --git a/meta/recipes-devtools/go/go-native_1.20.6.bb b/meta/recipes-devtools/go/go-native_1.20.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.20.6.bb
rename to meta/recipes-devtools/go/go-native_1.20.7.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.20.6.bb b/meta/recipes-devtools/go/go-runtime_1.20.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.20.6.bb
rename to meta/recipes-devtools/go/go-runtime_1.20.7.bb
diff --git a/meta/recipes-devtools/go/go_1.20.6.bb b/meta/recipes-devtools/go/go_1.20.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.20.6.bb
rename to meta/recipes-devtools/go/go_1.20.7.bb
-- 
2.39.0


