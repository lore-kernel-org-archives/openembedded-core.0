Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52845C369AB
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 00:52:16 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.64300.1744073532229948192
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 17:52:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WZZd7z7Z;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744073533; x=1775609533;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=MISHLAc+NYsd/vBDDv84vZxXXP57JCmwpnD85rXSPR4=;
  b=WZZd7z7ZvgbYfUy7Pi++CdFRgicDDxi6qpIYSxf6TIEvdT0mT8OD/zTC
   ZZ1h1xwysGtxSp1xQDC1hrp0gPZAYY5ftlkXbCl31zoXGMQmqAd9NXOcO
   rXc8ZdFgGmJVQoN1ldlFynHQ6lQ57XgoDN4PfM32S8wvrxJI/QG4I3qdf
   98wStTyysH8DiptHqeIlfXAPOHxRD8KF8vbG9OwRfKvjEtMTbJLBZ/rLD
   Yf4xGTkFhzuUcO9086sPx3HsSj05LHiCd4gXusE0JvSdBqVjxIAAupgNW
   jdYX1VHzHxtwUHpW3ZOmZ51nRSKUZNXrUlDq9BjqYys9jIi08VXFLWdqE
   g==;
X-CSE-ConnectionGUID: aIt7B2zgQvegynKSgTA40w==
X-CSE-MsgGUID: DixJl/wvSdOtWVA1LR4HzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="174600380"
X-IronPort-AV: E=Sophos;i="6.15,196,1739804400"; 
   d="scan'208";a="174600380"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 09:52:02 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id A76B6DBB87
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Apr 2025 09:52:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6C25BD4BC2
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Apr 2025 09:52:00 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AB01E1A009A;
	Tue,  8 Apr 2025 08:51:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 15/15] systemd: upgrade 257.4 -> 257.5
Date: Tue,  8 Apr 2025 08:51:42 +0800
Message-Id: <1744073502-27695-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744073502-27695-1-git-send-email-wangmy@fujitsu.com>
References: <1744073502-27695-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 00:52:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214494

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ystemd-boot-native_257.4.bb => systemd-boot-native_257.5.bb} | 0
 .../systemd/{systemd-boot_257.4.bb => systemd-boot_257.5.bb}    | 0
 ...temctl-native_257.4.bb => systemd-systemctl-native_257.5.bb} | 0
 meta/recipes-core/systemd/systemd.inc                           | 2 +-
 .../recipes-core/systemd/{systemd_257.4.bb => systemd_257.5.bb} | 0
 5 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_257.4.bb => systemd-boot-native_257.5.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_257.4.bb => systemd-boot_257.5.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-systemctl-native_257.4.bb => systemd-systemctl-native_257.5.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_257.4.bb => systemd_257.5.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot-native_257.4.bb b/meta/recipes-core/systemd/systemd-boot-native_257.5.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot-native_257.4.bb
rename to meta/recipes-core/systemd/systemd-boot-native_257.5.bb
diff --git a/meta/recipes-core/systemd/systemd-boot_257.4.bb b/meta/recipes-core/systemd/systemd-boot_257.5.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_257.4.bb
rename to meta/recipes-core/systemd/systemd-boot_257.5.bb
diff --git a/meta/recipes-core/systemd/systemd-systemctl-native_257.4.bb b/meta/recipes-core/systemd/systemd-systemctl-native_257.5.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-systemctl-native_257.4.bb
rename to meta/recipes-core/systemd/systemd-systemctl-native_257.5.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 55389f1050..48600ce77a 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -15,7 +15,7 @@ LICENSE:libsystemd = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "5ce1c02abc0cc386332384497b5939108314d80d"
+SRCREV = "1c93ed4c72a4513d9cefcd1f89d11a9dc828d06c"
 SRCBRANCH = "v257-stable"
 SRC_URI = "git://github.com/systemd/systemd.git;protocol=https;branch=${SRCBRANCH}"
 
diff --git a/meta/recipes-core/systemd/systemd_257.4.bb b/meta/recipes-core/systemd/systemd_257.5.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_257.4.bb
rename to meta/recipes-core/systemd/systemd_257.5.bb
-- 
2.43.0


