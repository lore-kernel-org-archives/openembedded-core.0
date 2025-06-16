Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DF59C7115A
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 09:17:02 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.26247.1750065413231284673
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 02:16:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ScBfAUbW;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750065414; x=1781601414;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=w8y+ZtAN0/UYAYsBHyX0nPD+MhWkKMWQ2QeOtKGP0ZQ=;
  b=ScBfAUbWXjYfma4aCr78KUaKFsnpBu6XJUZ570Y4AdcTdoR2aXyRo81H
   upX0ueReJhY25vDBkszEugjAqZRLOogpwvD9S/qcKw5QmfPO+sGfV0xg4
   xfciwca2DFWNwMWRE4+0XfV19vFy0BDPRezTmMfuFi/iFTmm/9FW4sjP8
   QVY5dv0Ru46KkGSgsU/xpYya+JB9lsMIUD0AzRk1doQuMvByG5v27SoTr
   FW4IgOEfAhdnZS8ydMeyd58079N2qeEi6bcgCl4An9xKqRomXyc5aN2Mr
   piBX1v2Y1PzMkxq01/kQ504JmOprj0mlAWNCZLXJjR3QibLCqfXjaQqX9
   A==;
X-CSE-ConnectionGUID: Y1z4X+K8TemxQWxD7+6jxQ==
X-CSE-MsgGUID: 9Yrm99COSnqItwfBIJ+STw==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="202821347"
X-IronPort-AV: E=Sophos;i="6.16,240,1744038000"; 
   d="scan'208";a="202821347"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 18:16:51 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 246CAC68FB
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 18:16:48 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id C0508CFB67
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 18:16:47 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 051DB1A0073;
	Mon, 16 Jun 2025 17:16:46 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 02/24] diffoscope: upgrade 297 -> 298
Date: Mon, 16 Jun 2025 17:16:20 +0800
Message-ID: <20250616091643.918-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250616091643.918-1-wangmy@fujitsu.com>
References: <20250616091643.918-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 09:17:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218774

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../diffoscope/{diffoscope_297.bb => diffoscope_298.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_297.bb => diffoscope_298.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_297.bb b/meta/recipes-support/diffoscope/diffoscope_298.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_297.bb
rename to meta/recipes-support/diffoscope/diffoscope_298.bb
index 6f6f4ac520..4a50059c99 100644
--- a/meta/recipes-support/diffoscope/diffoscope_297.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_298.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "25532061c640b4be7496f9a726640e20ca0fcb8e46a8a1a46e51ac940a5f4e57"
+SRC_URI[sha256sum] = "9644b7e711df71f13c5f50f3d1353c1e6d09f462d342d9771576e75f3dd8c3e1"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.43.0


