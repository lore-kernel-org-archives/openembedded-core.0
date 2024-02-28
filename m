Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD242C47DD9
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 07:33:30 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.8418.1709105610013304442
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 23:33:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CUSeDuUE;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709105609; x=1740641609;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=9tQN14Gm+/A4OdlNcq1fytT+Ob4G1LcEAMyKnbylA9A=;
  b=CUSeDuUEUQxN2SYR7fhCZPm9tBvWXN3FCaXsIYCVkvwgyLzcZ8HMsHM9
   jLSXeR3lRPxu/gklpO3YEvo4hvlVBTBSiZnXwvsLVeT1NjodJdQK+q1rw
   NCuyBkP9cLe8stqvOhxzq+L9ZavZxxeb0pD85UY6JKDHwC+fTnTwVgXRy
   qs3ezCUUCZx+3wY2sE+35h/2Cu5hOJOQx7nN3SuhOJHlDHQuYu+UFER61
   PvQ6L/gEUGPOHVuvt6HIKSekjz9KTtvcfK6p0+kK9EjwHurAlNuKFDXwP
   fNH7fs6OewKjCJKMogVIUWO1do5xgT5HTKtKCuLIJxT+WfYxdhEuXXmeZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="152444743"
X-IronPort-AV: E=Sophos;i="6.06,190,1705330800"; 
   d="scan'208";a="152444743"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 16:33:27 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3B616D4804
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:25 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 71732D5B27
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:24 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 34C3A41180
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:23 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CFFB81A006A;
	Wed, 28 Feb 2024 15:33:22 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 15/48] libpng: upgrade 1.6.41 -> 1.6.42
Date: Wed, 28 Feb 2024 15:32:22 +0800
Message-Id: <1709105575-24259-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
References: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28218.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28218.005
X-TMASE-Result: 10-0.736100-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwhnsw3wqmXOnAOi
	VFpF7nSJ4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2a2EwWJsUOPMnpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFPfbG+uIaO/bf3cZVilufGa88D
	ONKfZU/8ODw+qQ3dbi1D4atgVH56zzr7LFIUD/0pi2LhoA10KY9W6AbBw0Pi97ec4ouixZPex9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 07:33:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196343

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fixed the implementation of the macro function png_check_sig().

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libpng/{libpng_1.6.41.bb => libpng_1.6.42.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.41.bb => libpng_1.6.42.bb} (92%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.41.bb b/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
similarity index 92%
rename from meta/recipes-multimedia/libpng/libpng_1.6.41.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.42.bb
index 8c7529be9b..d84cb19151 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.41.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
@@ -11,7 +11,7 @@ DEPENDS = "zlib"
 LIBV = "16"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "d6a49a7a4abca7e44f72542030e53319c081fea508daccf4ecc7c6d9958d190f"
+SRC_URI[sha256sum] = "c919dbc11f4c03b05aba3f8884d8eb7adfe3572ad228af972bb60057bdb48450"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/older-releases/"
 
-- 
2.34.1


