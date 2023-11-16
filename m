Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FEE8C5AD4C
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 08:01:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.2461.1700121708129075335
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 00:01:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hARfMy7V;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9684758189=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AG6Zgb2007605
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 08:01:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=MGkNYw9F2MWxDVp2zn0TvxKIiG5TV2DGLrVA8O636Is=; b=
	hARfMy7VTFkuFhdpQzzSz0+907hj+7ujcmyG1dWMB7LtbPnEqkre59nUpU/6rnuf
	uRZhLugVLM3wBNoAWxFFHm7Sjj3eMv4A6IB+m1cN7j3TlWPOobxVC1ilT/khpXYb
	wL/m5DBhxj39yJNqXPbwr3H0ZySrFs0qwhdCrKu7uF0bz0yHx3lIP/yPeLcAdkMY
	x2HDSQCLHB+KD+Z8NQ9bZl15TMPVBGLuPXW1HlAQ/iRkcLYLsXnNOAJuiD/OaqUr
	2ZYIrZhMvVtFXyueLMAchc2fs5+hv6IRQBOzWeFUNakjPs5tse2Ie6ISibIIGQsG
	migbLfguYFBY1EnUBT98mA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u9xtxcqwu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 08:01:47 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 00:01:49 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][dunfell][PATCH 3/3] vim: Upgrade 9.0.2048 -> 9.0.2068
Date: Thu, 16 Nov 2023 08:01:24 +0000
Message-ID: <20231116080124.3175506-3-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231116080124.3175506-1-archana.polampalli@windriver.com>
References: <20231116080124.3175506-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: lFVxbWfcRjuSiJnw4yQ3cJUqfxD_HA2N
X-Proofpoint-GUID: lFVxbWfcRjuSiJnw4yQ3cJUqfxD_HA2N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_06,2023-11-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=653 bulkscore=0 mlxscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311060001
 definitions=main-2311160062
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 08:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190766

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
index a12e3c8d89..383db8b874 100644
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


