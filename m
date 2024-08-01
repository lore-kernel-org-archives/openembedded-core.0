Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFD32C52D6D
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:09 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.75738.1722536823030410136
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=V1FzNi7F;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=YcuL4tWk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101910f321d32-cd915be6-5847-4ecf-9539-0dfd9205bed9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536828;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Yx/YaubUHHJV76TimtLJFXKTpJKqXxDgQ/6XgzAhb14=;
	b=V1FzNi7FGtVmYxG7X2G6YqdVBescez6N1q6zMeMnaP6FhkJNkz6c9jk45z7d498N
	iPqoaY1f28XLDLaFqBWleQ0E4Trnge8igEXlEgr7RSPwT4VakUurReXq7vAxkOyuxRI
	wAh3qN0gcoFkxbyAIYMrcvYf6wfxwFGJdv/QAnos=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536828;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Yx/YaubUHHJV76TimtLJFXKTpJKqXxDgQ/6XgzAhb14=;
	b=YcuL4tWkph3CjU2pBwdpocVVMU6dYA9UTfRR0YbyL0pSZkkNwO8fkj1LiHpE3as3
	uEoCBNXDLN/W6PgMv70fCWexXGAwHE1TfQJCUPhlz8i4/dBm3OZL6ZJLAOzDYRfzMtf
	TwmGUd7oMoTEMvkG387rBqIwU9ASeN27qYhjgzl4=
Content-Type: multipart/mixed; boundary="===============5628237063106314648=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools: upgrading to 72.1.0 SUCCEEDED
Message-ID: <010101910f321d32-cd915be6-5847-4ecf-9539-0dfd9205bed9-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202814

--===============5628237063106314648==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-setuptools* to *72.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-upgrade-70.3.0-72.1.0.patch
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
From 7a0f9682397a89fbc2b4d25113eae45d384c0dbf Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Aug 2024 11:04:58 +0000
Subject: [PATCH] python3-setuptools: upgrade 70.3.0 -> 72.1.0

---
 ...stutils-sysconfig.py-make-it-possible-to-substite.patch | 7 ++-----
 ...1-conditionally-do-not-fetch-code-by-easy_install.patch | 4 ++--
 ...3-setuptools_70.3.0.bb => python3-setuptools_72.1.0.bb} | 2 +-
 3 files changed, 5 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_70.3.0.bb => python3-setuptools_72.1.0.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
index 68dca43e21..5df8eb74c6 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
@@ -1,4 +1,4 @@
-From a9f3483b492317959a35886308c31c078e350a35 Mon Sep 17 00:00:00 2001
+From a35b70dda4803af80732137c56781a15ce361f61 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Wed, 11 May 2022 21:41:14 +0200
 Subject: [PATCH] _distutils/sysconfig.py: make it possible to substite the
@@ -20,7 +20,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 10 insertions(+), 2 deletions(-)
 
 diff --git a/setuptools/_distutils/sysconfig.py b/setuptools/_distutils/sysconfig.py
-index 7ebe67687..8039021a8 100644
+index 7ebe676..8039021 100644
 --- a/setuptools/_distutils/sysconfig.py
 +++ b/setuptools/_distutils/sysconfig.py
 @@ -121,6 +121,8 @@ def get_python_inc(plat_specific=False, prefix=None):
@@ -56,6 +56,3 @@ index 7ebe67687..8039021a8 100644
          return _posix_lib(standard_lib, libpython, early_prefix, prefix)
      elif os.name == "nt":
          if standard_lib:
--- 
-2.39.2
-
diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index e227c2889c..86aa20be16 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From 80fe63816eb3bfd1f5b6d354e1f2442805cff4e0 Mon Sep 17 00:00:00 2001
+From 3ba62f89c5d017bed9aeb840875d4c22afa28c21 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
@@ -14,7 +14,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/setuptools/command/easy_install.py b/setuptools/command/easy_install.py
-index 858fb20..62bd853 100644
+index e6ce3fc..7fdd7d3 100644
 --- a/setuptools/command/easy_install.py
 +++ b/setuptools/command/easy_install.py
 @@ -672,6 +672,11 @@ class easy_install(Command):
diff --git a/meta/recipes-devtools/python/python3-setuptools_70.3.0.bb b/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-setuptools_70.3.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_72.1.0.bb
index 72a8d7bc3c..945d443aff 100644
--- a/meta/recipes-devtools/python/python3-setuptools_70.3.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb
@@ -11,7 +11,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "f171bab1dfbc86b132997f26a119f6056a57950d058587841a0082e8830f9dc5"
+SRC_URI[sha256sum] = "8d243eff56d095e5817f796ede6ae32941278f542e0f941867cc05ae52b162ec"
 
 DEPENDS += "python3"
 
-- 
2.44.0


