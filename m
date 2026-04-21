Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F53CF89242
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 09:58:35 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20547.1776765508149977178
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 02:58:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VYJdxe3e;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776765508; x=1808301508;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OxTus9XEqIyYG8v3cwCqeeIpBuyFx3d20bdSdxttpQg=;
  b=VYJdxe3eRnL1acRT6SCA7eHj6gYZ4Yn3TDP0ehSgHpfNd2DyN4IRnit0
   pYtgpWY23ehpRIVPJcwOTjNCRO2zWjg3WG1L/mMUijEw76RL04KbaNdSO
   vgvWbTSchtx7AfKOwRlbRgWGhcQ9UOGwcHzol5N54vvJVJ7TZf61kTVSh
   harkCqVFQBfqYD2OOCdC2DSOz8u6EBOb4FDyrT0ks1F7AKUiBm7Vv532e
   Jm+MILwtRRyrAJhjPcGU4JjHXIDpaLOSQnWEUlUB8lFRw3CcRWsIt4p0o
   GtQRfajEtumkZwL6f+T49LF3ahxdvg+Ov//bc9qj5CNgi3A1HRifFvX9B
   Q==;
X-CSE-ConnectionGUID: S8nGiLK5Q9uqtOV5Z1ZMBA==
X-CSE-MsgGUID: OrqF0dAlSMyljjgONGWkoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="225608334"
X-IronPort-AV: E=Sophos;i="6.23,191,1770562800"; 
   d="scan'208";a="225608334"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 18:58:26 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 9195C1000348
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:58:26 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 3F41D1004142
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:58:26 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id AFD3114002C3;
	Tue, 21 Apr 2026 09:58:23 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [PATCH 49/49] xserver-xorg: upgrade 21.1.21 -> 21.1.22
Date: Tue, 21 Apr 2026 17:55:59 +0800
Message-ID: <20260421095559.1856-49-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260421095559.1856-1-wangmy@fujitsu.com>
References: <20260421095559.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:58:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235657

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
 add author to HPND-sell-MIT-disclaimer-xserver
 add missing paragraph to SGI-B-2.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc             | 2 +-
 .../{xserver-xorg_21.1.21.bb => xserver-xorg_21.1.22.bb}        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.21.bb => xserver-xorg_21.1.22.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 59c373280e..0d8d782712 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -2,7 +2,7 @@ SUMMARY = "The X.Org X server"
 HOMEPAGE = "http://www.x.org"
 SECTION = "x11/base"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=21e33dcccf2d5034f798a8ea62622939"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f8778cfcd90ece0e4b225f30182227ca"
 
 # xf86-*-* packages depend on an X server built with the xfree86 DDX
 # so we have a virtual to represent that:
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.21.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.22.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.21.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.22.bb
index 3781234c84..6a9826d959 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.21.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.22.bb
@@ -1,7 +1,7 @@
 require xserver-xorg.inc
 
 SRC_URI += " file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch"
-SRC_URI[sha256sum] = "c0cbe5545b3f645bae6024b830d1d1154a956350683a4e52b2fff5b0fa1ab519"
+SRC_URI[sha256sum] = "1a242c8917c49ba29ccc1f6021613d8a2b9805dd0d271a66ae9d09f4b0bb06b3"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.43.0


