Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.4135.1587690626566931547
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2020 18:10:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 03O19stE031491
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2020 18:10:16 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Thu, 23 Apr 2020 18:10:05 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 3/3] python3-setuptools: change shebang to python3
Date: Fri, 24 Apr 2020 09:09:41 +0800
Message-ID: <20200424010941.191578-3-changqing.li@windriver.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200424010941.191578-1-changqing.li@windriver.com>
References: <20200424010941.191578-1-changqing.li@windriver.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by mail5.wrs.com id 03O19stE031491
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: Changqing Li <changqing.li@windriver.com>

we have offcially dropped python2, so it is possible
that our code run on python3 only host, so change
shebang to python3 to avoid error like:
python: command not found

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../python/python-setuptools.inc              |  2 ++
 .../0001-change-shebang-to-python3.patch      | 36 +++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/0001-=
change-shebang-to-python3.patch

diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/re=
cipes-devtools/python/python-setuptools.inc
index f7c3202fde..07c2f8b216 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -10,6 +10,8 @@ inherit pypi
=20
 SRC_URI_append_class-native =3D " file://0001-conditionally-do-not-fetch=
-code-by-easy_install.patch"
=20
+SRC_URI +=3D "file://0001-change-shebang-to-python3.patch"
+
 SRC_URI[md5sum] =3D "0c956eea142af9c2b02d72e3c042af30"
 SRC_URI[sha256sum] =3D "89c6e6011ec2f6d57d43a3f9296c4ef022c2cbf49bab26b4=
07fe67992ae3397f"
=20
diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-change-=
shebang-to-python3.patch b/meta/recipes-devtools/python/python3-setuptool=
s/0001-change-shebang-to-python3.patch
new file mode 100644
index 0000000000..33af8daed7
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-change-shebang=
-to-python3.patch
@@ -0,0 +1,36 @@
+From c39d0896930e25c224cc897660fc8511ccae30c8 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 23 Apr 2020 10:01:12 +0000
+Subject: [PATCH] change shebang to python3
+
+Upstream-Status: Pending
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ pkg_resources/_vendor/appdirs.py   | 2 +-
+ setuptools/command/easy_install.py | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/pkg_resources/_vendor/appdirs.py b/pkg_resources/_vendor/ap=
pdirs.py
+index ae67001..933e398 100644
+--- a/pkg_resources/_vendor/appdirs.py
++++ b/pkg_resources/_vendor/appdirs.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ # -*- coding: utf-8 -*-
+ # Copyright (c) 2005-2010 ActiveState Software Inc.
+ # Copyright (c) 2013 Eddy Petri=C8=99or
+diff --git a/setuptools/command/easy_install.py b/setuptools/command/eas=
y_install.py
+index abca1ae..6bcdc98 100644
+--- a/setuptools/command/easy_install.py
++++ b/setuptools/command/easy_install.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ """
+ Easy Install
+ ------------
+--=20
+2.24.1
+
--=20
2.24.1

