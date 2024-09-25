Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B740C369A6
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:49:55 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.9255.1727246985761968810
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:49:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=d0OzLyZM;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727246986; x=1758782986;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=5WSbIVqLeBGmGta2s6ddyg54TUZPieS8dkQ1c3l4Htk=;
  b=d0OzLyZMRx35OPlCHvcItwi6q/dPyu41YVdIdPFlNoJXrfAvV5/+DgDm
   TZuPrkiyDqcZoikP7zyAt9SQr8P0FoRg58zUxgHCIvHxbJaf3thwJWmDr
   kOMHd/n7O7U/tyNUgV2n7Ca4/ujgErtPbrQqLPtZ6NBRMJSm77EZdS+IR
   siOanmXGipGovpF4Th0CeRvK+f0YPS2oA84mYXY1iPE4uWDbX7oEgpgjW
   1lVTfm7hCXuAy949gDQWb07bC1sWSzO4NJnVpMf+KcZ+Ke1aatk7iMMjC
   FkKB3bysWVcqxXY6iQOIpMjc6Jno4ETRpp70lZmGIbejZQx3M4wYzS9+/
   A==;
X-CSE-ConnectionGUID: C5yz5UHoS8enMN0+4n5V8A==
X-CSE-MsgGUID: RAL/RorLQ1uX5UKKPl+Thw==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="174697174"
X-IronPort-AV: E=Sophos;i="6.10,256,1719846000"; 
   d="scan'208";a="174697174"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 15:49:44 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id A9C99CC142
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:41 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id E18A4D753E
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:40 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7CB496B5C3
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:40 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 28D721A01EC;
	Wed, 25 Sep 2024 14:49:40 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 19/47] libxi: upgrade 1.8.1 -> 1.8.2
Date: Wed, 25 Sep 2024 14:48:52 +0800
Message-Id: <1727246960-20665-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
References: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28686.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28686.005
X-TMASE-Result: 10--4.337800-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrNr21mij50Nskpxv/P70C7Rsk
	AdaEfeQKNP1f3JWj4Be7y2qfYe3Nam+w5IlbLL18KsurITpSv+M8V13UNOVlwZTx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q2eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNbZ7HWIEiikz5KgULNv4vo5Xe0ZN9EYW6ZkYhZQJ1QGuf5j9iD4yN+8pQT3rKmXvO2JnW
	87MauOVJyPzVA7LEXzLt2eJExDV/AQ5WMx/hWiMU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:49:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204909

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- XGetFeedbackControl: skip over unknown feedback controls
- wireTo*Event: check for malloc() failure
- fixed wrong type in man page
- Allow XIFreeDeviceInfo on a null pointer
- gitlab CI: Update to latest CI templates
- Fix double alignment on 32bits machines with strict constraints

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{libxi_1.8.1.bb => libxi_1.8.2.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxi_1.8.1.bb => libxi_1.8.2.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb b/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb
rename to meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb
index 00bd46ef13..2a86f5fcf0 100644
--- a/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb
@@ -18,6 +18,6 @@ PE = "1"
 XORG_PN = "libXi"
 XORG_EXT = "tar.xz"
 
-SRC_URI[sha256sum] = "89bfc0e814f288f784202e6e5f9b362b788ccecdeb078670145eacd8749656a7"
+SRC_URI[sha256sum] = "d0e0555e53d6e2114eabfa44226ba162d2708501a25e18d99cfb35c094c6c104"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


