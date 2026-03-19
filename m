Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1A92107529D
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 10:14:44 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7733.1773915281638928073
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 03:14:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=I3BIvrsC;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773915281; x=1805451281;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=86OiS36X/22SIdaQB7oeq4/br1XeSxPVkGgdHYvMg0s=;
  b=I3BIvrsCCEHR8uvzG+mNsR7E5Hngq3BGnIs8NL4yXSLcFe2A3FQYPvXA
   nbI3Rtr4RZxlhGDI5nz5fWXouxE6cEurFtb0gl7sSDjf9vtVIf57zvd18
   Je6PBMlA4O4J0f+eR4rG3onZasriin42z/VxnMS0bjunE6c24dB3q9qeW
   r3KETUm8Hd+IFODICfChkuzQcVtjxmqruCq4ffmxD41wL28NINBtdxOWV
   VAmnLu038IAcgmyLTsBICBxYuTqS0tSVmEtlzTrYYDTP/WK9H017sqEKq
   2FLw1SIuRPOzbeeQb6SGqMazfqR1L+xyH0z8yu9kQ1QZpxtZhe+3zi8LG
   w==;
X-CSE-ConnectionGUID: 613nCQ/uTYaq90COqFfxiw==
X-CSE-MsgGUID: f/u3yuBmSb2rJrtZsSkKVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="222539925"
X-IronPort-AV: E=Sophos;i="6.23,129,1770562800"; 
   d="scan'208";a="222539925"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 19:14:40 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 405C042A31E
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:14:40 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id E2EC6C026E6
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:14:39 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 08C91101E52A;
	Thu, 19 Mar 2026 10:14:36 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 11/40] gsettings-desktop-schemas: upgrade 49.1 -> 50.0
Date: Thu, 19 Mar 2026 18:13:03 +0800
Message-ID: <20260319101332.2067-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260319101332.2067-1-wangmy@fujitsu.com>
References: <20260319101332.2067-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:14:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233479

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...esktop-schemas_49.1.bb => gsettings-desktop-schemas_50.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gsettings-desktop-schemas/{gsettings-desktop-schemas_49.1.bb => gsettings-desktop-schemas_50.0.bb} (84%)

diff --git a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_49.1.bb b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.0.bb
similarity index 84%
rename from meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_49.1.bb
rename to meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.0.bb
index 6705c967ca..5fda20c6c3 100644
--- a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_49.1.bb
+++ b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.0.bb
@@ -11,4 +11,4 @@ DEPENDS = "glib-2.0"
 
 inherit gnomebase gsettings gobject-introspection gettext
 
-SRC_URI[archive.sha256sum] = "777a7f83d5e5a8076b9bf809cb24101b1b1ba9c230235e3c3de8e13968ed0e63"
+SRC_URI[archive.sha256sum] = "358f07cb253727650e132805df3c69f7bf90448040bce171b6f6f2cb1b9c37ef"
-- 
2.43.0


