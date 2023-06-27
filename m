Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA103C04FE2
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 07:19:45 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.7543.1687850384299331417
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 00:19:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="121819196"
X-IronPort-AV: E=Sophos;i="6.01,161,1684767600"; 
   d="scan'208";a="121819196"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 16:19:42 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 013D1F0762
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 16:19:40 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 281D6D5626
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 16:19:39 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id A2D3440B47;
	Tue, 27 Jun 2023 16:19:38 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] xwayland: upgrade 23.1.1 -> 23.1.2
Date: Tue, 27 Jun 2023 15:17:30 +0800
Message-Id: <1687850250-20040-33-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687850250-20040-1-git-send-email-wangmy@fujitsu.com>
References: <1687850250-20040-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27716.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27716.005
X-TMASE-Result: 10--0.342000-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZnVTWWiNp+v/Exmr5hqNL1nN03BZlA7M8A6J
	UWkXudIl/AGK4wInBMnk48PxckV+kHxPMjOKY7A/+HHE8LDNSg8RB0bsfrpPIcSqbxBgG0w506k
	ewsmQjKCbrpuMTdQYEB2BcJZT9IDYoaJ12+p9lonXNMcWwdDn1SqyG2yRiVbzmMfs8Xm3TzwraF
	cxz8puP54SNcvfrE26CvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 07:19:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183474

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xwayland/{xwayland_23.1.1.bb => xwayland_23.1.2.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_23.1.1.bb => xwayland_23.1.2.bb} (95%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_23.1.1.bb b/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb
similarity index 95%
rename from meta/recipes-graphics/xwayland/xwayland_23.1.1.bb
rename to meta/recipes-graphics/xwayland/xwayland_23.1.2.bb
index a065e92f01..de516536d1 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.1.1.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "fb9461f5cb9fea5e07e91882311b0c88b43e8843b017ebac05eb5af69aa34c15"
+SRC_URI[sha256sum] = "bd25d8498ee4d77874fda125127e2db37fc332531febc966231ea06fae8cf77f"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.34.1


