Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 847DFF89237
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 09:57:14 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20402.1776765412223009380
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 02:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LDNj+4Q/;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776765428; x=1808301428;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tbwELot6XbZ7vKiK4Tqy86QxAOS67dKJDWoxsoM1WKk=;
  b=LDNj+4Q/8ZgY+v+Ce0LT+Cj359XG6i2z56RcTFjdg4RVWoyR5QgojiiY
   m0cs9T/L/5GO2UG2UxvQ2PLc2T+rMKBJWLX+spsSMobK2oM6UT3qD7Ttr
   G4XnK5+Br+b5YW7dJIVLtXxRqMiIgYCBsCzFpVO89eKbzQQi1aWQRa4HA
   0qFLgFDlkOUPAIL+1RZKAo2HgHLydBff2mzBl3r5REpWKqGVEE/bfWzhK
   ateH9gB0Q7Zm3hRJIZa05J+8yvSvMsA8YWmhW9M1EBVSLTQHLQB1jv+wU
   cqtdpmYx1dhEER2X4eMDjz5GhQAhzCjDsHhFZPZm7iFJC8Ucbu/+1X6vy
   A==;
X-CSE-ConnectionGUID: 1assG5lpT3uZxT0SknaiUA==
X-CSE-MsgGUID: lc5HzQUHSdmBhErSphAeNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="216474343"
X-IronPort-AV: E=Sophos;i="6.23,191,1770562800"; 
   d="scan'208";a="216474343"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 18:57:08 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 6E8A321FE
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:08 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 1C27C18026CB
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:08 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 90C6A140025F;
	Tue, 21 Apr 2026 09:57:05 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 35/49] python3-pytest: upgrade 9.0.2 -> 9.0.3
Date: Tue, 21 Apr 2026 17:55:45 +0800
Message-ID: <20260421095559.1856-35-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260421095559.1856-1-wangmy@fujitsu.com>
References: <20260421095559.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235643

From: Wang Mingyu <wangmy@fujitsu.com>

Bug fixes
============
- #12444: Fixed pytest.approx which now correctly takes into account
  ~collections.abc.Mapping keys order to compare them.
- #13634: Blocking a conftest.py file using the -p no: option is now explicitly
  disallowed.
- Previously this resulted in an internal assertion failure during plugin
  loading.
- Pytest now raises a clear UsageError explaining that conftest files are not
  plugins and cannot be disabled via -p.
- #13734: Fixed crash when a test raises an exceptiongroup with
  __tracebackhide__ = True.
- #14195: Fixed an issue where non-string messages passed to
  unittest.TestCase.subTest() were not printed.
- #14343: Fixed use of insecure temporary directory (CVE-2025-71176).

Improved documentation ======================
- #13388: Clarified documentation for -p vs PYTEST_PLUGINS plugin loading and
  fixed an incorrect -p example.
- #13731: Clarified that capture fixtures (e.g. capsys and capfd) take
  precedence over the -s / --capture=no command-line options in Accessing
  captured output from a test function <accessing-captured-output>.
- #14088: Clarified that the default pytest_collection hook sets session.items
  before it calls pytest_collection_finish, not after.
- #14255: TOML integer log levels must be quoted: Updating reference
  documentation.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pytest_9.0.2.bb => python3-pytest_9.0.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest_9.0.2.bb => python3-pytest_9.0.3.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-pytest_9.0.2.bb b/meta/recipes-devtools/python/python3-pytest_9.0.3.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-pytest_9.0.2.bb
rename to meta/recipes-devtools/python/python3-pytest_9.0.3.bb
index 007db2e732..bec521d3ef 100644
--- a/meta/recipes-devtools/python/python3-pytest_9.0.2.bb
+++ b/meta/recipes-devtools/python/python3-pytest_9.0.3.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "The pytest framework makes it easy to write small tests, yet scal
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bd27e41b6550fe0fc45356d1d81ee37c"
 
-SRC_URI[sha256sum] = "75186651a92bd89611d1d9fc20f0b4345fd827c41ccd5c299a868a05d70edf11"
+SRC_URI[sha256sum] = "b86ada508af81d19edeb213c681b1d48246c1a91d304c6c81a427674c17eb91c"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.43.0


