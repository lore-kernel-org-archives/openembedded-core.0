Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A96D2CC6B00
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 05:38:35 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9387.1775108305110341751
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 22:38:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qRKTBp5u;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775108305; x=1806644305;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=o26PwDe98ZqLsvY2Hq9dM+pvqNdjDTKocLYPX4GUZ+Y=;
  b=qRKTBp5uAWIDtLVf4dbZ2ySTNNsqG0onkmBYOp7IIyNFoTOB9Q11aPJf
   fjdIRcNBkjfAq2Y4lqnF5pQwpysX11/7fmP52NZenv2qtpd9jvijNxULt
   SD5PqZRi6EJ7kcnmCCLc4SV/dnWjpwZ9s6D2alGSLY4NJ2QEuoZb8hcnB
   znPkvZdsZCdLJw/Q7hGHs6ifJvhgBQEm32+XA5AwF8h/yCHbAjjBZ8ePT
   DJcDqwpcof1RByhntIJ4MdrBJ2FvwNEGpv+BXjCd5XiWKU01El0ZDQEGD
   kY91MEgYX8RVAeaYgdif4rF8Klib61wH1OmwvIbCtc5+IAvNI8HfmBwEE
   w==;
X-CSE-ConnectionGUID: sgPFQ0g2QqCnUg2/jpHPkA==
X-CSE-MsgGUID: GXPiSHQhSLOMpl2tMc6kiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="224189366"
X-IronPort-AV: E=Sophos;i="6.23,155,1770562800"; 
   d="scan'208";a="224189366"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 14:38:23 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 65F67820C23
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Apr 2026 05:38:23 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 1E2C9C2BAA1
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Apr 2026 05:38:23 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id ED5E01003756
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Apr 2026 05:38:20 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] blueprint-compiler: upgrade 0.20.0 -> 0.20.4
Date: Thu,  2 Apr 2026 13:38:15 +0800
Message-ID: <20260402053816.14696-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 05:38:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234488

Changelog:
  git://gitlab.gnome.org/GNOME/blueprint-compiler

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...eprint-compiler_0.20.0.bb => blueprint-compiler_0.20.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/blueprint-compiler/{blueprint-compiler_0.20.0.bb => blueprint-compiler_0.20.4.bb} (83%)

diff --git a/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.20.0.bb b/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.20.4.bb
similarity index 83%
rename from meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.20.0.bb
rename to meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.20.4.bb
index d3ef747629..bf357872c3 100644
--- a/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.20.0.bb
+++ b/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.20.4.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://gitlab.gnome.org/GNOME/blueprint-compiler"
 LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3000208d539ec061b899bce1d9ce9404"
 
-SRC_URI = "git://gitlab.gnome.org/GNOME/blueprint-compiler;protocol=https;branch=main;tag=v${PV}"
-SRCREV = "aa5298cc1677cf855bd61f9671607362bd203f4f"
+SRC_URI = "git://gitlab.gnome.org/GNOME/blueprint-compiler;protocol=https;branch=blueprint-0-20;tag=v${PV}"
+SRCREV = "31b62c24a72c1670d2d93dcdf2d130f1ae12778e"
 
 inherit meson pkgconfig python3targetconfig
 
-- 
2.43.0


