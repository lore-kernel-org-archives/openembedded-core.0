Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9C04CDB47E
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 04:43:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.47949.1697776979145332803
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 21:42:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=kkJRZ9cB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=86573ca7bc=yogita.urade@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39K4fSqd031712
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 04:42:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=IdGwvuUuiJ5PPp+sKyE9oLftKE9U3OHWOCZrBdT9yao=; b=
	kkJRZ9cBFq/8JIR3CNP7TW0l+Dtzhzpdp3vLw1du8+HBT+PVK6oB+s4R2hxyVw0x
	KhFwA9DmbszTs1jwlskzcDjCZhKcRGR/VjH1ZaOD9cFNzEvV8ifRG8FxJfSclkwd
	eYnuXM27bJ7B9uBkZ3kgK65zp/r9SZFPOGXJNNDtjGAolr52RnfxcPH9LU1xToOA
	CIgWQXPDoXVbTettyEC9+z43h1LnQ0hptu+2YvEvXbPX+Vux7xuDRVcdOn3s1Ojc
	jmHIKqkhXUUC6sXTHHddLma2XBInUbtexqw9g6Vv1A3qqDA7/ZPKFvw0rWoH2/Al
	KJUeeXmnRkO+izN4NYZncw==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tuevt854w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 04:42:57 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 19 Oct 2023 21:42:55 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][mickledore][PATCH 1/1] libx11: upgrade to 1.8.7
Date: Fri, 20 Oct 2023 04:42:35 +0000
Message-ID: <20231020044235.1168292-2-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231020044235.1168292-1-yogita.urade@windriver.com>
References: <20231020044235.1168292-1-yogita.urade@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: 0jrB5BzOw-9F0ObOrXP-9vVYg8KgLyIH
X-Proofpoint-GUID: 0jrB5BzOw-9F0ObOrXP-9vVYg8KgLyIH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-20_02,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 mlxlogscore=557
 adultscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2310170000
 definitions=main-2310200039
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 04:43:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189495

From: Ross Burton <ross.burton@arm.com>

This incorporates fixes for the following CVEs:

- CVE-2023-43785
- CVE-2023-43786
- CVE-2023-43787

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a1534bb34b680bfc5cb2f35b5fd5a0c2afed6368)
Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../xorg-lib/{libx11_1.8.6.bb => libx11_1.8.7.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libx11_1.8.6.bb => libx11_1.8.7.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb b/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb
rename to meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb
index 1cfa56b21e..5f14e62446 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb
@@ -24,7 +24,7 @@ XORG_PN = "libX11"
 
 SRC_URI += "file://disable_tests.patch"
 
-SRC_URI[sha256sum] = "59535b7cc6989ba806a022f7e8533b28c4397b9d86e9d07b6df0c0703fa25cc9"
+SRC_URI[sha256sum] = "05f267468e3c851ae2b5c830bcf74251a90f63f04dd7c709ca94dc155b7e99ee"
 
 inherit gettext
 
-- 
2.40.0


