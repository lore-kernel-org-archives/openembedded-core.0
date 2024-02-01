Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 531CCC47DDB
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 05:07:09 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.9040.1706764026524237588
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jan 2024 21:07:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=b0yu7g0L;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1706764027; x=1738300027;
  h=from:to:cc:subject:date:message-id;
  bh=yJkTNDYkCd6b2suRAFgK19Dwj4a4VKF1K78s7St4wf4=;
  b=b0yu7g0LzxrNsvTkC8zPou6+PGD0T/VVtOYuQFNrkbqLQe1NO75QR8mC
   tOnrC0N6htszJF5b0BxlhtQj3GM2o8zBPS5pSFzPQfDvEv8E6j5gheuHu
   u9o8IEYSzAvD4q+i8s8umWZ0A5RyD5XrFpaQ0aLOw/7mc5Jdc7RWlv1R/
   HD61WZNcJnVTMJaV3OjD6DOXvWYIl4j75eRYNUr8DnzqnaAfTfTMYExww
   Mc1jpuwvtwyLpcOWMYLe7w1N0CcRmIjs3Hw4MPxrcm+O2/3i1A61KCFVr
   srEQ/QQ6RdBxSnmLTD5VyKY0NiG+5OpbgZYI3iWH2O9A4SuHCSMdDPQfi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="148015453"
X-IronPort-AV: E=Sophos;i="6.05,234,1701097200"; 
   d="scan'208";a="148015453"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 14:07:04 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 281E757423
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 14:07:02 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 238D4D52C5
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 14:07:01 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id B8697200968ED
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 14:07:00 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 507181A006A;
	Thu,  1 Feb 2024 13:07:00 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] ed: upgrade 1.19 -> 1.20
Date: Thu,  1 Feb 2024 13:06:48 +0800
Message-Id: <1706764008-12382-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28156.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28156.000
X-TMASE-Result: 10-3.709100-10.000000
X-TMASE-MatchedRID: eWs1WpfTtqCjz0nOeth/yUIIxwDaU5mr9avse85ISVpYC5LPd7BvbaQt
	HlwwSfPRihAiihauax47zh8AfAvfJvTxGqS5mxwx194/5X9VfCwsYZ+FvRRQ3d9RjZujPiSk+jV
	zof0NuiMW7Y2F2YCwRYDcKe8nL3eUWkIi5GvRHEo/QdUh6LEl0ME5XPQnBzGXq8KsbROd9VSArq
	oIZrVn1y1p9MVaZVrlJ9FzbH+G2yx7g4ZY3xtN6zsKXyzHgcEbrthpnZXZolBMqmvbPhiYPvBUq
	5JsuvxSYzVo9bvGzjsua2HxxNDjveVHGbcDbAq6FEUknJ/kEl5dT8gO3hPj4foLR4+zsDTt8fxd
	FDBKE7vJ4m+QcWbIxfea5SqdDgyWAnb8kp1xrzan3nKVacrssqsAnAe2D44KeQQ0eLwv86FTJPy
	OMr7mMDSIYSKu9A3rhffVlcylFgnyDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgAQ4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 05:07:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194563

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Implement options '+line', '+/RE', and '+?RE'.
* main.c: New option '--unsafe-names'.
* buffer.c (warned, set_warned): New functions.
* main_loop.c: Intervening cmds don't make a second 'e' or 'q' fail.
* io.c (write_file): Create missing intermediate directories.
* ed.texi: Improve description of commands 'e', 'f', 'q'.
* main.c, ed.texi: Improve description of exit status.
* configure, Makefile.in: New variable 'MAKEINFO'.
* INSTALL: Document use of CFLAGS+='--std=c99 -D_POSIX_C_SOURCE=2'.

License-Update: Copyright year updated to 2024.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/ed/{ed_1.19.bb => ed_1.20.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/ed/{ed_1.19.bb => ed_1.20.bb} (80%)

diff --git a/meta/recipes-extended/ed/ed_1.19.bb b/meta/recipes-extended/ed/ed_1.20.bb
similarity index 80%
rename from meta/recipes-extended/ed/ed_1.19.bb
rename to meta/recipes-extended/ed/ed_1.20.bb
index d01b7486d9..076666b04b 100644
--- a/meta/recipes-extended/ed/ed_1.19.bb
+++ b/meta/recipes-extended/ed/ed_1.20.bb
@@ -4,8 +4,8 @@ DESCRIPTION = "GNU ed is a line-oriented text editor. It is used to create, disp
 
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=76d6e300ffd8fb9d18bd9b136a9bba13 \
-                    file://ed.h;endline=20;md5=504a90a78b045972e2fd2f3fc418c195 \
-                    file://main.c;endline=17;md5=cf9d322b0ac4445ca2299c61ee175365 \
+                    file://ed.h;endline=20;md5=c3212b6c53b09668107420af9368c0ef \
+                    file://main.c;endline=17;md5=e5d2ae5ddd1ecb87dc71702c06dd06dc \
                     "
 
 SECTION = "base"
@@ -19,7 +19,7 @@ bindir = "${base_bindir}"
 SRC_URI = "${GNU_MIRROR}/ed/${BP}.tar.lz"
 UPSTREAM_CHECK_URI = "${GNU_MIRROR}/ed/"
 
-SRC_URI[sha256sum] = "ce2f2e5c424790aa96d09dacb93d9bbfdc0b7eb6249c9cb7538452e8ec77cd48"
+SRC_URI[sha256sum] = "c6030defe6ae172f1687906d7354054c75a6a9130af319d4e73c50a91959c5a6"
 
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
-- 
2.34.1


