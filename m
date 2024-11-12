Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E306CD2E9C7
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 09:25:15 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.82726.1731403510603683725
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 01:25:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=t0HzpVC1;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731403511; x=1762939511;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=hQJ3Wz1OmWDbUKAM8t0F+Nrt0nmksQowHLY34dazvlo=;
  b=t0HzpVC1dJDXspTjWLGqQCy7/cm4qwngiRhitq4sEzGUd7ux6S96+1ig
   T35stIRAilxH2jYK9J3TRHvUQ837GW1BL5UxAslizFAbRqKEDAh0ltRTN
   e9XDCIh/rGn2u+BinZEthyh/xT5lmvFrIJVPFuQwFmkrxPt6peGN+JKDW
   Z7kxY1jOf9IuXCg1s5DLYv6+ejgbK4FIoVxgpiLbNa7GLkiiDt3aO1DHT
   DDvniu6aNn08uXKN3nonfc3G9yjv/abmfcfM3+CFORWYMFpBiCHpB/JtE
   cxcuqPrVnw0eWPnOXI9jNDPssfocQ0+ru5iuRCZbO31AVxgpHEPFAHcVi
   g==;
X-CSE-ConnectionGUID: B/yetFZsQlKWT4OJ5BTARQ==
X-CSE-MsgGUID: ih8FwvPNT5eFBBcLa3nt6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="168413864"
X-IronPort-AV: E=Sophos;i="6.12,147,1728918000"; 
   d="scan'208";a="168413864"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 18:25:05 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 10D34E8520
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:03 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id A383DF31EC
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:02 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3135F20071A35
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:02 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D47481A000A;
	Tue, 12 Nov 2024 17:25:01 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 10/47] gtk4: upgrade 4.16.3 -> 4.16.5
Date: Tue, 12 Nov 2024 17:24:06 +0800
Message-Id: <1731403483-21399-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
References: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28792.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28792.006
X-TMASE-Result: 10--0.086600-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yUIIxwDaU5mrwJjn8yqLU6J4YeSlHZYFonC3
	nVCnBf6chNhp1fSFJESPsr/qqa5wtxnXvIRDkfEWJBa5/AMngr3FmmMdIwjrDrKw8Hx0EGitllJ
	r+056NpD7dV04rak8kwFd21k9Z8naL/tBTZzO5Q0D2WXLXdz+AbfJf9h+SzjDfWrwobBC6igDol
	RaRe50ifscRbV0TXzafjWeJX0rKbMfE8yM4pjsD2vfiVSqJzu3SnQ4MjwaO9cqtq5d3cxkNQwWx
	r7XDKH8CtTq7Sez9cLTUpzY2RXJ7Qp8R2b1+b26RJrUrWm0qo3UNCXDrecUMGdoGHDdwaYEE9NT
	k8jGESlWnZ1/Y1/oNww7palrPX1KHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4RUz90EQwG2MA
	pbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 09:25:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207001

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* Clean up debug spew
* GtkTextView:
 - Fix some missing CSS invalidation
 - Handle charsets in clipboard datatypes
* GtkApplication:
 - Respect GDK_DEBUG=no-portals
* Printing:
 - Avoid warnings for avahi errors
 - Fix a segfault in the print dialog setup code
* Accessibility:
 - Handle NULL values in more places
* Gdk:
 - vulkan: Fix validation errors
 - Fix 32bit build for the jpeg loader
* Wayland:
 - Fix a possible deadlock with high-priority sources
   triggering Wayland roundtrips
* Translation updates
 Belarusian
 British English
 Latvian
 Romanian

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-gnome/gtk+/{gtk4_4.16.3.bb => gtk4_4.16.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.16.3.bb => gtk4_4.16.5.bb} (98%)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.16.3.bb b/meta/recipes-gnome/gtk+/gtk4_4.16.5.bb
similarity index 98%
rename from meta/recipes-gnome/gtk+/gtk4_4.16.3.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.16.5.bb
index b8dce36c0d..674e1d9f86 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.16.3.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.16.5.bb
@@ -38,7 +38,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 UPSTREAM_CHECK_REGEX = "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.xz"
 
 SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-${PV}.tar.xz"
-SRC_URI[sha256sum] = "2ec53e07d18c9f003b39e4a6a838054d9259e048b6c4c05d80c0d05aa721d944"
+SRC_URI[sha256sum] = "302d6813fbed95c419fb3ab67c5da5e214882b6a645c3eab9028dfb91ab418a4"
 
 S = "${WORKDIR}/gtk-${PV}"
 
-- 
2.34.1


