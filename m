Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C16AFC5AD4C
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 10:47:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.88529.1700736471915151920
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Nov 2023 02:47:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Ovn59+nI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=96911f4787=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3AN7iIW7001366
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 10:47:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=TXUUh
	mPHK/0Ps/o/IuJqAfkS/25VFztREbeCJ3uzeDg=; b=Ovn59+nIHdQVyXkNnRB7j
	m3z/apXTpJxvG4xPj/5jzbHy2/+uiBEUXTVKYy2FnZvWekisJRAQZF5xMLE0u5dS
	JuC8GaO/uJ4OROyq6zYbAxOUZs25b6nGpWDgyrsbP+i0YO7dvY9RHUI/NjCMY5wi
	1+zuCVRAQRV5C5I3G0Z70GpOVu/aCnoAQwvcVMiyQkhkATkmAyJIgnDfzi+VQCCX
	dkJJ5/WWduRCSqXqtYVQ/uUFSFJfpQN2Ip54yaorrbkEB4CT1Q8ySi4XVILLeBRK
	73u15luBtC1Fvvhn1nexD7yHI89zVwOAjLYAP6kRXYoFNKnvIlOdKb/jys3k433h
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uejfwvd4w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 10:47:50 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 23 Nov 2023 02:47:38 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][master][kirkstone][PATCH 1/1] vim: Upgrade 9.0.2068 -> 9.0.2112
Date: Thu, 23 Nov 2023 10:47:06 +0000
Message-ID: <20231123104706.915387-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: OOXBwjn1vElhkXT7luK-pgUL3Z7KOLWm
X-Proofpoint-ORIG-GUID: OOXBwjn1vElhkXT7luK-pgUL3Z7KOLWm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=758
 bulkscore=0 lowpriorityscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311060001
 definitions=main-2311230077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 10:47:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191141

From: Archana Polampalli <archana.polampalli@windriver.com>

This includes CVE fix for CVE-2023-48237.
6bf131888 (tag: v9.0.2112) patch 9.0.2112: [security]: overflow in shift_line

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-48237

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index e8942cbc2d..de350c4110 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,8 +19,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".2068"
-SRCREV = "9198c1f2b1ddecde22af918541e0de2a32f0f45a"
+PV .= ".2112"
+SRCREV = "6bf131888a3d1de62bbfa8a7ea03c0ddccfd496e"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.40.0


