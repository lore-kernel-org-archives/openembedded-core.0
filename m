Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75278EC048E
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 10:09:47 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14966.1772532585867227376
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 02:09:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=snUbUfWs;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772532587; x=1804068587;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZWaVwOdmP5v7bP4UvrSCLwJEZlp+3mBCN/w2SesVhA0=;
  b=snUbUfWsklrFhXScZ/TT4Dy8hE6QcJjy57EN8m9az1D53RobTwyeZn7J
   b6hW8g3r6/c93n/1MrRo0Bjs8/vZjqlZgQaoA1fnquT3mvX0z1328sR46
   iCh2JmHa3c9e53EZwEqEL+V4696OssRuSalUYhM8KEK8w9niXb6JDmrpC
   iQcmIpx7nxxNzNbaW5HXfmYqMq1aMM+AZIHDCb04oaCv8NArD5HifPOpt
   h8hInQvRVBMuUDOwMyyaqGbPH4X8SsHMnKEp92tepx/RSaKmaMOIn4eTh
   GXcET4h8K6KbsxsfgdIDT/hDyZTiNRW4i0fbHr1QL9rsCl0tUS1+dJ1CE
   g==;
X-CSE-ConnectionGUID: 6bXxXwJISJemVGZSXi2NPA==
X-CSE-MsgGUID: m61Sn631TBO1iDRqpnNGTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="235961467"
X-IronPort-AV: E=Sophos;i="6.21,321,1763391600"; 
   d="scan'208";a="235961467"
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.fujitsu.com (Postfix) with ESMTPS id 4D2AF1C17345
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 10:09:46 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 0326A18000C2
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 10:09:46 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 5F9261001CDC;
	Tue,  3 Mar 2026 10:09:43 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 03/23] ed: upgrade 1.22.4 -> 1.22.5
Date: Tue,  3 Mar 2026 18:09:08 +0800
Message-ID: <20260303100929.1624-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260303100929.1624-1-wangmy@fujitsu.com>
References: <20260303100929.1624-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 10:09:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232279

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Use 'sizeof active_list[0]' instead of 'sizeof (line_node **)'.
- A file name ending in slash '/' is now diagnosed as 'Invalid filename'
  instead of 'Is a directory'.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/ed/{ed_1.22.4.bb => ed_1.22.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/ed/{ed_1.22.4.bb => ed_1.22.5.bb} (93%)

diff --git a/meta/recipes-extended/ed/ed_1.22.4.bb b/meta/recipes-extended/ed/ed_1.22.5.bb
similarity index 93%
rename from meta/recipes-extended/ed/ed_1.22.4.bb
rename to meta/recipes-extended/ed/ed_1.22.5.bb
index 36b631b762..0301dd42c9 100644
--- a/meta/recipes-extended/ed/ed_1.22.4.bb
+++ b/meta/recipes-extended/ed/ed_1.22.5.bb
@@ -19,7 +19,7 @@ bindir = "${base_bindir}"
 SRC_URI = "${GNU_MIRROR}/ed/${BP}.tar.lz"
 UPSTREAM_CHECK_URI = "${GNU_MIRROR}/ed/"
 
-SRC_URI[sha256sum] = "987a1ebbbad3fcf63a1ffa9e29b3fa7de065150d16319d0a49dd8b57f81d3e9c"
+SRC_URI[sha256sum] = "56e107ddc2f29dad6690376c15bf9751509e1ee3b8241710e44edbe5c3a158cc"
 
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
-- 
2.43.0


