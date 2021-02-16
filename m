Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.5172.1613463850150435801
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 00:24:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id 0837A38C124A
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 08:24:10 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-magic: upgrading to 0.4.20 SUCCEEDED
Message-ID: <MADEUP.16642CD2C68FF093.5617@lists.openembedded.org>
X-Groupsio-MsgNum: 148116
Content-Type: multipart/mixed; boundary="===============1579333830675216442=="

--===============1579333830675216442==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-magic* to *0.4.20* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-magic-upgrade-0.4.18-0.4.20.patch
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

--===============1579333830675216442==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-magic-upgrade-0.4.18-0.4.20.patch"

From cb1fb74b2d35fe5d262367e8a998e02d5498979b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Feb 2021 21:46:16 +0000
Subject: [PATCH] python3-magic: upgrade 0.4.18 -> 0.4.20

---
 ...agic_0.4.18.bb => python3-magic_0.4.20.bb} | 59 ++++++++++++++++++-
 1 file changed, 56 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-magic_0.4.18.bb => python3-magic_0.4.20.bb} (17%)

diff --git a/meta/recipes-devtools/python/python3-magic_0.4.18.bb b/meta/recipes-devtools/python/python3-magic_0.4.20.bb
similarity index 17%
rename from meta/recipes-devtools/python/python3-magic_0.4.18.bb
rename to meta/recipes-devtools/python/python3-magic_0.4.20.bb
index 101b96d31c..e6aad7e696 100644
--- a/meta/recipes-devtools/python/python3-magic_0.4.18.bb
+++ b/meta/recipes-devtools/python/python3-magic_0.4.20.bb
@@ -1,3 +1,57 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE
+# +++ LICENSE
+# @@ -19,3 +19,40 @@
+#  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+#  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+#  SOFTWARE.
+# +
+# +
+# +====
+# +
+# +Portions of this package (magic/compat.py and test/libmagic_test.py)
+# +are distributed under the following copyright notice:
+# +
+# +
+# +$File: LEGAL.NOTICE,v 1.15 2006/05/03 18:48:33 christos Exp $
+# +Copyright (c) Ian F. Darwin 1986, 1987, 1989, 1990, 1991, 1992, 1994, 1995.
+# +Software written by Ian F. Darwin and others;
+# +maintained 1994- Christos Zoulas.
+# +
+# +This software is not subject to any export provision of the United States
+# +Department of Commerce, and may be exported to any country or planet.
+# +
+# +Redistribution and use in source and binary forms, with or without
+# +modification, are permitted provided that the following conditions
+# +are met:
+# +1. Redistributions of source code must retain the above copyright
+# +   notice immediately at the beginning of the file, without modification,
+# +   this list of conditions, and the following disclaimer.
+# +2. Redistributions in binary form must reproduce the above copyright
+# +   notice, this list of conditions and the following disclaimer in the
+# +   documentation and/or other materials provided with the distribution.
+# +
+# +THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
+# +ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+# +IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+# +ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE FOR
+# +ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
+# +DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
+# +OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
+# +HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
+# +LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
+# +OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
+# +SUCH DAMAGE.
+# 
+#
+
 SUMMARY = "File type identification using libmagic"
 DESCRIPTION = "This module uses ctypes to access the libmagic file type \
     identification library. It makes use of the local magic database and supports \
@@ -5,14 +59,13 @@ DESCRIPTION = "This module uses ctypes to access the libmagic file type \
 HOMEPAGE = "http://github.com/ahupp/python-magic"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=16a934f165e8c3245f241e77d401bb88"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=61495c152d794e6be5799a9edca149e3"
 
 PYPI_PACKAGE = "python-magic"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "5edc6caa39cc62641850f6b1b6f284ba"
-SRC_URI[sha256sum] = "b757db2a5289ea3f1ced9e60f072965243ea43a2221430048fd8cacab17be0ce"
+SRC_URI[sha256sum] = "0cc52ccad086c377b9194014e3dbf98d94b194344630172510a6a3e716b47801"
 
 RDEPENDS_${PN} += "file \
                    ${PYTHON_PN}-ctypes \
-- 
2.17.1


