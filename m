Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A75C0CEACEF
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 06:37:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3725.1763361432410332377
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Nov 2025 22:37:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=K+dn4tV+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=34165bd6f8=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH3xCAt1234247
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Nov 2025 22:37:12 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=2A89kb/evkSsZViirCZADtJ/8bSlmZoDj2JUj1dVuuw=; b=K+dn4tV+Auvz
	IrMOyIBFw0Io3I8n3om6MV5eYjxTSAHH9KaLjQa28kwWusgMDuFF3MzaH5wNyHrl
	zJ2mwUJaOmCqgIT6qYFHT/L3wZIj5t4QF15IDAihtgVY5LyhhxZqlBcpU508Yku9
	CEC0+Uut1sx02+YRiQubeQnnV+YeE5euXZhKOg5IdGg9eRaM8KO/4A5mooIk5+dL
	RRJRscqQwRRA+UEq6AYgntFlobZqMRu1AksCvTlktfu45B7vsvGdswaQnCDyQnVr
	YlOD5y5PX983P7qWgMjxx3bjkB5i9fknmN7lof01VFWHOidlb38yNoWOaZaD5SoJ
	BqjRC3mKGg==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aenp2sewm-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Nov 2025 22:37:12 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 16 Nov 2025 22:37:10 -0800
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 16 Nov 2025 22:37:10 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 4/4] ccache: 4.12 -> 4.12.1
Date: Sun, 16 Nov 2025 22:37:10 -0800
Message-ID: <29c0aa3d3a6bb6a6e035c18ce237ba49e4247b5a.1763361341.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1763361341.git.liezhi.yang@windriver.com>
References: <cover.1763361341.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA1NCBTYWx0ZWRfX1KV4gEpGiwnw
 LHrLi3M7X8z+Q+vMzwqO9KaPiOblhs/FWEdORrqDCnkmb+a/SwxqZU466V6uranbIpFZG36Al/A
 niB4+8KLYNzwHUAW6xVMHEviwbCvwwJNJRBfuSDOknOvN8dzzKL17kK2TC6hCXD1eqKL+tmolRQ
 F4RWk09u+jyt7zyns5SLhzSUmT8koOlaG4QQhvwLB7cxJ+DoLi4iTtjfg0oSahmxvDTOZTjyZ8/
 +gWvyTveYmKXvNeqYssdENS1jIKLj8czF4KKsgiQKzq2tU9OcjlOap3c+upwFrgvvlxehriD7cI
 uiO8z9U49D+0rY9BFIzh3akZHdXDwL+CpImQ2ePuNLRpQ7nyEG0y3VIQKQVUWh7iEmcV45CRXSP
 iY5q4Rb/kRJUa/RuuJcPNGqnIHJ/5g==
X-Proofpoint-ORIG-GUID: Dd4JFJGLPpuH3eLJJXd2hgip4yjVbyDW
X-Proofpoint-GUID: Dd4JFJGLPpuH3eLJJXd2hgip4yjVbyDW
X-Authority-Analysis: v=2.4 cv=Z6Xh3XRA c=1 sm=1 tr=0 ts=691ac298 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=_oZx6ZWeX5riQa6SjBIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511170054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Nov 2025 06:37:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226483

From: Robert Yang <liezhi.yang@windriver.com>

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../ccache/{ccache_4.12.bb => ccache_4.12.1.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ccache/{ccache_4.12.bb => ccache_4.12.1.bb} (93%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.12.bb b/meta/recipes-devtools/ccache/ccache_4.12.1.bb
similarity index 93%
rename from meta/recipes-devtools/ccache/ccache_4.12.bb
rename to meta/recipes-devtools/ccache/ccache_4.12.1.bb
index 52643c4bff..2d0b83e244 100644
--- a/meta/recipes-devtools/ccache/ccache_4.12.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.12.1.bb
@@ -17,7 +17,7 @@ DEPENDS = "zstd fmt xxhash"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "e884c62cbacae2e9488b8641a671a79fb7a1221db01310dacef61c9e55c2e55b"
+SRC_URI[sha256sum] = "a3da50ab0fb0d42f60c17d1450312e6ace9b681f6221cb77c8a09a845f9d760c"
 
 inherit cmake github-releases
 
-- 
2.49.0


