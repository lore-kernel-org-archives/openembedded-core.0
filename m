Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C78BAC83F1A
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 01:07:12 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.3855.1753232827173816745
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 18:07:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pgrcgVir;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753232827; x=1784768827;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tCNxun7rycrpdGj3Udtul4hWBmgCHU84AeyklhsGCUU=;
  b=pgrcgVirBrjS5A39K+tYTElpuh6SJpQEcDZOtRmcoRlSO6+DojN2UV8c
   gSGYg756EJT3OyMJYEGQvhsP1EIxjge0z7dr/ESWAo0lTcmtWElg/ZxQm
   cYDs4rTUQc1llLiMeectFG9Epjw960R0x4Xdh7DOwdqM8KwJYyu20cFAZ
   CHyr/Vj7JYUz2qXZTvILqCsqbBB+6TLXnfDcl0NxtTPQeWeK5PZJdaIyI
   +oljfP1mT5WQ5cocile3bBP8EoOGdYzQcz4qNtKAlmriN5esrhiwSEDWG
   AVbwo4CWdwiNGkNNRm+wQAKDgWiSac6uK3ReX3hTxTAHqaZ8Pso0SLfxu
   Q==;
X-CSE-ConnectionGUID: pglovOKZS9KIW/5c3m20rw==
X-CSE-MsgGUID: kK5jgC61TNGTfSK8nMJdwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="207119484"
X-IronPort-AV: E=Sophos;i="6.16,333,1744038000"; 
   d="scan'208";a="207119484"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 10:07:05 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 5D2B31C00085
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 01:07:05 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id C56D318009C1
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 01:07:04 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D5DE41A0073;
	Wed, 23 Jul 2025 09:07:01 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH 12/12] xwayland: upgrade 24.1.6 -> 24.1.8
Date: Wed, 23 Jul 2025 09:06:14 +0800
Message-ID: <20250723010614.926-12-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250723010614.926-1-liuyd.fnst@fujitsu.com>
References: <20250723010614.926-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 01:07:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220771

- 24.1.8
  * CVE-2025-49176
  Changelog: https://lists.x.org/archives/xorg-announce/2025-June/003613.html

- 24.1.7
  * CVE-2025-49175
  * CVE-2025-49176
  * CVE-2025-49177
  * CVE-2025-49178
  * CVE-2025-49179
  * CVE-2025-49180
  Changelog: https://lists.x.org/archives/xorg-announce/2025-June/003610.html

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../xwayland/{xwayland_24.1.6.bb => xwayland_24.1.8.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_24.1.6.bb => xwayland_24.1.8.bb} (96%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_24.1.6.bb b/meta/recipes-graphics/xwayland/xwayland_24.1.8.bb
similarity index 96%
rename from meta/recipes-graphics/xwayland/xwayland_24.1.6.bb
rename to meta/recipes-graphics/xwayland/xwayland_24.1.8.bb
index 540ec100bd..900da524b3 100644
--- a/meta/recipes-graphics/xwayland/xwayland_24.1.6.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_24.1.8.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "737e612ca36bbdf415a911644eb7592cf9389846847b47fa46dc705bd754d2d7"
+SRC_URI[sha256sum] = "c8908d57c8ed9ceb8293c16ba7ad5af522efaf1ba7e51f9e4cf3c0774d199907"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.43.0


