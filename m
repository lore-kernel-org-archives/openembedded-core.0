Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AE73CA0EC7
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:08:01 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.88634.1754057271312997460
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:07:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=cWf9JamG;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=hYGF3hvX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019865f5f38a-a4d3b077-d9d8-4f33-a3b4-c26ba1605b8d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1754057274;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jgLvEvaDRqUINNMJx9e/431lQnFw4BmZJYDrrnUx2OQ=;
	b=cWf9JamGDtxlx5v092XosCkUc0w0rrjumubXCsxtmeQwgvoVG45/FE1o3xJmQm6G
	qFoXKSWPM/t9mokCy9jln/BA6xgho7g2EHa+1WawFdjKTeLVeeBHx2T/NNvWXEhgkMe
	6GUwKUdYmS9tFkXRPM4QKmNfNNmU2uBsyGUFpGaQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1754057274;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jgLvEvaDRqUINNMJx9e/431lQnFw4BmZJYDrrnUx2OQ=;
	b=hYGF3hvXArDGaVSyNIJ+iNk7zLju7dwF4RjqaixRl0Y3zI7HMNjw9tKPsHkrCvQv
	IT2ZgOXwJHkpl6vxgK5STDhrobzNlNLQ40C/Zh1UKAJr2LBrSWHlJR0QOCz5HZY3xYV
	f/liODj3e8X3O6BFJhhkckVPYL9nUJkS5a82sCWY=
Content-Type: multipart/mixed; boundary="===============8151804332425731319=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sphinx: upgrading to 8.3.0 SUCCEEDED
Message-ID: <0101019865f5f38a-a4d3b077-d9d8-4f33-a3b4-c26ba1605b8d-000000@us-west-2.amazonses.com>
Date: Fri, 1 Aug 2025 14:07:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:08:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221285

--===============8151804332425731319==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-sphinx* to *8.3.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-sphinx-upgrade-8.2.1-8.3.0.patch
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

-- >8 --
From a42d74e515b45d2427b0fff7f71ee9718aed501a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Aug 2025 10:05:44 +0000
Subject: [PATCH] python3-sphinx: upgrade 8.2.1 -> 8.3.0

