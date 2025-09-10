Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A400ECAC587
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 09:17:39 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.13157.1757495854175001560
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 02:17:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tmU5UZ/K;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1757495854; x=1789031854;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1lKXXOmdoL5dGAZM4lkAIBPhsoUd3JSBXQzKF98K8ko=;
  b=tmU5UZ/KkZTJpEN3GAiQzLdC7p3xI5P6hAB9jwW0xv1bvdMqQtAxo8XB
   X/wa4Zi9rh2izetxIqj3gB7EgrtajFvN/GrykOUsk8x7L73hSWzjBLTgv
   YN3o4XXLhyxJotHMBVribTCzO6BgghZJPlqeCq0Jc8voqm0xm0ZbJeFr9
   r8y8ZCiQJdEWS+sa1tVtVL67/6D6nAD+Ngr63xfNY3uBMKvcJHigJ/BHC
   TOZK0Kw+z3VgeCMC6woLJo1dsFhw5KvBjL85assfzRNPeXtSdjutR+hdD
   0txxLsxz0iLUqf8P2TxMdOukqPy0sZVb5nGpHsTSQbF3MRYjQOJZdQOzx
   g==;
X-CSE-ConnectionGUID: lGn4ZFFIR92qhNafXCgfJg==
X-CSE-MsgGUID: zdTY7tSXRW25NXPntP4YIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="191384235"
X-IronPort-AV: E=Sophos;i="6.18,253,1751209200"; 
   d="scan'208";a="191384235"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 18:17:32 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id B25551000353
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:32 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 6D09F1800317
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:32 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTPS id D6D29100B7A3
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:30 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D73CE1A0078;
	Wed, 10 Sep 2025 17:17:27 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 15/40] libsolv: upgrade 0.7.34 -> 0.7.35
Date: Wed, 10 Sep 2025 17:16:21 +0800
Message-ID: <20250910091646.998-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250910091646.998-1-wangmy@fujitsu.com>
References: <20250910091646.998-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223166

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsolv/{libsolv_0.7.34.bb => libsolv_0.7.35.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.7.34.bb => libsolv_0.7.35.bb} (95%)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.34.bb b/meta/recipes-extended/libsolv/libsolv_0.7.35.bb
similarity index 95%
rename from meta/recipes-extended/libsolv/libsolv_0.7.34.bb
rename to meta/recipes-extended/libsolv/libsolv_0.7.35.bb
index 7e2bd686d4..ec74308bb5 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.34.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.35.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https;ta
            file://0001-utils-Conside-musl-when-wrapping-qsort_r.patch \
 "
 
-SRCREV = "262e8efa0239a78770910fde1579158725cc6ffa"
+SRCREV = "fb4b4340d46108cb365113e432642d6024886c7a"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


