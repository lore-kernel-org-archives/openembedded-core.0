Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAA23C3DA49
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 12:06:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.59922.1721995562728334406
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jul 2024 05:06:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=793772edd4=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46Q7iSsO011425
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 12:06:02 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40kca1sjvg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 12:06:01 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 05:05:59 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][scarthgap][PATCH 1/1] python3-idna: upgrade 3.6 -> 3.7
Date: Fri, 26 Jul 2024 12:05:42 +0000
Message-ID: <20240726120542.1939018-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: qgHLJy85pCKl3WuMTOhs0sEywy0kiD9D
X-Proofpoint-GUID: qgHLJy85pCKl3WuMTOhs0sEywy0kiD9D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-26_10,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 mlxscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2407260081
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 12:06:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202529

From: Soumya Sambu <soumya.sambu@windriver.com>

License-Update: Updated copyright year

Changelog:
==========
 * Fix issue where specially crafted inputs to encode() could take exceptionally
long amount of time to process. [CVE-2024-3651]

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../python/{python3-idna_3.6.bb => python3-idna_3.7.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-idna_3.6.bb => python3-idna_3.7.bb} (62%)

diff --git a/meta/recipes-devtools/python/python3-idna_3.6.bb b/meta/recipes-devtools/python/python3-idna_3.7.bb
similarity index 62%
rename from meta/recipes-devtools/python/python3-idna_3.6.bb
rename to meta/recipes-devtools/python/python3-idna_3.7.bb
index 47c080cdf8..729aff1c46 100644
--- a/meta/recipes-devtools/python/python3-idna_3.6.bb
+++ b/meta/recipes-devtools/python/python3-idna_3.7.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Internationalised Domain Names in Applications"
 HOMEPAGE = "https://github.com/kjd/idna"
 LICENSE = "BSD-3-Clause & Python-2.0 & Unicode-TOU"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=dbec47b98e1469f6a104c82ff9698cee"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=204c0612e40a4dd46012a78d02c80fb1"
 
-SRC_URI[sha256sum] = "9ecdbbd083b06798ae1e86adcbfe8ab1479cf864e4ee30fe4e46a003d12491ca"
+SRC_URI[sha256sum] = "028ff3aadf0609c1fd278d8ea3089299412a7a8b9bd005dd08b9f8285bcb5cfc"
 
 inherit pypi python_flit_core
 
-- 
2.25.1


