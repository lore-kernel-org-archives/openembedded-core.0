Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 968F5CCFA1B
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:48:11 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3012.1762386486857325243
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:48:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=V1rHDLjK;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762386487; x=1793922487;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K/YgADDA/P5YvZbLEUgRWmwPDzl1yIEETnHjI0nI9MA=;
  b=V1rHDLjKhOlqk94TSQK5Qb+K1lJCTyk1MY9dF5RINNTrpwnFuelm9P/5
   Gi4Z+6WV7tNa6mSs8g5uQJdtGW64yafgYfovkhZq85EILV2unPu8h3/RJ
   to2Fznph5rRJLC7vAmb0S+EgUf5QSdGQsmKREutpam/r2hSJ/JGuEMT5V
   B12yM5G4Cg9iGi2yCihwZpngOEdyrUrqEpDfGOwaMw/w5G8hRFhiAbn5S
   FWrwIyCsqkmX5dg9M2dZffy7b6I0RPQu13gx3ew4SwbM0xigHLSeghRbR
   uPxe1BmnPwKtWl7baGIeoyRm18B5K6IrraDSIQ+H7gnVOx4Mu82YfUO+2
   w==;
X-CSE-ConnectionGUID: iXCeb0efS9C6s01fqYLjBg==
X-CSE-MsgGUID: qWPN0av+Qp20EIDA7bSmgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="217613216"
X-IronPort-AV: E=Sophos;i="6.19,283,1754924400"; 
   d="scan'208";a="217613216"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 08:48:05 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 587461002BB7
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Nov 2025 23:48:05 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 10F42C00740
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Nov 2025 23:48:05 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 9D3D814005BB;
	Wed,  5 Nov 2025 23:48:02 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 26/29] libcomps: upgrade 0.1.22 -> 0.1.23
Date: Thu,  6 Nov 2025 07:47:09 +0800
Message-ID: <20251105234712.446-26-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251105234712.446-1-wangmy@fujitsu.com>
References: <20251105234712.446-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:48:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225956

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libcomps/{libcomps_0.1.22.bb => libcomps_0.1.23.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/libcomps/{libcomps_0.1.22.bb => libcomps_0.1.23.bb} (94%)

diff --git a/meta/recipes-devtools/libcomps/libcomps_0.1.22.bb b/meta/recipes-devtools/libcomps/libcomps_0.1.23.bb
similarity index 94%
rename from meta/recipes-devtools/libcomps/libcomps_0.1.22.bb
rename to meta/recipes-devtools/libcomps/libcomps_0.1.23.bb
index 796b78ef65..0a9608297a 100644
--- a/meta/recipes-devtools/libcomps/libcomps_0.1.22.bb
+++ b/meta/recipes-devtools/libcomps/libcomps_0.1.23.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/libcomps.git;branch=master;t
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-SRCREV = "3f0d19b3c3273db4bf0497f08f22317835c1d426"
+SRCREV = "e75e85ffd2c7f2a2a96d8eaf45d8dc4f2c73153d"
 
 inherit cmake setuptools3-base
 
-- 
2.43.0


