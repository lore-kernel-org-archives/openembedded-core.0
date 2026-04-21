Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BCF5F8923A
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 09:57:14 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20459.1776765425102075385
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 02:57:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=G74OKUTz;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776765426; x=1808301426;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SKwOXPF8bA7CJkXojc0nqu1prTddDOqZB+kId8K9xC8=;
  b=G74OKUTzPbBiNtsq3I2S4JhP9HfITDWzqMzko1jsQlS5StSbx0i1bryF
   OP7tdynXeI+3xk7gzmfm1P2WsvleCtWjMOypjg9f+LlaBq8CSg5asCFqw
   rsAhX5Oj4vpbjoe9Wny34IIaMInYDbtMKKb5ggH2b3lhVSaMmkgp29u8O
   /npVQC/9v2CFgN1bmncqbtw/gPJFSih4gyOuVWCqrX8N1nlksTcW80T6s
   +otSlitX6L9t3Br9REVkf+vrNmSgKUu1ZSavOg1xo4siNBMy6N8px6nRO
   X+++trNtLSsIOK4sM0vHWnoGXePRgKCWd8KQQ33R0TqsdAADxNUz0nDqq
   w==;
X-CSE-ConnectionGUID: hcsnMQe9S3OQEOuzc+4nQg==
X-CSE-MsgGUID: Bn3cQgctT4u2aibzzwgGVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="237630089"
X-IronPort-AV: E=Sophos;i="6.23,191,1770562800"; 
   d="scan'208";a="237630089"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 18:57:04 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 98C80143C
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:03 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 47716C00569
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:03 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id C27FD14000E6;
	Tue, 21 Apr 2026 09:57:00 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 32/49] python3-pyasn1: upgrade 0.6.2 -> 0.6.3
Date: Tue, 21 Apr 2026 17:55:42 +0800
Message-ID: <20260421095559.1856-32-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260421095559.1856-1-wangmy@fujitsu.com>
References: <20260421095559.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235640

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- CVE-2026-30922 (GHSA-jr27-m4p2-rc6r): Added nesting depth limit to ASN.1
  decoder to prevent stack overflow from deeply nested structures
- Fixed OverflowError from oversized BER length field
- Fixed DeprecationWarning stacklevel for deprecated attributes
- Fixed asDateTime incorrect fractional seconds parsing

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pyasn1_0.6.2.bb => python3-pyasn1_0.6.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyasn1_0.6.2.bb => python3-pyasn1_0.6.3.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-pyasn1_0.6.2.bb b/meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-pyasn1_0.6.2.bb
rename to meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb
index 01157e251e..fb572d9da4 100644
--- a/meta/recipes-devtools/python/python3-pyasn1_0.6.2.bb
+++ b/meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://pyasn1.sourceforge.net/"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=190f79253908c986e6cacf380c3a5f6d"
 
-SRC_URI[sha256sum] = "9b59a2b25ba7e4f8197db7686c09fb33e658b98339fadb826e9512629017833b"
+SRC_URI[sha256sum] = "697a8ecd6d98891189184ca1fa05d1bb00e2f84b5977c481452050549c8a72cf"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0


