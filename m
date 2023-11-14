Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF4CEC4332F
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 08:53:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.8870.1699952015794094529
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 00:53:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hojZEIts;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=96829e2cb8=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AE7P2Ul004832
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 08:53:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=T5QyI
	mqaZ8nqFFXerCo1ncBjq8D/UqqO9Fl3lvNKAiY=; b=hojZEIts+M3ODKMKaWOOn
	tojzLNA9f8CPLDHUBjkJbzJrX5hj+EGUiHbmHRsvSJ1ny6ScCytU3MUphKKgxQwo
	p51ZTeri6a38pGWH77vAfzuZjMEjMKO7u0QhhuyRnb+xUQ8rNMCVt+AWMJKucT5V
	GQ7KFJQq0GZGhBTzc377dIhmi/IqC/9w0hNmME87PLIHko5suXuXsyzXHiHdaLHn
	whNY8DB5MJdjz9OyAXg2FjKXaRZMMLCh3BjdSkkvC2zh/ZKu2ZJ0RnMJ2Yf2PUe/
	GRbKlb6rryCDtkSQIhnX1T//uHEZVmOnWL8bMIDmOmGmJDvxGF+vWeK7MrXjq/Yu
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u9xtxae41-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 08:53:34 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 00:53:36 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][dunfell][PATCH 1/1] go: ignore CVE-2023-45283 & CVE-2023-45284
Date: Tue, 14 Nov 2023 08:53:05 +0000
Message-ID: <20231114085305.2852702-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: 9hA_jMlDK0hyRQJXNEW9iirBWAILbGO0
X-Proofpoint-GUID: 9hA_jMlDK0hyRQJXNEW9iirBWAILbGO0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-14_07,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=816 bulkscore=0 mlxscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311060001
 definitions=main-2311140067
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 08:53:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190491

From: Archana Polampalli <archana.polampalli@windriver.com>

Only affects code running on Windows

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-45284
https://nvd.nist.gov/vuln/detail/CVE-2023-45283
https://groups.google.com/g/golang-announce/c/4tU8LZfBFkY

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 meta/recipes-devtools/go/go-1.14.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index 091b778de8..b8b7fd0c46 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -115,3 +115,7 @@ CVE_CHECK_WHITELIST += "CVE-2022-41716"
 
 # Issue introduced in go1.15beta1, does not exist in 1.14
 CVE_CHECK_WHITELIST += "CVE-2022-1705"
+
+# Only affects code running on Windows
+CVE_CHECK_WHITELIST += "CVE-2023-45283"
+CVE_CHECK_WHITELIST += "CVE-2023-45284"
-- 
2.40.0


