Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5BC8CA551F
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 09:30:03 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.7598.1694597395274596640
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 02:29:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="131980663"
X-IronPort-AV: E=Sophos;i="6.02,142,1688396400"; 
   d="scan'208";a="131980663"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 18:29:53 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 09E92D29E1
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 18:29:51 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 41BF9D9490
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 18:29:50 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C0B112007471E;
	Wed, 13 Sep 2023 18:29:49 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] dbus: upgrade 1.14.8 -> 1.14.10
Date: Wed, 13 Sep 2023 17:29:44 +0800
Message-Id: <1694597384-21265-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27872.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27872.006
X-TMASE-Result: 10--3.716500-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrg55m5RSwLMJdTgH6um3orv3F
	20dGzUU9ECEc6Ey/dLfPMWpEtshZrG+w5IlbLL18DOs94g784gc3l2plwgrtWDBwx50fHFECIUt
	KH5AJM9ki+t+0AiFaYvL3NxFKQpq1YWo9dIuk10Dqcdt4G7kueTK1/qdbjc7QJiSnLHwSevaem2
	vw+cenKefOVcxjDhcwPO9KPUEX8zsLbigRnpKlKZx+7GyJjhAUrnP5jSaV5qrLmlMXwux81orFj
	ztxC2W9UNrCNWaqfgrrbHAgQlyEskoWOyTat9OOAEPQpPvVTjyXYDEBvvqWg4j13ztY5Es+1UYq
	wZO3b9LrI5GJ+elRqg1Rh5V9wLZHeJk2g1TMqBRgO21BQaodlQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 09:30:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187560

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
• Avoid a dbus-daemon crash if re-creating a connection's policy fails.

• If getting the groups from a user ID fails, report the error correctly,
  instead of logging "(null)"

• Return the primary group ID in GetConnectionCredentials()' UnixGroupIDs
  field for processes with a valid-but-empty supplementary group list

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-core/dbus/{dbus_1.14.8.bb => dbus_1.14.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/dbus/{dbus_1.14.8.bb => dbus_1.14.10.bb} (98%)

diff --git a/meta/recipes-core/dbus/dbus_1.14.8.bb b/meta/recipes-core/dbus/dbus_1.14.10.bb
similarity index 98%
rename from meta/recipes-core/dbus/dbus_1.14.8.bb
rename to meta/recipes-core/dbus/dbus_1.14.10.bb
index 2dcbadd50b..2a256beabf 100644
--- a/meta/recipes-core/dbus/dbus_1.14.8.bb
+++ b/meta/recipes-core/dbus/dbus_1.14.10.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.xz \
            file://dbus-1.init \
            "
 
-SRC_URI[sha256sum] = "a6bd5bac5cf19f0c3c594bdae2565a095696980a683a0ef37cb6212e093bde35"
+SRC_URI[sha256sum] = "ba1f21d2bd9d339da2d4aa8780c09df32fea87998b73da24f49ab9df1e36a50f"
 
 EXTRA_OECONF = "--disable-xml-docs \
                 --disable-doxygen-docs \
-- 
2.34.1


