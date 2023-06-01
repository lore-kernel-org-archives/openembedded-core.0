Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFD87C7EE3A
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 09:04:08 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.26243.1685610239733103081
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 02:04:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="98556104"
X-IronPort-AV: E=Sophos;i="6.00,209,1681138800"; 
   d="scan'208";a="98556104"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 18:03:57 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 13E86D3EA3
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:03:55 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5B8C6CF7EF
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:03:54 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8652A887D8;
	Thu,  1 Jun 2023 18:03:53 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libxft: upgrade 2.3.7 -> 2.3.8
Date: Thu,  1 Jun 2023 17:03:14 +0800
Message-Id: <1685610221-29015-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
References: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27664.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27664.006
X-TMASE-Result: 10--2.199900-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mregIHHX2L4Yzfc2Xd6VJ+yufD
	otHL7Yhsqkujfu+HuWmi/kPRIP9FBGJZXQNDzktSP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW5tMXimGWsZZJwK/rsCokmW5UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO2eVW
	/ZdL52jwnBU/HuY01orTdxVUQ3NGgJhiVlc+aimOOKDjhnqDvc2fLuSATKXcTp5o3NqvSYDoCGP
	yUB2U3l2plIgV5VXrTL9oxtQv8yz/IMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 09:04:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182064

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
add check for missing glyph in XftFontCheckGlyph()
issue 17: libxft-2.3.7: Bold fonts in urxvt missing leftmost pixels
issue 18: Problems with rotated text (monospace font only)
configure: Use LT_INIT from libtool 2 instead of deprecated AC_PROG_LIBTOOL
Clears autoconf warnings

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{libxft_2.3.7.bb => libxft_2.3.8.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxft_2.3.7.bb => libxft_2.3.8.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb b/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb
rename to meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb
index ad126d2092..2699c1dfd7 100644
--- a/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb
+++ b/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb
@@ -20,7 +20,7 @@ PROVIDES = "xft"
 
 PE = "1"
 
-SRC_URI[sha256sum] = "79f0b37c45007381c371a790c2754644ad955166dbf2a48e3625032e9bdd4f71"
+SRC_URI[sha256sum] = "5e8c3c4bc2d4c0a40aef6b4b38ed2fb74301640da29f6528154b5009b1c6dd49"
 
 XORG_PN = "libXft"
 
-- 
2.34.1


