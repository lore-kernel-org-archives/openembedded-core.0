Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C42CCC4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 10:42:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.20042.1702032154175830046
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 02:42:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Mqq+YX49;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0706c213ee=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3B8A7Ita005029
	for <openembedded-core@lists.openembedded.org>; Fri, 8 Dec 2023 02:42:33 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=QLW4d
	EV9QxGF6tCbLWqe9JvKnSxShpOkcHj4qo1A1kQ=; b=Mqq+YX49XCXbqkouSkVTG
	X+b/1pTKFzDVma83kOK+DbragP5FQvDgwOv/YWtufi/vdqG+b15tvr2HSMqDgzhz
	Lxaz/hAMQcffcmHn+2dREpMq8+RZcZ8MnTiGzNZiSji9bsCd8Didx+iLkEBa3TBw
	kf9cu7JWmoI2ASDd9wdDEtpHu9ZQJM1JN9FrRT9TsFydf5ATrBiO636RfKdgAR4Q
	uNhXd54VHE35/lqVjfq/Q7OullgIxeQY9qZYvpdse3NrsVBo1wQKvhFYsKQEunG5
	+fZ9tHNLcuzlrKggSYafvOLt1lPl2Cag59dSmm6niqzgixFu1CeYmzh9gG3NHIQ5
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3utd2rtpuu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 02:42:33 -0800 (PST)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 02:42:35 -0800
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH v2 1/1] go: ignore CVE-2023-45283 and CVE-2023-45284
Date: Fri, 8 Dec 2023 10:42:15 +0000
Message-ID: <20231208104215.1425474-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: oEIMAEOddC9O6ZEUI6_lx9vW1vxZXqY0
X-Proofpoint-ORIG-GUID: oEIMAEOddC9O6ZEUI6_lx9vW1vxZXqY0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxlogscore=569
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312080088
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 10:42:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192038

From: Soumya Sambu <soumya.sambu@windriver.com>

These CVEs affect path handling on Windows.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-45283
https://nvd.nist.gov/vuln/detail/CVE-2023-45284

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 meta/recipes-devtools/go/go-1.20.10.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/go/go-1.20.10.inc b/meta/recipes-devtools/go/go-1.20.10.inc
index 39509ed986..0c0a736084 100644
--- a/meta/recipes-devtools/go/go-1.20.10.inc
+++ b/meta/recipes-devtools/go/go-1.20.10.inc
@@ -16,3 +16,6 @@ SRC_URI += "\
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
 "
 SRC_URI[main.sha256sum] = "72d2f51805c47150066c103754c75fddb2c19d48c9219fa33d1e46696c841dbb"
+
+CVE_STATUS[CVE-2023-45283] = "not-applicable-platform: Issue only applies on Windows"
+CVE_STATUS[CVE-2023-45284] = "not-applicable-platform: Issue only applies on Windows"
-- 
2.40.0


