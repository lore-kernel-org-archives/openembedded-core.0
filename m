Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C83CCFA05
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 11:34:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9240.1762515243370532325
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Nov 2025 03:34:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=efaJjYtU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=34066b3d81=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A76XLu91917522
	for <openembedded-core@lists.openembedded.org>; Fri, 7 Nov 2025 03:34:03 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=2p+67yrB7VtLmAeNV6xI
	WmPeAw9F+QsQvBADFoLXfkU=; b=efaJjYtUO88M+IDAIr+rua++GAcea6t0AaVv
	fRZqfDsV/sfxnXYb7I0fKH86KV7++quyGtT0CYRc5hw6yZteQ22+xZMWSn5KWeLr
	KzAOvPko7tfDFHP+WvxVRMknCy6k5xS5wY9HR23xqH0+LaDHGNQX9E1TxwWqg5M7
	MHpp9GqIxtfv90UrNt44rk8Agdni6nNR6NdPD5zNavQah9Y/b4mRwmynIzt5621X
	tD8kXTYmKKJaUw4WLe2tLrZt9Iskd+D46ccEX9xut2Xz7mQmKKayerFJBT+NSrv2
	DH7xmO2bFT3URwl37MDoCDfxV+jqJMLPSKzXeTKsKBoa2b+6YA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a975fgehw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 03:34:01 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 7 Nov 2025 03:34:01 -0800
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 7 Nov 2025 03:34:00 -0800
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 1/1] python3-urllib3: Upgrade 1.26.18 -> 1.26.20
Date: Fri, 7 Nov 2025 17:03:56 +0530
Message-ID: <20251107113356.597397-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA5NCBTYWx0ZWRfX4Tj1O1nlkXoY
 lvj0JDPwJJ1vxw70w9/YtHNczbi8ffzAf3yIEBwhvSgRa9h+5H9Fsw2okf/gtmF9KH95AS3O/Bb
 mcUxEU3VIUg1NDT4ArUjMgy5gMcT7ZHt+VtJHj1d5GY28NZWS2zD03iNtj56rnl4EtEDcaedhqs
 EJ3H34LLNxkytAS+rfjch5Gi02yebguHqxS6OIMnK1xSVSwp2WyW6V5Nh/uhgv/2bC/RXfLvwqi
 UryGpK5CtnDeGJBFtYYPA9/78L5e7jH78hzJN5/YOOXexfFTGGdR6ztr/VUskIWZRcG4INhD2hW
 xBbyyxcZQpn3MDu2G08T1P7vBc81gqlYawbfemoTh8GAsfwGjc/dtsNO+QACcN2fIYWrKTwWrHQ
 McC+cAv2ml6bSjjS0BTZK5ViUvPujQ==
X-Authority-Analysis: v=2.4 cv=MtVfKmae c=1 sm=1 tr=0 ts=690dd92a cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=FFfz_US6xDyJEw-6beMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: xflxnIUe666BpbV-4-NkYu8t7JBv57XS
X-Proofpoint-ORIG-GUID: xflxnIUe666BpbV-4-NkYu8t7JBv57XS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070094
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 11:34:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226034

From: Soumya Sambu <soumya.sambu@windriver.com>

Includes fix for CVE-2024-37891

Changelog:
----------
https://github.com/urllib3/urllib3/blob/1.26.20/CHANGES.rst

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../{python3-urllib3_1.26.18.bb => python3-urllib3_1.26.20.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-urllib3_1.26.18.bb => python3-urllib3_1.26.20.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_1.26.18.bb b/meta/recipes-devtools/python/python3-urllib3_1.26.20.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-urllib3_1.26.18.bb
rename to meta/recipes-devtools/python/python3-urllib3_1.26.20.bb
index b26c9ad2fa..58988e4205 100644
--- a/meta/recipes-devtools/python/python3-urllib3_1.26.18.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_1.26.20.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c"
 
-SRC_URI[sha256sum] = "f8ecc1bba5667413457c529ab955bf8c67b45db799d159066261719e328580a0"
+SRC_URI[sha256sum] = "40c2dc0c681e47eb8f90e7e27bf6ff7df2e677421fd46756da1161c39ca70d32"
 
 inherit pypi setuptools3
 
-- 
2.40.0


