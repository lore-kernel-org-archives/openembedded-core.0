Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.4691.1621074783939070372
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 May 2021 03:33:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 4BF1538C13A5
	for <openembedded-core@lists.openembedded.org>; Sat, 15 May 2021 10:33:03 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Zang Ruochen <zangrc.fnst@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-six: upgrading to 1.16.0 SUCCEEDED
Message-ID: <MADEUP.167F36ED6229AD9E.3509@lists.openembedded.org>
X-Groupsio-MsgNum: 151801
Content-Type: multipart/mixed; boundary="===============3944726635758076974=="

--===============3944726635758076974==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-six* to *1.16.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-six-upgrade-1.15.0-1.16.0.patch
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

--===============3944726635758076974==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-six (sysroot):
  /usr/lib/python3.9/site-packages/six-1.15.0-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/six-1.16.0-py3.9.egg-info

--===============3944726635758076974==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-six-upgrade-1.15.0-1.16.0.patch"

From 840e0f11cdecdc2b5773d867072edd31f050dd7e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 15 May 2021 05:19:28 +0000
Subject: [PATCH] python3-six: upgrade 1.15.0 -> 1.16.0

---
 .../python/{python3-six_1.15.0.bb => python3-six_1.16.0.bb}    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-six_1.15.0.bb => python3-six_1.16.0.bb} (23%)

diff --git a/meta/recipes-devtools/python/python3-six_1.15.0.bb b/meta/recipes-devtools/python/python3-six_1.16.0.bb
similarity index 23%
rename from meta/recipes-devtools/python/python3-six_1.15.0.bb
rename to meta/recipes-devtools/python/python3-six_1.16.0.bb
index 6c6f3f9629..1ba48d4f47 100644
--- a/meta/recipes-devtools/python/python3-six_1.15.0.bb
+++ b/meta/recipes-devtools/python/python3-six_1.16.0.bb
@@ -1,5 +1,4 @@
 inherit setuptools3
 require python-six.inc
 
-SRC_URI[md5sum] = "9f90a0eaa0ea7747fda01ca79d21ebcb"
-SRC_URI[sha256sum] = "30639c035cdb23534cd4aa2dd52c3bf48f06e5f4a941509c8bafd8ce11080259"
+SRC_URI[sha256sum] = "1e61c37477a1626458e36f7b1d82aa5c9b094fa4802892072e49de9c60c4c926"
-- 
2.27.0


--===============3944726635758076974==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-six: PV changed from "1.15.0" to "1.16.0"
packages/core2-32-poky-linux/python3-six: PKGV changed from 1.15.0 [default] to 1.16.0 [default]
packages/core2-32-poky-linux/python3-six: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/six/six-1.15.0.tar.gz" to "https://files.pythonhosted.org/packages/source/s/six/six-1.16.0.tar.gz"
packages/core2-32-poky-linux/python3-six/python3-six-dbg: PV changed from "1.15.0" to "1.16.0"
packages/core2-32-poky-linux/python3-six/python3-six-dbg: PKGV changed from 1.15.0 [default] to 1.16.0 [default]
packages/core2-32-poky-linux/python3-six/python3-six-dev: PV changed from "1.15.0" to "1.16.0"
packages/core2-32-poky-linux/python3-six/python3-six-dev: PKGV changed from 1.15.0 [default] to 1.16.0 [default]
packages/core2-32-poky-linux/python3-six/python3-six-doc: PV changed from "1.15.0" to "1.16.0"
packages/core2-32-poky-linux/python3-six/python3-six-doc: PKGV changed from 1.15.0 [default] to 1.16.0 [default]
packages/core2-32-poky-linux/python3-six/python3-six-locale: PV changed from "1.15.0" to "1.16.0"
packages/core2-32-poky-linux/python3-six/python3-six-locale: PKGV changed from 1.15.0 [default] to 1.16.0 [default]
packages/core2-32-poky-linux/python3-six/python3-six-src: PV changed from "1.15.0" to "1.16.0"
packages/core2-32-poky-linux/python3-six/python3-six-src: PKGV changed from 1.15.0 [default] to 1.16.0 [default]
packages/core2-32-poky-linux/python3-six/python3-six-staticdev: PV changed from "1.15.0" to "1.16.0"
packages/core2-32-poky-linux/python3-six/python3-six-staticdev: PKGV changed from 1.15.0 [default] to 1.16.0 [default]
packages/core2-32-poky-linux/python3-six/python3-six: PV changed from "1.15.0" to "1.16.0"
packages/core2-32-poky-linux/python3-six/python3-six: PKGSIZE changed from 63352 to 64305 (+2%)
packages/core2-32-poky-linux/python3-six/python3-six: PKGV changed from 1.15.0 [default] to 1.16.0 [default]
Changes to packages/core2-32-poky-linux/python3-six (sysroot):
  /usr/lib/python3.9/site-packages/six-1.15.0-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/six-1.16.0-py3.9.egg-info

--===============3944726635758076974==--
