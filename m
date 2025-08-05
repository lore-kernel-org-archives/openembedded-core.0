Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DEC8C87FD3
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 10:24:21 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.22084.1754475859199772092
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Aug 2025 03:24:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Gt74L5aP;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1754475859; x=1786011859;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VrxDZ6XTlORReDnQFXfHP2ma1sPsDUHWbXAZEBqpEpQ=;
  b=Gt74L5aPF4Tnow7png6EOZyY4pWrVn+26jptcdUH6MJbkd9OUGkNfrjv
   FPH5iE9suW9KQnvv9KWH0T+3qY7Rp4LJ5esGZyV8ZPJh2HL66qq3mPKVJ
   hKxMNuTJoe3Poiu+9KNaMhgrrd+Jil2OIcQZhf7chDd1T8ZOXjdkFrvJp
   rMehxWMVHhmitlv8AyCGDkEUlxJxczy6Pe4gNez+MO7zckjAsprByUnYQ
   CNgPrgCp1eR0Cy0SY2Vkz92OdJTwxRIIj4aQtlGU2xxe6mEDbOLG9JI2m
   8MNGBuU1PPjpoSvDB7pUJcVHUv+f45B280hVZiWeJ5uU+AoEkVjL221LN
   w==;
X-CSE-ConnectionGUID: 0aLbb0S3TO+h0If8i7JMgg==
X-CSE-MsgGUID: lc7HfaMATBitp3SgFxbGYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="196573999"
X-IronPort-AV: E=Sophos;i="6.17,268,1747666800"; 
   d="scan'208";a="196573999"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 19:24:17 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 601A08204D6
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Aug 2025 10:24:17 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 2066D14009D0
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Aug 2025 10:24:17 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTPS id 082C61001EE0
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Aug 2025 10:24:15 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5C19E1A010D;
	Tue,  5 Aug 2025 17:06:42 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH 4/9] vulkan-utility-libraries: upgrade 1.4.313 -> 1.4.321
Date: Tue,  5 Aug 2025 17:06:18 +0800
Message-ID: <20250805090624.711-4-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250805090624.711-1-liuyd.fnst@fujitsu.com>
References: <20250805090624.711-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 10:24:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221523

Changelog:
https://github.com/KhronosGroup/Vulkan-Utility-Libraries/compare/vulkan-sdk-1.4.313.0...vulkan-sdk-1.4.321.0

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...ies_1.4.313.0.bb => vulkan-utility-libraries_1.4.321.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-utility-libraries_1.4.313.0.bb => vulkan-utility-libraries_1.4.321.0.bb} (91%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.313.0.bb b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.321.0.bb
similarity index 91%
rename from meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.313.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.321.0.bb
index 1b38b6ec3a..54e8af6dcf 100644
--- a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.313.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.321.0.bb
@@ -9,8 +9,8 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=4ca2d6799091aaa98a8520f1b793939b"
 
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Utility-Libraries.git;branch=vulkan-sdk-1.4.313;protocol=https"
-SRCREV = "4e246c56ec5afb5ad66b9b04374d39ac04675c8e"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Utility-Libraries.git;branch=vulkan-sdk-1.4.321;protocol=https"
+SRCREV = "ec329e2721921f79743b90307ee047d08e057788"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
 
-- 
2.43.0


