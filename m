Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 967E9C61DC2
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:13:57 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7657.1787732034735839020
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:13:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YaxCkj1g;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787732035; x=1819268035;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=M3A/VhGDa7jtjx3sUfkNPoNNCNMsdjWuegzpJj5pzIk=;
  b=YaxCkj1giYrvpLOX8ZizfMppIjiSJuNRQiysasMJMhkOJw4K6C/durql
   wGBK9m34txCsIqhCSSIl6AEGOAHCoolTSFYCpC00RCKElhPPmrzS7LhVK
   Z3bcemNhr/q0/c9z37nklrJnLvdSwDyTso/+YGxATlEDz5u35pJdnAe5z
   gl9MZ5p5C5Rvec7x1XrK7E3rLqV4241KQy8HKUR2hbGHpnhuyyChVbyPF
   WZFK7CukDvf5TIce7HEjxP5cIYrFOQ0L9Wvd83nXN/6yEtGrb6j0a7Pcd
   VQmd6ZhPSO+Ck+Q7500sbByYVOhuRDh78oNL3U4c61Zbe+6mAXcJ5/BVn
   g==;
X-CSE-ConnectionGUID: FaXYjnd+RY+riABcx+Bi+w==
X-CSE-MsgGUID: vi9xESZhSWG+qJROD+GwdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="252189940"
X-IronPort-AV: E=Sophos;i="6.25,244,1779116400"; 
   d="scan'208";a="252189940"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 17:13:53 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 306FA1C000E6
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:13:53 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id D53481032BA5
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:13:52 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id E68728214FF;
	Wed, 26 Aug 2026 08:13:50 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 01/17] gst-devtools: upgrade 1.28.5 -> 1.28.6
Date: Wed, 26 Aug 2026 16:13:32 +0800
Message-ID: <20260826081348.1006-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:13:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244340

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gst-devtools_1.28.5.bb => gst-devtools_1.28.6.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.28.5.bb => gst-devtools_1.28.6.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.5.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.6.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.28.5.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.28.6.bb
index a0775e94ad..60fd92e0a8 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.6.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "7459045db31d6e44600bcbe011dc925750268870e7b90f7e7a0a3af4a21c09e5"
+SRC_URI[sha256sum] = "14d41faae03619251f95959d3d57bf65c6106838b3b54218dc95c7135e1eba13"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
-- 
2.43.0


