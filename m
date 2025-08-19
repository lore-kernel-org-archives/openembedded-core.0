Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51ABCCA0EE4
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 03:35:50 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.5631.1755574542730048094
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Aug 2025 20:35:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Ih97ArLn;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755574545; x=1787110545;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xt3P46mMEeaTwPdtZCz+IyJCzwNK1HeYcCiFMKcqDVw=;
  b=Ih97ArLnMEOsz0zJ/bukO19bLCYnSlViFqzWPQ3YN8rzfd2/REovuIoW
   pR5YtC16UqHBtJzGVyJJQ1pcaEs0HYf7EuvnAqUeyBFVqjttYhy6vyVyr
   xq/Sc0eAfDtR22eKzCKJE2VV0MsEcPgubrJ4hKDyDMtQi8kif9aoTjTfL
   Bj+qfu0TJBFVAa0cs3dSdEuL8gN5/zFStvKIcJbk9PlO/+e2Ztwp7GpUB
   LOw97bW9XX4r0fbfP9neMe1Sf9GgSILabP8nId1COkMxGEXAuTA8f7lm8
   GY6qQvWOu7xtQB4PKA/vK0xw3Frs200Ip1ecJ54YZ/KM5V1lfpykIbn7Z
   Q==;
X-CSE-ConnectionGUID: 9KiVTPuXS3yAyuQbA6mbVg==
X-CSE-MsgGUID: PtK5WlAST0CRpJIgE4G/Ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="209708783"
X-IronPort-AV: E=Sophos;i="6.17,300,1747666800"; 
   d="scan'208";a="209708783"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 12:35:43 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 427891000341
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 03:35:43 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id F0A39C021E7
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 03:35:42 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTPS id D56F81800B16
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 03:35:40 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 292521A008A;
	Tue, 19 Aug 2025 11:35:37 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH 07/11] gstreamer1.0-plugins-base: upgrade 1.26.3 -> 1.26.5
Date: Tue, 19 Aug 2025 11:34:28 +0800
Message-ID: <20250819033433.390-7-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250819033433.390-1-liuyd.fnst@fujitsu.com>
References: <20250819033433.390-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 03:35:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222067

Changelog:
=================
- audioconvert: Fix regression when using a mix matrix
- audioconvert: mix-matrix causes caps negotiation failure
- decodebin3: Don't error on an incoming ONVIF metadata stream
- gloverlay: Recompute geometry when caps change, and load texture after stopping and starting again
- uridecodebin3: Add missing locking and NULL checks when adding URIs to messages
- uridecodebin3: segfault in update_message_with_uri() if no decoder available
- videorate, imagefreeze: add support for JPEG XS
- gst-device-monitor-1.0: Add shell quoting for launch lines
- gst-device-monitor-1.0: Fix criticals, and also accept utf8 in launch lines
- gst-device-monitor-1.0: Use gst_print instead of g_print

Refer to release note, no changes this time
https://gstreamer.freedesktop.org/releases/1.26/#1.26.5

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch | 2 +-
 .../0002-ssaparse-enhance-SSA-text-lines-parsing.patch          | 2 +-
 .../0003-viv-fb-Make-sure-config.h-is-included.patch            | 2 +-
 ...ugins-base_1.26.3.bb => gstreamer1.0-plugins-base_1.26.5.bb} | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.26.3.bb => gstreamer1.0-plugins-base_1.26.5.bb} (98%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
index 7373bd3e26..719c73d3e3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
@@ -1,4 +1,4 @@
-From bd1436f0027bb09cdcf90386910a497422d9a871 Mon Sep 17 00:00:00 2001
+From a37f0063103e98f5109132ea302b919b92e26a38 Mon Sep 17 00:00:00 2001
 From: zhouming <b42586@freescale.com>
 Date: Wed, 14 May 2014 10:16:20 +0800
 Subject: [PATCH] ENGR00312515: get caps from src pad when query caps
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
index fc9ad474d9..bf1e2a89e3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
@@ -1,4 +1,4 @@
-From 1cc876662b7707eb5a2f668654f7921b5642e108 Mon Sep 17 00:00:00 2001
+From f892f0be8ae88acc6482f4b9a9a4db5f03b7adf8 Mon Sep 17 00:00:00 2001
 From: Mingke Wang <mingke.wang@freescale.com>
 Date: Thu, 19 Mar 2015 14:17:10 +0800
 Subject: [PATCH] ssaparse: enhance SSA text lines parsing.
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
index 06b5bc41ed..1a988b99de 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
@@ -1,4 +1,4 @@
-From c0c6944eca0c497477aa9f2cec2c83c4ea7a70e5 Mon Sep 17 00:00:00 2001
+From 6f06f4b2f13f028250189225a46a39f402428930 Mon Sep 17 00:00:00 2001
 From: Carlos Rafael Giani <crg7475@mailbox.org>
 Date: Tue, 21 May 2019 14:01:11 +0200
 Subject: [PATCH] viv-fb: Make sure config.h is included
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.5.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.5.bb
index 74eb1360f6..f12d81cda9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.5.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "4ef9f9ef09025308ce220e2dd22a89e4c992d8ca71b968e3c70af0634ec27933"
+SRC_URI[sha256sum] = "f0c0e26cbedaa57732cb6a578e8cc13a1164bf18d737d55c333061c52f0c48d7"
 
 S = "${UNPACKDIR}/gst-plugins-base-${PV}"
 
-- 
2.43.0


