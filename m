Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56FAEE7D25B
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 08:24:50 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.14328.1695716683476095858
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 01:24:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="121938011"
X-IronPort-AV: E=Sophos;i="6.03,177,1694703600"; 
   d="scan'208";a="121938011"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 17:24:40 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id D5804DB3C9
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 17:24:38 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2906AF975
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 17:24:38 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 462C7885FA;
	Tue, 26 Sep 2023 17:24:37 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] gobject-introspection: upgrade 1.78.0 -> 1.78.1
Date: Tue, 26 Sep 2023 16:24:11 +0800
Message-Id: <1695716651-8731-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27898.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27898.006
X-TMASE-Result: 10--4.455600-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrczQnRrpmbEnfUZT83lbkEJg5
	i89ETr/t+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3HztJgOULF9rBuh
	MNLfO6UAr1HXXKXjaxQGN2ThlUwL/rWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNcxAi4RI9VWmG1VYiNPjseRlA3AcJRqgHZvLywQA2VuHeFdpoNsX1ZMkJXguKTVj65GH+
	ti1V8z5sA6oVsWjNRNc+xBcEJK/0VLvHqPi046FU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 08:24:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188228

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Avoid undefined behaviour in the Regress test suite

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-introspection_1.78.0.bb => gobject-introspection_1.78.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gobject-introspection/{gobject-introspection_1.78.0.bb => gobject-introspection_1.78.1.bb} (99%)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb
similarity index 99%
rename from meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.0.bb
rename to meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb
index 42b0979aaf..2c6fb7aaa3 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c434e8128a68bedd59b80b2ac1eb1c4a \
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)}/${BPN}-${PV}.tar.xz \
            "
 
-SRC_URI[sha256sum] = "84f5bd2038bd52abbce74a639832c5b46a2d17e9c5a8ae14f9788e8516c04166"
+SRC_URI[sha256sum] = "bd7babd99af7258e76819e45ba4a6bc399608fe762d83fde3cac033c50841bb4"
 
 SRC_URI:append:class-native = " file://0001-Relocate-the-repository-directory-for-native-builds.patch"
 
-- 
2.34.1


