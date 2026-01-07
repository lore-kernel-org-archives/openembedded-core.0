Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D922CD5849
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 10:31:34 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3120.1767781890510584717
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 02:31:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=J7ZQjA5h;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767781890; x=1799317890;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HfrHt4oe5M3nqTUWS+vuVwe5kuvB4imnzpkRjDtu9PA=;
  b=J7ZQjA5hDWcF5Eg69+N116taEij5hgfJWYFIJk14xbJ/oO2hgI39mUG8
   rb6ffKiRy0gmR3RW3B0U8m1xLK0KpjV3qrRslzOaEesnZbiN02auCq4LO
   S4YR2E2jdTaPYU3TZTeEYwpktg85vWQ6njiCxmHmqpKbV20MOx7/E6J3O
   W2GmcVyelJMjmh8v9KDbR+z0oA0O7EodIirUUmE5OyxxRhSlluTb9UujK
   c6QB/detn8O/vLKJblteoCD4wgDo9NRmjdUY2vNEukDtw9S0XokZafdcb
   XiZntziQOCDHjpnVs4O6MdNdoOlDK/O0Uur+syQGN1KgFjOzFw1WONHGz
   w==;
X-CSE-ConnectionGUID: S1LQknzxRHqqqfV/W0X5NQ==
X-CSE-MsgGUID: 8xYn1NXVQlqJ4dbGFUmC7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="229043541"
X-IronPort-AV: E=Sophos;i="6.21,207,1763391600"; 
   d="scan'208";a="229043541"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 19:31:28 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 0F5771002B85
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jan 2026 10:31:29 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id AE2E1C06BDA
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jan 2026 10:31:28 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id C6C92101BB5E;
	Wed,  7 Jan 2026 10:31:25 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 07/15] python3-cython: upgrade 3.2.3 -> 3.2.4
Date: Wed,  7 Jan 2026 18:30:54 +0800
Message-ID: <20260107103102.458-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260107103102.458-1-wangmy@fujitsu.com>
References: <20260107103102.458-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 10:31:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228977

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cython_3.2.3.bb => python3-cython_3.2.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cython_3.2.3.bb => python3-cython_3.2.4.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-cython_3.2.3.bb b/meta/recipes-devtools/python/python3-cython_3.2.4.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-cython_3.2.3.bb
rename to meta/recipes-devtools/python/python3-cython_3.2.4.bb
index f58b74f272..3e889857e1 100644
--- a/meta/recipes-devtools/python/python3-cython_3.2.3.bb
+++ b/meta/recipes-devtools/python/python3-cython_3.2.4.bb
@@ -7,7 +7,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=61c3ee8961575861fa86c7e62bc9f69c"
 
-SRC_URI[sha256sum] = "f13832412d633376ffc08d751cc18ed0d7d00a398a4065e2871db505258748a6"
+SRC_URI[sha256sum] = "84226ecd313b233da27dc2eb3601b4f222b8209c3a7216d8733b031da1dc64e6"
 
 inherit pypi setuptools3 cython
 
-- 
2.43.0


