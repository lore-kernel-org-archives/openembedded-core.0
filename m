Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57177C71135
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 08:45:39 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.11711.1749026731936099184
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 01:45:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OE1+iQ+F;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749026733; x=1780562733;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=o13nzGBUiU7U9Prlmig4k/Fb9j3xznc2HQICrix699w=;
  b=OE1+iQ+FtQ1TYJXCWUKocq/hCfwN1pS14706LdT+cZeOr1m1pDsEGwm/
   9hiMMVpRFvKbwjfZd25ddcLLhQp/vOe0vsCNP7DfMzs67FCX+BQVymJAo
   LpDmoqmBnncHsdydxu7rMEtiAyciWxp5SZKFK8NhOnt2D7TaZrLyUGgO5
   4OwzVRabsZfIuXlzfLbwY33dQZ4AtWXUhgRdYRwvX1ZD1dvOWwt4s0bvB
   C5u+mEw14TBpkjl4mLblzxZlqAnhDRC/2S2T2XC5O8OpSwrnfAfWGLv4g
   JbMHlSfIyWAsXGi226wUhiKZkEGnwOVhYzGB3EyVZ+3mWn0GNuIKX8z16
   g==;
X-CSE-ConnectionGUID: 1qJcucDLR0GrrRY9u9Vvpg==
X-CSE-MsgGUID: S5QkVA59RYyW4uBaQPPhvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="180576688"
X-IronPort-AV: E=Sophos;i="6.16,208,1744038000"; 
   d="scan'208";a="180576688"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 17:45:32 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8B9D2E0ABD
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 47B1DD4F40
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:30 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B96001A0078;
	Wed,  4 Jun 2025 16:45:29 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 06/45] gst-devtools: upgrade 1.26.1 -> 1.26.2
Date: Wed,  4 Jun 2025 16:44:44 +0800
Message-ID: <20250604084524.864-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250604084524.864-1-wangmy@fujitsu.com>
References: <20250604084524.864-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 08:45:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217850

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gst-devtools_1.26.1.bb => gst-devtools_1.26.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.26.1.bb => gst-devtools_1.26.2.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.1.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.2.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.26.1.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.26.2.bb
index cbad470d26..f898db80e7 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.2.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "32e15cb9d2dd6a07532f92745b62f1c72c8038b1a10d34b64e91c4557f689632"
+SRC_URI[sha256sum] = "400ff79fe371367deb8ad1adf8b4643d6e558a433bf83136c2dd496fe8210f37"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
-- 
2.43.0


