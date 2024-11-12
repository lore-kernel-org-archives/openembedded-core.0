Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E1D2D32D6E
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 09:25:46 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.82431.1731403533470941677
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 01:25:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rdcmTkKK;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731403541; x=1762939541;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=1/z0LDmKFQ/V2nF4hNH2eqcMLpJ7zcenZbxOM70h2rE=;
  b=rdcmTkKKQo7rcgguzWkg/ozYzanncqXhho1TjETwj/8U98KqqeMgrEWa
   AAgNXdGdre29EzptXF0+se0OpjGUgRq+m8lsjryUj7yQJmMPmmzluDaBy
   jqTDBIApUaTYHJx7AF8Dq/3ELhXFLqu+JnTRtUm+XVLZE8BlBuszDEyGi
   xfuFC+lkMxv+oWlt/ya678z5Vzt0BUNLnIFoedwQ1qaOAH7rV8t9SXDge
   9d86eGCQbsFy9uTRfe3BJHJClri4tZm6vTZ8yZ+3iPvaujV43I69uZyH/
   jH49Kt59kB6vQ5zUTERzmnGwRhzG50dAddGIUt9NLo1/m5OGlWvfs5THs
   w==;
X-CSE-ConnectionGUID: V7orkbsUQFmx/uS0zUm0YQ==
X-CSE-MsgGUID: DsJuVnKDRXWqD6wvMplDow==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="180062642"
X-IronPort-AV: E=Sophos;i="6.12,147,1728918000"; 
   d="scan'208";a="180062642"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 18:25:39 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 201EADBBCC
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:36 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id AC029BCB82
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:35 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 36A7A20071A35
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:35 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D868F1A000A;
	Tue, 12 Nov 2024 17:25:34 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 35/47] python3-pip: upgrade 24.2 -> 24.3.1
Date: Tue, 12 Nov 2024 17:24:31 +0800
Message-Id: <1731403483-21399-35-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
References: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28792.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28792.006
X-TMASE-Result: 10--5.680300-10.000000
X-TMASE-MatchedRID: +qH7TW9/Rkejz0nOeth/yTo39wOA02LhpxAd6mi1Ga2Y5nVpihxiwzy7
	zxidHhYp5uMU7oGSbz+o/56eWHaCU89DgLFatKr1oS0guoV6SZdezmeoa8MJ875/tqn0MloNmhv
	oEaAW9E7gK2NiZClvaQXURz+hQhGVWkIi5GvRHEpO5y1KmK5bJRSLgSFq3TnjdcfU63y8xPANle
	G9Mx1C77dhPh1hoD/KNBSSiEcvHFrnijZjTXdvVzCj6xe3Suez+KgiyLtJrSCcpGufbGiAqGWBB
	6+sNohT4vM1YF6AJbZT3DhdVcNYJgtuKBGekqUpI/NGWt0UYPBxAYCvFjHOZNdFC/JMU0quHAsV
	wy7woUnw654yuzFKvjrJ9gVk9VFo
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 09:25:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207022

From: Wang Mingyu <wangmy@fujitsu.com>

no_shebang_mangling.patch
refreshed for 24.3.1

Changelog:
=========
- Deprecate wheel filenames that are not compliant with PEP 440.
- Detect recursively referencing requirements files and help users identify the source.
- Support for PEP 730 iOS wheels.
- Display a better error message when an already installed package has an invalid requirement
- Ignore PIP_TARGET and pip.conf global.target when preparing a build environment.
- Restore support for macOS 10.12 and older (via truststore).
- Allow installing pip in editable mode in a virtual environment on Windows.
- Upgrade certifi to 2024.8.30
- Upgrade distlib to 0.3.9
- Upgrade truststore to 0.10.0
- Upgrade urllib3 to 1.26.20
- Allow multiple nested inclusions of the same requirements file again.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/python3-pip/no_shebang_mangling.patch       | 10 +++++-----
 .../{python3-pip_24.2.bb => python3-pip_24.3.1.bb}     |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/python/{python3-pip_24.2.bb => python3-pip_24.3.1.bb} (96%)

diff --git a/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
index 0481a78a88..f95071bfb2 100644
--- a/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
+++ b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
@@ -1,4 +1,4 @@
-From 41542c2bf85c1c79bb55e6549e8f844b3a1db208 Mon Sep 17 00:00:00 2001
+From 5d0b54ea2aae600a2c3a2b6ec71acf99290640e7 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 23 Feb 2022 12:27:06 +0000
 Subject: [PATCH] python3-pip: Don't change shebang
@@ -13,10 +13,10 @@ Upstream-Status: Inappropriate [OE specific config]
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/src/pip/_vendor/distlib/scripts.py b/src/pip/_vendor/distlib/scripts.py
-index e16292b..a3a161d 100644
+index b1fc705..c030e98 100644
 --- a/src/pip/_vendor/distlib/scripts.py
 +++ b/src/pip/_vendor/distlib/scripts.py
-@@ -162,6 +162,8 @@ class ScriptMaker(object):
+@@ -155,6 +155,8 @@ class ScriptMaker(object):
          See also: http://www.in-ulm.de/~mascheck/various/shebang/#length
                    https://hg.mozilla.org/mozilla-central/file/tip/mach
          """
@@ -24,8 +24,8 @@ index e16292b..a3a161d 100644
 +            return b'#!/usr/bin/env python3'
          if os.name != 'posix':
              simple_shebang = True
-         else:
-@@ -380,7 +382,7 @@ class ScriptMaker(object):
+         elif getattr(sys, "cross_compiling", False):
+@@ -363,7 +365,7 @@ class ScriptMaker(object):
                  return
  
              match = FIRST_LINE_RE.match(first_line.replace(b'\r\n', b'\n'))
diff --git a/meta/recipes-devtools/python/python3-pip_24.2.bb b/meta/recipes-devtools/python/python3-pip_24.3.1.bb
similarity index 96%
rename from meta/recipes-devtools/python/python3-pip_24.2.bb
rename to meta/recipes-devtools/python/python3-pip_24.3.1.bb
index bc164415fe..1fa246e4f1 100644
--- a/meta/recipes-devtools/python/python3-pip_24.2.bb
+++ b/meta/recipes-devtools/python/python3-pip_24.3.1.bb
@@ -27,7 +27,7 @@ inherit pypi python_setuptools_build_meta
 
 SRC_URI += "file://no_shebang_mangling.patch"
 
-SRC_URI[sha256sum] = "5b5e490b5e9cb275c879595064adce9ebd31b854e3e803740b72f9ccf34a45b8"
+SRC_URI[sha256sum] = "ebcb60557f2aefabc2e0f918751cd24ea0d56d8ec5445fe1807f1d2109660b99"
 
 RDEPENDS:${PN} = "\
   python3-compile \
-- 
2.34.1


