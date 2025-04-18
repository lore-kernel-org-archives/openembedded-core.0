Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8F2AC369C2
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 01:34:13 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.3283.1744940052160922814
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 18:34:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LwUgtp1v;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744940052; x=1776476052;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rroaGpayPlEUhgdchJRlQPI4hh+Unb8vJZfQQy3cUEw=;
  b=LwUgtp1vq9YjkrvGoBCttHKBYkCFm3LBEXQIGqfUu8g1tnMdHdyHWgav
   5EaORh20wHs9YalZUbgQ342IkTvJ6OLKDOSPW9rLNwFdA2C2X0KFJdwAR
   uknFNqCk3+nonCvJBljqEuYEceraGNwhLhT70VhpGIgBCHzF9xxufUohv
   Sx9toJmZvRYl58fwA4OYOeWEKS1/mvqjNm/aT+d7o6RM052EltixWdoZW
   faCEy9Ed/r6fGBGM+1jBkfvNfgzDCS4wVcEYS6FH2KuUdAAwa6nhroToJ
   sBO2Ui8Vo9AE+Q9K1hkSD76Ev9oPRvVzqrEr6rllPIVmJSPc0Nu9/lmy5
   g==;
X-CSE-ConnectionGUID: UNXtctCRQhGCNgNZO0/oag==
X-CSE-MsgGUID: JGLAPsmwR8eUKZUfIczZFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="175720844"
X-IronPort-AV: E=Sophos;i="6.15,220,1739804400"; 
   d="scan'208";a="175720844"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2025 10:34:09 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id D1AACD4807
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Apr 2025 10:34:07 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8AF26D949D
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Apr 2025 10:34:07 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B2A061A0071;
	Fri, 18 Apr 2025 09:34:06 +0800 (CST)
From: Lei Maohui <leimaohui@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [PATCH v2 1/2] python3-hypothesis: upgrade 6.129.2 -> 6.131.0
Date: Fri, 18 Apr 2025 09:34:03 +0800
Message-Id: <20250418013404.869-1-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Apr 2025 01:34:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215120

This package change to be built using python_setuptools_build_meta build class now

Changelog:
https://github.com/HypothesisWorks/hypothesis/blob/master/hypothesis-python/docs/changelog.rst

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 ...n3-hypothesis_6.129.2.bb => python3-hypothesis_6.131.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.129.2.bb => python3-hypothesis_6.131.0.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.129.2.bb b/meta/recipes-devtools/python/python3-hypothesis_6.131.0.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-hypothesis_6.129.2.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.131.0.bb
index df9bd6b7c7..0542a9d188 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.129.2.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.131.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4ee62c16ebd0f4f99d906f36b7de8c3c"
 
 PYPI_PACKAGE = "hypothesis"
 
-inherit pypi setuptools3 ptest
+inherit pypi python_setuptools_build_meta ptest
 
 SRC_URI += " \
     file://run-ptest \
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "23f180782dbbbcb6e59051794295d75783ad59241e6629a5bf700936c28a995b"
+SRC_URI[sha256sum] = "4b807daeeee47852edfd9818ba0e33df14902f1b78a5524f1a3fb71f80c7cec3"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.43.0


