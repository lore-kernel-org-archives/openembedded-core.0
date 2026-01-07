Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99CFDCD584D
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 10:31:54 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3127.1767781908513498581
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 02:31:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TXyg7asR;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767781908; x=1799317908;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WnY7upcXIyToJNzRvZVZMT9OXYtSSiGAHD7ul0P+G9c=;
  b=TXyg7asR+CR5psmGLHzkNN1zm89wg3VlztiwjVuvs1KnNBQokEGX4Qql
   NOLVFIPzoEer7e4E4Wxkwjazslgmp424mhkS5+c1/7Dzvn08+BSJasmbE
   PhFRltWwYJ5wKb+71PcI8OPpcNuEeLkC7GceTpFMkkq02z8ewaoDKWMBH
   JFvKWutOVAl3QdMpPhRjgD9GBdS5DQvFGSPk//e9qXcBkMXQZhNSKm5vo
   ahip7gKsjFdlIMR2meuuFhbwXC7os8kbaQbyYuxIMF/uNt6AEYiZBKMa5
   M1N420/lO6eiTAHWaTXrsE15ZGsO5EbyXCvnLMDgu1RpRgBGFFmzcCO1u
   A==;
X-CSE-ConnectionGUID: lYwM7l3vROibzhmmOy6X8A==
X-CSE-MsgGUID: GeQmJsIyToSKnOI7lzuNsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="204045691"
X-IronPort-AV: E=Sophos;i="6.21,207,1763391600"; 
   d="scan'208";a="204045691"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 19:31:47 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id F218C3FC0
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jan 2026 10:31:46 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id B19301005967
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jan 2026 10:31:46 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id EEED7101BB5E;
	Wed,  7 Jan 2026 10:31:43 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 13/15] python3-sphinx: upgrade 9.0.4 -> 9.1.0
Date: Wed,  7 Jan 2026 18:31:00 +0800
Message-ID: <20260107103102.458-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260107103102.458-1-wangmy@fujitsu.com>
References: <20260107103102.458-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 10:31:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228983

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-sphinx_9.0.4.bb => python3-sphinx_9.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinx_9.0.4.bb => python3-sphinx_9.1.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-sphinx_9.0.4.bb b/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-sphinx_9.0.4.bb
rename to meta/recipes-devtools/python/python3-sphinx_9.1.0.bb
index 00384b40e9..dc8ee18de1 100644
--- a/meta/recipes-devtools/python/python3-sphinx_9.0.4.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=e30c37a2b7fb0afa3adc0d72b85e8b04"
 
-SRC_URI[sha256sum] = "594ef59d042972abbc581d8baa577404abe4e6c3b04ef61bd7fc2acbd51f3fa3"
+SRC_URI[sha256sum] = "7741722357dd75f8190766926071fed3bdc211c74dd2d7d4df5404da95930ddb"
 
 inherit python_flit_core pypi
 
-- 
2.43.0


