Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0832AF89231
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 09:56:54 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20402.1776765412223009380
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 02:56:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KS57gINX;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776765412; x=1808301412;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PK3BFB3BW3XpYnErLg+MZxbdvBbcJiZHlYOr13RtQG8=;
  b=KS57gINXhUtTWNclpfGh1vfuFrEpWG1rVKy70/eMrJ8f++Frl1xKnMJY
   T8crobRljdeJjj1mck5Q3PeBUFxjJlE4D1GkPT9bS6mLllAQnWnzHSBh/
   gIQbVC26fyLKG/v0qoXN5RFdmzNiOQKjvqSCwwmQk23IsSZ9/DuICTt7w
   TvBWSoF2dCc+kOSF+L6tiaXRVBwAqGThMHiTb5EA+fEfWNPrGDiCWCWxV
   FpeZGODDokrF97gp97zGRsjARW8mwrO2GUbsJUh/cApgxfEzKdDCcL4j8
   MhN+6wk1or1nIzf2PTI+XycQw7kMqlAANGxlNIFF8i8vwqW30/n/NtgME
   w==;
X-CSE-ConnectionGUID: e3rKqlaJT3aRb0cRBbKLoA==
X-CSE-MsgGUID: 7/PdzgLtTfWpavBctYuRDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="216474315"
X-IronPort-AV: E=Sophos;i="6.23,191,1770562800"; 
   d="scan'208";a="216474315"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 18:56:50 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id A6BFAC000B2
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:50 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 58D3C1400362
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:50 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id EF64814002C2;
	Tue, 21 Apr 2026 09:56:47 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 24/49] python3-chardet: upgrade 6.0.0.post1 -> 7.4.3
Date: Tue, 21 Apr 2026 17:55:34 +0800
Message-ID: <20260421095559.1856-24-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260421095559.1856-1-wangmy@fujitsu.com>
References: <20260421095559.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235632

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Change 7.x license to 0BSD

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-chardet_6.0.0.post1.bb => python3-chardet_7.4.3.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-chardet_6.0.0.post1.bb => python3-chardet_7.4.3.bb} (68%)

diff --git a/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb b/meta/recipes-devtools/python/python3-chardet_7.4.3.bb
similarity index 68%
rename from meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb
rename to meta/recipes-devtools/python/python3-chardet_7.4.3.bb
index 14c3247b35..ad36834169 100644
--- a/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb
+++ b/meta/recipes-devtools/python/python3-chardet_7.4.3.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Universal encoding detector for Python 2 and 3"
 HOMEPAGE = "https://pypi.org/project/chardet/"
-LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=4bf661c1e3793e55c8d1051bc5e0ae21"
+LICENSE = "0BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=bd0753b9dc12e5e3da3047778fcf1dca"
 
-SRC_URI[sha256sum] = "6b78048c3c97c7b2ed1fbad7a18f76f5a6547f7d34dbab536cc13887c9a92fa4"
+SRC_URI[sha256sum] = "cc1d4eb92a4ec1c2df3b490836ffa46922e599d34ce0bb75cf41fd2bf6303d56"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


