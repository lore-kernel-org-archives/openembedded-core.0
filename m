Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6B76C19F29
	for <webhook@archiver.kernel.org>; Wed,  3 Aug 2022 23:56:36 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.513.1659570991867583458
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Aug 2022 16:56:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=qAGn4X4c;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1659570989; i=@fujitsu.com;
	bh=pVMdvrSjSsK6Hr9mCTniAyHeGSCxsTHdNF9HwcbkrXA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=qAGn4X4c6kj7zM2kQFlBDr9TE9HimKINQ+ZgNXLfuy1shGAvlEUyay1zWkznzcyyU
	 wIovEPjN92/28vV/Gg/AKZDQWgEZIiVoHJbhZ2StE0pz+hUvYSs5d7wJvcUdLoS50v
	 eIK5RH0OGi6tX7l7ni2CN3IBvco8VIkOXxF1R1YALGQD1fDDRohZ6fg5qOgda226GM
	 5gg05fEKr3XA//CtYUuJsvY6NDMZIP7NUyfq77Jn78m+xvKyS67K2NRwjJVmv9Cssv
	 b1Ndex2/D5Sku1VDVGZq5GSSkrxMhjO9L5x1XTyuaCAdzRI5XPPbz2G1IQTAp1dJpy
	 Z0h8OeB2RLHwQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8ORpKvD/Tr
  J4OYiBYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePUC62CM2kVz/+sZ2lg3BDRxcjFISTwgFGi
  Yfdj9i5GTiDnMpPE2vOREIndjBJzjvewgSTYBNQkpt+6wdrFyMEhIqAncfWfKEiYWUBF4sXvH
  rBeYQFnibMzPoPZLEDxKUenM4HYvAKOEsc2LmQBsSUEFCSmPHzPDBEXlDg58wkLxBwJiYMvXj
  BD1ChKzL7cDFVfITFjxjY2CFtN4uq5TcwTGPlnIWmfhaR9ASPTKkbbpKLM9IyS3MTMHF1DAwN
  dQ0NTIG2sa2RoppdYpZuol1qqm5dfVJKha6iXWF6sl1pcrFdcmZuck6KXl1qyiREYlinF6Td2
  MO7a90vvEKMkB5OSKG/lqVdJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4C5lfJwkJFqWmp1akZ
  eYAYwQmLcHBoyTCe5YFKM1bXJCYW5yZDpE6xWjJMXX2v/3MHMvB5MyvbQeYhVjy8vNSpcR5Cz
  iBGgRAGjJK8+DGweL4EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3hgOoCk8mXklcFtfAR3
  EBHSQDtcLkINKEhFSUg1M/NuV3Kor7lxzF30/lfm7d0G5MfsN280eyupW+VkPUoWs7deujxb0
  PXYyuyJhR/by4+x7t8w7wn/P6+2PGoE3NZoX9xreL/BMXffmppWSXP/FFxUxT2amrL0S6DHV+
  aBkdtX6rZPss6WOPaidlb7DKZ9zH7eiW8/dcOcmp9dpDWzHeq5ubF4bdX1n7oOId02buq6vsg
  /5ut+aqVFudaeE4+pX8csvpn9iUpEsnirRPr1xWueTJap+qpUZrbsLfszp6RTRsi4yc07VnMR
  aY6ztsOVX5LrFbEmCK6U65/nvO/j2vc3NRNtHm2SVxeuqDfwf73j8cdmE2IVbUq4tEbiw6Nxu
  voTPpx8fOrhzc4qsEktxRqKhFnNRcSIA9BzLcF4DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-732.messagelabs.com!1659570988!194388!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5183 invoked from network); 3 Aug 2022 23:56:28 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-5.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 3 Aug 2022 23:56:28 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id E34AC1AE
	for <openembedded-core@lists.openembedded.org>;
 Thu,  4 Aug 2022 00:56:27 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id D83E61AC
	for <openembedded-core@lists.openembedded.org>;
 Thu,  4 Aug 2022 00:56:27 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 4 Aug 2022 00:56:26 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] python3-pip: upgrade 22.1.2 -> 22.2.1
