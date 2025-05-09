Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 051AAC3ABBC
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 03:57:01 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.6639.1746763012292168398
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 May 2025 20:56:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OlPL5YOY;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1746763012; x=1778299012;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=LiNqt40AsUr8ZhvqXfse5BTriYql5IcxWVv6DK6ukQc=;
  b=OlPL5YOYzKxoFtBP1UNzn5pfZ594/zUB3oSDEIs3qhdFA1e0shEj03c8
   V3/D90py9Ffpa3E4M1hqKZi2ve6xryFdu8i7j2zPz1/bmEWlxSAojYLf2
   UuG007rGtbwT5QQph1+vPVbOLHQJ7D5j/cgt5kzq1soipD3PX2Wj3LtOL
   PWLXsiwFn/CnvJ34x8C3dOkN1tBgtkKXW4t4uW6t56K6jjVWl2Q8om9Tp
   K8NWmKpy2lM5V0edmSbiI1BbQj+P7CIlaIfES1qbXse8YWn5DqkFTyd4w
   QlnPalyC6xqY+qGDbJ/pia9cg46jCMAKwMZY3gi+Y/e9LtumUeixLWpta
   Q==;
X-CSE-ConnectionGUID: PYZD1pDqQ2uU90uAfRTU4A==
X-CSE-MsgGUID: KxqDbK5JQkeVid/nDr04mQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="177755529"
X-IronPort-AV: E=Sophos;i="6.15,274,1739804400"; 
   d="scan'208";a="177755529"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 12:56:50 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id EE149DC8CB
	for <openembedded-core@lists.openembedded.org>; Fri,  9 May 2025 12:56:47 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id A025ABDC94
	for <openembedded-core@lists.openembedded.org>; Fri,  9 May 2025 12:56:47 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3338A1A009A;
	Fri,  9 May 2025 11:56:47 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 09/19] gstreamer1.0-rtsp-server: upgrade 1.26.0 -> 1.26.1
Date: Fri,  9 May 2025 11:56:10 +0800
Message-Id: <1746762980-12783-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1746762980-12783-1-git-send-email-wangmy@fujitsu.com>
References: <1746762980-12783-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 03:57:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216172

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...rtsp-server_1.26.0.bb => gstreamer1.0-rtsp-server_1.26.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.26.0.bb => gstreamer1.0-rtsp-server_1.26.1.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.1.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.1.bb
index fd801c2c62..76f6dac25d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.1.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "e983c039496e3f75e39696554ce74db4120e2465de17aa1cc37160568e9b40bc"
+SRC_URI[sha256sum] = "253fdfec78320c2f67486cd3797a0253c06982c3a8d5160f795b4257fadab301"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
-- 
2.43.0


