Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F7AD1F9A5
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 12:16:02 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.11799.1728994554420866434
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 05:15:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=GZ1wHF/Y;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=31l8nxcC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010192901b2f3d-cad56769-861d-4b07-be23-0d4153970bc1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728994553;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7xSmCQU5NBlaSUF/hDibr3pzlWmXAcES81eJ8xIUPZQ=;
	b=GZ1wHF/YN7Ya2SKe8GR9lsOAX7iLb7KTuWybuPrqz6KaLWvbULA29mU1hTpy3fGH
	bDOab9uVga5TAie1drWdJ4wIQnGH2HAW7UCx852ed+BwbLWACBGOKvqrefcMtIjfU7l
	oVgeRXOCpHYaCotEdimS2WcQuraSZ6xPx0BYqDWs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728994553;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7xSmCQU5NBlaSUF/hDibr3pzlWmXAcES81eJ8xIUPZQ=;
	b=31l8nxcCT3FycNZlX0l+mYTgVEsJbHhH5FzL+jy4rJwrTpKFef8rBBrA3pTOeVGf
	ONmW+UUX8kFVTMkH33EjLxo9o9V8TGMcW8iq6H80Pg0n+GvsOJdFzR0BdoABanCqn9Z
	CTB1vV3gkLVo9hAK0GSaXscy95w99X84r/0OAKyI=
Content-Type: multipart/mixed; boundary="===============8599964627055180748=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] liburi-perl: upgrading to 5.30 SUCCEEDED
Message-ID: <01010192901b2f3d-cad56769-861d-4b07-be23-0d4153970bc1-000000@us-west-2.amazonses.com>
Date: Tue, 15 Oct 2024 12:15:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 12:16:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205836

--===============8599964627055180748==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *liburi-perl* to *5.30* has Succeeded.

Next steps:
    - apply the patch: git am 0001-liburi-perl-upgrade-5.28-5.30.patch
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
From c498d8e12a4243336774ee7779282c7442697039 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Oct 2024 08:16:51 +0000
Subject: [PATCH] liburi-perl: upgrade 5.28 -> 5.30

---
 .../perl/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch | 3 +--
 .../perl/{liburi-perl_5.28.bb => liburi-perl_5.30.bb}          | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/perl/{liburi-perl_5.28.bb => liburi-perl_5.30.bb} (94%)

diff --git a/meta/recipes-devtools/perl/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch b/meta/recipes-devtools/perl/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch
index ed1f25125f..bf05e8659c 100644
--- a/meta/recipes-devtools/perl/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch
+++ b/meta/recipes-devtools/perl/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch
@@ -1,4 +1,4 @@
-From 5a4271456104bdf027644c81c3a208cde5cf522e Mon Sep 17 00:00:00 2001
+From 40769c9d463dba4be313325fcaef266d4dc9c4b7 Mon Sep 17 00:00:00 2001
 From: Tim Orling <tim.orling@konsulko.com>
 Date: Thu, 17 Nov 2022 16:33:20 -0800
 Subject: [PATCH] Skip TODO test cases that fail
@@ -8,7 +8,6 @@ TODO cases report as "not ok" with ptest-runner
 Upstream-Status: Inappropriate [ptest-runner specific]
 
 Signed-off-by: Tim Orling <tim.orling@konsulko.com>
-
 ---
  t/escape-char.t | 20 ++++++++++----------
  t/iri.t         | 18 +++++++++---------
diff --git a/meta/recipes-devtools/perl/liburi-perl_5.28.bb b/meta/recipes-devtools/perl/liburi-perl_5.30.bb
similarity index 94%
rename from meta/recipes-devtools/perl/liburi-perl_5.28.bb
rename to meta/recipes-devtools/perl/liburi-perl_5.30.bb
index 1fc0efd3e5..9294ce6859 100644
--- a/meta/recipes-devtools/perl/liburi-perl_5.28.bb
+++ b/meta/recipes-devtools/perl/liburi-perl_5.30.bb
@@ -12,7 +12,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/O/OA/OALDERS/URI-${PV}.tar.gz \
            file://0001-Skip-TODO-test-cases-that-fail.patch \
            "
 
