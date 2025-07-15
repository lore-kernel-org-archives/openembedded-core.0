Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A9E7C83F22
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 08:08:46 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.2992.1752566917092300246
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 01:08:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kIEc2pHO;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1752566916; x=1784102916;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BbhdqG1HH3e/1Xl45jmtFp4Yi3vopnGLzuczTVK5g+o=;
  b=kIEc2pHOx2ziNihMh6C2l8kYX9Ca/jco7qYk0QK4VWx50OZjvNfdIFTv
   7SxN+dMaw/t0PHuC/Tsxa76zXrJsaWqb9lNOdLfBv9jPhDoB5KuoFtP/F
   MUGiRt3DWAJIdbXQiNBUdOAgdKSk0gruQsqQYvM4InokKuEjmW2vmzTfJ
   ccG+IyJV5m5dura9W7uvq9ripoFq5zFOCGqjXwZLtR0sxUTKy70z1q/k5
   m6opwUNDdkOZdliKtMF1YETHEN1I9qhcBEhH9ifB1A0hxVSOXb7O6gYtW
   Yw0Bil7X8e57z1pdkroY+0Rqmk7KKdv7WQOWX4mb/DzoDVicrNIX5W6dY
   w==;
X-CSE-ConnectionGUID: kvaIXYfUTNmYNZbArUVgvA==
X-CSE-MsgGUID: PHMZyVapS2WbHEmKdeNnCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="206892991"
X-IronPort-AV: E=Sophos;i="6.16,313,1744038000"; 
   d="scan'208";a="206892991"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 17:08:35 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 9662A8200B4
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:35 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id F0367C00891
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:34 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8DBA61A0073;
	Tue, 15 Jul 2025 16:08:31 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 16/19] taglib: upgrade 2.1 -> 2.1.1
Date: Tue, 15 Jul 2025 16:08:16 +0800
Message-ID: <20250715080819.622-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250715080819.622-1-wangmy@fujitsu.com>
References: <20250715080819.622-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220285

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/taglib/{taglib_2.1.bb => taglib_2.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/taglib/{taglib_2.1.bb => taglib_2.1.1.bb} (95%)

diff --git a/meta/recipes-support/taglib/taglib_2.1.bb b/meta/recipes-support/taglib/taglib_2.1.1.bb
similarity index 95%
rename from meta/recipes-support/taglib/taglib_2.1.bb
rename to meta/recipes-support/taglib/taglib_2.1.1.bb
index a337af74d0..6b700578b8 100644
--- a/meta/recipes-support/taglib/taglib_2.1.bb
+++ b/meta/recipes-support/taglib/taglib_2.1.1.bb
@@ -11,7 +11,7 @@ DEPENDS = "zlib utfcpp"
 
 SRC_URI = "http://taglib.github.io/releases/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "95b788b39eaebab41f7e6d1c1d05ceee01a5d1225e4b6d11ed8976e96ba90b0c"
+SRC_URI[sha256sum] = "3716d31f7c83cbf17b67c8cf44dd82b2a2f17e6780472287a16823e70305ddba"
 
 UPSTREAM_CHECK_URI = "https://taglib.org/"
 UPSTREAM_CHECK_REGEX = "taglib-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.43.0


