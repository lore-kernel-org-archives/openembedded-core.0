Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BCEBE78D64
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:04:26 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43857.1770627854435022946
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:04:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DIlBATE5;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770627853; x=1802163853;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zR1/AxbOCdmg0OcQTv2joYd6PyAvlv6PgmHkpNOSREc=;
  b=DIlBATE50dUHQXGQb6pmIfIaVFVedlqpJDD26ZgWExYxqfuKt7R7Bt9d
   Jw34ZonDH+d8ucXCvfPI5W6CrPIvcckkz+JPZIB2aOzru8yTM4AEy8cnJ
   Fl5llOLRKWhzQFtnHd0g9xgkOgEoHmRZPRtkKm7TbTTkQ61LMKgtzcu9I
   I9Qrtc+vpKarU04venV/6/cc0TmG4R8K6Eg941cXZ07mg2ceTrxbJKE4u
   jb6XpriFT7jMaEhT9mjk2tQuIZR/WNea8QPMbfOSBLO/QdUeMTWQwhVCc
   s87n2IvtiYIYKX4LoBgJxuQHMXYHwsq51GsOIrxJt/oKDto4Hp5NXauuL
   g==;
X-CSE-ConnectionGUID: DNKc774LRsaAzCXgDMt66w==
X-CSE-MsgGUID: ybSI+PsSRceZrDiDA/Wu3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="233142005"
X-IronPort-AV: E=Sophos;i="6.21,281,1763391600"; 
   d="scan'208";a="233142005"
Received: from unknown (HELO mail.fujitsu.com) ([20.61.8.234])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 18:04:11 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.fujitsu.com (Postfix) with ESMTPS id F1054730F
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:04:12 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id A78581800BE2
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:04:12 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 21D0D101A41E;
	Mon,  9 Feb 2026 09:04:09 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 27/39] python3-poetry-core: upgrade 2.3.0 -> 2.3.1
Date: Mon,  9 Feb 2026 17:03:05 +0800
Message-ID: <20260209090317.1468-27-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260209090317.1468-1-wangmy@fujitsu.com>
References: <20260209090317.1468-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:04:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230738

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Update list of supported licenses
- Fix an issue where platform_release could not be parsed on Windows Server

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-poetry-core_2.3.0.bb => python3-poetry-core_2.3.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-poetry-core_2.3.0.bb => python3-poetry-core_2.3.1.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-poetry-core_2.3.0.bb b/meta/recipes-devtools/python/python3-poetry-core_2.3.1.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-poetry-core_2.3.0.bb
rename to meta/recipes-devtools/python/python3-poetry-core_2.3.1.bb
index ce783d49df..47dd8f1771 100644
--- a/meta/recipes-devtools/python/python3-poetry-core_2.3.0.bb
+++ b/meta/recipes-devtools/python/python3-poetry-core_2.3.1.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=78c39cfd009863ae44237a7ab1f9cedc \
                     file://src/poetry/core/_vendor/tomli/LICENSE;md5=aaaaf0879d17df0110d1aa8c8c9f46f5 \
                     "
 
-SRC_URI[sha256sum] = "f6da8f021fe380d8c9716085f4dcc5d26a5120a2452e077196333892af5de307"
+SRC_URI[sha256sum] = "96f791d5d7d4e040f3983d76779425cf9532690e2756a24fd5ca0f86af19ef82"
 
 inherit python_poetry_core pypi
 
-- 
2.43.0


