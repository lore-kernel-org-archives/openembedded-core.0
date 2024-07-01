Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCC5EC3DA5A
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 16:57:59 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.2185.1719853076454613737
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 09:57:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=QZO3Rm0Z;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=FrDXZCg/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101906f3b4d1a-08942507-af25-40f7-b301-e56ca97aaad6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1719853076;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Iqcy5da6RPKS0qX+cLa7CBOUhCeTwumIwLIDw3MUfKE=;
	b=QZO3Rm0ZZEA0v55tO2fYh5u6sVSHb+X4TshpztU3JKkXhf/wEO707bmfylK94Haa
	Pg/sm/wMeVv5dhoZPSq2pDZNrhn133rcDNzjHV2hpXtp9hvV8nHnYdDUrtONgo6tZLk
	RrBYR0IpkEO+sSaj0Ky0AqHKif39BjlU1OpNIDuc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1719853076;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Iqcy5da6RPKS0qX+cLa7CBOUhCeTwumIwLIDw3MUfKE=;
	b=FrDXZCg/NHDep0BzYc2lKAQ8up3kfAtjGLOCVHNrQLA6upsIIGOu9tXRVZZV0MZf
	/JfKaChZgeyN5s9SW6AEcypJjdsa1XNBKlgneClh3K4KHyxaerGLA7qspS6H+70Zn+4
	hBD7OA/Me0rvVd9Yb8lbrw9LXZMjLLwkcailwAZ4=
Content-Type: multipart/mixed; boundary="===============1988978089097310946=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools: upgrading to 70.1.1 SUCCEEDED
Message-ID: <010101906f3b4d1a-08942507-af25-40f7-b301-e56ca97aaad6-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jul 2024 16:57:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 16:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201353

--===============1988978089097310946==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-setuptools* to *70.1.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-upgrade-69.5.1-70.1.1.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From d588e0d665951d99b8c9ee043dd3522ae0cf81b8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jul 2024 09:04:58 +0000
Subject: [PATCH] python3-setuptools: upgrade 69.5.1 -> 70.1.1

---
 ...istutils-sysconfig.py-make-it-possible-to-substite.patch | 6 +++---
 ...01-conditionally-do-not-fetch-code-by-easy_install.patch | 4 ++--
 ...n3-setuptools_69.5.1.bb => python3-setuptools_70.1.1.bb} | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_69.5.1.bb => python3-setuptools_70.1.1.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
index 0f6c9d250d..b92f0c7298 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
@@ -1,4 +1,4 @@
-From d393759315b189a738e4b6a2ce31dc18dbbfae29 Mon Sep 17 00:00:00 2001
+From 6d84a4a615760c9c5b08e2f24200b9c86ab72738 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Wed, 11 May 2022 21:41:14 +0200
 Subject: [PATCH] _distutils/sysconfig.py: make it possible to substite the
@@ -20,10 +20,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 10 insertions(+), 2 deletions(-)
 
 diff --git a/setuptools/_distutils/sysconfig.py b/setuptools/_distutils/sysconfig.py
-index a40a723..14f35e7 100644
+index 1a38e9f..cc3bd88 100644
 --- a/setuptools/_distutils/sysconfig.py
 +++ b/setuptools/_distutils/sysconfig.py
