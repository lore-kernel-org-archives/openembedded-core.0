Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49FD5FA3742
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 12:02:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.5550.1666872142607431423
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Oct 2022 05:02:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=gDfXoUD8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7299a514d3=narpat.mali@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 29RALSFi021392;
	Thu, 27 Oct 2022 05:02:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=54EciRnBS5WEtU3RmKJrD0UQOguLy4iqszE499iq26s=;
 b=gDfXoUD8d4kiYQ+eAF5IiMC8rfiSpoMh4O9GMfNa4z4E38OBMXTrcCSHoX2OsWNAZyu3
 uq5Ur0XRcpXxkkvRkO1Ig6VroxmCC0xT3Q5mCormQTdmMkp/jfYpX5VbITwgPc8G640N
 5RzkrJU8mG2lBHQjK7UyB5TynbULFkDUwllqtuTOxQFEYZC6h/zNxNmqyIINhaxcsgLR
 JDlvLjjzXspLjFO6Y/wZCsYmDJ8DIM1CPazuL2604hlWmytuaKJHNG3p+Kx49Z2V6+zK
 xp5yD6i/MCBdDgKFKFdKSZUa9IL/idDuFB2r5q/QKGonzN6Ds8Goia7dqYUzniXQL9V3 bQ== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kfg3grcy2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 27 Oct 2022 05:02:13 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 27 Oct 2022 05:02:13 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 27 Oct 2022 05:02:10 -0700
From: Narpat Mali <narpat.mali@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <archana.polampalli@windriver.com>, <hari.gpillai@windriver.com>,
        "Narpat
 Mali" <narpat.mali@windriver.com>,
        Alexander Kanavin <alex@linutronix.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-core][kirkstone][PATCH 1/1] python3-mako: upgrade 1.2.0 -> 1.2.1
Date: Thu, 27 Oct 2022 11:59:00 +0000
Message-ID: <20221027115900.1916731-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: R6IY47RflFrdWVWWH51JbNhEVk9zDg92
X-Proofpoint-ORIG-GUID: R6IY47RflFrdWVWWH51JbNhEVk9zDg92
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-27_05,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 suspectscore=0
 spamscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=999
 mlxscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2210270066
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 12:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172190

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Upstream master commit:
https://git.openembedded.org/openembedded-core/commit/?id=7e42ad18ee5e7e5633abb6529682e4a1671a911b

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 .../python/{python3-mako_1.2.0.bb => python3-mako_1.2.1.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-mako_1.2.0.bb => python3-mako_1.2.1.bb} (73%)

diff --git a/meta/recipes-devtools/python/python3-mako_1.2.0.bb b/meta/recipes-devtools/python/python3-mako_1.2.1.bb
similarity index 73%
rename from meta/recipes-devtools/python/python3-mako_1.2.0.bb
rename to meta/recipes-devtools/python/python3-mako_1.2.1.bb
index 11e5f326bd..8155c37984 100644
--- a/meta/recipes-devtools/python/python3-mako_1.2.0.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.2.1.bb
@@ -2,13 +2,13 @@ SUMMARY = "Templating library for Python"
 HOMEPAGE = "http://www.makotemplates.org/"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b32291f107a8f1ea94c4a41e00a6a18d"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ad08dd28df88e64b35bcac27c822ee34"
 
 PYPI_PACKAGE = "Mako"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "9a7c7e922b87db3686210cf49d5d767033a41d4010b284e747682c92bddd8b39"
+SRC_URI[sha256sum] = "f054a5ff4743492f1aa9ecc47172cb33b42b9d993cffcc146c9de17e717b0307"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-html \
                   ${PYTHON_PN}-markupsafe \
-- 
2.34.1


