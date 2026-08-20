Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 146C4C5DF8E
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 09:07:30 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3034.1787216847341274971
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 02:07:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=cjVkSWoM;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1418; q=dns/txt;
  s=iport01; t=1787216847; x=1788426447;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ThA08h4dLv4KR0M0vBGFIOF0xYOHnQDX/cZ1wqS1txg=;
  b=cjVkSWoM6siDZSW2w+AbsHYqo99to5CwmjEufAJes+wm/R/2a/w+2KlE
   c8/ckrVnWr49qrztSVoZzvamC3pkQkNfIES20tUb9tIUB+MGESyxEReWa
   mG43CeAncBuNljvtt3g2sHBoMquIdDsw+pthKqL/fElIVJ0XiycGlFQ8a
   S9ogB5gL02rqBz+eMdabSv9YburSb0/NhvvDlA3wSA7L1yNROYdvbCmdQ
   a3zPY2cfafKYgVvY5qckXH6Ow4uOLoVwYORyFwNMY6k8f6DxTLzPOP4Is
   ghc3ykopRL7EOts68q9o1iP5Tscf9zuiUQpKXDXhaM5NIy83l/P/wqZE6
   g==;
X-CSE-ConnectionGUID: 03NRLsYPTyCEo2pZhxcsLA==
X-CSE-MsgGUID: LuxX2bsgTFylRcoJKqyI/A==
X-IPAS-Result: =?us-ascii?q?A0BCAgAdw4Zq/5EQJK1aglmCV3ReQ0mTWQGCBJ8KgX4PA?=
 =?us-ascii?q?QEBDzcaBAEBhQWNbQImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4Zchl02ARgBLTBcRIMCAYJ0A8JDgiyBAYMoAYFU2zABCxQBBYEzhT+II?=
 =?us-ascii?q?naEfCcbG4FyhH6FEIV4BIIigQyTSkiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yH?=
 =?us-ascii?q?YEjPheBDRsGBYEdgSiENyMZNnyBCV6BKyphARIXgQmCCgKCcIIGAgFJRQ4JF?=
 =?us-ascii?q?wsYDUgRLDcUGQQ+bgeOUSCCS4EOgUSnCqEPCiiDdowhlToaM6psLphapCM3h?=
 =?us-ascii?q?GmBaDyBWXAVgyIJShkPji4V0BknMgI7AgcCBw4DC5NmAQE?=
IronPort-Data: A9a23:wJc9/KscGRcgGr/ZcHgI5Fr8cOfnVABfMUV32f8akzHdYApBsoF/q
 tZmKT+Hb/jfamLzfdl3PdywpBlSv8DczNVhHlNsrCpmF34RgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZTdJ5xYuajhKs/La+Us11BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIwor1RO0VVx
 MQkORsgaUqbteKmy6mfY7w57igjBJGD0II3s3Vky3TdSP0hW52GG/WM7t5D1zB2jcdLdRrcT
 5NGMnw0MlKZPVsWZgp/5JEWxI9EglHzfiNRrkmVvYI84nPYy0p6172F3N/9KoXRHJsPzxvGz
 o7A10DkEiFAPseQ9RSU9kingc3shDLaH6tHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS4QWJzO/Qpg2eHGVBFm4HY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:Vob1/KuqrmxtIsILQcJpErwi7skDWtV00zEX/kB9WHVpmwKj+P
 xG+85rsCMc5wxxZJhNo7290cq7MBHhHOBOgbX5VI3KNGKNhILCFu9fBOXZrwEIMheOktK1rZ
 0QEJRWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqEuEiWpRGthdB8ATMHf8LnFL
X-Talos-CUID: 9a23:A5Xr8Wx3dRAR5XhMujpZBgVMQeYfVmbs9EvBCGK/U35bSK2eUnu5rfY=
X-Talos-MUID: =?us-ascii?q?9a23=3AIydxgQ2Q1ZhjyocVkanGkOBv/zUjx7m+OBoHipo?=
 =?us-ascii?q?6ldiADyd3GRSEnRXwa9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,232,1779148800"; 
   d="scan'208";a="813162956"
Received: from alln-l-core-08.cisco.com ([173.36.16.145])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 09:07:26 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-08.cisco.com (Postfix) with ESMTPS id 806B81800046A;
	Thu, 20 Aug 2026 09:07:26 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 1B855CC12A9; Thu, 20 Aug 2026 02:07:26 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH] python3-git: fix CVE_PRODUCT
Date: Thu, 20 Aug 2026 02:07:26 -0700
Message-Id: <20260820090726.60839-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 09:07:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243828

From: Tim Orling <tim.orling@konsulko.com>

Using the pypi.bbclass default CPE of python:GitPython detects no CVEs.
With CVE_PRODUCT = "gitpython_project:gitpython" we properly detect
9 CVEs, with 4 unpatched.

WARNING: python3-git-3.1.42-r0 do_cve_check:
Found unpatched CVEs: CVE-2026-42215, CVE-2026-42284,
CVE-2026-44243, CVE-2026-44244

Note: The original commit targeted python3-git_3.1.43.bb. This is
adjusted for Scarthgap, where the recipe version is 3.1.42.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3a6af75a33b4e007f0d3a247b6a149e32d51e510)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-devtools/python/python3-git_3.1.42.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.42.bb b/meta/recipes-devtools/python/python3-git_3.1.42.bb
index 19885a58c7..79f8ec736a 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.42.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.42.bb
@@ -10,6 +10,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5279a7ab369ba336989dcf2a107e5c8e"
 
 PYPI_PACKAGE = "GitPython"
 
+CVE_PRODUCT = "gitpython_project:gitpython"
+
 inherit pypi python_setuptools_build_meta
 
 SRC_URI[sha256sum] = "2d99869e0fef71a73cbd242528105af1d6c1b108c60dfabd994bf292f76c3ceb"
-- 
2.35.6

