Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9AA2C74A5B
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 06:42:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.13534.1679035340373330096
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Mar 2023 23:42:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=euTApRv8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=244020c12b=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32H6cOgN022025
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 06:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=hYDVrgvQiv5DukY4RX+qWQzkWTLuWDFMfrj5v/M/OO4=;
 b=euTApRv8XYtXmNfv9NAoZ8nFPNxgq4TNC1C9JQDFgsx+dCMrb/Eb3PWadipvNFYMb9Wm
 USy1y8z6Iu6YShQCfSxpPkeVVJ2rFJXtMOGxafImaE87gbcMBcueOGTmZi7PMA4EIYsR
 MSlxJ+QckVbbFHRU7FH5FGTRlZO8ucZLx3HYY77Q8yX8MLtMj3icfIpv9NO3SucgRqdI
 W9PYJ83l97iq7GNKzH5Y7hujbB4zeI53W7nXfx70Z4jZ3GxrhvFstIuPg5A9RDrKhhRf
 syHnlX22bTuorPZg8zNNzoDv+nMdmMLeROoUic0bhl59lCSr/aKsiS7T5ED8ja5UoBeC Zw== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pbqm79cwv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 06:41:58 +0000
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Thu, 16 Mar 2023 23:41:56 -0700
Received: from pek-hostel-deb01.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.18 via Frontend Transport; Thu, 16 Mar 2023 23:41:55 -0700
From: Soumya <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>, Soumya <soumya.sambu@windriver.com>
Subject: [oe-core][kirkstone][PATCH 1/1] vim: upgrade 9.0.1211 -> 9.0.1403
Date: Fri, 17 Mar 2023 14:41:52 +0800
Message-ID: <20230317064152.1748738-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 0pU_e_HpVNM3xcwTpMKucXpiq8smvaLn
X-Proofpoint-ORIG-GUID: 0pU_e_HpVNM3xcwTpMKucXpiq8smvaLn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-17_02,2023-03-16_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 adultscore=0
 mlxlogscore=649 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303170043
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 06:42:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178741

This incorporates fixes for CVE-2023-0512, CVE-2023-1127, CVE-2023-1175, CVE-2023-1170, CVE-2023-0433, CVE-2023-1264, CVE-2023-1355.

Also remove runtime/doc/uganda.txt from the license checksum: the Vim
license is also in the top-level LICENSE file so this is redundant.

Signed-off-by: Soumya <soumya.sambu@windriver.com>
---
 meta/recipes-support/vim/vim.inc | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 9bc6881fce..c27b327ecb 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -10,8 +10,7 @@ DEPENDS = "ncurses gettext-native"
 RSUGGESTS:${PN} = "diffutils"
 
 LICENSE = "Vim"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6b30ea4fa660c483b619924bc709ef99 \
-                    file://runtime/doc/uganda.txt;md5=001ef779f422a0e9106d428c84495b4d"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6b30ea4fa660c483b619924bc709ef99"
 
 SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://disable_acl_header_check.patch \
@@ -20,8 +19,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".1211"
-SRCREV = "f7d1c6e1884c76680980571f1cf15e0928d247b5"
+PV .= ".1403"
+SRCREV = "e764d1b4219e6615a04df1c3a6a5c0210a0a7dac"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.25.1


