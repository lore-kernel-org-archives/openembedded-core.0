Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C61CD0C834
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 10:25:41 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56089.1768299932867106651
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 02:25:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pmhW1IAd;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768299936; x=1799835936;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=O3lWrvz9GrEWrDuIlB4oQXgnCLdzQb0YPAckGV9gPNA=;
  b=pmhW1IAdhb40zv7u37+pjRBaNr9PMCstAqO2sYaupUFU4imXC7z9vR4E
   7c5k/eOGY2jhJQx6au6jQPBPQsLazQRYKPUABiuvqauAmT9jZz0aN5wL0
   RITjATl+PVlQwSyRY3aHjQ6m1QIs/ss+rpQuPnOGNKp7ndRDHcHAI8qrR
   0j5h7jfmTE3k2cyL5jVHaJftPW7TEITi0kX7ne1LLWRxUnLR7oN9oqZwR
   6ToyUDqhjo0SVjSe2Hf6zRQHD3XZTKJiCaR/lZ4YVLATalFqVun+vAZRp
   B41Ymtk+ndATpkYMhWROCPAIYktdi76CIKvE8LO77I4Tx6Gvmd3aDSAwW
   A==;
X-CSE-ConnectionGUID: PRihX4ugT6ej4zxtZgdCcQ==
X-CSE-MsgGUID: sCxfxR9jQKW2wxzrocXcMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="204468577"
X-IronPort-AV: E=Sophos;i="6.21,222,1763391600"; 
   d="scan'208";a="204468577"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 19:25:35 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 843A242A302
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:25:35 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 313731C0017E
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:25:35 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 7C37E826FFF;
	Tue, 13 Jan 2026 10:25:32 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 09/18] libtasn1: upgrade 4.20.0 -> 4.21.0
Date: Tue, 13 Jan 2026 18:24:59 +0800
Message-ID: <20260113102509.728-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260113102509.728-1-wangmy@fujitsu.com>
References: <20260113102509.728-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229248

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Undocumented asn1Decoding --debug flag removed
- Code coverage for src/ went from 35% to 82%
- Fix of ASN.1 typo in manual
- NEWS renamed to NEWS.md and uses markdown syntax.
- Update gnulib files and various build/maintenance fixes.
- Fix for vulnerability CVE-2025-13151 Stack-based buffer overflow

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gnutls/{libtasn1_4.20.0.bb => libtasn1_4.21.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gnutls/{libtasn1_4.20.0.bb => libtasn1_4.21.0.bb} (89%)

diff --git a/meta/recipes-support/gnutls/libtasn1_4.20.0.bb b/meta/recipes-support/gnutls/libtasn1_4.21.0.bb
similarity index 89%
rename from meta/recipes-support/gnutls/libtasn1_4.20.0.bb
rename to meta/recipes-support/gnutls/libtasn1_4.21.0.bb
index 8127ba5b1d..4570488c4c 100644
--- a/meta/recipes-support/gnutls/libtasn1_4.20.0.bb
+++ b/meta/recipes-support/gnutls/libtasn1_4.21.0.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
 
 DEPENDS = "bison-native"
 
-SRC_URI[sha256sum] = "92e0e3bd4c02d4aeee76036b2ddd83f0c732ba4cda5cb71d583272b23587a76c"
+SRC_URI[sha256sum] = "1d8a444a223cc5464240777346e125de51d8e6abf0b8bac742ac84609167dc87"
 
 inherit autotools texinfo lib_package gtk-doc
 
-- 
2.43.0


