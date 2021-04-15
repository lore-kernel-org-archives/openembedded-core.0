Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.1362.1618510600061197652
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 31C3638C13DD
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:39 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-docutils: upgrading to 0.17 FAILED
Message-ID: <MADEUP.16761AD0EB5B8224.25572@lists.openembedded.org>
X-Groupsio-MsgNum: 150509
Content-Type: multipart/mixed; boundary="===============6828700074783229538=="

--===============6828700074783229538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-docutils* to *0.17* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-docutils-upgrade-0.16-0.17.patch
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

--===============6828700074783229538==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-docutils-upgrade-0.16-0.17.patch"

From 6377a3508005f4093b75d0c9c27157c601418724 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Apr 2021 06:15:48 +0000
Subject: [PATCH] python3-docutils: upgrade 0.16 -> 0.17

---
 ...utils_0.16.bb => python3-docutils_0.17.bb} | 45 +++++++++++++++++--
 1 file changed, 42 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-docutils_0.16.bb => python3-docutils_0.17.bb} (16%)

diff --git a/meta/recipes-devtools/python/python3-docutils_0.16.bb b/meta/recipes-devtools/python/python3-docutils_0.17.bb
similarity index 16%
rename from meta/recipes-devtools/python/python3-docutils_0.16.bb
rename to meta/recipes-devtools/python/python3-docutils_0.17.bb
index 50547a1b0c..ef0f869bae 100644
--- a/meta/recipes-devtools/python/python3-docutils_0.16.bb
+++ b/meta/recipes-devtools/python/python3-docutils_0.17.bb
@@ -1,14 +1,53 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- COPYING.txt
+# +++ COPYING.txt
+# @@ -4,7 +4,7 @@
+#  
+#  :Author: David Goodger
+#  :Contact: goodger@python.org
+# -:Date: $Date: 2015-05-08 17:56:32 +0200 (Fr, 08. Mai 2015) $
+# +:Date: $Date: 2020-09-04 18:52:11 +0200 (Fr, 04. Sep 2020) $
+#  :Web site: http://docutils.sourceforge.net/
+#  :Copyright: This document has been placed in the public domain.
+#  
+# @@ -79,8 +79,6 @@
+#  * docutils/utils/math/__init__.py,
+#    docutils/utils/math/latex2mathml.py,
+#    docutils/writers/xetex/__init__.py,
+# -  docutils/writers/latex2e/docutils-05-compat.sty,
+# -  docs/user/docutils-05-compat.sty.txt,
+#    docutils/utils/error_reporting.py,
+#    docutils/test/transforms/test_smartquotes.py:
+#  
+# @@ -131,7 +129,7 @@
+#  .. _licenses: licenses/
+#  .. _Python 2.1.1 license: http://www.python.org/2.1.1/license.html
+#  .. _GNU General Public License: http://www.gnu.org/copyleft/gpl.html
+# -.. _2-Clause BSD license: http://www.spdx.org/licenses/BSD-2-Clause
+# +.. _2-Clause BSD license: http://opensource.org/licenses/BSD-2-Clause
+#  .. _OSI-approved: http://opensource.org/licenses/
+#  .. _license-list:
+#  .. _GPL-compatible: http://www.gnu.org/licenses/license-list.html
+# 
+#
+
 SUMMARY = "Text processing system for documentation"
 HOMEPAGE = "http://docutils.sourceforge.net"
 SECTION = "devel/python"
 LICENSE = "PSF & BSD-2-Clause & GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=7a4646907ab9083c826280b19e103106"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=836a1950177996968a49ff477a4a61c4"
 
 DEPENDS = "python3"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/docutils/docutils-${PV}.tar.gz"
-SRC_URI[md5sum] = "9ccb6f332e23360f964de72c8ea5f0ed"
-SRC_URI[sha256sum] = "7d4e999cca74a52611773a42912088078363a30912e8822f7a3d38043b767573"
+SRC_URI[sha256sum] = "e2ffeea817964356ba4470efba7c2f42b6b0de0b04e66378507e3e2504bbff4c"
 
 S = "${WORKDIR}/docutils-${PV}"
 
-- 
2.27.0


--===============6828700074783229538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1438 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (813 cached, 1 parsed). 1438 targets, 31 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.50.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:d8e9644feb84e21bf23727fd0debc18ed41b9acc"
workspace            = "master:ddc9e2fd33abe6a0de7b4e0dacdb6f530ee99871"

