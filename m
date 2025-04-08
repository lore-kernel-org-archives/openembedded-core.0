Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 536B1C369AD
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 00:52:16 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.64301.1744073532396091312
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 17:52:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MaONSf8N;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744073533; x=1775609533;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=cvgr0L5uCHDDr9D6hf3jXPWXWxAFfvazX0BAAmR1DnQ=;
  b=MaONSf8NIYufMI7EX+LedGzNCq6mZyzl8iSVCCVc7vXIeVhFj4df7lXm
   qFsBRHRYNor6FprmOXO69/lr9yhSw88VKUsokSQyV+eASYRkHEt2o6Tah
   xfKaAD/KitBaP/F7cbW/x50QY/jMxaWpusGTyWeGcsMlkMXZPkbA2aud9
   Ea3NAYnLRw7mEc4UoTC7FHdTB7unCTRxHZBrniaVaIzb/ZiiLEzbV8/0D
   /4wnM4WFpZ9mfZ8dJwmLhzXna8b0a9qrIE68ssXq5j6jP3FeoJzl/z1Bz
   gNt53pE1GPyRAo5ZbRWwI3gb1liaaiehKYG7b8LtX30Qt5nQCsgRjZIOw
   w==;
X-CSE-ConnectionGUID: lgAzAKMCT5ePpg1j/9LilA==
X-CSE-MsgGUID: bKs9BD27RWSMZrYknXIPIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="198495818"
X-IronPort-AV: E=Sophos;i="6.15,196,1739804400"; 
   d="scan'208";a="198495818"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 09:52:00 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5637EEAC01
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Apr 2025 09:51:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0AC24BF4AD
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Apr 2025 09:51:58 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E1D1F1A00A2;
	Tue,  8 Apr 2025 08:51:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 04/15] harfbuzz: upgrade 11.0.0 -> 11.0.1
Date: Tue,  8 Apr 2025 08:51:31 +0800
Message-Id: <1744073502-27695-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744073502-27695-1-git-send-email-wangmy@fujitsu.com>
References: <1744073502-27695-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 00:52:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214493

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../harfbuzz/{harfbuzz_11.0.0.bb => harfbuzz_11.0.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_11.0.0.bb => harfbuzz_11.0.1.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_11.0.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_11.0.1.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_11.0.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_11.0.1.bb
index ea0819af2b..8945467a00 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_11.0.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_11.0.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "f16351bafe214725fe2c1d5b59f0d93e49905a4b247899fb90d70cff953a2b9b"
+SRC_URI[sha256sum] = "4a7890090538136db64742073af4b4d776ab8b50e6855676a8165eb8b7f60b7a"
 
 DEPENDS += "glib-2.0-native"
 
-- 
2.43.0


