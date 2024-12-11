Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4996E77182
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 12:07:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.9240.1733918851429868925
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Dec 2024 04:07:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=207545b38d=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BBBuev1011874;
	Wed, 11 Dec 2024 12:07:30 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43cx4xc3n0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 11 Dec 2024 12:07:29 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 11 Dec 2024 04:07:28 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 11 Dec 2024 04:07:28 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <jpewhacker@gmail.com>
Subject: [PATCH 1/3] meta/lib/oe/sbom30.py: correct alias
Date: Wed, 11 Dec 2024 04:07:26 -0800
Message-ID: <20241211120728.3737604-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: NmwStc4H6qYeh2xefGxW1PT7jh4dOg6C
X-Proofpoint-ORIG-GUID: NmwStc4H6qYeh2xefGxW1PT7jh4dOg6C
X-Authority-Analysis: v=2.4 cv=Y/UCsgeN c=1 sm=1 tr=0 ts=67598081 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=RZcAm9yDv7YA:10 a=rorgr0BEAAAA:8 a=t7CeM3EgAAAA:8 a=ViQE9sQjDe0smNEyRb0A:9 a=FuUPMLReglAHmohU_o2S:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-11_10,2024-12-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 mlxscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2412110088
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 12:07:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208576

After commit [spdx 3.0: Rework how SPDX aliases are linked] applied,
it added extra "/" to namespace, which causing the replacement of
UNIHASH missing a "/"

  http://spdxdocs.org/openembedded-alias/by-doc-hash/0b308e4b9ad979f642d8787c61f76c31bdcad04837eeaaf8bc383f33f99bbeb8/flex-nativeUNIHASH/build/recipe

After applying this commit to remove "/" from namespace.

  http://spdxdocs.org/openembedded-alias/by-doc-hash/0b308e4b9ad979f642d8787c61f76c31bdcad04837eeaaf8bc383f33f99bbeb8/flex-native/UNIHASH/build/recipe

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/lib/oe/sbom30.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index 29cb9e45ad..08fea2aca3 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -267,7 +267,7 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
 
     def new_alias_id(self, obj, replace):
         unihash = self.d.getVar("BB_UNIHASH")
-        namespace = self.get_namespace() + "/"
+        namespace = self.get_namespace()
         if unihash not in obj._id:
             bb.warn(f"Unihash {unihash} not found in {obj._id}")
             return None
-- 
2.25.1


