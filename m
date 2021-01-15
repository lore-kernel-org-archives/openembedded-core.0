Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.689.1610713822948664256
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 04:30:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 202A838C12A6
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 12:30:22 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dbusmock: upgrading to 0.22.0 SUCCEEDED
Message-ID: <MADEUP.165A67B02D0D0C8F.32579@lists.openembedded.org>
X-Groupsio-MsgNum: 146768
Content-Type: multipart/mixed; boundary="===============4455803319588952358=="

--===============4455803319588952358==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-dbusmock* to *0.22.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-dbusmock-upgrade-0.19-0.22.0.patch
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

--===============4455803319588952358==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-dev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/python_dbusmock-0.19-py3.9.egg-info -> /usr/lib/python3.9/site-packages/python_dbusmock-0.22.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/dbusmock/templates/bluez4.py /usr/lib/python3.9/site-packages/dbusmock/templates/__pycache__/bluez4.cpython-39.pyc"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-doc: FILELIST: directory renamed /usr/lib/python3.9/site-packages/python_dbusmock-0.19-py3.9.egg-info -> /usr/lib/python3.9/site-packages/python_dbusmock-0.22.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/dbusmock/templates/bluez4.py /usr/lib/python3.9/site-packages/dbusmock/templates/__pycache__/bluez4.cpython-39.pyc"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-locale: FILELIST: directory renamed /usr/lib/python3.9/site-packages/python_dbusmock-0.19-py3.9.egg-info -> /usr/lib/python3.9/site-packages/python_dbusmock-0.22.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/dbusmock/templates/bluez4.py /usr/lib/python3.9/site-packages/dbusmock/templates/__pycache__/bluez4.cpython-39.pyc"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-staticdev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/python_dbusmock-0.19-py3.9.egg-info -> /usr/lib/python3.9/site-packages/python_dbusmock-0.22.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/dbusmock/templates/bluez4.py /usr/lib/python3.9/site-packages/dbusmock/templates/__pycache__/bluez4.cpython-39.pyc"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock: FILELIST: directory renamed /usr/lib/python3.9/site-packages/python_dbusmock-0.19-py3.9.egg-info -> /usr/lib/python3.9/site-packages/python_dbusmock-0.22.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/dbusmock/templates/bluez4.py /usr/lib/python3.9/site-packages/dbusmock/templates/__pycache__/bluez4.cpython-39.pyc"
Changes to packages/core2-32-poky-linux/python3-dbusmock (sysroot):
  /usr/lib/python3.9/site-packages/python_dbusmock-0.22.0-py3.9.egg-info was added
  /usr/lib/python3.9/site-packages/python_dbusmock-0.22.0-py3.9.egg-info/dependency_links.txt was added
  /usr/lib/python3.9/site-packages/python_dbusmock-0.22.0-py3.9.egg-info/PKG-INFO was added
  /usr/lib/python3.9/site-packages/python_dbusmock-0.22.0-py3.9.egg-info/SOURCES.txt was added
  /usr/lib/python3.9/site-packages/python_dbusmock-0.22.0-py3.9.egg-info/top_level.txt was added
  /usr/lib/python3.9/site-packages/dbusmock/templates/bluez4.py was removed
  /usr/lib/python3.9/site-packages/dbusmock/templates/__pycache__/bluez4.cpython-39.pyc was removed
  /usr/lib/python3.9/site-packages/python_dbusmock-0.19-py3.9.egg-info was removed
  /usr/lib/python3.9/site-packages/python_dbusmock-0.19-py3.9.egg-info/dependency_links.txt was removed
  /usr/lib/python3.9/site-packages/python_dbusmock-0.19-py3.9.egg-info/PKG-INFO was removed
  /usr/lib/python3.9/site-packages/python_dbusmock-0.19-py3.9.egg-info/SOURCES.txt was removed
  /usr/lib/python3.9/site-packages/python_dbusmock-0.19-py3.9.egg-info/top_level.txt was removed

--===============4455803319588952358==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-dbusmock-upgrade-0.19-0.22.0.patch"

From 773c56fd585e52ea16bb46b62d3b5fc562250553 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 15 Jan 2021 05:35:24 +0000
Subject: [PATCH] python3-dbusmock: upgrade 0.19 -> 0.22.0

