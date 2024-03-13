Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50C15C54E58
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 07:09:29 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.10638.1710313760595481985
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 00:09:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Ocg2jVFl;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710313762; x=1741849762;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=qMogGkY9p57MelnHIJTO82Mni9+NCx6pVbLFMzuuwUg=;
  b=Ocg2jVFlhVbIj3HOY23oaQk13pkpIgO4w6rGSln/ymtkvKwYIuyerUDD
   sdBSs0953lC0QRM1Sm9KomO3Ko2ULJbJ3/ZJZcHzVPN/mcq1gCH8WZqYQ
   2jNPd/YniuhWY8BnuFKloOHUBOSfglmrDT1JttQO4GAoBXtEoU8kcv9sD
   QyiPTxkm8ivodPPUr2lsODAgCZtAKL/0PZZh8gagrl2PilGHDMFdb/j7Z
   xe/Ug1QLk5XqFMfoq/NQghSh5ti2h0KJR0r6e2PXYa7Pa0yDxRE6xatBX
   LrDopFcXeFZo5Ql52PFQnuoMmDyKA40lHiOogtMMBFWP4zTIXiKa8m2TJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="140106886"
X-IronPort-AV: E=Sophos;i="6.07,119,1708354800"; 
   d="scan'208";a="140106886"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 16:09:21 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id ADE72D9F03
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:19 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id EC5F0D624F
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:18 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8C5DA20097CD1
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:18 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3959C1A006B;
	Wed, 13 Mar 2024 15:09:18 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 17/36] pango: upgrade 1.52.0 -> 1.52.1
Date: Wed, 13 Mar 2024 15:08:15 +0800
Message-Id: <1710313714-12541-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
References: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28248.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28248.004
X-TMASE-Result: 10--6.378800-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrYdBG+bhhiNTfUZT83lbkEIIP
	FubbBVyA+7QcRaVoa8n/tdOuViNvuC/7QU2czuUNEzEoOqAAVLNr2qJoNIuCjfdsGrGaOKdNLHN
	FiwmJRq/de+c0gz7NjHk48PxckV+kHxPMjOKY7A/+HHE8LDNSg8RB0bsfrpPIfiAqrjYtFiR6SH
	MVc9ZUJXKkcyejkMD5WtBGg4fg+EkqeCDInAZnon7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 07:09:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197017

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix hexbox drawing

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-graphics/pango/{pango_1.52.0.bb => pango_1.52.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/pango/{pango_1.52.0.bb => pango_1.52.1.bb} (94%)

diff --git a/meta/recipes-graphics/pango/pango_1.52.0.bb b/meta/recipes-graphics/pango/pango_1.52.1.bb
similarity index 94%
rename from meta/recipes-graphics/pango/pango_1.52.0.bb
rename to meta/recipes-graphics/pango/pango_1.52.1.bb
index 7505ff9279..a67c3791a2 100644
--- a/meta/recipes-graphics/pango/pango_1.52.0.bb
+++ b/meta/recipes-graphics/pango/pango_1.52.1.bb
@@ -23,7 +23,7 @@ SRC_URI += "file://run-ptest \
            file://0001-Skip-running-test-layout-test.patch \
            "
 
-SRC_URI[archive.sha256sum] = "1ec8518879c3f43224499f08e8ecbbdf4a5d302ed6cd3853b4fa949f82b89a9b"
+SRC_URI[archive.sha256sum] = "58728a0a2d86f60761208df9493033d18ecb2497abac80ee1a274ad0c6e55f0f"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 
-- 
2.34.1