--===============5628237063106314648==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-setuptools/python3-pkg-resources: PKGSIZE changed from 1556321 to 450475 (-71%)
packages/core2-64-poky-linux/python3-setuptools/python3-pkg-resources: FILELIST: removed "/usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/_parser.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/__init__.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/text/__init__.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/__pycache__/unix.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/_common.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/_compat.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/readers.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools/recipes.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/metadata.cpython-312.pyc /usr/lib/
 python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/utils.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/backports/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/simple.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/_manylinux.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/_musllinux.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/__pycache__/context.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/utils.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools/__pycache__/more.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/__init__.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools/__init__.pyi /usr/lib/python3.12/site-packages/pkg_resources/_vendor/backports/__init__.py /usr/lib/python3.12/site-packages/pkg_reso
 urces/_vendor/more_itertools/py.typed /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/_legacy.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools/__init__.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/text/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/abc.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/_tokenizer.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/tags.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/version.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/version.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__init__.py /usr/lib/python3.12/site-packages/
 pkg_resources/_vendor/jaraco/functools/__init__.pyi /usr/lib/python3.12/site-packages/pkg_resources/_vendor/__pycache__/zipp.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools/more.pyi /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/__pycache__/android.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/__pycache__/windows.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/_musllinux.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/tags.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/requirements.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/abc.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/unix.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/__pycache__/__init__.cpython-312.pyc /u
 sr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/py.typed /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/_structures.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/specifiers.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools/__pycache__/recipes.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/_itertools.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/_elffile.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/windows.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/_adapters.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/android.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/readers.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_ven
 dor/backports/tarfile.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/__init__.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/functools/py.typed /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/metadata.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/_legacy.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/backports/__pycache__/tarfile.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/api.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/_manylinux.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/py.typed /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/_tokenizer.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/_itertools.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/macos.py /usr/lib/python3
 .12/site-packages/pkg_resources/_vendor/jaraco/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/context.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/markers.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/version.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/__init__.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools/more.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/__main__.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/_common.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/_compat.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/extern/
 __pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/specifiers.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/__pycache__/api.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/extern/__init__.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/__pycache__/__main__.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools/recipes.pyi /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/functools/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/functools/__init__.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/_parser.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/py.typed /usr/lib/python3.12/site-packages/pkg_reso
 urces/_vendor/platformdirs/__pycache__/version.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/zipp.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/simple.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/_elffile.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/_structures.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/__pycache__/macos.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/_adapters.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/requirements.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/markers.py", added "/usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package-source/setup.py /usr/lib/python3.12/site-packages/pkg_resources/tests/test_working_set.py /usr/lib/python3.12/site-packages/pkg_resources/te
 sts/data/my-test-package-source/setup.cfg /usr/lib/python3.12/site-packages/pkg_resources/tests/__pycache__/test_integration_zope_interface.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/SOURCES.txt /usr/lib/python3.12/site-packages/pkg_resources/tests/__pycache__/test_pkg_resources.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/zip-safe /usr/lib/python3.12/site-packages/pkg_resources/tests/test_resources.py /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/top_level.txt /usr/lib/python3.12/site-packages/pkg_resources/tests/test_integration_zope_interface.py /usr/lib/python3.12/site-packages/pkg_resources/tests/__pycache__/test_find_distributions.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/api_tests
 .txt /usr/lib/python3.12/site-packages/pkg_resources/tests/__pycache__/test_markers.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/dependency_links.txt /usr/lib/python3.12/site-packages/pkg_resources/tests/__pycache__/test_resources.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/tests/test_find_distributions.py /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package-zip/my-test-package.zip /usr/lib/python3.12/site-packages/pkg_resources/tests/test_pkg_resources.py /usr/lib/python3.12/site-packages/pkg_resources/py.typed /usr/lib/python3.12/site-packages/pkg_resources/tests/test_markers.py /usr/lib/python3.12/site-packages/pkg_resources/tests/__init__.py /usr/lib/python3.12/site-packages/pkg_resources/tests/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/tests/__pycache__/test_working_set.cpython-312.pyc /usr/lib/pyth
 on3.12/site-packages/pkg_resources/tests/data/my-test-package-source/__pycache__/setup.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package_zipped-egg/my_test_package-1.0-py3.7.egg /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/PKG-INFO"
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools: PKGSIZE changed from 5161914 to 10946861 (+112%)
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools: FILELIST: directory renamed /usr/lib/python3.12/site-packages/setuptools-70.3.0.dist-info -> /usr/lib/python3.12/site-packages/setuptools-72.1.0.dist-info, directory renamed /usr/lib/python3.12/site-packages/setuptools/extern -> /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02, directory renamed /usr/lib/python3.12/site-packages/setuptools/extern/__pycache__ -> /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect/__pycache__, removed "/usr/lib/python3.12/site-packages/setuptools/_vendor/zipp.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata/_py39compat.py /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/__init__.py /usr/lib/python3.12/site-packages/setuptools/_vendor/__pycache__/zipp.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata/__pycache__/_py39compat.cpython-312.pyc /usr/lib/python3.12/site-pac
 kages/setuptools/_vendor/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/__pycache__/ordered_set.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/__init__.py /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/__pycache__/_compat.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/__pycache__/_legacy.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/_legacy.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/_compat.py /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/__pycache__/tarfile.cpython-312.pyc", added "/usr/lib/python3.12/site-packages/setuptools
 /_vendor/typeguard-4.3.0.dist-info/entry_points.txt /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/__pycache__/windows.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_utils.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/two/resource2.txt /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/bdist_wheel.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_archive_util.py /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/mod_with_constant.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/backports.tarfile-1.2.0.dist-info/LICENSE /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/namespacedata01/utf-16.file /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/REQUESTED /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__/test_contents.cpython-312.py
 c /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_install.py /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/__pycache__/_setuptools_logging.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_unixccompiler.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/__main__.py /usr/lib/python3.12/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/WHEEL /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_install.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_easy_install.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_virtualenv.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-14.0-amd64.exe /usr/lib/python3.12/site-packages/setuptools/_vendor/zi
 pp/__init__.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_build_scripts.py /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_manifest.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_dir_util.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/__pycache__/functional.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/compat/__pycache__/py39.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_depends.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile/__pycache__/__main__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_msvc9compiler.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/py.typed /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect/compat/__pycache__/__init
 __.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/RECORD /usr/lib/python3.12/site-packages/setuptools/tests/test_bdist_wheel.py /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/tags.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources-6.4.0.dist-info/top_level.txt /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_mingwccompiler.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/test_distutils_adoption.py /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile/compat/py38.py /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel-0.43.0.dist-info/LICENSE.txt /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_util.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand-2.2.2.dist-info/LICENSE /usr/lib/python3.12/site-packages/setuptools/_dist
 utils/command/wininst-8.0.exe /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01/binary.file /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_config_cmd.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/WHEEL /usr/lib/python3.12/site-packages/setuptools/tests/test_upload.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources-6.4.0.dist-info/INSTALLER /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/top_level.txt /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand-2.2.2.dist-info/WHEEL /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_find_packages.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/functional.py /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_elffile.cpython-312.pyc /usr/lib/python3.12/site-pac
 kages/setuptools/_distutils/tests/__pycache__/unix_compat.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__pycache__/_transformer.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set/py.typed /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/specifiers.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_core.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_build_clib.py /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__init__.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_install_lib.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_build_py.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/text/__pycache__/layouts.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/cli/__pycac
 he__/unpack.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile/__main__.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__/test_open.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/config/downloads/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_msvc9compiler.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_unixccompiler.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_build_clib.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/text/__pycache__/to-dvorak.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/windows.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/compat/py38.py /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_windows_wrappers.cpython-312.pyc /usr/lib/python3.12/site-package
 s/setuptools/_vendor/typeguard/__pycache__/_pytest_plugin.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/RECORD /usr/lib/python3.12/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/METADATA /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_distutils_adoption.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_upload.py /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/INSTALLER /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_text_file.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_register.py /usr/lib/python3.12/site-packages/setuptools/tests/test_unicode_utils.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources-6.4.0.dist-info/LICENSE /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_check.py /usr/lib/python3.12/site-packages/setuptools/_distutils/test
 s/test_clean.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_sdist.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_spawn.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_bdist.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_build.py /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/LICENSE /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_build_py.py /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/LICENSE /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_bdist_deprecations.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/test_sdist.py /usr/lib/python3.12/site-packages/setuptools/tests/fixtures.py /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel-0.43.0.dist-info/entry_points.txt /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_install_data.py /usr/lib/pytho
 n3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_resource.py /usr/lib/python3.12/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/INSTALLER /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__init__.py /usr/lib/python3.12/site-packages/setuptools/tests/namespaces.py /usr/lib/python3.12/site-packages/setuptools/tests/test_easy_install.py /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/RECORD /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/environment.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/METADATA /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_unicode_utils.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_integration.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_extern.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/whe
 el-0.43.0.dist-info/RECORD /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/METADATA /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_upload.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/__pycache__/version.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/LICENSE /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/_elffile.py /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__pycache__/_union_transformer.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/test_build.py /usr/lib/python3.12/site-packages/setuptools/_vendor/packaging-24.1.dist-info/REQUESTED /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_bdist_rpm.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_bdist_dumb.py /usr/lib/python3.12/site-packages/setuptools/_vendo
 r/importlib_resources/tests/util.py /usr/lib/python3.12/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/RECORD /usr/lib/python3.12/site-packages/setuptools/tests/config/__pycache__/test_apply_pyprojecttoml.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-9.0.exe /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/LICENSE /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/one/__init__.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_config.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/test_sandbox.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_register.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_compatibilty_files.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__/test_path.cpython-312.pyc /usr/li
 b/python3.12/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/WHEEL /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/cli/tags.py /usr/lib/python3.12/site-packages/setuptools/tests/environment.py /usr/lib/python3.12/site-packages/setuptools/tests/config/test_expand.py /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/WHEEL /usr/lib/python3.12/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/INSTALLER /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/LICENSE /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/__pycache__/macos.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/markers.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_build_ext.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect/compat/__init__.py /usr/lib/python3.12/site-packages/setuptool
 s/_distutils/tests/__pycache__/test_bdist.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_sdist.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_archive_util.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_msvccompiler.py /usr/lib/python3.12/site-packages/setuptools/_vendor/packaging-24.1.dist-info/LICENSE.APACHE /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__init__.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata/compat/__pycache__/py311.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/version.py /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_editable_install.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_setuptools.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/__init__.py /usr/lib/python3.12/site-pa
 ckages/setuptools/_vendor/autocommand/errors.py /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_parser.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/mod_with_constant.py /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info/METADATA /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/utils.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/compat/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/vendor.txt /usr/lib/python3.12/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/LICENSE /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/_setuptools_logging.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata/compat/__pycache__/py39.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources-6.4.0.dist-info/WHEEL /usr/lib/py
 thon3.12/site-packages/setuptools/tests/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/typing_extensions.py /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-14.0.exe /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_wheel.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/__pycache__/autoasync.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01/subdirectory/binary.file /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/cli/__pycache__/convert.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/test_msvc14.py /usr/lib/python3.12/site-packages/setuptools/tests/compat/py39.py /usr/lib/python3.12/site-packages/setuptools/tests/config/__pycache__/test_setupcfg.cpython-312.pyc /usr/lib/python
 3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01/utf-16.file /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/INSTALLER /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/textwrap.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/RECORD /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources-6.4.0.dist-info/METADATA /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/unix.py /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/script-with-bom.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/__pycache__/unix.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/
 _vendor/zipp/compat/__init__.py /usr/lib/python3.12/site-packages/setuptools/_vendor/ruff.toml /usr/lib/python3.12/site-packages/setuptools/tests/test_install_scripts.py /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/top_level.txt /usr/lib/python3.12/site-packages/setuptools/tests/test_editable_install.py /usr/lib/python3.12/site-packages/setuptools/tests/server.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/one/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_memo.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_contents.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__/test_read.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/future/__init__.py /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info/INSTAL
 LER /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__/zip.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_union_transformer.py /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__pycache__/_config.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/config/__pycache__/test_expand.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/config/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/test_archive_util.py /usr/lib/python3.12/site-packages/setuptools/tests/test_integration.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/namespacedata01/utf-8.file /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_install_headers.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/compat/__pycache__/py312.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_dist
 utils/tests/test_sysconfig.py /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/text/to-dvorak.py /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/INSTALLER /usr/lib/python3.12/site-packages/setuptools/_vendor/packaging-24.1.dist-info/LICENSE /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/future/adapters.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01/subdirectory/__init__.py /usr/lib/python3.12/site-packages/setuptools/tests/config/test_apply_pyprojecttoml.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/_path.py /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/LICENSE /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/METADATA /usr/lib/python3.12/site-packages/setuptools/
 _vendor/more_itertools-10.3.0.dist-info/LICENSE /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/cli/__init__.py /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_develop.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/contexts.py /usr/lib/python3.12/site-packages/setuptools/tests/config/test_pyprojecttoml_dynamic_deps.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_versionpredicate.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp/glob.py /usr/lib/python3.12/site-packages/setuptools/tests/test_setopt.py /usr/lib/python3.12/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/WHEEL /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/compat/py312.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata/compat/py39.py /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_pytest_plugin.py /usr/lib/python3.12/site-packages/setu
 ptools/tests/indexes/test_links_priority/simple/foobar/index.html /usr/lib/python3.12/site-packages/setuptools/tests/integration/__init__.py /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/top_level.txt /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/two/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/METADATA /usr/lib/python3.12/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/REQUESTED /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/__pycache__/autocommand.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01/utf-8.file /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/compat/__init__.py /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-10.0.exe /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/t
 est_dist.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_glob.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_dist_info.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/test_dist_info.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/unix_compat.py /usr/lib/python3.12/site-packages/setuptools/tests/test_find_packages.py /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/cli/__pycache__/pack.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/cli/__pycache__/tags.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/_musllinux.py /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/__pycache__/autoparse.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/text/__pycache__/to-qwerty.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_bdist_wheel.
 cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-6.0.exe /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile/compat/__init__.py /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__/test_functional.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_text_file.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/__init__.py /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/autocommand.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/namespacedata01/subdirectory/binary.file /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/utils.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/top_level.txt /usr/lib/python
 3.12/site-packages/setuptools/_vendor/importlib_metadata/compat/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/text.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__/util.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/__pycache__/bdist_wheel.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile/compat/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/requirements.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_extension.py /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_functions.py /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/cli/convert.py /usr/lib/python3.12/site-packages/setuptools/tests/test_register.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_reader.py
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_versionpredicate.py /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_egg_info.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_warnings.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_cygwinccompiler.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/INSTALLER /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/cli/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/_structures.py /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_manylinux.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_musllinux.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/INSTALLER /usr/lib/python3
 .12/site-packages/setuptools/tests/__pycache__/test_core_metadata.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/integration/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__/_path.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info/RECORD /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/compat/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_build_ext.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_extension.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/subdirectory/subsubdir/resource.txt /usr/lib/python3.12/site-packages/setuptools/tests/text.py /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect/compat/__pycache__/py38.cpython-312.pyc /usr/lib/python
 3.12/site-packages/setuptools/_distutils/tests/test_dir_util.py /usr/lib/python3.12/site-packages/setuptools/tests/test_find_py_modules.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_custom.py /usr/lib/python3.12/site-packages/setuptools/tests/config/setupcfg_examples.txt /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/top_level.txt /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_file_util.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/test_namespaces.py /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/tags.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_functional.py /usr/lib/python3.12/site-packages/setuptools/tests/compat/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/test_bdist_deprecations.py /usr/lib/python3.12/site-packages/setuptools/_vendor
 /backports/tarfile/compat/__pycache__/py38.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/INSTALLER /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/REQUESTED /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/future/__pycache__/adapters.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/METADATA /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_sandbox.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/config/__init__.py /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/LICENSE /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/METADATA /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_build_clib.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-10.0-amd64.exe /usr/lib/python3.12/site-p
 ackages/setuptools/tests/__pycache__/test_build_meta.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/server.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/test_windows_wrappers.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__init__.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__/test_compatibilty_files.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/textwrap.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_ccompiler.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_files.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__/test_reader.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_config.py /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/text/Lorem ipsum.txt /usr/lib/
 python3.12/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/RECORD /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/compat/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/version.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_build_ext.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_version.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__/test_files.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_archive_util.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/test_setuptools.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/config/test_pyprojecttoml.py /usr/lib/python3.12/site-packages/setupto
 ols/_vendor/jaraco/text/show-newlines.py /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/__pycache__/android.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_modified.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/top_level.txt /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/automain.py /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp/compat/py310.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources-6.4.0.dist-info/RECORD /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/__pycache__/__main__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/compat/py39.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_bdist_dumb.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/test_wheel.py /usr/lib/python3.12/site-packages/setuptools/tests/test_build_ex
 t.py /usr/lib/python3.12/site-packages/setuptools/tests/test_build_meta.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/future/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info/WHEEL /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/cli/unpack.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_filelist.py /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile/__init__.py /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/text/to-qwerty.py /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__pycache__/_importhook.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_sdist.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/REQUESTED /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_register.cpython-312.pyc /usr/lib/python3.12/site-packages
 /setuptools/_distutils/tests/compat/__pycache__/py38.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/backports.tarfile-1.2.0.dist-info/METADATA /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp/__pycache__/glob.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand-2.2.2.dist-info/top_level.txt /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__pycache__/_exceptions.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/integration/helpers.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_check.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__pycache__/_suppression.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-7.1.exe /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/autoasync.py /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/WHEEL /usr/lib/python3.1
 2/site-packages/setuptools/_vendor/wheel/vendored/packaging/version.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/support.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_ccompiler.py /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/REQUESTED /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/RECORD /usr/lib/python3.12/site-packages/setuptools/tests/test_logging.py /usr/lib/python3.12/site-packages/setuptools/tests/compat/__pycache__/py39.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/test_extern.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/WHEEL /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_namespaces.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/WHEEL /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_spawn.cpython-312.pyc 
 /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/py.typed /usr/lib/python3.12/site-packages/setuptools/tests/test_packageindex.py /usr/lib/python3.12/site-packages/setuptools/tests/test_build_py.py /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/WHEEL /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__pycache__/_checkers.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/__pycache__/automain.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/__init__.py /usr/lib/python3.12/site-packages/setuptools/tests/indexes/test_links_priority/external.html /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/fixtures.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_decorators.py /usr/lib/python3.12/site-packages/setuptools/_vendor/jara
 co.text-3.12.1.dist-info/REQUESTED /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_structures.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_bdist_egg.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/config/test_setupcfg.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_open.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_path.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_read.py /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_find_py_modules.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_checkers.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/compat/__pycache__/py38.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/compat/__pycache__/py39.cpython-312.p
 yc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_clean.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_build.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_setopt.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/test_build_clib.py /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/contexts.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01/subdirectory/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_install_scripts.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata/compat/py311.py /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__pycache__/_utils.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/compat/py38.py /usr/lib/python3.12/site-packages/setuptools
 /_distutils/tests/__pycache__/test_upload.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/__pycache__/typing_extensions.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/backports.tarfile-1.2.0.dist-info/WHEEL /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_file_util.py /usr/lib/python3.12/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/METADATA /usr/lib/python3.12/site-packages/setuptools/tests/config/downloads/__pycache__/preload.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/config/__pycache__/test_pyprojecttoml_dynamic_deps.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/METADATA /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__pycache__/_decorators.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/config/downloads/preload.py /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel-0.43.0.dist-info/INSTAL
 LER /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/text/layouts.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_cmd.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_log.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_cmd.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/packaging-24.1.dist-info/METADATA /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/cli/pack.py /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_version.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/RECORD /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect/compat/py38.py /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/__pycache__/errors.cpython-312.pyc /usr/lib/python3.12/site-packages/setupto
 ols/_vendor/wheel/vendored/packaging/__pycache__/markers.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/test_bdist_egg.py /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/METADATA /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/__pycache__/api.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/namespacedata01/binary.file /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/__pycache__/__main__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_exceptions.py /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp/compat/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_msvc14.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_config.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_cygwinccompiler.cpython-312.pyc /usr/lib/
 python3.12/site-packages/setuptools/_vendor/jaraco/text/strip-prefix.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__/test_resource.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_logging.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata/compat/__init__.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_config_cmd.py /usr/lib/python3.12/site-packages/setuptools/tests/test_core_metadata.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_filelist.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/one/resource1.txt /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/INSTALLER /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_config_discovery.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/test_manifest.p
 y /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect/py.typed /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata/__pycache__/diagnose.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/api.py /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_importhook.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__/test_custom.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/WHEEL /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/_manylinux.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_dist.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_sysconfig.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set/__init__.py /usr/lib/python3.12/site-packages/setuptools/_vendor/packaging-24.1.dist-info/INSTALL
 ER /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_mingwccompiler.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_install_data.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_install_scripts.py /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/text/__pycache__/show-newlines.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/namespaces.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/compat/__init__.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_msvccompiler.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_bdist_rpm.py /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/specifiers.py /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/c
 ommand/wininst-9.0-amd64.exe /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/METADATA /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/RECORD /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/support.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/packaging-24.1.dist-info/RECORD /usr/lib/python3.12/site-packages/setuptools/tests/compat/__init__.py /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel-0.43.0.dist-info/WHEEL /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/requirements.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/backports.tarfile-1.2.0.dist-info/INSTALLER /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand-2.2.2.dist-info/RECORD /usr/lib/python3.12/site-packages/setuptools/tests/test_egg_info.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/__init__
 .cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/test_dist.py /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/INSTALLER /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_packageindex.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel-0.43.0.dist-info/METADATA /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_install_headers.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info/REQUESTED /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_install_scripts.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_install_lib.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/packaging-24.1.dist-info/WHEEL /usr/lib/python3.12/site-packages/setuptools/
 tests/integration/test_pip_install_sdist.py /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/_tokenizer.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_log.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/test_virtualenv.py /usr/lib/python3.12/site-packages/setuptools/_vendor/packaging-24.1.dist-info/LICENSE.BSD /usr/lib/python3.12/site-packages/setuptools/tests/config/downloads/__init__.py /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/text/__pycache__/strip-prefix.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/INSTALLER /usr/lib/python3.12/site-packages/setuptools/tests/test_config_discovery.py /usr/lib/python3.12/site-packages/setuptools/_vendor/backports.tarfile-1.2.0.dist-info/RECORD /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/top_level.txt /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache_
 _/test_build_scripts.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect/__init__.py /usr/lib/python3.12/site-packages/setuptools/tests/script-with-bom.py /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__pycache__/_memo.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/test_develop.py /usr/lib/python3.12/site-packages/setuptools/tests/test_depends.py /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_transformer.py /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_build_py.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01/__init__.py /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/__init__.py /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/__main__.py /usr/lib/python3.12/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/LICENSE /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel-0.43.
 0.dist-info/REQUESTED /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata/diagnose.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/compat/py39.py /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp/compat/__pycache__/py310.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/config/__pycache__/test_pyprojecttoml.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/RECORD /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_suppression.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/two/__init__.py /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand-2.2.2.dist-info/INSTALLER /usr/lib/python3.12/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/RECORD /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_build.cpython-312.pyc /usr/lib/python3.12/site-packages/
 setuptools/_vendor/zipp-3.19.2.dist-info/WHEEL /usr/lib/python3.12/site-packages/setuptools/tests/integration/__pycache__/helpers.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_core.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_dist.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_util.py /usr/lib/python3.12/site-packages/setuptools/tests/test_glob.py /usr/lib/python3.12/site-packages/setuptools/tests/test_warnings.py /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/_parser.py /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info/licenses/LICENSE /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__pycache__/_functions.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/autoparse.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/compat/__init__.py /usr/lib/python3.12/site-packages/
 setuptools/_vendor/importlib_resources-6.4.0.dist-info/REQUESTED /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/android.py /usr/lib/python3.12/site-packages/setuptools/_vendor/backports.tarfile-1.2.0.dist-info/top_level.txt /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/zip.py /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_tokenizer.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/backports.tarfile-1.2.0.dist-info/REQUESTED /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand-2.2.2.dist-info/METADATA /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_modified.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/macos.py /usr/lib/python3.12/site-packages/setuptools/tests/integration/__pycache__/test_pip_install_sdist.cpython-312.pyc"
