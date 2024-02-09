Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F15EC48260
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 02:13:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.2283.1707444795305360737
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 18:13:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fFCJcKiY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2769543367=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4191tXwN010553
	for <openembedded-core@lists.openembedded.org>; Thu, 8 Feb 2024 18:13:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=G0/X8
	5RAeO4mygWhoT+krjnmFj02vgck0zJioe8E1WA=; b=fFCJcKiYSWKFjrhvMMO7P
	PaFttt9Ud8uVhd9sm57Sg5qtciBlxAso0xNbQbl5gV31FJnBwRy522jbl+gySCax
	wIaDdVqsmm44yNsreIX/gFPv0cqCVlf6pmvCYds+YDHpwenvSPn6RaSd4gvfYqWO
	jdQIzs+N1gUstpFLBytcYlGPMwteobiJZGw9NWf1yEHJIaduwZQzDTNgFJEAv2p1
	RG8eYRWYDHG4EVsyaIgx//L4qLnUE6bsLnznpFLb+7ZlygvZJPpq3oxVIQWmI8Cz
	Zb9pFwoLm+WCVenI4UtE2OQEioSUZC1C15V/Vn/thjbqxE6S2bC5era6t9HneRK3
	g==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w1hn3wm0c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 18:13:14 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 8 Feb 2024 18:13:14 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 8 Feb 2024 18:13:13 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <liezhi.yang@windriver.com>
Subject: [kirkstone][PATCH] ghostscript: correct LICENSE with AGPLv3
Date: Fri, 9 Feb 2024 10:13:10 +0800
Message-ID: <20240209021310.3000995-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: nMHW8Gt9OPmKOuDH3G50_11ziDrE-Ac0
X-Proofpoint-ORIG-GUID: nMHW8Gt9OPmKOuDH3G50_11ziDrE-Ac0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-08_13,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 clxscore=1015 mlxlogscore=692 suspectscore=0 mlxscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402090013
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 02:13:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195183

From: Kai Kang <kai.kang@windriver.com>

The license of ghostscript has switched to Affero GPL since version 9.07
via commit:

* 3cc5318 Switch Ghostscript/GhostPDL to Affero GPL

https://github.com/ArtifexSoftware/ghostpdl/commit/3cc5318

Correct it with `AGPL-3.0-or-later`.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index e0d1e4618f..e99c740685 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -10,7 +10,7 @@ dot-matrix, inkjet and laser models. \
 HOMEPAGE = "http://www.ghostscript.com"
 SECTION = "console/utils"
 
-LICENSE = "GPL-3.0-only"
+LICENSE = "AGPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f98ffa763e50cded76f49bce73aade16"
 
 DEPENDS = "ghostscript-native tiff jpeg fontconfig cups libpng"
-- 
2.34.1


