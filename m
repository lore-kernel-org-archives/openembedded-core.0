Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3159AF99C9C
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 09:56:33 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20448.1776765391279765449
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 02:56:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=O1sSDEJv;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776765391; x=1808301391;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RxTkjz/E4DXuxSd4J+BbS1AXr365Tn+fT0qZCIxJDpM=;
  b=O1sSDEJv1qxPFi+vACd/4ErSI19C7XFxmUFzfpiA2OQz5KMX15Xp8YEv
   htg94ZUtXW6lv2xZ5Ry7MHvUPr1GUofy7pCkgCjbRKf6KWsbJ3XZgWP/b
   ZJAsRSQ1J6g3rJhvITnSHAUWXDTnVYZc+7GPN1NzQM3KJS++U4wGSQMlN
   PQTfYBKYJ3FUUkfxtjlRMra6uQk90c4WB+0LY6xhlOPBFiaSddrHNljct
   MZb0MmJp4/JzozPjn62R69FAzl51x4y87LkaeDA3ogq3oU4n9JazS5I6H
   Rz3NfGkCg7WFxT1GcWb21RCUtYNvf+p9v2uwtxZKeo6kZDbv+lO4rVf3P
   w==;
X-CSE-ConnectionGUID: /tSn1y4nSuukiNYCHWaT7g==
X-CSE-MsgGUID: M2lixVf5SqyFGMDBcql5cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="216474289"
X-IronPort-AV: E=Sophos;i="6.23,191,1770562800"; 
   d="scan'208";a="216474289"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 18:56:29 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id B3AB31C00081
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:29 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 643F0C01285
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:29 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id D69DF140025F;
	Tue, 21 Apr 2026 09:56:26 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 13/49] gtk4: upgrade 4.22.1 -> 4.22.2
Date: Tue, 21 Apr 2026 17:55:23 +0800
Message-ID: <20260421095559.1856-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260421095559.1856-1-wangmy@fujitsu.com>
References: <20260421095559.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235621

From: Wang Mingyu <wangmy@fujitsu.com>

Bugs fixed:
- #8117 Docs for the new SVG parser?
- #8119 Wrong colors used for fallback symbolic icons containing classes
- #8125 svg: Animating hrefs does not work
- !9590 vulkan: fix GDK_VULKAN_FEATURE_SWAPCHAIN_MAINTENANCE check
- !9660 Various Vulkan fixes
- !9665 tests: fix libtestutils build under Windows.
- !9667 Update Serbian translation
- !9678 testsuite: Add dmabuf compare tests to needs-udmabuf suite
- !9681 dmabuf: Support dmabufs with fewer fds than planes
- !9682 Update Galician translation
- !9701 Update Turkish translation
- !9704 Update Catalan translation
- !9711 Load less icons as symbolics
- !9719 Fix traditional symbolic fallback
- !9736 svg: Fix invalidation
- !9739 Assorted backports

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-gnome/gtk+/{gtk4_4.22.1.bb => gtk4_4.22.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.22.1.bb => gtk4_4.22.2.bb} (97%)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb b/meta/recipes-gnome/gtk+/gtk4_4.22.2.bb
similarity index 97%
rename from meta/recipes-gnome/gtk+/gtk4_4.22.1.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.22.2.bb
index bbe595c376..f2cef8d13a 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.22.2.bb
@@ -33,7 +33,7 @@ LIC_FILES_CHKSUM = " \
     file://tests/testgtk.c;endline=25;md5=49d06770681b8322466b52ed19d29fb2 \
 "
 
-SRC_URI[archive.sha256sum] = "cd7b5a9c41127da6fb321c5a842ad73c62e6996f9ce3f1960ca509f6559d55fc"
+SRC_URI[archive.sha256sum] = "b1c987370a0c30780cde351bdbee02eef816728f1c1c2ec7c8093281c0709ee8"
 
 S = "${UNPACKDIR}/${GNOMEBN}-${PV}"
 
-- 
2.43.0


