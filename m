Return-Path: <auh@yoctoproject.org>
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A9B8CDB49E
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 19:45:22 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.102661.1697399113972548689
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 12:45:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=dCs6qdoB;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=b1vtNPiH;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.191, mailfrom: 0101018b34df0ca8-70fa2355-440f-4dd6-bfec-dfa732b7da4a-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1697399115;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=s7KXHwZ6tca0ts87UOsbOHceE1qOZ977MT8dUiOPqXA=;
	b=dCs6qdoBImovrI3U1i4YD9EqtV9d0aTLMYzhekP+XUeM/vkYZPiTkc/WKPFiaDzO
	SzY6+MAnqKSnHgOLxf/s0K5XZ21TbLTu/dsffK8r2iv0ukOZ7EP6wKkR42BczcvTFsP
	TAkg365u6ikQ1dzrTsZVbyRLkNw44rlV465DKoZk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1697399115;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=s7KXHwZ6tca0ts87UOsbOHceE1qOZ977MT8dUiOPqXA=;
	b=b1vtNPiHmIWHayUytWDfZL/Xt3SDcMtFkG1ByzTMcG28XTLo0TGEv5oMDPet12H/
	arkSKSCYmenjnBOekyk8FICuZA1CgS2I2DrE9oPn/LfIwFLSsJHhtG/wW8wFpAfj9g2
	P8Wti5rse7u1US9/aqe+Ts+XYg8XcNBpIEhj2baA=
Content-Type: multipart/mixed; boundary="===============6813722452170179648=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ltp: upgrading to 20230929 SUCCEEDED
Message-ID: <0101018b34df0ca8-70fa2355-440f-4dd6-bfec-dfa732b7da4a-000000@us-west-2.amazonses.com>
Date: Sun, 15 Oct 2023 19:45:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 19:45:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189219

--===============6813722452170179648==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ltp* to *20230929* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ltp-upgrade-20230516-20230929.patch
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
From 67e2be8f8ab63270a44ad127cf06a8bc1cf3981b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Oct 2023 15:10:34 +0000
Subject: [PATCH] ltp: upgrade 20230516 -> 20230929

---
 meta/recipes-extended/ltp/{ltp_20230516.bb => ltp_20230929.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/ltp/{ltp_20230516.bb => ltp_20230929.bb} (99%)

diff --git a/meta/recipes-extended/ltp/ltp_20230516.bb b/meta/recipes-extended/ltp/ltp_20230929.bb
similarity index 99%
rename from meta/recipes-extended/ltp/ltp_20230516.bb
rename to meta/recipes-extended/ltp/ltp_20230929.bb
index 4d132b761a..5c43346883 100644
--- a/meta/recipes-extended/ltp/ltp_20230516.bb
+++ b/meta/recipes-extended/ltp/ltp_20230929.bb
@@ -24,7 +24,7 @@ TUNE_CCARGS:remove:x86-64 = "-mfpmath=sse"
 
 CFLAGS:append:powerpc64 = " -D__SANE_USERSPACE_TYPES__"
 CFLAGS:append:mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
-SRCREV = "3ebc2dfa85c2445bb68d8c0d66e33c4da1e1b3a7"
+SRCREV = "110d3be6a9c58674de3e366b96a70f0129a5d299"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
-- 
2.39.2


--===============6813722452170179648==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (0 cached, 912 parsed). 1845 targets, 50 skipped, 0 masked, 0 errors.
Removing 102 recipes from the core2-32 sysroot...done.
Removing 115 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-564a8cef8aee3d8209967e69579552abdfae791a"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:564a8cef8aee3d8209967e69579552abdfae791a"
workspace            = "master:988dc0dea4398e77a7d7862d4655a9b1f5eaa06d"

Initialising tasks...done.
Sstate summary: Wanted 742 Local 544 Mirrors 0 Missed 198 Current 336 (73% match, 81% complete)
Removing 1 stale sstate objects for arch allarch...done.
Removing 5 stale sstate objects for arch x86_64...done.
Removing 3 stale sstate objects for arch qemux86...done.
NOTE: Executing Tasks
NOTE: Running setscene task 338 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 341 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 360 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.38.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 361 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.38.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 362 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 364 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 385 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_create_spdx_setscene)
NOTE: Running setscene task 386 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.38.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 387 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 389 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_create_spdx_setscene)
NOTE: Running setscene task 395 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 417 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 432 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 465 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 466 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 478 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 479 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 483 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 486 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 528 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 550 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_create_spdx_setscene)
NOTE: Running setscene task 551 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 552 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_create_spdx_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe popt-1.19-r0: task do_create_spdx_setscene: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 577 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.189-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 578 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 584 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 586 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_create_spdx_setscene)
NOTE: Running setscene task 587 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.4.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 591 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_create_spdx_setscene)
NOTE: Running setscene task 595 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 597 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 602 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 604 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 606 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 607 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 608 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 609 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 610 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 611 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 624 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 625 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_create_spdx_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 627 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_create_spdx_setscene)
NOTE: recipe eudev-3.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 630 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.4.bb:do_packagedata_setscene)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe popt-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.38.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 633 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 634 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.38.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 635 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: Running setscene task 636 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.39.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 833 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.5.bb:do_recipe_qa)
NOTE: recipe acl-2.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe file-5.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 638 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 639 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 640 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_packagedata_setscene)
NOTE: Running setscene task 641 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 642 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 643 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 644 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 645 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 646 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 647 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: Running setscene task 648 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running task 864 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_recipe_qa)
NOTE: recipe curl-8.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 651 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.3.bb:do_create_spdx_setscene)
NOTE: recipe procps-4.0.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 895 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_recipe_qa)
NOTE: Running task 899 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.8.0.bb:do_recipe_qa)
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 920 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_recipe_qa)
NOTE: Running setscene task 654 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 655 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running task 921 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_recipe_qa)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 658 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe eudev-3.2.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 659 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_create_spdx_setscene)
NOTE: Running task 934 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.13.bb:do_recipe_qa)
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: Running task 935 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_recipe_qa)
NOTE: Running task 936 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.35.bb:do_recipe_qa)
NOTE: Running task 937 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_recipe_qa)
NOTE: Running task 938 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_recipe_qa)
NOTE: Running task 952 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_recipe_qa)
NOTE: Running task 953 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_recipe_qa)
NOTE: Running task 958 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_recipe_qa)
NOTE: Running task 959 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_recipe_qa)
NOTE: Running task 960 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_recipe_qa)
NOTE: Running task 961 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_recipe_qa)
NOTE: Running task 962 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb:do_recipe_qa)
NOTE: Running task 963 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_recipe_qa)
NOTE: Running task 970 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230929.bb:do_recipe_qa)
NOTE: recipe perl-5.38.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 977 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_recipe_qa)
NOTE: Running task 982 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_recipe_qa)
NOTE: Running task 983 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.5.0.bb:do_recipe_qa)
NOTE: Running task 985 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.2.bb:do_recipe_qa)
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 660 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_create_spdx_setscene)
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 661 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_package_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Started
NOTE: recipe tcl-8.6.13-r0: task do_recipe_qa: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.39.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 663 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-6.5.7+git-r0: task do_recipe_qa: Started
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libnl-1_3.8.0-r0: task do_recipe_qa: Started
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gzip-1.13-r0: task do_recipe_qa: Started
NOTE: recipe gawk-5.2.2-r0: task do_recipe_qa: Started
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_recipe_qa: Started
NOTE: recipe libaio-0.3.113-r0: task do_recipe_qa: Started
NOTE: Running setscene task 665 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_recipe_qa_setscene)
NOTE: recipe liburcu-0.14.0-r0: task do_recipe_qa: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_recipe_qa: Started
NOTE: recipe tar-1.35-r0: task do_recipe_qa: Started
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe logrotate-3.21.0-r0: task do_recipe_qa: Started
NOTE: recipe libmnl-1.0.5-r0: task do_recipe_qa: Started
NOTE: recipe expect-5.45.4-r0: task do_recipe_qa: Started
NOTE: Running setscene task 666 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_populate_sysroot_setscene)
NOTE: recipe cpio-2.14-r0: task do_recipe_qa: Started
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_recipe_qa: Started
NOTE: Running setscene task 667 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe ltp-20230929-r0: task do_recipe_qa: Started
NOTE: recipe iptables-1.8.9-r0: task do_recipe_qa: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_recipe_qa: Started
NOTE: recipe diffutils-3.10-r0: task do_recipe_qa: Started
NOTE: recipe procps-4.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 668 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe iproute2-6.5.0-r0: task do_recipe_qa: Started
NOTE: recipe which-2.21-r0: task do_recipe_qa: Started
NOTE: Running setscene task 669 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_create_spdx_setscene)
NOTE: recipe mdadm-4.2-r0: task do_recipe_qa: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdb-13.2-r0: task do_recipe_qa: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 670 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 673 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_package_setscene)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_recipe_qa: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe linux-yocto-6.5.7+git-r0: task do_recipe_qa: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libnl-1_3.8.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe gzip-1.13-r0: task do_recipe_qa: Succeeded
NOTE: recipe liburcu-0.14.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_recipe_qa: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe tcp-wrappers-7.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe tar-1.35-r0: task do_recipe_qa: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 676 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_create_spdx_setscene)
NOTE: recipe logrotate-3.21.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe cpio-2.14-r0: task do_recipe_qa: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe which-2.21-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 677 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.4.bb:do_package_setscene)
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe diffutils-3.10-r0: task do_recipe_qa: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe iproute2-6.5.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe gdb-13.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe ltp-20230929-r0: task do_recipe_qa: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_recipe_qa: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 679 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_setscene)
NOTE: Running setscene task 680 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 684 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 685 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 686 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 689 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 690 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_create_spdx_setscene)
NOTE: Running setscene task 695 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 700 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 701 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 702 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 703 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 704 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 986 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.5.bb:do_fetch)
NOTE: Running task 987 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_fetch)
NOTE: Running task 992 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_fetch)
NOTE: Running task 995 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.8.0.bb:do_fetch)
NOTE: Running task 999 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_fetch)
NOTE: Running task 1000 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_fetch)
NOTE: Running task 1002 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.13.bb:do_fetch)
NOTE: Running task 1003 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_fetch)
NOTE: Running task 1004 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.35.bb:do_fetch)
NOTE: Running task 1005 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_fetch)
NOTE: Running task 1006 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_fetch)
NOTE: Running task 1007 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_fetch)
NOTE: Running task 1008 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_fetch)
NOTE: Running task 1009 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_fetch)
NOTE: Running task 1010 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_fetch)
NOTE: Running task 1011 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_fetch)
NOTE: Running task 1012 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_fetch)
NOTE: Running task 1013 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb:do_fetch)
NOTE: Running task 1014 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_fetch)
NOTE: Running task 1017 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230929.bb:do_fetch)
NOTE: Running task 1018 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_fetch)
NOTE: Running task 1019 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_fetch)
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1020 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.5.0.bb:do_fetch)
NOTE: Running task 1023 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_recipe_qa)
NOTE: Running task 1024 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_recipe_qa)
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 708 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_packagedata_setscene)
NOTE: Running setscene task 709 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 716 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 718 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.4.bb:do_package_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1035 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_recipe_qa)
NOTE: recipe libx11-1_1.8.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe tcl-8.6.13-r0: task do_fetch: Started
NOTE: recipe kmod-30-r0: task do_recipe_qa_setscene: Started
NOTE: recipe popt-1.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gawk-5.2.2-r0: task do_fetch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Started
NOTE: recipe libaio-0.3.113-r0: task do_fetch: Started
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_fetch: Started
NOTE: recipe libnl-1_3.8.0-r0: task do_fetch: Started
NOTE: recipe libmnl-1.0.5-r0: task do_fetch: Started
NOTE: recipe bc-1.07.1-r0: task do_fetch: Started
NOTE: recipe tar-1.35-r0: task do_fetch: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_fetch: Started
NOTE: recipe logrotate-3.21.0-r0: task do_fetch: Started
NOTE: recipe liburcu-0.14.0-r0: task do_fetch: Started
NOTE: recipe gzip-1.13-r0: task do_fetch: Started
NOTE: Running task 1041 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.2.bb:do_fetch)
NOTE: recipe tcl-8.6.13-r0: task do_fetch: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_fetch: Succeeded
NOTE: recipe cpio-2.14-r0: task do_fetch: Started
NOTE: recipe expect-5.45.4-r0: task do_fetch: Started
NOTE: recipe which-2.21-r0: task do_fetch: Started
NOTE: Running task 1042 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_unpack)
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_fetch: Succeeded
NOTE: recipe diffutils-3.10-r0: task do_fetch: Started
NOTE: recipe ncurses-6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_fetch: Started
NOTE: recipe ltp-20230929-r0: task do_fetch: Started
NOTE: recipe libnl-1_3.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 1043 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_unpack)
NOTE: recipe mdadm-4.2-r0: task do_fetch: Started
NOTE: recipe logrotate-3.21.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 722 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_create_spdx_setscene)
NOTE: Running task 1044 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_unpack)
NOTE: recipe tar-1.35-r0: task do_fetch: Succeeded
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_fetch: Started
NOTE: recipe bc-1.07.1-r0: task do_fetch: Succeeded
NOTE: recipe gzip-1.13-r0: task do_fetch: Succeeded
NOTE: recipe liburcu-0.14.0-r0: task do_fetch: Succeeded
NOTE: Running task 1045 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.8.0.bb:do_unpack)
NOTE: recipe iptables-1.8.9-r0: task do_fetch: Succeeded
NOTE: Running task 1046 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_unpack)
NOTE: Running task 1047 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_unpack)
NOTE: recipe iproute2-6.5.0-r0: task do_fetch: Started
NOTE: recipe net-tools-2.10-r0: task do_recipe_qa: Started
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_recipe_qa: Started
NOTE: recipe which-2.21-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Started
NOTE: recipe cpio-2.14-r0: task do_fetch: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-6.5.7+git-r0: task do_fetch: Started
NOTE: recipe diffutils-3.10-r0: task do_fetch: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expect-5.45.4-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 725 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe quota-4.09-r0: task do_recipe_qa: Started
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_fetch: Succeeded
NOTE: recipe tcp-wrappers-7.6-r0: task do_fetch: Succeeded
NOTE: recipe iproute2-6.5.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_fetch: Succeeded
NOTE: Running setscene task 727 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 728 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 730 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 731 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 732 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 734 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 735 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 736 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 737 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_recipe_qa_setscene)
NOTE: Running task 1062 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_unpack)
NOTE: Running task 1063 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.13.bb:do_unpack)
NOTE: Running task 1064 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.35.bb:do_unpack)
NOTE: Running task 1065 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_unpack)
NOTE: Running task 1066 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_unpack)
NOTE: Running task 1067 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_unpack)
NOTE: Running task 1070 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_unpack)
NOTE: Running task 1071 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_unpack)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_fetch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 739 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_packagedata_setscene)
NOTE: Running task 1072 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_unpack)
NOTE: Running task 1073 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_unpack)
NOTE: Running task 1074 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb:do_unpack)
NOTE: Running task 1075 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_unpack)
NOTE: recipe libpam-1.5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1096 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_unpack)
NOTE: recipe libx11-1_1.8.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ltp-20230929-r0: task do_fetch: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_unpack: Started
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Started
NOTE: Running setscene task 741 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 742 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 744 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 745 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdb-13.2-r0: task do_fetch: Started
NOTE: Running setscene task 748 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 750 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 752 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 753 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_unpack: Started
NOTE: recipe net-tools-2.10-r0: task do_recipe_qa: Succeeded
NOTE: recipe gdb-13.2-r0: task do_fetch: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1097 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230929.bb:do_unpack)
NOTE: recipe libnl-1_3.8.0-r0: task do_unpack: Started
NOTE: recipe libmnl-1.0.5-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1098 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_fetch)
NOTE: Running task 1099 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_unpack)
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cronie-1.6.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1100 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_fetch)
NOTE: Running task 1101 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_patch)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe quota-4.09-r0: task do_recipe_qa: Succeeded
NOTE: recipe tcp-wrappers-7.6-r0: task do_unpack: Started
NOTE: recipe cpio-2.14-r0: task do_unpack: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_unpack: Started
NOTE: recipe tar-1.35-r0: task do_unpack: Started
NOTE: recipe bc-1.07.1-r0: task do_unpack: Started
NOTE: recipe liburcu-0.14.0-r0: task do_unpack: Started
NOTE: Running setscene task 758 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: recipe gzip-1.13-r0: task do_unpack: Started
NOTE: recipe iptables-1.8.9-r0: task do_unpack: Started
NOTE: Running task 1102 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe expect-5.45.4-r0: task do_unpack: Started
NOTE: recipe libxcb-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe diffutils-3.10-r0: task do_unpack: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_unpack: Started
NOTE: recipe zlib-1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_unpack: Started
NOTE: Running task 1103 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.5.0.bb:do_unpack)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe which-2.21-r0: task do_unpack: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 762 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_recipe_qa_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_unpack: Succeeded
NOTE: recipe libnl-1_3.8.0-r0: task do_unpack: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1104 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.2.bb:do_unpack)
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 764 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 765 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 766 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe logrotate-3.21.0-r0: task do_unpack: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ltp-20230929-r0: task do_unpack: Started
NOTE: Running setscene task 767 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: recipe net-tools-2.10-r0: task do_fetch: Started
NOTE: Running setscene task 768 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_unpack: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_unpack: Succeeded
NOTE: recipe which-2.21-r0: task do_unpack: Succeeded
NOTE: Running setscene task 769 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-yocto-6.5.7+git-r0: task do_fetch: Succeeded
NOTE: Running setscene task 771 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_recipe_qa_setscene)
NOTE: recipe mdadm-4.2-r0: task do_unpack: Started
NOTE: Running setscene task 772 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 773 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 774 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Started
NOTE: Running setscene task 775 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe cronie-1.6.1-r0: task do_fetch: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gzip-1.13-r0: task do_unpack: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 777 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_packagedata_setscene)
NOTE: recipe quota-4.09-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cpio-2.14-r0: task do_unpack: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_unpack: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 778 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe iproute2-6.5.0-r0: task do_unpack: Started
NOTE: Running setscene task 779 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 780 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.43.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 781 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.43.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1105 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.5.bb:do_unpack)
NOTE: Running task 1111 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe quota-4.09-r0: task do_fetch: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_fetch: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_package_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libnsl2/2.0.0/temp/log.do_packagedata_setscene.2163433
NOTE: recipe gdb-13.2-r0: task do_unpack: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 783 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_package_setscene: Started
NOTE: Running setscene task 785 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 787 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe procps-4.0.4-r0: task do_package_setscene: Started
NOTE: recipe tcl-8.6.13-r0: task do_unpack: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_unpack: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 789 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.4-r0: task do_package_setscene: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_package_setscene: Started
NOTE: Running task 1127 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_patch)
NOTE: Running task 1130 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.8.0.bb:do_patch)
NOTE: Running task 1132 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_fetch)
NOTE: Running task 1141 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_patch)
NOTE: Running task 1142 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_patch)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1143 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.13.bb:do_patch)
NOTE: Running task 1144 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_patch)
NOTE: recipe elfutils-0.189-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1145 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_patch)
NOTE: Running task 1146 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_patch)
NOTE: Running task 1147 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_patch)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 791 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe liburcu-0.14.0-r0: task do_unpack: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.43.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 792 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1148 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_patch)
NOTE: Running task 1149 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_patch)
NOTE: recipe iptables-1.8.9-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1150 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_patch)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe diffutils-3.10-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1151 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_unpack: Succeeded
NOTE: Running task 1157 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1158 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_patch)
NOTE: Running task 1159 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_patch)
NOTE: Running task 1164 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_unpack)
NOTE: recipe libxcb-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe tcl-8.6.13-r0: task do_patch: Started
NOTE: recipe libnl-1_3.8.0-r0: task do_patch: Started
NOTE: recipe linux-yocto-6.5.7+git-r0: task do_unpack: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_fetch: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_package_setscene: Started
NOTE: Running setscene task 798 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 799 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gawk-5.2.2-r0: task do_patch: Started
NOTE: recipe libmnl-1.0.5-r0: task do_patch: Started
NOTE: recipe bc-1.07.1-r0: task do_patch: Started
NOTE: recipe gzip-1.13-r0: task do_patch: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 801 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_patch: Started
NOTE: recipe logrotate-3.21.0-r0: task do_patch: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cpio-2.14-r0: task do_patch: Started
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 803 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 805 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 806 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: recipe iproute2-6.5.0-r0: task do_unpack: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 809 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 811 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 813 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 814 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 815 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_fetch: Succeeded
NOTE: recipe liburcu-0.14.0-r0: task do_patch: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: Running setscene task 816 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_patch: Started
NOTE: recipe libarchive-3.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Succeeded
NOTE: Running setscene task 818 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 820 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 821 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libnl-1_3.8.0-r0: task do_patch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 822 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.43.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 825 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 827 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 828 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 829 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.1.bb:do_packagedata_setscene)
NOTE: recipe tcp-wrappers-7.6-r0: task do_patch: Started
NOTE: recipe net-tools-2.10-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 830 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.2.2-r0: task do_patch: Succeeded
NOTE: recipe diffutils-3.10-r0: task do_patch: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_package_setscene: Succeeded
NOTE: Running task 1181 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_unpack)
NOTE: Running setscene task 832 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_patch: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: Running task 1182 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1183 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1189 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libaio-0.3.113-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 833 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 835 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 836 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.43.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe liburcu-0.14.0-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 839 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 840 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 841 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe mdadm-4.2-r0: task do_unpack: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_patch: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 842 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 844 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 845 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: recipe gzip-1.13-r0: task do_patch: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 846 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe cpio-2.14-r0: task do_patch: Succeeded
NOTE: recipe curl-8.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_unpack: Started
NOTE: Running setscene task 848 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.43.1.bb:do_recipe_qa_setscene)
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_unpack: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 850 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: Running task 1195 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libnl-1_3.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe diffutils-3.10-r0: task do_patch: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_package_setscene: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_patch: Succeeded
NOTE: Running setscene task 852 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 853 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 854 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gnutls-3.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 859 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 860 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 862 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1221 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_patch)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_recipe_qa_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 863 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1227 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1228 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 1229 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1230 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 1231 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb:do_patch)
NOTE: Running task 1232 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1235 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_patch)
NOTE: recipe sqlite3-3_3.43.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1236 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: Running setscene task 867 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 870 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 871 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 873 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 875 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 876 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_package_setscene)
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 878 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 879 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 880 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_patch: Started
NOTE: recipe procps-4.0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 881 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.4.0.bb:do_package_setscene)
NOTE: Running setscene task 883 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata_setscene)
NOTE: recipe tar-1.35-r0: task do_unpack: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1247 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.35.bb:do_patch)
NOTE: Running task 1248 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libnl-1_3.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sqlite3-3_3.43.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gzip-1.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_patch: Started
NOTE: recipe liburcu-0.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe logrotate-3.21.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cpio-2.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1255 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe file-5.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_patch: Started
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gawk-5.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 886 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1261 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_unpack)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1262 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_unpack)
NOTE: recipe iptables-1.8.9-r0: task do_patch: Succeeded
NOTE: Running setscene task 888 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 889 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1268 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_patch)
NOTE: Running task 1269 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.5.0.bb:do_patch)
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe net-tools-2.10-r0: task do_unpack: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 890 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_create_spdx_setscene)
NOTE: Running setscene task 894 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.45-r0: task do_package_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 896 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.4.bb:do_recipe_qa_setscene)
NOTE: recipe findutils-4.9.0-r0: task do_package_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libtirpc/1.3.3/temp/log.do_packagedata_setscene.2170503
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 897 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_package_setscene)
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 898 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe diffutils-3.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1300 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: Running task 1301 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 1304 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_deploy_source_date_epoch)
NOTE: recipe tcl-8.6.13-r0: task do_patch: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe tar-1.35-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe curl-8.4.0-r0: task do_package_setscene: Started
NOTE: Running task 1311 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_deploy_source_date_epoch)
NOTE: recipe gnutls-3.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1317 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_patch)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 901 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 902 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 903 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 904 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 905 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 906 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 907 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1325 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_recipe_qa)
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_unpack: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_unpack: Started
NOTE: recipe quota-4.09-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1352 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_recipe_qa)
NOTE: Running task 1360 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_recipe_qa)
NOTE: Running task 1361 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.1.bb:do_recipe_qa)
NOTE: recipe which-2.21-r0: task do_patch: Started
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe iproute2-6.5.0-r0: task do_patch: Started
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1362 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_patch)
NOTE: recipe liburcu-0.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1372 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe quota-4.09-r0: task do_unpack: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1388 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe cpio-2.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_fetch: Started
NOTE: recipe libmnl-1.0.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_unpack: Succeeded
NOTE: recipe gzip-1.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1421 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_patch)
NOTE: recipe libtirpc-1.3.3-r0: task do_package_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1435 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_patch)
NOTE: Running setscene task 911 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tcl-8.6.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe net-tools-2.10-r0: task do_patch: Started
NOTE: recipe gnutls-3.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_recipe_qa: Started
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.11-r0: task do_recipe_qa: Started
NOTE: recipe libaio-0.3.113-r0: task do_patch: Succeeded
NOTE: recipe binutils-cross-i686-2.41-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_recipe_qa: Started
NOTE: Running setscene task 913 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_recipe_qa_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_fetch: Succeeded
NOTE: recipe btrfs-tools-6.5.1-r0: task do_recipe_qa: Started
NOTE: recipe expect-5.45.4-r0: task do_patch: Succeeded
NOTE: recipe ltp-20230929-r0: task do_unpack: Succeeded
NOTE: Running task 1481 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_deploy_source_date_epoch)
NOTE: recipe iproute2-6.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1482 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1483 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_unpack)
NOTE: Running task 1484 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230929.bb:do_patch)
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1485 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1486 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_patch: Started
NOTE: recipe procps-4.0.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe diffutils-3.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 914 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_recipe_qa_setscene)
NOTE: Running task 1488 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.4.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe which-2.21-r0: task do_patch: Succeeded
NOTE: recipe quota-4.09-r0: task do_patch: Started
NOTE: Running task 1489 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe file-5.45-r0: task do_package_setscene: Succeeded
NOTE: Running task 1495 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running setscene task 915 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 916 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 917 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 918 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 919 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libaio-0.3.113-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1496 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_fetch)
NOTE: recipe net-tools-2.10-r0: task do_patch: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_patch: Succeeded
NOTE: recipe tar-1.35-r0: task do_patch: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_unpack: Started
NOTE: recipe grep-3.11-r0: task do_recipe_qa: Succeeded
NOTE: recipe ltp-20230929-r0: task do_patch: Started
NOTE: Running task 1497 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_deploy_source_date_epoch)
NOTE: recipe socat-1.7.4.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe btrfs-tools-6.5.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1499 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.35.bb:do_deploy_source_date_epoch)
NOTE: recipe iptables-1.8.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1500 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_fetch)
NOTE: Running task 1501 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_fetch)
NOTE: recipe liberror-perl-0.17029-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe iproute2-6.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1502 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.1.bb:do_fetch)
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe which-2.21-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 924 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 926 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 928 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 931 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Started
NOTE: recipe quota-4.09-r0: task do_patch: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1513 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: Running task 1514 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_unpack)
NOTE: Running task 1515 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe cronie-1.6.1-r0: task do_patch: Succeeded
NOTE: Running task 1516 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe procps-4.0.4-r0: task do_fetch: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1517 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.4.bb:do_unpack)
NOTE: recipe tar-1.35-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Started
NOTE: recipe findutils-4.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe grep-3.11-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_package_setscene: Succeeded
NOTE: Running task 1519 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_fetch)
NOTE: recipe file-5.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Succeeded
NOTE: recipe btrfs-tools-6.5.1-r0: task do_fetch: Started
NOTE: Running setscene task 933 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 934 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1520 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_unpack)
NOTE: recipe grep-3.11-r0: task do_fetch: Succeeded
NOTE: Running task 1521 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_unpack)
NOTE: recipe libaio-0.3.113-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Started
NOTE: recipe quota-4.09-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Succeeded
NOTE: recipe iproute2-6.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1522 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_patch)
NOTE: recipe cronie-1.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe which-2.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_unpack: Started
NOTE: recipe unzip-1_6.0-r0: task do_unpack: Succeeded
NOTE: recipe btrfs-tools-6.5.1-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1530 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.1.bb:do_unpack)
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 937 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe grep-3.11-r0: task do_unpack: Started
NOTE: recipe net-tools-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Started
NOTE: recipe tar-1.35-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Started
NOTE: recipe ltp-20230929-r0: task do_patch: Succeeded
NOTE: Running task 1546 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230929.bb:do_deploy_source_date_epoch)
NOTE: Running task 1547 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230929.bb:do_populate_lic)
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Succeeded
NOTE: Running task 1548 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_unpack)
NOTE: recipe file-5.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe quota-4.09-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 940 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe btrfs-tools-6.5.1-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cronie-1.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ltp-20230929-r0: task do_populate_lic: Started
NOTE: recipe ltp-20230929-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 1559 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_patch)
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1565 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe grep-3.11-r0: task do_unpack: Succeeded
NOTE: Running task 1566 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_patch)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_package_setscene: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Started
NOTE: recipe ltp-20230929-r0: task do_populate_lic: Succeeded
NOTE: Running setscene task 941 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 942 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 943 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230929.bb:do_populate_lic unihash changed to a28a370c2dd5de9b7a68fad9cbbd2c089924d3eb07e2207129ec019582522161
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Succeeded
NOTE: Running task 1572 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe ltp-20230929-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe grep-3.11-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Succeeded
NOTE: Running task 1573 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe grep-3.11-r0: task do_patch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1574 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_deploy_source_date_epoch)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 944 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_recipe_qa_setscene)
NOTE: recipe grep-3.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1579 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_configure)
NOTE: recipe util-linux-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe btrfs-tools-6.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1580 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.1.bb:do_patch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Started
NOTE: recipe grep-3.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Succeeded
NOTE: recipe btrfs-tools-6.5.1-r0: task do_patch: Started
NOTE: Running task 1586 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_compile)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Started
NOTE: recipe gdb-13.2-r0: task do_unpack: Succeeded
NOTE: Running task 1587 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.2.bb:do_patch)
NOTE: recipe coreutils-9.4-r0: task do_package_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Succeeded
NOTE: Running setscene task 945 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 946 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 947 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 948 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 949 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 950 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: Running setscene task 951 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_populate_sysroot_setscene)
NOTE: Running task 1588 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_install)
NOTE: recipe btrfs-tools-6.5.1-r0: task do_patch: Succeeded
NOTE: Running task 1589 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe tcp-wrappers-7.6-r0: task do_patch: Succeeded
NOTE: Running task 1590 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_deploy_source_date_epoch)
NOTE: recipe gdb-13.2-r0: task do_patch: Started
NOTE: recipe mdadm-4.2-r0: task do_patch: Succeeded
NOTE: Running task 1591 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Started
NOTE: recipe coreutils-9.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe btrfs-tools-6.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe coreutils-9.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 952 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.4.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 956 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 959 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 960 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 961 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Succeeded
NOTE: Running setscene task 963 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe tcp-wrappers-7.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1592 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot)
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe btrfs-tools-6.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1599 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.4.bb:do_fetch)
NOTE: recipe acl-2.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 964 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_package_setscene)
NOTE: Running setscene task 965 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_setscene)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_fetch: Started
NOTE: recipe coreutils-9.4-r0: task do_fetch: Succeeded
NOTE: Running task 1610 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.4.bb:do_unpack)
NOTE: recipe gdb-13.2-r0: task do_patch: Succeeded
NOTE: Running task 1611 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.2.bb:do_deploy_source_date_epoch)
NOTE: recipe attr-2.5.1-r0: task do_package_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe util-linux-2.39.2-r0: task do_package_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_unpack: Started
NOTE: recipe curl-8.4.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 966 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 967 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 968 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 969 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 970 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdb-13.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 971 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe gdb-13.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 972 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-3.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 976 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 977 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 978 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 980 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.3.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running setscene task 981 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1617 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe coreutils-9.4-r0: task do_unpack: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1628 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.4.bb:do_patch)
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe perl-5.38.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 984 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 987 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.38.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 988 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 989 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_patch: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 65b6804f18b5304f7fc6bf26f99eb080c6989c489e5ea6be5abbbd4524adf075
NOTE: recipe perl-5.38.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1639 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_patch: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 992 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: recipe util-linux-2.39.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 993 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 994 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 995 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 996 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 997 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 998 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 999 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1000 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1001 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1002 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1003 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1004 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1009 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1011 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1014 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1015 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1016 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1018 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1021 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1023 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1024 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1026 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1028 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1029 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1030 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1032 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1035 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1037 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1038 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1040 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1042 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1044 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1045 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1047 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1049 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1050 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1051 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1052 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1054 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1058 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1059 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1061 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1066 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1068 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1069 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1072 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1073 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1074 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1076 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1078 of 1078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2040 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2062 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2144 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2194 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2225 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2243 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata)
NOTE: Running task 2245 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2251 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2271 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2272 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.35.bb:do_prepare_recipe_sysroot)
NOTE: recipe coreutils-9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tcl-8.6.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: Running task 2303 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2304 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2336 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2339 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2340 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2341 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2356 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata: Started
NOTE: Running task 2390 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gawk-5.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2425 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2436 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe gzip-1.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tar-1.35-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libaio-0.3.113-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe liburcu-0.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2472 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2475 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_collect_spdx_deps)
NOTE: recipe tcp-wrappers-7.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-yocto-6.5.7+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmnl-1.0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2511 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.4.bb:do_collect_spdx_deps)
NOTE: recipe iptables-1.8.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffutils-3.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2532 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_collect_spdx_deps)
NOTE: Running task 2535 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_collect_spdx_deps)
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2537 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe which-2.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe net-tools-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tcl-8.6.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2546 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_configure)
NOTE: recipe grep-3.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libaio-0.3.113-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2551 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_collect_spdx_deps)
NOTE: recipe coreutils-9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2552 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_configure)
NOTE: recipe tcp-wrappers-7.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2553 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.4.bb:do_configure)
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2554 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_configure)
NOTE: Running task 2555 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_configure)
NOTE: recipe coreutils-9.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe liburcu-0.14.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2556 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_collect_spdx_deps)
NOTE: recipe libcheck-0.15.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2558 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_collect_spdx_deps)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2567 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.4.bb:do_collect_spdx_deps)
NOTE: recipe btrfs-tools-6.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe libaio-0.3.113-r0: task do_configure: Started
NOTE: Running task 2569 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata)
NOTE: recipe gawk-5.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe liburcu-0.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe liburcu-0.14.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2570 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure)
NOTE: recipe coreutils-9.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2571 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_configure)
NOTE: recipe gzip-1.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tar-1.35-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_configure: Started
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Started
NOTE: Running task 2572 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.13.bb:do_configure)
NOTE: recipe iptables-1.8.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tcp-wrappers-7.6-r0: task do_configure: Started
NOTE: Running task 2573 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.35.bb:do_configure)
NOTE: recipe coreutils-9.4-r0: task do_configure: Started
NOTE: Running task 2574 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_configure)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2575 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_configure)
NOTE: recipe libmnl-1.0.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_collect_spdx_deps: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 5aec3edc2a19e157ed7d86a7beb72eedb6d82f64db10035a5506284b34ff059c
NOTE: Running task 2578 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe tcl-8.6.13-r0: task do_collect_spdx_deps: Started
NOTE: recipe diffutils-3.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2583 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_configure)
NOTE: Running task 2584 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_configure)
NOTE: recipe which-2.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_configure: Succeeded
NOTE: Running task 2588 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_configure)
NOTE: recipe grep-3.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2589 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_compile)
NOTE: Running task 2592 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe procps-4.0.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_configure: Started
NOTE: Running task 2593 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure)
NOTE: Running task 2594 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_configure)
NOTE: recipe liberror-perl-0.17029-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe tcp-wrappers-7.6-r0: task do_configure: Succeeded
NOTE: Running task 2595 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_configure)
NOTE: Running task 2596 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_compile)
NOTE: Running task 2598 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_configure)
NOTE: recipe tcl-8.6.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata: Started
NOTE: recipe gawk-5.2.2-r0: task do_configure: Started
NOTE: recipe liburcu-0.14.0-r0: task do_configure: Started
NOTE: Running task 2601 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_collect_spdx_deps)
NOTE: recipe tar-1.35-r0: task do_configure: Started
NOTE: Running task 2603 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_collect_spdx_deps)
NOTE: recipe iptables-1.8.9-r0: task do_configure: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2604 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.13.bb:do_collect_spdx_deps)
NOTE: recipe libmnl-1.0.5-r0: task do_configure: Started
NOTE: recipe libaio-0.3.113-r0: task do_compile: Started
NOTE: recipe gzip-1.13-r0: task do_configure: Started
NOTE: recipe which-2.21-r0: task do_configure: Started
NOTE: recipe diffutils-3.10-r0: task do_configure: Started
NOTE: Running task 2605 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.35.bb:do_collect_spdx_deps)
NOTE: recipe linux-yocto-6.5.7+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2606 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_collect_spdx_deps)
NOTE: recipe procps-4.0.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_compile: Started
NOTE: Running task 2607 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_collect_spdx_deps)
NOTE: recipe liberror-perl-0.17029-r0: task do_configure: Started
NOTE: Running task 2608 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_collect_spdx_deps)
NOTE: recipe cronie-1.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mdadm-4.2-r0: task do_configure: Started
NOTE: recipe grep-3.11-r0: task do_configure: Started
NOTE: recipe which-2.21-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2609 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_collect_spdx_deps)
NOTE: recipe net-tools-2.10-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2610 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_collect_spdx_deps)
NOTE: recipe gzip-1.13-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2613 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.4.bb:do_create_spdx)
NOTE: Running task 2616 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.4.bb:do_package_write_rpm)
NOTE: recipe net-tools-2.10-r0: task do_configure: Succeeded
NOTE: Running task 2617 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm)
NOTE: recipe which-2.21-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2618 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_package_write_rpm)
NOTE: recipe libaio-0.3.113-r0: task do_compile: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2619 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_compile)
NOTE: recipe unzip-1_6.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2620 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_install)
NOTE: recipe tar-1.35-r0: task do_collect_spdx_deps: Started
NOTE: recipe gawk-5.2.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe findutils-4.9.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gzip-1.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe gawk-5.2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe tar-1.35-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_create_spdx: Started
NOTE: Running task 2627 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_collect_spdx_deps)
NOTE: recipe procps-4.0.4-r0: task do_package_write_rpm: Started
NOTE: recipe libaio-0.3.113-r0: task do_install: Started
NOTE: recipe findutils-4.9.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe file-5.45-r0: task do_package_write_rpm: Started
NOTE: Running task 2628 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_create_spdx)
NOTE: recipe unzip-1_6.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_compile: Started
NOTE: Running task 2629 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_create_spdx)
NOTE: recipe unzip-1_6.0-r0: task do_package_write_rpm: Started
NOTE: Running task 2630 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_configure)
NOTE: recipe mdadm-4.2-r0: task do_configure: Succeeded
NOTE: recipe tcp-wrappers-7.6-r0: task do_compile: Succeeded
NOTE: Running task 2631 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_install)
NOTE: Running task 2632 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe tcp-wrappers-7.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe btrfs-tools-6.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2633 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.1.bb:do_configure)
NOTE: recipe cronie-1.6.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_create_spdx: Started
NOTE: recipe unzip-1_6.0-r0: task do_create_spdx: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_configure: Succeeded
NOTE: Running task 2634 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_configure_ptest_base)
NOTE: recipe tcp-wrappers-7.6-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Started
NOTE: recipe libaio-0.3.113-r0: task do_install: Succeeded
NOTE: Running task 2635 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package)
NOTE: recipe btrfs-tools-6.5.1-r0: task do_configure: Started
NOTE: Running task 2636 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_populate_sysroot)
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2637 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_configure: Succeeded
NOTE: Running task 2638 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_configure)
NOTE: Running task 2639 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_compile)
NOTE: recipe liberror-perl-0.17029-r0: task do_configure_ptest_base: Started
NOTE: recipe libaio-0.3.113-r0: task do_populate_sysroot: Started
NOTE: recipe libaio-0.3.113-r0: task do_package: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_compile: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_compile: Started
NOTE: Running task 2640 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_compile)
NOTE: recipe cronie-1.6.1-r0: task do_configure: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_compile: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_compile: Succeeded
NOTE: Running task 2641 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_install)
NOTE: recipe tcp-wrappers-7.6-r0: task do_install: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2642 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package)
NOTE: Running task 2643 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230929.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2644 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot)
NOTE: recipe liberror-perl-0.17029-r0: task do_compile: Succeeded
NOTE: Running task 2645 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_compile_ptest_base)
NOTE: recipe tcp-wrappers-7.6-r0: task do_package: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_install: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_populate_sysroot: Started
NOTE: recipe ltp-20230929-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_compile_ptest_base: Started
NOTE: recipe findutils-4.9.0-r0: task do_create_spdx: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2646 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install)
NOTE: recipe ltp-20230929-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2647 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230929.bb:do_configure)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_install: Succeeded
NOTE: Running task 2648 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_populate_sysroot)
NOTE: Running task 2652 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_collect_spdx_deps)
NOTE: recipe liberror-perl-0.17029-r0: task do_install: Started
NOTE: Running task 2654 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.4.0.bb:do_package_write_rpm)
NOTE: recipe ltp-20230929-r0: task do_configure: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_populate_sysroot: Started
NOTE: recipe cpio-2.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe cpio-2.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_create_spdx: Succeeded
NOTE: recipe curl-8.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe procps-4.0.4-r0: task do_create_spdx: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_install: Succeeded
NOTE: Running task 2655 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install_ptest_base)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2656 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe liberror-perl-0.17029-r0: task do_install_ptest_base: Started
NOTE: recipe cpio-2.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2657 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install_ptest_perl)
NOTE: recipe tcp-wrappers-7.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2658 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe liberror-perl-0.17029-r0: task do_install_ptest_perl: Started
NOTE: recipe cpio-2.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2659 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_configure)
NOTE: recipe liberror-perl-0.17029-r0: task do_install_ptest_perl: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe unzip-1_6.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2660 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package)
NOTE: recipe cpio-2.14-r0: task do_configure: Started
NOTE: recipe libaio-0.3.113-r0: task do_package: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package: Started
NOTE: Running task 2661 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_configure)
NOTE: Running task 2662 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_packagedata)
NOTE: recipe libaio-0.3.113-r0: task do_packagedata: Started
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Started
NOTE: recipe libaio-0.3.113-r0: task do_packagedata: Succeeded
NOTE: Running task 2663 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_create_spdx)
NOTE: Running task 2664 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package_write_rpm)
NOTE: recipe tcp-wrappers-7.6-r0: task do_package: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2665 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata)
NOTE: recipe libaio-0.3.113-r0: task do_create_spdx: Started
NOTE: recipe libaio-0.3.113-r0: task do_package_write_rpm: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_packagedata: Started
NOTE: recipe libaio-0.3.113-r0: task do_create_spdx: Succeeded
NOTE: Running task 2666 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230929.bb:do_collect_spdx_deps)
NOTE: recipe ltp-20230929-r0: task do_collect_spdx_deps: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2667 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_create_spdx)
NOTE: recipe ltp-20230929-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe tcp-wrappers-7.6-r0: task do_create_spdx: Started
NOTE: recipe libaio-0.3.113-r0: task do_package_write_rpm: Succeeded
NOTE: recipe tcp-wrappers-7.6-r0: task do_create_spdx: Succeeded
NOTE: recipe which-2.21-r0: task do_configure: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package: Succeeded
NOTE: Running task 2668 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_compile)
NOTE: Running task 2669 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata)
NOTE: recipe linux-yocto-6.5.7+git-r0: task do_unpack: Succeeded
NOTE: Running task 2670 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.5.bb:do_symlink_kernsrc)
NOTE: Running task 2671 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.5.bb:do_collect_spdx_deps)
NOTE: recipe which-2.21-r0: task do_compile: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata: Started
NOTE: recipe linux-yocto-6.5.7+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe linux-yocto-6.5.7+git-r0: task do_symlink_kernsrc: Started
NOTE: recipe linux-yocto-6.5.7+git-r0: task do_symlink_kernsrc: Succeeded
NOTE: Running task 2672 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.5.bb:do_kernel_checkout)
NOTE: recipe linux-yocto-6.5.7+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe linux-yocto-6.5.7+git-r0: task do_kernel_checkout: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata: Succeeded
NOTE: recipe btrfs-tools-6.5.1-r0: task do_configure: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_configure: Succeeded
NOTE: recipe which-2.21-r0: task do_compile: Succeeded
NOTE: Running task 2673 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.1.bb:do_compile)
NOTE: Running task 2674 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure_ptest_base)
NOTE: Running task 2675 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_install)
NOTE: recipe btrfs-tools-6.5.1-r0: task do_compile: Started
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe which-2.21-r0: task do_install: Started
NOTE: Running task 2676 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile)
NOTE: recipe bc-1.07.1-r0: task do_compile: Started
NOTE: recipe which-2.21-r0: task do_install: Succeeded
NOTE: Running task 2677 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package)
NOTE: recipe cronie-1.6.1-r0: task do_configure: Succeeded
NOTE: recipe which-2.21-r0: task do_package: Started
NOTE: Running task 2678 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_compile)
NOTE: recipe cronie-1.6.1-r0: task do_compile: Started
NOTE: recipe net-tools-2.10-r0: task do_compile: Succeeded
NOTE: Running task 2679 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_compile: Succeeded
NOTE: Running task 2680 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile_ptest_base)
NOTE: recipe net-tools-2.10-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Started
NOTE: recipe file-5.45-r0: task do_package_write_rpm: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_compile: Succeeded
NOTE: Running task 2681 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_install)
NOTE: recipe cronie-1.6.1-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2682 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_compile: Succeeded
NOTE: Running task 2683 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_install: Started
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Started
NOTE: recipe cronie-1.6.1-r0: task do_install: Succeeded
NOTE: Running task 2684 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_package)
NOTE: recipe net-tools-2.10-r0: task do_install: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2685 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install)
NOTE: Running task 2686 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_package)
NOTE: recipe tcl-8.6.13-r0: task do_configure: Succeeded
NOTE: Running task 2687 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_configure_ptest_base)
NOTE: recipe net-tools-2.10-r0: task do_package: Started
NOTE: recipe bc-1.07.1-r0: task do_install: Started
NOTE: recipe cronie-1.6.1-r0: task do_package: Started
NOTE: recipe tcl-8.6.13-r0: task do_configure_ptest_base: Started
NOTE: recipe tcl-8.6.13-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2688 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_compile)
NOTE: recipe tcl-8.6.13-r0: task do_compile: Started
NOTE: recipe mdadm-4.2-r0: task do_install: Succeeded
NOTE: recipe which-2.21-r0: task do_package: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_install: Succeeded
NOTE: Running task 2689 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install_ptest_base)
NOTE: Running task 2690 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata)
NOTE: Running task 2691 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Started
NOTE: recipe which-2.21-r0: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2692 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_package)
NOTE: Running task 2693 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package)
NOTE: recipe which-2.21-r0: task do_packagedata: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_configure: Succeeded
NOTE: Running task 2694 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_create_spdx)
NOTE: Running task 2695 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_compile)
NOTE: Running task 2696 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm)
NOTE: recipe mdadm-4.2-r0: task do_package: Started
NOTE: recipe bc-1.07.1-r0: task do_package: Started
NOTE: recipe which-2.21-r0: task do_create_spdx: Started
NOTE: recipe libmnl-1.0.5-r0: task do_compile: Started
NOTE: recipe which-2.21-r0: task do_package_write_rpm: Started
NOTE: recipe which-2.21-r0: task do_create_spdx: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_compile: Succeeded
NOTE: Running task 2697 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_install)
NOTE: recipe libmnl-1.0.5-r0: task do_install: Started
NOTE: recipe which-2.21-r0: task do_package_write_rpm: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_package: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_configure: Succeeded
NOTE: Running task 2698 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_packagedata)
NOTE: Running task 2699 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_compile)
NOTE: recipe cronie-1.6.1-r0: task do_packagedata: Started
NOTE: recipe iptables-1.8.9-r0: task do_compile: Started
NOTE: recipe libmnl-1.0.5-r0: task do_install: Succeeded
NOTE: Running task 2700 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_package)
NOTE: Running task 2701 of 2911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_populate_sysroot)
NOTE: recipe cronie-1.6.1-r0: task do_packagedata: Failed
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot: Started
NOTE: recipe libmnl-1.0.5-r0: task do_package: Started
NOTE: recipe net-tools-2.10-r0: task do_package: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe btrfs-tools-6.5.1-r0: task do_compile: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Succeeded
NOTE: recipe curl-8.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_package: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_package: Succeeded
NOTE: recipe liburcu-0.14.0-r0: task do_configure: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_compile: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_compile: Succeeded
NOTE: recipe gzip-1.13-r0: task do_configure: Succeeded
NOTE: recipe ltp-20230929-r0: task do_configure: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_configure: Succeeded
NOTE: recipe cpio-2.14-r0: task do_configure: Succeeded
NOTE: recipe diffutils-3.10-r0: task do_configure: Succeeded
NOTE: recipe grep-3.11-r0: task do_configure: Succeeded
NOTE: recipe tar-1.35-r0: task do_configure: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_configure: Succeeded
NOTE: recipe linux-yocto-6.5.7+git-r0: task do_kernel_checkout: Succeeded
NOTE: Tasks Summary: Attempted 2701 tasks of which 2380 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_packagedata
Summary: There were 24 ERROR messages, returning a non-zero exit code.
ERROR: libnsl2-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package libnsl2-src went backwards which would break package feeds (from 0:2.0.1-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: libnsl2-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package libnsl2-dbg went backwards which would break package feeds (from 0:2.0.1-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: libnsl2-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package libnsl2-staticdev went backwards which would break package feeds (from 0:2.0.1-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: libnsl2-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package libnsl2-dev went backwards which would break package feeds (from 0:2.0.1-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: libnsl2-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package libnsl2-doc went backwards which would break package feeds (from 0:2.0.1-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: libnsl2-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package libnsl2-locale went backwards which would break package feeds (from 0:2.0.1-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: libnsl2-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package libnsl2 went backwards which would break package feeds (from 0:2.0.1-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: libnsl2-2.0.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: libtirpc-1.3.3-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-src went backwards which would break package feeds (from 0:1.3.4-r0 to 0:1.3.3-r0) [version-going-backwards]
ERROR: libtirpc-1.3.3-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-dbg went backwards which would break package feeds (from 0:1.3.4-r0 to 0:1.3.3-r0) [version-going-backwards]
ERROR: libtirpc-1.3.3-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-staticdev went backwards which would break package feeds (from 0:1.3.4-r0 to 0:1.3.3-r0) [version-going-backwards]
ERROR: libtirpc-1.3.3-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-dev went backwards which would break package feeds (from 0:1.3.4-r0 to 0:1.3.3-r0) [version-going-backwards]
ERROR: libtirpc-1.3.3-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-doc went backwards which would break package feeds (from 0:1.3.4-r0 to 0:1.3.3-r0) [version-going-backwards]
ERROR: libtirpc-1.3.3-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-locale went backwards which would break package feeds (from 0:1.3.4-r0 to 0:1.3.3-r0) [version-going-backwards]
ERROR: libtirpc-1.3.3-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc went backwards which would break package feeds (from 0:1.3.4-r0 to 0:1.3.3-r0) [version-going-backwards]
ERROR: libtirpc-1.3.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: cronie-1.6.1-r0 do_packagedata: QA Issue: Package version for package cronie-src went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1-r0) [version-going-backwards]
ERROR: cronie-1.6.1-r0 do_packagedata: QA Issue: Package version for package cronie-dbg went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1-r0) [version-going-backwards]
ERROR: cronie-1.6.1-r0 do_packagedata: QA Issue: Package version for package cronie-staticdev went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1-r0) [version-going-backwards]
ERROR: cronie-1.6.1-r0 do_packagedata: QA Issue: Package version for package cronie-dev went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1-r0) [version-going-backwards]
ERROR: cronie-1.6.1-r0 do_packagedata: QA Issue: Package version for package cronie-doc went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1-r0) [version-going-backwards]
ERROR: cronie-1.6.1-r0 do_packagedata: QA Issue: Package version for package cronie-locale went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1-r0) [version-going-backwards]
ERROR: cronie-1.6.1-r0 do_packagedata: QA Issue: Package version for package cronie went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1-r0) [version-going-backwards]
ERROR: cronie-1.6.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/cronie/1.6.1/temp/log.do_packagedata.2228636
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_packagedata) failed with exit code '1'

