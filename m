Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CB4FD46C1B
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 03:12:54 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7230.1769656371495874396
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jan 2026 19:12:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MAR3hZaT;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769656371; x=1801192371;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=o1at0XS4jplCwCDwwmjSB09vy32MGGxNWjMACs+msvk=;
  b=MAR3hZaTotf/3uF3W0qHzrsXFKp1Cmoipo2VOCiaOmiI3CIP1NlcGI3K
   z0f18Dot53OyiZARt/B3bB5WugheShRhMy6Q9RlNPFBcpJVeeS0eLtppW
   aXvhWtQMP4eY/NsrHuVC5Btl+oUcUIhAZo2+f+MGC0WlO1ltjH4SYFovV
   xFi3cxwS9SX1oerQxim6SsuDWn9rzareMElB8KOGU2FkLQorgLYUBBaj6
   W/IZnt8GIQNJdyygZjG4k/FAD//fCjICwt+hwtx0LZ5nsa0HGyIyBkG5p
   3cVpkRGy6lb9KcO0wv4+IgDpWRfY9zFhQPb92tF2lqjIcjRhWybG/eNkg
   Q==;
X-CSE-ConnectionGUID: hYZL5Yh8QVy66T2rcQmEuw==
X-CSE-MsgGUID: te1v5wLzRhKvXYYGOjYIfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="215076963"
X-IronPort-AV: E=Sophos;i="6.21,260,1763391600"; 
   d="scan'208";a="215076963"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 12:12:49 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 8E52A1C1C730
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 03:12:49 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 41C611810781
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 03:12:49 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id A63FC20000C4;
	Thu, 29 Jan 2026 03:12:46 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] python3-packaging: upgrade 25.0 -> 26.0
Date: Thu, 29 Jan 2026 11:12:43 +0800
Message-ID: <20260129031243.1180-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 03:12:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230111

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-packaging_25.0.bb => python3-packaging_26.0.bb}   | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-packaging_25.0.bb => python3-packaging_26.0.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-packaging_25.0.bb b/meta/recipes-devtools/python/python3-packaging_26.0.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-packaging_25.0.bb
rename to meta/recipes-devtools/python/python3-packaging_26.0.bb
index 9cb5c68f58..3f98ea9624 100644
--- a/meta/recipes-devtools/python/python3-packaging_25.0.bb
+++ b/meta/recipes-devtools/python/python3-packaging_26.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/packaging"
 LICENSE = "Apache-2.0 | BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=faadaedca9251a90b205c9167578ce91"
 
-SRC_URI[sha256sum] = "d443872c98d677bf60f6a1f2f8c1cb748e8fe762d2bf9d3148b5599295b0fc4f"
+SRC_URI[sha256sum] = "00243ae351a257117b6a241061796684b084ed1c516a08c48a3f7e147a9d80b4"
 
 SRC_URI += "file://run-ptest.in"
 
@@ -36,6 +36,7 @@ RDEPENDS:${PN}-ptest = "\
     python3-pretend \
     python3-pytest \
     python3-unittest-automake-output \
+    python3-tomli-w \
 "
 
 # The ptest package contains prebuilt test binaries
-- 
2.43.0


