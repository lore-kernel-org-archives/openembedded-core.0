Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7EADC87FCA
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 01:07:12 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.3859.1753232825063845697
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 18:07:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rdyTvBTU;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753232825; x=1784768825;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c7W1FognXhVs40/FvXmjt0wJGKZIpPppWGNEGjheXj8=;
  b=rdyTvBTUfYWbPNhTP1yQp+xmFwER7DEkttaynTs3+yhZd5R0wZfhAX/y
   jDHuSqP28x43oAM2UXnGcEN9N3iWG1XQ9RpWv/FnOKijuV13W++Gc3NOo
   00WqjAUiAuTfLy93zEUoxucOQKgjyv2n6HFGi/YIvSt+GEdp43yv9ihEl
   HVrD9FOL819R0vlAVgqRTpA1Q3HtsyuN4OWcqW3zl2O/AXsBokanFXfE1
   ORR+9d7X7jxW5I0LHAWtByCo2f/HlbNf4s94wHWNXujsIvQP25UFW5MXM
   m6X89/3VQrk0hNM7hbqvAGmMOnxxdIsFW6C12m+5bqPObpwCzO35Q+C5t
   Q==;
X-CSE-ConnectionGUID: mRdeZ/NiSUWdZXgtQq8flg==
X-CSE-MsgGUID: IF1qCfqTR9OkRXHYQsGCOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="185973636"
X-IronPort-AV: E=Sophos;i="6.16,333,1744038000"; 
   d="scan'208";a="185973636"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 10:07:03 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 763EE1002B9E
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 01:07:03 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id E1B9A8D65C8
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 01:07:02 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 06DAD1A0078;
	Wed, 23 Jul 2025 09:06:59 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH 11/12] wireless-regdb: upgrade 2025.02.20 -> 2025.07.10
Date: Wed, 23 Jul 2025 09:06:13 +0800
Message-ID: <20250723010614.926-11-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250723010614.926-1-liuyd.fnst@fujitsu.com>
References: <20250723010614.926-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 01:07:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220770

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...ireless-regdb_2025.02.20.bb => wireless-regdb_2025.07.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2025.02.20.bb => wireless-regdb_2025.07.10.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.02.20.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.07.10.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.02.20.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.07.10.bb
index 09fff768c4..decccad05a 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.02.20.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.07.10.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "57f8e7721cf5a880c13ae0c202edbb21092a060d45f9e9c59bcd2a8272bfa456"
+SRC_URI[sha256sum] = "a8340bcdcd1b5db6c79149879d122b170f3bb075381718d4f429ad831a6fa28d"
 
 inherit bin_package allarch
 
-- 
2.43.0


