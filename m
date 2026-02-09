Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 778C8E78D4B
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:03:45 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43595.1770627822017911537
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:03:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Uj3DQA4h;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770627825; x=1802163825;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=O5OmAAUaF9gZ4LFJJ/Tu52t8Y8oK4i2SkrG6yTbTq80=;
  b=Uj3DQA4hPuHoUPAZx/FnDB8Ozln43JvoysQmv7L3lRknm1K8sRKtXMAL
   uderB7j6VrvdsKXKoHx6zohVOApRWI0LSmB08JOnkloPmFKrOFDa3HyJO
   MI2q1o3rlLP4tLGUh9KYvASlNtUqohTzyHBc3qX2dNx4vE1J217a1nSqj
   Otv3Sr+o3elpgdRR1Gn+oxqFaYmEETmGvBpoiXMZCPk1rjnwlSEytK2K6
   GSctKhQoXFJcxzXDsHC7BZ2RtUy+zHDdyJtZbMvX4QJdI7SkTHbcdvEfN
   4pSPngNvfoY38qTKVHKBQpvt/GhFxjEe2uIft72Czbbyvb5NYFyJ7eGlq
   Q==;
X-CSE-ConnectionGUID: 4OOW1I5cTYeS9i5IGTg0Cw==
X-CSE-MsgGUID: Z/eccUk5Tp27Argu/t/asA==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="216449698"
X-IronPort-AV: E=Sophos;i="6.21,281,1763391600"; 
   d="scan'208";a="216449698"
Received: from unknown (HELO mail.fujitsu.com) ([51.138.80.169])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 18:03:44 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.fujitsu.com (Postfix) with ESMTPS id 250587324
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:03:44 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id CDC111000477
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:03:43 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 43DB3101A419;
	Mon,  9 Feb 2026 09:03:40 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 11/39] libxext: upgrade 1.3.6 -> 1.3.7
Date: Mon,  9 Feb 2026 17:02:49 +0800
Message-ID: <20260209090317.1468-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260209090317.1468-1-wangmy@fujitsu.com>
References: <20260209090317.1468-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:03:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230722

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{libxext_1.3.6.bb => libxext_1.3.7.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxext_1.3.6.bb => libxext_1.3.7.bb} (89%)

diff --git a/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb b/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb
similarity index 89%
rename from meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb
rename to meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb
index 275926a885..3f28d78bdf 100644
--- a/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb
+++ b/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb
@@ -21,4 +21,4 @@ PE = "1"
 XORG_PN = "libXext"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "edb59fa23994e405fdc5b400afdf5820ae6160b94f35e3dc3da4457a16e89753"
+SRC_URI[sha256sum] = "6c643c7035cdacf67afd68f25d01b90ef889d546c9fcd7c0adf7c2cf91e3a32d"
-- 
2.43.0


