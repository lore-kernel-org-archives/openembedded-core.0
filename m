Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7080CEB7EBE
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 10:32:32 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15009.1772620346627558875
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 02:32:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=o4ucQWrq;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772620346; x=1804156346;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cAvGSRdEqDrbfteWXkWarxkkjvSGGPfhA6kBgAa1TZI=;
  b=o4ucQWrqZv+0SEa9n3euzTgNgq2cM6bYxK0+6KUdOKiKGQXgrS1XSHv0
   n1BvHNeG6EazQcMkbSsX6LIgAtFxv6FERNE+IxmzZsejjRvxOcgfeefMX
   n5KEzqZcbEjkhs/xbGD2gEqiMOk3spx+Lj15Qb8TFidvSIAFHWZ1VA49p
   uuUhu7llgiqmLuOXcTiXEw0J4N+HXFjWgu8czWol8Mbww+4qN+TYmBFgC
   VVyQhtwnJaPPPLodPzeH/3ChBT/PJeV0mPiAo6sljbssix5SXjrZxSTkj
   SgglhlesDthlrka5boeQ+4tXztJpzFijTHIqqV71N3smqwYzjlyj3H7dU
   Q==;
X-CSE-ConnectionGUID: 5UiUha/KT6SaosvFn5zrSA==
X-CSE-MsgGUID: whNAI7jNSzW/r/ejV1QcUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="220540247"
X-IronPort-AV: E=Sophos;i="6.21,323,1763391600"; 
   d="scan'208";a="220540247"
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.fujitsu.com (Postfix) with ESMTPS id 147811C1C701
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Mar 2026 10:32:25 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id BF1981401270
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Mar 2026 10:32:24 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 238901007193;
	Wed,  4 Mar 2026 10:32:21 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 02/10] gst-examples: upgrade 1.26.9 -> 1.28.0
Date: Wed,  4 Mar 2026 18:31:55 +0800
Message-ID: <20260304103203.1649-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260304103203.1649-1-wangmy@fujitsu.com>
References: <20260304103203.1649-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 10:32:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232361

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gst-examples_1.26.9.bb => gst-examples_1.28.0.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.26.9.bb => gst-examples_1.28.0.bb} (94%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.26.9.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.28.0.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gst-examples_1.26.9.bb
rename to meta/recipes-multimedia/gstreamer/gst-examples_1.28.0.bb
index febfd6736f..066454608b 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.28.0.bb
@@ -7,12 +7,12 @@ LIC_FILES_CHKSUM = "file://playback/player/gtk/gtk-play.c;beginline=1;endline=20
 
 DEPENDS = "glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad gtk+3 json-glib glib-2.0-native"
 
-SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gstreamer.git;protocol=https;branch=1.26;tag=${PV} \
+SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gstreamer.git;protocol=https;branch=1.28;tag=${PV} \
            file://0001-Make-player-examples-installable.patch \
            file://gst-player.desktop \
            "
 
-SRCREV = "f313fae193089408e278c0dd3450145e5a12307b"
+SRCREV = "9058212f43074ef7df229e73cea135c4ea96e0d6"
 
 S = "${UNPACKDIR}/${BP}/subprojects/gst-examples"
 
-- 
2.43.0