--===============6813722452170179648==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/ltp/ltp-dev: FILELIST: removed "/opt/ltp/include/ipcshm.h"
packages/core2-32-poky-linux/ltp/ltp: FILELIST: removed "/opt/ltp/testcases/bin/setgroups04 /opt/ltp/testcases/bin/mmap07 /opt/ltp/testcases/bin/setgroups04_16", added "/opt/ltp/testcases/bin/faccessat02 /opt/ltp/testcases/bin/statx12 /opt/ltp/testcases/bin/statx10 /opt/ltp/testcases/bin/statx11 /opt/ltp/testcases/bin/process_madvise01 /opt/ltp/testcases/bin/pipe14 /opt/ltp/testcases/bin/tcindex01 /opt/ltp/testcases/bin/tst_lockdown_enabled /opt/ltp/testcases/bin/faccessat201 /opt/ltp/testcases/bin/faccessat202 /opt/ltp/testcases/bin/tst_secureboot_enabled /opt/ltp/testcases/bin/mremap06 /opt/ltp/bin/tag-release.sh /opt/ltp/bin/create-tarballs-metadata.sh /opt/ltp/testcases/bin/eventfd03 /opt/ltp/testcases/bin/eventfd02 /opt/ltp/testcases/bin/eventfd05 /opt/ltp/testcases/bin/eventfd04 /opt/ltp/testcases/bin/eventfd06 /opt/ltp/testcases/bin/epoll_wait05 /opt/ltp/testcases/bin/epoll_wait07 /opt/ltp/testcases/bin/clone303 /opt/ltp/testcases/bin/epoll_wait06 /opt/ltp/testcases/bin/kvm_sv
 m02 /opt/ltp/testcases/bin/kvm_svm03 /opt/ltp/bin/lib.sh /opt/ltp/testcases/bin/starvation"
Changes to packages/core2-32-poky-linux/ltp (sysroot):
  /opt/ltp/include/ipcshm.h was removed

--===============6813722452170179648==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1845 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (911 cached, 1 parsed). 1845 targets, 38 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-564a8cef8aee3d8209967e69579552abdfae791a"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:564a8cef8aee3d8209967e69579552abdfae791a"
workspace            = "master:988dc0dea4398e77a7d7862d4655a9b1f5eaa06d"

