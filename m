Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CEC8C35FFA
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 06:22:12 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.5384.1742278930805007876
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 23:22:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gFAzf9Jj;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742278931; x=1773814931;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=G8xi7rcC5PTNpZYWOQQc2k/02dXTgsOFdf5kvkfirK8=;
  b=gFAzf9JjwcrWyLKDCtedscq5LnrdJej+uS/3jrGTDJC7Y+Ddb1MvD9SF
   0QtOvvr5FvKVdqeOW4P2u+mgCzgj/AzB1+shRpz+UJoSWF2NLPEcXkFYT
   wQ+Bp8L3jcAtOFCUPy8/AvEDVVob+9sL8ORFlVZl3Fh+N9IOYSQZfpeJi
   DInKf+5CIzJhgXxTzaFxo8LihlRM3D/NbIZZiAZvTlMfQVU1vTKHPglgR
   FkyfyqAOdQyNnQbJheWIL6tBxrlzZplFH+4GSaEJ/Eet74G/UNuA7m5fO
   SPUNlDrspdTUfSV409n41j1JvhKXVk2V1nXDmsJXaiiK/eM+2FDMUiRjv
   Q==;
X-CSE-ConnectionGUID: O3GWiypiSay411KOXRJxFw==
X-CSE-MsgGUID: 8VYL4bi0Saqi3Wavk4xlyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="181844107"
X-IronPort-AV: E=Sophos;i="6.14,256,1736780400"; 
   d="scan'208";a="181844107"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 15:22:08 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7B80CC226D
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 15:22:06 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 40209D72A6
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 15:22:06 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 052EF1A009B;
	Tue, 18 Mar 2025 14:22:05 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 12/12] systemd: upgrade 257.3 -> 257.4
Date: Tue, 18 Mar 2025 14:21:52 +0800
Message-Id: <1742278912-2989-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742278912-2989-1-git-send-email-wangmy@fujitsu.com>
References: <1742278912-2989-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 06:22:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213175

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ystemd-boot-native_257.3.bb => systemd-boot-native_257.4.bb} | 0
 .../systemd/{systemd-boot_257.3.bb => systemd-boot_257.4.bb}    | 0
 meta/recipes-core/systemd/systemd.inc                           | 2 +-
 .../recipes-core/systemd/{systemd_257.3.bb => systemd_257.4.bb} | 0
 4 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_257.3.bb => systemd-boot-native_257.4.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_257.3.bb => systemd-boot_257.4.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_257.3.bb => systemd_257.4.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot-native_257.3.bb b/meta/recipes-core/systemd/systemd-boot-native_257.4.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot-native_257.3.bb
rename to meta/recipes-core/systemd/systemd-boot-native_257.4.bb
diff --git a/meta/recipes-core/systemd/systemd-boot_257.3.bb b/meta/recipes-core/systemd/systemd-boot_257.4.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_257.3.bb
rename to meta/recipes-core/systemd/systemd-boot_257.4.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 31d26a9fc1..55389f1050 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -15,7 +15,7 @@ LICENSE:libsystemd = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "876ee10e0eb4bbb0920bdab7817a9f06cc34910f"
+SRCREV = "5ce1c02abc0cc386332384497b5939108314d80d"
 SRCBRANCH = "v257-stable"
 SRC_URI = "git://github.com/systemd/systemd.git;protocol=https;branch=${SRCBRANCH}"
 
diff --git a/meta/recipes-core/systemd/systemd_257.3.bb b/meta/recipes-core/systemd/systemd_257.4.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_257.3.bb
rename to meta/recipes-core/systemd/systemd_257.4.bb
-- 
2.43.0


