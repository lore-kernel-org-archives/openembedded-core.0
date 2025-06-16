Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04953C761AE
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 09:17:03 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.26268.1750065413647293025
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 02:16:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=m3o3+xna;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750065416; x=1781601416;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MyMiRZM63sGJpwuGVhA4SWEaAxVwwvse2iscHMA/42k=;
  b=m3o3+xnaaCxAMPTgme5jbEURWEm0Kt9RZqxKERmceMe7gGxk8elJbKfr
   QBl6OS5juzkezwkLA3AqRFe6jKmRrwSL+cF3gd9F/z8rk4zFjV9irlqPw
   cFwxp32q3rvxF/55XqI+/s61N0lP6yxOxjbDbazSG0kVAYY4jA9MWEXCT
   UoBBwkgeCjqBsKcBDVISQ6Ic0mVXJIgqk9hXhKv/vnqy+oLLIBvjSXg/j
   yZeh3dGIfHDnmAuQ5OdeqWvUu78LR/jFboH57o7KjkYKCI3WddLIRcv8b
   2dgFiB/4gBzH7eWsyx7fV4cx5tekjk1OB9lzDpo/bWVF6OIpP+HIbImCJ
   g==;
X-CSE-ConnectionGUID: ylSwnxbJRGiRP3uDZEEdug==
X-CSE-MsgGUID: /iX47Y/9RI2I+VrdYRgzrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="202102163"
X-IronPort-AV: E=Sophos;i="6.16,240,1744038000"; 
   d="scan'208";a="202102163"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 18:16:54 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6CFE1E8FDA
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 18:16:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 19E04D4C0F
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 18:16:52 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 87EA51A000B;
	Mon, 16 Jun 2025 17:16:51 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 11/24] meson: upgrade 1.8.1 -> 1.8.2
Date: Mon, 16 Jun 2025 17:16:29 +0800
Message-ID: <20250616091643.918-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250616091643.918-1-wangmy@fujitsu.com>
References: <20250616091643.918-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 09:17:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218782

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/meson/{meson_1.8.1.bb => meson_1.8.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/meson/{meson_1.8.1.bb => meson_1.8.2.bb} (98%)

diff --git a/meta/recipes-devtools/meson/meson_1.8.1.bb b/meta/recipes-devtools/meson/meson_1.8.2.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_1.8.1.bb
rename to meta/recipes-devtools/meson/meson_1.8.2.bb
index af4bc9fecd..bfeaab0a79 100644
--- a/meta/recipes-devtools/meson/meson_1.8.1.bb
+++ b/meta/recipes-devtools/meson/meson_1.8.2.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/meson-${PV}.tar.gz \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
            "
-SRC_URI[sha256sum] = "b4e3b80e8fa633555abf447a95a700aba1585419467b2710d5e5bf88df0a7011"
+SRC_URI[sha256sum] = "c105816d8158c76b72adcb9ff60297719096da7d07f6b1f000fd8c013cd387af"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)$"
 
 inherit python_setuptools_build_meta github-releases
-- 
2.43.0


