Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C09C83F2D
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 08:08:46 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.2990.1752566910760890102
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 01:08:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Ng0vrYfV;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1752566918; x=1784102918;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TwBf1kyNRHll3ybRo8rH2VvYsZOrwP+pOTJ3IAdkHsM=;
  b=Ng0vrYfVxqS0B7uLgOmoR2fSLUVeD4FxLd50tMA5i2XEMTQLVjZygcah
   jmKu8BFWnj3jjtGwHL2nBcf4jA2lqWzqWvOpqYFFGVG1QYqoRdXCH+3hs
   a09bH5MXNPQaIugvDYO2K8MiEI/zYyKgFLbt2xZXx+jOFVqYWf5vMPloc
   Qq96BahZzpioAAljaJ+xtepp8kRiC6SoDvEfcAKE6WXkkrs7Iy60MwS+o
   wx3WTns+6mFYmll7G9f2c9XIG/ahMpYjZ9pZ+L6Cbo2brwIeit35YXlmD
   i34ZGyHbc0u7tMBAPC4eXqaeCgDcAPjmlr4arTtt9bAwNGKVK8e/ESHHs
   w==;
X-CSE-ConnectionGUID: cgNdCK42SRqOZUcojpvStQ==
X-CSE-MsgGUID: Pv0l0pikSQ+Gtj0nM9S4vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="185255753"
X-IronPort-AV: E=Sophos;i="6.16,313,1744038000"; 
   d="scan'208";a="185255753"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 17:08:37 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 84A8B1C0213C
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:37 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id DD89CC00891
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:36 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4C2C51A0078;
	Tue, 15 Jul 2025 16:08:33 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 18/19] u-boot: upgrade 2025.04 -> 2025.07
Date: Tue, 15 Jul 2025 16:08:18 +0800
Message-ID: <20250715080819.622-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250715080819.622-1-wangmy@fujitsu.com>
References: <20250715080819.622-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220287

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc                       | 2 +-
 .../u-boot/{u-boot-tools_2025.04.bb => u-boot-tools_2025.07.bb} | 0
 .../recipes-bsp/u-boot/{u-boot_2025.04.bb => u-boot_2025.07.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/u-boot/{u-boot-tools_2025.04.bb => u-boot-tools_2025.07.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2025.04.bb => u-boot_2025.07.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 8600d4bab6..2734b318d7 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -12,7 +12,7 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "34820924edbc4ec7803eb89d9852f4b870fa760a"
+SRCREV = "e37de002fac3895e8d0b60ae2015e17bb33e2b5b"
 
 SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master;tag=v${PV}"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2025.04.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2025.07.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-tools_2025.04.bb
rename to meta/recipes-bsp/u-boot/u-boot-tools_2025.07.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2025.04.bb b/meta/recipes-bsp/u-boot/u-boot_2025.07.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2025.04.bb
rename to meta/recipes-bsp/u-boot/u-boot_2025.07.bb
-- 
2.43.0