Initialising tasks...done.
Sstate summary: Wanted 205 Local 70 Mirrors 0 Missed 135 Current 905 (34% match, 87% complete)
Removing 5 stale sstate objects for arch qemux86_64...done.
Removing 3 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 911 of 1110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 914 of 1110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 934 of 1110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1005 of 1110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1014 of 1110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1059 of 1110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_spdx_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe btrfs-tools-6.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe systemd-1_254.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1090 of 1110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 1091 of 1110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_create_spdx_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/btrfs-tools/6.5.1/temp/log.do_packagedata_setscene.1823556
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1092 of 1110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.1.bb:do_package_setscene)
NOTE: recipe glibc-2.38+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe systemd-1_254.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_create_spdx_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/libnsl2/2.0.0/temp/log.do_packagedata_setscene.1823829
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1096 of 1110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1097 of 1110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_setscene)
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1423 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_recipe_qa)
NOTE: recipe libnsl2-2.0.0-r0: task do_package_setscene: Started
NOTE: recipe btrfs-tools-6.5.1-r0: task do_package_setscene: Started
NOTE: Running task 1618 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1652 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_recipe_qa)
NOTE: recipe tcl-8.6.13-r0: task do_recipe_qa: Started
NOTE: Running task 1675 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.8.0.bb:do_recipe_qa)
NOTE: Running task 1838 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_recipe_qa)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: Running task 1888 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_recipe_qa)
NOTE: Running task 1889 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_recipe_qa)
NOTE: Running task 1890 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.13.bb:do_recipe_qa)
NOTE: Running task 1891 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_recipe_qa)
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa: Started
NOTE: recipe libnl-1_3.8.0-r0: task do_recipe_qa: Started
NOTE: recipe tcl-8.6.13-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1962 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_fetch)
NOTE: Running task 1970 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_recipe_qa)
NOTE: Running task 1972 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_recipe_qa)
NOTE: Running task 2029 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb:do_recipe_qa)
NOTE: Running task 2040 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.4.bb:do_populate_sysroot)
NOTE: Running task 2047 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_recipe_qa)
NOTE: recipe libnsl2-2.0.0-r0: task do_package_setscene: Succeeded
NOTE: Running task 2060 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230929.bb:do_recipe_qa)
NOTE: recipe gawk-5.2.2-r0: task do_recipe_qa: Started
NOTE: Running setscene task 1103 of 1110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1104 of 1110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1105 of 1110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe expect-5.45.4-r0: task do_recipe_qa: Started
NOTE: recipe gzip-1.13-r0: task do_recipe_qa: Started
NOTE: recipe cpio-2.14-r0: task do_recipe_qa: Started
NOTE: recipe logrotate-3.21.0-r0: task do_recipe_qa: Started
NOTE: recipe libaio-0.3.113-r0: task do_recipe_qa: Started
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe liburcu-0.14.0-r0: task do_recipe_qa: Started
NOTE: recipe tcl-8.6.13-r0: task do_fetch: Started
NOTE: Running task 2133 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.2.bb:do_recipe_qa)
NOTE: Running task 2134 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_recipe_qa)
NOTE: Running task 2135 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_recipe_qa)
NOTE: Running task 2136 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_recipe_qa)
NOTE: recipe libnl-1_3.8.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2143 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_fetch)
NOTE: Running task 2150 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.8.0.bb:do_fetch)
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_recipe_qa: Started
NOTE: recipe tcl-8.6.13-r0: task do_fetch: Succeeded
NOTE: Running task 2177 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_unpack)
NOTE: Running task 2178 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe liberror-perl-0.17029-r0: task do_recipe_qa: Started
NOTE: recipe ltp-20230929-r0: task do_recipe_qa: Started
NOTE: recipe coreutils-9.4-r0: task do_populate_sysroot: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.2.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2267 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_fetch)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expect-5.45.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe cpio-2.14-r0: task do_recipe_qa: Succeeded
NOTE: recipe gzip-1.13-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2299 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_fetch)
NOTE: recipe quota-4.09-r0: task do_recipe_qa: Started
NOTE: recipe net-tools-2.10-r0: task do_recipe_qa: Started
NOTE: recipe gdb-13.2-r0: task do_recipe_qa: Started
NOTE: recipe logrotate-3.21.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2311 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_fetch)
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Started
NOTE: Running task 2321 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.13.bb:do_fetch)
NOTE: recipe libaio-0.3.113-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2329 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_fetch)
NOTE: recipe liburcu-0.14.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_recipe_qa: Started
NOTE: Running task 2345 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_fetch)
NOTE: Running task 2346 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_fetch)
NOTE: recipe libnl-1_3.8.0-r0: task do_fetch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Succeeded
NOTE: Running task 2382 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_unpack)
NOTE: Running task 2383 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnl-1_3.8.0-r0: task do_fetch: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe btrfs-tools-6.5.1-r0: task do_package_setscene: Succeeded
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2405 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.8.0.bb:do_unpack)
NOTE: recipe tcl-8.6.13-r0: task do_unpack: Started
NOTE: Running task 2415 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb:do_fetch)
NOTE: Running setscene task 1107 of 1110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_recipe_qa: Succeeded
NOTE: recipe ltp-20230929-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2470 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_fetch)
NOTE: Running task 2471 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230929.bb:do_fetch)
NOTE: Running task 2500 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.4.bb:do_collect_spdx_deps)
NOTE: recipe expect-5.45.4-r0: task do_fetch: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/libtirpc/1.3.3/temp/log.do_packagedata_setscene.1824571
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1108 of 1110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_package_setscene)
NOTE: recipe quota-4.09-r0: task do_recipe_qa: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_recipe_qa: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_fetch: Started
NOTE: recipe cpio-2.14-r0: task do_fetch: Started
NOTE: recipe gzip-1.13-r0: task do_fetch: Started
NOTE: recipe logrotate-3.21.0-r0: task do_fetch: Started
NOTE: recipe liburcu-0.14.0-r0: task do_fetch: Started
NOTE: recipe libaio-0.3.113-r0: task do_fetch: Started
NOTE: Running task 2530 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_fetch)
NOTE: Running task 2538 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_fetch)
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Started
NOTE: recipe liburcu-0.14.0-r0: task do_fetch: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_fetch: Succeeded
NOTE: recipe gzip-1.13-r0: task do_fetch: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe gdb-13.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_fetch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2553 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_unpack)
NOTE: Running task 2554 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2555 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_unpack)
NOTE: Running task 2556 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.13.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 2557 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe gawk-5.2.2-r0: task do_fetch: Succeeded
NOTE: recipe cpio-2.14-r0: task do_fetch: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2558 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_unpack)
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_fetch: Started
NOTE: recipe btrfs-tools-6.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 2559 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_unpack)
NOTE: Running task 2560 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_unpack)
NOTE: Running task 2561 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2562 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.2.bb:do_fetch)
NOTE: Running task 2563 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_fetch)
NOTE: Running task 2564 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe libnl-1_3.8.0-r0: task do_unpack: Started
NOTE: Running task 2565 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_fetch: Succeeded
NOTE: recipe ltp-20230929-r0: task do_fetch: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_fetch: Started
NOTE: Running task 2566 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb:do_unpack)
NOTE: recipe libaio-0.3.113-r0: task do_fetch: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Succeeded
NOTE: Running task 2593 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_collect_spdx_deps)
NOTE: recipe liberror-perl-0.17029-r0: task do_fetch: Succeeded
NOTE: Running task 2594 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_patch)
NOTE: Running task 2595 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_unpack)
NOTE: Running task 2596 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_prepare_recipe_sysroot)
NOTE: recipe coreutils-9.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe quota-4.09-r0: task do_fetch: Started
NOTE: recipe net-tools-2.10-r0: task do_fetch: Started
NOTE: Running task 2597 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_unpack)
NOTE: Running task 2598 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-6.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe liburcu-0.14.0-r0: task do_unpack: Started
NOTE: recipe liburcu-0.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnl-1_3.8.0-r0: task do_unpack: Succeeded
NOTE: recipe ltp-20230929-r0: task do_fetch: Succeeded
NOTE: recipe quota-4.09-r0: task do_fetch: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_unpack: Started
NOTE: Running task 2600 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230929.bb:do_unpack)
NOTE: recipe gzip-1.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2601 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.8.0.bb:do_patch)
NOTE: recipe libtirpc-1.3.3-r0: task do_package_setscene: Started
NOTE: Running task 2602 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_unpack)
NOTE: Running task 2606 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_collect_spdx_deps)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe gzip-1.13-r0: task do_unpack: Started
NOTE: recipe cpio-2.14-r0: task do_unpack: Started
NOTE: recipe gawk-5.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdb-13.2-r0: task do_fetch: Started
NOTE: recipe gawk-5.2.2-r0: task do_unpack: Started
NOTE: Running task 2608 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_collect_spdx_deps)
NOTE: recipe tcl-8.6.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_unpack: Started
NOTE: recipe cronie-1.6.1-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe net-tools-2.10-r0: task do_fetch: Succeeded
NOTE: recipe gdb-13.2-r0: task do_fetch: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_fetch: Succeeded
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_unpack: Started
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Started
NOTE: Running task 2617 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.2.bb:do_unpack)
NOTE: recipe coreutils-9.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2618 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_unpack)
NOTE: Running task 2619 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_unpack)
NOTE: Running task 2620 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2621 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.4.bb:do_create_spdx)
NOTE: recipe iptables-1.8.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe libaio-0.3.113-r0: task do_unpack: Started
NOTE: recipe tcl-8.6.13-r0: task do_unpack: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_unpack: Succeeded
NOTE: Running task 2622 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_patch)
NOTE: Running task 2623 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_collect_spdx_deps)
NOTE: recipe gzip-1.13-r0: task do_unpack: Succeeded
NOTE: recipe ltp-20230929-r0: task do_unpack: Started
NOTE: recipe libcheck-0.15.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libnl-1_3.8.0-r0: task do_patch: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_unpack: Started
NOTE: Running task 2624 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_patch)
NOTE: recipe cpio-2.14-r0: task do_unpack: Succeeded
NOTE: Running task 2625 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.13.bb:do_patch)
NOTE: recipe logrotate-3.21.0-r0: task do_unpack: Succeeded
NOTE: Running task 2626 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_patch)
NOTE: recipe quota-4.09-r0: task do_unpack: Started
NOTE: Running task 2627 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_patch)
NOTE: recipe iptables-1.8.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2636 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_collect_spdx_deps)
NOTE: recipe liberror-perl-0.17029-r0: task do_unpack: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_unpack: Started
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2637 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_patch)
NOTE: Running task 2638 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_create_spdx)
NOTE: recipe libmnl-1.0.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe net-tools-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe quota-4.09-r0: task do_unpack: Succeeded
NOTE: Running task 2639 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_collect_spdx_deps)
NOTE: recipe liburcu-0.14.0-r0: task do_unpack: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2640 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_patch)
NOTE: Running task 2641 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_patch)
NOTE: Running task 2642 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_collect_spdx_deps)
NOTE: recipe gdb-13.2-r0: task do_unpack: Started
NOTE: recipe cronie-1.6.1-r0: task do_unpack: Started
NOTE: Running task 2645 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.13.bb:do_collect_spdx_deps)
NOTE: recipe coreutils-9.4-r0: task do_create_spdx: Started
NOTE: recipe libnl-1_3.8.0-r0: task do_patch: Succeeded
NOTE: Running task 2646 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_collect_spdx_deps)
NOTE: recipe libaio-0.3.113-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_patch: Started
NOTE: recipe liburcu-0.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_collect_spdx_deps: Started
NOTE: recipe logrotate-3.21.0-r0: task do_patch: Started
NOTE: Running task 2647 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.8.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2648 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_collect_spdx_deps)
NOTE: recipe gawk-5.2.2-r0: task do_unpack: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_unpack: Succeeded
NOTE: recipe gzip-1.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe which-2.21-r0: task do_collect_spdx_deps: Started
NOTE: recipe gzip-1.13-r0: task do_patch: Started
NOTE: recipe iptables-1.8.9-r0: task do_create_spdx: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_package_setscene: Succeeded
NOTE: Running task 2649 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_patch)
NOTE: recipe liberror-perl-0.17029-r0: task do_patch: Started
NOTE: recipe cpio-2.14-r0: task do_patch: Started
NOTE: recipe coreutils-9.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2650 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_patch)
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_patch: Started
NOTE: recipe logrotate-3.21.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 1110 of 1110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_recipe_qa_setscene)
NOTE: Running task 2651 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_deploy_source_date_epoch)
NOTE: recipe quota-4.09-r0: task do_patch: Started
NOTE: recipe gawk-5.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2652 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2653 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2654 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_create_spdx)
NOTE: recipe liburcu-0.14.0-r0: task do_patch: Started
NOTE: recipe tcl-8.6.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2655 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_collect_spdx_deps)
NOTE: recipe liburcu-0.14.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gzip-1.13-r0: task do_collect_spdx_deps: Started
NOTE: recipe unzip-1_6.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_collect_spdx_deps: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 10a3d096213e68b46dda39376084094e6d9882114e0faf328ef664c8af422828
NOTE: recipe gzip-1.13-r0: task do_patch: Succeeded
NOTE: recipe which-2.21-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe liburcu-0.14.0-r0: task do_patch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2668 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_populate_sysroot)
NOTE: recipe gawk-5.2.2-r0: task do_patch: Started
NOTE: Running task 2669 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 2670 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2671 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnl-1_3.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2672 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_create_spdx)
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe liburcu-0.14.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gzip-1.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cronie-1.6.1-r0: task do_patch: Started
NOTE: Running task 2673 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_create_spdx)
NOTE: recipe logrotate-3.21.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libaio-0.3.113-r0: task do_unpack: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_create_spdx: Started
NOTE: recipe gawk-5.2.2-r0: task do_patch: Succeeded
NOTE: Running task 2674 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_unpack: Succeeded
NOTE: recipe cpio-2.14-r0: task do_patch: Succeeded
NOTE: recipe quota-4.09-r0: task do_patch: Succeeded
NOTE: Running task 2675 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_patch)
NOTE: Running task 2676 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 2677 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb:do_patch)
NOTE: Running task 2678 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_deploy_source_date_epoch)
NOTE: recipe findutils-4.9.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2679 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_collect_spdx_deps)
NOTE: recipe bc-1.07.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2682 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_create_spdx)
NOTE: Running task 2683 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_create_spdx)
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe net-tools-2.10-r0: task do_unpack: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_populate_sysroot: Started
NOTE: Running task 2722 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata)
NOTE: recipe liburcu-0.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libaio-0.3.113-r0: task do_patch: Started
NOTE: recipe gawk-5.2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gzip-1.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cronie-1.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe unzip-1_6.0-r0: task do_create_spdx: Started
NOTE: recipe gawk-5.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2747 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_patch)
NOTE: Running task 2748 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe liberror-perl-0.17029-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe which-2.21-r0: task do_create_spdx: Started
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_patch: Started
NOTE: recipe quota-4.09-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cpio-2.14-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2763 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_collect_spdx_deps)
NOTE: recipe liberror-perl-0.17029-r0: task do_patch: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_patch: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2764 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_deploy_source_date_epoch)
NOTE: Running task 2765 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2768 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm)
NOTE: recipe tcl-8.6.13-r0: task do_patch: Succeeded
NOTE: recipe libnl-1_3.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_create_spdx: Started
NOTE: Running task 2769 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 2770 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm)
NOTE: Running task 2771 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_package_write_rpm)
NOTE: recipe logrotate-3.21.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_create_spdx: Started
NOTE: recipe libaio-0.3.113-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2775 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_configure)
NOTE: recipe net-tools-2.10-r0: task do_patch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata: Started
NOTE: recipe logrotate-3.21.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2776 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_configure)
NOTE: recipe net-tools-2.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe libmnl-1.0.5-r0: task do_create_spdx: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cronie-1.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe which-2.21-r0: task do_package_write_rpm: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libaio-0.3.113-r0: task do_patch: Succeeded
NOTE: Running task 2777 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_configure)
NOTE: recipe liburcu-0.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_patch: Succeeded
NOTE: Running task 2778 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_deploy_source_date_epoch)
NOTE: recipe unzip-1_6.0-r0: task do_package_write_rpm: Started
NOTE: recipe tcl-8.6.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Started
NOTE: Running task 2779 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_configure)
NOTE: Running task 2780 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_deploy_source_date_epoch)
NOTE: recipe cpio-2.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe file-5.45-r0: task do_package_write_rpm: Started
NOTE: recipe gzip-1.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe quota-4.09-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2781 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.13.bb:do_configure)
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_patch: Succeeded
NOTE: Running task 2782 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb:do_deploy_source_date_epoch)
NOTE: recipe expect-5.45.4-r0: task do_patch: Succeeded
NOTE: Running task 2783 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_deploy_source_date_epoch)
NOTE: recipe which-2.21-r0: task do_create_spdx: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_configure: Started
NOTE: recipe gawk-5.2.2-r0: task do_configure: Started
NOTE: recipe net-tools-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libaio-0.3.113-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liburcu-0.14.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_create_spdx: Succeeded
NOTE: recipe gzip-1.13-r0: task do_configure: Started
NOTE: Running task 2784 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2786 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata)
NOTE: recipe expect-5.45.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tcl-8.6.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2789 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2790 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_configure)
NOTE: recipe liberror-perl-0.17029-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2791 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_configure)
NOTE: recipe cronie-1.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ltp-20230929-r0: task do_unpack: Succeeded
NOTE: Running task 2792 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230929.bb:do_patch)
NOTE: Running task 2793 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_configure)
NOTE: recipe bc-1.07.1-r0: task do_create_spdx: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2794 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_configure)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe libaio-0.3.113-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2795 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_configure)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata: Started
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_configure: Started
NOTE: recipe expect-5.45.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_configure: Started
NOTE: recipe ltp-20230929-r0: task do_patch: Started
NOTE: recipe cpio-2.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cronie-1.6.1-r0: task do_configure: Started
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2796 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure)
NOTE: recipe libaio-0.3.113-r0: task do_configure: Started
NOTE: recipe net-tools-2.10-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 41de79a8e5aa4adff5c84d9689e46f868ca74cfd324d8705ad647ed0c045a6a1
NOTE: recipe libaio-0.3.113-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2797 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_compile)
NOTE: recipe net-tools-2.10-r0: task do_configure: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2800 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: Running task 2820 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_compile)
NOTE: Running task 2827 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_collect_spdx_deps)
NOTE: Running task 2830 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.1.bb:do_packagedata)
NOTE: Running task 2832 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.4.bb:do_package_write_rpm)
NOTE: recipe mdadm-4.2-r0: task do_configure: Started
NOTE: Running task 2834 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_package_write_rpm)
NOTE: recipe libaio-0.3.113-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: recipe cpio-2.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ltp-20230929-r0: task do_patch: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_compile: Started
NOTE: recipe which-2.21-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2835 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_configure)
NOTE: Running task 2836 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230929.bb:do_deploy_source_date_epoch)
NOTE: Running task 2837 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.5.0.bb:do_package_write_rpm)
NOTE: Running task 2838 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_package_write_rpm)
NOTE: recipe tcp-wrappers-7.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe btrfs-tools-6.5.1-r0: task do_packagedata: Started
NOTE: Running task 2839 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm)
NOTE: Running task 2842 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.4.0.bb:do_package_write_rpm)
NOTE: Running task 2844 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230929.bb:do_populate_lic)
NOTE: recipe procps-4.0.4-r0: task do_package_write_rpm: Started
NOTE: recipe findutils-4.9.0-r0: task do_create_spdx: Succeeded
NOTE: recipe ltp-20230929-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cpio-2.14-r0: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_configure: Succeeded
NOTE: Running task 2845 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_create_spdx)
NOTE: Running task 2846 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_configure_ptest_base)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_package_write_rpm: Started
NOTE: recipe ltp-20230929-r0: task do_populate_lic: Started
NOTE: recipe libaio-0.3.113-r0: task do_compile: Succeeded
NOTE: recipe iproute2-6.5.0-r0: task do_package_write_rpm: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Started
NOTE: recipe findutils-4.9.0-r0: task do_package_write_rpm: Started
NOTE: Running task 2847 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_install)
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: Running task 2854 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.4.bb:do_collect_spdx_deps)
NOTE: recipe tcp-wrappers-7.6-r0: task do_create_spdx: Started
NOTE: recipe btrfs-tools-6.5.1-r0: task do_packagedata: Succeeded
NOTE: recipe curl-8.4.0-r0: task do_package_write_rpm: Started
NOTE: Running task 2855 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_collect_spdx_deps)
NOTE: recipe liberror-perl-0.17029-r0: task do_configure_ptest_base: Started
NOTE: recipe ltp-20230929-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2856 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_collect_spdx_deps)
NOTE: recipe ltp-20230929-r0: task do_populate_lic: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_install: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2857 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_compile)
NOTE: recipe unzip-1_6.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe cpio-2.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe cronie-1.6.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_compile: Started
NOTE: recipe cpio-2.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_install: Succeeded
NOTE: Running task 2858 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package)
NOTE: Running task 2859 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_populate_sysroot)
NOTE: recipe procps-4.0.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2860 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.4.bb:do_create_spdx)
NOTE: recipe iptables-1.8.9-r0: task do_create_spdx: Succeeded
NOTE: Running task 2861 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.5.0.bb:do_collect_spdx_deps)
NOTE: recipe libaio-0.3.113-r0: task do_package: Started
NOTE: recipe libaio-0.3.113-r0: task do_populate_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_create_spdx: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_configure: Succeeded
NOTE: Running task 2862 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure_ptest_base)
NOTE: recipe liberror-perl-0.17029-r0: task do_compile: Succeeded
NOTE: Running task 2863 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_compile_ptest_base)
NOTE: recipe procps-4.0.4-r0: task do_create_spdx: Started
NOTE: recipe iproute2-6.5.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Started
NOTE: recipe gdb-13.2-r0: task do_unpack: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_compile_ptest_base: Started
NOTE: Running task 2864 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.2.bb:do_patch)
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2865 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile)
NOTE: recipe liberror-perl-0.17029-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2866 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install)
NOTE: recipe iproute2-6.5.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2867 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.5.0.bb:do_create_spdx)
NOTE: recipe gdb-13.2-r0: task do_patch: Started
NOTE: recipe libaio-0.3.113-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2868 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230929.bb:do_prepare_recipe_sysroot)
NOTE: recipe mdadm-4.2-r0: task do_compile: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_install: Started
NOTE: recipe iproute2-6.5.0-r0: task do_create_spdx: Started
NOTE: recipe ltp-20230929-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ltp-20230929-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2869 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230929.bb:do_configure)
NOTE: recipe ltp-20230929-r0: task do_configure: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_install: Succeeded
NOTE: Running task 2870 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install_ptest_base)
NOTE: recipe procps-4.0.4-r0: task do_create_spdx: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_install_ptest_base: Started
NOTE: recipe gdb-13.2-r0: task do_patch: Succeeded
NOTE: Running task 2871 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.2.bb:do_deploy_source_date_epoch)
NOTE: recipe liberror-perl-0.17029-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2872 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install_ptest_perl)
NOTE: recipe gdb-13.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_install_ptest_perl: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_install_ptest_perl: Succeeded
NOTE: recipe gdb-13.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2873 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package)
NOTE: recipe iproute2-6.5.0-r0: task do_create_spdx: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package: Started
NOTE: recipe libaio-0.3.113-r0: task do_package: Succeeded
NOTE: Running task 2874 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_packagedata)
NOTE: recipe procps-4.0.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_packagedata: Started
NOTE: recipe libaio-0.3.113-r0: task do_packagedata: Succeeded
NOTE: Running task 2875 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_create_spdx)
NOTE: Running task 2876 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package_write_rpm)
NOTE: recipe libaio-0.3.113-r0: task do_create_spdx: Started
NOTE: recipe libaio-0.3.113-r0: task do_package_write_rpm: Started
NOTE: recipe libaio-0.3.113-r0: task do_create_spdx: Succeeded
NOTE: Running task 2877 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230929.bb:do_collect_spdx_deps)
NOTE: recipe ltp-20230929-r0: task do_collect_spdx_deps: Started
NOTE: recipe ltp-20230929-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe file-5.45-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_package_write_rpm: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2878 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_configure: Succeeded
NOTE: Running task 2879 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_configure_ptest_base)
NOTE: recipe logrotate-3.21.0-r0: task do_configure_ptest_base: Started
NOTE: recipe logrotate-3.21.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2880 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_compile)
NOTE: recipe logrotate-3.21.0-r0: task do_compile: Started
NOTE: recipe iproute2-6.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_compile: Succeeded
NOTE: Running task 2881 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Started
NOTE: recipe logrotate-3.21.0-r0: task do_compile: Succeeded
NOTE: Running task 2882 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_compile_ptest_base)
NOTE: recipe logrotate-3.21.0-r0: task do_compile_ptest_base: Started
NOTE: recipe logrotate-3.21.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2883 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_install)
NOTE: recipe logrotate-3.21.0-r0: task do_install: Started
NOTE: recipe cronie-1.6.1-r0: task do_configure: Succeeded
NOTE: Running task 2884 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_compile)
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2885 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install)
NOTE: recipe cronie-1.6.1-r0: task do_compile: Started
NOTE: recipe mdadm-4.2-r0: task do_install: Started
NOTE: recipe logrotate-3.21.0-r0: task do_install: Succeeded
NOTE: Running task 2886 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_install_ptest_base)
NOTE: recipe logrotate-3.21.0-r0: task do_install_ptest_base: Started
NOTE: recipe cronie-1.6.1-r0: task do_compile: Succeeded
NOTE: Running task 2887 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_install)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_package_write_rpm unihash changed to 2cf7f1a032dc3919561bb9fc521b9710b2dcc5e46ae1fec5294e4dbbc9627b6a
NOTE: recipe cronie-1.6.1-r0: task do_install: Started
NOTE: recipe logrotate-3.21.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2888 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_package)
NOTE: recipe logrotate-3.21.0-r0: task do_package: Started
NOTE: recipe mdadm-4.2-r0: task do_install: Succeeded
NOTE: Running task 2889 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install_ptest_base)
NOTE: recipe net-tools-2.10-r0: task do_compile: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_install: Succeeded
NOTE: Running task 2890 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_install)
NOTE: Running task 2891 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_package)
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Started
NOTE: recipe net-tools-2.10-r0: task do_install: Started
NOTE: recipe cronie-1.6.1-r0: task do_package: Started
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2892 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_package)
NOTE: recipe mdadm-4.2-r0: task do_package: Started
NOTE: recipe coreutils-9.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 2893 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_collect_spdx_deps)
NOTE: recipe logrotate-3.21.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe tcl-8.6.13-r0: task do_configure: Succeeded
NOTE: Running task 2894 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_configure_ptest_base)
NOTE: recipe logrotate-3.21.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_install: Succeeded
NOTE: Running task 2895 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_package)
NOTE: recipe tcl-8.6.13-r0: task do_configure_ptest_base: Started
NOTE: recipe tcl-8.6.13-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2896 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_compile)
NOTE: recipe net-tools-2.10-r0: task do_package: Started
NOTE: recipe tcl-8.6.13-r0: task do_compile: Started
NOTE: recipe cronie-1.6.1-r0: task do_package: Succeeded
NOTE: Running task 2897 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_packagedata)
NOTE: recipe cronie-1.6.1-r0: task do_packagedata: Started
NOTE: recipe cronie-1.6.1-r0: task do_packagedata: Failed
NOTE: recipe net-tools-2.10-r0: task do_package: Succeeded
NOTE: recipe curl-8.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_package: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_package: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Succeeded
NOTE: recipe liburcu-0.14.0-r0: task do_configure: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_compile: Succeeded
NOTE: recipe gzip-1.13-r0: task do_configure: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_configure: Succeeded
NOTE: recipe ltp-20230929-r0: task do_configure: Succeeded
NOTE: recipe cpio-2.14-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2897 tasks of which 2699 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_packagedata
Summary: There were 32 ERROR messages, returning a non-zero exit code.
ERROR: btrfs-tools-6.5.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-src went backwards which would break package feeds (from 0:6.5.2-r0 to 0:6.5.1-r0) [version-going-backwards]
ERROR: btrfs-tools-6.5.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-dbg went backwards which would break package feeds (from 0:6.5.2-r0 to 0:6.5.1-r0) [version-going-backwards]
ERROR: btrfs-tools-6.5.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-staticdev went backwards which would break package feeds (from 0:6.5.2-r0 to 0:6.5.1-r0) [version-going-backwards]
ERROR: btrfs-tools-6.5.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-dev went backwards which would break package feeds (from 0:6.5.2-r0 to 0:6.5.1-r0) [version-going-backwards]
ERROR: btrfs-tools-6.5.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-doc went backwards which would break package feeds (from 0:6.5.2-r0 to 0:6.5.1-r0) [version-going-backwards]
ERROR: btrfs-tools-6.5.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-locale went backwards which would break package feeds (from 0:6.5.2-r0 to 0:6.5.1-r0) [version-going-backwards]
ERROR: btrfs-tools-6.5.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools went backwards which would break package feeds (from 0:6.5.2-r0 to 0:6.5.1-r0) [version-going-backwards]
ERROR: btrfs-tools-6.5.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: libnsl2-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package libnsl2-src went backwards which would break package feeds (from 0:2.0.1-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: libnsl2-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package libnsl2-dbg went backwards which would break package feeds (from 0:2.0.1-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: libnsl2-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package libnsl2-staticdev went backwards which would break package feeds (from 0:2.0.1-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: libnsl2-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package libnsl2-dev went backwards which would break package feeds (from 0:2.0.1-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: libnsl2-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package libnsl2-doc went backwards which would break package feeds (from 0:2.0.1-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: libnsl2-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package libnsl2-locale went backwards which would break package feeds (from 0:2.0.1-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: libnsl2-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package libnsl2 went backwards which would break package feeds (from 0:2.0.1-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: libnsl2-2.0.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: libtirpc-1.3.3-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-src went backwards which would break package feeds (from 0:1.3.4-r0 to 0:1.3.3-r0) [version-going-backwards]
ERROR: libtirpc-1.3.3-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-dbg went backwards which would break package feeds (from 0:1.3.4-r0 to 0:1.3.3-r0) [version-going-backwards]
ERROR: libtirpc-1.3.3-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-staticdev went backwards which would break package feeds (from 0:1.3.4-r0 to 0:1.3.3-r0) [version-going-backwards]
ERROR: libtirpc-1.3.3-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-dev went backwards which would break package feeds (from 0:1.3.4-r0 to 0:1.3.3-r0) [version-going-backwards]
ERROR: libtirpc-1.3.3-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-doc went backwards which would break package feeds (from 0:1.3.4-r0 to 0:1.3.3-r0) [version-going-backwards]
ERROR: libtirpc-1.3.3-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-locale went backwards which would break package feeds (from 0:1.3.4-r0 to 0:1.3.3-r0) [version-going-backwards]
ERROR: libtirpc-1.3.3-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc went backwards which would break package feeds (from 0:1.3.4-r0 to 0:1.3.3-r0) [version-going-backwards]
ERROR: libtirpc-1.3.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: cronie-1.6.1-r0 do_packagedata: QA Issue: Package version for package cronie-src went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1-r0) [version-going-backwards]
ERROR: cronie-1.6.1-r0 do_packagedata: QA Issue: Package version for package cronie-dbg went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1-r0) [version-going-backwards]
ERROR: cronie-1.6.1-r0 do_packagedata: QA Issue: Package version for package cronie-staticdev went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1-r0) [version-going-backwards]
ERROR: cronie-1.6.1-r0 do_packagedata: QA Issue: Package version for package cronie-dev went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1-r0) [version-going-backwards]
ERROR: cronie-1.6.1-r0 do_packagedata: QA Issue: Package version for package cronie-doc went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1-r0) [version-going-backwards]
ERROR: cronie-1.6.1-r0 do_packagedata: QA Issue: Package version for package cronie-locale went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1-r0) [version-going-backwards]
ERROR: cronie-1.6.1-r0 do_packagedata: QA Issue: Package version for package cronie went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1-r0) [version-going-backwards]
ERROR: cronie-1.6.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cronie/1.6.1/temp/log.do_packagedata.1874394
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_packagedata) failed with exit code '1'

--===============6813722452170179648==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (0 cached, 912 parsed). 1845 targets, 65 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-564a8cef8aee3d8209967e69579552abdfae791a"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:564a8cef8aee3d8209967e69579552abdfae791a"
workspace            = "master:988dc0dea4398e77a7d7862d4655a9b1f5eaa06d"

