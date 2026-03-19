Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1001210854D2
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 10:15:15 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7746.1773915311781542428
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 03:15:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SooRbrAa;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773915312; x=1805451312;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tqEDlrmi67ttEeXmUQHP0aul5Mk73KHrou6uieJxgt8=;
  b=SooRbrAa39Yk3KlGGmqPqmr4FjIvHyB35PnR0YAJ8xi4s0fihnUEw7BC
   CGFuP6Gq76+2tPMJ+e2+AEBLK8JNdIZM8tkRS6893y/myMrBLWTayVgEc
   ytVMUEWFeIDxoqDWy7DBkE9nDZjXFpsunC1ZIPcSrmtkx8DDGec+IZWtD
   Sp/TUBNDbEHXlK3C9bF+uBzh0ssKVBHMmKVIHCE0j08hdH1J9cAmGuWyf
   inExdROOiRfvyoQP5sU+kJ7EukhRUpL43DhT3qBbcEup5HJwSJfSD3S08
   a9+hWFoGEd0b7t6mcXVEeQIQ/O6J/1k7K070qqYb7271/IFX5+o7WFuzB
   w==;
X-CSE-ConnectionGUID: 62tvZI2xTO2Xwx1Hqi3VvA==
X-CSE-MsgGUID: a/IamKweR8i13gnh2Io0Fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="212891285"
X-IronPort-AV: E=Sophos;i="6.23,129,1770562800"; 
   d="scan'208";a="212891285"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 19:15:10 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 4DA351000141
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:15:10 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id EA24C180CCF2
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:15:09 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 0BA5D101E523;
	Thu, 19 Mar 2026 10:15:06 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 25/40] python3-numpy: upgrade 2.4.2 -> 2.4.3
Date: Thu, 19 Mar 2026 18:13:17 +0800
Message-ID: <20260319101332.2067-25-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260319101332.2067-1-wangmy@fujitsu.com>
References: <20260319101332.2067-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:15:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233487

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- MAINT: Prepare 2.4.x for further development
- BUG: Fix some leaks found via LeakSanitizer
- MAINT: Synchronize 2.4.x submodules with main
- TYP: matlib: missing extended precision imports
- BUG: Fix weak hash function in np.isin().
- BUG: fix infinite recursion in np.ma.flatten_structured_array...
- BUG: Fix buffer overrun in CPU baseline validation
- BUG: Fix busdaycalendar's handling of a bool array weekmask....
- BUG: Fix reference leaks and NULL pointer dereferences
- MAINT: fix two minor issues noticed when touching the C API setup
- ENH: Test .kind not .char in np.testing.assert_equal
- BUG: fix type issues in uses if PyDataType macros
- MAINT: Don't use vulture 2.15, it has false positives
- MAINT: update openblas

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-numpy_2.4.2.bb => python3-numpy_2.4.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-numpy_2.4.2.bb => python3-numpy_2.4.3.bb} (97%)

diff --git a/meta/recipes-devtools/python/python3-numpy_2.4.2.bb b/meta/recipes-devtools/python/python3-numpy_2.4.3.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3-numpy_2.4.2.bb
rename to meta/recipes-devtools/python/python3-numpy_2.4.3.bb
index 8a9351e371..7521a93f99 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.4.2.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.4.3.bb
@@ -13,7 +13,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://run-ptest \
            file://0001-python-sysroot.patch \
            "
-SRC_URI[sha256sum] = "659a6107e31a83c4e33f763942275fd278b21d095094044eb35569e86a21ddae"
+SRC_URI[sha256sum] = "483a201202b73495f00dbc83796c6ae63137a9bdade074f7648b3e32613412dd"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
-- 
2.43.0


