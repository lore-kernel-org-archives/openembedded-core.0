Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CEDBD0C83A
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 10:25:41 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55854.1768299935387222237
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 02:25:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Dh0y5RGv;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768299934; x=1799835934;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qluabeJRzQs8xnB9HOfwPGzektyKIHsV7rkJMsJrQ68=;
  b=Dh0y5RGvAlEy8RkOwGAhO0dR1yS/soItx+XTEN0OWKktob+bmN2lJXnq
   DXACtoPlDHn7vi+cI6jvPdybvv47rPJ56P0QiB7LBElzLgyiQNTXZI9L6
   0yg+2W79JPJABoRSmtKe3i/JctjYrcptx8IlH17KLQQHuzgMFQ7ChgRj6
   0WZE8hFSRPAAaNd5aZlH3C1k0lUMqS8dINVcoeRTno0nnvST0wSNbZz1C
   s2WW4ulgaRHKfDcb7qV6jTl1ZpH7PX3OHnb+mibPmNHbabMVZzh6e6TMd
   TKG6yqiP19vY1RZ2Yon9wN4Xl1WuaSibFCKPAOfhuzV3RDfSIfLpqX7fv
   g==;
X-CSE-ConnectionGUID: lvMJ+cfNTpeqvHlv++prgA==
X-CSE-MsgGUID: 4vPzCULER3atVndDSiaAXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="225654456"
X-IronPort-AV: E=Sophos;i="6.21,222,1763391600"; 
   d="scan'208";a="225654456"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 19:25:32 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 72579100034A
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:25:33 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 26EE7100137A
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:25:33 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 68868826FF8;
	Tue, 13 Jan 2026 10:25:30 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 08/18] libnotify: upgrade 0.8.7 -> 0.8.8
Date: Tue, 13 Jan 2026 18:24:58 +0800
Message-ID: <20260113102509.728-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260113102509.728-1-wangmy@fujitsu.com>
References: <20260113102509.728-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229247

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libnotify/{libnotify_0.8.7.bb => libnotify_0.8.8.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libnotify/{libnotify_0.8.7.bb => libnotify_0.8.8.bb} (93%)

diff --git a/meta/recipes-gnome/libnotify/libnotify_0.8.7.bb b/meta/recipes-gnome/libnotify/libnotify_0.8.8.bb
similarity index 93%
rename from meta/recipes-gnome/libnotify/libnotify_0.8.7.bb
rename to meta/recipes-gnome/libnotify/libnotify_0.8.8.bb
index 1bea8ae319..c3f71dec4a 100644
--- a/meta/recipes-gnome/libnotify/libnotify_0.8.7.bb
+++ b/meta/recipes-gnome/libnotify/libnotify_0.8.8.bb
@@ -20,7 +20,7 @@ inherit gnomebase gi-docgen features_check gobject-introspection
 # depends on gtk+3 if tests are enabled
 ANY_OF_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'tests', '${GTK3DISTROFEATURES}', '', d)}"
 
-SRC_URI[archive.sha256sum] = "4be15202ec4184fce1ac15997ece5530d2be32fe9573875aeb10e3b573858748"
+SRC_URI[archive.sha256sum] = "23420ef619dc2cb5aebad613f4823a2fa41c07e5a1d05628d40f6ec4b35bfddd"
 
 EXTRA_OEMESON = "-Dman=false"
 
-- 
2.43.0


