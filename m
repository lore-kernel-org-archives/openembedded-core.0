Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A00B0D1D882
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 12:16:01 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.11873.1728994560550410412
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 05:16:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=BeT10mQy;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=0bp1UhrY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010192901b4611-bb397e46-4776-426d-97c9-164d28f3e364-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728994559;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PvmH1m5VOYJ/Rzpi01NjHVNIqK1wC4gGKAO/3La8ks8=;
	b=BeT10mQyDAA1f6Ho3uSTT8P4zCBibntyuHgbZbcwybvsOkkSPtKN9bCl9K2BQ24T
	MCY464MYNVY9YNxYxL73S2U1+ibLnUkzbyX6PfEKCvALHGXKqTCwifn9Lcmoey3UxYb
	xHaShyAQqShMRrSDdcEDx+N42uEjgEtvJ7AnOcLI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728994559;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PvmH1m5VOYJ/Rzpi01NjHVNIqK1wC4gGKAO/3La8ks8=;
	b=0bp1UhrYC2CkY6vHenT8UInpkwVsnM3GgM3ENjF0Ne1FjtE2OMAIh60Szipo2LJS
	YOAHwyfl4KMwCORlpRQwWVenL/dF5uB3mjkTuvZbv/bY1eAvp5kAHVnzIX3iqQdiB3Z
	rk17QhJ1aNztYEeFirVRCbRqJwE1Z1myWJ/Nmh2o=
Content-Type: multipart/mixed; boundary="===============1509173914571861607=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sphinx: upgrading to 8.1.3 SUCCEEDED
Message-ID: <01010192901b4611-bb397e46-4776-426d-97c9-164d28f3e364-000000@us-west-2.amazonses.com>
Date: Tue, 15 Oct 2024 12:15:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 12:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205855

--===============1509173914571861607==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-sphinx* to *8.1.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-sphinx-upgrade-8.0.2-8.1.3.patch
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
From 3ad192e76bb2ccc23b0221e9694630b3ec77921f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Oct 2024 08:56:16 +0000
Subject: [PATCH] python3-sphinx: upgrade 8.0.2 -> 8.1.3

---
 ...phinx_8.0.2.bb => python3-sphinx_8.1.3.bb} | 57 ++++++++++++++++++-
 1 file changed, 55 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-sphinx_8.0.2.bb => python3-sphinx_8.1.3.bb} (26%)

diff --git a/meta/recipes-devtools/python/python3-sphinx_8.0.2.bb b/meta/recipes-devtools/python/python3-sphinx_8.1.3.bb
similarity index 26%
rename from meta/recipes-devtools/python/python3-sphinx_8.0.2.bb
rename to meta/recipes-devtools/python/python3-sphinx_8.1.3.bb
index 94ea56c4fd..eab036e9ba 100644
--- a/meta/recipes-devtools/python/python3-sphinx_8.0.2.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_8.1.3.bb
@@ -1,10 +1,63 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE.rst
+# +++ LICENSE.rst
+# @@ -29,39 +29,3 @@
+#  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+#  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+#  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+# -
+# -
+# -Licenses for incorporated software
+# -==================================
+# -
+# -The included implementation of NumpyDocstring._parse_numpydoc_see_also_section
+# -was derived from code under the following license:
+# -
+# --------------------------------------------------------------------------------
+# -
+# -Copyright (C) 2008 Stefan van der Walt <stefan@mentat.za.net>, Pauli Virtanen <pav@iki.fi>
+# -
+# -Redistribution and use in source and binary forms, with or without
+# -modification, are permitted provided that the following conditions are
+# -met:
+# -
+# - 1. Redistributions of source code must retain the above copyright
+# -    notice, this list of conditions and the following disclaimer.
+# - 2. Redistributions in binary form must reproduce the above copyright
+# -    notice, this list of conditions and the following disclaimer in
+# -    the documentation and/or other materials provided with the
+# -    distribution.
+# -
+# -THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
+# -IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
+# -WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
+# -DISCLAIMED. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT,
+# -INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
+# -(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
+# -SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
+# -HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
+# -STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING
+# -IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
+# -POSSIBILITY OF SUCH DAMAGE.
+# -
+# --------------------------------------------------------------------------------
+# 
+#
+
 SUMMARY = "Python documentation generator"
 HOMEPAGE = "http://sphinx-doc.org/"
 SECTION = "devel/python"
 LICENSE = "BSD-2-Clause & MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=b6c681698874edd2eb9eaff7cc9de642"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=4ab44940eeb9c0ec044da326d904a683"
 
