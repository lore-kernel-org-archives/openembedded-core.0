Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E64C4C87FCE
	for <webhook@archiver.kernel.org>; Fri, 25 Jul 2025 11:26:54 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.17337.1753442805447332343
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Jul 2025 04:26:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9301b4d876=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56P81OIr3078414
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 11:26:44 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 483w2f8h1v-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 11:26:44 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Fri, 25 Jul 2025 04:26:43 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Fri, 25 Jul 2025 04:26:41 -0700
From: Praveen Kumar <praveen.kumar@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Praveen Kumar <praveen.kumar@windriver.com>
Subject: [oe-core][walnascar][PATCH 1/1] bind: upgrade 9.20.9 -> 9.20.11
Date: Fri, 25 Jul 2025 16:56:31 +0530
Message-ID: <20250725112631.3871218-1-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 2D3Ai5oTNun-FVna1xzWGVau01l4KUNy
X-Proofpoint-ORIG-GUID: 2D3Ai5oTNun-FVna1xzWGVau01l4KUNy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDA5NyBTYWx0ZWRfX/S3yS0FY3mKI
 akElkHTh8in5eEzrhfre+ZUsO1K2pJqSw0GqIST/dFbIVOp6MnXdYhpfPcORgOuhcdt6Fy8eRqH
 CQAZAnmLdPPYnmn1JsHrpUqo1EgHScgBgd2AEOuI2XKdENNeGIjPfn3HRuCpL30tGgrPWQtW3z2
 XAo7Sg14o6ZPg7sFtMBQbAMhAffHvesvcvYIz/0CO3ykdIFHsGKLDJzPFgLWE43B3SD9xHe/cZT
 C1XSPHTDY/LhvU5rI1sgIQRunUEDv7Rg9coR/p/qsaMneTxzy7q3i7eOwTEAQHE0AUzpCW7LZR6
 CCFHUz/bVxGbI2e4WWpvY4CXQUkUGhkwxSKPUiY2aoruIy6wx9XQaJrEw2VupzPIklpLWRDqYKI
 aOkzgVEn
X-Authority-Analysis: v=2.4 cv=PK8P+eqC c=1 sm=1 tr=0 ts=688369f4 cx=c_pps
 a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17
 a=Wb1JkmetP80A:10 a=SCo1hh1FAAAA:8 a=t7CeM3EgAAAA:8 a=eDekE4BJISeLqjh6gZoA:9
 a=uPxCKVC2XIMA:10 a=jjiDOD437DYA:10 a=nwb-CePKZZm3gL-ai9HY:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2507240171
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 11:26:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220906

Overview of changes in bind 9.20.11
==================================
Security Fixes:
1. Fix a possible assertion failure when stale-answer-client-timeout is set to 0.
2. In specific circumstances the named resolver process could exit with an
   assertion failure when stale answers were enabled and the stale-answer-client-timeout
   configuration option was set to 0. This has been fixed. (CVE-2025-40777) [GL #5372]

For additional feature changes and bug fixes, please see:
https://downloads.isc.org/isc/bind9/9.20.11/doc/arm/html/notes.html#notes-for-bind-9-20-11

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
---
 .../bind/{bind_9.20.9.bb => bind_9.20.11.bb}                    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.9.bb => bind_9.20.11.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.20.9.bb b/meta/recipes-connectivity/bind/bind_9.20.11.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.9.bb
rename to meta/recipes-connectivity/bind/bind_9.20.11.bb
index 93ff957fc5..8d230f6e95 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.9.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.11.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "3d26900ed9c9a859073ffea9b97e292c1248dad18279b17b05fcb23c3091f86d"
+SRC_URI[sha256sum] = "4da2d532e668bc21e883f6e6d9d3d81794d9ec60b181530385649a56f46ee17a"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.40.0


