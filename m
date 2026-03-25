Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33681FEA801
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 03:55:10 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15199.1774410905896610552
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 20:55:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=c/OpQ0VL;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774410904; x=1805946904;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6MeVVodrn+lISwf4NmB9SRwd30SeTgwhlukZWRzvGPs=;
  b=c/OpQ0VL7C5xqPJ3fuuzgQiEON6k+n1l77+iSB7gQgUItZCnfR/Eqfkm
   xzpYDU+nDjQ6p9YyKA4hAH4r9nK+96x5q0WELypI8MAzyoSR3JYqGVRTw
   Ry1We72qLokrQSPfuTdO+6kWPX/Ykfobhah1UO2pYBj4yvgAEEVTjIjp9
   HI7cmLeGDxBc3h88/K/66dyDuIeEwakgVBE1JPhK9DWUzbO00wlV0DK1o
   EOBuPZ5DrRiNE00nq/xKUZsFBv0PjhrEJdzrwhtedDyIMv29DJk8LvxEN
   S5xp9VDg37M3QoQWu2zokYF05ab9VYyR9maAYXzka9dxLtsl85TSmX9xD
   g==;
X-CSE-ConnectionGUID: pRwuA3AGSimF9lb4KdwBwg==
X-CSE-MsgGUID: YNW2AfLZS3aKzg8s+OffKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="213315040"
X-IronPort-AV: E=Sophos;i="6.23,139,1770562800"; 
   d="scan'208";a="213315040"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 12:55:02 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 0D5E7C01819
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 03:55:04 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id B987BC02F32
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 03:55:03 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.128.24])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 938D51006484
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 03:55:01 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] epiphany: upgrade 49.2 -> 49.7
Date: Wed, 25 Mar 2026 11:54:25 +0800
Message-ID: <20260325035425.3635-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 03:55:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233854

49.7 - March 24, 2026
=====================
This release reverts back to the original adblock filters used before 49.4.

* Bugs fixed:
  - #2848 Regression in site compatibility due to adblocking (Michael Catanzaro)

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../epiphany/{epiphany_49.2.bb => epiphany_49.7.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/epiphany/{epiphany_49.2.bb => epiphany_49.7.bb} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_49.2.bb b/meta/recipes-gnome/epiphany/epiphany_49.7.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_49.2.bb
rename to meta/recipes-gnome/epiphany/epiphany_49.7.bb
index 4c27a6b6c7..e782855c95 100644
--- a/meta/recipes-gnome/epiphany/epiphany_49.2.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_49.7.bb
@@ -32,7 +32,7 @@ SRC_URI += "\
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "b3ba3d68213e87f81f1733e85500c37b82b5938f9009e4fe89994963d5fb2b8e"
+SRC_URI[archive.sha256sum] = "3c590c6fe6d9269412a042aa479c91c3229163e2da85a94a5d24644b2ab9e3b4"
 
 export GI_TYPELIB_PATH = "${STAGING_LIBDIR}/girepository-1.0/"
 
-- 
2.43.0


