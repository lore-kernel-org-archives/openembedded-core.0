Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.4570.1621074783849875776
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 May 2021 03:33:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 393F338C139B
	for <openembedded-core@lists.openembedded.org>; Sat, 15 May 2021 10:33:03 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-jinja2: upgrading to 3.0.0 SUCCEEDED
Message-ID: <MADEUP.167F36ED6117C5A5.11165@lists.openembedded.org>
X-Groupsio-MsgNum: 151799
Content-Type: multipart/mixed; boundary="===============6717178129629448979=="

--===============6717178129629448979==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-jinja2* to *3.0.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-jinja2-upgrade-2.11.3-3.0.0.patch
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

--===============6717178129629448979==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-dev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/Jinja2-2.11.3-py3.9.egg-info -> /usr/lib/python3.9/site-packages/Jinja2-3.0.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/jinja2/_compat.py /usr/lib/python3.9/site-packages/jinja2/asyncsupport.py /usr/lib/python3.9/site-packages/jinja2/__pycache__/asyncsupport.cpython-39.pyc /usr/lib/python3.9/site-packages/jinja2/__pycache__/asyncfilters.cpython-39.pyc /usr/lib/python3.9/site-packages/jinja2/__pycache__/_compat.cpython-39.pyc /usr/lib/python3.9/site-packages/jinja2/asyncfilters.py", added "/usr/lib/python3.9/site-packages/jinja2/py.typed /usr/lib/python3.9/site-packages/jinja2/__pycache__/async_utils.cpython-39.pyc /usr/lib/python3.9/site-packages/jinja2/async_utils.py"
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-doc: FILELIST: directory renamed /usr/lib/python3.9/site-packages/Jinja2-2.11.3-py3.9.egg-info -> /usr/lib/python3.9/site-packages/Jinja2-3.0.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/jinja2/_compat.py /usr/lib/python3.9/site-packages/jinja2/asyncsupport.py /usr/lib/python3.9/site-packages/jinja2/__pycache__/asyncsupport.cpython-39.pyc /usr/lib/python3.9/site-packages/jinja2/__pycache__/asyncfilters.cpython-39.pyc /usr/lib/python3.9/site-packages/jinja2/__pycache__/_compat.cpython-39.pyc /usr/lib/python3.9/site-packages/jinja2/asyncfilters.py", added "/usr/lib/python3.9/site-packages/jinja2/py.typed /usr/lib/python3.9/site-packages/jinja2/__pycache__/async_utils.cpython-39.pyc /usr/lib/python3.9/site-packages/jinja2/async_utils.py"
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-locale: FILELIST: directory renamed /usr/lib/python3.9/site-packages/Jinja2-2.11.3-py3.9.egg-info -> /usr/lib/python3.9/site-packages/Jinja2-3.0.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/jinja2/_compat.py /usr/lib/python3.9/site-packages/jinja2/asyncsupport.py /usr/lib/python3.9/site-packages/jinja2/__pycache__/asyncsupport.cpython-39.pyc /usr/lib/python3.9/site-packages/jinja2/__pycache__/asyncfilters.cpython-39.pyc /usr/lib/python3.9/site-packages/jinja2/__pycache__/_compat.cpython-39.pyc /usr/lib/python3.9/site-packages/jinja2/asyncfilters.py", added "/usr/lib/python3.9/site-packages/jinja2/py.typed /usr/lib/python3.9/site-packages/jinja2/__pycache__/async_utils.cpython-39.pyc /usr/lib/python3.9/site-packages/jinja2/async_utils.py"
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-ptest: FILELIST: directory renamed /usr/lib/python3.9/site-packages/Jinja2-2.11.3-py3.9.egg-info -> /usr/lib/python3.9/site-packages/Jinja2-3.0.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/jinja2/_compat.py /usr/lib/python3.9/site-packages/jinja2/asyncsupport.py /usr/lib/python3.9/site-packages/jinja2/__pycache__/asyncsupport.cpython-39.pyc /usr/lib/python3.9/site-packages/jinja2/__pycache__/asyncfilters.cpython-39.pyc /usr/lib/python3.9/site-packages/jinja2/__pycache__/_compat.cpython-39.pyc /usr/lib/python3.9/site-packages/jinja2/asyncfilters.py", added "/usr/lib/python3.9/site-packages/jinja2/py.typed /usr/lib/python3.9/site-packages/jinja2/__pycache__/async_utils.cpython-39.pyc /usr/lib/python3.9/site-packages/jinja2/async_utils.py"
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-staticdev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/Jinja2-2.11.3-py3.9.egg-info -> /usr/lib/python3.9/site-packages/Jinja2-3.0.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/jinja2/_compat.py /usr/lib/python3.9/site-packages/jinja2/asyncsupport.py /usr/lib/python3.9/site-packages/jinja2/__pycache__/asyncsupport.cpython-39.pyc /usr/lib/python3.9/site-packages/jinja2/__pycache__/asyncfilters.cpython-39.pyc /usr/lib/python3.9/site-packages/jinja2/__pycache__/_compat.cpython-39.pyc /usr/lib/python3.9/site-packages/jinja2/asyncfilters.py", added "/usr/lib/python3.9/site-packages/jinja2/py.typed /usr/lib/python3.9/site-packages/jinja2/__pycache__/async_utils.cpython-39.pyc /usr/lib/python3.9/site-packages/jinja2/async_utils.py"
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2: FILELIST: directory renamed /usr/lib/python3.9/site-packages/Jinja2-2.11.3-py3.9.egg-info -> /usr/lib/python3.9/site-packages/Jinja2-3.0.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/jinja2/_compat.py /usr/lib/python3.9/site-packages/jinja2/asyncsupport.py /usr/lib/python3.9/site-packages/jinja2/__pycache__/asyncsupport.cpython-39.pyc /usr/lib/python3.9/site-packages/jinja2/__pycache__/asyncfilters.cpython-39.pyc /usr/lib/python3.9/site-packages/jinja2/__pycache__/_compat.cpython-39.pyc /usr/lib/python3.9/site-packages/jinja2/asyncfilters.py", added "/usr/lib/python3.9/site-packages/jinja2/py.typed /usr/lib/python3.9/site-packages/jinja2/__pycache__/async_utils.cpython-39.pyc /usr/lib/python3.9/site-packages/jinja2/async_utils.py"
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2: PKGSIZE changed from 836159 to 921143 (+10%)
Changes to packages/core2-32-poky-linux/python3-jinja2 (sysroot):
  /usr/lib/python3.9/site-packages/Jinja2-3.0.0-py3.9.egg-info was added
  /usr/lib/python3.9/site-packages/Jinja2-3.0.0-py3.9.egg-info/dependency_links.txt was added
  /usr/lib/python3.9/site-packages/Jinja2-3.0.0-py3.9.egg-info/entry_points.txt was added
  /usr/lib/python3.9/site-packages/Jinja2-3.0.0-py3.9.egg-info/PKG-INFO was added
  /usr/lib/python3.9/site-packages/Jinja2-3.0.0-py3.9.egg-info/requires.txt was added
  /usr/lib/python3.9/site-packages/Jinja2-3.0.0-py3.9.egg-info/SOURCES.txt was added
  /usr/lib/python3.9/site-packages/Jinja2-3.0.0-py3.9.egg-info/top_level.txt was added
  /usr/lib/python3.9/site-packages/jinja2/async_utils.py was added
  /usr/lib/python3.9/site-packages/jinja2/__pycache__/async_utils.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/jinja2/py.typed was added
  /usr/lib/python3.9/site-packages/Jinja2-2.11.3-py3.9.egg-info was removed
  /usr/lib/python3.9/site-packages/Jinja2-2.11.3-py3.9.egg-info/dependency_links.txt was removed
  /usr/lib/python3.9/site-packages/Jinja2-2.11.3-py3.9.egg-info/entry_points.txt was removed
  /usr/lib/python3.9/site-packages/Jinja2-2.11.3-py3.9.egg-info/PKG-INFO was removed
  /usr/lib/python3.9/site-packages/Jinja2-2.11.3-py3.9.egg-info/requires.txt was removed
  /usr/lib/python3.9/site-packages/Jinja2-2.11.3-py3.9.egg-info/SOURCES.txt was removed
  /usr/lib/python3.9/site-packages/Jinja2-2.11.3-py3.9.egg-info/top_level.txt was removed
  /usr/lib/python3.9/site-packages/jinja2/asyncfilters.py was removed
  /usr/lib/python3.9/site-packages/jinja2/asyncsupport.py was removed
  /usr/lib/python3.9/site-packages/jinja2/_compat.py was removed
  /usr/lib/python3.9/site-packages/jinja2/__pycache__/asyncfilters.cpython-39.pyc was removed
  /usr/lib/python3.9/site-packages/jinja2/__pycache__/asyncsupport.cpython-39.pyc was removed
  /usr/lib/python3.9/site-packages/jinja2/__pycache__/_compat.cpython-39.pyc was removed

