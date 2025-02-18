Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE602C021AF
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 07:41:38 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.14681.1739864485588248530
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 23:41:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oJ/HhcQG;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739864490; x=1771400490;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=2KxFVNNvI8PZlSk+KYnGBScYUPMeD92toGZHJeaTnhw=;
  b=oJ/HhcQGY13LRdhPuqAJlXIaaWMU93ZRAamaj6XM1SHJHVBlTWZ6UpIf
   HHz3ydgSES+pRnxS+D2WVxaM3PlRAFUhJ5xGMdqRph9IkXeAqWDViY61j
   dFr6Gyiltxco+dDi/timQXpFV0AwvDlmL/eO/bv7blLgrm3ylzUvtxw9e
   igqs3GiynXBBI80Ytf5ayXaxe3hC0ZKsjR+YIIFPkl6xrUTijajTdaMKv
   dlcO0pCJkgqnISQqXDMEHr4re+NwzjU9eijA9uM2fHYQptjm+QxxBBesM
   m9kL6eK4z9s/fqFJPlkOyqb2se10Y2jY24/tV1XXgSxdA/VdwtrWOzGAy
   g==;
X-CSE-ConnectionGUID: ujLqJLR4SJyDotNVdk2e1w==
X-CSE-MsgGUID: 14acThYYRsKdhjz1aROLDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="190602679"
X-IronPort-AV: E=Sophos;i="6.13,295,1732546800"; 
   d="scan'208";a="190602679"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 16:41:29 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8D5A6E8529
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 55B08D3F2F
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:27 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EC50A1A000B;
	Tue, 18 Feb 2025 15:41:26 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 18/32] python3-dtschema: upgrade 2024.11 -> 2025.2
Date: Tue, 18 Feb 2025 15:39:21 +0800
Message-Id: <1739864375-21394-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
References: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 07:41:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211579

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- schemas: gpio: Add descriptions
- schemas: root-node: add 'spectacles' chassis-type
- schemas: gpio: Restrict HOG node name pattern to suffixes
- schemas: property-units: Add the picoamp type
- validator: Add warning for properties with incompatible multiple types
- schemas: Add access controller consumer
- github: Disable python 3.7
- meta-schemas: Allow additionalItems to be a schema
- on Dec 17, 2024
- dt-bindings: trigger: Add trigger source
- schemas: pci: bridge: Document PCIe equalization presets
- dtb: Fix type collision with "mode-gpios"

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-dtschema_2024.11.bb => python3-dtschema_2025.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dtschema_2024.11.bb => python3-dtschema_2025.2.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2024.11.bb b/meta/recipes-devtools/python/python3-dtschema_2025.2.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-dtschema_2024.11.bb
rename to meta/recipes-devtools/python/python3-dtschema_2025.2.bb
index 8d052d6910..2071763741 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2024.11.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2025.2.bb
@@ -7,7 +7,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "dtschema"
 
-SRC_URI[sha256sum] = "bb7dd36ff9406ec89607b893cfc5e1ffa7ead76fd5c48df77eafc9b4d4196047"
+SRC_URI[sha256sum] = "9adeaff2079a8b5fbc4bd1c8f02cbd232016a84a9684739cac20b4df3b19509e"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "\
-- 
2.43.0


