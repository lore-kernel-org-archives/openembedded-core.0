Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C8A6C282D1
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 06:59:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.7055.1741244369348386197
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 22:59:29 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=51604fe792=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5265Tw4Q005736
	for <openembedded-core@lists.openembedded.org>; Thu, 6 Mar 2025 06:59:28 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 456ct89q5r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 06:59:28 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 5 Mar 2025 22:59:27 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 5 Mar 2025 22:59:25 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH V2 1/1] ffmpeg: Correct the CVE ID to fix CVE-2025-22919
Date: Thu, 6 Mar 2025 06:59:23 +0000
Message-ID: <20250306065923.3070545-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: yFfgp3ZxDGNfVQeA83R_EAHGrJ6WJwoo
X-Proofpoint-ORIG-GUID: yFfgp3ZxDGNfVQeA83R_EAHGrJ6WJwoo
X-Authority-Analysis: v=2.4 cv=D4W9KuRj c=1 sm=1 tr=0 ts=67c947d0 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=Vs1iUdzkB0EA:10 a=emhf11hzAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=pkVkOIWkgzkB79jyUd0A:9 a=HLUCug_QN4oeKp6PugZw:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_03,2025-03-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxscore=0 mlxlogscore=628 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503060050
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 06:59:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212370

From: Archana Polampalli <archana.polampalli@windriver.com>

A reachable assertion in FFmpeg git-master commit N-113007-g8d24a28d06 allows
attackers to cause a Denial of Service (DoS) via opening a crafted AAC file.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ffmpeg/{CVE-2025-25471.patch => CVE-2025-22919.patch}       | 2 +-
 meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb                  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/ffmpeg/ffmpeg/{CVE-2025-25471.patch => CVE-2025-22919.patch} (98%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-25471.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-22919.patch
similarity index 98%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-25471.patch
rename to meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-22919.patch
index 6af01b298f..f895576de3 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-25471.patch
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-22919.patch
@@ -10,7 +10,7 @@ Fixes ticket #11385.
 
 Signed-off-by: James Almer <jamrial@gmail.com>
 
-CVE: CVE-2025-25471
+CVE: CVE-2025-22919
 
 Upstream-Status: Backport [https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/1446e37d3d032e1452844778b3e6ba2c20f0c322]
 
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
index 6af43bcf37..5ebaa4353b 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
@@ -48,7 +48,7 @@ SRC_URI = " \
     file://CVE-2024-36619.patch \
     file://CVE-2024-35369.patch \
     file://CVE-2025-25473.patch \
-    file://CVE-2025-25471.patch \
+    file://CVE-2025-22919.patch \
 "
 
 SRC_URI[sha256sum] = "8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968"
-- 
2.40.0