--===============6717178129629448979==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-jinja2-upgrade-2.11.3-3.0.0.patch"

From c078e0cd6f9ddb9978867369e7dc2c78949b8e62 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 15 May 2021 05:05:58 +0000
Subject: [PATCH] python3-jinja2: upgrade 2.11.3 -> 3.0.0

---
 .../{python3-jinja2_2.11.3.bb => python3-jinja2_3.0.0.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jinja2_2.11.3.bb => python3-jinja2_3.0.0.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-jinja2_2.11.3.bb b/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-jinja2_2.11.3.bb
rename to meta/recipes-devtools/python/python3-jinja2_3.0.0.bb
index 11a4d5432c..5ae8d49b53 100644
--- a/meta/recipes-devtools/python/python3-jinja2_2.11.3.bb
+++ b/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/Jinja/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
 
-SRC_URI[sha256sum] = "a6d58433de0ae800347cab1fa3043cebbabe8baa9d29e668f1c768cb87a333c6"
+SRC_URI[sha256sum] = "ea8d7dd814ce9df6de6a761ec7f1cac98afe305b8cdc4aaae4e114b8d8ce24c5"
 
 PYPI_PACKAGE = "Jinja2"
 
-- 
2.27.0


--===============6717178129629448979==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1461 entries from dependency cache.
Parsing recipes...done.
Parsing of 825 .bb files complete (824 cached, 1 parsed). 1459 targets, 31 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-c49178116bd6f5a24c83b01fd82d2403607e52ae"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c49178116bd6f5a24c83b01fd82d2403607e52ae"
workspace            = "master:ed2e3b739a7e0e8daad665fed01342d60674d6b7"

Initialising tasks...done.
Sstate summary: Wanted 27 Local 12 Network 0 Missed 15 Current 770 (44% match, 98% complete)
Removing 4 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 782 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_3.10.1.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-importlib-metadata-3.10.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-importlib-metadata-3.10.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 795 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_3.10.1.bb:do_packagedata_setscene)
NOTE: recipe python3-importlib-metadata-3.10.1-r0: task do_packagedata_setscene: Started
ERROR: python3-importlib-metadata-3.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:4.0.1-r0 to 0:3.10.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:4.0.1-r0 to 0:3.10.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:4.0.1-r0 to 0:3.10.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:4.0.1-r0 to 0:3.10.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:4.0.1-r0 to 0:3.10.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:4.0.1-r0 to 0:3.10.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:4.0.1-r0 to 0:3.10.1-r0) [version-going-backwards]
NOTE: recipe python3-importlib-metadata-3.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1139 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1469 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_fetch)
NOTE: Running task 1494 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_fetch)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_fetch: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1842 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_unpack)
NOTE: Running task 1843 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1844 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_unpack)
NOTE: Running task 1845 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_unpack: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 2290 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_patch)
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 2316 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_patch)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_patch: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_patch: Succeeded
NOTE: Running task 2408 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2409 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_populate_lic)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_patch: Succeeded
NOTE: Running task 2410 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jinja2-3.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2411 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2412 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_populate_lic unihash changed to d57253bd4cd48623183921dc5d32ab3d208c35980524dae86d3429b660891723
NOTE: recipe python3-jinja2-3.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2413 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_configure)
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2414 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_configure)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_configure: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_configure: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2415 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_configure_ptest_base)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to fdc085f12a4d811512eea39b42cb39da3075c7dd059d1ed45cec0a329ddedd03
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_configure: Succeeded
NOTE: Running task 2457 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_configure_ptest_base)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2458 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2459 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2460 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_compile: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_compile: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Running task 2461 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_compile_ptest_base)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 5cb53070dbb10dcbca6c781f2d0d18a10bbd606585db2df219cbfd8496662dbf
NOTE: Setscene tasks completed
NOTE: Running task 2488 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_compile_ptest_base: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2491 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_install)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_install: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_compile: Succeeded
NOTE: Running task 2492 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_compile_ptest_base)
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2493 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_install: Succeeded
NOTE: Running task 2494 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_install_ptest_base)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_install: Succeeded
NOTE: Running task 2495 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_install_ptest_base)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2496 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_package)
NOTE: Running task 2497 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_populate_sysroot)
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2498 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_package)
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-jinja2-3.0.0-r0: task do_package: Succeeded
NOTE: Running task 2499 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_packagedata)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_package: Succeeded
NOTE: Running task 2500 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_packagedata)
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_packagedata: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2501 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_package_write_rpm)
NOTE: Running task 2502 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_package_write_rpm)
NOTE: Running task 2503 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_package_qa)
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_package_qa: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jinja2-3.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2504 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2504 tasks of which 2467 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============6717178129629448979==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 825 .bb files complete (0 cached, 825 parsed). 1459 targets, 66 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-c49178116bd6f5a24c83b01fd82d2403607e52ae"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c49178116bd6f5a24c83b01fd82d2403607e52ae"
workspace            = "master:ed2e3b739a7e0e8daad665fed01342d60674d6b7"

