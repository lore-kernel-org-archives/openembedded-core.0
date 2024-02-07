Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 739FAC4828D
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 08:08:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.15755.1707293310896188821
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Feb 2024 00:08:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bYtx1FvA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2767aeb957=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 417594PM022452
	for <openembedded-core@lists.openembedded.org>; Wed, 7 Feb 2024 08:08:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=hgzgw
	GTceK+uISTcjDKZniH3xgHO76Ha/uBQAqZj3+k=; b=bYtx1FvAB21OV3TsVC+YC
	84rR5rDEWhAMysxBl3y5ylh/VngMj78hws3CIwz8LWUnwVVeg7dfhJUTwuRCnGF/
	Kp8kbSOPSUyF9ySbgnkLAv7ZPGTAn9iuukJtejRRjlZxn99kyM3nal8RzcrFaOIw
	GSZAYjgfAQECvUUDk+RdjljBCiFdoBRTR+GMoQUxu/9h48Vc+qE5SuSYtAVxSrWs
	9uD3xz2ti75ekkHnvObF0fdJdPNgFqB0o+HHA9cq2ZKHzYg3BOlobQcy26AJgzz0
	feZY/v5ohTBt1Pzo5aU27/5RLbOSyxkqVUEdC8s4yGmzUtL445dcOubfBRwJXPGz
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w1cs7btnv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 08:08:30 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 7 Feb 2024 00:08:28 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 7 Feb 2024 00:08:28 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <liezhi.yang@windriver.com>
Subject: [PATCH] ghostscript: correct LICENSE with AGPLv3
Date: Wed, 7 Feb 2024 16:08:23 +0800
Message-ID: <20240207080823.498290-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: bwFKL0ehDX7fyf5M_7Gi_6WiLuzEN3P_
X-Proofpoint-GUID: bwFKL0ehDX7fyf5M_7Gi_6WiLuzEN3P_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-07_02,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 phishscore=0
 bulkscore=0 mlxlogscore=723 impostorscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401310000 definitions=main-2402070059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 08:08:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195040

From: Kai Kang <kai.kang@windriver.com>

The license of ghostscript has switched to Affero GPL since version 9.07
via commit:

* 3cc5318 Switch Ghostscript/GhostPDL to Affero GPL

https://github.com/ArtifexSoftware/ghostpdl/commit/3cc5318

Correct it with `AGPL-3.0-or-later`.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb b/meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb
index 2a966afc21..2c965b6451 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb
@@ -10,7 +10,7 @@ dot-matrix, inkjet and laser models. \
 HOMEPAGE = "http://www.ghostscript.com"
 SECTION = "console/utils"
 
-LICENSE = "GPL-3.0-only"
+LICENSE = "AGPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f98ffa763e50cded76f49bce73aade16"
 
 DEPENDS = "tiff jpeg fontconfig cups libpng freetype zlib"
-- 
2.34.1


