Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E02EECF65F0
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 12:35:26 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18463.1769430925981466401
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 04:35:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tjd8JwNg;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769430924; x=1800966924;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nM1DCFPS0whjyOJ26fX1ukZYP21S239eH0ATvWeOvQQ=;
  b=tjd8JwNgYND0dTYtpcPK7T7lwM4kJA5KhmqApeiv9OWsMUZpBJuNWfKm
   5R/wJP3HngzgEG1JXC+M5so7nPqNnKQ3zj2TTLprPGd3vkvthZjCnSRn9
   zTx7ymO/miK4RkC3CzhdTus+r7cJf8OPwt1jbrOV+ma2CAoCromoiooZa
   EV81g0YiiEIKVVxsjLj4fr9l9O30P7G/W+1F0QAtD9SalrhWIVzC4NZc3
   O/FjKb773a8DYR+1LnqXUrA7aSIcAZCSukkAbM+bMFbYPBthEbJTuvUYU
   AVPZ8XCsSaxzBiBAEF40RW4jIK8AxhoAMiopPEXfuEXvpDvGfR+alOdri
   w==;
X-CSE-ConnectionGUID: q2huOyRwQb6bbvWXIjkPWg==
X-CSE-MsgGUID: WNdURxHPTp2AdBaoeeXJUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="205947221"
X-IronPort-AV: E=Sophos;i="6.21,255,1763391600"; 
   d="scan'208";a="205947221"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 21:35:22 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 8F88A1000125
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 12:35:23 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 48FC614003B0
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 12:35:23 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id C2A7B4059A3;
	Mon, 26 Jan 2026 12:35:20 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 01/17] bind: upgrade 9.20.17 -> 9.20.18
Date: Mon, 26 Jan 2026 20:35:00 +0800
Message-ID: <20260126123517.1020-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 12:35:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229984

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../bind/{bind_9.20.17.bb => bind_9.20.18.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.17.bb => bind_9.20.18.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.20.17.bb b/meta/recipes-connectivity/bind/bind_9.20.18.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.17.bb
rename to meta/recipes-connectivity/bind/bind_9.20.18.bb
index 33ba18dcbd..3a7cff614f 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.17.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.18.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "5cc89a09da0917eb1ddf640cc07c172ff44fa9bbf3a34ada4b6a2f7ee70ff1c8"
+SRC_URI[sha256sum] = "dfc546c990ac4515529cd45c4dd995862b18ae8a2d0cb29208e8896a5d325331"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.43.0


