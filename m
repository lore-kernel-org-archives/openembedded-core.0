Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web08.39204.1605551303664222218
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2020 10:28:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-2.yocto.io (unknown [172.29.10.56])
	by mail.yoctoproject.org (Postfix) with ESMTP id 2BA5738C1283
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2020 18:28:23 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pycryptodome: upgrading to 3.9.9 SUCCEEDED
Message-ID: <MADEUP.164810678FE3D7F5.12355@lists.openembedded.org>
X-Groupsio-MsgNum: 144640
Content-Type: multipart/mixed; boundary="===============5919062897321956135=="

--===============5919062897321956135==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pycryptodome* to *3.9.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pycryptodome-upgrade-3.9.8-3.9.9.patch
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

--===============5919062897321956135==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-pycryptodome (sysroot):
  /usr/lib/python3.9/site-packages/pycryptodome-3.9.8-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/pycryptodome-3.9.9-py3.9.egg-info

--===============5919062897321956135==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-pycryptodome-upgrade-3.9.8-3.9.9.patch"

From 85cd1a7cdd13fd5ccfb2ffe18b0ce0c6dbb73d73 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 16 Nov 2020 14:35:11 +0000
Subject: [PATCH] python3-pycryptodome: upgrade 3.9.8 -> 3.9.9

---
 ...hon3-pycryptodome_3.9.8.bb => python3-pycryptodome_3.9.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pycryptodome_3.9.8.bb => python3-pycryptodome_3.9.9.bb} (38%)

diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.9.8.bb b/meta/recipes-devtools/python/python3-pycryptodome_3.9.9.bb
similarity index 38%
rename from meta/recipes-devtools/python/python3-pycryptodome_3.9.8.bb
rename to meta/recipes-devtools/python/python3-pycryptodome_3.9.9.bb
index 46e122072e..1e84ce4df7 100644
--- a/meta/recipes-devtools/python/python3-pycryptodome_3.9.8.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodome_3.9.9.bb
@@ -1,5 +1,5 @@
 require python-pycryptodome.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "0e24171cf01021bc5dc17d6a9d4f33a048f09d62cc3f62541e95ef104588bda4"
+SRC_URI[sha256sum] = "910e202a557e1131b1c1b3f17a63914d57aac55cf9fb9b51644962841c3995c4"
 
-- 
2.20.1


--===============5919062897321956135==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pycryptodome: PV changed from "3.9.8" to "3.9.9"
packages/core2-32-poky-linux/python3-pycryptodome: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pycryptodome/pycryptodome-3.9.8.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pycryptodome/pycryptodome-3.9.9.tar.gz"
packages/core2-32-poky-linux/python3-pycryptodome: PKGV changed from 3.9.8 [default] to 3.9.9 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-dbg: PV changed from "3.9.8" to "3.9.9"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-dbg: PKGV changed from 3.9.8 [default] to 3.9.9 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-dev: PV changed from "3.9.8" to "3.9.9"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-dev: PKGV changed from 3.9.8 [default] to 3.9.9 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-doc: PV changed from "3.9.8" to "3.9.9"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-doc: PKGV changed from 3.9.8 [default] to 3.9.9 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-locale: PV changed from "3.9.8" to "3.9.9"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-locale: PKGV changed from 3.9.8 [default] to 3.9.9 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-src: PV changed from "3.9.8" to "3.9.9"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-src: PKGV changed from 3.9.8 [default] to 3.9.9 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-staticdev: PV changed from "3.9.8" to "3.9.9"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-staticdev: PKGV changed from 3.9.8 [default] to 3.9.9 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: PV changed from "3.9.8" to "3.9.9"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: PKGSIZE changed from 34081877 to 34081965 (+0%)
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: PKGV changed from 3.9.8 [default] to 3.9.9 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome: PV changed from "3.9.8" to "3.9.9"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome: PKGSIZE changed from 3050676 to 3051079 (+0%)
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome: PKGV changed from 3.9.8 [default] to 3.9.9 [default]
Changes to packages/core2-32-poky-linux/python3-pycryptodome (sysroot):
  /usr/lib/python3.9/site-packages/pycryptodome-3.9.8-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/pycryptodome-3.9.9-py3.9.egg-info

--===============5919062897321956135==--
