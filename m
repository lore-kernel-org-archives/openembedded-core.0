Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.5773.1624805202312776029
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jun 2021 07:46:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [127.0.1.1] (unknown [172.29.10.115])
	by mail.yoctoproject.org (Postfix) with ESMTP id C31A438C08E7
	for <openembedded-core@lists.openembedded.org>; Sun, 27 Jun 2021 14:46:41 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Zang Ruochen <zangrc.fnst@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pbr: upgrading to 5.6.0 SUCCEEDED
Message-ID: <MADEUP.168C77B917D25C94.8895@lists.openembedded.org>
X-Groupsio-MsgNum: 153299
Content-Type: multipart/mixed; boundary="===============6362425826213912124=="

--===============6362425826213912124==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pbr* to *5.6.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pbr-upgrade-5.4.4-5.6.0.patch
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

--===============6362425826213912124==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-pbr (sysroot):
  /usr/lib/python3.9/site-packages/pbr-5.4.4-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/pbr-5.6.0-py3.9.egg-info

--===============6362425826213912124==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-pbr-upgrade-5.4.4-5.6.0.patch"

From 3bfb3e44797305cf3a5ed5525f8b6c9161776f83 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 27 Jun 2021 11:33:23 +0000
Subject: [PATCH] python3-pbr: upgrade 5.4.4 -> 5.6.0

---
 .../python/{python3-pbr_5.4.4.bb => python3-pbr_5.6.0.bb}      | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pbr_5.4.4.bb => python3-pbr_5.6.0.bb} (23%)

diff --git a/meta/recipes-devtools/python/python3-pbr_5.4.4.bb b/meta/recipes-devtools/python/python3-pbr_5.6.0.bb
similarity index 23%
rename from meta/recipes-devtools/python/python3-pbr_5.4.4.bb
rename to meta/recipes-devtools/python/python3-pbr_5.6.0.bb
index 6f335ea341..132e6e52b6 100644
--- a/meta/recipes-devtools/python/python3-pbr_5.4.4.bb
+++ b/meta/recipes-devtools/python/python3-pbr_5.6.0.bb
@@ -1,5 +1,4 @@
 inherit setuptools3
 require python-pbr.inc
 
-SRC_URI[md5sum] = "65cdc32e1a1ff56d481fc15aa8caf988"
-SRC_URI[sha256sum] = "139d2625547dbfa5fb0b81daebb39601c478c21956dc57e2e07b74450a8c506b"
+SRC_URI[sha256sum] = "42df03e7797b796625b1029c0400279c7c34fd7df24a7d7818a1abb5b38710dd"
-- 
2.17.1


--===============6362425826213912124==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pbr: PKGV changed from 5.4.4 [default] to 5.6.0 [default]
packages/core2-32-poky-linux/python3-pbr: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pbr/pbr-5.4.4.tar.gz file://0001-change-shebang-to-python3.patch" to "https://files.pythonhosted.org/packages/source/p/pbr/pbr-5.6.0.tar.gz file://0001-change-shebang-to-python3.patch"
packages/core2-32-poky-linux/python3-pbr: PV changed from "5.4.4" to "5.6.0"
packages/core2-32-poky-linux/python3-pbr/python3-pbr-dbg: PKGV changed from 5.4.4 [default] to 5.6.0 [default]
packages/core2-32-poky-linux/python3-pbr/python3-pbr-dbg: PV changed from "5.4.4" to "5.6.0"
packages/core2-32-poky-linux/python3-pbr/python3-pbr-dev: PKGV changed from 5.4.4 [default] to 5.6.0 [default]
packages/core2-32-poky-linux/python3-pbr/python3-pbr-dev: PV changed from "5.4.4" to "5.6.0"
packages/core2-32-poky-linux/python3-pbr/python3-pbr-doc: PKGV changed from 5.4.4 [default] to 5.6.0 [default]
packages/core2-32-poky-linux/python3-pbr/python3-pbr-doc: PV changed from "5.4.4" to "5.6.0"
packages/core2-32-poky-linux/python3-pbr/python3-pbr-locale: PKGV changed from 5.4.4 [default] to 5.6.0 [default]
packages/core2-32-poky-linux/python3-pbr/python3-pbr-locale: PV changed from "5.4.4" to "5.6.0"
packages/core2-32-poky-linux/python3-pbr/python3-pbr-src: PKGV changed from 5.4.4 [default] to 5.6.0 [default]
packages/core2-32-poky-linux/python3-pbr/python3-pbr-src: PV changed from "5.4.4" to "5.6.0"
packages/core2-32-poky-linux/python3-pbr/python3-pbr-staticdev: PKGV changed from 5.4.4 [default] to 5.6.0 [default]
packages/core2-32-poky-linux/python3-pbr/python3-pbr-staticdev: PV changed from "5.4.4" to "5.6.0"
packages/core2-32-poky-linux/python3-pbr/python3-pbr: PKGV changed from 5.4.4 [default] to 5.6.0 [default]
packages/core2-32-poky-linux/python3-pbr/python3-pbr: PKGSIZE changed from 497812 to 505477 (+2%)
packages/core2-32-poky-linux/python3-pbr/python3-pbr: PV changed from "5.4.4" to "5.6.0"
Changes to packages/core2-32-poky-linux/python3-pbr (sysroot):
  /usr/lib/python3.9/site-packages/pbr-5.4.4-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/pbr-5.6.0-py3.9.egg-info

--===============6362425826213912124==--
