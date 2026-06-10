Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63ABBCD98CC
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 09:50:12 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16354.1781085008386379877
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 02:50:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Cb6rvrRV;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781085009; x=1812621009;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=t8ZzeKnh4cM6DTnHj3US3COxlazOYgqSE71s5VGXDn4=;
  b=Cb6rvrRVXIUfn0pmWbmvNh20uVsn6d5HQ4v1dmGeMJnoQ8uvgOAhcPoy
   iACTGycKx0F7QeQpZws44ygU2nqkL4S/Fg73HkDFqWAyyOFm8VNEpIK7Y
   ACgyHVsPqgfZrsajYBeeRJTTXUm5YT18xc6Kg6sPpj0jWb2NbjL0dTg5t
   d99utMQjMd4Y7Kvl9bbaYiTqlhtzaGV1ijdRvTkTuqSr26HbpN0c8J7DS
   JvMxbvovwREz4tRqPoNlMsmhFzpjh1AKM1YHu0DKmtOR4o3zCS+V4IXi1
   vVbiPUBwnTIsVNZ/0uBE/osq5NsWw8vjcpk3Lr1In+JyspcQr1GA5lnIO
   g==;
X-CSE-ConnectionGUID: wBOm2tD/TLqwGJ7YBqw0kw==
X-CSE-MsgGUID: r1ID7J2yTwWoELvItQfTCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="222556064"
X-IronPort-AV: E=Sophos;i="6.24,197,1774278000"; 
   d="scan'208";a="222556064"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 18:50:08 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id ADD56C000B9
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:50:08 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (unknown [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 66F23829CCE
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:50:08 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 8BD5614000A3;
	Wed, 10 Jun 2026 09:50:06 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 13/16] hwdata: upgrade 0.406 -> 0.408
Date: Wed, 10 Jun 2026 17:49:28 +0800
Message-ID: <20260610094932.2264-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260610094932.2264-1-wangmy@fujitsu.com>
References: <20260610094932.2264-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:50:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238338

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/hwdata/{hwdata_0.406.bb => hwdata_0.408.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/hwdata/{hwdata_0.406.bb => hwdata_0.408.bb} (93%)

diff --git a/meta/recipes-support/hwdata/hwdata_0.406.bb b/meta/recipes-support/hwdata/hwdata_0.408.bb
similarity index 93%
rename from meta/recipes-support/hwdata/hwdata_0.406.bb
rename to meta/recipes-support/hwdata/hwdata_0.408.bb
index 602ab7c9e2..5cb082d5c9 100644
--- a/meta/recipes-support/hwdata/hwdata_0.406.bb
+++ b/meta/recipes-support/hwdata/hwdata_0.408.bb
@@ -8,7 +8,7 @@ LICENSE = "GPL-2.0-or-later | X11"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "9ae3b9da5cbb93eed30f812aa7edb4b9ad3e3868"
+SRCREV = "4456b256a1a5b1d1c1c1a60a9f69c59f7743c522"
 
 inherit allarch
 
-- 
2.43.0