-SRC_URI[sha256sum] = "0cce1ddcc4fd3532cf1dd283bc7d886758362c5c1de6598696579ce96d8ffa5b"
+SRC_URI[sha256sum] = "43c1911eecb0d3e161ad78611bc905d1ad0e523e4ddc202a58a821773dc4c927"
 
 inherit python_flit_core pypi
 UPSTREAM_CHECK_REGEX = "/Sphinx/(?P<pver>(\d+[\.\-_]*)+)/"
-- 
2.44.1


--===============1509173914571861607==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 919 .bb files complete (0 cached, 919 parsed). 1876 targets, 52 skipped, 0 masked, 0 errors.
Removing 42 recipes from the core2-64 sysroot...done.
Removing 81 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:7680333bd0149e0b688ca128c8bca8934d883e13"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 636 Local 625 Mirrors 0 Missed 11 Current 235 (98% match, 98% complete)
Removing 3 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 240 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 241 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 242 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 243 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-babel_2.16.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 244 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-babel_2.16.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 245 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-babel_2.16.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 246 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-docutils_0.21.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 247 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-docutils_0.21.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 248 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-docutils_0.21.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 249 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 250 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 251 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 252 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 253 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 254 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 255 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.1.bb:do_package_write_deb_setscene)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-babel-2.16.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-babel-2.16.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-babel-2.16.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-docutils-0.21.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-docutils-0.21.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-docutils-0.21.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-jinja2-3.1.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-jinja2-3.1.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-jinja2-3.1.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-packaging-24.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 256 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.1.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 257 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 258 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.18.0.bb:do_package_write_deb_setscene)
NOTE: recipe python3-docutils-0.21.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-docutils-0.21.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 259 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.18.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 260 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.18.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 261 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.3.bb:do_package_write_deb_setscene)
NOTE: recipe python3-jinja2-3.1.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-jinja2-3.1.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 262 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.3.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 263 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 264 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_package_write_deb_setscene)
NOTE: recipe python3-jinja2-3.1.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-packaging-24.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 265 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 266 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markupsafe_2.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 267 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-babel-2.16.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-babel-2.16.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 269 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 270 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-babel_2.16.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-docutils-0.21.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 271 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-docutils_0.21.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-babel-2.16.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pygments-2.18.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-packaging-24.1-r0: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 272 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-packaging-24.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pygments-2.18.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pygments-2.18.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-requests-2.32.3-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-requests-2.32.3-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-requests-2.32.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-markupsafe-2.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-babel-2.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-docutils-0.21.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pygments-2.18.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-packaging-24.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-packaging-24.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 273 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 274 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 275 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata_setscene)
NOTE: recipe python3-requests-2.32.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pygments-2.18.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-requests-2.32.3-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-requests-2.32.3-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-pygments-2.18.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 276 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.18.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 277 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.3.3.bb:do_packagedata_setscene)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 278 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2024.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 279 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.3.bb:do_create_spdx_setscene)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 280 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-certifi_2024.8.30.bb:do_packagedata_setscene)
NOTE: Running setscene task 281 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-chardet_5.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 282 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 283 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 285 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_packagedata_setscene)
NOTE: recipe python3-babel-2.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 287 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-markupsafe-2.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-docutils-0.21.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 296 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 297 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-babel_2.16.0.bb:do_packagedata_setscene)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-jinja2-3.1.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 298 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-docutils_0.21.2.bb:do_packagedata_setscene)
NOTE: recipe python3-packaging-24.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.18.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytest-8.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-requests-2.32.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytz-2024.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-certifi-2024.8.30-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-chardet-5.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-idna-3.10-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-babel-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-docutils-0.21.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jinja2-3.1.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-packaging-24.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 300 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 302 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb:do_packagedata_setscene)
NOTE: recipe python3-pygments-2.18.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 304 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.1.bb:do_packagedata_setscene)
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-requests-2.32.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 309 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 311 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.3.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-8.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-certifi-2024.8.30-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-chardet-5.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 318 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.1.3.bb:do_populate_lic_setscene)
NOTE: recipe python3-pytz-2024.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-idna-3.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 328 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 335 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 336 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 337 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 338 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 342 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3-setuptools/72.1.0/temp/log.do_packagedata_setscene.1608720
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 343 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_package_setscene)
NOTE: recipe python3-jinja2-3.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-babel-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-docutils-0.21.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-packaging-24.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-requests-2.32.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinx-8.1.3-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-jinja2-3.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinx-8.1.3-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-packaging-24.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-requests-2.32.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-pygments-2.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 372 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 374 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 375 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 376 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 378 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 379 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 380 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 381 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 382 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 383 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 384 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 385 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 386 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 387 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 388 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 389 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 390 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 391 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 393 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 394 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 395 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 396 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 397 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 401 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 402 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 403 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 405 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 431 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-urllib3-2.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 499 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.6-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.12.6-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.12.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 501 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 502 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_create_spdx_setscene)
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-urllib3-2.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 857 of 2364 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.1.3.bb:do_recipe_qa)
NOTE: recipe python3-3.12.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_package_setscene: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinx-8.1.3-r0: task do_recipe_qa: Started
NOTE: recipe python3-3.12.6-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-3.12.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.12.6-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 524 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 525 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 526 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.43.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 527 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 528 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 529 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 530 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 531 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 532 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_packagedata_setscene)
NOTE: Running setscene task 533 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 549 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20240203-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.43.1-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.32-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe ca-certificates-20240203-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinx-8.1.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 556 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 558 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 562 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1111 of 2364 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.1.3.bb:do_fetch)
NOTE: Running setscene task 573 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-sphinx-8.1.3-r0: task do_fetch: Started
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.16.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 580 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.43.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 585 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinx-8.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 1154 of 2364 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.1.3.bb:do_unpack)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 599 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe elfutils-0.191-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinx-8.1.3-r0: task do_unpack: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 610 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe elfutils-0.191-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 624 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 626 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 628 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 632 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 634 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 636 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinx-8.1.3-r0: task do_unpack: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1247 of 2364 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.1.3.bb:do_patch)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinx-8.1.3-r0: task do_patch: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.7.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 654 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 656 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 658 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 660 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 667 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinx-8.1.3-r0: task do_patch: Succeeded
NOTE: Running task 1324 of 2364 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-setuptools-72.1.0-r0: task do_package_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 671 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 672 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 673 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinx-8.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 677 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 679 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 682 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_packagedata_setscene)
NOTE: Running setscene task 686 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.50.bb:do_packagedata_setscene)
NOTE: recipe curl-8.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 694 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-72.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.12.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 697 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 701 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 703 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 705 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.50-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 714 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinx-8.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.50-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 731 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 736 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 737 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 738 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 739 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 740 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 741 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 742 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 743 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: Running setscene task 744 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 745 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 749 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 751 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 752 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 753 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20240808-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 754 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 756 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 759 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 760 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.46.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 762 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 764 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 765 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 767 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 772 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 778 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20240808-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 782 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 784 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.46.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.12.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 785 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 787 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 789 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.12.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 792 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 793 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 795 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 797 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 799 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 801 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 806 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 808 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20240808-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 810 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 812 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 813 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 816 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 818 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 819 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 829 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 831 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 833 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 834 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 836 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 838 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 840 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 841 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 843 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 844 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 845 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 846 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 848 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 852 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 853 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 855 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 861 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 862 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 863 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 867 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 868 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 870 of 871 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1988 of 2364 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.1.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2248 of 2364 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_packagedata)
NOTE: Running task 2258 of 2364 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.1.3.bb:do_collect_spdx_deps)
NOTE: recipe python3-sphinx-8.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-sphinx-8.1.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinx-8.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinx-8.1.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2352 of 2364 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.1.3.bb:do_configure)
NOTE: recipe python3-sphinx-8.1.3-r0: task do_configure: Started
NOTE: recipe python3-sphinx-8.1.3-r0: task do_configure: Succeeded
NOTE: Running task 2353 of 2364 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.1.3.bb:do_compile)
NOTE: recipe python3-sphinx-8.1.3-r0: task do_compile: Started
NOTE: recipe python3-sphinx-8.1.3-r0: task do_compile: Succeeded
NOTE: Running task 2354 of 2364 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.1.3.bb:do_install)
NOTE: recipe python3-sphinx-8.1.3-r0: task do_install: Started
NOTE: recipe python3-sphinx-8.1.3-r0: task do_install: Succeeded
NOTE: Running task 2355 of 2364 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.1.3.bb:do_package)
NOTE: Running task 2356 of 2364 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.1.3.bb:do_populate_sysroot)
NOTE: recipe python3-sphinx-8.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe python3-sphinx-8.1.3-r0: task do_package: Started
NOTE: recipe python3-sphinx-8.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-sphinx-8.1.3-r0: task do_package: Succeeded
NOTE: Running task 2357 of 2364 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.1.3.bb:do_packagedata)
NOTE: recipe python3-sphinx-8.1.3-r0: task do_packagedata: Started
NOTE: recipe python3-sphinx-8.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2358 of 2364 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.1.3.bb:do_create_spdx)
NOTE: Running task 2359 of 2364 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.1.3.bb:do_package_write_ipk)
NOTE: Running task 2360 of 2364 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.1.3.bb:do_package_write_deb)
NOTE: Running task 2361 of 2364 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.1.3.bb:do_package_write_rpm)
NOTE: Running task 2362 of 2364 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.1.3.bb:do_package_qa)
NOTE: recipe python3-sphinx-8.1.3-r0: task do_create_spdx: Started
NOTE: recipe python3-sphinx-8.1.3-r0: task do_package_write_ipk: Started
NOTE: recipe python3-sphinx-8.1.3-r0: task do_package_write_deb: Started
NOTE: recipe python3-sphinx-8.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinx-8.1.3-r0: task do_package_qa: Started
NOTE: recipe python3-sphinx-8.1.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 2363 of 2364 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.1.3.bb:do_create_package_spdx)
NOTE: recipe python3-sphinx-8.1.3-r0: task do_create_package_spdx: Started
NOTE: recipe python3-sphinx-8.1.3-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-sphinx-8.1.3-r0: task do_package_qa: Succeeded
NOTE: recipe python3-sphinx-8.1.3-r0: task do_create_package_spdx: Succeeded
NOTE: recipe python3-sphinx-8.1.3-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-sphinx-8.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2364 of 2364 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.1.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2364 tasks of which 2343 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-setuptools-72.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-src went backwards which would break package feeds (from 0:75.1.0-r0 to 0:72.1.0-r0) [version-going-backwards]
ERROR: python3-setuptools-72.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-dbg went backwards which would break package feeds (from 0:75.1.0-r0 to 0:72.1.0-r0) [version-going-backwards]
ERROR: python3-setuptools-72.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkg-resources went backwards which would break package feeds (from 0:75.1.0-r0 to 0:72.1.0-r0) [version-going-backwards]
ERROR: python3-setuptools-72.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-staticdev went backwards which would break package feeds (from 0:75.1.0-r0 to 0:72.1.0-r0) [version-going-backwards]
ERROR: python3-setuptools-72.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-dev went backwards which would break package feeds (from 0:75.1.0-r0 to 0:72.1.0-r0) [version-going-backwards]
ERROR: python3-setuptools-72.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-doc went backwards which would break package feeds (from 0:75.1.0-r0 to 0:72.1.0-r0) [version-going-backwards]
ERROR: python3-setuptools-72.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-locale went backwards which would break package feeds (from 0:75.1.0-r0 to 0:72.1.0-r0) [version-going-backwards]
ERROR: python3-setuptools-72.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools went backwards which would break package feeds (from 0:75.1.0-r0 to 0:72.1.0-r0) [version-going-backwards]
ERROR: python3-setuptools-72.1.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1509173914571861607==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-sphinx-upgrade-8.0.2-8.1.3.patch"