-SRC_URI[sha256sum] = "e7985da359b15efd00917fa720292b711c396f2f9f9a7349e4e7dec74aa79765"
+SRC_URI[sha256sum] = "be366cf5d923e2c0d63e5fe5f707f614a144020961a2a0fe0b2c922f5fb80a95"
 
 S = "${WORKDIR}/URI-${PV}"
 
-- 
2.44.1


--===============8599964627055180748==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 919 .bb files complete (0 cached, 919 parsed). 1876 targets, 52 skipped, 0 masked, 0 errors.
Removing 15 recipes from the core2-64 sysroot...done.
Removing 62 recipes from the qemux86_64 sysroot...done.
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
workspace            = "tmp-auh-upgrades:baf2b56e81abb75bcea27ffeff363ae8482a8471"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 269 Local 259 Mirrors 0 Missed 10 Current 193 (96% match, 97% complete)
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 198 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-fatal-perl_0.017.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 199 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-fatal-perl_0.017.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 200 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-fatal-perl_0.017.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 201 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-needs-perl_0.002010.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 202 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-needs-perl_0.002010.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 203 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-needs-perl_0.002010.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 204 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-warnings-perl_0.033.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 205 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-warnings-perl_0.033.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 206 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-warnings-perl_0.033.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 208 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-fatal-perl_0.017.bb:do_create_spdx_setscene)
NOTE: Running setscene task 209 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-needs-perl_0.002010.bb:do_create_spdx_setscene)
NOTE: Running setscene task 210 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-warnings-perl_0.033.bb:do_create_spdx_setscene)
NOTE: Running setscene task 218 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.30.bb:do_populate_lic_setscene)
NOTE: Running setscene task 221 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 222 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 223 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libtest-fatal-perl-0.017-r0: task do_package_write_deb_setscene: Started
NOTE: recipe libtest-fatal-perl-0.017-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libtest-fatal-perl-0.017-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtest-needs-perl-0.002010-r0: task do_package_write_deb_setscene: Started
NOTE: recipe libtest-needs-perl-0.002010-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libtest-needs-perl-0.002010-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtest-warnings-perl-0.033-r0: task do_package_write_deb_setscene: Started
NOTE: recipe libtest-warnings-perl-0.033-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libtest-warnings-perl-0.033-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtest-fatal-perl-0.017-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtest-needs-perl-0.002010-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtest-warnings-perl-0.033-r0: task do_create_spdx_setscene: Started
NOTE: recipe liburi-perl-5.30-r0: task do_populate_lic_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtest-fatal-perl-0.017-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe libtest-fatal-perl-0.017-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libtest-fatal-perl-0.017-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtest-needs-perl-0.002010-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe libtest-needs-perl-0.002010-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 226 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 227 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtry-tiny-perl_0.31.bb:do_packagedata_setscene)
NOTE: Running setscene task 228 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb:do_package_write_deb_setscene)
NOTE: recipe libtest-needs-perl-0.002010-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtest-warnings-perl-0.033-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe libtest-warnings-perl-0.033-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 229 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb:do_package_write_ipk_setscene)
NOTE: recipe libtest-warnings-perl-0.033-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 230 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb:do_package_write_rpm_setscene)
NOTE: recipe libtest-fatal-perl-0.017-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe liburi-perl-5.30-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe libtest-needs-perl-0.002010-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtest-warnings-perl-0.033-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 267 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-fatal-perl_0.017.bb:do_packagedata_setscene)
NOTE: Running setscene task 292 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-needs-perl_0.002010.bb:do_packagedata_setscene)
NOTE: Running setscene task 294 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-warnings-perl_0.033.bb:do_packagedata_setscene)
NOTE: Running setscene task 296 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.30.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 297 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtry-tiny-perl-0.31-r0: task do_packagedata_setscene: Started
NOTE: recipe libtest-fatal-perl-0.017-r0: task do_packagedata_setscene: Started
NOTE: recipe libtest-needs-perl-0.002010-r0: task do_packagedata_setscene: Started
NOTE: recipe libtest-warnings-perl-0.033-r0: task do_packagedata_setscene: Started
NOTE: recipe liburi-perl-5.30-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 307 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: recipe liburi-perl-5.30-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 669 of 1317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.30.bb:do_fetch)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/libtry-tiny-perl/0.31/temp/log.do_packagedata_setscene.3978164
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtry-tiny-perl_0.31.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 308 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtry-tiny-perl_0.31.bb:do_package_setscene)
NOTE: recipe libtest-fatal-perl-0.017-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.40.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe libtest-needs-perl-0.002010-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtest-warnings-perl-0.033-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.40.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe liburi-perl-5.30-r0: task do_fetch: Started
NOTE: recipe perl-5.40.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe perl-5.40.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe liburi-perl-5.30-r0: task do_fetch: Succeeded
NOTE: Running setscene task 320 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 321 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 324 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 325 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb:do_packagedata_setscene)
NOTE: Running task 685 of 1317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.30.bb:do_unpack)
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe liburi-perl-5.30-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe liburi-perl-5.30-r0: task do_unpack: Succeeded
NOTE: Running task 702 of 1317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.30.bb:do_patch)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 333 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 335 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 337 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 341 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_packagedata_setscene)
NOTE: recipe procps-4.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe liburi-perl-5.30-r0: task do_patch: Started
NOTE: Running setscene task 346 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 356 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe liburi-perl-5.30-r0: task do_patch: Succeeded
NOTE: Running task 738 of 1317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.30.bb:do_deploy_source_date_epoch)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtry-tiny-perl-0.31-r0: task do_package_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe liburi-perl-5.30-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-4.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 376 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 380 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe liburi-perl-5.30-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.30.bb:do_deploy_source_date_epoch unihash changed to d694d4a72afbffb7f081c97c24809c5c9e4604ed4574f4d23230edc87e11cfed
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtry-tiny-perl-0.31-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 386 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtry-tiny-perl_0.31.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 387 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 388 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtry-tiny-perl-0.31-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtry-tiny-perl-0.31-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 390 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 401 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 402 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 403 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 404 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 406 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 407 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: Running setscene task 408 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 415 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 417 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 419 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 421 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 425 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 427 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 429 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 430 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 432 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 434 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 435 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 436 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 437 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 439 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
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
NOTE: Running setscene task 443 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 444 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 446 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 451 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 453 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 454 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 458 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 459 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 461 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1134 of 1317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.30.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1257 of 1317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtry-tiny-perl_0.31.bb:do_packagedata)
NOTE: Running task 1262 of 1317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.30.bb:do_collect_spdx_deps)
NOTE: recipe liburi-perl-5.30-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtry-tiny-perl-0.31-r0: task do_packagedata: Started
NOTE: recipe liburi-perl-5.30-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtry-tiny-perl-0.31-r0: task do_packagedata: Succeeded
NOTE: recipe liburi-perl-5.30-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe liburi-perl-5.30-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1301 of 1317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.30.bb:do_configure)
NOTE: recipe liburi-perl-5.30-r0: task do_configure: Started
NOTE: recipe liburi-perl-5.30-r0: task do_configure: Succeeded
NOTE: Running task 1302 of 1317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.30.bb:do_configure_ptest_base)
NOTE: recipe liburi-perl-5.30-r0: task do_configure_ptest_base: Started
NOTE: recipe liburi-perl-5.30-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1303 of 1317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.30.bb:do_compile)
NOTE: recipe liburi-perl-5.30-r0: task do_compile: Started
NOTE: recipe liburi-perl-5.30-r0: task do_compile: Succeeded
NOTE: Running task 1304 of 1317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.30.bb:do_compile_ptest_base)
NOTE: recipe liburi-perl-5.30-r0: task do_compile_ptest_base: Started
NOTE: recipe liburi-perl-5.30-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1305 of 1317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.30.bb:do_install)
NOTE: recipe liburi-perl-5.30-r0: task do_install: Started
NOTE: recipe liburi-perl-5.30-r0: task do_install: Succeeded
NOTE: Running task 1306 of 1317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.30.bb:do_install_ptest_base)
NOTE: recipe liburi-perl-5.30-r0: task do_install_ptest_base: Started
NOTE: recipe liburi-perl-5.30-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1307 of 1317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.30.bb:do_install_ptest_perl)
NOTE: Running task 1308 of 1317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.30.bb:do_populate_sysroot)
NOTE: recipe liburi-perl-5.30-r0: task do_populate_sysroot: Started
NOTE: recipe liburi-perl-5.30-r0: task do_install_ptest_perl: Started
NOTE: recipe liburi-perl-5.30-r0: task do_install_ptest_perl: Succeeded
NOTE: Running task 1309 of 1317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.30.bb:do_package)
NOTE: recipe liburi-perl-5.30-r0: task do_package: Started
NOTE: recipe liburi-perl-5.30-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.30.bb:do_populate_sysroot unihash changed to bbe2bc8ac32714ff1290109aed87c884e1d64d7b514f55621431483be6f2064a
NOTE: Setscene tasks completed
NOTE: recipe liburi-perl-5.30-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.30.bb:do_package unihash changed to 7d0fa90f23c929bf14903f910b62ccded1f9f28523c35253ff33422d00a3ff5d
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.30.bb:do_packagedata became valid
NOTE: Running setscene task 462 of 462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.30.bb:do_packagedata_setscene)
NOTE: recipe liburi-perl-5.30-r0: task do_packagedata_setscene: Started
NOTE: recipe liburi-perl-5.30-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1311 of 1317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.30.bb:do_create_spdx)
NOTE: Running task 1312 of 1317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.30.bb:do_package_write_ipk)
NOTE: Running task 1313 of 1317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.30.bb:do_package_write_deb)
NOTE: Running task 1314 of 1317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.30.bb:do_package_write_rpm)
NOTE: Running task 1315 of 1317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.30.bb:do_package_qa)
NOTE: recipe liburi-perl-5.30-r0: task do_create_spdx: Started
NOTE: recipe liburi-perl-5.30-r0: task do_package_write_ipk: Started
NOTE: recipe liburi-perl-5.30-r0: task do_package_write_deb: Started
NOTE: recipe liburi-perl-5.30-r0: task do_package_write_rpm: Started
NOTE: recipe liburi-perl-5.30-r0: task do_package_qa: Started
NOTE: recipe liburi-perl-5.30-r0: task do_create_spdx: Succeeded
NOTE: Running task 1316 of 1317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.30.bb:do_create_package_spdx)
NOTE: recipe liburi-perl-5.30-r0: task do_create_package_spdx: Started
NOTE: recipe liburi-perl-5.30-r0: task do_package_write_ipk: Succeeded
NOTE: recipe liburi-perl-5.30-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.30.bb:do_package_write_ipk unihash changed to 081680c06a30c791541e476b921e227ff9337d40937e5dd3bf861c3ab53d8f44
NOTE: recipe liburi-perl-5.30-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.30.bb:do_package_qa unihash changed to c8155d5b7c6da22f29056c7e7c79c01fc403478f4a117c0e868fa926a97e0512
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.30.bb:do_package_write_deb unihash changed to 1abdf31a21a977fbe04fb9b6a6b44b79757cf578c6da67ee407f7950f9e077c8
NOTE: recipe liburi-perl-5.30-r0: task do_create_package_spdx: Succeeded
NOTE: recipe liburi-perl-5.30-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.30.bb:do_package_write_rpm unihash changed to aca418f61f81c5f1fbb1da57aaa9649e90e9044d712456765e481c4fc161b01d
NOTE: Running noexec task 1317 of 1317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.30.bb:do_build)
NOTE: Tasks Summary: Attempted 1317 tasks of which 1294 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: libtry-tiny-perl-0.31-r0 do_packagedata_setscene: QA Issue: Package version for package libtry-tiny-perl-src went backwards which would break package feeds (from 0:0.32-r0 to 0:0.31-r0) [version-going-backwards]
ERROR: libtry-tiny-perl-0.31-r0 do_packagedata_setscene: QA Issue: Package version for package libtry-tiny-perl-dbg went backwards which would break package feeds (from 0:0.32-r0 to 0:0.31-r0) [version-going-backwards]
ERROR: libtry-tiny-perl-0.31-r0 do_packagedata_setscene: QA Issue: Package version for package libtry-tiny-perl-ptest went backwards which would break package feeds (from 0:0.32-r0 to 0:0.31-r0) [version-going-backwards]
ERROR: libtry-tiny-perl-0.31-r0 do_packagedata_setscene: QA Issue: Package version for package libtry-tiny-perl-staticdev went backwards which would break package feeds (from 0:0.32-r0 to 0:0.31-r0) [version-going-backwards]
ERROR: libtry-tiny-perl-0.31-r0 do_packagedata_setscene: QA Issue: Package version for package libtry-tiny-perl-dev went backwards which would break package feeds (from 0:0.32-r0 to 0:0.31-r0) [version-going-backwards]
ERROR: libtry-tiny-perl-0.31-r0 do_packagedata_setscene: QA Issue: Package version for package libtry-tiny-perl-doc went backwards which would break package feeds (from 0:0.32-r0 to 0:0.31-r0) [version-going-backwards]
ERROR: libtry-tiny-perl-0.31-r0 do_packagedata_setscene: QA Issue: Package version for package libtry-tiny-perl-locale went backwards which would break package feeds (from 0:0.32-r0 to 0:0.31-r0) [version-going-backwards]
ERROR: libtry-tiny-perl-0.31-r0 do_packagedata_setscene: QA Issue: Package version for package libtry-tiny-perl went backwards which would break package feeds (from 0:0.32-r0 to 0:0.31-r0) [version-going-backwards]
ERROR: libtry-tiny-perl-0.31-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8599964627055180748==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-liburi-perl-upgrade-5.28-5.30.patch"

