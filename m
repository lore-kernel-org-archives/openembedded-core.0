Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2C6EC61DD2
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:18:59 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7687.1787732332661040757
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:18:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=G+9fpsGU;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787732333; x=1819268333;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+DwZ3gFkaqkOCR5t13Ut4JRC7QPxB01DEcIW0slmy9Q=;
  b=G+9fpsGUdXmKtHHBfv3rZ9E5FTbLmSkR6CVU/QVSUjyvcZJESRn55XAi
   yk3h8nR/klkFz2BAjZoeBGWdnz1OSuY7LAhhFHUyubEw00iycnBw9jm4F
   ea0SsTqRwuQO1O3rU+uyRxGaliZN1Vwrh48TEHFEn6AO5it00C0q50WDx
   rxHfOktNWX7iwNkR85nLvU0mC/IGY5BFRRcBh00lcFAkiWN3RQGvLF/cA
   m4ewlQk22jx0l20r1/cQbxWr9Bl4W7vz/s8N58djlx+1IcX5oG1fIv9Ga
   bd1GO/DigeMrxysdtbfp/2z8FTtEiA6NAi5fjvA8/ATtGWFvWNEVC/t2H
   w==;
X-CSE-ConnectionGUID: sD2ZpAr6TN+wgGoZIoIdKQ==
X-CSE-MsgGUID: 6pk+1CciRXGYq1zYns2gtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="256374407"
X-IronPort-AV: E=Sophos;i="6.25,244,1779116400"; 
   d="scan'208";a="256374407"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 17:18:39 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id BFA11C0035C
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:18:38 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 77BE11401208
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:18:38 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 77B558214FB;
	Wed, 26 Aug 2026 08:18:36 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 08/17] gstreamer1.0-python: upgrade 1.28.5 -> 1.28.6
Date: Wed, 26 Aug 2026 16:18:23 +0800
Message-ID: <20260826081832.1059-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:18:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244356

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...reamer1.0-python_1.28.5.bb => gstreamer1.0-python_1.28.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.28.5.bb => gstreamer1.0-python_1.28.6.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.6.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.6.bb
index d9179286a3..9e1e0ae64a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.6.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "0ac461b5700b9766998aa686439064caf58ca4fdaf848dfd477b5a7700b176cc"
+SRC_URI[sha256sum] = "34d58440c53b5495a123d0a4b7b7abbc6e9792a5b21954db86a0791b16f6e012"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject gstreamer1.0-plugins-bad"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
-- 
2.43.0


