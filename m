Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77D6DCD98F5
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:31:51 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50408.1781195498601468821
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=meeW0PSS;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ERXAQTMX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019eb7866475-a8d30d00-321c-4cc7-b4b8-df57fff84751-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195498;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=G9TcLgreJaWlHRVK/m24k+JJtHjkKnIT4OIeIqVGKd4=;
	b=meeW0PSSAiaz9jeTDmwHYtery8ncOBYu3dQ2v9uhZW/d/FP/4mKg+n6hVVuzchMC
	xeeyz4NPS7AT/QjfT53IbhKNSoAzOg/Cxm9fcWv7MOAnXHDOT1rywpRc9/fC2M52MjQ
	VrPnxA7qHUjWbuju8lAD+qf2mGTi0Mzq7tZrBq0Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195498;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=G9TcLgreJaWlHRVK/m24k+JJtHjkKnIT4OIeIqVGKd4=;
	b=ERXAQTMXfpQov/Yx0XWYHrIaoh6WmZDcDopZVGiW28EC63qqlHX8wLjXyrgYRaQO
	BqUCXlzY72j9AQvKkQhGJCrps8FJ2qJ1MPZgjNTaqUwShMFj2Bh/iZZQiPooSHjvyRC
	gznStAF6CzpnnJAljpmZnNbeK3yYzO6IAQ72khI8=
Content-Type: multipart/mixed; boundary="===============3110268853073469611=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libslirp: upgrading to 4.9.3 SUCCEEDED
Message-ID: <0101019eb7866475-a8d30d00-321c-4cc7-b4b8-df57fff84751-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:31:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238472

--===============3110268853073469611==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libslirp* to *4.9.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libslirp-upgrade-4.9.1-4.9.3.patch
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
From 38f3ee998aee81e08279f3a6c29274e206fb1179 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 08:25:48 +0000
Subject: [PATCH] libslirp: upgrade 4.9.1 -> 4.9.3

---
 .../{libslirp_4.9.1.bb => libslirp_4.9.3.bb}  | 58 ++++++++++++++++++-
 1 file changed, 56 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/slirp/{libslirp_4.9.1.bb => libslirp_4.9.3.bb} (14%)

diff --git a/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb b/meta/recipes-connectivity/slirp/libslirp_4.9.3.bb
similarity index 14%
rename from meta/recipes-connectivity/slirp/libslirp_4.9.1.bb
rename to meta/recipes-connectivity/slirp/libslirp_4.9.3.bb
index 50577fd4ae..d412ad5a71 100644
--- a/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb
+++ b/meta/recipes-connectivity/slirp/libslirp_4.9.3.bb
@@ -1,11 +1,65 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- COPYRIGHT
+# +++ COPYRIGHT
+# @@ -9,38 +9,9 @@
+#  favorite charity (for example, GreenPeace).  This is not a requirement, but
+#  a suggestion from someone who highly values the service they provide.
+#  
+# -The copyright terms and conditions:
+# +See LICENSE for the full copyright terms and conditions.
+#  
+# ----BEGIN---
+# -
+# - Copyright (c) 1995,1996 Danny Gasparovski.  All rights reserved.
+# -
+# - Redistribution and use in source and binary forms, with or without
+# - modification, are permitted provided that the following conditions
+# - are met:
+# - 1. Redistributions of source code must retain the above copyright
+# -    notice, this list of conditions and the following disclaimer.
+# - 2. Redistributions in binary form must reproduce the above copyright
+# -    notice, this list of conditions and the following disclaimer in the
+# -    documentation and/or other materials provided with the distribution.
+# - 3. Neither the name of the copyright holder nor the names of its
+# -    contributors may be used to endorse or promote products derived
+# -    from this software without specific prior written permission.
+# -
+# - THIS SOFTWARE IS PROVIDED ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES,
+# - INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY
+# - AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL
+# - DANNY GASPAROVSKI OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
+# - INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
+# - NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+# - DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+# - THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+# - (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
+# - THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+# -
+# ----END---
+# -
+# -This basically means you can do anything you want with the software, except
+# +They basically mean you can do anything you want with the software, except
+#  1) call it your own, and 2) claim warranty on it.  There is no warranty for
+#  this software.  None.  Nada.  If you lose a million dollars while using
+#  Slirp, that's your loss not mine.  So, ***USE AT YOUR OWN RISK!***.
+# 
+#
+
 SUMMARY = "A general purpose TCP-IP emulator"
 DESCRIPTION = "A general purpose TCP-IP emulator used by virtual machine hypervisors to provide virtual networking services."
 HOMEPAGE = "https://gitlab.freedesktop.org/slirp/libslirp"
 LICENSE = "BSD-3-Clause & MIT"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=bca0186b14e6b05e338e729f106db727"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=f95a9bf4a7e411164fe843697ccda59e"
 
 SRC_URI = "git://gitlab.freedesktop.org/slirp/libslirp.git;protocol=https;branch=master"
