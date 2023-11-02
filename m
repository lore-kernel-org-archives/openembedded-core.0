Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F325C4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 08:21:46 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.26265.1698913305274774436
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Nov 2023 01:21:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="139899987"
X-IronPort-AV: E=Sophos;i="6.03,270,1694703600"; 
   d="scan'208";a="139899987"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 17:21:43 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id C2922D64A7
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Nov 2023 17:21:40 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id EEC35D88C5
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Nov 2023 17:21:39 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id A5E6B886FC;
	Thu,  2 Nov 2023 17:21:38 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] debianutils: upgrade 5.13 -> 5.14
Date: Thu,  2 Nov 2023 16:17:56 +0800
Message-Id: <1698913076-22037-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1698913076-22037-1-git-send-email-wangmy@fujitsu.com>
References: <1698913076-22037-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27972.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27972.006
X-TMASE-Result: 10-1.525500-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/ybnHu4BcYSmtVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJorNUVnqixiMO0NzKZ2JUx1au2GmdldmiUEVlS5Fk1XJ0HVY
	j66eqnnk3lq3YEgY6JmFp9qfciji9rWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNaUs4whL2uiUXFZc2RkyF1ZpIFo+J48BZJkswi1Y5oTQf3Z6FXQjNA90lm5k1xXucDwG5
	pPGt1RrLWV42AWGKr9ctwl0aAT9GWJbZ4D2dIMgU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 08:21:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190066

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
 "Files: which" changed to "Files: which.debianutils"
 "which is in the public domain." changed to "which.debianutils is in the public domain."

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../debianutils/{debianutils_5.13.bb => debianutils_5.14.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/debianutils/{debianutils_5.13.bb => debianutils_5.14.bb} (93%)

diff --git a/meta/recipes-support/debianutils/debianutils_5.13.bb b/meta/recipes-support/debianutils/debianutils_5.14.bb
similarity index 93%
rename from meta/recipes-support/debianutils/debianutils_5.13.bb
rename to meta/recipes-support/debianutils/debianutils_5.14.bb
index 915277b42c..f6ca8a6fdd 100644
--- a/meta/recipes-support/debianutils/debianutils_5.13.bb
+++ b/meta/recipes-support/debianutils/debianutils_5.14.bb
@@ -6,12 +6,12 @@ HOMEPAGE = "https://packages.debian.org/sid/debianutils"
 BUGTRACKER = "https://bugs.debian.org/cgi-bin/pkgreport.cgi?pkg=debianutils;dist=unstable"
 SECTION = "base"
 LICENSE = "GPL-2.0-only & SMAIL_GPL"
-LIC_FILES_CHKSUM = "file://debian/copyright;md5=74765f57ae5dd2b10ffbc39528d98753"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=4b667f30411d21bc8fd7db85d502a8e9"
 
 SRC_URI = "git://salsa.debian.org/debian/debianutils.git;protocol=https;branch=master \
            "
 
-SRCREV = "d49a78eb264c1b2ad3d0d6de8e1fb776bda9c943"
+SRCREV = "7e63b32ea4126c70a5da958f0106add267810a94"
 
 inherit autotools update-alternatives
 
-- 
2.34.1


