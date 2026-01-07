Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E48CCD5850
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 10:31:54 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3129.1767781912842666198
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 02:31:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=K3PfRIOI;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767781913; x=1799317913;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=t4AZNeKDvnNXTb2NwZPF36cj3KcQSJ407tEtPZlJN9Q=;
  b=K3PfRIOIk/k4KkjXQDhlFYa8d/ks3YKbBZxmSkpzOZCaY1lVIEA7gcXT
   iIjGNrrP3xs08EQlWrozwOdETxYPqUs+tluKh+bCFZJDx4t68x7euIox+
   PHwaQ9oLTR5bgYqcaPBXDvbwApD283wPfZb6vne+nzgPjP1sZ+S02Uwtk
   dCyk4G4r9cpemj72NAmd4dkfr6yzpHUalW+keaFzn5OiA78y2WoEYldSU
   PYI50rsSyXQr9ObC2fO+aONrPLWjB71pfBzUlyZyTCGhP+Y/Epmg2+zUK
   SCFJsjo5cT4FWuFF5yv6IdGIODlD51lw8xG6HTofr11HnaG18KrK6FTfS
   A==;
X-CSE-ConnectionGUID: fZ5GET6tRhyki215RpIAPg==
X-CSE-MsgGUID: k+o4OsxiT9CdDh+LY3fPow==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="225696418"
X-IronPort-AV: E=Sophos;i="6.21,207,1763391600"; 
   d="scan'208";a="225696418"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 19:31:51 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 5F4A3C00349
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jan 2026 10:31:51 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 1443A896E27
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jan 2026 10:31:51 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 374951017328;
	Wed,  7 Jan 2026 10:31:47 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 15/15] python3-uritools: upgrade 5.0.0 -> 6.0.1
Date: Wed,  7 Jan 2026 18:31:02 +0800
Message-ID: <20260107103102.458-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260107103102.458-1-wangmy@fujitsu.com>
References: <20260107103102.458-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 10:31:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228985

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-uritools_5.0.0.bb => python3-uritools_6.0.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-uritools_5.0.0.bb => python3-uritools_6.0.1.bb} (76%)

diff --git a/meta/recipes-devtools/python/python3-uritools_5.0.0.bb b/meta/recipes-devtools/python/python3-uritools_6.0.1.bb
similarity index 76%
rename from meta/recipes-devtools/python/python3-uritools_5.0.0.bb
rename to meta/recipes-devtools/python/python3-uritools_6.0.1.bb
index 35a8f2a0d9..718de87eab 100644
--- a/meta/recipes-devtools/python/python3-uritools_5.0.0.bb
+++ b/meta/recipes-devtools/python/python3-uritools_6.0.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/tkem/uritools/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e21bbe53b2730bfe1911cf381b81821e"
 
-SRC_URI[sha256sum] = "68180cad154062bd5b5d9ffcdd464f8de6934414b25462ae807b00b8df9345de"
+SRC_URI[sha256sum] = "2f9e9cb954e7877232b2c863f724a44a06eb98d9c7ebdd69914876e9487b94f8"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0