RnJvbSBjNDk4ZDhlMTJhNDI0MzMzNjc3NGVlNzc3OTI4MmM3NDQyNjk3MDM5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgT2N0IDIwMjQgMDg6MTY6NTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ1cmktcGVybDogdXBncmFkZSA1LjI4IC0+IDUuMzAKCi0tLQogLi4uL3BlcmwvbGlidXJpLXBl
cmwvMDAwMS1Ta2lwLVRPRE8tdGVzdC1jYXNlcy10aGF0LWZhaWwucGF0Y2ggfCAzICstLQogLi4u
L3Blcmwve2xpYnVyaS1wZXJsXzUuMjguYmIgPT4gbGlidXJpLXBlcmxfNS4zMC5iYn0gICAgICAg
ICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC97bGlidXJpLXBlcmxfNS4yOC5i
YiA9PiBsaWJ1cmktcGVybF81LjMwLmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9wZXJsL2xpYnVyaS1wZXJsLzAwMDEtU2tpcC1UT0RPLXRlc3QtY2FzZXMtdGhh
dC1mYWlsLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvbGlidXJpLXBlcmwvMDAw
MS1Ta2lwLVRPRE8tdGVzdC1jYXNlcy10aGF0LWZhaWwucGF0Y2gKaW5kZXggZWQxZjI1MTI1Zi4u
YmYwNWU4NjU5YyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvbGlidXJp
LXBlcmwvMDAwMS1Ta2lwLVRPRE8tdGVzdC1jYXNlcy10aGF0LWZhaWwucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvbGlidXJpLXBlcmwvMDAwMS1Ta2lwLVRPRE8tdGVzdC1j
YXNlcy10aGF0LWZhaWwucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDVhNDI3MTQ1NjEwNGJk
ZjAyNzY0NGM4MWMzYTIwOGNkZTVjZjUyMmUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IDQwNzY5YzlkNDYzZGJhNGJlMzEzMzI1ZmNhZWYyNjZkNGRjOWM0YjcgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBUaW0gT3JsaW5nIDx0aW0ub3JsaW5nQGtvbnN1bGtvLmNvbT4KIERh
dGU6IFRodSwgMTcgTm92IDIwMjIgMTY6MzM6MjAgLTA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gU2tp
cCBUT0RPIHRlc3QgY2FzZXMgdGhhdCBmYWlsCkBAIC04LDcgKzgsNiBAQCBUT0RPIGNhc2VzIHJl
cG9ydCBhcyAibm90IG9rIiB3aXRoIHB0ZXN0LXJ1bm5lcgogVXBzdHJlYW0tU3RhdHVzOiBJbmFw
cHJvcHJpYXRlIFtwdGVzdC1ydW5uZXIgc3BlY2lmaWNdCiAKIFNpZ25lZC1vZmYtYnk6IFRpbSBP
cmxpbmcgPHRpbS5vcmxpbmdAa29uc3Vsa28uY29tPgotCiAtLS0KICB0L2VzY2FwZS1jaGFyLnQg
fCAyMCArKysrKysrKysrLS0tLS0tLS0tLQogIHQvaXJpLnQgICAgICAgICB8IDE4ICsrKysrKysr
Ky0tLS0tLS0tLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvbGlidXJp
LXBlcmxfNS4yOC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2xpYnVyaS1wZXJsXzUu
MzAuYmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3BlcmwvbGlidXJpLXBlcmxfNS4yOC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3BlcmwvbGlidXJpLXBlcmxfNS4zMC5iYgppbmRleCAxZmMwZWZkM2U1Li45Mjk0Y2U2ODU5
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9saWJ1cmktcGVybF81LjI4
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2xpYnVyaS1wZXJsXzUuMzAuYmIK
QEAgLTEyLDcgKzEyLDcgQEAgU1JDX1VSSSA9ICIke0NQQU5fTUlSUk9SfS9hdXRob3JzL2lkL08v
T0EvT0FMREVSUy9VUkktJHtQVn0udGFyLmd6IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtU2tp
cC1UT0RPLXRlc3QtY2FzZXMtdGhhdC1mYWlsLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiZTc5ODVkYTM1OWIxNWVmZDAwOTE3ZmE3MjAyOTJiNzExYzM5NmYy
ZjlmOWE3MzQ5ZTRlN2RlYzc0YWE3OTc2NSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJiZTM2NmNm
NWQ5MjNlMmMwZDYzZTVmZTVmNzA3ZjYxNGExNDQwMjA5NjFhMmEwZmUwYjJjOTIyZjVmYjgwYTk1
IgogCiBTID0gIiR7V09SS0RJUn0vVVJJLSR7UFZ9IgogCi0tIAoyLjQ0LjEKCg==

