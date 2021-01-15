Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.672.1610713823010997419
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 04:30:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 2B8DC38C130C
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 12:30:22 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-mako: upgrading to 1.1.4 SUCCEEDED
Message-ID: <MADEUP.165A67B02E5D9783.6799@lists.openembedded.org>
X-Groupsio-MsgNum: 146769
Content-Type: multipart/mixed; boundary="===============8326065941452174743=="

--===============8326065941452174743==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-mako* to *1.1.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-mako-upgrade-1.1.3-1.1.4.patch
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

--===============8326065941452174743==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-mako (sysroot):
  /usr/lib/python3.9/site-packages/Mako-1.1.3-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/Mako-1.1.4-py3.9.egg-info

--===============8326065941452174743==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-mako-upgrade-1.1.3-1.1.4.patch"

From e6e148fe612060199e709ff0af8dfc0f8a68a1ea Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 15 Jan 2021 05:52:58 +0000
Subject: [PATCH] python3-mako: upgrade 1.1.3 -> 1.1.4

---
 .../python/{python3-mako_1.1.3.bb => python3-mako_1.1.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-mako_1.1.3.bb => python3-mako_1.1.4.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-mako_1.1.3.bb b/meta/recipes-devtools/python/python3-mako_1.1.4.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-mako_1.1.3.bb
rename to meta/recipes-devtools/python/python3-mako_1.1.4.bb
index cda4e99220..531fc6a3c0 100644
--- a/meta/recipes-devtools/python/python3-mako_1.1.3.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.1.4.bb
@@ -8,7 +8,7 @@ PYPI_PACKAGE = "Mako"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "8195c8c1400ceb53496064314c6736719c6f25e7479cd24c77be3d9361cddc27"
+SRC_URI[sha256sum] = "17831f0b7087c313c0ffae2bcbbd3c1d5ba9eeac9c38f2eb7b50e8c99fe9d5ab"
 
 RDEPENDS_${PN} = "${PYTHON_PN}-html \
                   ${PYTHON_PN}-netclient \
-- 
2.27.0


--===============8326065941452174743==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-mako: PV changed from "1.1.3" to "1.1.4"
packages/core2-32-poky-linux/python3-mako: PKGV changed from 1.1.3 [default] to 1.1.4 [default]
packages/core2-32-poky-linux/python3-mako: SRC_URI changed from "https://files.pythonhosted.org/packages/source/M/Mako/Mako-1.1.3.tar.gz" to "https://files.pythonhosted.org/packages/source/M/Mako/Mako-1.1.4.tar.gz"
packages/core2-32-poky-linux/python3-mako/python3-mako-dbg: PV changed from "1.1.3" to "1.1.4"
packages/core2-32-poky-linux/python3-mako/python3-mako-dbg: PKGV changed from 1.1.3 [default] to 1.1.4 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako-dev: PV changed from "1.1.3" to "1.1.4"
packages/core2-32-poky-linux/python3-mako/python3-mako-dev: PKGV changed from 1.1.3 [default] to 1.1.4 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako-doc: PV changed from "1.1.3" to "1.1.4"
packages/core2-32-poky-linux/python3-mako/python3-mako-doc: PKGV changed from 1.1.3 [default] to 1.1.4 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako-locale: PV changed from "1.1.3" to "1.1.4"
packages/core2-32-poky-linux/python3-mako/python3-mako-locale: PKGV changed from 1.1.3 [default] to 1.1.4 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako-src: PV changed from "1.1.3" to "1.1.4"
packages/core2-32-poky-linux/python3-mako/python3-mako-src: PKGV changed from 1.1.3 [default] to 1.1.4 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako-staticdev: PV changed from "1.1.3" to "1.1.4"
packages/core2-32-poky-linux/python3-mako/python3-mako-staticdev: PKGV changed from 1.1.3 [default] to 1.1.4 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako: PV changed from "1.1.3" to "1.1.4"
packages/core2-32-poky-linux/python3-mako/python3-mako: PKGV changed from 1.1.3 [default] to 1.1.4 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako: PKGSIZE changed from 493234 to 494305 (+0%)
Changes to packages/core2-32-poky-linux/python3-mako (sysroot):
  /usr/lib/python3.9/site-packages/Mako-1.1.3-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/Mako-1.1.4-py3.9.egg-info

--===============8326065941452174743==--
