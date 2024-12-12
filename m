Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3976AE7717D
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 00:49:17 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.9654.1733964556180271962
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Dec 2024 16:49:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pogNGlZY;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733964556; x=1765500556;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=xIiq5S0IOxUyUPoYUZKW9+Q8TnFco7vzbJjXDXbQ3UI=;
  b=pogNGlZYu2Lfc0qve86jv11j4lQVmyzA9MUfSRyAhhxCp6dlg3oysUI9
   H27WtnDPGB7FaHw5DQijmJYPSkROZ2WTbGT1pRSpHNcimgeOvCkH3I6Cm
   LR/mafkZgVCS3g4cM8sGrY6yyNg+Rk2mV2M31gtJ3tTb9ZJCCNyW/ZA3Q
   dyZzzozqOagSDc2kcjcPE0VD1/gQ6vuoDMsFhRKKEYFVHCZRbpOdx4sNG
   oa3lmBu39h+RBVmRDcW3CqeVVEaujqEKF7Nn11nY7o6JUyrrFX4zyEBhX
   iuUly5pv9cMoE+qyYKgWiN8XUIT6mojcg6cUWisMdZQTb+ojZFoXPNvcg
   Q==;
X-CSE-ConnectionGUID: S5C2r4/pS2254aJ1H0Io1w==
X-CSE-MsgGUID: cxrte3fEREiahrsojQAW1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="162305587"
X-IronPort-AV: E=Sophos;i="6.12,227,1728918000"; 
   d="scan'208";a="162305587"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 09:49:13 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2ED8D96742
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 09:49:11 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 041F120ACD
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 09:49:11 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 91AD72008B3AD
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 09:49:10 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3AD7D1A000B;
	Thu, 12 Dec 2024 08:49:10 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH v2] systemd-boot: upgrade 256.8 -> 256.9
Date: Thu, 12 Dec 2024 08:49:00 +0800
Message-Id: <1733964540-5537-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1733964540-5537-1-git-send-email-wangmy@fujitsu.com>
References: <1733964540-5537-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28854.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28854.003
X-TMASE-Result: 10--0.963600-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4Bqqq9awALpxCysPB8dBBorQec
	3JTmkn8uJMPD8FR5f58boCivyaDEErVQ6XPWwtdyEXjPIvKd74CYkAyCbA7KVws5GlXF672zo8W
	MkQWv6iUoTQl7wNH8PuTCMddcL/gjxlblqLlYqXLxnIQJpL9dIUTHqFo8MondbBPRudEoaFnyPd
	/RmYRrN1WeFPh4KfFahEEpjgeDb4U1glm0P0IWJSRmoG0yJC/mz8+8Dup9c47+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 00:49:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208619

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...ystemd-boot-native_256.8.bb => systemd-boot-native_256.9.bb} | 0
 .../systemd/{systemd-boot_256.8.bb => systemd-boot_256.9.bb}    | 0
 meta/recipes-core/systemd/systemd.inc                           | 2 +-
 .../recipes-core/systemd/{systemd_256.8.bb => systemd_256.9.bb} | 0
 4 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_256.8.bb => systemd-boot-native_256.9.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_256.8.bb => systemd-boot_256.9.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_256.8.bb => systemd_256.9.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot-native_256.8.bb b/meta/recipes-core/systemd/systemd-boot-native_256.9.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot-native_256.8.bb
rename to meta/recipes-core/systemd/systemd-boot-native_256.9.bb
diff --git a/meta/recipes-core/systemd/systemd-boot_256.8.bb b/meta/recipes-core/systemd/systemd-boot_256.9.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_256.8.bb
rename to meta/recipes-core/systemd/systemd-boot_256.9.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 989ca667b7..b85d5b187d 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -15,7 +15,7 @@ LICENSE:libsystemd = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "a2240d1cf9f3515728186c2c98a6f4b64a40e4da"
+SRCREV = "f15fd96efd5ebdfb18746acb0cbb35a4331b4d8b"
 SRCBRANCH = "v256-stable"
 SRC_URI = "git://github.com/systemd/systemd.git;protocol=https;branch=${SRCBRANCH}"
 
diff --git a/meta/recipes-core/systemd/systemd_256.8.bb b/meta/recipes-core/systemd/systemd_256.9.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_256.8.bb
rename to meta/recipes-core/systemd/systemd_256.9.bb
-- 
2.43.0


