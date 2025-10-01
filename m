Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0B47CCF9E3
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:32:35 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.17963.1759325544102192195
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:32:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=WUZCFtp8;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Kw8CAvnW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101999ff95cab-0c8a251f-a032-4c24-96e1-0b6d80b5564c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1759325543;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WAMKsU08O+MXp3xcyKeIK8ioro4I8eMvV78MzTCSdGE=;
	b=WUZCFtp8JtlP14ZAe9xD5FrjYbGvAB+pJ9HtcoUV1yh1MQA6TvtBXxDvcXN6b/5G
	4qIAFa45bML0EnSzerCaikCDXuchXtaHkdcR7/3PvS3FR4ES8ZiaMwNf5cQAPN4Ut3P
	R6GHwLQKjLQSsGSYY33cqsjv897oJXrpPzWUJOmo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1759325543;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WAMKsU08O+MXp3xcyKeIK8ioro4I8eMvV78MzTCSdGE=;
	b=Kw8CAvnWWBpRBQwu0ngf07KWmuVUFqMIc0uZzHACyMoZIuDDjHZbw7g4jOVx9L4y
	U4yTGET8b9gs9ZEKs+qUwTdJrvgN61kJGD7V9m4g8FB+OSLkDVF9xCEQhw6Iq+86zbT
	tqHEItBXKo8XsNTN7OUpBjnLcHGxh7VJvf3i0agk=
Content-Type: multipart/mixed; boundary="===============9179780727468792960=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sphinx: upgrading to 8.3.0 SUCCEEDED
Message-ID: <010101999ff95cab-0c8a251f-a032-4c24-96e1-0b6d80b5564c-000000@us-west-2.amazonses.com>
Date: Wed, 1 Oct 2025 13:32:23 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.10.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 13:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224252

--===============9179780727468792960==
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
From 97112eb77915b91a2be02d14ea74738c866cfec0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Oct 2025 09:35:03 +0000
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


--===============9179780727468792960==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-sphinx: PV changed from "8.2.1" to "8.3.0"
packages/x86-64-v3-poky-linux/python3-sphinx: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/sphinx/sphinx-8.2.1.tar.gz;downloadfilename=sphinx-8.2.1.tar.gz" to "https://files.pythonhosted.org/packages/source/s/sphinx/sphinx-8.3.0.tar.gz;downloadfilename=sphinx-8.3.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-sphinx: PKGV changed from 8.2.1 [default] to 8.3.0 [default]
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-dbg: PV changed from "8.2.1" to "8.3.0"
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-dbg: PKGV changed from 8.2.1 [default] to 8.3.0 [default]
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-dev: PV changed from "8.2.1" to "8.3.0"
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-dev: PKGV changed from 8.2.1 [default] to 8.3.0 [default]
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-doc: PV changed from "8.2.1" to "8.3.0"
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-doc: PKGV changed from 8.2.1 [default] to 8.3.0 [default]
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-locale: PV changed from "8.2.1" to "8.3.0"
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-locale: PKGV changed from 8.2.1 [default] to 8.3.0 [default]
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-src: PV changed from "8.2.1" to "8.3.0"
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-src: PKGV changed from 8.2.1 [default] to 8.3.0 [default]
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-staticdev: PV changed from "8.2.1" to "8.3.0"
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-staticdev: PKGV changed from 8.2.1 [default] to 8.3.0 [default]
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx: PV changed from "8.2.1" to "8.3.0"
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx: PKGSIZE changed from 16966169 to 16967764 (+0%)
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx: PKGV changed from 8.2.1 [default] to 8.3.0 [default]
Changes to packages/x86-64-v3-poky-linux/python3-sphinx (sysroot):
  /usr/lib/python3.13/site-packages/sphinx-8.2.1.dist-info moved to /usr/lib/python3.13/site-packages/sphinx-8.3.0.dist-info

--===============9179780727468792960==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/python3-sphinx (sysroot):
  /usr/lib/python3.13/site-packages/sphinx-8.2.1.dist-info moved to /usr/lib/python3.13/site-packages/sphinx-8.3.0.dist-info