--===============1579333830675216442==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-magic/python3-magic-dev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/python_magic-0.4.18-py3.9.egg-info -> /usr/lib/python3.9/site-packages/python_magic-0.4.20-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/magic.py /usr/lib/python3.9/site-packages/__pycache__/magic.cpython-39.pyc", added "/usr/lib/python3.9/site-packages/magic/__init__.py /usr/lib/python3.9/site-packages/magic/compat.py /usr/lib/python3.9/site-packages/magic/__pycache__/__init__.cpython-39.pyc /usr/lib/python3.9/site-packages/magic/__pycache__/compat.cpython-39.pyc"
packages/core2-32-poky-linux/python3-magic/python3-magic-doc: FILELIST: directory renamed /usr/lib/python3.9/site-packages/python_magic-0.4.18-py3.9.egg-info -> /usr/lib/python3.9/site-packages/python_magic-0.4.20-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/magic.py /usr/lib/python3.9/site-packages/__pycache__/magic.cpython-39.pyc", added "/usr/lib/python3.9/site-packages/magic/__init__.py /usr/lib/python3.9/site-packages/magic/compat.py /usr/lib/python3.9/site-packages/magic/__pycache__/__init__.cpython-39.pyc /usr/lib/python3.9/site-packages/magic/__pycache__/compat.cpython-39.pyc"
packages/core2-32-poky-linux/python3-magic/python3-magic-locale: FILELIST: directory renamed /usr/lib/python3.9/site-packages/python_magic-0.4.18-py3.9.egg-info -> /usr/lib/python3.9/site-packages/python_magic-0.4.20-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/magic.py /usr/lib/python3.9/site-packages/__pycache__/magic.cpython-39.pyc", added "/usr/lib/python3.9/site-packages/magic/__init__.py /usr/lib/python3.9/site-packages/magic/compat.py /usr/lib/python3.9/site-packages/magic/__pycache__/__init__.cpython-39.pyc /usr/lib/python3.9/site-packages/magic/__pycache__/compat.cpython-39.pyc"
packages/core2-32-poky-linux/python3-magic/python3-magic-staticdev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/python_magic-0.4.18-py3.9.egg-info -> /usr/lib/python3.9/site-packages/python_magic-0.4.20-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/magic.py /usr/lib/python3.9/site-packages/__pycache__/magic.cpython-39.pyc", added "/usr/lib/python3.9/site-packages/magic/__init__.py /usr/lib/python3.9/site-packages/magic/compat.py /usr/lib/python3.9/site-packages/magic/__pycache__/__init__.cpython-39.pyc /usr/lib/python3.9/site-packages/magic/__pycache__/compat.cpython-39.pyc"
packages/core2-32-poky-linux/python3-magic/python3-magic: FILELIST: directory renamed /usr/lib/python3.9/site-packages/python_magic-0.4.18-py3.9.egg-info -> /usr/lib/python3.9/site-packages/python_magic-0.4.20-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/magic.py /usr/lib/python3.9/site-packages/__pycache__/magic.cpython-39.pyc", added "/usr/lib/python3.9/site-packages/magic/__init__.py /usr/lib/python3.9/site-packages/magic/compat.py /usr/lib/python3.9/site-packages/magic/__pycache__/__init__.cpython-39.pyc /usr/lib/python3.9/site-packages/magic/__pycache__/compat.cpython-39.pyc"
packages/core2-32-poky-linux/python3-magic/python3-magic: PKGSIZE changed from 29137 to 51202 (+76%)
Changes to packages/core2-32-poky-linux/python3-magic (sysroot):
  /usr/lib/python3.9/site-packages/python_magic-0.4.18-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/python_magic-0.4.20-py3.9.egg-info
  /usr/lib/python3.9/site-packages/magic was added
  /usr/lib/python3.9/site-packages/magic/compat.py was added
  /usr/lib/python3.9/site-packages/magic/__init__.py was added
  /usr/lib/python3.9/site-packages/magic/__pycache__ was added
  /usr/lib/python3.9/site-packages/magic/__pycache__/compat.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/magic/__pycache__/__init__.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/magic.py was removed
  /usr/lib/python3.9/site-packages/__pycache__ was removed
  /usr/lib/python3.9/site-packages/__pycache__/magic.cpython-39.pyc was removed

