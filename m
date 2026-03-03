Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AA89E67A71
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 06:57:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12827.1772521018558284840
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 22:56:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=L4HPiazC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75229269e5=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6234sKob1536224
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Mar 2026 06:56:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=YW6thZhDvcdybKjI9u6/0MlUaQH4uIfvoiV9awsCUfQ=; b=L4HPiazC/rLL
	eJFcDIUkR1SZB1T3eEyLL9KX8XajYTxaZghtb5PKT7bVjuL2Aey8IcNW96V0YK6P
	xO16N2krePOgKGULTfGyrKVjrfkwNNQQcnz+SiJYBVjUVh2pTPya203+N/hrOQkI
	lmImAxtAu/Em/vJ1fyJ2liJqD2Tj3IbWEbADp5joj0AcQTic32k+MwncytWKEBSm
	k3xRR/TWO6zOFw/6PM6jw0kWupLekeGLfVowwoZWitRM5q35Yi9j4vqzpsSH/GUA
	p8uEp+BIkByEp4fdQi6SmLw8t+1+Jqg6rzGuoyLdOOX4w/IsN0Q5/uMud/lz+Gdy
	5R23SVHi0w==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckqb4kack-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 06:56:57 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 2 Mar 2026 22:56:56 -0800
Received: from pek-lpg-core5.wrs.com (128.224.153.45) by
 ala-exchng01.corp.ad.wrs.com (10.11.232.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 2 Mar 2026 22:56:56 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 15/19] python3-testtools: upgrade 2.8.2 -> 2.8.3
Date: Tue, 3 Mar 2026 14:56:36 +0800
Message-ID: <20260303065640.2541884-15-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260303065640.2541884-1-hongxu.jia@windriver.com>
References: <20260303065640.2541884-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=LqWfC3dc c=1 sm=1 tr=0 ts=69a68639 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=G-hLyS9GAAAA:20 a=t7CeM3EgAAAA:8
 a=0xgr8_qDQ0ojGbUI06AA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: Djd2fMkxMx7Ckk62K-rlBu9EHduswU58
X-Proofpoint-ORIG-GUID: Djd2fMkxMx7Ckk62K-rlBu9EHduswU58
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA0NyBTYWx0ZWRfX4v2fIpvVc1zc
 3qH8HqIr71ESPawxyAev+9lelVqP/NdYhDde7iRdEoG3zU8PYOKYQPg5USsxx9twRKxvHNLwili
 P+la0Ohblqv6sENdwMcxlh7r+MFhPKe3sKYfnjttYgqeX2vTobH54HKJzxYqZ/OnkzqXiT0lXQi
 eUCDvy2qfej13SVxDBNWmJHt9YHZCY+duNAI8G8PsfKWOyJdCWbloO2GlTEsMjOhV0S++CO9jyi
 XNn+iJJRXdE0X8fYVGuW3l5U5pMqtb/Vzu+Gx5VknpRCeFlXOkqV1s0R1j4EXJvc6IKVDnC/QRC
 APyGwSFJxPmlyCJEEQVIrp8O6wFKXKbyuEfm1N85KzvTxvg8TlKfcLcUtNYzW+Cv65K+jab5O3C
 /lSnFcHQfKKCpLfCz4giaI2SKEDS6fULBoWrVXAJxqGKYu/k0dA+t6+0mdKCwPtccVZtfpHA3SK
 9Gy/4heluVdoGXXi+rw==
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232254

What's Changed [1]

- Support binary contents in FileContains matcher by @jelmer in #553
- Be more lenient to stream=None being passed into TestResult classes by @jelmer in #554
- Support async setUp/tearDown validation with Deferreds by @jelmer in #552
- Bump ruff from 0.14.9 to 0.14.10 by @dependabot[bot] in #555
- Add more typing, reduce size of testtools.compat by @jelmer in #556
- Bump ruff from 0.14.10 to 0.14.11 by @dependabot[bot] in #558
- Add more typing by @jelmer in #559
- Finish typing by @jelmer in #561

[1] https://github.com/testing-cabal/testtools/releases/tag/2.8.3

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../{python3-testtools_2.8.2.bb => python3-testtools_2.8.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-testtools_2.8.2.bb => python3-testtools_2.8.3.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-testtools_2.8.2.bb b/meta/recipes-devtools/python/python3-testtools_2.8.3.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-testtools_2.8.2.bb
rename to meta/recipes-devtools/python/python3-testtools_2.8.3.bb
index c51fac2242..2ac8759784 100644
--- a/meta/recipes-devtools/python/python3-testtools_2.8.2.bb
+++ b/meta/recipes-devtools/python/python3-testtools_2.8.3.bb
@@ -8,7 +8,7 @@ DEPENDS += "python3-hatch-vcs-native"
 
 inherit pypi python_hatchling
 
-SRC_URI[sha256sum] = "b5c73332456ff54152062d47a58bc4f15f8e23514afec4e84775af124fb7db43"
+SRC_URI[sha256sum] = "3b54b543a7583a35f65538b1d36a327fc34943a26bb839bcbe4b2c5e085aa939"
 
 RDEPENDS:${PN} += "\
     python3-compression \
-- 
2.34.1


