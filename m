Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97B70D116F3
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 09:10:05 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10796.1764753004276503531
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 01:10:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PmqOQAWy;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764753003; x=1796289003;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IpYj/iy9aSMLku560ALOarqCBb5KiET84/PpSm/Ug24=;
  b=PmqOQAWyFbQmpG/9tN5nbIy/MRW9hVgzIRhJZVTFROYfaKzjlVnnmdM4
   IE/lI3Dx6TD9vUL0NuYAP9wjgwj5/L1tAh2fTc302raE9fUm4JXb8Q3h9
   n8Maf/vUmI6f+nrYFr7E3yxowAebAbzKG1CKyUHe9DRvHoqgtNA5OBzCA
   p2GyqUNVeSK3gry2UVjmIheqyxvHQVIaunF7AOlimYC0MXNG40U9HDocL
   oVwvQTv05xu612ZtndRAQeom9kQqG9IH3MAyBSG9RlLhsgLonMV3n3eDs
   091S8vQ0JXZsFdPzt/9W/nOVfN4D+1bIqfL/V4D97MX5hoOne1sxSpe5N
   w==;
X-CSE-ConnectionGUID: 4+q4sPC1TKySSqwwWoJ8sw==
X-CSE-MsgGUID: a7ABIYSKTZ28SeiOHLkzqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="208758130"
X-IronPort-AV: E=Sophos;i="6.20,245,1758553200"; 
   d="scan'208";a="208758130"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 18:10:02 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id C858F42A32D
	for <openembedded-core@lists.openembedded.org>; Wed,  3 Dec 2025 09:10:02 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 770BD1802AE4
	for <openembedded-core@lists.openembedded.org>; Wed,  3 Dec 2025 09:10:02 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 45B7A1000627
	for <openembedded-core@lists.openembedded.org>; Wed,  3 Dec 2025 09:10:00 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] gobject-introspection: upgrade 1.84.0 -> 1.86.0
Date: Wed,  3 Dec 2025 17:09:45 +0800
Message-ID: <20251203090945.14344-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 09:10:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227211

Change log:
- giscanner: Added ability to add wrapper script arguments [!530]
- g-ir-tools: Support reading @rspfiles for arguments [!532]
- Update gobject-introspection-tests [!536]
- giscanner: support alignof expressions [!538]
- dumper: Fix introspection binaries missing rpaths for uninstalled ELF shlibs [!540]
- meson: Fix fs.copyfile semantics breaking GIR build with Ninja 1.12+ [!534]
- giscanner: Deduplicate arguments and use response files for MSVC [!535]
- scanner: Prefer some getters over others [!473]
- girepository: Initialize the async functions parameters [!544]

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...-introspection_1.84.0.bb => gobject-introspection_1.86.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gobject-introspection/{gobject-introspection_1.84.0.bb => gobject-introspection_1.86.0.bb} (99%)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb
similarity index 99%
rename from meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb
rename to meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb
index dfdb1eaa03..f8eab2797f 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c434e8128a68bedd59b80b2ac1eb1c4a \
                     file://girepository/giregisteredtypeinfo.c;endline=21;md5=661847611ae6979465415f31a759ba27 \
                     "
 
-SRC_URI[archive.sha256sum] = "945b57da7ec262e5c266b89e091d14be800cc424277d82a02872b7d794a84779"
+SRC_URI[archive.sha256sum] = "920d1a3fcedeadc32acff95c2e203b319039dd4b4a08dd1a2dfd283d19c0b9ae"
 
 SRC_URI:append:class-native = " file://0001-Relocate-the-repository-directory-for-native-builds.patch"
 
-- 
2.43.0


