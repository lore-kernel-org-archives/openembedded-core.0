Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 475C3D6CFCC
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 05:22:55 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.62024.1769145767226941455
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jan 2026 21:22:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JrSR6WgL;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769145768; x=1800681768;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0Zrp+WKvAhEyczEpC3Q1RblijL4nduck2Bdsgpgkz7k=;
  b=JrSR6WgLea//XduVmNX/3TX1SzR3PB6CTgGgjR3BGbQn7pQd0gK9sGjt
   EPXvhsWGp4Z2tdRHJFjyB91eTttB1SHKZ/2bFDMgojEjDZEAokvtfFE2T
   6oLkwpEbQ595O8mtI5/VhxoPn0k469S2QvEwy/jxyl3FHqbXU7XBb/PfE
   vldRP7obYvZduHJ/gr14Ws5t60ADPUiq0M7KMc6lGyoF7rgYvvZovd01u
   8SZh+WOXHBjO+/kmmnDJyMfVSg8So9RxYgIO90hbsQ32zjE9I/18vBSTJ
   yR4elx52B089nM3In7pwWqad2AvVV2MQOhpOjkLhvJGwUUuspr/Vk2Ist
   Q==;
X-CSE-ConnectionGUID: rdWF3Qd6Tf2/vgtoSdNjSA==
X-CSE-MsgGUID: DFh4G17sTYePXvobJ9SRaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="226786213"
X-IronPort-AV: E=Sophos;i="6.21,247,1763391600"; 
   d="scan'208";a="226786213"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 14:22:46 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 592121C1C702
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 05:22:45 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 0F1B114042EC
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 05:22:45 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id D68DA1400131
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 05:22:42 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/5] Investigate hotdoc and add a recipe to build it
Date: Fri, 23 Jan 2026 13:22:29 +0800
Message-ID: <20260123052234.970-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 05:22:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229860

Add new recipe hotdoc and its runtime dependence.

Liu Yiding (5):
  [OE-core][PATCH] hotdoc : Add new recipe

  Add following 4 recipes for runtime dependence of hotdoc.
  [OE-core][PATCH] python3-appdirs: Add new recipe 
  Move it from meta-openembedded to openembedded-core as it is required by hotdoc 0.17.4.
  [OE-core][PATCH] python3-schema: Add new recipe
  [OE-core][PATCH] python3-toposort: Add new recipe
  [OE-core][PATCH] python3-wheezy-template: Add new recipe

 ...ment_scanner-fix-function-prototypes.patch | 32 +++++++++
 ...y-backports-dependency-on-sufficient.patch | 72 +++++++++++++++++++
 .../hotdoc/0003-CMake-4-compatibility.patch   | 44 ++++++++++++
 meta/recipes-devtools/hotdoc/hotdoc_0.17.4.bb | 29 ++++++++
 .../python/python3-appdirs_1.4.4.bb           | 11 +++
 .../python/python3-schema_0.7.8.bb            | 10 +++
 .../python/python3-toposort_1.10.bb           | 10 +++
 .../python/python3-wheezy-template_3.2.4.bb   | 13 ++++
 8 files changed, 221 insertions(+)
 create mode 100644 meta/recipes-devtools/hotdoc/hotdoc/0001-c_comment_scanner-fix-function-prototypes.patch
 create mode 100644 meta/recipes-devtools/hotdoc/hotdoc/0002-avoid-third-party-backports-dependency-on-sufficient.patch
 create mode 100644 meta/recipes-devtools/hotdoc/hotdoc/0003-CMake-4-compatibility.patch
 create mode 100644 meta/recipes-devtools/hotdoc/hotdoc_0.17.4.bb
 create mode 100644 meta/recipes-devtools/python/python3-appdirs_1.4.4.bb
 create mode 100644 meta/recipes-devtools/python/python3-schema_0.7.8.bb
 create mode 100644 meta/recipes-devtools/python/python3-toposort_1.10.bb
 create mode 100644 meta/recipes-devtools/python/python3-wheezy-template_3.2.4.bb

-- 
2.43.0


