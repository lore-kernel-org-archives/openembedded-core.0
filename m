Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A316E78D6F
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:04:36 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43644.1770627867174169420
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:04:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MH8bU78b;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770627866; x=1802163866;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RH4Y7o20nKhXRqZSPkNiEUjDGCETDURIS7+/A9azsR8=;
  b=MH8bU78bUokpl/NIzvaDsk8JsG1U7ENoumFXyh00kaU4mHg3/3aQKO8D
   CdmqcXLe9eY4+T3JkuB0FIsRLPYU+SjTG2pQ7K5nY8i27c2CxV40EhNR2
   zsNwGQXKQDjziyHD0s7PfZ1VD8xRI0l60mw95X8tiSZUChzEweX3nDLbz
   sEuT0lwlqapmLaBnEQRXKkyzxn/P1V1z5NbB1gmD5A0nwBvufr1ZF3k6s
   UmHVQDf8ZA7OAG0noO2j6LyIHzYlVXZypw2sYA+/iCL8kNavY7hp6Iu3z
   Yq3p7GYU6bNyfGyiWmBxXJ8y0zGz49niMej14hFbTciXk15qP3XWFIdU0
   Q==;
X-CSE-ConnectionGUID: jWRmgs+hSz2ixauAwv71ug==
X-CSE-MsgGUID: 8IoFajsmRQGJHNK90QrI8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="228980592"
X-IronPort-AV: E=Sophos;i="6.21,281,1763391600"; 
   d="scan'208";a="228980592"
Received: from unknown (HELO mail.fujitsu.com) ([51.138.80.169])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 18:04:24 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.fujitsu.com (Postfix) with ESMTPS id A11C8407555
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:04:25 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 5642E1802AD8
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:04:25 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id C0462101BB75;
	Mon,  9 Feb 2026 09:04:22 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 34/39] vulkan-headers: upgrade 1.4.335.0 -> 1.4.341.0
Date: Mon,  9 Feb 2026 17:03:12 +0800
Message-ID: <20260209090317.1468-34-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260209090317.1468-1-wangmy@fujitsu.com>
References: <20260209090317.1468-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:04:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230745

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ulkan-headers_1.4.335.0.bb => vulkan-headers_1.4.341.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.4.335.0.bb => vulkan-headers_1.4.341.0.bb} (91%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.4.335.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb
similarity index 91%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.4.335.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb
index de4012d26c..6dbb069325 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.4.335.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb
@@ -9,9 +9,9 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0 & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=1bc355d8c4196f774c8b87ed1a8dd625"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https;tag=vulkan-sdk-${PV}"
 
-SRCREV = "2fa203425eb4af9dfc6b03f97ef72b0b5bcb8350"
+SRCREV = "b5c8f996196ba4aa6d8f97e52b5d3b6e70f7e4e2"
 
 inherit cmake
 
-- 
2.43.0


