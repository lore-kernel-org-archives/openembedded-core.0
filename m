Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA930C3601A
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 09:08:08 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.3864.1743584884200706211
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 02:08:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fquvCD4L;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743584884; x=1775120884;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Z7aH6ugM13dHtbYSflMe/MlFoCcQ8oNkyGFuQ286DCo=;
  b=fquvCD4LbNO13E9Ei9mf0UQ/1941VPf+fGsXAuo9SNFNtopme/tsqKJw
   /PKmpaEzztPHVPIGVEhe62oLaw1OhVLYIQZPAPoiubB50y0dRPNk2ZjxF
   FEDMGuRDLM3hk5uJWJi2RK3sXYkH43mQLq1omT0tEmPwoesWsNcgJf5Hy
   UQMDQiiHV8EtvbMWOLaLecLGEnIyWrjtLV7SfH8CRJzLA6HIFuou7upf7
   iofHSkYJF4KlMkSPdFyYhjQkWAZn697eGo3sH1oZ8usv+MxSkst1vMAGE
   L4fQX9zZvogxUPuciIG5Y5+L6T6aqtxAgfFFKz1q4qTRiU4vSaxK9THug
   g==;
X-CSE-ConnectionGUID: QDeOCqriQvCFtoeu+G/H5w==
X-CSE-MsgGUID: t30+qjo4QQOIkDCtQwZFxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="174667439"
X-IronPort-AV: E=Sophos;i="6.14,295,1736780400"; 
   d="scan'208";a="174667439"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 18:08:02 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id C2CF8D501A
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Apr 2025 18:07:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7C086D5110
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Apr 2025 18:07:59 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8875C1A0078;
	Wed,  2 Apr 2025 17:07:58 +0800 (CST)
From: Lei Maohui <leimaohui@fujitsu.com>
To: Alexander Kanavin <alex@linutronix.de>
Cc: Jose Quaresma <quaresma.jose@gmail.com>,
	Anuj Mittal <anuj.mittal@intel.com>,
	openembedded-core@lists.openembedded.org,
	Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [PATCH v4 01/10] gst-devtools: upgrade 1.24.12 -> 1.26.0
Date: Wed,  2 Apr 2025 17:07:39 +0800
Message-Id: <20250402090749.2119-1-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 09:08:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214233

Disable new meson option dots_viewer

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 .../0001-connect-has-a-different-signature-on-musl.patch       | 2 +-
 .../{gst-devtools_1.24.12.bb => gst-devtools_1.26.0.bb}        | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.24.12.bb => gst-devtools_1.26.0.bb} (93%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
index b596f2ef9c..d7a3e2057a 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
@@ -1,4 +1,4 @@
-From 67809420230cd4fcc63069f78efdc90c7b4c4ee1 Mon Sep 17 00:00:00 2001
+From 9ed608c901955b0906aac102d5d7ab06accee60e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 9 Sep 2018 17:38:10 -0700
 Subject: [PATCH] connect has a different signature on musl
diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.12.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.0.bb
similarity index 93%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.24.12.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.26.0.bb
index 157cdc6bbb..dc54a7ab4b 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.0.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "4ef3dd12e5827068d6db7ad01876d1216a80717116c24a0d5b3b57fd7e3c3478"
+SRC_URI[sha256sum] = "eff33d7dc292bb074a2788ea887b6283398ffdefafa49fb7d08efe6658a65648"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
@@ -37,6 +37,7 @@ EXTRA_OEMESON += " \
     -Ddoc=disabled \
     -Ddebug_viewer=disabled \
     -Dtests=disabled \
+    -Ddots_viewer=disabled \
     -Dvalidate=enabled \
     ${@gettext_oemeson(d)} \
 "
-- 
2.43.0


