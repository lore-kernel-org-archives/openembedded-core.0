Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB6A1C3ABBC
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:01 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.45917.1747040640301092208
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:04:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JwEK6NCY;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040640; x=1778576640;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ocOsWRaT2Gph9ndKkXgNeIvRVp5PN2ALLg8DCWgpO6c=;
  b=JwEK6NCY8uqPholEJs9lsHskJlE2taivay4V6ew4CGTv+xjs2571e4V9
   5jbXlj1e5g6Jd3Eoikt31M/sa4Sd4s8gLsopoQtSiq8PWImv70C1T1KBR
   xSXJuFgsMwp/qaXZFp8N3UskfwdbTFJ5pW28TpzKTcM/i9b2XKi/xvMGH
   /lDIbdC0JgtaKuDbUAcRwOoRcC8xj3joaafl6KXBXz2rG4md3XTuQl92K
   SVtHffkoFX+29zfJKaTK/8x7qtgDD62HupZ6X07pXr+KE97nfEDYDw30p
   pW32Th12boF5Yexf4JakLcmCtUnhz3+Hauwl/DLy1UaciAPOKdmMReX5T
   w==;
X-CSE-ConnectionGUID: x/xv0HcDQ1i04WGdPEM4Ew==
X-CSE-MsgGUID: 3Ho8szogSW2CcayiWHufEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="178046166"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="178046166"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:03:58 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0C6CFD5004
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id C2203CFBA4
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:55 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7FA091A00A0;
	Mon, 12 May 2025 17:03:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 15/56] ghostscript: upgrade 10.05.0 -> 10.05.1
Date: Mon, 12 May 2025 17:02:58 +0800
Message-Id: <1747040619-7566-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216315

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{ghostscript_10.05.0.bb => ghostscript_10.05.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/ghostscript/{ghostscript_10.05.0.bb => ghostscript_10.05.1.bb} (97%)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.05.0.bb b/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
similarity index 97%
rename from meta/recipes-extended/ghostscript/ghostscript_10.05.0.bb
rename to meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
index c0e2654701..8f132d55c6 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.05.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
@@ -28,7 +28,7 @@ SRC_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/downlo
            file://0001-Bug-708160-Fix-compatibility-with-C23-compilers.patch \
            "
 
-SRC_URI[sha256sum] = "56e77833de683825c420d0af8cb90aa8ba7da71ea6fb5624290cbc1b53fe7942"
+SRC_URI[sha256sum] = "121861b6d29b2461dec6575c9f3cab665b810bd408d4ec02c86719fa708b0a49"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+3"
-- 
2.43.0


