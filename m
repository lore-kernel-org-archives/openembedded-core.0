Return-Path: <dragos.panait@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B095C433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 14:09:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.27621.1658153363390677991
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:09:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=McsMjgCR;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=4198b78d92=dragos.panait@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 26IB2CfX032525
	for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:09:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=jgC6Fen/JA5RJaImIj/7EtEd7cAObymCWes4ak4uq5g=;
 b=McsMjgCR23OJQ9qiY9Eul7nRG/kwGF0LjJxmgrs7xjbBcrl5l5gEbspaO8t7geDM2yNo
 8PlRNUamlPvKfjHvyHufpNY3dRt9cix1k3uhdUYoUv4F1TXBjNjAfONuWO42i75Azabo
 winZeZ6JmtZnWAUMfvgfQP+63kcRm6a6sp1zBSFfkzN/QVZFFlgee0+ZwlWWhwaocQ9M
 pq7lff1ZTEycagCRaoz22oSMX1QdZsQt8Y8OY3b4g8G4Gt7HP5FTIi3m0Yuc2IahAfEU
 w3S4s5dop/jUff6pOwdSYlKCDH43oMx04LojgpPgPorndB1ly7fur0E4UxOrVTuGoQpd fQ==
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com
 [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hbvuks77a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:09:22 -0700
Received: from otp-dpanait-l2.corp.ad.wrs.com (128.224.125.191) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 18 Jul 2022 07:09:20 -0700
From: Dragos-Marian Panait <dragos.panait@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] strace: update SRC_URI
Date: Mon, 18 Jul 2022 17:09:10 +0300
Message-ID: <20220718140910.519671-1-dragos.panait@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [128.224.125.191]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: 9VkICLP_KAsK1fs0wF4LIY7OCeJH6UWT
X-Proofpoint-ORIG-GUID: 9VkICLP_KAsK1fs0wF4LIY7OCeJH6UWT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-18_13,2022-07-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=983 suspectscore=0 clxscore=1011 malwarescore=0 mlxscore=0
 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207180061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 14:09:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168198

https://strace.io is down for some time now,
so switching to https://github.com.

Signed-off-by: Dragos-Marian Panait <dragos.panait@windriver.com>
---
 meta/recipes-devtools/strace/strace_5.18.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/strace/strace_5.18.bb b/meta/recipes-devtools/strace/strace_5.18.bb
index 08f0f1d27e..2bdc3519ee 100644
--- a/meta/recipes-devtools/strace/strace_5.18.bb
+++ b/meta/recipes-devtools/strace/strace_5.18.bb
@@ -5,7 +5,7 @@ SECTION = "console/utils"
 LICENSE = "LGPL-2.1-or-later & GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59a33f0a3e6122d67c0b3befccbdaa6b"
 
-SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
+SRC_URI = "https://github.com/strace/strace/releases/download/v${PV}/strace-${PV}.tar.xz \
            file://update-gawk-paths.patch \
            file://Makefile-ptest.patch \
            file://run-ptest \
-- 
2.25.1


