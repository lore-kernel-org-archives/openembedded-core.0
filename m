Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C3BEEB64D9
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 21:09:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.411.1689023376752761216
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jul 2023 14:09:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=HdJ5iKOl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=65550850b4=joe.slater@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36AKr572027959
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 21:09:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=byBhb
	AHmfs/40tUJK3pOEnazG3SP7e4yt1xyrAN1FXc=; b=HdJ5iKOlyiPmi6pz2cdjY
	loJqGYbr4ysnoH2iMdcckeOBMtdPkiCbr6MGEfXyT40KyNkwRB/i3y1uI5/FmK7y
	xXh2crrVfnZEDTCMsPd3wT82lJcBpBZia43PnfbG5TNI+dN6XaddCSTBXqaktlei
	L0HvOn8jgTwUNfkMKZ2ES0kz/EcyN/pg04ffpHfjEzjgLjxo/72tcLY4WZCE7HAH
	QHuwE4NUNFOOv50BN1fPyuThwxG6jSeJSzlRcXSEWf2MPiT1+SfyHFF3h3LYKtou
	zwOtwlO402UjQFLN9uowIYS4WeXDHKUD6ebmb+oQBGflxW3C535OKg1j5v8VQSpK
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rpw0wj06p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 21:09:35 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 10 Jul 2023 14:09:34 -0700
Received: from ala-jslater-lx2.corp.ad.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Mon, 10 Jul 2023 14:09:34 -0700
From: <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [oe-core][PATCH 1/1] ghostscript: advance to version 10.01.2
Date: Mon, 10 Jul 2023 14:09:34 -0700
Message-ID: <20230710210934.606757-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 7huR6GzRw2O2lbgi4TDhQCT5inyAoxJQ
X-Proofpoint-GUID: 7huR6GzRw2O2lbgi4TDhQCT5inyAoxJQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-10_16,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=602 suspectscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2307100192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 21:09:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184099

From: Joe Slater <joe.slater@windriver.com>

Fix CVE-2023-28879 and CVE-2023-36664.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../{ghostscript_10.01.1.bb => ghostscript_10.01.2.bb}         | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-extended/ghostscript/{ghostscript_10.01.1.bb => ghostscript_10.01.2.bb} (93%)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.01.1.bb b/meta/recipes-extended/ghostscript/ghostscript_10.01.2.bb
similarity index 93%
rename from meta/recipes-extended/ghostscript/ghostscript_10.01.1.bb
rename to meta/recipes-extended/ghostscript/ghostscript_10.01.2.bb
index 0d41242bc2..7461dbc7f7 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.01.1.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.01.2.bb
@@ -27,7 +27,8 @@ SRC_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/downlo
            file://avoid-host-contamination.patch \
 "
 
-SRC_URI[sha256sum] = "4df18a808cd4369f25e02dbcec2f133cb6d674627b2c6b1502020e58d43e32ce"
+# SRC_URI[sha256sum] = "4df18a808cd4369f25e02dbcec2f133cb6d674627b2c6b1502020e58d43e32ce"
+SRC_URI[sha256sum] = "a4cd61a07fec161bee35da0211a5e5cde8ff8a0aaf942fc0176715e499d21661"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+3"
-- 
2.25.1


