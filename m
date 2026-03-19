Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E07F41075296
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 10:14:04 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7839.1773915236543562355
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 03:13:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=EcUPOud0;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773915236; x=1805451236;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=liEXWYGiWiLjr8O10XOGE2yHg8a7JwpbwF2XHEB9SD8=;
  b=EcUPOud0m1eH2oHN4WnGm554GFFYH++gVIAMhvU8TCy5VbC6zehABW2E
   VI0A6LagxdMExGggKt1aN0YpbrBZPHWcNycbiChUloKr40tD/egw0htle
   kwYitKELYiJr+CCagw+yZjLNFKBCkO9L43JypoazOFUcYE59GpOAZf+8b
   +6W03Sx0Si1ZTkpeBFlKm9TDuO04Dk3FkpdaBQ0xKrmPSLrhMVWzuePLJ
   fOrkKzPzJ1dRU0fcUKjeDyM/YmWt80ysbBO58KNK9v1BBFO9pSnQNn3M2
   Pqr2QdnKzPkXNUPCIDyxiaMT360wHJoUuUEM3SCIYTi4miNzFeYQBHyJj
   Q==;
X-CSE-ConnectionGUID: QykLKwRPSTqho9XOcpDn8A==
X-CSE-MsgGUID: XfwdKrpJS/mAeZJP4TOl5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="222539862"
X-IronPort-AV: E=Sophos;i="6.23,129,1770562800"; 
   d="scan'208";a="222539862"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 19:13:55 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 130E92BB5
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:13:55 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id B8BBDC03732
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:13:54 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id CCF86101E52A;
	Thu, 19 Mar 2026 10:13:51 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 03/40] bind: upgrade 9.20.18 -> 9.20.20
Date: Thu, 19 Mar 2026 18:12:55 +0800
Message-ID: <20260319101332.2067-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260319101332.2067-1-wangmy@fujitsu.com>
References: <20260319101332.2067-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:14:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233476

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../bind/{bind_9.20.18.bb => bind_9.20.20.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.18.bb => bind_9.20.20.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.20.18.bb b/meta/recipes-connectivity/bind/bind_9.20.20.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.18.bb
rename to meta/recipes-connectivity/bind/bind_9.20.20.bb
index 3a7cff614f..b42c109105 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.18.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.20.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "dfc546c990ac4515529cd45c4dd995862b18ae8a2d0cb29208e8896a5d325331"
+SRC_URI[sha256sum] = "19b8335d25305231d5eb8f7d924240d1ac97c4da7c93eaa6273503133aa6106a"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.43.0


