Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF9E71075288
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 09:26:42 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7109.1773912401799376093
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 02:26:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=k6tR64WO;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773912402; x=1805448402;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sTHHJkEW8ebtpBtjne1V1zCiSWyrbtstI5iYkdN4cmE=;
  b=k6tR64WODn0jnf590Gjytq9jIdrImIVGa4sI4Diri94JlVomtUEB3HsG
   esWms3WLL/ZPDEJG2mPoUH8hbAYZcBF02eHL0BKobf/D/VHxFQ2vmk9x+
   dhKwjT22y6XVFdnLZ+cEVGjUDXT1Oyb0WHRyaYEfQ98Z3H6woPEBJedAh
   0k341xNa7YGqQK+Gk2kuDMbY+K+vuSQ6Oc/VQ6MM6XKH/VlM72h2nrT1R
   YU+P18GuisICSs5TuChkk2mT/nlr/eUU7jsnaIVy7ENkOLhG4TLHWdscg
   CErE5JfZHvUdpD6jZSZZOWjzEMTGiksgChDvknOBoS+JHT989bnkRthxt
   Q==;
X-CSE-ConnectionGUID: 6YxlBa9AQ+KZ4/tqLfDJ4A==
X-CSE-MsgGUID: R9XeBaB2SNOkovGzfvAJjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="238202739"
X-IronPort-AV: E=Sophos;i="6.23,129,1770562800"; 
   d="scan'208";a="238202739"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 18:26:40 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 2F18B1C001A1
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 09:26:40 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id D4F92C0162C
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 09:26:39 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.128.218])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 7E6CC405E23
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 09:26:37 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] man-pages: upgrade 6.16 -> 6.17
Date: Thu, 19 Mar 2026 17:26:33 +0800
Message-ID: <20260319092633.15038-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 09:26:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233472

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../man-pages/{man-pages_6.16.bb => man-pages_6.17.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/man-pages/{man-pages_6.16.bb => man-pages_6.17.bb} (96%)

diff --git a/meta/recipes-extended/man-pages/man-pages_6.16.bb b/meta/recipes-extended/man-pages/man-pages_6.17.bb
similarity index 96%
rename from meta/recipes-extended/man-pages/man-pages_6.16.bb
rename to meta/recipes-extended/man-pages/man-pages_6.17.bb
index 5bd79c0425..bf4cbca932 100644
--- a/meta/recipes-extended/man-pages/man-pages_6.16.bb
+++ b/meta/recipes-extended/man-pages/man-pages_6.17.bb
@@ -20,7 +20,7 @@ LIC_FILES_CHKSUM = "file://README;md5=c2d6fa1a74bdd79c25de6f4db7332294 \
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz \
            "
 
-SRC_URI[sha256sum] = "cfdc7c1d571fa40b1f31b68704e59c0c516ab85b53ebf537c8c8ec1f3b67b974"
+SRC_URI[sha256sum] = "ca29e4d1f1edce2e27719967e9c4c2506c5501d0567d55bb723e10ec57a6ed14"
 
 inherit manpages lib_package
 
-- 
2.43.0


