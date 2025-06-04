Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F54DC71141
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 08:45:50 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.11649.1749026733202619838
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 01:45:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=O8Ji6+dM;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749026739; x=1780562739;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3SibBGdqBCZU+0efw+YNkbF5JcvYrWdENNCItuCnAbo=;
  b=O8Ji6+dM+LwWVguOH6WFgM+halIdozOLwl91b2uJPEwHrLEUcr0IzddB
   Rfq5C1ohWNyaCoM/mPGDNejRPSYa1QHnjhF6Edk3vJormf1OuiJiBnHWT
   p99YBf1ENaezMf6CXT2BTOu2OOlnJsXsFvj0HbhzwF5uxLSNkzTwnWKpO
   Di87d+nZMN1EllVh+UMRWWl3AtiCEayBcEbImG4gEZeFkk7VeIpWumzVH
   9n/nGPueR87hJm2ZUJC9Zf6ZFE89CkdU6MW4LKkVDzZkyCKZtazCGJP0g
   KH8cc0Cx1QMgFiiXN6OS43GiuuTZ4UObu8b07oKVL9iuqYDpA8Mvj+uMU
   A==;
X-CSE-ConnectionGUID: lTOG8RRBSBi5/URIM0V0kg==
X-CSE-MsgGUID: 7KfdLna4RZ6GQbdJ1L+pnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="181182739"
X-IronPort-AV: E=Sophos;i="6.16,208,1744038000"; 
   d="scan'208";a="181182739"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 17:45:38 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id BA369D5004
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:35 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 71659D50A9
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:35 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E59BC1A0078;
	Wed,  4 Jun 2025 16:45:34 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 20/45] kbd: upgrade 2.7.1 -> 2.8.0
Date: Wed,  4 Jun 2025 16:44:58 +0800
Message-ID: <20250604084524.864-20-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250604084524.864-1-wangmy@fujitsu.com>
References: <20250604084524.864-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 08:45:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217868

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-core/kbd/{kbd_2.7.1.bb => kbd_2.8.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/kbd/{kbd_2.7.1.bb => kbd_2.8.0.bb} (96%)

diff --git a/meta/recipes-core/kbd/kbd_2.7.1.bb b/meta/recipes-core/kbd/kbd_2.8.0.bb
similarity index 96%
rename from meta/recipes-core/kbd/kbd_2.7.1.bb
rename to meta/recipes-core/kbd/kbd_2.8.0.bb
index 9b9066e7b0..ababa09918 100644
--- a/meta/recipes-core/kbd/kbd_2.7.1.bb
+++ b/meta/recipes-core/kbd/kbd_2.8.0.bb
@@ -26,7 +26,7 @@ RCONFLICTS:${PN} = "console-tools"
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
            "
 
-SRC_URI[sha256sum] = "f167d899d92b56ccf12f6f49355173f93870a95f15d8aeebf5fdcd28a621aca8"
+SRC_URI[sha256sum] = "01f5806da7d1d34f594b7b2a6ae1ab23215344cf1064e8edcd3a90fef9776a11"
 
 # 'gzip -n' is set due to https://github.com/legionus/kbd/issues/124
 EXTRA_OECONF = "--disable-tests --enable-compress='gzip -n'"
-- 
2.43.0


