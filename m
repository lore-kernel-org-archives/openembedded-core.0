Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 354BEC54E61
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 07:33:42 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.8420.1709105611380585283
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 23:33:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JgwpoEHe;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709105615; x=1740641615;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=VkjVTRcxffuJN++0C+bD6RXPxLbW1Aj8yCzmV0WtD9A=;
  b=JgwpoEHeAf9sOQ0EQicuqLwnlVBOjG0JyvLPaFOOQxXD4R8zAqcpI1p0
   yVkAjxJEb1ewJ4x6O9P9S8jxMipKxKtlvzirSvR7bJssBYRW7/vBncOXo
   xXK3BdsbG8MsbIB4oWKdx2N9ilruTxc356poSvw2n8OQnfnrzPtSO72zK
   GpXyja+OoQbCbD/LxnUPd+xaNHDpotVUWDtfqlaylskc6CHFCBTfquhx8
   Y2GxN3e0RDOI7UnSOe7uJnW4kXITIi8MFCIx1eZLPy3mRQ+eKBfySAMnE
   SyoL9cniBLxd06VlSeBRrhRhYmp9eqVqfsvTgPoisQgKxyYwKMiAb2QaF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="150945769"
X-IronPort-AV: E=Sophos;i="6.06,190,1705330800"; 
   d="scan'208";a="150945769"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 16:33:34 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9CEDFD4802
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:32 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id CFD21106EEC
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6088041180
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:31 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0BEF81A006A;
	Wed, 28 Feb 2024 15:33:31 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 29/48] pkgconf: upgrade 2.1.0 -> 2.1.1
Date: Wed, 28 Feb 2024 15:32:36 +0800
Message-Id: <1709105575-24259-29-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
References: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28218.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28218.005
X-TMASE-Result: 10--1.431400-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrG24YVeuZGmN4YeSlHZYFoktX
	ORzzdQGHWe3lYtwpBw/uAEy53Y4tLqZY4PxfRMWElRdhw/BBzadUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmiL1vtt3X2p0WeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNYaFOzxH3U6EqoZ99HGe6KrrenPeNY5leiH98OVphxzqbv+pgqNVko3d7zcerb090BinI
	BVAc3+ri4YLLG++VeGFQbOlxJOkTIByMfv2BEtbU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 07:33:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196353

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Documentation fixes
* Fix --modversion with constraints.
* Reintroduce an optimization to the dependency graph walker which avoids
  revisiting already visited nodes.
* Add a regression test to check that the dependency flattener is working
  as expected.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../pkgconf/{pkgconf_2.1.0.bb => pkgconf_2.1.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/pkgconf/{pkgconf_2.1.0.bb => pkgconf_2.1.1.bb} (96%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_2.1.0.bb b/meta/recipes-devtools/pkgconf/pkgconf_2.1.1.bb
similarity index 96%
rename from meta/recipes-devtools/pkgconf/pkgconf_2.1.0.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_2.1.1.bb
index 1921f3a086..33d69451bb 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_2.1.0.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_2.1.1.bb
@@ -20,7 +20,7 @@ SRC_URI = "\
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
 "
-SRC_URI[sha256sum] = "266d5861ee51c52bc710293a1d36622ae16d048d71ec56034a02eb9cf9677761"
+SRC_URI[sha256sum] = "3a224f2accf091b77a5781316e27b9ee3ba82c083cc2e539e08940b68a44fec5"
 
 inherit autotools
 
-- 
2.34.1