-@@ -119,6 +119,8 @@ def get_python_inc(plat_specific=0, prefix=None):
+@@ -120,6 +120,8 @@ def get_python_inc(plat_specific=0, prefix=None):
      sys.base_exec_prefix -- i.e., ignore 'plat_specific'.
      """
      default_prefix = BASE_EXEC_PREFIX if plat_specific else BASE_PREFIX
diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index e227c2889c..22d0ddbcb2 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From 80fe63816eb3bfd1f5b6d354e1f2442805cff4e0 Mon Sep 17 00:00:00 2001
+From 5ce3948b935eb9cc48de0441d9431b236590e59d Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
@@ -14,7 +14,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/setuptools/command/easy_install.py b/setuptools/command/easy_install.py
-index 858fb20..62bd853 100644
+index 87a68c2..eed27a7 100644
 --- a/setuptools/command/easy_install.py
 +++ b/setuptools/command/easy_install.py
 @@ -672,6 +672,11 @@ class easy_install(Command):
diff --git a/meta/recipes-devtools/python/python3-setuptools_69.5.1.bb b/meta/recipes-devtools/python/python3-setuptools_70.1.1.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-setuptools_69.5.1.bb
rename to meta/recipes-devtools/python/python3-setuptools_70.1.1.bb
index 8261b09d16..8c304695ef 100644
--- a/meta/recipes-devtools/python/python3-setuptools_69.5.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_70.1.1.bb
@@ -11,7 +11,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "6c1fccdac05a97e598fb0ae3bbed5904ccb317337a51139dcd51453611bbb987"
+SRC_URI[sha256sum] = "937a48c7cdb7a21eb53cd7f9b59e525503aa8abaf3584c730dc5f7a5bec3a650"
 
 DEPENDS += "python3"
 
-- 
2.44.0


--===============1988978089097310946==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-setuptools: PKGV changed from 69.5.1 [default] to 70.1.1 [default]
packages/core2-64-poky-linux/python3-setuptools: PV changed from "69.5.1" to "70.1.1"
packages/core2-64-poky-linux/python3-setuptools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-69.5.1.tar.gz;downloadfilename=setuptools-69.5.1.tar.gz file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch" to "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-70.1.1.tar.gz;downloadfilename=setuptools-70.1.1.tar.gz file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
packages/core2-64-poky-linux/python3-setuptools/python3-pkg-resources: PKGV changed from 69.5.1 [default] to 70.1.1 [default]
packages/core2-64-poky-linux/python3-setuptools/python3-pkg-resources: PV changed from "69.5.1" to "70.1.1"
packages/core2-64-poky-linux/python3-setuptools/python3-pkg-resources: PKGSIZE changed from 1693984 to 1556346 (-8%)
packages/core2-64-poky-linux/python3-setuptools/python3-pkg-resources: FILELIST: removed "/usr/lib/python3.12/site-packages/pkg_resources/_vendor/typing_extensions.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/__pycache__/typing_extensions.cpython-312.pyc"
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-dbg: PKGV changed from 69.5.1 [default] to 70.1.1 [default]
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-dbg: PV changed from "69.5.1" to "70.1.1"
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-dev: PKGV changed from 69.5.1 [default] to 70.1.1 [default]
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-dev: PV changed from "69.5.1" to "70.1.1"
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-doc: PKGV changed from 69.5.1 [default] to 70.1.1 [default]
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-doc: PV changed from "69.5.1" to "70.1.1"
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-locale: PKGV changed from 69.5.1 [default] to 70.1.1 [default]
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-locale: PV changed from "69.5.1" to "70.1.1"
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-src: PKGV changed from 69.5.1 [default] to 70.1.1 [default]
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-src: PV changed from "69.5.1" to "70.1.1"
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-staticdev: PKGV changed from 69.5.1 [default] to 70.1.1 [default]
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-staticdev: PV changed from "69.5.1" to "70.1.1"
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools: PKGV changed from 69.5.1 [default] to 70.1.1 [default]
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools: PV changed from "69.5.1" to "70.1.1"
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools: PKGSIZE changed from 4853024 to 4819302 (-1%)
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools: FILELIST: directory renamed /usr/lib/python3.12/site-packages/setuptools-69.5.1.dist-info -> /usr/lib/python3.12/site-packages/setuptools-70.1.1.dist-info, removed "/usr/lib/python3.12/site-packages/setuptools/dep_util.py /usr/lib/python3.12/site-packages/setuptools/_vendor/typing_extensions.py /usr/lib/python3.12/site-packages/setuptools/_vendor/__pycache__/typing_extensions.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/__pycache__/dep_util.cpython-312.pyc", added "/usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/metadata.py /usr/lib/python3.12/site-packages/setuptools/command/__pycache__/bdist_wheel.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/wheelfile.py /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/macosx_libfile.py /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/__pycache__/macosx_libfile.cpython-312.pyc /usr/lib/python3.12/site-pack
 ages/setuptools/_vendor/wheel/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/__init__.py /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/__pycache__/util.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/command/bdist_wheel.py /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/__pycache__/wheelfile.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/__pycache__/metadata.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/util.py"
Changes to packages/core2-64-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.12/site-packages/setuptools-69.5.1.dist-info moved to /usr/lib/python3.12/site-packages/setuptools-70.1.1.dist-info
  /usr/lib/python3.12/site-packages/setuptools/command/bdist_wheel.py was added
  /usr/lib/python3.12/site-packages/setuptools/command/__pycache__/bdist_wheel.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/macosx_libfile.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/metadata.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/__pycache__/macosx_libfile.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/__pycache__/metadata.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/__pycache__/util.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/__pycache__/wheelfile.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/util.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/wheelfile.py was added
  /usr/lib/python3.12/site-packages/build was removed
  /usr/lib/python3.12/site-packages/build/lib was removed
  /usr/lib/python3.12/site-packages/build/lib/_distutils_hack was removed
  /usr/lib/python3.12/site-packages/build/lib/_distutils_hack/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/_distutils_hack/override.py was removed
  /usr/lib/python3.12/site-packages/build/lib/_distutils_hack/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/_distutils_hack/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/_distutils_hack/__pycache__/override.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/extern was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/extern/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/extern/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/extern/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/backports was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/backports/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/backports/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/backports/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/backports/__pycache__/tarfile.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/backports/tarfile.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/importlib_resources was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/importlib_resources/abc.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/importlib_resources/_adapters.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/importlib_resources/_common.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/importlib_resources/_compat.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/importlib_resources/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/importlib_resources/_itertools.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/importlib_resources/_legacy.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/importlib_resources/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/importlib_resources/__pycache__/abc.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/importlib_resources/__pycache__/_adapters.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/importlib_resources/__pycache__/_common.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/importlib_resources/__pycache__/_compat.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/importlib_resources/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/importlib_resources/__pycache__/_itertools.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/importlib_resources/__pycache__/_legacy.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/importlib_resources/__pycache__/readers.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/importlib_resources/__pycache__/simple.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/importlib_resources/py.typed was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/importlib_resources/readers.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/importlib_resources/simple.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/jaraco was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/jaraco/context.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/jaraco/functools was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/jaraco/functools/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/jaraco/functools/__init__.pyi was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/jaraco/functools/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/jaraco/functools/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/jaraco/functools/py.typed was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/jaraco/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/jaraco/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/jaraco/__pycache__/context.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/jaraco/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/jaraco/text was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/jaraco/text/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/jaraco/text/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/jaraco/text/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/more_itertools was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/more_itertools/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/more_itertools/__init__.pyi was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/more_itertools/more.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/more_itertools/more.pyi was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/more_itertools/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/more_itertools/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/more_itertools/__pycache__/more.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/more_itertools/__pycache__/recipes.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/more_itertools/py.typed was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/more_itertools/recipes.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/more_itertools/recipes.pyi was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/_elffile.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/_manylinux.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/markers.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/metadata.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/_musllinux.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/_parser.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/__pycache__/_elffile.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/__pycache__/_manylinux.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/__pycache__/markers.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/__pycache__/metadata.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/__pycache__/_musllinux.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/__pycache__/_parser.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/__pycache__/requirements.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/__pycache__/specifiers.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/__pycache__/_structures.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/__pycache__/tags.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/__pycache__/_tokenizer.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/__pycache__/utils.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/__pycache__/version.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/py.typed was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/requirements.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/specifiers.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/_structures.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/tags.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/_tokenizer.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/utils.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/version.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/platformdirs was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/platformdirs/android.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/platformdirs/api.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/platformdirs/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/platformdirs/macos.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/platformdirs/__main__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/platformdirs/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/platformdirs/__pycache__/android.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/platformdirs/__pycache__/api.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/platformdirs/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/platformdirs/__pycache__/macos.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/platformdirs/__pycache__/__main__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/platformdirs/__pycache__/unix.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/platformdirs/__pycache__/version.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/platformdirs/__pycache__/windows.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/platformdirs/py.typed was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/platformdirs/unix.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/platformdirs/version.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/platformdirs/windows.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/__pycache__/typing_extensions.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/__pycache__/zipp.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/typing_extensions.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/zipp.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/archive_util.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/build_meta.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/alias.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/bdist_egg.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/bdist_rpm.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/build_clib.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/build_ext.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/build.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/build_py.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/develop.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/dist_info.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/easy_install.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/editable_wheel.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/egg_info.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/install_egg_info.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/install_lib.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/install.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/install_scripts.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__pycache__/alias.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__pycache__/bdist_egg.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__pycache__/bdist_rpm.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__pycache__/build_clib.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__pycache__/build.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__pycache__/build_ext.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__pycache__/build_py.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__pycache__/develop.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__pycache__/dist_info.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__pycache__/easy_install.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__pycache__/editable_wheel.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__pycache__/egg_info.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__pycache__/install.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__pycache__/install_egg_info.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__pycache__/install_lib.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__pycache__/install_scripts.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__pycache__/register.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__pycache__/_requirestxt.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__pycache__/rotate.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__pycache__/saveopts.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__pycache__/sdist.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__pycache__/setopt.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__pycache__/test.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__pycache__/upload.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__pycache__/upload_docs.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/register.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/_requirestxt.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/rotate.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/saveopts.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/sdist.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/setopt.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/test.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/upload_docs.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/upload.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/compat was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/compat/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/compat/py310.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/compat/py311.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/compat/py39.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/compat/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/compat/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/compat/__pycache__/py310.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/compat/__pycache__/py311.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/compat/__pycache__/py39.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/config was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/config/_apply_pyprojecttoml.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/config/expand.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/config/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/config/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/config/__pycache__/_apply_pyprojecttoml.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/config/__pycache__/expand.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/config/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/config/__pycache__/pyprojecttoml.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/config/__pycache__/setupcfg.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/config/pyprojecttoml.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/config/setupcfg.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/config/_validate_pyproject was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/config/_validate_pyproject/error_reporting.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/config/_validate_pyproject/extra_validations.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/config/_validate_pyproject/fastjsonschema_exceptions.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/config/_validate_pyproject/fastjsonschema_validations.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/config/_validate_pyproject/formats.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/config/_validate_pyproject/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/config/_validate_pyproject/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/config/_validate_pyproject/__pycache__/error_reporting.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/config/_validate_pyproject/__pycache__/extra_validations.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/config/_validate_pyproject/__pycache__/fastjsonschema_exceptions.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/config/_validate_pyproject/__pycache__/fastjsonschema_validations.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/config/_validate_pyproject/__pycache__/formats.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/config/_validate_pyproject/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_core_metadata.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/depends.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/dep_util.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/discovery.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/dist.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/archive_util.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/bcppcompiler.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/ccompiler.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/cmd.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/_collections.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/bdist_dumb.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/bdist.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/bdist_rpm.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/build_clib.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/build_ext.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/build.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/build_py.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/build_scripts.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/check.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/clean.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/config.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/_framework_compat.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/install_data.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/install_egg_info.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/install_headers.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/install_lib.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/install.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/install_scripts.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/__pycache__/bdist.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/__pycache__/bdist_dumb.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/__pycache__/bdist_rpm.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/__pycache__/build_clib.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/__pycache__/build.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/__pycache__/build_ext.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/__pycache__/build_py.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/__pycache__/build_scripts.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/__pycache__/check.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/__pycache__/clean.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/__pycache__/config.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/__pycache__/_framework_compat.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/__pycache__/install.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/__pycache__/install_data.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/__pycache__/install_egg_info.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/__pycache__/install_headers.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/__pycache__/install_lib.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/__pycache__/install_scripts.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/__pycache__/register.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/__pycache__/sdist.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/__pycache__/upload.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/register.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/sdist.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/upload.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/compat was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/compat/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/compat/py38.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/compat/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/compat/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/compat/__pycache__/py38.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/config.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/core.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/cygwinccompiler.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/debug.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/dep_util.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/dir_util.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/dist.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/errors.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/extension.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/fancy_getopt.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/filelist.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/file_util.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/_functools.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/_itertools.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/_log.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/log.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/_macos_compat.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/_modified.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/msvc9compiler.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/_msvccompiler.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/msvccompiler.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/py38compat.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/py39compat.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/archive_util.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/bcppcompiler.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/ccompiler.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/cmd.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/_collections.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/config.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/core.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/cygwinccompiler.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/debug.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/dep_util.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/dir_util.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/dist.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/errors.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/extension.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/fancy_getopt.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/filelist.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/file_util.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/_functools.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/_itertools.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/_log.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/log.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/_macos_compat.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/_modified.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/msvc9compiler.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/_msvccompiler.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/msvccompiler.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/py38compat.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/py39compat.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/spawn.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/sysconfig.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/text_file.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/unixccompiler.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/util.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/version.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/versionpredicate.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/zosccompiler.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/spawn.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/sysconfig.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/text_file.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/unixccompiler.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/util.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/versionpredicate.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/version.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/zosccompiler.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_entry_points.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/errors.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/extension.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/extern was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/extern/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/extern/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/extern/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/glob.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_importlib.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_imp.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/installer.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_itertools.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/launch.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/logging.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/modified.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/monkey.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/msvc.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/namespaces.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_normalization.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/package_index.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_path.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/archive_util.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/build_meta.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/_core_metadata.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/depends.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/dep_util.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/discovery.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/dist.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/_entry_points.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/errors.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/extension.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/glob.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/_imp.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/_importlib.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/installer.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/_itertools.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/launch.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/logging.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/modified.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/monkey.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/msvc.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/namespaces.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/_normalization.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/package_index.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/_path.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/_reqs.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/sandbox.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/unicode_utils.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/version.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/warnings.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/wheel.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/windows_support.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_reqs.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/sandbox.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/unicode_utils.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/backports was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/backports/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/backports/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/backports/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/backports/__pycache__/tarfile.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/backports/tarfile.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_metadata was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_metadata/_adapters.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_metadata/_collections.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_metadata/_compat.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_metadata/_functools.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_metadata/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_metadata/_itertools.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_metadata/_meta.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_metadata/_py39compat.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_metadata/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_metadata/__pycache__/_adapters.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_metadata/__pycache__/_collections.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_metadata/__pycache__/_compat.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_metadata/__pycache__/_functools.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_metadata/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_metadata/__pycache__/_itertools.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_metadata/__pycache__/_meta.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_metadata/__pycache__/_py39compat.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_metadata/__pycache__/_text.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_metadata/py.typed was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_metadata/_text.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_resources was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_resources/abc.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_resources/_adapters.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_resources/_common.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_resources/_compat.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_resources/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_resources/_itertools.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_resources/_legacy.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_resources/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_resources/__pycache__/abc.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_resources/__pycache__/_adapters.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_resources/__pycache__/_common.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_resources/__pycache__/_compat.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_resources/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_resources/__pycache__/_itertools.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_resources/__pycache__/_legacy.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_resources/__pycache__/readers.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_resources/__pycache__/simple.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_resources/py.typed was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_resources/readers.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_resources/simple.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/jaraco was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/jaraco/context.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/jaraco/functools was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/jaraco/functools/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/jaraco/functools/__init__.pyi was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/jaraco/functools/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/jaraco/functools/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/jaraco/functools/py.typed was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/jaraco/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/jaraco/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/jaraco/__pycache__/context.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/jaraco/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/jaraco/text was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/jaraco/text/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/jaraco/text/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/jaraco/text/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/more_itertools was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/more_itertools/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/more_itertools/__init__.pyi was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/more_itertools/more.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/more_itertools/more.pyi was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/more_itertools/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/more_itertools/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/more_itertools/__pycache__/more.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/more_itertools/__pycache__/recipes.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/more_itertools/py.typed was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/more_itertools/recipes.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/more_itertools/recipes.pyi was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/ordered_set.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/_elffile.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/_manylinux.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/markers.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/metadata.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/_musllinux.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/_parser.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/__pycache__/_elffile.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/__pycache__/_manylinux.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/__pycache__/markers.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/__pycache__/metadata.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/__pycache__/_musllinux.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/__pycache__/_parser.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/__pycache__/requirements.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/__pycache__/specifiers.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/__pycache__/_structures.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/__pycache__/tags.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/__pycache__/_tokenizer.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/__pycache__/utils.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/__pycache__/version.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/py.typed was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/requirements.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/specifiers.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/_structures.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/tags.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/_tokenizer.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/utils.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/version.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/__pycache__/ordered_set.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/__pycache__/typing_extensions.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/__pycache__/zipp.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/tomli was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/tomli/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/tomli/_parser.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/tomli/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/tomli/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/tomli/__pycache__/_parser.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/tomli/__pycache__/_re.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/tomli/__pycache__/_types.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/tomli/py.typed was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/tomli/_re.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/tomli/_types.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/typing_extensions.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/zipp.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/version.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/warnings.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/wheel.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/windows_support.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/__pycache__/typing_extensions.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/typing_extensions.py was removed
  /usr/lib/python3.12/site-packages/setuptools/dep_util.py was removed
  /usr/lib/python3.12/site-packages/setuptools/__pycache__/dep_util.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/__pycache__/typing_extensions.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typing_extensions.py was removed
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.12/site-packages/setuptools-69.5.1.dist-info moved to /usr/lib/python3.12/site-packages/setuptools-70.1.1.dist-info
  /usr/lib/python3.12/site-packages/setuptools/command/bdist_wheel.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/macosx_libfile.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/metadata.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/util.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/wheelfile.py was added
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/typing_extensions.py was removed
  /usr/lib/python3.12/site-packages/setuptools/dep_util.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typing_extensions.py was removed

--===============1988978089097310946==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-setuptools/python3-pkg-resources: FILELIST: removed "/usr/lib/python3.12/site-packages/pkg_resources/_vendor/__pycache__/typing_extensions.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/typing_extensions.py"
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools: FILELIST: directory renamed /usr/lib/python3.12/site-packages/setuptools-69.5.1.dist-info -> /usr/lib/python3.12/site-packages/setuptools-70.1.1.dist-info, removed "/usr/lib/python3.12/site-packages/setuptools/dep_util.py /usr/lib/python3.12/site-packages/setuptools/_vendor/__pycache__/typing_extensions.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/typing_extensions.py /usr/lib/python3.12/site-packages/setuptools/__pycache__/dep_util.cpython-312.pyc", added "/usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/metadata.py /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/macosx_libfile.py /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/__pycache__/util.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/command/bdist_wheel.py /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/__pycache__/metadata.cpython-312.pyc /usr/lib/python3.12/site-packages/setupt
 ools/_vendor/wheel/__init__.py /usr/lib/python3.12/site-packages/setuptools/command/__pycache__/bdist_wheel.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/util.py /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/__pycache__/wheelfile.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/wheelfile.py /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/__pycache__/macosx_libfile.cpython-312.pyc"
Changes to packages/core2-64-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.12/site-packages/setuptools-69.5.1.dist-info moved to /usr/lib/python3.12/site-packages/setuptools-70.1.1.dist-info
  /usr/lib/python3.12/site-packages/setuptools/command/bdist_wheel.py was added
  /usr/lib/python3.12/site-packages/setuptools/command/__pycache__/bdist_wheel.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/macosx_libfile.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/metadata.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/__pycache__/macosx_libfile.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/__pycache__/metadata.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/__pycache__/util.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/__pycache__/wheelfile.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/util.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/wheelfile.py was added
  /usr/lib/python3.12/site-packages/build was removed
  /usr/lib/python3.12/site-packages/build/lib was removed
  /usr/lib/python3.12/site-packages/build/lib/_distutils_hack was removed
  /usr/lib/python3.12/site-packages/build/lib/_distutils_hack/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/_distutils_hack/override.py was removed
  /usr/lib/python3.12/site-packages/build/lib/_distutils_hack/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/_distutils_hack/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/_distutils_hack/__pycache__/override.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/extern was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/extern/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/extern/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/extern/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/backports was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/backports/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/backports/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/backports/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/backports/__pycache__/tarfile.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/backports/tarfile.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/importlib_resources was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/importlib_resources/abc.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/importlib_resources/_adapters.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/importlib_resources/_common.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/importlib_resources/_compat.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/importlib_resources/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/importlib_resources/_itertools.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/importlib_resources/_legacy.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/importlib_resources/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/importlib_resources/__pycache__/abc.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/importlib_resources/__pycache__/_adapters.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/importlib_resources/__pycache__/_common.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/importlib_resources/__pycache__/_compat.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/importlib_resources/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/importlib_resources/__pycache__/_itertools.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/importlib_resources/__pycache__/_legacy.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/importlib_resources/__pycache__/readers.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/importlib_resources/__pycache__/simple.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/importlib_resources/py.typed was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/importlib_resources/readers.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/importlib_resources/simple.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/jaraco was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/jaraco/context.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/jaraco/functools was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/jaraco/functools/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/jaraco/functools/__init__.pyi was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/jaraco/functools/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/jaraco/functools/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/jaraco/functools/py.typed was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/jaraco/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/jaraco/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/jaraco/__pycache__/context.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/jaraco/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/jaraco/text was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/jaraco/text/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/jaraco/text/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/jaraco/text/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/more_itertools was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/more_itertools/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/more_itertools/__init__.pyi was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/more_itertools/more.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/more_itertools/more.pyi was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/more_itertools/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/more_itertools/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/more_itertools/__pycache__/more.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/more_itertools/__pycache__/recipes.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/more_itertools/py.typed was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/more_itertools/recipes.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/more_itertools/recipes.pyi was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/_elffile.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/_manylinux.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/markers.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/metadata.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/_musllinux.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/_parser.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/__pycache__/_elffile.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/__pycache__/_manylinux.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/__pycache__/markers.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/__pycache__/metadata.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/__pycache__/_musllinux.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/__pycache__/_parser.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/__pycache__/requirements.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/__pycache__/specifiers.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/__pycache__/_structures.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/__pycache__/tags.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/__pycache__/_tokenizer.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/__pycache__/utils.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/__pycache__/version.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/py.typed was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/requirements.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/specifiers.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/_structures.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/tags.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/_tokenizer.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/utils.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/packaging/version.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/platformdirs was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/platformdirs/android.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/platformdirs/api.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/platformdirs/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/platformdirs/macos.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/platformdirs/__main__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/platformdirs/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/platformdirs/__pycache__/android.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/platformdirs/__pycache__/api.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/platformdirs/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/platformdirs/__pycache__/macos.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/platformdirs/__pycache__/__main__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/platformdirs/__pycache__/unix.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/platformdirs/__pycache__/version.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/platformdirs/__pycache__/windows.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/platformdirs/py.typed was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/platformdirs/unix.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/platformdirs/version.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/platformdirs/windows.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/__pycache__/typing_extensions.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/__pycache__/zipp.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/typing_extensions.py was removed
  /usr/lib/python3.12/site-packages/build/lib/pkg_resources/_vendor/zipp.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/archive_util.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/build_meta.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/alias.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/bdist_egg.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/bdist_rpm.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/build_clib.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/build_ext.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/build.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/build_py.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/develop.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/dist_info.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/easy_install.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/editable_wheel.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/egg_info.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/install_egg_info.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/install_lib.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/install.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/install_scripts.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__pycache__/alias.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__pycache__/bdist_egg.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__pycache__/bdist_rpm.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__pycache__/build_clib.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__pycache__/build.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__pycache__/build_ext.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__pycache__/build_py.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__pycache__/develop.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__pycache__/dist_info.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__pycache__/easy_install.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__pycache__/editable_wheel.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__pycache__/egg_info.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__pycache__/install.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__pycache__/install_egg_info.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__pycache__/install_lib.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__pycache__/install_scripts.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__pycache__/register.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__pycache__/_requirestxt.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__pycache__/rotate.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__pycache__/saveopts.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__pycache__/sdist.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__pycache__/setopt.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__pycache__/test.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__pycache__/upload.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/__pycache__/upload_docs.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/register.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/_requirestxt.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/rotate.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/saveopts.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/sdist.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/setopt.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/test.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/upload_docs.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/command/upload.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/compat was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/compat/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/compat/py310.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/compat/py311.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/compat/py39.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/compat/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/compat/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/compat/__pycache__/py310.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/compat/__pycache__/py311.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/compat/__pycache__/py39.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/config was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/config/_apply_pyprojecttoml.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/config/expand.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/config/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/config/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/config/__pycache__/_apply_pyprojecttoml.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/config/__pycache__/expand.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/config/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/config/__pycache__/pyprojecttoml.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/config/__pycache__/setupcfg.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/config/pyprojecttoml.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/config/setupcfg.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/config/_validate_pyproject was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/config/_validate_pyproject/error_reporting.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/config/_validate_pyproject/extra_validations.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/config/_validate_pyproject/fastjsonschema_exceptions.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/config/_validate_pyproject/fastjsonschema_validations.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/config/_validate_pyproject/formats.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/config/_validate_pyproject/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/config/_validate_pyproject/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/config/_validate_pyproject/__pycache__/error_reporting.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/config/_validate_pyproject/__pycache__/extra_validations.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/config/_validate_pyproject/__pycache__/fastjsonschema_exceptions.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/config/_validate_pyproject/__pycache__/fastjsonschema_validations.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/config/_validate_pyproject/__pycache__/formats.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/config/_validate_pyproject/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_core_metadata.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/depends.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/dep_util.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/discovery.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/dist.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/archive_util.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/bcppcompiler.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/ccompiler.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/cmd.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/_collections.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/bdist_dumb.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/bdist.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/bdist_rpm.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/build_clib.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/build_ext.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/build.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/build_py.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/build_scripts.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/check.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/clean.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/config.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/_framework_compat.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/install_data.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/install_egg_info.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/install_headers.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/install_lib.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/install.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/install_scripts.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/__pycache__/bdist.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/__pycache__/bdist_dumb.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/__pycache__/bdist_rpm.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/__pycache__/build_clib.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/__pycache__/build.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/__pycache__/build_ext.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/__pycache__/build_py.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/__pycache__/build_scripts.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/__pycache__/check.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/__pycache__/clean.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/__pycache__/config.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/__pycache__/_framework_compat.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/__pycache__/install.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/__pycache__/install_data.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/__pycache__/install_egg_info.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/__pycache__/install_headers.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/__pycache__/install_lib.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/__pycache__/install_scripts.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/__pycache__/register.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/__pycache__/sdist.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/__pycache__/upload.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/register.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/sdist.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/command/upload.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/compat was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/compat/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/compat/py38.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/compat/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/compat/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/compat/__pycache__/py38.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/config.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/core.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/cygwinccompiler.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/debug.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/dep_util.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/dir_util.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/dist.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/errors.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/extension.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/fancy_getopt.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/filelist.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/file_util.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/_functools.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/_itertools.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/_log.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/log.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/_macos_compat.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/_modified.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/msvc9compiler.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/_msvccompiler.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/msvccompiler.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/py38compat.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/py39compat.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/archive_util.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/bcppcompiler.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/ccompiler.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/cmd.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/_collections.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/config.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/core.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/cygwinccompiler.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/debug.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/dep_util.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/dir_util.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/dist.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/errors.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/extension.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/fancy_getopt.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/filelist.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/file_util.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/_functools.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/_itertools.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/_log.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/log.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/_macos_compat.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/_modified.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/msvc9compiler.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/_msvccompiler.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/msvccompiler.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/py38compat.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/py39compat.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/spawn.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/sysconfig.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/text_file.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/unixccompiler.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/util.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/version.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/versionpredicate.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/__pycache__/zosccompiler.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/spawn.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/sysconfig.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/text_file.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/unixccompiler.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/util.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/versionpredicate.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/version.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_distutils/zosccompiler.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_entry_points.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/errors.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/extension.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/extern was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/extern/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/extern/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/extern/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/glob.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_importlib.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_imp.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/installer.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_itertools.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/launch.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/logging.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/modified.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/monkey.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/msvc.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/namespaces.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_normalization.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/package_index.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_path.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/archive_util.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/build_meta.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/_core_metadata.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/depends.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/dep_util.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/discovery.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/dist.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/_entry_points.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/errors.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/extension.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/glob.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/_imp.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/_importlib.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/installer.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/_itertools.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/launch.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/logging.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/modified.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/monkey.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/msvc.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/namespaces.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/_normalization.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/package_index.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/_path.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/_reqs.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/sandbox.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/unicode_utils.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/version.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/warnings.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/wheel.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/__pycache__/windows_support.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_reqs.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/sandbox.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/unicode_utils.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/backports was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/backports/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/backports/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/backports/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/backports/__pycache__/tarfile.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/backports/tarfile.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_metadata was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_metadata/_adapters.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_metadata/_collections.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_metadata/_compat.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_metadata/_functools.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_metadata/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_metadata/_itertools.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_metadata/_meta.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_metadata/_py39compat.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_metadata/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_metadata/__pycache__/_adapters.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_metadata/__pycache__/_collections.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_metadata/__pycache__/_compat.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_metadata/__pycache__/_functools.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_metadata/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_metadata/__pycache__/_itertools.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_metadata/__pycache__/_meta.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_metadata/__pycache__/_py39compat.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_metadata/__pycache__/_text.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_metadata/py.typed was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_metadata/_text.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_resources was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_resources/abc.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_resources/_adapters.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_resources/_common.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_resources/_compat.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_resources/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_resources/_itertools.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_resources/_legacy.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_resources/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_resources/__pycache__/abc.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_resources/__pycache__/_adapters.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_resources/__pycache__/_common.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_resources/__pycache__/_compat.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_resources/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_resources/__pycache__/_itertools.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_resources/__pycache__/_legacy.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_resources/__pycache__/readers.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_resources/__pycache__/simple.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_resources/py.typed was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_resources/readers.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/importlib_resources/simple.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/jaraco was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/jaraco/context.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/jaraco/functools was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/jaraco/functools/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/jaraco/functools/__init__.pyi was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/jaraco/functools/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/jaraco/functools/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/jaraco/functools/py.typed was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/jaraco/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/jaraco/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/jaraco/__pycache__/context.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/jaraco/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/jaraco/text was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/jaraco/text/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/jaraco/text/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/jaraco/text/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/more_itertools was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/more_itertools/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/more_itertools/__init__.pyi was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/more_itertools/more.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/more_itertools/more.pyi was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/more_itertools/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/more_itertools/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/more_itertools/__pycache__/more.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/more_itertools/__pycache__/recipes.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/more_itertools/py.typed was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/more_itertools/recipes.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/more_itertools/recipes.pyi was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/ordered_set.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/_elffile.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/_manylinux.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/markers.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/metadata.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/_musllinux.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/_parser.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/__pycache__/_elffile.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/__pycache__/_manylinux.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/__pycache__/markers.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/__pycache__/metadata.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/__pycache__/_musllinux.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/__pycache__/_parser.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/__pycache__/requirements.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/__pycache__/specifiers.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/__pycache__/_structures.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/__pycache__/tags.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/__pycache__/_tokenizer.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/__pycache__/utils.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/__pycache__/version.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/py.typed was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/requirements.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/specifiers.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/_structures.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/tags.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/_tokenizer.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/utils.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/packaging/version.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/__pycache__/ordered_set.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/__pycache__/typing_extensions.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/__pycache__/zipp.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/tomli was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/tomli/__init__.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/tomli/_parser.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/tomli/__pycache__ was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/tomli/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/tomli/__pycache__/_parser.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/tomli/__pycache__/_re.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/tomli/__pycache__/_types.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/tomli/py.typed was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/tomli/_re.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/tomli/_types.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/typing_extensions.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/_vendor/zipp.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/version.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/warnings.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/wheel.py was removed
  /usr/lib/python3.12/site-packages/build/lib/setuptools/windows_support.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/__pycache__/typing_extensions.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/typing_extensions.py was removed
  /usr/lib/python3.12/site-packages/setuptools/dep_util.py was removed
  /usr/lib/python3.12/site-packages/setuptools/__pycache__/dep_util.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/__pycache__/typing_extensions.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typing_extensions.py was removed
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.12/site-packages/setuptools-69.5.1.dist-info moved to /usr/lib/python3.12/site-packages/setuptools-70.1.1.dist-info
  /usr/lib/python3.12/site-packages/setuptools/command/bdist_wheel.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/macosx_libfile.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/metadata.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/util.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/wheelfile.py was added
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/typing_extensions.py was removed
  /usr/lib/python3.12/site-packages/setuptools/dep_util.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typing_extensions.py was removed

--===============1988978089097310946==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-upgrade-69.5.1-70.1.1.patch"

RnJvbSBkNTg4ZTBkNjY1OTUxZDk5YjhjOWVlMDQzZGQzNTIyYWUwY2Y4MWI4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdWwgMjAyNCAwOTowNDo1OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc2V0dXB0b29sczogdXBncmFkZSA2OS41LjEgLT4gNzAuMS4xCgotLS0KIC4uLmlzdHV0
aWxzLXN5c2NvbmZpZy5weS1tYWtlLWl0LXBvc3NpYmxlLXRvLXN1YnN0aXRlLnBhdGNoIHwgNiAr
KystLS0KIC4uLjAxLWNvbmRpdGlvbmFsbHktZG8tbm90LWZldGNoLWNvZGUtYnktZWFzeV9pbnN0
YWxsLnBhdGNoIHwgNCArKy0tCiAuLi5uMy1zZXR1cHRvb2xzXzY5LjUuMS5iYiA9PiBweXRob24z
LXNldHVwdG9vbHNfNzAuMS4xLmJifSB8IDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRp
b25zKCspLCA2IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24ve3B5dGhvbjMtc2V0dXB0b29sc182OS41LjEuYmIgPT4gcHl0aG9uMy1zZXR1cHRvb2xzXzcw
LjEuMS5iYn0gKDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtc2V0dXB0b29scy8wMDAxLV9kaXN0dXRpbHMtc3lzY29uZmlnLnB5LW1ha2UtaXQt
cG9zc2libGUtdG8tc3Vic3RpdGUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtc2V0dXB0b29scy8wMDAxLV9kaXN0dXRpbHMtc3lzY29uZmlnLnB5LW1ha2UtaXQt
cG9zc2libGUtdG8tc3Vic3RpdGUucGF0Y2gKaW5kZXggMGY2YzlkMjUwZC4uYjkyZjBjNzI5OCAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9v
bHMvMDAwMS1fZGlzdHV0aWxzLXN5c2NvbmZpZy5weS1tYWtlLWl0LXBvc3NpYmxlLXRvLXN1YnN0
aXRlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1
cHRvb2xzLzAwMDEtX2Rpc3R1dGlscy1zeXNjb25maWcucHktbWFrZS1pdC1wb3NzaWJsZS10by1z
dWJzdGl0ZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZDM5Mzc1OTMxNWIxODlhNzM4ZTRi
NmEyY2UzMWRjMThkYmJmYWUyOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNmQ4NGE0
YTYxNTc2MGM5YzViMDhlMmYyNDIwMGI5Yzg2YWI3MjczOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+CiBEYXRlOiBX
ZWQsIDExIE1heSAyMDIyIDIxOjQxOjE0ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIF9kaXN0dXRp
bHMvc3lzY29uZmlnLnB5OiBtYWtlIGl0IHBvc3NpYmxlIHRvIHN1YnN0aXRlIHRoZQpAQCAtMjAs
MTAgKzIwLDEwIEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0
cm9uaXguZGU+CiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCiAKIGRpZmYgLS1naXQgYS9zZXR1cHRvb2xzL19kaXN0dXRpbHMvc3lzY29uZmlnLnB5IGIv
c2V0dXB0b29scy9fZGlzdHV0aWxzL3N5c2NvbmZpZy5weQotaW5kZXggYTQwYTcyMy4uMTRmMzVl
NyAxMDA2NDQKK2luZGV4IDFhMzhlOWYuLmNjM2JkODggMTAwNjQ0CiAtLS0gYS9zZXR1cHRvb2xz
L19kaXN0dXRpbHMvc3lzY29uZmlnLnB5CiArKysgYi9zZXR1cHRvb2xzL19kaXN0dXRpbHMvc3lz
Y29uZmlnLnB5Ci1AQCAtMTE5LDYgKzExOSw4IEBAIGRlZiBnZXRfcHl0aG9uX2luYyhwbGF0X3Nw
ZWNpZmljPTAsIHByZWZpeD1Ob25lKToKK0BAIC0xMjAsNiArMTIwLDggQEAgZGVmIGdldF9weXRo
b25faW5jKHBsYXRfc3BlY2lmaWM9MCwgcHJlZml4PU5vbmUpOgogICAgICBzeXMuYmFzZV9leGVj
X3ByZWZpeCAtLSBpLmUuLCBpZ25vcmUgJ3BsYXRfc3BlY2lmaWMnLgogICAgICAiIiIKICAgICAg
ZGVmYXVsdF9wcmVmaXggPSBCQVNFX0VYRUNfUFJFRklYIGlmIHBsYXRfc3BlY2lmaWMgZWxzZSBC
QVNFX1BSRUZJWApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXNldHVwdG9vbHMvMDAwMS1jb25kaXRpb25hbGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWVh
c3lfaW5zdGFsbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1z
ZXR1cHRvb2xzLzAwMDEtY29uZGl0aW9uYWxseS1kby1ub3QtZmV0Y2gtY29kZS1ieS1lYXN5X2lu
c3RhbGwucGF0Y2gKaW5kZXggZTIyN2MyODg5Yy4uMjJkMGRkYmNiMiAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHMvMDAwMS1jb25kaXRp
b25hbGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWVhc3lfaW5zdGFsbC5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy8wMDAxLWNvbmRpdGlv
bmFsbHktZG8tbm90LWZldGNoLWNvZGUtYnktZWFzeV9pbnN0YWxsLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSA4MGZlNjM4MTZlYjNiZmQxZjViNmQzNTRlMWYyNDQyODA1Y2ZmNGUwIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA1Y2UzOTQ4YjkzNWViOWNjNDhkZTA0NDFkOTQzMWIy
MzY1OTBlNTlkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSG9uZ3h1IEppYSA8aG9u
Z3h1LmppYUB3aW5kcml2ZXIuY29tPgogRGF0ZTogVHVlLCAxNyBKdWwgMjAxOCAxMDoxMzozOCAr
MDgwMAogU3ViamVjdDogW1BBVENIXSBjb25kaXRpb25hbGx5IGRvIG5vdCBmZXRjaCBjb2RlIGJ5
IGVhc3lfaW5zdGFsbApAQCAtMTQsNyArMTQsNyBAQCBTaWduZWQtb2ZmLWJ5OiBIb25neHUgSmlh
IDxob25neHUuamlhQHdpbmRyaXZlci5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9u
cygrKQogCiBkaWZmIC0tZ2l0IGEvc2V0dXB0b29scy9jb21tYW5kL2Vhc3lfaW5zdGFsbC5weSBi
L3NldHVwdG9vbHMvY29tbWFuZC9lYXN5X2luc3RhbGwucHkKLWluZGV4IDg1OGZiMjAuLjYyYmQ4
NTMgMTAwNjQ0CitpbmRleCA4N2E2OGMyLi5lZWQyN2E3IDEwMDY0NAogLS0tIGEvc2V0dXB0b29s
cy9jb21tYW5kL2Vhc3lfaW5zdGFsbC5weQogKysrIGIvc2V0dXB0b29scy9jb21tYW5kL2Vhc3lf
aW5zdGFsbC5weQogQEAgLTY3Miw2ICs2NzIsMTEgQEAgY2xhc3MgZWFzeV9pbnN0YWxsKENvbW1h
bmQpOgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNl
dHVwdG9vbHNfNjkuNS4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXNldHVwdG9vbHNfNzAuMS4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzY5LjUuMS5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHNf
NzAuMS4xLmJiCmluZGV4IDgyNjFiMDlkMTYuLjhjMzA0Njk1ZWYgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzY5LjUuMS5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29sc183MC4xLjEu
YmIKQEAgLTExLDcgKzExLDcgQEAgU1JDX1VSSTphcHBlbmQ6Y2xhc3MtbmF0aXZlID0gIiBmaWxl
Oi8vMDAwMS1jb25kaXRpb25hbGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWUKIFNSQ19VUkkgKz0g
IiBcCiAgICAgICAgICAgICBmaWxlOi8vMDAwMS1fZGlzdHV0aWxzLXN5c2NvbmZpZy5weS1tYWtl
LWl0LXBvc3NpYmxlLXRvLXN1YnN0aXRlLnBhdGNoIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAi
NmMxZmNjZGFjMDVhOTdlNTk4ZmIwYWUzYmJlZDU5MDRjY2IzMTczMzdhNTExMzlkY2Q1MTQ1MzYx
MWJiYjk4NyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI5MzdhNDhjN2NkYjdhMjFlYjUzY2Q3Zjli
NTllNTI1NTAzYWE4YWJhZjM1ODRjNzMwZGM1ZjdhNWJlYzNhNjUwIgogCiBERVBFTkRTICs9ICJw
eXRob24zIgogCi0tIAoyLjQ0LjAKCg==

--===============1988978089097310946==--

