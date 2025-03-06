Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36BA8C282D1
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 18:56:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.2004.1741287355766076856
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Mar 2025 10:55:55 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5160c4373b=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 526BwFE0003817;
	Thu, 6 Mar 2025 18:55:54 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 456cux2dcc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 06 Mar 2025 18:55:54 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 6 Mar 2025 10:55:53 -0800
Received: from pop-os.wrs.com (172.25.44.6) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2507.43 via Frontend
 Transport; Thu, 6 Mar 2025 10:55:53 -0800
From: <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <raj.khem@gmail.com>, <bruce.ashfield@gmail.com>
Subject: [PATCH 2/2] tcmode-default: eliminate needless 'go' defaults
Date: Thu, 6 Mar 2025 13:55:51 -0500
Message-ID: <20250306185551.1758417-2-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306185551.1758417-1-Randy.MacLeod@windriver.com>
References: <20250306185551.1758417-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: M8ovlCQ4bf8nuynDN08f377BjUy4xPuC
X-Authority-Analysis: v=2.4 cv=ddB63WXe c=1 sm=1 tr=0 ts=67c9efba cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=Vs1iUdzkB0EA:10 a=t7CeM3EgAAAA:8 a=pM9yUfARAAAA:8 a=FCXYrjMRZPpG5gPt0PQA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=YH-7kEGJnRg4CV3apUU-:22
X-Proofpoint-ORIG-GUID: M8ovlCQ4bf8nuynDN08f377BjUy4xPuC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_06,2025-03-06_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 mlxscore=0
 mlxlogscore=824 malwarescore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503060143
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 18:56:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212403

From: Randy MacLeod <Randy.MacLeod@windriver.com>

Manually setting preferred version/provider is not required so remove that for 'go'.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/conf/distro/include/tcmode-default.inc | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index ce0c8235e4..702fa4d75f 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -14,7 +14,6 @@ SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.44%"
 GLIBCVERSION ?= "2.41%"
 LINUXLIBCVERSION ?= "6.12%"
-GOVERSION ?= "1.24%"
 RUSTVERSION ?= "1.83%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
@@ -46,20 +45,6 @@ PREFERRED_VERSION_glibc-scripts            ?= "${GLIBCVERSION}"
 PREFERRED_VERSION_nativesdk-glibc          ?= "${GLIBCVERSION}"
 PREFERRED_VERSION_cross-localedef-native   ?= "${GLIBCVERSION}"
 
-# Bootstrap Go using a binary release from golang.org.  If you want to bootstrap
-# from source using the C-implemented Go 1.4 (only supports x86-64 hosts) then use
-# go-native.
-PREFERRED_PROVIDER_go-native ?= "go-binary-native"
-PREFERRED_VERSION_virtual/${TARGET_PREFIX}go ?= "${GOVERSION}"
-PREFERRED_VERSION_go-cross-${TUNE_PKGARCH} ?= "${GOVERSION}"
-PREFERRED_VERSION_go-crosssdk-${SDK_ARCH} ?= "${GOVERSION}"
-PREFERRED_VERSION_go-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "${GOVERSION}"
-PREFERRED_VERSION_go ?= "${GOVERSION}"
-PREFERRED_VERSION_go-native ?= "${GOVERSION}"
-PREFERRED_VERSION_go-runtime ?= "${GOVERSION}"
-PREFERRED_VERSION_nativesdk-go ?= "${GOVERSION}"
-PREFERRED_VERSION_nativesdk-go-runtime ?= "${GOVERSION}"
-
 # Rust toolchain preferred versions:
 
 PREFERRED_VERSION_cargo ?= "${RUSTVERSION}"
-- 
2.34.1


