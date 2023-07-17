Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E0DDC001E0
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 09:10:55 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.4235.1689585045628021946
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 02:10:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="112851582"
X-IronPort-AV: E=Sophos;i="6.01,211,1684767600"; 
   d="scan'208";a="112851582"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 18:10:42 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id D056BDE623
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 18:10:40 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id CD95BBF4A5
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 18:10:39 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id F284F2FC86AA;
	Mon, 17 Jul 2023 18:10:38 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] glib-2.0: upgrade 2.76.3 -> 2.76.4
Date: Mon, 17 Jul 2023 17:10:12 +0800
Message-Id: <1689585025-23731-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689585025-23731-1-git-send-email-wangmy@fujitsu.com>
References: <1689585025-23731-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27756.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27756.006
X-TMASE-Result: 10-7.711200-10.000000
X-TMASE-MatchedRID: QR1SVCCbVGSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbysDduXkDV9qLQsc
	YS3HCNn/8jycW/zJAlzZZZGAG9uFDWCWMxyPa3JeHWRJEfGP5nkMLp9iMyfi/B//bz4/xYKA6I9
	N7ME4londaGCxYmwJcA3KvrUy7pE6bRev5+PfDD/y3h9RQZ4StME5XPQnBzGXkZQXc2Em7eIdjB
	1KZ6xMAIWRWNfB971R3UH0HZLWE7hZxhI5bGrNslgowyUWHgGdVeAZ5VSHdZ2bKItl61J/yZ+in
	TK0bC9eKrauXd3MZDXm2kpDqhlxMEu4Z+rdNDub6h/Y5Xx/1IE0o/bK3EioednNUK/e55ftqIxs
	B5AFis6319IZVgExmrQNezeo7YCfudAVHLrtC98JK2MK45H+GA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 09:10:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184442

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
* Fix build failure on Android with 'statx()' support (#3039)

* Bugs fixed:
  - #3003 glib-compile-schemas failed on directory name with no Latin symbols
  - #3039 Build failure due to statx fields with NDK r25.c
  - !3447 Backport !3446 "glib-compile-resources: Fix non-ASCII arg parsing on
    Windows" to glib-2-76
  - !3479 Backport !3473 "glib: reset errno to 0 when futex() returns EAGAIN" to
    glib-2-76
  - !3480 Backport !3468 "Avoid stack overflow in gspawn on macOS" to glib-2-76
  - !3492 Backport !3482 "glocalfileinfo: Fix incorrect use of struct
    statx.st_mtimensec on Android" to glib-2-76

* Translation updates:
  - English (United Kingdom)
  - Portuguese (Brazil)
  - Slovak

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../glib-2.0/{glib-2.0_2.76.3.bb => glib-2.0_2.76.4.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.76.3.bb => glib-2.0_2.76.4.bb} (96%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb
similarity index 96%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb
index 4327a13345..64a3c6d80c 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb
@@ -19,7 +19,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 
-SRC_URI[sha256sum] = "c0be444e403d7c3184d1f394f89f0b644710b5e9331b54fa4e8b5037813ad32a"
+SRC_URI[sha256sum] = "5a5a191c96836e166a7771f7ea6ca2b0069c603c7da3cba1cd38d1694a395dda"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.34.1