Initialising tasks...done.
Sstate summary: Wanted 197 Local 74 Mirrors 0 Missed 123 Current 889 (37% match, 88% complete)
Removing 3 stale sstate objects for arch mips32r2...done.
Removing 5 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 895 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 899 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 920 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 991 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1000 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1035 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_spdx_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe btrfs-tools-6.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-1_254.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1066 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 1067 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_create_spdx_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/btrfs-tools/6.5.1/temp/log.do_packagedata_setscene.1967558
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1069 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.1.bb:do_package_setscene)
NOTE: recipe glibc-2.38+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-1_254.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_create_spdx_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/libnsl2/2.0.0/temp/log.do_packagedata_setscene.1967892
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1074 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_setscene)
NOTE: Running setscene task 1076 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1419 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_recipe_qa)
NOTE: Running task 1618 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libnsl2-2.0.0-r0: task do_package_setscene: Started
NOTE: Running task 1651 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_recipe_qa)
NOTE: recipe btrfs-tools-6.5.1-r0: task do_package_setscene: Started
NOTE: Running task 1675 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.8.0.bb:do_recipe_qa)
NOTE: recipe tcl-8.6.13-r0: task do_recipe_qa: Started
NOTE: Running task 1837 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_recipe_qa)
NOTE: Running task 1888 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_recipe_qa)
NOTE: Running task 1889 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.13.bb:do_recipe_qa)
NOTE: Running task 1890 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_recipe_qa)
NOTE: Running task 1892 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_recipe_qa)
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libnl-1_3.8.0-r0: task do_recipe_qa: Started
NOTE: Running task 1967 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_recipe_qa)
NOTE: recipe tcl-8.6.13-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2018 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_fetch)
NOTE: Running task 2036 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.4.bb:do_populate_sysroot)
NOTE: Running task 2043 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_recipe_qa)
NOTE: Running task 2056 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230929.bb:do_recipe_qa)
NOTE: recipe gawk-5.2.2-r0: task do_recipe_qa: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_package_setscene: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_recipe_qa: Started
NOTE: recipe gzip-1.13-r0: task do_recipe_qa: Started
NOTE: recipe logrotate-3.21.0-r0: task do_recipe_qa: Started
NOTE: Running setscene task 1079 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1080 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1081 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_recipe_qa: Started
NOTE: Running task 2100 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_fetch)
NOTE: recipe libnl-1_3.8.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe cpio-2.14-r0: task do_recipe_qa: Started
NOTE: Running task 2122 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.8.0.bb:do_fetch)
NOTE: Running task 2133 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_recipe_qa)
NOTE: Running task 2134 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.2.bb:do_recipe_qa)
NOTE: Running task 2135 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_recipe_qa)
NOTE: Running task 2136 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_recipe_qa)
NOTE: recipe tcl-8.6.13-r0: task do_fetch: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_recipe_qa: Started
NOTE: recipe ltp-20230929-r0: task do_recipe_qa: Started
NOTE: recipe tcl-8.6.13-r0: task do_fetch: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_populate_sysroot: Started
NOTE: Running task 2199 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_unpack)
NOTE: Running task 2200 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe gawk-5.2.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2220 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_fetch)
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expect-5.45.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2253 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_fetch)
NOTE: Running task 2260 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_fetch)
NOTE: recipe gzip-1.13-r0: task do_recipe_qa: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Started
NOTE: recipe libaio-0.3.113-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2291 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_fetch)
NOTE: Running task 2301 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.13.bb:do_fetch)
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Succeeded
NOTE: recipe libnl-1_3.8.0-r0: task do_fetch: Started
NOTE: recipe quota-4.09-r0: task do_recipe_qa: Started
NOTE: Running task 2347 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_unpack)
NOTE: Running task 2348 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe net-tools-2.10-r0: task do_recipe_qa: Started
NOTE: recipe cpio-2.14-r0: task do_recipe_qa: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_recipe_qa: Started
NOTE: recipe gdb-13.2-r0: task do_recipe_qa: Started
NOTE: Running task 2371 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_fetch)
NOTE: recipe libnl-1_3.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 2385 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.8.0.bb:do_unpack)
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_recipe_qa: Succeeded
NOTE: recipe ltp-20230929-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2414 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_fetch)
NOTE: Running task 2415 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230929.bb:do_fetch)
NOTE: recipe tcl-8.6.13-r0: task do_unpack: Started
NOTE: recipe tcl-8.6.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gawk-5.2.2-r0: task do_fetch: Started
NOTE: recipe libaio-0.3.113-r0: task do_fetch: Started
NOTE: recipe expect-5.45.4-r0: task do_fetch: Started
NOTE: Running task 2492 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.4.bb:do_collect_spdx_deps)
NOTE: recipe logrotate-3.21.0-r0: task do_fetch: Started
NOTE: recipe gawk-5.2.2-r0: task do_fetch: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/libtirpc/1.3.3/temp/log.do_packagedata_setscene.1968607
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1082 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_package_setscene)
NOTE: Running task 2493 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_unpack)
NOTE: recipe logrotate-3.21.0-r0: task do_fetch: Succeeded
NOTE: recipe gzip-1.13-r0: task do_fetch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Started
NOTE: recipe btrfs-tools-6.5.1-r0: task do_package_setscene: Succeeded
NOTE: Running task 2494 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_unpack)
NOTE: recipe quota-4.09-r0: task do_recipe_qa: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2495 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running setscene task 1084 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.1.bb:do_recipe_qa_setscene)
NOTE: Running task 2496 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_fetch)
NOTE: recipe net-tools-2.10-r0: task do_recipe_qa: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_fetch: Succeeded
NOTE: recipe gzip-1.13-r0: task do_fetch: Succeeded
NOTE: recipe cpio-2.14-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 2501 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_fetch)
NOTE: recipe cronie-1.6.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2502 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_unpack)
NOTE: Running task 2507 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.13.bb:do_unpack)
NOTE: Running task 2508 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnl-1_3.8.0-r0: task do_unpack: Started
NOTE: Running task 2509 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_fetch)
NOTE: Running task 2518 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2519 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libaio-0.3.113-r0: task do_fetch: Succeeded
NOTE: recipe ltp-20230929-r0: task do_fetch: Started
NOTE: recipe gdb-13.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_fetch: Started
NOTE: Running task 2522 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_unpack)
NOTE: Running task 2523 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2532 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.2.bb:do_fetch)
NOTE: recipe cpio-2.14-r0: task do_fetch: Succeeded
NOTE: Running task 2546 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_unpack)
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_fetch: Succeeded
NOTE: Running task 2561 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_patch)
NOTE: Running task 2562 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_unpack)
NOTE: Running task 2563 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2564 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_collect_spdx_deps)
NOTE: Running task 2571 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_collect_spdx_deps)
NOTE: recipe libnl-1_3.8.0-r0: task do_unpack: Succeeded
NOTE: recipe ltp-20230929-r0: task do_fetch: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_unpack: Started
NOTE: Running task 2572 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.8.0.bb:do_patch)
NOTE: Running task 2573 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_collect_spdx_deps)
NOTE: recipe coreutils-9.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe net-tools-2.10-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_package_setscene: Started
NOTE: Running task 2574 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230929.bb:do_unpack)
NOTE: recipe logrotate-3.21.0-r0: task do_unpack: Started
NOTE: recipe gawk-5.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe quota-4.09-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe gzip-1.13-r0: task do_unpack: Started
NOTE: recipe expect-5.45.4-r0: task do_unpack: Started
NOTE: Running task 2591 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_collect_spdx_deps)
NOTE: recipe libaio-0.3.113-r0: task do_unpack: Started
NOTE: recipe libaio-0.3.113-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cronie-1.6.1-r0: task do_fetch: Started
NOTE: recipe btrfs-tools-6.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 2593 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_collect_spdx_deps)
NOTE: recipe gzip-1.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe quota-4.09-r0: task do_fetch: Succeeded
NOTE: recipe gdb-13.2-r0: task do_fetch: Started
NOTE: Running task 2594 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_unpack)
NOTE: Running task 2595 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_collect_spdx_deps)
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: Running task 2596 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_collect_spdx_deps)
NOTE: recipe cronie-1.6.1-r0: task do_fetch: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe net-tools-2.10-r0: task do_fetch: Succeeded
NOTE: recipe cpio-2.14-r0: task do_unpack: Started
NOTE: recipe coreutils-9.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gdb-13.2-r0: task do_fetch: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_unpack: Succeeded
NOTE: Running task 2597 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.2.bb:do_unpack)
NOTE: Running task 2598 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_unpack)
NOTE: Running task 2599 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_unpack)
NOTE: Running task 2600 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe tcl-8.6.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2601 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_patch)
NOTE: Running task 2602 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.4.bb:do_create_spdx)
NOTE: recipe btrfs-tools-6.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gzip-1.13-r0: task do_unpack: Succeeded
NOTE: recipe libnl-1_3.8.0-r0: task do_patch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_unpack: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2603 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.13.bb:do_patch)
NOTE: recipe liberror-perl-0.17029-r0: task do_unpack: Started
NOTE: recipe logrotate-3.21.0-r0: task do_unpack: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2604 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_patch)
NOTE: Running task 2605 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_patch)
NOTE: Running task 2611 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_collect_spdx_deps)
NOTE: recipe ltp-20230929-r0: task do_unpack: Started
NOTE: Running task 2612 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.13.bb:do_collect_spdx_deps)
NOTE: recipe liberror-perl-0.17029-r0: task do_unpack: Succeeded
NOTE: recipe which-2.21-r0: task do_collect_spdx_deps: Started
NOTE: recipe quota-4.09-r0: task do_unpack: Started
NOTE: recipe unzip-1_6.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe cpio-2.14-r0: task do_unpack: Succeeded
NOTE: Running task 2613 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_patch)
NOTE: Running task 2624 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_package_write_rpm)
NOTE: recipe libaio-0.3.113-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libmnl-1.0.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2625 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_patch)
NOTE: recipe bc-1.07.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libcheck-0.15.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2626 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_create_spdx)
NOTE: recipe net-tools-2.10-r0: task do_unpack: Started
NOTE: recipe quota-4.09-r0: task do_unpack: Succeeded
NOTE: recipe gdb-13.2-r0: task do_unpack: Started
NOTE: Running task 2627 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_create_spdx)
NOTE: recipe libnl-1_3.8.0-r0: task do_patch: Succeeded
NOTE: Running task 2628 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.8.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2629 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_patch)
NOTE: Running task 2632 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm)
NOTE: recipe gawk-5.2.2-r0: task do_unpack: Succeeded
NOTE: recipe which-2.21-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2633 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm)
NOTE: Running task 2634 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_patch)
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2635 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_collect_spdx_deps)
NOTE: recipe net-tools-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cronie-1.6.1-r0: task do_unpack: Started
NOTE: recipe gzip-1.13-r0: task do_patch: Started
NOTE: recipe expect-5.45.4-r0: task do_patch: Started
NOTE: Running task 2636 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2637 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_create_spdx)
NOTE: recipe coreutils-9.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_patch: Started
NOTE: recipe bc-1.07.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_patch: Started
NOTE: recipe tcl-8.6.13-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2638 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_create_spdx)
NOTE: recipe findutils-4.9.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2639 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe coreutils-9.4-r0: task do_create_spdx: Started
NOTE: recipe cpio-2.14-r0: task do_patch: Started
NOTE: recipe cronie-1.6.1-r0: task do_unpack: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_patch: Started
NOTE: recipe gzip-1.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_package_setscene: Succeeded
NOTE: Running task 2640 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_create_spdx)
NOTE: recipe logrotate-3.21.0-r0: task do_patch: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_create_spdx: Started
NOTE: Running setscene task 1086 of 1086 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_recipe_qa_setscene)
NOTE: Running task 2641 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_deploy_source_date_epoch)
NOTE: recipe quota-4.09-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gzip-1.13-r0: task do_collect_spdx_deps: Started
NOTE: recipe libmnl-1.0.5-r0: task do_create_spdx: Started
NOTE: recipe file-5.45-r0: task do_package_write_rpm: Started
NOTE: Running task 2642 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_patch)
NOTE: Running task 2643 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_create_spdx)
NOTE: recipe libnl-1_3.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 07057cc95e39daad70e97eff764c368302272559801702d46dd8e82b5abfe46e
NOTE: recipe tcl-8.6.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2649 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_populate_sysroot)
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe which-2.21-r0: task do_package_write_rpm: Started
NOTE: Running task 2650 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gawk-5.2.2-r0: task do_patch: Started
NOTE: recipe which-2.21-r0: task do_create_spdx: Started
NOTE: recipe gawk-5.2.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe unzip-1_6.0-r0: task do_package_write_rpm: Started
NOTE: recipe libaio-0.3.113-r0: task do_unpack: Succeeded
NOTE: recipe gzip-1.13-r0: task do_patch: Succeeded
NOTE: recipe gzip-1.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2651 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_patch)
NOTE: Running task 2652 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 2653 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_collect_spdx_deps)
NOTE: recipe unzip-1_6.0-r0: task do_create_spdx: Started
NOTE: recipe gawk-5.2.2-r0: task do_patch: Succeeded
NOTE: Running task 2654 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe liberror-perl-0.17029-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gawk-5.2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe cpio-2.14-r0: task do_patch: Succeeded
NOTE: Running task 2655 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_deploy_source_date_epoch)
NOTE: recipe findutils-4.9.0-r0: task do_create_spdx: Started
NOTE: recipe logrotate-3.21.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_patch: Succeeded
NOTE: Running task 2656 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_deploy_source_date_epoch)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_populate_sysroot: Started
NOTE: recipe bc-1.07.1-r0: task do_create_spdx: Started
NOTE: recipe quota-4.09-r0: task do_patch: Succeeded
NOTE: Running task 2657 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_deploy_source_date_epoch)
NOTE: recipe cronie-1.6.1-r0: task do_patch: Started
NOTE: recipe libaio-0.3.113-r0: task do_collect_spdx_deps: Started
NOTE: recipe libaio-0.3.113-r0: task do_patch: Started
NOTE: recipe cronie-1.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnl-1_3.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gzip-1.13-r0: task do_deploy_source_date_epoch: Started
NOTE: Setscene tasks completed
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cpio-2.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gawk-5.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libaio-0.3.113-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2696 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata)
NOTE: recipe net-tools-2.10-r0: task do_unpack: Succeeded
NOTE: recipe quota-4.09-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2709 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_configure)
NOTE: Running task 2722 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_patch)
NOTE: Running task 2723 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2730 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmnl-1.0.5-r0: task do_create_spdx: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_patch: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tcl-8.6.13-r0: task do_patch: Succeeded
NOTE: Running task 2735 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 2736 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe logrotate-3.21.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2741 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_collect_spdx_deps)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata: Started
NOTE: recipe logrotate-3.21.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2742 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_configure)
NOTE: recipe net-tools-2.10-r0: task do_patch: Started
NOTE: recipe which-2.21-r0: task do_create_spdx: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_patch: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Started
NOTE: Running task 2743 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_deploy_source_date_epoch)
NOTE: recipe gawk-5.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gzip-1.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cpio-2.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2744 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_configure)
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2745 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.13.bb:do_configure)
NOTE: recipe expect-5.45.4-r0: task do_patch: Succeeded
NOTE: recipe gdb-13.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2746 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_deploy_source_date_epoch)
NOTE: recipe quota-4.09-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cronie-1.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bc-1.07.1-r0: task do_create_spdx: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_patch: Succeeded
NOTE: Running task 2747 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_deploy_source_date_epoch)
NOTE: recipe liberror-perl-0.17029-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2748 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_configure)
NOTE: recipe net-tools-2.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe libaio-0.3.113-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe unzip-1_6.0-r0: task do_create_spdx: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_configure: Started
NOTE: recipe cronie-1.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2749 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe net-tools-2.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_configure: Started
NOTE: recipe gzip-1.13-r0: task do_configure: Started
NOTE: recipe expect-5.45.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe net-tools-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2751 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata)
NOTE: recipe tcl-8.6.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2752 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: Running task 2753 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_configure)
NOTE: recipe cronie-1.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_configure: Started
NOTE: Running task 2756 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_configure)
NOTE: recipe libaio-0.3.113-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2757 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_configure)
NOTE: recipe ltp-20230929-r0: task do_unpack: Succeeded
NOTE: Running task 2758 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230929.bb:do_patch)
NOTE: recipe cpio-2.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expect-5.45.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2759 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure)
NOTE: recipe tcl-8.6.13-r0: task do_configure: Started
NOTE: recipe libaio-0.3.113-r0: task do_configure: Started
NOTE: Running task 2760 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_configure)
NOTE: recipe which-2.21-r0: task do_package_write_rpm: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_configure: Started
NOTE: recipe ltp-20230929-r0: task do_patch: Started
NOTE: recipe libaio-0.3.113-r0: task do_configure: Succeeded
NOTE: Running task 2761 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_compile)
NOTE: recipe gdb-13.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_configure: Started
NOTE: recipe mdadm-4.2-r0: task do_configure: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_configure: Succeeded
NOTE: Running task 2778 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_configure_ptest_base)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Running task 2782 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_collect_spdx_deps)
NOTE: recipe libaio-0.3.113-r0: task do_compile: Started
NOTE: recipe net-tools-2.10-r0: task do_configure: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 92d337ef06d6815edfae603f3065f50a80d7a4e3b16f348bd050c3d4b458d813
NOTE: Setscene tasks completed
NOTE: Running task 2791 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: Running task 2792 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_compile)
NOTE: recipe cpio-2.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2793 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_configure)
NOTE: Running task 2797 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.1.bb:do_packagedata)
NOTE: recipe findutils-4.9.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2799 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.4.0.bb:do_package_write_rpm)
NOTE: Running task 2802 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_package_write_rpm)
NOTE: Running task 2804 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm)
NOTE: recipe ltp-20230929-r0: task do_patch: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_configure_ptest_base: Started
NOTE: Running task 2805 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230929.bb:do_deploy_source_date_epoch)
NOTE: Running task 2806 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.4.bb:do_package_write_rpm)
NOTE: recipe tcp-wrappers-7.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: Running task 2807 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_package_write_rpm)
NOTE: recipe net-tools-2.10-r0: task do_compile: Started
NOTE: recipe unzip-1_6.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2808 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.5.0.bb:do_package_write_rpm)
NOTE: recipe libaio-0.3.113-r0: task do_compile: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe cpio-2.14-r0: task do_configure: Started
NOTE: Running task 2809 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_install)
NOTE: Running task 2810 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_compile)
NOTE: Running task 2811 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230929.bb:do_populate_lic)
NOTE: recipe btrfs-tools-6.5.1-r0: task do_packagedata: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2812 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_create_spdx)
NOTE: recipe ltp-20230929-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe findutils-4.9.0-r0: task do_package_write_rpm: Started
NOTE: recipe ltp-20230929-r0: task do_populate_lic: Started
NOTE: recipe libaio-0.3.113-r0: task do_install: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Started
NOTE: recipe procps-4.0.4-r0: task do_package_write_rpm: Started
NOTE: recipe curl-8.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe iproute2-6.5.0-r0: task do_package_write_rpm: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_create_spdx: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: Running task 2819 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_collect_spdx_deps)
NOTE: Running task 2820 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_collect_spdx_deps)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_package_write_rpm: Started
NOTE: Running task 2821 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.4.bb:do_collect_spdx_deps)
NOTE: recipe ltp-20230929-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe btrfs-tools-6.5.1-r0: task do_packagedata: Succeeded
NOTE: recipe ltp-20230929-r0: task do_populate_lic: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_install: Succeeded
NOTE: recipe cpio-2.14-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2822 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package)
NOTE: Running task 2823 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_populate_sysroot)
NOTE: recipe cronie-1.6.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe procps-4.0.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_compile: Succeeded
NOTE: recipe cpio-2.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2824 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_compile_ptest_base)
NOTE: recipe cronie-1.6.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_populate_sysroot: Started
NOTE: recipe libaio-0.3.113-r0: task do_package: Started
NOTE: recipe mdadm-4.2-r0: task do_configure: Succeeded
NOTE: Running task 2825 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure_ptest_base)
NOTE: recipe iptables-1.8.9-r0: task do_create_spdx: Succeeded
NOTE: Running task 2826 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.5.0.bb:do_collect_spdx_deps)
NOTE: recipe tcp-wrappers-7.6-r0: task do_create_spdx: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gdb-13.2-r0: task do_unpack: Succeeded
NOTE: Running task 2827 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.2.bb:do_patch)
NOTE: Running task 2828 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.2.bb:do_collect_spdx_deps)
NOTE: recipe liberror-perl-0.17029-r0: task do_compile_ptest_base: Started
NOTE: Running task 2829 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.4.bb:do_create_spdx)
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2830 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2831 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile)
NOTE: recipe gdb-13.2-r0: task do_patch: Started
NOTE: recipe iproute2-6.5.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gdb-13.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe procps-4.0.4-r0: task do_create_spdx: Started
NOTE: recipe libaio-0.3.113-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2832 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230929.bb:do_prepare_recipe_sysroot)
NOTE: recipe iproute2-6.5.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_install: Started
NOTE: Running task 2833 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.5.0.bb:do_create_spdx)
NOTE: recipe mdadm-4.2-r0: task do_compile: Started
NOTE: recipe gdb-13.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe ltp-20230929-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iproute2-6.5.0-r0: task do_create_spdx: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ltp-20230929-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2834 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230929.bb:do_configure)
NOTE: recipe liberror-perl-0.17029-r0: task do_install: Succeeded
NOTE: Running task 2835 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install_ptest_base)
NOTE: recipe ltp-20230929-r0: task do_configure: Started
NOTE: recipe gdb-13.2-r0: task do_patch: Succeeded
NOTE: Running task 2836 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.2.bb:do_deploy_source_date_epoch)
NOTE: recipe liberror-perl-0.17029-r0: task do_install_ptest_base: Started
NOTE: recipe gdb-13.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2837 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install_ptest_perl)
NOTE: recipe procps-4.0.4-r0: task do_create_spdx: Succeeded
NOTE: recipe gdb-13.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2838 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.2.bb:do_configure)
NOTE: recipe liberror-perl-0.17029-r0: task do_install_ptest_perl: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_install_ptest_perl: Succeeded
NOTE: Running task 2839 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package)
NOTE: recipe gdb-13.2-r0: task do_configure: Started
NOTE: recipe iproute2-6.5.0-r0: task do_create_spdx: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package: Started
NOTE: recipe libaio-0.3.113-r0: task do_package: Succeeded
NOTE: Running task 2840 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_packagedata)
NOTE: recipe libaio-0.3.113-r0: task do_packagedata: Started
NOTE: recipe procps-4.0.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_packagedata: Succeeded
NOTE: Running task 2841 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_create_spdx)
NOTE: Running task 2842 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package_write_rpm)
NOTE: recipe libaio-0.3.113-r0: task do_create_spdx: Started
NOTE: recipe libaio-0.3.113-r0: task do_package_write_rpm: Started
NOTE: recipe libaio-0.3.113-r0: task do_create_spdx: Succeeded
NOTE: Running task 2843 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230929.bb:do_collect_spdx_deps)
NOTE: recipe file-5.45-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ltp-20230929-r0: task do_collect_spdx_deps: Started
NOTE: recipe ltp-20230929-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_package_write_rpm: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package: Succeeded
NOTE: Running task 2844 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata)
NOTE: recipe findutils-4.9.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata: Started
NOTE: recipe logrotate-3.21.0-r0: task do_configure: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata: Succeeded
NOTE: Running task 2845 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_configure_ptest_base)
NOTE: recipe logrotate-3.21.0-r0: task do_configure_ptest_base: Started
NOTE: recipe gdb-13.2-r0: task do_configure: Succeeded
NOTE: Running task 2846 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.2.bb:do_compile)
NOTE: recipe logrotate-3.21.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2847 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_compile)
NOTE: recipe gdb-13.2-r0: task do_compile: Started
NOTE: recipe logrotate-3.21.0-r0: task do_compile: Started
NOTE: recipe iproute2-6.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_configure: Succeeded
NOTE: Running task 2848 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_compile)
NOTE: recipe logrotate-3.21.0-r0: task do_compile: Succeeded
NOTE: Running task 2849 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_compile_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_compile: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_compile: Started
NOTE: Running task 2850 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile_ptest_base)
NOTE: recipe logrotate-3.21.0-r0: task do_compile_ptest_base: Started
NOTE: recipe logrotate-3.21.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2851 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Started
NOTE: recipe logrotate-3.21.0-r0: task do_install: Started
NOTE: recipe cronie-1.6.1-r0: task do_compile: Succeeded
NOTE: Running task 2852 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_install)
NOTE: recipe cronie-1.6.1-r0: task do_install: Started
NOTE: recipe logrotate-3.21.0-r0: task do_install: Succeeded
NOTE: Running task 2853 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_install_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2854 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install)
NOTE: recipe logrotate-3.21.0-r0: task do_install_ptest_base: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_package_write_rpm unihash changed to 6542427c0ed01aa41610052e12d9de2ba6ff42d93dd00948a7cea6c1cb6b30ea
NOTE: recipe mdadm-4.2-r0: task do_install: Started
NOTE: recipe cronie-1.6.1-r0: task do_install: Succeeded
NOTE: Running task 2855 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_package)
NOTE: recipe logrotate-3.21.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_package: Started
NOTE: Running task 2856 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_package)
NOTE: recipe logrotate-3.21.0-r0: task do_package: Started
NOTE: recipe coreutils-9.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 2857 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_collect_spdx_deps)
NOTE: recipe logrotate-3.21.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe net-tools-2.10-r0: task do_compile: Succeeded
NOTE: Running task 2858 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_install: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_install: Started
NOTE: Running task 2859 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Started
NOTE: recipe tcl-8.6.13-r0: task do_configure: Succeeded
NOTE: Running task 2860 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_configure_ptest_base)
NOTE: recipe tcl-8.6.13-r0: task do_configure_ptest_base: Started
NOTE: recipe tcl-8.6.13-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2861 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_compile)
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_compile: Started
NOTE: Running task 2862 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_package)
NOTE: recipe logrotate-3.21.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_package: Started
NOTE: recipe net-tools-2.10-r0: task do_install: Succeeded
NOTE: Running task 2863 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_package)
NOTE: recipe net-tools-2.10-r0: task do_package: Started
NOTE: recipe cronie-1.6.1-r0: task do_package: Succeeded
NOTE: Running task 2864 of 2964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_packagedata)
NOTE: recipe cronie-1.6.1-r0: task do_packagedata: Started
NOTE: recipe cronie-1.6.1-r0: task do_packagedata: Failed
NOTE: recipe curl-8.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_package: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_package: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_package: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_compile: Succeeded
NOTE: recipe gzip-1.13-r0: task do_configure: Succeeded
NOTE: recipe ltp-20230929-r0: task do_configure: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_configure: Succeeded
NOTE: recipe cpio-2.14-r0: task do_configure: Succeeded
NOTE: recipe gdb-13.2-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2864 tasks of which 2675 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_packagedata
Summary: There were 32 ERROR messages, returning a non-zero exit code.
ERROR: btrfs-tools-6.5.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-src went backwards which would break package feeds (from 0:6.5.2-r0 to 0:6.5.1-r0) [version-going-backwards]
ERROR: btrfs-tools-6.5.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-dbg went backwards which would break package feeds (from 0:6.5.2-r0 to 0:6.5.1-r0) [version-going-backwards]
ERROR: btrfs-tools-6.5.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-staticdev went backwards which would break package feeds (from 0:6.5.2-r0 to 0:6.5.1-r0) [version-going-backwards]
ERROR: btrfs-tools-6.5.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-dev went backwards which would break package feeds (from 0:6.5.2-r0 to 0:6.5.1-r0) [version-going-backwards]
ERROR: btrfs-tools-6.5.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-doc went backwards which would break package feeds (from 0:6.5.2-r0 to 0:6.5.1-r0) [version-going-backwards]
ERROR: btrfs-tools-6.5.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-locale went backwards which would break package feeds (from 0:6.5.2-r0 to 0:6.5.1-r0) [version-going-backwards]
ERROR: btrfs-tools-6.5.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools went backwards which would break package feeds (from 0:6.5.2-r0 to 0:6.5.1-r0) [version-going-backwards]
ERROR: btrfs-tools-6.5.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: libnsl2-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package libnsl2-src went backwards which would break package feeds (from 0:2.0.1-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: libnsl2-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package libnsl2-dbg went backwards which would break package feeds (from 0:2.0.1-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: libnsl2-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package libnsl2-staticdev went backwards which would break package feeds (from 0:2.0.1-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: libnsl2-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package libnsl2-dev went backwards which would break package feeds (from 0:2.0.1-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: libnsl2-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package libnsl2-doc went backwards which would break package feeds (from 0:2.0.1-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: libnsl2-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package libnsl2-locale went backwards which would break package feeds (from 0:2.0.1-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: libnsl2-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package libnsl2 went backwards which would break package feeds (from 0:2.0.1-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: libnsl2-2.0.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: libtirpc-1.3.3-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-src went backwards which would break package feeds (from 0:1.3.4-r0 to 0:1.3.3-r0) [version-going-backwards]
ERROR: libtirpc-1.3.3-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-dbg went backwards which would break package feeds (from 0:1.3.4-r0 to 0:1.3.3-r0) [version-going-backwards]
ERROR: libtirpc-1.3.3-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-staticdev went backwards which would break package feeds (from 0:1.3.4-r0 to 0:1.3.3-r0) [version-going-backwards]
ERROR: libtirpc-1.3.3-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-dev went backwards which would break package feeds (from 0:1.3.4-r0 to 0:1.3.3-r0) [version-going-backwards]
ERROR: libtirpc-1.3.3-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-doc went backwards which would break package feeds (from 0:1.3.4-r0 to 0:1.3.3-r0) [version-going-backwards]
ERROR: libtirpc-1.3.3-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-locale went backwards which would break package feeds (from 0:1.3.4-r0 to 0:1.3.3-r0) [version-going-backwards]
ERROR: libtirpc-1.3.3-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc went backwards which would break package feeds (from 0:1.3.4-r0 to 0:1.3.3-r0) [version-going-backwards]
ERROR: libtirpc-1.3.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: cronie-1.6.1-r0 do_packagedata: QA Issue: Package version for package cronie-src went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1-r0) [version-going-backwards]
ERROR: cronie-1.6.1-r0 do_packagedata: QA Issue: Package version for package cronie-dbg went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1-r0) [version-going-backwards]
ERROR: cronie-1.6.1-r0 do_packagedata: QA Issue: Package version for package cronie-staticdev went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1-r0) [version-going-backwards]
ERROR: cronie-1.6.1-r0 do_packagedata: QA Issue: Package version for package cronie-dev went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1-r0) [version-going-backwards]
ERROR: cronie-1.6.1-r0 do_packagedata: QA Issue: Package version for package cronie-doc went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1-r0) [version-going-backwards]
ERROR: cronie-1.6.1-r0 do_packagedata: QA Issue: Package version for package cronie-locale went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1-r0) [version-going-backwards]
ERROR: cronie-1.6.1-r0 do_packagedata: QA Issue: Package version for package cronie went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1-r0) [version-going-backwards]
ERROR: cronie-1.6.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/cronie/1.6.1/temp/log.do_packagedata.2030538
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_packagedata) failed with exit code '1'

--===============6813722452170179648==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ltp: PV changed from "20230516" to "20230929"
packages/core2-32-poky-linux/ltp: PKGV changed from 20230516 [default] to 20230929 [default]
packages/core2-32-poky-linux/ltp/ltp-dbg: PV changed from "20230516" to "20230929"
packages/core2-32-poky-linux/ltp/ltp-dbg: PKGSIZE changed from 793624792 to 806928976 (+2%)
packages/core2-32-poky-linux/ltp/ltp-dbg: PKGV changed from 20230516 [default] to 20230929 [default]
packages/core2-32-poky-linux/ltp/ltp-dbg: FILELIST: removed "/opt/ltp/testcases/bin/.debug/setgroups04 /opt/ltp/testcases/bin/.debug/mmap07 /opt/ltp/testcases/bin/.debug/setgroups04_16", added "/opt/ltp/testcases/bin/.debug/tst_lockdown_enabled /opt/ltp/testcases/bin/.debug/kvm_svm02 /opt/ltp/testcases/bin/.debug/kvm_svm03 /opt/ltp/testcases/bin/.debug/epoll_wait05 /opt/ltp/testcases/bin/.debug/epoll_wait06 /opt/ltp/testcases/bin/.debug/epoll_wait07 /opt/ltp/testcases/bin/.debug/pipe14 /opt/ltp/testcases/bin/.debug/eventfd06 /opt/ltp/testcases/bin/.debug/eventfd05 /opt/ltp/testcases/bin/.debug/clone303 /opt/ltp/testcases/bin/.debug/eventfd04 /opt/ltp/testcases/bin/.debug/faccessat201 /opt/ltp/testcases/bin/.debug/faccessat202 /opt/ltp/testcases/bin/.debug/eventfd03 /opt/ltp/testcases/bin/.debug/eventfd02 /opt/ltp/testcases/bin/.debug/tcindex01 /opt/ltp/testcases/bin/.debug/statx12 /opt/ltp/testcases/bin/.debug/statx10 /opt/ltp/testcases/bin/.debug/statx11 /opt/ltp/testcases/bin/.debu
 g/tst_secureboot_enabled /opt/ltp/testcases/bin/.debug/process_madvise01 /opt/ltp/testcases/bin/.debug/mremap06 /opt/ltp/testcases/bin/.debug/faccessat02 /opt/ltp/testcases/bin/.debug/starvation"
