Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B759EE7718B
	for <webhook@archiver.kernel.org>; Fri, 27 Dec 2024 09:07:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.10139.1735290437955316178
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Dec 2024 01:07:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=20913da059=divya.chellam@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BR8QGww022537
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Dec 2024 09:07:17 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43nmn8dcun-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Dec 2024 09:07:17 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 27 Dec 2024 01:07:14 -0800
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][scarthgap][PATCH 1/1] libxml2: Upgrade 2.12.8 -> 2.12.9
Date: Fri, 27 Dec 2024 09:06:52 +0000
Message-ID: <20241227090652.2029448-1-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: 0ropoajRKb_Y4dwfRyqu0yz7IqLwjr9v
X-Proofpoint-ORIG-GUID: 0ropoajRKb_Y4dwfRyqu0yz7IqLwjr9v
X-Authority-Analysis: v=2.4 cv=CeHy5Krl c=1 sm=1 tr=0 ts=676e6e45 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=RZcAm9yDv7YA:10 a=GHR8O2WEAAAA:20 a=SSmOFEACAAAA:8 a=t7CeM3EgAAAA:8 a=M7n22lMADqHCcl2buNcA:9
 a=m9p5bXcFLgAA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-27_04,2024-12-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=991 spamscore=0 adultscore=0 suspectscore=0
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412270075
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Dec 2024 09:07:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209101

From: Divya Chellam <divya.chellam@windriver.com>

Changes between 2.12.8 -> 2.12.9
================================
https://gitlab.gnome.org/GNOME/libxml2/-/releases/v2.12.9

Security
* [CVE-2024-40896] Fix XXE protection in downstream code

Improvements
* Undeprecate xmlKeepBlanksDefault.
---
 .../libxml/{libxml2_2.12.8.bb => libxml2_2.12.9.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/libxml/{libxml2_2.12.8.bb => libxml2_2.12.9.bb} (97%)

diff --git a/meta/recipes-core/libxml/libxml2_2.12.8.bb b/meta/recipes-core/libxml/libxml2_2.12.9.bb
similarity index 97%
rename from meta/recipes-core/libxml/libxml2_2.12.8.bb
rename to meta/recipes-core/libxml/libxml2_2.12.9.bb
index fb103f0273..7777c9f181 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.8.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.9.bb
@@ -20,7 +20,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://install-tests.patch \
            "
 
-SRC_URI[archive.sha256sum] = "43ad877b018bc63deb2468d71f95219c2fac196876ef36d1bee51d226173ec93"
+SRC_URI[archive.sha256sum] = "59912db536ab56a3996489ea0299768c7bcffe57169f0235e7f962a91f483590"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 # Disputed as a security issue, but fixed in d39f780
-- 
2.40.0


