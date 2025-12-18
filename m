Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D00DD6ACCC
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 09:06:03 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37725.1766048754902068289
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 01:05:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Vv+flAKB;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766048754; x=1797584754;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GHPK+sxtClGc4B0QH/zShJenvTWUcfrefGkOfsoXsWA=;
  b=Vv+flAKB9/YnXqx3nwResJWf2ng0BW/YnGg0hjUuyEwo842OHBWM1wDq
   yVHQFy/eo6l/tSbr5c2b/5yoACKgYJyX7abCz+reLPjMhHA14hbOqm+jW
   oDnw9AhuGrl2f9EsxDqyabxOM23MXf3n2ySIXMrZJCBzDuWyM0DR1pLIp
   OHWH1yCDmmhe6iIMBBNRC/lYtGKvd93+uBp4uCcGcxA/u516WRnEUcv+A
   /bJjXwev2exnHybNa4hfZZ/U06lxjF182wMjkZ+cctoE6HyHyKvDkYW6y
   jxF23KFtjaMg1PRTvyhJpu5FkCWD2yl3IIXt31TzFVdapnu7Sc1bYObuM
   w==;
X-CSE-ConnectionGUID: wxg/tWI2TrKaYM7p1JEZtQ==
X-CSE-MsgGUID: Jn8OyyKHTNaiSDpugN+qvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="223710187"
X-IronPort-AV: E=Sophos;i="6.21,158,1763391600"; 
   d="scan'208";a="223710187"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 18:05:53 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 660A010029A7
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 09:05:53 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 1BDC58D9FDA
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 09:05:53 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id AFE4040267A;
	Thu, 18 Dec 2025 09:05:50 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 01/11] gst-devtools: upgrade 1.26.7 -> 1.26.9
Date: Thu, 18 Dec 2025 17:05:37 +0800
Message-ID: <20251218090547.828-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 09:06:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228094

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gst-devtools_1.26.7.bb => gst-devtools_1.26.9.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.26.7.bb => gst-devtools_1.26.9.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.7.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.9.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.26.7.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.26.9.bb
index dab66c3c9c..44c579f2a4 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.9.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "6912330ecfaf4f4f1329defbe97b9daf92e9aeaf8375e327a0dd30524d79f0a0"
+SRC_URI[sha256sum] = "55c7adaf9eee7a5219d44b736c401a947ebb5d0130c78e900017a6812026b567"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
-- 
2.43.0