--===============1579333830675216442==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-magic: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/python-magic/python-magic-0.4.18.tar.gz" to "https://files.pythonhosted.org/packages/source/p/python-magic/python-magic-0.4.20.tar.gz"
packages/core2-32-poky-linux/python3-magic: PV changed from "0.4.18" to "0.4.20"
packages/core2-32-poky-linux/python3-magic: PKGV changed from 0.4.18 [default] to 0.4.20 [default]
packages/core2-32-poky-linux/python3-magic/python3-magic-dbg: PV changed from "0.4.18" to "0.4.20"
packages/core2-32-poky-linux/python3-magic/python3-magic-dbg: PKGV changed from 0.4.18 [default] to 0.4.20 [default]
packages/core2-32-poky-linux/python3-magic/python3-magic-dbg: FILELIST: directory renamed /usr/lib/python3.9/site-packages/python_magic-0.4.18-py3.9.egg-info -> /usr/lib/python3.9/site-packages/python_magic-0.4.20-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/__pycache__/magic.cpython-39.pyc /usr/lib/python3.9/site-packages/magic.py", added "/usr/lib/python3.9/site-packages/magic/compat.py /usr/lib/python3.9/site-packages/magic/__pycache__/__init__.cpython-39.pyc /usr/lib/python3.9/site-packages/magic/__pycache__/compat.cpython-39.pyc /usr/lib/python3.9/site-packages/magic/__init__.py"
packages/core2-32-poky-linux/python3-magic/python3-magic-dev: PV changed from "0.4.18" to "0.4.20"
packages/core2-32-poky-linux/python3-magic/python3-magic-dev: PKGV changed from 0.4.18 [default] to 0.4.20 [default]
packages/core2-32-poky-linux/python3-magic/python3-magic-dev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/python_magic-0.4.18-py3.9.egg-info -> /usr/lib/python3.9/site-packages/python_magic-0.4.20-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/__pycache__/magic.cpython-39.pyc /usr/lib/python3.9/site-packages/magic.py", added "/usr/lib/python3.9/site-packages/magic/compat.py /usr/lib/python3.9/site-packages/magic/__pycache__/__init__.cpython-39.pyc /usr/lib/python3.9/site-packages/magic/__pycache__/compat.cpython-39.pyc /usr/lib/python3.9/site-packages/magic/__init__.py"
packages/core2-32-poky-linux/python3-magic/python3-magic-doc: PV changed from "0.4.18" to "0.4.20"
packages/core2-32-poky-linux/python3-magic/python3-magic-doc: PKGV changed from 0.4.18 [default] to 0.4.20 [default]
packages/core2-32-poky-linux/python3-magic/python3-magic-doc: FILELIST: directory renamed /usr/lib/python3.9/site-packages/python_magic-0.4.18-py3.9.egg-info -> /usr/lib/python3.9/site-packages/python_magic-0.4.20-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/__pycache__/magic.cpython-39.pyc /usr/lib/python3.9/site-packages/magic.py", added "/usr/lib/python3.9/site-packages/magic/compat.py /usr/lib/python3.9/site-packages/magic/__pycache__/__init__.cpython-39.pyc /usr/lib/python3.9/site-packages/magic/__pycache__/compat.cpython-39.pyc /usr/lib/python3.9/site-packages/magic/__init__.py"
packages/core2-32-poky-linux/python3-magic/python3-magic-locale: PV changed from "0.4.18" to "0.4.20"
packages/core2-32-poky-linux/python3-magic/python3-magic-locale: PKGV changed from 0.4.18 [default] to 0.4.20 [default]
packages/core2-32-poky-linux/python3-magic/python3-magic-locale: FILELIST: directory renamed /usr/lib/python3.9/site-packages/python_magic-0.4.18-py3.9.egg-info -> /usr/lib/python3.9/site-packages/python_magic-0.4.20-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/__pycache__/magic.cpython-39.pyc /usr/lib/python3.9/site-packages/magic.py", added "/usr/lib/python3.9/site-packages/magic/compat.py /usr/lib/python3.9/site-packages/magic/__pycache__/__init__.cpython-39.pyc /usr/lib/python3.9/site-packages/magic/__pycache__/compat.cpython-39.pyc /usr/lib/python3.9/site-packages/magic/__init__.py"
packages/core2-32-poky-linux/python3-magic/python3-magic-src: PV changed from "0.4.18" to "0.4.20"
packages/core2-32-poky-linux/python3-magic/python3-magic-src: PKGV changed from 0.4.18 [default] to 0.4.20 [default]
packages/core2-32-poky-linux/python3-magic/python3-magic-src: FILELIST: directory renamed /usr/lib/python3.9/site-packages/python_magic-0.4.18-py3.9.egg-info -> /usr/lib/python3.9/site-packages/python_magic-0.4.20-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/__pycache__/magic.cpython-39.pyc /usr/lib/python3.9/site-packages/magic.py", added "/usr/lib/python3.9/site-packages/magic/compat.py /usr/lib/python3.9/site-packages/magic/__pycache__/__init__.cpython-39.pyc /usr/lib/python3.9/site-packages/magic/__pycache__/compat.cpython-39.pyc /usr/lib/python3.9/site-packages/magic/__init__.py"
packages/core2-32-poky-linux/python3-magic/python3-magic-staticdev: PV changed from "0.4.18" to "0.4.20"
packages/core2-32-poky-linux/python3-magic/python3-magic-staticdev: PKGV changed from 0.4.18 [default] to 0.4.20 [default]
packages/core2-32-poky-linux/python3-magic/python3-magic-staticdev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/python_magic-0.4.18-py3.9.egg-info -> /usr/lib/python3.9/site-packages/python_magic-0.4.20-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/__pycache__/magic.cpython-39.pyc /usr/lib/python3.9/site-packages/magic.py", added "/usr/lib/python3.9/site-packages/magic/compat.py /usr/lib/python3.9/site-packages/magic/__pycache__/__init__.cpython-39.pyc /usr/lib/python3.9/site-packages/magic/__pycache__/compat.cpython-39.pyc /usr/lib/python3.9/site-packages/magic/__init__.py"
packages/core2-32-poky-linux/python3-magic/python3-magic: PV changed from "0.4.18" to "0.4.20"
packages/core2-32-poky-linux/python3-magic/python3-magic: PKGV changed from 0.4.18 [default] to 0.4.20 [default]
packages/core2-32-poky-linux/python3-magic/python3-magic: PKGSIZE changed from 29137 to 51202 (+76%)
packages/core2-32-poky-linux/python3-magic/python3-magic: FILELIST: directory renamed /usr/lib/python3.9/site-packages/python_magic-0.4.18-py3.9.egg-info -> /usr/lib/python3.9/site-packages/python_magic-0.4.20-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/__pycache__/magic.cpython-39.pyc /usr/lib/python3.9/site-packages/magic.py", added "/usr/lib/python3.9/site-packages/magic/compat.py /usr/lib/python3.9/site-packages/magic/__pycache__/__init__.cpython-39.pyc /usr/lib/python3.9/site-packages/magic/__pycache__/compat.cpython-39.pyc /usr/lib/python3.9/site-packages/magic/__init__.py"
Changes to packages/core2-32-poky-linux/python3-magic (sysroot):
  /usr/lib/python3.9/site-packages/python_magic-0.4.18-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/python_magic-0.4.20-py3.9.egg-info
  /usr/lib/python3.9/site-packages/magic was added
  /usr/lib/python3.9/site-packages/magic/compat.py was added
  /usr/lib/python3.9/site-packages/magic/__init__.py was added
  /usr/lib/python3.9/site-packages/magic/__pycache__ was added
  /usr/lib/python3.9/site-packages/magic/__pycache__/compat.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/magic/__pycache__/__init__.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/magic.py was removed
  /usr/lib/python3.9/site-packages/__pycache__ was removed
  /usr/lib/python3.9/site-packages/__pycache__/magic.cpython-39.pyc was removed

--===============1579333830675216442==--
