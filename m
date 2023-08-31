Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D3ADC83F14
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 02:32:03 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.8390.1693449116233907981
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 19:31:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="131426809"
X-IronPort-AV: E=Sophos;i="6.02,215,1688396400"; 
   d="scan'208";a="131426809"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 11:31:54 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0A3FEC68F0
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:31:51 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 410C1F844
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:31:50 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id B20E02007471D;
	Thu, 31 Aug 2023 11:31:49 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] gtk4: upgrade 4.12.0 -> 4.12.1
Date: Thu, 31 Aug 2023 10:31:22 +0800
Message-Id: <1693449082-27584-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27846.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27846.004
X-TMASE-Result: 10--2.887300-10.000000
X-TMASE-MatchedRID: sujxEcxUy52jz0nOeth/yUIIxwDaU5mrTfK5j0EZbytOed0Eey3YOZgU
	Ly4zAbFB6zBPuCbw++lb6TwGgrVUfuMPGReMcBx5KiJEqUFWRgjvG0/D/wjsdC99T+uJIleRgKe
	r2q0Zy9VdKjFjTrBoANAZKX4SF8rOJS5vQb+mjdxiOR5b9sWdozeXamXCCu1YlWd94StQFXI0Tq
	ZEsK6k+KE7LBRkh+1t5p98cjyQCaIdj9vNGYhpkVB1PaW1TstcXLILvyEBT87VtKZKT0dQ2oFJh
	AcClYHSqLvUf415EMB5OPD8XJFfpB8TzIzimOwPD16OIL8FA924NlOhazXSZkkpbiYOUmwxJ0RP
	nyOnrZICk9C5Myxjgj+nBoikKBiEQHcEEksaC+R58/iFszniW+HBe/XoYixLeY/HiV1MMhwgV5w
	laVyraQURzFYLoS0Emxp/OEWDXq9Lv5Eyr/YIrqsDhztRXZ9Cm+LY9A78UVCLPa6Os9XH3IQhTU
	20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 02:32:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186932

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* GtkGridView:
 - Fix a crash when scrolling

* GtkColumnView:
 - Fix a refcounting issue in the new scroll_to api

* GtkTreeView
 - Fix style classes for sort arrows

* GtkEntry:
 - Improve tracking of user changes (for undo)

* GtkNotebook:
 - Fix a critical when switching pages

* GtkColor/FontDialogButton:
 - Make these widgets activatable

* GtkMenuButton:
 - Fix problems with focus handling
 - Fix problems with DND

* Printing
 - Fix the cpdb backend build

* MacOS:
 - Make file filters work again

* GSK:
 - Fix issues with color matrix nodes

* Wayland:
 - Fix a crash with compositors other than gnome-shell

* Translation updates:
 Polish
 Swedish

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-gnome/gtk+/{gtk4_4.12.0.bb => gtk4_4.12.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.12.0.bb => gtk4_4.12.1.bb} (98%)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb b/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb
similarity index 98%
rename from meta/recipes-gnome/gtk+/gtk4_4.12.0.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.12.1.bb
index 4f38e0cb2c..aa7115b11e 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb
@@ -37,7 +37,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 UPSTREAM_CHECK_REGEX = "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.xz"
 
 SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-${PV}.tar.xz"
-SRC_URI[sha256sum] = "a6d10829f405b1afc0b65e2a9642c04126a1d1b638d11c6d97426da4f84f1f6f"
+SRC_URI[sha256sum] = "b8b61d6cf94fac64bf3a0bfc7af137c9dd2f8360033fdeb0cfe9612b77a99a72"
 
 S = "${WORKDIR}/gtk-${PV}"
 
-- 
2.34.1


