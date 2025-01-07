Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFB12E77198
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 09:01:45 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.16519.1736240495319933100
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 01:01:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HPpVcTTi;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736240495; x=1767776495;
  h=from:to:cc:subject:date:message-id;
  bh=Z6EvKC8TLTp0ISipcoWtYwnvwssz2n0+S8DWDnTdt+Q=;
  b=HPpVcTTiKS7lIriIRV/YlG7dBhLCfCgESIOAGRifkykF1seemu4lYEIl
   pwNFlBh1KBUaT0dwsICkBdYKxLs2RMWy0v51yBx5q+FQ8Z6n471dKjJ6I
   6FIU0CpGbdLT159keQcVYUdAiErN4LlJhqfuzuoI6IIDffblBJkEwc2e+
   noUZSG+hlBMyJrXpV5eP0LoQVQUhYuUCGwXvuU/2s5jDc0qDb1v4vw8Kw
   c3tD/ceyqord1jZPwnGKxlsr3BNBKSqnBTIQeZiT02Y7JYDAeIL+ZgRAy
   7uZzYheie60mLjENdbk4ReR+LnPBrpMVjiBIs7VrNDk6U3BR1Ml2q3LDu
   Q==;
X-CSE-ConnectionGUID: KIR9jKoAQcazREwGn1PrZw==
X-CSE-MsgGUID: Szcdhl7+SHOG0g7wv31l/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="173144501"
X-IronPort-AV: E=Sophos;i="6.12,295,1728918000"; 
   d="scan'208";a="173144501"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 18:01:30 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 599F2C3F97
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:28 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 28B52D3F12
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id A8460200930C2
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:27 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 411871A0003;
	Tue,  7 Jan 2025 17:01:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 01/13] erofs-utils: upgrade 1.8.3 -> 1.8.4
Date: Tue,  7 Jan 2025 17:01:10 +0800
Message-Id: <1736240482-5243-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28908.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28908.003
X-TMASE-Result: 10-2.314200-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyuGKb+4D/nz9QjJ
	lierVE/ntQTfQKYWqkHc7yKmgXECvbBAQLqGlKivP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW6knQ5gytPTKeezToK22g6le4OGWN8bTes7Cl8sx4HBG/ioIsi7Sa0gYD4HoIFcAhakTR
	R+0+D9U14Q/+3wuqBmtz9kIuTkBq6vvxILmKK/HBRFJJyf5BJeZVXUb4KTaXv6C0ePs7A07aqzO
	OiUJy/IimkYbsuwdRgSGaS6sFeGQN/yNhYBLP7dDKhVW4iPPL4NuPHebP5zSyeGZj6UZluPlHrb
	o3kLKPrGjF5H7HziQIX31ZXMpRYJ8gwWDQic4+rPmACeZqO85TioKJ2WPUxTLS4AEOLjtwA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 09:01:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209441

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix unusual PAX header handling for tarerofs;
- Fix LIBARCHIVE.xattr decoding;
- Speed up handling of incompressible data;
- Add a '-E^fragdedupe' option to explicitly disable fragment deduplication;
- Fixes around '-Eall-fragments' and '-Ededupe';
- Use external xxhash library if possible.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../erofs-utils/{erofs-utils_1.8.3.bb => erofs-utils_1.8.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/erofs-utils/{erofs-utils_1.8.3.bb => erofs-utils_1.8.4.bb} (94%)

diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils_1.8.3.bb b/meta/recipes-devtools/erofs-utils/erofs-utils_1.8.4.bb
similarity index 94%
rename from meta/recipes-devtools/erofs-utils/erofs-utils_1.8.3.bb
rename to meta/recipes-devtools/erofs-utils/erofs-utils_1.8.4.bb
index 996303c7f0..ba06e7019d 100644
--- a/meta/recipes-devtools/erofs-utils/erofs-utils_1.8.3.bb
+++ b/meta/recipes-devtools/erofs-utils/erofs-utils_1.8.4.bb
@@ -5,7 +5,7 @@ SECTION = "base"
 LIC_FILES_CHKSUM = "file://COPYING;md5=73001d804ea1e3d84365f652242cca20"
 HOMEPAGE = "https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/tree/README"
 
-SRCREV = "8d6c5d48615e23cd47cf9eb793904aedbb93ff4e"
+SRCREV = "b4b93c26c7e8e771af93627f02791818e7c78f6c"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git;branch=master;protocol=https"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(\d+(\.\d+)+))"
-- 
2.43.0


