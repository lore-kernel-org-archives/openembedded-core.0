Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0194FC47258
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 03:20:09 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.7572.1706757600992145985
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jan 2024 19:20:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UuD6LVkj;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1706757601; x=1738293601;
  h=from:to:cc:subject:date:message-id;
  bh=UMkHH82CdEnY+8gsefL6NhZH6pd1P+5KEJOYvRD52eI=;
  b=UuD6LVkjrhUHi5FjV18qXdlN8RtogI4UMDkO1hFE5BO5Wh6FStp7mZTq
   WTFRskOiXilWFfDdTcMWQmwO9d4ZY60EZzrxQMGL9uh60817XIu7ptelO
   +i9XEXSZ+GVJLQgqPaRM1bC//PVK2tmAQZjAoUUjGe1xN8quhTWUejag1
   MzBf550moNEsy1g4U2qfC4L2bqBVOs0eyvdVCWK3EQHyu2eg6CZ3w4Lxr
   MZZJvKs5eLvrF2l5DqHnM4wKEwRz7sDKKYZ8O9qpxVyj2nPBk6j9iryJ+
   tQfA0LQKkcHcix5BSvpOKKhtJIjzfVaWlncjzHoImECYWfamaMQE+VHVP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="147463740"
X-IronPort-AV: E=Sophos;i="6.05,234,1701097200"; 
   d="scan'208";a="147463740"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 12:19:58 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id DD3D6229902
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 12:19:55 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2E2ABCFA59
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 12:19:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id ADAC91EAB27
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 12:19:54 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 324AC1A006A;
	Thu,  1 Feb 2024 11:19:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] at-spi2-core: upgrade 2.50.0 -> 2.50.1
Date: Thu,  1 Feb 2024 11:19:44 +0800
Message-Id: <1706757584-11373-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28156.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28156.000
X-TMASE-Result: 10--3.876800-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrTfK5j0EZbytGQgIVrmBL5GMf
	Gs5Z5uJU4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyWY5v+NllnxQtwu4etvAeWWa7b
	Pg6zgbaWxfbhqGxLk+4Ay6p60ZV62To3UJuRLIoTdB/CxWTRRu+rAZ8KTspSzz9BjxW4q9OfwUp
	M5KHqN+bgOqdN9BJqIlmrPY3X71nIA6G0o3xbwSkp6e3QASY81CsupjCIkGNKQDOTx/U5WSdkuc
	TjNd1O4iB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 03:20:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194550

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 atk-adaptor: Fix critical when no table cell array is returned.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../atk/{at-spi2-core_2.50.0.bb => at-spi2-core_2.50.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.50.0.bb => at-spi2-core_2.50.1.bb} (95%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.50.0.bb b/meta/recipes-support/atk/at-spi2-core_2.50.1.bb
similarity index 95%
rename from meta/recipes-support/atk/at-spi2-core_2.50.0.bb
rename to meta/recipes-support/atk/at-spi2-core_2.50.1.bb
index 57958fb7f5..6996ebebcd 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.50.0.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.50.1.bb
@@ -11,7 +11,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "e9f5a8c8235c9dd963b2171de9120301129c677dde933955e1df618b949c4adc"
+SRC_URI[sha256sum] = "5727b5c0687ac57ba8040e79bd6731b714a36b8fcf32190f236b8fb3698789e7"
 
 DEPENDS = " \
 	dbus \
-- 
2.34.1


