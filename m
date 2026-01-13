Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29683D0C832
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 10:25:31 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55853.1768299928960772586
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 02:25:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Xo/Baeh/;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768299929; x=1799835929;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CQlshvsYoqj7VfwHJDMOsNZbFbbyK4MEjvIK+74eDSA=;
  b=Xo/Baeh/pR9NRmg/N8QfByK6NrJgKJ6erpKcF+at0QET1YcDIAEGvyC6
   wvG0DDJPiZdbf0K6DtWlSIegp/oaxvgkU9pL1vzcb1K80/RVLkT2RFrly
   T/lUUbgukIYDhxMAOyKI9HzWiXQY9MuijbDWdTbQsQdx13ox8f1K8Z8np
   jUKk9pW1kbNNmASYNmsT1ff5VYnfFropSD4KIlMKkY09v2tSZ02F/imAi
   7mjAxTlA7GXHYSL60vEH5HaignFkAsk9Af1o0CjmBXYRt1I5o5GOCRW7h
   YJzir4iSr4XFlHt9xbtdJceUPinozoIC/tSnsBpO7apS10TULoF+EmadE
   A==;
X-CSE-ConnectionGUID: c3Vrvc5ERZe/zMplEyG5xg==
X-CSE-MsgGUID: gC0RPEafS7aNKqcX7yYmMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="225595058"
X-IronPort-AV: E=Sophos;i="6.21,222,1763391600"; 
   d="scan'208";a="225595058"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 19:25:27 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 44FD482073B
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:25:27 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id F2D7D1400353
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:25:26 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 1D603826FFF;
	Tue, 13 Jan 2026 10:25:23 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 05/18] hwdata: upgrade 0.402 -> 0.403
Date: Tue, 13 Jan 2026 18:24:55 +0800
Message-ID: <20260113102509.728-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260113102509.728-1-wangmy@fujitsu.com>
References: <20260113102509.728-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:25:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229244

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/hwdata/{hwdata_0.402.bb => hwdata_0.403.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/hwdata/{hwdata_0.402.bb => hwdata_0.403.bb} (93%)

diff --git a/meta/recipes-support/hwdata/hwdata_0.402.bb b/meta/recipes-support/hwdata/hwdata_0.403.bb
similarity index 93%
rename from meta/recipes-support/hwdata/hwdata_0.402.bb
rename to meta/recipes-support/hwdata/hwdata_0.403.bb
index 826c9b2e32..f95146648f 100644
--- a/meta/recipes-support/hwdata/hwdata_0.402.bb
+++ b/meta/recipes-support/hwdata/hwdata_0.403.bb
@@ -8,7 +8,7 @@ LICENSE = "GPL-2.0-or-later | X11"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "d263c183dd429bbe1572a91a8cf180e84b8341c6"
+SRCREV = "bb56be59220b34d79160b73bd24eb36952dc8c63"
 
 inherit allarch
 
-- 
2.43.0


