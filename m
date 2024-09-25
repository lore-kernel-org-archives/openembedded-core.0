Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A1B6C369A0
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:49:55 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.9324.1727246990065401154
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:49:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gP+d9Kfz;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727246991; x=1758782991;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ow4mJfi8vuByTOh//T8gj8Xai2IMUHCQtI8ZTlEDSKk=;
  b=gP+d9KfzPBh19sQER7qrCrGS73AxLlTZuGt2soYaTkDkzrp0rbhOsZeA
   UA7L8KSjfectCdoz9MRTKnbdSK4lM82AC32VYajDRKZXoblz4Ef1jWK9l
   My7DN9A6wOlWwcX8XJcRvYSY+OuY8e9a8RKQBePBhOuy1liHyCOOzxXxV
   7/JifyGiDcPQZPc22YQB2v87tFDEcDJptqVHQujM+tDa3tajJpO+z1T52
   NA6UIRQ+XXbeUQAO3qhLx4sr4e/nnmhl/Cd1SY9f/d5iXscCz7RGurcLH
   WND/4WIt9ALtu20DSrzJjpBWpJw2YjyGgmjaGQqwCesKvRnp7ENC2Ql1j
   Q==;
X-CSE-ConnectionGUID: p+PMpLPyRMWN6gwb7PSfpA==
X-CSE-MsgGUID: VCOzJR6LQZabjsm5zdpzHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="153715153"
X-IronPort-AV: E=Sophos;i="6.10,256,1719846000"; 
   d="scan'208";a="153715153"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 15:49:48 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id BD4B6DF0F7
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:45 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 349C1D900D
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:35 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 29403E2528
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:35 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CDC331A000A;
	Wed, 25 Sep 2024 14:49:34 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 09/47] gtk4: upgrade 4.16.0 -> 4.16.1
Date: Wed, 25 Sep 2024 14:48:42 +0800
Message-Id: <1727246960-20665-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
References: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28686.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28686.005
X-TMASE-Result: 10--0.413800-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yUIIxwDaU5mrw4SuXsUCGYh4YeSlHZYFonOw
	/jufb+urofcTdSXIk70IQXjSSArXPp4nw+AvBjj8IvMoA0X5b96xXA8wqNmbVr9dKxA1a0J47v0
	MlFSLfmn02ySLhR1LXcIQfjpyrw2NZWMJGq5h2T4ReM8i8p3vgCPclXBzQ1O23C7h628B5Zag+J
	Q+OUb094RJUvTp/Ng7PiXJNkTm2ypccQ8eam5EfRRFJJyf5BJeAzmRhRrMoRUXvQkGi3tjz46HM
	5rqDwqtjG/mhIoVtlqS4uz7+iJHMGY1jftIy/TmFhLqxi5pLwsGOYLCK1IrrzIPOdPRnEm0JLcC
	jK2SiBYSeFlIIImDHPkDqk3sCPz1HSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4RUz90EQwG2MA
	pbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:49:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204924

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* GtkFileChooser:
 - Plug a memory leak

* GtkCalendar:
 - Avoid ending up with invalid dates

* Printing:
 - Fix initial printer selection in the print dialog

* Gsk:
 - Fix shadows for opaque textures
 - Fix a crash in a corner case

* Css:
 - Make relative paths work again in theme files

* Accessibility:
 - Fix detection of the Flatpak portal

* MacOS:
 - Fix keyboard input in popovers
 - Keep DND icons above regular windows
 - Ignore events from DND icons

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-gnome/gtk+/{gtk4_4.16.0.bb => gtk4_4.16.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.16.0.bb => gtk4_4.16.1.bb} (98%)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.16.0.bb b/meta/recipes-gnome/gtk+/gtk4_4.16.1.bb
similarity index 98%
rename from meta/recipes-gnome/gtk+/gtk4_4.16.0.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.16.1.bb
index 1fe1861105..30b2b16a6f 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.16.0.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.16.1.bb
@@ -38,7 +38,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 UPSTREAM_CHECK_REGEX = "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.xz"
 
 SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-${PV}.tar.xz"
-SRC_URI[sha256sum] = "8ef538778c82c09870a6cc325195049caec5593c1ca37df915a7b6b10f5524ea"
+SRC_URI[sha256sum] = "926a1eabd481f9bfa25538f95016fdfcfaf963b2f90b40ae69e90def5499215c"
 
 S = "${WORKDIR}/gtk-${PV}"
 
-- 
2.34.1


