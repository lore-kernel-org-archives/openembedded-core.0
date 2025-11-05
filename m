Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65C4ACCFA1C
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:47:41 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3001.1762386457331145793
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:47:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MMhkwcS2;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762386460; x=1793922460;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=An75qgbDOqnxhigZwNxDg1uG87yfBK6R0hC956JWgSU=;
  b=MMhkwcS2NM44rqrJH5NWuyQ9hgbeYa1uMRT5HGsZl66luWgTCZ0d5yLh
   Wj6phVa53v/ppv+kQVhKRZE3mg4FVNK3GXzlcFxgoD4yRC737EQV4tnpk
   rDAnuVRv8BsoPo4TCoeNvQ+oLlaw79TSMbVNUFXuLIaBx9tcxZTBH3JCn
   lM7wojZFK84ekZLc70/LbEobhJvdgKmHpDxt64b9K9uyFe/JQCLO8pFrp
   Qk8TAFXr2Zb/kbHuuZQNjpM/74s+bDV7TxL3HdWLmmHiF8HKl2L2ZG+iY
   LPAfo+5VgEeN61RpG8iolDtt9NFOAmwlpYPTY08vPCfolSRViIh6ceu+W
   A==;
X-CSE-ConnectionGUID: RN10/PFQTkyaigwrJhd4gg==
X-CSE-MsgGUID: x472xJ/rSeq6gF9MwprB3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="218837424"
X-IronPort-AV: E=Sophos;i="6.19,283,1754924400"; 
   d="scan'208";a="218837424"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 08:47:39 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 82C471002BB9
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Nov 2025 23:47:39 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 3B5358D65C4
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Nov 2025 23:47:39 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id CE6ED1400AC7;
	Wed,  5 Nov 2025 23:47:36 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 12/29] gobject-introspection: upgrade 1.84.0 -> 1.86.0
Date: Thu,  6 Nov 2025 07:46:55 +0800
Message-ID: <20251105234712.446-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251105234712.446-1-wangmy@fujitsu.com>
References: <20251105234712.446-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:47:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225942

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- giscanner: Added ability to add wrapper script arguments
- g-ir-tools: Support reading @rspfiles for arguments
- Update gobject-introspection-tests
- giscanner: support alignof expressions
- dumper: Fix introspection binaries missing rpaths for uninstalled ELF shlibs
- meson: Fix fs.copyfile semantics breaking GIR build with Ninja 1.12+
- giscanner: Deduplicate arguments and use response files for MSVC
- scanner: Prefer some getters over others
- girepository: Initialize the async functions parameters

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-introspection_1.84.0.bb => gobject-introspection_1.86.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gobject-introspection/{gobject-introspection_1.84.0.bb => gobject-introspection_1.86.0.bb} (99%)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb
similarity index 99%
rename from meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb
rename to meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb
index f6797cd2e5..2fff132b1d 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c434e8128a68bedd59b80b2ac1eb1c4a \
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)}/${BPN}-${PV}.tar.xz \
            "
 
-SRC_URI[sha256sum] = "945b57da7ec262e5c266b89e091d14be800cc424277d82a02872b7d794a84779"
+SRC_URI[sha256sum] = "920d1a3fcedeadc32acff95c2e203b319039dd4b4a08dd1a2dfd283d19c0b9ae"
 
 SRC_URI:append:class-native = " file://0001-Relocate-the-repository-directory-for-native-builds.patch"
 
-- 
2.43.0


