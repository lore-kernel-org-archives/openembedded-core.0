Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20FFEC54F99
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 14:37:13 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.14622.1700059030012817962
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 06:37:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=NzntxEUu;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ef3FxDwD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018bd36a25e7-36d024b1-2e4d-4ec6-8946-15af88678fa3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1700059031;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=U8GPhcV7L2EYTkvClzW+S9/aWpdOXuVlvBy5wnLx10A=;
	b=NzntxEUuaxF1QasBv0IJeuoVP4fbw8JGfZW1M/HIl8Bwcg6f2lC4aUrBJCfGHPhh
	Z+gpuTs2Aw13TUaMcaUk3QzyRR4Z9Rj7+ly0qz/fRIBTzE+3x7b5EgczYGodQpks2Z/
	PbraMgyH30xVCI408oDCHFYG8DNlxviQw7XQ7lrY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1700059031;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=U8GPhcV7L2EYTkvClzW+S9/aWpdOXuVlvBy5wnLx10A=;
	b=ef3FxDwDjxxy3y5IBFQqKQK8SzJj51V0vTA2bJta/6WJ+4JabTxXGIsdyUwaIsfz
	IAn7GPpwwVM25Xpqu4icOgA0eSgyvN2fAO6Pj3e+dGsmA9/S3tBNYoHtTjNPANx82wp
	8hgh+4y4E/yGvVKwmp0PPzZ8WK4jx/quqJlCvl2E=
Content-Type: multipart/mixed; boundary="===============1699565600634421278=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] bash: upgrading to 5.2.21 SUCCEEDED
Message-ID: <0101018bd36a25e7-36d024b1-2e4d-4ec6-8946-15af88678fa3-000000@us-west-2.amazonses.com>
Date: Wed, 15 Nov 2023 14:37:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:37:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190662

--===============1699565600634421278==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *bash* to *5.2.21* has Succeeded.

Next steps:
    - apply the patch: git am 0001-bash-upgrade-5.2.15-5.2.21.patch
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
From a25c5ec5baee7877b137d491e725ff9b4c7e6e65 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Nov 2023 08:52:06 +0000
Subject: [PATCH] bash: upgrade 5.2.15 -> 5.2.21