--===============8599964627055180748==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/liburi-perl/liburi-perl-doc: FILELIST: added "/usr/share/man/man3/URI::otpauth.3"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-ptest: FILELIST: added "/usr/lib/liburi-perl/ptest/t/otpauth.t /usr/lib/liburi-perl/ptest/t/irc.t /usr/lib/liburi-perl/ptest/t/scp.t /usr/lib/liburi-perl/ptest/t/ssh.t /usr/lib/liburi-perl/ptest/t/sftp.t /usr/lib/liburi-perl/ptest/t/ftpes.t /usr/lib/liburi-perl/ptest/t/ircs.t /usr/lib/liburi-perl/ptest/t/ftps.t"
packages/core2-64-poky-linux/liburi-perl/liburi-perl: FILELIST: added "/usr/lib/perl5/vendor_perl/5.40.0/URI/irc.pm /usr/lib/perl5/vendor_perl/5.40.0/URI/ftpes.pm /usr/lib/perl5/vendor_perl/5.40.0/URI/ftps.pm /usr/lib/perl5/vendor_perl/5.40.0/URI/otpauth.pm /usr/lib/perl5/vendor_perl/5.40.0/URI/ircs.pm /usr/lib/perl5/vendor_perl/5.40.0/URI/scp.pm"
Changes to packages/core2-64-poky-linux/liburi-perl (sysroot):
  /usr/lib/perl5/vendor_perl/5.40.0/URI/ftpes.pm was added
  /usr/lib/perl5/vendor_perl/5.40.0/URI/ftps.pm was added
  /usr/lib/perl5/vendor_perl/5.40.0/URI/irc.pm was added
  /usr/lib/perl5/vendor_perl/5.40.0/URI/ircs.pm was added
  /usr/lib/perl5/vendor_perl/5.40.0/URI/otpauth.pm was added
  /usr/lib/perl5/vendor_perl/5.40.0/URI/scp.pm was added

