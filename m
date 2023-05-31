Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A7C8C77B7C
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 09:06:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.9618.1685523980938610088
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 May 2023 02:06:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=P2rdbtYr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5515e1e2d8=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34V6nMkP032045
	for <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 02:06:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=e+uD+IesT/M+xuya2MQZ7JjV4FrFeSp3iH6ZrJ+B7gk=;
 b=P2rdbtYrLXgs2PoMG8NQGpqQWFU/vQSM6nIZXQB47RVz+2i1HMNHnV5qo07ep5lgJzmA
 VKGUR/HUD4huKuwL54D3e78qdCf4PhJwWSKX9I09aJ7tDCy+h6wXZj4OmzlNGDfle9T3
 xB83udIK04ydP26EI8UNSQVhIDvoK+aq+VBepNf6O0MvyjLYSl+j+SG+HgdtNaP1XPlm
 nUxaJvS5vgSp82/FBhfvUMfN8UjEuAnhG4B8fCj1NFlUQcf42CGhDYgLbYGhZ5iHmOv6
 hrB+inBpfG++LjEjtWx2Pq7nP7ank6dgJhPgLA6/TfDCeJonwmKKS6RE6LgAKBHNoE5U 6A== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3quhcjb71s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 02:06:20 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 31 May 2023 02:06:18 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>
Subject: [oe-core][mickledore][PATCH 1/1] git: ignore CVE-2023-25815
Date: Wed, 31 May 2023 09:06:06 +0000
Message-ID: <20230531090606.3390867-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: 2_8kwTwctv7Ti7QEfN9nll0fqXvp2Shb
X-Proofpoint-ORIG-GUID: 2_8kwTwctv7Ti7QEfN9nll0fqXvp2Shb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-31_04,2023-05-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0 mlxlogscore=802
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305310079
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 09:06:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182007

This is specific to Git-for-Windows.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 meta/recipes-devtools/git/git_2.39.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/git/git_2.39.2.bb b/meta/recipes-devtools/git/git_2.39.2.bb
index 222e545f60..9fac9d13f8 100644
--- a/meta/recipes-devtools/git/git_2.39.2.bb
+++ b/meta/recipes-devtools/git/git_2.39.2.bb
@@ -33,6 +33,8 @@ CVE_PRODUCT = "git-scm:git"
 CVE_CHECK_IGNORE += "CVE-2022-24975"
 # This is specific to Git-for-Windows
 CVE_CHECK_IGNORE += "CVE-2022-41953"
+# This is specific to Git-for-Windows
+CVE_CHECK_IGNORE += "CVE-2023-25815"
 
 PACKAGECONFIG ??= "expat curl"
 PACKAGECONFIG[cvsserver] = ""
-- 
2.40.0


