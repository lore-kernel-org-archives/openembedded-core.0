Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1F60F8922B
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 09:57:03 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20402.1776765412223009380
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 02:56:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RNRip13U;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776765414; x=1808301414;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mkG/IMRP1AUAuFiEe2oxT9TZXPayuDW5xJvJBy8yCys=;
  b=RNRip13UWex02KpDj13bpI0gh8AbsiTrmPqDImMigxKcq7g2c6gXVXpG
   1A5lXfV26mxGQgIlJ5Gp+Z5Y0pVpJGTc8IZlvAryGQN9/p3K8uSi9AMgn
   obar4KcaZNznA9zbydlMJNOgd/hMZTInK/3ZTaaKOG9B5KNuhOSicBHu0
   85sfwnjvSO0ANYJPHI03GU4uoH2Zsd70KdaWHPNXtns6PQTl+UjQD+roU
   09SD2V6tX+jSCUyQzdHtiElmPaHQfgUgiIPT8aX04fGwqKeb0g9z7hCTA
   DLvpais1Nz2M+pBkj/4GOypATXy9Wh6J+9IoxF2kKBdfbjxWVo2cB1buP
   A==;
X-CSE-ConnectionGUID: M1BelYNIQvizs07cyras5g==
X-CSE-MsgGUID: +cHIJFVlRlu04xJsbwnoTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="216474323"
X-IronPort-AV: E=Sophos;i="6.23,191,1770562800"; 
   d="scan'208";a="216474323"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 18:56:53 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 0EE4742A335
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:54 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id ABF5E1C0010A
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:53 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 25C5D140027F;
	Tue, 21 Apr 2026 09:56:50 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 26/49] python3-editables: upgrade 0.5 -> 0.6
Date: Tue, 21 Apr 2026 17:55:36 +0800
Message-ID: <20260421095559.1856-26-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260421095559.1856-1-wangmy@fujitsu.com>
References: <20260421095559.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235634

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Line endings in the license file were changed from CRLF to LF.

Changelog:
==========
- Add a new "self_replace" strategy for map (and name the old strategy
  "import_hook"). Based on an idea
- Rename the generated .pth file to _editable_impl_<project>.pth and document
  that it is possible to customise the file names used.
- Rework the documentataion, replacing the "use cases" section with an expanded
  and less opinionated "scope" section.
- Test suite improvements.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-editables_0.5.bb => python3-editables_0.6.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-editables_0.5.bb => python3-editables_0.6.bb} (60%)

diff --git a/meta/recipes-devtools/python/python3-editables_0.5.bb b/meta/recipes-devtools/python/python3-editables_0.6.bb
similarity index 60%
rename from meta/recipes-devtools/python/python3-editables_0.5.bb
rename to meta/recipes-devtools/python/python3-editables_0.6.bb
index 11566f096b..783ac01bde 100644
--- a/meta/recipes-devtools/python/python3-editables_0.5.bb
+++ b/meta/recipes-devtools/python/python3-editables_0.6.bb
@@ -2,9 +2,9 @@ SUMMARY = "A Python library for creating editable wheels"
 HOMEPAGE = "https://github.com/pfmoore/editables"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=41bc1be47b7bb8240db3ef928c7cb0bf"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d731fc2dd253a6e78010aabef22fa987"
 
-SRC_URI[sha256sum] = "309627d9b5c4adc0e668d8c6fa7bac1ba7c8c5d415c2d27f60f081f8e80d1de2"
+SRC_URI[sha256sum] = "1163834902381c4613787951c5914800fdf155ae08848a373b8ea5006780977c"
 
 inherit pypi python_flit_core
 
-- 
2.43.0


