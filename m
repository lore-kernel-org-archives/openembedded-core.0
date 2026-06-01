Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A29F0CD6E7B
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:42 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1561.1780328133528185887
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=u5DXevQg;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=WEeaQ80U;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019e83d36f00-c09278e6-441b-4adb-8c08-28d40c073622-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328133;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=kzySLfjLR9b4kcKUXhX1Pu7Mp7ColY/akocvnqdmTcs=;
	b=u5DXevQgaglnwVGkE+Oj/QWSllseRVaDtVt4PVQwmuKnL/uVQ8i9CbBQ2dCaaORJ
	Uo3GFKUrekedxhg/V2HjRm1Y0yGzCceKsa53r2mSZ9QvKm8Lub0p8ZH2Hz0mk2wguWM
	okRnG5N9uHICwGQi9O9f6rkpSZDjD4yHuVdJ+dUE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328133;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=kzySLfjLR9b4kcKUXhX1Pu7Mp7ColY/akocvnqdmTcs=;
	b=WEeaQ80UJgzCKNxkIsx8FpmmtSeU9B0Q6XWaQr23PnQm7B51ydC35EeOaMy83BpN
	yAmtFFGTOFMyi0dSaBfTTf5I3lSJCvRVbNP+B+yxcrcZIlNYRDMIFpYk/xQU4UpnSWS
	mD3cirI26mVclIElJhoo6izhjrM9zaLyaPi3T8dY=
Content-Type: multipart/mixed; boundary="===============6306039484867927923=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libslirp: upgrading to 4.9.3 SUCCEEDED
Message-ID: <0101019e83d36f00-c09278e6-441b-4adb-8c08-28d40c073622-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:32 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237860

--===============6306039484867927923==
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
From 20724020459867ba978ef02aa166c60b82473b9f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 07:27:05 +0000
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


