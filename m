Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76A64C5479D
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 10:08:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.10702.1672999689338455049
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jan 2023 02:08:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0370ea45eb=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 306A50vl010247
	for <openembedded-core@lists.openembedded.org>; Fri, 6 Jan 2023 02:08:08 -0800
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mtnfrus5q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 02:08:08 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 6 Jan 2023 02:08:08 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Fri, 6 Jan 2023 02:08:07 -0800
From: <mingli.yu@eng.windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] libportal: add opengl to REQUIRED_DISTRO_FEATURES
Date: Fri, 6 Jan 2023 18:08:06 +0800
Message-ID: <20230106100806.838732-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: MnmmCBtmvi2l7iMbrCTvjmxBrlzVP32e
X-Proofpoint-GUID: MnmmCBtmvi2l7iMbrCTvjmxBrlzVP32e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-06_05,2023-01-06_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=788
 impostorscore=0 mlxscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301060080
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 10:08:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175568

From: Mingli Yu <mingli.yu@windriver.com>

libportal depends on gtk4 which needs opengl DISTRO_FEATURES, so
add opengl DISTRO_FEATURES requirement for libportal too.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-gnome/libportal/libportal_0.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-gnome/libportal/libportal_0.6.bb b/meta/recipes-gnome/libportal/libportal_0.6.bb
index ca58ef4138..cb3c5631d9 100644
--- a/meta/recipes-gnome/libportal/libportal_0.6.bb
+++ b/meta/recipes-gnome/libportal/libportal_0.6.bb
@@ -14,6 +14,7 @@ inherit meson gi-docgen gobject-introspection vala features_check pkgconfig
 GIDOCGEN_MESON_OPTION = 'docs'
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
+REQUIRED_DISTRO_FEATURES = "opengl"
 
 DEPENDS += "glib-2.0 glib-2.0-native gtk+3 gtk4"
 
-- 
2.25.1


