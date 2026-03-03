Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26A02E67A81
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 06:57:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12740.1772521021498467658
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 22:57:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=H0z9DmPa;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75229269e5=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6234OFr11485837
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Mar 2026 06:57:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=NgwXcCeVAbFxHEJhtDQhAkxBOkvoslfF3vuHX5Hi+YI=; b=H0z9DmPa6amm
	FkoOaEvwCroT6QV/+xGehe4hJk3CzadugZbZfaUG5tQQcaXtYORQhDEgp/HVJ3u/
	eBJmb3Y4x0aEr3sxdcJYB6I3SS6CdY+wzgKxsaVbWETxiTCaZlntOy6T08KB4vU7
	uomcIFWpAS/qU0gzSA3TLinWOJmuygOYEQLYvlHltd4mG+HmTMlMoqTad6XEBoeq
	A2s8iHIVnzvAkmGygwLWX86+GVpxj8c83BEijHkqX9kIsRO9NUwMveaOmG7BiXEH
	b26EdSsAUy1IC36Sth/K5wxZPXPVv2KCFW6qdm7FDEmzi8dxLwjdys0Q81CyNGCg
	Oj/WwnREjg==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckqb4kacs-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 06:57:00 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 2 Mar 2026 22:56:59 -0800
Received: from pek-lpg-core5.wrs.com (128.224.153.45) by
 ala-exchng01.corp.ad.wrs.com (10.11.232.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 2 Mar 2026 22:56:59 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 18/19] python3-xmltodict: upgrade 1.0.2 -> 1.0.3
Date: Tue, 3 Mar 2026 14:56:39 +0800
Message-ID: <20260303065640.2541884-18-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260303065640.2541884-1-hongxu.jia@windriver.com>
References: <20260303065640.2541884-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=LqWfC3dc c=1 sm=1 tr=0 ts=69a6863c cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=5wxhYDCCAAAA:20 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=XXpey8JK7ZR_-O65XjQA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: OcWgTG7a2e2sAi-ykYAZ3D4QvDJXnEcd
X-Proofpoint-ORIG-GUID: OcWgTG7a2e2sAi-ykYAZ3D4QvDJXnEcd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA0NyBTYWx0ZWRfX89a41lS1VPhv
 bDeKRpW3WWFcCULfOYXj+9y6gq7NRT5SoK+l5ODNA9Uo+dSfs7W5ae13mLX+DDGbmRw6Zbnqa28
 rYRQESkNqXp6Um0R5w1DlLqOFtlUJjoGTfb5VDzsVUq7AOX4RhU70HyTxhyADp9LB9fPaXn/dbx
 0yRnxpJ6/Uw89+d4qQeK8MeVqPuYPiMnULA/BuGZcHgrq6aFeN60NeQMrkqVj2lg7Bz00bFG0pX
 IGhLqSXprFNqtcfzaBV/5Az6r42o2X3hFwEDlZu64J/Yf3elOjFlBiYhXkeDD728aA4NybS4OKi
 cJA1B/KlAVUMoyW9ReVo9mnp7ObIsxZADVHLbdHNI+E3nad1tkUjz5W0txhbBWlrXEuZ6Azjd5W
 bi7BWefDJuu8kwMkOziZz/Y+ZXTfNYwJpLS0hna+Z0Xc4Nvnz7EgOU582wygVzgYSv0GvhaI/V/
 P0xucEpGnJ1OEdezoFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030047
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 06:57:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232256

Release notes[1]:

Bug Fixes

- unparse: serialize None text/attrs as empty values (fixes #401) (aa16511)

Documentation

- readme: fix Fedora and Arch package links (fd6a73b)

[1] https://github.com/martinblech/xmltodict/releases/tag/v1.0.3

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../{python3-xmltodict_1.0.2.bb => python3-xmltodict_1.0.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-xmltodict_1.0.2.bb => python3-xmltodict_1.0.3.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-xmltodict_1.0.2.bb b/meta/recipes-devtools/python/python3-xmltodict_1.0.3.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-xmltodict_1.0.2.bb
rename to meta/recipes-devtools/python/python3-xmltodict_1.0.3.bb
index e58e32e338..693549b9c8 100644
--- a/meta/recipes-devtools/python/python3-xmltodict_1.0.2.bb
+++ b/meta/recipes-devtools/python/python3-xmltodict_1.0.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/martinblech/xmltodict"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=01441d50dc74476db58a41ac10cb9fa2"
 
-SRC_URI[sha256sum] = "54306780b7c2175a3967cad1db92f218207e5bc1aba697d887807c0fb68b7649"
+SRC_URI[sha256sum] = "3bf1f49c7836df34cf6d9cc7e690c4351f7dfff2ab0b8a1988bba4a9b9474909"
 
 PYPI_PACKAGE = "xmltodict"
 
-- 
2.34.1


