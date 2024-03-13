Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BEBAC54E66
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 07:09:19 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.10795.1710313756815801104
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 00:09:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=O9IiNO3G;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710313756; x=1741849756;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=48xwX4nRCXJ4Ap6S+A+0yQgf26yRA6b3tosFxqS+RhU=;
  b=O9IiNO3Goxxb7bIx52/VXSDQyKZ9Bf0Jcxyh1udTyB4qRWVUSlG9X3l9
   UgQs4uQX2/l0uNqIm+hGTeqWm0vQTW43thxCpkO8hgG08yLuwdxeNzQHh
   wxOBDphIb90k5LxD6MlVKB+d8T2Fx/2B4xGNxnA+WtQ4xgtNe4d89i7zU
   h2f+rVcv1pjflsnjfOlHNsVbPtgy1xr9u3bz5SJkUU5iyAMSriTcxBn7S
   E2n3S4TR1Ffj7AbvEiD3sEbznN1EqWoTUfP1nrCOZ+rK4WViq7v+BLYQR
   rhJLjuoaMVbDll5c9T4h+/pOTHCuvdRJdEFPokUf8Jm/MpVGNTskfZ4u3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="140577432"
X-IronPort-AV: E=Sophos;i="6.07,119,1708354800"; 
   d="scan'208";a="140577432"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 16:09:14 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3C766DD945
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:12 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 70DCD15706
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:11 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 08FFB20097CD1
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:11 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A975F1A006B;
	Wed, 13 Mar 2024 15:09:10 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 10/36] libpng: upgrade 1.6.42 -> 1.6.43
Date: Wed, 13 Mar 2024 15:08:08 +0800
Message-Id: <1710313714-12541-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
References: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28248.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28248.004
X-TMASE-Result: 10--4.009700-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwggU1APdZ/+INAO
	OSAF0cTNLMTLPjftrHVyTmieMNgdAF2aX3W+WWMZJ5oIExjxwSdJziJDtUPgzcj0QMA/92m2voJ
	CvQiX3/Lxim3TJkeStEPX7cbi7DFx0YRMm/X9bI4/QdUh6LEl0DeXamXCCu1YIPUd1fKoOcS/BR
	68O365bm0xeKYZaxlk68UgzYLcb6TWlVyQseCTQp4CIKY/Hg3AGdQnQSTrKGPEQdG7H66TyHEqm
	8QYBtMOK6VMTJciygK85F8LmzU5+d1acRnn5qe9SGfBpxLourh+uYkV+VdaLhi8Qdu8UNHOePUL
	PRYNjkIcC26/LWV633WwUlcNnm3Lgr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 07:09:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197012

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Fixed the row width check in png_check_IHDR().
-Added eXIf chunk support to the push-mode reader in pngpread.c.
-Added contrib/pngexif for the benefit of the users who would like
 to inspect the content of eXIf chunks.
-Added contrib/conftest/basic.dfa, a basic build-time configuration.
-Fixed a preprocessor condition in pngread.c that broke build-time
 configurations like contrib/conftest/pngcp.dfa.
-Added CMake build support for LoongArch LSX.
-Fixed a CMake build error that occurred under a peculiar state of the
 dependency tree. This was a regression introduced in libpng-1.6.41.
-Marked the installed libpng headers as system headers in CMake.
-Updated the build support for RISCOS.
-Updated the makefiles to allow cross-platform builds to initialize
 conventional make variables like AR and ARFLAGS.
-Added various improvements to the CI scripts in areas like version
  consistency verification and text linting.
Added version consistency verification to pngtest.c also.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libpng/{libpng_1.6.42.bb => libpng_1.6.43.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.42.bb => libpng_1.6.43.bb} (87%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb b/meta/recipes-multimedia/libpng/libpng_1.6.43.bb
similarity index 87%
rename from meta/recipes-multimedia/libpng/libpng_1.6.42.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.43.bb
index cadbe957db..f1febd0a02 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.43.bb
@@ -10,8 +10,8 @@ DEPENDS = "zlib"
 
 LIBV = "16"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "c919dbc11f4c03b05aba3f8884d8eb7adfe3572ad228af972bb60057bdb48450"
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz"
+SRC_URI[sha256sum] = "6a5ca0652392a2d7c9db2ae5b40210843c0bbc081cbd410825ab00cc59f14a6c"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
 
-- 
2.34.1