--===============6306039484867927923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1975 targets, 62 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-99a57537a02cd3b58e3e38a21811214b78923264"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:99a57537a02cd3b58e3e38a21811214b78923264"
meta-yocto-bsp       
meta-poky            = "master:d13ca2a2e0f478046d920b8fc7dd3098952b5ad8"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 319 Local 294 Mirrors 0 Missed 25 Current 269 (92% match, 95% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 320 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/slirp/libslirp_4.9.3.bb:do_populate_lic_setscene)
NOTE: Running setscene task 369 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 373 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 388 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 391 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_create_spdx_setscene)
NOTE: Running setscene task 394 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 395 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 830 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_write_config)
NOTE: Running task 843 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_write_config)
NOTE: Running task 844 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_write_config)
NOTE: Running task 845 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/slirp/libslirp_4.9.3.bb:do_write_config)
NOTE: recipe libslirp-4.9.3-r0: task do_populate_lic_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_write_config: Started
NOTE: recipe util-linux-2.41.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libslirp-4.9.3-r0: task do_write_config: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_write_config: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_write_config: Started
NOTE: recipe python3-3.14.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_write_config: Succeeded
NOTE: recipe libslirp-4.9.3-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_write_config: Succeeded
NOTE: Running task 876 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/slirp/libslirp_4.9.3.bb:do_recipe_qa)
NOTE: recipe libslirp-4.9.3-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_write_config: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 398 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.47-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 399 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 400 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 401 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 402 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 403 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 404 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 405 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 407 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 408 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 411 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 412 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 414 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 416 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 418 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libslirp-4.9.3-r0: task do_recipe_qa: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 425 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.14.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.14.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-3.14.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 878 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_fetch)
NOTE: Running task 880 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_fetch)
NOTE: recipe bash-completion-2.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 882 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_fetch)
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 428 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 432 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 433 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 443 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libslirp-4.9.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 883 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/slirp/libslirp_4.9.3.bb:do_fetch)
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_fetch: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_fetch: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_fetch: Succeeded
NOTE: Running task 884 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_unpack)
NOTE: Running task 885 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 445 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 446 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running task 886 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_unpack)
NOTE: recipe libffi-3.5.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libslirp-4.9.3-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-3.14.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 449 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 450 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 451 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 452 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 453 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 454 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 455 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 456 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 458 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 459 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libslirp-4.9.3-r0: task do_fetch: Succeeded
NOTE: Running setscene task 460 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 461 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_unpack: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 462 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 463 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 464 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 465 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 466 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 467 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 475 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 476 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 478 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 892 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_patch)
NOTE: recipe openssl-3.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 893 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/slirp/libslirp_4.9.3.bb:do_unpack)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 482 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_unpack: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 894 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_patch)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 485 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libslirp-4.9.3-r0: task do_unpack: Started
NOTE: Running setscene task 487 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_patch: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 488 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 489 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 490 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.14.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 491 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 494 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 495 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 497 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 499 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 500 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 501 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 502 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 503 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_unpack: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 504 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 505 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 508 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 511 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 512 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 516 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 525 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 531 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 533 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 536 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.53.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 538 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 540 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running task 1008 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_patch)
NOTE: recipe expat-2.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 542 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 544 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1066 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_create_recipe_spdx)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_patch: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 549 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libslirp-4.9.3-r0: task do_unpack: Succeeded
NOTE: Running task 1098 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/slirp/libslirp_4.9.3.bb:do_patch)
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 552 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libslirp-4.9.3-r0: task do_patch: Started
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 554 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 556 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 557 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libslirp-4.9.3-r0: task do_patch: Succeeded
NOTE: Running task 1111 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/slirp/libslirp_4.9.3.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1113 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_recipe_spdx)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libslirp-4.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_patch: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 559 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_packagedata_setscene)
NOTE: recipe libslirp-4.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1125 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_create_recipe_spdx)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 560 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 562 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 564 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 565 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 566 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 569 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 570 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 571 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1128 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/slirp/libslirp_4.9.3.bb:do_create_recipe_spdx)
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libslirp-4.9.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 575 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 576 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 577 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 581 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libslirp-4.9.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 584 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 586 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 588 of 588 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
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
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot unihash changed to 336af8762bcfc3f636ed8f13f73e18941bbf98559f61b69ede60bfe1b97d77a5
NOTE: Setscene tasks completed
NOTE: Running task 1430 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1431 of 1456 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_configure)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_package unihash changed to c370875f792068847529cb1986184f960b5c31cfdd7a0795dc460e05b0975778
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
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_package: Started
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
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260601072527.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260601072527.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/glib-2.0/2.88.0/temp/log.do_packagedata.45545
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
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/glib-2.0/2.88.0/temp/log.do_packagedata.45545
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_packagedata) failed with exit code '1'

--===============6306039484867927923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libslirp: PV changed from "4.9.1" to "4.9.3"
packages/x86-64-v3-poky-linux/libslirp: PKGV changed from 4.9.1 [default] to 4.9.3 [default]
packages/x86-64-v3-poky-linux/libslirp/libslirp-dbg: PV changed from "4.9.1" to "4.9.3"
packages/x86-64-v3-poky-linux/libslirp/libslirp-dbg: PKGV changed from 4.9.1 [default] to 4.9.3 [default]
packages/x86-64-v3-poky-linux/libslirp/libslirp-dbg: PKGSIZE changed from 595216 to 597336 (+0%)
packages/x86-64-v3-poky-linux/libslirp/libslirp-dev: PV changed from "4.9.1" to "4.9.3"
packages/x86-64-v3-poky-linux/libslirp/libslirp-dev: PKGV changed from 4.9.1 [default] to 4.9.3 [default]
packages/x86-64-v3-poky-linux/libslirp/libslirp-doc: PV changed from "4.9.1" to "4.9.3"
packages/x86-64-v3-poky-linux/libslirp/libslirp-doc: PKGV changed from 4.9.1 [default] to 4.9.3 [default]
packages/x86-64-v3-poky-linux/libslirp/libslirp-locale: PV changed from "4.9.1" to "4.9.3"
packages/x86-64-v3-poky-linux/libslirp/libslirp-locale: PKGV changed from 4.9.1 [default] to 4.9.3 [default]
packages/x86-64-v3-poky-linux/libslirp/libslirp-src: PV changed from "4.9.1" to "4.9.3"
packages/x86-64-v3-poky-linux/libslirp/libslirp-src: FILELIST: directory renamed /usr/src/debug/libslirp/4.9.1/src -> /usr/src/debug/libslirp/4.9.3/src
packages/x86-64-v3-poky-linux/libslirp/libslirp-src: PKGV changed from 4.9.1 [default] to 4.9.3 [default]
packages/x86-64-v3-poky-linux/libslirp/libslirp-src: PKGSIZE changed from 585860 to 589021 (+1%)
packages/x86-64-v3-poky-linux/libslirp/libslirp-staticdev: PV changed from "4.9.1" to "4.9.3"
packages/x86-64-v3-poky-linux/libslirp/libslirp-staticdev: PKGV changed from 4.9.1 [default] to 4.9.3 [default]
packages/x86-64-v3-poky-linux/libslirp/libslirp: PV changed from "4.9.1" to "4.9.3"
packages/x86-64-v3-poky-linux/libslirp/libslirp: PKGV changed from 4.9.1 [default] to 4.9.3 [default]

