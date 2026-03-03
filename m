Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B27CEC0488
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 10:01:47 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14827.1772532101901846631
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 02:01:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nwnmYVON;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772532102; x=1804068102;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NyJvhIlg/5CEPaZj0KZyWcRMCH+GrJ5qmehSku5ftfA=;
  b=nwnmYVONwvIR6G0/YOeDKhfshU6Ww3vzEaHgHu9btepGWQV6FZOxRB7k
   DW1KULzRHqej3WnqCPcbKEImxcf/83SAYJ7f9i/wBHOnIPK6TD4ygoBj/
   Rmf9R5lb72PM7XI229APnuc6BlTorLPVB8YJ4AZff+cCrAUo5DLE8giaZ
   A3gecRmBc7Kumx5+DUVCSd1b/py7ha23mI+NBAlZOmZAkhbcI1uxj4/1Z
   wbVpoGaFTagM2fETPsZMIvnpKFUUqATHhEtlduoDYbpzZvw6jYumflw+3
   QM/3jJXThnaSbCEBZXgjPGrWeOFhGIVKfrFlpiOrsNZKKtT4rr7+mC5b7
   A==;
X-CSE-ConnectionGUID: CVuW0FkAQ46EpQt3iSBe6A==
X-CSE-MsgGUID: 3mvSB7hbSJ+JRXkU6jWToA==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="220363845"
X-IronPort-AV: E=Sophos;i="6.21,321,1763391600"; 
   d="scan'208";a="220363845"
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.fujitsu.com (Postfix) with ESMTPS id 1A9101002B9E
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 10:01:40 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id C7ACC1801FFF
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 10:01:39 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.128.218])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 71A808214CC
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 10:01:37 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] libadwaita: upgrade 1.8.2 -> 1.8.4
Date: Tue,  3 Mar 2026 18:01:27 +0800
Message-ID: <20260303100127.7978-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 10:01:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232275

=============
Version 1.8.4
=============
  - AdwDialog
    - Fix initial focus in bottom sheet mode
  - AdwWrapBox
    - Fix ADW_JUSTIFY_SPREAD
  - Translation updates
    - Indonesian
    - Kazakh
    - Romanian

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../libadwaita/{libadwaita_1.8.2.bb => libadwaita_1.8.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libadwaita/{libadwaita_1.8.2.bb => libadwaita_1.8.4.bb} (89%)

diff --git a/meta/recipes-gnome/libadwaita/libadwaita_1.8.2.bb b/meta/recipes-gnome/libadwaita/libadwaita_1.8.4.bb
similarity index 89%
rename from meta/recipes-gnome/libadwaita/libadwaita_1.8.2.bb
rename to meta/recipes-gnome/libadwaita/libadwaita_1.8.4.bb
index b2e70a4ccd..39423244d9 100644
--- a/meta/recipes-gnome/libadwaita/libadwaita_1.8.2.bb
+++ b/meta/recipes-gnome/libadwaita/libadwaita_1.8.4.bb
@@ -12,7 +12,7 @@ DEPENDS = " \
 
 inherit gnomebase gobject-introspection gi-docgen vala features_check
 
-SRC_URI[archive.sha256sum] = "589a6e0f4191740e8690a7d3298e16fa0d4061341b551da7abb2f030b550adb1"
+SRC_URI[archive.sha256sum] = "d02bb77b6f0ff1055002d299898c487cb2d83dbf940d9edf59f6fdf2572a921c"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "opengl"
-- 
2.43.0