Initialising tasks...done.
Sstate summary: Wanted 27 Local 12 Network 0 Missed 15 Current 770 (44% match, 98% complete)
Removing 4 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 782 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_3.10.1.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-importlib-metadata-3.10.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-importlib-metadata-3.10.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 795 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_3.10.1.bb:do_packagedata_setscene)
NOTE: recipe python3-importlib-metadata-3.10.1-r0: task do_packagedata_setscene: Started
ERROR: python3-importlib-metadata-3.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:4.0.1-r0 to 0:3.10.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:4.0.1-r0 to 0:3.10.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:4.0.1-r0 to 0:3.10.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:4.0.1-r0 to 0:3.10.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:4.0.1-r0 to 0:3.10.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:4.0.1-r0 to 0:3.10.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:4.0.1-r0 to 0:3.10.1-r0) [version-going-backwards]
NOTE: recipe python3-importlib-metadata-3.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1139 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1469 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_fetch)
NOTE: Running task 1494 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_fetch)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_fetch: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1825 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_unpack)
NOTE: Running task 1826 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1827 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_unpack)
NOTE: Running task 1828 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_unpack: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 2152 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_patch)
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 2174 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_patch)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_patch: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_patch: Succeeded
NOTE: Running task 2408 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2409 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2410 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jinja2-3.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2411 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2412 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_populate_lic unihash changed to d57253bd4cd48623183921dc5d32ab3d208c35980524dae86d3429b660891723
NOTE: recipe python3-jinja2-3.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2413 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_configure)
NOTE: Running task 2414 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_configure)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to dfc85dadf1206a4718fcd43404d130a7b709788edf0b6c43786e4dda281f1a9e
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_configure: Succeeded
NOTE: Running task 2456 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_configure_ptest_base)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2457 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_configure_ptest_base)
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_configure_ptest_base: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe python3-jinja2-3.0.0-r0: task do_configure_ptest_base: Started
NOTE: Running task 2458 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2459 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_compile)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2460 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_compile: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 061780a75f7483885c15732173b5f425eb7788983e95873c1e812fae0568b1c3
NOTE: Setscene tasks completed
NOTE: Running task 2487 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2490 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_compile_ptest_base)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2491 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_install)
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_compile: Succeeded
NOTE: Running task 2492 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_compile_ptest_base)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_install: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2493 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_install: Succeeded
NOTE: Running task 2494 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_install_ptest_base)
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_install: Succeeded
NOTE: recipe python3-jinja2-3.0.0-r0: task do_install_ptest_base: Started
NOTE: Running task 2495 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_install_ptest_base)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2496 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_package)
NOTE: Running task 2497 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_populate_sysroot)
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2498 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_package)
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-jinja2-3.0.0-r0: task do_package: Succeeded
NOTE: Running task 2499 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_packagedata)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_package: Succeeded
NOTE: Running task 2500 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_packagedata)
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_packagedata: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2501 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_package_write_rpm)
NOTE: Running task 2502 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_package_write_rpm)
NOTE: Running task 2503 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_package_qa)
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_package_qa: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jinja2-3.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2504 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2504 tasks of which 2467 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============6717178129629448979==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 825 .bb files complete (0 cached, 825 parsed). 1459 targets, 41 skipped, 0 masked, 0 errors.
Removing 120 recipes from the core2-32 sysroot...done.
Removing 125 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-c49178116bd6f5a24c83b01fd82d2403607e52ae"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c49178116bd6f5a24c83b01fd82d2403607e52ae"
workspace            = "master:ed2e3b739a7e0e8daad665fed01342d60674d6b7"

