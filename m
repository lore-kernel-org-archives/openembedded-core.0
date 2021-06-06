Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web08.25618.1623000257572232815
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Jun 2021 10:24:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id 2038838C127E
	for <openembedded-core@lists.openembedded.org>; Sun,  6 Jun 2021 17:24:17 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-magic: upgrading to 0.4.24 SUCCEEDED
Message-ID: <MADEUP.16860E22B7FD0EA7.27789@lists.openembedded.org>
X-Groupsio-MsgNum: 152712
Content-Type: multipart/mixed; boundary="===============0877948412110964258=="

--===============0877948412110964258==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-magic* to *0.4.24* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-magic-upgrade-0.4.22-0.4.24.patch
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

--===============0877948412110964258==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-magic/python3-magic-dev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/python_magic-0.4.22-py3.9.egg-info -> /usr/lib/python3.9/site-packages/python_magic-0.4.24-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/magic/py.typed"
packages/core2-32-poky-linux/python3-magic/python3-magic-doc: FILELIST: directory renamed /usr/lib/python3.9/site-packages/python_magic-0.4.22-py3.9.egg-info -> /usr/lib/python3.9/site-packages/python_magic-0.4.24-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/magic/py.typed"
packages/core2-32-poky-linux/python3-magic/python3-magic-locale: FILELIST: directory renamed /usr/lib/python3.9/site-packages/python_magic-0.4.22-py3.9.egg-info -> /usr/lib/python3.9/site-packages/python_magic-0.4.24-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/magic/py.typed"
packages/core2-32-poky-linux/python3-magic/python3-magic-staticdev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/python_magic-0.4.22-py3.9.egg-info -> /usr/lib/python3.9/site-packages/python_magic-0.4.24-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/magic/py.typed"
packages/core2-32-poky-linux/python3-magic/python3-magic: FILELIST: directory renamed /usr/lib/python3.9/site-packages/python_magic-0.4.22-py3.9.egg-info -> /usr/lib/python3.9/site-packages/python_magic-0.4.24-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/magic/py.typed"
Changes to packages/core2-32-poky-linux/python3-magic (sysroot):
  /usr/lib/python3.9/site-packages/python_magic-0.4.22-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/python_magic-0.4.24-py3.9.egg-info
  /usr/lib/python3.9/site-packages/magic/py.typed was added

--===============0877948412110964258==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-magic-upgrade-0.4.22-0.4.24.patch"

From 2384e949fdc2adf116c7d3e842a4d159a0511716 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 6 Jun 2021 09:14:40 +0000
Subject: [PATCH] python3-magic: upgrade 0.4.22 -> 0.4.24

