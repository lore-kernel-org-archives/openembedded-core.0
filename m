Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6FDBC3601F
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 09:08:08 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.3767.1743584885206606495
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 02:08:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Sm0RR09K;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743584887; x=1775120887;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4XMyhrNhjsKFxbAXo8tdVTx2eG1Nw9+isOGrmSjPaWg=;
  b=Sm0RR09KjpGf67i52pGWJedCml9Rfmt9WxOOkMNJ+OwVgq+y74UO7pdR
   zUaumvKb2thk7uNJLpoE1jo2WPYaJhehVIHxyBwpP2a7AAnKGIcTif1Wv
   uS3vC6vsToHSTa267ZiHODIcNAX4pHRMTPw1Xw1BawuLq7P0jQ3Ub+aAI
   Xyd9fN8ZbhSvDF3Ot1W4MebJuNaB8quMVwKavKSZ+J1QJZg+Ey0dMNwO3
   7ne1Wa2jVwh7uo7v2rm8WFkIov9WBQEvgSTOwf+xtG7ptJ9XrPmV1pYA6
   PUroLMMNSbLb6RNQ2PRB+jWRq8OpLxgMzBrdKwasRaEh5+8yarDZiVpvb
   g==;
X-CSE-ConnectionGUID: c9bI97H6TnqZrSf8tLlWqQ==
X-CSE-MsgGUID: 82cyFxgTQHGidg9lk7vTtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="195196791"
X-IronPort-AV: E=Sophos;i="6.14,295,1736780400"; 
   d="scan'208";a="195196791"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 18:08:05 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 582559674F
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Apr 2025 18:08:02 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 19A30CFAC8
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Apr 2025 18:08:02 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6DAFE1A009A;
	Wed,  2 Apr 2025 17:08:01 +0800 (CST)
From: Lei Maohui <leimaohui@fujitsu.com>
To: Alexander Kanavin <alex@linutronix.de>
Cc: Jose Quaresma <quaresma.jose@gmail.com>,
	Anuj Mittal <anuj.mittal@intel.com>,
	openembedded-core@lists.openembedded.org,
	Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [PATCH v4 05/10] gtreamer1.0-rtsp-server: upgrade 1.24.12 -> 1.26.0
Date: Wed,  2 Apr 2025 17:07:44 +0800
Message-Id: <20250402090749.2119-6-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
In-Reply-To: <20250402090749.2119-1-leimaohui@fujitsu.com>
References: <20250402090749.2119-1-leimaohui@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 09:08:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214237

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 ...tsp-server_1.24.12.bb => gstreamer1.0-rtsp-server_1.26.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.24.12.bb => gstreamer1.0-rtsp-server_1.26.0.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.0.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.12.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.0.bb
index b23634dcf0..fd801c2c62 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.0.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "a335f73687d2efe22db94348c6893c73b53a2c6bc55ee7a590028ba196ddc623"
+SRC_URI[sha256sum] = "e983c039496e3f75e39696554ce74db4120e2465de17aa1cc37160568e9b40bc"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
-- 
2.43.0