Initialising tasks...done.
Sstate summary: Wanted 606 Local 590 Network 0 Missed 16 Current 202 (97% match, 98% complete)
Removing 4 stale sstate objects for arch x86_64_i686...done.
NOTE: Executing Tasks
NOTE: Running setscene task 203 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 204 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 205 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 207 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 208 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 209 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 210 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 211 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 212 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.3.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 213 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 214 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 215 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 216 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 217 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 218 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 219 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 220 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 221 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 222 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 223 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 224 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 225 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 226 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 227 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 228 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 229 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 230 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 231 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 232 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 233 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 234 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 235 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 236 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 237 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 238 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 239 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 240 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 241 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 242 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 243 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 244 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 245 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 246 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 247 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_20.3.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 248 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_3.10.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 249 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 261 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.7.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 262 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 263 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 264 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 265 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 266 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyparsing_2.4.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 267 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 268 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_56.0.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 269 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 270 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 271 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.68.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-247.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe file-5.40-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-1_247.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-attrs-20.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-importlib-metadata-3.10.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 272 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_packagedata_setscene)
NOTE: Running setscene task 273 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 274 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 275 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 276 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 277 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-packaging-20.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 278 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 279 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 280 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 281 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 282 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: recipe expat-2.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-conf-247.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-more-itertools-8.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe file-5.40-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 283 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-py-1.10.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pyparsing-2.4.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-setuptools-56.0.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-six-1.15.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 284 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 285 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 286 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 287 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 288 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 289 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 290 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pytest-6.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 291 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 292 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.68.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 293 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 294 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 295 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 296 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 297 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 298 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 299 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-attrs-20.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-importlib-metadata-3.10.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 300 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 301 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 302 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 303 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 304 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-zipp-3.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 305 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: recipe btrfs-tools-5.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 306 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-more-itertools-8.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 307 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 308 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 309 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 310 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 311 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-six-1.15.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-py-1.10.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-packaging-20.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pluggy-0.13.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pyparsing-2.4.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 312 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb:do_package_write_rpm_setscene)
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 313 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pytest-6.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 314 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 315 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 316 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 317 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_20.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 318 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_3.10.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 319 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 320 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_packagedata_setscene)
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-setuptools-56.0.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 321 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 322 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 323 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_247.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gcc-runtime-11.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-zipp-3.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 324 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 325 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata_setscene)
NOTE: Running setscene task 326 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.6.bb:do_packagedata_setscene)
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 327 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 328 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.7.0.bb:do_packagedata_setscene)
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 329 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyparsing_2.4.7.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 330 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_packagedata_setscene)
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 331 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_56.0.0.bb:do_packagedata_setscene)
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxkbcommon-1.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-attrs-20.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 332 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 333 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 334 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 335 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 336 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 337 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 338 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.12-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-importlib-metadata-3.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-20.9-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 339 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 340 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-py-1.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-conf-247.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 343 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Started
NOTE: Running setscene task 344 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 345 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 346 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 347 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 348 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 349 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 350 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_setscene)
NOTE: Running setscene task 351 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 352 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 353 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_packagedata_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 354 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 355 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-more-itertools-8.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pyparsing-2.4.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 358 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata_setscene)
NOTE: Running setscene task 359 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 360 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 361 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 362 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 363 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.76.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 364 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 365 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 366 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-setuptools-56.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-zipp-3.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pytest-6.2.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 367 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
ERROR: python3-importlib-metadata-3.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:4.0.1-r0 to 0:3.10.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:4.0.1-r0 to 0:3.10.1-r0) [version-going-backwards]
NOTE: recipe python3-six-1.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 368 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_package_write_rpm_setscene)
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
ERROR: python3-importlib-metadata-3.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:4.0.1-r0 to 0:3.10.1-r0) [version-going-backwards]
NOTE: Running setscene task 369 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_package_write_rpm_setscene)
ERROR: python3-importlib-metadata-3.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:4.0.1-r0 to 0:3.10.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:4.0.1-r0 to 0:3.10.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:4.0.1-r0 to 0:3.10.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:4.0.1-r0 to 0:3.10.1-r0) [version-going-backwards]
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2021.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-28-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 370 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 373 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe python3-attrs-20.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 379 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 381 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.49.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 388 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 389 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 390 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-importlib-metadata-3.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-packaging-20.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pluggy-0.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-py-1.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-7.76.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.34+gitAUTOINC+38eb7ca3f4_85c17ad073-r0: task do_deploy_setscene: Started
NOTE: recipe linux-yocto-5.10.34+gitAUTOINC+38eb7ca3f4_85c17ad073-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 408 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 409 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 410 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 411 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 412 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 413 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 414 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 415 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 416 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.3.bb:do_package_write_rpm_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnutls-3.7.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-conf-247.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 421 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 423 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2021.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe python3-more-itertools-8.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyparsing-2.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.49-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-six-1.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pytest-6.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-56.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 426 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_packagedata_setscene)
NOTE: recipe python3-zipp-3.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe curl-7.76.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 427 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.41-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libseccomp-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 445 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 446 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 447 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnutls-3.7.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe nettle-3.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.49-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.34+gitAUTOINC+38eb7ca3f4_85c17ad073-r0: task do_deploy_setscene: Succeeded
NOTE: Running setscene task 456 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libseccomp-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 461 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 462 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.32.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.41-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.34+gitAUTOINC+38eb7ca3f4_85c17ad073-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 465 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 466 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 467 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 468 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 469 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_packagedata_setscene)
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 478 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_packagedata_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 480 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_packagedata_setscene)
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.34+gitAUTOINC+38eb7ca3f4_85c17ad073-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.34+gitAUTOINC+38eb7ca3f4_85c17ad073-r0: task do_packagedata_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_packagedata_setscene: Started
NOTE: Running task 679 of 2525 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_fetch)
NOTE: Running task 685 of 2525 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_fetch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 486 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.34+gitAUTOINC+38eb7ca3f4_85c17ad073-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-1.46.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-jinja2-3.0.0-r0: task do_fetch: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 992 of 2525 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_unpack)
NOTE: Running task 993 of 2525 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_unpack)
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 502 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 504 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 507 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 509 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_packagedata_setscene)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_unpack: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1075 of 2525 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_patch)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1076 of 2525 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_patch)
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_patch: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 518 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.1.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 527 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_patch: Succeeded
NOTE: recipe python3-jinja2-3.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1102 of 2525 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1103 of 2525 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1104 of 2525 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_populate_lic)
NOTE: recipe glib-2.0-1_2.68.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 530 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_packagedata_setscene)
NOTE: Running setscene task 532 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.76.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 534 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 536 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_packagedata_setscene)
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.40-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_populate_lic: Started
NOTE: recipe curl-7.76.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-jinja2-3.0.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_populate_lic unihash changed to d57253bd4cd48623183921dc5d32ab3d208c35980524dae86d3429b660891723
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.40-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-7.76.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 547 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 550 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 552 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 555 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.2.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.41-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.41-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 562 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.68.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 566 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 569 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 573 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 579 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 581 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 583 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_247.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 590 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 597 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe systemd-1_247.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 603 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 604 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 605 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 608 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 610 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 612 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 614 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 616 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.49.bb:do_packagedata_setscene)
NOTE: Running setscene task 618 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.49-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe kmod-28-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1184 of 2525 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe libcap-2.49-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1189 of 2525 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1190 of 2525 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 625 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 627 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 629 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 632 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 644 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: Running task 1230 of 2525 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 647 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 649 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 654 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 656 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 659 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 661 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: recipe expat-2.3.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1251 of 2525 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.32.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.34+gitAUTOINC+38eb7ca3f4_85c17ad073-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 671 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 672 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: Running task 1264 of 2525 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe linux-yocto-5.10.34+gitAUTOINC+38eb7ca3f4_85c17ad073-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running task 1265 of 2525 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe linux-yocto-5.10.34+gitAUTOINC+38eb7ca3f4_85c17ad073-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 682 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 684 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: recipe expat-2.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 692 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 693 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2021.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2021.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe python3-3.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 699 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_packagedata_setscene)
NOTE: Running setscene task 700 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 701 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 702 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 703 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 704 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 705 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 706 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 707 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.3.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.35.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 710 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1313 of 2525 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 715 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 716 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 717 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 718 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 719 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 720 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 721 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 723 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 724 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 725 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.35.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 728 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 729 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 730 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 731 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 732 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 733 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 734 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.35.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 735 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.36.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 736 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.35.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 737 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-1.1.1k-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 739 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 740 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 741 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 742 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 743 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 744 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 745 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 746 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 747 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 748 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 749 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 751 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 753 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 755 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 757 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 758 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 759 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1370 of 2525 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 761 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Running setscene task 763 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 764 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 765 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 766 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 767 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to e26bb56718bc9073a8415f8e3429c9bc0634b7262f81b3677d8b04efe3b0e42e
NOTE: Running task 1379 of 2525 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 770 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 772 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 773 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 776 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 778 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 779 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 780 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-11.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 782 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 783 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 784 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 786 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 787 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 788 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 790 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 791 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 792 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 793 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 794 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 795 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 801 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 802 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 803 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 805 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 806 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 807 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 808 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 809 of 808 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1977 of 2525 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2016 of 2525 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jinja2-3.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2505 of 2525 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_configure)
NOTE: Running task 2506 of 2525 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_configure)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_configure: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_configure: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2507 of 2525 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_configure_ptest_base)
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_configure: Succeeded
NOTE: Running task 2508 of 2525 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_configure_ptest_base)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2509 of 2525 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_compile)
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2510 of 2525 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_compile)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_compile: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2511 of 2525 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_compile_ptest_base)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2512 of 2525 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_install)
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_compile: Succeeded
NOTE: Running task 2513 of 2525 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_compile_ptest_base)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_install: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2514 of 2525 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_install)
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_install: Succeeded
NOTE: Running task 2515 of 2525 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_install_ptest_base)
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_install: Succeeded
NOTE: Running task 2516 of 2525 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_install_ptest_base)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2517 of 2525 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_package)
NOTE: Running task 2518 of 2525 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_populate_sysroot)
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2519 of 2525 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_package)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-jinja2-3.0.0-r0: task do_package: Succeeded
NOTE: Running task 2520 of 2525 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_packagedata)
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_package: Succeeded
NOTE: Running task 2521 of 2525 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_packagedata)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_packagedata: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2522 of 2525 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_package_write_rpm)
NOTE: Running task 2523 of 2525 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_package_write_rpm)
NOTE: Running task 2524 of 2525 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_package_qa)
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_package_qa: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jinja2-3.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2525 of 2525 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2525 tasks of which 2483 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============6717178129629448979==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 825 .bb files complete (0 cached, 825 parsed). 1459 targets, 58 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-c49178116bd6f5a24c83b01fd82d2403607e52ae"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c49178116bd6f5a24c83b01fd82d2403607e52ae"
workspace            = "master:ed2e3b739a7e0e8daad665fed01342d60674d6b7"