--===============8599964627055180748==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/liburi-perl: PKGV changed from 5.28 [default] to 5.30 [default]
packages/core2-64-poky-linux/liburi-perl: SRC_URI changed from "https://search.cpan.org/CPAN/authors/id/O/OA/OALDERS/URI-5.28.tar.gz file://0001-Skip-TODO-test-cases-that-fail.patch file://ptest-perl/run-ptest" to "https://search.cpan.org/CPAN/authors/id/O/OA/OALDERS/URI-5.30.tar.gz file://0001-Skip-TODO-test-cases-that-fail.patch file://ptest-perl/run-ptest"
packages/core2-64-poky-linux/liburi-perl: PV changed from "5.28" to "5.30"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-dbg: PKGV changed from 5.28 [default] to 5.30 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl-dbg: PV changed from "5.28" to "5.30"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-dev: PKGV changed from 5.28 [default] to 5.30 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl-dev: PV changed from "5.28" to "5.30"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-doc: PKGSIZE changed from 104222 to 111776 (+7%)
packages/core2-64-poky-linux/liburi-perl/liburi-perl-doc: FILELIST: added "/usr/share/man/man3/URI::otpauth.3"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-doc: PKGV changed from 5.28 [default] to 5.30 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl-doc: PV changed from "5.28" to "5.30"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-locale: PKGV changed from 5.28 [default] to 5.30 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl-locale: PV changed from "5.28" to "5.30"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-ptest: PKGSIZE changed from 140064 to 151103 (+8%)
packages/core2-64-poky-linux/liburi-perl/liburi-perl-ptest: FILELIST: added "/usr/lib/liburi-perl/ptest/t/otpauth.t /usr/lib/liburi-perl/ptest/t/ftps.t /usr/lib/liburi-perl/ptest/t/ircs.t /usr/lib/liburi-perl/ptest/t/ssh.t /usr/lib/liburi-perl/ptest/t/irc.t /usr/lib/liburi-perl/ptest/t/ftpes.t /usr/lib/liburi-perl/ptest/t/scp.t /usr/lib/liburi-perl/ptest/t/sftp.t"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-ptest: PKGV changed from 5.28 [default] to 5.30 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl-ptest: PV changed from "5.28" to "5.30"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-src: PKGV changed from 5.28 [default] to 5.30 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl-src: PV changed from "5.28" to "5.30"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-staticdev: PKGV changed from 5.28 [default] to 5.30 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl-staticdev: PV changed from "5.28" to "5.30"
packages/core2-64-poky-linux/liburi-perl/liburi-perl: PKGSIZE changed from 152722 to 166341 (+9%)
packages/core2-64-poky-linux/liburi-perl/liburi-perl: FILELIST: added "/usr/lib/perl5/vendor_perl/5.40.0/URI/otpauth.pm /usr/lib/perl5/vendor_perl/5.40.0/URI/ftpes.pm /usr/lib/perl5/vendor_perl/5.40.0/URI/ircs.pm /usr/lib/perl5/vendor_perl/5.40.0/URI/irc.pm /usr/lib/perl5/vendor_perl/5.40.0/URI/scp.pm /usr/lib/perl5/vendor_perl/5.40.0/URI/ftps.pm"
packages/core2-64-poky-linux/liburi-perl/liburi-perl: PKGV changed from 5.28 [default] to 5.30 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl: PV changed from "5.28" to "5.30"
Changes to packages/core2-64-poky-linux/liburi-perl (sysroot):
  /usr/lib/perl5/vendor_perl/5.40.0/URI/ftpes.pm was added
  /usr/lib/perl5/vendor_perl/5.40.0/URI/ftps.pm was added
  /usr/lib/perl5/vendor_perl/5.40.0/URI/irc.pm was added
  /usr/lib/perl5/vendor_perl/5.40.0/URI/ircs.pm was added
  /usr/lib/perl5/vendor_perl/5.40.0/URI/otpauth.pm was added
  /usr/lib/perl5/vendor_perl/5.40.0/URI/scp.pm was added

--===============8599964627055180748==--

