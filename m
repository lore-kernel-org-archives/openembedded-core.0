Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D068D6ACCE
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 09:06:03 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37607.1766048758728142236
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 01:05:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FDW/vlWY;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766048759; x=1797584759;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GSAX43k/xN1cffj4mFinDXicUgxrKZtuJvJIlQPgJ8o=;
  b=FDW/vlWYyVj7oJdxaaADNpv73f0jQT0wFypba1E5H4ZOkBid+CP7GppW
   tVNUv5X5/mJO5JE60KtRwqOiEtbpmEYl4BjVFtuWvZ/Yo0dSEnid15lqs
   hrKvBRfLW3YuCaDpaCtM+euLnF1kIy8reebY5mlwdTJ5jh4M9+fqHi15F
   fiatYaYGUzpxkC/QmdXAi8WvjAglI/Yo7x15/3ygMlB7w5DvAl0mIilz7
   /9c9tKdC3hmITsQHqdpJM6dHNnIKO+RnRH80uEU1h6wHjoHU1oNtWiejd
   kBb0iw25bRkrJ4HbzdP5h20263frpFBU2UiERWMZyMyiYJxrNcAfU48gE
   w==;
X-CSE-ConnectionGUID: o7CmHED+T7OM3AUVUuserw==
X-CSE-MsgGUID: PF3AaBqFToCqK7HPF7rbpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="223120658"
X-IronPort-AV: E=Sophos;i="6.21,158,1763391600"; 
   d="scan'208";a="223120658"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 18:05:57 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 19F441C17355
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 09:05:57 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id C8D218D9FCA
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 09:05:56 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 72133402663;
	Thu, 18 Dec 2025 09:05:54 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 02/11] gst-examples: upgrade 1.26.7 -> 1.26.9
Date: Thu, 18 Dec 2025 17:05:38 +0800
Message-ID: <20251218090547.828-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251218090547.828-1-wangmy@fujitsu.com>
References: <20251218090547.828-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 09:06:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228095

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Make-player-examples-installable.patch
refreshed for 1.26.9

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gst-examples/0001-Make-player-examples-installable.patch    | 2 +-
 .../{gst-examples_1.26.7.bb => gst-examples_1.26.9.bb}          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.26.7.bb => gst-examples_1.26.9.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch b/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch
index 828c87dc9a..e12ca0b613 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch
@@ -33,5 +33,5 @@ Index: gst-examples/playback/player/gtk/meson.build
         'gtk-video-renderer.c'],
        c_args :  extra_c_args,
 +      install: true,
-       dependencies : [gst_dep, gsttag_dep, gstplay_dep, gtk_dep, x11_dep])
+       dependencies : [gst_dep, gsttag_dep, gstplay_dep, gtk_dep, x11_dep, gmodule_dep])
  endif
diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.26.7.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.26.9.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gst-examples_1.26.7.bb
rename to meta/recipes-multimedia/gstreamer/gst-examples_1.26.9.bb
index 6790f0b038..febfd6736f 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.26.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.26.9.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gstreamer.git;protocol=https;b
            file://gst-player.desktop \
            "
 
-SRCREV = "c5a5c302f5e7218182c0633decec16b25de82add"
+SRCREV = "f313fae193089408e278c0dd3450145e5a12307b"
 
 S = "${UNPACKDIR}/${BP}/subprojects/gst-examples"
 
-- 
2.43.0


