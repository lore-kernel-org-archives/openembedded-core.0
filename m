Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CC52EDEC08
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 05:15:11 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11873.1772601308888900410
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 21:15:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DTWzPZF3;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772601309; x=1804137309;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VDrSrb2tNbJZFH5BUWyOUV99l+N5SbOuqjHNCTNAYZo=;
  b=DTWzPZF32vGPHSympFrY3AjX7fsYUUhDs8BvPcVqlkqF6/ZQ9UIjFSje
   GvaefwcQdm3q4AuRWOvjA6RLMeCuhwnkPL92za7kRVoEaQroMGltHo/sj
   lu/UutoLm7a54uIW2UZLk2HqDjUHlRbfCUii+DjMQFmiQq6GsSgcZS8NU
   G65t6O/vyK+Qs9JLRwhbQO6HzwT/GJZ0DFcyuQbabg/pwll4J2bQlso4M
   zvr856P/8wl3X9EIM9OzCv00DiF1A/t5KjRK445v4ytlKA36rRZ9KR4ZP
   13+vdiQX0k/+oh3ZHZUR5cd+RVQBoJknjHahH2Cr52Nw/TaXvN/KohjTS
   w==;
X-CSE-ConnectionGUID: OEwgwoiNSbWy372dQjQ51Q==
X-CSE-MsgGUID: shVgO9tHRCOZxM7lz6Uh8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="210668429"
X-IronPort-AV: E=Sophos;i="6.21,323,1763391600"; 
   d="scan'208";a="210668429"
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.fujitsu.com (Postfix) with ESMTPS id 09D901002B8F
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Mar 2026 05:15:07 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id B2FF81809C15
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Mar 2026 05:15:06 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.128.218])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 451D9829F33
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Mar 2026 05:15:04 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] blueprint-compiler: upgrade 0.19.0 -> 0.20.0
Date: Wed,  4 Mar 2026 13:14:59 +0800
Message-ID: <20260304051459.9358-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 05:15:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232348

Changelog:
  https://gitlab.gnome.org/GNOME/blueprint-compiler/-/releases/v0.20.0

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...eprint-compiler_0.19.0.bb => blueprint-compiler_0.20.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/blueprint-compiler/{blueprint-compiler_0.19.0.bb => blueprint-compiler_0.20.0.bb} (84%)

diff --git a/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.19.0.bb b/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.20.0.bb
similarity index 84%
rename from meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.19.0.bb
rename to meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.20.0.bb
index 6e2ebd741d..d3ef747629 100644
--- a/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.19.0.bb
+++ b/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.20.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://gitlab.gnome.org/GNOME/blueprint-compiler"
 LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3000208d539ec061b899bce1d9ce9404"
 
-SRC_URI = "git://gitlab.gnome.org/GNOME/blueprint-compiler;protocol=https;branch=main;tag=${PV}"
-SRCREV = "de8e15f7791bd6243279cef1efc27edf4cb93674"
+SRC_URI = "git://gitlab.gnome.org/GNOME/blueprint-compiler;protocol=https;branch=main;tag=v${PV}"
+SRCREV = "aa5298cc1677cf855bd61f9671607362bd203f4f"
 
 inherit meson pkgconfig python3targetconfig
 
-- 
2.43.0


