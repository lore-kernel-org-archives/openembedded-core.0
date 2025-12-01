Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B8F9D116E2
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 08:07:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16579.1764576472545953299
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Dec 2025 00:07:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=oYwK+Ymm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4430d93b62=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B148rLx1875474
	for <openembedded-core@lists.openembedded.org>; Mon, 1 Dec 2025 08:07:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=2Hb9jkOtZMFro9/vXWrSJ02kzDqKGvNPHfYJCT/J/Mk=; b=oYwK+YmmaQzQ
	VcPR6/sgBvB6fkPH1aXx+7iXKpRl5IiKVZhXKgSXxWeqYvnrl1UJsTbSyugNwi3N
	+vk2UygBKCRqa/w4hQQom9DUEnZvIRA5s+8sUiMd7YlAc/UYdtaAUFJQY8WYttRW
	AdCZEoj+2FBQ04YxlbJ1/ymh+F2niWAOvMweMbeAuSjLLIaKx32S1rTV6iCm6Qb+
	kh3EA5YZj2NwfWTFW2g3EPPirc6tGU67LrgUUks55KVV211uW/B9H3ZrRPVpPZwF
	mn63vi+Pj6GKR5lsHxd2WWExNwUd8Y3zHgD+GmLJGMq9W4S+dr+yNhproNQ2HbvF
	+3+QjqaCrA==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqqt69jh1-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 08:07:51 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 1 Dec 2025 00:07:49 -0800
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 1 Dec 2025 00:07:49 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] git: 2.51.2 -> 2.52.0
Date: Mon, 1 Dec 2025 00:07:49 -0800
Message-ID: <9c885332ab0968d45366dcc487c7ea5710f78954.1764576433.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1764576433.git.liezhi.yang@windriver.com>
References: <cover.1764576433.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDA2NCBTYWx0ZWRfX3yU8bmKh4f1T
 cPryENopiXphohevpfmt9bU2gdrwHjTlzh/GuH8OinF5DpDnpcKINVSYr3K5ZtbVjswsVqUmPHK
 6uRHuQys+sKEPALtS9t0sK2aQ9GNcUSsBK3EWULjn5hZJmy86uXOJP/tNTteiuDZG6UfOt2V6KX
 wOtMkk1LYXBhsHLzX8YlyRRrwT6zhPw/W9wiD5VEH/iPVAyBB3FG8wkkhBZIXZQarN0AoekgXuX
 Mn44LLGMyNv0//sWEc5zo5BJemdoS4UKt/77eMZIZLKZJV0EuxVRjDI1aZZOXYncEwvS1lrGTrq
 Hl6EqQW0tTi1n9fveukgJzloLYpRqtnT88L9kBAGdK65gxtgG2GL+wRMKDvFf7WQLvfxKvwb1JA
 O8zL2Jq3HRUm+V0ypamp3cOSQF60oA==
X-Authority-Analysis: v=2.4 cv=Adq83nXG c=1 sm=1 tr=0 ts=692d4cd7 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=kP8cXfqgbZGvQaP_GYIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 9DUgvvED6zbQDx9PT9nj4gyBXlp9aunb
X-Proofpoint-GUID: 9DUgvvED6zbQDx9PT9nj4gyBXlp9aunb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010064
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 08:07:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227118

From: Robert Yang <liezhi.yang@windriver.com>

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/git/{git_2.51.2.bb => git_2.52.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.51.2.bb => git_2.52.0.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.51.2.bb b/meta/recipes-devtools/git/git_2.52.0.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.51.2.bb
rename to meta/recipes-devtools/git/git_2.52.0.bb
index 14d5a3d60e..7312da9cfc 100644
--- a/meta/recipes-devtools/git/git_2.51.2.bb
+++ b/meta/recipes-devtools/git/git_2.52.0.bb
@@ -170,4 +170,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "9b44c2b337ec838e10aad42439d390963904449710d30c9e7e4ba449f45da98f"
+SRC_URI[tarball.sha256sum] = "6880cb1e737e26f81cf7db9957ab2b5bb2aa1490d87619480b860816e0c10c32"
-- 
2.49.0


