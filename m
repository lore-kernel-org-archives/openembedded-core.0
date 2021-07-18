Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.13272.1626600382280278719
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jul 2021 02:26:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-1.yocto.io (unknown [172.29.10.61])
	by mail.yoctoproject.org (Postfix) with ESMTP id 86F4238C135F
	for <openembedded-core@lists.openembedded.org>; Sun, 18 Jul 2021 09:26:21 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools: upgrading to 57.2.0 SUCCEEDED
Message-ID: <MADEUP.1692D86E0147A783.32641@lists.openembedded.org>
X-Groupsio-MsgNum: 153967
Content-Type: multipart/mixed; boundary="===============7869013349911722622=="

--===============7869013349911722622==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-setuptools* to *57.2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-upgrade-57.1.0-57.2.0.patch
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

--===============7869013349911722622==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-setuptools: PKGV changed from 57.1.0 [default] to 57.2.0 [default]
packages/core2-32-poky-linux/python3-setuptools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-57.1.0.tar.gz file://0001-change-shebang-to-python3.patch" to "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-57.2.0.tar.gz file://0001-change-shebang-to-python3.patch"
packages/core2-32-poky-linux/python3-setuptools: PV changed from "57.1.0" to "57.2.0"
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PKGV changed from 57.1.0 [default] to 57.2.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PV changed from "57.1.0" to "57.2.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dbg: PKGV changed from 57.1.0 [default] to 57.2.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dbg: PV changed from "57.1.0" to "57.2.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dev: PKGV changed from 57.1.0 [default] to 57.2.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dev: PV changed from "57.1.0" to "57.2.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-doc: PKGV changed from 57.1.0 [default] to 57.2.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-doc: PV changed from "57.1.0" to "57.2.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-locale: PKGV changed from 57.1.0 [default] to 57.2.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-locale: PV changed from "57.1.0" to "57.2.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-src: PKGV changed from 57.1.0 [default] to 57.2.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-src: PV changed from "57.1.0" to "57.2.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-staticdev: PKGV changed from 57.1.0 [default] to 57.2.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-staticdev: PV changed from "57.1.0" to "57.2.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PKGV changed from 57.1.0 [default] to 57.2.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PV changed from "57.1.0" to "57.2.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PKGSIZE changed from 3281287 to 3281337 (+0%)
Changes to packages/core2-32-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.9/site-packages/setuptools-57.1.0-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/setuptools-57.2.0-py3.9.egg-info
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.9/site-packages/setuptools-57.1.0-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/setuptools-57.2.0-py3.9.egg-info

--===============7869013349911722622==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.9/site-packages/setuptools-57.1.0-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/setuptools-57.2.0-py3.9.egg-info
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.9/site-packages/setuptools-57.1.0-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/setuptools-57.2.0-py3.9.egg-info

--===============7869013349911722622==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-setuptools-upgrade-57.1.0-57.2.0.patch"

From 544f72553bcea6bb62051d78f654949a75f656d4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 18 Jul 2021 08:07:33 +0000
Subject: [PATCH] python3-setuptools: upgrade 57.1.0 -> 57.2.0

---
 .../0001-conditionally-do-not-fetch-code-by-easy_install.patch  | 2 +-
 ...ython3-setuptools_57.1.0.bb => python3-setuptools_57.2.0.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_57.1.0.bb => python3-setuptools_57.2.0.bb} (94%)

diff --git a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index 1082fe79be..37cd6a541e 100644
--- a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From f6afc18e08a6c428ce8becd114c535a6840f1b9f Mon Sep 17 00:00:00 2001
+From d02c2cef9f0d04e7d47fbe90131c03cd3d53d3f8 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
diff --git a/meta/recipes-devtools/python/python3-setuptools_57.1.0.bb b/meta/recipes-devtools/python/python3-setuptools_57.2.0.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-setuptools_57.1.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_57.2.0.bb
index c066d8209f..b072609f13 100644
--- a/meta/recipes-devtools/python/python3-setuptools_57.1.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_57.2.0.bb
@@ -10,7 +10,7 @@ SRC_URI_append_class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 
 SRC_URI += "file://0001-change-shebang-to-python3.patch"
 
-SRC_URI[sha256sum] = "cfca9c97e7eebbc8abe18d5e5e962a08dcad55bb63afddd82d681de4d22a597b"
+SRC_URI[sha256sum] = "a7e88b9bbaece494162d697d19525c567ab60c85dd7e2fd90cb7dfe8d8129a62"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.27.0


--===============7869013349911722622==--
