Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29CDDC71143
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 08:45:50 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.11713.1749026733689315424
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 01:45:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rWOlpo3f;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749026740; x=1780562740;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=y3rd17UYzyXRvWOUkkq4WGgX3uymspYRqeJVN4hL75M=;
  b=rWOlpo3fOMbrfaJPOr7+OcU/B85spuMjCatnBiXQZ91XJTR7ACfWHPsV
   t88TkzNjjZV6SWEHrNgVt5bjzSwJKV1a5J0AlV18gxbjuj9GPbL3uLBdh
   XtxUjLICkJG4GN6wbpQRBX2ZoGWakA6X5ZrzJLH/mrtfBdlvEFgIc4pJp
   lTN3w786dyyfqAH/Tg3p2/+lLuhpBv/ICePKlRFdVD3ezGwcgm2X7BVs+
   v05rifw7HwOxEqX99oVwplncNYKKKS3zguASSWSEt1tB4KiS+3ICEjveF
   vk699fq8Cp+IJtYbt9QwwMFEfT6OnV01eRoBi518Shp1UfK4+Ujg7fGaa
   Q==;
X-CSE-ConnectionGUID: NcHFHpEbS++fTmEt7izP8A==
X-CSE-MsgGUID: OBwGvxmESnSN+c0yrpz9dQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="202109486"
X-IronPort-AV: E=Sophos;i="6.16,208,1744038000"; 
   d="scan'208";a="202109486"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 17:45:39 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6424D1FD94
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:37 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 22120D746A
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:37 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C08831A009A;
	Wed,  4 Jun 2025 16:45:36 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 25/45] libucontext: upgrade 1.2 -> 1.3.2
Date: Wed,  4 Jun 2025 16:45:03 +0800
Message-ID: <20250604084524.864-25-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250604084524.864-1-wangmy@fujitsu.com>
References: <20250604084524.864-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 08:45:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217869

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../musl/{libucontext_1.2.bb => libucontext_1.3.2.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/musl/{libucontext_1.2.bb => libucontext_1.3.2.bb} (97%)

diff --git a/meta/recipes-core/musl/libucontext_1.2.bb b/meta/recipes-core/musl/libucontext_1.3.2.bb
similarity index 97%
rename from meta/recipes-core/musl/libucontext_1.2.bb
rename to meta/recipes-core/musl/libucontext_1.3.2.bb
index 4e34df1439..65ee77d06e 100644
--- a/meta/recipes-core/musl/libucontext_1.2.bb
+++ b/meta/recipes-core/musl/libucontext_1.3.2.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ebea527af0602d509b7f4c49533fb1bd"
 SECTION = "libs"
 DEPENDS = ""
 
-SRCREV = "4dde3417b4bb4b1b1545bd913be337680b5e28c3"
+SRCREV = "a0323579ac50b9a9d4033754d089f1fed0f59a00"
 SRC_URI = "git://github.com/kaniini/libucontext;branch=master;protocol=https \
            "
 
-- 
2.43.0


