Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEC89C7EE39
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 09:13:37 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.35181.1751274813564732740
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 02:13:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rpaNJsV7;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751274814; x=1782810814;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=z+lkW2U6HUEZXxNcZOduswhHAQ1TeNboBfx6dP0Jc0M=;
  b=rpaNJsV7pWxGy3OQw5YO7t+DL1PX2/IBdy1bqvDO2R2PvxHe8lszD5o0
   HIm0KsAi9a55xZHbd7+kSYNkoQLIww6HcGQtyP6KfPtKavrHRyOs/zCrP
   gBRvcdK4B+Gzuutfzo/Lz8J7HBfaYUVRYKgVpyF/+REWYO1FoNJmcv5Dl
   Q7/03yteetwsCOj9oZjL62TsAzfL0ilNQAZcNu6KVhDt0ifJig7xTdqKl
   ULiCMt+TbOmKq83qmseyqruSU5KnKBlk41U+y0xaV9jpTxIhpR4yUYnWi
   Zbig5a4JJa4IruOvBco3q03hxpKan0VNdniFTstPuV7yVkdcbmeSfXPt9
   w==;
X-CSE-ConnectionGUID: lWSNxmZpQhiB+knM9bzehg==
X-CSE-MsgGUID: 7fu8VhpsSHOFubmBG6jzSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="192514731"
X-IronPort-AV: E=Sophos;i="6.16,277,1744038000"; 
   d="scan'208";a="192514731"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 18:13:34 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 8621821E9
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:34 +0000 (UTC)
Received: from oym-m2.gw.nic.fujitsu.com (oym-m2.gw.nic.fujitsu.com [10.85.9.162])
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTP id 061EDC00374
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:34 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 694DFBF3CB
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 18:13:33 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E11AA1A0078;
	Mon, 30 Jun 2025 17:13:32 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 37/37] ttyrun: upgrade 2.37.0 -> 2.38.0
Date: Mon, 30 Jun 2025 17:13:15 +0800
Message-ID: <20250630091315.1897-37-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250630091315.1897-1-wangmy@fujitsu.com>
References: <20250630091315.1897-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219496

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-core/ttyrun/{ttyrun_2.37.0.bb => ttyrun_2.38.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ttyrun/{ttyrun_2.37.0.bb => ttyrun_2.38.0.bb} (94%)

diff --git a/meta/recipes-core/ttyrun/ttyrun_2.37.0.bb b/meta/recipes-core/ttyrun/ttyrun_2.38.0.bb
similarity index 94%
rename from meta/recipes-core/ttyrun/ttyrun_2.37.0.bb
rename to meta/recipes-core/ttyrun/ttyrun_2.38.0.bb
index 507ad1b09e..2e2fa36851 100644
--- a/meta/recipes-core/ttyrun/ttyrun_2.37.0.bb
+++ b/meta/recipes-core/ttyrun/ttyrun_2.38.0.bb
@@ -7,7 +7,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f5118f167b055bfd7c3450803f1847af"
 
 SRC_URI = "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master"
-SRCREV = "793c037ded98cd001075cdb55a9c58e122380256"
+SRCREV = "660bab6e68fded26b2117e1dcec0844549a22fed"
 
 CVE_PRODUCT = "s390-tools"
 
-- 
2.43.0


