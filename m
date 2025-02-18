Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD0B7C021AA
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 07:41:38 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.14638.1739864495116238851
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 23:41:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oKoEJSrr;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739864495; x=1771400495;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Hj9H0dTfiPlhGbBcDaFLmZYFA8glcLAUD/h2yLzIXWc=;
  b=oKoEJSrrBl2+QP/usDOgvqbFNDu5rg6tr2kALr6mC0GvPQ2Vx2NfxY1i
   W939FvRVcL6MhKn2A+ULrv3zK18w0vuQu0aEcKVCDAQuBqaY8pqzbGRhp
   u8Q3zoDgdR+221yqRgLFyNK0+q+dWzRe8pAzZCqmFUTfvg64lB7n5gDS5
   uwegLZasxdE5lg+0tQDQZEvNm/X5qgRaL3eSl1nueKmBnYSHI7Y/RAxBZ
   F2uloSpLIXo2MxusJUi8p77tbVu12R/BsXRB0nPBoQg8933VkAy1WO9aq
   7HeuhcIbPZZO8csMArp28qFInnYhNF5rjq8frhZ12vv9RM6sxDFvUpCLz
   g==;
X-CSE-ConnectionGUID: vBJpkDAxQDy6Um5aaqhNqw==
X-CSE-MsgGUID: srzmxKJpQ3uCjJwfAUB8Ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="169815839"
X-IronPort-AV: E=Sophos;i="6.13,295,1732546800"; 
   d="scan'208";a="169815839"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 16:41:33 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id D4098DBB91
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9A077D8AC3
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:30 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3D8321A006C;
	Tue, 18 Feb 2025 15:41:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 31/32] xwayland: upgrade 24.1.4 -> 24.1.5
Date: Tue, 18 Feb 2025 15:39:34 +0800
Message-Id: <1739864375-21394-31-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
References: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 07:41:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211595

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xwayland/{xwayland_24.1.4.bb => xwayland_24.1.5.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_24.1.4.bb => xwayland_24.1.5.bb} (96%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_24.1.4.bb b/meta/recipes-graphics/xwayland/xwayland_24.1.5.bb
similarity index 96%
rename from meta/recipes-graphics/xwayland/xwayland_24.1.4.bb
rename to meta/recipes-graphics/xwayland/xwayland_24.1.5.bb
index 6f8589ba5a..19a6384087 100644
--- a/meta/recipes-graphics/xwayland/xwayland_24.1.4.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_24.1.5.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "d96a78dbab819f55750173444444995b5031ebdcc15b77afebbd8dbc02af34f4"
+SRC_URI[sha256sum] = "cb4bd170e6fa6b545ba0567be8f693d2eeccfc62d04c67037dd14f06daad361d"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.43.0


