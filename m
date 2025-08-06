Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3ACCC87FD1
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 08:56:20 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.20651.1754470569892347481
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Aug 2025 01:56:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Ew03T04V;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1754470571; x=1786006571;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+3SHQKGnyNt3XKx62fVHIOP+fVunvL5XH6aLeyaFYHc=;
  b=Ew03T04V7l1F/6kwq41f4VOGNARZzhQnYIz4BRftJbR1SET8mGtYI3Kp
   saSSFv42RRJYUNp4bZPoeW3tE6xWM552yM5+1YyZuOA3F6Mf0xKKlkNSl
   hHyQrbqyQK+OCz24vJrgJEec2StYBdvtCsX825p/OViWvbElnbGsABgea
   n8/WSrjozZzCr5WaiH1Dmwp1aHV9NfVVYUraJXM8ASQ/fjoFjT13t5XMT
   9t6qUzE8DK7i9KuhXSg0yXiNc4lv6EsGwQZ8XhmFCgvXxEosaceMU0OQ/
   RawgQDBodWcRZxAbHY6fNJC8U1N00qtV5qzqgxEscuyX3oMLh1kfoM1Mo
   w==;
X-CSE-ConnectionGUID: wHJn5AnXRo2LqyeDGI+daw==
X-CSE-MsgGUID: 6QJEWA12TXybtZGBIqsAOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="209137509"
X-IronPort-AV: E=Sophos;i="6.17,268,1747666800"; 
   d="scan'208";a="209137509"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 17:56:11 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 6C20A1002BB5
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Aug 2025 08:56:11 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 27210C05A2A
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Aug 2025 08:56:11 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTPS id 0D3072005D0E
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Aug 2025 08:56:09 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2F47E1A016A;
	Wed,  6 Aug 2025 16:39:41 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH 1/9] vulkan-headers: upgrade 1.4.313 -> 1.4.321
Date: Wed,  6 Aug 2025 16:39:21 +0800
Message-ID: <20250806083929.747-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 08:56:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221507

Changelog:
https://github.com/KhronosGroup/Vulkan-Headers/compare/vulkan-sdk-1.4.313.0...vulkan-sdk-1.4.321.0

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...{vulkan-headers_1.4.313.0.bb => vulkan-headers_1.4.321.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.4.313.0.bb => vulkan-headers_1.4.321.0.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.4.321.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.4.321.0.bb
index 1136e4795a..b3413b0e6b 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.4.321.0.bb
@@ -11,7 +11,7 @@ LICENSE = "Apache-2.0 & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=1bc355d8c4196f774c8b87ed1a8dd625"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https"
 
-SRCREV = "409c16be502e39fe70dd6fe2d9ad4842ef2c9a53"
+SRCREV = "2cd90f9d20df57eac214c148f3aed885372ddcfe"
 
 inherit cmake
 
-- 
2.43.0


