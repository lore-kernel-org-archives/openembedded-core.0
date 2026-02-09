Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 841FDE78D49
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:03:45 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43832.1770627823802844902
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:03:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=l/gCUOMc;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770627823; x=1802163823;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pjH83H7BPRGwgR0aALxS9fULmxADEyVHPaQMBYyJL1w=;
  b=l/gCUOMcX8ZfJbY9H9HEdsNyzIlKdw709es9DXN9ecTodZU7OvPm8x+n
   7gk8cW9/g8LZonxgyw+NYI96V00QyiAdpT+yHypHpYagAqSSlVquieeHM
   4RyBtYp3eTsSIEsC65sWbl4r0Wt+bBOE56kw38hydHnyqD+DTRWmjkhdJ
   cuBbrNOi9XoAbTDfzNJvNrNKMhrSWcucdl1cn7DlPwZ1d/ACmAgTcjLuT
   2WJlSaESoHtgLwi1mGfS4MRabYf+iQSIQVjcinR9R5XlgdSWpLc5BoMTu
   V0LroDqBjDv+vk5MYmwEzEEqf8J1/Px7xpDnvlMlmApcwU9Noen+h2yEA
   g==;
X-CSE-ConnectionGUID: 9L+e7BNBQM2vSAjUzz0BeA==
X-CSE-MsgGUID: uk7UomhwQSebEsGUDvMsCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="229682039"
X-IronPort-AV: E=Sophos;i="6.21,281,1763391600"; 
   d="scan'208";a="229682039"
Received: from unknown (HELO mail.fujitsu.com) ([51.138.80.169])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 18:03:42 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.fujitsu.com (Postfix) with ESMTPS id 5A224407555
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:03:42 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 0CAE610000EA
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:03:42 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 6F305101BB75;
	Mon,  9 Feb 2026 09:03:39 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 10/39] libxdamage: upgrade 1.1.6 -> 1.1.7
Date: Mon,  9 Feb 2026 17:02:48 +0800
Message-ID: <20260209090317.1468-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260209090317.1468-1-wangmy@fujitsu.com>
References: <20260209090317.1468-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:03:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230721

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{libxdamage_1.1.6.bb => libxdamage_1.1.7.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxdamage_1.1.6.bb => libxdamage_1.1.7.bb} (91%)

diff --git a/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb b/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb
similarity index 91%
rename from meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb
rename to meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb
index 279d6c33dc..2602ee4680 100644
--- a/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb
+++ b/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb
@@ -23,6 +23,6 @@ PE = "1"
 
 XORG_PN = "libXdamage"
 
-SRC_URI[sha256sum] = "52733c1f5262fca35f64e7d5060c6fcd81a880ba8e1e65c9621cf0727afb5d11"
+SRC_URI[sha256sum] = "127067f521d3ee467b97bcb145aeba1078e2454d448e8748eb984d5b397bde24"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


