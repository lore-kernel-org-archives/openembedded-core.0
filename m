Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1D3FC7115D
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 09:17:02 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.26248.1750065413679155080
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 02:16:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=uIVIl+05;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750065414; x=1781601414;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=27DtQRorUaS6MJ55A5ocJD+6ec9m4RUEXAZCD6jYkgA=;
  b=uIVIl+05Udl9bMKaZWZHlY10UDp+qsfEVOCGNP52BjzopcfIdOwPMLF3
   wum0aj3wgFJleZ0RaB8W95OzhgiIhnUzglZe/ptEvfbeATXJF9JlJOJLI
   es1pvXv/MtMv/KjqslcfCS/F1gmuFqSQKQ26e0EvUkgAlkFQrVSHgZ+os
   o9KMrOzLQvGeFXhtojRJd+4GzVuDT+PiXQRkSs/06bC90EQkfg5hF8tnh
   tZHYsRc5SjDxcsWgumNPpAjG7sgm3qDNlf4aH8yb0tIqE0S714tE6oddF
   6rwLlXzd7ZDN/DJEMvj9tvGb7wuC+0OR9HIFZaI1xd40103lR0Aeklbwm
   g==;
X-CSE-ConnectionGUID: iUKLQ0GrQTCdmGJF6ico9g==
X-CSE-MsgGUID: /ydwznyeRSOQZ2akrQz0bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="181755384"
X-IronPort-AV: E=Sophos;i="6.16,240,1744038000"; 
   d="scan'208";a="181755384"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 18:16:51 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8D6D7D5051
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 18:16:49 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3E4B0CFB67
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 18:16:49 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 776661A0073;
	Mon, 16 Jun 2025 17:16:48 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 04/24] hwdata: upgrade 0.395 -> 0.396
Date: Mon, 16 Jun 2025 17:16:22 +0800
Message-ID: <20250616091643.918-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250616091643.918-1-wangmy@fujitsu.com>
References: <20250616091643.918-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 09:17:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218777

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/hwdata/{hwdata_0.395.bb => hwdata_0.396.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/hwdata/{hwdata_0.395.bb => hwdata_0.396.bb} (93%)

diff --git a/meta/recipes-support/hwdata/hwdata_0.395.bb b/meta/recipes-support/hwdata/hwdata_0.396.bb
similarity index 93%
rename from meta/recipes-support/hwdata/hwdata_0.395.bb
rename to meta/recipes-support/hwdata/hwdata_0.396.bb
index 73b846b181..291a4ef85d 100644
--- a/meta/recipes-support/hwdata/hwdata_0.395.bb
+++ b/meta/recipes-support/hwdata/hwdata_0.396.bb
@@ -8,7 +8,7 @@ LICENSE = "GPL-2.0-or-later | X11"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "95c1de6c4a0d40415867b29c0791480fb8ad3cdb"
+SRCREV = "736513dfc1d44c5fb48bead62af7e91c4e1d1dd2"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