RnJvbSAzYWQxOTJlNzZiYjJjY2MyM2IwMjIxZTk2OTQ2MzBiM2VjNzc5MjFmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgT2N0IDIwMjQgMDg6NTY6MTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNwaGlueDogdXBncmFkZSA4LjAuMiAtPiA4LjEuMwoKLS0tCiAuLi5waGlueF84LjAu
Mi5iYiA9PiBweXRob24zLXNwaGlueF84LjEuMy5iYn0gfCA1NyArKysrKysrKysrKysrKysrKyst
CiAxIGZpbGUgY2hhbmdlZCwgNTUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXNwaGlueF84LjAuMi5iYiA9
PiBweXRob24zLXNwaGlueF84LjEuMy5iYn0gKDI2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54XzguMC4yLmJiIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNwaGlueF84LjEuMy5iYgpzaW1pbGFyaXR5IGluZGV4
IDI2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3Bo
aW54XzguMC4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtc3BoaW54XzguMS4zLmJiCmluZGV4IDk0ZWE1NmM0ZmQuLmVhYjAzNmU5YmEgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGhpbnhfOC4wLjIuYmIK
KysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNwaGlueF84LjEuMy5i
YgpAQCAtMSwxMCArMSw2MyBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVz
IGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5n
IGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRl
eHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3Vt
bWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2Ut
VXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVh
cnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIExJQ0VOU0UucnN0Cisj
ICsrKyBMSUNFTlNFLnJzdAorIyBAQCAtMjksMzkgKzI5LDMgQEAKKyMgIFRIRU9SWSBPRiBMSUFC
SUxJVFksIFdIRVRIRVIgSU4gQ09OVFJBQ1QsIFNUUklDVCBMSUFCSUxJVFksIE9SIFRPUlQKKyMg
IChJTkNMVURJTkcgTkVHTElHRU5DRSBPUiBPVEhFUldJU0UpIEFSSVNJTkcgSU4gQU5ZIFdBWSBP
VVQgT0YgVEhFIFVTRQorIyAgT0YgVEhJUyBTT0ZUV0FSRSwgRVZFTiBJRiBBRFZJU0VEIE9GIFRI
RSBQT1NTSUJJTElUWSBPRiBTVUNIIERBTUFHRS4KKyMgLQorIyAtCisjIC1MaWNlbnNlcyBmb3Ig
aW5jb3Jwb3JhdGVkIHNvZnR3YXJlCisjIC09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09CisjIC0KKyMgLVRoZSBpbmNsdWRlZCBpbXBsZW1lbnRhdGlvbiBvZiBOdW1weURvY3N0cmlu
Zy5fcGFyc2VfbnVtcHlkb2Nfc2VlX2Fsc29fc2VjdGlvbgorIyAtd2FzIGRlcml2ZWQgZnJvbSBj
b2RlIHVuZGVyIHRoZSBmb2xsb3dpbmcgbGljZW5zZToKKyMgLQorIyAtLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQorIyAtCisjIC1Db3B5cmlnaHQgKEMpIDIwMDggU3RlZmFuIHZhbiBkZXIgV2FsdCA8
c3RlZmFuQG1lbnRhdC56YS5uZXQ+LCBQYXVsaSBWaXJ0YW5lbiA8cGF2QGlraS5maT4KKyMgLQor
IyAtUmVkaXN0cmlidXRpb24gYW5kIHVzZSBpbiBzb3VyY2UgYW5kIGJpbmFyeSBmb3Jtcywgd2l0
aCBvciB3aXRob3V0CisjIC1tb2RpZmljYXRpb24sIGFyZSBwZXJtaXR0ZWQgcHJvdmlkZWQgdGhh
dCB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnMgYXJlCisjIC1tZXQ6CisjIC0KKyMgLSAxLiBSZWRp
c3RyaWJ1dGlvbnMgb2Ygc291cmNlIGNvZGUgbXVzdCByZXRhaW4gdGhlIGFib3ZlIGNvcHlyaWdo
dAorIyAtICAgIG5vdGljZSwgdGhpcyBsaXN0IG9mIGNvbmRpdGlvbnMgYW5kIHRoZSBmb2xsb3dp
bmcgZGlzY2xhaW1lci4KKyMgLSAyLiBSZWRpc3RyaWJ1dGlvbnMgaW4gYmluYXJ5IGZvcm0gbXVz
dCByZXByb2R1Y2UgdGhlIGFib3ZlIGNvcHlyaWdodAorIyAtICAgIG5vdGljZSwgdGhpcyBsaXN0
IG9mIGNvbmRpdGlvbnMgYW5kIHRoZSBmb2xsb3dpbmcgZGlzY2xhaW1lciBpbgorIyAtICAgIHRo
ZSBkb2N1bWVudGF0aW9uIGFuZC9vciBvdGhlciBtYXRlcmlhbHMgcHJvdmlkZWQgd2l0aCB0aGUK
KyMgLSAgICBkaXN0cmlidXRpb24uCisjIC0KKyMgLVRISVMgU09GVFdBUkUgSVMgUFJPVklERUQg
QlkgVEhFIEFVVEhPUiBgYEFTIElTJycgQU5EIEFOWSBFWFBSRVNTIE9SCisjIC1JTVBMSUVEIFdB
UlJBTlRJRVMsIElOQ0xVRElORywgQlVUIE5PVCBMSU1JVEVEIFRPLCBUSEUgSU1QTElFRAorIyAt
V0FSUkFOVElFUyBPRiBNRVJDSEFOVEFCSUxJVFkgQU5EIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxB
UiBQVVJQT1NFIEFSRQorIyAtRElTQ0xBSU1FRC4gSU4gTk8gRVZFTlQgU0hBTEwgVEhFIEFVVEhP
UiBCRSBMSUFCTEUgRk9SIEFOWSBESVJFQ1QsCisjIC1JTkRJUkVDVCwgSU5DSURFTlRBTCwgU1BF
Q0lBTCwgRVhFTVBMQVJZLCBPUiBDT05TRVFVRU5USUFMIERBTUFHRVMKKyMgLShJTkNMVURJTkcs
IEJVVCBOT1QgTElNSVRFRCBUTywgUFJPQ1VSRU1FTlQgT0YgU1VCU1RJVFVURSBHT09EUyBPUgor
IyAtU0VSVklDRVM7IExPU1MgT0YgVVNFLCBEQVRBLCBPUiBQUk9GSVRTOyBPUiBCVVNJTkVTUyBJ
TlRFUlJVUFRJT04pCisjIC1IT1dFVkVSIENBVVNFRCBBTkQgT04gQU5ZIFRIRU9SWSBPRiBMSUFC
SUxJVFksIFdIRVRIRVIgSU4gQ09OVFJBQ1QsCisjIC1TVFJJQ1QgTElBQklMSVRZLCBPUiBUT1JU
IChJTkNMVURJTkcgTkVHTElHRU5DRSBPUiBPVEhFUldJU0UpIEFSSVNJTkcKKyMgLUlOIEFOWSBX
QVkgT1VUIE9GIFRIRSBVU0UgT0YgVEhJUyBTT0ZUV0FSRSwgRVZFTiBJRiBBRFZJU0VEIE9GIFRI
RQorIyAtUE9TU0lCSUxJVFkgT0YgU1VDSCBEQU1BR0UuCisjIC0KKyMgLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KKyMgCisjCisKIFNVTU1BUlkgPSAiUHl0aG9uIGRvY3VtZW50YXRpb24gZ2VuZXJh
dG9yIgogSE9NRVBBR0UgPSAiaHR0cDovL3NwaGlueC1kb2Mub3JnLyIKIFNFQ1RJT04gPSAiZGV2
ZWwvcHl0aG9uIgogTElDRU5TRSA9ICJCU0QtMi1DbGF1c2UgJiBNSVQiCi1MSUNfRklMRVNfQ0hL
U1VNID0gImZpbGU6Ly9MSUNFTlNFLnJzdDttZDU9YjZjNjgxNjk4ODc0ZWRkMmViOWVhZmY3Y2M5
ZGU2NDIiCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLnJzdDttZDU9NGFiNDQ5
NDBlZWI5YzBlYzA0NGRhMzI2ZDkwNGE2ODMiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIwY2Nl
MWRkY2M0ZmQzNTMyY2YxZGQyODNiYzdkODg2NzU4MzYyYzVjMWRlNjU5ODY5NjU3OWNlOTZkOGZm
YTViIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjQzYzE5MTFlZWNiMGQzZTE2MWFkNzg2MTFiYzkw
NWQxYWQwZTUyM2U0ZGRjMjAyYTU4YTgyMTc3M2RjNGM5MjciCiAKIGluaGVyaXQgcHl0aG9uX2Zs
aXRfY29yZSBweXBpCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICIvU3BoaW54Lyg/UDxwdmVyPihc
ZCtbXC5cLV9dKikrKS8iCi0tIAoyLjQ0LjEKCg==

