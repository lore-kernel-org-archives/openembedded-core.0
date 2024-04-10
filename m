Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DAC7C67861
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 02:02:05 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.156454.1712714516566204972
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Apr 2024 19:01:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GyqVURMO;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1712714517; x=1744250517;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=0Cctxo18eyJXxRAz6SZSU5z2fK9YIBHZlD0BgM8JrmE=;
  b=GyqVURMOxioE8Fj2AicZJhkDx1IlkL/EkOTFjL+VWYgjDILTdOqlH4m5
   9mDazalKVg85K+sM5NrqEW7CmSQke8xWKPcsC/QJmN5Chv1YPEBtPdWPt
   pykVcwdnaVFbxF5uY1BlhGto7h/LLXvi5vfhDXVqAnFV4a17Zhhl5lT5m
   a8WdYK56yC9zLouROqJSlWjU7qfBXJMf3EjeA9LbpfngbQNn+e2FYRHJV
   bAmAt6pSca56QZNc8aak+CsOrqLw6g3og58gDExaTsFKn6QMd4QdluId2
   5xRRZCC8qR27RDUYhMn9VXkg/s6ehYnPLZDr4PudOqzZjaD6w6kldqRhO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="154984332"
X-IronPort-AV: E=Sophos;i="6.07,190,1708354800"; 
   d="scan'208";a="154984332"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 11:01:54 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id E585C101DE1
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 11:01:51 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0FCDFD949A
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 11:01:51 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9FA451EB1E3
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 11:01:50 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4DD871A000B;
	Wed, 10 Apr 2024 10:01:50 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] python3-pycparser: upgrade 2.21 -> 2.22
Date: Wed, 10 Apr 2024 10:01:40 +0800
Message-Id: <1712714500-23312-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1712714500-23312-1-git-send-email-wangmy@fujitsu.com>
References: <1712714500-23312-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28308.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28308.004
X-TMASE-Result: 10--7.657100-10.000000
X-TMASE-MatchedRID: QR1SVCCbVGSjz0nOeth/ydOEZs/2oH3c07hVxuupa6qw2OrHLtPdX64r
	mQIDoB6SjDVMw6TJvuFQ8Xx8xomnlhcjjtisuvRWv8fLAX0P50CRkhbJN5lbvo9osn8JrdJPSgC
	tQ2fV6is9rkouS7LK+dseKHBzEjWE7VrXqiqnwHX8dMpK2wMYwkc1DwKoQo7YwLkNMQzGl5CyqF
	LMy/lZpg8ik8Wrh4lLepi+JVYshcp4HMSQIKmdGW9OepgphdNGVeAZ5VSHdZ2bKItl61J/yZ+in
	TK0bC9eKrauXd3MZDWIzEPTT8Q4c8tsYmpTGhvdRRxM+7PhMAVEFT93JyzYK1uUoFjt9W7j
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 02:02:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198075

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
===============
Slightly tweak the LICENSE file to be more canonical:
- Copyright year updated to 2022.
- "Eli Bendersky: changed to "the copyright holder"

Changelog:
===========
-Add missing SCHAR limit defines
-Use proper SPDX identifier
-Add Python 3.11 as a supported version
-Fix multi-pragma/single statement blocks (#479)
-Add an encoding parameter to parse_file
-Feature/add pragma support
-Set up permissions to ci.yml
-_build_tables: Invalidate cache before importing generated modules
-Upgrade GitHub Actions
-Create a Security Policy
-New example to generate AST from scratch
-Add support for Python 3.12
-ply: Make generated lextab.py deterministic

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pycparser_2.21.bb => python3-pycparser_2.22.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pycparser_2.21.bb => python3-pycparser_2.22.bb} (69%)

diff --git a/meta/recipes-devtools/python/python3-pycparser_2.21.bb b/meta/recipes-devtools/python/python3-pycparser_2.22.bb
similarity index 69%
rename from meta/recipes-devtools/python/python3-pycparser_2.21.bb
rename to meta/recipes-devtools/python/python3-pycparser_2.22.bb
index 00deceebf9..9a5abc42bd 100644
--- a/meta/recipes-devtools/python/python3-pycparser_2.21.bb
+++ b/meta/recipes-devtools/python/python3-pycparser_2.22.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Parser of the C language, written in pure Python"
 HOMEPAGE = "https://github.com/eliben/pycparser"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2c28cdeabcb88f5843d934381b4b4fea"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9761c3ffee7ba99c60dca0408fd3262b"
 
-SRC_URI[sha256sum] = "e644fdec12f7872f86c58ff790da456218b10f863970249516d60a5eaca77206"
+SRC_URI[sha256sum] = "491c8be9c040f5390f5bf44a5b07752bd07f56edf992381b05c701439eec10f6"
 
 inherit pypi setuptools3
 
-- 
2.34.1