--===============9179780727468792960==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (0 cached, 944 parsed). 1940 targets, 51 skipped, 0 masked, 0 errors.
Removing 80 recipes from the qemux86_64 sysroot...done.
Removing 41 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-6275df8a6416ad65b61dc7573bb877a90520f9a6"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:6275df8a6416ad65b61dc7573bb877a90520f9a6"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 620 Local 608 Mirrors 0 Missed 12 Current 259 (98% match, 98% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 264 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 265 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 266 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 267 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 268 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 269 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 274 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 276 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_package_qa_setscene)
NOTE: Running setscene task 277 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 280 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 281 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 282 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 285 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 286 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 287 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 288 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-babel-2.17.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-babel-2.17.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-packaging-25.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-packaging-25.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-babel-2.17.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 289 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 291 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_populate_lic_setscene)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 292 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 297 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_qa_setscene)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 301 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_package_qa_setscene)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 303 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-docutils_0.22.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 305 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 306 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 307 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 308 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 309 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 313 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_package_qa_setscene)
NOTE: recipe python3-babel-2.17.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-packaging-25.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-packaging-25.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 316 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 317 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_package_write_deb_setscene)
NOTE: recipe python3-3.13.7-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 318 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 319 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-sphinx-8.3.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-packaging-25.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-docutils-0.22-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-packaging-25.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-packaging-25.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 320 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 322 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_qa_setscene)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-packaging-25.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 323 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 325 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 329 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-3.13.7-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-docutils-0.22-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 330 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 332 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_package_write_deb_setscene)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 333 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 337 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 345 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 346 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 348 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 352 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-babel-2.17.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-babel-2.17.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-requests-2.32.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 353 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 355 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 360 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_package_write_deb_setscene)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 361 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-docutils_0.22.bb:do_create_spdx_setscene)
NOTE: Running setscene task 363 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_package_qa_setscene)
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 365 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_package_write_deb_setscene)
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.13.7-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 366 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-requests-2.32.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 368 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 372 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 373 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 374 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_package_qa_setscene)
NOTE: recipe python3-babel-2.17.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 378 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_package_qa_setscene)
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 379 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-docutils_0.22.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-babel-2.17.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package_write_deb_setscene: Started
NOTE: Running setscene task 380 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_package_qa_setscene)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-docutils-0.22-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 381 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_package_qa_setscene)
NOTE: recipe python3-3.13.7-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 382 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-docutils_0.22.bb:do_package_write_deb_setscene)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-docutils-0.22-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package_qa_setscene: Started
NOTE: Running setscene task 384 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 387 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 390 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_package_qa_setscene)
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_package_qa_setscene: Started
NOTE: Running setscene task 392 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_write_deb_setscene)
NOTE: recipe python3-docutils-0.22-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 393 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_package_write_deb_setscene)
NOTE: recipe python3-requests-2.32.5-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-docutils-0.22-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 394 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 395 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_package_qa_setscene)
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 396 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb:do_packagedata_setscene)
NOTE: Running setscene task 397 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata_setscene)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-docutils-0.22-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 398 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 399 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 401 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 402 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 403 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-docutils_0.22.bb:do_package_qa_setscene)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-requests-2.32.5-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_qa_setscene: Started
NOTE: Running setscene task 405 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-docutils-0.22-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 406 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 408 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-pygments-2.19.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 413 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-docutils-0.22-r0: task do_package_qa_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 414 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 415 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe python3-requests-2.32.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 416 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_create_spdx_setscene)
NOTE: recipe python3-requests-2.32.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 417 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 418 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_packagedata_setscene)
NOTE: recipe python3-docutils-0.22-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 419 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 420 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_create_spdx_setscene)
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pygments-2.19.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 421 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 422 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 423 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_packagedata_setscene)
NOTE: recipe python3-packaging-25.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-requests-2.32.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 424 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.45-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 425 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_create_spdx_setscene)
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-requests-2.32.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 427 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytz-2025.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-babel-2.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-markupsafe-3.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 428 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-packaging-25.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 430 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_create_spdx_setscene)
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-requests-2.32.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 434 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 435 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-babel-2.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 436 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-chardet_5.2.0.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 438 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.10.bb:do_packagedata_setscene)
NOTE: recipe python3-pytz-2025.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 439 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_packagedata_setscene)
NOTE: recipe python3-requests-2.32.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 440 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_create_spdx_setscene: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/python3-markupsafe/3.0.2/temp/log.do_packagedata_setscene.2031425
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 441 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_packagedata_setscene)
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 444 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_packagedata_setscene)
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 449 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_packagedata_setscene)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 450 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.5.0.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-chardet-5.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 455 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 456 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_packagedata_setscene)
NOTE: recipe python3-idna-3.10-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 457 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 458 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_packagedata_setscene)
NOTE: recipe python3-pygments-2.19.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 461 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 463 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-docutils_0.22.bb:do_packagedata_setscene)
NOTE: recipe python3-urllib3-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 465 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_create_spdx_setscene)
NOTE: recipe python3-chardet-5.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 467 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe python3-idna-3.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 471 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-certifi_2025.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 475 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 478 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pygments-2.19.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-babel-2.17.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 479 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 480 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe python3-docutils-0.22-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 484 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb:do_package_setscene)
NOTE: recipe python3-urllib3-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-certifi-2025.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-8.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-babel-2.17.0-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/python3-docutils/0.22/temp/log.do_packagedata_setscene.2031919
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-docutils_0.22.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-certifi-2025.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-8.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 486 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 487 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 489 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_packagedata_setscene)
NOTE: Running setscene task 491 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 497 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 499 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 505 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 516 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 518 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-docutils_0.22.bb:do_package_setscene)
NOTE: Running setscene task 528 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 540 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 548 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 565 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 571 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 574 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-requests-2.32.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-25.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 576 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 581 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 582 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe python3-sphinx-8.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 583 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-alabaster-1.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-requests-2.32.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 591 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 597 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 598 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 602 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 604 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-packaging-25.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 609 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 617 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 619 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 620 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 621 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_recipe_qa_setscene)
NOTE: recipe python3-sphinx-8.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-babel-2.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 622 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 625 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-sphinx-8.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 629 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata_setscene)
NOTE: recipe python3-requests-2.32.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 632 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 635 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe python3-pygments-2.19.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 637 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe python3-babel-2.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 643 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_packagedata_setscene)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 645 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 646 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 648 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-requests-2.32.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 651 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe python3-packaging-25.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-markupsafe-3.0.2-r0: task do_package_setscene: Started
NOTE: recipe python3-docutils-0.22-r0: task do_package_setscene: Started
NOTE: recipe python3-packaging-25.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 661 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 662 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 665 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 667 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 679 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 689 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_create_spdx_setscene)
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 691 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 693 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 705 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata_setscene)
NOTE: Running setscene task 706 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_packagedata_setscene)
NOTE: recipe curl-8.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-markupsafe-3.0.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 712 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 717 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Started
NOTE: Running task 994 of 2359 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe gnutls-3.8.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 720 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 722 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 726 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 727 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: Running task 1037 of 2359 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_fetch)
NOTE: recipe python3-markupsafe-3.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 738 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinx-8.3.0-r0: task do_fetch: Started
NOTE: recipe python3-markupsafe-3.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1194 of 2359 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1195 of 2359 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinx-8.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 1236 of 2359 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_unpack)
NOTE: recipe python3-docutils-0.22-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 740 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 741 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 743 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-docutils_0.22.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinx-8.3.0-r0: task do_unpack: Started
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 759 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe python3-docutils-0.22-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-docutils-0.22-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1391 of 2359 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 764 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinx-8.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 1403 of 2359 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: Running task 1404 of 2359 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_patch)
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1410 of 2359 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe python3-3.13.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 773 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 774 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 775 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 776 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 777 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 778 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 779 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 780 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 781 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 782 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 783 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 784 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 785 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-sphinx-8.3.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 786 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe expat-2.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 788 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 789 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 790 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 792 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 794 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 795 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 797 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 803 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running task 1417 of 2359 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 807 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 809 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 811 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: Running setscene task 816 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 818 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 820 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 822 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 825 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 826 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 827 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 829 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 831 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 833 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 835 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 838 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1481 of 2359 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 841 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 842 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 844 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 846 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 848 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 849 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 851 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 852 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 853 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 858 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 859 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 860 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 862 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 863 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 867 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 869 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 871 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1520 of 2359 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 874 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 322b8f8b906444532279807f4b6d94c79a2dab3feaff9de6d084f1ef1555cf0a
NOTE: recipe linux-libc-headers-6.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 877 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 878 of 879 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1968 of 2359 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2070 of 2359 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-docutils_0.22.bb:do_packagedata)
NOTE: Running task 2216 of 2359 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb:do_packagedata)
NOTE: Running task 2230 of 2359 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-sphinx-8.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-docutils-0.22-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-3.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-docutils-0.22-r0: task do_packagedata: Succeeded
NOTE: recipe python3-markupsafe-3.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinx-8.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinx-8.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2347 of 2359 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_configure)
NOTE: recipe python3-sphinx-8.3.0-r0: task do_configure: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2348 of 2359 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_compile)
NOTE: recipe python3-sphinx-8.3.0-r0: task do_compile: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2349 of 2359 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_install)
NOTE: recipe python3-sphinx-8.3.0-r0: task do_install: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_install: Succeeded
NOTE: Running task 2350 of 2359 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_package)
NOTE: Running task 2351 of 2359 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_populate_sysroot)
NOTE: recipe python3-sphinx-8.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_package: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-sphinx-8.3.0-r0: task do_package: Succeeded
NOTE: Running task 2352 of 2359 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_packagedata)
NOTE: recipe python3-sphinx-8.3.0-r0: task do_packagedata: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_packagedata unihash changed to 1f24d8088033452bd9bfccba6cf04c39f4c6b64b95ebee93b48d5375637ee8b3
NOTE: Setscene tasks completed
NOTE: Running task 2353 of 2359 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_create_spdx)
NOTE: Running task 2354 of 2359 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_package_write_ipk)
NOTE: Running task 2355 of 2359 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_package_write_deb)
NOTE: Running task 2356 of 2359 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_package_write_rpm)
NOTE: Running task 2357 of 2359 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_package_qa)
NOTE: recipe python3-sphinx-8.3.0-r0: task do_create_spdx: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_package_qa: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2358 of 2359 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_create_package_spdx)
NOTE: recipe python3-sphinx-8.3.0-r0: task do_create_package_spdx: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_package_write_ipk unihash changed to 48c80f3212551daeeedc9a4ec912c9a4ab5b0faf6de7134d2a9409d79917ba4b
NOTE: recipe python3-sphinx-8.3.0-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_package_qa unihash changed to dfd6a660ae3954cb024b20ab10cc18ad5bc9677455db59c848eee44e4cab5ad9
NOTE: recipe python3-sphinx-8.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_package_write_rpm unihash changed to fc872147c682b5777b9e68b38bf514a863810d03b9ccaa7fd7a226af9a2bec56
NOTE: recipe python3-sphinx-8.3.0-r0: task do_create_package_spdx: Succeeded
NOTE: recipe python3-sphinx-8.3.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_package_write_deb unihash changed to 453724ff7cbe853a74b1be6388d929933ea03842fc02f3876e745634ec0783be
NOTE: Running noexec task 2359 of 2359 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2359 tasks of which 2330 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 17 ERROR messages, returning a non-zero exit code.
ERROR: python3-markupsafe-3.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-markupsafe-src went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: python3-markupsafe-3.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-markupsafe-dbg went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: python3-markupsafe-3.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-markupsafe-ptest went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: python3-markupsafe-3.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-markupsafe-staticdev went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: python3-markupsafe-3.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-markupsafe-dev went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: python3-markupsafe-3.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-markupsafe-doc went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: python3-markupsafe-3.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-markupsafe-locale went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: python3-markupsafe-3.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-markupsafe went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: python3-markupsafe-3.0.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-docutils-0.22-r0 do_packagedata_setscene: QA Issue: Package version for package python3-docutils-src went backwards which would break package feeds (from 0:0.22.2-r0 to 0:0.22-r0) [version-going-backwards]
ERROR: python3-docutils-0.22-r0 do_packagedata_setscene: QA Issue: Package version for package python3-docutils-dbg went backwards which would break package feeds (from 0:0.22.2-r0 to 0:0.22-r0) [version-going-backwards]
ERROR: python3-docutils-0.22-r0 do_packagedata_setscene: QA Issue: Package version for package python3-docutils-staticdev went backwards which would break package feeds (from 0:0.22.2-r0 to 0:0.22-r0) [version-going-backwards]
ERROR: python3-docutils-0.22-r0 do_packagedata_setscene: QA Issue: Package version for package python3-docutils-dev went backwards which would break package feeds (from 0:0.22.2-r0 to 0:0.22-r0) [version-going-backwards]
ERROR: python3-docutils-0.22-r0 do_packagedata_setscene: QA Issue: Package version for package python3-docutils-doc went backwards which would break package feeds (from 0:0.22.2-r0 to 0:0.22-r0) [version-going-backwards]
ERROR: python3-docutils-0.22-r0 do_packagedata_setscene: QA Issue: Package version for package python3-docutils-locale went backwards which would break package feeds (from 0:0.22.2-r0 to 0:0.22-r0) [version-going-backwards]
ERROR: python3-docutils-0.22-r0 do_packagedata_setscene: QA Issue: Package version for package python3-docutils went backwards which would break package feeds (from 0:0.22.2-r0 to 0:0.22-r0) [version-going-backwards]
ERROR: python3-docutils-0.22-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============9179780727468792960==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-sphinx-upgrade-8.2.1-8.3.0.patch"

RnJvbSA5NzExMmViNzc5MTViOTFhMmJlMDJkMTRlYTc0NzM4Yzg2NmNmZWMwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBPY3QgMjAyNSAwOTozNTowMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
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

--===============9179780727468792960==--

