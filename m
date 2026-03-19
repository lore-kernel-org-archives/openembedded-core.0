Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 075571075296
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 10:13:55 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7721.1773915232447876697
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 03:13:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UtyOCF/s;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773915232; x=1805451232;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Jqa0FR4XyiRz/hkUncfCg+EWyBQoGrDdvB5a5/wzLcA=;
  b=UtyOCF/sehvFQ+3jTtt18UejxAHEz6SBdZ+xP3HsWezTemXVTK8TXEcT
   fex+EroBcUP33SJoB/Vn9WsSkqthZoqAbMDL9g0y78O5056YkRT2MIaZu
   ciAGKQeWVrgPBy5R1Zk+Es1OF7c6/5yO54zUo9tImmU9HncMkZAhucldN
   0S1vhEwBJspI7xCjq2mjTz11hXEkbSq5YsmXS5pv1/aqVHbAVO16o4nR7
   tvr83UlCsCIse8NU/jc220IIHlsY7edbos2A/AqfMsGaCsc+7MKmSr5QQ
   hkJJCifabqRbaisKtkN6Netw3hlAQV35lZK0gduisxmLhlhJwpAAV/xj3
   A==;
X-CSE-ConnectionGUID: 6oc9nus3Sp+sdUWr53CLAw==
X-CSE-MsgGUID: coD++DivS76n419l8s3nMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="234591145"
X-IronPort-AV: E=Sophos;i="6.23,129,1770562800"; 
   d="scan'208";a="234591145"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 19:13:50 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id D8E391C00180
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:13:50 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 87DAAC0009D
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:13:50 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 9986B101E529;
	Thu, 19 Mar 2026 10:13:47 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 01/40] at-spi2-core: upgrade 2.58.3 -> 2.60.0
Date: Thu, 19 Mar 2026 18:12:53 +0800
Message-ID: <20260319101332.2067-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:13:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233475

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../atk/{at-spi2-core_2.58.3.bb => at-spi2-core_2.60.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.58.3.bb => at-spi2-core_2.60.0.bb} (94%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.58.3.bb b/meta/recipes-support/atk/at-spi2-core_2.60.0.bb
similarity index 94%
rename from meta/recipes-support/atk/at-spi2-core_2.58.3.bb
rename to meta/recipes-support/atk/at-spi2-core_2.60.0.bb
index 022d2ff71e..8e3314222c 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.58.3.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.60.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 CVE_PRODUCT += "at-spi2-atk"
 
-SRC_URI[archive.sha256sum] = "b0fabea6c9742eda8c9c675f9b8c1d1babba1da82da03ea1103710233717c1b0"
+SRC_URI[archive.sha256sum] = "80e50c1a97d8fd660a3fadb02ca35876df881c266d3d6108fc5b4c113614cb99"
 
 DEPENDS = " \
 	dbus \
-- 
2.43.0


