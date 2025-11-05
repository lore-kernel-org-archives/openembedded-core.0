Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2868CCCFA0D
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:47:31 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2985.1762386442161077703
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:47:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jgXpnx4W;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762386442; x=1793922442;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3TxkRHKozuNWIyg6Gw44Vq2PiVT+GUopMp66VEz8zmY=;
  b=jgXpnx4Wv+DpsD8IrKUdrRb1smRDtU0dhBPGy3YtPAzv/PW86xJxgqFj
   6hAtpnjDMcSNxGenjb097ewI50x4IkhBXu3f3AfkgHTvIByO4STNkWLAC
   G3L6Rlmnxzqe88ei5GTpuB6TIc8pjhINYf54608mNwfjsTA54D0Vuwgqb
   gb4CfXDdMjbLMnu8bRfdZ/s8JiwamJ+W+YC19jLbBx1B4WO7jxuaJvpK0
   ZkZsA1OGzU4YIrqyBTPuW0VtyXP384Jni3MCxIWg3CpgqpoSaMjj0slpV
   B7w9SWn1Q0+G/8QI9QyCFsqaXAof4Xmn08O5IpZUgZCKsngXoPoocuuly
   w==;
X-CSE-ConnectionGUID: /9VXU4KITJqwaSe2WqDoPQ==
X-CSE-MsgGUID: O2045nQHRjuC7fPj4PZ6TA==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="206782190"
X-IronPort-AV: E=Sophos;i="6.19,283,1754924400"; 
   d="scan'208";a="206782190"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 08:47:20 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 8DFE7C00570
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Nov 2025 23:47:20 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 4CE96C008AC
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Nov 2025 23:47:20 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id D36AC14005BF;
	Wed,  5 Nov 2025 23:47:17 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 02/29] barebox-tools: upgrade 2025.09.0 -> 2025.10.0
Date: Thu,  6 Nov 2025 07:46:45 +0800
Message-ID: <20251105234712.446-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251105234712.446-1-wangmy@fujitsu.com>
References: <20251105234712.446-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:47:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225932

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
index e41d0858fd..8ad8e133a8 100644
--- a/meta/recipes-bsp/barebox/barebox-common.inc
+++ b/meta/recipes-bsp/barebox/barebox-common.inc
@@ -3,6 +3,6 @@ SECTION = "bootloaders"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 
-PV = "2025.09.0"
+PV = "2025.10.0"
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "7df1aa47bb7bf1763a729137ac773e69a4052812af094475d739fc63a9295f0d"
+SRC_URI[sha256sum] = "f7587d576637e46151333dff5bff0423869a5f9f6a9e4439c19c2429d983b84e"
-- 
2.43.0


