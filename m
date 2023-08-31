Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32D7BC83F1E
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 02:40:03 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.8578.1693449601508551561
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 19:40:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="129923158"
X-IronPort-AV: E=Sophos;i="6.02,215,1688396400"; 
   d="scan'208";a="129923158"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 11:39:59 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 92ED9D2AB7
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:39:55 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id D0BC2D949B
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:39:54 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5926E6BEF6;
	Thu, 31 Aug 2023 11:39:54 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] pango: upgrade 1.50.14 -> 1.51.0
Date: Thu, 31 Aug 2023 10:38:46 +0800
Message-Id: <1693449526-28171-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27846.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27846.004
X-TMASE-Result: 10--6.136900-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrBGvINcfHqhcL62xXB+Btq3w6
	H06bMgiv/meL+x/CwzsrTYxfCkKIK71MabCtVw9LBe3KRVyu+k1UENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmi7EfODkWa3rKqh5pv1eDPz9UEOicf335WVzjNsT1l+uSem2
	vw+cenKeLzNWBegCW24nmFeyfGnuMLbigRnpKlKSPzRlrdFGDw3zzpLwA8rnKdKyaj2NjqTlVO9
	c07exJWHwzEkuD74ycoIsuzl5ygNg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 02:40:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186947

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- itemize: Improve script itemization
- build: Check for cairo DWrite dependency
- win32: Fix various issues and crashes
- layout: Add a missing switch case

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../pango/{pango_1.50.14.bb => pango_1.51.0.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/pango/{pango_1.50.14.bb => pango_1.51.0.bb} (94%)

diff --git a/meta/recipes-graphics/pango/pango_1.50.14.bb b/meta/recipes-graphics/pango/pango_1.51.0.bb
similarity index 94%
rename from meta/recipes-graphics/pango/pango_1.50.14.bb
rename to meta/recipes-graphics/pango/pango_1.51.0.bb
index ec7a913009..3bf84458e5 100644
--- a/meta/recipes-graphics/pango/pango_1.50.14.bb
+++ b/meta/recipes-graphics/pango/pango_1.51.0.bb
@@ -24,7 +24,7 @@ SRC_URI += "file://run-ptest \
            file://0001-Skip-running-test-layout-test.patch \
            "
 
-SRC_URI[archive.sha256sum] = "1d67f205bfc318c27a29cfdfb6828568df566795df0cb51d2189cde7f2d581e8"
+SRC_URI[archive.sha256sum] = "74efc109ae6f903bbe6af77eaa2ac6094b8ee245a2e23f132a7a8f0862d1a9f5"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 
-- 
2.34.1


