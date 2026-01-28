Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 536ECD3566A
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 03:05:29 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5123.1769569523933846910
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jan 2026 19:05:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MZPGPJav;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769569524; x=1801105524;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DB1Bj6qUeEXPhSfqAZaLgfSug2D2QHC+By0pjDUwy9k=;
  b=MZPGPJavQRVDzbVK+WpbA3q1+2yVl7qn8zLOuxhEG6s5EbaLcFE/88ol
   45UJwsi/ptKq9P922AAVMI/Z+k8saOKkMfOVxe8t6tWANtmrUHC1ok6fg
   kDt77/rmRRJDue24Px2eP546pYmuQdbHZAFSDOFRbapa2Sit5HkqNrXwU
   al81UQaWSs1xq7aif1GpcqYvzbiCWqwkTgf81ZlrPyCYJmurNgtqKhMtK
   bkMlj4EO843HH5R4nRtR4gCOsBhpZiAhQOQYAngsQ64g055hmZBkxJHrE
   S+2q3f9anR+OPpdVZ8Kd/wKhRr9b/u0o1qCk3mJPRVQG/VH055BuNCBpZ
   g==;
X-CSE-ConnectionGUID: RYThkVEMRbmLtocLUjJpng==
X-CSE-MsgGUID: +pWki1uMSHKH6HQI83eGDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="227312981"
X-IronPort-AV: E=Sophos;i="6.21,258,1763391600"; 
   d="scan'208";a="227312981"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 12:05:22 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id F39C6100280E
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 03:05:21 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id AD14C8D65C3
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 03:05:21 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 2BEA3180714F;
	Wed, 28 Jan 2026 03:05:18 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] python3-pycparser: upgrade 2.23 -> 3.0
Date: Wed, 28 Jan 2026 11:05:15 +0800
Message-ID: <20260128030515.1116-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 03:05:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230071

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pycparser_2.23.bb => python3-pycparser_3.0.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pycparser_2.23.bb => python3-pycparser_3.0.bb} (74%)

diff --git a/meta/recipes-devtools/python/python3-pycparser_2.23.bb b/meta/recipes-devtools/python/python3-pycparser_3.0.bb
similarity index 74%
rename from meta/recipes-devtools/python/python3-pycparser_2.23.bb
rename to meta/recipes-devtools/python/python3-pycparser_3.0.bb
index a33a6553b4..c17be9b2d4 100644
--- a/meta/recipes-devtools/python/python3-pycparser_2.23.bb
+++ b/meta/recipes-devtools/python/python3-pycparser_3.0.bb
@@ -3,9 +3,9 @@ HOMEPAGE = "https://github.com/eliben/pycparser"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9761c3ffee7ba99c60dca0408fd3262b"
 
-SRC_URI[sha256sum] = "78816d4f24add8f10a06d6f05b4d424ad9e96cfebf68a4ddc99c65c0720d00c2"
+SRC_URI[sha256sum] = "600f49d217304a5902ac3c37e1281c9fe94e4d0489de643a9504c5cdfdfc6b29"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.43.0


