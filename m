Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91955F89239
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 09:57:14 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20402.1776765412223009380
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 02:57:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=B9zSmrvq;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776765430; x=1808301430;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4HkVhV5g3n5bRQtAhW0mwlbao/N/3H6eS/h+mCI3v5U=;
  b=B9zSmrvqmTbrh8tFs7kCddNIViAlYhejPj5mx8uOq/UOXF2wcO9D3k65
   wxq6YO4bRLpvQNwYCosKw1YKQvwe1uAO9UgANytZWYdcqn+cc+HGQp6EF
   vlV3m+K23Fj+XTh/whPzQ5Y0xHH0YLK0Chvx99hzBtxRfwQhEyuqLSU1/
   +gBDu+1FzAIzDw4MeNMQNKjS2z2hOwwaXeS+BQkrNKSDdGq1QPiDfyyvT
   a2UooUURfi7uHIC2VI1hsEaXO4jjYveVSMT3A3i9WybDhY/IGjzy+9xmL
   eBxxBn4JrUEJT5+8EsFIOPGDtJ4RCV8Sti9EJtqtbylHEHd+PD7rhLZhl
   g==;
X-CSE-ConnectionGUID: Mm1yDbJGTDy+Y0/PX2yFHA==
X-CSE-MsgGUID: lJSCGn6vSVyjzHP6rsA7Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="216474348"
X-IronPort-AV: E=Sophos;i="6.23,191,1770562800"; 
   d="scan'208";a="216474348"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 18:57:09 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 09C6142A330
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:10 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id A93231800D61
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:09 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 2FAC814000E6;
	Tue, 21 Apr 2026 09:57:06 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 36/49] python3-setuptools-rust: upgrade 1.12.0 -> 1.12.1
Date: Tue, 21 Apr 2026 17:55:46 +0800
Message-ID: <20260421095559.1856-36-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260421095559.1856-1-wangmy@fujitsu.com>
References: <20260421095559.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235644

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Migrate to trusted publishing.
- Strip target suffix for cargo-zigbuild compatibility.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...uptools-rust_1.12.0.bb => python3-setuptools-rust_1.12.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools-rust_1.12.0.bb => python3-setuptools-rust_1.12.1.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-rust_1.12.0.bb b/meta/recipes-devtools/python/python3-setuptools-rust_1.12.1.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-setuptools-rust_1.12.0.bb
rename to meta/recipes-devtools/python/python3-setuptools-rust_1.12.1.bb
index 062e97083d..a1135794ba 100644
--- a/meta/recipes-devtools/python/python3-setuptools-rust_1.12.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-rust_1.12.1.bb
@@ -9,7 +9,7 @@ BUGTRACKER = "https://github.com/PyO3/setuptools-rust/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=011cd92e702dd9e6b1a26157b6fd53f5"
 
-SRC_URI[sha256sum] = "d94a93f0c97751c17014565f07bdc324bee45d396cd1bba83d8e7af92b945f0c"
+SRC_URI[sha256sum] = "85ae70989d96c9cfeb5ef79cf3bac2d5200bc5564f720a06edceedbdf6664640"
 
 PYPI_PACKAGE = "setuptools_rust"
 
-- 
2.43.0


