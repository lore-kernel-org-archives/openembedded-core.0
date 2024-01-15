Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 176ACC47258
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 09:08:25 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.74061.1705309701922743138
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 01:08:22 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="134547483"
X-IronPort-AV: E=Sophos;i="6.04,196,1695654000"; 
   d="scan'208";a="134547483"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 18:08:19 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 33F13D6188
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:08:17 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 72F09D5E93
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:08:16 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 138252022763B
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:08:16 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B6F841A0070;
	Mon, 15 Jan 2024 17:08:15 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] ofono: upgrade 2.2 -> 2.3
Date: Mon, 15 Jan 2024 17:05:03 +0800
Message-Id: <1705309503-24140-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28120.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28120.006
X-TMASE-Result: 10--2.176800-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrTfK5j0EZbysli8Y5a0svL1ad
	enFKUCcsCC8aAmGeO6nqXvXKPBg5BmVjCRquYdk+EXjPIvKd74BMkOX0UoduueTpBuL72LoP9nx
	EMDRyp9CtC6kiKV579yepY651xsmV5UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO2i5u
	/VvsFaHdzQXO+qJ3yTJq25jgL6YFvs9zKhX2eDhJWdlEQgAz6kJSXO3gl/YNpcqlQxtFen1mUTJ
	GDbiQiDqgD6l+QHl+MJZFVdbzxUUPIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 09:08:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193647

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Fix issue with handling SMS submit report sizes.
-Fix issue with handling operator name and ISI modems.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-connectivity/ofono/{ofono_2.2.bb => ofono_2.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/ofono/{ofono_2.2.bb => ofono_2.3.bb} (95%)

diff --git a/meta/recipes-connectivity/ofono/ofono_2.2.bb b/meta/recipes-connectivity/ofono/ofono_2.3.bb
similarity index 95%
rename from meta/recipes-connectivity/ofono/ofono_2.2.bb
rename to meta/recipes-connectivity/ofono/ofono_2.3.bb
index 4e60f196ce..db5c8173de 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.2.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.3.bb
@@ -13,7 +13,7 @@ SRC_URI = "\
     file://0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch \
     file://0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch \
 "
-SRC_URI[sha256sum] = "5e13121c0f885a81ad882db065549ea13477abbcc219f150b38a8d2ac92521de"
+SRC_URI[sha256sum] = "658f9c16aec09c56bd36424982afc6ef292c0942b3a9e8ffefdda5974f01dac3"
 
 inherit autotools pkgconfig update-rc.d systemd gobject-introspection-data
 
-- 
2.34.1


