Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F436C38A02
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 15:55:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.1173.1666972530631107781
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Oct 2022 08:55:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ehZphcMU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8300e855dc=narpat.mali@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 29SCJ3hb012006
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 15:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=zWEAc0N7e8C0fw06ORIo9+NP7ZFUSg6qTVGMjephEL0=;
 b=ehZphcMU7ybhna5+gQ/7lCAZPnSMIFlUZ6qJ3Vmjxq2OvLKc/mTJHucn5CjGhfg/yTDw
 ZzJIuhCQNc+qDt7AZUmXKbKT1ZJiQraWIPeOO3SINUWO3/L5KK2g/wOm13Taze27Fsiz
 0TquEQXUBSUzhIdLjBq4JZBCukUIe5+Ljn2C2qX8fBL1IUmdCt3Bki86RhGUS8pMYjk1
 TcdpvpMZf4Z+Nw0DV40bxHh7d0B3oIoV2sAx29I2HrUtQrr3YIaJQX7CuGLuFPES64j8
 NUF2lC/p6MyHtqL/JJmT6eJ9q+KDNnko1HgKbmbJ2e76GPYKMAYoKectWGfEuJ73ggtV zA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kfg3xhjga-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 15:55:29 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29SFtTRr017221
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 15:55:29 GMT
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kfg3xhjg7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 28 Oct 2022 15:55:29 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 28 Oct 2022 08:55:26 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 28 Oct 2022 08:55:25 -0700
From: Narpat Mali <narpat.mali@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <archana.polampalli@windriver.com>, <hari.gpillai@windriver.com>,
        "Narpat
 Mali" <narpat.mali@windriver.com>,
        Alexander Kanavin <alex@linutronix.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-core][kirkstone][PATCH 2/2] wayland: update 1.20.0 -> 1.21.0
Date: Fri, 28 Oct 2022 15:53:31 +0000
Message-ID: <20221028155331.1594577-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: L7BkLg9BkuK3wIuzISw2a8X2Zud9b6I-
X-Proofpoint-ORIG-GUID: CQmEQefG0P8gMQ4piBh_1__heu_c4MWe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-28_07,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 mlxlogscore=948 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2210280099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 15:55:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172262

Drop the patch, as it is no longer necessary
(genereated .pc defines everything as relative to the .pc path).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Upstream master commit:
https://git.openembedded.org/openembedded-core/commit/?id=e525db4eb9556979c67f6a908f6646363154cd06

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 ...hardcode-the-path-to-wayland-scanner.patch | 27 -------------------
 .../{wayland_1.20.0.bb => wayland_1.21.0.bb}  |  3 +--
 2 files changed, 1 insertion(+), 29 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/wayland/0002-Do-not-hardcode-the-path-to-wayland-scanner.patch
 rename meta/recipes-graphics/wayland/{wayland_1.20.0.bb => wayland_1.21.0.bb} (93%)

diff --git a/meta/recipes-graphics/wayland/wayland/0002-Do-not-hardcode-the-path-to-wayland-scanner.patch b/meta/recipes-graphics/wayland/wayland/0002-Do-not-hardcode-the-path-to-wayland-scanner.patch
deleted file mode 100644
index e3e71925b8..0000000000
--- a/meta/recipes-graphics/wayland/wayland/0002-Do-not-hardcode-the-path-to-wayland-scanner.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 3e7cd56611aeec274e48a4816bc7c21f74f15be0 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Mon, 17 Feb 2020 21:46:18 +0100
-Subject: [PATCH] Do not hardcode the path to wayland-scanner
-
-This results in host contamination during builds.
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- src/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/meson.build b/src/meson.build
-index 15730a3..61edbc8 100644
---- a/src/meson.build
-+++ b/src/meson.build
-@@ -52,7 +52,7 @@ if get_option('scanner')
- 			'datarootdir=' + join_paths('${prefix}', get_option('datadir')),
- 			'pkgdatadir=' + join_paths('${datarootdir}', meson.project_name()),
- 			'bindir=' + join_paths('${prefix}', get_option('bindir')),
--			'wayland_scanner=${bindir}/wayland-scanner'
-+			'wayland_scanner=wayland-scanner'
- 		],
- 		filebase: 'wayland-scanner'
- 	)
diff --git a/meta/recipes-graphics/wayland/wayland_1.20.0.bb b/meta/recipes-graphics/wayland/wayland_1.21.0.bb
similarity index 93%
rename from meta/recipes-graphics/wayland/wayland_1.20.0.bb
rename to meta/recipes-graphics/wayland/wayland_1.21.0.bb
index dd48a29dc4..2092deac92 100644
--- a/meta/recipes-graphics/wayland/wayland_1.20.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.21.0.bb
@@ -14,10 +14,9 @@ DEPENDS = "expat libffi wayland-native"
 
 SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://run-ptest \
-           file://0002-Do-not-hardcode-the-path-to-wayland-scanner.patch \
            file://0001-build-Fix-strndup-detection-on-MinGW.patch \
            "
-SRC_URI[sha256sum] = "b8a034154c7059772e0fdbd27dbfcda6c732df29cae56a82274f6ec5d7cd8725"
+SRC_URI[sha256sum] = "6dc64d7fc16837a693a51cfdb2e568db538bfdc9f457d4656285bb9594ef11ac"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 UPSTREAM_CHECK_REGEX = "wayland-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
-- 
2.34.1