Initialising tasks...done.
Sstate summary: Wanted 27 Local 12 Network 0 Missed 15 Current 770 (44% match, 98% complete)
Removing 4 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 782 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_3.10.1.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-importlib-metadata-3.10.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-importlib-metadata-3.10.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 795 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_3.10.1.bb:do_packagedata_setscene)
NOTE: recipe python3-importlib-metadata-3.10.1-r0: task do_packagedata_setscene: Started
ERROR: python3-importlib-metadata-3.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:4.0.1-r0 to 0:3.10.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:4.0.1-r0 to 0:3.10.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:4.0.1-r0 to 0:3.10.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:4.0.1-r0 to 0:3.10.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:4.0.1-r0 to 0:3.10.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:4.0.1-r0 to 0:3.10.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:4.0.1-r0 to 0:3.10.1-r0) [version-going-backwards]
NOTE: recipe python3-importlib-metadata-3.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1139 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Setscene tasks completed
NOTE: Running task 1469 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_fetch)
NOTE: Running task 1494 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_fetch)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_fetch: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1894 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_unpack)
NOTE: Running task 1895 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_unpack)
NOTE: Running task 1896 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1897 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_unpack: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-jinja2-3.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 2305 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_patch)
NOTE: Running task 2306 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_patch)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_patch: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_patch: Succeeded
NOTE: Running task 2408 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jinja2-3.0.0-r0: task do_patch: Succeeded
NOTE: Running task 2409 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2410 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_populate_lic)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2411 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2412 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_populate_lic unihash changed to d57253bd4cd48623183921dc5d32ab3d208c35980524dae86d3429b660891723
NOTE: Running task 2413 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_configure)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2414 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_configure)
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_configure: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 65bc2a999d0249cb2ac560c03e36a22609b1ba46f75d58326fd303d12a9c2adc
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_configure: Succeeded
NOTE: Running task 2435 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_configure_ptest_base)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2436 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_configure_ptest_base)
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2458 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe python3-jinja2-3.0.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2459 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_compile)
NOTE: Running task 2460 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_compile: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2461 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_compile_ptest_base)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 185fae5bf3ad4b72e8f86b78c04c5d7744ac78cbbc043d6773f94805f81a53c8
NOTE: Setscene tasks completed
NOTE: Running task 2488 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_compile_ptest_base: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2491 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_install)
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_compile: Succeeded
NOTE: Running task 2492 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_compile_ptest_base)
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_install: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2493 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_install)
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_install: Succeeded
NOTE: Running task 2494 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_install_ptest_base)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_install: Succeeded
NOTE: Running task 2495 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_install_ptest_base)
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2496 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_package)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2497 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_package)
NOTE: Running task 2498 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_populate_sysroot)
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_package: Succeeded
NOTE: Running task 2499 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_packagedata)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_package: Succeeded
NOTE: Running task 2500 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_packagedata)
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_packagedata: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2501 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_package_write_rpm)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2502 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_package_write_rpm)
NOTE: Running task 2503 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_package_qa)
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_package_qa: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jinja2-3.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2504 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2504 tasks of which 2467 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============6717178129629448979==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 825 .bb files complete (0 cached, 825 parsed). 1459 targets, 49 skipped, 0 masked, 0 errors.
Removing 1 recipes from the armv7vet2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-c49178116bd6f5a24c83b01fd82d2403607e52ae"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c49178116bd6f5a24c83b01fd82d2403607e52ae"
workspace            = "master:ed2e3b739a7e0e8daad665fed01342d60674d6b7"

