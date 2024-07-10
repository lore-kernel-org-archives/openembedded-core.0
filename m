Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC0A6C3DA4A
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 09:44:18 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.10228.1720604655855506421
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 02:44:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=f+xCwm/z;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1720604658; x=1752140658;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ANb/Ow/ngvoCxPvywnnEC7lPwG9i6VJm2XSXeZhVeTE=;
  b=f+xCwm/zFrdAe9txIWpiPGq0vHFVLvuTukZJhHZnWSEkhkfqPrJDd81C
   9c7GNS1mijzpU394QmOVxgIYrx5ch8eXSFsfZDB8mMx0vfJ5m6R8AxkGP
   i/K/fxEI2jv8/IWfiYkeWPaFJCX26YzJstFj5/8o8XL4+T7/W333BCvTR
   w8NR4Sf7NMRtz75OWiGKMoXWJqRRi2DAL9L+yK3CYh/zKsAdkwdi9QRqo
   CaFps+Y/+HdwUVABhUWkHgWnEu+h20YOkP8RQLkaXQQsMq3quA1S+HEWH
   x3Fu8bMX/V+wYtOMUyBcA56R84buFarRtxvgGSi9LIPOqfBVwRPL7s1Wp
   A==;
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="145971266"
X-IronPort-AV: E=Sophos;i="6.09,197,1716217200"; 
   d="scan'208";a="145971266"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 18:44:17 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7BB12D6482
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:14 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id C676ED7627
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:13 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3DABE2005018E
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:13 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E191C1A0002;
	Wed, 10 Jul 2024 17:44:12 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 12/30] libadwaita: upgrade 1.5.1 -> 1.5.2
Date: Wed, 10 Jul 2024 17:43:36 +0800
Message-Id: <1720604634-23406-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
References: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28520.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28520.006
X-TMASE-Result: 10--1.109200-10.000000
X-TMASE-MatchedRID: QR1SVCCbVGSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyu8B7vl7G5M0ZgU
	Ly4zAbFBO3euaSI+sOeimSJP5hNpi1nAOGOnLpRWVV4ZZmbE3YxNLPQl0QAltKvWBS71/UX/YM7
	CqUrhUu9ydMZD9js5evbZNAMcHHCGJS5vQb+mjdwD2WXLXdz+AdXLiEcLf+DIsrDwfHQQaK1yp+
	gwY/4LBCL637QCIVpiXEPxV8mxOObIY6JevWs4vrGWmeVAULKHN9Ckh1HmlZibKItl61J/yZ+in
	TK0bC9eKrauXd3MZDVyhif2hGoYM5zIm8QsPgow02Hpj1rwt4e6JOeozBh8XqAVHrjQkw6Om7F/
	eDzjqcK27iegW+ZF0kAp8fTZPOYTQ0wjIqBPMpzyvrjvn2gBWVPJnXL2yNYdkuo847l05tDEzMy
	Amsz+FHoWLWlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 09:44:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201706

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- AdwAlertDialog
  - Fix unmatched va_start()
  - Fix setting default widget when removing a response
- AdwBreakpointCondition
  - Fix leaks when parsing
- AdwBreakpointBin
  - Fix a leak
- AdwDialog
  - Fix toggling presentation mode
  - Fix close button ignoring :can-close
  - Fix ::close-attempt not emitting in some cases
  - Fix swipe area for bottom sheets
  - Leak fixes
- AdwHeaderBar
  - Fix initial focus for the back button
  - Fix split view links in docs
- AdwMessageDialog
  - Fix unmatched va_start()
- AdwSpinRow
  - Fix ::input handling
- AdwTabButton
  - Fix needs-attention badge on RTL
- AdwTabView
  - Accessibility fixes
- AdwViewStack
  - Accessibility fixes
- Translation updates
  - Nepali

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libadwaita/{libadwaita_1.5.1.bb => libadwaita_1.5.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libadwaita/{libadwaita_1.5.1.bb => libadwaita_1.5.2.bb} (88%)

diff --git a/meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb b/meta/recipes-gnome/libadwaita/libadwaita_1.5.2.bb
similarity index 88%
rename from meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb
rename to meta/recipes-gnome/libadwaita/libadwaita_1.5.2.bb
index 6cb67c0db0..078f81c677 100644
--- a/meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb
+++ b/meta/recipes-gnome/libadwaita/libadwaita_1.5.2.bb
@@ -10,7 +10,7 @@ DEPENDS = " \
 
 inherit gnomebase gobject-introspection gi-docgen vala features_check
 
-SRC_URI[archive.sha256sum] = "7f144c5887d6dd2d99517c00fd42395ee20abc13ce55958a4fda64e6d7e473f8"
+SRC_URI[archive.sha256sum] = "c9faee005cb4912bce34f69f1af26b01a364534e12ede5d9bac44d8226d72c16"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "opengl"
-- 
2.34.1


