Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7BF3ECAAA1
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 13:30:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.6439.1666877436710060879
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Oct 2022 06:30:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=N45uO/lM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7299a514d3=narpat.mali@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 29RCnfYR021871
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 13:30:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=H31HSaT/5zPYGKjbC2h9z7cJoJJ37hUofb3NQmZ1dnI=;
 b=N45uO/lMFfKpRH9m/NBdv974ZlkcFHnzr9J7CUfkZVwQb53uAYXZrLW1yuDVEnEuXjxj
 wLDSYo0mkCjLc4XWHkUuLCQDqaRiu6ueMJLcZMnz2D7aGEsw1S0ssOkkkcDmpiK+egFv
 eLftcvK48LdD5gj6s6D3WEmcZ4hFpshKIkGtTp/RWaywzmSPG+cJqinwrX6PSIis8oBX
 JvX+YIBS/DqUEISzeSLbKaddKKNfPXbdWY4WwbSqMwdH7v6C0W5EFrPOVAxTB+vQ3E5K
 3EQrkYLZ4eodlYq0ngzWLlT0SqrEQ0ZV+NAh0fcgoLZpt8b56/4LoZkrhLAI2eecrHUE rA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kfg56gdpw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 13:30:35 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29RDT3mB028524
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 13:30:35 GMT
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kfg56gdpr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 27 Oct 2022 13:30:35 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 27 Oct 2022 06:30:32 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 27 Oct 2022 06:30:30 -0700
From: Narpat Mali <narpat.mali@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <archana.polampalli@windriver.com>, <hari.gpillai@windriver.com>,
        "Narpat
 Mali" <narpat.mali@windriver.com>,
        Wang Mingyu <wangmy@fujitsu.com>,
        "Alexandre Belloni" <alexandre.belloni@bootlin.com>
Subject: [OE-core][kirkstone][PATCH 1/1] python3-mako: upgrade 1.2.1 -> 1.2.2
Date: Thu, 27 Oct 2022 13:29:04 +0000
Message-ID: <20221027132904.1998146-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 1_NqR0BvZbkhWsMfJlsrW64qsvBWRbRu
X-Proofpoint-ORIG-GUID: o1S3DTHHOF6boqF40I4XRKPjxknpgz2e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-27_06,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 phishscore=0 malwarescore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210270072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 13:30:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172193

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Upstream master commit:
https://git.openembedded.org/openembedded-core/commit/?id=10f9720a7fe1d25efce6a0ea0dec0052bb0f92c1

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 .../python/{python3-mako_1.2.1.bb => python3-mako_1.2.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-mako_1.2.1.bb => python3-mako_1.2.2.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-mako_1.2.1.bb b/meta/recipes-devtools/python/python3-mako_1.2.2.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-mako_1.2.1.bb
rename to meta/recipes-devtools/python/python3-mako_1.2.2.bb
index 8155c37984..e3774ee621 100644
--- a/meta/recipes-devtools/python/python3-mako_1.2.1.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.2.2.bb
@@ -8,7 +8,7 @@ PYPI_PACKAGE = "Mako"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "f054a5ff4743492f1aa9ecc47172cb33b42b9d993cffcc146c9de17e717b0307"
+SRC_URI[sha256sum] = "3724869b363ba630a272a5f89f68c070352137b8fd1757650017b7e06fda163f"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-html \
                   ${PYTHON_PN}-markupsafe \
-- 
2.34.1


