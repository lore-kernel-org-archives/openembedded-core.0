Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D99EE78D53
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:03:45 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43813.1770627813248099554
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:03:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Gr3WB+yz;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770627811; x=1802163811;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0Sg/Y+WDfvStze12cmd5BoW3ZrvNXKJY45/76+PNVWI=;
  b=Gr3WB+yzYcGkwPYQvPfpAr5kwWWuMHUWIVAd8XypHVM0l+3bYM4Zd+gG
   zdL14IjTWfW9CQRYnOISU5Y3RVgwrRartOqNqiqmuLiyK0R+bmce1bsOz
   +Ia1FhsK8/8tHU4fTdNgYANn8wtesHiPIwRvssftzGJJrOKt/qFFg2VWX
   RvaeRXnJMdX52hbodkrkVSaNzOAJe8O5zLoQx9KP2JRoVwu8tGRG5OLxR
   0XP7fBvwZPxDh3FEOgFbLLLe7P1y8AiJZh2gT68kdiAMVLkKH3yGvxcWu
   BkIaGM9dd2wYPPd0BBOAVgCFf9of0rOTIr4YaOhCFkIYObDbnipKfcFj5
   w==;
X-CSE-ConnectionGUID: A5+8eGHaSRyDNvdYIpWEQA==
X-CSE-MsgGUID: 9zlfXQQBRiSPEIlmXG2Y4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="233141872"
X-IronPort-AV: E=Sophos;i="6.21,281,1763391600"; 
   d="scan'208";a="233141872"
Received: from unknown (HELO mail.fujitsu.com) ([20.61.8.234])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 18:03:30 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.fujitsu.com (Postfix) with ESMTPS id 89C71407545
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:03:31 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 3E40C10001DA
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:03:31 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id ADA65101A403;
	Mon,  9 Feb 2026 09:03:28 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 04/39] gi-docgen: upgrade 2025.5 -> 2026.1
Date: Mon,  9 Feb 2026 17:02:42 +0800
Message-ID: <20260209090317.1468-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260209090317.1468-1-wangmy@fujitsu.com>
References: <20260209090317.1468-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:03:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230715

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Parse method-inline for records, unions and interfaces
- Use dot's `svg_inline` output format
- Fix Red Hat Display italic font-face

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gi-docgen/{gi-docgen_2025.5.bb => gi-docgen_2026.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gi-docgen/{gi-docgen_2025.5.bb => gi-docgen_2026.1.bb} (91%)

diff --git a/meta/recipes-gnome/gi-docgen/gi-docgen_2025.5.bb b/meta/recipes-gnome/gi-docgen/gi-docgen_2026.1.bb
similarity index 91%
rename from meta/recipes-gnome/gi-docgen/gi-docgen_2025.5.bb
rename to meta/recipes-gnome/gi-docgen/gi-docgen_2026.1.bb
index 5338bca214..5d3fc40374 100644
--- a/meta/recipes-gnome/gi-docgen/gi-docgen_2025.5.bb
+++ b/meta/recipes-gnome/gi-docgen/gi-docgen_2026.1.bb
@@ -8,9 +8,9 @@ HOMEPAGE = "https://gnome.pages.gitlab.gnome.org/gi-docgen/"
 LICENSE = "GPL-3.0-or-later & Apache-2.0"
 LIC_FILES_CHKSUM = "file://gi-docgen.py;beginline=1;endline=5;md5=2dc0f1f01202478cfe813c0e7f80b326"
 
-SRC_URI = "git://gitlab.gnome.org/GNOME/gi-docgen.git;protocol=https;branch=main"
+SRC_URI = "git://gitlab.gnome.org/GNOME/gi-docgen.git;protocol=https;branch=main;tag=${PV}"
 
-SRCREV = "9eedfa6572cc9929583f926493751adb85805ffb"
+SRCREV = "3142afb34f5dee4889c92d3bc8ec2bd2aabb90b7"
 
 inherit python_setuptools_build_meta
 
-- 
2.43.0


