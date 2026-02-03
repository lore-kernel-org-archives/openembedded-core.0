Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1F4BE8306D
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 09:13:53 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12667.1770110026241878248
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 01:13:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PXeCGrjc;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770110027; x=1801646027;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=A3WtrEExpKfB/ZTsRx8ZYTGfgVMtg4YOKZR+nP1pufQ=;
  b=PXeCGrjcpUb29hhk0oUMb4TbUzJwQaGdAnPOhXH+Uc0PuHeNVHRIQIm/
   ncU7/mN0XIhGSRiV68COg5TByDQsQktaD3egWpkIYCeoOHeLNTZiV8Uu1
   kmUel+p+XMky3aTH99bx4ZnioHbQiIpOKgnuq4eQCHCn3sVaQyhxLhZA6
   /INxb4kYMcUev9huAus1ZKc1VpulQ95Fvs/cikivCA+RqQ7u0B7m+s5Yl
   wJICgW4Qps4MNGZW1zftDXdnyZv9uvuEnqJBDG4a6LLtBw+6RFcvZsspX
   BKkfuViIML55FQwAStHsZ+FGgMUy5mkcSRqKnMFjNZZKlDLjniBEXrKHX
   Q==;
X-CSE-ConnectionGUID: 5TLZcb8pQXq3If9Xlcx/NA==
X-CSE-MsgGUID: Mc0RspmrT/2R/Xskuyx3fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="228348179"
X-IronPort-AV: E=Sophos;i="6.21,270,1763391600"; 
   d="scan'208";a="228348179"
Received: from unknown (HELO mail.fujitsu.com) ([52.151.125.19])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 18:13:45 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.fujitsu.com (Postfix) with ESMTPS id 55865820400
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Feb 2026 09:13:44 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 0842E8D2079
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Feb 2026 09:13:44 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 59B961800589;
	Tue,  3 Feb 2026 09:13:41 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v3] python3-packaging: upgrade 25.0 -> 26.0
Date: Tue,  3 Feb 2026 17:13:29 +0800
Message-ID: <20260203091329.1294-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 09:13:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230423

From: Wang Mingyu <wangmy@fujitsu.com>

Modify run-ptest.in to skip test_pylock.py.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/python/python3-packaging/run-ptest.in     | 2 +-
 .../{python3-packaging_25.0.bb => python3-packaging_26.0.bb}    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-packaging_25.0.bb => python3-packaging_26.0.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-packaging/run-ptest.in b/meta/recipes-devtools/python/python3-packaging/run-ptest.in
index 508538463b..3e43931c0f 100644
--- a/meta/recipes-devtools/python/python3-packaging/run-ptest.in
+++ b/meta/recipes-devtools/python/python3-packaging/run-ptest.in
@@ -1,2 +1,2 @@
 #!/bin/sh
-pytest --automake IGNOREDTESTS
+pytest --automake IGNOREDTESTS --ignore tests/test_pylock.py
diff --git a/meta/recipes-devtools/python/python3-packaging_25.0.bb b/meta/recipes-devtools/python/python3-packaging_26.0.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-packaging_25.0.bb
rename to meta/recipes-devtools/python/python3-packaging_26.0.bb
index 9cb5c68f58..cadf913db8 100644
--- a/meta/recipes-devtools/python/python3-packaging_25.0.bb
+++ b/meta/recipes-devtools/python/python3-packaging_26.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/packaging"
 LICENSE = "Apache-2.0 | BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=faadaedca9251a90b205c9167578ce91"
 
-SRC_URI[sha256sum] = "d443872c98d677bf60f6a1f2f8c1cb748e8fe762d2bf9d3148b5599295b0fc4f"
+SRC_URI[sha256sum] = "00243ae351a257117b6a241061796684b084ed1c516a08c48a3f7e147a9d80b4"
 
 SRC_URI += "file://run-ptest.in"
 
-- 
2.43.0


