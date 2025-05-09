Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00919C3ABC3
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 03:58:01 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.6525.1746763071824277864
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 May 2025 20:57:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZSk8ztI3;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1746763071; x=1778299071;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=6gIFUqyhjFH9CoyVWE1dRuqr1iZ9zjh1XzRzIR+teOI=;
  b=ZSk8ztI3VY3zOLQWe1MZTVV0lySliHTK4CyKaOaEaT/ban6veIuTjmNs
   gvqF7v3rsSRrnnOgp0HZz5xnIa3d7cqDI9F6Xbfe2XLzLD3sADTGWLofW
   OP179oaywHqEGzt00VQN70d+vN22X6rilKPj1i5F/DebNoSfDbajCtJDC
   cAj9gdtjhoTFXtBTA8+RoO5WA5qWQ41HmpvkM1GgLj7ruBhcfJ3Wyp6ev
   ljBJllA0ANZarzoySJk6lkVCsjRfIHBkf/tsJrn8WFJT2s4JD/uEvVyad
   gXCPQMm6x0WEKcJaybJ4nQKK8LzJJGib9cD/tvH0CvIgJs4uWqx5wVJgz
   w==;
X-CSE-ConnectionGUID: SNDyAj+DSYaTCVMh2h9kuA==
X-CSE-MsgGUID: MTMkx7dASD6oP+x47Ewa7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="199246084"
X-IronPort-AV: E=Sophos;i="6.15,274,1739804400"; 
   d="scan'208";a="199246084"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 12:57:49 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6C650D6EA1
	for <openembedded-core@lists.openembedded.org>; Fri,  9 May 2025 12:57:47 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2E36BE0C0D
	for <openembedded-core@lists.openembedded.org>; Fri,  9 May 2025 12:57:47 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id ACA671A009A;
	Fri,  9 May 2025 11:57:46 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 11/19] gstreamer1.0-vaapi: upgrade 1.26.0 -> 1.26.1
Date: Fri,  9 May 2025 11:56:12 +0800
Message-Id: <1746762980-12783-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1746762980-12783-1-git-send-email-wangmy@fujitsu.com>
References: <1746762980-12783-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 03:58:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216174

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...streamer1.0-vaapi_1.26.0.bb => gstreamer1.0-vaapi_1.26.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.26.0.bb => gstreamer1.0-vaapi_1.26.1.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.1.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.1.bb
index 8ed84d0ebe..e922815162 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "573931d455f5a96f63db7c8d35d51322b8d287816e8c6a77d84cfbb9fa1351f1"
+SRC_URI[sha256sum] = "1fc779690cd8d6c5ef3cd84e5a552f864815ea8d9c269370c8d21e0b6d5337c9"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-- 
2.43.0


