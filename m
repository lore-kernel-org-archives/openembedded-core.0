Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CED1C36019
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 06:49:29 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.45883.1743403761967191414
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Mar 2025 23:49:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=aHKUniB9;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743403762; x=1774939762;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1f7YwM4VJ81Ff73ijRkmu3GJb5M/zHY28dP1BKbTScs=;
  b=aHKUniB9mAITnYUMgjOW5/wVmVdvkGjmP4rPzklAVyWh+skasF3vxHto
   +v8jOYxWuKS6BDcVeGtvbxrNb3Q+pIjlaXisHM1r9GLIsaw/rcT22hUTT
   KfTAS1WksYXWvlsL6q9ai8+1bGM/dviSzFJrLBfvFFgeIascvQFklV0b6
   6OK031lVRYhsmxOx6ZWgTltJuMRaAht9vCmJd/tTmnIBZr+Z/pE/PMTOl
   M7Nfzohtx15D55REPj06be4MPA949yGiZWqnNnm4sVD8nT59kY4zTCC2w
   cdX8Im3cGuqviLTuRI7zkc/KeNAUU8syXkSmHQhxs/Onf4u2/w4C5sSVC
   Q==;
X-CSE-ConnectionGUID: 6x/QtR7CTKq/U0OzcJz0vw==
X-CSE-MsgGUID: ifTW3rapSsyjHjqIiNrmbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="194985132"
X-IronPort-AV: E=Sophos;i="6.14,290,1736780400"; 
   d="scan'208";a="194985132"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 15:49:20 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7555DC2267
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 15:49:17 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3902ABF4AF
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 15:49:17 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A59821A009A;
	Mon, 31 Mar 2025 14:49:16 +0800 (CST)
From: Lei Maohui <leimaohui@fujitsu.com>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Anuj Mittal <anuj.mittal@intel.com>,
	openembedded-core@lists.openembedded.org,
	Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [Patch v3 06/10] gstreamer1.0-plugins-base: upgrade 1.24.12 -> 1.26.0
Date: Mon, 31 Mar 2025 14:48:40 +0800
Message-Id: <20250331064844.2155-6-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
In-Reply-To: <20250331064844.2155-1-leimaohui@fujitsu.com>
References: <20250331064844.2155-1-leimaohui@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 06:49:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213945

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 ...1-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch | 4 ++--
 .../0002-ssaparse-enhance-SSA-text-lines-parsing.patch        | 2 +-
 .../0003-viv-fb-Make-sure-config.h-is-included.patch          | 2 +-
 ...ns-base_1.24.12.bb => gstreamer1.0-plugins-base_1.26.0.bb} | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.24.12.bb => gstreamer1.0-plugins-base_1.26.0.bb} (98%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
index e35ec026e4..7373bd3e26 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
@@ -1,4 +1,4 @@
-From e0478a9b3bb1b49c34aaf076152ed8e49cf909e0 Mon Sep 17 00:00:00 2001
+From bd1436f0027bb09cdcf90386910a497422d9a871 Mon Sep 17 00:00:00 2001
 From: zhouming <b42586@freescale.com>
 Date: Wed, 14 May 2014 10:16:20 +0800
 Subject: [PATCH] ENGR00312515: get caps from src pad when query caps
@@ -16,7 +16,7 @@ Signed-off-by: zhouming <b42586@freescale.com>
 diff --git a/gst-libs/gst/tag/gsttagdemux.c b/gst-libs/gst/tag/gsttagdemux.c
 old mode 100644
 new mode 100755
-index ef0ff90..53f05c8
+index 975fe83..df82840
 --- a/gst-libs/gst/tag/gsttagdemux.c
 +++ b/gst-libs/gst/tag/gsttagdemux.c
 @@ -1796,6 +1796,19 @@ gst_tag_demux_pad_query (GstPad * pad, GstObject * parent, GstQuery * query)
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
index 810a4ba676..fc9ad474d9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
@@ -1,4 +1,4 @@
-From 1b9887421de593854632571327b4918b880900c6 Mon Sep 17 00:00:00 2001
+From 1cc876662b7707eb5a2f668654f7921b5642e108 Mon Sep 17 00:00:00 2001
 From: Mingke Wang <mingke.wang@freescale.com>
 Date: Thu, 19 Mar 2015 14:17:10 +0800
 Subject: [PATCH] ssaparse: enhance SSA text lines parsing.
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
index 8fa46d809a..06b5bc41ed 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
@@ -1,4 +1,4 @@
-From 22a0e3a5288486991a15c48fdcb730eaa6dc08e5 Mon Sep 17 00:00:00 2001
+From c0c6944eca0c497477aa9f2cec2c83c4ea7a70e5 Mon Sep 17 00:00:00 2001
 From: Carlos Rafael Giani <crg7475@mailbox.org>
 Date: Tue, 21 May 2019 14:01:11 +0200
 Subject: [PATCH] viv-fb: Make sure config.h is included
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.0.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.12.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.0.bb
index f4505d831e..bd0131c647 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.0.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "f6efbaa8fea8d00bc380bccca76a530527b1f083e8523eafb3e9b1e18bc653d3"
+SRC_URI[sha256sum] = "e23189fbed2ec486690382d1055c19eeaf5aae3e95e2576fc4c884d96a90e69e"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
-- 
2.43.0