packages/core2-32-poky-linux/ltp/ltp-dev: PV changed from "20230516" to "20230929"
packages/core2-32-poky-linux/ltp/ltp-dev: PKGSIZE changed from 275282 to 279926 (+2%)
packages/core2-32-poky-linux/ltp/ltp-dev: PKGV changed from 20230516 [default] to 20230929 [default]
packages/core2-32-poky-linux/ltp/ltp-dev: FILELIST: removed "/opt/ltp/include/ipcshm.h"
packages/core2-32-poky-linux/ltp/ltp-doc: PV changed from "20230516" to "20230929"
packages/core2-32-poky-linux/ltp/ltp-doc: PKGSIZE changed from 62801 to 62798 (-0%)
packages/core2-32-poky-linux/ltp/ltp-doc: PKGV changed from 20230516 [default] to 20230929 [default]
packages/core2-32-poky-linux/ltp/ltp-locale: PV changed from "20230516" to "20230929"
packages/core2-32-poky-linux/ltp/ltp-locale: PKGV changed from 20230516 [default] to 20230929 [default]
packages/core2-32-poky-linux/ltp/ltp-src: PV changed from "20230516" to "20230929"
packages/core2-32-poky-linux/ltp/ltp-src: PKGSIZE changed from 12995589 to 12973385 (-0%)
packages/core2-32-poky-linux/ltp/ltp-src: PKGV changed from 20230516 [default] to 20230929 [default]
packages/core2-32-poky-linux/ltp/ltp-src: FILELIST: directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sync -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/sync, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fsopen -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/fsopen, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/chmod -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/chmod, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/waitid -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/waitid, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/realtime/func/pthread_kill_latency -> /usr/src/debug/ltp/20230929-r0/testcases/realtime/func/pthread_kill_latency, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/io_getevents -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/io_getevents, directory rename
 d /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/preadv -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/preadv, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/request_key -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/request_key, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_init/speculative -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_init/speculative, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ioperm -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/ioperm, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/stress/mqueues -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/stress/mqueues, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/geteuid -> /usr/src/debug/ltp/20230929-r0/testca
 ses/kernel/syscalls/geteuid, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/open -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/open, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/set_mempolicy -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/set_mempolicy, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setpgrp -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/setpgrp, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/confstr -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/confstr, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/functional/mqueues -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/functional/mqueues, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getpshared -> /usr/src/debug/ltp/20230929-r0/test
 cases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getpshared, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/definitions/sched_h -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/definitions/sched_h, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setpshared -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setpshared, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/realtime/func/measurement -> /usr/src/debug/ltp/20230929-r0/testcases/realtime/func/measurement, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/munlockall -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/munlockall, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/network/tcp_cmds/sendfile ->
  /usr/src/debug/ltp/20230929-r0/testcases/network/tcp_cmds/sendfile, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/fs/fs_fill -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/fs/fs_fill, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/pids -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/controllers/pids, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mlock -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/mlock, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/realtime/stress/pi-tests -> /usr/src/debug/ltp/20230929-r0/testcases/realtime/stress/pi-tests, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/tkill -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/tkill, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/cpuctl -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/controllers/cpuctl, directory renamed /usr/src/deb
 ug/ltp/20230516-r0/testcases/kernel/controllers/memctl -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/controllers/memctl, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/crypto -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/crypto, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/misc/math/fptests -> /usr/src/debug/ltp/20230929-r0/testcases/misc/math/fptests, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/lseek -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/lseek, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/lchown -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/lchown, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/get_robust_list -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/get_robust_list, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/shmt -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/mem/shm
 t, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/firmware/fw_load_user -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/firmware/fw_load_user, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/security/cap_bound -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/security/cap_bound, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sched_rr_get_interval -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/sched_rr_get_interval, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/waitpid -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/waitpid, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_lock -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_lock, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/gethostid -> /usr/src/debug/ltp/2023092
 9-r0/testcases/kernel/syscalls/gethostid, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getresgid -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/getresgid, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/sched/hyperthreading/ht_enabled -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/sched/hyperthreading/ht_enabled, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getresuid -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/getresuid, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/kcmp -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/kcmp, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ipc/shmat -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/ipc/shmat, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fremovexattr -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/fremovexatt
 r, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getrlimit -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/getrlimit, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sigemptyset -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/behavior/timers, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/timer_getoverrun -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/timer_getoverrun, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sigaltstack -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/sigaltstack, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sigprocmask -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/sigprocmask, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/con
 formance/interfaces/shm_unlink -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/shm_unlink, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_unlink -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_unlink, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_init -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_getpshared, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/clock -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/gmtime, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mlock -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/ml
 ock, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getdtablesize -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/getdtablesize, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/network/nfs/nfs_stress -> /usr/src/debug/ltp/20230929-r0/testcases/network/nfs/nfs_stress, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ipc/semop -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/ipc/semop, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/realtime/func/rt-migrate -> /usr/src/debug/ltp/20230929-r0/testcases/realtime/func/rt-migrate, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/realtime/func/gtod_latency -> /usr/src/debug/ltp/20230929-r0/testcases/realtime/func/gtod_latency, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_destroy -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/in
 terfaces/ctime, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/clock_adjtime -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/clock_adjtime, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/execve -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/execve, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setxattr -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/setxattr, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_gettype -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_gettype, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_settype -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_settype, directory renamed /usr/sr
 c/debug/ltp/20230516-r0/testcases/open_posix_testsuite/functional/threads/schedule -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getprotocol, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_create -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_setcancelstate, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sgetmask -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/sgetmask, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setfsgid -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/setfsgid, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sendfile -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/sendfile, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setfsuid -> /usr/src/deb
 ug/ltp/20230929-r0/testcases/kernel/syscalls/setfsuid, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/execvp -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/execvp, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sendmmsg -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/sendmmsg, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setregid -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/setregid, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setreuid -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/setreuid, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/signalfd -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/signalfd, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sigrelse -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/sigrelse, directory renamed /usr
 /src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sigtimedwait -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/sigtimedwait, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/memcg/stress -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/controllers/memcg/stress, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_init -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_init, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugefallocate -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/mem/hugetlb/hugefallocate, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_timedsend -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_timedsend, directory ren
 amed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/pidfd_send_signal -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/pidfd_send_signal, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_getattr -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_getattr, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/misc/math/float/bessel -> /usr/src/debug/ltp/20230929-r0/testcases/misc/math/float/bessel, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/read -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/read, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_init -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_destroy, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getpriority -
 > /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/getpriority, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/network/packet -> /usr/src/debug/ltp/20230929-r0/testcases/network/packet, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/libcontrollers -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/controllers/libcontrollers, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setdomainname -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/setdomainname, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/aio_fsync -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/aio_fsync, directory renamed /usr/src/debug/ltp/20230516-r0/libs/libltpipc -> /usr/src/debug/ltp/20230929-r0/libs/libltpipc, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sysctl -> /usr/src/debug/ltp/20230929-r0/testcases/ker
 nel/syscalls/sysctl, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_setpshared -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getinheritsched, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/epoll_pwait -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/epoll_pwait, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/clock_settime/speculative -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/clock_settime/speculative, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mq_timedsend -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/mq_timedsend, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/localtime -> /usr/src/debug/ltp/20230929-r0/testcases/op
 en_posix_testsuite/conformance/interfaces/pthread_attr_getschedparam, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sched_getparam -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/sched_getparam, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sched_setparam -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/sched_setparam, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mq_timedreceive -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/mq_timedreceive, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mlockall/speculative -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/mlockall/speculative, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_trywrlock -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/
 conformance/interfaces/mktime, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/functional/timers/timers -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/functional/timers/timers, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/alarm -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/alarm, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/munlockall -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/munlockall, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fspick -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/fspick, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/rt_sigsuspend -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/rt_sigsuspend, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/misc/math/float/trigo -> /usr/src/debug/ltp/20230929-r0/testcases/misc/math/float/trigo, di
 rectory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/uname -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/uname, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sched_yield -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/sched_yield, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/capget -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/capget, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/misc/math/float/exp_log -> /usr/src/debug/ltp/20230929-r0/testcases/misc/math/float/exp_log, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/bind -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/bind, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_timedwait -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_timedwait, directory renamed /usr/
 src/debug/ltp/20230516-r0/testcases/kernel/controllers/cpuset/cpuset_load_balance_test -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/controllers/cpuset/cpuset_load_balance_test, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/removexattr -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/removexattr, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/cpuacct -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/controllers/cpuacct, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/readdir -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/readdir, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sigwaitinfo -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/sigwaitinfo, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/fsync -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformanc
 e/interfaces/fsync, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/nanosleep -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/nanosleep, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/behavior/timers -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_init, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/sched/sched_stress -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/sched/sched_stress, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/umount -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/umount, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/pidfd_open -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/pidfd_open, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite
 /conformance/interfaces/pthread_join/speculative -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_join/speculative, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/execle -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/execle, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/flistxattr -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/flistxattr, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/memset -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/memset, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/aio_write -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/aio_write, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setuid -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/setuid, directory rena
 med /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/execlp -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/execlp, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_getattr/speculative -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_getattr/speculative, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mincore -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/mincore, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/syncfs -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/syncfs, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_getschedparam -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/behavior/WIFEXITED, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/cpuset/cpuset_syscall
 _test -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/controllers/cpuset/cpuset_syscall_test, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_setschedparam -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_setschedparam, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_destroy -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_init, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mount -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/mount, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/realtime/func/matrix_mult -> /usr/src/debug/ltp/20230929-r0/testcases/realtime/func/matrix_mult, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/vfork -> /usr/src/debug/ltp/20230929-r0/testcases/
 kernel/syscalls/vfork, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_get_priority_min -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_get_priority_min, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_trylock -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_trylock, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/mtest07 -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/mem/mtest07, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/mtest06 -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/mem/mtest06, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/mtest05 -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/mem/mtest05, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/device-dri
 vers/pci/tpci_user -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/device-drivers/pci/tpci_user, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/io_cancel -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/io_cancel, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/readahead -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/readahead, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/mtest01 -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/mem/mtest01, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/futex -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/futex, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugefork -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/mem/hugetlb/hugefork, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fanotify -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/
 syscalls/fanotify, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ipc/msgctl -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/ipc/msgctl, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ipc/semctl -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/ipc/semctl, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fchmodat -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/fchmodat, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fchownat -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/fchownat, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ipc/shmctl -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/ipc/shmctl, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/openat2 -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/openat2, directory renamed /usr/src/debug/ltp/2023051
 6-r0/testcases/kernel/syscalls/pselect -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/pselect, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/definitions/signal_h -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/definitions/signal_h, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sigwaitinfo -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/sigwaitinfo, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/network/tcp_cmds/include -> /usr/src/debug/ltp/20230929-r0/testcases/network/tcp_cmds/include, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/newuname -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/newuname, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/vmsplice -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/vmsplice,
  directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fsconfig -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/fsconfig, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/network/multicast/mc_commo -> /usr/src/debug/ltp/20230929-r0/testcases/network/multicast/mc_commo, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/commands/eject -> /usr/src/debug/ltp/20230929-r0/testcases/commands/eject, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_gettime/speculative -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_getoverrun/speculative, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_destroy -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_destroy, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/op
 en_posix_testsuite/conformance/interfaces/timer_settime/speculative -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_settime/speculative, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/network/can/cve -> /usr/src/debug/ltp/20230929-r0/testcases/network/can/cve, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/tee -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/tee, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/stress/signals -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/stress/signals, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/renameat2 -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/renameat2, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/realtime/func/hrtimer-prio -> /usr/src/debug/ltp/20230929-r0/testcases/realtime/func/hrtimer-prio, directory renamed /usr/src/debug/ltp/2023051
 6-r0/testcases/kernel/uevents -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/uevents, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/pidfd_getfd -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/pidfd_getfd, directory renamed /usr/src/debug/ltp/20230516-r0/utils/benchmark/ebizzy-0.3 -> /usr/src/debug/ltp/20230929-r0/utils/benchmark/ebizzy-0.3, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/realtime/func/sched_latency -> /usr/src/debug/ltp/20230929-r0/testcases/realtime/func/sched_latency, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getschedparam -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/strlen, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedparam -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthre
 ad_attr_setschedparam, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/realtime/func/pi-tests -> /usr/src/debug/ltp/20230929-r0/testcases/realtime/func/pi-tests, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fsmount -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/fsmount, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/sched/pthreads -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/sched/pthreads, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/realtime/include -> /usr/src/debug/ltp/20230929-r0/testcases/realtime/include, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ptrace -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/ptrace, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/access -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/access, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/realtime/func/async_handler
  -> /usr/src/debug/ltp/20230929-r0/testcases/realtime/func/async_handler, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_getprioceiling -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_getprioceiling, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_setprioceiling -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/strcpy, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/bpf -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/bpf, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/pause -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/pause, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/umount2 -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/umount2, d
 irectory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sigaction -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/sigaction, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setinheritsched -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setinheritsched, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getinheritsched -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getstack, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/include -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/include, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/acct -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/acct, directory ren
 amed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_broadcast -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_broadcast, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_destroy/speculative -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_destroy/speculative, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fadvise -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/fadvise, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sched_getscheduler -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/sched_getscheduler, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sched_setscheduler -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/sched_setscheduler, directory re
 named /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sigismember -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/sigismember, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_timedreceive -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_timedreceive, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mlock/speculative -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/mlock/speculative, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/sched/hyperthreading/ht_affinity -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/sched/hyperthreading/ht_affinity, directory renamed /usr/src/debug/ltp/20230516-r0/tools/apicmds -> /usr/src/debug/ltp/20230929-r0/tools/apicmds, directory renamed /usr/src/debug/ltp/20230516
 -r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getdetachstate -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getdetachstate, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setdetachstate -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setdetachstate, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/device-drivers/cpufreq -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/device-drivers/cpufreq, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/kvm/include -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/kvm/include, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/swapoff -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/swapoff, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sigprocmask -
 > /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/sigprocmask, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/strchr -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/difftime, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/cgroup_xattr -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/controllers/cgroup_xattr, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/network/sockets -> /usr/src/debug/ltp/20230929-r0/testcases/network/sockets, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/realtime/func/pi_perf -> /usr/src/debug/ltp/20230929-r0/testcases/realtime/func/pi_perf, directory renamed /usr/src/debug/ltp/20230516-r0/libs/libltpvdso -> /usr/src/debug/ltp/20230929-r0/libs/libltpvdso, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_create -> /usr/src/debug/ltp/20230929-
 r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_create, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/security/integrity/ima/src -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/security/integrity/ima/src, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/open_by_handle_at -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/open_by_handle_at, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sched_getattr -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/sched_getattr, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sched_setattr -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/sched_setattr, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/stat -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/stat, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pth
 read_sigmask -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_sigmask, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ipc/msgstress -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/ipc/msgstress, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/pty -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/pty, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/numa -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/numa, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/include -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/mem/include, directory renamed /usr/src/debug/ltp/20230516-r0/libs/libltpswap -> /usr/src/debug/ltp/20230929-r0/libs/libltpswap, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getpgid -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/getpgid, directory renamed /usr/src/debug/ltp/20230516-r0/te
 stcases/kernel/syscalls/timer_delete -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/timer_delete, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/symlinkat -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/symlinkat, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/pwrite -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/pwrite, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/lremovexattr -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/lremovexattr, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/io_submit -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/io_submit, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_timedrdlock -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_timedrdlock, directory rename
 d /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/functional/timers/clocks -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/functional/timers/clocks, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/realtime/perf/latency -> /usr/src/debug/ltp/20230929-r0/testcases/realtime/perf/latency, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/string -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/string, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_destroy -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/aio_error, directory renamed /usr/src/debug/ltp/20230516-r0/include/old -> /usr/src/debug/ltp/20230929-r0/include/old, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fsync -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/fsync, directory renamed /usr/src/debug/ltp/202
 30516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_trylock -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_trylock, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/dup -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/dup, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_destroy -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_destroy, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fork -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/fork, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/network/multicast/mc_member -> /usr/src/debug/ltp/20230929-r0/testcases/network/multicast/mc_member, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/adjtimex -> /usr/src/debug/ltp/2023092
 9-r0/testcases/kernel/syscalls/adjtimex, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/sched/nptl -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/sched/nptl, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/strlen -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_self, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/fs/lftest -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/fs/lftest, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_getoverrun -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_getoverrun, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/io_setup -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/io_setup, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/oom -> /usr/src/
 debug/ltp/20230929-r0/testcases/kernel/mem/oom, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/fs/squashfs -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/fs/squashfs, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/statvfs -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/statvfs, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/fs/stream -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/fs/stream, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/quotactl -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/quotactl, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/kill -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/kill, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/io_uring -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/io_uring, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kern
 el/syscalls/sigaction -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/sigaction, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getschedpolicy -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getschedpolicy, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sched_get_priority_max -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/sched_get_priority_max, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fchmod -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/fchmod, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedpolicy -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedpolicy, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsu
 ite/conformance/interfaces/munmap -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/munmap, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/sched/tool -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/sched/tool, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_rr_get_interval/speculative -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_rr_get_interval/speculative, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/lib -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/mem/hugetlb/lib, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/gettimeofday -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/gettimeofday, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sigsuspend -> /usr/src/debug/ltp/20230929-r0/testcas
 es/open_posix_testsuite/conformance/interfaces/sigsuspend, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/chroot -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/chroot, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sendto -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/sendto, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mlock2 -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/mlock2, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ssetmask -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/ssetmask, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/exit -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/exit, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_getparam -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/confo
 rmance/interfaces/sched_getparam, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_setparam -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_setparam, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/sound -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/sound, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/personality -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/personality, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/device-drivers/tbio/tbio_kernel -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/device-drivers/tbio/tbio_kernel, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/network/nfsv4/acl -> /usr/src/debug/ltp/20230929-r0/testcases/network/nfsv4/acl, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mlockall -> /usr/src/debug
 /ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/mlockall, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sigignore -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/sigignore, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/cpuctl_fj -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/controllers/cpuctl_fj, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_testcancel -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_init, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/mem/hugetlb/hugemmap, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/flock -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/flock,
  directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/containers/utsname -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/containers/utsname, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/perf_event_open -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/perf_event_open, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/cma -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/cma, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/aio_return -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/aio_return, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sockioctl -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/sockioctl, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sysconf -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/sysconf, direct
 ory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/utimes -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/utimes, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/statfs -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/statfs, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/poll -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/poll, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/socketcall -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/socketcall, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/io/direct_io -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/io/direct_io, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_timedlock -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_timedlock, directory renam
 ed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/include -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/include, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getppid -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/getppid, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/behavior/WIFEXITED -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cleanup_pop, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_destroy -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/strftime, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getgid -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/getgid, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fstatfs -> /usr/src/debug/ltp/2
 0230929-r0/testcases/kernel/syscalls/fstatfs, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/pipe2 -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/pipe2, directory renamed /usr/src/debug/ltp/20230516-r0/libs/libltpuinput -> /usr/src/debug/ltp/20230929-r0/libs/libltpuinput, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_atfork -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_atfork, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/commands/nm/datafiles -> /usr/src/debug/ltp/20230929-r0/testcases/commands/nm/datafiles, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/accept4 -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/accept4, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ipc/shmdt -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/ipc/shmdt, direc
 tory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getsockopt -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/getsockopt, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/memcpy -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/memcpy, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getprioceiling -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getprioceiling, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setprioceiling -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setprotocol, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/definitions/errno_h -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conf
 ormance/definitions/errno_h, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/llistxattr -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/llistxattr, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mmap -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/mmap, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sigpause -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/sigpause, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_get_priority_max -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_get_priority_max, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/kill -> /usr/src/debug/ltp/20230929-r0/testcases/open_pos
 ix_testsuite/conformance/interfaces/kill, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedparam/speculative -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedparam/speculative, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_setattr -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_setattr, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cleanup_push -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_getschedparam, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/fork -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/fork, directory renamed /usr/src/debug/l
 tp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/time -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_destroy, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/misc/math/abs -> /usr/src/debug/ltp/20230929-r0/testcases/misc/math/abs, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_open -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_open, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/commands/ldd/datafiles -> /usr/src/debug/ltp/20230929-r0/testcases/commands/ldd/datafiles, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setitimer -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/setitimer, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sysinfo -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/sysinfo, director
 y renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/functional/threads/condvar -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/functional/threads/condvar, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fchown -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/fchown, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_wait -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_wait, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_init -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_destroy, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_destroy -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/c
 onformance/interfaces/pthread_mutex_destroy, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_timedwrlock -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_timedwrlock, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_destroy -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_destroy, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/lib -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/mem/lib, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugeshmctl -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/mem/hugetlb/hugeshmctl, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getcontext -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/getcontext, dire
 ctory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/move_mount -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/move_mount, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/truncate -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/truncate, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/wait -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/wait, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/keyctl -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/keyctl, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/containers/mountns -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/containers/mountns, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/send -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/send, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/realtime/func/periodic_cpu_load 
 -> /usr/src/debug/ltp/20230929-r0/testcases/realtime/func/periodic_cpu_load, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/unlink -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/unlink, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/reboot -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/reboot, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/pread -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/pread, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getcwd -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/getcwd, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/misc/crash -> /usr/src/debug/ltp/20230929-r0/testcases/misc/crash, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/socketpair -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/socketpair, directory renamed /usr/src/debug/ltp/2
 0230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_delete -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_delete, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/set_tid_address -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/set_tid_address, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/ipc/pipeio -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/ipc/pipeio, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ipc/msgget -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/ipc/msgget, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ipc/semget -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/ipc/semget, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ipc/shmget -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/ipc/shmget, directory renamed /usr/
 src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_getparam/speculative -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_getparam/speculative, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/commands/file/datafiles -> /usr/src/debug/ltp/20230929-r0/testcases/commands/file/datafiles, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/link -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/link, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_setcancelstate -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_create, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/connectors/pec -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/connectors/pec, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sigtimedwait -> /us
 r/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/sigtimedwait, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/io_destroy -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/io_destroy, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_getclock -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_setspecific, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_setclock -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/sigpending, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/ctime -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getscope, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/execv -> 
 /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/execv, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/clock_gettime -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/clock_gettime, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/clock_settime -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/clock_settime, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/nftw -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/nftw, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/lgetxattr -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/lgetxattr, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/listxattr -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/listxattr, directory renamed /usr/src/debug/lt
 p/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_getpshared -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/sigfillset, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/network/multicast/mc_opts -> /usr/src/debug/ltp/20230929-r0/testcases/network/multicast/mc_opts, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/gethostname -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/gethostname, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getpeername -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/getpeername, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getsockname -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/getsockname, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/execl -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/execl, directory rena
 med /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/ksm -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/mem/ksm, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/irq -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/irq, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_destroy/speculative -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_destroy/speculative, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/device-drivers/zram -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/device-drivers/zram, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/security/smack -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/security/smack, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/mem -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/mem/mem, directory renamed /usr/src/debug/ltp/20230516-r0/test
 cases/kernel/security/dirtyc0w_shmem -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/security/dirtyc0w_shmem, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/timer_create -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/timer_create, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/write -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/write, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/strncpy -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/sigemptyset, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/recv -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/recv, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/readlinkat -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/readlinkat, directory renamed /usr/src/debug/ltp/20230516-r0/testcases
 /kernel/syscalls/munlock -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/munlock, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mount_setattr -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/mount_setattr, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/memcg/control -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/controllers/memcg/control, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/rename -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/rename, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/raise -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/raise, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/vma -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/mem/vma, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/set_ro
 bust_list -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/set_robust_list, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_unlink/speculative -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_unlink/speculative, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/readv -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/readv, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/membarrier -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/membarrier, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sighold -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_wrlock, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_init -> /usr/src/debug/ltp/202
 30929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_init, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getstack -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_getcpuclockid, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setstack -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setstack, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/timerfd -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/timerfd, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/strcpy -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/asctime, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setresgid
  -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/setresgid, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setresuid -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/setresuid, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/rt_sigaction -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/rt_sigaction, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/brk -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/brk, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/utimensat -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/utimensat, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setrlimit -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/setrlimit, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_init -> /usr/src/debug/ltp/20230
 929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_init, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_wait -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_wait, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_getoverrun/speculative -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_gettime/speculative, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ulimit -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/ulimit, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/device-drivers/uaccess -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/device-drivers/uaccess, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/page -> /usr/src/debug/ltp/20230929-r0/testcases/
 kernel/mem/page, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/cpuset/cpuset_lib -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/controllers/cpuset/cpuset_lib, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getxattr -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/getxattr, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getdents -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/getdents, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/listen -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/listen, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mq_open -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/mq_open, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fchdir -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/fchdir, directory renamed /usr/src/debug/ltp/20230
 516-r0/testcases/kernel/syscalls/msync -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/msync, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_detach -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_detach, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/tools -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/tools, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/rt_sigprocmask -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/rt_sigprocmask, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sigdelset -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/sigdelset, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/mmapstress -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/m
 em/mmapstress, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_create/speculative -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_create/speculative, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sigaddset -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/sigaddset, directory renamed /usr/src/debug/ltp/20230516-r0/libs/libltpsigwait -> /usr/src/debug/ltp/20230929-r0/libs/libltpsigwait, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sched_getaffinity -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/sched_getaffinity, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sched_setaffinity -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/sched_setaffinity, directory renamed /usr/src/debug/ltp/20230516-r0/t
 estcases/open_posix_testsuite/conformance/interfaces/signal -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/signal, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/realtime/func/prio-wake -> /usr/src/debug/ltp/20230929-r0/testcases/realtime/func/prio-wake, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/device-drivers/acpi -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/device-drivers/acpi, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setpgid -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/setpgid, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/splice -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/splice, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_setschedprio -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/time, directory r
 enamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_timedwait -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_timedwait, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/lio_listio -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/lio_listio, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/clock_gettime -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/clock_gettime, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/clock_settime -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/clock_settime, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mq_notify -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/mq_notify, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscal
 ls/pkeys -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/pkeys, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sched_get_priority_min -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/sched_get_priority_min, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_signal -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_signal, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/io/writetest -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/io/writetest, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mallinfo2 -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/mallinfo2, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_getpshared -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance
 /interfaces/pthread_equal, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_setpshared -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_getpshared, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/clone -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/clone, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setpriority -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/setpriority, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_rr_get_interval -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_rr_get_interval, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/epoll_create1 -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/epoll_create1, directory rena
 med /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/cpuset/cpuset_memory_spread_test -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/controllers/cpuset/cpuset_memory_spread_test, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_create/speculative -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_create/speculative, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/fs/fsx-linux -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/fs/fsx-linux, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/clock_nanosleep -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/clock_nanosleep, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/logging/kmsg -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/logging/kmsg, directory renamed /usr/src/debug/ltp/20230516-r0/
 testcases/kernel/syscalls/utime -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/utime, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_delete/speculative -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_delete/speculative, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/hotplug/memory_hotplug -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/hotplug/memory_hotplug, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sysfs -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/sysfs, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getdomainname -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/getdomainname, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/fs/ftest -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/fs/ftest, directory renamed /usr/src/debug/ltp/2023051
 6-r0/testcases/kernel/security/securebits -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/security/securebits, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sigset -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/sigset, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ipc/msgrcv -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/ipc/msgrcv, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getstacksize -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_tryrdlock, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setstacksize -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_getpshared, directory renamed /usr/src/d
 ebug/ltp/20230516-r0/testcases/kernel/syscalls/chdir -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/chdir, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/misc/math/float/iperb -> /usr/src/debug/ltp/20230929-r0/testcases/misc/math/float/iperb, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugeshmdt -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/mem/hugetlb/hugeshmdt, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getrusage -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/getrusage, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/pwritev -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/pwritev, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/epoll_ctl -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/epoll_ctl, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getpid -> /usr/src/debug/ltp
 /20230929-r0/testcases/kernel/syscalls/getpid, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/signal -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/signal, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/symlink -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/symlink, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/delete_module -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/delete_module, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/sched/clisrv -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/sched/clisrv, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/dup3 -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/dup3, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/dup2 -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/dup2, directory renamed /usr/src/debug/ltp/20230516-r0
 /testcases/kernel/syscalls/close_range -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/close_range, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cleanup_pop -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cleanup_push, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_init -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_init, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sigaltstack -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/sigaltstack, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_yield -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_set
 pshared, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cancel -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cancel, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_getpshared -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setstacksize, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/realtime/func/prio-preempt -> /usr/src/debug/ltp/20230929-r0/testcases/realtime/func/prio-preempt, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/capset -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/capset, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/misc/math/atof -> /usr/src/debug/ltp/20230929-r0/testcases/misc/math/atof, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/s
 igwait -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/sigwait, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/device-drivers/pci/tpci_kernel -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/device-drivers/pci/tpci_kernel, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/fs/fsstress -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/fs/fsstress, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sigqueue -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/sigqueue, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_setcanceltype -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_setpshared, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/network/can/filter-tests -> /usr/src/debug/ltp/20230929-r0/testcases/network/can/filter-
 tests, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/sched/autogroup -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/sched/autogroup, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/misc/math/nextafter -> /usr/src/debug/ltp/20230929-r0/testcases/misc/math/nextafter, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sigsuspend -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/sigsuspend, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_equal -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_setcanceltype, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sigpending -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_setclock, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sbrk -
 > /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/sbrk, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/munlock -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/munlock, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sigpending -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/sigpending, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/network/stress/ns-tools -> /usr/src/debug/ltp/20230929-r0/testcases/network/stress/ns-tools, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/futimesat -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/futimesat, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/syscall -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/syscall, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pth
 read_spin_unlock -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_unlock, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mknod -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/mknod, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sigrelse -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_destroy, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/realtime/lib -> /usr/src/debug/ltp/20230929-r0/testcases/realtime/lib, directory renamed /usr/src/debug/ltp/20230516-r0/libs/libltpnewipc -> /usr/src/debug/ltp/20230929-r0/libs/libltpnewipc, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/rmdir -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/rmdir, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/memcg -> /usr/src/debug/l
 tp/20230929-r0/testcases/kernel/controllers/memcg, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/io/aio -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/io/aio, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sigwait -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/sigwait, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/times -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/times, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/fcntl, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/signalfd4 -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/signalfd4, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/vhangup -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/vhangup, di
 rectory renamed /usr/src/debug/ltp/20230516-r0/testcases/misc/math/float -> /usr/src/debug/ltp/20230929-r0/testcases/misc/math/float, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/fs/openfile -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/fs/openfile, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/device-drivers/rtc -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/device-drivers/rtc, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/renameat -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/renameat, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/fs/doio -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/fs/doio, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/security/filecaps -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/security/filecaps, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/aio_suspend -> /usr/
 src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/aio_suspend, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/recvfrom -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/recvfrom, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/aio_cancel -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/aio_cancel, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/realpath -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/realpath, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_destroy -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/clock, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/readlink -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/readlink, direct
 ory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/recvmmsg -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/recvmmsg, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/fs/proc -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/fs/proc, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/set_thread_area -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/set_thread_area, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/fs/read_all -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/fs/read_all, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/profil -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/profil, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sigfillset -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_yield, directory renamed /usr/src/debug/ltp/202
 30516-r0/testcases/kernel/controllers/freezer -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/controllers/freezer, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugeshmget -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/mem/hugetlb/hugeshmget, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/clock_getres -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/clock_getres, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/thp -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/mem/thp, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/unshare -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/unshare, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/io/ltp-aiodio -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/io/ltp-aiodio, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/copy_file_range -> /usr/src/debug/ltp/20230929
 -r0/testcases/kernel/syscalls/copy_file_range, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sync_file_range -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/sync_file_range, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/timer_gettime -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/timer_gettime, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/timer_settime -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/timer_settime, directory renamed /usr/src/debug/ltp/20230516-r0/utils/sctp/lib -> /usr/src/debug/ltp/20230929-r0/utils/sctp/lib, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/functional/semaphores -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/functional/semaphores, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/definitions/mqueue_h -> /usr/src/debug/ltp/20230929-r0/tes
 tcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_setpshared, directory renamed /usr/src/debug/ltp/20230516-r0/utils/sctp/include/netinet -> /usr/src/debug/ltp/20230929-r0/utils/sctp/include/netinet, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/time -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/time, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/containers/timens -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/containers/timens, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/containers/userns -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/containers/userns, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_open/speculative -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_open/speculative, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/tracing/pt_test -> /usr/s
 rc/debug/ltp/20230929-r0/testcases/kernel/tracing/pt_test, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_timedsend/speculative -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_timedsend/speculative, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/add_key -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/add_key, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_gettype/speculative -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_trywrlock/speculative, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getgroups -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/getgroups, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/io -> /usr/src/debug/ltp/20230929-r0/testca
 ses/kernel/controllers/io, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_send -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_send, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setegid -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/setegid, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/close -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/close, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/nice -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/nice, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_gettime -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_gettime, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/device-drivers/block/block_dev
 _user -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/device-drivers/block/block_dev_user, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_settime -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_settime, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/misc/f00f -> /usr/src/debug/ltp/20230929-r0/testcases/misc/f00f, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/aio_error -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/sigrelse, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/containers/sysvipc -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/containers/sysvipc, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fgetxattr -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/fgetxattr, directory renamed /usr/src/debug/ltp
 /20230516-r0/testcases/kernel/syscalls/fsetxattr -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/fsetxattr, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/preadv2 -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/preadv2, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_tryrdlock -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_setprioceiling, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getcpu -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/getcpu, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fallocate -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/fallocate, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ftruncate -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/ftruncate, directory renamed
  /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/modify_ldt -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/modify_ldt, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/utils -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/utils, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/abort -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/abort, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_wait -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_wait, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_rdlock -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_rdlock, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwl
 ock_unlock -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_unlock, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fmtmsg -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/fmtmsg, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/prctl -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/prctl, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_wrlock -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/sighold, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_getcpuclockid -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/strchr, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/clock_nanosleep -> /usr/src/debug/ltp/20230929-r0/testcases
 /kernel/syscalls/clock_nanosleep, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/munmap -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/munmap, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/inotify -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/inotify, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/linkat -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/linkat, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ioprio -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/ioprio, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/fs/fs_di -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/fs/fs_di, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/creat -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/creat, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsui
 te/conformance/interfaces/pthread_getcpuclockid/speculative -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_gettype/speculative, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/io_pgetevents -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/io_pgetevents, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/realtime/func/sched_football -> /usr/src/debug/ltp/20230929-r0/testcases/realtime/func/sched_football, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/rt_sigtimedwait -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/rt_sigtimedwait, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/gethostbyname_r -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/gethostbyname_r, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setsid -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/setsid
 , directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_unlock -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_unlock, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/containers/netns -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/containers/netns, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/migrate_pages -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/migrate_pages, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/stime -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/stime, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/chown -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/chown, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/gettid -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/gettid,
  directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/tgkill -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/tgkill, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/network/lib6 -> /usr/src/debug/ltp/20230929-r0/testcases/network/lib6, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mq_unlink -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/mq_unlink, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/nanosleep -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/nanosleep, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/umask -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/umask, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/network/sctp -> /usr/src/debug/ltp/20230929-r0/testcases/network/sctp, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/memcg/functional -> /usr/src/debug/ltp/20230929-
 r0/testcases/kernel/controllers/memcg/functional, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getegid -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/getegid, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getprotocol -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_delete, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setprotocol -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setprioceiling, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getpgrp -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/getpgrp, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/iopl -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/iopl, directo
 ry renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ppoll -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/ppoll, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_init -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_init, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/execveat -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/execveat, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mprotect -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/mprotect, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/unlinkat -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/unlinkat, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/cgroup_fj -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/controllers/cgroup
 _fj, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_init -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_init, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mlockall -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/mlockall, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/realtime/func/thread_clock -> /usr/src/debug/ltp/20230929-r0/testcases/realtime/func/thread_clock, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mallinfo -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/mallinfo, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/memcmp -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/memcmp, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_notify -> /usr/src/debug/ltp/20230929-r0
 /testcases/open_posix_testsuite/conformance/interfaces/mq_notify, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/cgroup -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/controllers/cgroup, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/input -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/input, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getrandom -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/getrandom, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/pivot_root -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/pivot_root, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/select -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/select, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/clock_getcpuclockid -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_tes
 tsuite/conformance/interfaces/clock_getcpuclockid, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setns -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/setns, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/testfrmw -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/testfrmw, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/memcg/regression -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/controllers/memcg/regression, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/difftime -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_trywrlock, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/strftime -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conforman
 ce/interfaces/pthread_attr_destroy, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/settimeofday -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/settimeofday, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mkdirat -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/mkdirat, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/cpuset/cpuset_hotplug_test -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/controllers/cpuset/cpuset_hotplug_test, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setgid -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/setgid, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/watchqueue -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/watchqueue, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/realtime/func/sched_jitter -> /usr/src/debug/ltp/20230929-r0/testcases/realtime/func/sched_jitter, dir
 ectory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getscope -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_setschedprio, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setscope -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setscope, directory renamed /usr/src/debug/ltp/20230516-r0/utils/sctp/func_tests -> /usr/src/debug/ltp/20230929-r0/utils/sctp/func_tests, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/security/dirtypipe -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/security/dirtypipe, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/eventfd2 -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/eventfd2, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance
 /interfaces/pthread_mutexattr_init -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_destroy, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/fs/inode -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/fs/inode, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_trywrlock/speculative -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_getcpuclockid/speculative, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/finit_module -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/finit_module, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/fs/fs_perms -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/fs/fs_perms, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/misc/math/float/power -> /usr/src/debug/ltp/20230929-r0/testcases/misc/math/float/power, d
 irectory renamed /usr/src/debug/ltp/20230516-r0/pan -> /usr/src/debug/ltp/20230929-r0/pan, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/syslog -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/syslog, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fstatat -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/fstatat, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/device-drivers/tbio/tbio_user -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/device-drivers/tbio/tbio_user, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_getvalue -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_getvalue, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/lstat -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/lstat, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/n
 etwork/netstress -> /usr/src/debug/ltp/20230929-r0/testcases/network/netstress, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/getpid -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/localtime, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fstat -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/fstat, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/userfaultfd -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/userfaultfd, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mkdir -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/mkdir, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/epoll_create -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/epoll_create, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/memfd_create ->
  /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/memfd_create, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sighold -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/sighold, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_lock -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_lock, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_receive -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_receive, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/swapon -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/swapon, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_destroy -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/c
 onformance/interfaces/sem_destroy, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/wait4 -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/wait4, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_exit -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_exit, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/vmtests -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/mem/vmtests, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_join -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_join, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_kill -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_kill, directory renamed 
 /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/definitions/aio_h -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/definitions/aio_h, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_timedreceive/speculative -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_timedreceive/speculative, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_init -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_init, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_self -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getstacksize, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/name_to_handle_at -> /usr/s
 rc/debug/ltp/20230929-r0/testcases/kernel/syscalls/name_to_handle_at, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ustat -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/ustat, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setsockopt -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/setsockopt, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/fs/doio/include -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/fs/doio/include, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_unlink -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_unlink, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mallopt -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/mallopt, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mknodat -> /usr/src/debug/ltp/20
 230929-r0/testcases/kernel/syscalls/mknodat, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_once -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_once, directory renamed /usr/src/debug/ltp/20230516-r0/tools/genload -> /usr/src/debug/ltp/20230929-r0/tools/genload, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_close -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_close, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/connect -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/connect, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/epoll -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/epoll, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/madvise -> /usr/src/debug/ltp/20230
 929-r0/testcases/kernel/syscalls/madvise, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getsid -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/getsid, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/security/prot_hsymlinks -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/security/prot_hsymlinks, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fdatasync -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/fdatasync, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fpathconf -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/fpathconf, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/swapping -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/mem/swapping, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/rt_sigqueueinfo -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/rt_sigqueueinfo, directory renam
 ed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/clock_getres -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/clock_getres, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/rt_tgsigqueueinfo -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/rt_tgsigqueueinfo, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getitimer -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/getitimer, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/writev -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/writev, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sendmsg -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/sendmsg, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_post -> /usr/src/debug/ltp/20230929-r0/testcases/open_pos
 ix_testsuite/conformance/interfaces/sem_post, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/init_module -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/init_module, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/open_tree -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/open_tree, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/killpg -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/killpg, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/remap_file_pages -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/remap_file_pages, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/lib -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/lib, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/socket -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/
 syscalls/socket, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/security/dirtyc0w -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/security/dirtyc0w, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_getscheduler -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_getscheduler, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_setscheduler -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_setscheduler, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getpagesize -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/getpagesize, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_close -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_clo
 se, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/pathconf -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/pathconf, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/network/nfsv4/locks -> /usr/src/debug/ltp/20230929-r0/testcases/network/nfsv4/locks, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/recvmsg -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/recvmsg, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugeshmat -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/mem/hugetlb/hugeshmat, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/accept -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/accept, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/asctime -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/definitions/mqueue_h, directory renamed /us
 r/src/debug/ltp/20230516-r0/testcases/network/nfs/nfslock01 -> /usr/src/debug/ltp/20230929-r0/testcases/network/nfs/nfslock01, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ioctl -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/ioctl, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/move_pages -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/move_pages, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/gmtime -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/strncpy, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mktime -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/getpid, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ipc/msgsnd -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/ipc/m
 sgsnd, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_open -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_open, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/shm_open -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/shm_open, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/tunable -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/mem/tunable, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/pwritev2 -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/pwritev2, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_create -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_create, directory renamed /usr/src/debug/ltp/20230516-r0/testcas
 es/open_posix_testsuite/conformance/interfaces/timer_delete -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_getclock, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getuid -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/getuid, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/openat -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/openat, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/cpuset/cpuset_memory_test -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/controllers/cpuset/cpuset_memory_test, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/inotify_init -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/inotify_init, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/exit_group -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/exit_group, director
 y renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_getspecific -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_getspecific, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/power_management -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/power_management, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_setspecific -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/functional/threads/schedule, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/llseek -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/llseek, directory renamed /usr/src/debug/ltp/20230516-r0/utils/sctp/testlib -> /usr/src/debug/ltp/20230929-r0/utils/sctp/testlib, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_setpshare
 d -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_testcancel, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_destroy -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_init, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/cpuset/cpuset_memory_pressure_test -> /usr/src/debug/ltp/20230929-r0/testcases/kernel/controllers/cpuset/cpuset_memory_pressure_test, directory renamed /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/aio_read -> /usr/src/debug/ltp/20230929-r0/testcases/open_posix_testsuite/conformance/interfaces/aio_read, removed "/usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/clone3/clone301.c /usr/src/debug/ltp/20230516-r0/include/safe_macros_fn.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/pipe/pipe06.c /usr/src/debug/ltp
 /20230516-r0/testcases/kernel/syscalls/clone3/clone302.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/epoll_wait/epoll_wait01.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/epoll_wait/epoll_wait02.c /usr/src/debug/ltp/20230516-r0/include/lapi/rt_sigaction.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/epoll_wait/epoll_wait03.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/epoll_wait/epoll_wait04.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/statx/statx08.c /usr/src/debug/ltp/20230516-r0/testcases/cve/cve-2016-10044.c /usr/src/debug/ltp/20230516-r0/lib/tst_kconfig.c /usr/src/debug/ltp/20230516-r0/lib/tst_af_alg.c /usr/src/debug/ltp/20230516-r0/lib/tst_cgroup.c /usr/src/debug/ltp/20230516-r0/include/tst_device.h /usr/src/debug/ltp/20230516-r0/include/tst_module.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap14.c /usr/src/debug/ltp/20230516-r0/lib/tst_virt.c /usr/src/debug/ltp/20230516-r0/lib/tst_device.c 
 /usr/src/debug/ltp/20230516-r0/testcases/kernel/containers/libclone/libclone.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/pipe/pipe02.c /usr/src/debug/ltp/20230516-r0/testcases/cve/cve-2017-16939.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_checkpoint.c /usr/src/debug/ltp/20230516-r0/lib/tst_rtctime.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/containers/libclone/libclone.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_net_iface_prefix.c /usr/src/debug/ltp/20230516-r0/testcases/cve/meltdown.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_cgctl.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/pipe/pipe04.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_check_drivers.c /usr/src/debug/ltp/20230516-r0/lib/safe_file_ops.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/pipe/pipe13.c /usr/src/debug/ltp/20230516-r0/include/tst_coredump.h /usr/src/debug/ltp/20230516-r0/include/lapi/fsmount.h /usr/src/debug/ltp/20230516-r0/include/lapi/io_p
 getevents.h /usr/src/debug/ltp/20230516-r0/testcases/cve/icmp_rate_limit01.c /usr/src/debug/ltp/20230516-r0/include/tst_atomic.h /usr/src/debug/ltp/20230516-r0/lib/tst_assert.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/eventfd/eventfd01.c /usr/src/debug/ltp/20230516-r0/include/tst_buffers.h /usr/src/debug/ltp/20230516-r0/include/lapi/fanotify.h /usr/src/debug/ltp/20230516-r0/include/tst_rtctime.h /usr/src/debug/ltp/20230516-r0/include/ipcsem.h /usr/src/debug/ltp/20230516-r0/include/safe_net_fn.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap09.c /usr/src/debug/ltp/20230516-r0/include/tst_net.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/containers/pidns/pidns01.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/containers/pidns/pidns02.c /usr/src/debug/ltp/20230516-r0/include/lapi/watch_queue.h /usr/src/debug/ltp/20230516-r0/lib/tst_fs_setup.c /usr/src/debug/ltp/20230516-r0/lib/tst_safe_sysv_ipc.c /usr/src/debug/ltp/20230516-r0/lib/tst_bool_expr
 .c /usr/src/debug/ltp/20230516-r0/testcases/kernel/containers/pidns/pidns03.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/containers/pidns/pidns04.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/containers/pidns/pidns05.c /usr/src/debug/ltp/20230516-r0/lib/errnos.h /usr/src/debug/ltp/20230516-r0/include/lapi/fs.h /usr/src/debug/ltp/20230516-r0/include/tst_sig_proc.h /usr/src/debug/ltp/20230516-r0/lib/tst_checkpoint.c /usr/src/debug/ltp/20230516-r0/lib/safe_net.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap03.c /usr/src/debug/ltp/20230516-r0/testcases/cve/cve-2016-7042.c /usr/src/debug/ltp/20230516-r0/include/tst_cmd.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setgroups/setgroups01.c /usr/src/debug/ltp/20230516-r0/include/tst_clocks.h /usr/src/debug/ltp/20230516-r0/lib/tst_dir_is_empty.c /usr/src/debug/ltp/20230516-r0/include/tst_test_macros.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setgroups/setgroups03.c /usr/src/debug/ltp
 /20230516-r0/include/tst_safe_macros.h /usr/src/debug/ltp/20230516-r0/include/tst_capability.h /usr/src/debug/ltp/20230516-r0/lib/tst_res.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_ns_common.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setgroups/setgroups04.c /usr/src/debug/ltp/20230516-r0/include/tst_netdevice.h /usr/src/debug/ltp/20230516-r0/testcases/cve/cve-2014-0196.c /usr/src/debug/ltp/20230516-r0/lib/tst_netdevice.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/pipe/pipe09.c /usr/src/debug/ltp/20230516-r0/lib/tst_kvercmp.c /usr/src/debug/ltp/20230516-r0/include/tst_checkpoint_fn.h /usr/src/debug/ltp/20230516-r0/include/tst_safe_file_at.h /usr/src/debug/ltp/20230516-r0/include/lapi/common_timers.h /usr/src/debug/ltp/20230516-r0/include/lapi/init_module.h /usr/src/debug/ltp/20230516-r0/include/safe_file_ops_fn.h /usr/src/debug/ltp/20230516-r0/lib/tst_status.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap19.c /usr/src/debug/l
 tp/20230516-r0/lib/tst_checksum.c /usr/src/debug/ltp/20230516-r0/include/tst_assert.h /usr/src/debug/ltp/20230516-r0/include/lapi/keyctl.h /usr/src/debug/ltp/20230516-r0/include/tst_hugepage.h /usr/src/debug/ltp/20230516-r0/include/tst_uinput.h /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_timeout_kill.c /usr/src/debug/ltp/20230516-r0/lib/tst_get_bad_addr.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/kvm/kvm_pagefault01.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_ns_ifmove.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap15.c /usr/src/debug/ltp/20230516-r0/lib/tst_lockdown.c /usr/src/debug/ltp/20230516-r0/include/tst_private.h /usr/src/debug/ltp/20230516-r0/include/tst_sys_conf.h /usr/src/debug/ltp/20230516-r0/include/lapi/close_range.h /usr/src/debug/ltp/20230516-r0/include/libswap.h /usr/src/debug/ltp/20230516-r0/lib/tst_ioctl.c /usr/src/debug/ltp/20230516-r0/include/tst_arch.h /usr/src/debug/ltp/20230516-r0/include/tst_fips.h /usr/src/debug/ltp/20
 230516-r0/include/tst_mkfs.h /usr/src/debug/ltp/20230516-r0/include/tst_test.h /usr/src/debug/ltp/20230516-r0/lib/tst_mkfs.c /usr/src/debug/ltp/20230516-r0/include/tst_clone.h /usr/src/debug/ltp/20230516-r0/include/lapi/ipcbuf.h /usr/src/debug/ltp/20230516-r0/include/lapi/msgbuf.h /usr/src/debug/ltp/20230516-r0/include/lapi/sembuf.h /usr/src/debug/ltp/20230516-r0/include/lapi/shmbuf.h /usr/src/debug/ltp/20230516-r0/include/tst_sched.h /usr/src/debug/ltp/20230516-r0/include/lapi/readdir.h /usr/src/debug/ltp/20230516-r0/include/tst_taint.h /usr/src/debug/ltp/20230516-r0/include/tst_timer.h /usr/src/debug/ltp/20230516-r0/include/tst_lockdown.h /usr/src/debug/ltp/20230516-r0/lib/tst_fs_link_count.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap08.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_hexdump.c /usr/src/debug/ltp/20230516-r0/include/tst_checkpoint.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap16.c /usr/src/debug/ltp/20230516-r0/lib/t
 st_safe_timerfd.c /usr/src/debug/ltp/20230516-r0/include/tst_af_alg.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap20.c /usr/src/debug/ltp/20230516-r0/lib/safe_macros.c /usr/src/debug/ltp/20230516-r0/lib/cloner.c /usr/src/debug/ltp/20230516-r0/include/lapi/futex.h /usr/src/debug/ltp/20230516-r0/lib/tst_sig_proc.c /usr/src/debug/ltp/20230516-r0/lib/tst_fs_type.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_net_ip_prefix.c /usr/src/debug/ltp/20230516-r0/include/lapi/name_to_handle_at.h /usr/src/debug/ltp/20230516-r0/include/lapi/ustat.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap02.c /usr/src/debug/ltp/20230516-r0/lib/tst_sys_conf.c /usr/src/debug/ltp/20230516-r0/lib/tst_cmd.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_get_median.c /usr/src/debug/ltp/20230516-r0/include/safe_stdio_fn.h /usr/src/debug/ltp/20230516-r0/lib/tst_fill_fs.c /usr/src/debug/ltp/20230516-r0/include/tst_kernel.h /usr/src/debug/ltp/20230516-r0/testcases/kernel
 /syscalls/setgroups/setgroups02.c /usr/src/debug/ltp/20230516-r0/lib/parse_opts.c /usr/src/debug/ltp/20230516-r0/lib/tst_path_has_mnt_flags.c /usr/src/debug/ltp/20230516-r0/lib/tst_rtnetlink.c /usr/src/debug/ltp/20230516-r0/include/tst_crypto.h /usr/src/debug/ltp/20230516-r0/lib/tst_kernel.c /usr/src/debug/ltp/20230516-r0/include/tst_kconfig.h /usr/src/debug/ltp/20230516-r0/include/tst_safe_posix_ipc.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/pipe/pipe08.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap01.c /usr/src/debug/ltp/20230516-r0/lib/tst_clone.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/statx/statx05.c /usr/src/debug/ltp/20230516-r0/include/tst_cpu.h /usr/src/debug/ltp/20230516-r0/lib/tst_cpu.c /usr/src/debug/ltp/20230516-r0/include/lapi/pidfd.h /usr/src/debug/ltp/20230516-r0/include/lapi/sched.h /usr/src/debug/ltp/20230516-r0/lib/tst_fs_has_free.c /usr/src/debug/ltp/20230516-r0/lib/tst_supported_fs_types.c /usr/src/debug/ltp
 /20230516-r0/lib/tst_fips.c /usr/src/debug/ltp/20230516-r0/include/tst_wallclock.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/statx/statx01.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_sleep.c /usr/src/debug/ltp/20230516-r0/include/tst_timer_test.h /usr/src/debug/ltp/20230516-r0/include/tst_safe_timerfd.h /usr/src/debug/ltp/20230516-r0/testcases/cve/stack_clash.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_fsfreeze.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_kvcmp.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mremap/mremap05.c /usr/src/debug/ltp/20230516-r0/lib/random_range.c /usr/src/debug/ltp/20230516-r0/include/parse_vdso.h /usr/src/debug/ltp/20230516-r0/testcases/cve/cve-2017-17052.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap10.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mremap/mremap01.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mremap/mremap02.c /usr/src/debug/ltp/20230516-r0/tes
 tcases/kernel/syscalls/mremap/mremap03.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mremap/mremap04.c /usr/src/debug/ltp/20230516-r0/lib/tst_memutils.c /usr/src/debug/ltp/20230516-r0/lib/tst_resource.c /usr/src/debug/ltp/20230516-r0/lib/tst_process_state.c /usr/src/debug/ltp/20230516-r0/include/lapi/io_uring.h /usr/src/debug/ltp/20230516-r0/lib/signame.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap12.c /usr/src/debug/ltp/20230516-r0/lib/safe_stdio.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/statx/statx03.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_ns_exec.c /usr/src/debug/ltp/20230516-r0/include/tst_get_bad_addr.h /usr/src/debug/ltp/20230516-r0/lib/tst_crypto.c /usr/src/debug/ltp/20230516-r0/include/tst_rtnetlink.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/statx/statx06.c /usr/src/debug/ltp/20230516-r0/lib/tst_rand_data.c /usr/src/debug/ltp/20230516-r0/lib/tst_wallclock.c /usr/src/debug/ltp/20230516-r0/lib/tlib
 io.c /usr/src/debug/ltp/20230516-r0/lib/tst_safe_macros.c /usr/src/debug/ltp/20230516-r0/testcases/cve/cve-2022-4378.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/containers/mqns/mqns_helper.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap17.c /usr/src/debug/ltp/20230516-r0/include/tst_safe_io_uring.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/pipe/pipe10.c /usr/src/debug/ltp/20230516-r0/lib/tst_pid.c /usr/src/debug/ltp/20230516-r0/lib/tst_safe_file_at.c /usr/src/debug/ltp/20230516-r0/lib/tst_test.c /usr/src/debug/ltp/20230516-r0/lib/tst_uid.c /usr/src/debug/ltp/20230516-r0/include/tst_pid.h /usr/src/debug/ltp/20230516-r0/include/tst_netlink.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/sched/cfs-scheduler/cfs_bandwidth01.c /usr/src/debug/ltp/20230516-r0/include/tst_process_state.h /usr/src/debug/ltp/20230516-r0/include/tst_safe_sysv_ipc.h /usr/src/debug/ltp/20230516-r0/testcases/cve/cve-2017-2618.c /usr/src/debug/ltp/20230516-r0/include/tst
 _path_has_mnt_flags.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap001.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/statx/statx07.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_ns_create.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap07.c /usr/src/debug/ltp/20230516-r0/include/ipcmsg.h /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_get_free_pids.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/sched/cfs-scheduler/hackbench.c /usr/src/debug/ltp/20230516-r0/include/lapi/openat2.h /usr/src/debug/ltp/20230516-r0/include/time64_variants.h /usr/src/debug/ltp/20230516-r0/lib/tst_timer.c /usr/src/debug/ltp/20230516-r0/lib/tst_clocks.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap05.c /usr/src/debug/ltp/20230516-r0/lib/tst_capability.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_supported_fs.c /usr/src/debug/ltp/20230516-r0/include/lapi/kcmp.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/stat
 x/statx09.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/containers/pidns/pidns30.c /usr/src/debug/ltp/20230516-r0/lib/tst_net.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/kvm/lib_host.c /usr/src/debug/ltp/20230516-r0/lib/tst_ansi_color.c /usr/src/debug/ltp/20230516-r0/include/tst_fs.h /usr/src/debug/ltp/20230516-r0/lib/get_path.c /usr/src/debug/ltp/20230516-r0/testcases/cve/cve-2017-2671.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/containers/pidns/pidns_helper.h /usr/src/debug/ltp/20230516-r0/lib/tst_taint.c /usr/src/debug/ltp/20230516-r0/lib/tst_tmpdir.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/faccessat/faccessat01.c /usr/src/debug/ltp/20230516-r0/include/tst_ansi_color.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/pipe/pipe07.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/statx/statx04.c /usr/src/debug/ltp/20230516-r0/include/libmsgctl.h /usr/src/debug/ltp/20230516-r0/include/libnewipc.h /usr/src/debug/ltp/20230516-r0/includ
 e/tst_cgroup.h /usr/src/debug/ltp/20230516-r0/testcases/cve/cve-2015-3290.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_get_unused_port.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/pipe/pipe03.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap11.c /usr/src/debug/ltp/20230516-r0/include/lapi/quotactl.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/containers/pidns/pidns31.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/containers/pidns/pidns32.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/containers/pidns/pidns06.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/containers/pidns/pidns10.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/containers/pidns/pidns12.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/containers/pidns/pidns13.c /usr/src/debug/ltp/20230516-r0/lib/tst_coredump.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/containers/pidns/pidns16.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/containers/pidns/pidns17.c /usr/sr
 c/debug/ltp/20230516-r0/testcases/kernel/containers/pidns/pidns20.c /usr/src/debug/ltp/20230516-r0/lib/tst_module.c /usr/src/debug/ltp/20230516-r0/include/lapi/epoll.h /usr/src/debug/ltp/20230516-r0/include/libsigwait.h /usr/src/debug/ltp/20230516-r0/lib/tst_timer_test.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap13.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/pipe/pipe12.c /usr/src/debug/ltp/20230516-r0/lib/safe_pthread.c /usr/src/debug/ltp/20230516-r0/testcases/cve/cve-2017-17053.c /usr/src/debug/ltp/20230516-r0/include/lapi/safe_rt_signal.h /usr/src/debug/ltp/20230516-r0/include/tst_memutils.h /usr/src/debug/ltp/20230516-r0/include/tst_checksum.h /usr/src/debug/ltp/20230516-r0/include/tst_fuzzy_sync.h /usr/src/debug/ltp/20230516-r0/lib/tst_fill_file.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/pipe/pipe05.c /usr/src/debug/ltp/20230516-r0/include/tst_uid.h /usr/src/debug/ltp/20230516-r0/testcases/cve/cve-2016-7117.c /usr/src/debug
 /ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap18.c /usr/src/debug/ltp/20230516-r0/include/lapi/bpf.h /usr/src/debug/ltp/20230516-r0/include/lapi/sem.h /usr/src/debug/ltp/20230516-r0/lib/tst_hugepage.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_getconf.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/statx/statx02.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_rod.c /usr/src/debug/ltp/20230516-r0/lib/tst_parse_opts.c /usr/src/debug/ltp/20230516-r0/include/tst_safe_prw.h /usr/src/debug/ltp/20230516-r0/include/tst_safe_pthread.h /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_check_kconfigs.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/containers/mqns/mqns_01.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/containers/mqns/mqns_02.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_net_vars.c /usr/src/debug/ltp/20230516-r0/include/tst_bool_expr.h /usr/src/debug/ltp/20230516-r0/lib/tst_arch.c /usr/src/debug/ltp/20230516-r0/lib/tst_buffers.c /usr/src/debug/
 ltp/20230516-r0/lib/tst_safe_io_uring.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/containers/mqns/mqns_03.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/containers/mqns/mqns_04.c /usr/src/debug/ltp/20230516-r0/include/tst_safe_clocks.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap06.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/pipe/pipe11.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_device.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_random.c /usr/src/debug/ltp/20230516-r0/include/lapi/membarrier.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap04.c /usr/src/debug/ltp/20230516-r0/include/tst_kvercmp.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/pipe/pipe01.c /usr/src/debug/ltp/20230516-r0/lib/tst_sig.c /usr/src/debug/ltp/20230516-r0/include/tst_rand_data.h", added "/usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/mmap/mmap20.c /usr/src/debug/ltp/20230929-r0/include/tst_assert.h /usr/src/d
 ebug/ltp/20230929-r0/testcases/lib/tst_sleep.c /usr/src/debug/ltp/20230929-r0/include/tst_uinput.h /usr/src/debug/ltp/20230929-r0/testcases/lib/tst_device.c /usr/src/debug/ltp/20230929-r0/include/lapi/fsmount.h /usr/src/debug/ltp/20230929-r0/testcases/lib/tst_secureboot_enabled.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/faccessat2/faccessat201.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/faccessat2/faccessat202.c /usr/src/debug/ltp/20230929-r0/include/tst_sig_proc.h /usr/src/debug/ltp/20230929-r0/testcases/lib/tst_ns_ifmove.c /usr/src/debug/ltp/20230929-r0/lib/tst_fs_link_count.c /usr/src/debug/ltp/20230929-r0/lib/tst_path_has_mnt_flags.c /usr/src/debug/ltp/20230929-r0/include/lapi/name_to_handle_at.h /usr/src/debug/ltp/20230929-r0/include/tst_process_state.h /usr/src/debug/ltp/20230929-r0/lib/tst_assert.c /usr/src/debug/ltp/20230929-r0/testcases/cve/cve-2016-10044.c /usr/src/debug/ltp/20230929-r0/testcases/lib/tst_net_ip_prefix.c /usr/src/debug/ltp/202
 30929-r0/lib/tst_clone.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/process_madvise/process_madvise01.c /usr/src/debug/ltp/20230929-r0/include/lapi/bpf.h /usr/src/debug/ltp/20230929-r0/include/lapi/pidfd.h /usr/src/debug/ltp/20230929-r0/include/lapi/sched.h /usr/src/debug/ltp/20230929-r0/include/lapi/sem.h /usr/src/debug/ltp/20230929-r0/include/lapi/epoll.h /usr/src/debug/ltp/20230929-r0/include/tst_cgroup.h /usr/src/debug/ltp/20230929-r0/include/tst_ansi_color.h /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/epoll_wait/epoll_wait01.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/epoll_wait/epoll_wait02.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/epoll_wait/epoll_wait03.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/epoll_wait/epoll_wait04.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/epoll_wait/epoll_wait05.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/epoll_wait/epoll_wait06.c /usr/src/debug/lt
 p/20230929-r0/testcases/kernel/syscalls/epoll_wait/epoll_wait07.c /usr/src/debug/ltp/20230929-r0/testcases/cve/cve-2017-16939.c /usr/src/debug/ltp/20230929-r0/include/safe_file_ops_fn.h /usr/src/debug/ltp/20230929-r0/include/lapi/ustat.h /usr/src/debug/ltp/20230929-r0/testcases/kernel/containers/mqns/mqns_02.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/containers/mqns/mqns_03.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/containers/mqns/mqns_04.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/containers/mqns/mqns_01.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/statx/statx08.c /usr/src/debug/ltp/20230929-r0/lib/tst_wallclock.c /usr/src/debug/ltp/20230929-r0/lib/tst_netdevice.c /usr/src/debug/ltp/20230929-r0/include/ipcsem.h /usr/src/debug/ltp/20230929-r0/testcases/lib/tst_check_drivers.c /usr/src/debug/ltp/20230929-r0/testcases/lib/tst_cgctl.c /usr/src/debug/ltp/20230929-r0/include/tst_safe_file_at.h /usr/src/debug/ltp/20230929-r0/lib/safe_macros.c /usr/src/de
 bug/ltp/20230929-r0/lib/safe_file_ops.c /usr/src/debug/ltp/20230929-r0/lib/tst_process_state.c /usr/src/debug/ltp/20230929-r0/lib/tst_cgroup.c /usr/src/debug/ltp/20230929-r0/include/tst_get_bad_addr.h /usr/src/debug/ltp/20230929-r0/include/lapi/faccessat.h /usr/src/debug/ltp/20230929-r0/lib/cloner.c /usr/src/debug/ltp/20230929-r0/include/safe_macros_fn.h /usr/src/debug/ltp/20230929-r0/include/tst_clone.h /usr/src/debug/ltp/20230929-r0/include/tst_epoll.h /usr/src/debug/ltp/20230929-r0/include/tst_sched.h /usr/src/debug/ltp/20230929-r0/include/tst_taint.h /usr/src/debug/ltp/20230929-r0/include/tst_timer.h /usr/src/debug/ltp/20230929-r0/testcases/cve/cve-2017-17052.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/mmap/mmap04.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/mmap/mmap14.c /usr/src/debug/ltp/20230929-r0/include/tst_kernel.h /usr/src/debug/ltp/20230929-r0/lib/tst_epoll.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/mmap/mmap02.c /usr/src/de
 bug/ltp/20230929-r0/testcases/kernel/syscalls/mmap/mmap16.c /usr/src/debug/ltp/20230929-r0/include/tst_kconfig.h /usr/src/debug/ltp/20230929-r0/lib/tst_dir_is_empty.c /usr/src/debug/ltp/20230929-r0/testcases/cve/cve-2017-2618.c /usr/src/debug/ltp/20230929-r0/include/tst_buffers.h /usr/src/debug/ltp/20230929-r0/include/tst_sys_conf.h /usr/src/debug/ltp/20230929-r0/lib/tst_fill_file.c /usr/src/debug/ltp/20230929-r0/include/lapi/quotactl.h /usr/src/debug/ltp/20230929-r0/lib/tst_af_alg.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/mmap/mmap12.c /usr/src/debug/ltp/20230929-r0/include/tst_safe_macros.h /usr/src/debug/ltp/20230929-r0/include/tst_test_macros.h /usr/src/debug/ltp/20230929-r0/include/ipcmsg.h /usr/src/debug/ltp/20230929-r0/testcases/lib/tst_rod.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/mmap/mmap06.c /usr/src/debug/ltp/20230929-r0/lib/tst_mkfs.c /usr/src/debug/ltp/20230929-r0/testcases/cve/cve-2017-2671.c /usr/src/debug/ltp/20230929-r0/testcases/k
 ernel/syscalls/mmap/mmap18.c /usr/src/debug/ltp/20230929-r0/testcases/lib/tst_ns_exec.c /usr/src/debug/ltp/20230929-r0/include/tst_safe_timerfd.h /usr/src/debug/ltp/20230929-r0/lib/tst_ioctl.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/mmap/mmap08.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/mmap/mmap10.c /usr/src/debug/ltp/20230929-r0/lib/tst_coredump.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/statx/statx06.c /usr/src/debug/ltp/20230929-r0/include/libsigwait.h /usr/src/debug/ltp/20230929-r0/include/lapi/fs.h /usr/src/debug/ltp/20230929-r0/testcases/lib/tst_random.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/statx/statx02.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/pipe/pipe11.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/statx/statx04.c /usr/src/debug/ltp/20230929-r0/lib/tst_net.c /usr/src/debug/ltp/20230929-r0/lib/tst_supported_fs_types.c /usr/src/debug/ltp/20230929-r0/include/lapi/watch_queue.h 
 /usr/src/debug/ltp/20230929-r0/include/tst_netdevice.h /usr/src/debug/ltp/20230929-r0/include/lapi/keyctl.h /usr/src/debug/ltp/20230929-r0/testcases/cve/icmp_rate_limit01.c /usr/src/debug/ltp/20230929-r0/lib/tst_fips.c /usr/src/debug/ltp/20230929-r0/include/tst_checkpoint.h /usr/src/debug/ltp/20230929-r0/include/lapi/io_uring.h /usr/src/debug/ltp/20230929-r0/include/tst_cmd.h /usr/src/debug/ltp/20230929-r0/testcases/lib/tst_getconf.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/eventfd/eventfd02.c /usr/src/debug/ltp/20230929-r0/include/tst_fuzzy_sync.h /usr/src/debug/ltp/20230929-r0/include/safe_stdio_fn.h /usr/src/debug/ltp/20230929-r0/lib/tst_timer.c /usr/src/debug/ltp/20230929-r0/lib/tst_kconfig.c /usr/src/debug/ltp/20230929-r0/lib/tst_fill_fs.c /usr/src/debug/ltp/20230929-r0/lib/tst_rand_data.c /usr/src/debug/ltp/20230929-r0/include/tst_safe_prw.h /usr/src/debug/ltp/20230929-r0/lib/tst_arch.c /usr/src/debug/ltp/20230929-r0/lib/tst_taint.c /usr/src/debug/ltp/20230929-
 r0/testcases/kernel/kvm/kvm_pagefault01.c /usr/src/debug/ltp/20230929-r0/include/tst_timer_test.h /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/faccessat/faccessat02.c /usr/src/debug/ltp/20230929-r0/lib/tst_pid.c /usr/src/debug/ltp/20230929-r0/lib/tst_uid.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/setgroups/setgroups01.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/sched/cfs-scheduler/cfs_bandwidth01.c /usr/src/debug/ltp/20230929-r0/lib/tst_buffers.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/pipe/pipe05.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/statx/statx10.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/containers/pidns/pidns05.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/containers/pidns/pidns10.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/containers/pidns/pidns01.c /usr/src/debug/ltp/20230929-r0/include/lapi/io_pgetevents.h /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/pipe/pipe07.c /usr/src/deb
 ug/ltp/20230929-r0/testcases/kernel/containers/pidns/pidns12.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/containers/pidns/pidns13.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/containers/pidns/pidns16.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/pipe/pipe13.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/mmap/mmap001.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/kvm/lib_host.c /usr/src/debug/ltp/20230929-r0/testcases/cve/meltdown.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/pipe/pipe09.c /usr/src/debug/ltp/20230929-r0/include/tst_memutils.h /usr/src/debug/ltp/20230929-r0/lib/tst_fs_type.c /usr/src/debug/ltp/20230929-r0/lib/tst_kvercmp.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/statx/statx12.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/pipe/pipe03.c /usr/src/debug/ltp/20230929-r0/testcases/lib/tst_get_median.c /usr/src/debug/ltp/20230929-r0/lib/get_path.c /usr/src/debug/ltp/20230929-r0/include/tst_fs.h
  /usr/src/debug/ltp/20230929-r0/include/tst_safe_pthread.h /usr/src/debug/ltp/20230929-r0/testcases/lib/tst_hexdump.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/eventfd/eventfd06.c /usr/src/debug/ltp/20230929-r0/include/tst_uid.h /usr/src/debug/ltp/20230929-r0/lib/safe_net.c /usr/src/debug/ltp/20230929-r0/include/lapi/rt_sigaction.h /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/pipe/pipe01.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/eventfd/eventfd04.c /usr/src/debug/ltp/20230929-r0/lib/tst_fs_has_free.c /usr/src/debug/ltp/20230929-r0/testcases/cve/cve-2017-17053.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/mmap/mmap17.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/clone3/clone301.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/clone3/clone302.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/clone3/clone303.c /usr/src/debug/ltp/20230929-r0/lib/tst_safe_sysv_ipc.c /usr/src/debug/ltp/20230929-r0/inc
 lude/libmsgctl.h /usr/src/debug/ltp/20230929-r0/include/libnewipc.h /usr/src/debug/ltp/20230929-r0/include/tst_net.h /usr/src/debug/ltp/20230929-r0/testcases/cve/tcindex01.c /usr/src/debug/ltp/20230929-r0/include/tst_cpu.h /usr/src/debug/ltp/20230929-r0/include/lapi/common_timers.h /usr/src/debug/ltp/20230929-r0/lib/tst_kernel.c /usr/src/debug/ltp/20230929-r0/lib/parse_opts.c /usr/src/debug/ltp/20230929-r0/include/tst_safe_io_uring.h /usr/src/debug/ltp/20230929-r0/include/lapi/membarrier.h /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/mmap/mmap13.c /usr/src/debug/ltp/20230929-r0/lib/safe_pthread.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/mmap/mmap15.c /usr/src/debug/ltp/20230929-r0/testcases/lib/tst_timeout_kill.c /usr/src/debug/ltp/20230929-r0/include/tst_af_alg.h /usr/src/debug/ltp/20230929-r0/include/tst_kvercmp.h /usr/src/debug/ltp/20230929-r0/lib/tst_safe_io_uring.c /usr/src/debug/ltp/20230929-r0/lib/tst_fs_setup.c /usr/src/debug/ltp/20230929-r0/testc
 ases/kernel/syscalls/mmap/mmap19.c /usr/src/debug/ltp/20230929-r0/include/lapi/fanotify.h /usr/src/debug/ltp/20230929-r0/lib/tst_safe_macros.c /usr/src/debug/ltp/20230929-r0/include/tst_device.h /usr/src/debug/ltp/20230929-r0/include/tst_module.h /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/mmap/mmap11.c /usr/src/debug/ltp/20230929-r0/lib/tst_bool_expr.c /usr/src/debug/ltp/20230929-r0/lib/tst_timer_test.c /usr/src/debug/ltp/20230929-r0/testcases/cve/cve-2016-7117.c /usr/src/debug/ltp/20230929-r0/lib/tst_device.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/containers/pidns/pidns17.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/containers/pidns/pidns20.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/containers/pidns/pidns06.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/containers/pidns/pidns30.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/containers/pidns/pidns31.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/containers/pidns/pidns32.c /usr/src/debug/lt
 p/20230929-r0/lib/tst_parse_opts.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/containers/pidns/pidns02.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/containers/pidns/pidns03.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/containers/pidns/pidns04.c /usr/src/debug/ltp/20230929-r0/testcases/lib/tst_lockdown_enabled.c /usr/src/debug/ltp/20230929-r0/include/tst_arch.h /usr/src/debug/ltp/20230929-r0/include/tst_fips.h /usr/src/debug/ltp/20230929-r0/include/tst_mkfs.h /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/setgroups/setgroups03.c /usr/src/debug/ltp/20230929-r0/include/tst_test.h /usr/src/debug/ltp/20230929-r0/testcases/kernel/sched/cfs-scheduler/hackbench.c /usr/src/debug/ltp/20230929-r0/include/lapi/init_module.h /usr/src/debug/ltp/20230929-r0/lib/tst_cmd.c /usr/src/debug/ltp/20230929-r0/testcases/lib/tst_net_iface_prefix.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/mmap/mmap05.c /usr/src/debug/ltp/20230929-r0/lib/tst_lockdown.c /usr/src/debug/l
 tp/20230929-r0/include/tst_atomic.h /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/mmap/mmap03.c /usr/src/debug/ltp/20230929-r0/lib/tst_status.c /usr/src/debug/ltp/20230929-r0/lib/tst_test.c /usr/src/debug/ltp/20230929-r0/testcases/lib/tst_ns_common.h /usr/src/debug/ltp/20230929-r0/include/tst_rand_data.h /usr/src/debug/ltp/20230929-r0/lib/tst_get_bad_addr.c /usr/src/debug/ltp/20230929-r0/include/tst_netlink.h /usr/src/debug/ltp/20230929-r0/include/lapi/ipcbuf.h /usr/src/debug/ltp/20230929-r0/include/lapi/msgbuf.h /usr/src/debug/ltp/20230929-r0/include/lapi/sembuf.h /usr/src/debug/ltp/20230929-r0/include/lapi/shmbuf.h /usr/src/debug/ltp/20230929-r0/include/libswap.h /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/mmap/mmap09.c /usr/src/debug/ltp/20230929-r0/lib/tst_checksum.c /usr/src/debug/ltp/20230929-r0/lib/tst_res.c /usr/src/debug/ltp/20230929-r0/include/lapi/readdir.h /usr/src/debug/ltp/20230929-r0/include/tst_crypto.h /usr/src/debug/ltp/20230929-r0/lib/tst_c
 heckpoint.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/mmap/mmap01.c /usr/src/debug/ltp/20230929-r0/lib/tst_module.c /usr/src/debug/ltp/20230929-r0/testcases/cve/cve-2022-4378.c /usr/src/debug/ltp/20230929-r0/include/tst_clocks.h /usr/src/debug/ltp/20230929-r0/include/tst_bool_expr.h /usr/src/debug/ltp/20230929-r0/lib/tst_cpu.c /usr/src/debug/ltp/20230929-r0/lib/tlibio.c /usr/src/debug/ltp/20230929-r0/lib/tst_memutils.c /usr/src/debug/ltp/20230929-r0/testcases/lib/tst_get_unused_port.c /usr/src/debug/ltp/20230929-r0/testcases/cve/cve-2016-7042.c /usr/src/debug/ltp/20230929-r0/lib/random_range.c /usr/src/debug/ltp/20230929-r0/testcases/lib/tst_kvcmp.c /usr/src/debug/ltp/20230929-r0/include/tst_pid.h /usr/src/debug/ltp/20230929-r0/include/time64_variants.h /usr/src/debug/ltp/20230929-r0/include/lapi/close_range.h /usr/src/debug/ltp/20230929-r0/include/tst_path_has_mnt_flags.h /usr/src/debug/ltp/20230929-r0/testcases/lib/tst_check_kconfigs.c /usr/src/debug/ltp/20230929-r0
 /include/tst_safe_clocks.h /usr/src/debug/ltp/20230929-r0/lib/tst_rtctime.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/faccessat/faccessat01.c /usr/src/debug/ltp/20230929-r0/include/tst_coredump.h /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/pipe/pipe08.c /usr/src/debug/ltp/20230929-r0/include/tst_checksum.h /usr/src/debug/ltp/20230929-r0/include/tst_wallclock.h /usr/src/debug/ltp/20230929-r0/testcases/cve/stack_clash.c /usr/src/debug/ltp/20230929-r0/lib/tst_crypto.c /usr/src/debug/ltp/20230929-r0/include/tst_capability.h /usr/src/debug/ltp/20230929-r0/include/parse_vdso.h /usr/src/debug/ltp/20230929-r0/testcases/cve/cve-2014-0196.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/eventfd/eventfd03.c /usr/src/debug/ltp/20230929-r0/include/lapi/openat2.h /usr/src/debug/ltp/20230929-r0/include/lapi/kcmp.h /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/pipe/pipe02.c /usr/src/debug/ltp/20230929-r0/lib/tst_rtnetlink.c /usr/src/debug/ltp/2023092
 9-r0/lib/tst_virt.c /usr/src/debug/ltp/20230929-r0/include/safe_net_fn.h /usr/src/debug/ltp/20230929-r0/include/tst_safe_sysv_ipc.h /usr/src/debug/ltp/20230929-r0/lib/errnos.h /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/statx/statx09.c /usr/src/debug/ltp/20230929-r0/lib/tst_sig_proc.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/process_madvise/process_madvise.h /usr/src/debug/ltp/20230929-r0/lib/tst_capability.c /usr/src/debug/ltp/20230929-r0/testcases/lib/tst_checkpoint.c /usr/src/debug/ltp/20230929-r0/lib/tst_safe_file_at.c /usr/src/debug/ltp/20230929-r0/include/tst_safe_posix_ipc.h /usr/src/debug/ltp/20230929-r0/lib/tst_clocks.c /usr/src/debug/ltp/20230929-r0/testcases/lib/tst_fsfreeze.c /usr/src/debug/ltp/20230929-r0/lib/tst_sys_conf.c /usr/src/debug/ltp/20230929-r0/include/tst_rtnetlink.h /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/mremap/mremap01.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/mremap/mremap02.c /usr/src/debug/l
 tp/20230929-r0/testcases/kernel/syscalls/mremap/mremap03.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/mremap/mremap04.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/mremap/mremap05.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/mremap/mremap06.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/eventfd/eventfd01.c /usr/src/debug/ltp/20230929-r0/include/tst_private.h /usr/src/debug/ltp/20230929-r0/include/tst_hugepage.h /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/pipe/pipe14.c /usr/src/debug/ltp/20230929-r0/lib/tst_safe_timerfd.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/setgroups/setgroups02.c /usr/src/debug/ltp/20230929-r0/testcases/lib/tst_ns_create.c /usr/src/debug/ltp/20230929-r0/lib/tst_tmpdir.c /usr/src/debug/ltp/20230929-r0/testcases/cve/cve-2015-3290.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/eventfd/eventfd05.c /usr/src/debug/ltp/20230929-r0/lib/signame.h /usr/src/debug/ltp/20230929-r0/
 testcases/kernel/sched/cfs-scheduler/starvation.c /usr/src/debug/ltp/20230929-r0/lib/safe_stdio.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/statx/statx07.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/pipe/pipe10.c /usr/src/debug/ltp/20230929-r0/testcases/lib/tst_get_free_pids.c /usr/src/debug/ltp/20230929-r0/lib/tst_hugepage.c /usr/src/debug/ltp/20230929-r0/include/lapi/safe_rt_signal.h /usr/src/debug/ltp/20230929-r0/testcases/kernel/kvm/kvm_svm03.c /usr/src/debug/ltp/20230929-r0/testcases/lib/tst_supported_fs.c /usr/src/debug/ltp/20230929-r0/lib/tst_resource.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/statx/statx03.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/statx/statx05.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/pipe/pipe12.c /usr/src/debug/ltp/20230929-r0/include/tst_checkpoint_fn.h /usr/src/debug/ltp/20230929-r0/testcases/lib/tst_net_vars.c /usr/src/debug/ltp/20230929-r0/include/tst_rtctime.h /usr/src/deb
 ug/ltp/20230929-r0/include/tst_lockdown.h /usr/src/debug/ltp/20230929-r0/lib/tst_ansi_color.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/statx/statx11.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/pipe/pipe04.c /usr/src/debug/ltp/20230929-r0/include/lapi/futex.h /usr/src/debug/ltp/20230929-r0/lib/tst_sig.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/statx/statx01.c /usr/src/debug/ltp/20230929-r0/testcases/kernel/syscalls/pipe/pipe06.c"
