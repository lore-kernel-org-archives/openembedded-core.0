Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7306CCD5845
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 10:31:34 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3117.1767781883971775432
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 02:31:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=q1gMN2Pe;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767781882; x=1799317882;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mr5/yaxq2rVGShNpBE97LrM+Ko1EGWvmkcb94uDbC8A=;
  b=q1gMN2Pe7fCm4+qbfuV6q0v8q7sS/8mVCIW3ZRlvVC/rAoPoxkpuLkbP
   Z5UN5hnU8+I0eaAa9isXFUy/4Al0Gr0iC6+zwchJQ1wfXkChI9cPdEzJA
   oQCEQIuev9idNINGsLm4iakolQAwD+t+v2HC1OcE41LRw1sthFzscVq3C
   atDnbn8ZPChsoDeJo7qIH2v9NcyR7/8WELFKE4WAQg860m6FqUP8p4N+Y
   KvFGwj+5RFojubXB3mrxN/gIQiqEkzB8cUF3mKtlfnNpZNdTSmJ2CRH92
   Z+/YPmELFfVyjSkQB6/kbjBbEZmauKqhAewYE11NLlFDYD1naPFWSC8I8
   A==;
X-CSE-ConnectionGUID: weaAtiJdSrKWoZg0aSZRFA==
X-CSE-MsgGUID: pjJCYAE7R/WTBvKOG9npVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="212496249"
X-IronPort-AV: E=Sophos;i="6.21,207,1763391600"; 
   d="scan'208";a="212496249"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 19:31:21 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 8150C42A307
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jan 2026 10:31:22 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 34DEBC02C75
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jan 2026 10:31:22 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 6ECEA101732E;
	Wed,  7 Jan 2026 10:31:19 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 04/15] ed: upgrade 1.22.3 -> 1.22.4
Date: Wed,  7 Jan 2026 18:30:51 +0800
Message-ID: <20260107103102.458-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260107103102.458-1-wangmy@fujitsu.com>
References: <20260107103102.458-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 10:31:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228974

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2026

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/ed/{ed_1.22.3.bb => ed_1.22.4.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/ed/{ed_1.22.3.bb => ed_1.22.4.bb} (80%)

diff --git a/meta/recipes-extended/ed/ed_1.22.3.bb b/meta/recipes-extended/ed/ed_1.22.4.bb
similarity index 80%
rename from meta/recipes-extended/ed/ed_1.22.3.bb
rename to meta/recipes-extended/ed/ed_1.22.4.bb
index 1a5a28a039..36b631b762 100644
--- a/meta/recipes-extended/ed/ed_1.22.3.bb
+++ b/meta/recipes-extended/ed/ed_1.22.4.bb
@@ -4,8 +4,8 @@ DESCRIPTION = "GNU ed is a line-oriented text editor. It is used to create, disp
 
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cca7f74ec83b7a9ce7ccd195aad471bd \
-                    file://ed.h;endline=20;md5=a24e7f91c0fb83e65a746f5994762a49 \
-                    file://main.c;endline=17;md5=fd6ad9f1853f123f4ae7a31d59761f09 \
+                    file://ed.h;endline=20;md5=14c3e5e76d024c936c3afd2f89e5686b \
+                    file://main.c;endline=17;md5=77c78fd940b4995c22cc1ae128bf0462 \
                     "
 
 SECTION = "base"
@@ -19,7 +19,7 @@ bindir = "${base_bindir}"
 SRC_URI = "${GNU_MIRROR}/ed/${BP}.tar.lz"
 UPSTREAM_CHECK_URI = "${GNU_MIRROR}/ed/"
 
-SRC_URI[sha256sum] = "47a55ddfc52d4a1ff6f7559fbd00cf948a16b6cf151ec520392761aeae4e97be"
+SRC_URI[sha256sum] = "987a1ebbbad3fcf63a1ffa9e29b3fa7de065150d16319d0a49dd8b57f81d3e9c"
 
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
-- 
2.43.0


