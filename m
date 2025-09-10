Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69277CAC591
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 09:17:09 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.13221.1757495823526350494
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 02:17:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LC/vrvOS;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1757495825; x=1789031825;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dW1A/nioccJcjobnMy5ej6y6LPeketUq6FmQG/5+ons=;
  b=LC/vrvOS4WgEmMxLqNbubsr/4MX14SOI6nJgzcwbufXd/4Q88EtH4L0S
   v5Phz33vb/A5fT/5b4HOcS1tGq6XVBKH1q/u/RGtxJrZrdnPAkpsWinzD
   sbGAXCevtD42b+rydBr5cLExUTuPXZF74cxs0voV4nKkVNl/4m/oOrFoP
   tiOWZbYGwG1JxjDfUbIEsqwW9pY0kz9Wm9FOXNeXfHVr8VlAhTXa3xvyT
   /msq7/KZUndD3S7mz2o5TWZ9Z2g895ZQ1aiIZ2UFMPr2oCo15D9x9j7wq
   pJUkroVtnueqZKo93T+H33SyJc7e4zsvXWyUvjmWYZP0qOfDDJHCP+hGY
   A==;
X-CSE-ConnectionGUID: 6gFdSlIITFK81yeC7hV1Fg==
X-CSE-MsgGUID: UCfj0/0cRmaLIf0rBHqSSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="191384177"
X-IronPort-AV: E=Sophos;i="6.18,253,1751209200"; 
   d="scan'208";a="191384177"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 18:17:04 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id B842D100035E
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:04 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 729BA1000100
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:04 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTPS id E070882C0DC
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:02 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E34E61A0071;
	Wed, 10 Sep 2025 17:16:59 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 11/40] libatomic-ops: upgrade 7.8.2 -> 7.8.4
Date: Wed, 10 Sep 2025 17:16:17 +0800
Message-ID: <20250910091646.998-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250910091646.998-1-wangmy@fujitsu.com>
References: <20250910091646.998-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223161

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libatomic-ops_7.8.2.bb => libatomic-ops_7.8.4.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libatomic-ops/{libatomic-ops_7.8.2.bb => libatomic-ops_7.8.4.bb} (90%)

diff --git a/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb b/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.4.bb
similarity index 90%
rename from meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb
rename to meta/recipes-support/libatomic-ops/libatomic-ops_7.8.4.bb
index 00994dfae0..1007219294 100644
--- a/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb
+++ b/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.4.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libatomic_ops-${PV}.tar.gz"
 GITHUB_BASE_URI = "https://github.com/bdwgc/libatomic_ops/releases"
 
-SRC_URI[sha256sum] = "d305207fe207f2b3fb5cb4c019da12b44ce3fcbc593dfd5080d867b1a2419b51"
+SRC_URI[sha256sum] = "2356e002e80ef695875e971d6a4fd8c61ca5c6fa4fd1bf31cce54a269c8bfcd5"
 
 CVE_PRODUCT = "libatomic_ops"
 
-- 
2.43.0


