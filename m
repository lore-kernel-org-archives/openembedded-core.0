Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B101C19F2A
	for <webhook@archiver.kernel.org>; Wed,  3 Aug 2022 08:44:32 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web12.6301.1659516263367990366
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Aug 2022 01:44:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=aKR65B3x;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1659516261; i=@fujitsu.com;
	bh=1FmOFf0YMoY+airg8LqKIKU/UeGGsxMNcuxwHzm4GvU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=aKR65B3xjKcxZuqYXMpp/AizI9aKDwZIuWHansr/njOH4rrUZ217/EQn5lk7+St9u
	 xCKVs3ZbCzH0yJCCehW+vejWGAD7rcfMQ3uxqWtzvE/p9gf1cmQWRn2pZLiGEiGyCG
	 DFKRH9wtMYqKpLCrI42TKcfzyHSKnjPnvuyXlVvGhXNc0YvQEifWJepakaf7WB7p7K
	 V1pP9EWBnfLRpmKu1rJYu6ia7bBcPPpDZloYG+DJufrhfnpHUCir1WecfDHTVz6RL0
	 DNfXj/kA2yimNNiEJQ7RJjZjFtXkdFVYDzYCca8NDPKygEJuzGjorwCdTAABNAMGRb
	 Sy9GQ+iMOkVAQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrIIsWRWlGSWpSXmKPExsViZ8OxWTfV9FW
  Swa+jIhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aKZ8eYC67aVZzc2MXcwDjVpIuRk0NI4AGj
  xP55vl2MXED2JSaJGd0LmSGc3YwSK1+fZQSpYhNQk5h+6wZrFyMHh4iAnsTVf6IgYWYBFYkXv
  3vYQWxhAQeJhqetrCA2C1D81oq7YDavgJNEz/S9YGMkBBQkpjx8zwxicwo4S5zb38wIcYSTxP
  ym7SwQ9YISJ2c+YYGYLyFx8MULZoheRYnZl5tZIOwKiRkztrFB2GoSV89tYp7AKDgLSfssJO0
  LGJlWMVolFWWmZ5TkJmbm6BoaGOgaGprqAklTE73EKt1EvdRS3fLU4hJdQ73E8mK91OJiveLK
  3OScFL281JJNjMAQTilmmLWDcVbfT71DjJIcTEqivEyKr5KE+JLyUyozEosz4otKc1KLDzHKc
  HAoSfBmaAHlBItS01Mr0jJzgPEEk5bg4FES4RVWAkrzFhck5hZnpkOkTjFackyd/W8/M8dyMD
  nza9sBZiGWvPy8VClx3pPGQA0CIA0ZpXlw42Axf4lRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6O
  SMG+9CdAUnsy8Eritr4AOYgI6SIfrBchBJYkIKakGJoGOG34G67/3TGHUX7+m8oD5xlvaPtsE
  rlY3nbn95//cFPGA+uL27xLLmJZPztqy1Ms1p1D8+9n+t9d9VIPXCD14whbQeWPr2Q1c58w8m
  uYGld3Wu/GGSSSfTea+zvKs2sIJPQ3vrp9SZH9UPjd48fwTe+ZkNkl0ndI78HCRZP4Jjr0/eX
  4wLo1dw63PGzhzC9+ctHuSgkU+JqzFN9T0z3Y8qly6otDC88qZoFClfa7xS+ana4bsdXfj0Z+
  u3rpFefItv2+smTtF6wU3sEWmxlpNX9FuZb9ZRpbnz/Ec74nqZg0ipw4/3eASrfv9gq6mceGi
  BJMXfDxrmTr2hxR2m5fp5btk9sZ2zFbPcnBRYinOSDTUYi4qTgQAkoYlHHQDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-587.messagelabs.com!1659516261!196185!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13150 invoked from network); 3 Aug 2022 08:44:21 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-17.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 3 Aug 2022 08:44:21 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id E6D2014C
	for <openembedded-core@lists.openembedded.org>;
 Wed,  3 Aug 2022 09:44:20 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id D9E5A75
	for <openembedded-core@lists.openembedded.org>;
 Wed,  3 Aug 2022 09:44:20 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 3 Aug 2022 09:44:19 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pip: upgrade 22.1.2 -> 22.2.1
Date: Wed, 3 Aug 2022 16:44:04 +0800
Message-ID: <1659516246-31185-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1659516246-31185-1-git-send-email-wangmy@fujitsu.com>
References: <1659516246-31185-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Aug 2022 08:44:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168808

reproducible.patch
refreshed for new version.

