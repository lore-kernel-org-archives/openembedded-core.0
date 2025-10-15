Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19C7ACCD185
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 04:45:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.8321.1760503541131433651
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 21:45:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=UyPixA3Q;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=23830399db=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59F3Gw7J933135
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 21:45:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=vj9MbsLFV3hz050WCqdf
	lzp3wY0feY2K8nBxxO2tNrQ=; b=UyPixA3QC0dnfEkHJz0kI3tfOCeFB1F3BlcP
	lVdhtF/I6UviWSXgANIt8/HFP1zFi51JQUijAggMKhSY4x+zBMvYWTHefXZVWiwA
	bf1lRf3Fs5xeyOV8IXSjRLLXSvtGKYYg5FRKRGImMrroqX5INZmBA16Ylm2MAki8
	hxUoxOaH3kZgXCWmMfeNHmpdILW2uliFc4PjlbO2qoc6r0XDwOFJ6zX5boYIsB3c
	XjmQDtOwK/+wtCo0mpWzjhtP/pNrDLnRwcGc71Apt0ELPd5Uv4kF3T82/P4fxDGz
	OwMjyjFAeDp59TRTzIIHuxiUtIA5+pxSCeUOyR0GXUAwtwl9mw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qjh1m63n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 21:45:40 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Tue, 14 Oct 2025 21:45:40 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Tue, 14 Oct 2025 21:45:39 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] meta/conf/licenses.conf: map SMAIL_GPL to SMAIL-GPL
Date: Wed, 15 Oct 2025 12:45:38 +0800
Message-ID: <20251015044538.165792-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE1MDAzMiBTYWx0ZWRfXyDnhUXJzm+JG
 ns2UZjlc/g/EF9ZCtrmc7TdcxmA4n9siMsj1txiOxJ7u3pw8PXP/hDBqw/06HRq0m2KGiEDK+7i
 KNQ951JYU8QwDcRGzqZDDoGTm/hMYQJ5RIzKw+4OLQmtUt1SZ+AybFvike7XW1JXs0v17ftFu0A
 49m0FXK+6czjmdCXUDgGdIPRW20VvSGP48+/4fX9/kxOJQOsfxiu+DjMaNvQTF29wDhdZPcxedO
 o2GPqSf2G+/zQ2FHI0JuJLdFo4cfCrJhRMtgvOmJTxSkNlgYxSBY881sKlEtFlVTBw4x+Sc0UKu
 mJHUq9CZlNELKwx3bwn7MMDfxt9lwotIjwt/vSUZ3GDYQ5fhKxjGAfPMHIaDW+iWBEFMdyX4s/C
 3PkjU1YWRXhUXrxbVQdfZVSKwswOwA==
X-Proofpoint-GUID: zss2rhO65eo_P0rObnIDkU5njbOQWz8r
X-Proofpoint-ORIG-GUID: zss2rhO65eo_P0rObnIDkU5njbOQWz8r
X-Authority-Analysis: v=2.4 cv=aetsXBot c=1 sm=1 tr=0 ts=68ef26f4 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=24AZYWMyAAAA:8 a=t7CeM3EgAAAA:8
 a=1nysHJKwsP5XtbFjZFQA:9 a=hnFJTlL2HUoA:10 a=bG88sKzkDEFeXWNnvthB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510150032
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 04:45:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224876

The short identifier of SMAIL General Public License in SPDX is SMAIL-GPL [1]

[1] https://spdx.org/licenses/SMAIL-GPL.html

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/conf/licenses.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
index dcb499c3f3..c2feec781c 100644
--- a/meta/conf/licenses.conf
+++ b/meta/conf/licenses.conf
@@ -114,6 +114,9 @@ SPDXLICENSEMAP[vim] = "Vim"
 # Silicon Graphics variations
 SPDXLICENSEMAP[SGIv1] = "SGI-OpenGL"
 
+# SMAIL General Public License
+SPDXLICENSEMAP[SMAIL_GPL] = "SMAIL-GPL"
+
 # Additional license directories. Add your custom licenses directories this path.
 # LICENSE_PATH += "${COREBASE}/custom-licenses"
 
-- 
2.34.1


