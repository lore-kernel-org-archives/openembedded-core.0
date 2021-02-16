Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.5219.1613463848596552830
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 00:24:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id A77FB38C1289
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 08:24:10 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools: upgrading to 53.0.0 SUCCEEDED
Message-ID: <MADEUP.16642CD2E810533D.16989@lists.openembedded.org>
X-Groupsio-MsgNum: 148120
Content-Type: multipart/mixed; boundary="===============1917009696099265965=="

--===============1917009696099265965==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-setuptools* to *53.0.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-upgrade-52.0.0-53.0.0.patch
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

--===============1917009696099265965==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.9/site-packages/setuptools-52.0.0-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/setuptools-53.0.0-py3.9.egg-info
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.9/site-packages/setuptools-52.0.0-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/setuptools-53.0.0-py3.9.egg-info

--===============1917009696099265965==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-setuptools-upgrade-52.0.0-53.0.0.patch"

From 990f4a1ce25a97f9986a5110e2b2b3d2f0d828d3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Feb 2021 22:16:38 +0000
Subject: [PATCH] python3-setuptools: upgrade 52.0.0 -> 53.0.0

---
 ...0001-conditionally-do-not-fetch-code-by-easy_install.patch | 4 ++--
 ...hon3-setuptools_52.0.0.bb => python3-setuptools_53.0.0.bb} | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_52.0.0.bb => python3-setuptools_53.0.0.bb} (94%)

diff --git a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index 99c50e94cb..680edbe704 100644
--- a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From d2633b49275b20e7acf724567fe0189aab25771e Mon Sep 17 00:00:00 2001
+From 6380cc63f79abe8b8404c9be5ed5f213a70c8c6a Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
@@ -15,7 +15,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/setuptools/command/easy_install.py b/setuptools/command/easy_install.py
-index 9ec83b7..7e97a07 100644
+index eeb21b5..eca1edd 100644
 --- a/setuptools/command/easy_install.py
 +++ b/setuptools/command/easy_install.py
 @@ -636,6 +636,11 @@ class easy_install(Command):
diff --git a/meta/recipes-devtools/python/python3-setuptools_52.0.0.bb b/meta/recipes-devtools/python/python3-setuptools_53.0.0.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-setuptools_52.0.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_53.0.0.bb
index 118f416657..811c8a5900 100644
--- a/meta/recipes-devtools/python/python3-setuptools_52.0.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_53.0.0.bb
@@ -10,7 +10,7 @@ SRC_URI_append_class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 
 SRC_URI += "file://0001-change-shebang-to-python3.patch"
 
-SRC_URI[sha256sum] = "fb3a1ee622509550dbf1d419f241296169d7f09cb1eb5b1736f2f10965932b96"
+SRC_URI[sha256sum] = "1b18ef17d74ba97ac9c0e4b4265f123f07a8ae85d9cd093949fa056d3eeeead5"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.17.1


--===============1917009696099265965==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-setuptools: PV changed from "52.0.0" to "53.0.0"
packages/core2-32-poky-linux/python3-setuptools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-52.0.0.tar.gz file://0001-change-shebang-to-python3.patch" to "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-53.0.0.tar.gz file://0001-change-shebang-to-python3.patch"
packages/core2-32-poky-linux/python3-setuptools: PKGV changed from 52.0.0 [default] to 53.0.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PV changed from "52.0.0" to "53.0.0"
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PKGV changed from 52.0.0 [default] to 53.0.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dbg: PV changed from "52.0.0" to "53.0.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dbg: PKGV changed from 52.0.0 [default] to 53.0.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dev: PV changed from "52.0.0" to "53.0.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dev: PKGV changed from 52.0.0 [default] to 53.0.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-doc: PV changed from "52.0.0" to "53.0.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-doc: PKGV changed from 52.0.0 [default] to 53.0.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-locale: PV changed from "52.0.0" to "53.0.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-locale: PKGV changed from 52.0.0 [default] to 53.0.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-src: PV changed from "52.0.0" to "53.0.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-src: PKGV changed from 52.0.0 [default] to 53.0.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-staticdev: PV changed from "52.0.0" to "53.0.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-staticdev: PKGV changed from 52.0.0 [default] to 53.0.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PV changed from "52.0.0" to "53.0.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PKGSIZE changed from 3025566 to 3025549 (-0%)
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PKGV changed from 52.0.0 [default] to 53.0.0 [default]
Changes to packages/core2-32-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.9/site-packages/setuptools-52.0.0-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/setuptools-53.0.0-py3.9.egg-info
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.9/site-packages/setuptools-52.0.0-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/setuptools-53.0.0-py3.9.egg-info

--===============1917009696099265965==--
