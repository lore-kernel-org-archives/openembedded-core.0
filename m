Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9994C47DDB
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 05:58:39 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.9662.1706767112941977203
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jan 2024 21:58:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WI5JbSSq;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1706767113; x=1738303113;
  h=from:to:cc:subject:date:message-id;
  bh=DV90bDtRydqV7Vut2tzT6s8dMgvGDQdI6ElRKXpZSEo=;
  b=WI5JbSSqzcO6s1kkMgyOA9AcfzWRvr7qapWCp0UAnOqz9FURMmQc1KO8
   Mq4ZZUQFIywL2rZc2sjN9lbutNs7PoZkDzc8kEegX/kcTitNPsTr34dwU
   RhKE0Mx1M9WuHEiHWHeCKZ4b3H7OPxjyXRSIy3h6uZivk09gcjUIp1kXG
   wSBA//Jk9UJNHKgjzZ9D20ZYsOTJ9PT26jCdyN7pqlG4vFavfB83iWxAV
   lKTNxi2CYuORYhxCXUZ5ECXmgn0UWGFNd27XFlrVrbWg1/fq/0AAh32qg
   GHV6ZiUQI4RrwXCYH10cOA1nwVhtluUlZhPrMcoD8gPjd9ZVTGOVtcUqW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="127400797"
X-IronPort-AV: E=Sophos;i="6.05,234,1701097200"; 
   d="scan'208";a="127400797"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 14:58:30 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 812E1178349
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 14:58:28 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id B43771A76E0
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 14:58:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 506116BF55
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 14:58:27 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B45BA1A006A;
	Thu,  1 Feb 2024 13:58:26 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] pkgconf: upgrade 2.0.3 -> 2.1.0
Date: Thu,  1 Feb 2024 13:53:45 +0800
Message-Id: <1706766825-13205-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28156.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28156.000
X-TMASE-Result: 10--5.328800-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mr5gohfuTFmzWRC4rjhOqFYXw6
	H06bMgiv8YraZs+DJptr7b8CsPPtQUqHC0EDIdtYHWRJEfGP5nkZ4i6O6koOb1wtaxQNE6ndg7c
	fJQw9FsdAjIkIsx5CJvL3NxFKQpq17VrXqiqnwHX8dMpK2wMYwkc1DwKoQo7YwLkNMQzGl5AE59
	pk4kcc5bF9uGobEuT7gDLqnrRlXrZ8nn9tnqel2DsAVzN+Ov/sPdUtmocooeBtu7KHT//Qy5f9N
	FmyGTyGsGOUVM//sW39/YIyuHhTEw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 05:58:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194579

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Do not flatten the solver solution into the original world used as
  input to the solver.
* Fix warnings with GCC 14 -Walloc-size.
* Add --solution to the pkgconf CLI to dump the solver state.
* Improve the --digraph output to clarify cancelled edges in a given
  solution.
* Demote requires dependencies to requires.private when a parent
  dependency is pulled in via requires.private.
* Trim trailing whitespace when processing package arguments.
* Avoid strncmp() in --modversion version comparison.
* Update autoconf compile flag checking macro.
* Add system default path configuration to Meson.
* Fix order of PKG_CONFIG_LIBDIR and PKG_CONFIG_PATH element processing.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../pkgconf/{pkgconf_2.0.3.bb => pkgconf_2.1.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/pkgconf/{pkgconf_2.0.3.bb => pkgconf_2.1.0.bb} (96%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_2.0.3.bb b/meta/recipes-devtools/pkgconf/pkgconf_2.1.0.bb
similarity index 96%
rename from meta/recipes-devtools/pkgconf/pkgconf_2.0.3.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_2.1.0.bb
index 5aa5a191f2..1921f3a086 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_2.0.3.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_2.1.0.bb
@@ -20,7 +20,7 @@ SRC_URI = "\
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
 "
-SRC_URI[sha256sum] = "cabdf3c474529854f7ccce8573c5ac68ad34a7e621037535cbc3981f6b23836c"
+SRC_URI[sha256sum] = "266d5861ee51c52bc710293a1d36622ae16d048d71ec56034a02eb9cf9677761"
 
 inherit autotools
 
-- 
2.34.1


