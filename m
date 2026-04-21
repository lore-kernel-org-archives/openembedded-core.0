Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBC67F8922B
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 09:57:24 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20410.1776765436410772096
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 02:57:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Hpc8JC3X;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776765436; x=1808301436;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Kv9YZ4WYfi0wI/YKVUUNNS94Ay03wHOQXtbvC7SkQjM=;
  b=Hpc8JC3XhCtgTHkZ6ZMIgZOTxJXwCsLuQyF/5T5IvYFZM4KWo5SvxSfM
   SxvWD96S0EkrRs7g02VLhWfJ06jSezM3FwrNvdTceR/s8DEE8UkpE7X/P
   469z9VsKd5Ksq1orC4vzTleah2qN+ur7Bhki7tagSkW85kl6jUwAmquyZ
   AF2ne++ZibOwn8QhKkcQ1jMttD8+pszmHTPkkB+03bKRWjyATygtcaYFI
   2x1URsVl4Yqxn6ZNbDXWPkeSUt5/FsMLsAYZLEggpEs9UAGaSCCKhTQG9
   0bnYzHN1TTif1hlXaBgUIcbE36QISzy3QD3saoC4eAvZV80DRZg4RkwNw
   A==;
X-CSE-ConnectionGUID: 3Vm1liAnSYa07b4rq26unw==
X-CSE-MsgGUID: LkK+86S/RyauAw5o0TnJyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="238404898"
X-IronPort-AV: E=Sophos;i="6.23,191,1770562800"; 
   d="scan'208";a="238404898"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 18:57:15 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 824D9304B
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:16 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 285E9C01289
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:16 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id A01A6140025F;
	Tue, 21 Apr 2026 09:57:13 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 40/49] python3-zipp: upgrade 3.23.0 -> 3.23.1
Date: Tue, 21 Apr 2026 17:55:50 +0800
Message-ID: <20260421095559.1856-40-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260421095559.1856-1-wangmy@fujitsu.com>
References: <20260421095559.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235648

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2026

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-zipp_3.23.0.bb => python3-zipp_3.23.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-zipp_3.23.0.bb => python3-zipp_3.23.1.bb} (69%)

diff --git a/meta/recipes-devtools/python/python3-zipp_3.23.0.bb b/meta/recipes-devtools/python/python3-zipp_3.23.1.bb
similarity index 69%
rename from meta/recipes-devtools/python/python3-zipp_3.23.0.bb
rename to meta/recipes-devtools/python/python3-zipp_3.23.1.bb
index 31420dcb83..45b83bf347 100644
--- a/meta/recipes-devtools/python/python3-zipp_3.23.0.bb
+++ b/meta/recipes-devtools/python/python3-zipp_3.23.1.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Backport of pathlib-compatible object wrapper for zip files"
 HOMEPAGE = "https://github.com/jaraco/zipp"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1aeae65f25a15b1e46d4381f2f094e0a"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2e21c3f75eb8d9427c8a611a8e83e9d6"
 
-SRC_URI[sha256sum] = "a07157588a12518c9d4034df3fbbee09c814741a33ff63c05fa29d26a2404166"
+SRC_URI[sha256sum] = "32120e378d32cd9714ad503c1d024619063ec28aad2248dc6672ad13edfa5110"
 
 DEPENDS += "python3-setuptools-scm-native python3-coherent-licensed-native"
 
-- 
2.43.0


