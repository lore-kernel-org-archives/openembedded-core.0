Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.5220.1613463850067736720
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 00:24:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id E2A7338C112E
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 08:24:09 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-jinja2: upgrading to 2.11.3 SUCCEEDED
Message-ID: <MADEUP.16642CD2C0589085.7752@lists.openembedded.org>
X-Groupsio-MsgNum: 148114
Content-Type: multipart/mixed; boundary="===============4121109987575527264=="

--===============4121109987575527264==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-jinja2* to *2.11.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-jinja2-upgrade-2.11.2-2.11.3.patch
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

--===============4121109987575527264==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-jinja2 (sysroot):
  /usr/lib/python3.9/site-packages/Jinja2-2.11.2-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/Jinja2-2.11.3-py3.9.egg-info

--===============4121109987575527264==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-jinja2-upgrade-2.11.2-2.11.3.patch"

From 2d083819c66fd2524621027e4a8edb14bb781b78 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Feb 2021 21:42:49 +0000
Subject: [PATCH] python3-jinja2: upgrade 2.11.2 -> 2.11.3

---
 .../{python3-jinja2_2.11.2.bb => python3-jinja2_2.11.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jinja2_2.11.2.bb => python3-jinja2_2.11.3.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-jinja2_2.11.2.bb b/meta/recipes-devtools/python/python3-jinja2_2.11.3.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-jinja2_2.11.2.bb
rename to meta/recipes-devtools/python/python3-jinja2_2.11.3.bb
index 89538d2f27..19a4eee11a 100644
--- a/meta/recipes-devtools/python/python3-jinja2_2.11.2.bb
+++ b/meta/recipes-devtools/python/python3-jinja2_2.11.3.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Python Jinja2: A small but fast and easy to use stand-alone templ
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
 
-SRC_URI[sha256sum] = "89aab215427ef59c34ad58735269eb58b1a5808103067f7bb9d5836c651b3bb0"
+SRC_URI[sha256sum] = "a6d58433de0ae800347cab1fa3043cebbabe8baa9d29e668f1c768cb87a333c6"
 
 PYPI_PACKAGE = "Jinja2"
 
-- 
2.17.1


--===============4121109987575527264==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-jinja2: SRC_URI changed from "https://files.pythonhosted.org/packages/source/J/Jinja2/Jinja2-2.11.2.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/J/Jinja2/Jinja2-2.11.3.tar.gz file://run-ptest"
packages/core2-32-poky-linux/python3-jinja2: PKGV changed from 2.11.2 [default] to 2.11.3 [default]
packages/core2-32-poky-linux/python3-jinja2: PV changed from "2.11.2" to "2.11.3"
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-dbg: PKGV changed from 2.11.2 [default] to 2.11.3 [default]
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-dbg: PV changed from "2.11.2" to "2.11.3"
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-dev: PKGV changed from 2.11.2 [default] to 2.11.3 [default]
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-dev: PV changed from "2.11.2" to "2.11.3"
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-doc: PKGV changed from 2.11.2 [default] to 2.11.3 [default]
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-doc: PV changed from "2.11.2" to "2.11.3"
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-locale: PKGV changed from 2.11.2 [default] to 2.11.3 [default]
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-locale: PV changed from "2.11.2" to "2.11.3"
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-src: PKGV changed from 2.11.2 [default] to 2.11.3 [default]
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-src: PV changed from "2.11.2" to "2.11.3"
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-staticdev: PKGV changed from 2.11.2 [default] to 2.11.3 [default]
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-staticdev: PV changed from "2.11.2" to "2.11.3"
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2: PKGV changed from 2.11.2 [default] to 2.11.3 [default]
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2: PV changed from "2.11.2" to "2.11.3"
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2: PKGSIZE changed from 836387 to 836159 (-0%)
Changes to packages/core2-32-poky-linux/python3-jinja2 (sysroot):
  /usr/lib/python3.9/site-packages/Jinja2-2.11.2-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/Jinja2-2.11.3-py3.9.egg-info

--===============4121109987575527264==--
