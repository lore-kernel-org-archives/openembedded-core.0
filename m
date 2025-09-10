Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E9FCCAC58F
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 09:18:00 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.13166.1757495870541028021
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 02:17:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=eTBO3nQ0;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1757495870; x=1789031870;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ah9bVnRP2vWwFd0WN2GSuBzVi/kkySpRtNIBeQ7R4X0=;
  b=eTBO3nQ0MFLxSk7Xbc0wE94V7RPF0E1QfhrkfMIIm+m6cu+aDGtN5bGH
   F3yMo/cxf0jp8RTF8vWNRtjZelUbH6v1OkH87ZisUHLN42kQwPQmulMOJ
   LLeW9gMFkaL7CHXkfU9MTQaJJZYzA2Kz6ZE+enwLtFDgFkukIEJSDrGLq
   zJH03q967WyJBJ5boVJWGtJx8iUeoK8J4W1tDITcSkZ85DrV+JNQTHaXg
   hw/2FzUN9sXLEpMuwlAJYgM7L69XUp5/qoUbrzvtAyeX7O0xX4Gn9ImC9
   O90xtkps5CYlNrpAFf0h3lJip47bhdATMae7+d6Mz2ezjFQTig7vyAOSx
   A==;
X-CSE-ConnectionGUID: 1QSHDm5bRJaJIJ18xrNC7Q==
X-CSE-MsgGUID: nv620IIpQgaS3rm3TUaWRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="199856649"
X-IronPort-AV: E=Sophos;i="6.18,253,1751209200"; 
   d="scan'208";a="199856649"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 18:17:49 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 1E21682070F
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:49 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id C8B0C8D65D3
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:48 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTPS id 27AD1100B79A
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:47 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1EED61A0087;
	Wed, 10 Sep 2025 17:17:44 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 34/40] python3-trove-classifiers: upgrade 2025.5.9.12 -> 2025.9.8.13
Date: Wed, 10 Sep 2025 17:16:40 +0800
Message-ID: <20250910091646.998-34-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250910091646.998-1-wangmy@fujitsu.com>
References: <20250910091646.998-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:18:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223185

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ..._2025.5.9.12.bb => python3-trove-classifiers_2025.9.8.13.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2025.5.9.12.bb => python3-trove-classifiers_2025.9.8.13.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2025.5.9.12.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2025.9.8.13.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2025.5.9.12.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2025.9.8.13.bb
index 68b09537bc..8586eddc70 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2025.5.9.12.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2025.9.8.13.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "7ca7c8a7a76e2cd314468c677c69d12cc2357711fcab4a60f87994c1589e5cb5"
+SRC_URI[sha256sum] = "2de91c8f286b7fea55072061924f69e7f3bdf7a9cb63719c90090e41c6657d3a"
 
 PYPI_PACKAGE = "trove_classifiers"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0


