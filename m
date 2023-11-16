Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A6DDC197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 08:01:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.2535.1700121704850952637
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 00:01:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=AH0ZzoZD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9684758189=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AG6UBIo001097
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 08:01:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=4wrLu
	Oqa2j4ePUtjFCM9820GJzVraelVGy6lokG/1+U=; b=AH0ZzoZDrByE5vLvysyWU
	aDMwYpgDTWQMpwBtskdJQb5fsqx5gX8LC44N2X/m4VhLjy45wCqmdI83uEXUnIPr
	VvGD5sATaDbV49PM9rpk9gJK6G9MwauphpEGo+dhKI07m6XTQkDc3CX2KdAA+rfA
	EKBwF+/RiDcVzQOTbX9gf9ATAFzmo7ifUEl9bvZ7waMmO8F7ugFo3FxP0g8gM2l7
	vNkpJbbPPGGiMnVnGAlxWTsOi4J8boud3Lr0nR0mCNuaX8lAGKkZdLfdrKcCx78c
	HZaRouo1QfbpIyLu9lSQo/wF7J4lLSomap6R9Xp2ju1l9hIltc1q8SZkUBDCipWA
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ua0k6cndx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 08:01:44 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 00:01:46 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][dunfell][PATCH 1/3] vim: update obsolete comment
Date: Thu, 16 Nov 2023 08:01:22 +0000
Message-ID: <20231116080124.3175506-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: oC6dQAXDu1iJJo3rPFdRiWCgUWhQppQl
X-Proofpoint-ORIG-GUID: oC6dQAXDu1iJJo3rPFdRiWCgUWhQppQl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_06,2023-11-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=850 spamscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311060001
 definitions=main-2311160062
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 08:01:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190764

From: Etienne Cordonnier <ecordonnier@snap.com>

vim 8.3 has been out for a long time, so this comment is obsolete.
However we still need UPSTREAM_VERSION_UNKNOWN, since we ignore
the last digit of the upstream version number.

Test result:
$ devtool check-upgrade-status vim
  ...
  INFO: vim                       9.0.1592        UNKNOWN         Tom Rini <trini@konsulko.com> c0370529c027abc5b1698d53fcfb8c02a0c515da

(From OE-Core rev: 65f5de85c3f488136d1ec2b1f7fe8d8426d6c5b3)

(From OE-Core rev: 72af322b6b8afd64a59b30a4f0fc3f8c6dfaa06a)

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 868a19357841470eb55fb7f1c4ab1af09dea99ed)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 meta/recipes-support/vim/vim.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index d8e88af22e..10406d8b26 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -22,11 +22,10 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
 PV .= ".2048"
 SRCREV = "982ef16059bd163a77271107020defde0740bbd6"
 
-# Remove when 8.3 is out
-UPSTREAM_VERSION_UNKNOWN = "1"
-
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
+# Ignore that the upstream version .z in x.y.z is always newer
+UPSTREAM_VERSION_UNKNOWN = "1"
 
 S = "${WORKDIR}/git"
 
-- 
2.40.0


