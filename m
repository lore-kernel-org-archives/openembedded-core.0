Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F745E78D74
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:04:36 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43647.1770627871043544978
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:04:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=eW8pNNB9;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770627875; x=1802163875;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Vx6QHGOvGM5xo5i9Zc6K2o6A8it6nvre8cKezQiGOLM=;
  b=eW8pNNB9MtDlJca8Gq38PpMqA3kzI/ZrDTf0HrI/0ql3t69+H0gg3tHA
   syzJrVQIfp79LU0Lk9ECXpayzsXZMeqyySClfuP6z1xHyKuIm3eV0+EE2
   8sc86WqvPHG9/bF++hvIAFHYZuYk0APdgS7fveEcBq1SlX1A+CEblmgIa
   td20qWd0lc8BoVYTrNYLkPfCP10NdbrWestbkxm0JSiQL6fGIFa1LtdbQ
   cksaTWbE4lSUuPfi38e2JGgp9OoFD7Zp3Xb68d0IjBPPh9hylPhb+C2Bl
   Qcomw4uew7UGbndhfOE3dR1jqIs3sSiLUkseTLGpPT/mjAmWSvH6tjfDi
   w==;
X-CSE-ConnectionGUID: oYXrDmgATaWDLO4rfPUduA==
X-CSE-MsgGUID: CJlhnVfvR3KRBTDrAkpeaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="216449943"
X-IronPort-AV: E=Sophos;i="6.21,281,1763391600"; 
   d="scan'208";a="216449943"
Received: from unknown (HELO mail.fujitsu.com) ([51.138.80.169])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 18:04:35 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.fujitsu.com (Postfix) with ESMTPS id C0A6D1000351
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:04:34 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 6041C8D29D2
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:04:34 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id BC417101A41A;
	Mon,  9 Feb 2026 09:04:31 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 39/39] vulkan-volk: upgrade 1.4.335.0 -> 1.4.341.0
Date: Mon,  9 Feb 2026 17:03:17 +0800
Message-ID: <20260209090317.1468-39-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260209090317.1468-1-wangmy@fujitsu.com>
References: <20260209090317.1468-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:04:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230750

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: copyright year upted to 2026

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{vulkan-volk_1.4.335.0.bb => vulkan-volk_1.4.341.0.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-volk_1.4.335.0.bb => vulkan-volk_1.4.341.0.bb} (86%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-volk_1.4.335.0.bb b/meta/recipes-graphics/vulkan/vulkan-volk_1.4.341.0.bb
similarity index 86%
rename from meta/recipes-graphics/vulkan/vulkan-volk_1.4.335.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-volk_1.4.341.0.bb
index b60a29b3d2..144e44969a 100644
--- a/meta/recipes-graphics/vulkan/vulkan-volk_1.4.335.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-volk_1.4.341.0.bb
@@ -7,10 +7,10 @@ BUGTRACKER = "https://github.com/zeux/volk"
 SECTION = "libs"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fb3d6e8051a71edca1e54bc38d35e5af"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=cfcbdd69e15396e371f639c69acf40bf"
 
-SRC_URI = "git://github.com/zeux/volk.git;branch=master;protocol=https"
-SRCREV = "4f3bcee79618a9abe79f4c717c50379197c77512"
+SRC_URI = "git://github.com/zeux/volk.git;branch=master;protocol=https;tag=vulkan-sdk-${PV}"
+SRCREV = "d979819fd03de3a7606d6e23d6ff4968942599da"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
 
-- 
2.43.0


