Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAB6CC001DF
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 04:43:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.47851.1697776976777800247
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 21:42:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=C2EMxs+3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=86573ca7bc=yogita.urade@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39K4aZQE000662
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 04:42:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=uA8vC
	rvbe8nSznM84dDDfhwrBMLWMTh2/oXzG+3qIP8=; b=C2EMxs+31VhQiM2W+Eb4f
	vAokNZHUf2w/t+KewR0Bsj/VlwMLB0vNoYiyxzQ+RxOWp6ZYTh4GrlSR/N/7blDS
	JpjLLTAiNjv1AORZLhy7Pe21quJP9H4BXB++L/6SW8IdktjTi2T58sDwP3PO3dGH
	nzwN8ezcWPgxCAz9ylzP4+Ry1dVUBCu5D9Z9bUCVQNqtdCEgf3qyIbxVro8U0Xid
	TqdjPfr84FinP/Jh6nCrYJEilyB9kCjNnw3RSPebpFVApL278up7A0hXlGK6tKSM
	ov2yZcArjqdRmUoxFCHIyzmEPE0tfqDqmxwspNcUt0jjyYE5/tz2t6715vjYgpQt
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tuf3a84w8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 04:42:55 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 19 Oct 2023 21:42:53 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][mickledore][PATCH 1/1] libxpm: upgrade to 3.5.17
Date: Fri, 20 Oct 2023 04:42:34 +0000
Message-ID: <20231020044235.1168292-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: zWfIBybEy_yT9I6ySiqd8Fbe4p1et1ge
X-Proofpoint-ORIG-GUID: zWfIBybEy_yT9I6ySiqd8Fbe4p1et1ge
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-20_02,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 clxscore=1015 spamscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 mlxlogscore=466 phishscore=0 adultscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2310170000 definitions=main-2310200039
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 04:43:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189494

From: Ross Burton <ross.burton@arm.com>

This release fixes the following CVEs:

- CVE-2023-43788
- CVE-2023-43789

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 46dd8ce41756dbc2aa0f9001416f208cced1c8d5)
Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../xorg-lib/{libxpm_3.5.16.bb => libxpm_3.5.17.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxpm_3.5.16.bb => libxpm_3.5.17.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-lib/libxpm_3.5.16.bb b/meta/recipes-graphics/xorg-lib/libxpm_3.5.17.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-lib/libxpm_3.5.16.bb
rename to meta/recipes-graphics/xorg-lib/libxpm_3.5.17.bb
index c3d01f1bb3..8e15ecc0d4 100644
--- a/meta/recipes-graphics/xorg-lib/libxpm_3.5.16.bb
+++ b/meta/recipes-graphics/xorg-lib/libxpm_3.5.17.bb
@@ -22,6 +22,6 @@ PACKAGES =+ "sxpm cxpm"
 FILES:cxpm = "${bindir}/cxpm"
 FILES:sxpm = "${bindir}/sxpm"
 
-SRC_URI[sha256sum] = "e6bc5da7a69dbd9bcc67e87c93d4904fe2f5177a0711c56e71fa2f6eff649f51"
+SRC_URI[sha256sum] = "64b31f81019e7d388c822b0b28af8d51c4622b83f1f0cb6fa3fc95e271226e43"
 
 BBCLASSEXTEND = "native"
-- 
2.40.0


