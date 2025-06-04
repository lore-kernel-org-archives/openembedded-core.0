Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFF53C678DA
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 08:45:49 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.11713.1749026733689315424
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 01:45:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=r3A1ehWN;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749026744; x=1780562744;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OutwICHqzhrQLoFbFBvVdjD5QqaY7BhJCofXUyfIAPc=;
  b=r3A1ehWNsj8ijNAIsUPqsJZR1VOj7aMdU+ksz2764gq3ZxUlhtw/9Q6F
   cB1ADNtGiXxtzut0CB1YpJqbQIlbjPUlZN9Xpa0JYgBOj7uZCDKNsMTcq
   tKyYvRuRiiHCj0+JpZRlzPjCq5XHhK2uiKJFUg26jZrOWTn1CMWiuaJhw
   rbPyUPVK3vVfhFYgIh4HhTAtRxlGRU43B32mfYiv7BHdHpPPROAV7sdt6
   QJo1BVrQuqy1dWiXHYdn5nNEzUa4iuraPYcwUaVOobaQkod2jfy1FVhWV
   vZeWkTzU/+V7mIlivmtygAYnJBoC5b6fQ8Pvx1vJpJZ5nHJlWdVNI3ZC0
   w==;
X-CSE-ConnectionGUID: i5Efg1UPSAeW4OgctWNFXA==
X-CSE-MsgGUID: ySUJ8UO+S0+/vL9OJhFCbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="202109492"
X-IronPort-AV: E=Sophos;i="6.16,208,1744038000"; 
   d="scan'208";a="202109492"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 17:45:42 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id E80F3D5004
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:40 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id A0691D50A9
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:40 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1F3551A0078;
	Wed,  4 Jun 2025 16:45:40 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 34/45] python3-click: upgrade 8.1.8 -> 8.2.1
Date: Wed,  4 Jun 2025 16:45:12 +0800
Message-ID: <20250604084524.864-34-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250604084524.864-1-wangmy@fujitsu.com>
References: <20250604084524.864-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 08:45:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217880

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-click_8.1.8.bb => python3-click_8.2.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-click_8.1.8.bb => python3-click_8.2.1.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-click_8.1.8.bb b/meta/recipes-devtools/python/python3-click_8.2.1.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-click_8.1.8.bb
rename to meta/recipes-devtools/python/python3-click_8.2.1.bb
index 7be3d73546..05be963309 100644
--- a/meta/recipes-devtools/python/python3-click_8.1.8.bb
+++ b/meta/recipes-devtools/python/python3-click_8.2.1.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://click.pocoo.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1fa98232fd645608937a0fdc82e999b8"
 
-SRC_URI[sha256sum] = "ed53c9d8990d83c2a27deae68e4ee337473f6330c040a31d4225c9574d16096a"
+SRC_URI[sha256sum] = "27c491cc05d968d271d5a1db13e3b5a184636d9d930f148c50b038f0d0646202"
 
 inherit pypi python_flit_core ptest-python-pytest
 
-- 
2.43.0


