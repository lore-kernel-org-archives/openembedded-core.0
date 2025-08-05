Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AADB7C87FDA
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 10:24:21 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.22085.1754475859351654267
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Aug 2025 03:24:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IPhh4bPE;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1754475859; x=1786011859;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SLlTApWNTivBlUoLt6/E2AH3pg3sOCsny4dNCxnm/EA=;
  b=IPhh4bPEShP5+lwHsFNisQ1pLZRbMg3N7B3fPXOnLogWwvTUCT+615ih
   UQOsbHm18P4kdMwc0DAZ73AQpsX/LvaeNJ/vkooxpov400oQjd7DUx3W6
   bn8QJ6rka/rVmLBljt1Zxr9a5ABdxy/7Yqia2511LPDxm0IDJeHfmdmoE
   67tKAblF1vQ1ihHW62p9b5lIJ0sYeuFrmB3v2Ft5sRgESS0oVOqtEnsKW
   YxiCzsoSKbBmbdT46yJHaYEr7+RUovzlpzHhJ1rs38i6hApCEphW5R6ko
   XP4DvulI7NHIpGu3RbVhdA6v1/ZvRb7CaoC8njgx0SQsxXoVdUGfhUKWD
   Q==;
X-CSE-ConnectionGUID: cWK3lwN3R+mg935cWFZt6g==
X-CSE-MsgGUID: oNnTIZ0CTC6FJ7EDurNSxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="187483465"
X-IronPort-AV: E=Sophos;i="6.17,268,1747666800"; 
   d="scan'208";a="187483465"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 19:24:17 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 96ADB21E8
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Aug 2025 10:24:17 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 4C3991803202
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Aug 2025 10:24:17 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTPS id 0947B18004C2
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Aug 2025 10:24:15 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 205671A0111;
	Tue,  5 Aug 2025 17:06:44 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH 8/9] spirv-headers: upgrade 1.4.313 -> 1.4.321
Date: Tue,  5 Aug 2025 17:06:22 +0800
Message-ID: <20250805090624.711-8-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250805090624.711-1-liuyd.fnst@fujitsu.com>
References: <20250805090624.711-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 10:24:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221525

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


