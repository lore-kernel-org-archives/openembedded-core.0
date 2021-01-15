Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.722.1610713822916136885
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 04:30:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 189BC38C1292
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 12:30:22 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] meson: upgrading to 0.56.2 SUCCEEDED
Message-ID: <MADEUP.165A67B027A7503E.32579@lists.openembedded.org>
X-Groupsio-MsgNum: 146761
Content-Type: multipart/mixed; boundary="===============0534263538933940068=="

--===============0534263538933940068==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *meson* to *0.56.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-meson-upgrade-0.56.0-0.56.2.patch
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

--===============0534263538933940068==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/meson (sysroot):
  /usr/lib/python3.9/site-packages/meson-0.56.0-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/meson-0.56.2-py3.9.egg-info
Changes to packages/x86_64-linux/meson-native (sysroot):
  /usr/lib/python3.9/site-packages/meson-0.56.0-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/meson-0.56.2-py3.9.egg-info

--===============0534263538933940068==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-meson-upgrade-0.56.0-0.56.2.patch"

From 8f98df4c3d0fdd74baaeb6c6fe8f72321ac0e0f5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 15 Jan 2021 05:10:26 +0000
Subject: [PATCH] meson: upgrade 0.56.0 -> 0.56.2

---
 meta/recipes-devtools/meson/meson.inc                       | 2 +-
 .../meson/meson/0001-Make-CPU-family-warnings-fatal.patch   | 2 +-
 .../meson/0002-Support-building-allarch-recipes-again.patch | 6 +++---
 .../meson/{meson_0.56.0.bb => meson_0.56.2.bb}              | 0
 4 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/meson/{meson_0.56.0.bb => meson_0.56.2.bb} (100%)

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index 2d3adbdb1a..d0ebec9911 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -16,7 +16,7 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://0001-modules-python.py-do-not-substitute-python-s-install.patch \
            file://0001-gnome.py-prefix-g-i-paths-with-PKG_CONFIG_SYSROOT_DI.patch \
            "
-SRC_URI[sha256sum] = "291dd38ff1cd55fcfca8fc985181dd39be0d3e5826e5f0013bf867be40117213"
+SRC_URI[sha256sum] = "3cb8bdb91383f7f8da642f916e4c44066a29262caa499341e2880f010edb87f4"
 
 SRC_URI_append_class-native = " \
     file://0001-Make-CPU-family-warnings-fatal.patch \
diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
index 86edcb5241..edd262df5a 100644
--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
@@ -1,4 +1,4 @@
-From 110a525e5ebed2fca138d72da493c39510311c1f Mon Sep 17 00:00:00 2001
+From 248d17b7221e7ebc9d84154eac11ae4ebb5189ab Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 3 Jul 2018 13:59:09 +0100
 Subject: [PATCH] Make CPU family warnings fatal
diff --git a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
index 2d804740ad..2bbd2c149c 100644
--- a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
+++ b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
@@ -1,4 +1,4 @@
-From 38f59e256f760aa959c13f4c5713f87ff7addee5 Mon Sep 17 00:00:00 2001
+From 3c0d3d1a32d4a66aa0b7ab9af3e975243855a1db Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Thu, 26 Jul 2018 16:32:49 +0200
 Subject: [PATCH] Support building allarch recipes again
@@ -13,10 +13,10 @@ Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
-index d1be65b..90f3573 100644
+index 5ba3a1a..0bf4969 100644
 --- a/mesonbuild/envconfig.py
 +++ b/mesonbuild/envconfig.py
-@@ -36,6 +36,7 @@ _T = T.TypeVar('_T')
+@@ -38,6 +38,7 @@ _T = T.TypeVar('_T')
  
  
  known_cpu_families = (
diff --git a/meta/recipes-devtools/meson/meson_0.56.0.bb b/meta/recipes-devtools/meson/meson_0.56.2.bb
similarity index 100%
rename from meta/recipes-devtools/meson/meson_0.56.0.bb
rename to meta/recipes-devtools/meson/meson_0.56.2.bb
-- 
2.27.0


--===============0534263538933940068==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/meson: PV changed from "0.56.0" to "0.56.2"
packages/core2-32-poky-linux/meson: PKGV changed from 0.56.0 [default] to 0.56.2 [default]
packages/core2-32-poky-linux/meson: SRC_URI changed from "https://github.com/mesonbuild/meson/releases/download/0.56.0/meson-0.56.0.tar.gz file://0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch file://0003-native_bindir.patch file://0001-python-module-do-not-manipulate-the-environment-when.patch file://disable-rpath-handling.patch file://cross-prop-default.patch file://0001-modules-python.py-do-not-substitute-python-s-install.patch file://0001-gnome.py-prefix-g-i-paths-with-PKG_CONFIG_SYSROOT_DI.patch" to "https://github.com/mesonbuild/meson/releases/download/0.56.2/meson-0.56.2.tar.gz file://0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch file://0003-native_bindir.patch file://0001-python-module-do-not-manipulate-the-environment-when.patch file://disable-rpath-handling.patch file://cross-prop-default.patch file://0001-modules-python.py-do-not-substitute-python-s-install.patch file://0001-gnome.py-prefix-g-i-paths-with-PKG_CONFIG_SYSROOT_DI.patch"
packages/core2-32-poky-linux/meson/meson-dbg: PV changed from "0.56.0" to "0.56.2"
packages/core2-32-poky-linux/meson/meson-dbg: PKGV changed from 0.56.0 [default] to 0.56.2 [default]
packages/core2-32-poky-linux/meson/meson-dev: PV changed from "0.56.0" to "0.56.2"
packages/core2-32-poky-linux/meson/meson-dev: PKGV changed from 0.56.0 [default] to 0.56.2 [default]
packages/core2-32-poky-linux/meson/meson-doc: PV changed from "0.56.0" to "0.56.2"
packages/core2-32-poky-linux/meson/meson-doc: PKGV changed from 0.56.0 [default] to 0.56.2 [default]
packages/core2-32-poky-linux/meson/meson-locale: PV changed from "0.56.0" to "0.56.2"
packages/core2-32-poky-linux/meson/meson-locale: PKGV changed from 0.56.0 [default] to 0.56.2 [default]
packages/core2-32-poky-linux/meson/meson-src: PV changed from "0.56.0" to "0.56.2"
packages/core2-32-poky-linux/meson/meson-src: PKGV changed from 0.56.0 [default] to 0.56.2 [default]
packages/core2-32-poky-linux/meson/meson-staticdev: PV changed from "0.56.0" to "0.56.2"
packages/core2-32-poky-linux/meson/meson-staticdev: PKGV changed from 0.56.0 [default] to 0.56.2 [default]
packages/core2-32-poky-linux/meson/meson: PV changed from "0.56.0" to "0.56.2"
packages/core2-32-poky-linux/meson/meson: PKGSIZE changed from 4766891 to 4775882 (+0%)
packages/core2-32-poky-linux/meson/meson: PKGV changed from 0.56.0 [default] to 0.56.2 [default]
Changes to packages/core2-32-poky-linux/meson (sysroot):
  /usr/lib/python3.9/site-packages/meson-0.56.0-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/meson-0.56.2-py3.9.egg-info
Changes to packages/x86_64-linux/meson-native (sysroot):
  /usr/lib/python3.9/site-packages/meson-0.56.0-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/meson-0.56.2-py3.9.egg-info

--===============0534263538933940068==--