packages/core2-32-poky-linux/ltp/ltp-staticdev: PV changed from "20230516" to "20230929"
packages/core2-32-poky-linux/ltp/ltp-staticdev: PKGV changed from 20230516 [default] to 20230929 [default]
packages/core2-32-poky-linux/ltp/ltp: PV changed from "20230516" to "20230929"
packages/core2-32-poky-linux/ltp/ltp: PKGSIZE changed from 446328060 to 458173413 (+3%)
packages/core2-32-poky-linux/ltp/ltp: PKGV changed from 20230516 [default] to 20230929 [default]
packages/core2-32-poky-linux/ltp/ltp: FILELIST: removed "/opt/ltp/testcases/bin/mmap07 /opt/ltp/testcases/bin/setgroups04_16 /opt/ltp/testcases/bin/setgroups04", added "/opt/ltp/testcases/bin/process_madvise01 /opt/ltp/testcases/bin/tst_secureboot_enabled /opt/ltp/bin/create-tarballs-metadata.sh /opt/ltp/testcases/bin/tcindex01 /opt/ltp/testcases/bin/faccessat201 /opt/ltp/testcases/bin/faccessat202 /opt/ltp/testcases/bin/epoll_wait06 /opt/ltp/testcases/bin/epoll_wait07 /opt/ltp/testcases/bin/epoll_wait05 /opt/ltp/testcases/bin/kvm_svm03 /opt/ltp/testcases/bin/kvm_svm02 /opt/ltp/testcases/bin/mremap06 /opt/ltp/testcases/bin/eventfd06 /opt/ltp/testcases/bin/eventfd04 /opt/ltp/testcases/bin/eventfd05 /opt/ltp/testcases/bin/eventfd02 /opt/ltp/testcases/bin/eventfd03 /opt/ltp/testcases/bin/clone303 /opt/ltp/testcases/bin/tst_lockdown_enabled /opt/ltp/bin/lib.sh /opt/ltp/testcases/bin/pipe14 /opt/ltp/testcases/bin/faccessat02 /opt/ltp/bin/tag-release.sh /opt/ltp/testcases/bin/starvation /o
 pt/ltp/testcases/bin/statx11 /opt/ltp/testcases/bin/statx10 /opt/ltp/testcases/bin/statx12"