-SRCREV = "9c744e1e52aa0d9646ed91d789d588696292c21e"
+SRCREV = "dd76415fce457e319d665eb8210d05c5731360ba"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 DEPENDS = "glib-2.0"
-- 
2.47.1


--===============3110268853073469611==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libslirp: PV changed from "4.9.1" to "4.9.3"
packages/x86-64-v3-poky-linux/libslirp: PKGV changed from 4.9.1 [default] to 4.9.3 [default]
packages/x86-64-v3-poky-linux/libslirp/libslirp-dbg: PV changed from "4.9.1" to "4.9.3"
packages/x86-64-v3-poky-linux/libslirp/libslirp-dbg: PKGSIZE changed from 595216 to 597336 (+0%)
packages/x86-64-v3-poky-linux/libslirp/libslirp-dbg: PKGV changed from 4.9.1 [default] to 4.9.3 [default]
packages/x86-64-v3-poky-linux/libslirp/libslirp-dev: PV changed from "4.9.1" to "4.9.3"
packages/x86-64-v3-poky-linux/libslirp/libslirp-dev: PKGV changed from 4.9.1 [default] to 4.9.3 [default]
packages/x86-64-v3-poky-linux/libslirp/libslirp-doc: PV changed from "4.9.1" to "4.9.3"
packages/x86-64-v3-poky-linux/libslirp/libslirp-doc: PKGV changed from 4.9.1 [default] to 4.9.3 [default]
packages/x86-64-v3-poky-linux/libslirp/libslirp-locale: PV changed from "4.9.1" to "4.9.3"
packages/x86-64-v3-poky-linux/libslirp/libslirp-locale: PKGV changed from 4.9.1 [default] to 4.9.3 [default]
packages/x86-64-v3-poky-linux/libslirp/libslirp-src: PV changed from "4.9.1" to "4.9.3"
packages/x86-64-v3-poky-linux/libslirp/libslirp-src: PKGSIZE changed from 585860 to 589021 (+1%)
packages/x86-64-v3-poky-linux/libslirp/libslirp-src: FILELIST: directory renamed /usr/src/debug/libslirp/4.9.1/src -> /usr/src/debug/libslirp/4.9.3/src
packages/x86-64-v3-poky-linux/libslirp/libslirp-src: PKGV changed from 4.9.1 [default] to 4.9.3 [default]
packages/x86-64-v3-poky-linux/libslirp/libslirp-staticdev: PV changed from "4.9.1" to "4.9.3"
packages/x86-64-v3-poky-linux/libslirp/libslirp-staticdev: PKGV changed from 4.9.1 [default] to 4.9.3 [default]
packages/x86-64-v3-poky-linux/libslirp/libslirp: PV changed from "4.9.1" to "4.9.3"
packages/x86-64-v3-poky-linux/libslirp/libslirp: PKGV changed from 4.9.1 [default] to 4.9.3 [default]

