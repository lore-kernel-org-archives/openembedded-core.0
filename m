Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.12424.1602843683752291991
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 9107C38C1795
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:22 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-git: upgrading to 3.1.9 SUCCEEDED
Message-ID: <MADEUP.163E71D6AF26C7D5.21580@lists.openembedded.org>
X-Groupsio-MsgNum: 143443
Content-Type: multipart/mixed; boundary="===============4146099095442042986=="

--===============4146099095442042986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-git* to *3.1.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-git-upgrade-3.1.7-3.1.9.patch
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

--===============4146099095442042986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-git (sysroot):
  /usr/lib/python3.8/site-packages/GitPython-3.1.7-py3.8.egg-info moved to /usr/lib/python3.8/site-packages/GitPython-3.1.9-py3.8.egg-info

--===============4146099095442042986==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-git-upgrade-3.1.7-3.1.9.patch"

From 816be40f1d386a600f76bb583294240d741274a2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 04:19:32 +0000
Subject: [PATCH] python3-git: upgrade 3.1.7 -> 3.1.9

---
 .../python/{python3-git_3.1.7.bb => python3-git_3.1.9.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-git_3.1.7.bb => python3-git_3.1.9.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.7.bb b/meta/recipes-devtools/python/python3-git_3.1.9.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-git_3.1.7.bb
rename to meta/recipes-devtools/python/python3-git_3.1.9.bb
index 6d1fc4b653..d0f071cccb 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.7.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.9.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "GitPython"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "2db287d71a284e22e5c2846042d0602465c7434d910406990d5b74df4afb0858"
+SRC_URI[sha256sum] = "a03f728b49ce9597a6655793207c6ab0da55519368ff5961e4a74ae475b9fa8e"
 
 DEPENDS += " ${PYTHON_PN}-gitdb"
 
-- 
2.18.4


--===============4146099095442042986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-git: PKGV changed from 3.1.7 [default] to 3.1.9 [default]
packages/core2-32-poky-linux/python3-git: PV changed from "3.1.7" to "3.1.9"
packages/core2-32-poky-linux/python3-git/python3-git-dbg: PKGV changed from 3.1.7 [default] to 3.1.9 [default]
packages/core2-32-poky-linux/python3-git/python3-git-dbg: PV changed from "3.1.7" to "3.1.9"
packages/core2-32-poky-linux/python3-git/python3-git-dev: PKGV changed from 3.1.7 [default] to 3.1.9 [default]
packages/core2-32-poky-linux/python3-git/python3-git-dev: PV changed from "3.1.7" to "3.1.9"
packages/core2-32-poky-linux/python3-git/python3-git-doc: PKGV changed from 3.1.7 [default] to 3.1.9 [default]
packages/core2-32-poky-linux/python3-git/python3-git-doc: PV changed from "3.1.7" to "3.1.9"
packages/core2-32-poky-linux/python3-git/python3-git-locale: PKGV changed from 3.1.7 [default] to 3.1.9 [default]
packages/core2-32-poky-linux/python3-git/python3-git-locale: PV changed from "3.1.7" to "3.1.9"
packages/core2-32-poky-linux/python3-git/python3-git-src: PKGV changed from 3.1.7 [default] to 3.1.9 [default]
packages/core2-32-poky-linux/python3-git/python3-git-src: PV changed from "3.1.7" to "3.1.9"
packages/core2-32-poky-linux/python3-git/python3-git-staticdev: PKGV changed from 3.1.7 [default] to 3.1.9 [default]
packages/core2-32-poky-linux/python3-git/python3-git-staticdev: PV changed from "3.1.7" to "3.1.9"
packages/core2-32-poky-linux/python3-git/python3-git: PKGV changed from 3.1.7 [default] to 3.1.9 [default]
packages/core2-32-poky-linux/python3-git/python3-git: PKGSIZE changed from 875885 to 881005 (+1%)
packages/core2-32-poky-linux/python3-git/python3-git: PV changed from "3.1.7" to "3.1.9"
Changes to packages/core2-32-poky-linux/python3-git (sysroot):
  /usr/lib/python3.8/site-packages/GitPython-3.1.7-py3.8.egg-info moved to /usr/lib/python3.8/site-packages/GitPython-3.1.9-py3.8.egg-info

--===============4146099095442042986==--
