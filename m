Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6588CA552A
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 09:39:03 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.7751.1694597937050320370
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 02:38:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="111397106"
X-IronPort-AV: E=Sophos;i="6.02,142,1688396400"; 
   d="scan'208";a="111397106"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 18:38:54 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id D8E8BCD7E4
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 18:38:52 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1B08CD620E
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 18:38:52 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 23894200501A8;
	Wed, 13 Sep 2023 18:38:51 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] pkgconf: upgrade 2.0.2 -> 2.0.3
Date: Wed, 13 Sep 2023 17:38:13 +0800
Message-Id: <1694597893-21711-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27872.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27872.006
X-TMASE-Result: 10--3.044000-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrTfK5j0EZbysc5SGKNk1CG6Mr
	+VE6nYOOA/oe4NwFf2qAdfHkjBitAhS3v3B/YnypAoNa2r+Edw1UENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmiL1vtt3X2p0WeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNecfyH1QHVcLGTKfSW6P8UQYHYAS1qUn/AL5zbsrQ72cS28VqVDgWUeGVAfZptP4+zFrx
	SSF1mfpB1BpGarls3nzEWi+jUvOOTKgHg/t0KH2U8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 09:39:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187571

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Fix some edge-cases with the new `--modversion` implementation
  and add additional regression tests.
* Fix some format specifiers to use PRIu64 in debug tracing.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../pkgconf/{pkgconf_2.0.2.bb => pkgconf_2.0.3.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/pkgconf/{pkgconf_2.0.2.bb => pkgconf_2.0.3.bb} (96%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_2.0.2.bb b/meta/recipes-devtools/pkgconf/pkgconf_2.0.3.bb
similarity index 96%
rename from meta/recipes-devtools/pkgconf/pkgconf_2.0.2.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_2.0.3.bb
index c6badb123e..5aa5a191f2 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_2.0.2.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_2.0.3.bb
@@ -20,7 +20,7 @@ SRC_URI = "\
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
 "
-SRC_URI[sha256sum] = "ea5a25ef8f251eb5377ec0e21c75fb61894433cfbdbf0b2559ba33e4c2664401"
+SRC_URI[sha256sum] = "cabdf3c474529854f7ccce8573c5ac68ad34a7e621037535cbc3981f6b23836c"
 
 inherit autotools
 
-- 
2.34.1


