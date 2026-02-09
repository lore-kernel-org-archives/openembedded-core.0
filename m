Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF476E78D5F
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:04:05 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43619.1770627840278502647
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:04:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cNiuY10+;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770627841; x=1802163841;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cza6g/Og2v/2o/imFiTIyJmOBurbjL+Oh/ibWLV2p3s=;
  b=cNiuY10+WfVXuZSxwRIud8oBoYaOBB7fNpxikj8a9Ld9MSZEyb4yrRhj
   O/yd5RXgyVDpM1yi8kKpcBlkPL8GK/CpSyOJFU8UJOHXntOTjbFDkA6Ks
   nhLi9IQOFBziJqRWATuG+BPynMpdPMBCSLOSO7frx/1swd1/V9uyKW4yJ
   UUwQ8oQBFXmJEFL7rzz9XFnwnNKi4nn+Nk6w1SsjBuleY4Esv/xWK4V12
   pUcYqPdkG9oMKPVGTJesgJ7PP2ADyu/N1viWQH01/ed4kShRJx70iTfQQ
   iYfG5jS49e/1S4NDxJx4Q51t+6rLFY+hUohyu9MUtr/qIgSvldWBc5io+
   g==;
X-CSE-ConnectionGUID: 3gq1KgGhSoe48vVpOfB1lQ==
X-CSE-MsgGUID: uPoq3+DgSeihw7iTh2vXIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="216965294"
X-IronPort-AV: E=Sophos;i="6.21,281,1763391600"; 
   d="scan'208";a="216965294"
Received: from unknown (HELO mail.fujitsu.com) ([51.138.80.169])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 18:04:00 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.fujitsu.com (Postfix) with ESMTPS id 8BB4148E
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:04:00 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 302C4C0119C
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:04:00 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 85670101A415;
	Mon,  9 Feb 2026 09:03:57 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 20/39] python3-cryptography: upgrade 46.0.3 -> 46.0.4
Date: Mon,  9 Feb 2026 17:02:58 +0800
Message-ID: <20260209090317.1468-20-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260209090317.1468-1-wangmy@fujitsu.com>
References: <20260209090317.1468-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:04:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230731

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Dropped support for win_arm64 wheels.
- Updated Windows, macOS, and Linux wheels to be compiled with OpenSSL 3.5.5.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/python/python3-cryptography-common.inc | 2 +-
 meta/recipes-devtools/python/python3-cryptography-vectors.bb | 2 +-
 meta/recipes-devtools/python/python3-cryptography.bb         | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-cryptography-common.inc b/meta/recipes-devtools/python/python3-cryptography-common.inc
index 24969828b1..789ce89e53 100644
--- a/meta/recipes-devtools/python/python3-cryptography-common.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-common.inc
@@ -3,4 +3,4 @@
 #
 # Additionally AUH will detect that they share this .inc file and
 # perform a lockstep upgrade for both.
-PV = "46.0.3"
+PV = "46.0.4"
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors.bb b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
index cff5681df1..1408b6b010 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
 SRC_URI += "file://0001-pyproject.toml-bump-uv_build-version-requirement.patch"
-SRC_URI[sha256sum] = "a23246fcb794fc87d814d1b4be20df74a299840a2430cc74651bc7ba0f3b548c"
+SRC_URI[sha256sum] = "fb8e489f5688d9751fd9631d4be0a0df3275698e78d6d753c1b8cf3ce4127c78"
 
 PYPI_PACKAGE = "cryptography_vectors"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/recipes-devtools/python/python3-cryptography.bb
index b3b45cd172..56dffa13ee 100644
--- a/meta/recipes-devtools/python/python3-cryptography.bb
+++ b/meta/recipes-devtools/python/python3-cryptography.bb
@@ -11,7 +11,7 @@ LDSHARED += "-pthread"
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography-vectors
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "a8b17438104fed022ce745b362294d9ce35b4c2e45c1d958ad4a4b019285f4a1"
+SRC_URI[sha256sum] = "bfd019f60f8abc2ed1b9be4ddc21cfef059c841d86d710bb69909a688cbb8f59"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://check-memfree.py \
-- 
2.43.0


