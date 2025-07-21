Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CCFBC87FC5
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 04:52:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.32909.1753073511063656125
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Jul 2025 21:51:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=92971a342b=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56L4hv9l1036248
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Jul 2025 21:51:50 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4806n0sc8r-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Jul 2025 21:51:50 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Sun, 20 Jul 2025 21:51:38 -0700
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Sun, 20 Jul 2025 21:51:38 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/1] gnu-config: Update to 20250709
Date: Sun, 20 Jul 2025 21:51:51 -0700
Message-ID: <fe0ea784e524133447d7f5548fe41dfd034e9660.1753073349.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1753073349.git.liezhi.yang@windriver.com>
References: <cover.1753073349.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDA2OCBTYWx0ZWRfX6FswOpIaBSpm
 QOhsYWQI3eRE59ppgJ7RWEmhSL7yZTk4uvaLOQV57X+7hDTaf1GL6tekpY33XUf7neDl4P27V38
 Lux9rrlbBo884EpoIwd3VklfYwCnfDWLVRfBUe32dsKyJyBpdYHESNIB65i0HHSecnwCtc/3MhU
 h/ogrzgl91qkEAHjj7RrTyh81k+gGmC7hGOtK9wpEtA/pIcMvEu36r5FMhotEtYYELUQNf8x26n
 R8wVvzZctyeNv5/CI8k34xbgX5rzWNfB6XumgvtSk/ZlE6vrcxxGqMcgqFTwkZfupBDe1FKsIh4
 xjkxyOrnQWjnvijm1RgpIVq96PuaeYGKUjHaaDDck4wqlzqOU8rCg3dXFzSqW2Vc2vgGabul1KF
 E7vX3l7t
X-Proofpoint-ORIG-GUID: d8Y-fx0Er2h7w7RUFWik9ur8G3ORTssH
X-Proofpoint-GUID: d8Y-fx0Er2h7w7RUFWik9ur8G3ORTssH
X-Authority-Analysis: v=2.4 cv=W4g4VQWk c=1 sm=1 tr=0 ts=687dc766 cx=c_pps
 a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17
 a=Wb1JkmetP80A:10 a=t7CeM3EgAAAA:8 a=mDV3o1hIAAAA:8 a=48najAorCuO4aFBzrYwA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507190068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 04:52:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220655

From: Robert Yang <liezhi.yang@windriver.com>

The version 20250709 is the author date.

* The changes are:
a2287c3 Adjust 'time-stamp' variables to modern Emacs
973e3e6 config.sub: Add Tock OS support
3a71dc1 config.sub: recognize banan_os
f91a544 config.sub: fix a duplicated case pattern
484648c config.sub: Include support for arm64_32 and iOS/tvOS/watchOS simulators
84cc2cc Update copyright years
7f41495 config.sub: add intelgt as a basic machine
9f6e0fe ironclad: change ironclad to ironclad-mlibc

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/gnu-config/gnu-config_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index 515777caf4..65a32effd7 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -9,8 +9,8 @@ DEPENDS:class-native = "hostperl-runtime-native"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-SRCREV = "00b15927496058d23e6258a28d8996f87cf1f191"
-PV = "20240823+git"
+SRCREV = "a2287c3041a3f2a204eb942e09c015eab00dc7dd"
+PV = "20250709+git"
 
 SRC_URI = "git://git.savannah.gnu.org/git/config.git;protocol=https;branch=master \
            file://gnu-configize.in"
-- 
2.49.0


