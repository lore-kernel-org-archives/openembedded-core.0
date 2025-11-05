Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D20ACCFA18
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:47:41 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2989.1762386455491063020
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:47:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QhBYcsaL;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762386455; x=1793922455;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4g/nORgP3ndv0WwkRd0KlYKTzrQVRAyLqtJYcdtfW68=;
  b=QhBYcsaLtLWoZ0uvviPzVAaN/1V0PoEmobX/rRVaTwYlZa3BQ+Vs89zx
   vV66nITutGI6jv9q7sUT8xTysMchaNxO//p+pLX1KK+510BhZsg19sPPw
   UocuJuwBFHzWUFSglcy9qonppFSy76HE1c+lLS6LIMIEPVkSKc+1QIuJE
   rJUVrmPIS96pyJYi0NSKgJc2voJsh1KWGLsHika8/H7JizBSoicvOATPx
   t1dPnJNDuNBD182dMJtSwy3qO3b77w/mE5dnBC4YHZEhPneh7klnRvPby
   L0wjjqauDsOui3cVH1B4d7mWTKPoylIE6EbSWlwpBtQVWzJLrNd9mmVYd
   Q==;
X-CSE-ConnectionGUID: qEIfjaL/QUaJugqdxoif+g==
X-CSE-MsgGUID: kmOUaTpHRc6P7UoiqGZDUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="206782236"
X-IronPort-AV: E=Sophos;i="6.19,283,1754924400"; 
   d="scan'208";a="206782236"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 08:47:34 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 1942F1C000FA
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Nov 2025 23:47:34 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id C38D218019AF
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Nov 2025 23:47:33 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 442E714005B7;
	Wed,  5 Nov 2025 23:47:30 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 09/29] fastfloat: upgrade 8.0.2 -> 8.1.0
Date: Thu,  6 Nov 2025 07:46:52 +0800
Message-ID: <20251105234712.446-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251105234712.446-1-wangmy@fujitsu.com>
References: <20251105234712.446-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:47:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225939

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../fastfloat/{fastfloat_8.0.2.bb => fastfloat_8.1.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/fastfloat/{fastfloat_8.0.2.bb => fastfloat_8.1.0.bb} (84%)

diff --git a/meta/recipes-devtools/fastfloat/fastfloat_8.0.2.bb b/meta/recipes-devtools/fastfloat/fastfloat_8.1.0.bb
similarity index 84%
rename from meta/recipes-devtools/fastfloat/fastfloat_8.0.2.bb
rename to meta/recipes-devtools/fastfloat/fastfloat_8.1.0.bb
index ca69a4238f..84bf90dac9 100644
--- a/meta/recipes-devtools/fastfloat/fastfloat_8.0.2.bb
+++ b/meta/recipes-devtools/fastfloat/fastfloat_8.1.0.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = " \
 	file://LICENSE-BOOST;md5=2c7a3fa82e66676005cd4ee2608fd7d2 \
 "
 
-SRC_URI = "git://github.com/fastfloat/fast_float.git;protocol=https;branch=main"
+SRC_URI = "git://github.com/fastfloat/fast_float.git;protocol=https;branch=main;tag=v${PV}"
 
-SRCREV = "50a80a73ab2ab256ba1c3bf86923ddd8b4202bc7"
+SRCREV = "88b1e5321c6918cbe091afd76728296290668403"
 
 inherit cmake
-- 
2.43.0


