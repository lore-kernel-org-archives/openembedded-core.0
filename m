Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFD3DC71153
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 08:07:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.9013.1693210056217843240
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Aug 2023 01:07:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QvOHjcWY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7604589802=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37S6nF8b018861
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Aug 2023 01:07:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=k8qUc
	mXBKU0/Z/Z9C6Gmpj9+heelNxQQIA7JkHvP0t8=; b=QvOHjcWYEsN+zJpuuhrQe
	HR6w5JLzfySEUHN359pwBpfniQCTHb/xkCEvEufJYCawnAcf6lHkSCmNPlyejUVY
	HHUNwWTAfujK2WqEwUuRovYLXUVGLYn57zWDGL3nO2/yF9dwlMxml7le1UqLOva3
	jJz3VQPQH/SvczDr8jO6CJW1JkM2E+0BWvXgifRfO/o2RObS6kCs+reoqJ8Czonm
	RSkQ5EBou9uyed6gYMtdpkZRFy2pRB1xM3+2CvwvsPAgEOw7rMSNk92RyRnEA1as
	6EH6082L80oeWP9D9RkszjdeGFMiNkljnSkr4ujgnY/lo+no80t8WtYygSZB/In6
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sqcp19asr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Aug 2023 01:07:35 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 28 Aug 2023 01:07:31 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Mon, 28 Aug 2023 01:07:30 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] webkitgtk: Add opengl to REQUIRED_DISTRO_FEATURES
Date: Mon, 28 Aug 2023 16:07:33 +0800
Message-ID: <20230828080733.4169557-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: m2IEgroVSswPlyXoC1KakIHdO5WePhhb
X-Proofpoint-GUID: m2IEgroVSswPlyXoC1KakIHdO5WePhhb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-28_05,2023-08-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 mlxlogscore=863 phishscore=0 clxscore=1015
 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2308280072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Aug 2023 08:07:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186818

From: Mingli Yu <mingli.yu@windriver.com>

webkitgtk depends on gtk4 which has the below logic, so add the
same logic for webkitgtk.
REQUIRED_DISTRO_FEATURES = "opengl"

Fixes:
  ERROR: Nothing PROVIDES 'gtk4' (but /build/layers/oe-core/meta/recipes-sato/webkit/webkitgtk_2.40.5.bb DEPENDS on or otherwise requires it)
  gtk4 was skipped: missing required distro feature 'opengl' (not in DISTRO_FEATURES)
  ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
  Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'webkitgtk', 'gtk4']

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.40.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.40.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.40.5.bb
index 7bf32e8610..39bb6a476f 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.40.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.40.5.bb
@@ -20,7 +20,7 @@ SRC_URI[sha256sum] = "7de051a263668621d91a61a5eb1c3771d1a7cec900043d4afef06c326c
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
-REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'opengl', '', d)}"
+REQUIRED_DISTRO_FEATURES = "opengl"
 
 CVE_PRODUCT = "webkitgtk webkitgtk\+"
 
-- 
2.25.1


