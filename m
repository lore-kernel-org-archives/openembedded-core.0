Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0954DC83F1A
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 11:32:53 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.38144.1753097570473263780
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jul 2025 04:32:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=92976fe5b5=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56L5KGNG1134328
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 11:32:49 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4800k09x4u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 11:32:49 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Mon, 21 Jul 2025 04:32:36 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Mon, 21 Jul 2025 04:32:35 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe][meta-webserver][Walnascar][PATCH  1/1] apache2: upgrade 2.4.63 -> 2.4.64
Date: Mon, 21 Jul 2025 17:02:42 +0530
Message-ID: <20250721113242.86368-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: YdDXb9yh3a2wmMWnyw-aavyse1nbCubg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDIwMSBTYWx0ZWRfX1fpkFPuWTilg
 l8hSpzoXj+gwpDycFnfbCjfNpD419k+0/xO1Madi8hAAaIRoH94estC0Ydi240PanzkYEjF6y1S
 JZ4Z6mBqYye0hXATBAZI/+fTe5allUYUklIo4zRIsq0+31U392XAXtH+nU++uRR6GDKbPhK8L1R
 /PjT/oiAYzM5wSkdYjI2vTd15pDEfkC//AYTKky3ZEC4CjlwVDrcDhLdKRg6LmRhNZgW5dR2fET
 26vVNmuPTgB61DTRW4WTqEDMf3PChVI5zGH0JFNUix1sMFjKjoZuIEanASmVvEWv9d3Ig7s+xx3
 twE8uDpIteexol18HBV0ERglsgxTOfQrLcNy/lORyWRogPtqfJWJ0Y7HQzFiK5LCIerH+etNo6s
 LbmDPszN
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=687e2561 cx=c_pps
 a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17
 a=AC0tdzqdyWkA:10 a=Wb1JkmetP80A:10 a=omOdbC7AAAAA:8 a=pGLkceISAAAA:8
 a=t7CeM3EgAAAA:8 a=OvazYexQGyryQK4VWcwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: YdDXb9yh3a2wmMWnyw-aavyse1nbCubg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_03,2025-07-21_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507180201
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 11:32:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220680

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 207b98bcd720fc4253b13284962ea1b0f84bf7e9)
Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../apache2/{apache2_2.4.63.bb => apache2_2.4.64.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.63.bb => apache2_2.4.64.bb} (99%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.63.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.64.bb
similarity index 99%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.63.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.64.bb
index 9ef8c13b79..5830568746 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.63.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.64.bb
@@ -27,7 +27,7 @@ SRC_URI:append:class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[sha256sum] = "88fc236ab99b2864b248de7d49a008ec2afd7551e64dce8b95f58f32f94c46ab"
+SRC_URI[sha256sum] = "120b35a2ebf264f277e20f9a94f870f2063342fbff0861404660d7dd0ab1ac29"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
2.40.0


