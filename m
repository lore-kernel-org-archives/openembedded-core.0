Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67316E7D250
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 08:20:40 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.14274.1695716432711977874
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 01:20:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="112519838"
X-IronPort-AV: E=Sophos;i="6.03,177,1694703600"; 
   d="scan'208";a="112519838"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 17:20:18 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9B0F7DDC64
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 17:20:16 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id C8AB1D5E3A
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 17:20:15 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id DA5956B4CB;
	Tue, 26 Sep 2023 17:20:14 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] at-spi2-core: upgrade 2.48.4 -> 2.50.0
Date: Tue, 26 Sep 2023 16:20:03 +0800
Message-Id: <1695716403-6933-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27898.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27898.006
X-TMASE-Result: 10--4.072500-10.000000
X-TMASE-MatchedRID: Sudfee3ORQqjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyuOEENgsUAuYrWO
	DdZ1PDmEFduzHw2sP6aJBqHD96f/vDHiD7ssqsls0wmR34xRQc8bbhhV65kaY1gLks93sG9tD53
	Ef7oId+a4BKNZRDaa3PLsqSqP9dnTITGJyUmgCjd85pjA/x1xfrJOtZXi/DJfY5kkCMTwVYJdUn
	qWgKkfjSviqpeXSMwvcZ1MhulYgHC/+S+EuyGVE9Hu43wY4QfHWDH2sIy8+j+U8ftiyKjZrdMjj
	wb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNUHU9pbVOy1xV4BnlVId1nZsoi2XrUn/Jn6Kd
	MrRsL14qtq5d3cxkNQn6B/T/x2lMMaWR12ihOg9ex3kwH2fL6NzPxyGF+dPEchz5PO892fBMCfY
	7TUz/0w7csQxeUd+jlgDi1FzxfyR2S9IX5n1ddDIuZWQlOWCUU8mdcvbI1h2S6jzjuXTm0MTMzI
	CazP4UehYtaVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 08:20:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188220

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Fix at-spi2-atk test when running under a non-English locale.
* collection: Avoid locking up if an object has a very large child count
* Fix possible NULL pointer dereference when deregistering an event listener.
* Various fixes for the new key grabbing API.
* Don't wait for a reply when registering or deregistering keystroke
  listeners.
* Add a meson option to exclude the gtk2 atk-bridge module.
* Fix a test failure/timeout.
* Add atspi_get_version() to return the runtime version of the library.
* Collection: fix match testing for attributes.
* Fix a NULL pointer dereference when deregistering an event listener that
  doesn't include a detail.
* Fix the documentation for interfaces in collection match rules.
* Add an AtspiLive enum to specify the politeness level for live regions,
  and document that this should be used for Announcement signals. Also add a
  notification signal in atk to replace the announcement signal that lacks
  the politeness information.
* Add an asynchronous version of atspi_generate_mouse_event.
* TableCell.xml: Add Get{Column,Row}HeaderCells methods
* atspi_accessible_get_localized_role_name: Use internal names when possible.
* Add a non-recursive function to clear a single object's cache.
* Code clean-ups.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../atk/{at-spi2-core_2.48.4.bb => at-spi2-core_2.50.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.48.4.bb => at-spi2-core_2.50.0.bb} (95%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.48.4.bb b/meta/recipes-support/atk/at-spi2-core_2.50.0.bb
similarity index 95%
rename from meta/recipes-support/atk/at-spi2-core_2.48.4.bb
rename to meta/recipes-support/atk/at-spi2-core_2.50.0.bb
index 0f355d8af7..57958fb7f5 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.48.4.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.50.0.bb
@@ -11,7 +11,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "29ecb12992e8339675f5d755c8735ea3ea298379cfa2c93fde96bee5dc57a515"
+SRC_URI[sha256sum] = "e9f5a8c8235c9dd963b2171de9120301129c677dde933955e1df618b949c4adc"
 
 DEPENDS = " \
 	dbus \
-- 
2.34.1


