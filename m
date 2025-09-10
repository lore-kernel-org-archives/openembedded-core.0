Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3742DCAC58D
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 09:18:00 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.13240.1757495870992538970
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 02:17:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=D/9e7pEY;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1757495872; x=1789031872;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ub0F3xtuUA1OKh3pxfazd7/XE5z5pLuH0qGn9D5My4I=;
  b=D/9e7pEYBhcBK67S2oClxCp40V93J4IKdMpHXOXu6i57JZ2EyyDkyvV6
   ua1sIN3nAcuHqdCqiYlrTcUhHJDNlhRuNgpezjOwE2ywDIdzKY5tJeHrO
   t9kK9yHaKx/ncg9xgOrKqOhkBNlCZBRDPfQtZUxBNPGfu6ZHno2djiof8
   lTwZShjxLAfl0LrBcwo5oucBfFIBIzYwMq70ff5Fcznu6yl1iZ+zfw0uC
   JcAs20byHd50y1uRZ5T0HnV3Zhhk+3wiN3Yve7Ny3TI6yKGYALB9tDonj
   VkR+t6ASEKgv2ZIhAkJj2Cck033zu+Kcc9SrhDQ3+u7KsywosCavCM3Uj
   Q==;
X-CSE-ConnectionGUID: s4AohRsGQeSboQCLzf/Qeg==
X-CSE-MsgGUID: JjzYDyG3QKarpqCXlxI+ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="211787032"
X-IronPort-AV: E=Sophos;i="6.18,253,1751209200"; 
   d="scan'208";a="211787032"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 18:17:50 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 87EA3C00426
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:49 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 3D317C00898
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:49 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTPS id 8AF991013118
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:47 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 846211A0086;
	Wed, 10 Sep 2025 17:17:44 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 35/40] python3-xmltodict: upgrade 0.14.2 -> 0.15.1
Date: Wed, 10 Sep 2025 17:16:41 +0800
Message-ID: <20250910091646.998-35-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250910091646.998-1-wangmy@fujitsu.com>
References: <20250910091646.998-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:18:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223186

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-xmltodict_0.14.2.bb => python3-xmltodict_0.15.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-xmltodict_0.14.2.bb => python3-xmltodict_0.15.1.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-xmltodict_0.14.2.bb b/meta/recipes-devtools/python/python3-xmltodict_0.15.1.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-xmltodict_0.14.2.bb
rename to meta/recipes-devtools/python/python3-xmltodict_0.15.1.bb
index 56cdf6ff4a..a1d1bb47e4 100644
--- a/meta/recipes-devtools/python/python3-xmltodict_0.14.2.bb
+++ b/meta/recipes-devtools/python/python3-xmltodict_0.15.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/martinblech/xmltodict"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=01441d50dc74476db58a41ac10cb9fa2"
 
-SRC_URI[sha256sum] = "201e7c28bb210e374999d1dde6382923ab0ed1a8a5faeece48ab525b7810a553"
+SRC_URI[sha256sum] = "3d8d49127f3ce6979d40a36dbcad96f8bab106d232d24b49efdd4bd21716983c"
 
 PYPI_PACKAGE = "xmltodict"
 
-- 
2.43.0


