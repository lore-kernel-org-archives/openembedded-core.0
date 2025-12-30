Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDF59E95A69
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 09:18:19 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61210.1767086281468628028
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 01:18:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OLXWAi1Y;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767086280; x=1798622280;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=okZw4w5uz8sBVjW0pILFImc58Fc/xFF7Fq0pfMLNmfs=;
  b=OLXWAi1Yy+9sx8r3nTcjdYtygXUOTnMHssJbkjptpLFlJITAhBKtwP47
   9rD1TI9XTlvJOd/JOSIKzarI3ofRNhetWwi95Oe9sutXykMLg3GKKKPae
   YuyAajhRQS/lyrTrx3N+JNtCzxauIyXrcGyAsMXJn6aCupijzKIAwcnje
   3ZgyzAq356ogbIrDG96prOfz9yzbpu7yM26R0SNFrTRqlhW+MlidmJ7tq
   ERl23PPYMedzEytfn2oGAZeJZ0xqE50A4R1jgnHh9qy+NEr0CsspdVqEm
   qNYSTW9Z7mUaFSxkWLAldYRbPcD5k7hvJCPVinBH6FFZ/tcEG8PfSDVWm
   Q==;
X-CSE-ConnectionGUID: OjPbruYpRce+K5YaB00zRQ==
X-CSE-MsgGUID: DbN9ZwofSI6AslwUTY8uYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="203285012"
X-IronPort-AV: E=Sophos;i="6.21,188,1763391600"; 
   d="scan'208";a="203285012"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 18:17:58 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id E32931851
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 09:17:59 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id A7BA3C00406
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 09:17:59 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 2E4B11800135;
	Tue, 30 Dec 2025 09:17:56 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 12/12] xkbcomp: upgrade 1.4.7 -> 1.5.0
Date: Tue, 30 Dec 2025 17:17:13 +0800
Message-ID: <20251230091714.1501-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251230091714.1501-1-wangmy@fujitsu.com>
References: <20251230091714.1501-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 09:18:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228654

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-app/{xkbcomp_1.4.7.bb => xkbcomp_1.5.0.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-app/{xkbcomp_1.4.7.bb => xkbcomp_1.5.0.bb} (86%)

diff --git a/meta/recipes-graphics/xorg-app/xkbcomp_1.4.7.bb b/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb
similarity index 86%
rename from meta/recipes-graphics/xorg-app/xkbcomp_1.4.7.bb
rename to meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb
index f259f33dd8..67bed254ac 100644
--- a/meta/recipes-graphics/xorg-app/xkbcomp_1.4.7.bb
+++ b/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb
@@ -16,4 +16,4 @@ BBCLASSEXTEND = "native"
 EXTRA_OECONF += "--disable-selective-werror"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "0a288114e5f44e31987042c79aecff1ffad53a8154b8ec971c24a69a80f81f77"
+SRC_URI[sha256sum] = "2ac31f26600776db6d9cd79b3fcd272263faebac7eb85fb2f33c7141b8486060"
-- 
2.43.0


