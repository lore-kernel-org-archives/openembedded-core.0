Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17512E78D64
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:04:16 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43629.1770627851456854832
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:04:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IobS6yok;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770627852; x=1802163852;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Az6aF/9mVmdW25yUAOKWQ9toYE3HQvKcPmboz3rhoIw=;
  b=IobS6yokR1UGqchoi6eyPqTKYO2bfwZgxXKiR7urv4GCSHB3bUNHCyD1
   ZMg/FzNVF4t6K/zrDAfUjt0eyg9unve7bDylgZF76AohUpSRfx/CrynFH
   hI0LU4ZDKy0d/d0BjymN7FZvaOoeJ3pLUUUUCar6QgE73PYc2ptRyoT11
   xMZEdJJKJS2QOtVg7AtvIVbanC144QFT7Dxux0OLDd8dQoLlaxBwPfKo8
   uLfBZtXcl/sOBep3qm9rcs/az/cGO9qgj/vV0pbU+0DGrFTUPFElH54O1
   hZIx4zSIz1icdSPgEDI7sVFtzn1CM9tNZdxPkS33e0bhWQugCAuyJI6T2
   A==;
X-CSE-ConnectionGUID: F4xDIHISRzKT/BE9Nm/jnw==
X-CSE-MsgGUID: yOTxVilTQHexMNuigD4dOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="229013595"
X-IronPort-AV: E=Sophos;i="6.21,281,1763391600"; 
   d="scan'208";a="229013595"
Received: from unknown (HELO mail.fujitsu.com) ([20.61.8.234])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 18:04:09 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.fujitsu.com (Postfix) with ESMTPS id 75939407545
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:04:09 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 219B01C002F1
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:04:09 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 8480B101A415;
	Mon,  9 Feb 2026 09:04:06 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 25/39] python3-pdm-backend: upgrade 2.4.6 -> 2.4.7
Date: Mon,  9 Feb 2026 17:03:03 +0800
Message-ID: <20260209090317.1468-25-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260209090317.1468-1-wangmy@fujitsu.com>
References: <20260209090317.1468-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:04:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230736

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Allow user to override wheel with multiple plat tags
- Switch dev-dependencies to dependency-groups

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-pdm-backend_2.4.6.bb => python3-pdm-backend_2.4.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm-backend_2.4.6.bb => python3-pdm-backend_2.4.7.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-pdm-backend_2.4.6.bb b/meta/recipes-devtools/python/python3-pdm-backend_2.4.7.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-pdm-backend_2.4.6.bb
rename to meta/recipes-devtools/python/python3-pdm-backend_2.4.7.bb
index 95d8e3e4a4..d542909c50 100644
--- a/meta/recipes-devtools/python/python3-pdm-backend_2.4.6.bb
+++ b/meta/recipes-devtools/python/python3-pdm-backend_2.4.7.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4a564297b3c5b629a528b92fd8ff61ea"
 
-SRC_URI[sha256sum] = "5dd9cd581a4f18d57ff506a5b3aad7c8df31e5949b6fd854bbc34c38107e4532"
+SRC_URI[sha256sum] = "a509d083850378ce919d41e7a2faddfc57a1764d376913c66731125d6b14110f"
 
 inherit pypi python_pep517
 
-- 
2.43.0


