Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56959CAC58E
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 09:18:00 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.13239.1757495870108134427
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 02:17:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=c9okPoZd;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1757495871; x=1789031871;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jA989cdxscRSGlyr30HwKcmOrRKOqRQ8qBmoF0XuGQY=;
  b=c9okPoZdv64AXl3MH2CUHY9jgmy7elp7yreP0foPs1wuzNKDEtF7DxQk
   1s7gon1/sp2VhKH/Ffok/1RSqUslIXoeKWjwOM2lUVl0pj+544az/fGvp
   crI6DxdZwnSfLhxMGyxCxGRCTLy7Rgdcvhcdwbdf9nP0++IuvQLuhAMnk
   1LAyZO8hdq2njBrev2sVgKw/Q1MwfpSn5y4/Z5AxIWltjQT3i/j8LBDa8
   PiiAEo4cpTnCjRoQpXXcJ5H7MSSpustLaxsiaLVBqmbZxVdhu8E4sgkYO
   yM9NOTfg+ghqDsHc0Lg1PoF5M9Nls11NEV7Rxt1U7INg/SBqXr/uuYeRZ
   w==;
X-CSE-ConnectionGUID: RoDLwQbSSs6AI/8xKzeKeA==
X-CSE-MsgGUID: njSsCfgUS2G1Yj0shfgPAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="215907041"
X-IronPort-AV: E=Sophos;i="6.18,253,1751209200"; 
   d="scan'208";a="215907041"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 18:17:49 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 88C2D1C000BB
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:48 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 4589510001CD
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:48 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTPS id B0CCD100B79D
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:46 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A94C81A008B;
	Wed, 10 Sep 2025 17:17:43 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 33/40] python3-ruamel-yaml: upgrade 0.18.14 -> 0.18.15
Date: Wed, 10 Sep 2025 17:16:39 +0800
Message-ID: <20250910091646.998-33-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250910091646.998-1-wangmy@fujitsu.com>
References: <20250910091646.998-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:18:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223184

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-ruamel-yaml_0.18.14.bb => python3-ruamel-yaml_0.18.15.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-ruamel-yaml_0.18.14.bb => python3-ruamel-yaml_0.18.15.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.14.bb b/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.15.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-ruamel-yaml_0.18.14.bb
rename to meta/recipes-devtools/python/python3-ruamel-yaml_0.18.15.bb
index e7ac24abb8..f14d043f56 100644
--- a/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.14.bb
+++ b/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.15.bb
@@ -9,7 +9,7 @@ UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "7227b76aaec364df15936730efbf7d72b30c0b79b1d578bbb8e3dcb2d81f52b7"
+SRC_URI[sha256sum] = "dbfca74b018c4c3fba0b9cc9ee33e53c371194a9000e694995e620490fd40700"
 
 RDEPENDS:${PN} += "\
     python3-shell \
-- 
2.43.0


