Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73116C8303D
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 09:13:38 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.35175.1751274807907310760
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 02:13:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Ew8/rBe5;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751274811; x=1782810811;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+/LAQJ1zo61wD/AsLUiMZ6V47OEdfZw8YXOoiyQy16o=;
  b=Ew8/rBe56PqTZh3LTVgNfsqpXVHFf8PlRtk9aCDS3iZjd7SR/3BEsE7d
   vrqZoXaZk6b1MrwmiiwBXziS8jci4jlCQFytZbFCd2/E6XESgiIPPVRjd
   pmhjseLD1n8sB45WV7nIxCJdFZPu/i5N7Rf5kLyVjrXWIP+8RUMUUiHeD
   kZd2m+EsfX3NpHw9ttYrWJgOGhBBImHGI2bLNH5zbKHVkknVlMDs75KfS
   +2esUalwKpEIugAmf3da4R//aQcvXab9h5q32QrXGIfVIM/SPX1HLIO3/
   CGBdn97IIqB2WCbBSqJ/3zhv+cKo8sQ10aXrbLnuqas9/Mai0SK9Lk6gF
   g==;
X-CSE-ConnectionGUID: fGL6YKgQQjGurftkUstBQg==
X-CSE-MsgGUID: tigwM7JaSiS+eJLpqrwzbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="204573495"
X-IronPort-AV: E=Sophos;i="6.16,277,1744038000"; 
   d="scan'208";a="204573495"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 18:13:30 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id BD924100034B
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:29 +0000 (UTC)
Received: from oym-m2.gw.nic.fujitsu.com (oym-m2.gw.nic.fujitsu.com [10.85.9.162])
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTP id 3D2DFC00374
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:29 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9B11EBF3C1
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 18:13:27 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 191F81A0074;
	Mon, 30 Jun 2025 17:13:27 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 19/37] libpng: upgrade 1.6.48 -> 1.6.49
Date: Mon, 30 Jun 2025 17:12:57 +0800
Message-ID: <20250630091315.1897-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250630091315.1897-1-wangmy@fujitsu.com>
References: <20250630091315.1897-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219481

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Added SIMD-optimized code for the RISC-V Vector Extension (RVV).
- Added various fixes and improvements to the build scripts and to
  the sample code.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libpng/{libpng_1.6.48.bb => libpng_1.6.49.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.48.bb => libpng_1.6.49.bb} (97%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.48.bb b/meta/recipes-multimedia/libpng/libpng_1.6.49.bb
similarity index 97%
rename from meta/recipes-multimedia/libpng/libpng_1.6.48.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.49.bb
index e603df1edd..c4af30be80 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.48.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.49.bb
@@ -14,7 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz \
            file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "46fd06ff37db1db64c0dc288d78a3f5efd23ad9ac41561193f983e20937ece03"
+SRC_URI[sha256sum] = "43182aa48e39d64b1ab4ec6b71ab3e910b67eed3a0fff3777cf8cf40d6ef7024"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
 
-- 
2.43.0


