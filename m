Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BD39EB7ECE
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 11:03:04 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15443.1772622176092126408
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 03:02:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iQAIc6uW;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772622176; x=1804158176;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WEKiNNhuwVcS1xKTcf98H8yQmQwQt3WWBc5BKrIhIdM=;
  b=iQAIc6uWYj2A6T2Cum2nZe5FC1Be4Wd5nPtvNrmO+CuFg3CjH9sA7F9m
   FrZLgiBeYuMevuhj5f5aB5G8VzmCDN6tvfCjgHE5vARWS8sMQBThm2Ymg
   sy/JngzTf+cdQ9FMa4aeqqprD9FhgcOUqV3Myxorgw7mHMNPBB0gNFNTi
   fUVysoWQ7tmSRUC3zBhoV6EeVwza/TFjn3DCzJbqgQ66EPdvD+NUJQJFw
   /CLVltTctJ0k/ODoJb4R4Q0vAUOzDqhDq0a9LmJGa1xmUd11EfPYT6hAC
   nBE7ZssG9UsH9uAq56fDbhF2h4HGDZBZipj0NdUpWTCFN6y7jvaBkHMJC
   g==;
X-CSE-ConnectionGUID: +WLrSZVoSpqsG1BHsULxvg==
X-CSE-MsgGUID: zuDmm1jXR6Oa9N6IwhNg1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="219852911"
X-IronPort-AV: E=Sophos;i="6.21,323,1763391600"; 
   d="scan'208";a="219852911"
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.fujitsu.com (Postfix) with ESMTPS id 335AE1002B9F
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Mar 2026 11:02:54 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id DC1F71401267
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Mar 2026 11:02:53 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 014C3829ED1;
	Wed,  4 Mar 2026 11:02:50 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] vulkan-samples: upgrade to latest revision
Date: Wed,  4 Mar 2026 19:02:47 +0800
Message-ID: <20260304110247.1701-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 11:03:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232377

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index 64c7e0908c..66c034a794 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -9,7 +9,7 @@ SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=main;protoc
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "97fcdeecf2db26a78b432b285af3869a65bb00bd"
+SRCREV = "3abbdf8b5a3bf250f6475f9fe674567b14e9b1ad"
 
 UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
 
-- 
2.43.0


