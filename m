Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E394C54E55
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 07:33:52 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.8395.1709105612164643064
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 23:33:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XFa8Wmdi;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709105624; x=1740641624;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=6l6y81W64lynnhJAYDQYM7brvH1xi2IDQjXiG3TUzQE=;
  b=XFa8WmdiPvr5vfT7kF+rtA8R+NkyAPwhdq/3bGW+3+hSm5G7z1/inMMv
   XjyUtfHAHLZjBUnRVdj+XDpEOSoBb9LeceEPqhcL+JLWgYkfCYNi8z78U
   kHNpQEtQ947yj1RbOQjjvJcWqNZZ4we3quKeJGqWoxNTjDDOaqLGn/ZE7
   Ti9+IMvDiB68zhiL5IfoefBCkf8h4dJqRC/temCdM+iSM9/RpEPEW319F
   VxPgvxK+t9EVncXxNeyjIfFmAG4voEq7O6Ci35ktrkH7XLByWE55mbGO6
   j3n5Naib6xgjSkERnz63ffgzTCKb3j7S82it3TF4LYg95QSV4GU6qHdts
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="138291855"
X-IronPort-AV: E=Sophos;i="6.06,190,1705330800"; 
   d="scan'208";a="138291855"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 16:33:43 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id A848DE8CC1
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:41 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id EB5C03094C
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:40 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 84CF341180
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:40 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 31FAF1A006A;
	Wed, 28 Feb 2024 15:33:40 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 46/48] xkbcomp: upgrade 1.4.6 -> 1.4.7
Date: Wed, 28 Feb 2024 15:32:53 +0800
Message-Id: <1709105575-24259-46-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
References: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28218.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28218.005
X-TMASE-Result: 10-2.420600-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yQPZZctd3P4Bnb9+yLBIRXcH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJoo20xpayFHBZfzgVmnL/olVV4BnlVId1nZsoi2XrUn/J8m+
	hzBStanvIM9mETCO70ydET58jp62SO9PqCdEAR/NbzhDRFQQJKSZbBOvRlg47zCp904GBR8bL/5
	5pzPztIlnzq6RaG8LnooWJ+FGtjxNu2097VXTGWVLHh2cHDynjS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 07:33:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196371

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-app/{xkbcomp_1.4.6.bb => xkbcomp_1.4.7.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-app/{xkbcomp_1.4.6.bb => xkbcomp_1.4.7.bb} (86%)

diff --git a/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb b/meta/recipes-graphics/xorg-app/xkbcomp_1.4.7.bb
similarity index 86%
rename from meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb
rename to meta/recipes-graphics/xorg-app/xkbcomp_1.4.7.bb
index 44f462f523..f259f33dd8 100644
--- a/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb
+++ b/meta/recipes-graphics/xorg-app/xkbcomp_1.4.7.bb
@@ -16,4 +16,4 @@ BBCLASSEXTEND = "native"
 EXTRA_OECONF += "--disable-selective-werror"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "fa50d611ef41e034487af7bd8d8c718df53dd18002f591cca16b0384afc58e98"
+SRC_URI[sha256sum] = "0a288114e5f44e31987042c79aecff1ffad53a8154b8ec971c24a69a80f81f77"
-- 
2.34.1


