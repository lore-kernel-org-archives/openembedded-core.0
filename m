Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55889D111A8
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 08:07:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16578.1764576471888043305
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Dec 2025 00:07:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=mDrYjhbm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4430d93b62=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B148rLw1875474
	for <openembedded-core@lists.openembedded.org>; Mon, 1 Dec 2025 08:07:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=6n6jsBKC9IkhuFR0WX8Xs9jSfGRgLkQ5xUccqPsNeec=; b=mDrYjhbmlPiT
	cFAPbWgsYehwR/aoQKXK+/PlRZvSIukMb5FlfWUUEDfJ2YREbheftCwNvcJSLuln
	lLS6oFIdbEtz8DgoTBly6H79cD8/YSK14YnqYHccJKFVXQPEPLI9x0MJhY6L1Foc
	URS5BQZyP5lHr79jaLCQMLZdqLXdiAFxTXHIGYmxqDbPmF/5zV1xv6tcXZ3gI+W8
	xaGFm7BKc7jxNyYeEVVVsYDMtZcVYnj+eI+Wg2PFNZDCHN1pc4qkdt9xPDOrdgTq
	Qs2JsfeNJMHPx7hZR/lKY06rIl2wgcS3x5QZ2G8MHhK6FhY5RyXvsaAskdlEIRNP
	b7IRW0eiZA==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqqt69jh1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 08:07:50 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 1 Dec 2025 00:07:49 -0800
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 1 Dec 2025 00:07:49 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] ccache: 4.12.1 -> 4.12.2
Date: Mon, 1 Dec 2025 00:07:48 -0800
Message-ID: <fe559be360073d3acd8968f4bafd2e5760d0351f.1764576433.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1764576433.git.liezhi.yang@windriver.com>
References: <cover.1764576433.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDA2NCBTYWx0ZWRfX6OKSxsqU+2E8
 moT43BROXfpLQ1GD2AXxcLiNWuT8AsJ+HYCohewfT2BzCEbTDXot2XiEp+0KFfRfqfvtNM3eg3U
 rgMvfmQusTGs2CBcXM/5Lyfk6XSxF/ALnu5UIvDA5kTFS3xGYYWs/fRryLhQidYOjoWNCNp6hqJ
 Lkt6WYV035Tnvhe15++GIaP94cNgt34tzuwmHp8xXZMpOhHdbQTH7aic3eXhPPUY5gtnjVqTqhU
 qis/kjzsleftiwXL3b9423wIw4kBndauSt2iHAg45TynPziZCtEOhgaUu4v+zyFJ7pBGEDm7Kd3
 IfprlSp3rYcEmd3aXsRQMBpdTJrq7MRaeqKVa2C2tB4pictFrfHN+IS2+VwMHKucwWKr/FHrelp
 BnucsgfdcmExlnlxlQmbj9vSJI9WjQ==
X-Authority-Analysis: v=2.4 cv=Adq83nXG c=1 sm=1 tr=0 ts=692d4cd6 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=_oZx6ZWeX5riQa6SjBIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: XzUitOTJd0tVuxbovAK1WizSYvLDUfgw
X-Proofpoint-GUID: XzUitOTJd0tVuxbovAK1WizSYvLDUfgw
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227117

From: Robert Yang <liezhi.yang@windriver.com>

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../ccache/{ccache_4.12.1.bb => ccache_4.12.2.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ccache/{ccache_4.12.1.bb => ccache_4.12.2.bb} (93%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.12.1.bb b/meta/recipes-devtools/ccache/ccache_4.12.2.bb
similarity index 93%
rename from meta/recipes-devtools/ccache/ccache_4.12.1.bb
rename to meta/recipes-devtools/ccache/ccache_4.12.2.bb
index 2d0b83e244..28f36e5ed7 100644
--- a/meta/recipes-devtools/ccache/ccache_4.12.1.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.12.2.bb
@@ -17,7 +17,7 @@ DEPENDS = "zstd fmt xxhash"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "a3da50ab0fb0d42f60c17d1450312e6ace9b681f6221cb77c8a09a845f9d760c"
+SRC_URI[sha256sum] = "2a087efb66b62d4c66d4eb276748bbfa797ff3bde20adf44c53e5a8b9f3679af"
 
 inherit cmake github-releases
 
-- 
2.49.0