---
 .../{python3-dbusmock_0.19.bb => python3-dbusmock_0.22.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dbusmock_0.19.bb => python3-dbusmock_0.22.0.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.19.bb b/meta/recipes-devtools/python/python3-dbusmock_0.22.0.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-dbusmock_0.19.bb
rename to meta/recipes-devtools/python/python3-dbusmock_0.22.0.bb
index d297dbc1df..b1feee8416 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.19.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.22.0.bb
@@ -3,7 +3,7 @@ SUMMARY = "With this program/Python library you can easily create mock objects o
 LICENSE = "GPL-3.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI[sha256sum] = "497f30eed2fcd5deaa2633b9622e4e99af4bdfba4e972b350ba630bac6fc86c2"
+SRC_URI[sha256sum] = "2191919cc411fb94953b36e46bfd55ee5ad4162432ee0d0892bc2c4770ff5d7c"
 
 PYPI_PACKAGE = "python-dbusmock"
 
-- 
2.27.0


--===============4455803319588952358==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-dbusmock: PV changed from "0.19" to "0.22.0"
packages/core2-32-poky-linux/python3-dbusmock: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/python-dbusmock/python-dbusmock-0.19.tar.gz" to "https://files.pythonhosted.org/packages/source/p/python-dbusmock/python-dbusmock-0.22.0.tar.gz"
packages/core2-32-poky-linux/python3-dbusmock: PKGV changed from 0.19 [default] to 0.22.0 [default]
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-dbg: PV changed from "0.19" to "0.22.0"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-dbg: FILELIST: directory renamed /usr/lib/python3.9/site-packages/python_dbusmock-0.19-py3.9.egg-info -> /usr/lib/python3.9/site-packages/python_dbusmock-0.22.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/dbusmock/templates/__pycache__/bluez4.cpython-39.pyc /usr/lib/python3.9/site-packages/dbusmock/templates/bluez4.py"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-dbg: PKGV changed from 0.19 [default] to 0.22.0 [default]
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-dev: PV changed from "0.19" to "0.22.0"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-dev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/python_dbusmock-0.19-py3.9.egg-info -> /usr/lib/python3.9/site-packages/python_dbusmock-0.22.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/dbusmock/templates/__pycache__/bluez4.cpython-39.pyc /usr/lib/python3.9/site-packages/dbusmock/templates/bluez4.py"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-dev: PKGV changed from 0.19 [default] to 0.22.0 [default]
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-doc: PV changed from "0.19" to "0.22.0"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-doc: FILELIST: directory renamed /usr/lib/python3.9/site-packages/python_dbusmock-0.19-py3.9.egg-info -> /usr/lib/python3.9/site-packages/python_dbusmock-0.22.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/dbusmock/templates/__pycache__/bluez4.cpython-39.pyc /usr/lib/python3.9/site-packages/dbusmock/templates/bluez4.py"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-doc: PKGV changed from 0.19 [default] to 0.22.0 [default]
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-locale: PV changed from "0.19" to "0.22.0"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-locale: FILELIST: directory renamed /usr/lib/python3.9/site-packages/python_dbusmock-0.19-py3.9.egg-info -> /usr/lib/python3.9/site-packages/python_dbusmock-0.22.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/dbusmock/templates/__pycache__/bluez4.cpython-39.pyc /usr/lib/python3.9/site-packages/dbusmock/templates/bluez4.py"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-locale: PKGV changed from 0.19 [default] to 0.22.0 [default]
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-src: PV changed from "0.19" to "0.22.0"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-src: FILELIST: directory renamed /usr/lib/python3.9/site-packages/python_dbusmock-0.19-py3.9.egg-info -> /usr/lib/python3.9/site-packages/python_dbusmock-0.22.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/dbusmock/templates/__pycache__/bluez4.cpython-39.pyc /usr/lib/python3.9/site-packages/dbusmock/templates/bluez4.py"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-src: PKGV changed from 0.19 [default] to 0.22.0 [default]
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-staticdev: PV changed from "0.19" to "0.22.0"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-staticdev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/python_dbusmock-0.19-py3.9.egg-info -> /usr/lib/python3.9/site-packages/python_dbusmock-0.22.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/dbusmock/templates/__pycache__/bluez4.cpython-39.pyc /usr/lib/python3.9/site-packages/dbusmock/templates/bluez4.py"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-staticdev: PKGV changed from 0.19 [default] to 0.22.0 [default]
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock: PV changed from "0.19" to "0.22.0"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock: FILELIST: directory renamed /usr/lib/python3.9/site-packages/python_dbusmock-0.19-py3.9.egg-info -> /usr/lib/python3.9/site-packages/python_dbusmock-0.22.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/dbusmock/templates/__pycache__/bluez4.cpython-39.pyc /usr/lib/python3.9/site-packages/dbusmock/templates/bluez4.py"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock: PKGSIZE changed from 305165 to 278651 (-9%)
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock: PKGV changed from 0.19 [default] to 0.22.0 [default]
Changes to packages/core2-32-poky-linux/python3-dbusmock (sysroot):
  /usr/lib/python3.9/site-packages/python_dbusmock-0.22.0-py3.9.egg-info was added
  /usr/lib/python3.9/site-packages/python_dbusmock-0.22.0-py3.9.egg-info/dependency_links.txt was added
  /usr/lib/python3.9/site-packages/python_dbusmock-0.22.0-py3.9.egg-info/PKG-INFO was added
  /usr/lib/python3.9/site-packages/python_dbusmock-0.22.0-py3.9.egg-info/SOURCES.txt was added
  /usr/lib/python3.9/site-packages/python_dbusmock-0.22.0-py3.9.egg-info/top_level.txt was added
  /usr/lib/python3.9/site-packages/dbusmock/templates/bluez4.py was removed
  /usr/lib/python3.9/site-packages/dbusmock/templates/__pycache__/bluez4.cpython-39.pyc was removed
  /usr/lib/python3.9/site-packages/python_dbusmock-0.19-py3.9.egg-info was removed
  /usr/lib/python3.9/site-packages/python_dbusmock-0.19-py3.9.egg-info/dependency_links.txt was removed
  /usr/lib/python3.9/site-packages/python_dbusmock-0.19-py3.9.egg-info/PKG-INFO was removed
  /usr/lib/python3.9/site-packages/python_dbusmock-0.19-py3.9.egg-info/SOURCES.txt was removed
  /usr/lib/python3.9/site-packages/python_dbusmock-0.19-py3.9.egg-info/top_level.txt was removed

--===============4455803319588952358==--
