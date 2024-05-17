Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADA13C04FFE
	for <webhook@archiver.kernel.org>; Fri, 17 May 2024 08:23:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.35133.1715934197204368893
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 May 2024 01:23:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5867a3e2a4=yogita.urade@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44H6oJBh030508
	for <openembedded-core@lists.openembedded.org>; Fri, 17 May 2024 08:23:16 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3y1yc4e5xu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 17 May 2024 08:23:16 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 17 May 2024 01:23:13 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH 1/1] libarchive: upgrade 3.7.3 -> 3.7.4
Date: Fri, 17 May 2024 08:21:47 +0000
Message-ID: <20240517082147.3192496-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: uuhgo5s9aNnGtL_deruozFUKscU1f2PX
X-Proofpoint-ORIG-GUID: uuhgo5s9aNnGtL_deruozFUKscU1f2PX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 adultscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 mlxscore=0 clxscore=1015 impostorscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405170066
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 May 2024 08:23:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199508

From: Yogita Urade <yogita.urade@windriver.com>

Changelog:
=========
   rar: Fix OOB in rar e8 filter
   zip: Fix out of boundary access
   7zip: Limit amount of properties
   bsdtar: Fix error handling around strtol() usages
   passphrase: Improve newline handling on Windows
   passphrase: Never allow empty passwords
   rar: Fix "File CRC Error" when extracting specific rar4 archives
   xar: Avoid infinite link loop
   zip: Update AppleDouble support for directories
   zstd: Implement core detection

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../libarchive/{libarchive_3.7.3.bb => libarchive_3.7.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.7.3.bb => libarchive_3.7.4.bb} (96%)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.3.bb b/meta/recipes-extended/libarchive/libarchive_3.7.4.bb
similarity index 96%
rename from meta/recipes-extended/libarchive/libarchive_3.7.3.bb
rename to meta/recipes-extended/libarchive/libarchive_3.7.4.bb
index bea91b6e97..da85764116 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.3.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.4.bb
@@ -33,7 +33,7 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 SRC_URI += "file://configurehack.patch"
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-SRC_URI[sha256sum] = "f27a97bc22ceb996e72502df47dc19f99f9a0f09181ae909f09f3c9eb17b67e2"
+SRC_URI[sha256sum] = "7875d49596286055b52439ed42f044bd8ad426aa4cc5aabd96bfe7abb971d5e8"
 
 CVE_STATUS[CVE-2023-30571] = "upstream-wontfix: upstream has documented that reported function is not thread-safe"
 
-- 
2.40.0


