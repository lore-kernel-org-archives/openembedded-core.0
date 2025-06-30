Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0D4BC83031
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 09:13:37 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.35182.1751274813640470435
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 02:13:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Qd4CLRbv;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751274815; x=1782810815;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+cdBT49QmCZmykjz6LpAYf583kGoeXB70k6yKnPwBFg=;
  b=Qd4CLRbvcDiKhyYpSMvP5Y3dHproxgfjwbj4HvHFQ92zVv00nx96X6Zn
   YIvzcc1lmAOhNuTgQmWmA4knBC9OsmEpKKvTbIZVrbXrV/kTOAF8kdg+K
   r5F1PiWY6k6nt4cVmEAjW2B9IzSy3biorgTRJ6p7yy0y+vVH9h/qJVXR0
   xBTu5v/lyUi28E4eNsertJYU4Q/xbCvb/aoPTQ7nRB4ZNZ8w6/hSYgRca
   011AvNLg2pU7LBbBrw5h5RmlKyEj3+KBHxMgCCcIzRgofjbHjjkHwIK1K
   UbHvGZ0vSudDId1Hx7rhMxWcCaozkMTxhrmwnDB4Mzx4oESEET8fr3fdK
   w==;
X-CSE-ConnectionGUID: 5i0eeqf1QVy6RlFLwCDmSg==
X-CSE-MsgGUID: QsNPLtYpTkquTQVHYYNBDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="204535152"
X-IronPort-AV: E=Sophos;i="6.16,277,1744038000"; 
   d="scan'208";a="204535152"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 18:13:34 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 8D7A51000348
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:33 +0000 (UTC)
Received: from oym-m1.gw.nic.fujitsu.com (oym-m1.gw.nic.fujitsu.com [10.85.9.161])
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTP id 0E0D110000C1
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:33 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 74DD9F811D
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 18:13:31 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E90671A000B;
	Mon, 30 Jun 2025 17:13:30 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 31/37] python3-numpy: upgrade 2.3.0 -> 2.3.1
Date: Mon, 30 Jun 2025 17:13:09 +0800
Message-ID: <20250630091315.1897-31-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250630091315.1897-1-wangmy@fujitsu.com>
References: <20250630091315.1897-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219494

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-numpy_2.3.0.bb => python3-numpy_2.3.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-numpy_2.3.0.bb => python3-numpy_2.3.1.bb} (96%)

diff --git a/meta/recipes-devtools/python/python3-numpy_2.3.0.bb b/meta/recipes-devtools/python/python3-numpy_2.3.1.bb
similarity index 96%
rename from meta/recipes-devtools/python/python3-numpy_2.3.0.bb
rename to meta/recipes-devtools/python/python3-numpy_2.3.1.bb
index 34a14f7ca6..bc718d37c4 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.3.0.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.3.1.bb
@@ -12,7 +12,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://fix_reproducibility.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "581f87f9e9e9db2cba2141400e160e9dd644ee248788d6f90636eeb8fd9260a6"
+SRC_URI[sha256sum] = "1ec9ae20a4226da374362cca3c62cd753faf2f951440b0e3b98e93c235441d2b"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
-- 
2.43.0


