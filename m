Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 000E1CD12A2
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 07:10:57 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.130856.1712646648325041376
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Apr 2024 00:10:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jVSY8ZSi;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1712646653; x=1744182653;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=JEVT3YokE1bSdjyloGExw3utG5CnI09IWYmskZV3nSw=;
  b=jVSY8ZSiASBOgcbwPxxPvTcBUFmiC65TsT/C+7VXzcD/1NRkGDd3OV+S
   Zvu8HrFlCMHkNUh/UAIwI5I7J4DxhRJNKxl4wk1P0guz7ZQK4Wt3vnkJL
   OTDsK0p22iQrw6SiPlZXbrbAD9GE60iY1RKfGYZWvlfotJS2DKT7U8ToG
   A6KAGfXlmafc7nD0p0Gp5r40EhkWCQZOzl+X9gqFOscBR2c6PBU5GjEcB
   G9biGvdtqtGrCbVXgPhcbQVO7c3vJ5KEiCwvDvhw717Ef2hkvel8aYKdC
   r3SYrlcWvrVjBLNPgJ4uDlFfgaEvTpNnOrojUkTjKOKS0+M4ZVxGc9djA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="143488799"
X-IronPort-AV: E=Sophos;i="6.07,188,1708354800"; 
   d="scan'208";a="143488799"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 16:10:52 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9CB88101DF6
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:50 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id D7952D3DE2
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:49 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 73EE520093260
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:49 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 228A91A0002;
	Tue,  9 Apr 2024 15:10:49 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 28/33] python3-pycparser: upgrade 2.21 -> 2.22
Date: Tue,  9 Apr 2024 15:10:15 +0800
Message-Id: <1712646620-16608-28-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
References: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28306.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28306.006
X-TMASE-Result: 10--4.123000-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqyAI7Mvq/sL55Zh
	jmb07zEXPSx4k016vSWF53AF7zp3pTM/X6EouZRw8KdIN9q4LF/Q2dRRUyVMpu2N+fLk/cblvqn
	FtM6Nq/L7tBxFpWhrycYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgH2K2idm6bheEd+K6O5Nt53W9n
	uzdghUMnp5QGOMb8EgLmth8cTQ473lRxm3A2wKuhRFJJyf5BJeGEkIgdGU7nX6C0ePs7A07blX3
	Pe+qTcqRD4Toat4KL5DGhnZ+ze9sL7+RBnPeBynfwRNScn6L5l+s+HWbmUAg5PCnb4f8KWPvNe6
	eey/P/3ZuspYQeX9CTYtlUKXkwHS8gwWDQic4+rPmACeZqO85TioKJ2WPUxTLS4AEOLjtwA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 07:10:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198045

From: Wang Mingyu <wangmy@fujitsu.com>

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


