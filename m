Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59F7D106F31B
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 10:22:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44186.1774520514969459207
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 03:21:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=JUrinKMR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7545a6f598=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q3jJVE2520449
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 03:21:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=lo72MFwRKf3mji6fa2OTadyFOhC20qNhtM1NL/EAbEk=; b=JUrinKMRRhhZ
	ew/ODQ+wJWxsgBg0Q28+yovIucOv9dVH/5eLWlGCkZsUXPxZWPU14qa42Sbd9i+d
	mXnNZPJxY7qT0aIJzz7YM6DE/xm2pmEet3h5E9mz5MRRRl0tb056Q3+6bZoWj03t
	voaB9Qe/yM7SQCuLUP19uSot4xIvdkT+BoLFXCya9jPFC105fXltiDogF+Yf1K2D
	8cTmBGLzuqY3zHAKe3xrrJ1Sq1ajZSMdTQ5LxgBT6bak/71o8ds3rY3F+FCb0zkr
	qpG3caNteGHskfHK04DPFSuBLIOQcal4wlbtnnNKcSAyhvav7WHBc2snlmdoSKQC
	klGyUUz7Vw==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1pkye5kk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 03:21:54 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 26 Mar 2026 03:21:53 -0700
Received: from pek-lpg-core1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 26 Mar 2026 03:21:52 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <kai.kang@windriver.com>
Subject: [meta-openembedded][PATCH 1/2] gtkmm3/gtkmm4: not set BPN
Date: Thu, 26 Mar 2026 18:21:49 +0800
Message-ID: <20260326102150.1059814-2-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260326102150.1059814-1-liezhi.yang@windriver.com>
References: <20260326102150.1059814-1-liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA3MSBTYWx0ZWRfX7GM9HYMlAXhK
 prInx8rBfyGoZc+dAL7A8vbGqL6kSZHBgUPa2Ac6ERUb1zi3yzNcGahBfQB+n4OxkH/MSBjRCUb
 93u4SmxDI56V/nue+/Ja0kbp1xRRe0Bf7xkfEIGg3SoVxazq3VyDslyMqpRaTseEVLpQFxBSPAg
 eQtjUNGouyxGLDk4zyj6xzPX1eg4O6HwhAzdz4bGpgrVdCbm3UYgHrVlnaALur3RFxKAljqgUNZ
 8YEEJ3VD57v10bpjRQzuLUetnKT9IZ56fnElVS/4dd3Xua/bBuX1aVHq8kpf4stXgWfPEgxNzXg
 XvDI+JWNDFyh94nLuKGQIzloWhrs+2fkwlrhvEiYtEUDEEUtXcxo7lryIwHEUS6mLFj7FxV6nlY
 DsWA2cSs4UdwvbaIezx8uNBDq67yz6vTqBxKEkiwsilu5tdkuE0JK6lH2KsoZh1gZvGd5Wr8Pp4
 i6f1Hbp4kNg05ynHOnQ==
X-Proofpoint-ORIG-GUID: hubPNRnD5ngUmFjgsXZL3knZFZJnVEuJ
X-Authority-Analysis: v=2.4 cv=Scr6t/Ru c=1 sm=1 tr=0 ts=69c508c2 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=FITgiwhp3EThsV-Ew7YA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: hubPNRnD5ngUmFjgsXZL3knZFZJnVEuJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260071
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 10:22:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233963

From: Kai Kang <kai.kang@windriver.com>

Issue: LIN1025-8580

Set BPN in gtkmm3 and gtkmm4 recipes is to inherit gnomebase.bbclass
properly. But it uses variable GNOMEBN rather than BPN for SRC_URI and
S in gnomebase.bbclass now, update in the recipes accordingly.

(master rev: 96a6c18a8cc6551a1aa6acc9644177b4218cb3fb)

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.7.bb | 3 +--
 meta-oe/recipes-gnome/gtk+/gtkmm4_4.14.0.bb | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.7.bb b/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.7.bb
index cac6474e73..b09d1150bb 100644
--- a/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.7.bb
+++ b/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.7.bb
@@ -8,8 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 DEPENDS = "glib-2.0-native atkmm pangomm glibmm gtk+3 cairomm gdk-pixbuf-native"
 
-BPN = "gtkmm"
-
+GNOMEBN = "gtkmm"
 
 inherit gnomebase features_check
 
diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm4_4.14.0.bb b/meta-oe/recipes-gnome/gtk+/gtkmm4_4.14.0.bb
index d3a01e444c..dcb23cdf17 100644
--- a/meta-oe/recipes-gnome/gtk+/gtkmm4_4.14.0.bb
+++ b/meta-oe/recipes-gnome/gtk+/gtkmm4_4.14.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 DEPENDS = "glib-2.0-native atkmm pangomm-2.48 glibmm gtk4 cairomm-1.16 gdk-pixbuf-native"
 
-BPN = "gtkmm"
+GNOMEBN = "gtkmm"
 
 inherit gnomebase features_check
 
-- 
2.34.1


