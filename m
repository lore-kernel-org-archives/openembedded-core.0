Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9C7DC02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 07:50:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9969.1739346618691055884
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 23:50:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4138389efb=divya.chellam@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51C5cx3O026008
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 07:50:18 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44rnpbg335-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 07:50:03 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 11 Feb 2025 23:50:00 -0800
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] vim: Upgrade 9.1.0764 -> 9.1.1043
Date: Wed, 12 Feb 2025 07:49:37 +0000
Message-ID: <20250212074937.2453197-1-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Authority-Analysis: v=2.4 cv=B4lD0PtM c=1 sm=1 tr=0 ts=67ac52ab cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=T2h4t0Lz3GQA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=qx_yR4XOc8-HUud59pgA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: tWayPY6j9Un37yk65e4e3LfsEvsBB3tZ
X-Proofpoint-GUID: tWayPY6j9Un37yk65e4e3LfsEvsBB3tZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_02,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 mlxlogscore=860 malwarescore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502120060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 07:50:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211209

From: Divya Chellam <divya.chellam@windriver.com>

This includes CVE-fix for CVE-2025-22134 and CVE-2025-24014

Changes between 9.1.0764 -> 9.1.1043
====================================
https://github.com/vim/vim/compare/v9.1.0764...v9.1.1043

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index cf36f4087b..ab85d6115d 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -18,8 +18,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".0764"
-SRCREV = "51b62387be93c65fa56bbabe1c3c1ea5df187641"
+PV .= ".1043"
+SRCREV = "9d1bed5eccdbb46a26b8a484f5e9163c40e63919"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.40.0