Changes to packages/core2-64-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.12/site-packages/setuptools-70.3.0.dist-info moved to /usr/lib/python3.12/site-packages/setuptools-72.1.0.dist-info
  /usr/lib/python3.12/site-packages/pkg_resources/api_tests.txt was added
  /usr/lib/python3.12/site-packages/pkg_resources/py.typed was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package-source was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package-source/__pycache__ was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package-source/__pycache__/setup.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package-source/setup.cfg was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package-source/setup.py was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/dependency_links.txt was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/PKG-INFO was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/SOURCES.txt was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/top_level.txt was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/zip-safe was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package-zip was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package-zip/my-test-package.zip was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package_zipped-egg was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package_zipped-egg/my_test_package-1.0-py3.7.egg was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/__init__.py was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/__pycache__ was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/__pycache__/test_find_distributions.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/__pycache__/test_integration_zope_interface.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/__pycache__/test_markers.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/__pycache__/test_pkg_resources.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/__pycache__/test_resources.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/__pycache__/test_working_set.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/test_find_distributions.py was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/test_integration_zope_interface.py was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/test_markers.py was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/test_pkg_resources.py was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/test_resources.py was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/test_working_set.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-10.0-amd64.exe was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-10.0.exe was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-14.0-amd64.exe was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-14.0.exe was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-6.0.exe was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-7.1.exe was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-8.0.exe was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-9.0-amd64.exe was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-9.0.exe was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/compat was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/compat/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/compat/py38.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/compat/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/compat/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/compat/__pycache__/py38.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/support.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_archive_util.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_bdist.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_bdist_dumb.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_bdist_rpm.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_build_clib.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_build.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_build_ext.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_build_py.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_build_scripts.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_ccompiler.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_check.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_clean.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_cmd.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_config_cmd.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_config.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_core.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_cygwinccompiler.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_dir_util.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_dist.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_extension.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_filelist.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_file_util.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_install.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_install_data.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_install_headers.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_install_lib.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_install_scripts.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_log.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_mingwccompiler.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_modified.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_msvc9compiler.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_msvccompiler.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_register.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_sdist.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_spawn.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_sysconfig.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_text_file.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_unixccompiler.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_upload.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_util.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_version.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_versionpredicate.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/unix_compat.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/support.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_archive_util.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_bdist_dumb.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_bdist.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_bdist_rpm.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_build_clib.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_build_ext.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_build.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_build_py.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_build_scripts.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_ccompiler.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_check.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_clean.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_cmd.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_config_cmd.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_config.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_core.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_cygwinccompiler.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_dir_util.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_dist.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_extension.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_filelist.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_file_util.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_install_data.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_install_headers.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_install_lib.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_install.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_install_scripts.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_log.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_mingwccompiler.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_modified.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_msvc9compiler.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_msvccompiler.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_register.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_sdist.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_spawn.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_sysconfig.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_text_file.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_unixccompiler.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_upload.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_util.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_versionpredicate.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_version.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/unix_compat.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests was added
  /usr/lib/python3.12/site-packages/setuptools/tests/compat was added
  /usr/lib/python3.12/site-packages/setuptools/tests/compat/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/compat/py39.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/compat/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/tests/compat/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/compat/__pycache__/py39.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/downloads was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/downloads/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/downloads/preload.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/downloads/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/downloads/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/downloads/__pycache__/preload.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/__pycache__/test_apply_pyprojecttoml.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/__pycache__/test_expand.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/__pycache__/test_pyprojecttoml.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/__pycache__/test_pyprojecttoml_dynamic_deps.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/__pycache__/test_setupcfg.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/setupcfg_examples.txt was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/test_apply_pyprojecttoml.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/test_expand.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/test_pyprojecttoml_dynamic_deps.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/test_pyprojecttoml.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/test_setupcfg.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/contexts.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/environment.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/fixtures.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/indexes was added
  /usr/lib/python3.12/site-packages/setuptools/tests/indexes/test_links_priority was added
  /usr/lib/python3.12/site-packages/setuptools/tests/indexes/test_links_priority/external.html was added
  /usr/lib/python3.12/site-packages/setuptools/tests/indexes/test_links_priority/simple was added
  /usr/lib/python3.12/site-packages/setuptools/tests/indexes/test_links_priority/simple/foobar was added
  /usr/lib/python3.12/site-packages/setuptools/tests/indexes/test_links_priority/simple/foobar/index.html was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/integration was added
  /usr/lib/python3.12/site-packages/setuptools/tests/integration/helpers.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/integration/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/integration/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/tests/integration/__pycache__/helpers.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/integration/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/integration/__pycache__/test_pip_install_sdist.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/integration/test_pip_install_sdist.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/mod_with_constant.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/namespaces.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/contexts.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/environment.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/fixtures.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/mod_with_constant.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/namespaces.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/script-with-bom.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/server.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_archive_util.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_bdist_deprecations.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_bdist_egg.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_bdist_wheel.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_build_clib.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_build.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_build_ext.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_build_meta.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_build_py.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_config_discovery.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_core_metadata.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_depends.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_develop.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_dist.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_dist_info.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_distutils_adoption.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_easy_install.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_editable_install.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_egg_info.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_extern.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_find_packages.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_find_py_modules.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_glob.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_install_scripts.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_integration.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_logging.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_manifest.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_msvc14.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_namespaces.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_packageindex.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_register.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_sandbox.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_sdist.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_setopt.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_setuptools.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_unicode_utils.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_upload.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_virtualenv.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_warnings.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_wheel.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_windows_wrappers.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/text.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/textwrap.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/script-with-bom.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/server.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_archive_util.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_bdist_deprecations.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_bdist_egg.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_bdist_wheel.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_build_clib.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_build_ext.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_build_meta.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_build.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_build_py.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_config_discovery.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_core_metadata.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_depends.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_develop.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_dist_info.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_dist.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_distutils_adoption.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_easy_install.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_editable_install.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_egg_info.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_extern.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_find_packages.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_find_py_modules.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_glob.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_install_scripts.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_integration.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_logging.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_manifest.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_msvc14.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_namespaces.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_packageindex.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_register.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_sandbox.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_sdist.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_setopt.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_setuptools.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_unicode_utils.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_upload.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_virtualenv.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_warnings.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_wheel.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_windows_wrappers.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/text.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/textwrap.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand-2.2.2.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand-2.2.2.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand-2.2.2.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand-2.2.2.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand-2.2.2.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand-2.2.2.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand-2.2.2.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/autoasync.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/autocommand.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/automain.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/autoparse.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/errors.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/__pycache__/autoasync.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/__pycache__/autocommand.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/__pycache__/automain.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/__pycache__/autoparse.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/__pycache__/errors.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports.tarfile-1.2.0.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports.tarfile-1.2.0.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports.tarfile-1.2.0.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports.tarfile-1.2.0.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports.tarfile-1.2.0.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports.tarfile-1.2.0.dist-info/REQUESTED was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports.tarfile-1.2.0.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports.tarfile-1.2.0.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile/compat was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile/compat/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile/compat/py38.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile/compat/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile/compat/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile/compat/__pycache__/py38.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile/__main__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile/__pycache__/__main__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/REQUESTED was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata/compat was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata/compat/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata/compat/py311.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata/compat/py39.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata/compat/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata/compat/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata/compat/__pycache__/py311.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata/compat/__pycache__/py39.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata/diagnose.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata/__pycache__/diagnose.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources-6.4.0.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources-6.4.0.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources-6.4.0.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources-6.4.0.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources-6.4.0.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources-6.4.0.dist-info/REQUESTED was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources-6.4.0.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources-6.4.0.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/compat was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/compat/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/compat/py38.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/compat/py39.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/compat/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/compat/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/compat/__pycache__/py38.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/compat/__pycache__/py39.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/functional.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/future was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/future/adapters.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/future/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/future/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/future/__pycache__/adapters.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/future/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/__pycache__/functional.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/compat was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/compat/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/compat/py312.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/compat/py39.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/compat/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/compat/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/compat/__pycache__/py312.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/compat/__pycache__/py39.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01 was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01/binary.file was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01/subdirectory was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01/subdirectory/binary.file was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01/subdirectory/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01/subdirectory/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01/subdirectory/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01/utf-16.file was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01/utf-8.file was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02 was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/one was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/one/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/one/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/one/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/one/resource1.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/subdirectory was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/subdirectory/subsubdir was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/subdirectory/subsubdir/resource.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/two was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/two/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/two/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/two/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/two/resource2.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/namespacedata01 was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/namespacedata01/binary.file was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/namespacedata01/subdirectory was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/namespacedata01/subdirectory/binary.file was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/namespacedata01/utf-16.file was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/namespacedata01/utf-8.file was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/_path.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__/_path.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__/test_compatibilty_files.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__/test_contents.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__/test_custom.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__/test_files.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__/test_functional.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__/test_open.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__/test_path.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__/test_read.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__/test_reader.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__/test_resource.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__/util.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__/zip.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_compatibilty_files.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_contents.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_custom.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_files.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_functional.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_open.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_path.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_reader.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_read.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_resource.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/util.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/zip.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect/compat was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect/compat/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect/compat/py38.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect/compat/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect/compat/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect/compat/__pycache__/py38.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect/py.typed was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/REQUESTED was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/text/layouts.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/text/Lorem ipsum.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/text/__pycache__/layouts.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/text/__pycache__/show-newlines.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/text/__pycache__/strip-prefix.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/text/__pycache__/to-dvorak.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/text/__pycache__/to-qwerty.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/text/show-newlines.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/text/strip-prefix.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/text/to-dvorak.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/text/to-qwerty.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/REQUESTED was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/REQUESTED was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set/py.typed was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/packaging-24.1.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/packaging-24.1.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/packaging-24.1.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/packaging-24.1.dist-info/LICENSE.APACHE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/packaging-24.1.dist-info/LICENSE.BSD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/packaging-24.1.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/packaging-24.1.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/packaging-24.1.dist-info/REQUESTED was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/packaging-24.1.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info/licenses was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info/licenses/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info/REQUESTED was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/android.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/api.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/macos.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/__main__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/__pycache__/android.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/__pycache__/api.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/__pycache__/macos.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/__pycache__/__main__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/__pycache__/unix.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/__pycache__/version.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/__pycache__/windows.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/py.typed was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/unix.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/version.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/windows.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/__pycache__/typing_extensions.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ruff.toml was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/REQUESTED was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/entry_points.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_checkers.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_config.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_decorators.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_exceptions.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_functions.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_importhook.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_memo.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__pycache__/_checkers.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__pycache__/_config.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__pycache__/_decorators.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__pycache__/_exceptions.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__pycache__/_functions.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__pycache__/_importhook.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__pycache__/_memo.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__pycache__/_pytest_plugin.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__pycache__/_suppression.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__pycache__/_transformer.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__pycache__/_union_transformer.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__pycache__/_utils.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_pytest_plugin.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/py.typed was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_suppression.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_transformer.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_union_transformer.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_utils.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typing_extensions.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel-0.43.0.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel-0.43.0.dist-info/entry_points.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel-0.43.0.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel-0.43.0.dist-info/LICENSE.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel-0.43.0.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel-0.43.0.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel-0.43.0.dist-info/REQUESTED was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel-0.43.0.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/bdist_wheel.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/cli was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/cli/convert.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/cli/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/cli/pack.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/cli/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/cli/__pycache__/convert.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/cli/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/cli/__pycache__/pack.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/cli/__pycache__/tags.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/cli/__pycache__/unpack.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/cli/tags.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/cli/unpack.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/__main__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/__pycache__/bdist_wheel.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/__pycache__/__main__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/__pycache__/_setuptools_logging.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/_setuptools_logging.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/_elffile.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/_manylinux.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/markers.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/_musllinux.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/_parser.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_elffile.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_manylinux.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/markers.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_musllinux.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_parser.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/requirements.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/specifiers.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_structures.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/tags.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_tokenizer.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/utils.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/version.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/requirements.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/specifiers.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/_structures.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/tags.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/_tokenizer.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/utils.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/version.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/vendor.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/REQUESTED was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp/compat was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp/compat/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp/compat/py310.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp/compat/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp/compat/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp/compat/__pycache__/py310.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp/glob.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp/__pycache__/glob.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/pkg_resources/extern was removed
  /usr/lib/python3.12/site-packages/pkg_resources/extern/__init__.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/extern/__pycache__ was removed
  /usr/lib/python3.12/site-packages/pkg_resources/extern/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/backports was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/backports/__init__.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/backports/__pycache__ was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/backports/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/backports/__pycache__/tarfile.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/backports/tarfile.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/abc.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/_adapters.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/_common.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/_compat.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/__init__.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/_itertools.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/_legacy.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__ was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/abc.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/_adapters.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/_common.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/_compat.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/_itertools.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/_legacy.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/readers.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/simple.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/py.typed was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/readers.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/simple.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/__init__.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/context.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/functools was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/functools/__init__.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/functools/__init__.pyi was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/functools/__pycache__ was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/functools/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/functools/py.typed was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/__init__.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/__pycache__ was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/__pycache__/context.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/text was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/text/__init__.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/text/__pycache__ was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/text/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools/__init__.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools/__init__.pyi was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools/more.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools/more.pyi was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools/__pycache__ was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools/__pycache__/more.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools/__pycache__/recipes.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools/py.typed was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools/recipes.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools/recipes.pyi was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/_elffile.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__init__.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/_manylinux.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/markers.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/metadata.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/_musllinux.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/_parser.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__ was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/_elffile.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/_manylinux.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/markers.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/metadata.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/_musllinux.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/_parser.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/requirements.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/specifiers.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/_structures.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/tags.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/_tokenizer.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/utils.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/version.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/py.typed was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/requirements.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/specifiers.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/_structures.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/tags.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/_tokenizer.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/utils.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/version.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/android.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/api.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/__init__.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/macos.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/__main__.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/__pycache__ was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/__pycache__/android.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/__pycache__/api.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/__pycache__/macos.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/__pycache__/__main__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/__pycache__/unix.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/__pycache__/version.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/__pycache__/windows.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/py.typed was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/unix.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/version.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/windows.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/__pycache__ was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/__pycache__/zipp.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/zipp.py was removed
  /usr/lib/python3.12/site-packages/setuptools/extern was removed
  /usr/lib/python3.12/site-packages/setuptools/extern/__init__.py was removed
  /usr/lib/python3.12/site-packages/setuptools/extern/__pycache__ was removed
  /usr/lib/python3.12/site-packages/setuptools/extern/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/__pycache__/tarfile.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata/_py39compat.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata/__pycache__/_py39compat.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/_compat.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/_legacy.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/__pycache__/_compat.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/__pycache__/_legacy.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/__init__.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/__init__.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/__pycache__/ordered_set.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/__pycache__/zipp.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp.py was removed
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.12/site-packages/setuptools-70.3.0.dist-info moved to /usr/lib/python3.12/site-packages/setuptools-72.1.0.dist-info
  /usr/lib/python3.12/site-packages/pkg_resources/api_tests.txt was added
  /usr/lib/python3.12/site-packages/pkg_resources/py.typed was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package-source was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package-source/setup.cfg was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package-source/setup.py was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/dependency_links.txt was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/PKG-INFO was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/SOURCES.txt was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/top_level.txt was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/zip-safe was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package-zip was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package-zip/my-test-package.zip was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package_zipped-egg was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package_zipped-egg/my_test_package-1.0-py3.7.egg was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/__init__.py was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/test_find_distributions.py was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/test_integration_zope_interface.py was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/test_markers.py was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/test_pkg_resources.py was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/test_resources.py was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/test_working_set.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-10.0-amd64.exe was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-10.0.exe was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-14.0-amd64.exe was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-14.0.exe was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-6.0.exe was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-7.1.exe was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-8.0.exe was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-9.0-amd64.exe was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-9.0.exe was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/compat was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/compat/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/compat/py38.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/support.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_archive_util.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_bdist_dumb.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_bdist.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_bdist_rpm.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_build_clib.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_build_ext.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_build.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_build_py.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_build_scripts.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_ccompiler.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_check.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_clean.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_cmd.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_config_cmd.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_config.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_core.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_cygwinccompiler.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_dir_util.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_dist.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_extension.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_filelist.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_file_util.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_install_data.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_install_headers.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_install_lib.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_install.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_install_scripts.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_log.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_mingwccompiler.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_modified.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_msvc9compiler.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_msvccompiler.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_register.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_sdist.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_spawn.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_sysconfig.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_text_file.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_unixccompiler.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_upload.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_util.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_versionpredicate.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_version.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/unix_compat.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests was added
  /usr/lib/python3.12/site-packages/setuptools/tests/compat was added
  /usr/lib/python3.12/site-packages/setuptools/tests/compat/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/compat/py39.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/downloads was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/downloads/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/downloads/preload.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/setupcfg_examples.txt was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/test_apply_pyprojecttoml.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/test_expand.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/test_pyprojecttoml_dynamic_deps.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/test_pyprojecttoml.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/test_setupcfg.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/contexts.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/environment.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/fixtures.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/indexes was added
  /usr/lib/python3.12/site-packages/setuptools/tests/indexes/test_links_priority was added
  /usr/lib/python3.12/site-packages/setuptools/tests/indexes/test_links_priority/external.html was added
  /usr/lib/python3.12/site-packages/setuptools/tests/indexes/test_links_priority/simple was added
  /usr/lib/python3.12/site-packages/setuptools/tests/indexes/test_links_priority/simple/foobar was added
  /usr/lib/python3.12/site-packages/setuptools/tests/indexes/test_links_priority/simple/foobar/index.html was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/integration was added
  /usr/lib/python3.12/site-packages/setuptools/tests/integration/helpers.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/integration/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/integration/test_pip_install_sdist.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/mod_with_constant.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/namespaces.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/script-with-bom.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/server.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_archive_util.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_bdist_deprecations.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_bdist_egg.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_bdist_wheel.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_build_clib.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_build_ext.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_build_meta.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_build.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_build_py.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_config_discovery.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_core_metadata.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_depends.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_develop.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_dist_info.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_dist.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_distutils_adoption.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_easy_install.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_editable_install.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_egg_info.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_extern.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_find_packages.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_find_py_modules.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_glob.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_install_scripts.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_integration.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_logging.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_manifest.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_msvc14.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_namespaces.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_packageindex.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_register.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_sandbox.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_sdist.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_setopt.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_setuptools.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_unicode_utils.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_upload.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_virtualenv.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_warnings.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_wheel.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_windows_wrappers.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/text.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/textwrap.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand-2.2.2.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand-2.2.2.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand-2.2.2.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand-2.2.2.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand-2.2.2.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand-2.2.2.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand-2.2.2.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/autoasync.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/autocommand.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/automain.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/autoparse.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/errors.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports.tarfile-1.2.0.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports.tarfile-1.2.0.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports.tarfile-1.2.0.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports.tarfile-1.2.0.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports.tarfile-1.2.0.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports.tarfile-1.2.0.dist-info/REQUESTED was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports.tarfile-1.2.0.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports.tarfile-1.2.0.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile/compat was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile/compat/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile/compat/py38.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile/__main__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/REQUESTED was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata/compat was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata/compat/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata/compat/py311.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata/compat/py39.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata/diagnose.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources-6.4.0.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources-6.4.0.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources-6.4.0.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources-6.4.0.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources-6.4.0.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources-6.4.0.dist-info/REQUESTED was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources-6.4.0.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources-6.4.0.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/compat was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/compat/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/compat/py38.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/compat/py39.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/functional.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/future was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/future/adapters.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/future/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/compat was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/compat/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/compat/py312.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/compat/py39.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01 was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01/binary.file was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01/subdirectory was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01/subdirectory/binary.file was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01/subdirectory/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01/utf-16.file was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01/utf-8.file was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02 was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/one was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/one/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/one/resource1.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/subdirectory was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/subdirectory/subsubdir was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/subdirectory/subsubdir/resource.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/two was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/two/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/two/resource2.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/namespacedata01 was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/namespacedata01/binary.file was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/namespacedata01/subdirectory was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/namespacedata01/subdirectory/binary.file was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/namespacedata01/utf-16.file was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/namespacedata01/utf-8.file was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/_path.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_compatibilty_files.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_contents.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_custom.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_files.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_functional.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_open.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_path.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_reader.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_read.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_resource.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/util.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/zip.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect/compat was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect/compat/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect/compat/py38.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect/py.typed was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/REQUESTED was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/text/layouts.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/text/Lorem ipsum.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/text/show-newlines.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/text/strip-prefix.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/text/to-dvorak.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/text/to-qwerty.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/REQUESTED was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/REQUESTED was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set/py.typed was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/packaging-24.1.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/packaging-24.1.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/packaging-24.1.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/packaging-24.1.dist-info/LICENSE.APACHE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/packaging-24.1.dist-info/LICENSE.BSD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/packaging-24.1.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/packaging-24.1.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/packaging-24.1.dist-info/REQUESTED was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/packaging-24.1.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info/licenses was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info/licenses/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info/REQUESTED was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/android.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/api.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/macos.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/__main__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/py.typed was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/unix.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/version.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/windows.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ruff.toml was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/REQUESTED was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/entry_points.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_checkers.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_config.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_decorators.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_exceptions.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_functions.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_importhook.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_memo.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_pytest_plugin.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/py.typed was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_suppression.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_transformer.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_union_transformer.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_utils.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typing_extensions.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel-0.43.0.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel-0.43.0.dist-info/entry_points.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel-0.43.0.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel-0.43.0.dist-info/LICENSE.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel-0.43.0.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel-0.43.0.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel-0.43.0.dist-info/REQUESTED was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel-0.43.0.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/bdist_wheel.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/cli was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/cli/convert.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/cli/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/cli/pack.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/cli/tags.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/cli/unpack.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/__main__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/_setuptools_logging.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/_elffile.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/_manylinux.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/markers.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/_musllinux.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/_parser.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/requirements.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/specifiers.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/_structures.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/tags.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/_tokenizer.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/utils.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/version.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/vendor.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/REQUESTED was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp/compat was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp/compat/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp/compat/py310.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp/glob.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp/__init__.py was added
  /usr/lib/python3.12/site-packages/pkg_resources/extern was removed
  /usr/lib/python3.12/site-packages/pkg_resources/extern/__init__.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/backports was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/backports/__init__.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/backports/tarfile.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/abc.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/_adapters.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/_common.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/_compat.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/__init__.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/_itertools.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/_legacy.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/py.typed was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/readers.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/simple.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/__init__.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/context.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/functools was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/functools/__init__.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/functools/__init__.pyi was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/functools/py.typed was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/__init__.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/text was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/text/__init__.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools/__init__.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools/__init__.pyi was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools/more.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools/more.pyi was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools/py.typed was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools/recipes.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools/recipes.pyi was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/_elffile.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__init__.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/_manylinux.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/markers.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/metadata.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/_musllinux.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/_parser.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/py.typed was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/requirements.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/specifiers.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/_structures.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/tags.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/_tokenizer.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/utils.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/version.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/android.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/api.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/__init__.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/macos.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/__main__.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/py.typed was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/unix.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/version.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/windows.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/zipp.py was removed
  /usr/lib/python3.12/site-packages/setuptools/extern was removed
  /usr/lib/python3.12/site-packages/setuptools/extern/__init__.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata/_py39compat.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/_compat.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/_legacy.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/__init__.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/__init__.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp.py was removed

