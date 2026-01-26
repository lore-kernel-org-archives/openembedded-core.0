Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA5F2CF65F3
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 12:35:56 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19060.1769430946698220224
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 04:35:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Vlw4aQ26;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769430945; x=1800966945;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iBj20+d5w4xPbMVf0BZUJx5mQrifeJrYyaiyMWoxD8Q=;
  b=Vlw4aQ26Yd+5cfqnnpjTnrEyKkncdyZ+IuF3DouNOwStWTSYupc8ExJ6
   Xx7Yh0PhAOx/n3hcIqJJW04GHOGafuXiYnZVHsTHTJrs4nVmwK6JClSdi
   L0/+K70g6IVXtWQ96VEj8dnfhKVaEu0uFHXbUaW0NV3hPSxawPhCYP95w
   B8b5aPop04RIdsOYDuQZJpIfbF0wMUQxpHMXhSO1ElV8hQPgMEnxaZomn
   p9ymVcKvhRZGYWMvntAM7lP84N1uDYvNeOaufVOCrCJXK0G1fxIyeAukp
   XsQdC+zoGXvq4ttn3QDnWDu0FdvHpBDNie1mCAxgdsKjZeKXZDzGJ0cOS
   w==;
X-CSE-ConnectionGUID: SEaOokSCSjyWBzBqqSNInQ==
X-CSE-MsgGUID: AeWHHvPoTeSmQn1b5GStfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="231175881"
X-IronPort-AV: E=Sophos;i="6.21,255,1763391600"; 
   d="scan'208";a="231175881"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 21:35:43 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 1C0468214DE
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 12:35:45 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id C8941C0183E
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 12:35:44 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 5221A405ABD;
	Mon, 26 Jan 2026 12:35:42 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 06/17] python3-markdown: upgrade 3.10 -> 3.10.1
Date: Mon, 26 Jan 2026 20:35:05 +0800
Message-ID: <20260126123517.1020-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260126123517.1020-1-wangmy@fujitsu.com>
References: <20260126123517.1020-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 12:35:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229989

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-markdown_3.10.bb => python3-markdown_3.10.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-markdown_3.10.bb => python3-markdown_3.10.1.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-markdown_3.10.bb b/meta/recipes-devtools/python/python3-markdown_3.10.1.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-markdown_3.10.bb
rename to meta/recipes-devtools/python/python3-markdown_3.10.1.bb
index 5be1576d20..91dac7abd1 100644
--- a/meta/recipes-devtools/python/python3-markdown_3.10.bb
+++ b/meta/recipes-devtools/python/python3-markdown_3.10.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=ec58cdf7cfed06a21f7a9362627a5480"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "37062d4f2aa4b2b6b32aefb80faa300f82cc790cb949a35b8caede34f2b68c0e"
+SRC_URI[sha256sum] = "1c19c10bd5c14ac948c53d0d762a04e2fa35a6d58a6b7b1e6bfcbe6fefc0001a"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.43.0