---
 .../python/{python3-sphinx_8.2.1.bb => python3-sphinx_8.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinx_8.2.1.bb => python3-sphinx_8.3.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-sphinx_8.2.1.bb b/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-sphinx_8.2.1.bb
rename to meta/recipes-devtools/python/python3-sphinx_8.3.0.bb
index 614566b8f4..25bbc1bff8 100644
--- a/meta/recipes-devtools/python/python3-sphinx_8.2.1.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=e30c37a2b7fb0afa3adc0d72b85e8b04"
 
-SRC_URI[sha256sum] = "e4b932951b9c18b039f73b72e4e63afe967d90408700ec222b981ac24647c01e"
+SRC_URI[sha256sum] = "3bad4314a7fa72ce92344eaaa14c42ddf3177ee6a79c227e4ff8ae07d416f584"
 
 inherit python_flit_core pypi
 
-- 
2.47.1


--===============8151804332425731319==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-sphinx: PV changed from "8.2.1" to "8.3.0"
packages/core2-64-poky-linux/python3-sphinx: PKGV changed from 8.2.1 [default] to 8.3.0 [default]
packages/core2-64-poky-linux/python3-sphinx: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/sphinx/sphinx-8.2.1.tar.gz;downloadfilename=sphinx-8.2.1.tar.gz" to "https://files.pythonhosted.org/packages/source/s/sphinx/sphinx-8.3.0.tar.gz;downloadfilename=sphinx-8.3.0.tar.gz"
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-dbg: PV changed from "8.2.1" to "8.3.0"
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-dbg: PKGV changed from 8.2.1 [default] to 8.3.0 [default]
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-dev: PV changed from "8.2.1" to "8.3.0"
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-dev: PKGV changed from 8.2.1 [default] to 8.3.0 [default]
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-doc: PV changed from "8.2.1" to "8.3.0"
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-doc: PKGV changed from 8.2.1 [default] to 8.3.0 [default]
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-locale: PV changed from "8.2.1" to "8.3.0"
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-locale: PKGV changed from 8.2.1 [default] to 8.3.0 [default]
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-src: PV changed from "8.2.1" to "8.3.0"
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-src: PKGV changed from 8.2.1 [default] to 8.3.0 [default]
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-staticdev: PV changed from "8.2.1" to "8.3.0"
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-staticdev: PKGV changed from 8.2.1 [default] to 8.3.0 [default]
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx: PV changed from "8.2.1" to "8.3.0"
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx: PKGSIZE changed from 16966169 to 16967764 (+0%)
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx: PKGV changed from 8.2.1 [default] to 8.3.0 [default]
Changes to packages/core2-64-poky-linux/python3-sphinx (sysroot):
  /usr/lib/python3.13/site-packages/sphinx-8.2.1.dist-info moved to /usr/lib/python3.13/site-packages/sphinx-8.3.0.dist-info

--===============8151804332425731319==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 942 .bb files complete (0 cached, 942 parsed). 1934 targets, 50 skipped, 0 masked, 0 errors.
Removing 42 recipes from the core2-64 sysroot...done.
Removing 81 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-ff1c2be156b45d6d2c0b74004a41229187d1109b"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:ff1c2be156b45d6d2c0b74004a41229187d1109b"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 622 Local 610 Mirrors 0 Missed 12 Current 267 (98% match, 98% complete)
Removing 3 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 268 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.4.bb:do_package_qa_setscene)
NOTE: Running setscene task 275 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 276 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 277 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 281 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 285 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 289 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 290 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-docutils_0.21.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 293 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 294 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 296 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 299 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 300 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 302 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 307 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 308 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-requests-2.32.4-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-docutils-0.21.2-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-babel-2.17.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-packaging-25.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-requests-2.32.4-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 309 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 310 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-docutils-0.21.2-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 311 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 312 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_package_write_deb_setscene)
NOTE: recipe python3-sphinx-8.3.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 314 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-packaging-25.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 316 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_package_qa_setscene)
NOTE: recipe python3-babel-2.17.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 319 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 320 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 321 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_package_write_deb_setscene)
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 322 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 323 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 325 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 326 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 328 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 334 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 338 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-docutils_0.21.2.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-babel-2.17.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-babel-2.17.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-docutils-0.21.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 339 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_package_qa_setscene)
NOTE: Running setscene task 340 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-docutils_0.21.2.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 341 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 343 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 344 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_qa_setscene)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 348 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.4.bb:do_package_write_deb_setscene)
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 350 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_package_qa_setscene)
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 352 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_package_qa_setscene)
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 353 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-docutils_0.21.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 357 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_package_qa_setscene)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 358 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-3.13.5-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 359 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 369 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-docutils-0.21.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 370 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-babel-2.17.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-docutils-0.21.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-babel-2.17.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_qa_setscene: Started
NOTE: Running setscene task 371 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.4.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 373 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.4.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-requests-2.32.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-docutils-0.21.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 375 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 378 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 379 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-requests-2.32.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-requests-2.32.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 380 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_package_write_deb_setscene)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 382 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 383 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_package_write_deb_setscene)
NOTE: recipe python3-docutils-0.21.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-requests-2.32.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 384 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 388 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 389 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 391 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 393 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 394 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-requests-2.32.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-docutils-0.21.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-babel-2.17.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 395 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package_write_deb_setscene: Started
NOTE: Running setscene task 396 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_package_write_deb_setscene)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 401 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_package_write_deb_setscene)
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-requests-2.32.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 402 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_package_write_deb_setscene)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 403 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 404 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 405 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 407 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_package_write_deb_setscene)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 411 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 412 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_package_write_deb_setscene)
NOTE: recipe python3-packaging-25.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 413 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 415 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 416 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-babel-2.17.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 417 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-certifi_2025.7.9.bb:do_packagedata_setscene)
NOTE: recipe python3-packaging-25.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-packaging-25.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 418 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 419 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-packaging-25.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 420 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.10.bb:do_packagedata_setscene)
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-certifi-2025.7.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-25.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-packaging-25.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-alabaster-1.0.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 421 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 422 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 424 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 425 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 427 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 428 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_packagedata_setscene)
NOTE: recipe python3-idna-3.10-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 429 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-chardet_5.2.0.bb:do_packagedata_setscene)
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 430 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-docutils_0.21.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 431 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 433 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata_setscene)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-babel-2.17.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 434 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 436 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-packaging-25.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 437 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_create_spdx_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3-certifi/2025.7.9/temp/log.do_packagedata_setscene.1860922
NOTE: recipe python3-markupsafe-3.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_create_spdx_setscene: Started
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-certifi_2025.7.9.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 438 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 439 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-chardet-5.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-docutils-0.21.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-idna-3.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 440 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_packagedata_setscene)
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-babel-2.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 441 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 443 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_packagedata_setscene)
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-requests-2.32.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-packaging-25.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 444 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 445 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe python3-docutils-0.21.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-markupsafe-3.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 446 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 447 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_packagedata_setscene)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 448 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-chardet-5.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 449 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_packagedata_setscene)
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 450 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_packagedata_setscene)
NOTE: recipe python3-pygments-2.19.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 453 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 454 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_packagedata_setscene)
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 455 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe python3-requests-2.32.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 456 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 457 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 458 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.4.1.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-urllib3-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.45-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytz-2025.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 460 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_packagedata_setscene)
NOTE: recipe python3-babel-2.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 462 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_packagedata_setscene)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 465 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-8.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 470 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-docutils_0.21.2.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-urllib3-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 475 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 476 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-alabaster-1.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytz-2025.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-babel-2.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 480 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 482 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 484 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-certifi_2025.7.9.bb:do_package_setscene)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-8.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-docutils-0.21.2-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-requests-2.32.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-docutils-0.21.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-requests-2.32.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 486 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_15.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 487 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 493 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 499 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 500 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 504 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 512 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 514 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 550 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 551 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 557 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_packagedata_setscene)
NOTE: Running setscene task 558 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 559 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 562 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 567 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-packaging-25.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-babel-2.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-certifi-2025.7.9-r0: task do_package_setscene: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 568 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 569 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 573 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 576 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-sphinx-8.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-babel-2.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 578 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-docutils_0.21.2.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 580 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 582 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 583 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-packaging-25.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pygments-2.19.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 587 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 588 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 597 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.13.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 609 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-requests-2.32.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-docutils-0.21.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 614 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 616 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 618 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 620 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 621 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-requests-2.32.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pygments-2.19.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 623 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 626 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-docutils-0.21.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 628 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 634 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 638 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 641 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 646 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-25.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-certifi-2025.7.9-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 652 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 653 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 655 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-certifi_2025.7.9.bb:do_recipe_qa_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-packaging-25.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 672 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 674 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 677 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 679 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 682 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 687 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 693 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-certifi-2025.7.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-certifi-2025.7.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 701 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_create_spdx_setscene)
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 706 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 707 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 713 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata_setscene)
NOTE: Running setscene task 714 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_packagedata_setscene)
NOTE: recipe curl-8.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 724 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 732 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 733 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 736 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 737 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1014 of 2391 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 1050 of 2391 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_fetch)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 749 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 750 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 751 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 752 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 753 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 754 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 755 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 756 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinx-8.3.0-r0: task do_fetch: Started
NOTE: Running setscene task 757 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-sphinx-8.3.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 758 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_packagedata_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 759 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 760 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 761 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 762 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 767 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 769 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 771 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 774 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 776 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 779 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 780 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 781 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 782 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 802 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 803 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 807 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 811 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 813 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 814 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 817 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 818 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 824 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 827 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 828 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 830 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1149 of 2391 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1155 of 2391 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_unpack)
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 835 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 837 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: Running task 1295 of 2391 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinx-8.3.0-r0: task do_unpack: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 840 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 842 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1485 of 2391 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 846 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: Running task 1496 of 2391 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1498 of 2391 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 849 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 851 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinx-8.3.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe gcc-runtime-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1519 of 2391 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe python3-sphinx-8.3.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1522 of 2391 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 854 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libgcc-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 856 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 857 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 859 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 861 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 862 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 863 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 864 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 865 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1525 of 2391 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 871 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 872 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 873 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 878 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 880 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 881 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 884 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 887 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 888 of 889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1999 of 2391 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2250 of 2391 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-certifi_2025.7.9.bb:do_packagedata)
NOTE: Running task 2259 of 2391 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-sphinx-8.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe python3-certifi-2025.7.9-r0: task do_packagedata: Started
NOTE: Running task 2360 of 2391 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-sphinx-8.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe python3-certifi-2025.7.9-r0: task do_packagedata: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 322b8f8b906444532279807f4b6d94c79a2dab3feaff9de6d084f1ef1555cf0a
NOTE: recipe python3-sphinx-8.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinx-8.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2379 of 2391 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_configure)
NOTE: recipe python3-sphinx-8.3.0-r0: task do_configure: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2380 of 2391 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_compile)
NOTE: recipe python3-sphinx-8.3.0-r0: task do_compile: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2381 of 2391 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_install)
NOTE: recipe python3-sphinx-8.3.0-r0: task do_install: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_install: Succeeded
NOTE: Running task 2382 of 2391 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_package)
NOTE: Running task 2383 of 2391 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_populate_sysroot)
NOTE: recipe python3-sphinx-8.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_package: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-sphinx-8.3.0-r0: task do_package: Succeeded
NOTE: Running task 2384 of 2391 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_packagedata)
NOTE: recipe python3-sphinx-8.3.0-r0: task do_packagedata: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_packagedata unihash changed to a09cc56597eddf70f3c2f7508b18246a01b4248d1cf91e35b47b71d092dc622b
NOTE: Setscene tasks completed
NOTE: Running task 2385 of 2391 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_create_spdx)
NOTE: Running task 2386 of 2391 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_package_write_ipk)
NOTE: Running task 2387 of 2391 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_package_write_deb)
NOTE: Running task 2388 of 2391 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_package_write_rpm)
NOTE: Running task 2389 of 2391 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_package_qa)
NOTE: recipe python3-sphinx-8.3.0-r0: task do_create_spdx: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_package_qa: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2390 of 2391 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_create_package_spdx)
NOTE: recipe python3-sphinx-8.3.0-r0: task do_create_package_spdx: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_package_write_ipk unihash changed to 8184f55a00a8315969905a9d427230788278f55d6c921a2266aad4613a4a6cc0
NOTE: recipe python3-sphinx-8.3.0-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_package_qa unihash changed to 92835fe8bc8d37b1f8d50a2aa18fec126e0cebeb6ce5db125fe93ca6dc5b273d
NOTE: recipe python3-sphinx-8.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_package_write_rpm unihash changed to b2e8d4aef754a90854f78810ce807e5390eeffc988d3c49b7c8c6a748fef6b29
NOTE: recipe python3-sphinx-8.3.0-r0: task do_create_package_spdx: Succeeded
NOTE: recipe python3-sphinx-8.3.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_package_write_deb unihash changed to 8e9f4ae593050b501af6a096b6d57d62fc87f3fd3c46e9ed13c4196852235f80
NOTE: Running noexec task 2391 of 2391 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2391 tasks of which 2363 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-certifi-2025.7.9-r0 do_packagedata_setscene: QA Issue: Package version for package python3-certifi-src went backwards which would break package feeds (from 0:2025.7.14-r0 to 0:2025.7.9-r0) [version-going-backwards]
ERROR: python3-certifi-2025.7.9-r0 do_packagedata_setscene: QA Issue: Package version for package python3-certifi-dbg went backwards which would break package feeds (from 0:2025.7.14-r0 to 0:2025.7.9-r0) [version-going-backwards]
ERROR: python3-certifi-2025.7.9-r0 do_packagedata_setscene: QA Issue: Package version for package python3-certifi-staticdev went backwards which would break package feeds (from 0:2025.7.14-r0 to 0:2025.7.9-r0) [version-going-backwards]
ERROR: python3-certifi-2025.7.9-r0 do_packagedata_setscene: QA Issue: Package version for package python3-certifi-dev went backwards which would break package feeds (from 0:2025.7.14-r0 to 0:2025.7.9-r0) [version-going-backwards]
ERROR: python3-certifi-2025.7.9-r0 do_packagedata_setscene: QA Issue: Package version for package python3-certifi-doc went backwards which would break package feeds (from 0:2025.7.14-r0 to 0:2025.7.9-r0) [version-going-backwards]
ERROR: python3-certifi-2025.7.9-r0 do_packagedata_setscene: QA Issue: Package version for package python3-certifi-locale went backwards which would break package feeds (from 0:2025.7.14-r0 to 0:2025.7.9-r0) [version-going-backwards]
ERROR: python3-certifi-2025.7.9-r0 do_packagedata_setscene: QA Issue: Package version for package python3-certifi went backwards which would break package feeds (from 0:2025.7.14-r0 to 0:2025.7.9-r0) [version-going-backwards]
ERROR: python3-certifi-2025.7.9-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8151804332425731319==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-sphinx-upgrade-8.2.1-8.3.0.patch"