--===============5628237063106314648==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-upgrade-70.3.0-72.1.0.patch"

RnJvbSA3YTBmOTY4MjM5N2E4OWZiYzJiNGQyNTExM2VhZTQ1ZDM4NGMwZGJmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBBdWcgMjAyNCAxMTowNDo1OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc2V0dXB0b29sczogdXBncmFkZSA3MC4zLjAgLT4gNzIuMS4wCgotLS0KIC4uLnN0dXRp
bHMtc3lzY29uZmlnLnB5LW1ha2UtaXQtcG9zc2libGUtdG8tc3Vic3RpdGUucGF0Y2ggfCA3ICsr
LS0tLS0KIC4uLjEtY29uZGl0aW9uYWxseS1kby1ub3QtZmV0Y2gtY29kZS1ieS1lYXN5X2luc3Rh
bGwucGF0Y2ggfCA0ICsrLS0KIC4uLjMtc2V0dXB0b29sc183MC4zLjAuYmIgPT4gcHl0aG9uMy1z
ZXR1cHRvb2xzXzcyLjEuMC5iYn0gfCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9u
cygrKSwgOCBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3tweXRob24zLXNldHVwdG9vbHNfNzAuMy4wLmJiID0+IHB5dGhvbjMtc2V0dXB0b29sc183Mi4x
LjAuYmJ9ICg5NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXNldHVwdG9vbHMvMDAwMS1fZGlzdHV0aWxzLXN5c2NvbmZpZy5weS1tYWtlLWl0LXBv
c3NpYmxlLXRvLXN1YnN0aXRlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXNldHVwdG9vbHMvMDAwMS1fZGlzdHV0aWxzLXN5c2NvbmZpZy5weS1tYWtlLWl0LXBv
c3NpYmxlLXRvLXN1YnN0aXRlLnBhdGNoCmluZGV4IDY4ZGNhNDNlMjEuLjVkZjhlYjc0YzYgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xz
LzAwMDEtX2Rpc3R1dGlscy1zeXNjb25maWcucHktbWFrZS1pdC1wb3NzaWJsZS10by1zdWJzdGl0
ZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0
b29scy8wMDAxLV9kaXN0dXRpbHMtc3lzY29uZmlnLnB5LW1ha2UtaXQtcG9zc2libGUtdG8tc3Vi
c3RpdGUucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGE5ZjM0ODNiNDkyMzE3OTU5YTM1ODg2
MzA4YzMxYzA3OGUzNTBhMzUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGEzNWI3MGRk
YTQ4MDNhZjgwNzMyMTM3YzU2NzgxYTE1Y2UzNjFmNjEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgogRGF0ZTogV2Vk
LCAxMSBNYXkgMjAyMiAyMTo0MToxNCArMDIwMAogU3ViamVjdDogW1BBVENIXSBfZGlzdHV0aWxz
L3N5c2NvbmZpZy5weTogbWFrZSBpdCBwb3NzaWJsZSB0byBzdWJzdGl0ZSB0aGUKQEAgLTIwLDcg
KzIwLDcgQEAgU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25p
eC5kZT4KICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
IAogZGlmZiAtLWdpdCBhL3NldHVwdG9vbHMvX2Rpc3R1dGlscy9zeXNjb25maWcucHkgYi9zZXR1
cHRvb2xzL19kaXN0dXRpbHMvc3lzY29uZmlnLnB5Ci1pbmRleCA3ZWJlNjc2ODcuLjgwMzkwMjFh
OCAxMDA2NDQKK2luZGV4IDdlYmU2NzYuLjgwMzkwMjEgMTAwNjQ0CiAtLS0gYS9zZXR1cHRvb2xz
L19kaXN0dXRpbHMvc3lzY29uZmlnLnB5CiArKysgYi9zZXR1cHRvb2xzL19kaXN0dXRpbHMvc3lz
Y29uZmlnLnB5CiBAQCAtMTIxLDYgKzEyMSw4IEBAIGRlZiBnZXRfcHl0aG9uX2luYyhwbGF0X3Nw
ZWNpZmljPUZhbHNlLCBwcmVmaXg9Tm9uZSk6CkBAIC01Niw2ICs1NiwzIEBAIGluZGV4IDdlYmU2
NzY4Ny4uODAzOTAyMWE4IDEwMDY0NAogICAgICAgICAgcmV0dXJuIF9wb3NpeF9saWIoc3RhbmRh
cmRfbGliLCBsaWJweXRob24sIGVhcmx5X3ByZWZpeCwgcHJlZml4KQogICAgICBlbGlmIG9zLm5h
bWUgPT0gIm50IjoKICAgICAgICAgIGlmIHN0YW5kYXJkX2xpYjoKLS0tIAotMi4zOS4yCi0KZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xz
LzAwMDEtY29uZGl0aW9uYWxseS1kby1ub3QtZmV0Y2gtY29kZS1ieS1lYXN5X2luc3RhbGwucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy8wMDAx
LWNvbmRpdGlvbmFsbHktZG8tbm90LWZldGNoLWNvZGUtYnktZWFzeV9pbnN0YWxsLnBhdGNoCmlu
ZGV4IGUyMjdjMjg4OWMuLjg2YWEyMGJlMTYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzLzAwMDEtY29uZGl0aW9uYWxseS1kby1ub3Qt
ZmV0Y2gtY29kZS1ieS1lYXN5X2luc3RhbGwucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHMvMDAwMS1jb25kaXRpb25hbGx5LWRvLW5vdC1m
ZXRjaC1jb2RlLWJ5LWVhc3lfaW5zdGFsbC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gODBm
ZTYzODE2ZWIzYmZkMWY1YjZkMzU0ZTFmMjQ0MjgwNWNmZjRlMCBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb20gM2JhNjJmODljNWQwMTdiZWQ5YWViODQwODc1ZDRjMjJhZmEyOGMyMSBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEhvbmd4dSBKaWEgPGhvbmd4dS5qaWFAd2luZHJp
dmVyLmNvbT4KIERhdGU6IFR1ZSwgMTcgSnVsIDIwMTggMTA6MTM6MzggKzA4MDAKIFN1YmplY3Q6
IFtQQVRDSF0gY29uZGl0aW9uYWxseSBkbyBub3QgZmV0Y2ggY29kZSBieSBlYXN5X2luc3RhbGwK
QEAgLTE0LDcgKzE0LDcgQEAgU2lnbmVkLW9mZi1ieTogSG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3
aW5kcml2ZXIuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKIAogZGlmZiAt
LWdpdCBhL3NldHVwdG9vbHMvY29tbWFuZC9lYXN5X2luc3RhbGwucHkgYi9zZXR1cHRvb2xzL2Nv
bW1hbmQvZWFzeV9pbnN0YWxsLnB5Ci1pbmRleCA4NThmYjIwLi42MmJkODUzIDEwMDY0NAoraW5k
ZXggZTZjZTNmYy4uN2ZkZDdkMyAxMDA2NDQKIC0tLSBhL3NldHVwdG9vbHMvY29tbWFuZC9lYXN5
X2luc3RhbGwucHkKICsrKyBiL3NldHVwdG9vbHMvY29tbWFuZC9lYXN5X2luc3RhbGwucHkKIEBA
IC02NzIsNiArNjcyLDExIEBAIGNsYXNzIGVhc3lfaW5zdGFsbChDb21tYW5kKToKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzcwLjMu
MC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzcy
LjEuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29sc183MC4zLjAuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzcyLjEuMC5iYgppbmRl
eCA3MmE4ZDdiYzNjLi45NDVkNDQzYWZmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29sc183MC4zLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHNfNzIuMS4wLmJiCkBAIC0xMSw3ICsx
MSw3IEBAIFNSQ19VUkk6YXBwZW5kOmNsYXNzLW5hdGl2ZSA9ICIgZmlsZTovLzAwMDEtY29uZGl0
aW9uYWxseS1kby1ub3QtZmV0Y2gtY29kZS1ieS1lCiBTUkNfVVJJICs9ICIgXAogICAgICAgICAg
ICAgZmlsZTovLzAwMDEtX2Rpc3R1dGlscy1zeXNjb25maWcucHktbWFrZS1pdC1wb3NzaWJsZS10
by1zdWJzdGl0ZS5wYXRjaCIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImYxNzFiYWIxZGZiYzg2
YjEzMjk5N2YyNmExMTlmNjA1NmE1Nzk1MGQwNTg1ODc4NDFhMDA4MmU4ODMwZjlkYzUiCitTUkNf
VVJJW3NoYTI1NnN1bV0gPSAiOGQyNDNlZmY1NmQwOTVlNTgxN2Y3OTZlZGU2YWUzMjk0MTI3OGY1
NDJlMGY5NDE4NjdjYzA1YWU1MmIxNjJlYyIKIAogREVQRU5EUyArPSAicHl0aG9uMyIKIAotLSAK
Mi40NC4wCgo=

