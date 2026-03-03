Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B636E67A98
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 10:10:17 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14976.1772532615545579492
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 02:10:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Git6ky/3;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772532616; x=1804068616;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=F3TLoxQlXpRdcPWoCjSPoztwPJKQ/Ehag+uopWtlkaw=;
  b=Git6ky/3XwoEekQ5BJjffRowqMtxlVaBHJAKgyEdx0YCB4FDEgtbVt76
   eItMszDgHjJlXYoP8/UF/BIiXO7wU8E/GZR9mHY/7ByPZ29pbEI1wcTmN
   la/c6X6AAkjwqXWv7FKPp3VhFcbLKeMym6pvtkA05r5cJ2p6nEdHnVD10
   VTdzzsZcgoNwHC7seYeinPmuTJgio9/6ULr0SkD6zulWewI8ZR03VDhos
   TZB+i67d/BXBnCBVbX8FOxP9MbdYE7kV9gM7igxsjRxHoziuxzx5gGkS2
   aJn0hmFYVSNHK0KIyVERrlTS3GJTCcyJ+VbEmUkoNublkYD9KCtHuiNLo
   A==;
X-CSE-ConnectionGUID: vIrHtWbmSUyQo/gzDqlu/A==
X-CSE-MsgGUID: 4ObjpL9fRcuParvc8qAifA==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="231722012"
X-IronPort-AV: E=Sophos;i="6.21,321,1763391600"; 
   d="scan'208";a="231722012"
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 0B9281C000BB
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 10:10:14 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id B32C31004143
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 10:10:13 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id E48951001CE3;
	Tue,  3 Mar 2026 10:10:10 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 17/23] rpm-sequoia-crypto-policy: upgrade to latest revision
Date: Tue,  3 Mar 2026 18:09:22 +0800
Message-ID: <20260303100929.1624-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260303100929.1624-1-wangmy@fujitsu.com>
References: <20260303100929.1624-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 10:10:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232293

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../rpm-sequoia/rpm-sequoia-crypto-policy_git.bb                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
index d368159df2..97d91f8ee1 100644
--- a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
@@ -10,7 +10,7 @@ inherit allarch python3native
 
 SRC_URI = "git://gitlab.com/redhat-crypto/fedora-crypto-policies.git;protocol=https;branch=master"
 
-SRCREV = "19878fea4c5f62208655e32269842bce55c819b2"
+SRCREV = "f3f5fa454345b03039ee3d904964fc14829637ce"
 UPSTREAM_CHECK_COMMITS = "1"
 
 do_compile () {
-- 
2.43.0


