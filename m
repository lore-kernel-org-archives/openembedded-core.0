Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4895C5B552
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 08:45:38 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.11649.1749026733202619838
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 01:45:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DRNhrqu2;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749026733; x=1780562733;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8klZwSi57NG5b5SAYhLkz3e/DwGROSVMl6i76QgBwFA=;
  b=DRNhrqu2nsSxfQiubwvmhLmktqzaS2G1YJM8cPQUlDP6yHnb9PDf5DDL
   O2Ssj/VtdocH1Sb0JA35cVqftP44eTD5GfgV81JVT7+obZvxfyb6+q+0s
   b/yAWWgh+5jkQRrwBlkGxVkRwnt2QDMTlw2cQWn/lRDLLyi85IDGlQF+n
   sBu11EtXAEVmKFAT9uiWBPJT4N36rhmxEcmbd/vd3FuVIHAabqnhErlZM
   /svKaqg0JsyyNQ77iyar5A9JTLH3Z5/LLQymZ56Vsjdl1I4Wx2oMbhnIG
   s6mpjmolEM0A/xJgSSHyWNbNUSd6FQOzXHZGqktAPztSRGZHdr/vIgeul
   Q==;
X-CSE-ConnectionGUID: nzkWP5z2TTeJdUUneMUQMg==
X-CSE-MsgGUID: KzOIIo8ISZG3kXdT2FVtCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="181182724"
X-IronPort-AV: E=Sophos;i="6.16,208,1744038000"; 
   d="scan'208";a="181182724"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 17:45:30 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id E9034D5051
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id A0516CFA44
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:27 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 197511A0078;
	Wed,  4 Jun 2025 16:45:27 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 02/45] barebox-tools: upgrade 2025.04.0 -> 2025.05.0
Date: Wed,  4 Jun 2025 16:44:40 +0800
Message-ID: <20250604084524.864-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250604084524.864-1-wangmy@fujitsu.com>
References: <20250604084524.864-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 08:45:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217849

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
index d6ea1eedfe..616da2a4ee 100644
--- a/meta/recipes-bsp/barebox/barebox-common.inc
+++ b/meta/recipes-bsp/barebox/barebox-common.inc
@@ -3,6 +3,6 @@ SECTION = "bootloaders"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 
-PV = "2025.04.0"
+PV = "2025.05.0"
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "3124f3c2b69d9ce0512b2d40fa17cace9c356f65f005a63da0474387b8839c41"
+SRC_URI[sha256sum] = "693f9aca90b282f6fb96024b70c06c9c57efe4eefe8e2298ef78eaa05c76fd5d"
-- 
2.43.0