--===============5628237063106314648==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-setuptools: PV changed from "70.3.0" to "72.1.0"
packages/core2-64-poky-linux/python3-setuptools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-70.3.0.tar.gz;downloadfilename=setuptools-70.3.0.tar.gz file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch" to "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-72.1.0.tar.gz;downloadfilename=setuptools-72.1.0.tar.gz file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
packages/core2-64-poky-linux/python3-setuptools: PKGV changed from 70.3.0 [default] to 72.1.0 [default]
packages/core2-64-poky-linux/python3-setuptools/python3-pkg-resources: PKGSIZE changed from 1556321 to 450475 (-71%)
packages/core2-64-poky-linux/python3-setuptools/python3-pkg-resources: PV changed from "70.3.0" to "72.1.0"
packages/core2-64-poky-linux/python3-setuptools/python3-pkg-resources: FILELIST: removed "/usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/_musllinux.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/__pycache__/api.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/specifiers.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/__init__.py /usr/lib/python3.12/site-packages/pkg_resources/extern/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/py.typed /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/__pycache__/__main__.cpython-312.pyc /usr/li
 b/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/_elffile.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/_parser.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/_parser.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/version.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/metadata.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools/recipes.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/_manylinux.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/py.typed /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/_common.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/import
 lib_resources/__pycache__/_compat.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/__pycache__/zipp.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/markers.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/readers.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools/__pycache__/recipes.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/functools/__init__.pyi /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/_tokenizer.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools/__pycache__/more.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/__init__.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/__init__.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/pk
 g_resources/_vendor/platformdirs/windows.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/_itertools.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/simple.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__init__.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/_itertools.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/utils.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/__pycache__/unix.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/__pycache__/version.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/tags.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/backports/__pycache__/tarfile.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/
 __pycache__/abc.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/_manylinux.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/_musllinux.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/functools/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/__main__.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/_compat.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/metadata.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/backports/tarfile.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/requirements.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/_tokenizer.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/android.
 py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools/recipes.pyi /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/text/__init__.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/functools/__init__.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/_adapters.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/specifiers.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/__init__.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/utils.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/context.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/__pycache__/macos.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/text/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/
 pkg_resources/_vendor/packaging/_structures.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/_common.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/requirements.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/backports/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/api.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/_legacy.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/__pycache__/context.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/_adapters.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/_legacy.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/unix.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/zipp.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/macos
 .py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/abc.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools/more.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/simple.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools/__init__.pyi /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools/py.typed /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools/more.pyi /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/functools/py.typed /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/py.typed /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/markers.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/version.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/readers.cpython-312.pyc 
 /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/__pycache__/android.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/__pycache__/windows.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/extern/__init__.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/version.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/_structures.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/_elffile.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/tags.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools/__init__.py /usr/lib/python3.12/site-packages/pkg_resources/_vendor/backports/__init__.py", added "/usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/PKG-INFO /usr/lib/python3.12/site-packages/pkg_resources/tests/__pycache__/test_find_dis
 tributions.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/tests/test_markers.py /usr/lib/python3.12/site-packages/pkg_resources/api_tests.txt /usr/lib/python3.12/site-packages/pkg_resources/tests/test_find_distributions.py /usr/lib/python3.12/site-packages/pkg_resources/tests/__pycache__/test_markers.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/tests/test_pkg_resources.py /usr/lib/python3.12/site-packages/pkg_resources/tests/__pycache__/test_working_set.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/top_level.txt /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/dependency_links.txt /usr/lib/python3.12/site-packages/pkg_resources/tests/test_integration_zope_interface.py /usr/lib/python3.12/site-packages/pkg_resources/tests/__pycache__/test_pkg_resources.cpython-312.pyc /usr/lib
 /python3.12/site-packages/pkg_resources/tests/__pycache__/test_resources.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package-source/setup.cfg /usr/lib/python3.12/site-packages/pkg_resources/tests/__init__.py /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package-source/__pycache__/setup.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/zip-safe /usr/lib/python3.12/site-packages/pkg_resources/tests/test_resources.py /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package_zipped-egg/my_test_package-1.0-py3.7.egg /usr/lib/python3.12/site-packages/pkg_resources/tests/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/tests/test_working_set.py /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package-zip/my-test-package.zip /usr/lib/python3.12/site-packages/pkg_resource
 s/py.typed /usr/lib/python3.12/site-packages/pkg_resources/tests/__pycache__/test_integration_zope_interface.cpython-312.pyc /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/SOURCES.txt /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package-source/setup.py"
