Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 496AEE67A85
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 06:57:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12826.1772521018522412834
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 22:56:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=U/6Lx3DM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75229269e5=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6235kLNC3951847
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Mar 2026 22:56:58 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=pBUk8KM7coAG4/xWW/i1hfJnnyBvKJrL6du2Pm6Im/E=; b=U/6Lx3DMWDBY
	CYplaq9Qr3b5KJrGXd7UYaqCnUczhAFmLgNLzrq3sX/wP3hA8KswXL/umW2VoxP/
	KAXUSqRHzcTc7LA0ZPQz2yrx13gebQ9u1dMUrvL84x2mOIY8dkX0EccViMBSbsiA
	NnjQUe2UvfDFmNuHr8YhbneMqJO7Z1tw7/p1ieiHcm1eWidEt02xPvF/ADFbKeqm
	xNUcRUX3gzvd8FE2rPMywWy4Cec7CCXkqbHaAEXdyRt64MF4ta3D9OWEKCNTipAe
	muExw5LVNQpo2n6YYTrNe4yRLlOT/gs51DxNFp7ATAHL0uPoXV1vZwfYuu2NAl4J
	j4h10plr0w==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckvh430b7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 22:56:58 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 2 Mar 2026 22:56:57 -0800
Received: from pek-lpg-core5.wrs.com (128.224.153.45) by
 ala-exchng01.corp.ad.wrs.com (10.11.232.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 2 Mar 2026 22:56:57 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 16/19] python3-trove-classifiers: upgrade 2025.12.1.14 -> 2026.1.14.14
Date: Tue, 3 Mar 2026 14:56:37 +0800
Message-ID: <20260303065640.2541884-16-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260303065640.2541884-1-hongxu.jia@windriver.com>
References: <20260303065640.2541884-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: WG1WUJHG2kJvh1VKqky7icUyqHKTM0dA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA0NyBTYWx0ZWRfX5qClB9SExmUB
 PIMrSHAVJcb6DFc7dw+65AfUWdLsuRRdJhOkImAt5LdUM1nmJ3Ji2FRsXydg7zxAEMo3VS3pHDm
 5qSSd+qnNu5ReePjkC4CFbd4n0dXYzqs/gROGXfvH0/7TEoxB1Dnb4BYrmsDaKmLPBC5ZPrnipk
 YIM/3CfFIVS8REEofnDIb/MlPWTcowwE1NJ7oNQo3xs4v8KAHZEx5GBm9B7SeVzLAGFvaxxQfln
 cYFh3wLGaquVWzkzx8NnSxftNLj07mA+wfiPaP2DDhfmjRNNXzbjDwmBQz+R3gc6WMhB9itHwoc
 nw5i/ss+PtN9qFZSJrosT00U3lMhBOvZ6IDg3+XDMND9vYxdAY9fIGek53XvWx37XA45qw4JVbV
 EKqZ35a82f+u8LqMUGipemNpKweupwfy5qj0S7v/MSLo1hOu6CAflfBAhEO8vkCJzv/UWMyXDPU
 bjTxEa16/P1WCLkmyLA==
X-Proofpoint-GUID: WG1WUJHG2kJvh1VKqky7icUyqHKTM0dA
X-Authority-Analysis: v=2.4 cv=Z/3h3XRA c=1 sm=1 tr=0 ts=69a6863a cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=H-e_mD_7AAAA:20 a=NEAV23lmAAAA:8 a=w_pzkKWiAAAA:8
 a=t7CeM3EgAAAA:8 a=xrui9_tqa_Jtow1gqS0A:9 a=sRI3_1zDfAgwuvI8zelB:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030047
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 06:57:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232253

Rlease notes[1]:

Update __init__.py to add Cygwin as a classifier (#232)

Add "Environment :: Cygwin (MS Windows)" as a classifier as some modules,
such as mine, work on Windows but only via the Cygwin POSIX layer (www.cygwin.com)

[1] https://github.com/pypa/trove-classifiers/releases/tag/2026.1.14.14

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...025.12.1.14.bb => python3-trove-classifiers_2026.1.14.14.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2025.12.1.14.bb => python3-trove-classifiers_2026.1.14.14.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2025.12.1.14.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2026.1.14.14.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2025.12.1.14.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2026.1.14.14.bb
index 5ca8ff24c0..c334fdfc72 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2025.12.1.14.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2026.1.14.14.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "a74f0400524fc83620a9be74a07074b5cbe7594fd4d97fd4c2bfde625fdc1633"
+SRC_URI[sha256sum] = "00492545a1402b09d4858605ba190ea33243d361e2b01c9c296ce06b5c3325f3"
 
 PYPI_PACKAGE = "trove_classifiers"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.34.1


