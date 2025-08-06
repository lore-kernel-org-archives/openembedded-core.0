Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 052CCC87FD3
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 08:56:21 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.20651.1754470569892347481
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Aug 2025 01:56:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=l+9lg4p1;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1754470575; x=1786006575;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SLlTApWNTivBlUoLt6/E2AH3pg3sOCsny4dNCxnm/EA=;
  b=l+9lg4p1XRP1tTSpTvv47kb805deRMQuTDCqKKB5hFho6qSEEtatTzui
   Pe6YLNex2xCsn1NJQymQqn8Y6ujmLwgbwyqhjRzqox0Ai6FIBny80fqbj
   9rU3u9qxh5O7XEWUmqXI0xpW7EdLhPKKB55Znk3Z2Vtx1iM9x9OyVZgTT
   Awx7vwywd0MwlumaQqY1rO7NZqo89FuIy9dFoGsJIwEwLlXDHAxw60UIo
   EKoL/Ww3DFL6KI2irK3Emf0a5EJv3RGZkf29VrYsdMs5lpXYaV+3Jp+XB
   8Xhi7F02zjai9Hr37Tc6nSmNMmyzbO5Ar0OL4sKg6CtlRzlwPvjOu5eD0
   w==;
X-CSE-ConnectionGUID: XoIimmp9TAi0VveO36Y7NA==
X-CSE-MsgGUID: wc63nbnxQlWbueTiL41Wmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="209137513"
X-IronPort-AV: E=Sophos;i="6.17,268,1747666800"; 
   d="scan'208";a="209137513"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 17:56:14 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 4B6E71C1C703
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Aug 2025 08:56:14 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 040418320CB
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Aug 2025 08:56:14 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTPS id CC9C1829EF6
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Aug 2025 08:56:11 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4733D1A0173;
	Wed,  6 Aug 2025 16:39:52 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH 8/9] spirv-headers: upgrade 1.4.313 -> 1.4.321
Date: Wed,  6 Aug 2025 16:39:28 +0800
Message-ID: <20250806083929.747-8-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250806083929.747-1-liuyd.fnst@fujitsu.com>
References: <20250806083929.747-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 08:56:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221511

License-Update: add CC-BY-4.0
Changelog:
https://github.com/KhronosGroup/SPIRV-Headers/compare/vulkan-sdk-1.4.313.0...vulkan-sdk-1.4.321.0

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...pirv-headers_1.4.313.0.bb => spirv-headers_1.4.321.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/spir/{spirv-headers_1.4.313.0.bb => spirv-headers_1.4.321.0.bb} (80%)

diff --git a/meta/recipes-graphics/spir/spirv-headers_1.4.313.0.bb b/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb
similarity index 80%
rename from meta/recipes-graphics/spir/spirv-headers_1.4.313.0.bb
rename to meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb
index a551814689..5365d64a99 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.4.313.0.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb
@@ -1,10 +1,10 @@
 SUMMARY = "Machine-readable files for the SPIR-V Registry"
 SECTION = "graphics"
 HOMEPAGE = "https://www.khronos.org/registry/spir-v"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d14ee3b13f42e9c9674acc5925c3d741"
+LICENSE = "MIT & CC-BY-4.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a0dcaa512cc2dee95fe0fd791ee83a18"
 
-SRCREV = "aa6cef192b8e693916eb713e7a9ccadf06062ceb"
+SRCREV = "2a611a970fdbc41ac2e3e328802aed9985352dca"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main"
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
-- 
2.43.0


