Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.1290.1618510599610507745
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 2FA0A38C13DC
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:39 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dbusmock: upgrading to 0.23.0 SUCCEEDED
Message-ID: <MADEUP.16761AD0E7B36206.4047@lists.openembedded.org>
X-Groupsio-MsgNum: 150515
Content-Type: multipart/mixed; boundary="===============2485446736079548572=="

--===============2485446736079548572==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-dbusmock* to *0.23.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-dbusmock-upgrade-0.22.0-0.23.0.patch
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

--===============2485446736079548572==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-dev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/python_dbusmock-0.22.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/python_dbusmock-0.23.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/dbusmock/templates/systemd.py /usr/lib/python3.9/site-packages/dbusmock/templates/__pycache__/accounts_service.cpython-39.pyc /usr/lib/python3.9/site-packages/dbusmock/templates/accounts_service.py /usr/lib/python3.9/site-packages/dbusmock/templates/__pycache__/systemd.cpython-39.pyc"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-doc: FILELIST: directory renamed /usr/lib/python3.9/site-packages/python_dbusmock-0.22.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/python_dbusmock-0.23.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/dbusmock/templates/systemd.py /usr/lib/python3.9/site-packages/dbusmock/templates/__pycache__/accounts_service.cpython-39.pyc /usr/lib/python3.9/site-packages/dbusmock/templates/accounts_service.py /usr/lib/python3.9/site-packages/dbusmock/templates/__pycache__/systemd.cpython-39.pyc"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-locale: FILELIST: directory renamed /usr/lib/python3.9/site-packages/python_dbusmock-0.22.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/python_dbusmock-0.23.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/dbusmock/templates/systemd.py /usr/lib/python3.9/site-packages/dbusmock/templates/__pycache__/accounts_service.cpython-39.pyc /usr/lib/python3.9/site-packages/dbusmock/templates/accounts_service.py /usr/lib/python3.9/site-packages/dbusmock/templates/__pycache__/systemd.cpython-39.pyc"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-staticdev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/python_dbusmock-0.22.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/python_dbusmock-0.23.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/dbusmock/templates/systemd.py /usr/lib/python3.9/site-packages/dbusmock/templates/__pycache__/accounts_service.cpython-39.pyc /usr/lib/python3.9/site-packages/dbusmock/templates/accounts_service.py /usr/lib/python3.9/site-packages/dbusmock/templates/__pycache__/systemd.cpython-39.pyc"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock: PKGSIZE changed from 278651 to 321258 (+15%)
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock: FILELIST: directory renamed /usr/lib/python3.9/site-packages/python_dbusmock-0.22.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/python_dbusmock-0.23.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/dbusmock/templates/systemd.py /usr/lib/python3.9/site-packages/dbusmock/templates/__pycache__/accounts_service.cpython-39.pyc /usr/lib/python3.9/site-packages/dbusmock/templates/accounts_service.py /usr/lib/python3.9/site-packages/dbusmock/templates/__pycache__/systemd.cpython-39.pyc"
Changes to packages/core2-32-poky-linux/python3-dbusmock (sysroot):
  /usr/lib/python3.9/site-packages/python_dbusmock-0.22.0-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/python_dbusmock-0.23.0-py3.9.egg-info
  /usr/lib/python3.9/site-packages/dbusmock/templates/accounts_service.py was added
  /usr/lib/python3.9/site-packages/dbusmock/templates/__pycache__/accounts_service.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/dbusmock/templates/__pycache__/systemd.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/dbusmock/templates/systemd.py was added

--===============2485446736079548572==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-dbusmock-upgrade-0.22.0-0.23.0.patch"

From 75aead5491405798f219ac93684df1dadc149da8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Apr 2021 06:14:35 +0000
Subject: [PATCH] python3-dbusmock: upgrade 0.22.0 -> 0.23.0

