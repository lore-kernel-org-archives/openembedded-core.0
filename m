Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F992C41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 10:17:38 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.9194.1702981054573110142
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 02:17:35 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="132306681"
X-IronPort-AV: E=Sophos;i="6.04,288,1695654000"; 
   d="scan'208";a="132306681"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 19:17:32 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id CFED8D9DAC
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 19:17:29 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 18FFFD3F2D
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 19:17:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 823AD2026E773
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 19:17:28 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3BF541A0072;
	Tue, 19 Dec 2023 18:17:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] xwayland: upgrade 23.2.2 -> 23.2.3
Date: Tue, 19 Dec 2023 18:17:18 +0800
Message-Id: <1702981038-8770-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28066.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28066.006
X-TMASE-Result: 10--0.342000-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZnVTWWiNp+v/Exmr5hqNL1nN03BZlA7M8A6J
	UWkXudIl/AGK4wInBMnk48PxckV+kHxPMjOKY7A/+HHE8LDNSg8RB0bsfrpPIcSqbxBgG0w7ua1
	UJjMvnwfVO0YQC+tpC6ZvBeCT3JZw8mXX8CdswTV7oXNipatJFHf+Xjtnw520Z8V0C0DmPuRLmb
	2upL6Ra61I7bBLHNk2CvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 10:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192722

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xwayland/{xwayland_23.2.2.bb => xwayland_23.2.3.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_23.2.2.bb => xwayland_23.2.3.bb} (95%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_23.2.2.bb b/meta/recipes-graphics/xwayland/xwayland_23.2.3.bb
similarity index 95%
rename from meta/recipes-graphics/xwayland/xwayland_23.2.2.bb
rename to meta/recipes-graphics/xwayland/xwayland_23.2.3.bb
index 9feac147db..9aa7b4dfcd 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.2.2.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.2.3.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "9f7c0938d2a41e941ffa04f99c35e5db2bcd3eec034afe8d35d5c810a22eb0a8"
+SRC_URI[sha256sum] = "eb9d9aa7232c47412c8835ec15a97c575f03563726c787754ff0c019bd07e302"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.34.1


