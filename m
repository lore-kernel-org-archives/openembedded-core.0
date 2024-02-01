Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A53CC48BF0
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:16 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.2099.1706810405418465370
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=TMb7vXZm;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=D1fIakhN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018d65d3efaf-a004091f-f1ce-49b4-9130-dffaea9fdfbc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810405;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=J9QgVRmQsnN/YfqGY/UqEEgR2Jo57Jt9CZ3ul3a6whA=;
	b=TMb7vXZmZ//YudLvMr76eMuAQfd1yAiaoEmKRipzF+8rKjGajUt6st004HqEPin4
	1RFQk0m/AG4SWsE5qVUUMI07/9eRG7C4mdxEc1N++QxiZu7C+HjeuRv+vMa2mjgJW5c
	IYZGxugejvnORogZsUFfSRPdeaGxZGK5ccGUAMeI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810405;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=J9QgVRmQsnN/YfqGY/UqEEgR2Jo57Jt9CZ3ul3a6whA=;
	b=D1fIakhNHgcF3ttPfSe4/rBfGiAeR0lGBk3dGkFjAppT70FyZBQeRnzMYmXr71tu
	n11AE7TK+6DdEB+O4oRdhaOK+ZUEOivEw1yionPUWBFO3YZQira5PCJdh4OPvaljWG3
	i2YOoVLBoLg+pFIoF27EaAl4kpbiToPvYibXbg6k=
Content-Type: multipart/mixed; boundary="===============6722515428493182122=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] liburi-perl: upgrading to 5.25 SUCCEEDED
Message-ID: <0101018d65d3efaf-a004091f-f1ce-49b4-9130-dffaea9fdfbc-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:04 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194623

--===============6722515428493182122==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *liburi-perl* to *5.25* has Succeeded.

Next steps:
    - apply the patch: git am 0001-liburi-perl-upgrade-5.21-5.25.patch
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
From 809a8db70fcd6a1423c5ea11692c2c01213dd6bb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Feb 2024 07:25:07 +0000
Subject: [PATCH] liburi-perl: upgrade 5.21 -> 5.25

---
 .../perl/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch  | 2 +-
 .../perl/{liburi-perl_5.21.bb => liburi-perl_5.25.bb}           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/perl/{liburi-perl_5.21.bb => liburi-perl_5.25.bb} (94%)

diff --git a/meta/recipes-devtools/perl/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch b/meta/recipes-devtools/perl/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch
index ed1f25125f..a502aa471a 100644
--- a/meta/recipes-devtools/perl/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch
+++ b/meta/recipes-devtools/perl/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch
@@ -1,4 +1,4 @@
-From 5a4271456104bdf027644c81c3a208cde5cf522e Mon Sep 17 00:00:00 2001
+From 454f380136c27af45b758265936ef3a684a6afa1 Mon Sep 17 00:00:00 2001
 From: Tim Orling <tim.orling@konsulko.com>
 Date: Thu, 17 Nov 2022 16:33:20 -0800
 Subject: [PATCH] Skip TODO test cases that fail
diff --git a/meta/recipes-devtools/perl/liburi-perl_5.21.bb b/meta/recipes-devtools/perl/liburi-perl_5.25.bb
similarity index 94%
rename from meta/recipes-devtools/perl/liburi-perl_5.21.bb
rename to meta/recipes-devtools/perl/liburi-perl_5.25.bb
index 0356469d98..0305955524 100644
--- a/meta/recipes-devtools/perl/liburi-perl_5.21.bb
+++ b/meta/recipes-devtools/perl/liburi-perl_5.25.bb
@@ -12,7 +12,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/O/OA/OALDERS/URI-${PV}.tar.gz \
            file://0001-Skip-TODO-test-cases-that-fail.patch \
            "
 
