Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6329C4167B
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 03:36:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.61046.1701660982508321288
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Dec 2023 19:36:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=U3T16sXe;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0702e6dcf2=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3B43WsUW016740
	for <openembedded-core@lists.openembedded.org>; Sun, 3 Dec 2023 19:36:22 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=ypWXM
	UJB6GGlNDKqlMpDZrlCRahpKciVWTHgcnR4/nw=; b=U3T16sXeJkqeBH8QZvKSS
	v4iYAizK4AxibLcOgYaDz4CtdCLyTYd31qSzT6yT3UQhHbUpe300wQiNalgWQuqE
	vIEIAk64O5z+ayKmf5WzzLUX90aVcEJQHWgnFPM2lUJDDRMTB9VmONlWnc4bgBJ3
	TPPUKP4ETOQMFwJ91r6qMlI8Jn43eDQchTqd2K4MuVMmGE5Y+vFu/tSReHtUG0Ps
	7m3HzcsqpPqsBAEGls8PV4mnuOn7AxH04+05/XKjPm2M+CAgyt6FBIw+mUAh8hgB
	CkU4aULUC1hdqSNPes9FaBkdCapPIrqgk9eddAAC4G+WHFh77sy2xmZRdfMklh7w
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ur0r4h2hk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 03 Dec 2023 19:36:21 -0800 (PST)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 3 Dec 2023 19:36:23 -0800
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH 1/1] go: ignore CVE-2023-45283 and CVE-2023-45284
Date: Mon, 4 Dec 2023 03:36:03 +0000
Message-ID: <20231204033603.1720931-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: 6IxBCihr4qxWn8bqW8pZ3ocYfVY0lZ-Q
X-Proofpoint-ORIG-GUID: 6IxBCihr4qxWn8bqW8pZ3ocYfVY0lZ-Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 priorityscore=1501 mlxlogscore=502 adultscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311060001
 definitions=main-2312040025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 03:36:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191720

From: Soumya Sambu <soumya.sambu@windriver.com>

These CVEs affect path handling on Windows.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-45283
https://nvd.nist.gov/vuln/detail/CVE-2023-45284
https://security-tracker.debian.org/tracker/CVE-2023-45283
https://security-tracker.debian.org/tracker/CVE-2023-45284

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 meta/recipes-devtools/go/go-1.20.10.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/go/go-1.20.10.inc b/meta/recipes-devtools/go/go-1.20.10.inc
index 39509ed986..b240da3f86 100644
--- a/meta/recipes-devtools/go/go-1.20.10.inc
+++ b/meta/recipes-devtools/go/go-1.20.10.inc
@@ -16,3 +16,6 @@ SRC_URI += "\
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
 "
 SRC_URI[main.sha256sum] = "72d2f51805c47150066c103754c75fddb2c19d48c9219fa33d1e46696c841dbb"
+
+# Microsoft Windows specific CVEs
+CVE_CHECK_IGNORE += "CVE-2023-45283 CVE-2023-45284"
-- 
2.40.0


