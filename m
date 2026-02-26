Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B07E1FD460F
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 03:39:47 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.62924.1772077177142812637
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Feb 2026 19:39:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JNrmBdTt;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772077177; x=1803613177;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JihzlkT2IK16WxHjq3HxRHyFbbWBtY59nAFWUPS1Zus=;
  b=JNrmBdTtwDfnqzRI2bp0/r+gHwZks00eSI8Zab7Kt8CCl21Zlvbugoul
   JIZD+UGtTCYG4391E1ivXpUSfH6vAJOfE7Re7PfqtsCGsnckZUF+LXbtq
   MakIVbfzcC4I5sgEbik5Yekj1T4nZzyvPBoE6FRKJK3lbTjKl2dmosTAf
   758MND8b3q5b2smKaLvkqt0CovBBx6LiXqJLptn+QR813ytZhH4jY6tVb
   yYc8H/r6qPwAypWbnjLHhEOZZCzJ7Ndwmmy1pIiYWSGPn6j6BYxMXBXND
   K7fsYxGVkSzggKYZbYwQss2tTaqOEQ/Nh07SXIpN9XnpALXhD5FnjQspk
   Q==;
X-CSE-ConnectionGUID: BiqOXr+lQ7S1ulBujhXlDw==
X-CSE-MsgGUID: zYoGgeg6TIqov9p0GZOClw==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="231777816"
X-IronPort-AV: E=Sophos;i="6.21,311,1763391600"; 
   d="scan'208";a="231777816"
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.fujitsu.com (Postfix) with ESMTPS id 4F0B8675D
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 03:39:35 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id F3FB31C00979
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 03:39:34 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id B110618021A9;
	Thu, 26 Feb 2026 03:39:27 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-rdflib: upgrade 7.5.0 -> 7.6.0
Date: Thu, 26 Feb 2026 11:39:23 +0800
Message-ID: <20260226033923.1353-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 03:39:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231984

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 7.6.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-rdflib_7.5.0.bb => python3-rdflib_7.6.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-rdflib_7.5.0.bb => python3-rdflib_7.6.0.bb} (71%)

diff --git a/meta/recipes-devtools/python/python3-rdflib_7.5.0.bb b/meta/recipes-devtools/python/python3-rdflib_7.6.0.bb
similarity index 71%
rename from meta/recipes-devtools/python/python3-rdflib_7.5.0.bb
rename to meta/recipes-devtools/python/python3-rdflib_7.6.0.bb
index e421aa2bac..f0ecfd70bb 100644
--- a/meta/recipes-devtools/python/python3-rdflib_7.5.0.bb
+++ b/meta/recipes-devtools/python/python3-rdflib_7.6.0.bb
@@ -2,9 +2,9 @@ SUMMARY = "RDFLib is a pure Python package for working with RDF"
 HOMEPAGE = "https://github.com/RDFLib/rdflib"
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=7006e973486c4700556f6d58cba0ab6c"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0ac0171cee5250c44d7d49847ae53a3e"
 
-SRC_URI[sha256sum] = "663083443908b1830e567350d72e74d9948b310f827966358d76eebdc92bf592"
+SRC_URI[sha256sum] = "6c831288d5e4a5a7ece85d0ccde9877d512a3d0f02d7c06455d00d6d0ea379df"
 
 inherit pypi python_poetry_core
 
-- 
2.43.0


