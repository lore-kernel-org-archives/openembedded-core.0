Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.12523.1602843683226428071
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 8243738C178D
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:22 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] meson: upgrading to 0.55.3 SUCCEEDED
Message-ID: <MADEUP.163E71D69CFE2367.19966@lists.openembedded.org>
X-Groupsio-MsgNum: 143436
Content-Type: multipart/mixed; boundary="===============5676919589729862052=="

--===============5676919589729862052==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *meson* to *0.55.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-meson-upgrade-0.55.1-0.55.3.patch
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

--===============5676919589729862052==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/meson (sysroot):
  /usr/lib/python3.8/site-packages/meson-0.55.1-py3.8.egg-info moved to /usr/lib/python3.8/site-packages/meson-0.55.3-py3.8.egg-info
Changes to packages/x86_64-linux/meson-native (sysroot):
  /usr/lib/python3.8/site-packages/meson-0.55.1-py3.8.egg-info moved to /usr/lib/python3.8/site-packages/meson-0.55.3-py3.8.egg-info

--===============5676919589729862052==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/meson: PV changed from "0.55.1" to "0.55.3"
packages/core2-32-poky-linux/meson: PKGV changed from 0.55.1 [default] to 0.55.3 [default]
packages/core2-32-poky-linux/meson/meson-dbg: PV changed from "0.55.1" to "0.55.3"
packages/core2-32-poky-linux/meson/meson-dbg: PKGV changed from 0.55.1 [default] to 0.55.3 [default]
packages/core2-32-poky-linux/meson/meson-dev: PV changed from "0.55.1" to "0.55.3"
packages/core2-32-poky-linux/meson/meson-dev: PKGV changed from 0.55.1 [default] to 0.55.3 [default]
packages/core2-32-poky-linux/meson/meson-doc: PV changed from "0.55.1" to "0.55.3"
packages/core2-32-poky-linux/meson/meson-doc: PKGV changed from 0.55.1 [default] to 0.55.3 [default]
packages/core2-32-poky-linux/meson/meson-doc: PKGSIZE changed from 5343 to 5346 (+0%)
packages/core2-32-poky-linux/meson/meson-locale: PV changed from "0.55.1" to "0.55.3"
packages/core2-32-poky-linux/meson/meson-locale: PKGV changed from 0.55.1 [default] to 0.55.3 [default]
packages/core2-32-poky-linux/meson/meson-src: PV changed from "0.55.1" to "0.55.3"
packages/core2-32-poky-linux/meson/meson-src: PKGV changed from 0.55.1 [default] to 0.55.3 [default]
packages/core2-32-poky-linux/meson/meson-staticdev: PV changed from "0.55.1" to "0.55.3"
packages/core2-32-poky-linux/meson/meson-staticdev: PKGV changed from 0.55.1 [default] to 0.55.3 [default]
packages/core2-32-poky-linux/meson/meson: PV changed from "0.55.1" to "0.55.3"
packages/core2-32-poky-linux/meson/meson: PKGV changed from 0.55.1 [default] to 0.55.3 [default]
packages/core2-32-poky-linux/meson/meson: PKGSIZE changed from 4500388 to 4509462 (+0%)
Changes to packages/core2-32-poky-linux/meson (sysroot):
  /usr/lib/python3.8/site-packages/meson-0.55.1-py3.8.egg-info moved to /usr/lib/python3.8/site-packages/meson-0.55.3-py3.8.egg-info
Changes to packages/x86_64-linux/meson-native (sysroot):
  /usr/lib/python3.8/site-packages/meson-0.55.1-py3.8.egg-info moved to /usr/lib/python3.8/site-packages/meson-0.55.3-py3.8.egg-info

--===============5676919589729862052==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-meson-upgrade-0.55.1-0.55.3.patch"

From 4b3b0aedc7f52a745825eb5dcb877913fb8f0b09 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 03:50:17 +0000
Subject: [PATCH] meson: upgrade 0.55.1 -> 0.55.3

---
 meta/recipes-devtools/meson/meson.inc                         | 2 +-
 .../meson/meson/0001-Make-CPU-family-warnings-fatal.patch     | 4 ++--
 .../meson/0002-Support-building-allarch-recipes-again.patch   | 2 +-
 .../meson/{meson_0.55.1.bb => meson_0.55.3.bb}                | 0
 4 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/meson/{meson_0.55.1.bb => meson_0.55.3.bb} (100%)

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index 004189e36e..aed7414b78 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -16,7 +16,7 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://0001-modules-python.py-do-not-substitute-python-s-install.patch \
            file://0001-gnome.py-prefix-g-i-paths-with-PKG_CONFIG_SYSROOT_DI.patch \
            "
-SRC_URI[sha256sum] = "3b5741f884e04928bdfa1947467ff06afa6c98e623c25cef75adf71ca39ce080"
+SRC_URI[sha256sum] = "6bed2a25a128bbabe97cf40f63165ebe800e4fcb46db8ab7ef5c2b5789f092a5"
 
 SRC_URI_append_class-native = " \
     file://0001-Make-CPU-family-warnings-fatal.patch \
diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
index fbc03b8ca0..f030ef1b1c 100644
--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
@@ -1,4 +1,4 @@
-From 9311844b6c422479556e83b89a8e675ebcb2056c Mon Sep 17 00:00:00 2001
+From 0476b0ff0310b2d9e06bbdb8fc6e25a4a134d5b9 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 3 Jul 2018 13:59:09 +0100
 Subject: [PATCH] Make CPU family warnings fatal
@@ -25,7 +25,7 @@ index 219b62e..d1be65b 100644
          endian = literal['endian']
          if endian not in ('little', 'big'):
 diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
-index bf09a88..8eabe78 100644
+index 4e002be..4af5bbe 100644
 --- a/mesonbuild/environment.py
 +++ b/mesonbuild/environment.py
 @@ -375,9 +375,7 @@ def detect_cpu_family(compilers: CompilersDict) -> str:
diff --git a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
index 2d804740ad..0409c5767e 100644
--- a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
+++ b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
@@ -1,4 +1,4 @@
-From 38f59e256f760aa959c13f4c5713f87ff7addee5 Mon Sep 17 00:00:00 2001
+From 9fb6b5745e5569e4be7a7a49d96da250b3a620f5 Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Thu, 26 Jul 2018 16:32:49 +0200
 Subject: [PATCH] Support building allarch recipes again
diff --git a/meta/recipes-devtools/meson/meson_0.55.1.bb b/meta/recipes-devtools/meson/meson_0.55.3.bb
similarity index 100%
rename from meta/recipes-devtools/meson/meson_0.55.1.bb
rename to meta/recipes-devtools/meson/meson_0.55.3.bb
-- 
2.18.4


--===============5676919589729862052==--
