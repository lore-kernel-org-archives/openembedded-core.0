Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 899B7C77B61
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 14:57:56 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.69169.1680015472235244482
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Mar 2023 07:57:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=JHo9/jpN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=345182fcaa=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32SCMvU0016781
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 07:57:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=KEn7ybFBqyF9Usgs0lxc7RQHcZSV8u+60DeAlD3ILt0=;
 b=JHo9/jpNcLmYQAet2ROt45WJw344uv5mRkDjq/aHHdugRViqGEDvPKcF427guy3l2/xI
 0Z9abfy4tX3qF/JR7PNFU5umBD9EBaPnzF6y1KYcrWAyd+m4HzyCGQceHkQzMSbqdixY
 YVGgdq8wyNxF+Qxx2Avo0FsTVu0hCH3uiL/BWIK5NjOhQxn382CEQhhFDcmuroTem845
 FnXqP0wCGv5PW69/juIwdn1YGCDXhPkAn5X0kNyOdzYAISoQOj3qQ5J52Q7Ibf9lObkh
 /84O6FfWn4jlzE78AFffqNw5bR+PwV4zbPHkXT9eo+TMRm8mFfyRvrRQ090YhWN9JQr2 HQ== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pj0fn32ut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 07:57:51 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Tue, 28 Mar 2023 07:57:51 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Tue, 28 Mar 2023 07:57:51 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] vim: upgrade 9.0.1403 -> 9.0.1429
Date: Tue, 28 Mar 2023 07:57:51 -0700
Message-ID: <20230328145751.437218-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: DQBXLPV7KNNdswUZbz30fdOVE4TlB5xW
X-Proofpoint-GUID: DQBXLPV7KNNdswUZbz30fdOVE4TlB5xW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=535 adultscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303280117
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 14:57:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179239

Fixes: CVE-2023-1127, CVE-2023-1170, CVE-2023-1175,
       CVE-2023-1264, CVE-2023-1355

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 42a2ba46b8..1e27415288 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,8 +19,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".1403"
-SRCREV = "e764d1b4219e6615a04df1c3a6a5c0210a0a7dac"
+PV .= ".1429"
+SRCREV = "1a08a3e2a584889f19b84a27672134649b73da58"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.39.0


