Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90F22EB64DD
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 10:18:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.183753.1692267519733266001
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 03:18:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=AWRJ3OdV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7593634f3c=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37H6AW3m004210
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 03:18:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=Ln16f
	ArzWyR9Ajhf3wqapqmN1dWvWlFvvWrg4vq7Kl4=; b=AWRJ3OdV1EYjETmCJ6iLS
	1xOaBFaiO9jchdoYzLAxBjpYXJVZ7uieLumCOXq0iNLQ5jBdYP1X7NAYUH5+eBj8
	Bcjn6luSm6I0dHQynKjc2ncZn2iG/cIQGQ6fLtymgBFB96QD6Bthy5rbZq2rDlQD
	+8LabW1tz1BLM0vmbVK3PPOIvu6BFs+7wmZl40d0RC7kWVnJz96yI78rY4vK63uP
	oi8Ddr1ghABcIULyZvlDCLwCsAeKKhFYDwrSdyUh13vQ4fjnHBAXanZf/eMb3JsF
	A+kN+zs/TSsO41bNwbMhUEi5qd26CLUY4UHhl6keDvcokcr2csR1uehoSeaaRoON
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3se5bycpwe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 03:18:39 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 17 Aug 2023 03:18:37 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>
Subject: [oe-core][kirkstone][PATCH 1/1] vim: upgrade 9.0.1592 -> 9.0.1664
Date: Thu, 17 Aug 2023 10:18:24 +0000
Message-ID: <20230817101824.613376-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: UZzcZWR2c1Ntgsy3rdaneknSIdGHnB_S
X-Proofpoint-ORIG-GUID: UZzcZWR2c1Ntgsy3rdaneknSIdGHnB_S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-17_03,2023-08-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 clxscore=1011 priorityscore=1501 mlxlogscore=603 lowpriorityscore=0
 adultscore=0 mlxscore=0 spamscore=0 impostorscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2308170092
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 10:18:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186304

Fixes:
https://nvd.nist.gov/vuln/detail/CVE-2023-3896
8154e642a (tag: v9.0.1664) patch 9.0.1664: divide by zero when scrolling with 'smoothscroll' set

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 33ae0d8079..9a7b7650a7 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,8 +19,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".1592"
-SRCREV = "29b4c513b11deb37f0e0538df53d195f602fa42c"
+PV .= ".1664"
+SRCREV = "8154e642aa476e1a5d3de66c34e8289845b2b797"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.40.0


