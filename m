Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16E12CD98CC
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 09:50:23 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16559.1781085019107018032
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 02:50:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=AL9pOew7;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781085019; x=1812621019;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ms+E/4MMyPgrQtxPWoItkFfw7OwFIfU1pcIwAFZ6eKY=;
  b=AL9pOew74VSb+Qk4eLGL30u05zBham6qRkaDvUpnz7prZtM+w7YPKIIL
   XbxGfgEgDvn6y9/F1DhXYu4RuaSWFAX7HD8ywsFNhQF3uv7tHsJT1e+Fl
   Q9OFvm37KIIrwkLRc9uYY2gSJrcl7zfsle2EHi+S/95n/XsBzQKNsASV4
   fyR1Nix+FC1CKZBj+65UJZue7WIzthWE82QqA85IMCnCNvW/KUKbc45pw
   EIN87YXVbDOheS7B1ClOrQCupUYay+UrF3T2q08VJYHEYLloRXGYk1lPg
   eQtDdmsdn0HhgFlmEWOjk5lG7GMETS3D0m7U9s/gGOqoeCz3D1DB3yzGJ
   A==;
X-CSE-ConnectionGUID: hafTbpJRQ2+KKFUr0d8yXw==
X-CSE-MsgGUID: Ffs6+4f7T9uVX2xbcnAFlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="221348048"
X-IronPort-AV: E=Sophos;i="6.24,197,1774278000"; 
   d="scan'208";a="221348048"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 18:50:17 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id A5C411C01682
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:50:17 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (unknown [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 5F1A78412D8
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:50:17 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 82D8614000A3;
	Wed, 10 Jun 2026 09:50:15 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 15/16] mesa: upgrade 26.0.6 -> 26.1.2,26.0.6 -> 26.1.2
Date: Wed, 10 Jun 2026 17:49:30 +0800
Message-ID: <20260610094932.2264-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260610094932.2264-1-wangmy@fujitsu.com>
References: <20260610094932.2264-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:50:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238340

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 15dad6eedd..c5bbf13def 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -20,8 +20,8 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-gallivm-Fix-armhf-build-against-LLVM-22.patch \
 "
 
-SRC_URI[sha256sum] = "1d3c3b8a8363b8cc354175bb4a684ad8b035211cc1d6fa17aeb9b9623c513f89"
-PV = "26.0.6"
+SRC_URI[sha256sum] = "bac2bca9121897a2b8162e79636b50ac998fca799c8e6cf914edd85962babdf0"
+PV = "26.1.2"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