---
 .../{python3-dbusmock_0.22.0.bb => python3-dbusmock_0.23.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dbusmock_0.22.0.bb => python3-dbusmock_0.23.0.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.22.0.bb b/meta/recipes-devtools/python/python3-dbusmock_0.23.0.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-dbusmock_0.22.0.bb
rename to meta/recipes-devtools/python/python3-dbusmock_0.23.0.bb
index 0b87ab0380..80990d8fbb 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.22.0.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.23.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/python-dbusmock/"
 LICENSE = "GPL-3.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI[sha256sum] = "2191919cc411fb94953b36e46bfd55ee5ad4162432ee0d0892bc2c4770ff5d7c"
+SRC_URI[sha256sum] = "8c0b873a3f23869b416b51deeec39b3d5ab4c9875b705fc90ae917e4969c2574"
 
 PYPI_PACKAGE = "python-dbusmock"
 
-- 
2.27.0


--===============2485446736079548572==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-dbusmock: PV changed from "0.22.0" to "0.23.0"
packages/core2-32-poky-linux/python3-dbusmock: PKGV changed from 0.22.0 [default] to 0.23.0 [default]
packages/core2-32-poky-linux/python3-dbusmock: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/python-dbusmock/python-dbusmock-0.22.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/python-dbusmock/python-dbusmock-0.23.0.tar.gz"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-dbg: FILELIST: directory renamed /usr/lib/python3.9/site-packages/python_dbusmock-0.22.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/python_dbusmock-0.23.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/dbusmock/templates/accounts_service.py /usr/lib/python3.9/site-packages/dbusmock/templates/systemd.py /usr/lib/python3.9/site-packages/dbusmock/templates/__pycache__/accounts_service.cpython-39.pyc /usr/lib/python3.9/site-packages/dbusmock/templates/__pycache__/systemd.cpython-39.pyc"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-dbg: PV changed from "0.22.0" to "0.23.0"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-dbg: PKGV changed from 0.22.0 [default] to 0.23.0 [default]
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-dev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/python_dbusmock-0.22.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/python_dbusmock-0.23.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/dbusmock/templates/accounts_service.py /usr/lib/python3.9/site-packages/dbusmock/templates/systemd.py /usr/lib/python3.9/site-packages/dbusmock/templates/__pycache__/accounts_service.cpython-39.pyc /usr/lib/python3.9/site-packages/dbusmock/templates/__pycache__/systemd.cpython-39.pyc"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-dev: PV changed from "0.22.0" to "0.23.0"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-dev: PKGV changed from 0.22.0 [default] to 0.23.0 [default]
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-doc: FILELIST: directory renamed /usr/lib/python3.9/site-packages/python_dbusmock-0.22.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/python_dbusmock-0.23.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/dbusmock/templates/accounts_service.py /usr/lib/python3.9/site-packages/dbusmock/templates/systemd.py /usr/lib/python3.9/site-packages/dbusmock/templates/__pycache__/accounts_service.cpython-39.pyc /usr/lib/python3.9/site-packages/dbusmock/templates/__pycache__/systemd.cpython-39.pyc"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-doc: PV changed from "0.22.0" to "0.23.0"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-doc: PKGV changed from 0.22.0 [default] to 0.23.0 [default]
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-locale: FILELIST: directory renamed /usr/lib/python3.9/site-packages/python_dbusmock-0.22.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/python_dbusmock-0.23.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/dbusmock/templates/accounts_service.py /usr/lib/python3.9/site-packages/dbusmock/templates/systemd.py /usr/lib/python3.9/site-packages/dbusmock/templates/__pycache__/accounts_service.cpython-39.pyc /usr/lib/python3.9/site-packages/dbusmock/templates/__pycache__/systemd.cpython-39.pyc"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-locale: PV changed from "0.22.0" to "0.23.0"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-locale: PKGV changed from 0.22.0 [default] to 0.23.0 [default]
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-src: FILELIST: directory renamed /usr/lib/python3.9/site-packages/python_dbusmock-0.22.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/python_dbusmock-0.23.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/dbusmock/templates/accounts_service.py /usr/lib/python3.9/site-packages/dbusmock/templates/systemd.py /usr/lib/python3.9/site-packages/dbusmock/templates/__pycache__/accounts_service.cpython-39.pyc /usr/lib/python3.9/site-packages/dbusmock/templates/__pycache__/systemd.cpython-39.pyc"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-src: PV changed from "0.22.0" to "0.23.0"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-src: PKGV changed from 0.22.0 [default] to 0.23.0 [default]
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-staticdev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/python_dbusmock-0.22.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/python_dbusmock-0.23.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/dbusmock/templates/accounts_service.py /usr/lib/python3.9/site-packages/dbusmock/templates/systemd.py /usr/lib/python3.9/site-packages/dbusmock/templates/__pycache__/accounts_service.cpython-39.pyc /usr/lib/python3.9/site-packages/dbusmock/templates/__pycache__/systemd.cpython-39.pyc"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-staticdev: PV changed from "0.22.0" to "0.23.0"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-staticdev: PKGV changed from 0.22.0 [default] to 0.23.0 [default]
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock: FILELIST: directory renamed /usr/lib/python3.9/site-packages/python_dbusmock-0.22.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/python_dbusmock-0.23.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/dbusmock/templates/accounts_service.py /usr/lib/python3.9/site-packages/dbusmock/templates/systemd.py /usr/lib/python3.9/site-packages/dbusmock/templates/__pycache__/accounts_service.cpython-39.pyc /usr/lib/python3.9/site-packages/dbusmock/templates/__pycache__/systemd.cpython-39.pyc"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock: PV changed from "0.22.0" to "0.23.0"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock: PKGSIZE changed from 278651 to 321258 (+15%)
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock: PKGV changed from 0.22.0 [default] to 0.23.0 [default]
Changes to packages/core2-32-poky-linux/python3-dbusmock (sysroot):
  /usr/lib/python3.9/site-packages/python_dbusmock-0.22.0-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/python_dbusmock-0.23.0-py3.9.egg-info
  /usr/lib/python3.9/site-packages/dbusmock/templates/accounts_service.py was added
  /usr/lib/python3.9/site-packages/dbusmock/templates/__pycache__/accounts_service.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/dbusmock/templates/__pycache__/systemd.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/dbusmock/templates/systemd.py was added

--===============2485446736079548572==--