--===============3110268853073469611==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1980 targets, 62 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-a197cd465111b428bce482f80a9284575427a1ee"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:a197cd465111b428bce482f80a9284575427a1ee"
meta-yocto-bsp       
meta-poky            = "master:59c41245ad231f5320defcb275477e3d25a2203e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 339 Local 314 Mirrors 0 Missed 25 Current 249 (92% match, 95% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 312 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/slirp/libslirp_4.9.3.bb:do_populate_lic_setscene)
NOTE: Running setscene task 379 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 381 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 385 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/slirp/libslirp_4.9.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 390 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_create_spdx_setscene)
NOTE: Running setscene task 393 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 394 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 398 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_recipe_qa_setscene)
NOTE: Running task 878 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_write_config)
NOTE: Running task 909 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_write_config)
NOTE: Running task 911 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_write_config)
NOTE: Running task 927 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/slirp/libslirp_4.9.3.bb:do_write_config)
NOTE: recipe libslirp-4.9.3-r0: task do_populate_lic_setscene: Started
NOTE: recipe libslirp-4.9.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libslirp-4.9.3-r0: task do_write_config: Started
NOTE: recipe util-linux-2.41.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_write_config: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_write_config: Started
NOTE: recipe python3-3.14.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libslirp-4.9.3-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_write_config: Succeeded
NOTE: recipe libslirp-4.9.3-r0: task do_write_config: Succeeded
NOTE: recipe libslirp-4.9.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 399 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/slirp/libslirp_4.9.3.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_write_config: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 963 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_fetch)
NOTE: recipe libpcre2-10.47-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 400 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 401 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 402 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 403 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_populate_sysroot_setscene)
NOTE: Running task 965 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_fetch)
NOTE: recipe util-linux-2.41.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 404 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 407 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 408 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 409 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 410 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 411 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 416 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 420 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 424 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_spdx_setscene)
NOTE: recipe libslirp-4.9.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.47-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_fetch: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 425 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libslirp-4.9.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 966 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_unpack)
NOTE: Running task 967 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_unpack)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.14.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-3.14.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 969 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_fetch)
NOTE: Running task 971 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/slirp/libslirp_4.9.3.bb:do_fetch)
NOTE: recipe bash-completion-2.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 428 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 432 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_unpack: Started
NOTE: recipe python3-3.14.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 435 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 442 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_unpack: Started
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libslirp-4.9.3-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_fetch: Started
NOTE: Running setscene task 445 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 446 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_spdx_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_fetch: Succeeded
NOTE: Running task 972 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_unpack)
NOTE: recipe bash-completion-2.17.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_unpack: Started
NOTE: recipe libslirp-4.9.3-r0: task do_fetch: Succeeded
NOTE: Running task 978 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/slirp/libslirp_4.9.3.bb:do_unpack)
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 449 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 450 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-3.14.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 452 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 453 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 454 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 455 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 456 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 457 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 458 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 459 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libslirp-4.9.3-r0: task do_unpack: Started
NOTE: Running setscene task 460 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_unpack: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 461 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 462 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 463 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 465 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 467 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 469 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_unpack: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 474 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 475 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 477 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe openssl-3.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 979 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_patch)
NOTE: Running setscene task 483 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 980 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_patch)
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 486 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 487 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 488 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_patch: Started
NOTE: recipe expat-2.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_patch: Started
NOTE: Running setscene task 491 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.53.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 492 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 493 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 494 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 495 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 497 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 498 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 503 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 506 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 509 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 510 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 511 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libslirp-4.9.3-r0: task do_unpack: Succeeded
NOTE: Running setscene task 512 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_unpack: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 515 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 520 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 522 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 523 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 525 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.53.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 526 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 530 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 533 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 534 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1020 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_patch)
NOTE: Running setscene task 536 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 537 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 542 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 544 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 548 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1049 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/slirp/libslirp_4.9.3.bb:do_patch)
NOTE: Running task 1053 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_create_recipe_spdx)
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libslirp-4.9.3-r0: task do_patch: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1094 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_deploy_source_date_epoch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 551 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 554 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 555 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 556 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_packagedata_setscene)
NOTE: recipe libslirp-4.9.3-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1118 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_recipe_spdx)
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_deploy_source_date_epoch unihash changed to d84e1468782d09b6ebe187a3f0e169ffda9241363b3e7ed7495292a88db4e2f8
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx: Started
NOTE: Running setscene task 553 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_patch: Succeeded
NOTE: Running task 1124 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 559 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 561 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1125 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_create_recipe_spdx)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 563 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 564 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 566 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 568 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 569 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 570 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_deploy_source_date_epoch unihash changed to d84e1468782d09b6ebe187a3f0e169ffda9241363b3e7ed7495292a88db4e2f8
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1130 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/slirp/libslirp_4.9.3.bb:do_create_recipe_spdx)
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 571 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 573 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 575 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 576 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libslirp-4.9.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 584 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 586 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libslirp-4.9.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 588 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1305 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1416 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_configure)
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_configure: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_configure: Succeeded
NOTE: Running task 1417 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1418 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_compile)
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_compile: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_compile: Succeeded
NOTE: Running task 1419 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1420 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_install)
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_install: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_install: Succeeded
NOTE: Running task 1421 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1422 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_populate_sysroot)
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1423 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1424 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_create_spdx)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_create_spdx: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1425 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_configure)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_configure: Succeeded
NOTE: Running task 1426 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_compile: Succeeded
NOTE: Running task 1427 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_install)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_install: Succeeded
NOTE: Running task 1428 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot)
NOTE: Running task 1429 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_package)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot unihash changed to 74fdaf5853aecaaeb686fa2f0624f1a5a1b47e0553a26ff9484632a3d62e2533
NOTE: Setscene tasks completed
NOTE: Running task 1430 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1431 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_configure)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_package unihash changed to bef8aad4ce996dc1f882a9ab6dcfac896d48599433c5446f5a087f4af3b5e564
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_packagedata became valid
NOTE: Running setscene task 587 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1433 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_spdx)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1434 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1435 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_compile)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_compile: Succeeded
NOTE: Running task 1436 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1437 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_install)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_install: Succeeded
NOTE: Running task 1438 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1439 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_package)
NOTE: Running task 1440 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_populate_sysroot)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1441 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/slirp/libslirp_4.9.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libslirp-4.9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libslirp-4.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1442 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/slirp/libslirp_4.9.3.bb:do_configure)
NOTE: recipe libslirp-4.9.3-r0: task do_configure: Started
NOTE: recipe libslirp-4.9.3-r0: task do_configure: Succeeded
NOTE: Running task 1443 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/slirp/libslirp_4.9.3.bb:do_compile)
NOTE: recipe libslirp-4.9.3-r0: task do_compile: Started
NOTE: recipe libslirp-4.9.3-r0: task do_compile: Succeeded
NOTE: Running task 1444 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/slirp/libslirp_4.9.3.bb:do_install)
NOTE: recipe libslirp-4.9.3-r0: task do_install: Started
NOTE: recipe libslirp-4.9.3-r0: task do_install: Succeeded
NOTE: Running task 1445 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/slirp/libslirp_4.9.3.bb:do_populate_sysroot)
NOTE: recipe libslirp-4.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe libslirp-4.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_package: Succeeded
NOTE: Running task 1446 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1446 tasks of which 1393 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260611082409.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260611082409.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/glib-2.0/2.88.0/temp/log.do_packagedata.217635
Summary: There were 112 ERROR messages, returning a non-zero exit code.
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-src went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dbg went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-ptest went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-staticdev went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dev went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-doc went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ab went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-af went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-am went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-an went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ar went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-as went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ast went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-az went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be+latin went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bg went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn-in went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bs went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca+valencia went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cs went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cy went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-da went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-de went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-dz went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-el went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en+shaw went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-ca went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-gb went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eo went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-es went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-et went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eu went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fa went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fi went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fr went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fur went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ga went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gd went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gl went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gu went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-he went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hi went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hr went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hu went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hy went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-id went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ie went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-is went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-it went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ja went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ka went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kab went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kk went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kn went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ko went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ku went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lt went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lv went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mai went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mg went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mk went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ml went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mn went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mr went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ms went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nb went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nds went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ne went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nl went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nn went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-oc went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-or went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pa went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pl went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ps went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt-br went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ro went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ru went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-rw went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-si went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sk went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sl went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sq went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+ije went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+latin went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sv went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ta went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-te went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tg went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-th went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tl went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tr went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tt went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ug went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-uk went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-vi went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-wa went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-xh went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-yi went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-cn went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-hk went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-tw went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-bash-completion went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0 went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-codegen went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-utils went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/glib-2.0/2.88.0/temp/log.do_packagedata.217635
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_packagedata) failed with exit code '1'