Changes to packages/core2-32-poky-linux/ltp (sysroot):
  /opt/ltp/include/ipcshm.h was removed

--===============6813722452170179648==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ltp-upgrade-20230516-20230929.patch"

RnJvbSA2N2UyYmU4ZjhhYjYzMjcwYTQ0YWQxMjdjZjA2YThiYzFjZjM5ODFiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgT2N0IDIwMjMgMTU6MTA6MzQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
dHA6IHVwZ3JhZGUgMjAyMzA1MTYgLT4gMjAyMzA5MjkKCi0tLQogbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL2x0cC97bHRwXzIwMjMwNTE2LmJiID0+IGx0cF8yMDIzMDkyOS5iYn0gfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvbHRwL3tsdHBfMjAyMzA1MTYuYmIgPT4gbHRwXzIwMjMwOTI5LmJifSAo
OTklKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9sdHAvbHRwXzIwMjMwNTE2
LmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2x0cC9sdHBfMjAyMzA5MjkuYmIKc2ltaWxhcml0
eSBpbmRleCA5OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2x0cC9sdHBfMjAy
MzA1MTYuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9sdHAvbHRwXzIwMjMwOTI5
LmJiCmluZGV4IDRkMTMyYjc2MWEuLjVjNDMzNDY4ODMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1leHRlbmRlZC9sdHAvbHRwXzIwMjMwNTE2LmJiCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRl
ZC9sdHAvbHRwXzIwMjMwOTI5LmJiCkBAIC0yNCw3ICsyNCw3IEBAIFRVTkVfQ0NBUkdTOnJlbW92
ZTp4ODYtNjQgPSAiLW1mcG1hdGg9c3NlIgogCiBDRkxBR1M6YXBwZW5kOnBvd2VycGM2NCA9ICIg
LURfX1NBTkVfVVNFUlNQQUNFX1RZUEVTX18iCiBDRkxBR1M6YXBwZW5kOm1pcHNhcmNobjY0ID0g
IiAtRF9fU0FORV9VU0VSU1BBQ0VfVFlQRVNfXyIKLVNSQ1JFViA9ICIzZWJjMmRmYTg1YzI0NDVi
YjY4ZDhjMGQ2NmUzM2M0ZGExZTFiM2E3IgorU1JDUkVWID0gIjExMGQzYmU2YTljNTg2NzRkZTNl
MzY2Yjk2YTcwZjAxMjlhNWQyOTkiCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9saW51
eC10ZXN0LXByb2plY3QvbHRwLmdpdDticmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzIFwKICAg
ICAgICAgICAgZmlsZTovLzAwMDEtUmVtb3ZlLU9PTS10ZXN0cy1mcm9tLXJ1bnRlc3QtbW0ucGF0
Y2ggXAotLSAKMi4zOS4yCgo=

--===============6813722452170179648==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (0 cached, 912 parsed). 1845 targets, 71 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-564a8cef8aee3d8209967e69579552abdfae791a"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:564a8cef8aee3d8209967e69579552abdfae791a"
workspace            = "master:988dc0dea4398e77a7d7862d4655a9b1f5eaa06d"

Initialising tasks...done.
Sstate summary: Wanted 207 Local 72 Mirrors 0 Missed 135 Current 903 (34% match, 87% complete)
Removing 5 stale sstate objects for arch qemuppc...done.
Removing 3 stale sstate objects for arch ppc7400...done.
NOTE: Executing Tasks
NOTE: Running setscene task 909 of 1110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 913 of 1110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 934 of 1110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1005 of 1110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1014 of 1110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1059 of 1110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_spdx_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe btrfs-tools-6.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe systemd-1_254.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1090 of 1110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 1091 of 1110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_create_spdx_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/btrfs-tools/6.5.1/temp/log.do_packagedata_setscene.2083128
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1092 of 1110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.1.bb:do_package_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glibc-2.38+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe systemd-1_254.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_create_spdx_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/libnsl2/2.0.0/temp/log.do_packagedata_setscene.2083448
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1097 of 1110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_setscene)
NOTE: Running setscene task 1099 of 1110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1424 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_recipe_qa)
NOTE: recipe libnsl2-2.0.0-r0: task do_package_setscene: Started
NOTE: recipe btrfs-tools-6.5.1-r0: task do_package_setscene: Started
NOTE: Running task 1618 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1652 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_recipe_qa)
NOTE: recipe tcl-8.6.13-r0: task do_recipe_qa: Started
NOTE: Running task 1675 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.8.0.bb:do_recipe_qa)
NOTE: Running task 1838 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_recipe_qa)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa: Started
NOTE: Running task 1888 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_recipe_qa)
NOTE: Running task 1890 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.13.bb:do_recipe_qa)
NOTE: Running task 1891 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_recipe_qa)
NOTE: Running task 1892 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_recipe_qa)
NOTE: recipe libnl-1_3.8.0-r0: task do_recipe_qa: Started
NOTE: recipe tcl-8.6.13-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1969 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_recipe_qa)
NOTE: Running task 1971 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_recipe_qa)
NOTE: recipe libnsl2-2.0.0-r0: task do_package_setscene: Succeeded
NOTE: Running task 1984 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_fetch)
NOTE: Running setscene task 1103 of 1110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1104 of 1110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1105 of 1110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 2029 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb:do_recipe_qa)
NOTE: Running task 2040 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.4.bb:do_populate_sysroot)
NOTE: recipe gawk-5.2.2-r0: task do_recipe_qa: Started
NOTE: Running task 2047 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_recipe_qa)
NOTE: Running task 2060 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230929.bb:do_recipe_qa)
NOTE: recipe logrotate-3.21.0-r0: task do_recipe_qa: Started
NOTE: recipe gzip-1.13-r0: task do_recipe_qa: Started
NOTE: recipe cpio-2.14-r0: task do_recipe_qa: Started
NOTE: recipe expect-5.45.4-r0: task do_recipe_qa: Started
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_recipe_qa: Started
NOTE: Running task 2116 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_fetch)
NOTE: recipe libnl-1_3.8.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2134 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_recipe_qa)
NOTE: Running task 2135 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.2.bb:do_recipe_qa)
NOTE: Running task 2136 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_recipe_qa)
NOTE: Running task 2137 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_recipe_qa)
NOTE: Running task 2156 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.8.0.bb:do_fetch)
NOTE: recipe tcl-8.6.13-r0: task do_fetch: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe liburcu-0.14.0-r0: task do_recipe_qa: Started
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_recipe_qa: Started
NOTE: recipe tcl-8.6.13-r0: task do_fetch: Succeeded
NOTE: Running task 2234 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_unpack)
NOTE: Running task 2235 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe liberror-perl-0.17029-r0: task do_recipe_qa: Started
NOTE: recipe ltp-20230929-r0: task do_recipe_qa: Started
NOTE: recipe gawk-5.2.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_populate_sysroot: Started
NOTE: Running task 2292 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_fetch)
NOTE: recipe logrotate-3.21.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_recipe_qa: Started
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Started
NOTE: recipe btrfs-tools-6.5.1-r0: task do_package_setscene: Succeeded
NOTE: Running task 2340 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_fetch)
NOTE: recipe quota-4.09-r0: task do_recipe_qa: Started
NOTE: recipe gzip-1.13-r0: task do_recipe_qa: Succeeded
NOTE: recipe gdb-13.2-r0: task do_recipe_qa: Started
NOTE: recipe expect-5.45.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1107 of 1110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe cpio-2.14-r0: task do_recipe_qa: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_recipe_qa: Started
NOTE: recipe libaio-0.3.113-r0: task do_recipe_qa: Succeeded
NOTE: recipe libnl-1_3.8.0-r0: task do_fetch: Started
NOTE: Running task 2362 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.13.bb:do_fetch)
NOTE: Running task 2363 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_fetch)
NOTE: Running task 2364 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_fetch)
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Succeeded
NOTE: Running task 2379 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_fetch)
NOTE: Running task 2385 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_unpack)
NOTE: Running task 2386 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_prepare_recipe_sysroot)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/libtirpc/1.3.3/temp/log.do_packagedata_setscene.2084070
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1108 of 1110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_package_setscene)
NOTE: recipe libnl-1_3.8.0-r0: task do_fetch: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_unpack: Started
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe liburcu-0.14.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2398 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.8.0.bb:do_unpack)
NOTE: recipe liberror-perl-0.17029-r0: task do_recipe_qa: Succeeded
NOTE: recipe ltp-20230929-r0: task do_recipe_qa: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_fetch: Started
NOTE: Running task 2399 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_fetch)
NOTE: recipe logrotate-3.21.0-r0: task do_fetch: Started
NOTE: Running task 2400 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb:do_fetch)
NOTE: Running task 2401 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_fetch)
NOTE: Running task 2402 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230929.bb:do_fetch)
NOTE: recipe btrfs-tools-6.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe net-tools-2.10-r0: task do_recipe_qa: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_fetch: Started
NOTE: recipe gawk-5.2.2-r0: task do_fetch: Succeeded
NOTE: Running task 2412 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_fetch)
NOTE: recipe gdb-13.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe quota-4.09-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2416 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_unpack)
NOTE: recipe gzip-1.13-r0: task do_fetch: Started
NOTE: Running task 2417 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe cpio-2.14-r0: task do_fetch: Started
NOTE: recipe logrotate-3.21.0-r0: task do_fetch: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2418 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_unpack)
NOTE: Running task 2419 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.2.bb:do_fetch)
NOTE: Running task 2420 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_fetch)
NOTE: recipe expect-5.45.4-r0: task do_fetch: Started
NOTE: recipe gzip-1.13-r0: task do_fetch: Succeeded
NOTE: recipe cpio-2.14-r0: task do_fetch: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Started
NOTE: recipe cronie-1.6.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2443 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_unpack)
NOTE: Running task 2444 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.13.bb:do_unpack)
NOTE: Running task 2445 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 2446 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_fetch)
NOTE: recipe expect-5.45.4-r0: task do_fetch: Succeeded
NOTE: Running task 2471 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_unpack)
NOTE: recipe libaio-0.3.113-r0: task do_fetch: Succeeded
NOTE: Running task 2477 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe btrfs-tools-6.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe liburcu-0.14.0-r0: task do_fetch: Started
NOTE: Running task 2478 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libnl-1_3.8.0-r0: task do_unpack: Started
NOTE: recipe ltp-20230929-r0: task do_fetch: Started
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_fetch: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_fetch: Started
NOTE: Running task 2479 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_unpack)
NOTE: recipe net-tools-2.10-r0: task do_fetch: Started
NOTE: recipe liburcu-0.14.0-r0: task do_fetch: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_package_setscene: Started
NOTE: Running task 2480 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_unpack)
NOTE: recipe liberror-perl-0.17029-r0: task do_fetch: Succeeded
NOTE: Running task 2481 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_patch)
NOTE: Running task 2482 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_fetch: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_unpack: Started
NOTE: Running task 2483 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_unpack)
NOTE: Running task 2484 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdb-13.2-r0: task do_fetch: Started
NOTE: Running task 2485 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb:do_unpack)
NOTE: Running task 2486 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_prepare_recipe_sysroot)
NOTE: recipe quota-4.09-r0: task do_fetch: Started
NOTE: recipe logrotate-3.21.0-r0: task do_unpack: Started
NOTE: recipe gawk-5.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe quota-4.09-r0: task do_fetch: Succeeded
NOTE: Running task 2523 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_unpack)
NOTE: recipe gdb-13.2-r0: task do_fetch: Succeeded
NOTE: Running task 2526 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.4.bb:do_collect_spdx_deps)
NOTE: recipe gzip-1.13-r0: task do_unpack: Started
NOTE: recipe cronie-1.6.1-r0: task do_fetch: Started
NOTE: recipe gzip-1.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnl-1_3.8.0-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe ltp-20230929-r0: task do_fetch: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_fetch: Succeeded
NOTE: Running task 2527 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.2.bb:do_unpack)
NOTE: Running task 2542 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.8.0.bb:do_patch)
NOTE: recipe cronie-1.6.1-r0: task do_fetch: Succeeded
NOTE: recipe cpio-2.14-r0: task do_unpack: Started
NOTE: recipe expect-5.45.4-r0: task do_unpack: Started
NOTE: Running task 2543 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230929.bb:do_unpack)
NOTE: Running task 2544 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_unpack)
NOTE: Running task 2545 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: Running task 2546 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_unpack)
NOTE: recipe libaio-0.3.113-r0: task do_unpack: Started
NOTE: recipe liburcu-0.14.0-r0: task do_unpack: Started
NOTE: recipe liburcu-0.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2577 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_collect_spdx_deps)
NOTE: recipe libaio-0.3.113-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_unpack: Started
NOTE: recipe tcl-8.6.13-r0: task do_unpack: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2611 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_patch)
NOTE: Running task 2613 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_collect_spdx_deps)
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Started
NOTE: recipe gzip-1.13-r0: task do_unpack: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_unpack: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_unpack: Started
NOTE: Running task 2614 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.13.bb:do_patch)
NOTE: Running task 2615 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_collect_spdx_deps)
NOTE: recipe tcl-8.6.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2616 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_patch)
NOTE: Running task 2617 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_collect_spdx_deps)
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe quota-4.09-r0: task do_unpack: Started
NOTE: recipe net-tools-2.10-r0: task do_unpack: Started
NOTE: recipe libnl-1_3.8.0-r0: task do_patch: Started
NOTE: recipe expect-5.45.4-r0: task do_unpack: Succeeded
NOTE: recipe gdb-13.2-r0: task do_unpack: Started
NOTE: recipe net-tools-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_unpack: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2628 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_patch)
NOTE: Running task 2635 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_collect_spdx_deps)
NOTE: recipe ltp-20230929-r0: task do_unpack: Started
NOTE: recipe cpio-2.14-r0: task do_unpack: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_unpack: Started
NOTE: Running task 2636 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_patch)
NOTE: Running task 2637 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_patch)
NOTE: Running task 2638 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_collect_spdx_deps)
NOTE: recipe quota-4.09-r0: task do_unpack: Succeeded
NOTE: Running task 2639 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_patch)
NOTE: Running task 2641 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.13.bb:do_collect_spdx_deps)
NOTE: recipe gawk-5.2.2-r0: task do_unpack: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_patch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2642 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_patch)
NOTE: Running task 2643 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_collect_spdx_deps)
NOTE: recipe gzip-1.13-r0: task do_patch: Started
NOTE: recipe libmnl-1.0.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe coreutils-9.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2644 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_collect_spdx_deps)
NOTE: recipe cronie-1.6.1-r0: task do_unpack: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2645 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.4.bb:do_create_spdx)
NOTE: recipe iptables-1.8.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe logrotate-3.21.0-r0: task do_patch: Started
NOTE: recipe libnl-1_3.8.0-r0: task do_patch: Succeeded
NOTE: recipe liburcu-0.14.0-r0: task do_unpack: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_patch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_package_setscene: Succeeded
NOTE: Running task 2646 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.8.0.bb:do_deploy_source_date_epoch)
NOTE: Running setscene task 1110 of 1110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_recipe_qa_setscene)
NOTE: Running task 2647 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_patch)
NOTE: recipe coreutils-9.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gzip-1.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe cpio-2.14-r0: task do_patch: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_patch: Started
NOTE: recipe unzip-1_6.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe tcl-8.6.13-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2648 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_patch)
NOTE: Running task 2649 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_deploy_source_date_epoch)
NOTE: recipe quota-4.09-r0: task do_patch: Started
NOTE: Running task 2650 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmnl-1.0.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_patch: Succeeded
NOTE: Running task 2651 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_collect_spdx_deps)
NOTE: recipe gzip-1.13-r0: task do_collect_spdx_deps: Started
NOTE: recipe gawk-5.2.2-r0: task do_patch: Started
NOTE: Running task 2652 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2653 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_create_spdx)
NOTE: recipe gawk-5.2.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe which-2.21-r0: task do_collect_spdx_deps: Started
NOTE: recipe liburcu-0.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2656 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_create_spdx)
NOTE: recipe bc-1.07.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libnl-1_3.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gzip-1.13-r0: task do_patch: Succeeded
NOTE: Running task 2657 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_collect_spdx_deps)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_patch: Succeeded
NOTE: recipe liburcu-0.14.0-r0: task do_patch: Started
NOTE: recipe cronie-1.6.1-r0: task do_patch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 34fff22e2bc2c145474f300a720d34bab0464b25d267c599ce9d66c85fe70567
NOTE: recipe gawk-5.2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe which-2.21-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gzip-1.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_create_spdx: Started
NOTE: Running task 2662 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2663 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_populate_sysroot)
NOTE: recipe cpio-2.14-r0: task do_patch: Succeeded
NOTE: recipe liburcu-0.14.0-r0: task do_patch: Succeeded
NOTE: recipe liburcu-0.14.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2664 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 2665 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libaio-0.3.113-r0: task do_unpack: Succeeded
NOTE: Running task 2666 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_patch)
NOTE: Running task 2667 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 2668 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2669 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_collect_spdx_deps)
NOTE: recipe quota-4.09-r0: task do_patch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmnl-1.0.5-r0: task do_create_spdx: Started
NOTE: Setscene tasks completed
NOTE: recipe logrotate-3.21.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iptables-1.8.9-r0: task do_create_spdx: Started
NOTE: recipe liburcu-0.14.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2708 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata)
NOTE: Running task 2733 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe liberror-perl-0.17029-r0: task do_patch: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2739 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_deploy_source_date_epoch)
NOTE: Running task 2754 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_create_spdx)
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_unpack: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_populate_sysroot: Started
NOTE: recipe libaio-0.3.113-r0: task do_patch: Started
NOTE: Running task 2755 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb:do_patch)
NOTE: Running task 2756 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_deploy_source_date_epoch)
NOTE: recipe net-tools-2.10-r0: task do_unpack: Succeeded
NOTE: Running task 2757 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_patch)
NOTE: Running task 2758 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_collect_spdx_deps)
NOTE: recipe cronie-1.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe liburcu-0.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2759 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_create_spdx)
NOTE: recipe gzip-1.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnl-1_3.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_patch: Succeeded
NOTE: Running task 2761 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_create_spdx)
NOTE: recipe cpio-2.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tcl-8.6.13-r0: task do_patch: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata: Started
NOTE: Running task 2762 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 2763 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2768 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_package_write_rpm)
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe quota-4.09-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2769 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_configure)
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2770 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_create_spdx)
NOTE: recipe logrotate-3.21.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bc-1.07.1-r0: task do_create_spdx: Started
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_patch: Started
NOTE: Running task 2771 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm)
NOTE: recipe net-tools-2.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe net-tools-2.10-r0: task do_patch: Started
NOTE: recipe libaio-0.3.113-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_create_spdx: Started
NOTE: Running task 2772 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm)
NOTE: recipe which-2.21-r0: task do_create_spdx: Started
NOTE: recipe tcl-8.6.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cronie-1.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Started
NOTE: recipe logrotate-3.21.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_patch: Succeeded
NOTE: Running task 2776 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_configure)
NOTE: recipe gawk-5.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gzip-1.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 2777 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_configure)
NOTE: Running task 2778 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_deploy_source_date_epoch)
NOTE: recipe liburcu-0.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_patch: Succeeded
NOTE: recipe file-5.45-r0: task do_package_write_rpm: Started
NOTE: Running task 2779 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.13.bb:do_configure)
NOTE: Running task 2780 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_configure)
NOTE: recipe findutils-4.9.0-r0: task do_create_spdx: Started
NOTE: recipe cpio-2.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_patch: Succeeded
NOTE: Running task 2781 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 2782 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_deploy_source_date_epoch)
NOTE: recipe unzip-1_6.0-r0: task do_package_write_rpm: Started
NOTE: recipe which-2.21-r0: task do_package_write_rpm: Started
NOTE: recipe quota-4.09-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2783 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_configure)
NOTE: Running task 2785 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata)
NOTE: recipe tcl-8.6.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_configure: Started
NOTE: recipe logrotate-3.21.0-r0: task do_configure: Started
NOTE: Running task 2788 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_configure)
NOTE: recipe libaio-0.3.113-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_patch: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gzip-1.13-r0: task do_configure: Started
NOTE: recipe net-tools-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2789 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb:do_deploy_source_date_epoch)
NOTE: recipe expect-5.45.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liburcu-0.14.0-r0: task do_configure: Started
NOTE: recipe cronie-1.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2790 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_configure)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2791 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_create_spdx: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_configure: Started
NOTE: Running task 2792 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe which-2.21-r0: task do_create_spdx: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2793 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata: Started
NOTE: recipe tcl-8.6.13-r0: task do_configure: Started
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ltp-20230929-r0: task do_unpack: Succeeded
NOTE: Running task 2794 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230929.bb:do_patch)
NOTE: recipe net-tools-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_configure: Started
NOTE: recipe expect-5.45.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2795 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_configure)
NOTE: recipe unzip-1_6.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: Running task 2796 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_configure)
NOTE: recipe cpio-2.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mdadm-4.2-r0: task do_configure: Started
NOTE: recipe net-tools-2.10-r0: task do_configure: Started
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_configure: Started
NOTE: recipe ltp-20230929-r0: task do_patch: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2816 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_collect_spdx_deps)
NOTE: Running task 2819 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.1.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Running task 2821 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.5.0.bb:do_package_write_rpm)
NOTE: recipe net-tools-2.10-r0: task do_configure: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_configure: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 200bb33903ec133f456f3590c1839eabe64198ee0b7808a12285742dded5600b
NOTE: recipe liberror-perl-0.17029-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2822 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_compile)
NOTE: Running task 2831 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: Running task 2832 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_configure_ptest_base)
NOTE: recipe tcp-wrappers-7.6-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2833 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_compile)
NOTE: Running task 2835 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm)
NOTE: Running task 2838 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.4.bb:do_package_write_rpm)
NOTE: recipe cpio-2.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2839 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_configure)
NOTE: recipe btrfs-tools-6.5.1-r0: task do_packagedata: Started
NOTE: Running task 2840 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.4.0.bb:do_package_write_rpm)
NOTE: Running task 2842 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_package_write_rpm)
NOTE: recipe libaio-0.3.113-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe iproute2-6.5.0-r0: task do_package_write_rpm: Started
NOTE: Running task 2843 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_create_spdx)
NOTE: recipe net-tools-2.10-r0: task do_compile: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_configure_ptest_base: Started
NOTE: recipe ltp-20230929-r0: task do_patch: Succeeded
NOTE: Running task 2844 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_package_write_rpm)
NOTE: Running task 2845 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230929.bb:do_deploy_source_date_epoch)
NOTE: Running task 2846 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230929.bb:do_populate_lic)
NOTE: recipe liberror-perl-0.17029-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Started
NOTE: recipe which-2.21-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2847 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_compile)
NOTE: recipe cpio-2.14-r0: task do_configure: Started
NOTE: recipe procps-4.0.4-r0: task do_package_write_rpm: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_create_spdx: Started
NOTE: recipe ltp-20230929-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ltp-20230929-r0: task do_populate_lic: Started
NOTE: recipe curl-8.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe findutils-4.9.0-r0: task do_package_write_rpm: Started
NOTE: recipe libaio-0.3.113-r0: task do_compile: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_compile: Started
NOTE: Running task 2848 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_install)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: recipe btrfs-tools-6.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2855 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.4.bb:do_collect_spdx_deps)
NOTE: Running task 2856 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_collect_spdx_deps)
NOTE: recipe findutils-4.9.0-r0: task do_create_spdx: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_configure: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_install: Started
NOTE: Running task 2857 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure_ptest_base)
NOTE: recipe ltp-20230929-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2858 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_collect_spdx_deps)
NOTE: recipe ltp-20230929-r0: task do_populate_lic: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_compile: Succeeded
NOTE: Running task 2859 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_compile_ptest_base)
NOTE: recipe cpio-2.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Started
NOTE: recipe cronie-1.6.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2860 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile)
NOTE: recipe cpio-2.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_install: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_compile_ptest_base: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 2861 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package)
NOTE: recipe cronie-1.6.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2862 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_populate_sysroot)
NOTE: recipe procps-4.0.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2863 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.4.bb:do_create_spdx)
NOTE: recipe liberror-perl-0.17029-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2864 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install)
NOTE: recipe libaio-0.3.113-r0: task do_populate_sysroot: Started
NOTE: recipe mdadm-4.2-r0: task do_compile: Started
NOTE: recipe libaio-0.3.113-r0: task do_package: Started
NOTE: recipe procps-4.0.4-r0: task do_create_spdx: Started
NOTE: recipe gdb-13.2-r0: task do_unpack: Succeeded
NOTE: Running task 2865 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.2.bb:do_patch)
NOTE: recipe liberror-perl-0.17029-r0: task do_install: Started
NOTE: recipe iptables-1.8.9-r0: task do_create_spdx: Succeeded
NOTE: Running task 2866 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.5.0.bb:do_collect_spdx_deps)
NOTE: recipe gdb-13.2-r0: task do_patch: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe iproute2-6.5.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libaio-0.3.113-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2867 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230929.bb:do_prepare_recipe_sysroot)
NOTE: recipe iproute2-6.5.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe ltp-20230929-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2868 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.5.0.bb:do_create_spdx)
NOTE: recipe liberror-perl-0.17029-r0: task do_install: Succeeded
NOTE: Running task 2869 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install_ptest_base)
NOTE: recipe iproute2-6.5.0-r0: task do_create_spdx: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_install_ptest_base: Started
NOTE: recipe ltp-20230929-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2870 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230929.bb:do_configure)
NOTE: recipe liberror-perl-0.17029-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2871 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install_ptest_perl)
NOTE: recipe ltp-20230929-r0: task do_configure: Started
NOTE: recipe gdb-13.2-r0: task do_patch: Succeeded
NOTE: Running task 2872 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.2.bb:do_deploy_source_date_epoch)
NOTE: recipe procps-4.0.4-r0: task do_create_spdx: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_install_ptest_perl: Started
NOTE: recipe gdb-13.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_install_ptest_perl: Succeeded
NOTE: Running task 2873 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package)
NOTE: recipe liberror-perl-0.17029-r0: task do_package: Started
NOTE: recipe gdb-13.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe iproute2-6.5.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_package: Succeeded
NOTE: Running task 2874 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_packagedata)
NOTE: recipe libaio-0.3.113-r0: task do_packagedata: Started
NOTE: recipe procps-4.0.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_packagedata: Succeeded
NOTE: Running task 2875 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_create_spdx)
NOTE: Running task 2876 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package_write_rpm)
NOTE: recipe libaio-0.3.113-r0: task do_create_spdx: Started
NOTE: recipe libaio-0.3.113-r0: task do_package_write_rpm: Started
NOTE: recipe libaio-0.3.113-r0: task do_create_spdx: Succeeded
NOTE: Running task 2877 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230929.bb:do_collect_spdx_deps)
NOTE: recipe ltp-20230929-r0: task do_collect_spdx_deps: Started
NOTE: recipe ltp-20230929-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package: Succeeded
NOTE: Running task 2878 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata)
NOTE: recipe libaio-0.3.113-r0: task do_package_write_rpm: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata: Started
NOTE: recipe findutils-4.9.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe file-5.45-r0: task do_package_write_rpm: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_configure: Succeeded
NOTE: Running task 2879 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_configure_ptest_base)
NOTE: recipe iproute2-6.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_configure_ptest_base: Started
NOTE: recipe logrotate-3.21.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2880 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_compile)
NOTE: recipe logrotate-3.21.0-r0: task do_compile: Started
NOTE: recipe mdadm-4.2-r0: task do_compile: Succeeded
NOTE: Running task 2881 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Started
NOTE: recipe cronie-1.6.1-r0: task do_configure: Succeeded
NOTE: Running task 2882 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_compile)
NOTE: recipe cronie-1.6.1-r0: task do_compile: Started
NOTE: recipe logrotate-3.21.0-r0: task do_compile: Succeeded
NOTE: Running task 2883 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_compile_ptest_base)
NOTE: recipe logrotate-3.21.0-r0: task do_compile_ptest_base: Started
NOTE: recipe logrotate-3.21.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2884 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2885 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install)
NOTE: recipe logrotate-3.21.0-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_install: Started
NOTE: recipe cronie-1.6.1-r0: task do_compile: Succeeded
NOTE: Running task 2886 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_install)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_package_write_rpm unihash changed to eb393b971920b41ff46f101d66fed1c3c9dcaf8c2f4f95cabd77e3686d4082f0
NOTE: recipe cronie-1.6.1-r0: task do_install: Started
NOTE: recipe logrotate-3.21.0-r0: task do_install: Succeeded
NOTE: Running task 2887 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_install_ptest_base)
NOTE: recipe logrotate-3.21.0-r0: task do_install_ptest_base: Started
NOTE: recipe cronie-1.6.1-r0: task do_install: Succeeded
NOTE: Running task 2888 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_package)
NOTE: recipe mdadm-4.2-r0: task do_install: Succeeded
NOTE: Running task 2889 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install_ptest_base)
NOTE: recipe logrotate-3.21.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2890 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_package)
NOTE: recipe cronie-1.6.1-r0: task do_package: Started
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Started
NOTE: recipe logrotate-3.21.0-r0: task do_package: Started
NOTE: recipe net-tools-2.10-r0: task do_compile: Succeeded
NOTE: Running task 2891 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2892 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_package)
NOTE: recipe net-tools-2.10-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_package: Started
NOTE: recipe tcl-8.6.13-r0: task do_configure: Succeeded
NOTE: Running task 2893 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_configure_ptest_base)
NOTE: recipe tcl-8.6.13-r0: task do_configure_ptest_base: Started
NOTE: recipe tcl-8.6.13-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2894 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_compile)
NOTE: recipe tcl-8.6.13-r0: task do_compile: Started
NOTE: recipe coreutils-9.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 2895 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_collect_spdx_deps)
NOTE: recipe logrotate-3.21.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe logrotate-3.21.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_install: Succeeded
NOTE: Running task 2896 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_package)
NOTE: recipe net-tools-2.10-r0: task do_package: Started
NOTE: recipe cronie-1.6.1-r0: task do_package: Succeeded
NOTE: Running task 2897 of 3016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_packagedata)
NOTE: recipe cronie-1.6.1-r0: task do_packagedata: Started
NOTE: recipe cronie-1.6.1-r0: task do_packagedata: Failed
NOTE: recipe curl-8.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_package: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_package: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_package: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Succeeded
NOTE: recipe liburcu-0.14.0-r0: task do_configure: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_compile: Succeeded
NOTE: recipe gzip-1.13-r0: task do_configure: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_configure: Succeeded
NOTE: recipe ltp-20230929-r0: task do_configure: Succeeded
NOTE: recipe cpio-2.14-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2897 tasks of which 2699 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_packagedata
Summary: There were 32 ERROR messages, returning a non-zero exit code.
ERROR: btrfs-tools-6.5.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-src went backwards which would break package feeds (from 0:6.5.2-r0 to 0:6.5.1-r0) [version-going-backwards]
ERROR: btrfs-tools-6.5.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-dbg went backwards which would break package feeds (from 0:6.5.2-r0 to 0:6.5.1-r0) [version-going-backwards]
ERROR: btrfs-tools-6.5.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-staticdev went backwards which would break package feeds (from 0:6.5.2-r0 to 0:6.5.1-r0) [version-going-backwards]
ERROR: btrfs-tools-6.5.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-dev went backwards which would break package feeds (from 0:6.5.2-r0 to 0:6.5.1-r0) [version-going-backwards]
ERROR: btrfs-tools-6.5.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-doc went backwards which would break package feeds (from 0:6.5.2-r0 to 0:6.5.1-r0) [version-going-backwards]
ERROR: btrfs-tools-6.5.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-locale went backwards which would break package feeds (from 0:6.5.2-r0 to 0:6.5.1-r0) [version-going-backwards]
ERROR: btrfs-tools-6.5.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools went backwards which would break package feeds (from 0:6.5.2-r0 to 0:6.5.1-r0) [version-going-backwards]
ERROR: btrfs-tools-6.5.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: libnsl2-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package libnsl2-src went backwards which would break package feeds (from 0:2.0.1-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: libnsl2-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package libnsl2-dbg went backwards which would break package feeds (from 0:2.0.1-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: libnsl2-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package libnsl2-staticdev went backwards which would break package feeds (from 0:2.0.1-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: libnsl2-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package libnsl2-dev went backwards which would break package feeds (from 0:2.0.1-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: libnsl2-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package libnsl2-doc went backwards which would break package feeds (from 0:2.0.1-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: libnsl2-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package libnsl2-locale went backwards which would break package feeds (from 0:2.0.1-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: libnsl2-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package libnsl2 went backwards which would break package feeds (from 0:2.0.1-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: libnsl2-2.0.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: libtirpc-1.3.3-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-src went backwards which would break package feeds (from 0:1.3.4-r0 to 0:1.3.3-r0) [version-going-backwards]
ERROR: libtirpc-1.3.3-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-dbg went backwards which would break package feeds (from 0:1.3.4-r0 to 0:1.3.3-r0) [version-going-backwards]
ERROR: libtirpc-1.3.3-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-staticdev went backwards which would break package feeds (from 0:1.3.4-r0 to 0:1.3.3-r0) [version-going-backwards]
ERROR: libtirpc-1.3.3-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-dev went backwards which would break package feeds (from 0:1.3.4-r0 to 0:1.3.3-r0) [version-going-backwards]
ERROR: libtirpc-1.3.3-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-doc went backwards which would break package feeds (from 0:1.3.4-r0 to 0:1.3.3-r0) [version-going-backwards]
ERROR: libtirpc-1.3.3-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-locale went backwards which would break package feeds (from 0:1.3.4-r0 to 0:1.3.3-r0) [version-going-backwards]
ERROR: libtirpc-1.3.3-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc went backwards which would break package feeds (from 0:1.3.4-r0 to 0:1.3.3-r0) [version-going-backwards]
ERROR: libtirpc-1.3.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: cronie-1.6.1-r0 do_packagedata: QA Issue: Package version for package cronie-src went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1-r0) [version-going-backwards]
ERROR: cronie-1.6.1-r0 do_packagedata: QA Issue: Package version for package cronie-dbg went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1-r0) [version-going-backwards]
ERROR: cronie-1.6.1-r0 do_packagedata: QA Issue: Package version for package cronie-staticdev went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1-r0) [version-going-backwards]
ERROR: cronie-1.6.1-r0 do_packagedata: QA Issue: Package version for package cronie-dev went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1-r0) [version-going-backwards]
ERROR: cronie-1.6.1-r0 do_packagedata: QA Issue: Package version for package cronie-doc went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1-r0) [version-going-backwards]
ERROR: cronie-1.6.1-r0 do_packagedata: QA Issue: Package version for package cronie-locale went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1-r0) [version-going-backwards]
ERROR: cronie-1.6.1-r0 do_packagedata: QA Issue: Package version for package cronie went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1-r0) [version-going-backwards]
ERROR: cronie-1.6.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/cronie/1.6.1/temp/log.do_packagedata.2133798
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_packagedata) failed with exit code '1'

