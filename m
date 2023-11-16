Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E32FAC197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 04:15:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.495.1700108142508804545
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 20:15:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fNAmDZFT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9684758189=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AG4BBxH012580
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 20:15:42 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=aN6GX
	65zv5jmRcCrqgceikhyVkJhP2BDqtR6pmpim4s=; b=fNAmDZFTP0T9IVWmG2g9L
	aOinp0Q5+wkeW2AYzaW8QBSsEcdkLpXQjILNCFTTbLT9A3rZNvht6pG/8YE5ggRu
	YLmMkQB7eZcWFydIvFfupyeed1Z8Bk1ZtJeZzjyRm5/8cAQSdYLZZc8WJQXMZ+lD
	GGO09aX2Y70Pnm0NW/KpdaBsGyaqpa9DSdkBFjErpElZWgarCrhJYOrBS0FOCW2w
	u3lU5xGjDuy8ABna2AuoFY9zicqENalYxPl2W9BtzwsGqTybS5Zk8fikoLBsL9F9
	N/xSjhBZpqjxFoiHZpX5Tl/TguBo2n7EyASjzk5rXHjAva1iVyWgHwIaSlRMC+VQ
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ua5s4vegk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 20:15:42 -0800 (PST)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 20:15:45 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][master][kirkstone][PATCH 1/1] vim: Upgrade 9.0.2048 -> 9.0.2068
Date: Thu, 16 Nov 2023 04:15:24 +0000
Message-ID: <20231116041524.1344040-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: 4ZttbdeYJvfNJrIRA2-W7KTf4NMSl377
X-Proofpoint-ORIG-GUID: 4ZttbdeYJvfNJrIRA2-W7KTf4NMSl377
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_01,2023-11-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=686 clxscore=1011
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 spamscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311160032
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 04:15:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190752

From: Archana Polampalli <archana.polampalli@windriver.com>

This includes CVE fix for CVE-2023-46246.
9198c1f2b (tag: v9.0.2068) patch 9.0.2068: [security] overflow in :history

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-46246

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 meta/recipes-support/vim/vim.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 38212a1fa6..2ef7fecc3f 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,7 +19,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".2048"
+PV .= ".2068"
 SRCREV = "982ef16059bd163a77271107020defde0740bbd6"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
-- 
2.40.0


