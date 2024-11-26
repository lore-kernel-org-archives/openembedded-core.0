Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DE4FD59D8E
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 01:30:28 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.35682.1732584617878888554
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 17:30:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=aMqCNwE7;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1732584618; x=1764120618;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=5hpgtsSGfNZdXpU+kiMjm/LaUBwDZeZ3vFZC+BQlFlY=;
  b=aMqCNwE7kd8KgwCyc+BAxs+LVNYKkWCwfAvNxtzDBEHUph9VpKxr00UR
   VqaNKN+TiJqVFnVEuBHGw3L5BZLikcPk5qrpIxgjlegbUgo/T/T722JbK
   T3KpYEzopMdJ7yUYw2p7r/XXRmBrOfUiGN7is2RfTuFVRqkwessMCB294
   PVUGPN6nGtIcSRuDf9jyAFtFcF0Ngj0lBeKWfhhSJQV/KkhHuHos8xNep
   6YesfDQ8eJurUoQx4WW1kXL3BjGqfxfOghZDmbb3TfcfmZEJ8NKYwWAaj
   xiea24XEUS3O/usv3pH+d0DU10q1lEYoaHKLqNeIqbSrwYNyLmgJ7SHCx
   A==;
X-CSE-ConnectionGUID: PvTr2sXGQ/uLfMlSNGNLrQ==
X-CSE-MsgGUID: pNOzWf35Qpeowa4fK4SISw==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="160592022"
X-IronPort-AV: E=Sophos;i="6.12,184,1728918000"; 
   d="scan'208";a="160592022"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 10:30:15 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5C4162761E
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 10:30:13 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id EE21AD19CC
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 10:30:12 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6B41070BF6
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 10:30:12 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 161841A0071;
	Tue, 26 Nov 2024 09:30:12 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 02/16] gtk4: upgrade 4.16.5 -> 4.16.7
Date: Tue, 26 Nov 2024 09:29:48 +0800
Message-Id: <1732584602-4785-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1732584602-4785-1-git-send-email-wangmy@fujitsu.com>
References: <1732584602-4785-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28820.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28820.004
X-TMASE-Result: 10--3.293600-10.000000
X-TMASE-MatchedRID: u4ys6248rQyjz0nOeth/yUIIxwDaU5mrjlRp8uau9oavuvdD0QGx5nw6
	H06bMgiv1pTr6eZqLtGXhy+IQjYeYLhPu4tF1R7BatGCGdi/nWrGnIztpkKhQsbqJYow2PWA+6W
	XwjVDeTUILxoCYZ47qchzLPrB35bs7VrXqiqnwHVO5y1KmK5bJRSLgSFq3TnjGRXl4LjaVr8X+2
	WPFDtTZFwJlo+DKzyHtz9kIuTkBq5q0QqhYus7ZJ4CIKY/Hg3AaZGo0EeYG954UhBPLRlvhuhp+
	e03HCv2C24oEZ6SpSmcfuxsiY4QFJEv+i2kMlg9dZ2brdsmD9unoLGys3MQ1KFbS+7gQftGEp0f
	wavc8eQsJYFTZ1rCHtVQAg72aVAiGgw/XMicD39RH1CyB7GMMex9n1XpDqsJmC9SiJioatWbjnu
	8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 01:30:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207808

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* Text:
 - Reduce the size of error underlines

* Accessibility:
 - Fix a wrong return value type
 - Fix an invalid free call

* GtkText:
 - Don't select inserted Emoji

* GtkApplication:
 - Set the default window icon from the app ID

* GtkFontChooser:
 - Make the dialog more shrinkable

* macOS:
 - Use correct modifier keys for GtkTextView and GtkLabel
   shortcuts

* Translation updates
 Icelandic
 Serbian
 Serbian (Latin)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-gnome/gtk+/{gtk4_4.16.5.bb => gtk4_4.16.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.16.5.bb => gtk4_4.16.7.bb} (98%)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.16.5.bb b/meta/recipes-gnome/gtk+/gtk4_4.16.7.bb
similarity index 98%
rename from meta/recipes-gnome/gtk+/gtk4_4.16.5.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.16.7.bb
index 674e1d9f86..2631c148e6 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.16.5.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.16.7.bb
@@ -38,7 +38,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 UPSTREAM_CHECK_REGEX = "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.xz"
 
 SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-${PV}.tar.xz"
-SRC_URI[sha256sum] = "302d6813fbed95c419fb3ab67c5da5e214882b6a645c3eab9028dfb91ab418a4"
+SRC_URI[sha256sum] = "5303c7624e15a48880591b9ddd43389afba3de4fb92a219719519bb1642ce3dc"
 
 S = "${WORKDIR}/gtk-${PV}"
 
-- 
2.34.1


