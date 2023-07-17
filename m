Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C55BEC001E0
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 09:10:45 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.4247.1689585039935889573
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 02:10:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="124763001"
X-IronPort-AV: E=Sophos;i="6.01,211,1684767600"; 
   d="scan'208";a="124763001"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 18:10:39 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 49EEDD424D
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 18:10:36 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7ACEBD5011
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 18:10:35 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 885E72FC86AA;
	Mon, 17 Jul 2023 18:10:34 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libproxy: upgrade 0.5.2 -> 0.5.3
Date: Mon, 17 Jul 2023 17:10:08 +0800
Message-Id: <1689585025-23731-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689585025-23731-1-git-send-email-wangmy@fujitsu.com>
References: <1689585025-23731-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27756.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27756.006
X-TMASE-Result: 10--1.275000-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrTfK5j0EZbytOed0Eey3YOXMW
	fmr8UEU8LV5q/RvxQfXRKGcr5TE1szWs2YGWPbxrA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYnp5g9gYJWDLeBzEkCCpnRloMLOoNHsM9vWr7HvOSElaG1Mjd1CixqeUg5
	UD6AlF0rF9uGobEuT7gDLqnrRlXrbIDt27MLDp0t0H8LFZNFG76sBnwpOylLNpro91yb5u1nuiO
	4YT7ikxxKx2KQHipmKcJF+QVu5Tcn1bhY/ZSd7Ggbc34iI+Jmb0fuLKGVyH8zKKtnvFhInjQPVR
	fXdcZkKIHqaUMp7VXtL/LK0d4I30Ze/gJB41STsbqpM7Cr+fvX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 09:10:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184438

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
-Fix crash querying URLs without a host
-Web: Update application page
-Add appplication info about apt and python requests
-Bump version to 0.5.3

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libproxy/{libproxy_0.5.2.bb => libproxy_0.5.3.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libproxy/{libproxy_0.5.2.bb => libproxy_0.5.3.bb} (95%)

diff --git a/meta/recipes-support/libproxy/libproxy_0.5.2.bb b/meta/recipes-support/libproxy/libproxy_0.5.3.bb
similarity index 95%
rename from meta/recipes-support/libproxy/libproxy_0.5.2.bb
rename to meta/recipes-support/libproxy/libproxy_0.5.3.bb
index 7faec2d3d6..db88af093e 100644
--- a/meta/recipes-support/libproxy/libproxy_0.5.2.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.5.3.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 DEPENDS = "glib-2.0"
 
 SRC_URI = "git://github.com/libproxy/libproxy;protocol=https;branch=main"
-SRCREV = "e4f467b05c8adf25e5a2d5464914fc7e92bb7990"
+SRCREV = "29d51a611f28af0bdbd51a5779cc8df264c8dcff"
 S = "${WORKDIR}/git"
 
 inherit meson pkgconfig gobject-introspection vala gi-docgen
-- 
2.34.1


