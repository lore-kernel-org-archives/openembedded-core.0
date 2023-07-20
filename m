Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11BBBEB64DA
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 09:19:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.8833.1689844746533216003
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jul 2023 02:19:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=iuPm7T8s;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6565af9f31=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36K5UVbH019763
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 09:19:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=rmkFE
	Zcus+4ctomGjJnazApBRuG4N2+IKrNOMtfSloA=; b=iuPm7T8skRD5uU9gVMsCd
	jp3sBAWmcekVbKWKBo/rafiKcBBF5ueY/A+RnDTV4/RWgF+74c/cC3awaeqpJS+0
	ujMlQYUxgvHE3NDdq/4cXwkriHeawpiwYSHQzeugssjGzYXzlRUUNZtj2f7Unpgy
	wVCiWOewVUjbJRE8IiwcC1J0ufTkvXQYQOD+CuY28visy22iIKEb/fwOXKuZs3n2
	EWQ1LxLIU21mEB+eIUTlJgm4wOVkNXDjaTO7itTfedRFxSBSk6v/nCTDYhTJ7OyD
	dNmiyPDzIhbUawG0FiI2bO+nhLtpgmrU/iVHfqpvpzsLwpoeWciugh+kCvjKkO4z
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3run9jvg3q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 09:19:05 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 02:19:03 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>
Subject: [oe-core][mickledore][PATCH 1/1] vim: upgrade 9.0.1527 -> 9.0.1592
Date: Thu, 20 Jul 2023 09:18:49 +0000
Message-ID: <20230720091849.814948-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: 9ZqfDqjUGrDwnW8ZLJW8qlciQcMvxTwW
X-Proofpoint-ORIG-GUID: 9ZqfDqjUGrDwnW8ZLJW8qlciQcMvxTwW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-20_03,2023-07-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 mlxlogscore=551 phishscore=0 priorityscore=1501 clxscore=1015 mlxscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2307200076
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 09:19:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184626

From: Trevor Gamblin <tgamblin@baylibre.com>

Fixes:

https://nvd.nist.gov/vuln/detail/CVE-2023-2609
d1ae836 patch 9.0.1531: crash when register contents ends up being invalid
https://nvd.nist.gov/vuln/detail/CVE-2023-2610
ab9a2d8 patch 9.0.1532: crash when expanding "~" in substitute causes very long text

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index e1d2563316..33ae0d8079 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,8 +19,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".1527"
-SRCREV = "c28e7a2b2f23dbd246a1ad7ad7aaa6f7ab2e5887"
+PV .= ".1592"
+SRCREV = "29b4c513b11deb37f0e0538df53d195f602fa42c"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.40.0


