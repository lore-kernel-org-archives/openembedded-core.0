Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADE72E67A9C
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 10:10:17 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14949.1772532609412824253
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 02:10:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tu0YYxQ9;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772532609; x=1804068609;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WG77Jtr2B6yt//avpjE8hz3i6anClpvg64o0QjVRVPY=;
  b=tu0YYxQ9FmuOs8sbC9BuI5ixzg0+KlG3qA9o4kxZ0abeKDkuY2rMzXTj
   8VmARHSOsTxxkdv0gGuRE48w+b5WX320WzsrubSzOt/zCZRjB1ctzJJaY
   kUvHMVE+h74E+u0eiRIUEZWrJsXJHIGDF918LIcZGpCBEu+IFCV2SsRby
   hvwi85aHVD5vxzxpRE8Us3qALTXe/K7sQ4cy8Bbh+p+0JmlYaLIuhG2Tm
   w4Bsa+4jaNWjYlRB7pHyJkeVpGFnoNQ84Q1NdPysy/dT5ha37ZLQmOGF3
   gK0xoxMZcSbIcfjxLZkIWElNSq68aUcovHJaKIl5nuRcIql4dYYeA36VS
   g==;
X-CSE-ConnectionGUID: sdqXuIHkR12NnHg02zQvFA==
X-CSE-MsgGUID: ttu8R4QXRCegfLZ8kTfFHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="232410396"
X-IronPort-AV: E=Sophos;i="6.21,321,1763391600"; 
   d="scan'208";a="232410396"
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.fujitsu.com (Postfix) with ESMTPS id DADEB1002B81
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 10:10:07 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 9277B18000C2
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 10:10:07 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id F14E01001CE4;
	Tue,  3 Mar 2026 10:10:04 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 14/23] libx11: upgrade 1.8.12 -> 1.8.13
Date: Tue,  3 Mar 2026 18:09:19 +0800
Message-ID: <20260303100929.1624-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260303100929.1624-1-wangmy@fujitsu.com>
References: <20260303100929.1624-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 10:10:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232290

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Drop vestiges of OS/2 support

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{libx11_1.8.12.bb => libx11_1.8.13.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libx11_1.8.12.bb => libx11_1.8.13.bb} (86%)

diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb b/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb
similarity index 86%
rename from meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb
rename to meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb
index 580e44889d..f5c27e0102 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb
@@ -7,7 +7,7 @@ basic functions of the window system."
 require xorg-lib-common.inc
 
 LICENSE = "MIT & BSD-1-Clause & HPND & HPND-sell-variant & ISC"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1d49cdd2b386c5db11ec636d680b7116"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8f2a1d92c4a50eedcf7c12672b908851"
 
 DEPENDS += "xorgproto \
             xtrans \
@@ -23,7 +23,7 @@ XORG_PN = "libX11"
 
 SRC_URI += "file://disable_tests.patch"
 
-SRC_URI[sha256sum] = "fa026f9bb0124f4d6c808f9aef4057aad65e7b35d8ff43951cef0abe06bb9a9a"
+SRC_URI[sha256sum] = "69606f485c2c07c14ef64f75b7bb326d48587af33795d9ab3e607c0b5f94f11c"
 
 inherit gettext
 
-- 
2.43.0