--===============3110268853073469611==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libslirp-upgrade-4.9.1-4.9.3.patch"

RnJvbSAzOGYzZWU5OThhZWU4MWUwODI3OWYzYTZjMjkyNzRlMjA2ZmIxMTc5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMDg6MjU6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJzbGlycDogdXBncmFkZSA0LjkuMSAtPiA0LjkuMwoKLS0tCiAuLi4ve2xpYnNsaXJwXzQuOS4x
LmJiID0+IGxpYnNsaXJwXzQuOS4zLmJifSAgfCA1OCArKysrKysrKysrKysrKysrKystCiAxIGZp
bGUgY2hhbmdlZCwgNTYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L3NsaXJwL3tsaWJzbGlycF80LjkuMS5iYiA9PiBsaWJzbGly
cF80LjkuMy5iYn0gKDE0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L3NsaXJwL2xpYnNsaXJwXzQuOS4xLmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9zbGly
cC9saWJzbGlycF80LjkuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDE0JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L3NsaXJwL2xpYnNsaXJwXzQuOS4xLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L3NsaXJwL2xpYnNsaXJwXzQuOS4zLmJiCmluZGV4IDUw
NTc3ZmQ0YWUuLmQ0MTJhZDVhNzEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvc2xpcnAvbGlic2xpcnBfNC45LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9zbGlycC9saWJzbGlycF80LjkuMy5iYgpAQCAtMSwxMSArMSw2NSBAQAorIyBGSVhNRTogdGhl
IExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVw
Z3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9s
ZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0Ug
dmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21t
aXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vu
c2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoK
KyMKKyMgLS0tIENPUFlSSUdIVAorIyArKysgQ09QWVJJR0hUCisjIEBAIC05LDM4ICs5LDkgQEAK
KyMgIGZhdm9yaXRlIGNoYXJpdHkgKGZvciBleGFtcGxlLCBHcmVlblBlYWNlKS4gIFRoaXMgaXMg
bm90IGEgcmVxdWlyZW1lbnQsIGJ1dAorIyAgYSBzdWdnZXN0aW9uIGZyb20gc29tZW9uZSB3aG8g
aGlnaGx5IHZhbHVlcyB0aGUgc2VydmljZSB0aGV5IHByb3ZpZGUuCisjICAKKyMgLVRoZSBjb3B5
cmlnaHQgdGVybXMgYW5kIGNvbmRpdGlvbnM6CisjICtTZWUgTElDRU5TRSBmb3IgdGhlIGZ1bGwg
Y29weXJpZ2h0IHRlcm1zIGFuZCBjb25kaXRpb25zLgorIyAgCisjIC0tLS1CRUdJTi0tLQorIyAt
CisjIC0gQ29weXJpZ2h0IChjKSAxOTk1LDE5OTYgRGFubnkgR2FzcGFyb3Zza2kuICBBbGwgcmln
aHRzIHJlc2VydmVkLgorIyAtCisjIC0gUmVkaXN0cmlidXRpb24gYW5kIHVzZSBpbiBzb3VyY2Ug
YW5kIGJpbmFyeSBmb3Jtcywgd2l0aCBvciB3aXRob3V0CisjIC0gbW9kaWZpY2F0aW9uLCBhcmUg
cGVybWl0dGVkIHByb3ZpZGVkIHRoYXQgdGhlIGZvbGxvd2luZyBjb25kaXRpb25zCisjIC0gYXJl
IG1ldDoKKyMgLSAxLiBSZWRpc3RyaWJ1dGlvbnMgb2Ygc291cmNlIGNvZGUgbXVzdCByZXRhaW4g
dGhlIGFib3ZlIGNvcHlyaWdodAorIyAtICAgIG5vdGljZSwgdGhpcyBsaXN0IG9mIGNvbmRpdGlv
bnMgYW5kIHRoZSBmb2xsb3dpbmcgZGlzY2xhaW1lci4KKyMgLSAyLiBSZWRpc3RyaWJ1dGlvbnMg
aW4gYmluYXJ5IGZvcm0gbXVzdCByZXByb2R1Y2UgdGhlIGFib3ZlIGNvcHlyaWdodAorIyAtICAg
IG5vdGljZSwgdGhpcyBsaXN0IG9mIGNvbmRpdGlvbnMgYW5kIHRoZSBmb2xsb3dpbmcgZGlzY2xh
aW1lciBpbiB0aGUKKyMgLSAgICBkb2N1bWVudGF0aW9uIGFuZC9vciBvdGhlciBtYXRlcmlhbHMg
cHJvdmlkZWQgd2l0aCB0aGUgZGlzdHJpYnV0aW9uLgorIyAtIDMuIE5laXRoZXIgdGhlIG5hbWUg
b2YgdGhlIGNvcHlyaWdodCBob2xkZXIgbm9yIHRoZSBuYW1lcyBvZiBpdHMKKyMgLSAgICBjb250
cmlidXRvcnMgbWF5IGJlIHVzZWQgdG8gZW5kb3JzZSBvciBwcm9tb3RlIHByb2R1Y3RzIGRlcml2
ZWQKKyMgLSAgICBmcm9tIHRoaXMgc29mdHdhcmUgd2l0aG91dCBzcGVjaWZpYyBwcmlvciB3cml0
dGVuIHBlcm1pc3Npb24uCisjIC0KKyMgLSBUSElTIFNPRlRXQVJFIElTIFBST1ZJREVEIGBgQVMg
SVMnJyBBTkQgQU5ZIEVYUFJFU1MgT1IgSU1QTElFRCBXQVJSQU5USUVTLAorIyAtIElOQ0xVRElO
RywgQlVUIE5PVCBMSU1JVEVEIFRPLCBUSEUgSU1QTElFRCBXQVJSQU5USUVTIE9GIE1FUkNIQU5U
QUJJTElUWQorIyAtIEFORCBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRSBBUkUgRElT
Q0xBSU1FRC4gIElOIE5PIEVWRU5UIFNIQUxMCisjIC0gREFOTlkgR0FTUEFST1ZTS0kgT1IgQ09O
VFJJQlVUT1JTIEJFIExJQUJMRSBGT1IgQU5ZIERJUkVDVCwgSU5ESVJFQ1QsCisjIC0gSU5DSURF
TlRBTCwgU1BFQ0lBTCwgRVhFTVBMQVJZLCBPUiBDT05TRVFVRU5USUFMIERBTUFHRVMgKElOQ0xV
RElORywgQlVUCisjIC0gTk9UIExJTUlURUQgVE8sIFBST0NVUkVNRU5UIE9GIFNVQlNUSVRVVEUg
R09PRFMgT1IgU0VSVklDRVM7IExPU1MgT0YgVVNFLAorIyAtIERBVEEsIE9SIFBST0ZJVFM7IE9S
IEJVU0lORVNTIElOVEVSUlVQVElPTikgSE9XRVZFUiBDQVVTRUQgQU5EIE9OIEFOWQorIyAtIFRI
RU9SWSBPRiBMSUFCSUxJVFksIFdIRVRIRVIgSU4gQ09OVFJBQ1QsIFNUUklDVCBMSUFCSUxJVFks
IE9SIFRPUlQKKyMgLSAoSU5DTFVESU5HIE5FR0xJR0VOQ0UgT1IgT1RIRVJXSVNFKSBBUklTSU5H
IElOIEFOWSBXQVkgT1VUIE9GIFRIRSBVU0UgT0YKKyMgLSBUSElTIFNPRlRXQVJFLCBFVkVOIElG
IEFEVklTRUQgT0YgVEhFIFBPU1NJQklMSVRZIE9GIFNVQ0ggREFNQUdFLgorIyAtCisjIC0tLS1F
TkQtLS0KKyMgLQorIyAtVGhpcyBiYXNpY2FsbHkgbWVhbnMgeW91IGNhbiBkbyBhbnl0aGluZyB5
b3Ugd2FudCB3aXRoIHRoZSBzb2Z0d2FyZSwgZXhjZXB0CisjICtUaGV5IGJhc2ljYWxseSBtZWFu
IHlvdSBjYW4gZG8gYW55dGhpbmcgeW91IHdhbnQgd2l0aCB0aGUgc29mdHdhcmUsIGV4Y2VwdAor
IyAgMSkgY2FsbCBpdCB5b3VyIG93biwgYW5kIDIpIGNsYWltIHdhcnJhbnR5IG9uIGl0LiAgVGhl
cmUgaXMgbm8gd2FycmFudHkgZm9yCisjICB0aGlzIHNvZnR3YXJlLiAgTm9uZS4gIE5hZGEuICBJ
ZiB5b3UgbG9zZSBhIG1pbGxpb24gZG9sbGFycyB3aGlsZSB1c2luZworIyAgU2xpcnAsIHRoYXQn
cyB5b3VyIGxvc3Mgbm90IG1pbmUuICBTbywgKioqVVNFIEFUIFlPVVIgT1dOIFJJU0shKioqLgor
IyAKKyMKKwogU1VNTUFSWSA9ICJBIGdlbmVyYWwgcHVycG9zZSBUQ1AtSVAgZW11bGF0b3IiCiBE
RVNDUklQVElPTiA9ICJBIGdlbmVyYWwgcHVycG9zZSBUQ1AtSVAgZW11bGF0b3IgdXNlZCBieSB2
aXJ0dWFsIG1hY2hpbmUgaHlwZXJ2aXNvcnMgdG8gcHJvdmlkZSB2aXJ0dWFsIG5ldHdvcmtpbmcg
c2VydmljZXMuIgogSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3Ns
aXJwL2xpYnNsaXJwIgogTElDRU5TRSA9ICJCU0QtMy1DbGF1c2UgJiBNSVQiCi1MSUNfRklMRVNf
Q0hLU1VNID0gImZpbGU6Ly9DT1BZUklHSFQ7bWQ1PWJjYTAxODZiMTRlNmIwNWUzMzhlNzI5ZjEw
NmRiNzI3IgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWVJJR0hUO21kNT1mOTVhOWJm
NGE3ZTQxMTE2NGZlODQzNjk3Y2NkYTU5ZSIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRsYWIuZnJl
ZWRlc2t0b3Aub3JnL3NsaXJwL2xpYnNsaXJwLmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFz
dGVyIgotU1JDUkVWID0gIjljNzQ0ZTFlNTJhYTBkOTY0NmVkOTFkNzg5ZDU4ODY5NjI5MmMyMWUi
CitTUkNSRVYgPSAiZGQ3NjQxNWZjZTQ1N2UzMTlkNjY1ZWI4MjEwZDA1YzU3MzEzNjBiYSIKIFVQ
U1RSRUFNX0NIRUNLX0dJVFRBR1JFR0VYID0gInYoP1A8cHZlcj5cZCsoXC5cZCspKykiCiAKIERF
UEVORFMgPSAiZ2xpYi0yLjAiCi0tIAoyLjQ3LjEKCg==

--===============3110268853073469611==--

