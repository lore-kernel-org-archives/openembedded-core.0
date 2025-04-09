Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72ACBC36010
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 02:40:58 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.13465.1744166448955265669
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 19:40:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ry6updQb;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744166449; x=1775702449;
  h=from:to:cc:subject:date:message-id;
  bh=InjBgktHsvijOqztVr3WnHZ8pSIsJbBqIXoi/JbWKMw=;
  b=ry6updQbuN8koseUT290N/DtlXs0dkovejFMSFGXTSUA8hdHCeP3FMlK
   OKi0vuM82Fe1sbntPjF4iNkJAr41fDKjoJ2hAGVlN2MiVsObpyJhAbEg7
   hr3IdD8cbTooJKyzZfj0gdpUZwkUAUdMMryABqxgqDJYBIHRsuvJJF6bx
   ISaHwwHgGFONvq8n2CyVz7x40fyl6ExB8fBmtR88C2TDxvafQHX0Uy3IM
   itelT/T5juHWXzbbRoHTsxzZfWQlqSAyjPSVJlNcOGqQhKa83Y6RW009y
   3pHYnhlQBEIiw5uQMaYEyNwskPOXPuXEYInrtXwf8O2NNgI9ggLP8nw2H
   Q==;
X-CSE-ConnectionGUID: 5Dqcvkh3QfuWtSAFs/l1Fg==
X-CSE-MsgGUID: 4mhug7q3QTWXKSyBq68Gzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="195892559"
X-IronPort-AV: E=Sophos;i="6.15,199,1739804400"; 
   d="scan'208";a="195892559"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 11:40:47 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 80C0DD6EA5
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Apr 2025 11:40:44 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3F177CFF89
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Apr 2025 11:40:44 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BE07C1A0078;
	Wed,  9 Apr 2025 10:40:43 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] hwdata: upgrade 0.393 -> 0.394
Date: Wed,  9 Apr 2025 10:40:31 +0800
Message-Id: <1744166431-4463-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 02:40:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214572

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../hwdata/{hwdata_0.393.bb => hwdata_0.394.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/hwdata/{hwdata_0.393.bb => hwdata_0.394.bb} (90%)

diff --git a/meta/recipes-support/hwdata/hwdata_0.393.bb b/meta/recipes-support/hwdata/hwdata_0.394.bb
similarity index 90%
rename from meta/recipes-support/hwdata/hwdata_0.393.bb
rename to meta/recipes-support/hwdata/hwdata_0.394.bb
index 1517a1d35f..54edcecc2c 100644
--- a/meta/recipes-support/hwdata/hwdata_0.393.bb
+++ b/meta/recipes-support/hwdata/hwdata_0.394.bb
@@ -7,8 +7,8 @@ SECTION = "System/Base"
 LICENSE = "GPL-2.0-or-later | X11"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
-SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https"
-SRCREV = "2b7f8370a5b3b1552d8264b8665ed99ddfea0b57"
+SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https;tag=v${PV}"
+SRCREV = "fa1ccf4e4944bdb4110025c5c40e4fee8c8de29b"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


