Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80594C04FE1
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 07:19:35 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.7576.1687850372972499989
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 00:19:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="101083421"
X-IronPort-AV: E=Sophos;i="6.01,161,1684767600"; 
   d="scan'208";a="101083421"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 16:19:31 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 97C7EC68E6
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 16:19:29 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id D1D8ED208E
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 16:19:28 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4321540B4D;
	Tue, 27 Jun 2023 16:19:28 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] mesa: upgrade 23.1.1 -> 23.1.3
Date: Tue, 27 Jun 2023 15:17:13 +0800
Message-Id: <1687850250-20040-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687850250-20040-1-git-send-email-wangmy@fujitsu.com>
References: <1687850250-20040-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27716.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27716.005
X-TMASE-Result: 10--1.465200-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yQPZZctd3P4BN5dqZcIK7Vgg9R3V8qg5xNb2
	e7N2CFQyUUJNrrF6kU+hgqRXf9ZDmi/7QU2czuUNnVTWWiNp+v/pKYVp5Qz29wySorGVJadyHqx
	sBjV0bTaESVL06fzYOxP6uxGv2vDH5UcZtwNsCroURSScn+QSXt0H8LFZNFG76sBnwpOylLNu6S
	n5nfHWfUINjuIjZsZs0DAJD1K3Xe//siAIm+O7xl4GXaQ4i6S8qgl16qMOztiL87Bri/4p2Uroq
	RYCpf8TZt7h4p53DXuIHqaUMp7VXtL/LK0d4I30Ze/gJB41STsbqpM7Cr+fvX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 07:19:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183458

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../mesa/{mesa-gl_23.1.1.bb => mesa-gl_23.1.3.bb}               | 0
 meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
 meta/recipes-graphics/mesa/{mesa_23.1.1.bb => mesa_23.1.3.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_23.1.1.bb => mesa-gl_23.1.3.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_23.1.1.bb => mesa_23.1.3.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_23.1.1.bb b/meta/recipes-graphics/mesa/mesa-gl_23.1.3.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_23.1.1.bb
rename to meta/recipes-graphics/mesa/mesa-gl_23.1.3.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index ac42a8dd4f..a944a7bdd5 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -19,7 +19,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            "
 
-SRC_URI[sha256sum] = "a2679031ed5b73b29c4f042ac64d96f83b0cfe4858617de32e2efc196c653a40"
+SRC_URI[sha256sum] = "2f6d7381bc10fbd2d6263ad1022785b8b511046c1a904162f8f7da18eea8aed9"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_23.1.1.bb b/meta/recipes-graphics/mesa/mesa_23.1.3.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_23.1.1.bb
rename to meta/recipes-graphics/mesa/mesa_23.1.3.bb
-- 
2.34.1