Initialising tasks...done.
Sstate summary: Wanted 27 Local 12 Network 0 Missed 15 Current 770 (44% match, 98% complete)
Removing 4 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 782 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_3.10.1.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-importlib-metadata-3.10.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-importlib-metadata-3.10.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 795 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_3.10.1.bb:do_packagedata_setscene)
NOTE: recipe python3-importlib-metadata-3.10.1-r0: task do_packagedata_setscene: Started
ERROR: python3-importlib-metadata-3.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:4.0.1-r0 to 0:3.10.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:4.0.1-r0 to 0:3.10.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:4.0.1-r0 to 0:3.10.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:4.0.1-r0 to 0:3.10.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:4.0.1-r0 to 0:3.10.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:4.0.1-r0 to 0:3.10.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:4.0.1-r0 to 0:3.10.1-r0) [version-going-backwards]
NOTE: Running task 1139 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-importlib-metadata-3.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1469 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_fetch)
NOTE: Running task 1494 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_fetch)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_fetch: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1897 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_unpack)
NOTE: Running task 1898 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1899 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_unpack)
NOTE: Running task 1900 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_unpack: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 2279 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_patch)
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 2308 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_patch)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_patch: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_patch: Succeeded
NOTE: Running task 2408 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2409 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2410 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_populate_lic)
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jinja2-3.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2411 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2412 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_populate_lic unihash changed to d57253bd4cd48623183921dc5d32ab3d208c35980524dae86d3429b660891723
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2413 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_configure)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2414 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_configure)
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_configure: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 3efc4f5e67f95cd8a1a7756b3c20cad69a0ca7af90542ea68811d9f5bb3f5e72
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_configure: Succeeded
NOTE: Running task 2435 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_configure_ptest_base)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2436 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_configure_ptest_base)
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2458 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_compile)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2459 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: Running task 2460 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_compile: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: recipe python3-jinja2-3.0.0-r0: task do_compile: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 6d0e6e66a0affae81c0be3ba3f3e6c5aaac827a3f69de942bd3e101e3df77be5
NOTE: Setscene tasks completed
NOTE: Running task 2465 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_compile_ptest_base)
NOTE: Running task 2488 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_compile_ptest_base: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2491 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_install)
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_compile: Succeeded
NOTE: Running task 2492 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_compile_ptest_base)
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_install: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2493 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_install)
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jinja2-3.0.0-r0: task do_install: Succeeded
NOTE: Running task 2494 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_install_ptest_base)
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_install: Succeeded
NOTE: Running task 2495 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_install_ptest_base)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2496 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_package)
NOTE: Running task 2497 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_populate_sysroot)
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2498 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_package)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-jinja2-3.0.0-r0: task do_package: Succeeded
NOTE: Running task 2499 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_packagedata)
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_package: Succeeded
NOTE: Running task 2500 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_packagedata)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_packagedata: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2501 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb:do_package_write_rpm)
NOTE: Running task 2502 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_package_write_rpm)
NOTE: Running task 2503 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_package_qa)
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_package_qa: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-markupsafe-1.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jinja2-3.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2504 of 2504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2504 tasks of which 2467 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============6717178129629448979==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-jinja2: PKGV changed from 2.11.3 [default] to 3.0.0 [default]
packages/core2-32-poky-linux/python3-jinja2: PV changed from "2.11.3" to "3.0.0"
packages/core2-32-poky-linux/python3-jinja2: SRC_URI changed from "https://files.pythonhosted.org/packages/source/J/Jinja2/Jinja2-2.11.3.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/J/Jinja2/Jinja2-3.0.0.tar.gz file://run-ptest"
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-dbg: PKGV changed from 2.11.3 [default] to 3.0.0 [default]
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-dbg: FILELIST: directory renamed /usr/lib/python3.9/site-packages/Jinja2-2.11.3-py3.9.egg-info -> /usr/lib/python3.9/site-packages/Jinja2-3.0.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/jinja2/_compat.py /usr/lib/python3.9/site-packages/jinja2/__pycache__/asyncfilters.cpython-39.pyc /usr/lib/python3.9/site-packages/jinja2/asyncsupport.py /usr/lib/python3.9/site-packages/jinja2/__pycache__/_compat.cpython-39.pyc /usr/lib/python3.9/site-packages/jinja2/__pycache__/asyncsupport.cpython-39.pyc /usr/lib/python3.9/site-packages/jinja2/asyncfilters.py", added "/usr/lib/python3.9/site-packages/jinja2/async_utils.py /usr/lib/python3.9/site-packages/jinja2/py.typed /usr/lib/python3.9/site-packages/jinja2/__pycache__/async_utils.cpython-39.pyc"
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-dbg: PV changed from "2.11.3" to "3.0.0"
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-dev: PKGV changed from 2.11.3 [default] to 3.0.0 [default]
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-dev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/Jinja2-2.11.3-py3.9.egg-info -> /usr/lib/python3.9/site-packages/Jinja2-3.0.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/jinja2/_compat.py /usr/lib/python3.9/site-packages/jinja2/__pycache__/asyncfilters.cpython-39.pyc /usr/lib/python3.9/site-packages/jinja2/asyncsupport.py /usr/lib/python3.9/site-packages/jinja2/__pycache__/_compat.cpython-39.pyc /usr/lib/python3.9/site-packages/jinja2/__pycache__/asyncsupport.cpython-39.pyc /usr/lib/python3.9/site-packages/jinja2/asyncfilters.py", added "/usr/lib/python3.9/site-packages/jinja2/async_utils.py /usr/lib/python3.9/site-packages/jinja2/py.typed /usr/lib/python3.9/site-packages/jinja2/__pycache__/async_utils.cpython-39.pyc"
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-dev: PV changed from "2.11.3" to "3.0.0"
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-doc: PKGV changed from 2.11.3 [default] to 3.0.0 [default]
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-doc: FILELIST: directory renamed /usr/lib/python3.9/site-packages/Jinja2-2.11.3-py3.9.egg-info -> /usr/lib/python3.9/site-packages/Jinja2-3.0.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/jinja2/_compat.py /usr/lib/python3.9/site-packages/jinja2/__pycache__/asyncfilters.cpython-39.pyc /usr/lib/python3.9/site-packages/jinja2/asyncsupport.py /usr/lib/python3.9/site-packages/jinja2/__pycache__/_compat.cpython-39.pyc /usr/lib/python3.9/site-packages/jinja2/__pycache__/asyncsupport.cpython-39.pyc /usr/lib/python3.9/site-packages/jinja2/asyncfilters.py", added "/usr/lib/python3.9/site-packages/jinja2/async_utils.py /usr/lib/python3.9/site-packages/jinja2/py.typed /usr/lib/python3.9/site-packages/jinja2/__pycache__/async_utils.cpython-39.pyc"
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-doc: PV changed from "2.11.3" to "3.0.0"
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-locale: PKGV changed from 2.11.3 [default] to 3.0.0 [default]
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-locale: FILELIST: directory renamed /usr/lib/python3.9/site-packages/Jinja2-2.11.3-py3.9.egg-info -> /usr/lib/python3.9/site-packages/Jinja2-3.0.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/jinja2/_compat.py /usr/lib/python3.9/site-packages/jinja2/__pycache__/asyncfilters.cpython-39.pyc /usr/lib/python3.9/site-packages/jinja2/asyncsupport.py /usr/lib/python3.9/site-packages/jinja2/__pycache__/_compat.cpython-39.pyc /usr/lib/python3.9/site-packages/jinja2/__pycache__/asyncsupport.cpython-39.pyc /usr/lib/python3.9/site-packages/jinja2/asyncfilters.py", added "/usr/lib/python3.9/site-packages/jinja2/async_utils.py /usr/lib/python3.9/site-packages/jinja2/py.typed /usr/lib/python3.9/site-packages/jinja2/__pycache__/async_utils.cpython-39.pyc"
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-locale: PV changed from "2.11.3" to "3.0.0"
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-ptest: PKGV changed from 2.11.3 [default] to 3.0.0 [default]
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-ptest: FILELIST: directory renamed /usr/lib/python3.9/site-packages/Jinja2-2.11.3-py3.9.egg-info -> /usr/lib/python3.9/site-packages/Jinja2-3.0.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/jinja2/_compat.py /usr/lib/python3.9/site-packages/jinja2/__pycache__/asyncfilters.cpython-39.pyc /usr/lib/python3.9/site-packages/jinja2/asyncsupport.py /usr/lib/python3.9/site-packages/jinja2/__pycache__/_compat.cpython-39.pyc /usr/lib/python3.9/site-packages/jinja2/__pycache__/asyncsupport.cpython-39.pyc /usr/lib/python3.9/site-packages/jinja2/asyncfilters.py", added "/usr/lib/python3.9/site-packages/jinja2/async_utils.py /usr/lib/python3.9/site-packages/jinja2/py.typed /usr/lib/python3.9/site-packages/jinja2/__pycache__/async_utils.cpython-39.pyc"
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-ptest: PV changed from "2.11.3" to "3.0.0"
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-ptest: PKGSIZE changed from 237067 to 258202 (+9%)
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-src: PKGV changed from 2.11.3 [default] to 3.0.0 [default]
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-src: FILELIST: directory renamed /usr/lib/python3.9/site-packages/Jinja2-2.11.3-py3.9.egg-info -> /usr/lib/python3.9/site-packages/Jinja2-3.0.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/jinja2/_compat.py /usr/lib/python3.9/site-packages/jinja2/__pycache__/asyncfilters.cpython-39.pyc /usr/lib/python3.9/site-packages/jinja2/asyncsupport.py /usr/lib/python3.9/site-packages/jinja2/__pycache__/_compat.cpython-39.pyc /usr/lib/python3.9/site-packages/jinja2/__pycache__/asyncsupport.cpython-39.pyc /usr/lib/python3.9/site-packages/jinja2/asyncfilters.py", added "/usr/lib/python3.9/site-packages/jinja2/async_utils.py /usr/lib/python3.9/site-packages/jinja2/py.typed /usr/lib/python3.9/site-packages/jinja2/__pycache__/async_utils.cpython-39.pyc"
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-src: PV changed from "2.11.3" to "3.0.0"
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-staticdev: PKGV changed from 2.11.3 [default] to 3.0.0 [default]
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-staticdev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/Jinja2-2.11.3-py3.9.egg-info -> /usr/lib/python3.9/site-packages/Jinja2-3.0.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/jinja2/_compat.py /usr/lib/python3.9/site-packages/jinja2/__pycache__/asyncfilters.cpython-39.pyc /usr/lib/python3.9/site-packages/jinja2/asyncsupport.py /usr/lib/python3.9/site-packages/jinja2/__pycache__/_compat.cpython-39.pyc /usr/lib/python3.9/site-packages/jinja2/__pycache__/asyncsupport.cpython-39.pyc /usr/lib/python3.9/site-packages/jinja2/asyncfilters.py", added "/usr/lib/python3.9/site-packages/jinja2/async_utils.py /usr/lib/python3.9/site-packages/jinja2/py.typed /usr/lib/python3.9/site-packages/jinja2/__pycache__/async_utils.cpython-39.pyc"
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-staticdev: PV changed from "2.11.3" to "3.0.0"
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2: PKGV changed from 2.11.3 [default] to 3.0.0 [default]
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2: FILELIST: directory renamed /usr/lib/python3.9/site-packages/Jinja2-2.11.3-py3.9.egg-info -> /usr/lib/python3.9/site-packages/Jinja2-3.0.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/jinja2/_compat.py /usr/lib/python3.9/site-packages/jinja2/__pycache__/asyncfilters.cpython-39.pyc /usr/lib/python3.9/site-packages/jinja2/asyncsupport.py /usr/lib/python3.9/site-packages/jinja2/__pycache__/_compat.cpython-39.pyc /usr/lib/python3.9/site-packages/jinja2/__pycache__/asyncsupport.cpython-39.pyc /usr/lib/python3.9/site-packages/jinja2/asyncfilters.py", added "/usr/lib/python3.9/site-packages/jinja2/async_utils.py /usr/lib/python3.9/site-packages/jinja2/py.typed /usr/lib/python3.9/site-packages/jinja2/__pycache__/async_utils.cpython-39.pyc"
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2: PV changed from "2.11.3" to "3.0.0"
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2: PKGSIZE changed from 836159 to 921143 (+10%)
Changes to packages/core2-32-poky-linux/python3-jinja2 (sysroot):
  /usr/lib/python3.9/site-packages/Jinja2-3.0.0-py3.9.egg-info was added
  /usr/lib/python3.9/site-packages/Jinja2-3.0.0-py3.9.egg-info/dependency_links.txt was added
  /usr/lib/python3.9/site-packages/Jinja2-3.0.0-py3.9.egg-info/entry_points.txt was added
  /usr/lib/python3.9/site-packages/Jinja2-3.0.0-py3.9.egg-info/PKG-INFO was added
  /usr/lib/python3.9/site-packages/Jinja2-3.0.0-py3.9.egg-info/requires.txt was added
  /usr/lib/python3.9/site-packages/Jinja2-3.0.0-py3.9.egg-info/SOURCES.txt was added
  /usr/lib/python3.9/site-packages/Jinja2-3.0.0-py3.9.egg-info/top_level.txt was added
  /usr/lib/python3.9/site-packages/jinja2/async_utils.py was added
  /usr/lib/python3.9/site-packages/jinja2/__pycache__/async_utils.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/jinja2/py.typed was added
  /usr/lib/python3.9/site-packages/Jinja2-2.11.3-py3.9.egg-info was removed
  /usr/lib/python3.9/site-packages/Jinja2-2.11.3-py3.9.egg-info/dependency_links.txt was removed
  /usr/lib/python3.9/site-packages/Jinja2-2.11.3-py3.9.egg-info/entry_points.txt was removed
  /usr/lib/python3.9/site-packages/Jinja2-2.11.3-py3.9.egg-info/PKG-INFO was removed
  /usr/lib/python3.9/site-packages/Jinja2-2.11.3-py3.9.egg-info/requires.txt was removed
  /usr/lib/python3.9/site-packages/Jinja2-2.11.3-py3.9.egg-info/SOURCES.txt was removed
  /usr/lib/python3.9/site-packages/Jinja2-2.11.3-py3.9.egg-info/top_level.txt was removed
  /usr/lib/python3.9/site-packages/jinja2/asyncfilters.py was removed
  /usr/lib/python3.9/site-packages/jinja2/asyncsupport.py was removed
  /usr/lib/python3.9/site-packages/jinja2/_compat.py was removed
  /usr/lib/python3.9/site-packages/jinja2/__pycache__/asyncfilters.cpython-39.pyc was removed
  /usr/lib/python3.9/site-packages/jinja2/__pycache__/asyncsupport.cpython-39.pyc was removed
  /usr/lib/python3.9/site-packages/jinja2/__pycache__/_compat.cpython-39.pyc was removed

--===============6717178129629448979==--
