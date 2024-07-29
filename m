Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18201C52D1E
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 01:10:42 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.46587.1722215420520138463
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jul 2024 18:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PQ/bb2ye;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722215433; x=1753751433;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=F0BPp7rLsBTfn2z0IguET2jSCbQFBP9RYrmDGmFDT8w=;
  b=PQ/bb2yeZZqivuZd4unWs7uP06OVhbc2yfiIVFo3V0Y1pG0krd4jaec5
   8RcLQmXLiNhgGUKzV8nWp7eVWu/jYbuUVrnFcELbwPkMPKHkdD1lil8QO
   XeVVc6cJFexhEwE5TiXdlywXkDkrxNDsgLKnDI7qyCtwiPiYCxNcBX4F/
   wIhNSMiN8c2xkmPyeMpvBfDl40W3IG1Om4Di2ryp93xkJ9a+uE6whNCvX
   +8RgWtYiwYQsOUNG/sMKLgXQY70M1WIVD5YyQpCR3SkKqiBA9rpYjnQMe
   5LoN9SiRngXJCAy77iHc1wSo6LyuAJ37iGDrstOL7LPZ+k4H/8/CPtUzw
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="148298441"
X-IronPort-AV: E=Sophos;i="6.09,245,1716217200"; 
   d="scan'208";a="148298441"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 10:10:32 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id DAD85E8D42
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:29 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1E6E5BF3DC
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id A0F0620071A1D
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:28 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 15DFB1A000C;
	Mon, 29 Jul 2024 09:10:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 28/33] vulkan-loader: upgrade 1.3.283.0 -> 1.3.290.0
Date: Mon, 29 Jul 2024 09:10:03 +0800
Message-Id: <1722215408-27541-28-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
References: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28560.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28560.004
X-TMASE-Result: 10--0.256600-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIOYgThO+DmX5WiD0nzhO6Guce7gFxhKa2YkAyCbA7KV50C6WJNXTpiezJ
	3Mv1/YUvi8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFOH4Q4L2u5Bpx5LE4VtjrDaav2
	pcm6RGfL8buATvVi17iaeWwOv9Q9TxK7h7aQS1gnvZEGW7kIy3JTTwqvFu6FhDI8yOxHTKaux9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 01:10:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202601

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{vulkan-loader_1.3.283.0.bb => vulkan-loader_1.3.290.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-loader_1.3.283.0.bb => vulkan-loader_1.3.290.0.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb
index 6c3197e13f..c5b25be9ef 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb
@@ -9,8 +9,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=vulkan-sdk-1.3.283;protocol=https"
-SRCREV = "720be5198aad4696381d2e3eeadc131c9f56bdc6"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=main;protocol=https"
+SRCREV = "40b8e6eeead809a62c708cb48fdd9f8f2eab3f15"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


