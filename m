Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8999AD6ACCE
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 09:06:23 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37736.1766048773154215005
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 01:06:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VQgIRjID;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766048773; x=1797584773;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=s5upzGRvhicsXC45xNOFqUeuTsBhn4ZzN18pX1sCpCw=;
  b=VQgIRjIDBYcXO2/ztkdcHoeL+KHnYCbvgK1rGUVDqfbMHUlr3b4AeqeX
   xZlhy7ZcrNc/9HMe7kMAN6H2sCQlT7nkbe0K8TLHw03BtpPaswtrK1Uwp
   JlN+erCPYi4TkLJrhYelYvYD6eZACxjl9xMTGUNQFBITn5b8XbIhXdUJt
   sknI7+UXUNf6j3gN5i0lj4gkt0HWJwttY1T7vIjeTIjDtAnCHt5+o2h0N
   ioMjB78mLMa0Oa+u+Mcr0or+ITcUud8LFRtBq2rpHXa9j11+wIY8Tp0lX
   HO7y7Yvn+LrOxswiNIDCpWoolZtxvA+cZspyW7W4I+8AdOUOCPy0tfY2Z
   g==;
X-CSE-ConnectionGUID: TkY5axJLTbqabhCHLa6SPA==
X-CSE-MsgGUID: WqM4+6jJTdW8an5yhgzp/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="211660272"
X-IronPort-AV: E=Sophos;i="6.21,158,1763391600"; 
   d="scan'208";a="211660272"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 18:06:11 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 872154071C0
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 09:06:11 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 3955A1005968
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 09:06:11 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id B89F7402676;
	Thu, 18 Dec 2025 09:06:08 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 11/11] gstreamer1.0-vaapi: upgrade 1.26.7 -> 1.26.9
Date: Thu, 18 Dec 2025 17:05:47 +0800
Message-ID: <20251218090547.828-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251218090547.828-1-wangmy@fujitsu.com>
References: <20251218090547.828-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 09:06:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228104

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...streamer1.0-vaapi_1.26.7.bb => gstreamer1.0-vaapi_1.26.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.26.7.bb => gstreamer1.0-vaapi_1.26.9.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.9.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.7.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.9.bb
index e9515405ce..dc5055bb0c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.9.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "4885d4a02bb2f17c2af618879b5e77f1acdcedcba859aabd3b970550e2940a38"
+SRC_URI[sha256sum] = "bf989040404515dc9b042f4fdc49ff33a6dccf49d544736150e967b42665598e"
 
 S = "${UNPACKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-- 
2.43.0