--===============6813722452170179648==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (0 cached, 912 parsed). 1845 targets, 55 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-564a8cef8aee3d8209967e69579552abdfae791a"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:564a8cef8aee3d8209967e69579552abdfae791a"
workspace            = "master:988dc0dea4398e77a7d7862d4655a9b1f5eaa06d"

Initialising tasks...done.
Sstate summary: Wanted 207 Local 72 Mirrors 0 Missed 135 Current 891 (34% match, 87% complete)
Removing 3 stale sstate objects for arch cortexa15t2hf-neon...done.
Removing 5 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 897 of 1098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 901 of 1098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 922 of 1098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 993 of 1098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1002 of 1098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1047 of 1098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_spdx_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe btrfs-tools-6.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe systemd-1_254.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1078 of 1098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 1079 of 1098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_create_spdx_setscene)
NOTE: recipe glibc-2.38+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/btrfs-tools/6.5.1/temp/log.do_packagedata_setscene.1895580
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1082 of 1098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.1.bb:do_package_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-1_254.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_create_spdx_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/libnsl2/2.0.0/temp/log.do_packagedata_setscene.1895853
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1086 of 1098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_setscene)
NOTE: Running setscene task 1088 of 1098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1424 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_recipe_qa)
NOTE: Running task 1618 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1652 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_recipe_qa)
NOTE: Running task 1675 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.8.0.bb:do_recipe_qa)
NOTE: recipe libnsl2-2.0.0-r0: task do_package_setscene: Started
NOTE: recipe tcl-8.6.13-r0: task do_recipe_qa: Started
NOTE: recipe btrfs-tools-6.5.1-r0: task do_package_setscene: Started
NOTE: Running task 1838 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_recipe_qa)
NOTE: Running task 1888 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_recipe_qa)
NOTE: Running task 1889 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_recipe_qa)
NOTE: Running task 1891 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.13.bb:do_recipe_qa)
NOTE: Running task 1892 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_recipe_qa)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa: Started
NOTE: recipe libnl-1_3.8.0-r0: task do_recipe_qa: Started
NOTE: Running task 1969 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_recipe_qa)
NOTE: Running task 1971 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_recipe_qa)
NOTE: recipe tcl-8.6.13-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2002 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_fetch)
NOTE: Running task 2029 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb:do_recipe_qa)
NOTE: Running task 2040 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.4.bb:do_populate_sysroot)
NOTE: Running task 2047 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_recipe_qa)
NOTE: Running task 2060 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230929.bb:do_recipe_qa)
NOTE: recipe gawk-5.2.2-r0: task do_recipe_qa: Started
NOTE: Running task 2133 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_recipe_qa)
NOTE: Running task 2134 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_recipe_qa)
NOTE: Running task 2135 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_recipe_qa)
NOTE: Running task 2136 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.2.bb:do_recipe_qa)
NOTE: recipe cpio-2.14-r0: task do_recipe_qa: Started
NOTE: recipe gzip-1.13-r0: task do_recipe_qa: Started
NOTE: recipe expect-5.45.4-r0: task do_recipe_qa: Started
NOTE: recipe logrotate-3.21.0-r0: task do_recipe_qa: Started
NOTE: recipe libaio-0.3.113-r0: task do_recipe_qa: Started
NOTE: recipe liburcu-0.14.0-r0: task do_recipe_qa: Started
NOTE: recipe libnl-1_3.8.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2238 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.8.0.bb:do_fetch)
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_fetch: Started
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_recipe_qa: Started
NOTE: Running task 2290 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_fetch)
NOTE: recipe liberror-perl-0.17029-r0: task do_recipe_qa: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_package_setscene: Succeeded
NOTE: recipe ltp-20230929-r0: task do_recipe_qa: Started
NOTE: recipe tcl-8.6.13-r0: task do_fetch: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_populate_sysroot: Started
NOTE: Running setscene task 1091 of 1098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1092 of 1098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1093 of 1098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 2363 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_unpack)
NOTE: Running task 2364 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe net-tools-2.10-r0: task do_recipe_qa: Started
NOTE: recipe gawk-5.2.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_recipe_qa: Started
NOTE: Running task 2392 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_fetch)
NOTE: recipe cpio-2.14-r0: task do_recipe_qa: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe gzip-1.13-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2416 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_fetch)
NOTE: Running task 2421 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_fetch)
NOTE: Running task 2426 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.13.bb:do_fetch)
NOTE: recipe logrotate-3.21.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_recipe_qa: Succeeded
NOTE: recipe gdb-13.2-r0: task do_recipe_qa: Started
NOTE: recipe liburcu-0.14.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2444 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_fetch)
NOTE: recipe quota-4.09-r0: task do_recipe_qa: Started
NOTE: Running task 2450 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_fetch)
NOTE: Running task 2455 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_fetch)
NOTE: recipe libnl-1_3.8.0-r0: task do_fetch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Started
NOTE: Running task 2486 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.4.bb:do_collect_spdx_deps)
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe libnl-1_3.8.0-r0: task do_fetch: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe btrfs-tools-6.5.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1095 of 1098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe ltp-20230929-r0: task do_recipe_qa: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_unpack: Started
NOTE: Running task 2487 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_unpack)
NOTE: recipe tcl-8.6.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2488 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.8.0.bb:do_unpack)
NOTE: recipe net-tools-2.10-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2489 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe cronie-1.6.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_fetch: Started
NOTE: Running task 2490 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb:do_fetch)
NOTE: Running task 2491 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230929.bb:do_fetch)
NOTE: Running task 2492 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_fetch)
NOTE: Running task 2493 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_fetch)
NOTE: recipe liberror-perl-0.17029-r0: task do_recipe_qa: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_fetch: Started
NOTE: recipe cpio-2.14-r0: task do_fetch: Started
NOTE: Running task 2510 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_fetch)
NOTE: recipe gzip-1.13-r0: task do_fetch: Started
NOTE: recipe expect-5.45.4-r0: task do_fetch: Started
NOTE: recipe gawk-5.2.2-r0: task do_fetch: Succeeded
NOTE: recipe liburcu-0.14.0-r0: task do_fetch: Started
NOTE: recipe logrotate-3.21.0-r0: task do_fetch: Started
NOTE: Running task 2531 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_unpack)
NOTE: Running task 2532 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe cpio-2.14-r0: task do_fetch: Succeeded
NOTE: recipe gzip-1.13-r0: task do_fetch: Succeeded
NOTE: Running task 2544 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_unpack)
NOTE: recipe gdb-13.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2545 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.13.bb:do_unpack)
NOTE: Running task 2546 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe liburcu-0.14.0-r0: task do_fetch: Succeeded
NOTE: Running task 2547 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_unpack)
NOTE: Running task 2548 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_fetch: Succeeded
NOTE: Running task 2549 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_unpack)
NOTE: Running task 2550 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.2.bb:do_fetch)
NOTE: Running task 2557 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_collect_spdx_deps)
NOTE: recipe logrotate-3.21.0-r0: task do_fetch: Succeeded
NOTE: recipe quota-4.09-r0: task do_recipe_qa: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_fetch: Succeeded
NOTE: Running task 2563 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_unpack)
NOTE: Running task 2564 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_fetch)
NOTE: Running task 2565 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_collect_spdx_deps)
NOTE: Running task 2566 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2567 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/libtirpc/1.3.3/temp/log.do_packagedata_setscene.1896975
NOTE: recipe btrfs-tools-6.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Started
NOTE: recipe libnl-1_3.8.0-r0: task do_unpack: Started
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1096 of 1098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_package_setscene)
NOTE: recipe cronie-1.6.1-r0: task do_fetch: Started
NOTE: recipe net-tools-2.10-r0: task do_fetch: Started
NOTE: Running task 2568 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_unpack)
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_fetch: Started
NOTE: Running task 2569 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_prepare_recipe_sysroot)
NOTE: recipe coreutils-9.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_fetch: Started
NOTE: recipe cronie-1.6.1-r0: task do_fetch: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_fetch: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_unpack: Started
NOTE: Running task 2588 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_collect_spdx_deps)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ltp-20230929-r0: task do_fetch: Started
NOTE: recipe liburcu-0.14.0-r0: task do_unpack: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_fetch: Succeeded
NOTE: recipe cpio-2.14-r0: task do_unpack: Started
NOTE: recipe gzip-1.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe liburcu-0.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gzip-1.13-r0: task do_unpack: Started
NOTE: Running task 2589 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb:do_unpack)
NOTE: recipe gdb-13.2-r0: task do_fetch: Started
NOTE: Running task 2590 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_unpack)
NOTE: Running task 2591 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_unpack)
NOTE: Running task 2592 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Succeeded
NOTE: Running task 2594 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_collect_spdx_deps)
NOTE: recipe libnl-1_3.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 2595 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_patch)
NOTE: Running task 2596 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.8.0.bb:do_patch)
NOTE: Running task 2597 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_collect_spdx_deps)
NOTE: recipe net-tools-2.10-r0: task do_fetch: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_unpack: Started
NOTE: recipe tcl-8.6.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe btrfs-tools-6.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdb-13.2-r0: task do_fetch: Succeeded
NOTE: Running task 2598 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_unpack)
NOTE: recipe logrotate-3.21.0-r0: task do_unpack: Started
NOTE: recipe quota-4.09-r0: task do_fetch: Started
NOTE: recipe libaio-0.3.113-r0: task do_unpack: Started
NOTE: recipe iptables-1.8.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe libmnl-1.0.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe ltp-20230929-r0: task do_fetch: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: Running task 2599 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230929.bb:do_unpack)
NOTE: recipe quota-4.09-r0: task do_fetch: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_unpack: Succeeded
NOTE: Running task 2600 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_patch)
NOTE: Running task 2601 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_unpack)
NOTE: Running task 2602 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.2.bb:do_unpack)
NOTE: Running task 2603 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe gzip-1.13-r0: task do_unpack: Succeeded
NOTE: Running task 2604 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.13.bb:do_patch)
NOTE: Running task 2609 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.4.bb:do_create_spdx)
NOTE: recipe cpio-2.14-r0: task do_unpack: Succeeded
NOTE: Running task 2610 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_patch)
NOTE: Running task 2612 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_collect_spdx_deps)
NOTE: recipe expect-5.45.4-r0: task do_unpack: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_unpack: Started
NOTE: recipe libaio-0.3.113-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iptables-1.8.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_unpack: Started
NOTE: Running task 2613 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_patch)
NOTE: recipe libtirpc-1.3.3-r0: task do_package_setscene: Started
NOTE: Running task 2616 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.13.bb:do_collect_spdx_deps)
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_unpack: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmnl-1.0.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Started
NOTE: Running task 2617 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_create_spdx)
NOTE: recipe liberror-perl-0.17029-r0: task do_unpack: Succeeded
NOTE: recipe libnl-1_3.8.0-r0: task do_patch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2618 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_patch)
NOTE: Running task 2619 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_create_spdx)
NOTE: recipe liburcu-0.14.0-r0: task do_unpack: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_unpack: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2620 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_patch)
NOTE: Running task 2621 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_collect_spdx_deps)
NOTE: recipe tcl-8.6.13-r0: task do_patch: Started
NOTE: recipe ltp-20230929-r0: task do_unpack: Started
NOTE: recipe cronie-1.6.1-r0: task do_unpack: Succeeded
NOTE: recipe gdb-13.2-r0: task do_unpack: Started
NOTE: Running task 2622 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_patch)
NOTE: Running task 2623 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_patch)
NOTE: recipe gawk-5.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 2624 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_collect_spdx_deps)
NOTE: recipe findutils-4.9.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe quota-4.09-r0: task do_unpack: Started
NOTE: recipe gzip-1.13-r0: task do_patch: Started
NOTE: recipe net-tools-2.10-r0: task do_unpack: Started
NOTE: Running task 2625 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_patch)
NOTE: recipe net-tools-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-9.4-r0: task do_create_spdx: Started
NOTE: recipe cpio-2.14-r0: task do_patch: Started
NOTE: Running task 2626 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_collect_spdx_deps)
NOTE: recipe tcl-8.6.13-r0: task do_collect_spdx_deps: Started
NOTE: recipe liburcu-0.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libnl-1_3.8.0-r0: task do_patch: Succeeded
NOTE: recipe gzip-1.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe quota-4.09-r0: task do_unpack: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2627 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.8.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2628 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_patch)
NOTE: Running task 2630 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_collect_spdx_deps)
NOTE: recipe coreutils-9.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gzip-1.13-r0: task do_collect_spdx_deps: Started
NOTE: recipe expect-5.45.4-r0: task do_patch: Started
NOTE: Running task 2631 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe liberror-perl-0.17029-r0: task do_patch: Started
NOTE: Running task 2636 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_create_spdx)
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2637 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2639 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_create_spdx)
NOTE: recipe iptables-1.8.9-r0: task do_create_spdx: Started
NOTE: recipe libmnl-1.0.5-r0: task do_create_spdx: Started
NOTE: Running task 2645 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_package_write_rpm)
NOTE: recipe gzip-1.13-r0: task do_patch: Succeeded
NOTE: recipe gzip-1.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe liburcu-0.14.0-r0: task do_patch: Started
NOTE: recipe logrotate-3.21.0-r0: task do_patch: Started
NOTE: recipe cronie-1.6.1-r0: task do_patch: Started
NOTE: recipe liburcu-0.14.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2646 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.13.bb:do_deploy_source_date_epoch)
NOTE: recipe which-2.21-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2647 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm)
NOTE: recipe libaio-0.3.113-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2650 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm)
NOTE: recipe logrotate-3.21.0-r0: task do_patch: Succeeded
NOTE: recipe cpio-2.14-r0: task do_patch: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe quota-4.09-r0: task do_patch: Started
NOTE: Running task 2651 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libnl-1_3.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2652 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_deploy_source_date_epoch)
NOTE: recipe net-tools-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe liburcu-0.14.0-r0: task do_patch: Succeeded
NOTE: Running task 2654 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_patch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to c4118ecc92388c0870c75e9c9b9555189e2e26c4cf37e38de1ed2d65249bd5d8
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe logrotate-3.21.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2659 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_populate_sysroot)
NOTE: recipe unzip-1_6.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe findutils-4.9.0-r0: task do_create_spdx: Started
NOTE: recipe liburcu-0.14.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2660 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libaio-0.3.113-r0: task do_unpack: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_create_spdx: Started
NOTE: Running task 2661 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_patch)
NOTE: Running task 2662 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_collect_spdx_deps)
NOTE: recipe which-2.21-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_patch: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gzip-1.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1098 of 1098 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_recipe_qa_setscene)
NOTE: Running task 2663 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2664 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_create_spdx)
NOTE: recipe file-5.45-r0: task do_package_write_rpm: Started
NOTE: recipe cronie-1.6.1-r0: task do_patch: Succeeded
NOTE: Running task 2665 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe liburcu-0.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe unzip-1_6.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cpio-2.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe which-2.21-r0: task do_package_write_rpm: Started
NOTE: recipe quota-4.09-r0: task do_patch: Succeeded
NOTE: Running task 2666 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_create_spdx)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_populate_sysroot: Started
NOTE: recipe tcl-8.6.13-r0: task do_patch: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_package_write_rpm: Started
NOTE: Running task 2667 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_deploy_source_date_epoch)
NOTE: Running task 2668 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_deploy_source_date_epoch)
NOTE: recipe liberror-perl-0.17029-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_patch: Started
NOTE: recipe libaio-0.3.113-r0: task do_collect_spdx_deps: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_patch: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_unpack: Succeeded
NOTE: Running task 2669 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_deploy_source_date_epoch)
NOTE: recipe cronie-1.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2670 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_patch)
NOTE: Running task 2671 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_collect_spdx_deps)
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_unpack: Succeeded
NOTE: recipe libnl-1_3.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe which-2.21-r0: task do_create_spdx: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2672 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb:do_patch)
NOTE: Running task 2673 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_configure)
NOTE: recipe cronie-1.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libaio-0.3.113-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe quota-4.09-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmnl-1.0.5-r0: task do_create_spdx: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gzip-1.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2674 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.13.bb:do_configure)
NOTE: recipe unzip-1_6.0-r0: task do_create_spdx: Started
NOTE: recipe liburcu-0.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2675 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_configure)
NOTE: recipe logrotate-3.21.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe net-tools-2.10-r0: task do_patch: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libaio-0.3.113-r0: task do_patch: Succeeded
NOTE: Running task 2714 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata)
NOTE: Running task 2731 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_configure)
NOTE: recipe net-tools-2.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe cpio-2.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_patch: Started
NOTE: Running task 2734 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_deploy_source_date_epoch)
NOTE: Running task 2741 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Started
NOTE: recipe expect-5.45.4-r0: task do_patch: Succeeded
NOTE: Running task 2756 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_deploy_source_date_epoch)
NOTE: recipe gawk-5.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2757 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_configure)
NOTE: recipe net-tools-2.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe quota-4.09-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_create_spdx: Succeeded
NOTE: recipe gzip-1.13-r0: task do_configure: Started
NOTE: recipe net-tools-2.10-r0: task do_patch: Succeeded
NOTE: Running task 2758 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_deploy_source_date_epoch)
NOTE: recipe liburcu-0.14.0-r0: task do_configure: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata: Started
NOTE: recipe libaio-0.3.113-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe logrotate-3.21.0-r0: task do_configure: Started
NOTE: recipe which-2.21-r0: task do_create_spdx: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tcl-8.6.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2759 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_configure)
NOTE: Running task 2760 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_configure)
NOTE: recipe cronie-1.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_configure: Started
NOTE: Running task 2761 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_configure)
NOTE: Running task 2762 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe net-tools-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2763 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_patch: Succeeded
NOTE: Running task 2764 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb:do_deploy_source_date_epoch)
NOTE: recipe ltp-20230929-r0: task do_unpack: Succeeded
NOTE: Running task 2765 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230929.bb:do_patch)
NOTE: recipe libaio-0.3.113-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2766 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_configure)
NOTE: recipe liberror-perl-0.17029-r0: task do_configure: Started
NOTE: recipe tcl-8.6.13-r0: task do_configure: Started
NOTE: recipe unzip-1_6.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_configure: Started
NOTE: Running task 2768 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata)
NOTE: recipe expect-5.45.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cpio-2.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe net-tools-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2771 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_configure)
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ltp-20230929-r0: task do_patch: Started
NOTE: recipe libaio-0.3.113-r0: task do_configure: Started
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2772 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata: Started
NOTE: recipe libaio-0.3.113-r0: task do_configure: Succeeded
NOTE: Running task 2773 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_compile)
NOTE: recipe which-2.21-r0: task do_package_write_rpm: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_configure: Started
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_create_spdx: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_configure: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Running task 2774 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_compile)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 2572f28bd6d6ab3b8d5d65dea143291e7936867d7b6c5b21c4c3d1e3b7a8e7fe
NOTE: recipe libaio-0.3.113-r0: task do_compile: Started
NOTE: Setscene tasks completed
NOTE: Running task 2777 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe cpio-2.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2778 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_configure)
NOTE: recipe liberror-perl-0.17029-r0: task do_configure: Succeeded
NOTE: Running task 2779 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_package_write_rpm)
NOTE: Running task 2780 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_configure_ptest_base)
NOTE: Running task 2782 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm)
NOTE: recipe ltp-20230929-r0: task do_patch: Succeeded
NOTE: Running task 2783 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.4.0.bb:do_package_write_rpm)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2794 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230929.bb:do_deploy_source_date_epoch)
NOTE: Running task 2810 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_collect_spdx_deps)
NOTE: recipe net-tools-2.10-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: Running task 2813 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.1.bb:do_packagedata)
NOTE: Running task 2815 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.5.0.bb:do_package_write_rpm)
NOTE: Running task 2816 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.4.bb:do_package_write_rpm)
NOTE: recipe cpio-2.14-r0: task do_configure: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_configure_ptest_base: Started
NOTE: Running task 2820 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_package_write_rpm)
NOTE: recipe libaio-0.3.113-r0: task do_compile: Succeeded
NOTE: recipe ltp-20230929-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe findutils-4.9.0-r0: task do_package_write_rpm: Started
NOTE: Running task 2821 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_install)
NOTE: Running task 2822 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230929.bb:do_populate_lic)
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Started
NOTE: recipe unzip-1_6.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe tcp-wrappers-7.6-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2823 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_compile)
NOTE: recipe btrfs-tools-6.5.1-r0: task do_packagedata: Started
NOTE: recipe curl-8.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe iproute2-6.5.0-r0: task do_package_write_rpm: Started
NOTE: recipe procps-4.0.4-r0: task do_package_write_rpm: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2824 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_create_spdx)
NOTE: recipe ltp-20230929-r0: task do_populate_lic: Started
NOTE: recipe libaio-0.3.113-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: Running task 2831 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_collect_spdx_deps)
NOTE: Running task 2832 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.4.bb:do_collect_spdx_deps)
NOTE: recipe ltp-20230929-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_package_write_rpm: Started
NOTE: Running task 2833 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_collect_spdx_deps)
NOTE: recipe tcp-wrappers-7.6-r0: task do_create_spdx: Started
NOTE: recipe ltp-20230929-r0: task do_populate_lic: Succeeded
NOTE: recipe btrfs-tools-6.5.1-r0: task do_packagedata: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libaio-0.3.113-r0: task do_install: Succeeded
NOTE: recipe cpio-2.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe procps-4.0.4-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2834 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package)
NOTE: Running task 2835 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_populate_sysroot)
NOTE: recipe cronie-1.6.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_compile: Succeeded
NOTE: Running task 2836 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_compile_ptest_base)
NOTE: recipe cpio-2.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_configure: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_create_spdx: Succeeded
NOTE: Running task 2837 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure_ptest_base)
NOTE: recipe libaio-0.3.113-r0: task do_populate_sysroot: Started
NOTE: recipe libaio-0.3.113-r0: task do_package: Started
NOTE: Running task 2838 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.5.0.bb:do_collect_spdx_deps)
NOTE: recipe gdb-13.2-r0: task do_unpack: Succeeded
NOTE: Running task 2839 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.2.bb:do_patch)
NOTE: recipe liberror-perl-0.17029-r0: task do_compile_ptest_base: Started
NOTE: recipe procps-4.0.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2840 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.4.bb:do_create_spdx)
NOTE: recipe liberror-perl-0.17029-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2841 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install)
NOTE: recipe iproute2-6.5.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_create_spdx: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Started
NOTE: recipe gdb-13.2-r0: task do_patch: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2842 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile)
NOTE: recipe procps-4.0.4-r0: task do_create_spdx: Started
NOTE: recipe iproute2-6.5.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2843 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.5.0.bb:do_create_spdx)
NOTE: recipe liberror-perl-0.17029-r0: task do_install: Started
NOTE: recipe libaio-0.3.113-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2844 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230929.bb:do_prepare_recipe_sysroot)
NOTE: recipe mdadm-4.2-r0: task do_compile: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe iproute2-6.5.0-r0: task do_create_spdx: Started
NOTE: recipe ltp-20230929-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ltp-20230929-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_install: Succeeded
NOTE: Running task 2845 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230929.bb:do_configure)
NOTE: Running task 2846 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install_ptest_base)
NOTE: recipe gdb-13.2-r0: task do_patch: Succeeded
NOTE: recipe ltp-20230929-r0: task do_configure: Started
NOTE: Running task 2847 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.2.bb:do_deploy_source_date_epoch)
NOTE: recipe liberror-perl-0.17029-r0: task do_install_ptest_base: Started
NOTE: recipe gdb-13.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2848 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install_ptest_perl)
NOTE: recipe gdb-13.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_create_spdx: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_install_ptest_perl: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_install_ptest_perl: Succeeded
NOTE: Running task 2849 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package)
NOTE: recipe iproute2-6.5.0-r0: task do_create_spdx: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package: Started
NOTE: recipe libaio-0.3.113-r0: task do_package: Succeeded
NOTE: Running task 2850 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_packagedata)
NOTE: recipe libaio-0.3.113-r0: task do_packagedata: Started
NOTE: recipe procps-4.0.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_packagedata: Succeeded
NOTE: Running task 2851 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_create_spdx)
NOTE: Running task 2852 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package_write_rpm)
NOTE: recipe libaio-0.3.113-r0: task do_create_spdx: Started
NOTE: recipe libaio-0.3.113-r0: task do_package_write_rpm: Started
NOTE: recipe libaio-0.3.113-r0: task do_create_spdx: Succeeded
NOTE: Running task 2853 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230929.bb:do_collect_spdx_deps)
NOTE: recipe ltp-20230929-r0: task do_collect_spdx_deps: Started
NOTE: recipe ltp-20230929-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe file-5.45-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_package_write_rpm: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package: Succeeded
NOTE: Running task 2854 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata: Started
NOTE: recipe logrotate-3.21.0-r0: task do_configure: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata: Succeeded
NOTE: Running task 2855 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_configure_ptest_base)
NOTE: recipe logrotate-3.21.0-r0: task do_configure_ptest_base: Started
NOTE: recipe logrotate-3.21.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2856 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_compile)
NOTE: recipe logrotate-3.21.0-r0: task do_compile: Started
NOTE: recipe iproute2-6.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_compile: Succeeded
NOTE: Running task 2857 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Started
NOTE: recipe logrotate-3.21.0-r0: task do_compile: Succeeded
NOTE: Running task 2858 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_compile_ptest_base)
NOTE: recipe cronie-1.6.1-r0: task do_configure: Succeeded
NOTE: Running task 2859 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_compile)
NOTE: recipe logrotate-3.21.0-r0: task do_compile_ptest_base: Started
NOTE: recipe logrotate-3.21.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2860 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_install)
NOTE: recipe cronie-1.6.1-r0: task do_compile: Started
NOTE: recipe logrotate-3.21.0-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2861 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_package_write_rpm unihash changed to 33a1816817c20830e0d8f1fba87ae67113d7fb5e13379a932208e6304aa884fc
NOTE: recipe mdadm-4.2-r0: task do_install: Started
NOTE: recipe logrotate-3.21.0-r0: task do_install: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_compile: Succeeded
NOTE: Running task 2862 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_install_ptest_base)
NOTE: Running task 2863 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_install)
NOTE: recipe logrotate-3.21.0-r0: task do_install_ptest_base: Started
NOTE: recipe cronie-1.6.1-r0: task do_install: Started
NOTE: recipe logrotate-3.21.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2864 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_package)
NOTE: recipe mdadm-4.2-r0: task do_install: Succeeded
NOTE: Running task 2865 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install_ptest_base)
NOTE: recipe cronie-1.6.1-r0: task do_install: Succeeded
NOTE: Running task 2866 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_package)
NOTE: recipe logrotate-3.21.0-r0: task do_package: Started
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Started
NOTE: recipe cronie-1.6.1-r0: task do_package: Started
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_compile: Succeeded
NOTE: Running task 2867 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_install)
NOTE: Running task 2868 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_package)
NOTE: recipe coreutils-9.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 2869 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_collect_spdx_deps)
NOTE: recipe mdadm-4.2-r0: task do_package: Started
NOTE: recipe net-tools-2.10-r0: task do_install: Started
NOTE: recipe logrotate-3.21.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe logrotate-3.21.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_configure: Succeeded
NOTE: Running task 2870 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_configure_ptest_base)
NOTE: recipe tcl-8.6.13-r0: task do_configure_ptest_base: Started
NOTE: recipe tcl-8.6.13-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2871 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_compile)
NOTE: recipe net-tools-2.10-r0: task do_install: Succeeded
NOTE: Running task 2872 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_package)
NOTE: recipe tcl-8.6.13-r0: task do_compile: Started
NOTE: recipe net-tools-2.10-r0: task do_package: Started
NOTE: recipe curl-8.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_package: Succeeded
NOTE: Running task 2873 of 2992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_packagedata)
NOTE: recipe cronie-1.6.1-r0: task do_packagedata: Started
NOTE: recipe cronie-1.6.1-r0: task do_packagedata: Failed
NOTE: recipe net-tools-2.10-r0: task do_package: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_package: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_package: Succeeded
NOTE: recipe liburcu-0.14.0-r0: task do_configure: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_compile: Succeeded
NOTE: recipe gzip-1.13-r0: task do_configure: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_configure: Succeeded
NOTE: recipe ltp-20230929-r0: task do_configure: Succeeded
NOTE: recipe cpio-2.14-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2873 tasks of which 2675 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_packagedata
Summary: There were 32 ERROR messages, returning a non-zero exit code.
ERROR: btrfs-tools-6.5.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-src went backwards which would break package feeds (from 0:6.5.2-r0 to 0:6.5.1-r0) [version-going-backwards]
ERROR: btrfs-tools-6.5.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-dbg went backwards which would break package feeds (from 0:6.5.2-r0 to 0:6.5.1-r0) [version-going-backwards]
ERROR: btrfs-tools-6.5.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-staticdev went backwards which would break package feeds (from 0:6.5.2-r0 to 0:6.5.1-r0) [version-going-backwards]
ERROR: btrfs-tools-6.5.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-dev went backwards which would break package feeds (from 0:6.5.2-r0 to 0:6.5.1-r0) [version-going-backwards]
ERROR: btrfs-tools-6.5.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-doc went backwards which would break package feeds (from 0:6.5.2-r0 to 0:6.5.1-r0) [version-going-backwards]
ERROR: btrfs-tools-6.5.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-locale went backwards which would break package feeds (from 0:6.5.2-r0 to 0:6.5.1-r0) [version-going-backwards]
ERROR: btrfs-tools-6.5.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools went backwards which would break package feeds (from 0:6.5.2-r0 to 0:6.5.1-r0) [version-going-backwards]
ERROR: btrfs-tools-6.5.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: libnsl2-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package libnsl2-src went backwards which would break package feeds (from 0:2.0.1-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: libnsl2-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package libnsl2-dbg went backwards which would break package feeds (from 0:2.0.1-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: libnsl2-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package libnsl2-staticdev went backwards which would break package feeds (from 0:2.0.1-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: libnsl2-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package libnsl2-dev went backwards which would break package feeds (from 0:2.0.1-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: libnsl2-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package libnsl2-doc went backwards which would break package feeds (from 0:2.0.1-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: libnsl2-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package libnsl2-locale went backwards which would break package feeds (from 0:2.0.1-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: libnsl2-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package libnsl2 went backwards which would break package feeds (from 0:2.0.1-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: libnsl2-2.0.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: libtirpc-1.3.3-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-src went backwards which would break package feeds (from 0:1.3.4-r0 to 0:1.3.3-r0) [version-going-backwards]
ERROR: libtirpc-1.3.3-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-dbg went backwards which would break package feeds (from 0:1.3.4-r0 to 0:1.3.3-r0) [version-going-backwards]
ERROR: libtirpc-1.3.3-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-staticdev went backwards which would break package feeds (from 0:1.3.4-r0 to 0:1.3.3-r0) [version-going-backwards]
ERROR: libtirpc-1.3.3-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-dev went backwards which would break package feeds (from 0:1.3.4-r0 to 0:1.3.3-r0) [version-going-backwards]
ERROR: libtirpc-1.3.3-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-doc went backwards which would break package feeds (from 0:1.3.4-r0 to 0:1.3.3-r0) [version-going-backwards]
ERROR: libtirpc-1.3.3-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-locale went backwards which would break package feeds (from 0:1.3.4-r0 to 0:1.3.3-r0) [version-going-backwards]
ERROR: libtirpc-1.3.3-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc went backwards which would break package feeds (from 0:1.3.4-r0 to 0:1.3.3-r0) [version-going-backwards]
ERROR: libtirpc-1.3.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: cronie-1.6.1-r0 do_packagedata: QA Issue: Package version for package cronie-src went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1-r0) [version-going-backwards]
ERROR: cronie-1.6.1-r0 do_packagedata: QA Issue: Package version for package cronie-dbg went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1-r0) [version-going-backwards]
ERROR: cronie-1.6.1-r0 do_packagedata: QA Issue: Package version for package cronie-staticdev went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1-r0) [version-going-backwards]
ERROR: cronie-1.6.1-r0 do_packagedata: QA Issue: Package version for package cronie-dev went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1-r0) [version-going-backwards]
ERROR: cronie-1.6.1-r0 do_packagedata: QA Issue: Package version for package cronie-doc went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1-r0) [version-going-backwards]
ERROR: cronie-1.6.1-r0 do_packagedata: QA Issue: Package version for package cronie-locale went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1-r0) [version-going-backwards]
ERROR: cronie-1.6.1-r0 do_packagedata: QA Issue: Package version for package cronie went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1-r0) [version-going-backwards]
ERROR: cronie-1.6.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/cronie/1.6.1/temp/log.do_packagedata.1947668
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_packagedata) failed with exit code '1'

--===============6813722452170179648==--

