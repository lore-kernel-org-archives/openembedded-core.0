Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEF83C197A0
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 03:43:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5120.1700192610575841801
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 19:43:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=N/UgnyAI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=96855ae82f=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3AH3ILA8000789
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 19:43:30 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=uc8E+
	IFTaZY4prWRmXZxyw/f4m1+3W9SO3tFMAmh1es=; b=N/UgnyAIHEw5U9pQDeqV8
	DGxGx+KA/pvq5k++XnBHadVgkGWP7o7jexkkrevWrUV3MxAR7wRJak2RZBD6KWpk
	D6+/mIciqrvHwGlkz9L3OnN4c+rP2CoKDx7eP5Oxtb/oovYSaVkt9SU3BkJpuPxG
	CLzNhYmIJLv7bZZ71G1ZXgL2dGLBW3sJ805WvMoIEPst+ujfmxCXwI6fhpGnEl1P
	jdS41HPRlxItHmNT0TTL9hv4XTT1K3ZeOEJbSKMXKZJROQAjiXIwLGYnltkFPoXF
	SNpEEL5J6QaIavaHeCNXltMrVz/Ad+atV2xW06nLq5w+lakNEqPV4215Q8GTR65H
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3udycrg19t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 19:43:29 -0800 (PST)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 19:43:33 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][master][kirkstone][PATCH V2 1/1] vim: Upgrade 9.0.2048 -> 9.0.2068
Date: Fri, 17 Nov 2023 03:43:15 +0000
Message-ID: <20231117034315.3167426-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: 0dlO0Q6anEF8EeRz2ttsvP_55eDX0LKG
X-Proofpoint-GUID: 0dlO0Q6anEF8EeRz2ttsvP_55eDX0LKG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0 suspectscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 mlxlogscore=705 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311170026
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Nov 2023 03:43:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190827

From: Archana Polampalli <archana.polampalli@windriver.com>

This includes CVE fix for CVE-2023-46246.
9198c1f2b (tag: v9.0.2068) patch 9.0.2068: [security] overflow in :history

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-46246

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 58025828f2..e8942cbc2d 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,8 +19,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".2048"
-SRCREV = "982ef16059bd163a77271107020defde0740bbd6"
+PV .= ".2068"
+SRCREV = "9198c1f2b1ddecde22af918541e0de2a32f0f45a"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.40.0


