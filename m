Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D809DE77194
	for <webhook@archiver.kernel.org>; Mon, 23 Dec 2024 09:11:32 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.10447.1734945084131192814
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Dec 2024 01:11:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KAvxADVW;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734945085; x=1766481085;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=9nwfvNnw3zRecMj/0ZjymJ4l7eEsjdr5q4Utp+UV2Fc=;
  b=KAvxADVWi7EQdIa6rJKzENHsfCd+uOwHx/+6lDDuMFdH79X32uCxnZv5
   MsuP+NMAkKsoUkdFUg1k8KvM7Ypxz76T9kw/Uw28+v0lH8qDh1G1CCsVg
   RiyjShUEpLGUhO6Zq0bWwWmFnK0Q2XtgprqMus14XPb+Yoqi6d1ccmK1m
   txsRRwOD5TAiRAiTPELgirHuvaMKasJZgxMwFbgGGhwjmd69z3ixG/GgM
   8LyOvEbGPI426sRRSZ52pq8VfXIbiTI26kdCKK61pQlwTd3eyCHdbqHLZ
   ADhaFDrg9Fuogx12d1mEcEyxCaLxXx2+GC0T1CiADyQFXhKNGRIRNSLPp
   g==;
X-CSE-ConnectionGUID: FPRcItarSMiMC9+mC/afSA==
X-CSE-MsgGUID: 4MwkarpTRnWwon6iv5Zfvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="184687225"
X-IronPort-AV: E=Sophos;i="6.12,256,1728918000"; 
   d="scan'208";a="184687225"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 18:11:22 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 242EED4C39
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:20 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id E4BBDBF493
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:19 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 72C101021B
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:19 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1C29A1A006C;
	Mon, 23 Dec 2024 17:11:19 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 10/22] python3-jinja2: upgrade 3.1.4 -> 3.1.5
Date: Mon, 23 Dec 2024 17:10:53 +0800
Message-Id: <1734945065-4373-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1734945065-4373-1-git-send-email-wangmy@fujitsu.com>
References: <1734945065-4373-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28876.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28876.006
X-TMASE-Result: 10--10.510300-10.000000
X-TMASE-MatchedRID: kfHlHSjlGDOjz0nOeth/yR1kSRHxj+Z5kdS3kPlaZyXkABvhO7aBvoGu
	uB5GbmmMW6fkgIbBYoISuJRtSU84oy8RBbzC4lPfv5rsfD7H2pk/xRB6OGnb2rKw8Hx0EGitgg8
	W5tsFXIChOywUZIftbeaffHI8kAmijejKCMx4rt5KzjuZtPtIBBmyTBaqiJvcTPm/MsQarwPTE/
	BsV3rtG4Qy2IsHC2z9EriUbUlPOKPl87HEn+JlOnzmmMD/HXF+0MQw+++ihy8XR19nmRX2X+4mr
	VlrCeJLPVLKIEs0GLVG54NMKVTLQD9AwXUHipV9GoiRlSCh4/WyTrWV4vwyXx/IyQ3t7z0DT3Er
	/Wp7qkTYgCp6bjAgaoAy6p60ZV62rpt78afcDNfdB/CxWTRRu25FeHtsUoHun6+S0zRR/GkLNP+
	SdpgE/whQ+DoUGApRLnclnYSNKDJLDBwYotNgRw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 09:11:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209030

From: Wang Mingyu <wangmy@fujitsu.com>

0001-python-module-do-not-manipulate-the-environment-when.patch
removed since it's included in 3.1.5

