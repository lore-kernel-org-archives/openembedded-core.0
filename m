Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0D22C77B7C
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 14:59:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.61408.1683817157906323839
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 May 2023 07:59:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=hFyeIu6I;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4495d4136c=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34BAWb2u031829
	for <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 14:59:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=V6ByEIAxB8Bx/qQXvFGXvw5Cl2HyO8/xlzyNib8z8j0=;
 b=hFyeIu6IxcrPJV6RKr5QJr2S3pcQIy2+kx/7qvvbQQ1MoA81TpSnsBPtElrRYPp5asgs
 V1Pg9Iftr4ICBTQL9/PxCwUcHSHhwA4L1C2rxYLJjnbOtipTs4b+wU+Yo+D+m+J6g7dd
 JOqEuWRc0j6vSZsLyfOZ0rd97nqib5cZzg7w0AOQcisiKW11dmeAReGIhzO2d/h+RFnP
 0vjhXtMotb9kcW2DaHOikVnbmw1/FWcjNtbVWxq8vRPl/epIp87KklxFoP6MXxVWF8TA
 B+qA31StaCz6LFt2aJw8vKIbeHx1fO4af6XuQQ8u53xAruWSk3PMeusP/fKVTx5u1ZC7 Rg== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qf82x2t51-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 14:59:16 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 11 May 2023 07:59:15 -0700
Received: from vme.wrs.com (172.25.44.4) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Thu, 11 May 2023 07:59:15 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] vim: upgrade 9.0.1429 -> 9.0.1527
Date: Thu, 11 May 2023 10:59:15 -0400
Message-ID: <20230511145915.2513006-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: JxC2UKDBYqqRRO4sLzI6RUQOTd_ypYSc
X-Proofpoint-GUID: JxC2UKDBYqqRRO4sLzI6RUQOTd_ypYSc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-11_11,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 mlxlogscore=574 lowpriorityscore=0 adultscore=0 spamscore=0
 phishscore=0 mlxscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305110129
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 14:59:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181137

Fixes: https://nvd.nist.gov/vuln/detail/CVE-2023-2426
caf642c25 patch 9.0.1499: using uninitialized memory with fuzzy matching

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 1e27415288..e1d2563316 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,8 +19,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".1429"
-SRCREV = "1a08a3e2a584889f19b84a27672134649b73da58"
+PV .= ".1527"
+SRCREV = "c28e7a2b2f23dbd246a1ad7ad7aaa6f7ab2e5887"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.34.1


