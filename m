Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FAC2EDE99C
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 09:04:56 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7418.1694682291121121543
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Sep 2023 02:04:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=nulomA0H;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7621668a22=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38E6k6j0017954
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Sep 2023 02:04:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=Uo5x3
	C4U1s7NM4gDUdMWptvXvkbwnjOwIw9+7jLOWtI=; b=nulomA0Hh99iDSV7nkr1P
	/hjsq1xcT7sPr5IXzb+Aim98GHfec7NrQnYYYLpbbOYvPgINakSRHooRrh3OBowN
	ZxtcNO3NlkEgLb24Qq78GTr3dNdPnJzpTVJpHDVGusSvlTzD9NXPRqZCWCFjVJIr
	DuOBE/4np+GmBVarTKODBh07XdII1/LLfpp/Y/kFaaCDyQSQVAN6pGHie41th9we
	JMRpMEcDazcSX64aveDnRSO8JuB3nuo5NPsmXTd73swNzQUYf1aRQ/bcJs/81PYf
	QNpjUHZijulT7NyQpE03YDp+bcyLlQG6D53cOQOQAuXXOddaxSCH8dkbX5gVSqe0
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t2y829jx0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Sep 2023 02:04:50 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 14 Sep 2023 02:04:48 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 1/1] vim: Upgrade 9.0.1664 -> 9.0.1894
Date: Thu, 14 Sep 2023 09:04:36 +0000
Message-ID: <20230914090436.1461138-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: Xvqz61R54cGz8psiDW2jtYE9ruUJMzX0
X-Proofpoint-ORIG-GUID: Xvqz61R54cGz8psiDW2jtYE9ruUJMzX0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-14_07,2023-09-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 mlxlogscore=595 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2308100000
 definitions=main-2309140077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Sep 2023 09:04:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187627

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This includes multiple CVE fixes.

The license change is due to changes in maintainership, the license
itself is unchanged.

(From OE-Core rev: 91e66b93a0c0928f0c2cfe78e22898a6c9800f34)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 meta/recipes-support/vim/vim.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 8a399cd802..5f55f590e6 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -10,7 +10,7 @@ DEPENDS = "ncurses gettext-native"
 RSUGGESTS:${PN} = "diffutils"
 
 LICENSE = "Vim"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6b30ea4fa660c483b619924bc709ef99"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d1a651ab770b45d41c0f8cb5a8ca930e"
 
 SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://disable_acl_header_check.patch \
@@ -19,8 +19,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".1664"
-SRCREV = "8154e642aa476e1a5d3de66c34e8289845b2b797"
+PV .= ".1894"
+SRCREV = "e5f7cd0a60d0eeab84f7aeb35c13d3af7e50072e"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.40.0