-SRC_URI[sha256sum] = "96265860cd61bde16e8415dcfbf108056de162caa0ac37f81eb695c9d2e0ab77"
+SRC_URI[sha256sum] = "ef61941da09fff2503cea3692c4f2fc48c0e4442486e2a28345cb32d44d0d271"
 
 S = "${WORKDIR}/URI-${PV}"
 
-- 
2.42.0


--===============6722515428493182122==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/liburi-perl/liburi-perl-ptest: FILELIST: added "/usr/lib/liburi-perl/ptest/t/urn-scheme-exceptions.t"

--===============6722515428493182122==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (0 cached, 912 parsed). 1850 targets, 46 skipped, 0 masked, 0 errors.
Removing 15 recipes from the core2-64 sysroot...done.
Removing 57 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-46e83970c92a255da57e67da3a637edc68d92c4d"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:46e83970c92a255da57e67da3a637edc68d92c4d"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 255 Local 239 Mirrors 0 Missed 16 Current 200 (93% match, 96% complete)
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 204 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-fatal-perl_0.017.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 205 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-fatal-perl_0.017.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 206 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-fatal-perl_0.017.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 207 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-needs-perl_0.002010.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 208 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-needs-perl_0.002010.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 209 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-needs-perl_0.002010.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 210 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-warnings-perl_0.032.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 211 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-warnings-perl_0.032.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 212 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-warnings-perl_0.032.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 214 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-fatal-perl_0.017.bb:do_create_spdx_setscene)
NOTE: Running setscene task 215 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-needs-perl_0.002010.bb:do_create_spdx_setscene)
NOTE: Running setscene task 216 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-warnings-perl_0.032.bb:do_create_spdx_setscene)
NOTE: Running setscene task 228 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 229 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 230 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 233 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_create_spdx_setscene)
NOTE: recipe libtest-fatal-perl-0.017-r0: task do_package_write_deb_setscene: Started
NOTE: recipe libtest-fatal-perl-0.017-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtest-fatal-perl-0.017-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libtest-needs-perl-0.002010-r0: task do_package_write_deb_setscene: Started
NOTE: recipe libtest-needs-perl-0.002010-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libtest-needs-perl-0.002010-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtest-warnings-perl-0.032-r0: task do_package_write_deb_setscene: Started
NOTE: recipe libtest-warnings-perl-0.032-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtest-fatal-perl-0.017-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtest-warnings-perl-0.032-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libtest-needs-perl-0.002010-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtest-warnings-perl-0.032-r0: task do_create_spdx_setscene: Started
NOTE: recipe perl-5.38.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe perl-5.38.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe perl-5.38.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtest-fatal-perl-0.017-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 234 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_deb_setscene)
NOTE: recipe libtest-fatal-perl-0.017-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 242 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 243 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm_setscene)
NOTE: recipe libtest-fatal-perl-0.017-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 244 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtry-tiny-perl_0.31.bb:do_packagedata_setscene)
NOTE: recipe libtest-needs-perl-0.002010-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtest-needs-perl-0.002010-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtest-needs-perl-0.002010-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libtest-warnings-perl-0.032-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe libtest-warnings-perl-0.032-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtest-warnings-perl-0.032-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtest-warnings-perl-0.032-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libtest-fatal-perl-0.017-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtest-needs-perl-0.002010-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 303 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-fatal-perl_0.017.bb:do_packagedata_setscene)
NOTE: Running setscene task 304 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-needs-perl_0.002010.bb:do_packagedata_setscene)
NOTE: Running setscene task 305 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-warnings-perl_0.032.bb:do_packagedata_setscene)
NOTE: Running setscene task 306 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtry-tiny-perl-0.31-r0: task do_packagedata_setscene: Started
NOTE: Running task 325 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.25.bb:do_recipe_qa)
NOTE: recipe libtest-fatal-perl-0.017-r0: task do_packagedata_setscene: Started
NOTE: recipe libtest-needs-perl-0.002010-r0: task do_packagedata_setscene: Started
NOTE: recipe libtest-warnings-perl-0.032-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.38.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 307 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata_setscene)
NOTE: recipe perl-5.38.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe perl-5.38.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liburi-perl-5.25-r0: task do_recipe_qa: Started
NOTE: recipe libtry-tiny-perl-0.31-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.38.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 311 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 312 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 313 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe libtest-fatal-perl-0.017-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtest-needs-perl-0.002010-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/libtest-warnings-perl/0.032/temp/log.do_packagedata_setscene.3748221
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-warnings-perl_0.032.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 320 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-warnings-perl_0.032.bb:do_package_setscene)
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe liburi-perl-5.25-r0: task do_recipe_qa: Succeeded
NOTE: recipe perl-5.38.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 325 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 330 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 331 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 335 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_packagedata_setscene)
NOTE: Running task 356 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.25.bb:do_fetch)
NOTE: recipe procps-4.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 343 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe liburi-perl-5.25-r0: task do_fetch: Started
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe liburi-perl-5.25-r0: task do_fetch: Succeeded
NOTE: Running task 371 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.25.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 350 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 352 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe liburi-perl-5.25-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe liburi-perl-5.25-r0: task do_unpack: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 378 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 361 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 365 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 370 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 382 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtest-warnings-perl-0.032-r0: task do_package_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtest-warnings-perl-0.032-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 381 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-warnings-perl_0.032.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 382 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 383 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtest-warnings-perl-0.032-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perl-5.38.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.38.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libtest-warnings-perl-0.032-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 385 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.38.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.38.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 393 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 394 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 395 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 396 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 398 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 399 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 400 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.38.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.38.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 404 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 406 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 408 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 410 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 414 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 416 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 418 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 419 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 421 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 422 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 424 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 426 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 427 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 428 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 429 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 430 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 432 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 440 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 441 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 443 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 446 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 448 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 450 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 452 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 454 of 455 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 888 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.25.bb:do_patch)
NOTE: Running task 900 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 907 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1069 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.25.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: Running task 1158 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-warnings-perl_0.032.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe liburi-perl-5.25-r0: task do_patch: Started
NOTE: Running task 1218 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.25.bb:do_collect_spdx_deps)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe liburi-perl-5.25-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1254 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libtest-warnings-perl-0.032-r0: task do_packagedata: Started
NOTE: recipe liburi-perl-5.25-r0: task do_collect_spdx_deps: Started
NOTE: recipe liburi-perl-5.25-r0: task do_patch: Succeeded
NOTE: Running task 1255 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.25.bb:do_deploy_source_date_epoch)
NOTE: Running task 1256 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.25.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1257 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe liburi-perl-5.25-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liburi-perl-5.25-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe libtest-warnings-perl-0.032-r0: task do_packagedata: Succeeded
NOTE: recipe liburi-perl-5.25-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe liburi-perl-5.25-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1259 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe liburi-perl-5.25-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.25.bb:do_populate_lic unihash changed to 4ec0982fba20fdffc492ca4436ce67c88d646c3a3121f6460729b31e22f5805b
NOTE: recipe liburi-perl-5.25-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1260 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.25.bb:do_configure)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe liburi-perl-5.25-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1261 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe liburi-perl-5.25-r0: task do_configure: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: Running task 1267 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.25.bb:do_configure_ptest_base)
NOTE: recipe liburi-perl-5.25-r0: task do_configure_ptest_base: Started
NOTE: recipe liburi-perl-5.25-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1268 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.25.bb:do_compile)
NOTE: recipe liburi-perl-5.25-r0: task do_compile: Started
NOTE: recipe liburi-perl-5.25-r0: task do_compile: Succeeded
NOTE: Running task 1269 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.25.bb:do_compile_ptest_base)
NOTE: recipe liburi-perl-5.25-r0: task do_compile_ptest_base: Started
NOTE: recipe liburi-perl-5.25-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1270 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.25.bb:do_install)
NOTE: recipe liburi-perl-5.25-r0: task do_install: Started
NOTE: recipe liburi-perl-5.25-r0: task do_install: Succeeded
NOTE: Running task 1271 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.25.bb:do_install_ptest_base)
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe liburi-perl-5.25-r0: task do_install_ptest_base: Started
NOTE: Running task 1272 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe liburi-perl-5.25-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1273 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.25.bb:do_install_ptest_perl)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: Running task 1274 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.25.bb:do_populate_sysroot)
NOTE: recipe liburi-perl-5.25-r0: task do_populate_sysroot: Started
NOTE: recipe liburi-perl-5.25-r0: task do_install_ptest_perl: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to e644ec3722734ea60494db1182afab8d0334f493c3dc1fb845b731f7ca727b46
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash e961fcdb4d7aede04674f88cab68b2ddc3abd5cb46505574982cd1a5fab58b32 to hashserv.yocto.io:8686 ({'taskhash': '22eed3be58e0f8459c9b33e140ff5efe40a2ec5846232347e0c33eac90011272', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'e961fcdb4d7aede04674f88cab68b2ddc3abd5cb46505574982cd1a5fab58b32'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 22eed3be58e0f8459c9b33e140ff5efe40a2ec5846232347e0c33eac90011272 -> e961fcdb4d7aede04674f88cab68b2ddc3abd5cb46505574982cd1a5fab58b32 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe liburi-perl-5.25-r0: task do_install_ptest_perl: Succeeded
NOTE: Running task 1277 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.25.bb:do_package)
NOTE: recipe liburi-perl-5.25-r0: task do_package: Started
NOTE: recipe liburi-perl-5.25-r0: task do_populate_sysroot: Succeeded
NOTE: recipe liburi-perl-5.25-r0: task do_package: Succeeded
NOTE: Running task 1296 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.25.bb:do_packagedata)
NOTE: recipe liburi-perl-5.25-r0: task do_packagedata: Started
NOTE: recipe liburi-perl-5.25-r0: task do_packagedata: Succeeded
NOTE: Running task 1297 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.25.bb:do_create_spdx)
NOTE: Running task 1298 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.25.bb:do_package_write_ipk)
NOTE: Running task 1299 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.25.bb:do_package_write_deb)
NOTE: Running task 1300 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.25.bb:do_package_write_rpm)
NOTE: Running task 1301 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.25.bb:do_package_qa)
NOTE: recipe liburi-perl-5.25-r0: task do_create_spdx: Started
NOTE: recipe liburi-perl-5.25-r0: task do_package_write_ipk: Started
NOTE: recipe liburi-perl-5.25-r0: task do_package_write_deb: Started
NOTE: recipe liburi-perl-5.25-r0: task do_package_write_rpm: Started
NOTE: recipe liburi-perl-5.25-r0: task do_package_qa: Started
NOTE: recipe liburi-perl-5.25-r0: task do_create_spdx: Succeeded
NOTE: Running task 1302 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.25.bb:do_create_runtime_spdx)
NOTE: recipe liburi-perl-5.25-r0: task do_create_runtime_spdx: Started
NOTE: recipe liburi-perl-5.25-r0: task do_package_write_ipk: Succeeded
NOTE: recipe liburi-perl-5.25-r0: task do_package_qa: Succeeded
NOTE: recipe liburi-perl-5.25-r0: task do_package_write_deb: Succeeded
NOTE: recipe liburi-perl-5.25-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe liburi-perl-5.25-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1303 of 1303 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.25.bb:do_build)
NOTE: Tasks Summary: Attempted 1303 tasks of which 1268 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: libtest-warnings-perl-0.032-r0 do_packagedata_setscene: QA Issue: Package version for package libtest-warnings-perl-src went backwards which would break package feeds (from 0:0.033-r0 to 0:0.032-r0) [version-going-backwards]
ERROR: libtest-warnings-perl-0.032-r0 do_packagedata_setscene: QA Issue: Package version for package libtest-warnings-perl-dbg went backwards which would break package feeds (from 0:0.033-r0 to 0:0.032-r0) [version-going-backwards]
ERROR: libtest-warnings-perl-0.032-r0 do_packagedata_setscene: QA Issue: Package version for package libtest-warnings-perl-ptest went backwards which would break package feeds (from 0:0.033-r0 to 0:0.032-r0) [version-going-backwards]
ERROR: libtest-warnings-perl-0.032-r0 do_packagedata_setscene: QA Issue: Package version for package libtest-warnings-perl-staticdev went backwards which would break package feeds (from 0:0.033-r0 to 0:0.032-r0) [version-going-backwards]
ERROR: libtest-warnings-perl-0.032-r0 do_packagedata_setscene: QA Issue: Package version for package libtest-warnings-perl-dev went backwards which would break package feeds (from 0:0.033-r0 to 0:0.032-r0) [version-going-backwards]
ERROR: libtest-warnings-perl-0.032-r0 do_packagedata_setscene: QA Issue: Package version for package libtest-warnings-perl-doc went backwards which would break package feeds (from 0:0.033-r0 to 0:0.032-r0) [version-going-backwards]
ERROR: libtest-warnings-perl-0.032-r0 do_packagedata_setscene: QA Issue: Package version for package libtest-warnings-perl-locale went backwards which would break package feeds (from 0:0.033-r0 to 0:0.032-r0) [version-going-backwards]
ERROR: libtest-warnings-perl-0.032-r0 do_packagedata_setscene: QA Issue: Package version for package libtest-warnings-perl went backwards which would break package feeds (from 0:0.033-r0 to 0:0.032-r0) [version-going-backwards]
ERROR: libtest-warnings-perl-0.032-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6722515428493182122==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/liburi-perl: SRC_URI changed from "https://search.cpan.org/CPAN/authors/id/O/OA/OALDERS/URI-5.21.tar.gz file://0001-Skip-TODO-test-cases-that-fail.patch file://ptest-perl/run-ptest" to "https://search.cpan.org/CPAN/authors/id/O/OA/OALDERS/URI-5.25.tar.gz file://0001-Skip-TODO-test-cases-that-fail.patch file://ptest-perl/run-ptest"
packages/core2-64-poky-linux/liburi-perl: PV changed from "5.21" to "5.25"
packages/core2-64-poky-linux/liburi-perl: PKGV changed from 5.21 [default] to 5.25 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl-dbg: PV changed from "5.21" to "5.25"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-dbg: PKGV changed from 5.21 [default] to 5.25 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl-dev: PV changed from "5.21" to "5.25"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-dev: PKGV changed from 5.21 [default] to 5.25 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl-doc: PV changed from "5.21" to "5.25"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-doc: PKGV changed from 5.21 [default] to 5.25 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl-locale: PV changed from "5.21" to "5.25"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-locale: PKGV changed from 5.21 [default] to 5.25 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl-ptest: FILELIST: added "/usr/lib/liburi-perl/ptest/t/urn-scheme-exceptions.t"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-ptest: PKGSIZE changed from 132409 to 133030 (+0%)
packages/core2-64-poky-linux/liburi-perl/liburi-perl-ptest: PV changed from "5.21" to "5.25"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-ptest: PKGV changed from 5.21 [default] to 5.25 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl-src: PV changed from "5.21" to "5.25"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-src: PKGV changed from 5.21 [default] to 5.25 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl-staticdev: PV changed from "5.21" to "5.25"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-staticdev: PKGV changed from 5.21 [default] to 5.25 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl: PKGSIZE changed from 141443 to 141387 (-0%)
packages/core2-64-poky-linux/liburi-perl/liburi-perl: PV changed from "5.21" to "5.25"
packages/core2-64-poky-linux/liburi-perl/liburi-perl: PKGV changed from 5.21 [default] to 5.25 [default]

