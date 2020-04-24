Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.4131.1587690615533370436
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2020 18:10:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 03O19st6031491
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2020 18:10:04 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Thu, 23 Apr 2020 18:09:43 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/3] python3-pip: change shebang to python3
Date: Fri, 24 Apr 2020 09:09:40 +0800
Message-ID: <20200424010941.191578-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200424010941.191578-1-changqing.li@windriver.com>
References: <20200424010941.191578-1-changqing.li@windriver.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by mail5.wrs.com id 03O19st6031491
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: Changqing Li <changqing.li@windriver.com>

we have offcially dropped python2, so it is possible
that our code run on python3 only host, so change
shebang to python3 to avoid error like:
python: command not found

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../0001-change-shebang-to-python3.patch      | 60 +++++++++++++++++++
 .../python/python3-pip_20.0.2.bb              |  2 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pip/0001-change-=
shebang-to-python3.patch

diff --git a/meta/recipes-devtools/python/python3-pip/0001-change-shebang=
-to-python3.patch b/meta/recipes-devtools/python/python3-pip/0001-change-=
shebang-to-python3.patch
new file mode 100644
index 0000000000..00cffe169b
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pip/0001-change-shebang-to-pyt=
hon3.patch
@@ -0,0 +1,60 @@
+From e7a00e9b5104ae2fbcea32a35c85760b77fae7e5 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 23 Apr 2020 09:42:10 +0000
+Subject: [PATCH] change shebang to python3
+
+Upstream-Status: Pending
+
+pip will drop support of python2 from 21.0
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ src/pip/_internal/__init__.py             | 2 +-
+ src/pip/_vendor/appdirs.py                | 2 +-
+ src/pip/_vendor/chardet/cli/chardetect.py | 2 +-
+ src/pip/_vendor/requests/certs.py         | 2 +-
+ 4 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/pip/_internal/__init__.py b/src/pip/_internal/__init__.=
py
+index 3aa8a46..e1ad179 100755
+--- a/src/pip/_internal/__init__.py
++++ b/src/pip/_internal/__init__.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ import pip._internal.utils.inject_securetransport  # noqa
+ from pip._internal.utils.typing import MYPY_CHECK_RUNNING
+=20
+diff --git a/src/pip/_vendor/appdirs.py b/src/pip/_vendor/appdirs.py
+index 3a52b75..ad3f81d 100644
+--- a/src/pip/_vendor/appdirs.py
++++ b/src/pip/_vendor/appdirs.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ # -*- coding: utf-8 -*-
+ # Copyright (c) 2005-2010 ActiveState Software Inc.
+ # Copyright (c) 2013 Eddy Petri=C8=99or
+diff --git a/src/pip/_vendor/chardet/cli/chardetect.py b/src/pip/_vendor=
/chardet/cli/chardetect.py
+index c61136b..a497e98 100644
+--- a/src/pip/_vendor/chardet/cli/chardetect.py
++++ b/src/pip/_vendor/chardet/cli/chardetect.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ """
+ Script which takes one or more file paths and reports on their detected
+ encodings
+diff --git a/src/pip/_vendor/requests/certs.py b/src/pip/_vendor/request=
s/certs.py
+index 06a594e..bfa7839 100644
+--- a/src/pip/_vendor/requests/certs.py
++++ b/src/pip/_vendor/requests/certs.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ # -*- coding: utf-8 -*-
+=20
+ """
+--=20
+2.24.1
+
diff --git a/meta/recipes-devtools/python/python3-pip_20.0.2.bb b/meta/re=
cipes-devtools/python/python3-pip_20.0.2.bb
index 08738fb2f9..96973db774 100644
--- a/meta/recipes-devtools/python/python3-pip_20.0.2.bb
+++ b/meta/recipes-devtools/python/python3-pip_20.0.2.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D8ba06d529c=
955048e5ddd7c45459eb2e"
=20
 DEPENDS +=3D "python3 python3-setuptools-native"
=20
+SRC_URI +=3D "file://0001-change-shebang-to-python3.patch"
+
 SRC_URI[md5sum] =3D "7d42ba49b809604f0df3d55df1c3fd86"
 SRC_URI[sha256sum] =3D "7db0c8ea4c7ea51c8049640e8e6e7fde949de672bfa49499=
20675563a5a6967f"
=20
--=20
2.24.1