packages/core2-64-poky-linux/python3-setuptools/python3-pkg-resources: PKGV changed from 70.3.0 [default] to 72.1.0 [default]
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-dbg: PV changed from "70.3.0" to "72.1.0"
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-dbg: PKGV changed from 70.3.0 [default] to 72.1.0 [default]
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-dev: PV changed from "70.3.0" to "72.1.0"
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-dev: PKGV changed from 70.3.0 [default] to 72.1.0 [default]
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-doc: PV changed from "70.3.0" to "72.1.0"
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-doc: PKGV changed from 70.3.0 [default] to 72.1.0 [default]
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-locale: PV changed from "70.3.0" to "72.1.0"
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-locale: PKGV changed from 70.3.0 [default] to 72.1.0 [default]
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-src: PV changed from "70.3.0" to "72.1.0"
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-src: PKGV changed from 70.3.0 [default] to 72.1.0 [default]
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-staticdev: PV changed from "70.3.0" to "72.1.0"
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-staticdev: PKGV changed from 70.3.0 [default] to 72.1.0 [default]
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools: PKGSIZE changed from 5161914 to 10946861 (+112%)
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools: PV changed from "70.3.0" to "72.1.0"
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools: FILELIST: directory renamed /usr/lib/python3.12/site-packages/setuptools/extern/__pycache__ -> /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set/__pycache__, directory renamed /usr/lib/python3.12/site-packages/setuptools/extern -> /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02, directory renamed /usr/lib/python3.12/site-packages/setuptools-70.3.0.dist-info -> /usr/lib/python3.12/site-packages/setuptools-72.1.0.dist-info, removed "/usr/lib/python3.12/site-packages/setuptools/_vendor/zipp.py /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata/__pycache__/_py39compat.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/__pycache__/_legacy.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/__pycache_
 _/zipp.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile.py /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/__pycache__/tarfile.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/__init__.py /usr/lib/python3.12/site-packages/setuptools/_vendor/__pycache__/ordered_set.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/__pycache__/_compat.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/_compat.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/_legacy.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata/_py39compat.py /usr/lib/python3.12/site-packages/setuptools/_vendor/__init__.py /usr/lib/python3.12/site-packages/setuptools/_vendor/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set.py", added "/usr/lib/python3.12/site-packages/setupt
 ools/tests/config/downloads/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/namespacedata01/utf-8.file /usr/lib/python3.12/site-packages/setuptools/tests/test_upload.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_dir_util.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/compat/__init__.py /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/mod_with_constant.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info/licenses/LICENSE /usr/lib/python3.12/site-packages/setuptools/tests/test_glob.py /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-10.0-amd64.exe /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/METADATA /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel-0.43.0.dist-info/METADATA /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vend
 ored/packaging/version.py /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand-2.2.2.dist-info/METADATA /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/util.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_build_ext.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-10.0.exe /usr/lib/python3.12/site-packages/setuptools/tests/config/test_expand.py /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/autocommand.py /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/top_level.txt /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata/compat/py311.py /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__pycache__/_memo.cpython-31
 2.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_bdist_dumb.py /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand-2.2.2.dist-info/RECORD /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/INSTALLER /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/version.py /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_namespaces.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/integration/__init__.py /usr/lib/python3.12/site-packages/setuptools/tests/config/__pycache__/test_pyprojecttoml_dynamic_deps.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata/compat/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/integration/__pycache__/test_pip_install_sdist.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/markers.py /usr/lib/python3.12/site-packages/setuptoo
 ls/_vendor/inflect-7.3.1.dist-info/RECORD /usr/lib/python3.12/site-packages/setuptools/tests/test_bdist_egg.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/unix_compat.py /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/text/__pycache__/layouts.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/test_core_metadata.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_filelist.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_tokenizer.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/top_level.txt /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/utils.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_build_clib.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/cli/__pycache__/pack.cpython-312.pyc 
 /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_build_py.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/cli/__pycache__/tags.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/textwrap.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/test_dist.py /usr/lib/python3.12/site-packages/setuptools/_vendor/backports.tarfile-1.2.0.dist-info/METADATA /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_extern.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_text_file.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info/INSTALLER /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/requirements.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata/compat/__pycache__/py311.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/z
 ipp/compat/__init__.py /usr/lib/python3.12/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/WHEEL /usr/lib/python3.12/site-packages/setuptools/_vendor/ruff.toml /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_install.py /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/REQUESTED /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/LICENSE /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect/compat/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__init__.py /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile/__main__.py /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/__pycache__/bdist_wheel.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/__pycache__/api.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/test_build_meta.py /usr/lib/python3.12/site-packages/s
 etuptools/_vendor/autocommand/__pycache__/autoasync.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_windows_wrappers.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/macos.py /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_checkers.py /usr/lib/python3.12/site-packages/setuptools/_vendor/packaging-24.1.dist-info/METADATA /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_versionpredicate.py /usr/lib/python3.12/site-packages/setuptools/tests/test_depends.py /usr/lib/python3.12/site-packages/setuptools/tests/test_develop.py /usr/lib/python3.12/site-packages/setuptools/tests/indexes/test_links_priority/simple/foobar/index.html /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile/compat/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/test_build_py.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist
 -info/RECORD /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/py.typed /usr/lib/python3.12/site-packages/setuptools/tests/test_bdist_wheel.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_install_data.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/LICENSE /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__pycache__/_config.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/LICENSE /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/compat/__init__.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata/compat/py39.py /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_parser.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_sandbox.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/backports.tarfi
 le-1.2.0.dist-info/top_level.txt /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_logging.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/config/setupcfg_examples.txt /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/script-with-bom.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/cli/tags.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01/subdirectory/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/namespaces.py /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_log.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_pytest_plugin.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01/__init__.py /usr/lib/python3.12/site-package
 s/setuptools/tests/test_distutils_adoption.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources-6.4.0.dist-info/LICENSE /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/api.py /usr/lib/python3.12/site-packages/setuptools/tests/test_virtualenv.py /usr/lib/python3.12/site-packages/setuptools/tests/config/test_pyprojecttoml.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources-6.4.0.dist-info/METADATA /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_find_py_modules.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_archive_util.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/test_find_packages.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_modified.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/config/__pycache__/test_pyprojecttoml.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptool
 s/_vendor/autocommand/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/packaging-24.1.dist-info/INSTALLER /usr/lib/python3.12/site-packages/setuptools/tests/test_build_clib.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/REQUESTED /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/fixtures.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__pycache__/_transformer.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/INSTALLER /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/LICENSE /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_unicode_utils.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/compat/__pycache__/py39.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__py
 cache__/test_path.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/__pycache__/automain.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/integration/helpers.py /usr/lib/python3.12/site-packages/setuptools/tests/test_unicode_utils.py /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-7.1.exe /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_distutils_adoption.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_custom.py /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/LICENSE /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_packageindex.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_editable_install.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info/METADATA /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/t
 est_version.py /usr/lib/python3.12/site-packages/setuptools/tests/test_archive_util.py /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/__main__.py /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_config_discovery.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources-6.4.0.dist-info/REQUESTED /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/__pycache__/autoparse.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/test_find_py_modules.py /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_find_packages.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/zip.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/support.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/__pycache__/__main__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_build_clib.cpyt
 hon-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_build_meta.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/integration/test_pip_install_sdist.py /usr/lib/python3.12/site-packages/setuptools/tests/contexts.py /usr/lib/python3.12/site-packages/setuptools/tests/config/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/_manylinux.py /usr/lib/python3.12/site-packages/setuptools/tests/test_build.py /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect/compat/py38.py /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/INSTALLER /usr/lib/python3.12/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/LICENSE /usr/lib/python3.12/site-packages/setuptools/_vendor/packaging-24.1.dist-info/LICENSE /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/cli/__pycache__/unpack.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_ven
 dor/typeguard/_memo.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata/diagnose.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_build_py.py /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/text/layouts.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_install_headers.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/test_dist_info.py /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/WHEEL /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/two/__init__.py /usr/lib/python3.12/site-packages/setuptools/tests/config/test_setupcfg.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/compat/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel-0.43.0.dist-info/WHEEL /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/__pycache__/macos.cpython-312.pyc /usr/lib/
 python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/METADATA /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01/subdirectory/binary.file /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_spawn.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/future/__init__.py /usr/lib/python3.12/site-packages/setuptools/tests/test_namespaces.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__init__.py /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/WHEEL /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/environment.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/specifiers.py /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/text/__pycache__/strip-prefix.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/packaging-24.1.dist-info/L
 ICENSE.BSD /usr/lib/python3.12/site-packages/setuptools/tests/compat/__init__.py /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand-2.2.2.dist-info/top_level.txt /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__/test_custom.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_versionpredicate.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand-2.2.2.dist-info/INSTALLER /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_config.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/text/to-qwerty.py /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_dist.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_glob.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/INSTALLER /usr/lib/python3.12/site-packages/setuptools/_vendor/typ
 eguard/__pycache__/_importhook.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01/subdirectory/__init__.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/METADATA /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_msvccompiler.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/fixtures.py /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_install_scripts.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_resource.py /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/RECORD /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/RECORD /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/LICENSE /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/_tokenizer.py /usr/lib/python3.12/site-
 packages/setuptools/_vendor/importlib_resources/tests/__pycache__/_path.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/METADATA /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/future/__pycache__/adapters.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-14.0.exe /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_install_data.py /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/__init__.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/compat/py38.py /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/version.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__/util.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/support.py /usr/lib/python3.12/site-packages/setuptools/_vendor/packaging-24.1.d
 ist-info/WHEEL /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__pycache__/_pytest_plugin.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_install.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_importhook.py /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/REQUESTED /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand-2.2.2.dist-info/LICENSE /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_check.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/REQUESTED /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_archive_util.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_modified.py /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp/compat/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/i
 mportlib_resources/tests/compat/py39.py /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_core_metadata.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_filelist.py /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_transformer.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_log.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_cmd.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_cygwinccompiler.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/compat/py39.py /usr/lib/python3.12/site-packages/setuptools/tests/script-with-bom.py /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/py.typed /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile/__pycache__/__main__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_mingwccompiler.py /usr/lib/python3.12/site-packages/setupto
 ols/_vendor/wheel/vendored/packaging/_elffile.py /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/cli/unpack.py /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel-0.43.0.dist-info/REQUESTED /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_msvc9compiler.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/test_install_scripts.py /usr/lib/python3.12/site-packages/setuptools/_vendor/backports.tarfile-1.2.0.dist-info/WHEEL /usr/lib/python3.12/site-packages/setuptools/tests/test_warnings.py /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__pycache__/_checkers.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/_setuptools_logging.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_core.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/test_build_ext.py /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/entry_points.
 txt /usr/lib/python3.12/site-packages/setuptools/tests/test_integration.py /usr/lib/python3.12/site-packages/setuptools/tests/test_setopt.py /usr/lib/python3.12/site-packages/setuptools/_vendor/backports.tarfile-1.2.0.dist-info/RECORD /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/__pycache__/_setuptools_logging.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect/compat/__pycache__/py38.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/test_packageindex.py /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand-2.2.2.dist-info/WHEEL /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_upload.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info/WHEEL /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/compat/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/windows.py /usr/lib/py
 thon3.12/site-packages/setuptools/_vendor/importlib_metadata/compat/__init__.py /usr/lib/python3.12/site-packages/setuptools/_vendor/backports.tarfile-1.2.0.dist-info/REQUESTED /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_build.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_virtualenv.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile/compat/py38.py /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/top_level.txt /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__pycache__/_union_transformer.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_wheel.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/INSTALLER /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/
 cli/__init__.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/namespacedata01/binary.file /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/top_level.txt /usr/lib/python3.12/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/METADATA /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_register.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__/test_resource.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_integration.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/integration/__pycache__/helpers.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/METADATA /usr/lib/python3.12/site-packages/setuptools/_vendor/packaging-24.1.dist-info/REQUESTED /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/cli/__pycache__/convert.cpython-312.pyc /usr
 /lib/python3.12/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/LICENSE /usr/lib/python3.12/site-packages/setuptools/tests/config/test_apply_pyprojecttoml.py /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_sdist.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/INSTALLER /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/compat/__pycache__/py38.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/compat/__pycache__/py39.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/tags.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/_musllinux.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/INSTALLER /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-14.0-amd64.exe /usr/lib/python3.12/si
 te-packages/setuptools/tests/__pycache__/namespaces.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_register.py /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/android.py /usr/lib/python3.12/site-packages/setuptools/tests/test_extern.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__/test_functional.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_cygwinccompiler.py /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__init__.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/_path.py /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_archive_util.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/environment.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/namespacedata01/utf-16.file /usr/lib/python3.12/site-packages/setuptools/tests
 /test_easy_install.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/compat/py39.py /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/__pycache__/unix.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp/__pycache__/glob.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info/RECORD /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/two/resource2.txt /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__/test_files.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_manylinux.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_musllinux.cpython-312.pyc /usr/lib/python3.12/site-packages/se
 tuptools/tests/test_setuptools.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_contents.py /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/WHEEL /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/RECORD /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/WHEEL /usr/lib/python3.12/site-packages/setuptools/tests/test_register.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_install_scripts.py /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-9.0.exe /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/METADATA /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/text/__pycache__/to-qwerty.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources-6.4.0.dist-info/top_level.txt /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources-6.
 4.0.dist-info/RECORD /usr/lib/python3.12/site-packages/setuptools/tests/test_manifest.py /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/__pycache__/android.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/config/downloads/preload.py /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-8.0.exe /usr/lib/python3.12/site-packages/setuptools/tests/test_sandbox.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__/test_compatibilty_files.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_file_util.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/config/__pycache__/test_setupcfg.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/autoparse.py /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_exceptions.py /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-9.0-amd64.exe /u
 sr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set/py.typed /usr/lib/python3.12/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/METADATA /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_version.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile/__init__.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_sysconfig.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_install_lib.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/test_windows_wrappers.py /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/__pycache__/errors.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_config.py /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/text.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_files.py /usr/lib/python3
 .12/site-packages/setuptools/tests/__pycache__/test_build_py.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_dist_info.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/config/downloads/__pycache__/preload.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile/compat/__init__.py /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/text/show-newlines.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_install_scripts.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_utils.py /usr/lib/python3.12/site-packages/setuptools/_vendor/typing_extensions.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_ccompiler.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_cmd.cpython-312.pyc /usr/lib/pytho
 n3.12/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/RECORD /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__pycache__/_utils.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/markers.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01/binary.file /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_extension.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect/__init__.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_config.py /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info/REQUESTED /usr/lib/python
 3.12/site-packages/setuptools/_vendor/__pycache__/typing_extensions.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/backports.tarfile-1.2.0.dist-info/INSTALLER /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/compat/__init__.py /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/specifiers.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata/compat/__pycache__/py39.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/__pycache__/functional.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/config/__pycache__/test_expand.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel-0.43.0.dist-info/RECORD /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/compat/py312.py /usr/lib/python3.12/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/INSTALLER /usr/lib/python3.12/si
 te-packages/setuptools/tests/compat/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/METADATA /usr/lib/python3.12/site-packages/setuptools/tests/integration/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/automain.py /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__pycache__/_exceptions.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/mod_with_constant.py /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/requirements.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_bdist_rpm.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/__pycache__/__main__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_bdist_dumb.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_
 distutils/tests/__pycache__/test_ccompiler.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__pycache__/_suppression.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/METADATA /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/__pycache__/autocommand.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/WHEEL /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/REQUESTED /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/unix.py /usr/lib/python3.12/site-packages/setuptools/tests/__init__.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_msvccompiler.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/functional.py /usr/lib/python3.12/site-packages/setuptools/tests/server.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_text_file.py /usr/lib/python3.12/s
 ite-packages/setuptools/_distutils/tests/__pycache__/test_unixccompiler.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel-0.43.0.dist-info/LICENSE.txt /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/_parser.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_open.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_path.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_read.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__/test_contents.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/text/__pycache__/to-dvorak.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/text/strip-prefix.py /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp/__init__.py /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/IN
 STALLER /usr/lib/python3.12/site-packages/setuptools/tests/test_egg_info.py /usr/lib/python3.12/site-packages/setuptools/tests/config/__pycache__/test_apply_pyprojecttoml.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/text/__pycache__/show-newlines.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_compatibilty_files.py /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__pycache__/_functions.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_util.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/contexts.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_functions.py /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp/compat/__pycache__/py310.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_bdist_rpm.py /usr/lib/python3.12/site-packages/setuptools/_distu
 tils/tests/__pycache__/test_clean.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__/test_read.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/vendor.txt /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp/glob.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_sysconfig.py /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/INSTALLER /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/__pycache__/version.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_build_ext.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/errors.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/top_level.txt /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_suppression.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests
 /compat/py38.py /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/LICENSE /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/utils.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_build_scripts.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/test_bdist_deprecations.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_upload.py /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/text/to-dvorak.py /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_manifest.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/RECORD /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_build_clib.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_dir_util.cpython-
 312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp/compat/py310.py /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect/compat/__init__.py /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_develop.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/text/Lorem ipsum.txt /usr/lib/python3.12/site-packages/setuptools/_vendor/packaging-24.1.dist-info/RECORD /usr/lib/python3.12/site-packages/setuptools/tests/compat/__pycache__/py39.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/future/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_bdist_egg.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__init__.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/one/__init__.py /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/WHEEL /usr/lib/py
 thon3.12/site-packages/setuptools/tests/__pycache__/test_bdist_deprecations.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/__pycache__/windows.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_build_ext.py /usr/lib/python3.12/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/RECORD /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_bdist.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_sdist.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/bdist_wheel.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_extension.py /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/autoasync.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata/__pycache__/diagnose.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/test_sdist.py /usr/lib/python3.12/site-packages
 /setuptools/tests/textwrap.py /usr/lib/python3.12/site-packages/setuptools/_vendor/backports.tarfile-1.2.0.dist-info/LICENSE /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/WHEEL /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_reader.py /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_elffile.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/one/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_core.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_dist.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_util.py /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/__init__.py /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/__main__.py /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/cl
 i/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set/__init__.py /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/LICENSE /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__/zip.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/test_config_discovery.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/two/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_decorators.py /usr/lib/python3.12/site-packages/setuptools/tests/test_editable_install.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_config_cmd.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/namespacedata01/subdirectory/binary.file /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel-0.43.0.dist-info/entry_points.txt /usr/lib/python3.12/site-packages/se
 tuptools/_distutils/tests/__pycache__/test_config_cmd.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/future/adapters.py /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/RECORD /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_setuptools.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_register.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources-6.4.0.dist-info/INSTALLER /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_mingwccompiler.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/config/test_pyprojecttoml_dynamic_deps.py /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/WHEEL /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_msvc14.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel-0.43.0.d
 ist-info/INSTALLER /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01/utf-8.file /usr/lib/python3.12/site-packages/setuptools/tests/text.py /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/__init__.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/one/resource1.txt /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/subdirectory/subsubdir/resource.txt /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile/compat/__pycache__/py38.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_bdist.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_build.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_check.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_clean.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_sdist.py /usr/lib/python3.12/site-
 packages/setuptools/_distutils/tests/test_spawn.py /usr/lib/python3.12/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/METADATA /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/tags.py /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_bdist_wheel.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_build_scripts.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_build.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/config/downloads/__init__.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/compat/__pycache__/py312.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_file_util.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/compat/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_upload.cpyt
 hon-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/WHEEL /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/server.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_functional.py /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01/utf-16.file /usr/lib/python3.12/site-packages/setuptools/tests/indexes/test_links_priority/external.html /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources-6.4.0.dist-info/WHEEL /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_union_transformer.py /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/compat/__pycache__/py38.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_setopt.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__/test_reader.cpython-312.pyc /usr/lib/python3.12/site
 -packages/setuptools/_vendor/inflect/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/test_logging.py /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/cli/pack.py /usr/lib/python3.12/site-packages/setuptools/tests/test_wheel.py /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/cli/convert.py /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/top_level.txt /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_easy_install.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_install_lib.py /usr/lib/python3.12/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/REQUESTED /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_install_headers.py /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect/py.typed /usr/lib/python3.12/site-packages/setuptools/_vendor/packaging-24.1.dist-info/LICENSE.APACHE /usr/lib/python3.12/site-packages/set
 uptools/_distutils/tests/__pycache__/unix_compat.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__pycache__/_decorators.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/WHEEL /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/top_level.txt /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/INSTALLER /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_structures.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__/test_open.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/RECORD /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_msvc9compiler.py /usr/lib/python3.12/site-packages/setuptools/
 _distutils/tests/test_unixccompiler.py /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_depends.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/_structures.py /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_egg_info.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_dist.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_warnings.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/test_msvc14.py /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/setuptools/tests/config/__init__.py /usr/lib/python3.12/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/RECORD /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-6.0.exe"
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools: PKGV changed from 70.3.0 [default] to 72.1.0 [default]
Changes to packages/core2-64-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.12/site-packages/setuptools-70.3.0.dist-info moved to /usr/lib/python3.12/site-packages/setuptools-72.1.0.dist-info
  /usr/lib/python3.12/site-packages/pkg_resources/api_tests.txt was added
  /usr/lib/python3.12/site-packages/pkg_resources/py.typed was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package-source was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package-source/__pycache__ was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package-source/__pycache__/setup.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package-source/setup.cfg was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package-source/setup.py was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/dependency_links.txt was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/PKG-INFO was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/SOURCES.txt was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/top_level.txt was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/zip-safe was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package-zip was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package-zip/my-test-package.zip was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package_zipped-egg was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package_zipped-egg/my_test_package-1.0-py3.7.egg was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/__init__.py was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/__pycache__ was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/__pycache__/test_find_distributions.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/__pycache__/test_integration_zope_interface.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/__pycache__/test_markers.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/__pycache__/test_pkg_resources.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/__pycache__/test_resources.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/__pycache__/test_working_set.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/test_find_distributions.py was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/test_integration_zope_interface.py was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/test_markers.py was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/test_pkg_resources.py was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/test_resources.py was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/test_working_set.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-10.0-amd64.exe was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-10.0.exe was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-14.0-amd64.exe was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-14.0.exe was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-6.0.exe was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-7.1.exe was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-8.0.exe was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-9.0-amd64.exe was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-9.0.exe was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/compat was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/compat/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/compat/py38.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/compat/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/compat/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/compat/__pycache__/py38.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/support.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_archive_util.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_bdist.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_bdist_dumb.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_bdist_rpm.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_build_clib.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_build.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_build_ext.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_build_py.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_build_scripts.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_ccompiler.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_check.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_clean.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_cmd.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_config_cmd.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_config.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_core.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_cygwinccompiler.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_dir_util.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_dist.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_extension.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_filelist.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_file_util.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_install.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_install_data.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_install_headers.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_install_lib.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_install_scripts.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_log.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_mingwccompiler.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_modified.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_msvc9compiler.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_msvccompiler.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_register.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_sdist.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_spawn.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_sysconfig.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_text_file.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_unixccompiler.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_upload.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_util.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_version.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/test_versionpredicate.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__pycache__/unix_compat.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/support.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_archive_util.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_bdist_dumb.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_bdist.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_bdist_rpm.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_build_clib.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_build_ext.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_build.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_build_py.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_build_scripts.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_ccompiler.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_check.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_clean.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_cmd.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_config_cmd.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_config.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_core.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_cygwinccompiler.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_dir_util.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_dist.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_extension.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_filelist.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_file_util.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_install_data.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_install_headers.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_install_lib.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_install.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_install_scripts.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_log.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_mingwccompiler.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_modified.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_msvc9compiler.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_msvccompiler.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_register.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_sdist.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_spawn.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_sysconfig.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_text_file.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_unixccompiler.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_upload.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_util.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_versionpredicate.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_version.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/unix_compat.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests was added
  /usr/lib/python3.12/site-packages/setuptools/tests/compat was added
  /usr/lib/python3.12/site-packages/setuptools/tests/compat/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/compat/py39.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/compat/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/tests/compat/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/compat/__pycache__/py39.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/downloads was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/downloads/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/downloads/preload.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/downloads/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/downloads/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/downloads/__pycache__/preload.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/__pycache__/test_apply_pyprojecttoml.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/__pycache__/test_expand.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/__pycache__/test_pyprojecttoml.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/__pycache__/test_pyprojecttoml_dynamic_deps.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/__pycache__/test_setupcfg.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/setupcfg_examples.txt was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/test_apply_pyprojecttoml.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/test_expand.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/test_pyprojecttoml_dynamic_deps.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/test_pyprojecttoml.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/test_setupcfg.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/contexts.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/environment.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/fixtures.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/indexes was added
  /usr/lib/python3.12/site-packages/setuptools/tests/indexes/test_links_priority was added
  /usr/lib/python3.12/site-packages/setuptools/tests/indexes/test_links_priority/external.html was added
  /usr/lib/python3.12/site-packages/setuptools/tests/indexes/test_links_priority/simple was added
  /usr/lib/python3.12/site-packages/setuptools/tests/indexes/test_links_priority/simple/foobar was added
  /usr/lib/python3.12/site-packages/setuptools/tests/indexes/test_links_priority/simple/foobar/index.html was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/integration was added
  /usr/lib/python3.12/site-packages/setuptools/tests/integration/helpers.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/integration/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/integration/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/tests/integration/__pycache__/helpers.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/integration/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/integration/__pycache__/test_pip_install_sdist.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/integration/test_pip_install_sdist.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/mod_with_constant.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/namespaces.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/contexts.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/environment.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/fixtures.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/mod_with_constant.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/namespaces.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/script-with-bom.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/server.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_archive_util.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_bdist_deprecations.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_bdist_egg.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_bdist_wheel.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_build_clib.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_build.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_build_ext.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_build_meta.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_build_py.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_config_discovery.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_core_metadata.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_depends.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_develop.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_dist.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_dist_info.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_distutils_adoption.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_easy_install.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_editable_install.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_egg_info.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_extern.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_find_packages.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_find_py_modules.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_glob.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_install_scripts.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_integration.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_logging.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_manifest.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_msvc14.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_namespaces.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_packageindex.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_register.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_sandbox.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_sdist.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_setopt.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_setuptools.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_unicode_utils.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_upload.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_virtualenv.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_warnings.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_wheel.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/test_windows_wrappers.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/text.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__pycache__/textwrap.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/tests/script-with-bom.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/server.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_archive_util.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_bdist_deprecations.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_bdist_egg.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_bdist_wheel.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_build_clib.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_build_ext.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_build_meta.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_build.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_build_py.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_config_discovery.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_core_metadata.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_depends.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_develop.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_dist_info.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_dist.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_distutils_adoption.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_easy_install.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_editable_install.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_egg_info.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_extern.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_find_packages.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_find_py_modules.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_glob.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_install_scripts.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_integration.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_logging.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_manifest.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_msvc14.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_namespaces.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_packageindex.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_register.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_sandbox.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_sdist.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_setopt.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_setuptools.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_unicode_utils.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_upload.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_virtualenv.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_warnings.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_wheel.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_windows_wrappers.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/text.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/textwrap.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand-2.2.2.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand-2.2.2.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand-2.2.2.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand-2.2.2.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand-2.2.2.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand-2.2.2.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand-2.2.2.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/autoasync.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/autocommand.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/automain.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/autoparse.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/errors.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/__pycache__/autoasync.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/__pycache__/autocommand.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/__pycache__/automain.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/__pycache__/autoparse.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/__pycache__/errors.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports.tarfile-1.2.0.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports.tarfile-1.2.0.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports.tarfile-1.2.0.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports.tarfile-1.2.0.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports.tarfile-1.2.0.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports.tarfile-1.2.0.dist-info/REQUESTED was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports.tarfile-1.2.0.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports.tarfile-1.2.0.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile/compat was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile/compat/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile/compat/py38.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile/compat/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile/compat/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile/compat/__pycache__/py38.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile/__main__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile/__pycache__/__main__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/REQUESTED was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata/compat was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata/compat/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata/compat/py311.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata/compat/py39.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata/compat/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata/compat/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata/compat/__pycache__/py311.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata/compat/__pycache__/py39.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata/diagnose.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata/__pycache__/diagnose.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources-6.4.0.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources-6.4.0.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources-6.4.0.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources-6.4.0.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources-6.4.0.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources-6.4.0.dist-info/REQUESTED was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources-6.4.0.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources-6.4.0.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/compat was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/compat/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/compat/py38.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/compat/py39.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/compat/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/compat/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/compat/__pycache__/py38.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/compat/__pycache__/py39.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/functional.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/future was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/future/adapters.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/future/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/future/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/future/__pycache__/adapters.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/future/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/__pycache__/functional.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/compat was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/compat/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/compat/py312.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/compat/py39.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/compat/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/compat/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/compat/__pycache__/py312.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/compat/__pycache__/py39.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01 was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01/binary.file was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01/subdirectory was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01/subdirectory/binary.file was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01/subdirectory/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01/subdirectory/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01/subdirectory/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01/utf-16.file was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01/utf-8.file was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02 was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/one was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/one/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/one/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/one/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/one/resource1.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/subdirectory was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/subdirectory/subsubdir was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/subdirectory/subsubdir/resource.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/two was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/two/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/two/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/two/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/two/resource2.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/namespacedata01 was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/namespacedata01/binary.file was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/namespacedata01/subdirectory was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/namespacedata01/subdirectory/binary.file was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/namespacedata01/utf-16.file was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/namespacedata01/utf-8.file was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/_path.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__/_path.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__/test_compatibilty_files.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__/test_contents.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__/test_custom.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__/test_files.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__/test_functional.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__/test_open.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__/test_path.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__/test_read.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__/test_reader.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__/test_resource.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__/util.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__pycache__/zip.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_compatibilty_files.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_contents.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_custom.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_files.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_functional.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_open.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_path.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_reader.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_read.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_resource.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/util.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/zip.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect/compat was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect/compat/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect/compat/py38.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect/compat/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect/compat/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect/compat/__pycache__/py38.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect/py.typed was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/REQUESTED was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/text/layouts.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/text/Lorem ipsum.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/text/__pycache__/layouts.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/text/__pycache__/show-newlines.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/text/__pycache__/strip-prefix.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/text/__pycache__/to-dvorak.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/text/__pycache__/to-qwerty.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/text/show-newlines.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/text/strip-prefix.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/text/to-dvorak.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/text/to-qwerty.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/REQUESTED was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/REQUESTED was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set/py.typed was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/packaging-24.1.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/packaging-24.1.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/packaging-24.1.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/packaging-24.1.dist-info/LICENSE.APACHE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/packaging-24.1.dist-info/LICENSE.BSD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/packaging-24.1.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/packaging-24.1.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/packaging-24.1.dist-info/REQUESTED was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/packaging-24.1.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info/licenses was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info/licenses/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info/REQUESTED was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/android.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/api.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/macos.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/__main__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/__pycache__/android.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/__pycache__/api.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/__pycache__/macos.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/__pycache__/__main__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/__pycache__/unix.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/__pycache__/version.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/__pycache__/windows.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/py.typed was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/unix.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/version.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/windows.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/__pycache__/typing_extensions.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ruff.toml was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/REQUESTED was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/entry_points.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_checkers.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_config.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_decorators.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_exceptions.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_functions.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_importhook.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_memo.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__pycache__/_checkers.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__pycache__/_config.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__pycache__/_decorators.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__pycache__/_exceptions.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__pycache__/_functions.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__pycache__/_importhook.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__pycache__/_memo.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__pycache__/_pytest_plugin.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__pycache__/_suppression.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__pycache__/_transformer.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__pycache__/_union_transformer.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__pycache__/_utils.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_pytest_plugin.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/py.typed was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_suppression.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_transformer.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_union_transformer.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_utils.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typing_extensions.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel-0.43.0.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel-0.43.0.dist-info/entry_points.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel-0.43.0.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel-0.43.0.dist-info/LICENSE.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel-0.43.0.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel-0.43.0.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel-0.43.0.dist-info/REQUESTED was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel-0.43.0.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/bdist_wheel.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/cli was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/cli/convert.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/cli/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/cli/pack.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/cli/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/cli/__pycache__/convert.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/cli/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/cli/__pycache__/pack.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/cli/__pycache__/tags.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/cli/__pycache__/unpack.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/cli/tags.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/cli/unpack.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/__main__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/__pycache__/bdist_wheel.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/__pycache__/__main__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/__pycache__/_setuptools_logging.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/_setuptools_logging.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/_elffile.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/_manylinux.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/markers.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/_musllinux.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/_parser.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_elffile.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_manylinux.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/markers.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_musllinux.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_parser.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/requirements.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/specifiers.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_structures.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/tags.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_tokenizer.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/utils.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/version.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/requirements.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/specifiers.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/_structures.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/tags.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/_tokenizer.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/utils.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/version.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/vendor.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/REQUESTED was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp/compat was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp/compat/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp/compat/py310.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp/compat/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp/compat/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp/compat/__pycache__/py310.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp/glob.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp/__pycache__ was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp/__pycache__/glob.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/pkg_resources/extern was removed
  /usr/lib/python3.12/site-packages/pkg_resources/extern/__init__.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/extern/__pycache__ was removed
  /usr/lib/python3.12/site-packages/pkg_resources/extern/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/backports was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/backports/__init__.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/backports/__pycache__ was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/backports/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/backports/__pycache__/tarfile.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/backports/tarfile.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/abc.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/_adapters.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/_common.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/_compat.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/__init__.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/_itertools.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/_legacy.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__ was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/abc.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/_adapters.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/_common.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/_compat.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/_itertools.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/_legacy.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/readers.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/__pycache__/simple.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/py.typed was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/readers.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/simple.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/__init__.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/context.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/functools was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/functools/__init__.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/functools/__init__.pyi was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/functools/__pycache__ was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/functools/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/functools/py.typed was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/__init__.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/__pycache__ was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/__pycache__/context.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/text was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/text/__init__.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/text/__pycache__ was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/text/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools/__init__.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools/__init__.pyi was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools/more.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools/more.pyi was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools/__pycache__ was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools/__pycache__/more.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools/__pycache__/recipes.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools/py.typed was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools/recipes.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools/recipes.pyi was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/_elffile.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__init__.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/_manylinux.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/markers.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/metadata.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/_musllinux.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/_parser.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__ was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/_elffile.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/_manylinux.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/markers.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/metadata.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/_musllinux.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/_parser.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/requirements.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/specifiers.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/_structures.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/tags.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/_tokenizer.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/utils.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__pycache__/version.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/py.typed was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/requirements.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/specifiers.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/_structures.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/tags.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/_tokenizer.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/utils.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/version.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/android.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/api.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/__init__.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/macos.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/__main__.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/__pycache__ was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/__pycache__/android.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/__pycache__/api.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/__pycache__/macos.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/__pycache__/__main__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/__pycache__/unix.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/__pycache__/version.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/__pycache__/windows.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/py.typed was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/unix.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/version.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/windows.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/__pycache__ was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/__pycache__/zipp.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/zipp.py was removed
  /usr/lib/python3.12/site-packages/setuptools/extern was removed
  /usr/lib/python3.12/site-packages/setuptools/extern/__init__.py was removed
  /usr/lib/python3.12/site-packages/setuptools/extern/__pycache__ was removed
  /usr/lib/python3.12/site-packages/setuptools/extern/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/__pycache__/tarfile.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata/_py39compat.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata/__pycache__/_py39compat.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/_compat.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/_legacy.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/__pycache__/_compat.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/__pycache__/_legacy.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/__init__.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/__init__.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/__pycache__/ordered_set.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/__pycache__/zipp.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp.py was removed
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.12/site-packages/setuptools-70.3.0.dist-info moved to /usr/lib/python3.12/site-packages/setuptools-72.1.0.dist-info
  /usr/lib/python3.12/site-packages/pkg_resources/api_tests.txt was added
  /usr/lib/python3.12/site-packages/pkg_resources/py.typed was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package-source was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package-source/setup.cfg was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package-source/setup.py was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/dependency_links.txt was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/PKG-INFO was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/SOURCES.txt was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/top_level.txt was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package_unpacked-egg/my_test_package-1.0-py3.7.egg/EGG-INFO/zip-safe was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package-zip was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package-zip/my-test-package.zip was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package_zipped-egg was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/data/my-test-package_zipped-egg/my_test_package-1.0-py3.7.egg was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/__init__.py was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/test_find_distributions.py was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/test_integration_zope_interface.py was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/test_markers.py was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/test_pkg_resources.py was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/test_resources.py was added
  /usr/lib/python3.12/site-packages/pkg_resources/tests/test_working_set.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-10.0-amd64.exe was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-10.0.exe was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-14.0-amd64.exe was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-14.0.exe was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-6.0.exe was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-7.1.exe was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-8.0.exe was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-9.0-amd64.exe was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/command/wininst-9.0.exe was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/compat was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/compat/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/compat/py38.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/support.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_archive_util.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_bdist_dumb.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_bdist.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_bdist_rpm.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_build_clib.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_build_ext.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_build.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_build_py.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_build_scripts.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_ccompiler.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_check.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_clean.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_cmd.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_config_cmd.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_config.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_core.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_cygwinccompiler.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_dir_util.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_dist.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_extension.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_filelist.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_file_util.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_install_data.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_install_headers.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_install_lib.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_install.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_install_scripts.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_log.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_mingwccompiler.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_modified.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_msvc9compiler.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_msvccompiler.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_register.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_sdist.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_spawn.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_sysconfig.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_text_file.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_unixccompiler.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_upload.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_util.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_versionpredicate.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/test_version.py was added
  /usr/lib/python3.12/site-packages/setuptools/_distutils/tests/unix_compat.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests was added
  /usr/lib/python3.12/site-packages/setuptools/tests/compat was added
  /usr/lib/python3.12/site-packages/setuptools/tests/compat/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/compat/py39.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/downloads was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/downloads/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/downloads/preload.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/setupcfg_examples.txt was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/test_apply_pyprojecttoml.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/test_expand.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/test_pyprojecttoml_dynamic_deps.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/test_pyprojecttoml.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/config/test_setupcfg.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/contexts.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/environment.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/fixtures.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/indexes was added
  /usr/lib/python3.12/site-packages/setuptools/tests/indexes/test_links_priority was added
  /usr/lib/python3.12/site-packages/setuptools/tests/indexes/test_links_priority/external.html was added
  /usr/lib/python3.12/site-packages/setuptools/tests/indexes/test_links_priority/simple was added
  /usr/lib/python3.12/site-packages/setuptools/tests/indexes/test_links_priority/simple/foobar was added
  /usr/lib/python3.12/site-packages/setuptools/tests/indexes/test_links_priority/simple/foobar/index.html was added
  /usr/lib/python3.12/site-packages/setuptools/tests/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/integration was added
  /usr/lib/python3.12/site-packages/setuptools/tests/integration/helpers.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/integration/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/integration/test_pip_install_sdist.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/mod_with_constant.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/namespaces.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/script-with-bom.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/server.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_archive_util.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_bdist_deprecations.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_bdist_egg.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_bdist_wheel.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_build_clib.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_build_ext.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_build_meta.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_build.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_build_py.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_config_discovery.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_core_metadata.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_depends.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_develop.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_dist_info.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_dist.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_distutils_adoption.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_easy_install.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_editable_install.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_egg_info.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_extern.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_find_packages.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_find_py_modules.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_glob.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_install_scripts.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_integration.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_logging.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_manifest.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_msvc14.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_namespaces.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_packageindex.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_register.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_sandbox.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_sdist.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_setopt.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_setuptools.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_unicode_utils.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_upload.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_virtualenv.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_warnings.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_wheel.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/test_windows_wrappers.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/text.py was added
  /usr/lib/python3.12/site-packages/setuptools/tests/textwrap.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand-2.2.2.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand-2.2.2.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand-2.2.2.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand-2.2.2.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand-2.2.2.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand-2.2.2.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand-2.2.2.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/autoasync.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/autocommand.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/automain.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/autoparse.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/errors.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/autocommand/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports.tarfile-1.2.0.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports.tarfile-1.2.0.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports.tarfile-1.2.0.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports.tarfile-1.2.0.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports.tarfile-1.2.0.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports.tarfile-1.2.0.dist-info/REQUESTED was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports.tarfile-1.2.0.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports.tarfile-1.2.0.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile/compat was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile/compat/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile/compat/py38.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile/__main__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/REQUESTED was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata/compat was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata/compat/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata/compat/py311.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata/compat/py39.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata/diagnose.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources-6.4.0.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources-6.4.0.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources-6.4.0.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources-6.4.0.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources-6.4.0.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources-6.4.0.dist-info/REQUESTED was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources-6.4.0.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources-6.4.0.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/compat was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/compat/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/compat/py38.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/compat/py39.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/functional.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/future was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/future/adapters.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/future/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/compat was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/compat/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/compat/py312.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/compat/py39.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01 was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01/binary.file was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01/subdirectory was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01/subdirectory/binary.file was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01/subdirectory/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01/utf-16.file was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data01/utf-8.file was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02 was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/one was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/one/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/one/resource1.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/subdirectory was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/subdirectory/subsubdir was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/subdirectory/subsubdir/resource.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/two was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/two/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/data02/two/resource2.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/namespacedata01 was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/namespacedata01/binary.file was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/namespacedata01/subdirectory was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/namespacedata01/subdirectory/binary.file was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/namespacedata01/utf-16.file was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/namespacedata01/utf-8.file was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/_path.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_compatibilty_files.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_contents.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_custom.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_files.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_functional.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_open.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_path.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_reader.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_read.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/test_resource.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/util.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/tests/zip.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect/compat was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect/compat/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect/compat/py38.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/inflect/py.typed was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/REQUESTED was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/text/layouts.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/text/Lorem ipsum.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/text/show-newlines.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/text/strip-prefix.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/text/to-dvorak.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/text/to-qwerty.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/REQUESTED was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/REQUESTED was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set-4.1.0.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set/py.typed was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/packaging-24.1.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/packaging-24.1.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/packaging-24.1.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/packaging-24.1.dist-info/LICENSE.APACHE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/packaging-24.1.dist-info/LICENSE.BSD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/packaging-24.1.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/packaging-24.1.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/packaging-24.1.dist-info/REQUESTED was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/packaging-24.1.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info/licenses was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info/licenses/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info/REQUESTED was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/android.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/api.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/macos.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/__main__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/py.typed was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/unix.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/version.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/platformdirs/windows.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ruff.toml was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/REQUESTED was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/entry_points.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_checkers.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_config.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_decorators.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_exceptions.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_functions.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_importhook.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_memo.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_pytest_plugin.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/py.typed was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_suppression.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_transformer.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_union_transformer.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typeguard/_utils.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/typing_extensions.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel-0.43.0.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel-0.43.0.dist-info/entry_points.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel-0.43.0.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel-0.43.0.dist-info/LICENSE.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel-0.43.0.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel-0.43.0.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel-0.43.0.dist-info/REQUESTED was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel-0.43.0.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/bdist_wheel.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/cli was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/cli/convert.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/cli/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/cli/pack.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/cli/tags.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/cli/unpack.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/__main__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/_setuptools_logging.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/_elffile.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/_manylinux.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/markers.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/_musllinux.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/_parser.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/requirements.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/specifiers.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/_structures.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/tags.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/_tokenizer.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/utils.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/packaging/version.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/wheel/vendored/vendor.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/INSTALLER was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/REQUESTED was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp/compat was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp/compat/__init__.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp/compat/py310.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp/glob.py was added
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp/__init__.py was added
  /usr/lib/python3.12/site-packages/pkg_resources/extern was removed
  /usr/lib/python3.12/site-packages/pkg_resources/extern/__init__.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/backports was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/backports/__init__.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/backports/tarfile.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/abc.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/_adapters.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/_common.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/_compat.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/__init__.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/_itertools.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/_legacy.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/py.typed was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/readers.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/importlib_resources/simple.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/__init__.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/context.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/functools was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/functools/__init__.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/functools/__init__.pyi was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/functools/py.typed was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/__init__.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/text was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/jaraco/text/__init__.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools/__init__.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools/__init__.pyi was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools/more.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools/more.pyi was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools/py.typed was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools/recipes.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/more_itertools/recipes.pyi was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/_elffile.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/__init__.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/_manylinux.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/markers.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/metadata.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/_musllinux.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/_parser.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/py.typed was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/requirements.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/specifiers.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/_structures.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/tags.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/_tokenizer.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/utils.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/packaging/version.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/android.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/api.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/__init__.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/macos.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/__main__.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/py.typed was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/unix.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/version.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/platformdirs/windows.py was removed
  /usr/lib/python3.12/site-packages/pkg_resources/_vendor/zipp.py was removed
  /usr/lib/python3.12/site-packages/setuptools/extern was removed
  /usr/lib/python3.12/site-packages/setuptools/extern/__init__.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/backports/tarfile.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_metadata/_py39compat.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/_compat.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/importlib_resources/_legacy.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/__init__.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/jaraco/__init__.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/ordered_set.py was removed
  /usr/lib/python3.12/site-packages/setuptools/_vendor/zipp.py was removed

--===============5628237063106314648==--

