Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14B5EC77B73
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 09:17:03 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.26271.1750065418417308291
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 02:16:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fEjT4J/G;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750065418; x=1781601418;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vziqnhgoji++Mq4rUDjESfCCkFXz8GH+Q6LLiiJBdlw=;
  b=fEjT4J/GoitQlO1v1e/uORyjHQ90cF8C9scCbFVD4JvoBbs98eRWU/oL
   b/VsN5b0XWC7c3JcUjEirZVx7NjWujSW4GkLvZq/aduukxOKrayc8Zns+
   O5CGFXdqbiFyGLDDxAucWJyN7lMUlISbzhLiPEe5YJZYVKNAtORUqTEJt
   BUqhgcCjxGmbDMq4SqchiYUzJHecukzrLHDtEk9Y7Q0O9LGk49zHMnsCZ
   UjSuqzOYH0tHCIpDAXnJB23yA10BL6wyDAlLQCr0mFsgz29O2JLpGSklX
   D77ADydU3SlDdMN5UXNfNUGM2Uo81yy1unSlaZcAMFngP3Rqe39btSnbK
   Q==;
X-CSE-ConnectionGUID: 5ozzE5vgQoKs6aihFjSarg==
X-CSE-MsgGUID: UkmJ4Ab1Rb2uOArh1Bg1Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="190253965"
X-IronPort-AV: E=Sophos;i="6.16,240,1744038000"; 
   d="scan'208";a="190253965"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 18:16:56 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id DB321E9E80
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 18:16:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 86C7CD4C03
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 18:16:53 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 226BC1A000B;
	Mon, 16 Jun 2025 17:16:53 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 15/24] python3-dtschema: upgrade 2025.2 -> 2025.6.1
Date: Mon, 16 Jun 2025 17:16:33 +0800
Message-ID: <20250616091643.918-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250616091643.918-1-wangmy@fujitsu.com>
References: <20250616091643.918-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 09:17:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218787

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix a longstanding ordering issue with extracting type information
  from properties which have a reference to another property. 'mac-mode'
  is the one in the Linux kernel.

- Fix a false positive warning about missing
  unevaluatedProperties/additionalProperties

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-dtschema_2025.2.bb => python3-dtschema_2025.6.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dtschema_2025.2.bb => python3-dtschema_2025.6.1.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2025.2.bb b/meta/recipes-devtools/python/python3-dtschema_2025.6.1.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-dtschema_2025.2.bb
rename to meta/recipes-devtools/python/python3-dtschema_2025.6.1.bb
index 2071763741..872084841b 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2025.2.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2025.6.1.bb
@@ -7,7 +7,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "dtschema"
 
-SRC_URI[sha256sum] = "9adeaff2079a8b5fbc4bd1c8f02cbd232016a84a9684739cac20b4df3b19509e"
+SRC_URI[sha256sum] = "6348fb23961d0cd1c89ea0c29b790c622bc34fdd1be56090724c6c1f76cbf10d"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "\
-- 
2.43.0


