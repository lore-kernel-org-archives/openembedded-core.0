Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A61EC369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 10:25:23 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.16539.1744712720911581793
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 03:25:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VEDPPRpn;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744712721; x=1776248721;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=85SVmsxk5MsroPtz+p074O/Ff9Kkss9vjVwKD9RWNRs=;
  b=VEDPPRpn3+HDVSacNNG0v94kwXlKQAWX+UKMum3QG6ff7BTWEaTDuhBm
   XVvulQnR+bJIGLkvMG1SSKYVRwDeF3/E3VvICqwuM+N2UTmI/px62e2Z6
   rnP2JeU12nwbRQDbI1OwPJjGsO5t8odr93Y1hkwdf8BLqR05GZIIhv0CY
   249dwIKXO9kh0bJ6ElvaOGn285ZqEPdRGpGR1awQtZO8fBWuo2YG9OZUj
   6v1dZ2bQgSxXyLFjAub5Xobwo3+LiUm8x7Vc2tDMB+P9TLZ2RWc+xV7R5
   fTaLokcCR9UlWhYQtc1+H7hYn/eZJu8nwWdWsY/9L/kTXlLeCrSSEytpT
   g==;
X-CSE-ConnectionGUID: YkhsehABTX2yuYJ1q/iR2w==
X-CSE-MsgGUID: BGOVJAEPRc6jDoH3tpekIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="184897024"
X-IronPort-AV: E=Sophos;i="6.15,213,1739804400"; 
   d="scan'208";a="184897024"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 19:25:18 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 616DAD6EA1
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 19:25:16 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1B730D50BA
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 19:25:16 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4A8601A0078;
	Tue, 15 Apr 2025 18:25:15 +0800 (CST)
From: Lei Maohui <leimaohui@fujitsu.com>
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org,
	Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [PATCH] python3-hypothesis: upgrade 6.129.2 -> 6.131.0
Date: Tue, 15 Apr 2025 18:25:12 +0800
Message-Id: <20250415102512.696-1-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 10:25:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214836

This package change to be built using python_setuptools_build_meta build class now

Changelog:
https://github.com/HypothesisWorks/hypothesis/blob/master/hypothesis-python/docs/changelog.rst

ptest result:
|Testsuite summary
|# TOTAL: 5
|# PASS: 5
|# SKIP: 0
|# XFAIL: 0
|# FAIL: 0
|# XPASS: 0
|# ERROR: 0
|DURATION: 23
|END: /usr/lib/python3-hypothesis/ptest
|2025-04-15T10:17
|STOP: ptest-runner
|TOTAL: 1 FAIL: 0

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


