Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D425BC4725D
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 07:35:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.16963.1705649711556579689
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jan 2024 23:35:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gpZ3kN+R;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1748b1ce9d=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40J4dI8b031750
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 23:35:11 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=oiBsu
	1JPH5sujp+OD+ZcnVD7F4/2LMMJsMkosG0u2WM=; b=gpZ3kN+RUQEunVMo1VxSO
	/N4BIT0Dx8RMIKJV0brZFGRktW+mSrdugQAH7wy1jt/gqa4A7ctqhJI2s2rshDxF
	NOZVKNJlMB1KP4fQGuKHr2DDA43CeJVZ0Ak7l3XuAXC6RElcu4Ora6Nb9156JYm7
	dDcKMwMCCcTBtXuAGfcol6BnX1nP5Yo4YyRujDXRAWps11XKt3asmRR6mmuAOBBD
	HaDGuGbVC+CgvrhpXYMKh4Y/wZxieGJLo6LxOA4AK4l6ftsMr577fxCtJsxVDxpx
	9p2mm5CH1G7yZ1raOZen0hA/lGx7sC/N7cuC6k33/P9mJbEZ1HMaYT3Lehyzq+Ld
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vkpp46hnv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 23:35:11 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 23:35:21 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 18 Jan 2024 23:35:21 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] tcmode-default.inc: use ?= to set PREFERRED_VERSION_llvm/llvm-native/nativesdk-llvm
Date: Fri, 19 Jan 2024 15:35:09 +0800
Message-ID: <20240119073509.934362-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: hsrkJ246LPxp6Y7Y7-l6kNl2E4KZJtNZ
X-Proofpoint-ORIG-GUID: hsrkJ246LPxp6Y7Y7-l6kNl2E4KZJtNZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-19_03,2024-01-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 phishscore=0 mlxlogscore=578 suspectscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401190025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 07:35:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194017

From: Changqing Li <changqing.li@windriver.com>

use ?= to set following configs in order to allow user
to override the default settings:
PREFERRED_VERSION_llvm
PREFERRED_VERSION_llvm-native
PREFERRED_VERSION_nativesdk-llvm

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/conf/distro/include/tcmode-default.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 3720a4c5b8..0de858d3af 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -77,9 +77,9 @@ PREFERRED_VERSION_go-runtime ?= "${GOVERSION}"
 PREFERRED_VERSION_nativesdk-go ?= "${GOVERSION}"
 PREFERRED_VERSION_nativesdk-go-runtime ?= "${GOVERSION}"
 
-PREFERRED_VERSION_llvm = "${LLVMVERSION}"
-PREFERRED_VERSION_llvm-native = "${LLVMVERSION}"
-PREFERRED_VERSION_nativesdk-llvm = "${LLVMVERSION}"
+PREFERRED_VERSION_llvm ?= "${LLVMVERSION}"
+PREFERRED_VERSION_llvm-native ?= "${LLVMVERSION}"
+PREFERRED_VERSION_nativesdk-llvm ?= "${LLVMVERSION}"
 
 # Rust toolchain preferred versions:
 
-- 
2.25.1


