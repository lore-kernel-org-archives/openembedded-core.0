Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C309CCA551B
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 09:28:13 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.7587.1694597291677220222
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 02:28:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="131460040"
X-IronPort-AV: E=Sophos;i="6.02,142,1688396400"; 
   d="scan'208";a="131460040"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 18:28:09 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id CF6DDCA1E8
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 18:28:06 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0F380D7886
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 18:28:06 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 42383870F3;
	Wed, 13 Sep 2023 18:28:05 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] at-spi2-core: upgrade 2.48.3 -> 2.48.4
Date: Wed, 13 Sep 2023 17:27:52 +0800
Message-Id: <1694597272-21156-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27872.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27872.006
X-TMASE-Result: 10--5.168800-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqyAI7Mvq/sL55Zh
	jmb07zEXJZGqld0As14nLmQ5uRWv6GRByQkQLdDagvmNrsT46HIpA2ExuipmWtMIXgOsLuq/vqn
	FtM6Nq/L7tBxFpWhrycYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgPT3miR4z27OgW6bY8SOq3WjxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0Q7AFczfjr/7NkH+g9Sc2sQ02ocyCuu95h8XMPqN+bXaXTtu
	ZPf03ZaOM+wUSAcQAY=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 09:28:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187557

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
* Add atspi_get_version() to return the runtime version of the AT-SPI library.
* collection: Fix match testing for attributes.
* collection: Avoid locking up if an object has a very large child count
* Fix possible NULL pointer dereference when deregistering an event listener.
* Various fixes for the new key grabbing API.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../atk/{at-spi2-core_2.48.3.bb => at-spi2-core_2.48.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.48.3.bb => at-spi2-core_2.48.4.bb} (95%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.48.3.bb b/meta/recipes-support/atk/at-spi2-core_2.48.4.bb
similarity index 95%
rename from meta/recipes-support/atk/at-spi2-core_2.48.3.bb
rename to meta/recipes-support/atk/at-spi2-core_2.48.4.bb
index 17b0e39a5e..0f355d8af7 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.48.3.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.48.4.bb
@@ -11,7 +11,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "37316df43ca9989ce539d54cf429a768c28bb38a0b34950beadd0421827edf55"
+SRC_URI[sha256sum] = "29ecb12992e8339675f5d755c8735ea3ea298379cfa2c93fde96bee5dc57a515"
 
 DEPENDS = " \
 	dbus \
-- 
2.34.1


