Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CA42CAC5A7
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 08:27:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.7921.1758702449278640717
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Sep 2025 01:27:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Bl8SHL7+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1362f596f5=yogita.urade@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58O5qD3p387470
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 08:27:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=9Grn4OM/gY4IC/7GVvgS3TlGAliqXPAaOeH5iesIS/U=; b=Bl8SHL7+KfXc
	CfT67YXL+VjzNd0N0pH8yE+GRZH1+klLBtx7MDHqff6+LF3sYTsIr0Fq42B/hi4I
	yvWPCl4bwRe4AHtXAia9t0S2Mt+5cIuIZV6YRCFTCy2L93dc7C33f9zTzX7tR/qQ
	TD1DaF+aE8y9z3zuUZcyMQHzBqWAQUBHgFh8BGcgIfqUVUcqPYQ7db9GikB/j5m+
	wPlbk0f+qnuh0jHLqXFhPaYjHdgNKrTCxQ1T9bQpjFvOq4mKuaI0nR+puOFTqs1U
	+pjnGxDwCiY9iK2RAKHXYptkmOzPpdET4jRzG+yOGzY8S+ADg2kFRfv4z99a7n3v
	yddtFID/eQ==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 499hg1mj6f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 08:27:28 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Wed, 24 Sep 2025 01:27:27 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][walnascar][PATCH 3/3] expat: upgrade to 2.7.2
Date: Wed, 24 Sep 2025 13:56:57 +0530
Message-ID: <20250924082657.3624748-3-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250924082657.3624748-1-yogita.urade@windriver.com>
References: <20250924082657.3624748-1-yogita.urade@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (10.11.224.121) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Proofpoint-GUID: rnXCVd4VGP947UglmLALILlOzxKSyAjT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI0MDA3MCBTYWx0ZWRfX1qeQmxum84X3
 B+PjaXDFQ1EiTzjzy6ILDdyeYh5KeVPGSq5/O149jVzYZ6dMMJ/e2GDJgvA58fT1QAdgDQe3StN
 ZLvHTmczvw2b/BD00MoPWYe39bIli/ZhbHEJG8FQO56jNsv552v2nMVqnJteBVEJkgHxSy4ZaI6
 Fnm8aU3vrgvou3cNBXHIvnNADgiWTef4OBTLYc1S9+TI4ylnPSelLVVO2Ap6R4oUBOz1ZUPQljr
 odafEg0DbAa8tKZ/+xagJVymgWKJKDiJKmTRsZo/sgBlxY//MpsMQoU5c43mMDUI+DJFM8+Sbb7
 yd7/wfwNCA8VOofGaEr433/nsH5qigsV8SD0gVylH2VtiOvvRSi579dtFBCbuM=
X-Authority-Analysis: v=2.4 cv=Yfi95xRf c=1 sm=1 tr=0 ts=68d3ab70 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=7CQSdrXTAAAA:8
 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8 a=hG7ARYT_sjMVYlF6uHcA:9
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: rnXCVd4VGP947UglmLALILlOzxKSyAjT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_02,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 08:27:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223952

From: Ross Burton <ross.burton@arm.com>

Primarily to fix CVE-2025-59375 (Disallow use of disproportional amounts
of dynamic memory from within an Expat parser) but the full list of
changes are available:

https://github.com/libexpat/libexpat/blob/R_2_7_2/expat/Changes

(From OE-Core rev: fbe5f76ba6af0983cd90a05d4077e453e2ebb475)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 meta/recipes-core/expat/{expat_2.7.1.bb => expat_2.7.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/expat/{expat_2.7.1.bb => expat_2.7.2.bb} (92%)

diff --git a/meta/recipes-core/expat/expat_2.7.1.bb b/meta/recipes-core/expat/expat_2.7.2.bb
similarity index 92%
rename from meta/recipes-core/expat/expat_2.7.1.bb
rename to meta/recipes-core/expat/expat_2.7.2.bb
index 2da1532922..952235d7a0 100644
--- a/meta/recipes-core/expat/expat_2.7.1.bb
+++ b/meta/recipes-core/expat/expat_2.7.2.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/R_(?P<pver>.+)"
 
-SRC_URI[sha256sum] = "45c98ae1e9b5127325d25186cf8c511fa814078e9efeae7987a574b482b79b3d"
+SRC_URI[sha256sum] = "976f6c2d358953c22398d64cd93790ba5abc62e02a1bbc204a3a264adea149b8"
 
 EXTRA_OECMAKE:class-native += "-DEXPAT_BUILD_DOCS=OFF"
 
-- 
2.40.0