Changelog:
 https://jinja.palletsprojects.com/en/stable/changes/

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/python3-jinja2/fix-3.13.patch      | 87 -------------------
 ...inja2_3.1.4.bb => python3-jinja2_3.1.5.bb} |  6 +-
 2 files changed, 1 insertion(+), 92 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-jinja2/fix-3.13.patch
 rename meta/recipes-devtools/python/{python3-jinja2_3.1.4.bb => python3-jinja2_3.1.5.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-jinja2/fix-3.13.patch b/meta/recipes-devtools/python/python3-jinja2/fix-3.13.patch
deleted file mode 100644
index 34ecd15176..0000000000
--- a/meta/recipes-devtools/python/python3-jinja2/fix-3.13.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-From cf6ba7732b49ab4637aa747186cf1d1572688584 Mon Sep 17 00:00:00 2001
-From: Thomas Grainger <tagrain@gmail.com>
-Date: Mon, 13 May 2024 18:02:35 +0100
-Subject: [PATCH] fix test_package_zip_list on 3.13
-
-Upstream-Status: Backport [https://github.com/pallets/jinja/pull/1979]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- src/jinja2/loaders.py | 32 ++++++++++++++++++++++++++------
- tests/test_loader.py  |  4 ++--
- 2 files changed, 28 insertions(+), 8 deletions(-)
-
-diff --git a/src/jinja2/loaders.py b/src/jinja2/loaders.py
-index 9eaf647..8c2c86c 100644
---- a/src/jinja2/loaders.py
-+++ b/src/jinja2/loaders.py
-@@ -238,6 +238,30 @@ class FileSystemLoader(BaseLoader):
-         return sorted(found)
- 
- 
-+if sys.version_info >= (3, 13):
-+
-+    def _get_zipimporter_files(z: t.Any) -> t.Dict[str, object]:
-+        try:
-+            get_files = z._get_files
-+        except AttributeError as e:
-+            raise TypeError(
-+                "This zip import does not have the required"
-+                " metadata to list templates."
-+            ) from e
-+        return get_files()
-+else:
-+
-+    def _get_zipimporter_files(z: t.Any) -> t.Dict[str, object]:
-+        try:
-+            files = z._files
-+        except AttributeError as e:
-+            raise TypeError(
-+                "This zip import does not have the required"
-+                " metadata to list templates."
-+            ) from e
-+        return files  # type: ignore[no-any-return]
-+
-+
- class PackageLoader(BaseLoader):
-     """Load templates from a directory in a Python package.
- 
-@@ -382,11 +406,7 @@ class PackageLoader(BaseLoader):
-                     for name in filenames
-                 )
-         else:
--            if not hasattr(self._loader, "_files"):
--                raise TypeError(
--                    "This zip import does not have the required"
--                    " metadata to list templates."
--                )
-+            files = _get_zipimporter_files(self._loader)
- 
-             # Package is a zip file.
-             prefix = (
-@@ -395,7 +415,7 @@ class PackageLoader(BaseLoader):
-             )
-             offset = len(prefix)
- 
--            for name in self._loader._files.keys():
-+            for name in files:
-                 # Find names under the templates directory that aren't directories.
-                 if name.startswith(prefix) and name[-1] != os.path.sep:
-                     results.append(name[offset:].replace(os.path.sep, "/"))
-diff --git a/tests/test_loader.py b/tests/test_loader.py
-index 77d686e..e0683e4 100644
---- a/tests/test_loader.py
-+++ b/tests/test_loader.py
-@@ -364,8 +364,8 @@ def test_package_zip_source(package_zip_loader, template, expect):
- 
- 
- @pytest.mark.xfail(
--    platform.python_implementation() == "PyPy",
--    reason="PyPy's zipimporter doesn't have a '_files' attribute.",
-+    sys.implementation.name == "pypy",
-+    reason="zipimporter doesn't have a '_files' attribute",
-     raises=TypeError,
- )
- def test_package_zip_list(package_zip_loader):
--- 
-2.39.5
-
diff --git a/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb b/meta/recipes-devtools/python/python3-jinja2_3.1.5.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-jinja2_3.1.4.bb
rename to meta/recipes-devtools/python/python3-jinja2_3.1.5.bb
index 84c40796c6..2a9e361b6e 100644
--- a/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb
+++ b/meta/recipes-devtools/python/python3-jinja2_3.1.5.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/Jinja2/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5dc88300786f1c214c1e9827a5229462"
 
-SRC_URI[sha256sum] = "4a3aee7acbbe7303aede8e9648d13b8bf88a429282aa6122a993f0ac800cb369"
+SRC_URI[sha256sum] = "8fefff8dc3034e27bb80d67c671eb8a9bc424c0ef4c0826edbff304cceff43bb"
 
 PYPI_PACKAGE = "jinja2"
 
@@ -14,10 +14,6 @@ CLEANBROKEN = "1"
 
 inherit pypi python_flit_core ptest-python-pytest
 
-SRC_URI += " \
-	file://fix-3.13.patch \
-"
-
 RDEPENDS:${PN}-ptest += " \
     python3-unixadmin \
 "
-- 
2.43.0


