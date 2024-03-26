Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5667CD11DC
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 00:37:43 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.7882.1711413460052867316
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Mar 2024 17:37:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PbbTEIRq;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711413460; x=1742949460;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=yZoZqXujWQNfsL6bJaj0xb4LhagXTIyqjyS8lHiNhRc=;
  b=PbbTEIRqdQ/zGYKFphJiteDAEzjAaoAWEKqIIRzrtLzadnG+64ibv/tF
   POG8W92ATdADtbuSO9rp1bg+kNt6P02SsR4ggHdjAZsvem/XYVMlu985u
   /3uDAxomg4cTy736p/pnpQjvIjiajk4SIT2Tabiqclychdi+8pOnCZipy
   LEzRZvdXVde6kQQEI4xC1ZvsJRLu3PiIQsVhIL5+9+8IWJ7se8PkczIoB
   Sf5uzU6mozpqLBguez5/vh9Lq7zclEELUwQEv454rak0cucw258aE88GO
   NVyIj7emuYNDRyrZHt7GmbN0edh3kYlKRUp6fL8KJjruauSdtBWaxxw9A
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="153207826"
X-IronPort-AV: E=Sophos;i="6.07,154,1708354800"; 
   d="scan'208";a="153207826"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:37:38 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id C37F3D9F04
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:35 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 01720E6505
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:35 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 87F04411BE
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:34 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 346B91A006D;
	Tue, 26 Mar 2024 08:37:34 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-Core] [PATCH 23/34] python3-packaging: upgrade 23.2 -> 24.0
Date: Tue, 26 Mar 2024 08:34:41 +0800
Message-Id: <1711413292-3025-23-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
References: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28274.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28274.003
X-TMASE-Result: 10-0.042400-10.000000
X-TMASE-MatchedRID: PXzrFdFmygGjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyv+Aw16GgqpO1uR
	pvCDkvBu4U2a9GC6RIABznKRCq1E2Ra79mAscGMWHPYwOJi6PLkzH9fKfKqyu1SOymiJfTYXp90
	q5YnKIbIwrpuUqvSu8CLebaXr2O4UBiGh5tdLioc/QdUh6LEl0PX71s7cIJuTv10rEDVrQnhDSR
	dvC3OxLrGu4pFPiG0O6RiNQ+hpb+00m8B0PrHPMaoXHZz/dXlxTJDl9FKHbrmysPB8dBBorXKn6
	DBj/gsEIvrftAIhWmIAf/HImzvCGOYGRpv0VVRxuce7gFxhKa0BQOqUsWgx5oFum2PEjqt1o8WM
	kQWv6iXBcIE78YqRWo6HM5rqDwqt2XsCkMfeCT/KZEnVoCvbJuu9GetTe07jt9hX4lrV9/s1hCM
	Ev8Ee8kOxjPP9HQRF7NX0aWS4TQZlCexikG48tYIM3sFDoKqhHSbhGbmGylXFJK7yLnZRGZdO3Q
	67ImL8gi4RUz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 00:37:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197513

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Fix specifier matching when the specifier is long and has an epoch
-Clarify version split/join usage
-Default optional metadata values to None
-Stop using deprecated/removed keys
-Correctly use the ExceptionGroup shim only when needed
-Update CHANGELOG entry about validate kwarg
-Support --disable-gil builds (PEP 703) in packaging.tags
-Skip test_glibc_version_string_ctypes_raise_oserror if ctypes is unavailable
-Enable CodeQL
-PEP 703: Rename Py_NOGIL to Py_GIL_DISABLED
-Replace PEP references with PUG links
-Remove coverage ignore for non-existent file
-Update URLs
-Configure dependabot
-Hash pin github actions
-Apply some refurb suggestions
-Appply some bugbear suggestions
-Apply some ruff suggestions
-Add riscv64 as a supported manylinux architecture

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-packaging_23.2.bb => python3-packaging_24.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-packaging_23.2.bb => python3-packaging_24.0.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-packaging_23.2.bb b/meta/recipes-devtools/python/python3-packaging_24.0.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-packaging_23.2.bb
rename to meta/recipes-devtools/python/python3-packaging_24.0.bb
index 2d35936615..0942eeb15e 100644
--- a/meta/recipes-devtools/python/python3-packaging_23.2.bb
+++ b/meta/recipes-devtools/python/python3-packaging_24.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/packaging"
 LICENSE = "Apache-2.0 | BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=faadaedca9251a90b205c9167578ce91"
 
-SRC_URI[sha256sum] = "048fb0e9405036518eaaf48a55953c750c11e1a1b68e0dd1a9d62ed0c092cfc5"
+SRC_URI[sha256sum] = "eb82c5e3e56209074766e6885bb04b8c38a0c015d0a30036ebe7ece34c9989e9"
 
 inherit pypi python_flit_core
 
-- 
2.34.1


