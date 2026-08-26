Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42456C61DCB
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:18:59 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7751.1787732334954998508
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:18:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JjQp69je;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787732335; x=1819268335;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KJiGTs6BI3q1vsz7yFOCn3ATkDD99xv8b/m0Bua0DrA=;
  b=JjQp69jeVa0kRIlRFVuk/8DIzsHP8yW5zM4GphPHeNntPCO/lY82Ix0/
   BnNNKHUhQrVLgp1fHmM3ZkV3LHyxuw2xTl+RuTedtYGsooO4wSYZouZTQ
   qbS1YpfqZzlvw4KAezxOp2YlhZMyovCfHYsUX0//IySFSo9Au1SF1vDUx
   jeROmiwZ1YA2MFYjVXLJ/sFpb19GQ9/EuFr4yXpaNtb8m1H30mtzjMtGT
   A8D0Ju278rBsajp+PdfvpN6bWftB4hOekhsvqg905LpOQg3gvbv2dXpK5
   ALncyabUT5AkW3UPvJhlkBk2opye/xQIObK9L/d0Mcf4HvG9gpUWr/I9n
   Q==;
X-CSE-ConnectionGUID: BR9nfgUsQuOrwlk47RaNDA==
X-CSE-MsgGUID: /4IO0ah3SM21A2wJhZXP7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="240170450"
X-IronPort-AV: E=Sophos;i="6.25,244,1779116400"; 
   d="scan'208";a="240170450"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 17:18:53 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 6BA4F40757B
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:18:53 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 2242F18026E2
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:18:53 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 422098214FB;
	Wed, 26 Aug 2026 08:18:51 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 17/17]  sbom-cve-check-update-nvd-native,sbom-cve-check-update-cvelist-native: upgrade 2026.08.03-000011 -> 2026.08.25-000009,2026-08-03 -> 2026-08-25
Date: Wed, 26 Aug 2026 16:18:32 +0800
Message-ID: <20260826081832.1059-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260826081832.1059-1-wangmy@fujitsu.com>
References: <20260826081832.1059-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:18:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244358

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...03.bb => sbom-cve-check-update-cvelist-native_2026-08-25.bb} | 2 +-
 ...bb => sbom-cve-check-update-nvd-native_2026.08.25-000009.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-cvelist-native_2026-08-03.bb => sbom-cve-check-update-cvelist-native_2026-08-25.bb} (89%)
 rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-nvd-native_2026.08.03-000011.bb => sbom-cve-check-update-nvd-native_2026.08.25-000009.bb} (89%)

diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-08-03.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-08-25.bb
similarity index 89%
rename from meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-08-03.bb
rename to meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-08-25.bb
index b2a6654503..75b2ad8257 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-08-03.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-08-25.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/CVEProject/cvelistV5"
 SRC_URI = "git://github.com/CVEProject/cvelistV5.git;branch=main;protocol=https;destsuffix=;tag=${PV}_baseline"
 SBOM_CVE_CHECK_DB_NAME = "cvelist"
 
-SRCREV = "b160e6f2915ac726b29ee0689fc920f5016abef5"
+SRCREV = "ce11dbdcf79189e965d64b29161af93993619281"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>.+)_baseline"
 
 require sbom-cve-check-update-db.inc
diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.08.03-000011.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.08.25-000009.bb
similarity index 89%
rename from meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.08.03-000011.bb
rename to meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.08.25-000009.bb
index 7c4c0511f8..43f077e267 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.08.03-000011.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.08.25-000009.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/fkie-cad/nvd-json-data-feeds"
 SRC_URI = "git://github.com/fkie-cad/nvd-json-data-feeds.git;branch=main;protocol=https;destsuffix=;tag=v${PV}"
 SBOM_CVE_CHECK_DB_NAME = "nvd-fkie"
 
-SRCREV = "b9f52bb052695dac5cabbd58e049eaac73697161"
+SRCREV = "08cb7bde86fe9057c2338d7d61a705e642775bfd"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.+)"
 
 require sbom-cve-check-update-db.inc
-- 
2.43.0


