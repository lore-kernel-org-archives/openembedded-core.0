Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC0FCEB64D9
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 03:12:56 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.4879.1688699566462564193
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 20:12:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="123531423"
X-IronPort-AV: E=Sophos;i="6.01,187,1684767600"; 
   d="scan'208";a="123531423"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 12:12:44 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id EC43EC53C3
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Jul 2023 12:12:41 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3028DD4F50
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Jul 2023 12:12:41 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id A023B41053;
	Fri,  7 Jul 2023 12:12:40 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] wayland-protocols: upgrade 1.31 -> 1.32
Date: Fri,  7 Jul 2023 11:12:32 +0800
Message-Id: <1688699552-2480-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1688699552-2480-1-git-send-email-wangmy@fujitsu.com>
References: <1688699552-2480-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27736.002
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27736.002
X-TMASE-Result: 10-0.510000-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZnVTWWiNp+v8gX2Xt4pvYkXIoejYiEnKCYFB
	yhrH0UHdbJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w7SDu
	QdrSFvZfUnln5OPeXHvhb6aZIdFs/Rbmh8L4gxQPeJbVu75m587fxOwG+qVLkNDUt94PIvrRgg2
	8lKYpX8ex3UzSbusaGCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jul 2023 03:12:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183994

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{wayland-protocols_1.31.bb => wayland-protocols_1.32.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.31.bb => wayland-protocols_1.32.bb} (91%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.31.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb
similarity index 91%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.31.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.32.bb
index afde995fd4..05943bc388 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.31.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
                     file://stable/presentation-time/presentation-time.xml;endline=26;md5=4646cd7d9edc9fa55db941f2d3a7dc53"
 
 SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/${PV}/downloads/wayland-protocols-${PV}.tar.xz"
-SRC_URI[sha256sum] = "a07fa722ed87676ec020d867714bc9a2f24c464da73912f39706eeef5219e238"
+SRC_URI[sha256sum] = "7459799d340c8296b695ef857c07ddef24c5a09b09ab6a74f7b92640d2b1ba11"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 
-- 
2.34.1


