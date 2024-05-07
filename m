Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6988C25B5C
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 02:23:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by mx.groups.io with SMTP id smtpd.web11.2336.1715048594666835286
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 May 2024 19:23:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=IiCpt/h4;
 spf=pass (domain: intel.com, ip: 192.198.163.11, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715048599; x=1746584599;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=aJw4FKPYFOaoNKJeRqBWS/nhBLxSxy8eBl6hTEbPT3E=;
  b=IiCpt/h4xw/1TxLrVdlGuIbXMh2OM7s48J04Iepa5usVKRPHpHt8xVRh
   iSnOwRoIgEz8HKIKfSBDdPrznDdnPBLsfCuB0akuB/skKOfDt521XSfbT
   iGcyzhtRRanP0etYv3TEFMLqUbITKyVdqrvRSznDRjWtOW8lK3nTihi1F
   K4/XfS+F7cBV4onvNpFJMf5hhNCjUYpjeg448RxL+iciPqx4Wy40JCQEv
   dKC7Kx9Y+7EgLkcBovUSB0K2zs5jjnSOqgNty4fObz15CINT5+O2hWiJf
   K/eM9eDRVZtrrSahjDv7q45FxEdcfAQjLyzaU3t3dR9aIsFZtaBefz19j
   A==;
X-CSE-ConnectionGUID: fr/WjSZeRhSKjVR3VnFgYg==
X-CSE-MsgGUID: squIBCA1R+C1np0Op3dTwg==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="21432116"
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; 
   d="scan'208";a="21432116"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 19:23:18 -0700
X-CSE-ConnectionGUID: GvMksdf1QHiGLNuMRJ9+Nw==
X-CSE-MsgGUID: eNcgRZw/RgWivvFavq8gig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; 
   d="scan'208";a="28445784"
Received: from anmitta2-mobl3.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com) ([10.247.119.181])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 19:23:18 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] libsolv: upgrade 0.7.28 -> 0.7.29
Date: Tue,  7 May 2024 10:23:06 +0800
Message-ID: <20240507022308.13637-4-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240507022308.13637-1-anuj.mittal@intel.com>
References: <20240507022308.13637-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 02:23:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199061

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../0001-utils-Conside-musl-when-wrapping-qsort_r.patch      | 5 +----
 .../libsolv/{libsolv_0.7.28.bb => libsolv_0.7.29.bb}         | 2 +-
 2 files changed, 2 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.7.28.bb => libsolv_0.7.29.bb} (95%)

diff --git a/meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch b/meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch
index 6f0dea2e9cd..da93a12ed54 100644
--- a/meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch
+++ b/meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch
@@ -1,4 +1,4 @@
-From 06321f1a2aa89b8e028946e793344657eaad0165 Mon Sep 17 00:00:00 2001
+From e1db3c41fa84391b7ab299f7351f58b413ed2994 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 28 Oct 2021 22:28:45 -0700
 Subject: [PATCH] utils: Conside musl when wrapping qsort_r
@@ -29,6 +29,3 @@ index 72426e09..8f29bc5a 100644
  
  void
  solv_sort(void *base, size_t nmemb, size_t size, int (*compar)(const void *, const void *, void *), void *compard)
--- 
-2.33.1
-
diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.28.bb b/meta/recipes-extended/libsolv/libsolv_0.7.29.bb
similarity index 95%
rename from meta/recipes-extended/libsolv/libsolv_0.7.28.bb
rename to meta/recipes-extended/libsolv/libsolv_0.7.29.bb
index 201059323aa..ff0bd2d1742 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.28.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.29.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https \
            file://0001-utils-Conside-musl-when-wrapping-qsort_r.patch \
 "
 
-SRCREV = "c8dbb3a77c86600ce09d4f80a504cf4e78a3c359"
+SRCREV = "9c2b1a84b5a7ce0dc6e74226bdeb9527d6706791"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.45.0


