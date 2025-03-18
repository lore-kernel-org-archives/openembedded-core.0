Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B91EC28B28
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 06:22:12 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.5352.1742278929081412465
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 23:22:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=go5X/i++;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742278930; x=1773814930;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=5P7idNtnALn7UEGP1JLMUopQEqzm3WjCvyWN3w9SjBI=;
  b=go5X/i++NDmMplIGktRI51+1llMsjes8Nlh981Fy1ArpMiK4AHlLT6I2
   shSO9pubNkwDHg0DSOq3gaTu52wW6+Bx2Q7/hpeiqLJQJQfNLRim52gyM
   yofrhZLqbelsU0prr9z8l8VJg+SSfpEfx25yOOAYz044kBq4IGcsRWmIz
   sAeRxQ0XOWgxjWbWpYtQwrZk0IkrcdozCjzMbLZKY6gyqV1YQ5Bt2VwkU
   PPJyGX5/XdMV3EziNjwlysfni+Bil2MU3QBVwAbXSM4MTb1mCyg4dmr59
   GHzUC02X+xYNgenqSjj/lCy5nk3lVR7kTPGRZJFjAl5MqeNejTMTnPZuc
   g==;
X-CSE-ConnectionGUID: z2Vqd25rQG2izc65CKzDjg==
X-CSE-MsgGUID: cKme5G4NQX+nG4QCycQB8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="172902885"
X-IronPort-AV: E=Sophos;i="6.14,256,1736780400"; 
   d="scan'208";a="172902885"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 15:22:07 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0383DC2260
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 15:22:05 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id B962ED4BD3
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 15:22:04 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 55B061A00AE;
	Tue, 18 Mar 2025 14:22:04 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 04/12] gobject-introspection: upgrade 1.82.0 -> 1.84.0
Date: Tue, 18 Mar 2025 14:21:44 +0800
Message-Id: <1742278912-2989-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742278912-2989-1-git-send-email-wangmy@fujitsu.com>
References: <1742278912-2989-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 06:22:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213167

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-introspection_1.82.0.bb => gobject-introspection_1.84.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gobject-introspection/{gobject-introspection_1.82.0.bb => gobject-introspection_1.84.0.bb} (99%)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb
similarity index 99%
rename from meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb
rename to meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb
index 15032520bb..ac5f4e9370 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c434e8128a68bedd59b80b2ac1eb1c4a \
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)}/${BPN}-${PV}.tar.xz \
            "
 
-SRC_URI[sha256sum] = "0f5a4c1908424bf26bc41e9361168c363685080fbdb87a196c891c8401ca2f09"
+SRC_URI[sha256sum] = "945b57da7ec262e5c266b89e091d14be800cc424277d82a02872b7d794a84779"
 
 SRC_URI:append:class-native = " file://0001-Relocate-the-repository-directory-for-native-builds.patch"
 
-- 
2.43.0