--===============1509173914571861607==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-sphinx/python3-sphinx: FILELIST: directory renamed /usr/lib/python3.12/site-packages/sphinx-8.0.2.dist-info -> /usr/lib/python3.12/site-packages/sphinx-8.1.3.dist-info, added "/usr/lib/python3.12/site-packages/sphinx/builders/html/__pycache__/_build_info.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/util/__pycache__/_files.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/util/_lines.py /usr/lib/python3.12/site-packages/sphinx/util/__pycache__/_uri.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/domains/_index.py /usr/lib/python3.12/site-packages/sphinx/util/__pycache__/_serialise.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/util/_importer.py /usr/lib/python3.12/site-packages/sphinx/util/__pycache__/_importer.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/domains/_domains_container.py /usr/lib/python3.12/site-packages/sphinx/util/_serialise.py /usr/lib/python3.12/site-packages/sphinx/domains/__pycac
 he__/_index.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/util/_files.py /usr/lib/python3.12/site-packages/sphinx/builders/html/_build_info.py /usr/lib/python3.12/site-packages/sphinx/domains/__pycache__/_domains_container.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/util/_uri.py /usr/lib/python3.12/site-packages/sphinx/util/__pycache__/_lines.cpython-312.pyc"
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx: PKGSIZE changed from 18525953 to 16422722 (-11%)
Changes to packages/core2-64-poky-linux/python3-sphinx (sysroot):
  /usr/lib/python3.12/site-packages/sphinx-8.0.2.dist-info moved to /usr/lib/python3.12/site-packages/sphinx-8.1.3.dist-info
  /usr/lib/python3.12/site-packages/sphinx/builders/html/_build_info.py was added
  /usr/lib/python3.12/site-packages/sphinx/builders/html/__pycache__/_build_info.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/sphinx/domains/_domains_container.py was added
  /usr/lib/python3.12/site-packages/sphinx/domains/_index.py was added
  /usr/lib/python3.12/site-packages/sphinx/domains/__pycache__/_domains_container.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/sphinx/domains/__pycache__/_index.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/sphinx/util/_files.py was added
  /usr/lib/python3.12/site-packages/sphinx/util/_importer.py was added
  /usr/lib/python3.12/site-packages/sphinx/util/_lines.py was added
  /usr/lib/python3.12/site-packages/sphinx/util/__pycache__/_files.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/sphinx/util/__pycache__/_importer.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/sphinx/util/__pycache__/_lines.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/sphinx/util/__pycache__/_serialise.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/sphinx/util/__pycache__/_uri.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/sphinx/util/_serialise.py was added
  /usr/lib/python3.12/site-packages/sphinx/util/_uri.py was added

