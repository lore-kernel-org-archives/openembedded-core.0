Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B456C36017
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 06:49:29 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.46073.1743403758694083498
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Mar 2025 23:49:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Uza6TOfK;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743403759; x=1774939759;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Z7aH6ugM13dHtbYSflMe/MlFoCcQ8oNkyGFuQ286DCo=;
  b=Uza6TOfKWnbPvZYLedoNjKNv935SOQSKYNnIoo+ZLJgUCPkqjJBvp259
   h+7eZuj2roN77T58WUFFksbXH2w8eb17fXUW1YnUl2Y3NH3WMpbB5vXYg
   Ktbr8aZqfSovMKgFjJ0fiTcNBR/1LXjzFGuwRAC306JwWwQRHo6dKCuL5
   ETQHJ6xjmaJb/YyDiB7CnC7TUSq/7vvdUY0QppsPQlosHb27vQGm9fg1S
   hhYcB/wLWKHHpHdlKxVCrQ7XwDxZExUb2o9kJSJ2XHQ5Ueaj2c7wnMNww
   eHVWK41GIzFndrfeGcSpe9wdxZiVK1BVabooqqwhj/u1Afy7xuuYbDkwA
   Q==;
X-CSE-ConnectionGUID: d0KB0WOUQim+SqMlG19VnA==
X-CSE-MsgGUID: R/+LvGSXTAK2rYZlDdAbgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="194967481"
X-IronPort-AV: E=Sophos;i="6.14,290,1736780400"; 
   d="scan'208";a="194967481"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 15:49:17 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7F57CD4F41
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 15:49:14 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3E12BD5080
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 15:49:14 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 61BF01A0078;
	Mon, 31 Mar 2025 14:49:13 +0800 (CST)
From: Lei Maohui <leimaohui@fujitsu.com>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Anuj Mittal <anuj.mittal@intel.com>,
	openembedded-core@lists.openembedded.org,
	Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [Patch v3 01/10] gst-devtools: upgrade 1.24.12 -> 1.26.0
Date: Mon, 31 Mar 2025 14:48:35 +0800
Message-Id: <20250331064844.2155-1-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 06:49:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213938

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