0001-change-shebang-to-python3.patch
removed since it's not available in new version.

License-Update:
 src/pip/_vendor/html5lib/LICENSE: removed since it's not it new version
 src/pip/_vendor/chardet/LICENSE: file format modified, change St to Street
 src/pip/_vendor/pygments/LICENSE: Copyright year updated to 2022

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/python3-pip/reproducible.patch     | 71 +++++++++++--------
 ...n3-pip_22.1.2.bb => python3-pip_22.2.1.bb} |  8 +--
 2 files changed, 43 insertions(+), 36 deletions(-)
 rename meta/recipes-devtools/python/{python3-pip_22.1.2.bb => python3-pip_22.2.1.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-pip/reproducible.patch b/meta/recipes-devtools/python/python3-pip/reproducible.patch
index 538bb94f7a..0ed0c9177f 100644
--- a/meta/recipes-devtools/python/python3-pip/reproducible.patch
+++ b/meta/recipes-devtools/python/python3-pip/reproducible.patch
@@ -14,34 +14,17 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
 Upstream-Status: Pending
 
-Index: pip-22.0.3/src/pip/_internal/req/req_install.py
-===================================================================
---- pip-22.0.3.orig/src/pip/_internal/req/req_install.py
-+++ pip-22.0.3/src/pip/_internal/req/req_install.py
-@@ -758,7 +758,9 @@ class InstallRequirement:
-         if self.is_wheel:
-             assert self.local_file_path
-             direct_url = None
--            if self.editable:
-+            if '_PYTHON_SYSCONFIGDATA_NAME' in os.environ:
-+                direct_url = None
-+            elif self.editable:
-                 direct_url = direct_url_for_editable(self.unpacked_source_directory)
-             elif self.original_link:
-                 direct_url = direct_url_from_link(
-@@ -775,6 +777,7 @@ class InstallRequirement:
-                 warn_script_location=warn_script_location,
-                 direct_url=direct_url,
-                 requested=self.user_supplied,
-+                root=root,
-             )
-             self.install_succeeded = True
-             return
-Index: pip-22.0.3/src/pip/_internal/operations/install/wheel.py
-===================================================================
---- pip-22.0.3.orig/src/pip/_internal/operations/install/wheel.py
-+++ pip-22.0.3/src/pip/_internal/operations/install/wheel.py
-@@ -436,6 +436,7 @@ def _install_wheel(
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
+---
+ src/pip/_internal/operations/install/wheel.py | 5 ++++-
+ src/pip/_internal/req/req_install.py          | 5 ++++-
+ 2 files changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/src/pip/_internal/operations/install/wheel.py b/src/pip/_internal/operations/install/wheel.py
+index 1af8978..3e48f9b 100644
+--- a/src/pip/_internal/operations/install/wheel.py
++++ b/src/pip/_internal/operations/install/wheel.py
+@@ -434,6 +434,7 @@ def _install_wheel(
      warn_script_location: bool = True,
      direct_url: Optional[DirectUrl] = None,
      requested: bool = False,
@@ -49,7 +32,7 @@ Index: pip-22.0.3/src/pip/_internal/operations/install/wheel.py
  ) -> None:
      """Install a wheel.
  
-@@ -612,7 +613,7 @@ def _install_wheel(
+@@ -610,7 +611,7 @@ def _install_wheel(
              with warnings.catch_warnings():
                  warnings.filterwarnings("ignore")
                  for path in pyc_source_file_paths():
@@ -58,7 +41,7 @@ Index: pip-22.0.3/src/pip/_internal/operations/install/wheel.py
                      if success:
                          pyc_path = pyc_output_path(path)
                          assert os.path.exists(pyc_path)
-@@ -723,6 +724,7 @@ def install_wheel(
+@@ -721,6 +722,7 @@ def install_wheel(
      warn_script_location: bool = True,
      direct_url: Optional[DirectUrl] = None,
      requested: bool = False,
@@ -66,9 +49,35 @@ Index: pip-22.0.3/src/pip/_internal/operations/install/wheel.py
  ) -> None:
      with ZipFile(wheel_path, allowZip64=True) as z:
          with req_error_context(req_description):
-@@ -735,4 +737,5 @@ def install_wheel(
+@@ -733,4 +735,5 @@ def install_wheel(
                  warn_script_location=warn_script_location,
                  direct_url=direct_url,
                  requested=requested,
 +                root=root,
              )
+diff --git a/src/pip/_internal/req/req_install.py b/src/pip/_internal/req/req_install.py
+index a1e376c..4c3f1bb 100644
+--- a/src/pip/_internal/req/req_install.py
++++ b/src/pip/_internal/req/req_install.py
+@@ -779,7 +779,9 @@ class InstallRequirement:
+             assert self.local_file_path
+             direct_url = None
+             # TODO this can be refactored to direct_url = self.download_info
+-            if self.editable:
++            if '_PYTHON_SYSCONFIGDATA_NAME' in os.environ:
++                direct_url = None
++            elif self.editable:
+                 direct_url = direct_url_for_editable(self.unpacked_source_directory)
+             elif self.original_link:
+                 direct_url = direct_url_from_link(
+@@ -796,6 +798,7 @@ class InstallRequirement:
+                 warn_script_location=warn_script_location,
+                 direct_url=direct_url,
+                 requested=self.user_supplied,
++                root=root,
+             )
+             self.install_succeeded = True
+             return
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/python/python3-pip_22.1.2.bb b/meta/recipes-devtools/python/python3-pip_22.2.1.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-pip_22.1.2.bb
rename to meta/recipes-devtools/python/python3-pip_22.2.1.bb
index 5fe59a4762..39349b6026 100644
--- a/meta/recipes-devtools/python/python3-pip_22.1.2.bb
+++ b/meta/recipes-devtools/python/python3-pip_22.2.1.bb
@@ -6,11 +6,10 @@ LIC_FILES_CHKSUM = "\
   file://LICENSE.txt;md5=63ec52baf95163b597008bb46db68030 \
   file://src/pip/_vendor/cachecontrol/LICENSE.txt;md5=6572692148079ebbbd800be4b9f36c6d \
   file://src/pip/_vendor/certifi/LICENSE;md5=67da0714c3f9471067b729eca6c9fbe8 \
-  file://src/pip/_vendor/chardet/LICENSE;md5=a6f89e2100d9b6cdffcea4f398e37343 \
+  file://src/pip/_vendor/chardet/LICENSE;md5=4fbd65380cdd255951079008b364516c \
   file://src/pip/_vendor/colorama/LICENSE.txt;md5=b4936429a56a652b84c5c01280dcaa26 \
   file://src/pip/_vendor/distlib/LICENSE.txt;md5=f6a11430d5cd6e2cd3832ee94f22ddfc \
   file://src/pip/_vendor/distro/LICENSE;md5=d2794c0df5b907fdace235a619d80314 \
-  file://src/pip/_vendor/html5lib/LICENSE;md5=1ba5ada9e6fead1fdc32f43c9f10ba7c \
   file://src/pip/_vendor/idna/LICENSE.md;md5=239668a7c6066d9e0c5382e9c8c6c0e1 \
   file://src/pip/_vendor/msgpack/COPYING;md5=cd9523181d9d4fbf7ffca52eaa2a5751 \
   file://src/pip/_vendor/packaging/LICENSE;md5=faadaedca9251a90b205c9167578ce91 \
@@ -18,7 +17,7 @@ LIC_FILES_CHKSUM = "\
   file://src/pip/_vendor/pep517/LICENSE;md5=aad69c93f605003e3342b174d9b0708c \
   file://src/pip/_vendor/pkg_resources/LICENSE;md5=9a33897f1bca1160d7aad3835152e158 \
   file://src/pip/_vendor/platformdirs/LICENSE.txt;md5=282c970bb844954c8535dd6e9733db7f \
-  file://src/pip/_vendor/pygments/LICENSE;md5=98419e351433ac106a24e3ad435930bc \
+  file://src/pip/_vendor/pygments/LICENSE;md5=36a13c90514e2899f1eba7f41c3ee592 \
   file://src/pip/_vendor/pyparsing/LICENSE;md5=657a566233888513e1f07ba13e2f47f1 \
   file://src/pip/_vendor/requests/LICENSE;md5=34400b68072d710fecd0a2940a0d1658 \
   file://src/pip/_vendor/resolvelib/LICENSE;md5=78e1c0248051c32a38a7f820c30bd7a5 \
@@ -33,11 +32,10 @@ LIC_FILES_CHKSUM = "\
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI += "file://0001-change-shebang-to-python3.patch"
 SRC_URI += "file://no_shebang_mangling.patch"
 SRC_URI += "file://reproducible.patch"
 
-SRC_URI[sha256sum] = "6d55b27e10f506312894a87ccc59f280136bad9061719fac9101bdad5a6bce69"
+SRC_URI[sha256sum] = "50516e47a2b79e77446f0d05649f0d53772c192571486236b1905492bfc24bac"
 
 do_install:append() {
     rm -f ${D}/${bindir}/pip
-- 
2.25.1


