Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2555C47DDB
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 05:44:49 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.9321.1706766281241875060
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jan 2024 21:44:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=M/6nVliv;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1706766281; x=1738302281;
  h=from:to:cc:subject:date:message-id;
  bh=QEoVFm5sF2sBMTNRzUCfpxlVhDSTBcRCg/0In11r3w4=;
  b=M/6nVlivfysSNNZQTjeQNqKfqyU4Ooi4F0s9/t5Hnr7zQQLCqpObpEL6
   6G/ti+GN1qHNct0o0BJaJuj9j6PpDkw4s+WffH4CCu6EGTWEEQ7y8+X70
   cROKsCVSZPJIIk/4SBh4SWs54rbZ6pKw2DoJXlosfLxujtOYXMVPIbxF2
   s9NCIHWRsU8UQQc+mOjMA96m0VO+sutR3qL/CAbHvJwjPKR1/nbkyR+Gn
   EqCehnUg3GDqb7lrtwSQ8GyXIi493JQWnWZiaf0RTNLEdXmLWdxe7s33U
   RwdDPdbld0ocs2KU8/1f7Ubnikr3v0goqZeDxDJBxCy1tIv3GJkrJreXt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="127314129"
X-IronPort-AV: E=Sophos;i="6.05,234,1701097200"; 
   d="scan'208";a="127314129"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 14:44:38 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3A35A37786
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 14:44:36 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 730F5D9687
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 14:44:35 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id E6AB56C832
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 14:44:34 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 55CCC1A006A;
	Thu,  1 Feb 2024 13:44:34 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] nghttp2: upgrade 1.58.0 -> 1.59.0
Date: Thu,  1 Feb 2024 13:39:07 +0800
Message-Id: <1706765947-12953-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28156.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28156.000
X-TMASE-Result: 10--5.137400-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ5D53rZ0sb/bNdVHptfHl6jhXy0Khej9LVBDonH99+Vq2EwWJsUOPMnpt
	r8PnHpyni8zVgXoAltr8hWd4lAsFlC24oEZ6SpSkj80Za3RRg8DrAOSAsGOBzsfwjRY4TKPURJ5
	ftxcfao1GCo7hZjomY1846HZiC3kg=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 05:44:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194573

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nghttp2/{nghttp2_1.58.0.bb => nghttp2_1.59.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/nghttp2/{nghttp2_1.58.0.bb => nghttp2_1.59.0.bb} (91%)

diff --git a/meta/recipes-support/nghttp2/nghttp2_1.58.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.59.0.bb
similarity index 91%
rename from meta/recipes-support/nghttp2/nghttp2_1.58.0.bb
rename to meta/recipes-support/nghttp2/nghttp2_1.59.0.bb
index 7b2ff4b778..fa0013ca9c 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.58.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.59.0.bb
@@ -8,7 +8,7 @@ SRC_URI = "\
     ${GITHUB_BASE_URI}/download/v${PV}/nghttp2-${PV}.tar.xz \
     file://0001-fetch-ocsp-response-use-python3.patch \
 "
-SRC_URI[sha256sum] = "4a68a3040da92fd9872c056d0f6b0cd60de8410de10b578f8ade9ecc14d297e0"
+SRC_URI[sha256sum] = "fdc9bd71f5cf8d3fdfb63066b89364c10eb2fdeab55f3c6755cd7917b2ec4ffb"
 
 inherit cmake manpages python3native github-releases
 PACKAGECONFIG[manpages] = ""
-- 
2.34.1


