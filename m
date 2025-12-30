Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF942E95A65
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 09:18:09 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.61246.1767086279957702990
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 01:18:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NCILJY2l;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767086280; x=1798622280;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BRdZWWC87JSo05VcUDz/HOHzfmvgLQ/K0Vf22n3qZOs=;
  b=NCILJY2lhsmE9kJXM19CLArqCeEGeLqMlii1EVYbvllSqcqa90lYL6vN
   zBKD0Z9LFusducTPkz5j4HexfX9JtKLjmOwIBqeBL5KhPTh8zMQ9A9Bqh
   0p1SLA7tPzdnqSjFgDGAINS8qDF5lTxBQK1LGD4bpk+m72YgFvWD8fI2K
   ejnb7QFXihGdSmyvYZF3/Rz7u06zVHvEkAg+gT2aOhwN+AUaFUHAnsmL5
   9Uan303t0kjjV/ZMCBrjVotIxydK3h9faVSAau+QOGq0YCCyQCYQsC0jq
   /Esii6B0Kr2yecfcjarD70/D7hflYcGF7Kvdx3Jab025M5Q9sz6QSQs1y
   Q==;
X-CSE-ConnectionGUID: DyiOM87uQ+avziAUbvT93A==
X-CSE-MsgGUID: va46kQo4R/SPp1fw6ngglQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="228271210"
X-IronPort-AV: E=Sophos;i="6.21,188,1763391600"; 
   d="scan'208";a="228271210"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 18:17:59 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 6F4B61C1C701
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 09:17:58 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 222B4C008A4
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 09:17:58 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 85FAE1800514;
	Tue, 30 Dec 2025 09:17:55 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 11/12] xcb-util-cursor: upgrade 0.1.5 -> 0.1.6
Date: Tue, 30 Dec 2025 17:17:12 +0800
Message-ID: <20251230091714.1501-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251230091714.1501-1-wangmy@fujitsu.com>
References: <20251230091714.1501-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 09:18:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228653

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- Copy default search path from libXcursor
- Update submodule URL from anongit to gitlab
- Strip trailing whitespace

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{xcb-util-cursor_0.1.5.bb => xcb-util-cursor_0.1.6.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{xcb-util-cursor_0.1.5.bb => xcb-util-cursor_0.1.6.bb} (72%)

diff --git a/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.5.bb b/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.6.bb
similarity index 72%
rename from meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.5.bb
rename to meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.6.bb
index cd442db210..7c54f6d7a9 100644
--- a/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.5.bb
+++ b/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.6.bb
@@ -7,4 +7,4 @@ DEPENDS += "xcb-util xcb-util-renderutil xcb-util-image"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ce469b61c70ff8d7cce0547476891974"
 
-SRC_URI[sha256sum] = "0caf99b0d60970f81ce41c7ba694e5eaaf833227bb2cbcdb2f6dc9666a663c57"
+SRC_URI[sha256sum] = "fdeb8bd127873519be5cc70dcd0d3b5d33b667877200f9925a59fdcad8f7a933"
-- 
2.43.0


