Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07A8FF89242
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 09:57:35 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20416.1776765447700518603
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 02:57:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oO8Oaxxy;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776765448; x=1808301448;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=H6ICd3AFkxpkiNzjZx2m/71ZYBLMHB+78inucLId+Mg=;
  b=oO8Oaxxya8s1d40G6jQ4heTiE4gFEFc2cKb22//BAXeD7474VbuiuJ22
   7BS4Hgj6RksfPVV4UGFUYeOC5xVLDX+xHFl4+M5sS0BDm1GqN/vFV8gV6
   WVbsDbRNtGSzx1r+4WcxuBlZeRrGS7d7Pmk0i+zp+STj8x/8cBxlnGsH2
   FeMzmWukEB7D7TcYwSQWBomeu+ws/CtZlTEn6ApnRRRiuTexTCybY02f6
   p00vLVEYNxcd8CoQKUsIQeKFf2TWj6LQAKlm3w8YPZsbrerJ3sgCiwBkZ
   O/ltHi0grfAQUj70CavAeQSXqRriGyMTXRKmPdzAJvp+OENyv2fbz88Ub
   g==;
X-CSE-ConnectionGUID: VeT5zk5BQsqlkRzs+BknJg==
X-CSE-MsgGUID: 2TGpRdYxQcOYma9HwRhRWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="237674627"
X-IronPort-AV: E=Sophos;i="6.23,191,1770562800"; 
   d="scan'208";a="237674627"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 18:57:26 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 308783FC6
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:26 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id D36E71800D43
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:25 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 5A6A714002C2;
	Tue, 21 Apr 2026 09:57:23 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 46/49] u-boot: upgrade 2026.01 -> 2026.04
Date: Tue, 21 Apr 2026 17:55:56 +0800
Message-ID: <20260421095559.1856-46-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260421095559.1856-1-wangmy@fujitsu.com>
References: <20260421095559.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235654

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc                       | 2 +-
 .../u-boot/{u-boot-tools_2026.01.bb => u-boot-tools_2026.04.bb} | 0
 .../recipes-bsp/u-boot/{u-boot_2026.01.bb => u-boot_2026.04.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/u-boot/{u-boot-tools_2026.01.bb => u-boot-tools_2026.04.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2026.01.bb => u-boot_2026.04.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 5e2ec08c30..574768b9f8 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -12,7 +12,7 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "127a42c7257a6ffbbd1575ed1cbaa8f5408a44b3"
+SRCREV = "88dc2788777babfd6322fa655df549a019aa1e69"
 
 SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master;tag=v${PV}"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2026.04.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb
rename to meta/recipes-bsp/u-boot/u-boot-tools_2026.04.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2026.01.bb b/meta/recipes-bsp/u-boot/u-boot_2026.04.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2026.01.bb
rename to meta/recipes-bsp/u-boot/u-boot_2026.04.bb
-- 
2.43.0


