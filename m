Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E303ECD1283
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 00:37:43 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.7877.1711413455301181085
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Mar 2024 17:37:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=I/PkNI4P;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711413456; x=1742949456;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=k/Cp7ds3VEGvMbh2KKmw4eSjs6q2tVQ0rgB5gRhYINs=;
  b=I/PkNI4PMIqRzH2vyP8Za+Ul0vpXiiwgMJwlkF2SvKfr6yZLEwKzjlc6
   6PfxAFVnWjvSGwNiPT2tG+CqXT996SAN7eC26HzvtGaONncgEBJ9stfyb
   84ZUan/Vl2Ldmy3Ho3oOHesGSJcXtNMrhSriSXUt/UAE1od+hODlc1nxJ
   4IO+s7IBUUR8RglnBiLtHE5oIK1HiMyfjhjdOsiAzIiE2q+Ia2Dz4Vj8c
   8vnvo7T9weXnS6OC6sNZjhN7dY7o0ACTlZQbszdVkWYSH7bSsLub95PP3
   zS0X7woGBVXrVut54h6WhFN4UiHCTcXEv88U7Fe3o8Ybw0/wbv7sOs6Jb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="132640446"
X-IronPort-AV: E=Sophos;i="6.07,154,1708354800"; 
   d="scan'208";a="132640446"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:37:34 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id BDDF3D5A43
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:31 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 06F8EE6505
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8909B6B4C5
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:30 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 35DAE1A006A;
	Tue, 26 Mar 2024 08:37:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-Core] [PATCH 19/34] python3-hatchling: upgrade 1.21.1 -> 1.22.4
Date: Tue, 26 Mar 2024 08:34:37 +0800
Message-Id: <1711413292-3025-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
References: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28274.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28274.003
X-TMASE-Result: 10-0.317500-10.000000
X-TMASE-MatchedRID: KEcVumlYY7qjz0nOeth/yUIIxwDaU5mr2+EDPw+8xrfPWp1UK7zV9zy7
	zxidHhYpJ2spf+DCeJzmmOMcx/YJHm19PM7BUcjvfOaYwP8dcX6061diBteN1/4DDXoaCqk7O5G
	gDUtVs9Q789MRlPRgIKecaazZzVIciHIw0ZqUA7gSEYfcJF0pRSKajbeLFjgOC+tsVwfgbatc8y
	SkOeYygr2jand2PRF8dk3TBobQ8JDtWteqKqfAdfx0ykrbAxjCRzUPAqhCjtjAuQ0xDMaXkLKoU
	szL+Vmm6bBSVCmGWSd5OPD8XJFfpB8TzIzimOwPC24oEZ6SpSmcfuxsiY4QFGwBSZ+5a9dmSx9R
	7M9vEiBy85ZEWNCLRZ0oNCDEwhaUr/7wQUGFRdBHUuAPeO5kUz0enqwd8lvLXSDhYWKwORbH0Hx
	Ogj2Mfux9n1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 00:37:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197509

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
Added:
----------
-Metadata for the wheel target now defaults to the PKG-INFO metadata within
 source distributions
-Add dependencies method to the build hook interface so that hooks can
 themselves dynamically define dependencies
-Update SPDX license information to version 3.23
-Improve error message for when the default heuristics for wheel file inclusion
 fail
-Update the default version of core metadata to 2.3

Fixed:
-----------
-Properly support core metadata version 2.2
-Only read source distribution metadata for fields that are explicitly defined
 as dynamic
-Fix the custom build hook when using dynamic dependencies
-Fix regression when loading metadata from source distributions
-Fix metadata hooks when building wheels from source distributions
-Remove editables as a direct dependency
-Fix default wheel tag when the supported Python version declaration is strict
-Load VCS ignore patterns first so that whitelisted patterns can be excluded by
 project configuration
-Don't consider VCS ignore files that are outside of the VCS boundary
-The sdist build target now gracefully ignores UNIX socket files
-Begin ignoring certain files ubiquitously, like .DS_Store on macOS

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-hatchling_1.21.1.bb => python3-hatchling_1.22.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatchling_1.21.1.bb => python3-hatchling_1.22.4.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.21.1.bb b/meta/recipes-devtools/python/python3-hatchling_1.22.4.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-hatchling_1.21.1.bb
rename to meta/recipes-devtools/python/python3-hatchling_1.22.4.bb
index 09d936aa7d..d2f32d8b1a 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.21.1.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.22.4.bb
@@ -8,7 +8,7 @@ inherit pypi python_hatchling
 DEPENDS += "python3-pluggy-native python3-pathspec-native python3-packaging-native python3-editables-native python3-trove-classifiers-native"
 DEPENDS:remove:class-native = "python3-hatchling-native"
 
-SRC_URI[sha256sum] = "bba440453a224e7d4478457fa2e8d8c3633765bafa02975a6b53b9bf917980bc"
+SRC_URI[sha256sum] = "8a2dcec96d7fb848382ef5848e5ac43fdae641f35a08a3fab5116bd495f3416e"
 
 do_compile:prepend() {
     export PYTHONPATH=src
-- 
2.34.1


