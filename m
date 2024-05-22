Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D6B9C2B9FB
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 09:16:02 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.5639.1716369330126592789
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 02:15:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oOeOoifS;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716369330; x=1747905330;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=aSpmeUMq7rP+R/ZGnu4++wPHoC00a2/XOYRh0ik0jvQ=;
  b=oOeOoifSE0x1QxuCGNf/rFRcaDfP2zsBdpNHDL2Xk0f0DbsWe3fVL/BS
   aKQCMkYhSpST7ES2nueDaTCrSt4CldHI1XBUURQsvK1OvDxyYw8kkXqiK
   rSU0+vG+kQcR9whPGPXLj2rtnNsdkzMWokAuAtPCofgZglO10ABv8blat
   11O+h2x/r/q1Q6CCK0MeOiRVsoI/YoACbnGIqEWBqQcuj2ipaJ74iApMZ
   eo8auucFBiARzzfKXKMCdimml9ceoell0kQsRniXBoI65YyUpxTz+FG08
   9fPeJR53zc++sLvzRNI0yVxVA+Va8niHxuzOMjCIl7g5hWNsIBZTaKS8J
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="158511099"
X-IronPort-AV: E=Sophos;i="6.08,179,1712588400"; 
   d="scan'208";a="158511099"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 18:15:28 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8C4AFCC15D
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:25 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id C00E8BDCA2
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:24 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 124FD20097E68
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:24 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B0AA41A000B;
	Wed, 22 May 2024 17:15:23 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 14/42] gtk+3: upgrade 3.24.41 -> 3.24.42
Date: Wed, 22 May 2024 17:14:21 +0800
Message-Id: <1716369289-22526-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
References: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28402.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28402.006
X-TMASE-Result: 10--3.965600-10.000000
X-TMASE-MatchedRID: u4ys6248rQyjz0nOeth/yUIIxwDaU5mr2I8NUKi360b5UUyIMY0GrXw6
	H06bMgivrW702S6GBauygfmU3DIZds66BgIQlQw1Ss47mbT7SASOhEhoAl74KMj0QMA/92m26I9
	N7ME4lolsDl95VTw0RsYoh/qEF/tVLvv2cUtLK/s/QdUh6LEl0ME5XPQnBzGXq8KsbROd9VQVs9
	42YrUIzY7TRSi4Om79+MOUD1zmrJ36eJVowF9Ts90KiTeJteVBfS0Ip2eEHnyFh/DzryTTlonCE
	aK+uteYVymkLM+r7VTGVuWouVipci+XZIYVCrXcyi7XYFR2NzPNWVBipv4fZHdIdv1+IABfglTh
	2vS7bXQ7XOE0v94ZaVvg0HVAfdiWIhV/04SNH3crDjeWPiBuPv6/2/nZkihaOgB/fz3EXdcVKT0
	eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 09:16:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199710

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* GtkFileChooser:
 - Avoid warnings about floating refs
 - Improve performance of recursive search
 - Populate search model in an idle

* GtkGLArea:
 - Fix a regression in transparency handling

* Printing:
 - Avoid accessing freed printers

* Accessibility:
 - Drop support for the deprecated atk_focus_tracker

* Wayland:
 - Fix monitor sizes
 - Fix a crash related to tablet removal
 - Infer resizable edges for tiled windows
 - Always commit soon after acking a configure

* Windows:
 - Avoid committing NULL strings to IME

* gdk:
 - Use css cursor names as far as possible
 - Sync DND cursor use with GTK4

* macOs:
 - Fix cocoa pasteboard constants

* build:
 - Allow building against sysprof-capture-4

* Translation updates:
 Georgian
 Hebrew
 Kabyle
 Persian

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-gnome/gtk+/{gtk+3_3.24.41.bb => gtk+3_3.24.42.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.24.41.bb => gtk+3_3.24.42.bb} (87%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.41.bb b/meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb
similarity index 87%
rename from meta/recipes-gnome/gtk+/gtk+3_3.24.41.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb
index 3501813307..61cecce4d1 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.41.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb
@@ -5,7 +5,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar.xz \
            file://opengl.patch \
            "
-SRC_URI[sha256sum] = "47da61487af3087a94bc49296fd025ca0bc02f96ef06c556e7c8988bd651b6fa"
+SRC_URI[sha256sum] = "50f89f615092d4dd01bbd759719f8bd380e5f149f6fd78a94725e2de112377e2"
 
 S = "${WORKDIR}/gtk+-${PV}"
 
-- 
2.34.1