Initialising tasks...done.
Sstate summary: Wanted 218 Local 210 Network 0 Missed 8 Current 450 (96% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1540 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.17.bb:do_fetch)
NOTE: recipe python3-docutils-0.17-r0: task do_fetch: Started
NOTE: recipe python3-docutils-0.17-r0: task do_fetch: Succeeded
NOTE: Running task 1916 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.17.bb:do_unpack)
NOTE: Running task 1917 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.17.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-docutils-0.17-r0: task do_unpack: Started
NOTE: recipe python3-docutils-0.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-docutils-0.17-r0: task do_unpack: Succeeded
NOTE: Running task 2123 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.17.bb:do_patch)
NOTE: recipe python3-docutils-0.17-r0: task do_patch: Started
NOTE: recipe python3-docutils-0.17-r0: task do_patch: Succeeded
NOTE: Running task 2124 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.17.bb:do_deploy_source_date_epoch)
NOTE: Running task 2125 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.17.bb:do_populate_lic)
NOTE: recipe python3-docutils-0.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-docutils-0.17-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-docutils-0.17-r0: task do_populate_lic: Started
NOTE: recipe python3-docutils-0.17-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-docutils-0.17-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2126 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.17.bb:do_configure)
NOTE: recipe python3-docutils-0.17-r0: task do_configure: Started
NOTE: recipe python3-docutils-0.17-r0: task do_configure: Succeeded
NOTE: Running task 2127 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.17.bb:do_compile)
NOTE: recipe python3-docutils-0.17-r0: task do_compile: Started
ERROR: python3-docutils-0.17-r0 do_compile: 'python3 setup.py build ' execution failed.
ERROR: python3-docutils-0.17-r0 do_compile: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-docutils/0.17-r0/temp/run.do_compile.3441128' failed with exit code 1:
Error: The "setuptools" module, which is required for the
  installation of Docutils, could not be found.

  You may install  it with `python -m pip install setuptools`
  or from a package called "python-setuptools" (or similar)
  using your system's package manager.

  Alternatively, install a release from PyPi with
  `python -m pip install docutils`.
WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-docutils/0.17-r0/temp/run.do_compile.3441128:177 exit 1 from 'exit 1'
WARNING: Backtrace (BB generated script): 
	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-docutils/0.17-r0/temp/run.do_compile.3441128, line 177
	#2: distutils3_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-docutils/0.17-r0/temp/run.do_compile.3441128, line 167
	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-docutils/0.17-r0/temp/run.do_compile.3441128, line 156
	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-docutils/0.17-r0/temp/run.do_compile.3441128, line 181

Backtrace (metadata-relative locations):
	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/logging.bbclass, line 72
	#2: distutils3_do_compile, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/distutils3.bbclass, line 28
	#3: do_compile, autogenerated, line 3
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-docutils/0.17-r0/temp/log.do_compile.3441128
Log data follows:
| DEBUG: Executing shell function do_compile
| Error: The "setuptools" module, which is required for the
|   installation of Docutils, could not be found.
| 
|   You may install  it with `python -m pip install setuptools`
|   or from a package called "python-setuptools" (or similar)
|   using your system's package manager.
| 
|   Alternatively, install a release from PyPi with
|   `python -m pip install docutils`.
| ERROR: 'python3 setup.py build ' execution failed.
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-docutils/0.17-r0/temp/run.do_compile.3441128:177 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-docutils/0.17-r0/temp/run.do_compile.3441128, line 177
| 	#2: distutils3_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-docutils/0.17-r0/temp/run.do_compile.3441128, line 167
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-docutils/0.17-r0/temp/run.do_compile.3441128, line 156
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-docutils/0.17-r0/temp/run.do_compile.3441128, line 181
| ERROR: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-docutils/0.17-r0/temp/run.do_compile.3441128' failed with exit code 1:
| Error: The "setuptools" module, which is required for the
|   installation of Docutils, could not be found.
| 
|   You may install  it with `python -m pip install setuptools`
|   or from a package called "python-setuptools" (or similar)
|   using your system's package manager.
| 
|   Alternatively, install a release from PyPi with
|   `python -m pip install docutils`.
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-docutils/0.17-r0/temp/run.do_compile.3441128:177 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-docutils/0.17-r0/temp/run.do_compile.3441128, line 177
| 	#2: distutils3_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-docutils/0.17-r0/temp/run.do_compile.3441128, line 167
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-docutils/0.17-r0/temp/run.do_compile.3441128, line 156
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-docutils/0.17-r0/temp/run.do_compile.3441128, line 181
| 
| Backtrace (metadata-relative locations):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/logging.bbclass, line 72
| 	#2: distutils3_do_compile, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/distutils3.bbclass, line 28
| 	#3: do_compile, autogenerated, line 3
NOTE: recipe python3-docutils-0.17-r0: task do_compile: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.17.bb:do_compile) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2127 tasks of which 2119 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.17.bb:do_compile
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

--===============6828700074783229538==--
