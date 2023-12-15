Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EE64C35274
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 13:47:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.62451.1702648049959467035
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 05:47:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hveR/D/C;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=07134bcac9=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BF7RDqc032210
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 13:47:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=vffeNJhw++Y3LED7wGhbDt9FSYd87WB3A0dbsUvpgQU=; b=
	hveR/D/CP2R1JhlCaVXVf81fD+exL9lQliN8dPsRhAj3qQ4fhoxm9j+I9IsR1c5d
	FLLktlmHDHcPYgYB1H62CDiIX3wmlm1iByRQnFL/Hyu+tNf2lDv+UmWzUKecStfF
	LJveobQjG0KHXqf1C5WTQ+m5Kkhl/vlv0DnMCGli0UBl9rzjfEufs/oI8ZCnpjnR
	HDrjLoLBt2uOEdXSvlSyM/FJqimZNypb8lEvWvq1Pw+P53p9jveghII0F9/wrKLb
	gUmJtEsp2s+VRTt5242lfj6EWG1WtBio/0SU10Y5WWxH8R441VaciaFmyJOkLQ0j
	1xC1z5u2gxbyPODD/esvXw==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uyrcqsn7k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 13:47:29 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 05:47:33 -0800
Received: from ala-lpggp3.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 15 Dec 2023 05:47:33 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/1] nfs-utils: Update Upstream-Status
Date: Fri, 15 Dec 2023 05:47:27 -0800
Message-ID: <f98207e75828fc3ab48f27001b1410adc975caec.1702647994.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1702647994.git.liezhi.yang@windriver.com>
References: <cover.1702647994.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: UYMtUfAyAWlsCIgQlKqDUv8fFNCH9FT2
X-Proofpoint-GUID: UYMtUfAyAWlsCIgQlKqDUv8fFNCH9FT2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 adultscore=0 suspectscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 malwarescore=0 mlxlogscore=723 impostorscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312150093
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 13:47:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192433

From: Robert Yang <liezhi.yang@windriver.com>

Update Upstream-Status for 0001-reexport.h-Include-unistd.h-to-compile-with-musl.patch.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../0001-reexport.h-Include-unistd.h-to-compile-with-musl.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-reexport.h-Include-unistd.h-to-compile-with-musl.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-reexport.h-Include-unistd.h-to-compile-with-musl.patch
index 8607b64cb1f..57d4660571f 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-reexport.h-Include-unistd.h-to-compile-with-musl.patch
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-reexport.h-Include-unistd.h-to-compile-with-musl.patch
@@ -9,7 +9,7 @@ reexport.c:62:17: error: implicit declaration of function 'sleep' [-Werror=impli
    62 |                 sleep(1);
 
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://marc.info/?l=linux-nfs&m=170254661824522&w=2]
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 ---
-- 
2.42.0