Date: Thu, 4 Aug 2022 07:56:14 +0800
Message-ID: <1659570974-4168-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Aug 2022 23:56:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168832

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
 .../0001-change-shebang-to-python3.patch      | 115 ------------------
 .../python/python3-pip/reproducible.patch     |  71 ++++++-----
 ...n3-pip_22.1.2.bb => python3-pip_22.2.1.bb} |   8 +-
 3 files changed, 43 insertions(+), 151 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pip/0001-change-shebang-to-python3.patch
 rename meta/recipes-devtools/python/{python3-pip_22.1.2.bb => python3-pip_22.2.1.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-pip/0001-change-shebang-to-python3.patch b/meta/recipes-devtools/python/python3-pip/0001-change-shebang-to-python3.patch
deleted file mode 100644
index d6c27b8461..0000000000
--- a/meta/recipes-devtools/python/python3-pip/0001-change-shebang-to-python3.patch
+++ /dev/null
@@ -1,115 +0,0 @@
-From dca973830d4eee3e0f79e61237c44a9dd8201641 Mon Sep 17 00:00:00 2001
-From: Trevor Gamblin <trevor.gamblin@windriver.com>
-Date: Tue, 22 Jun 2021 12:31:46 -0400
-Subject: [PATCH] change shebang to python3
-
-Upstream-Status: Inappropriate (OE-specific)
-
-Despite no longer supporting python2, some files in the pip source refer
-to "python" instead of "python3", so patch them as needed to ensure that
-they correctly reference the python3 binary.
-
-Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
-
----
- src/pip/_vendor/chardet/langbulgarianmodel.py | 2 +-
- src/pip/_vendor/chardet/langgreekmodel.py     | 2 +-
- src/pip/_vendor/chardet/langhebrewmodel.py    | 2 +-
- src/pip/_vendor/chardet/langhungarianmodel.py | 2 +-
- src/pip/_vendor/chardet/langrussianmodel.py   | 2 +-
- src/pip/_vendor/chardet/langthaimodel.py      | 2 +-
- src/pip/_vendor/chardet/langturkishmodel.py   | 2 +-
- src/pip/_vendor/chardet/metadata/languages.py | 2 +-
- src/pip/_vendor/requests/certs.py             | 2 +-
- 9 files changed, 9 insertions(+), 9 deletions(-)
-
-diff --git a/src/pip/_vendor/chardet/langbulgarianmodel.py b/src/pip/_vendor/chardet/langbulgarianmodel.py
-index e963a50..97ea6ce 100644
---- a/src/pip/_vendor/chardet/langbulgarianmodel.py
-+++ b/src/pip/_vendor/chardet/langbulgarianmodel.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- # -*- coding: utf-8 -*-
- 
- from pip._vendor.chardet.sbcharsetprober import SingleByteCharSetModel
-diff --git a/src/pip/_vendor/chardet/langgreekmodel.py b/src/pip/_vendor/chardet/langgreekmodel.py
-index d99528e..4a127ea 100644
---- a/src/pip/_vendor/chardet/langgreekmodel.py
-+++ b/src/pip/_vendor/chardet/langgreekmodel.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- # -*- coding: utf-8 -*-
- 
- from pip._vendor.chardet.sbcharsetprober import SingleByteCharSetModel
-diff --git a/src/pip/_vendor/chardet/langhebrewmodel.py b/src/pip/_vendor/chardet/langhebrewmodel.py
-index 484c652..676c1a7 100644
---- a/src/pip/_vendor/chardet/langhebrewmodel.py
-+++ b/src/pip/_vendor/chardet/langhebrewmodel.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- # -*- coding: utf-8 -*-
- 
- from pip._vendor.chardet.sbcharsetprober import SingleByteCharSetModel
-diff --git a/src/pip/_vendor/chardet/langhungarianmodel.py b/src/pip/_vendor/chardet/langhungarianmodel.py
-index bbc5cda..042eae7 100644
---- a/src/pip/_vendor/chardet/langhungarianmodel.py
-+++ b/src/pip/_vendor/chardet/langhungarianmodel.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- # -*- coding: utf-8 -*-
- 
- from pip._vendor.chardet.sbcharsetprober import SingleByteCharSetModel
-diff --git a/src/pip/_vendor/chardet/langrussianmodel.py b/src/pip/_vendor/chardet/langrussianmodel.py
-index 5594452..564b02e 100644
---- a/src/pip/_vendor/chardet/langrussianmodel.py
-+++ b/src/pip/_vendor/chardet/langrussianmodel.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- # -*- coding: utf-8 -*-
- 
- from pip._vendor.chardet.sbcharsetprober import SingleByteCharSetModel
-diff --git a/src/pip/_vendor/chardet/langthaimodel.py b/src/pip/_vendor/chardet/langthaimodel.py
-index 9a37db5..c974879 100644
---- a/src/pip/_vendor/chardet/langthaimodel.py
-+++ b/src/pip/_vendor/chardet/langthaimodel.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- # -*- coding: utf-8 -*-
- 
- from pip._vendor.chardet.sbcharsetprober import SingleByteCharSetModel
-diff --git a/src/pip/_vendor/chardet/langturkishmodel.py b/src/pip/_vendor/chardet/langturkishmodel.py
-index 43f4230..7e710c3 100644
---- a/src/pip/_vendor/chardet/langturkishmodel.py
-+++ b/src/pip/_vendor/chardet/langturkishmodel.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- # -*- coding: utf-8 -*-
- 
- from pip._vendor.chardet.sbcharsetprober import SingleByteCharSetModel
-diff --git a/src/pip/_vendor/chardet/metadata/languages.py b/src/pip/_vendor/chardet/metadata/languages.py
-index 3237d5a..aa2ec7c 100644
---- a/src/pip/_vendor/chardet/metadata/languages.py
-+++ b/src/pip/_vendor/chardet/metadata/languages.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- # -*- coding: utf-8 -*-
- """
- Metadata about languages used by our model training code for our
-diff --git a/src/pip/_vendor/requests/certs.py b/src/pip/_vendor/requests/certs.py
-index 06a594e..bfa7839 100644
---- a/src/pip/_vendor/requests/certs.py
-+++ b/src/pip/_vendor/requests/certs.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- # -*- coding: utf-8 -*-
- 
- """
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