RnJvbSBhNDJkNzRlNTE1YjQ1ZDI0MjdiMGZmZjdmNzFlZTk3MThhZWQ1MDFhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBBdWcgMjAyNSAxMDowNTo0NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc3BoaW54OiB1cGdyYWRlIDguMi4xIC0+IDguMy4wCgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtc3BoaW54XzguMi4xLmJiID0+IHB5dGhvbjMtc3BoaW54XzguMy4wLmJifSB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtc3BoaW54XzguMi4xLmJiID0+IHB5
dGhvbjMtc3BoaW54XzguMy4wLmJifSAoOTElKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGhpbnhfOC4yLjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54XzguMy4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTEl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGhpbnhf
OC4yLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1z
cGhpbnhfOC4zLjAuYmIKaW5kZXggNjE0NTY2YjhmNC4uMjViYmMxYmZmOCAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNwaGlueF84LjIuMS5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54XzguMy4wLmJiCkBA
IC00LDcgKzQsNyBAQCBTRUNUSU9OID0gImRldmVsL3B5dGhvbiIKIExJQ0VOU0UgPSAiQlNELTIt
Q2xhdXNlICYgTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS5yc3Q7bWQ1
PWUzMGMzN2EyYjdmYjBhZmEzYWRjMGQ3MmI4NWU4YjA0IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiZTRiOTMyOTUxYjljMThiMDM5ZjczYjcyZTRlNjNhZmU5NjdkOTA0MDg3MDBlYzIyMmI5ODFh
YzI0NjQ3YzAxZSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIzYmFkNDMxNGE3ZmE3MmNlOTIzNDRl
YWFhMTRjNDJkZGYzMTc3ZWU2YTc5YzIyN2U0ZmY4YWUwN2Q0MTZmNTg0IgogCiBpbmhlcml0IHB5
dGhvbl9mbGl0X2NvcmUgcHlwaQogCi0tIAoyLjQ3LjEKCg==

--===============8151804332425731319==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-sphinx (sysroot):
  /usr/lib/python3.13/site-packages/sphinx-8.2.1.dist-info moved to /usr/lib/python3.13/site-packages/sphinx-8.3.0.dist-info

--===============8151804332425731319==--

