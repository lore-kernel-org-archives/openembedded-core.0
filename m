Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7F0AC73C66
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 09:17:02 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.26248.1750065413679155080
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 02:16:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=eKoWOEJX;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750065419; x=1781601419;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K1a5Q4bX9ktAs0aR4QWCe86F3liVEgqG4DZX/gzrc0Q=;
  b=eKoWOEJX0O71aWI5i7GZOqGLHdXKDLot8X6Pwp8Ib/mXPXkOmlahynCf
   v/bmtQJ3TLLlrxHOtaa4+F5/0ZoNXgZuSNTVRD6P6X6Es6BEn0cOF5hpE
   J2nU1aA0PFHrBndO+UexzgeQ5KmsrEu2uGIruAJZL4nsVxTIqVAQzvCX+
   QUG0a788CbmGgGVcPe6Bg+PQtRK3PZdfJ6KKUacR+RBYADInHKoCLa630
   IZlBY/Hs4n3+8mDnVI00TwR4ACe5osXn2ilDFw/cX9LcZMPD8IbbV6+0q
   lv71CgI2u6zF2RnAN1PcL1FuE06M5YUBuo2pFwJS32toSkmmepz4bhM9V
   w==;
X-CSE-ConnectionGUID: /5uBVtUUQoSbwv4nEgAxYA==
X-CSE-MsgGUID: uQ9belp7SBuScXZm/78zvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="181755390"
X-IronPort-AV: E=Sophos;i="6.16,240,1744038000"; 
   d="scan'208";a="181755390"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 18:16:57 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id A7748D5004
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 18:16:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 58B11CFB67
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 18:16:55 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DC0501A0074;
	Mon, 16 Jun 2025 17:16:54 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 20/24] python3-pytest: upgrade 8.3.5 -> 8.4.0
Date: Mon, 16 Jun 2025 17:16:38 +0800
Message-ID: <20250616091643.918-20-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250616091643.918-1-wangmy@fujitsu.com>
References: <20250616091643.918-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 09:17:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218790

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pytest_8.3.5.bb => python3-pytest_8.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest_8.3.5.bb => python3-pytest_8.4.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-pytest_8.3.5.bb b/meta/recipes-devtools/python/python3-pytest_8.4.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-pytest_8.3.5.bb
rename to meta/recipes-devtools/python/python3-pytest_8.4.0.bb
index 4d4e8b8511..fb235d82b8 100644
--- a/meta/recipes-devtools/python/python3-pytest_8.3.5.bb
+++ b/meta/recipes-devtools/python/python3-pytest_8.4.0.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "The pytest framework makes it easy to write small tests, yet scal
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bd27e41b6550fe0fc45356d1d81ee37c"
 
-SRC_URI[sha256sum] = "f4efe70cc14e511565ac476b57c279e12a855b11f48f212af1080ef2263d3845"
+SRC_URI[sha256sum] = "14d920b48472ea0dbf68e45b96cd1ffda4705f33307dcc86c676c1b5104838a6"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.43.0


