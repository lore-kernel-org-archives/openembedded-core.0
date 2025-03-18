Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1967C36003
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 06:22:12 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.5353.1742278929138044005
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 23:22:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BxuukDRy;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742278929; x=1773814929;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=FOACTZOSTI+f2USwnjj+mPeqvew1MJgQd1aGubFh1mo=;
  b=BxuukDRy3plGiswiH7NqyXLhm43W/pSBHoHBk2t7Y5CGgQczFoYGdbip
   kNn7roinR4MfPH5vsqmFg4E2GwleGZgbECrGxS51KQ5xiK79mT4l0L8JR
   L6QxR/kozzpF9htHvpS9S8APeEfCdTBp+AvqyMZUTjPa94a4/h/Orl0Ro
   eHZcMA6vCSXVT8uLZ4Ui4cuAFXWbxkkGXNv2E3UQxkgUPUB3AfJHYZAo5
   hCAKy331I7CbQRn1Zw1Gxe46pCCV6j1SWPdlJNAPCczyIl5vNMyi5mjXI
   1S7QKsybQxQQzqGtP3YWooScFwChumOfPmBiFlcESCvuD/9JmsZz7SmQi
   A==;
X-CSE-ConnectionGUID: jc87fxQjTIuqTHvbzmbkIA==
X-CSE-MsgGUID: EYMTCchSS0Wg7YnanKCAjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="193422761"
X-IronPort-AV: E=Sophos;i="6.14,256,1736780400"; 
   d="scan'208";a="193422761"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 15:22:06 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 92C3CD4F41
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 15:22:04 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 54C14D50A0
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 15:22:04 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DD9261A0078;
	Tue, 18 Mar 2025 14:22:03 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 02/12] at-spi2-core: upgrade 2.54.1 -> 2.56.0
Date: Tue, 18 Mar 2025 14:21:42 +0800
Message-Id: <1742278912-2989-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742278912-2989-1-git-send-email-wangmy@fujitsu.com>
References: <1742278912-2989-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 06:22:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213168

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../atk/{at-spi2-core_2.54.1.bb => at-spi2-core_2.56.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.54.1.bb => at-spi2-core_2.56.0.bb} (95%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.54.1.bb b/meta/recipes-support/atk/at-spi2-core_2.56.0.bb
similarity index 95%
rename from meta/recipes-support/atk/at-spi2-core_2.54.1.bb
rename to meta/recipes-support/atk/at-spi2-core_2.56.0.bb
index 17bb955f19..e897a12913 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.54.1.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.56.0.bb
@@ -13,7 +13,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "f0729e5c8765feb1969bb6c1fba18afa2582126b0359aa75a173fda1acf93c4c"
+SRC_URI[sha256sum] = "80d7e8ea0be924e045525367f909d6668dfdd3e87cd40792c6cfd08e6b58e95c"
 
 DEPENDS = " \
 	dbus \
-- 
2.43.0


