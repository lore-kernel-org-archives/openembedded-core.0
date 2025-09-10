Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C501CAC592
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 09:17:50 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.13234.1757495861422443382
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 02:17:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DbJHw3MM;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1757495866; x=1789031866;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OL3JPqG50OhewVIknBNldCaFNlBEGiBF6qxBeoyrqaQ=;
  b=DbJHw3MMsI+XoYCmlHxyaoFfmTr2XRcjF4eWoODwOgP6tfsPeaIFVgef
   mAm24ulTT0PZe1ONIMDD1gCtxDNzw/WjSx1SZ68e9r0m8dnwhBlqH4yEU
   H9kGDXOdZi5ooInVR79nWNQjBqJ6kVBU+ED2qMkFBzFuE4UhnRfG4LJC3
   WAtTahDaxnt4SIj1iZMufP4LrL39Aj5sqVr53t3K71wzLx56HPp8UA8XI
   dfmCfzP5mL/0ZQt3RHUBNx2nQy10nrU/+NpUAwytcIvQJEg1kxyqqq/9H
   B9En57ASvoFhfCSiszrdg2iwz6MawsbSylYBYYoXyXBguC+AW/MCnWz9l
   w==;
X-CSE-ConnectionGUID: 8Zwp8H5bQdWhF76cjL0RBw==
X-CSE-MsgGUID: NKF83FT0SSy6avshlS/Amg==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="191384255"
X-IronPort-AV: E=Sophos;i="6.18,253,1751209200"; 
   d="scan'208";a="191384255"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 18:17:45 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 792041000354
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:45 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 2E0081800BCE
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:45 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTPS id 882DA1005126
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:43 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9AC3E1A0087;
	Wed, 10 Sep 2025 17:17:40 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 29/40] python3-jsonschema-specifications: upgrade 2025.4.1 -> 2025.9.1
Date: Wed, 10 Sep 2025 17:16:35 +0800
Message-ID: <20250910091646.998-29-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250910091646.998-1-wangmy@fujitsu.com>
References: <20250910091646.998-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223179

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...025.4.1.bb => python3-jsonschema-specifications_2025.9.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jsonschema-specifications_2025.4.1.bb => python3-jsonschema-specifications_2025.9.1.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.4.1.bb b/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.9.1.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-jsonschema-specifications_2025.4.1.bb
rename to meta/recipes-devtools/python/python3-jsonschema-specifications_2025.9.1.bb
index 53805b0396..5ad761bad3 100644
--- a/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.4.1.bb
+++ b/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.9.1.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://pypi.org/project/jsonschema-specifications/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=93eb9740964b59e9ba30281255b044e2"
 
-SRC_URI[sha256sum] = "630159c9f4dbea161a6a2205c3011cc4f18ff381b189fff48bb39b9bf26ae608"
+SRC_URI[sha256sum] = "b540987f239e745613c7a9176f3edb72b832a4ac465cf02712288397832b5e8d"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


