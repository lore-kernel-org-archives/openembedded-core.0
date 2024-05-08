Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A58F2C04FFE
	for <webhook@archiver.kernel.org>; Wed,  8 May 2024 12:23:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.10845.1715171028643857811
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 May 2024 05:23:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=MO/IS/LJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5858ca950f=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4489h7h2028842
	for <openembedded-core@lists.openembedded.org>; Wed, 8 May 2024 05:23:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=afbwj
	RNjdWgnW78uQB/kyWLlxagbD5sKwfvC9N0u+kc=; b=MO/IS/LJfpEN1pUELaaJW
	Jo8m4RyEZisN1ef5thc8lEz57lMnjQQLY96DJ9bR3apsrndyjRwTTwzGKbwX4tnn
	Yq9V67nanXWMk2+ZAlVl/+n4lV3XE6k1CrslNCZQln80EPQEkzfMqEUMtdmtaqjB
	YFXoRWz5C3LiP9BfMz+dAmfQ9fI27I3kOl0g+wC37+MP48evf3KdpmFUG3zqAhkf
	6hI4cmCR1vXTavv7gYZjfZjYtKwaxaDhGy7hsETUFC678v8N5C3twv194JxfpINL
	D6kKMI0/zl2Qbd7ECfQhBD6H1hRig3vbG/5vp6ALNRZJJOkTHxcoNg+NqvqxbrzZ
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xyse18rqe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 08 May 2024 05:23:48 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Wed, 8 May 2024 05:23:46 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][master][scarthgap][PATCH 1/1] xserver-xorg: upgrade 21.1.11 -> 21.1.12
Date: Wed, 8 May 2024 12:23:28 +0000
Message-ID: <20240508122328.1930030-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: ia8yJH0wSpU0u5wjf4vLAgHQwS5oNE2r
X-Proofpoint-ORIG-GUID: ia8yJH0wSpU0u5wjf4vLAgHQwS5oNE2r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-08_07,2024-05-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 mlxscore=0 malwarescore=0 phishscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 suspectscore=0 bulkscore=90 adultscore=0
 lowpriorityscore=90 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405080087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 May 2024 12:23:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199118

From: Archana Polampalli <archana.polampalli@windriver.com>

This release contains security fixes for

* CVE-2024-31080
* CVE-2024-31081
* CVE-2024-31082
* CVE-2024-31083

Changelog:
===========
101caa1b0 (tag: xorg-server-21.1.12) xserver 21.1.12
117315640 render: fix refcounting of glyphs during ProcRenderAddGlyphs
0e34d8ebc Xquartz: ProcAppleDRICreatePixmap needs to use unswapped length to send reply
cea92ca78 Xi: ProcXIPassiveGrabDevice needs to use unswapped length to send reply
8a7cd0e3e Xi: ProcXIGetSelectedEvents needs to use unswapped length to send reply
5ca3a9513 Xext: SProcSyncCreateFence needs to swap drawable id too
5d7272f05 Allow disabling byte-swapped clients
8a46a463f Initialize Mode->name in xf86CVTMode()
f653d9a0a hw/xfree86: fix NULL pointer refrence to mode name
8b75ec34d dix: Fix use after free in input device shutdown

https://lists.x.org/archives/xorg-announce/2024-April/003497.html

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../{xserver-xorg_21.1.11.bb => xserver-xorg_21.1.12.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.11.bb => xserver-xorg_21.1.12.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.11.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.12.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.11.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.12.bb
index 6506d775ca..570e08d5ae 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.11.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.12.bb
@@ -3,7 +3,7 @@ require xserver-xorg.inc
 SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
            "
-SRC_URI[sha256sum] = "1d3dadbd57fb86b16a018e9f5f957aeeadf744f56c0553f55737628d06d326ef"
+SRC_URI[sha256sum] = "1e016e2be1b5ccdd65eac3ea08e54bd13ce8f4f6c3fb32ad6fdac4e71729a90f"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.40.0


