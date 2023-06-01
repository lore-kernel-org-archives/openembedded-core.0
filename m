Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B42CC7EE2F
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 09:04:08 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.26615.1685610245593289228
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 02:04:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="119146820"
X-IronPort-AV: E=Sophos;i="6.00,209,1681138800"; 
   d="scan'208";a="119146820"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 18:04:04 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id C00E8DAE13
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:04:00 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 05FF2D3F3E
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:04:00 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 47C1788857;
	Thu,  1 Jun 2023 18:03:59 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-psutil: upgrade 5.9.4 -> 5.9.5
Date: Thu,  1 Jun 2023 17:03:23 +0800
Message-Id: <1685610221-29015-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
References: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27664.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27664.006
X-TMASE-Result: 10-6.027100-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/ySrLqyE6Ur/jwXotg6ps9+GU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNCTeoveN0UE2HqfCKxjr5zWAN6i+va16u0p9
	DaZRzoN0NUccATRyd1Fs77BeaP4G0rWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNQipDIxmUueQea0gvMKsSEVmrK+9M4NI/Zmw3Ou4JFRXtTFg5RvJK2tKSZWzbv0yVNJPf
	YekT2drNvtKSdGIF6nUgymUJU0fBR/BXqwE9HSW
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 09:04:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182074

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Fix license: extra open quote.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-psutil_5.9.4.bb => python3-psutil_5.9.5.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-psutil_5.9.4.bb => python3-psutil_5.9.5.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-psutil_5.9.4.bb b/meta/recipes-devtools/python/python3-psutil_5.9.5.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-psutil_5.9.4.bb
rename to meta/recipes-devtools/python/python3-psutil_5.9.5.bb
index 019ea2dec1..c84e2225b8 100644
--- a/meta/recipes-devtools/python/python3-psutil_5.9.4.bb
+++ b/meta/recipes-devtools/python/python3-psutil_5.9.5.bb
@@ -1,9 +1,9 @@
 SUMMARY = "A cross-platform process and system utilities module for Python"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e35fd9f271d19d5f742f20a9d1f8bb8b"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a9c72113a843d0d732a0ac1c200d81b1"
 HOMEPAGE = "https://pypi.org/project/psutil/"
 
-SRC_URI[sha256sum] = "3d7f9739eb435d4b1338944abe23f49584bde5395f27487d2ee25ad9a8774a62"
+SRC_URI[sha256sum] = "5410638e4df39c54d957fc51ce03048acd8e6d60abc0f5107af51e5fb566eb3c"
 
 inherit pypi setuptools3
 
-- 
2.34.1