--===============1509173914571861607==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-sphinx: PV changed from "8.0.2" to "8.1.3"
packages/core2-64-poky-linux/python3-sphinx: PKGV changed from 8.0.2 [default] to 8.1.3 [default]
packages/core2-64-poky-linux/python3-sphinx: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/sphinx/sphinx-8.0.2.tar.gz;downloadfilename=sphinx-8.0.2.tar.gz" to "https://files.pythonhosted.org/packages/source/s/sphinx/sphinx-8.1.3.tar.gz;downloadfilename=sphinx-8.1.3.tar.gz"
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-dbg: PV changed from "8.0.2" to "8.1.3"
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-dbg: PKGV changed from 8.0.2 [default] to 8.1.3 [default]
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-dev: PV changed from "8.0.2" to "8.1.3"
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-dev: PKGV changed from 8.0.2 [default] to 8.1.3 [default]
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-doc: PV changed from "8.0.2" to "8.1.3"
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-doc: PKGV changed from 8.0.2 [default] to 8.1.3 [default]
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-locale: PV changed from "8.0.2" to "8.1.3"
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-locale: PKGV changed from 8.0.2 [default] to 8.1.3 [default]
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-src: PV changed from "8.0.2" to "8.1.3"
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-src: PKGV changed from 8.0.2 [default] to 8.1.3 [default]
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-staticdev: PV changed from "8.0.2" to "8.1.3"
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-staticdev: PKGV changed from 8.0.2 [default] to 8.1.3 [default]
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx: PV changed from "8.0.2" to "8.1.3"
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx: PKGV changed from 8.0.2 [default] to 8.1.3 [default]
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx: FILELIST: directory renamed /usr/lib/python3.12/site-packages/sphinx-8.0.2.dist-info -> /usr/lib/python3.12/site-packages/sphinx-8.1.3.dist-info, added "/usr/lib/python3.12/site-packages/sphinx/domains/__pycache__/_domains_container.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/util/__pycache__/_files.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/util/__pycache__/_lines.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/util/_uri.py /usr/lib/python3.12/site-packages/sphinx/domains/_index.py /usr/lib/python3.12/site-packages/sphinx/builders/html/__pycache__/_build_info.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/util/_serialise.py /usr/lib/python3.12/site-packages/sphinx/domains/__pycache__/_index.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/util/__pycache__/_serialise.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/util/_lines.py /usr/lib/python3.12/site-packages/
 sphinx/domains/_domains_container.py /usr/lib/python3.12/site-packages/sphinx/util/_files.py /usr/lib/python3.12/site-packages/sphinx/util/_importer.py /usr/lib/python3.12/site-packages/sphinx/util/__pycache__/_importer.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/util/__pycache__/_uri.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/builders/html/_build_info.py"
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx: PKGSIZE changed from 18525953 to 16422722 (-11%)
Changes to packages/core2-64-poky-linux/python3-sphinx (sysroot):
  /usr/lib/python3.12/site-packages/sphinx-8.0.2.dist-info moved to /usr/lib/python3.12/site-packages/sphinx-8.1.3.dist-info
  /usr/lib/python3.12/site-packages/sphinx/builders/html/_build_info.py was added
  /usr/lib/python3.12/site-packages/sphinx/builders/html/__pycache__/_build_info.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/sphinx/domains/_domains_container.py was added
  /usr/lib/python3.12/site-packages/sphinx/domains/_index.py was added
  /usr/lib/python3.12/site-packages/sphinx/domains/__pycache__/_domains_container.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/sphinx/domains/__pycache__/_index.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/sphinx/util/_files.py was added
  /usr/lib/python3.12/site-packages/sphinx/util/_importer.py was added
  /usr/lib/python3.12/site-packages/sphinx/util/_lines.py was added
  /usr/lib/python3.12/site-packages/sphinx/util/__pycache__/_files.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/sphinx/util/__pycache__/_importer.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/sphinx/util/__pycache__/_lines.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/sphinx/util/__pycache__/_serialise.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/sphinx/util/__pycache__/_uri.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/sphinx/util/_serialise.py was added
  /usr/lib/python3.12/site-packages/sphinx/util/_uri.py was added

--===============1509173914571861607==--

