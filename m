Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 790F2F89228
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 09:56:43 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20449.1776765393145901710
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 02:56:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZLVD1109;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776765393; x=1808301393;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pV/Hx4np1QhK+Fsn08u6lF9gYADkt6pYt3D4XlIMjOg=;
  b=ZLVD11092hG3N4xYUmmnQpg5yD73qV73UZNvTiol7cXgQwqgcohNNZC7
   3aRYsQxvG9JRPUrOxNRKOjTYhuqo2/YI5LKdGL8MsLUW2BTX7+BER64p6
   2HBA1uW1muZrMxsyqVseL8E6V9rAlCImzk9PK3k4lD4X/t6y0cJK1uLxD
   EOj73eweRsKeK/Ti+0YN+3GM6AKN1bVR4AB2ZsYefEud27cUlmINalwn6
   ewfj88x7KT7u2rMsjwN4kKzBB5IcXfXJ+CUcclFDRTl+5DI1SHTr4kRG0
   qqlntRiEghtnHXlzZ6TQ0tRDV6fX9IGK5nooXCV3hvskeoq2KjNUNN35v
   g==;
X-CSE-ConnectionGUID: 8Tvr+6xcSFqtARM6wmL7IA==
X-CSE-MsgGUID: i1ZQv/IPT5e69HMiu9hpsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="237674560"
X-IronPort-AV: E=Sophos;i="6.23,191,1770562800"; 
   d="scan'208";a="237674560"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 18:56:31 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 9538E1002BBA
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:31 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 4C4761800080
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:31 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id DAD9B14002C2;
	Tue, 21 Apr 2026 09:56:28 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 14/49] hwdata: upgrade 0.405 -> 0.406
Date: Tue, 21 Apr 2026 17:55:24 +0800
Message-ID: <20260421095559.1856-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260421095559.1856-1-wangmy@fujitsu.com>
References: <20260421095559.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235622

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/hwdata/{hwdata_0.405.bb => hwdata_0.406.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/hwdata/{hwdata_0.405.bb => hwdata_0.406.bb} (93%)

diff --git a/meta/recipes-support/hwdata/hwdata_0.405.bb b/meta/recipes-support/hwdata/hwdata_0.406.bb
similarity index 93%
rename from meta/recipes-support/hwdata/hwdata_0.405.bb
rename to meta/recipes-support/hwdata/hwdata_0.406.bb
index 7247e9f365..602ab7c9e2 100644
--- a/meta/recipes-support/hwdata/hwdata_0.405.bb
+++ b/meta/recipes-support/hwdata/hwdata_0.406.bb
@@ -8,7 +8,7 @@ LICENSE = "GPL-2.0-or-later | X11"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "be46d7186e918e62eb75de399e800145a781c8db"
+SRCREV = "9ae3b9da5cbb93eed30f812aa7edb4b9ad3e3868"
 
 inherit allarch
 
-- 
2.43.0