---
 .../python/{python3-magic_0.4.22.bb => python3-magic_0.4.24.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-magic_0.4.22.bb => python3-magic_0.4.24.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-magic_0.4.22.bb b/meta/recipes-devtools/python/python3-magic_0.4.24.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-magic_0.4.22.bb
rename to meta/recipes-devtools/python/python3-magic_0.4.24.bb
index b828927599..a54bf2431c 100644
--- a/meta/recipes-devtools/python/python3-magic_0.4.22.bb
+++ b/meta/recipes-devtools/python/python3-magic_0.4.24.bb
@@ -11,7 +11,7 @@ PYPI_PACKAGE = "python-magic"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "ca884349f2c92ce830e3f498c5b7c7051fe2942c3ee4332f65213b8ebff15a62"
+SRC_URI[sha256sum] = "de800df9fb50f8ec5974761054a708af6e4246b03b4bdaee993f948947b0ebcf"
 
 RDEPENDS_${PN} += "file \
                    ${PYTHON_PN}-ctypes \
-- 
2.17.1


--===============0877948412110964258==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-magic: PV changed from "0.4.22" to "0.4.24"
packages/core2-32-poky-linux/python3-magic: PKGV changed from 0.4.22 [default] to 0.4.24 [default]
packages/core2-32-poky-linux/python3-magic: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/python-magic/python-magic-0.4.22.tar.gz" to "https://files.pythonhosted.org/packages/source/p/python-magic/python-magic-0.4.24.tar.gz"
packages/core2-32-poky-linux/python3-magic/python3-magic-dbg: PV changed from "0.4.22" to "0.4.24"
packages/core2-32-poky-linux/python3-magic/python3-magic-dbg: PKGV changed from 0.4.22 [default] to 0.4.24 [default]
packages/core2-32-poky-linux/python3-magic/python3-magic-dbg: FILELIST: directory renamed /usr/lib/python3.9/site-packages/python_magic-0.4.22-py3.9.egg-info -> /usr/lib/python3.9/site-packages/python_magic-0.4.24-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/magic/py.typed"
packages/core2-32-poky-linux/python3-magic/python3-magic-dev: PV changed from "0.4.22" to "0.4.24"
packages/core2-32-poky-linux/python3-magic/python3-magic-dev: PKGV changed from 0.4.22 [default] to 0.4.24 [default]
packages/core2-32-poky-linux/python3-magic/python3-magic-dev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/python_magic-0.4.22-py3.9.egg-info -> /usr/lib/python3.9/site-packages/python_magic-0.4.24-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/magic/py.typed"
packages/core2-32-poky-linux/python3-magic/python3-magic-doc: PV changed from "0.4.22" to "0.4.24"
packages/core2-32-poky-linux/python3-magic/python3-magic-doc: PKGV changed from 0.4.22 [default] to 0.4.24 [default]
packages/core2-32-poky-linux/python3-magic/python3-magic-doc: FILELIST: directory renamed /usr/lib/python3.9/site-packages/python_magic-0.4.22-py3.9.egg-info -> /usr/lib/python3.9/site-packages/python_magic-0.4.24-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/magic/py.typed"
packages/core2-32-poky-linux/python3-magic/python3-magic-locale: PV changed from "0.4.22" to "0.4.24"
packages/core2-32-poky-linux/python3-magic/python3-magic-locale: PKGV changed from 0.4.22 [default] to 0.4.24 [default]
packages/core2-32-poky-linux/python3-magic/python3-magic-locale: FILELIST: directory renamed /usr/lib/python3.9/site-packages/python_magic-0.4.22-py3.9.egg-info -> /usr/lib/python3.9/site-packages/python_magic-0.4.24-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/magic/py.typed"
packages/core2-32-poky-linux/python3-magic/python3-magic-src: PV changed from "0.4.22" to "0.4.24"
packages/core2-32-poky-linux/python3-magic/python3-magic-src: PKGV changed from 0.4.22 [default] to 0.4.24 [default]
packages/core2-32-poky-linux/python3-magic/python3-magic-src: FILELIST: directory renamed /usr/lib/python3.9/site-packages/python_magic-0.4.22-py3.9.egg-info -> /usr/lib/python3.9/site-packages/python_magic-0.4.24-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/magic/py.typed"
packages/core2-32-poky-linux/python3-magic/python3-magic-staticdev: PV changed from "0.4.22" to "0.4.24"
packages/core2-32-poky-linux/python3-magic/python3-magic-staticdev: PKGV changed from 0.4.22 [default] to 0.4.24 [default]
packages/core2-32-poky-linux/python3-magic/python3-magic-staticdev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/python_magic-0.4.22-py3.9.egg-info -> /usr/lib/python3.9/site-packages/python_magic-0.4.24-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/magic/py.typed"
packages/core2-32-poky-linux/python3-magic/python3-magic: PV changed from "0.4.22" to "0.4.24"
packages/core2-32-poky-linux/python3-magic/python3-magic: PKGV changed from 0.4.22 [default] to 0.4.24 [default]
packages/core2-32-poky-linux/python3-magic/python3-magic: FILELIST: directory renamed /usr/lib/python3.9/site-packages/python_magic-0.4.22-py3.9.egg-info -> /usr/lib/python3.9/site-packages/python_magic-0.4.24-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/magic/py.typed"
packages/core2-32-poky-linux/python3-magic/python3-magic: PKGSIZE changed from 50256 to 50166 (-0%)
Changes to packages/core2-32-poky-linux/python3-magic (sysroot):
  /usr/lib/python3.9/site-packages/python_magic-0.4.22-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/python_magic-0.4.24-py3.9.egg-info
  /usr/lib/python3.9/site-packages/magic/py.typed was added

--===============0877948412110964258==--
