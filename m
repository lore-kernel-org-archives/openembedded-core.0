Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD86C41513
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 02:17:25 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.64033.1718936242212065662
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jun 2024 19:17:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mHOLvqGR;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718936242; x=1750472242;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=syGojgnMFy5lj+Upxg6ouqTzeQYlHFlKTTQIP1xodrg=;
  b=mHOLvqGRpadTRiC2fUJWFTSkWVvgBCR8vd2VSlTDKYxGT2dPnfk0VB2e
   aUPohg9x2tBtP38AwDLBfGQSClvjxQyVscJEJNT/MzNGvSLri1G3maU+q
   LA94u4kktZiMTjl8nT4QBqdgcFQj+Hr93YD9EikfPbYXIjQc07rNNh55C
   Xy/qhi/x24cCDPPRmG2kyot2ncNNQrF7JMeri6tbFwlm49nEWx3N9VwBw
   hi85uC9ay6Cw/14hp4rgM0vnR00Nr478ljwgMRvJzigKvmAlTYU7YPHhs
   WeTpici9/teukxAHVSv1lcEl1Ehro78zH5AUNKlL6ccMZlr8SqYvf08D3
   w==;
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="152738589"
X-IronPort-AV: E=Sophos;i="6.08,253,1712588400"; 
   d="scan'208";a="152738589"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 11:17:20 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8C3DBC68E4
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:18 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id CD0CDD7B6B
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:17 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 59949E5185
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:17 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0B0721A000C;
	Fri, 21 Jun 2024 10:17:17 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 22/22] ttyrun: upgrade 2.32.0 -> 2.33.1
Date: Fri, 21 Jun 2024 10:16:46 +0800
Message-Id: <1718936206-8080-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718936206-8080-1-git-send-email-wangmy@fujitsu.com>
References: <1718936206-8080-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28468.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28468.003
X-TMASE-Result: 10-3.230400-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yYL5ja7E+OhyTfK5j0EZbyvMcZL/toKwUu79
	DJRUi35poiRiRqJbjhYBXdtZPWfJ2i/7QU2czuUNA9lly13c/gEQhNjZQYyI3LRPJs/q8vyUGeK
	Aa5WpyDv8bQRM2WaSHIAy6p60ZV62To3UJuRLIoTdB/CxWTRRu+rAZ8KTspSz8RdrJBU/gBmP8B
	Z9UeHwSVH6+Mh1N/cxk6fV4ZsZJr2Dj4dvsHRoyOu1Rop2lK6LfrPfV6Jkl5wswiEHHSf6sWUtE
	NxuPx4AiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 02:17:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200982

From: Wang Mingyu <wangmy@fujitsu.com>

Bug Fixes:
- s390-tools: Fix formatting and typos in README.md
- s390-tools: Fix release string

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-core/ttyrun/{ttyrun_2.32.0.bb => ttyrun_2.33.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ttyrun/{ttyrun_2.32.0.bb => ttyrun_2.33.1.bb} (94%)

diff --git a/meta/recipes-core/ttyrun/ttyrun_2.32.0.bb b/meta/recipes-core/ttyrun/ttyrun_2.33.1.bb
similarity index 94%
rename from meta/recipes-core/ttyrun/ttyrun_2.32.0.bb
rename to meta/recipes-core/ttyrun/ttyrun_2.33.1.bb
index 815f625a67..ccb7f9b268 100644
--- a/meta/recipes-core/ttyrun/ttyrun_2.32.0.bb
+++ b/meta/recipes-core/ttyrun/ttyrun_2.33.1.bb
@@ -7,7 +7,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f5118f167b055bfd7c3450803f1847af"
 
 SRC_URI = "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master"
-SRCREV = "9eea78b3ad8ab3710fb3b2d80b9cd058d7c8aba7"
+SRCREV = "686262fdcdaed7903ca1720d7dd0b1f9f5621d7b"
 
 CVE_PRODUCT = "s390-tools"
 
-- 
2.34.1


