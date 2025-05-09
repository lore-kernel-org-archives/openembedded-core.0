Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3927C3ABC9
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 03:56:50 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.6512.1746762999012403191
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 May 2025 20:56:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sN4i3upt;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1746763000; x=1778299000;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=FuXswA+7tHrlERfvmiUkAXqwwk862qzhT++tSb2wJMo=;
  b=sN4i3uptN1EQ4ZuLELpHeS4kP+UBsi/DBQy7oe0Js4ndIrq16ntVnM4n
   Lqbqooum0mK3kTGoeF6E873ZgDjWCOkSz6nTdcJaj+xxOQjNL1/xNQhZQ
   LYmOtfEMyOhil5Pb3zHYjJ5Wzu5r2WukbAim0x6tQjN++88mmwW61JzOg
   EKUVXf28pLdoC4fz94fvPDdvK8gZYSkGpicnzRmwhu/E8GAsR40axDXDg
   SebOW3t8eZRSsPBH18LZfL+PxbiFm2J5Lpk2vY2123DkLr7921aBI0SMk
   l/tMMs2KGmvVVsC0NR9I6W2A/yRTkMu3PNEBIP8r9nNFzk4EA/+wCUfQG
   w==;
X-CSE-ConnectionGUID: 9qymXBmIR/u+4z2GUSSCAw==
X-CSE-MsgGUID: VlSFeqkMQV6kQL8d6Oj+5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="177769038"
X-IronPort-AV: E=Sophos;i="6.15,274,1739804400"; 
   d="scan'208";a="177769038"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 12:56:39 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id A2F85D4809
	for <openembedded-core@lists.openembedded.org>; Fri,  9 May 2025 12:56:37 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5DB12D72A3
	for <openembedded-core@lists.openembedded.org>; Fri,  9 May 2025 12:56:37 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E257A1A009A;
	Fri,  9 May 2025 11:56:36 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 03/19] gstreamer1.0-libav: upgrade 1.26.0 -> 1.26.1
Date: Fri,  9 May 2025 11:56:04 +0800
Message-Id: <1746762980-12783-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1746762980-12783-1-git-send-email-wangmy@fujitsu.com>
References: <1746762980-12783-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 03:56:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216166

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...streamer1.0-libav_1.26.0.bb => gstreamer1.0-libav_1.26.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.26.0.bb => gstreamer1.0-libav_1.26.1.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.1.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.1.bb
index a2d35f8a93..96cf5a6925 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.1.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "707a8b687ff5fddcee5b02415e2ec9b71b4ac44d0b7aec3b477364ceecbf1ecf"
+SRC_URI[sha256sum] = "350a20b45b6655b6e10265430bdfbb3c436a96e9611b79caabef8f10abe570ea"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
-- 
2.43.0


