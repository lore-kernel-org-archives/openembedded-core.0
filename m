Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C401CA0EED
	for <webhook@archiver.kernel.org>; Mon, 25 Aug 2025 03:51:35 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.31421.1756093892579772676
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Aug 2025 20:51:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MAAgerhN;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756093893; x=1787629893;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=R3Qj/bB2+w8EElPU2mbO2GpMWFhu9d1PHAunPSkNtlw=;
  b=MAAgerhNeLbXJfXNJww1ZysSKGLMsubgfW04PGgpsJ6FT0NaNNvDMDB/
   IQaZqTBOs9EcBL01cnNaIob1U7aGCXP4xn0rW4KTVu2t61jbfwH5IXlSH
   ec8ddLZJIoxcHVi+pB15PyEB8WGv0ScQ08M6Nb4DklC/A0tfu9AJFHFDI
   nfNCA+sEhmQ38NOTZmqNKa4i79Kylo0Zog0J0SCzoys8hSErnqfcMe1Vp
   1X4ETKUhmIg8lUr11tQXWFtwqVVPth2dD/Mr6ZQXY82uaKdb6SpA3VOeo
   mtU3b4GGw/jUyR5HvOhHFkLLMnyKAF3Lglt5DxmqUULh/18b6gHWudZG1
   g==;
X-CSE-ConnectionGUID: xqKjdEsPRRaxarejJWnQsQ==
X-CSE-MsgGUID: ltbIxAkNSkS4JvB5J90L3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="210520885"
X-IronPort-AV: E=Sophos;i="6.17,312,1747666800"; 
   d="scan'208";a="210520885"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 12:51:31 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 0250742A309
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 03:51:31 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id B2A91100010B
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 03:51:30 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTPS id A2FE61400103
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 03:51:28 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C3CDE1A0098;
	Mon, 25 Aug 2025 11:51:24 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH 08/10] python3-dtschema: upgrade 2025.6.1 -> 2025.8
Date: Mon, 25 Aug 2025 11:51:07 +0800
Message-ID: <20250825035109.797-8-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250825035109.797-1-liuyd.fnst@fujitsu.com>
References: <20250825035109.797-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 03:51:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222405

Changelog:
==========
- Add /chosen bootsource property
- Add /chosen KHO (for Linux kernel kexec) properties
- Extend wakeup-source property to define modes
- Add system level idle states
- Add '-db' property unit suffix

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...{python3-dtschema_2025.6.1.bb => python3-dtschema_2025.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dtschema_2025.6.1.bb => python3-dtschema_2025.8.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2025.6.1.bb b/meta/recipes-devtools/python/python3-dtschema_2025.8.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-dtschema_2025.6.1.bb
rename to meta/recipes-devtools/python/python3-dtschema_2025.8.bb
index 872084841b..9aba5f85ee 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2025.6.1.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2025.8.bb
@@ -7,7 +7,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "dtschema"
 
-SRC_URI[sha256sum] = "6348fb23961d0cd1c89ea0c29b790c622bc34fdd1be56090724c6c1f76cbf10d"
+SRC_URI[sha256sum] = "3c63b643fa76215b32cc6cbea9fd0dc7627dc71c67f3dca14fc04d70a7e1235e"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "\
-- 
2.43.0


