Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FAE7C46CA2
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 09:38:48 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.8716.1702978725798483942
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 01:38:46 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="143914463"
X-IronPort-AV: E=Sophos;i="6.04,287,1695654000"; 
   d="scan'208";a="143914463"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 18:38:43 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 76356D4F5A
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:38:41 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id AB4DAD9779
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:38:40 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3E254201F950F
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:38:40 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EC79C1A006F;
	Tue, 19 Dec 2023 17:38:39 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] p11-kit: upgrade 0.25.2 -> 0.25.3
Date: Tue, 19 Dec 2023 17:36:36 +0800
Message-Id: <1702978596-7899-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28066.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28066.006
X-TMASE-Result: 10--1.770200-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrTfK5j0EZbysvM0Gdq0fzqRp5
	7Xpv5seJSfKlNnlGqO4Nyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl7SwC3zqzycUIY6
	e+Xi1ah+xfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSz9EREWoGBDcKW8L
	RhY3aRuOvoBdUXL7E3Kj3OsaSD3duhDTuCpm0Rn6QZMxUdpDoqYi/eCeC2XmEXJl9TlfivTaikk
	vc+hMWliB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 09:38:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192707

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* rpc: fix serialization of NULL mechanism pointer
* fix meson build failure in macOS (appleframeworks not found)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../p11-kit/{p11-kit_0.25.2.bb => p11-kit_0.25.3.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/p11-kit/{p11-kit_0.25.2.bb => p11-kit_0.25.3.bb} (96%)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.25.2.bb b/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb
similarity index 96%
rename from meta/recipes-support/p11-kit/p11-kit_0.25.2.bb
rename to meta/recipes-support/p11-kit/p11-kit_0.25.3.bb
index d00ef2daf5..9e959425f7 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.25.2.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb
@@ -11,7 +11,7 @@ DEPENDS = "libtasn1 libtasn1-native libffi"
 DEPENDS:append = "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') == 'True' else ''}"
 
 SRC_URI = "gitsm://github.com/p11-glue/p11-kit;branch=master;protocol=https"
-SRCREV = "66d6b42ef8dd84fcd8e199ac9f23f822f1a058c9"
+SRCREV = "917e02a3211dabbdea4b079cb598581dce84fda1"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= ""
-- 
2.34.1