--===============6722515428493182122==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-liburi-perl-upgrade-5.21-5.25.patch"

RnJvbSA4MDlhOGRiNzBmY2Q2YTE0MjNjNWVhMTE2OTJjMmMwMTIxM2RkNmJiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBGZWIgMjAyNCAwNzoyNTowNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnVyaS1wZXJsOiB1cGdyYWRlIDUuMjEgLT4gNS4yNQoKLS0tCiAuLi4vcGVybC9saWJ1cmktcGVy
bC8wMDAxLVNraXAtVE9ETy10ZXN0LWNhc2VzLXRoYXQtZmFpbC5wYXRjaCAgfCAyICstCiAuLi4v
cGVybC97bGlidXJpLXBlcmxfNS4yMS5iYiA9PiBsaWJ1cmktcGVybF81LjI1LmJifSAgICAgICAg
ICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC97bGlidXJpLXBlcmxfNS4yMS5i
YiA9PiBsaWJ1cmktcGVybF81LjI1LmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9wZXJsL2xpYnVyaS1wZXJsLzAwMDEtU2tpcC1UT0RPLXRlc3QtY2FzZXMtdGhh
dC1mYWlsLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvbGlidXJpLXBlcmwvMDAw
MS1Ta2lwLVRPRE8tdGVzdC1jYXNlcy10aGF0LWZhaWwucGF0Y2gKaW5kZXggZWQxZjI1MTI1Zi4u
YTUwMmFhNDcxYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvbGlidXJp
LXBlcmwvMDAwMS1Ta2lwLVRPRE8tdGVzdC1jYXNlcy10aGF0LWZhaWwucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvbGlidXJpLXBlcmwvMDAwMS1Ta2lwLVRPRE8tdGVzdC1j
YXNlcy10aGF0LWZhaWwucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDVhNDI3MTQ1NjEwNGJk
ZjAyNzY0NGM4MWMzYTIwOGNkZTVjZjUyMmUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IDQ1NGYzODAxMzZjMjdhZjQ1Yjc1ODI2NTkzNmVmM2E2ODRhNmFmYTEgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBUaW0gT3JsaW5nIDx0aW0ub3JsaW5nQGtvbnN1bGtvLmNvbT4KIERh
dGU6IFRodSwgMTcgTm92IDIwMjIgMTY6MzM6MjAgLTA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gU2tp
cCBUT0RPIHRlc3QgY2FzZXMgdGhhdCBmYWlsCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcGVybC9saWJ1cmktcGVybF81LjIxLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Bl
cmwvbGlidXJpLXBlcmxfNS4yNS5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9saWJ1cmktcGVybF81LjIxLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9saWJ1cmktcGVybF81LjI1LmJiCmluZGV4IDAzNTY0
NjlkOTguLjAzMDU5NTU1MjQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJs
L2xpYnVyaS1wZXJsXzUuMjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvbGli
dXJpLXBlcmxfNS4yNS5iYgpAQCAtMTIsNyArMTIsNyBAQCBTUkNfVVJJID0gIiR7Q1BBTl9NSVJS
T1J9L2F1dGhvcnMvaWQvTy9PQS9PQUxERVJTL1VSSS0ke1BWfS50YXIuZ3ogXAogICAgICAgICAg
ICBmaWxlOi8vMDAwMS1Ta2lwLVRPRE8tdGVzdC1jYXNlcy10aGF0LWZhaWwucGF0Y2ggXAogICAg
ICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI5NjI2NTg2MGNkNjFiZGUxNmU4NDE1
ZGNmYmYxMDgwNTZkZTE2MmNhYTBhYzM3ZjgxZWI2OTVjOWQyZTBhYjc3IgorU1JDX1VSSVtzaGEy
NTZzdW1dID0gImVmNjE5NDFkYTA5ZmZmMjUwM2NlYTM2OTJjNGYyZmM0OGMwZTQ0NDI0ODZlMmEy
ODM0NWNiMzJkNDRkMGQyNzEiCiAKIFMgPSAiJHtXT1JLRElSfS9VUkktJHtQVn0iCiAKLS0gCjIu
NDIuMAoK

--===============6722515428493182122==--

