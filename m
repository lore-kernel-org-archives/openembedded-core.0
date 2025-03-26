Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45020C28B30
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 03:57:45 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.14533.1742961456686600367
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Mar 2025 20:57:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=W9za3CCh;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742961457; x=1774497457;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/nR+Ey61SnGZ2mkgNEPjY+aU6a0dz/D7Z01WRh8ja20=;
  b=W9za3CCh5p7vFOFR/V0+T7iLOM/YSB1pBCoK2TMg+rArLhtnxZDdeauO
   SnqrK5pQ/bq+hhOGB9g7Tby7hPCXULjw9u2SJ7GD0rrynGXH5I+SX2CA4
   6BTwWZkPV8WCFpqD7B1QJ7Ftt1xwY2gFdbKIWYx5JjlvGO2luEbotD+hE
   csmgVaBHMMf8YKav/MkjO0HcfSIbjr75mbQziIAp0PjX5EfgNkOfeAM8T
   SF65Zo6dyFMZw2WN5woXDWojrhL82VZaLmJyBa80uvYFf7QMEf/LF4gMY
   oUxRmq/ZemdHsLGD4/tvBDgsCFVxQ+Y7bgzBaHn1ONRc/ojlwapgrAp+n
   A==;
X-CSE-ConnectionGUID: 1Mo7sNCrQvKZf5OArdw3+A==
X-CSE-MsgGUID: +akgVCh6RjOQFDL/v9LgsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="197056677"
X-IronPort-AV: E=Sophos;i="6.14,276,1736780400"; 
   d="scan'208";a="197056677"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 12:57:34 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 33D46D480A
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 12:57:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id E940CD4BD6
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 12:57:31 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2E30B1A0078;
	Wed, 26 Mar 2025 11:57:31 +0800 (CST)
From: Lei Maohui <leimaohui@fujitsu.com>
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org,
	Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [PATCH 1/7] gst-devtools: upgrade 1.24.12 -> 1.26.0
Date: Wed, 26 Mar 2025 11:56:33 +0800
Message-Id: <20250326035639.1919-1-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 03:57:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213625

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 .../0001-connect-has-a-different-signature-on-musl.patch        | 2 +-
 .../{gst-devtools_1.24.12.bb => gst-devtools_1.26.0.bb}         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.24.12.bb => gst-devtools_1.26.0.bb} (95%)

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
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.24.12.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.26.0.bb
index 157cdc6bbb..ca802510d4 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.0.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "4ef3dd12e5827068d6db7ad01876d1216a80717116c24a0d5b3b57fd7e3c3478"
+SRC_URI[sha256sum] = "eff33d7dc292bb074a2788ea887b6283398ffdefafa49fb7d08efe6658a65648"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
-- 
2.43.0


