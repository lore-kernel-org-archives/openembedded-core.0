Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F6D7E78D4E
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:03:45 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43586.1770627811113719524
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:03:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fZ12ayb0;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770627817; x=1802163817;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+m7NPEZbTCP2ad//yvRB/BSJC5RVtLBdxSfKhZ8MTv8=;
  b=fZ12ayb0DHUEuSvbmU2yyXPBJjtGJFnfj/StB7xag8QLb/4rMSqxUH7W
   2dcifd7KhU9rIGhLtX6EESBtlGs2JMH6GiYQOlW/Ui5n+j9acrqr8lnhF
   JY9bR6A3MHjIiLJ6SzEvFkzfHDH0deLlf1OChdBMKoNXozLl2teH2glFO
   5XIqZ0WRhDtlV6+AVBqZNlrLkv1mtjGjcLHbINQDcf/QtpfEh0g0JtgqJ
   vL6cieYfVmibDOb050UF65MUD6aaJnUoc2zplvq+NfcuPtet/NSm4vBvn
   6if0Y7p5x/T0k9jLBZzbRBqiJ3gzzri8w3pzVRQnfqO/aBG5lWOqNLQRH
   Q==;
X-CSE-ConnectionGUID: K7oSS1aUTcmmCkiZF8qUJA==
X-CSE-MsgGUID: /QxJ6Z0TTRGZ9ntDWiGGnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="216965219"
X-IronPort-AV: E=Sophos;i="6.21,281,1763391600"; 
   d="scan'208";a="216965219"
Received: from unknown (HELO mail.fujitsu.com) ([51.138.80.169])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 18:03:37 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.fujitsu.com (Postfix) with ESMTPS id 2F7941C000F7
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:03:37 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id BFB16C008AE
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:03:36 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 191D3101A410;
	Mon,  9 Feb 2026 09:03:33 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 07/39] harfbuzz: upgrade 12.3.1 -> 12.3.2
Date: Mon,  9 Feb 2026 17:02:45 +0800
Message-ID: <20260209090317.1468-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260209090317.1468-1-wangmy@fujitsu.com>
References: <20260209090317.1468-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:03:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230718

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix padding `gvar` table during subsetting when the original font uses long
  format and subset font using short format.
- Various fuzzing fixes.
- Fix NULL pointer deference when malloc fails.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../harfbuzz/{harfbuzz_12.3.1.bb => harfbuzz_12.3.2.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_12.3.1.bb => harfbuzz_12.3.2.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_12.3.1.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb
index c22d6bd4b1..12bebc4bee 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "3ee7133f7f160b27bc34c058e147a559bb781c2b8208bc760db9fa9fa69cea07"
+SRC_URI[sha256sum] = "6f6db164359a2da5a84ef826615b448b33e6306067ad829d85d5b0bf936f1bb8"
 
 DEPENDS += "glib-2.0-native"
 
-- 
2.43.0


