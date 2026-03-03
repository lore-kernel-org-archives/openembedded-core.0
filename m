Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69BBFEC0463
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 10:02:57 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14851.1772532170522160633
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 02:02:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=okChjZEO;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772532170; x=1804068170;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Xyo/BvbIOqwKsqkaPyoV1FtPyUPcW6UvAG/05f61Ol0=;
  b=okChjZEOI5zHY4RFC1q66Ffri8uM5Y2sxwnnG+cxUbpIqpobAVXYbdPF
   FzwF29feuGXyFxUtO3nH8dkAr59ukL2ligZYl2uRf+Qm4IctK07Jk4EqS
   dkuXui0NZo0zOvN4Y+J/rVcses1JQOchrxBpyPLfjJwcVy7rmLvhFwHke
   gZErsXh/4H2iYH1D8sSzGm8xlG5gPLeLolsYAoew0PdhvWUOXqALw/zv1
   ZPerHZNAy3bvll9bJa65RXrwdGBOoWgamVc3UWbzZUozXCh4QTlbNgqFo
   aSJYXoO/mVm2jo1oINtWBwyIzwZupGiiobqzyl4FIG9hB43Aq1U70IjWS
   w==;
X-CSE-ConnectionGUID: 1zOpLgleT3CFRgcJAWtcew==
X-CSE-MsgGUID: e74Sv2BETJqs5zVsVDSimw==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="235960950"
X-IronPort-AV: E=Sophos;i="6.21,321,1763391600"; 
   d="scan'208";a="235960950"
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id E5751100034E
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 10:02:48 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 95A731802AEA
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 10:02:48 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.128.218])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 521528214C3
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 10:02:46 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] gtk4: upgrade 4.20.2 -> 4.20.3
Date: Tue,  3 Mar 2026 18:02:43 +0800
Message-ID: <20260303100243.7992-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 10:02:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232276

Changelog
  https://gitlab.gnome.org/GNOME/gtk/-/blob/4.20.3/NEWS?ref_type=tags

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 meta/recipes-gnome/gtk+/{gtk4_4.20.2.bb => gtk4_4.20.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.20.2.bb => gtk4_4.20.3.bb} (97%)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.20.2.bb b/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb
similarity index 97%
rename from meta/recipes-gnome/gtk+/gtk4_4.20.2.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.20.3.bb
index 92791db169..ef9a05f7fe 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.20.2.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb
@@ -33,7 +33,7 @@ LIC_FILES_CHKSUM = " \
     file://tests/testgtk.c;endline=25;md5=49d06770681b8322466b52ed19d29fb2 \
 "
 
-SRC_URI[archive.sha256sum] = "5e8240edecafaff2b8baf4663bdceaa668ef10a207bee4d7f90e010e10bddc5c"
+SRC_URI[archive.sha256sum] = "2873f2903088a66c71173ea2ed85ffae266a66b972c3a4842bbb2f6f187ec153"
 
 S = "${UNPACKDIR}/${GNOMEBN}-${PV}"
 
-- 
2.43.0


