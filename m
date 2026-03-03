Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5442CEC0490
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 10:09:57 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14941.1772532590284588399
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 02:09:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lw2iLLhu;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772532591; x=1804068591;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Xa5ZLK+ISXf6KYbuxzxCkZlNdH5GpyvTVbszkU4nL/Y=;
  b=lw2iLLhuRoG9u//TLtcVNDyWYsC3gAdfbMVZTYkkLVJL5RSSPvbTaPOl
   hzfYQuQiQzHmZB9Z6Z8hKa4XGuvKlBJxCCOuGrv19vAsKbHTlJV3wnvB2
   /38LwlveitRbSzU/FkduovaHdTAP9PvTyglfGoQHQXWebw3PjEKDgg9KP
   iFSBN6uVCObeDmhTKgc3xAercjj+7veqrx4oBjEctq1riD6I2hCaexNpU
   IAs27qBPKCttzkNu3tYGKylD2QnCdjv1QheQTdI4jrTPfcw9G6fn+/p/t
   P+IZ/RgzyMqrDGx2/rudAVgIXX0r59zhqxcSPXnZoTXMJ+/o7+nJo3EBm
   Q==;
X-CSE-ConnectionGUID: FZKycJYEQ7amVSb6R6Gr4Q==
X-CSE-MsgGUID: MqMCHdsaSG27MjdwxcsX2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="219676200"
X-IronPort-AV: E=Sophos;i="6.21,321,1763391600"; 
   d="scan'208";a="219676200"
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.fujitsu.com (Postfix) with ESMTPS id 2F4661C1C73A
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 10:09:52 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id DB88D18000AC
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 10:09:51 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 416F31001CE4;
	Tue,  3 Mar 2026 10:09:48 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 06/23] hwdata: upgrade 0.403 -> 0.404
Date: Tue,  3 Mar 2026 18:09:11 +0800
Message-ID: <20260303100929.1624-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260303100929.1624-1-wangmy@fujitsu.com>
References: <20260303100929.1624-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 10:09:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232282

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/hwdata/{hwdata_0.403.bb => hwdata_0.404.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/hwdata/{hwdata_0.403.bb => hwdata_0.404.bb} (93%)

diff --git a/meta/recipes-support/hwdata/hwdata_0.403.bb b/meta/recipes-support/hwdata/hwdata_0.404.bb
similarity index 93%
rename from meta/recipes-support/hwdata/hwdata_0.403.bb
rename to meta/recipes-support/hwdata/hwdata_0.404.bb
index f95146648f..04b9da8a40 100644
--- a/meta/recipes-support/hwdata/hwdata_0.403.bb
+++ b/meta/recipes-support/hwdata/hwdata_0.404.bb
@@ -8,7 +8,7 @@ LICENSE = "GPL-2.0-or-later | X11"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "bb56be59220b34d79160b73bd24eb36952dc8c63"
+SRCREV = "428ad3882fff801c553fc575d99bcdb2edbd41f7"
 
 inherit allarch
 
-- 
2.43.0


