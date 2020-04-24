Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.4120.1587690586754067499
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2020 18:09:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 03O19hcB024382
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2020 18:09:43 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Thu, 23 Apr 2020 18:09:42 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/3] python3-pbr: change shebang to python3
Date: Fri, 24 Apr 2020 09:09:39 +0800
Message-ID: <20200424010941.191578-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

we have offcially dropped python2, so it is possible
that our code run on python3 only host, so change
shebang to python3 to avoid error like:
python: command not found

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-devtools/python/python-pbr.inc   |  2 +
 .../0001-change-shebang-to-python3.patch      | 42 +++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pbr/0001-change-shebang-to-python3.patch

diff --git a/meta/recipes-devtools/python/python-pbr.inc b/meta/recipes-devtools/python/python-pbr.inc
index 0e64501c32..ce3c224d51 100644
--- a/meta/recipes-devtools/python/python-pbr.inc
+++ b/meta/recipes-devtools/python/python-pbr.inc
@@ -5,6 +5,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
+SRC_URI += "file://0001-change-shebang-to-python3.patch"
+
 inherit pypi
 
 RDEPENDS_${PN} += "${PYTHON_PN}-pip"
diff --git a/meta/recipes-devtools/python/python3-pbr/0001-change-shebang-to-python3.patch b/meta/recipes-devtools/python/python3-pbr/0001-change-shebang-to-python3.patch
new file mode 100644
index 0000000000..688da6b204
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pbr/0001-change-shebang-to-python3.patch
@@ -0,0 +1,42 @@
+From 09bd8368bf0d5385663a10eeb890131481681bdd Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 23 Apr 2020 09:28:58 +0000
+Subject: [PATCH] change shebang to python3
+
+Upstream-Status: Pending
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ pbr/tests/test_integration.py | 2 +-
+ pbr/tests/test_packaging.py   | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/pbr/tests/test_integration.py b/pbr/tests/test_integration.py
+index 8e96f21..b07cbe3 100644
+--- a/pbr/tests/test_integration.py
++++ b/pbr/tests/test_integration.py
+@@ -150,7 +150,7 @@ class TestInstallWithoutPbr(base.BaseTestCase):
+         pkgs = {
+             'pkgTest': {
+                 'setup.py': textwrap.dedent("""\
+-                    #!/usr/bin/env python
++                    #!/usr/bin/env python3
+                     import setuptools
+                     setuptools.setup(
+                         name = 'pkgTest',
+diff --git a/pbr/tests/test_packaging.py b/pbr/tests/test_packaging.py
+index 07be547..f6a9412 100644
+--- a/pbr/tests/test_packaging.py
++++ b/pbr/tests/test_packaging.py
+@@ -206,7 +206,7 @@ class CreatePackages(fixtures.Fixture):
+ 
+     defaults = {
+         'setup.py': textwrap.dedent(six.u("""\
+-            #!/usr/bin/env python
++            #!/usr/bin/env python3
+             import setuptools
+             setuptools.setup(
+                 setup_requires=['pbr'],
+-- 
+2.24.1
+
-- 
2.24.1

