Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C5DBE7718D
	for <webhook@archiver.kernel.org>; Mon, 23 Dec 2024 09:11:32 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.10441.1734945081779026322
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Dec 2024 01:11:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=eH4NTPcR;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734945082; x=1766481082;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=cT6NRetrAOBxDObDpWiGG2oM+8gqHx5IYZm7MbFo2Ek=;
  b=eH4NTPcR7ntavjmz+XuBUzxNDk2I8t1xKVZ2/P6lVYTIs+sW4QDQx3mX
   U3NU3Zk3/A3OXbLGOf2H24cWNo4euz+AqF5rzLof9msLdjqXDURPWGDEu
   2b4lE998EWsU4TOPHxsb/MNgGDN+EP2Q2Lv/9x69BWxfCo4nsDHJnIBmM
   qyGBBH/6pOL15VWWX9WopqzhG3vs2MSRPeTGamtJbY2ANPIIeBZW01l9o
   AwJZl73GyXxOqQHyQgc++Vcwp9xLXM8aZWGa8dEII7CubLf6nGhTxscWL
   FJnfrhA+KsyputYrQok7g9AMhgR2d0DlEg4ed/vOIywBJmWVU1AC5NM6O
   g==;
X-CSE-ConnectionGUID: hq4tRNjOS2aIXkJtblTtLw==
X-CSE-MsgGUID: pyS3TE/GSZevXmcHKJvxRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="187085589"
X-IronPort-AV: E=Sophos;i="6.12,256,1728918000"; 
   d="scan'208";a="187085589"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 18:11:19 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6B823D4C2B
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:17 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4299FD8B01
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:17 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id C40206B4DF
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:16 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6D08B1A0071;
	Mon, 23 Dec 2024 17:11:16 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 02/22] libportal: upgrade 0.8.1 -> 0.9.0
Date: Mon, 23 Dec 2024 17:10:45 +0800
Message-Id: <1734945065-4373-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1734945065-4373-1-git-send-email-wangmy@fujitsu.com>
References: <1734945065-4373-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28876.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28876.006
X-TMASE-Result: 10-0.640900-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrUuVVTCQr62paCbh+r2jQswre
	wfr9uhLVxwSZVh7H42SkulA7P59GuubviKMxuy8uwCGU3q1ZqNM9hYABIgx2v5Tx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q25x7uAXGEprZiQDIJsDspXnQLpYk1dOmKZlh
	hGqDvK5Vg82fo850El+9AI+LLwgRwfE8yM4pjsD67rlQMPRoOCxEHRux+uk8hxKpvEGAbTDmmw7
	iyoI5PHRXprjLMC+j1k9oNMyxcE9qZUmvnTLhDFTRUvhMLDkfnWQ0vZ9k1Ga3uiOUZTEa0/t7of
	JH41ZBI9ox10RrefzoK+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 09:11:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209017

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Dependencies:
- GLib 2.72 or higher is now required

Features:
- Introduce support for the Notification v2 portal version

Bug fixes:
- Fix a file descriptor leak in the Mail portal code
- Fix some minor memory leaks

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libportal/{libportal_0.8.1.bb => libportal_0.9.0.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libportal/{libportal_0.8.1.bb => libportal_0.9.0.bb} (94%)

diff --git a/meta/recipes-gnome/libportal/libportal_0.8.1.bb b/meta/recipes-gnome/libportal/libportal_0.9.0.bb
similarity index 94%
rename from meta/recipes-gnome/libportal/libportal_0.8.1.bb
rename to meta/recipes-gnome/libportal/libportal_0.9.0.bb
index 0b88de4224..96c25b1db8 100644
--- a/meta/recipes-gnome/libportal/libportal_0.8.1.bb
+++ b/meta/recipes-gnome/libportal/libportal_0.9.0.bb
@@ -7,7 +7,7 @@ LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3000208d539ec061b899bce1d9ce9404"
 
 SRC_URI = "git://github.com/flatpak/${BPN}.git;protocol=https;branch=main"
-SRCREV = "26c15008cbe579f57f89468384f8efc033f25f6f"
+SRCREV = "731e7410fa5765e7c4eb76a51140a19637620c13"
 S = "${WORKDIR}/git"
 
 inherit meson gi-docgen gobject-introspection vala features_check pkgconfig
-- 
2.43.0


