Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 769D7C6FD20
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 14:30:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.8791.1678285810682175317
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Mar 2023 06:30:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=edGusRZV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2431342ddf=narpat.mali@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 328CIRPN031089
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Mar 2023 14:30:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=MwQlLEtyUy3Keox89maQT6ZXggXTKjeEDKq1g7TIcZ4=;
 b=edGusRZVcfKyKg6k79iOZp1c3D5mBN4WgzaJ1JkSZ7mAn6uAzPhZXo00GyiBy1WiikVS
 cXs05/lRON9tfHu0A5APrbBymjMagRLI3yFqV6UJD0aaSevcgN2lehQAdcR0DXMY6j1t
 8RMH1O2AY5teLSbeQhVSLwkH2z1+hQbq1bbteDwvOEl+UPrYKpKcBL22vlnBHemc7Vkg
 M4h7t06Ml8S5lz7TBBXkQjqzTSBRys2l4yIzfPwTUZTEAioRZFm/OlQgICsJ5vHmgi/s
 M8kIyOQG6BLmA87rIIZo938aK/9SWWKHA0cofDLCiDrOj8X5ZB073d0iiY0jG3OKS38z Qg== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p6ffh8jxa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 14:30:09 +0000
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.18; Wed, 8 Mar 2023 06:30:07 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.18 via Frontend Transport; Wed, 8 Mar 2023 06:30:06 -0800
From: Narpat Mali <narpat.mali@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <hari.gpillai@windriver.com>, Narpat Mali <narpat.mali@windriver.com>
Subject: [OE-core][kirkstone][PATCH 1/1] libmicrohttpd: upgrade 0.9.75 -> 0.9.76
Date: Wed, 8 Mar 2023 14:26:31 +0000
Message-ID: <20230308142631.1131788-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Usyy2RWVhYkhq8e168QpIusLpyOOeb--
X-Proofpoint-GUID: Usyy2RWVhYkhq8e168QpIusLpyOOeb--
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-08_08,2023-03-08_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 adultscore=0 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303080124
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 14:30:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178176

Changelog:
============
Fix potential DoS vector in MHD_PostProcessor.(CVE-2023-27371)
Releasing GNU libmicrohttpd 0.9.76 hotfix.

https://github.com/Karlson2k/libmicrohttpd/blob/v0.9.76/ChangeLog

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 .../{libmicrohttpd_0.9.75.bb => libmicrohttpd_0.9.76.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libmicrohttpd/{libmicrohttpd_0.9.75.bb => libmicrohttpd_0.9.76.bb} (91%)

diff --git a/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb b/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb
similarity index 91%
rename from meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb
rename to meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb
index 9c99af7c91..ad3c34ab9e 100644
--- a/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb
+++ b/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb
@@ -7,7 +7,7 @@ SECTION = "net"
 DEPENDS = "file"
 
 SRC_URI = "${GNU_MIRROR}/libmicrohttpd/${BPN}-${PV}.tar.gz"
-SRC_URI[sha256sum] = "9278907a6f571b391aab9644fd646a5108ed97311ec66f6359cebbedb0a4e3bb"
+SRC_URI[sha256sum] = "f0b1547b5a42a6c0f724e8e1c1cb5ce9c4c35fb495e7d780b9930d35011ceb4c"
 
 inherit autotools lib_package pkgconfig gettext
 
-- 
2.34.1


