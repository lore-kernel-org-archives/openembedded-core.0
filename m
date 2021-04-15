Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web08.1306.1618510599802092869
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 2DA8738C13D8
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:39 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cython: upgrading to 0.29.23 SUCCEEDED
Message-ID: <MADEUP.16761AD0FFAC95F6.12681@lists.openembedded.org>
X-Groupsio-MsgNum: 150525
Content-Type: multipart/mixed; boundary="===============5045690437274203608=="

--===============5045690437274203608==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-cython* to *0.29.23* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-cython-upgrade-0.29.22-0.29.23.patch
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

--===============5045690437274203608==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-cython (sysroot):
  /usr/lib/python3.9/site-packages/Cython-0.29.22-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/Cython-0.29.23-py3.9.egg-info

--===============5045690437274203608==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-cython: PKGV changed from 0.29.22 [default] to 0.29.23 [default]
packages/core2-32-poky-linux/python3-cython: PV changed from "0.29.22" to "0.29.23"
packages/core2-32-poky-linux/python3-cython: SRC_URI changed from "https://files.pythonhosted.org/packages/source/C/Cython/Cython-0.29.22.tar.gz" to "https://files.pythonhosted.org/packages/source/C/Cython/Cython-0.29.23.tar.gz"
packages/core2-32-poky-linux/python3-cython/python3-cython-dbg: PKGV changed from 0.29.22 [default] to 0.29.23 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython-dbg: PV changed from "0.29.22" to "0.29.23"
packages/core2-32-poky-linux/python3-cython/python3-cython-dbg: PKGSIZE changed from 8539632 to 8540500 (+0%)
packages/core2-32-poky-linux/python3-cython/python3-cython-dev: PKGV changed from 0.29.22 [default] to 0.29.23 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython-dev: PV changed from "0.29.22" to "0.29.23"
packages/core2-32-poky-linux/python3-cython/python3-cython-doc: PKGV changed from 0.29.22 [default] to 0.29.23 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython-doc: PV changed from "0.29.22" to "0.29.23"
packages/core2-32-poky-linux/python3-cython/python3-cython-locale: PKGV changed from 0.29.22 [default] to 0.29.23 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython-locale: PV changed from "0.29.22" to "0.29.23"
packages/core2-32-poky-linux/python3-cython/python3-cython-src: PKGV changed from 0.29.22 [default] to 0.29.23 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython-src: PV changed from "0.29.22" to "0.29.23"
packages/core2-32-poky-linux/python3-cython/python3-cython-src: PKGSIZE changed from 8488652 to 8489141 (+0%)
packages/core2-32-poky-linux/python3-cython/python3-cython-staticdev: PKGV changed from 0.29.22 [default] to 0.29.23 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython-staticdev: PV changed from "0.29.22" to "0.29.23"
packages/core2-32-poky-linux/python3-cython/python3-cython: PKGV changed from 0.29.22 [default] to 0.29.23 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython: PV changed from "0.29.22" to "0.29.23"
packages/core2-32-poky-linux/python3-cython/python3-cython: PKGSIZE changed from 8547483 to 8548382 (+0%)
Changes to packages/core2-32-poky-linux/python3-cython (sysroot):
  /usr/lib/python3.9/site-packages/Cython-0.29.22-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/Cython-0.29.23-py3.9.egg-info

--===============5045690437274203608==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-cython-upgrade-0.29.22-0.29.23.patch"

From c1b6d5f6d784425e99c0814bc37ca62305127a78 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Apr 2021 06:00:03 +0000
Subject: [PATCH] python3-cython: upgrade 0.29.22 -> 0.29.23

---
 meta/recipes-devtools/python/python-cython.inc                  | 2 +-
 .../{python3-cython_0.29.22.bb => python3-cython_0.29.23.bb}    | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cython_0.29.22.bb => python3-cython_0.29.23.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-cython.inc b/meta/recipes-devtools/python/python-cython.inc
index 0e6bac06a7..04fd2ec2b7 100644
--- a/meta/recipes-devtools/python/python-cython.inc
+++ b/meta/recipes-devtools/python/python-cython.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 PYPI_PACKAGE = "Cython"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "df6b83c7a6d1d967ea89a2903e4a931377634a297459652e4551734c48195406"
+SRC_URI[sha256sum] = "6a0d31452f0245daacb14c979c77e093eb1a546c760816b5eed0047686baad8e"
 UPSTREAM_CHECK_REGEX = "Cython-(?P<pver>.*)\.tar"
 
 inherit pypi
diff --git a/meta/recipes-devtools/python/python3-cython_0.29.22.bb b/meta/recipes-devtools/python/python3-cython_0.29.23.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-cython_0.29.22.bb
rename to meta/recipes-devtools/python/python3-cython_0.29.23.bb
-- 
2.27.0


--===============5045690437274203608==--
