Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA386108E1CF
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 10:19:35 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7927.1773915565485419288
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 03:19:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YBFVw4gQ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773915566; x=1805451566;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=orft2N07u8mJzLJA3OeWWR+KqxJKFBfAimeyk1bu97g=;
  b=YBFVw4gQP9SpU8kpxQk/VGdZUtIotiEW5YTBwNGnhf3PaS2N3dY2QH1n
   09Czht0VMCM5yVsdQeznIg5zqEIs2i296/CW15aHLxmd4Ss0QK+QO8tCJ
   3DPL64Twf6ENRqFbW1wGtmJu+ePQlNT3vCsY2549pru174GhE0dKPihLS
   LNSEvZbuep3XTBUbmwBn+PoGTukMSYaPftoY3D6R5q1GeNFuxvM6SNTc7
   b00vm80FsxEtR/yypWWTgisb+uJ5tedekj9J5FqmhAs/I6X/2sFKPBTH2
   Ord+1I55Fa7SX7Y94Qtg/aIKa2tzZn09kN9bL1xKLG+RLX+j4MJ0wcSA6
   w==;
X-CSE-ConnectionGUID: 1h7ZrJ7kQoyqeYvRo4FPFg==
X-CSE-MsgGUID: iTjynKFBSF+tKufZa0yzUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="233898138"
X-IronPort-AV: E=Sophos;i="6.23,129,1770562800"; 
   d="scan'208";a="233898138"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 19:14:11 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 8D2D31C0018F
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:14:10 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 3EE63100595C
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:14:10 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 5BE5F101E530;
	Thu, 19 Mar 2026 10:14:07 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 07/40] ell: upgrade 0.82 -> 0.83
Date: Thu, 19 Mar 2026 18:12:59 +0800
Message-ID: <20260319101332.2067-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260319101332.2067-1-wangmy@fujitsu.com>
References: <20260319101332.2067-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:19:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233501

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-core/ell/{ell_0.82.bb => ell_0.83.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.82.bb => ell_0.83.bb} (88%)

diff --git a/meta/recipes-core/ell/ell_0.82.bb b/meta/recipes-core/ell/ell_0.83.bb
similarity index 88%
rename from meta/recipes-core/ell/ell_0.82.bb
rename to meta/recipes-core/ell/ell_0.83.bb
index ec2b563035..b63d5a23a2 100644
--- a/meta/recipes-core/ell/ell_0.82.bb
+++ b/meta/recipes-core/ell/ell_0.83.bb
@@ -15,4 +15,4 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "133a9273151090b4cc37676063cc00ff350a093032ba20a2aaf8b3c5fd6f8b6d"
+SRC_URI[sha256sum] = "39a562f5ab2768e69da1ffbb1f98a8eb3483baffc7d2ef6adc3705e4fd4e53fb"
-- 
2.43.0


