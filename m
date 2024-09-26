Return-Path: <s-tokumoto@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D68FCCF9E9
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 11:01:36 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.39787.1727348491290584267
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Sep 2024 04:01:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=R3B25GrW;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: s-tokumoto@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727348491; x=1758884491;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DFyJCGu+x/jXR5IzG9QnDg7KLjpfziWpr6uqxgcMBpc=;
  b=R3B25GrWmNi8XEbb4h9QYUzms1vu4faOFZ4PBklVyFdDjBhhhDY8TR5q
   ayA2GUd5OdU1n0BBQ48fLHIR/Jr23lsND3Wos6E4AxmPdA3niFeOpADGR
   K5dS/F8jk9Nz2ZbgpNVB/TaVgE1qk2cNG4CFnAxYL2tn03LmEwE9nHWuu
   RStsfrmBAr8RR3XjFKFz0j8Tf6l08IXUyX7Da5WDlThjqpxapcVUBolM8
   ggGs4sQGDZ3rFBvPgvEtEnetoDx8sNvnXCmxSBgrQ2h1klTz/pLaFo463
   nBrijJV2rSefsx0yxhnTb14ka14yoLiguz2RCNoTwmfSedn14nInHoqtT
   w==;
X-CSE-ConnectionGUID: bk/obFQoSWuR1SuOzAVb1w==
X-CSE-MsgGUID: J/ptGaffQmewHZh0ZnBvEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="153780300"
X-IronPort-AV: E=Sophos;i="6.10,155,1719846000"; 
   d="scan'208";a="153780300"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 20:01:28 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 980DDD800F
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 20:01:26 +0900 (JST)
Received: from storage.utsfd.cs.fujitsu.co.jp (storage.utsfd.cs.fujitsu.co.jp [10.118.252.123])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id E1738D7530
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 20:01:25 +0900 (JST)
Received: by storage.utsfd.cs.fujitsu.co.jp (Postfix, from userid 1002)
	id B6B57D0EE; Thu, 26 Sep 2024 20:01:25 +0900 (JST)
From: Shunsuke Tokumoto <s-tokumoto@fujitsu.com>
To: openembedded-core@lists.openembedded.org,
	tgamblin@baylibre.com
Cc: s-tokumoto@fujitsu.com
Subject: [PATCH] python3-setuptools: Add "python:setuptools" to CVE_PRODUCT
Date: Thu, 26 Sep 2024 20:01:03 +0900
Message-Id: <20240926110103.29905-1-s-tokumoto@fujitsu.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 11:01:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204973

Since there are vulnerabilities that cannot be detected by the existing
CVE_PRODUCT, add "python:setuptools" to CVE_PRODUCT.

https://nvd.nist.gov/vuln/detail/CVE-2013-1633
https://nvd.nist.gov/vuln/detail/CVE-2022-40897

Signed-off-by: Shunsuke Tokumoto <s-tokumoto@fujitsu.com>
---
 meta/recipes-devtools/python/python3-setuptools_72.1.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb b/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb
index 945d443aff..5a01111934 100644
--- a/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=141643e11c48898150daa83802dbc65f"
 
 inherit pypi python_setuptools_build_meta
 
+CVE_PRODUCT = "python3-setuptools python:setuptools"
+
 SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-easy_install.patch"
 
 SRC_URI += " \
-- 
2.46.0


