Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F016EB64DA
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 21:32:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.2045.1689197575028513446
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 14:32:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=lNqrFg0n;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6557242ad9=joe.slater@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36CAlQjI023575
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 14:32:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=6d3M9
	Ypay/bbnAWtIkUk28Rn+SWGYGd2v4bncuVSgwU=; b=lNqrFg0nXUWmJPg9afcYV
	VoBXGdWYp0olKoph+E/SIlXn4PZM2fxsMzcyYPrU6fskWOWvP9qB6xSvsBuOxFeb
	tnvum7zrC2FbOQZnwww7f3VHMYMQSQDA7XWit6iqdCK5RTOF7drs65SK+IX2Eyiy
	GQMGgji7K3wLrKrlPljwlB0V34Gdqzz788BCNfFRXFoG8XXpme0m3k9sHL/uKy8v
	zWM0AW3jOLT7CkYet0t/XDfJTg2p39PJOXvMIrhukRyI6d+PfrbIQFHlR1CfQg5v
	n7Uh15dpWvis+XMbXaYSgMyec2PoQMr4A9fy5SY4IRHJmzVzYQj1aN/5LNsnIxes
	g==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rq7afbs5g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 14:32:54 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 12 Jul 2023 14:32:53 -0700
Received: from ala-jslater-lx2.corp.ad.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Wed, 12 Jul 2023 14:32:53 -0700
From: <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [oe-core][PATCH 1/1] libgpiod: modify RDEPENDS for ptest
Date: Wed, 12 Jul 2023 14:32:53 -0700
Message-ID: <20230712213253.3830194-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: ByezCjeh0HadmSPDZNfr-8bX5q8UX1ER
X-Proofpoint-GUID: ByezCjeh0HadmSPDZNfr-8bX5q8UX1ER
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-12_15,2023-07-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxscore=0 clxscore=1015 spamscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=593 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2305260000 definitions=main-2307120189
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 21:32:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184224

From: Joe Slater <joe.slater@windriver.com>

The current use of RDEPENDS to add a dependency on bats results
in the QA warning/error

 lib32-libgpiod package lib32-libgpiod-ptest-dev - suspicious values
  'bats-dev' in RRECOMMENDS [multilib]

when building lib32-libgpiod with ptest not enabled.  We add the
dependency only if ptest is enabled.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta-oe/recipes-support/libgpiod/libgpiod.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod.inc b/meta-oe/recipes-support/libgpiod/libgpiod.inc
index a2d1f57a8b..cb19bc5fb8 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod.inc
+++ b/meta-oe/recipes-support/libgpiod/libgpiod.inc
@@ -34,7 +34,7 @@ FILES:${PN}-tools += " \
 FILES:libgpiodcxx = "${libdir}/libgpiodcxx.so.*"
 
 RRECOMMENDS:${PN}-ptest += "coreutils"
-RDEPENDS:${PN}-ptest += "bats"
+RDEPENDS:${PN}-ptest += "${@bb.utils.contains('PTEST_ENABLED', '1', 'bats', '', d)}"
 
 do_install:append() {
     rm -f ${D}${bindir}/gpiod-test
-- 
2.25.1


