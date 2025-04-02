Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C799AC3601C
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 09:08:08 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.3864.1743584884200706211
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 02:08:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BbWYygcf;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743584887; x=1775120887;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lSc/eTb4U3JO1nxRdW3zxXQ8o6gLqZUoy0yXO4hOzpA=;
  b=BbWYygcfgnuyUBcJBFfqmTAl2UiVxNMnRK9Koh82KVcyfxoj2kqDuiIx
   6zPzydb31pcukpmCLSTQizGF23HOje5Wal7DBeHKMhhO/FYpp1vbePSBx
   7zSlLVDS7T2blBvidofj6Pio9eUgIxKB6nKTKa8vVn9wWaIRZyhG/tVfE
   5c3xJ2S1dkxXe167t7n3mJvbYShKXApdfsKPJEjLXeJ0bNPdkhYayTOkp
   cpejlV67llfIMKQCYLb3qHPOalHgzJ+gVnBsMusDLo3md2QCoOi0fpPOc
   LXaBCFIKqrcHnOAJ0sFG4IUVrKxYc7DMyEwfh8e24XVx6Jlal4DeUUPx1
   Q==;
X-CSE-ConnectionGUID: wsPaMd0wQHeT5AVqMmNMPA==
X-CSE-MsgGUID: xNiuzH3zS4GsaicgSFMyuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="174667449"
X-IronPort-AV: E=Sophos;i="6.14,295,1736780400"; 
   d="scan'208";a="174667449"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 18:08:06 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id E5990D4810
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Apr 2025 18:08:03 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id A3FA1D52BA
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Apr 2025 18:08:03 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0A3CA1A0078;
	Wed,  2 Apr 2025 17:08:02 +0800 (CST)
From: Lei Maohui <leimaohui@fujitsu.com>
To: Alexander Kanavin <alex@linutronix.de>
Cc: Jose Quaresma <quaresma.jose@gmail.com>,
	Anuj Mittal <anuj.mittal@intel.com>,
	openembedded-core@lists.openembedded.org,
	Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [PATCH v4 08/10] gstreamer1.0-plugins-ugly: upgrade 1.24.12 -> 1.26.0
Date: Wed,  2 Apr 2025 17:07:47 +0800
Message-Id: <20250402090749.2119-9-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
In-Reply-To: <20250402090749.2119-1-leimaohui@fujitsu.com>
References: <20250402090749.2119-1-leimaohui@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 09:08:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214240

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 ...gins-ugly_1.24.12.bb => gstreamer1.0-plugins-ugly_1.26.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.24.12.bb => gstreamer1.0-plugins-ugly_1.26.0.bb} (94%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.0.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.12.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.0.bb
index 75f528216f..f0e42ad8fb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.0.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
 
-SRC_URI[sha256sum] = "19ed6eef4ea1a742234fb35e2cdb107168595a4dd409a9fac0b7a16543eee78b"
+SRC_URI[sha256sum] = "a86b51c8454a813120848c803421f327d8c07aabcae461e0597cc49398c0fcde"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
-- 
2.43.0