---
 meta/recipes-extended/bash/{bash_5.2.15.bb => bash_5.2.21.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/bash/{bash_5.2.15.bb => bash_5.2.21.bb} (89%)

diff --git a/meta/recipes-extended/bash/bash_5.2.15.bb b/meta/recipes-extended/bash/bash_5.2.21.bb
similarity index 89%
rename from meta/recipes-extended/bash/bash_5.2.15.bb
rename to meta/recipes-extended/bash/bash_5.2.21.bb
index f78f79fcc5..6df73b653b 100644
--- a/meta/recipes-extended/bash/bash_5.2.15.bb
+++ b/meta/recipes-extended/bash/bash_5.2.21.bb
@@ -14,7 +14,7 @@ SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
            file://use_aclocal.patch \
            "
 
-SRC_URI[tarball.sha256sum] = "13720965b5f4fc3a0d4b61dd37e7565c741da9a5be24edc2ae00182fc1b3588c"
+SRC_URI[tarball.sha256sum] = "c8e31bdc59b69aaffc5b36509905ba3e5cbb12747091d27b4b977f078560d5b8"
 
 DEBUG_OPTIMIZATION:append:armv4 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
 DEBUG_OPTIMIZATION:append:armv5 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
-- 
2.39.2


--===============1699565600634421278==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (0 cached, 911 parsed). 1844 targets, 50 skipped, 0 masked, 0 errors.
Removing 40 recipes from the core2-64 sysroot...done.
Removing 97 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-8c6d0c6f75fce436292f0e75c05ad35945564d66"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:8c6d0c6f75fce436292f0e75c05ad35945564d66"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 526 Local 491 Mirrors 0 Missed 35 Current 255 (93% match, 95% complete)
Removing 1 stale sstate objects for arch qemux86_64...done.
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 259 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 269 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 270 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 273 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 275 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 276 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 277 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_packagedata_setscene)
NOTE: Running setscene task 278 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 280 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 281 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 282 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 283 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: Running setscene task 284 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 285 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 286 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 287 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe iproute2-6.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe socat-1.7.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe btrfs-tools-6.5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_packagedata_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe iproute2-6.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 288 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe btrfs-tools-6.5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 289 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 290 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot_setscene)
NOTE: recipe make-4.4.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 293 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_create_spdx_setscene)
NOTE: recipe socat-1.7.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe base-passwd-3.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 297 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 298 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 299 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_create_spdx_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 315 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 317 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe iproute2-6.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe btrfs-tools-6.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 318 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe iproute2-6.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 319 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe btrfs-tools-6.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 321 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 322 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_packagedata_setscene)
NOTE: recipe perl-5.38.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 323 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_packagedata_setscene)
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 327 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 328 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_packagedata_setscene)
NOTE: recipe perl-5.38.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 329 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_packagedata_setscene)
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 331 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.39.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 332 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_create_spdx_setscene)
NOTE: recipe coreutils-9.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 333 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_packagedata_setscene)
NOTE: recipe grep-3.11-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 338 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.12.bb:do_packagedata_setscene)
NOTE: recipe iptables-1.8.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 339 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 342 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 344 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_recipe_qa_setscene)
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 345 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.189-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 346 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: recipe eudev-3.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 347 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 348 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 350 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_recipe_qa_setscene)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 352 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 355 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 359 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 361 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 362 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 363 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 365 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe elfutils-0.189-r0: task do_recipe_qa_setscene: Started
NOTE: recipe grep-3.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 367 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_recipe_qa_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 372 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 373 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 375 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 377 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.12.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 379 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 380 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 381 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_package_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe iptables-1.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe eudev-3.2.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 384 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 386 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 388 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 392 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 395 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 397 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 398 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 402 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_create_spdx_setscene)
NOTE: Running setscene task 403 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 404 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 405 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 406 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 410 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 411 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 412 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe iptables-1.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-securetty-4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mdadm-4.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sed-4.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe sed-4.9-r0: task do_package_write_deb_setscene: Started
NOTE: recipe sed-4.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.9-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 415 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 416 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_packagedata_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 417 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 418 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_packagedata_setscene)
NOTE: recipe mdadm-4.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 419 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 420 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.5.bb:do_deploy_setscene)
NOTE: recipe iptables-1.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 421 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 422 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-securetty-4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 432 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 433 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 435 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_packagedata_setscene)
NOTE: recipe tcp-wrappers-7.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 437 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sed-4.9-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 438 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-31-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-31-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 439 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-6.5.10+git-r0: task do_deploy_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 440 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_packagedata_setscene)
NOTE: recipe which-2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 441 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 442 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe kmod-31-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 450 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 453 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 455 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-31-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 457 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 459 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 461 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 462 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.4.0.bb:do_packagedata_setscene)
NOTE: recipe perl-5.38.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 464 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 466 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-31-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_package_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 467 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-31-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 468 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.1.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 471 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 475 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 477 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_create_spdx_setscene)
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 479 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 481 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 482 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 483 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gawk-5.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 485 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: recipe curl-8.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 490 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 494 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-6.5.10+git-r0: task do_deploy_setscene: Succeeded
NOTE: Running setscene task 498 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.5.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 500 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 502 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 506 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 507 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_package_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 509 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_create_spdx_setscene)
NOTE: recipe gnutls-3.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 511 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 516 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 518 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 519 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 520 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-yocto-6.5.10+git-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 521 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 524 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 527 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 528 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.39.2-r0: task do_package_setscene: Started
NOTE: recipe file-5.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 529 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 531 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 532 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe curl-8.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 537 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 538 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_create_spdx_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 540 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 542 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 544 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 546 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 550 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 551 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 553 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 554 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 555 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 556 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 559 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 561 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 562 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 563 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 564 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_deb_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 565 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_ipk_setscene)
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 567 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 569 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 570 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 572 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_populate_sysroot_setscene)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_package_write_deb_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 574 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 611 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sqlite3-3_3.43.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.43.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 618 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 620 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 621 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 622 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running task 364 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_recipe_qa)
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 457 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_fetch)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 626 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running task 537 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.5.0.bb:do_fetch)
NOTE: Running task 540 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.3.bb:do_fetch)
NOTE: recipe sqlite3-3_3.43.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 629 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Started
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_recipe_qa: Started
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe btrfs-tools-6.5.3-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.43.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mdadm-4.2-r0: task do_fetch: Started
NOTE: recipe iproute2-6.5.0-r0: task do_fetch: Started
NOTE: recipe iproute2-6.5.0-r0: task do_fetch: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 634 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 635 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 636 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe mdadm-4.2-r0: task do_fetch: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe btrfs-tools-6.5.3-r0: task do_fetch: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_recipe_qa: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 649 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running task 1015 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_fetch)
NOTE: Running task 1080 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_unpack)
NOTE: recipe base-passwd-3.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 652 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.2.bb:do_recipe_qa_setscene)
NOTE: Running task 1179 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.5.0.bb:do_unpack)
NOTE: Running task 1180 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.3.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_fetch: Started
NOTE: recipe mdadm-4.2-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_package_setscene: Succeeded
NOTE: recipe btrfs-tools-6.5.3-r0: task do_unpack: Started
NOTE: Running task 1251 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe iproute2-6.5.0-r0: task do_unpack: Started
NOTE: Running setscene task 653 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 654 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 655 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 656 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 657 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 658 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: recipe bash-5.2.21-r0: task do_fetch: Succeeded
NOTE: Running setscene task 659 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 660 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_package_setscene)
NOTE: recipe base-passwd-3.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1254 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1257 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe coreutils-9.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe iproute2-6.5.0-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.13-r0: task do_package_setscene: Started
NOTE: Running task 1259 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe bash-5.2.21-r0: task do_unpack: Started
NOTE: recipe coreutils-9.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: Running setscene task 661 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1260 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.5.0.bb:do_patch)
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running setscene task 665 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_unpack: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 667 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: Running task 1261 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_patch)
NOTE: Running setscene task 670 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1262 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 1263 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: recipe coreutils-9.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe iproute2-6.5.0-r0: task do_patch: Started
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe coreutils-9.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_patch: Started
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe iproute2-6.5.0-r0: task do_patch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1286 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe btrfs-tools-6.5.3-r0: task do_unpack: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_unpack: Succeeded
NOTE: Running task 1287 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_patch)
NOTE: Running task 1288 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.3.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe btrfs-tools-6.5.3-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_patch: Started
NOTE: Running task 1289 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe shadow-4.13-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 671 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 672 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 673 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe btrfs-tools-6.5.3-r0: task do_patch: Succeeded
NOTE: Running task 1290 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe shadow-4.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 674 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 677 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.39.2-r0: task do_package_setscene: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_patch: Succeeded
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1292 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_deploy_source_date_epoch)
NOTE: Running setscene task 678 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 679 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 680 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 681 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 682 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 683 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 684 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 685 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 686 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-yocto-6.5.10+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 693 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 694 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 698 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 699 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-yocto-6.5.10+git-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 700 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 703 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: Running task 1328 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_populate_lic)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 708 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 710 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 713 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 714 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe linux-yocto-6.5.10+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 715 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-5.2.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1338 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_populate_lic: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe util-linux-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 719 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 721 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_populate_lic unihash changed to e42e1cfe48aa9e3d9bc3ecb68f222e3b2355d6eea1cc1b8b3ef34cc26d462ea3
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 724 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 726 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 727 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 729 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mdadm-4.2-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 731 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 732 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 733 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 735 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 737 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 739 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 740 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 742 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 744 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 746 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 747 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 749 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1398 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 750 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 752 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 754 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 755 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 756 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 760 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 761 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 763 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to e644ec3722734ea60494db1182afab8d0334f493c3dc1fb845b731f7ca727b46
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1403 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: Running task 1404 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_ipk)
NOTE: Running task 1405 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_deb)
NOTE: Running task 1406 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 769 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 770 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 771 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_package_write_ipk: Started
NOTE: recipe base-files-3.0.14-r0: task do_package_write_deb: Started
NOTE: recipe base-files-3.0.14-r0: task do_package_write_rpm: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package_write_ipk: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package_write_deb: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 774 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 776 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 777 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 779 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 781 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1705 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1869 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2036 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.5.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2039 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe bash-5.2.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2090 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_collect_spdx_deps)
NOTE: Running task 2134 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_package_write_ipk)
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2135 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_package_write_deb)
NOTE: Running task 2136 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_package_write_rpm)
NOTE: recipe iproute2-6.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe btrfs-tools-6.5.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-5.2.21-r0: task do_collect_spdx_deps: Started
NOTE: recipe shadow-4.13-r0: task do_package_write_ipk: Started
NOTE: recipe shadow-4.13-r0: task do_package_write_deb: Started
NOTE: recipe shadow-4.13-r0: task do_package_write_rpm: Started
NOTE: recipe bash-5.2.21-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2137 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_configure)
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2138 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure)
NOTE: recipe iproute2-6.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2139 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.5.0.bb:do_configure)
NOTE: recipe bash-5.2.21-r0: task do_configure: Started
NOTE: recipe mdadm-4.2-r0: task do_configure: Started
NOTE: recipe iproute2-6.5.0-r0: task do_configure: Started
NOTE: recipe btrfs-tools-6.5.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2140 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.3.bb:do_configure)
NOTE: recipe btrfs-tools-6.5.3-r0: task do_configure: Started
NOTE: recipe mdadm-4.2-r0: task do_configure: Succeeded
NOTE: Running task 2141 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure_ptest_base)
NOTE: recipe iproute2-6.5.0-r0: task do_configure: Succeeded
NOTE: Running task 2142 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.5.0.bb:do_compile)
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2143 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile)
NOTE: recipe iproute2-6.5.0-r0: task do_compile: Started
NOTE: recipe mdadm-4.2-r0: task do_compile: Started
NOTE: recipe shadow-4.13-r0: task do_package_write_ipk: Succeeded
NOTE: recipe shadow-4.13-r0: task do_package_write_deb: Succeeded
NOTE: recipe shadow-4.13-r0: task do_package_write_rpm: Succeeded
NOTE: recipe btrfs-tools-6.5.3-r0: task do_configure: Succeeded
NOTE: Running task 2144 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.3.bb:do_compile)
NOTE: recipe btrfs-tools-6.5.3-r0: task do_compile: Started
NOTE: recipe mdadm-4.2-r0: task do_compile: Succeeded
NOTE: Running task 2145 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2146 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_install: Succeeded
NOTE: Running task 2147 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2148 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_package)
NOTE: recipe mdadm-4.2-r0: task do_package: Started
NOTE: recipe mdadm-4.2-r0: task do_package: Succeeded
NOTE: recipe iproute2-6.5.0-r0: task do_compile: Succeeded
NOTE: Running task 2149 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.5.0.bb:do_install)
NOTE: Running task 2150 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_packagedata)
NOTE: recipe iproute2-6.5.0-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-6.5.3-r0: task do_compile: Succeeded
NOTE: Running task 2151 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.3.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_packagedata unihash changed to 771851ed17a03bc31f64373be2820b6d4c0d3443693192c069133069d8265b74
NOTE: Setscene tasks completed
NOTE: recipe btrfs-tools-6.5.3-r0: task do_install: Started
NOTE: recipe iproute2-6.5.0-r0: task do_install: Succeeded
NOTE: Running task 2152 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.5.0.bb:do_package)
NOTE: recipe iproute2-6.5.0-r0: task do_package: Started
NOTE: recipe btrfs-tools-6.5.3-r0: task do_install: Succeeded
NOTE: Running task 2153 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.3.bb:do_package)
NOTE: recipe btrfs-tools-6.5.3-r0: task do_package: Started
NOTE: recipe iproute2-6.5.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.5.0.bb:do_package unihash changed to d3286eab224d1b59117ebb84cf1b99fb0e416a243a35a16190ba308d8a22397e
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.5.0.bb:do_packagedata became valid
NOTE: Running setscene task 781 of 781 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.5.0.bb:do_packagedata_setscene)
NOTE: recipe iproute2-6.5.0-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.5.0/temp/log.do_packagedata_setscene.2203636
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.5.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Setscene tasks completed
NOTE: Running task 2154 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.5.0.bb:do_packagedata)
NOTE: recipe iproute2-6.5.0-r0: task do_packagedata: Started
NOTE: recipe iproute2-6.5.0-r0: task do_packagedata: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_configure: Succeeded
NOTE: Running task 2155 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_configure_ptest_base)
NOTE: recipe btrfs-tools-6.5.3-r0: task do_package: Succeeded
NOTE: Running task 2156 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.3.bb:do_packagedata)
NOTE: recipe bash-5.2.21-r0: task do_configure_ptest_base: Started
NOTE: recipe btrfs-tools-6.5.3-r0: task do_packagedata: Started
NOTE: recipe bash-5.2.21-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2157 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_compile)
NOTE: recipe bash-5.2.21-r0: task do_compile: Started
NOTE: recipe bash-5.2.21-r0: task do_compile: Succeeded
NOTE: Running task 2158 of 2176 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_compile_ptest_base)
NOTE: recipe bash-5.2.21-r0: task do_compile_ptest_base: Started
NOTE: recipe btrfs-tools-6.5.3-r0: task do_packagedata: Failed
NOTE: recipe bash-5.2.21-r0: task do_compile_ptest_base: Succeeded
NOTE: Tasks Summary: Attempted 2158 tasks of which 2099 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231115085115.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231115085115.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.3.bb:do_packagedata
Summary: There were 29 ERROR messages, returning a non-zero exit code.
ERROR: iproute2-6.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-src went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.5.0-r0) [version-going-backwards]
ERROR: iproute2-6.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-dbg went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.5.0-r0) [version-going-backwards]
ERROR: iproute2-6.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-staticdev went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.5.0-r0) [version-going-backwards]
ERROR: iproute2-6.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-dev went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.5.0-r0) [version-going-backwards]
ERROR: iproute2-6.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-doc went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.5.0-r0) [version-going-backwards]
ERROR: iproute2-6.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-locale went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.5.0-r0) [version-going-backwards]
ERROR: iproute2-6.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-devlink went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.5.0-r0) [version-going-backwards]
ERROR: iproute2-6.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-genl went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.5.0-r0) [version-going-backwards]
ERROR: iproute2-6.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-ifstat went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.5.0-r0) [version-going-backwards]
ERROR: iproute2-6.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-ip went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.5.0-r0) [version-going-backwards]
ERROR: iproute2-6.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-lnstat went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.5.0-r0) [version-going-backwards]
ERROR: iproute2-6.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-nstat went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.5.0-r0) [version-going-backwards]
ERROR: iproute2-6.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-routel went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.5.0-r0) [version-going-backwards]
ERROR: iproute2-6.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-rtacct went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.5.0-r0) [version-going-backwards]
ERROR: iproute2-6.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-ss went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.5.0-r0) [version-going-backwards]
ERROR: iproute2-6.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-tc went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.5.0-r0) [version-going-backwards]
ERROR: iproute2-6.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-tipc went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.5.0-r0) [version-going-backwards]
ERROR: iproute2-6.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-rdma went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.5.0-r0) [version-going-backwards]
ERROR: iproute2-6.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2 went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.5.0-r0) [version-going-backwards]
ERROR: iproute2-6.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-bash-completion went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.5.0-r0) [version-going-backwards]
ERROR: iproute2-6.5.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: btrfs-tools-6.5.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-src went backwards which would break package feeds (from 0:6.6.1-r0 to 0:6.5.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.5.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-dbg went backwards which would break package feeds (from 0:6.6.1-r0 to 0:6.5.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.5.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-staticdev went backwards which would break package feeds (from 0:6.6.1-r0 to 0:6.5.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.5.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-dev went backwards which would break package feeds (from 0:6.6.1-r0 to 0:6.5.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.5.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-doc went backwards which would break package feeds (from 0:6.6.1-r0 to 0:6.5.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.5.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-locale went backwards which would break package feeds (from 0:6.6.1-r0 to 0:6.5.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.5.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools went backwards which would break package feeds (from 0:6.6.1-r0 to 0:6.5.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.5.3-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/btrfs-tools/6.5.3/temp/log.do_packagedata.2204788
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.3.bb:do_packagedata) failed with exit code '1'

--===============1699565600634421278==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/bash/bash-bashbug: PKGV changed from 5.2.15 [default] to 5.2.21 [default]
packages/core2-64-poky-linux/bash/bash-bashbug: PV changed from "5.2.15" to "5.2.21"
packages/core2-64-poky-linux/bash/bash-dbg: PKGV changed from 5.2.15 [default] to 5.2.21 [default]
packages/core2-64-poky-linux/bash/bash-dbg: PV changed from "5.2.15" to "5.2.21"
packages/core2-64-poky-linux/bash/bash-dbg: PKGSIZE changed from 3753408 to 3753664 (+0%)
packages/core2-64-poky-linux/bash/bash-dev: PKGV changed from 5.2.15 [default] to 5.2.21 [default]
packages/core2-64-poky-linux/bash/bash-dev: PV changed from "5.2.15" to "5.2.21"
packages/core2-64-poky-linux/bash/bash-doc: PKGV changed from 5.2.15 [default] to 5.2.21 [default]
packages/core2-64-poky-linux/bash/bash-doc: PV changed from "5.2.15" to "5.2.21"
packages/core2-64-poky-linux/bash/bash-loadable: PKGV changed from 5.2.15 [default] to 5.2.21 [default]
packages/core2-64-poky-linux/bash/bash-loadable: PV changed from "5.2.15" to "5.2.21"
packages/core2-64-poky-linux/bash/bash-locale-af: PKGV changed from 5.2.15 [default] to 5.2.21 [default]
packages/core2-64-poky-linux/bash/bash-locale-af: PV changed from "5.2.15" to "5.2.21"
packages/core2-64-poky-linux/bash/bash-locale-bg: PKGV changed from 5.2.15 [default] to 5.2.21 [default]
packages/core2-64-poky-linux/bash/bash-locale-bg: PV changed from "5.2.15" to "5.2.21"
packages/core2-64-poky-linux/bash/bash-locale-ca: PKGV changed from 5.2.15 [default] to 5.2.21 [default]
packages/core2-64-poky-linux/bash/bash-locale-ca: PV changed from "5.2.15" to "5.2.21"
packages/core2-64-poky-linux/bash/bash-locale-cs: PKGV changed from 5.2.15 [default] to 5.2.21 [default]
packages/core2-64-poky-linux/bash/bash-locale-cs: PV changed from "5.2.15" to "5.2.21"
packages/core2-64-poky-linux/bash/bash-locale-da: PKGV changed from 5.2.15 [default] to 5.2.21 [default]
packages/core2-64-poky-linux/bash/bash-locale-da: PV changed from "5.2.15" to "5.2.21"
packages/core2-64-poky-linux/bash/bash-locale-de: PKGV changed from 5.2.15 [default] to 5.2.21 [default]
packages/core2-64-poky-linux/bash/bash-locale-de: PV changed from "5.2.15" to "5.2.21"
packages/core2-64-poky-linux/bash/bash-locale-el: PKGV changed from 5.2.15 [default] to 5.2.21 [default]
packages/core2-64-poky-linux/bash/bash-locale-el: PV changed from "5.2.15" to "5.2.21"
packages/core2-64-poky-linux/bash/bash-locale-en+boldquot: PKGV changed from 5.2.15 [default] to 5.2.21 [default]
packages/core2-64-poky-linux/bash/bash-locale-en+boldquot: PV changed from "5.2.15" to "5.2.21"
packages/core2-64-poky-linux/bash/bash-locale-en+quot: PKGV changed from 5.2.15 [default] to 5.2.21 [default]
packages/core2-64-poky-linux/bash/bash-locale-en+quot: PV changed from "5.2.15" to "5.2.21"
packages/core2-64-poky-linux/bash/bash-locale-eo: PKGV changed from 5.2.15 [default] to 5.2.21 [default]
packages/core2-64-poky-linux/bash/bash-locale-eo: PV changed from "5.2.15" to "5.2.21"
packages/core2-64-poky-linux/bash/bash-locale-es: PKGV changed from 5.2.15 [default] to 5.2.21 [default]
packages/core2-64-poky-linux/bash/bash-locale-es: PV changed from "5.2.15" to "5.2.21"
packages/core2-64-poky-linux/bash/bash-locale-et: PKGV changed from 5.2.15 [default] to 5.2.21 [default]
packages/core2-64-poky-linux/bash/bash-locale-et: PV changed from "5.2.15" to "5.2.21"
packages/core2-64-poky-linux/bash/bash-locale-fi: PKGV changed from 5.2.15 [default] to 5.2.21 [default]
packages/core2-64-poky-linux/bash/bash-locale-fi: PV changed from "5.2.15" to "5.2.21"
packages/core2-64-poky-linux/bash/bash-locale-fr: PKGV changed from 5.2.15 [default] to 5.2.21 [default]
packages/core2-64-poky-linux/bash/bash-locale-fr: PV changed from "5.2.15" to "5.2.21"
packages/core2-64-poky-linux/bash/bash-locale-ga: PKGV changed from 5.2.15 [default] to 5.2.21 [default]
packages/core2-64-poky-linux/bash/bash-locale-ga: PV changed from "5.2.15" to "5.2.21"
packages/core2-64-poky-linux/bash/bash-locale-gl: PKGV changed from 5.2.15 [default] to 5.2.21 [default]
packages/core2-64-poky-linux/bash/bash-locale-gl: PV changed from "5.2.15" to "5.2.21"
packages/core2-64-poky-linux/bash/bash-locale-hr: PKGV changed from 5.2.15 [default] to 5.2.21 [default]
packages/core2-64-poky-linux/bash/bash-locale-hr: PV changed from "5.2.15" to "5.2.21"
packages/core2-64-poky-linux/bash/bash-locale-hu: PKGV changed from 5.2.15 [default] to 5.2.21 [default]
packages/core2-64-poky-linux/bash/bash-locale-hu: PV changed from "5.2.15" to "5.2.21"
packages/core2-64-poky-linux/bash/bash-locale-id: PKGV changed from 5.2.15 [default] to 5.2.21 [default]
packages/core2-64-poky-linux/bash/bash-locale-id: PV changed from "5.2.15" to "5.2.21"
packages/core2-64-poky-linux/bash/bash-locale-it: PKGV changed from 5.2.15 [default] to 5.2.21 [default]
packages/core2-64-poky-linux/bash/bash-locale-it: PV changed from "5.2.15" to "5.2.21"
packages/core2-64-poky-linux/bash/bash-locale-ja: PKGV changed from 5.2.15 [default] to 5.2.21 [default]
packages/core2-64-poky-linux/bash/bash-locale-ja: PV changed from "5.2.15" to "5.2.21"
packages/core2-64-poky-linux/bash/bash-locale-ko: PKGV changed from 5.2.15 [default] to 5.2.21 [default]
packages/core2-64-poky-linux/bash/bash-locale-ko: PV changed from "5.2.15" to "5.2.21"
packages/core2-64-poky-linux/bash/bash-locale-lt: PKGV changed from 5.2.15 [default] to 5.2.21 [default]
packages/core2-64-poky-linux/bash/bash-locale-lt: PV changed from "5.2.15" to "5.2.21"
packages/core2-64-poky-linux/bash/bash-locale-nb: PKGV changed from 5.2.15 [default] to 5.2.21 [default]
packages/core2-64-poky-linux/bash/bash-locale-nb: PV changed from "5.2.15" to "5.2.21"
packages/core2-64-poky-linux/bash/bash-locale-nl: PKGV changed from 5.2.15 [default] to 5.2.21 [default]
packages/core2-64-poky-linux/bash/bash-locale-nl: PV changed from "5.2.15" to "5.2.21"
packages/core2-64-poky-linux/bash/bash-locale-pl: PKGV changed from 5.2.15 [default] to 5.2.21 [default]
packages/core2-64-poky-linux/bash/bash-locale-pl: PV changed from "5.2.15" to "5.2.21"
packages/core2-64-poky-linux/bash/bash-locale-pt-br: PKGV changed from 5.2.15 [default] to 5.2.21 [default]
packages/core2-64-poky-linux/bash/bash-locale-pt-br: PV changed from "5.2.15" to "5.2.21"
packages/core2-64-poky-linux/bash/bash-locale-pt: PKGV changed from 5.2.15 [default] to 5.2.21 [default]
packages/core2-64-poky-linux/bash/bash-locale-pt: PV changed from "5.2.15" to "5.2.21"
packages/core2-64-poky-linux/bash/bash-locale-ro: PKGV changed from 5.2.15 [default] to 5.2.21 [default]
packages/core2-64-poky-linux/bash/bash-locale-ro: PV changed from "5.2.15" to "5.2.21"
packages/core2-64-poky-linux/bash/bash-locale-ru: PKGV changed from 5.2.15 [default] to 5.2.21 [default]
packages/core2-64-poky-linux/bash/bash-locale-ru: PV changed from "5.2.15" to "5.2.21"
packages/core2-64-poky-linux/bash/bash-locale-sk: PKGV changed from 5.2.15 [default] to 5.2.21 [default]
packages/core2-64-poky-linux/bash/bash-locale-sk: PV changed from "5.2.15" to "5.2.21"
packages/core2-64-poky-linux/bash/bash-locale-sl: PKGV changed from 5.2.15 [default] to 5.2.21 [default]
packages/core2-64-poky-linux/bash/bash-locale-sl: PV changed from "5.2.15" to "5.2.21"
packages/core2-64-poky-linux/bash/bash-locale-sr: PKGV changed from 5.2.15 [default] to 5.2.21 [default]
packages/core2-64-poky-linux/bash/bash-locale-sr: PV changed from "5.2.15" to "5.2.21"
packages/core2-64-poky-linux/bash/bash-locale-sv: PKGV changed from 5.2.15 [default] to 5.2.21 [default]
packages/core2-64-poky-linux/bash/bash-locale-sv: PV changed from "5.2.15" to "5.2.21"
packages/core2-64-poky-linux/bash/bash-locale-tr: PKGV changed from 5.2.15 [default] to 5.2.21 [default]
packages/core2-64-poky-linux/bash/bash-locale-tr: PV changed from "5.2.15" to "5.2.21"
packages/core2-64-poky-linux/bash/bash-locale-uk: PKGV changed from 5.2.15 [default] to 5.2.21 [default]
packages/core2-64-poky-linux/bash/bash-locale-uk: PV changed from "5.2.15" to "5.2.21"
packages/core2-64-poky-linux/bash/bash-locale-vi: PKGV changed from 5.2.15 [default] to 5.2.21 [default]
packages/core2-64-poky-linux/bash/bash-locale-vi: PV changed from "5.2.15" to "5.2.21"
packages/core2-64-poky-linux/bash/bash-locale-zh-cn: PKGV changed from 5.2.15 [default] to 5.2.21 [default]
packages/core2-64-poky-linux/bash/bash-locale-zh-cn: PV changed from "5.2.15" to "5.2.21"
packages/core2-64-poky-linux/bash/bash-locale-zh-tw: PKGV changed from 5.2.15 [default] to 5.2.21 [default]
packages/core2-64-poky-linux/bash/bash-locale-zh-tw: PV changed from "5.2.15" to "5.2.21"
packages/core2-64-poky-linux/bash/bash-ptest: PKGV changed from 5.2.15 [default] to 5.2.21 [default]
packages/core2-64-poky-linux/bash/bash-ptest: PV changed from "5.2.15" to "5.2.21"
packages/core2-64-poky-linux/bash/bash-ptest: PKGSIZE changed from 1584528 to 1585217 (+0%)
packages/core2-64-poky-linux/bash/bash-src: PKGV changed from 5.2.15 [default] to 5.2.21 [default]
packages/core2-64-poky-linux/bash/bash-src: PV changed from "5.2.15" to "5.2.21"
packages/core2-64-poky-linux/bash/bash-src: PKGSIZE changed from 4392455 to 4393564 (+0%)
packages/core2-64-poky-linux/bash/bash-staticdev: PKGV changed from 5.2.15 [default] to 5.2.21 [default]
packages/core2-64-poky-linux/bash/bash-staticdev: PV changed from "5.2.15" to "5.2.21"
packages/core2-64-poky-linux/bash/bash: PKGV changed from 5.2.15 [default] to 5.2.21 [default]
packages/core2-64-poky-linux/bash/bash: PV changed from "5.2.15" to "5.2.21"
packages/core2-64-poky-linux/bash: PKGV changed from 5.2.15 [default] to 5.2.21 [default]
packages/core2-64-poky-linux/bash: SRC_URI changed from "https://ftp.gnu.org/gnu/bash/bash-5.2.15.tar.gz;name=tarball file://mkbuiltins_have_stringize.patch file://build-tests.patch file://test-output.patch file://run-ptest file://run-bash-ptests file://fix-run-builtins.patch file://use_aclocal.patch" to "https://ftp.gnu.org/gnu/bash/bash-5.2.21.tar.gz;name=tarball file://mkbuiltins_have_stringize.patch file://build-tests.patch file://test-output.patch file://run-ptest file://run-bash-ptests file://fix-run-builtins.patch file://use_aclocal.patch"
packages/core2-64-poky-linux/bash: PV changed from "5.2.15" to "5.2.21"

--===============1699565600634421278==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bash-upgrade-5.2.15-5.2.21.patch"

RnJvbSBhMjVjNWVjNWJhZWU3ODc3YjEzN2Q0OTFlNzI1ZmY5YjRjN2U2ZTY1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTm92IDIwMjMgMDg6NTI6MDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
YXNoOiB1cGdyYWRlIDUuMi4xNSAtPiA1LjIuMjEKCi0tLQogbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L2Jhc2gve2Jhc2hfNS4yLjE1LmJiID0+IGJhc2hfNS4yLjIxLmJifSB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBl
cy1leHRlbmRlZC9iYXNoL3tiYXNoXzUuMi4xNS5iYiA9PiBiYXNoXzUuMi4yMS5iYn0gKDg5JSkK
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvYmFzaC9iYXNoXzUuMi4xNS5iYiBi
L21ldGEvcmVjaXBlcy1leHRlbmRlZC9iYXNoL2Jhc2hfNS4yLjIxLmJiCnNpbWlsYXJpdHkgaW5k
ZXggODklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9iYXNoL2Jhc2hfNS4yLjE1
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvYmFzaC9iYXNoXzUuMi4yMS5iYgpp
bmRleCBmNzhmNzlmY2M1Li42ZGY3M2I2NTNiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvYmFzaC9iYXNoXzUuMi4xNS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvYmFz
aC9iYXNoXzUuMi4yMS5iYgpAQCAtMTQsNyArMTQsNyBAQCBTUkNfVVJJID0gIiR7R05VX01JUlJP
Un0vYmFzaC8ke0JQfS50YXIuZ3o7bmFtZT10YXJiYWxsIFwKICAgICAgICAgICAgZmlsZTovL3Vz
ZV9hY2xvY2FsLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3RhcmJhbGwuc2hhMjU2
c3VtXSA9ICIxMzcyMDk2NWI1ZjRmYzNhMGQ0YjYxZGQzN2U3NTY1Yzc0MWRhOWE1YmUyNGVkYzJh
ZTAwMTgyZmMxYjM1ODhjIgorU1JDX1VSSVt0YXJiYWxsLnNoYTI1NnN1bV0gPSAiYzhlMzFiZGM1
OWI2OWFhZmZjNWIzNjUwOTkwNWJhM2U1Y2JiMTI3NDcwOTFkMjdiNGI5NzdmMDc4NTYwZDViOCIK
IAogREVCVUdfT1BUSU1JWkFUSU9OOmFwcGVuZDphcm12NCA9ICIgJHtAYmIudXRpbHMuY29udGFp
bnMoJ1RVTkVfQ0NBUkdTJywgJy1tdGh1bWInLCAnLWZvbWl0LWZyYW1lLXBvaW50ZXInLCAnJywg
ZCl9IgogREVCVUdfT1BUSU1JWkFUSU9OOmFwcGVuZDphcm12NSA9ICIgJHtAYmIudXRpbHMuY29u
dGFpbnMoJ1RVTkVfQ0NBUkdTJywgJy1tdGh1bWInLCAnLWZvbWl0LWZyYW1lLXBvaW50ZXInLCAn
JywgZCl9IgotLSAKMi4zOS4yCgo=

--===============1699565600634421278==--

