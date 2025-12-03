Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C63BD116F3
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 08:24:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10181.1764750250481576239
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 00:24:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=tC4OakOk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=443253538a=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B37wpMv2809790
	for <openembedded-core@lists.openembedded.org>; Wed, 3 Dec 2025 08:24:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=Kwrz2GKxSwpo0NXi+n7Dao8GlF18Wz33i3duUjtPOAs=; b=tC4OakOkXRDY
	/JsFl+GMCoKSSyRkj0zgyvUO2zchL8QXQi2pL0ZtEdouhOG1adfpVwHA0HhA002b
	+k4nOo9nKYdrdNDTpUVLFoxRYktr7K+f+MItdoN4J4wRderPuNjRt3QEOMY6krFt
	MUF1etuF8V1y/Pa6d4oHzlUEBshlH/z/xWH/ciwmsDXGa2CDb6XtwgLzvTlgmj8D
	/N2nTySilcnWsIJ2jBea/IlPODUn8oNa8fqQ63+r6B8lfcrvzzayX6MCJDwPZkQ2
	ssnv+SjARks6rxp+40ty/TcXqSC9h7U7K47HklgvGOul/jp5NCeZ2TamYvvLp+ee
	0GBKMUh6Bg==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqqt6ckeb-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 08:24:09 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 3 Dec 2025 00:24:07 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 3 Dec 2025 00:24:06 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 3/3] man-pages: 6.15 -> 6.16
Date: Wed, 3 Dec 2025 16:24:04 +0800
Message-ID: <20251203082404.2732162-3-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251203082404.2732162-1-hongxu.jia@windriver.com>
References: <20251203082404.2732162-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA2NSBTYWx0ZWRfX/CGiNo3vDnqK
 bAZaWdsYBJqk9HOryJxvw8znvC43oGfrRwajvLUmJtsHgJwNAjnFzxgJcad73wnwN38Jp5iczO5
 BMW/vZyIklTZXEvR3i52SvjTgvinAqrOYyrhn0VrsKTUBeTuKyygndyTb/NKjM3mzP/6ygcshPL
 dmi+8lPpO7Dy1f+dyBO0/9HwJaW7HZQZisQk8iYnUwRRRkvXlEQVOZsLLLn9Htp/ixuf7WF1R89
 iBMZkCI97s2l3UjR1cnP8GGj4LsfLr1hq3+RnO7L+BkPiilNKwIvtKRIi+QHI5AJhVEtmPBLnWy
 KfR7WM/kKsR5aHg9qVjrbndR0ENHYXqMKKWnZziCx3dyJHKkRaSokQjlZdsOfoardk8EAt9C1a1
 7qGJmZB57yVaPHBnKZn+cbUBiB82lw==
X-Authority-Analysis: v=2.4 cv=Adq83nXG c=1 sm=1 tr=0 ts=692ff3a9 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8
 a=_-H6t2il2ivus2xx9XcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: NOxv_q4F3nNlOc7RGiTc4lJNv-h8Mjws
X-Proofpoint-GUID: NOxv_q4F3nNlOc7RGiTc4lJNv-h8Mjws
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-02_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030065
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 08:24:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227205

See https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/tree/Changes?h=man-pages-6.16
for changelog

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../man-pages/{man-pages_6.15.bb => man-pages_6.16.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/man-pages/{man-pages_6.15.bb => man-pages_6.16.bb} (96%)

diff --git a/meta/recipes-extended/man-pages/man-pages_6.15.bb b/meta/recipes-extended/man-pages/man-pages_6.16.bb
similarity index 96%
rename from meta/recipes-extended/man-pages/man-pages_6.15.bb
rename to meta/recipes-extended/man-pages/man-pages_6.16.bb
index f01867d0f9..5bd79c0425 100644
--- a/meta/recipes-extended/man-pages/man-pages_6.15.bb
+++ b/meta/recipes-extended/man-pages/man-pages_6.16.bb
@@ -20,7 +20,7 @@ LIC_FILES_CHKSUM = "file://README;md5=c2d6fa1a74bdd79c25de6f4db7332294 \
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz \
            "
 
-SRC_URI[sha256sum] = "f0ede747b98732cb6d5bd36e9ab54101ea7ae5f78a8b8d7289ced01c1a6ec937"
+SRC_URI[sha256sum] = "cfdc7c1d571fa40b1f31b68704e59c0c516ab85b53ebf537c8c8ec1f3b67b974"
 
 inherit manpages lib_package
 
-- 
2.34.1


