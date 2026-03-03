Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86316EC049B
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 10:10:17 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14975.1772532607614372269
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 02:10:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=quBjCXu4;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772532606; x=1804068606;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sUBKbjf2pIeVpKNTrNHnFMXNmGNuWyjsp+NSZxPESm0=;
  b=quBjCXu4O3OzjBmz5hAc8kgIF/JXyAkRBU7jh5ScfUPXjxNYV/NWJrYJ
   JDyHN3Ykl7CfZK8myp6n+rmnSoyeHG74gB1HvXGl+WAbk6mSVLC/bIY3y
   OEYLpNmMThU0dgi8s8Nt05sT/VRkDu3kXfkN8xEmpsmbsNF8SJGXx7OBN
   t7kCJ4omyg12/N2I4dvL0mbvFp5MV85hlCacHSxL365HmTH2cuIztiR3q
   SUsNBiZ96Z8F9jjb6uDe7XQ/NrOVgvm+xw5c6HvHfAiCrGlIF2gCDARzQ
   /6WzKfaqtY7eZhPWdVzuaM5l8cYL2Vdok4XBwNNyLOZrlFPSCfayNF2KQ
   w==;
X-CSE-ConnectionGUID: hIgMpR4rSUSGbT7Wk2i9Dw==
X-CSE-MsgGUID: S9GG4ffbQ+SZSWsNz75H/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="219676215"
X-IronPort-AV: E=Sophos;i="6.21,321,1763391600"; 
   d="scan'208";a="219676215"
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 048462B81
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 10:10:06 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id AC2281C002AF
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 10:10:05 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id F15FF1001CE5;
	Tue,  3 Mar 2026 10:10:02 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 13/23] libuv: upgrade 1.51.0 -> 1.52.0
Date: Tue,  3 Mar 2026 18:09:18 +0800
Message-ID: <20260303100929.1624-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260303100929.1624-1-wangmy@fujitsu.com>
References: <20260303100929.1624-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 10:10:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232289

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libuv/{libuv_1.51.0.bb => libuv_1.52.0.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/libuv/{libuv_1.51.0.bb => libuv_1.52.0.bb} (94%)

diff --git a/meta/recipes-connectivity/libuv/libuv_1.51.0.bb b/meta/recipes-connectivity/libuv/libuv_1.52.0.bb
similarity index 94%
rename from meta/recipes-connectivity/libuv/libuv_1.51.0.bb
rename to meta/recipes-connectivity/libuv/libuv_1.52.0.bb
index afc1bf87b5..25177bc05d 100644
--- a/meta/recipes-connectivity/libuv/libuv_1.51.0.bb
+++ b/meta/recipes-connectivity/libuv/libuv_1.52.0.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=74b6f2f7818a4e3a80d03556f71b129b \
                     file://LICENSE-extra;md5=f9307417749e19bd1d6d68a394b49324"
 
-SRCREV = "5152db2cbfeb5582e9c27c5ea1dba2cd9e10759b"
+SRCREV = "b556c0629d0fd250b5feefbc91b84c6f5e3dae48"
 SRC_URI = "git://github.com/libuv/libuv.git;branch=v1.x;protocol=https;tag=v${PV}"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