--===============6306039484867927923==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libslirp-upgrade-4.9.1-4.9.3.patch"

RnJvbSAyMDcyNDAyMDQ1OTg2N2JhOTc4ZWYwMmFhMTY2YzYwYjgyNDczYjlmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAwNzoyNzowNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnNsaXJwOiB1cGdyYWRlIDQuOS4xIC0+IDQuOS4zCgotLS0KIC4uLi97bGlic2xpcnBfNC45LjEu
YmIgPT4gbGlic2xpcnBfNC45LjMuYmJ9ICB8IDU4ICsrKysrKysrKysrKysrKysrKy0KIDEgZmls
ZSBjaGFuZ2VkLCA1NiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1jb25uZWN0aXZpdHkvc2xpcnAve2xpYnNsaXJwXzQuOS4xLmJiID0+IGxpYnNsaXJw
XzQuOS4zLmJifSAoMTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
c2xpcnAvbGlic2xpcnBfNC45LjEuYmIgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L3NsaXJw
L2xpYnNsaXJwXzQuOS4zLmJiCnNpbWlsYXJpdHkgaW5kZXggMTQlCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1jb25uZWN0aXZpdHkvc2xpcnAvbGlic2xpcnBfNC45LjEuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvc2xpcnAvbGlic2xpcnBfNC45LjMuYmIKaW5kZXggNTA1
NzdmZDRhZS4uZDQxMmFkNWE3MSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9zbGlycC9saWJzbGlycF80LjkuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L3NsaXJwL2xpYnNsaXJwXzQuOS4zLmJiCkBAIC0xLDExICsxLDY1IEBACisjIEZJWE1FOiB0aGUg
TElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBn
cmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xk
IGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2
YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1p
dCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5z
ZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgor
IworIyAtLS0gQ09QWVJJR0hUCisjICsrKyBDT1BZUklHSFQKKyMgQEAgLTksMzggKzksOSBAQAor
IyAgZmF2b3JpdGUgY2hhcml0eSAoZm9yIGV4YW1wbGUsIEdyZWVuUGVhY2UpLiAgVGhpcyBpcyBu
b3QgYSByZXF1aXJlbWVudCwgYnV0CisjICBhIHN1Z2dlc3Rpb24gZnJvbSBzb21lb25lIHdobyBo
aWdobHkgdmFsdWVzIHRoZSBzZXJ2aWNlIHRoZXkgcHJvdmlkZS4KKyMgIAorIyAtVGhlIGNvcHly
aWdodCB0ZXJtcyBhbmQgY29uZGl0aW9uczoKKyMgK1NlZSBMSUNFTlNFIGZvciB0aGUgZnVsbCBj
b3B5cmlnaHQgdGVybXMgYW5kIGNvbmRpdGlvbnMuCisjICAKKyMgLS0tLUJFR0lOLS0tCisjIC0K
KyMgLSBDb3B5cmlnaHQgKGMpIDE5OTUsMTk5NiBEYW5ueSBHYXNwYXJvdnNraS4gIEFsbCByaWdo
dHMgcmVzZXJ2ZWQuCisjIC0KKyMgLSBSZWRpc3RyaWJ1dGlvbiBhbmQgdXNlIGluIHNvdXJjZSBh
bmQgYmluYXJ5IGZvcm1zLCB3aXRoIG9yIHdpdGhvdXQKKyMgLSBtb2RpZmljYXRpb24sIGFyZSBw
ZXJtaXR0ZWQgcHJvdmlkZWQgdGhhdCB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnMKKyMgLSBhcmUg
bWV0OgorIyAtIDEuIFJlZGlzdHJpYnV0aW9ucyBvZiBzb3VyY2UgY29kZSBtdXN0IHJldGFpbiB0
aGUgYWJvdmUgY29weXJpZ2h0CisjIC0gICAgbm90aWNlLCB0aGlzIGxpc3Qgb2YgY29uZGl0aW9u
cyBhbmQgdGhlIGZvbGxvd2luZyBkaXNjbGFpbWVyLgorIyAtIDIuIFJlZGlzdHJpYnV0aW9ucyBp
biBiaW5hcnkgZm9ybSBtdXN0IHJlcHJvZHVjZSB0aGUgYWJvdmUgY29weXJpZ2h0CisjIC0gICAg
bm90aWNlLCB0aGlzIGxpc3Qgb2YgY29uZGl0aW9ucyBhbmQgdGhlIGZvbGxvd2luZyBkaXNjbGFp
bWVyIGluIHRoZQorIyAtICAgIGRvY3VtZW50YXRpb24gYW5kL29yIG90aGVyIG1hdGVyaWFscyBw
cm92aWRlZCB3aXRoIHRoZSBkaXN0cmlidXRpb24uCisjIC0gMy4gTmVpdGhlciB0aGUgbmFtZSBv
ZiB0aGUgY29weXJpZ2h0IGhvbGRlciBub3IgdGhlIG5hbWVzIG9mIGl0cworIyAtICAgIGNvbnRy
aWJ1dG9ycyBtYXkgYmUgdXNlZCB0byBlbmRvcnNlIG9yIHByb21vdGUgcHJvZHVjdHMgZGVyaXZl
ZAorIyAtICAgIGZyb20gdGhpcyBzb2Z0d2FyZSB3aXRob3V0IHNwZWNpZmljIHByaW9yIHdyaXR0
ZW4gcGVybWlzc2lvbi4KKyMgLQorIyAtIFRISVMgU09GVFdBUkUgSVMgUFJPVklERUQgYGBBUyBJ
UycnIEFORCBBTlkgRVhQUkVTUyBPUiBJTVBMSUVEIFdBUlJBTlRJRVMsCisjIC0gSU5DTFVESU5H
LCBCVVQgTk9UIExJTUlURUQgVE8sIFRIRSBJTVBMSUVEIFdBUlJBTlRJRVMgT0YgTUVSQ0hBTlRB
QklMSVRZCisjIC0gQU5EIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFIEFSRSBESVND
TEFJTUVELiAgSU4gTk8gRVZFTlQgU0hBTEwKKyMgLSBEQU5OWSBHQVNQQVJPVlNLSSBPUiBDT05U
UklCVVRPUlMgQkUgTElBQkxFIEZPUiBBTlkgRElSRUNULCBJTkRJUkVDVCwKKyMgLSBJTkNJREVO
VEFMLCBTUEVDSUFMLCBFWEVNUExBUlksIE9SIENPTlNFUVVFTlRJQUwgREFNQUdFUyAoSU5DTFVE
SU5HLCBCVVQKKyMgLSBOT1QgTElNSVRFRCBUTywgUFJPQ1VSRU1FTlQgT0YgU1VCU1RJVFVURSBH
T09EUyBPUiBTRVJWSUNFUzsgTE9TUyBPRiBVU0UsCisjIC0gREFUQSwgT1IgUFJPRklUUzsgT1Ig
QlVTSU5FU1MgSU5URVJSVVBUSU9OKSBIT1dFVkVSIENBVVNFRCBBTkQgT04gQU5ZCisjIC0gVEhF
T1JZIE9GIExJQUJJTElUWSwgV0hFVEhFUiBJTiBDT05UUkFDVCwgU1RSSUNUIExJQUJJTElUWSwg
T1IgVE9SVAorIyAtIChJTkNMVURJTkcgTkVHTElHRU5DRSBPUiBPVEhFUldJU0UpIEFSSVNJTkcg
SU4gQU5ZIFdBWSBPVVQgT0YgVEhFIFVTRSBPRgorIyAtIFRISVMgU09GVFdBUkUsIEVWRU4gSUYg
QURWSVNFRCBPRiBUSEUgUE9TU0lCSUxJVFkgT0YgU1VDSCBEQU1BR0UuCisjIC0KKyMgLS0tLUVO
RC0tLQorIyAtCisjIC1UaGlzIGJhc2ljYWxseSBtZWFucyB5b3UgY2FuIGRvIGFueXRoaW5nIHlv
dSB3YW50IHdpdGggdGhlIHNvZnR3YXJlLCBleGNlcHQKKyMgK1RoZXkgYmFzaWNhbGx5IG1lYW4g
eW91IGNhbiBkbyBhbnl0aGluZyB5b3Ugd2FudCB3aXRoIHRoZSBzb2Z0d2FyZSwgZXhjZXB0Cisj
ICAxKSBjYWxsIGl0IHlvdXIgb3duLCBhbmQgMikgY2xhaW0gd2FycmFudHkgb24gaXQuICBUaGVy
ZSBpcyBubyB3YXJyYW50eSBmb3IKKyMgIHRoaXMgc29mdHdhcmUuICBOb25lLiAgTmFkYS4gIElm
IHlvdSBsb3NlIGEgbWlsbGlvbiBkb2xsYXJzIHdoaWxlIHVzaW5nCisjICBTbGlycCwgdGhhdCdz
IHlvdXIgbG9zcyBub3QgbWluZS4gIFNvLCAqKipVU0UgQVQgWU9VUiBPV04gUklTSyEqKiouCisj
IAorIworCiBTVU1NQVJZID0gIkEgZ2VuZXJhbCBwdXJwb3NlIFRDUC1JUCBlbXVsYXRvciIKIERF
U0NSSVBUSU9OID0gIkEgZ2VuZXJhbCBwdXJwb3NlIFRDUC1JUCBlbXVsYXRvciB1c2VkIGJ5IHZp
cnR1YWwgbWFjaGluZSBoeXBlcnZpc29ycyB0byBwcm92aWRlIHZpcnR1YWwgbmV0d29ya2luZyBz
ZXJ2aWNlcy4iCiBIT01FUEFHRSA9ICJodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvc2xp
cnAvbGlic2xpcnAiCiBMSUNFTlNFID0gIkJTRC0zLUNsYXVzZSAmIE1JVCIKLUxJQ19GSUxFU19D
SEtTVU0gPSAiZmlsZTovL0NPUFlSSUdIVDttZDU9YmNhMDE4NmIxNGU2YjA1ZTMzOGU3MjlmMTA2
ZGI3MjciCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZUklHSFQ7bWQ1PWY5NWE5YmY0
YTdlNDExMTY0ZmU4NDM2OTdjY2RhNTllIgogCiBTUkNfVVJJID0gImdpdDovL2dpdGxhYi5mcmVl
ZGVza3RvcC5vcmcvc2xpcnAvbGlic2xpcnAuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYXN0
ZXIiCi1TUkNSRVYgPSAiOWM3NDRlMWU1MmFhMGQ5NjQ2ZWQ5MWQ3ODlkNTg4Njk2MjkyYzIxZSIK
K1NSQ1JFViA9ICJkZDc2NDE1ZmNlNDU3ZTMxOWQ2NjVlYjgyMTBkMDVjNTczMTM2MGJhIgogVVBT
VFJFQU1fQ0hFQ0tfR0lUVEFHUkVHRVggPSAidig/UDxwdmVyPlxkKyhcLlxkKykrKSIKIAogREVQ
RU5EUyA9ICJnbGliLTIuMCIKLS0gCjIuNDcuMQoK

--===============6306039484867927923==--

