Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE39CC3ABBC
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 03:56:50 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.6513.1746763006500052350
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 May 2025 20:56:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fXgUqU34;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1746763008; x=1778299008;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=7jWLZObbopiJdPBmBH8TonTyDF9GB1QlCVQbzhGGuDk=;
  b=fXgUqU34NKiK+AXQP6Hhj/mKINTquxbCN2FbERsfAJES+/0zQ8+eE3V5
   1DGezOb5D40vC0a7QdVZZ+Hv5oy8FzeZtkErQnd1XYrhJtGmslBCcsm7x
   8DwaRrjrY+PFGMcyIqKrhrKEJVxSD6Ph3P+zNPcaUjfhtFzEwNn4kuBDh
   XzFzRkn2JmYDCxyKsLgWtK8OJaGAY618mQopWlnQCZD4UDMQQPPySvZq4
   LtIc+Vftb/PjyU7OW0quxURjjA7W25HuTQKbkE/D1pYRRxRqEfCPEe9US
   X2l3rerL3MgcopbJuGMWnubohVblJos5Ekxerjh4nIU/VrWdNsoGn/j8e
   Q==;
X-CSE-ConnectionGUID: M5Xo58zWT6WXyS/TfwmBNA==
X-CSE-MsgGUID: FAMe6XKaQQu4q/vQRR3tlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="178352882"
X-IronPort-AV: E=Sophos;i="6.15,274,1739804400"; 
   d="scan'208";a="178352882"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 12:56:46 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id B9B1E96742
	for <openembedded-core@lists.openembedded.org>; Fri,  9 May 2025 12:56:44 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7B1B6144E3
	for <openembedded-core@lists.openembedded.org>; Fri,  9 May 2025 12:56:44 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0E9161A009A;
	Fri,  9 May 2025 11:56:44 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 08/19] gstreamer1.0-python: upgrade 1.26.0 -> 1.26.1
Date: Fri,  9 May 2025 11:56:09 +0800
Message-Id: <1746762980-12783-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1746762980-12783-1-git-send-email-wangmy@fujitsu.com>
References: <1746762980-12783-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 03:56:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216171

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...reamer1.0-python_1.26.0.bb => gstreamer1.0-python_1.26.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.26.0.bb => gstreamer1.0-python_1.26.1.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.1.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.1.bb
index 04c96a879f..6afd286d38 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.1.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "e5046a05d77abb15671ad01cd1908d17d62e5a06f5d7841be4342ade2a3fb8db"
+SRC_URI[sha256sum] = "2dce1ecc8a80ce8e0b6f0e0cb3fad3bcd5d65ebe0622ed28eaae97b4559a6a85"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject gstreamer1.0-plugins-bad"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
-- 
2.43.0


