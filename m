Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13533CD1292
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 07:03:45 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.11641.1712819020425926998
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Apr 2024 00:03:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=VLW6S6qp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4831dfd42e=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43B5C0VG025804
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Apr 2024 00:03:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=/+uQC
	fFs0jJfyg19DaRLPPKmn7+2GbPWUidIcelOFzY=; b=VLW6S6qpnzGofH+fiDc8h
	ICvyVKbnp5U/Q3sI9IggPlkkfwjHOm8jkN7PT3t6z7ljz0O8bPY+mpFkNsAf+Ffi
	DplELuxyy1xkuY+nkYqX6gdRahqU3DysgpqkTtkMYltT7ngQycvEuov67787NA3E
	8NxA6xEAR/BAkh/DwzPZVa7e7aenyEQTVQWF0g86Ng4ABYvJ4CL4LmtB89+8zCJl
	qN7x28EzNxNUA3jUCkN/c7SRgSzQsKt/r909fQG+NDSvuA4G2dnH9LaNt3J6bVW0
	Sp4l42hGKIVp2SwHhFen7oYZT8NXlpa/2bEgls6MFgF271bT9dRTTe6rAt3Yzznk
	g==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xb5wgnqff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Apr 2024 00:03:39 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Thu, 11 Apr 2024 00:03:39 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.37 via Frontend Transport; Thu, 11 Apr 2024 00:03:38 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] webkitgtk: 2.44.0 -> 2.44.1
Date: Thu, 11 Apr 2024 15:03:36 +0800
Message-ID: <20240411070336.3569870-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: IhEu-kqe-HOa5I3l0FeObjL-khrUFPCC
X-Proofpoint-ORIG-GUID: IhEu-kqe-HOa5I3l0FeObjL-khrUFPCC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-11_02,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 clxscore=1011 mlxscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404110049
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Apr 2024 07:03:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198115

From: Kai Kang <kai.kang@windriver.com>

Update webkitgtk from 2.44.0 to the first bug fix release in the stable
2.44 series 2.44.1.

* remove backported patch

What's new in the WebKitGTK 2.44.1 release?
===========================================

  - Fix handling of lifetime of web view child dialogs in GTK4.
  - Do not schedule layer flushes when drawing area size is empty.
  - Fix videos with alpha when using the DMA-BUF sink.
  - Fix the build with USE_GBM=OFF.
  - Fix the build in 32bit platforms
  - Fix several crashes and rendering issues.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...af379dc70b4b1a63b01d67179eb431f03ac4.patch | 38 -------------------
 ...ebkitgtk_2.44.0.bb => webkitgtk_2.44.1.bb} |  3 +-
 2 files changed, 1 insertion(+), 40 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/2922af379dc70b4b1a63b01d67179eb431f03ac4.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.44.0.bb => webkitgtk_2.44.1.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/2922af379dc70b4b1a63b01d67179eb431f03ac4.patch b/meta/recipes-sato/webkit/webkitgtk/2922af379dc70b4b1a63b01d67179eb431f03ac4.patch
deleted file mode 100644
index 3067500447..0000000000
--- a/meta/recipes-sato/webkit/webkitgtk/2922af379dc70b4b1a63b01d67179eb431f03ac4.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 2922af379dc70b4b1a63b01d67179eb431f03ac4 Mon Sep 17 00:00:00 2001
-From: Michael Catanzaro <mcatanzaro@redhat.com>
-Date: Mon, 18 Mar 2024 11:14:54 -0700
-Subject: [PATCH] REGRESSION(274077@main): failure to build on i586 (and likely
- other 32bit arches): static assertion failed: Timer should stay small
- https://bugs.webkit.org/show_bug.cgi?id=271108
-
-Unreviewed build fix. This changes SameSizeOfTimer to ensure it matches
-the size of Timer on 32-bit platforms.
-
-* Source/WebCore/platform/Timer.cpp:
-
-Canonical link: https://commits.webkit.org/276282@main
-
-Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/2922af379dc70b4b1a63b01d67179eb431f03ac4]
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
----
- Source/WebCore/platform/Timer.cpp | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/Source/WebCore/platform/Timer.cpp b/Source/WebCore/platform/Timer.cpp
-index 4f7c0f5c39ca9..0f3734cca2474 100644
---- a/Source/WebCore/platform/Timer.cpp
-+++ b/Source/WebCore/platform/Timer.cpp
-@@ -263,7 +263,11 @@ struct SameSizeAsTimer {
- 
-     WeakPtr<TimerAlignment> timerAlignment;
-     double times[2];
--    void* pointers[3];
-+    void* pointers[2];
-+#if CPU(ADDRESS32)
-+    uint8_t bitfields;
-+#endif
-+    void* pointer;
- };
- 
- static_assert(sizeof(Timer) == sizeof(SameSizeAsTimer), "Timer should stay small");
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.44.0.bb b/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.44.0.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.44.1.bb
index 0819f6de0d..29e12bb8c5 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.44.0.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb
@@ -16,9 +16,8 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://no-musttail-arm.patch \
            file://t6-not-declared.patch \
            file://30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch \
-           file://2922af379dc70b4b1a63b01d67179eb431f03ac4.patch \
            "
-SRC_URI[sha256sum] = "c66530e41ba59b1edba4ee89ef20b2188e273bed0497e95084729e3cfbe30c87"
+SRC_URI[sha256sum] = "425b1459b0f04d0600c78d1abb5e7edfa3c060a420f8b231e9a6a2d5d29c5561"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
-- 
2.34.1


