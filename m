Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40049C7EE2D
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 09:17:03 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.26251.1750065416796232873
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 02:17:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=X8Up+jTm;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750065421; x=1781601421;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5P0IqUf9mKupjbhscQ3bmFoYknCzL3/QOpnAX6JExVU=;
  b=X8Up+jTm415MvuFYI5vdmHNQPiaa+EB7E0zogykTuhIIuig1E7AJ7+gp
   w14BWjKTtaIMC5U9hjlmVv2roL5e15Wkpj+o60YNLSf2PMFpqk//aGcoG
   qxbxOyW/SNwFnbkgiLakR4U+A85aAQYk7cV4EBhspekxOkUEiURiHsh8O
   ljjG+v/N0aRPT96BGox0yUzrehzOvz6Ef7xy8nlP9YxcdzUQxGeRKqhSb
   jrNVQDPM1Q5y2S6fk7xWMIkeSaVM9TFw9QHu03xt2gLT7FfvLFXVtR9aX
   B8fN7E4E8CdPDd9u5cNI72m9jfVNGKGTYQLJV2RhyIkZ22NJH21ibowp3
   w==;
X-CSE-ConnectionGUID: UklLGIjYRd6P7Awd+AWHdg==
X-CSE-MsgGUID: YARarjEvTdOWGDkAsJDBCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="205964501"
X-IronPort-AV: E=Sophos;i="6.16,240,1744038000"; 
   d="scan'208";a="205964501"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 18:17:00 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 40680D944F
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 18:16:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id DC359CFB67
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 18:16:56 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 747F11A0073;
	Mon, 16 Jun 2025 17:16:56 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 24/24] wayland-protocols: upgrade 1.44 -> 1.45
Date: Mon, 16 Jun 2025 17:16:42 +0800
Message-ID: <20250616091643.918-24-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250616091643.918-1-wangmy@fujitsu.com>
References: <20250616091643.918-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 09:17:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218796

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{wayland-protocols_1.44.bb => wayland-protocols_1.45.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.44.bb => wayland-protocols_1.45.bb} (91%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.44.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb
similarity index 91%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.44.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.45.bb
index c86f09eb7c..d98ccf964f 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.44.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
                     file://stable/presentation-time/presentation-time.xml;endline=26;md5=4646cd7d9edc9fa55db941f2d3a7dc53"
 
 SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/${PV}/downloads/wayland-protocols-${PV}.tar.xz"
-SRC_URI[sha256sum] = "3df1107ecf8bfd6ee878aeca5d3b7afd81248a48031e14caf6ae01f14eebb50e"
+SRC_URI[sha256sum] = "4d2b2a9e3e099d017dc8107bf1c334d27bb87d9e4aff19a0c8d856d17cd41ef0"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>.+)"
-- 
2.43.0


