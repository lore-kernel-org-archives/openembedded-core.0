Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A89BDCCD1BC
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 02:06:48 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.10876.1761185207096268406
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Oct 2025 19:06:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pnhXAA3l;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761185208; x=1792721208;
  h=from:to:subject:date:message-id;
  bh=uoct+92ZOdC1ZlpuItSliHTXYdAzBSL/DOBmA5bLVD0=;
  b=pnhXAA3lRPBJAAvMuQfc0lsymrro2hAzgr6i6qdrMyFV+B7umC8nPjkx
   j26Hr0QlNR6sHj2xlVKpudPuRmIPu/uKMlgIQSAwAROcB0zeeAtI/KLyD
   YgyZIaB8UteLvp7doCyTGHDnEOrbPfMlu0Vy16GZ3nB4TxrphxKy+HP/W
   z5J9ivwRmK5kVqIZE81PXu1Wik28/CBAFT2zs84LJlcV2YDJVRBpPFuvY
   XKrRdLivDHnV3/oohl4LAXinEde31bzzd+YpIoH2dh0ZXW10HTJiFg8UO
   NlGlemQ8yn+/o4oMbnw1DRLDXupOMlKDJAeN21leGS1shte/T+AFDiJfe
   A==;
X-CSE-ConnectionGUID: wqyzrKOiTA6TUJatb9H7cQ==
X-CSE-MsgGUID: yK6/f/ptQqKvufw3OBdVVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="216826157"
X-IronPort-AV: E=Sophos;i="6.19,248,1754924400"; 
   d="scan'208";a="216826157"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 11:06:46 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 4BE5C1002B87
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 02:06:45 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 03184896E16
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 02:06:45 +0000 (UTC)
Received: from zhengrq-VirtualBox.fnst-internet.local (unknown [10.193.135.3])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 2B45B1400BDF
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 02:06:42 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2 v2] kea: Fix EXTRA_OE config to EXTRA_OEMESON and installation umask of meson
Date: Thu, 23 Oct 2025 10:06:34 +0800
Message-Id: <20251023020636.2817-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 02:06:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225214

*** BLURB HERE ***

Liu Yiding (2):
  Subject: [OE-core][PATCH 1/2 v2] kea: fix EXTRA_OE config to EXTRA_OEMESON
  Subject: [OE-core][PATCH 2/2 v2] kea: fix installation umask to 0022 of meson.

 meta/recipes-connectivity/kea/kea_3.0.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
2.43.0


