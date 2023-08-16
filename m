Return-Path: <auh@yoctoproject.org>
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 589CEC27C53
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 22:19:13 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.173803.1692224343970671896
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 15:19:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=JUOMGQXU;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=PV3ELmHE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018a006e4c69-24efb6bb-0a21-475c-a490-ec8a10390456-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692224343;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CHkpEHSg7oITbPEsyIPdTtDSnth1vRHyrzo2uXM3b+Q=;
	b=JUOMGQXUCqd42vK2TOCk9IjyIyTVAdT5XwM0IRmOdxDn9MJLC5Zjr/wZGXSs1Tea
	FEpBsH9q1hPZwLNmTK6q0tmnL5DztYIQbYFQWz1GetOS5n/g3SXNzeYornx6nmy35I4
	LqsYu6WG6hOdNXkPBkfPossonolNZ6H0S4NvO1yU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692224343;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CHkpEHSg7oITbPEsyIPdTtDSnth1vRHyrzo2uXM3b+Q=;
	b=PV3ELmHE/88M9G01vEksdtdXoUZHC6VD6Or/Qs3qDPHXQ/wgFRLJBQdN2LCvXqm7
	jF+MsjXv60dEymjM/IOzX/LJzd6qv9IEdUeOTF6UZoHdDWcR7ZYJUlYXLmka7e6+VLU
	ZaNpOiGBUgkGIWkvtHdtWjrqT1Y+lkIr+JLn+JM4=
Content-Type: multipart/mixed; boundary="===============2765862905246186234=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxml2: upgrading to 2.11.5 SUCCEEDED
Message-ID: <0101018a006e4c69-24efb6bb-0a21-475c-a490-ec8a10390456-000000@us-west-2.amazonses.com>
Date: Wed, 16 Aug 2023 22:19:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.16-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:19:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186170

--===============2765862905246186234==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libxml2* to *2.11.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxml2-upgrade-2.11.4-2.11.5.patch
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
From 378dc0130eeea524444b5e27e5ff29d30b1d8e04 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 16 Aug 2023 02:15:38 +0000
Subject: [PATCH] libxml2: upgrade 2.11.4 -> 2.11.5

---
 .../libxml/{libxml2_2.11.4.bb => libxml2_2.11.5.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/libxml/{libxml2_2.11.4.bb => libxml2_2.11.5.bb} (97%)

diff --git a/meta/recipes-core/libxml/libxml2_2.11.4.bb b/meta/recipes-core/libxml/libxml2_2.11.5.bb
similarity index 97%
rename from meta/recipes-core/libxml/libxml2_2.11.4.bb
rename to meta/recipes-core/libxml/libxml2_2.11.5.bb
index cbf20504f8..4cf6dd09a9 100644
--- a/meta/recipes-core/libxml/libxml2_2.11.4.bb
+++ b/meta/recipes-core/libxml/libxml2_2.11.5.bb
@@ -18,7 +18,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://install-tests.patch \
            "
 
-SRC_URI[archive.sha256sum] = "737e1d7f8ab3f139729ca13a2494fd17bf30ddb4b7a427cf336252cab57f57f7"
+SRC_URI[archive.sha256sum] = "3727b078c360ec69fa869de14bd6f75d7ee8d36987b071e6928d4720a28df3a6"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 BINCONFIG = "${bindir}/xml2-config"
-- 
2.39.2


--===============2765862905246186234==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1805 targets, 50 skipped, 0 masked, 0 errors.
Removing 59 recipes from the core2-32 sysroot...done.
Removing 61 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c64c70a6515ba7be97650b88b9505a30a0bd23ef"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 384 Local 163 Mirrors 0 Missed 221 Current 257 (42% match, 65% complete)
Removing 6 stale sstate objects for arch allarch...done.
Removing 5 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch qemux86...done.
NOTE: Executing Tasks
NOTE: Running setscene task 258 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 279 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 281 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 323 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 327 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 330 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 331 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 334 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 337 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 340 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 361 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 362 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 371 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 384 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 385 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 386 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 394 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 395 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 396 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 430 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 432 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 446 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 479 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 483 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 484 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 487 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_create_spdx_setscene)
NOTE: Running setscene task 488 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 492 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 493 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 503 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.26.4.bb:do_create_spdx_setscene)
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.36.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cmake-native-3.26.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-2.39.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe psmisc-23.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 505 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 506 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_recipe_qa_setscene)
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 507 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_recipe_qa_setscene)
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 508 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 509 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perl-5.36.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 510 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 511 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 512 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.39.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_create_spdx_setscene: Succeeded
NOTE: recipe cmake-native-3.26.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 513 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 514 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 515 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 517 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 518 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 520 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 522 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 523 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 530 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 531 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 532 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 533 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 534 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 536 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 537 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_create_spdx_setscene)
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 538 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 541 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe coreutils-9.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 542 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 543 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 545 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 546 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 547 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-5.2.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perl-5.36.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_recipe_qa_setscene: Started
NOTE: Running task 681 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa)
NOTE: Running task 688 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa)
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_packagedata_setscene: Started
NOTE: Running task 699 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_recipe_qa)
NOTE: Running task 700 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_recipe_qa)
NOTE: Running task 701 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_recipe_qa)
NOTE: Running task 704 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_recipe_qa)
NOTE: Running task 717 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_recipe_qa)
NOTE: Running task 718 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_recipe_qa)
NOTE: Running task 719 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa)
NOTE: Running task 720 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_recipe_qa)
NOTE: Running task 721 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa)
NOTE: Running task 742 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_recipe_qa)
NOTE: Running task 743 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_recipe_qa)
NOTE: Running task 748 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_recipe_qa)
NOTE: Running task 749 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_recipe_qa)
NOTE: Running task 750 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_recipe_qa)
NOTE: Running task 751 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_recipe_qa)
NOTE: Running task 752 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_recipe_qa)
NOTE: Running task 753 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_recipe_qa)
NOTE: Running task 754 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_recipe_qa)
NOTE: Running task 755 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_recipe_qa)
NOTE: Running task 756 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa)
NOTE: Running task 757 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa)
NOTE: Running task 758 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe psmisc-23.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Started
NOTE: Running task 759 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_recipe_qa)
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 760 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_recipe_qa)
NOTE: recipe bash-5.2.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa: Started
NOTE: Running task 762 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_fetch)
NOTE: Running task 766 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_fetch)
NOTE: Running task 777 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-locales_git.bb:do_recipe_qa)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa: Started
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe coreutils-9.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa: Started
NOTE: Running setscene task 550 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_recipe_qa_setscene)
NOTE: Running task 779 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_fetch)
NOTE: Running task 781 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_fetch)
NOTE: recipe libseccomp-2.5.4-r0: task do_recipe_qa: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa: Started
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa: Started
NOTE: recipe perl-5.36.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_recipe_qa: Started
NOTE: Running task 783 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_fetch)
NOTE: recipe libgpg-error-1.47-r0: task do_recipe_qa: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_recipe_qa: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa: Started
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_recipe_qa: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa: Started
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_recipe_qa: Started
NOTE: Running setscene task 551 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_recipe_qa_setscene)
NOTE: Running task 787 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_fetch)
NOTE: recipe libpam-1.5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_recipe_qa: Started
NOTE: recipe gnutls-3.8.0-r0: task do_recipe_qa: Started
NOTE: recipe file-5.45-r0: task do_recipe_qa: Started
NOTE: Running setscene task 552 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_recipe_qa_setscene)
NOTE: Running task 788 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_recipe_qa)
NOTE: recipe shadow-4.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 554 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_recipe_qa_setscene)
NOTE: Running task 809 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_recipe_qa)
NOTE: recipe base-passwd-3.6.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-linux-2.39.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa: Started
NOTE: recipe python3-3.11.4-r0: task do_recipe_qa: Started
NOTE: Running setscene task 555 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_recipe_qa: Started
NOTE: Running setscene task 556 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 557 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 558 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: Running task 813 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_fetch)
NOTE: recipe psmisc-23.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_fetch: Started
NOTE: recipe musl-locales-1.0+gitAUTOINC+5663f5bfd3-r0: task do_recipe_qa: Started
NOTE: recipe libcap-2.69-r0: task do_fetch: Started
NOTE: recipe elfutils-0.189-r0: task do_recipe_qa: Started
NOTE: recipe zlib-1.2.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_fetch: Started
NOTE: Running setscene task 559 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: Running task 850 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_recipe_qa)
NOTE: Running task 851 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_recipe_qa)
NOTE: Running task 852 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_recipe_qa)
NOTE: recipe bash-5.2.15-r0: task do_fetch: Succeeded
NOTE: recipe libcap-2.69-r0: task do_fetch: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_fetch: Succeeded
NOTE: recipe coreutils-9.3-r0: task do_fetch: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 561 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running task 853 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_unpack)
NOTE: Running task 854 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_unpack)
NOTE: recipe perl-5.36.1-r0: task do_fetch: Started
NOTE: Running task 855 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_recipe_qa)
NOTE: recipe coreutils-9.3-r0: task do_fetch: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 564 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_recipe_qa_setscene)
NOTE: recipe make-4.4.1-r0: task do_fetch: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 856 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_unpack)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mpfr-4.2.0-r0: task do_recipe_qa: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 857 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_unpack)
NOTE: Running task 858 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_fetch)
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe perl-5.36.1-r0: task do_fetch: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_recipe_qa: Started
NOTE: Running setscene task 567 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 570 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_recipe_qa_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/openssl/3.1.1/temp/log.do_packagedata_setscene.769991
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 571 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_package_setscene)
NOTE: recipe libgpg-error-1.47-r0: task do_recipe_qa: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 859 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_fetch)
NOTE: recipe gnutls-3.8.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe ca-certificates-20211016-r0: task do_recipe_qa: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_recipe_qa: Succeeded
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe tzdata-2023c-r0: task do_recipe_qa: Started
NOTE: Running task 860 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r90: task do_recipe_qa_setscene: Started
NOTE: Running task 861 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_fetch)
NOTE: Running task 862 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_fetch)
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 865 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_fetch)
NOTE: Running task 866 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_fetch)
NOTE: Running task 868 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 869 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_fetch)
NOTE: Running task 872 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_fetch)
NOTE: Running task 873 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_unpack)
NOTE: Running task 874 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_unpack)
NOTE: Running task 883 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_fetch)
NOTE: Running task 884 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_fetch)
NOTE: Running task 885 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_fetch)
NOTE: recipe libgcrypt-1.10.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 894 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_recipe_qa)
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 895 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_fetch)
NOTE: recipe musl-locales-1.0+gitAUTOINC+5663f5bfd3-r0: task do_recipe_qa: Succeeded
NOTE: recipe util-linux-2.39.1-r0: task do_fetch: Started
NOTE: recipe binutils-2.41-r0: task do_recipe_qa: Started
NOTE: recipe python3-3.11.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe libcap-2.69-r0: task do_unpack: Started
NOTE: Running task 896 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_fetch)
NOTE: recipe unzip-1_6.0-r5: task do_recipe_qa: Started
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 897 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_fetch)
NOTE: Running task 898 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_fetch)
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa: Succeeded
NOTE: Running task 899 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_fetch)
NOTE: Running task 900 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_fetch)
NOTE: Running task 901 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_fetch)
NOTE: Running task 902 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-locales_git.bb:do_fetch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_recipe_qa: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe file-5.45-r0: task do_recipe_qa: Succeeded
NOTE: recipe util-linux-2.39.1-r0: task do_fetch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_unpack: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.6.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 572 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe coreutils-9.3-r0: task do_unpack: Started
NOTE: recipe sed-4.9-r0: task do_unpack: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_recipe_qa: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_recipe_qa_setscene: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_fetch: Started
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-4.2.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe tzdata-2023c-r0: task do_recipe_qa: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_recipe_qa unihash changed to d81a94e76be5034a2872467c9154cc42cf4861ff86f7f4b8782bb8092789e16e
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_recipe_qa unihash changed to 80e031642b3b4f645759073c251fb41c1b80bfb2234535d63a0b8c47a01cbccb
NOTE: recipe libcap-2.69-r0: task do_unpack: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_fetch: Succeeded
NOTE: recipe binutils-2.41-r0: task do_recipe_qa: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_recipe_qa: Succeeded
NOTE: Running setscene task 569 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe sed-4.9-r0: task do_unpack: Succeeded
NOTE: Running setscene task 570 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 571 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 572 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 575 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: Running task 905 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_fetch)
NOTE: Running task 911 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_fetch)
NOTE: Running task 913 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: Running task 924 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_fetch)
NOTE: Running task 926 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_fetch)
NOTE: Running task 928 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_patch)
NOTE: Running task 929 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_fetch)
NOTE: Running task 930 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_fetch)
NOTE: Running task 931 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_fetch)
NOTE: Running task 932 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_fetch)
NOTE: Running task 933 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_fetch)
NOTE: Running task 934 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_fetch)
NOTE: Running task 937 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_fetch)
NOTE: Running task 941 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_patch)
NOTE: Running task 942 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_fetch)
NOTE: recipe libseccomp-2.5.4-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.47-r0: task do_fetch: Started
NOTE: Running task 943 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_fetch)
NOTE: Running task 949 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_unpack)
NOTE: Running task 952 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_fetch)
NOTE: recipe expat-2.5.0-r0: task do_fetch: Started
NOTE: recipe libffi-3.4.4-r0: task do_fetch: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_fetch: Started
NOTE: Running task 953 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_fetch)
NOTE: recipe make-4.4.1-r0: task do_unpack: Started
NOTE: Running task 954 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_fetch)
NOTE: recipe libedit-20221030-3.1-r0: task do_fetch: Started
NOTE: Running task 955 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_fetch)
NOTE: Running task 956 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: Running task 957 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_unpack)
NOTE: recipe libunistring-1.1-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.47-r0: task do_fetch: Succeeded
NOTE: Running task 964 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_unpack)
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_unpack: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe expat-2.5.0-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_fetch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_fetch: Started
NOTE: Running task 965 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_unpack)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_fetch: Started
NOTE: Running task 966 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_patch)
NOTE: recipe perl-5.36.1-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_fetch: Succeeded
NOTE: Running task 967 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_unpack)
NOTE: recipe nettle-3.9.1-r0: task do_fetch: Started
NOTE: recipe libunistring-1.1-r0: task do_fetch: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_fetch: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_fetch: Started
NOTE: recipe gcc-13.2.0-r0: task do_recipe_qa: Started
NOTE: recipe gnutls-3.8.0-r0: task do_fetch: Started
NOTE: recipe zstd-1.5.5-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Started
NOTE: Running task 968 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_unpack)
NOTE: Running task 969 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_unpack)
NOTE: Running task 970 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_unpack)
NOTE: Running task 971 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_unpack)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_fetch: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_fetch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_fetch: Succeeded
NOTE: Running task 972 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_unpack)
NOTE: Running task 973 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_unpack)
NOTE: Running task 974 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_unpack)
NOTE: recipe openssl-3.1.1-r0: task do_package_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Succeeded
NOTE: recipe musl-locales-1.0+gitAUTOINC+5663f5bfd3-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_fetch: Started
NOTE: recipe gnutls-3.8.0-r0: task do_fetch: Succeeded
NOTE: recipe make-4.4.1-r0: task do_unpack: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_fetch: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_fetch: Succeeded
NOTE: Running task 975 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe zstd-1.5.5-r0: task do_fetch: Succeeded
NOTE: recipe gcc-13.2.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 976 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_unpack)
NOTE: recipe python3-3.11.4-r0: task do_fetch: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe coreutils-9.3-r0: task do_unpack: Succeeded
NOTE: Running setscene task 582 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_create_spdx_setscene)
NOTE: Running task 977 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_unpack)
NOTE: Running task 978 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_unpack)
NOTE: Running task 979 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_unpack)
NOTE: Running task 980 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_unpack)
NOTE: Running task 981 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_unpack)
NOTE: Running task 982 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_unpack)
NOTE: Running task 983 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_unpack)
NOTE: Running task 984 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_patch)
NOTE: Running task 985 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_patch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: Running noexec task 986 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_fetch)
NOTE: recipe gdbm-1.23-r0: task do_fetch: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_fetch: Started
NOTE: recipe libcap-2.69-r0: task do_patch: Started
NOTE: recipe curl-8.2.1-r0: task do_fetch: Started
NOTE: recipe acl-2.3.1-r0: task do_fetch: Started
NOTE: recipe gdbm-1.23-r0: task do_fetch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Started
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Succeeded
NOTE: recipe file-5.45-r0: task do_fetch: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_fetch: Started
NOTE: recipe fts-1.2.7-r0: task do_fetch: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_fetch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Started
NOTE: recipe sed-4.9-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_fetch: Started
NOTE: recipe mpfr-4.2.0-r0: task do_fetch: Started
NOTE: recipe mpfr-4.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_fetch: Started
NOTE: recipe tzdata-2023c-r0: task do_fetch: Started
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Started
NOTE: recipe curl-8.2.1-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_fetch: Started
NOTE: Running task 987 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_unpack)
NOTE: Running task 988 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_unpack)
NOTE: recipe shadow-4.13-r0: task do_fetch: Started
NOTE: recipe psmisc-23.6-r0: task do_unpack: Started
NOTE: recipe libpam-1.5.3-r0: task do_fetch: Succeeded
NOTE: Running task 989 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_unpack)
NOTE: recipe ca-certificates-20211016-r0: task do_fetch: Started
NOTE: recipe util-linux-2.39.1-r0: task do_unpack: Started
NOTE: recipe binutils-2.41-r0: task do_fetch: Started
NOTE: recipe expat-2.5.0-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Started
NOTE: Running task 990 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_unpack)
NOTE: recipe libgpg-error-1.47-r0: task do_unpack: Started
NOTE: recipe bash-5.2.15-r0: task do_patch: Started
NOTE: Running task 991 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_unpack)
NOTE: Running task 992 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_unpack)
NOTE: recipe libmpc-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_unpack: Started
NOTE: recipe elfutils-0.189-r0: task do_fetch: Succeeded
NOTE: recipe tzdata-2023c-r0: task do_fetch: Succeeded
NOTE: recipe sed-4.9-r0: task do_patch: Succeeded
NOTE: Running task 993 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_unpack)
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_unpack: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_unpack: Started
NOTE: recipe shadow-4.13-r0: task do_fetch: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_unpack: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_unpack: Started
NOTE: Running task 994 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe libgcc-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe binutils-2.41-r0: task do_fetch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Succeeded
NOTE: Running task 1004 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_unpack)
NOTE: Running task 1005 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_unpack)
NOTE: Running task 1007 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_unpack)
NOTE: Running task 1009 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_prepare_recipe_sysroot)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_fetch: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_unpack: Started
NOTE: recipe nettle-3.9.1-r0: task do_unpack: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_unpack: Started
NOTE: recipe file-5.45-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Started
NOTE: recipe libxml2-2.11.5-r0: task do_unpack: Started
NOTE: recipe make-4.4.1-r0: task do_patch: Started
NOTE: Running task 1010 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_unpack)
NOTE: Running task 1011 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_unpack)
NOTE: recipe libgcrypt-1.10.2-r0: task do_unpack: Started
NOTE: Running task 1012 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_unpack)
NOTE: recipe gnutls-3.8.0-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_unpack: Started
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Started
NOTE: Running task 1013 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_unpack)
NOTE: recipe mpfr-4.2.0-r0: task do_unpack: Started
NOTE: Running setscene task 584 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.3-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_unpack: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_unpack: Succeeded
NOTE: recipe tzdata-2023c-r0: task do_unpack: Started
NOTE: Running setscene task 587 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Succeeded
NOTE: Running task 1014 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_patch)
NOTE: recipe libedit-20221030-3.1-r0: task do_unpack: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_unpack: Started
NOTE: recipe curl-8.2.1-r0: task do_unpack: Started
NOTE: recipe libmpc-1.3.1-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_unpack: Succeeded
NOTE: Running task 1015 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_patch)
NOTE: recipe acl-2.3.1-r0: task do_unpack: Started
NOTE: recipe ca-certificates-20211016-r0: task do_fetch: Succeeded
NOTE: recipe tzdata-2023c-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1016 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_patch)
NOTE: recipe libffi-3.4.4-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.13-r0: task do_unpack: Started
NOTE: Running task 1017 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_patch)
NOTE: Running task 1018 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_unpack)
NOTE: Running task 1019 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtirpc-1.3.3-r0: task do_unpack: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Started
NOTE: recipe elfutils-0.189-r0: task do_unpack: Started
NOTE: recipe tzdata-2023c-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Started
NOTE: recipe libgcc-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tzdata-2023c-r0: task do_unpack: Succeeded
NOTE: Running setscene task 588 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running task 1020 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_patch)
NOTE: Running task 1021 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_patch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1022 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_patch)
NOTE: Running task 1023 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_patch)
NOTE: recipe file-5.45-r0: task do_unpack: Started
NOTE: recipe gdbm-1.23-r0: task do_unpack: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_unpack: Succeeded
NOTE: recipe binutils-2.41-r0: task do_unpack: Started
NOTE: Running task 1024 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_patch)
NOTE: recipe zlib-1.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1025 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_patch)
NOTE: recipe nettle-3.9.1-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_patch: Started
NOTE: Running task 1026 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_patch)
NOTE: recipe expat-2.5.0-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.47-r0: task do_unpack: Succeeded
NOTE: recipe ca-certificates-20211016-r0: task do_unpack: Started
NOTE: recipe ca-certificates-20211016-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 1027 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_patch)
NOTE: recipe acl-2.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 1028 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_patch)
NOTE: recipe make-4.4.1-r0: task do_patch: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_patch: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_patch: Started
NOTE: Running task 1030 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_patch)
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_patch: Started
NOTE: recipe tzdata-2023c-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_patch: Started
NOTE: recipe ca-certificates-20211016-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_patch: Started
NOTE: recipe libmpc-1.3.1-r0: task do_patch: Started
NOTE: recipe gdbm-1.23-r0: task do_patch: Started
NOTE: recipe zlib-1.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.47-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Started
NOTE: recipe acl-2.3.1-r0: task do_patch: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 592 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe perl-5.36.1-r0: task do_unpack: Succeeded
NOTE: Running task 1042 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_patch)
NOTE: recipe tzdata-2023c-r0: task do_patch: Succeeded
NOTE: Running task 1043 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_deploy_source_date_epoch)
NOTE: recipe libedit-20221030-3.1-r0: task do_patch: Succeeded
NOTE: Running task 1044 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_deploy_source_date_epoch)
NOTE: recipe bash-5.2.15-r0: task do_patch: Succeeded
NOTE: recipe coreutils-9.3-r0: task do_patch: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_unpack: Succeeded
NOTE: Running task 1047 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_patch)
NOTE: recipe perl-5.36.1-r0: task do_patch: Started
NOTE: recipe tzdata-2023c-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe expat-2.5.0-r0: task do_patch: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1048 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_generate_toolchain_file)
NOTE: Running task 1049 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1050 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_patch)
NOTE: recipe libseccomp-2.5.4-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_patch: Succeeded
NOTE: Running task 1051 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_deploy_source_date_epoch)
NOTE: recipe libtirpc-1.3.3-r0: task do_patch: Succeeded
NOTE: Running task 1052 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe mpfr-4.2.0-r0: task do_unpack: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_patch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1053 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_patch)
NOTE: recipe libnsl2-2.0.0-r0: task do_patch: Started
NOTE: recipe libunistring-1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1054 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_deploy_source_date_epoch)
NOTE: recipe tzdata-2023c-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1055 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_patch)
NOTE: recipe libmpc-1.3.1-r0: task do_patch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_deploy_source_date_epoch unihash changed to cafdfd4d53ab3f6ffd493eac05ada44d1af274b9342fe447fb842ee8b9e6b44b
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Succeeded
NOTE: Running task 1056 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1057 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_configure)
NOTE: Running task 1058 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_patch)
NOTE: recipe psmisc-23.6-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1059 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_patch)
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_unpack: Succeeded
NOTE: Running task 1060 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe mpfr-4.2.0-r0: task do_patch: Started
NOTE: Running task 1061 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: Running task 1062 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_patch)
NOTE: recipe libseccomp-2.5.4-r0: task do_patch: Succeeded
NOTE: recipe shadow-4.13-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1063 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_patch)
NOTE: recipe gdbm-1.23-r0: task do_patch: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_patch: Started
NOTE: Running task 1064 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_patch)
NOTE: recipe libnsl2-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_unpack: Succeeded
NOTE: Running task 1066 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch)
NOTE: recipe libtasn1-4.19.0-r0: task do_patch: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpam-1.5.3-r0: task do_unpack: Succeeded
NOTE: recipe tzdata-2023c-r0: task do_configure: Started
NOTE: Running task 1067 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1068 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_deploy_source_date_epoch)
NOTE: recipe mpfr-4.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1069 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_patch)
NOTE: Running task 1070 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_patch)
NOTE: recipe unzip-1_6.0-r5: task do_patch: Started
NOTE: Running task 1071 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.47-r0: task do_patch: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-4.13-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe musl-locales-1.0+gitAUTOINC+5663f5bfd3-r0: task do_fetch: Succeeded
NOTE: Running task 1072 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_deploy_source_date_epoch)
NOTE: Running task 1073 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.45-r0: task do_unpack: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1074 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-locales_git.bb:do_unpack)
NOTE: recipe zstd-1.5.5-r0: task do_patch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1075 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_patch)
NOTE: Running task 1076 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_unpack)
NOTE: recipe argp-standalone-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_fetch: Succeeded
NOTE: recipe tzdata-2023c-r0: task do_configure: Succeeded
NOTE: Running task 1077 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_patch)
NOTE: recipe libpam-1.5.3-r0: task do_patch: Started
NOTE: recipe mpfr-4.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1078 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_unpack)
NOTE: recipe libgcrypt-1.10.2-r0: task do_unpack: Succeeded
NOTE: Running task 1079 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_compile)
NOTE: Running task 1080 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_patch)
NOTE: Running task 1081 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_unpack)
NOTE: recipe libffi-3.4.4-r0: task do_patch: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_patch: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_patch: Succeeded
NOTE: Running task 1082 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1083 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_deploy_source_date_epoch)
NOTE: recipe ca-certificates-20211016-r0: task do_unpack: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe musl-locales-1.0+gitAUTOINC+5663f5bfd3-r0: task do_unpack: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_unpack: Started
NOTE: Running task 1085 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1086 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_patch)
NOTE: recipe libxml2-2.11.5-r0: task do_unpack: Succeeded
NOTE: recipe file-5.45-r0: task do_patch: Started
NOTE: recipe fts-1.2.7-r0: task do_unpack: Started
NOTE: recipe acl-2.3.1-r0: task do_patch: Succeeded
NOTE: Running task 1087 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_patch)
NOTE: recipe curl-8.2.1-r0: task do_patch: Started
NOTE: recipe tzdata-2023c-r0: task do_compile: Started
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_unpack: Started
NOTE: recipe psmisc-23.6-r0: task do_patch: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_patch: Started
NOTE: Running task 1089 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_patch)
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1091 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libnsl2-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libffi-3.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-8.2.1-r0: task do_patch: Succeeded
NOTE: Running task 1092 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1093 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe file-5.45-r0: task do_patch: Succeeded
NOTE: recipe ca-certificates-20211016-r0: task do_patch: Started
NOTE: Running task 1094 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_deploy_source_date_epoch)
NOTE: recipe libseccomp-2.5.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpfr-4.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.39.1-r0: task do_unpack: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_patch: Started
NOTE: Running task 1096 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_patch)
NOTE: recipe gmp-6.3.0-r0: task do_patch: Started
NOTE: recipe gnutls-3.8.0-r0: task do_unpack: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1097 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_patch)
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgpg-error-1.47-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.45-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nettle-3.9.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_patch: Succeeded
NOTE: recipe shadow-4.13-r0: task do_patch: Succeeded
NOTE: Running task 1098 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1099 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_populate_lic)
NOTE: recipe libffi-3.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-2.39.1-r0: task do_patch: Started
NOTE: recipe gnutls-3.8.0-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe musl-locales-1.0+gitAUTOINC+5663f5bfd3-r0: task do_unpack: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_populate_lic: Started
NOTE: Running task 1101 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-locales_git.bb:do_patch)
NOTE: recipe curl-8.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe file-5.45-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tzdata-2023c-r0: task do_compile: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 1102 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_patch)
NOTE: recipe fts-1.2.7-r0: task do_unpack: Succeeded
NOTE: Running task 1103 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_install)
NOTE: Running task 1104 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_patch)
NOTE: recipe argp-standalone-1.4.1-r0: task do_unpack: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_patch: Succeeded
NOTE: Running task 1106 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_patch)
NOTE: recipe libgcrypt-1.10.2-r0: task do_patch: Succeeded
NOTE: Running task 1107 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_deploy_source_date_epoch)
NOTE: recipe ca-certificates-20211016-r0: task do_patch: Succeeded
NOTE: Running task 1108 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_deploy_source_date_epoch)
NOTE: recipe musl-locales-1.0+gitAUTOINC+5663f5bfd3-r0: task do_patch: Started
NOTE: recipe perl-5.36.1-r0: task do_patch: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_patch: Succeeded
NOTE: Running task 1110 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxml2-2.11.5-r0: task do_populate_lic: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_patch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_populate_lic unihash changed to c992c6d62e164464a570a932ee49dcaf25c935e5b2c0ed8062819281a47cbf7d
NOTE: recipe fts-1.2.7-r0: task do_patch: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_patch: Started
NOTE: recipe ca-certificates-20211016-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe elfutils-0.189-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-2.39.1-r0: task do_patch: Succeeded
NOTE: Running task 1111 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_patch)
NOTE: recipe libgcrypt-1.10.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxml2-2.11.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tzdata-2023c-r0: task do_install: Started
NOTE: recipe musl-locales-1.0+gitAUTOINC+5663f5bfd3-r0: task do_patch: Succeeded
NOTE: Running task 1113 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-locales_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1114 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-locales_git.bb:do_generate_toolchain_file)
NOTE: recipe gnutls-3.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_patch: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_patch: Succeeded
NOTE: Running task 1115 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_deploy_source_date_epoch)
NOTE: Running task 1116 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_deploy_source_date_epoch)
NOTE: recipe elfutils-0.189-r0: task do_patch: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_patch: Succeeded
NOTE: Running task 1117 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_deploy_source_date_epoch)
NOTE: recipe ca-certificates-20211016-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_deploy_source_date_epoch unihash changed to 9e3a870f60a407d147e354b9e315478be3e949a7dd36ab4aa9356466f0739fb1
NOTE: recipe musl-locales-1.0+gitAUTOINC+5663f5bfd3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1118 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_configure)
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe musl-locales-1.0+gitAUTOINC+5663f5bfd3-r0: task do_generate_toolchain_file: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe musl-locales-1.0+gitAUTOINC+5663f5bfd3-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ca-certificates-20211016-r0: task do_configure: Started
NOTE: recipe musl-locales-1.0+gitAUTOINC+5663f5bfd3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ca-certificates-20211016-r0: task do_configure: Succeeded
NOTE: Running task 1119 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_compile)
NOTE: recipe musl-obstack-1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_unpack: Succeeded
NOTE: Running task 1120 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_patch)
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ca-certificates-20211016-r0: task do_compile: Started
NOTE: recipe python3-3.11.4-r0: task do_patch: Started
NOTE: recipe ca-certificates-20211016-r0: task do_compile: Succeeded
NOTE: Running task 1121 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_install)
NOTE: recipe elfutils-0.189-r0: task do_patch: Succeeded
NOTE: Running task 1122 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_deploy_source_date_epoch)
NOTE: recipe unzip-1_6.0-r5: task do_patch: Succeeded
NOTE: Running task 1123 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe ca-certificates-20211016-r0: task do_install: Started
NOTE: recipe elfutils-0.189-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe elfutils-0.189-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tzdata-2023c-r0: task do_install: Succeeded
NOTE: Running task 1124 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_package)
NOTE: recipe tzdata-2023c-r0: task do_package: Started
NOTE: recipe python3-3.11.4-r0: task do_patch: Succeeded
NOTE: Running task 1125 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_deploy_source_date_epoch)
NOTE: recipe ca-certificates-20211016-r0: task do_install: Succeeded
NOTE: Running task 1126 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_package)
NOTE: recipe python3-3.11.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ca-certificates-20211016-r0: task do_package: Started
NOTE: recipe python3-3.11.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe binutils-2.41-r0: task do_unpack: Succeeded
NOTE: Running task 1127 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_patch)
NOTE: recipe binutils-2.41-r0: task do_patch: Started
NOTE: recipe ca-certificates-20211016-r0: task do_package: Succeeded
NOTE: Running task 1128 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata)
NOTE: recipe binutils-2.41-r0: task do_patch: Succeeded
NOTE: Running task 1129 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_deploy_source_date_epoch)
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata: Started
NOTE: recipe binutils-2.41-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe binutils-2.41-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 596 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 597 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 598 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 600 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 601 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 603 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 605 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 607 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 608 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 609 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_package_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_package_setscene: Started
NOTE: recipe tzdata-2023c-r0: task do_package: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 610 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 611 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 612 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 613 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: Running task 1142 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata)
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2023c-r0: task do_packagedata: Started
NOTE: recipe libgcc-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 615 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 616 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 617 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 618 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 619 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 621 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_recipe_qa_setscene: Started
NOTE: recipe tzdata-2023c-r0: task do_packagedata: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 628 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 631 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 632 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 635 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 636 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running task 1171 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-source_13.2.bb:do_unpack)
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 637 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 639 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 641 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1208 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-source_13.2.bb:do_patch)
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_patch: Started
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1210 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-source_13.2.bb:do_preconfigure)
NOTE: Running task 1215 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_deploy_source_date_epoch)
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_preconfigure: Started
NOTE: recipe gcc-13.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_preconfigure: Succeeded
NOTE: recipe gcc-13.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1268 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1269 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1270 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1288 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1289 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1292 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1293 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1300 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1308 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1314 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1319 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1320 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1327 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1330 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1339 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1349 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1353 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1354 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe expat-2.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1355 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_prepare_recipe_sysroot)
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.23-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1357 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_packagedata)
NOTE: Running task 1363 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpam-1.5.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gmp-6.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1383 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1386 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_collect_spdx_deps)
NOTE: recipe libtirpc-1.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1387 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-locales_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1388 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_collect_spdx_deps)
NOTE: recipe libgpg-error-1.47-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libffi-3.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1389 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_collect_spdx_deps)
NOTE: recipe acl-2.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zstd-1.5.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-5.2.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1391 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_collect_spdx_deps)
NOTE: recipe fts-1.2.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1392 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_collect_spdx_deps)
NOTE: Running task 1394 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_collect_spdx_deps)
NOTE: recipe openssl-3.1.1-r0: task do_packagedata: Started
NOTE: recipe sed-4.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe make-4.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1396 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_collect_spdx_deps)
NOTE: recipe libtirpc-1.3.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe musl-locales-1.0+gitAUTOINC+5663f5bfd3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1403 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_collect_spdx_deps)
NOTE: recipe gdbm-1.23-r0: task do_collect_spdx_deps: Started
NOTE: recipe libffi-3.4.4-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1404 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1406 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1414 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_collect_spdx_deps)
NOTE: recipe zstd-1.5.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1415 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_collect_spdx_deps)
NOTE: Running task 1416 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-locales_git.bb:do_collect_spdx_deps)
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1417 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_configure)
NOTE: recipe gdbm-1.23-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1418 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_configure)
NOTE: Running task 1419 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure)
NOTE: Running task 1420 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_configure)
NOTE: Running task 1421 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_package_write_rpm)
NOTE: recipe bzip2-1.0.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1422 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_configure)
NOTE: recipe libpam-1.5.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe psmisc-23.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1423 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_configure)
NOTE: recipe libedit-20221030-3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1424 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_configure)
NOTE: Running task 1425 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_configure)
NOTE: recipe libgpg-error-1.47-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_collect_spdx_deps: Started
NOTE: recipe make-4.4.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1426 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_configure)
NOTE: recipe argp-standalone-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1427 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_configure)
NOTE: recipe musl-locales-1.0+gitAUTOINC+5663f5bfd3-r0: task do_collect_spdx_deps: Started
NOTE: recipe zstd-1.5.5-r0: task do_configure: Started
NOTE: recipe bzip2-1.0.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_configure: Started
NOTE: Running task 1428 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_configure)
NOTE: Running task 1429 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_configure)
NOTE: Running task 1430 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_configure)
NOTE: recipe bash-5.2.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_configure: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Started
NOTE: Running task 1431 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_configure)
NOTE: recipe fts-1.2.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sed-4.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe make-4.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1432 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_configure)
NOTE: Running task 1433 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_configure)
NOTE: recipe bash-5.2.15-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe make-4.4.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_configure: Started
NOTE: recipe libgcc-13.2.0-r0: task do_package_write_rpm: Started
NOTE: Running task 1434 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_configure)
NOTE: recipe musl-locales-1.0+gitAUTOINC+5663f5bfd3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1435 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_configure)
NOTE: Running task 1436 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_configure)
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1437 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-locales_git.bb:do_configure)
NOTE: Running task 1438 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_configure)
NOTE: recipe musl-locales-1.0+gitAUTOINC+5663f5bfd3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_configure: Started
NOTE: recipe expat-2.5.0-r0: task do_configure: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_configure: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.47-r0: task do_configure: Started
NOTE: recipe openssl-3.1.1-r0: task do_packagedata: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_configure: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_configure: Started
NOTE: recipe libpam-1.5.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_configure: Started
NOTE: Running task 1439 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_configure)
NOTE: recipe argp-standalone-1.4.1-r0: task do_configure: Started
NOTE: Running task 1440 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_compile)
NOTE: recipe libedit-20221030-3.1-r0: task do_configure: Started
NOTE: recipe fts-1.2.7-r0: task do_configure: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_configure: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_configure: Started
NOTE: Running task 1442 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_configure)
NOTE: recipe psmisc-23.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sed-4.9-r0: task do_configure: Started
NOTE: Running task 1443 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_configure)
NOTE: recipe make-4.4.1-r0: task do_configure: Started
NOTE: recipe unzip-1_6.0-r5: task do_configure: Started
NOTE: recipe musl-locales-1.0+gitAUTOINC+5663f5bfd3-r0: task do_configure: Started
NOTE: recipe zstd-1.5.5-r0: task do_compile: Started
NOTE: recipe libpam-1.5.3-r0: task do_configure: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_configure: Started
NOTE: recipe psmisc-23.6-r0: task do_configure: Started
NOTE: recipe unzip-1_6.0-r5: task do_configure: Succeeded
NOTE: Running task 1444 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_compile)
NOTE: recipe unzip-1_6.0-r5: task do_compile: Started
NOTE: recipe musl-locales-1.0+gitAUTOINC+5663f5bfd3-r0: task do_configure: Succeeded
NOTE: Running task 1445 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-locales_git.bb:do_compile)
NOTE: recipe musl-locales-1.0+gitAUTOINC+5663f5bfd3-r0: task do_compile: Started
NOTE: recipe musl-locales-1.0+gitAUTOINC+5663f5bfd3-r0: task do_compile: Succeeded
NOTE: Running task 1446 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-locales_git.bb:do_install)
NOTE: recipe musl-locales-1.0+gitAUTOINC+5663f5bfd3-r0: task do_install: Started
NOTE: recipe expat-2.5.0-r0: task do_configure: Succeeded
NOTE: Running task 1447 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_configure_ptest_base)
NOTE: recipe musl-locales-1.0+gitAUTOINC+5663f5bfd3-r0: task do_install: Succeeded
NOTE: Running task 1448 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-locales_git.bb:do_package)
NOTE: recipe expat-2.5.0-r0: task do_configure_ptest_base: Started
NOTE: recipe expat-2.5.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1449 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_compile)
NOTE: recipe musl-locales-1.0+gitAUTOINC+5663f5bfd3-r0: task do_package: Started
NOTE: recipe expat-2.5.0-r0: task do_compile: Started
NOTE: recipe libgcc-13.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1450 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_compile)
NOTE: recipe argp-standalone-1.4.1-r0: task do_compile: Started
NOTE: recipe musl-locales-1.0+gitAUTOINC+5663f5bfd3-r0: task do_package: Succeeded
NOTE: Running task 1451 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata)
NOTE: recipe musl-locales-1.0+gitAUTOINC+5663f5bfd3-r0: task do_packagedata: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_compile: Succeeded
NOTE: Running task 1452 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_install)
NOTE: recipe argp-standalone-1.4.1-r0: task do_install: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Succeeded
NOTE: Running task 1453 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure_ptest_base)
NOTE: recipe musl-locales-1.0+gitAUTOINC+5663f5bfd3-r0: task do_packagedata: Succeeded
NOTE: Running task 1454 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-locales_git.bb:do_create_spdx)
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Started
NOTE: Running task 1455 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-locales_git.bb:do_package_write_rpm)
NOTE: recipe argp-standalone-1.4.1-r0: task do_install: Succeeded
NOTE: Running task 1456 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot)
NOTE: Running task 1457 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_package)
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1458 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile)
NOTE: recipe musl-locales-1.0+gitAUTOINC+5663f5bfd3-r0: task do_package_write_rpm: Started
NOTE: recipe musl-locales-1.0+gitAUTOINC+5663f5bfd3-r0: task do_create_spdx: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_package: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_configure: Succeeded
NOTE: Running task 1459 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_compile)
NOTE: recipe musl-obstack-1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 1460 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_compile)
NOTE: recipe expat-2.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1461 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_compile_ptest_base)
NOTE: recipe fts-1.2.7-r0: task do_configure: Succeeded
NOTE: Running task 1462 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_compile)
NOTE: recipe sqlite3-3_3.42.0-r0: task do_compile: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_compile: Started
NOTE: recipe musl-locales-1.0+gitAUTOINC+5663f5bfd3-r0: task do_create_spdx: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_compile_ptest_base: Started
NOTE: recipe fts-1.2.7-r0: task do_compile: Started
NOTE: recipe expat-2.5.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1463 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_install)
NOTE: recipe expat-2.5.0-r0: task do_install: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 1464 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_install)
NOTE: recipe expat-2.5.0-r0: task do_install: Succeeded
NOTE: Running task 1465 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_install_ptest_base)
NOTE: recipe musl-obstack-1.2.3-r0: task do_install: Started
NOTE: recipe expat-2.5.0-r0: task do_install_ptest_base: Started
NOTE: recipe fts-1.2.7-r0: task do_compile: Succeeded
NOTE: Running task 1466 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_install)
NOTE: recipe expat-2.5.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1467 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot)
NOTE: Running task 1468 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_package)
NOTE: recipe fts-1.2.7-r0: task do_install: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_configure: Succeeded
NOTE: Running task 1469 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_compile)
NOTE: recipe musl-obstack-1.2.3-r0: task do_install: Succeeded
NOTE: Running task 1470 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot)
NOTE: Running task 1471 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe expat-2.5.0-r0: task do_package: Started
NOTE: recipe acl-2.3.1-r0: task do_configure: Succeeded
NOTE: Running task 1472 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_configure_ptest_base)
NOTE: recipe libtirpc-1.3.3-r0: task do_compile: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_package: Started
NOTE: recipe acl-2.3.1-r0: task do_configure_ptest_base: Started
NOTE: recipe acl-2.3.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1473 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_compile)
NOTE: recipe argp-standalone-1.4.1-r0: task do_package: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_install: Succeeded
NOTE: Running task 1474 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata)
NOTE: Running task 1475 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot)
NOTE: Running task 1476 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot: Started
NOTE: recipe fts-1.2.7-r0: task do_package: Started
NOTE: recipe acl-2.3.1-r0: task do_compile: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1477 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile_ptest_base)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1478 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_install: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_compile: Succeeded
NOTE: Running task 1479 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_install)
NOTE: recipe libtirpc-1.3.3-r0: task do_install: Started
NOTE: recipe unzip-1_6.0-r5: task do_compile: Succeeded
NOTE: Running task 1480 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_install)
NOTE: recipe libseccomp-2.5.4-r0: task do_configure: Succeeded
NOTE: Running task 1481 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_configure_ptest_base)
NOTE: recipe unzip-1_6.0-r5: task do_install: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_configure_ptest_base: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1482 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_install: Succeeded
NOTE: Running task 1483 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install_ptest_base)
NOTE: recipe libseccomp-2.5.4-r0: task do_compile: Started
NOTE: recipe unzip-1_6.0-r5: task do_install: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_install: Succeeded
NOTE: Running task 1484 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package)
NOTE: Running task 1485 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot)
NOTE: Running task 1486 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_package)
NOTE: recipe acl-2.3.1-r0: task do_compile: Succeeded
NOTE: Running task 1487 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_compile_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Started
NOTE: recipe unzip-1_6.0-r5: task do_package: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_package: Started
NOTE: recipe gdbm-1.23-r0: task do_configure: Succeeded
NOTE: Running task 1488 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_configure_ptest_base)
NOTE: recipe acl-2.3.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_configure: Succeeded
NOTE: Running task 1489 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_compile)
NOTE: recipe gdbm-1.23-r0: task do_configure_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1490 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot)
NOTE: Running task 1491 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package)
NOTE: recipe gdbm-1.23-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1492 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_compile)
NOTE: recipe libedit-20221030-3.1-r0: task do_compile: Started
NOTE: recipe make-4.4.1-r0: task do_configure: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot: Started
NOTE: Running task 1493 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_package: Started
NOTE: recipe gdbm-1.23-r0: task do_compile: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_package: Succeeded
NOTE: recipe make-4.4.1-r0: task do_compile: Started
NOTE: Running task 1494 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata)
NOTE: recipe expat-2.5.0-r0: task do_package: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1495 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1496 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata: Started
NOTE: recipe acl-2.3.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1497 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_install)
NOTE: recipe fts-1.2.7-r0: task do_package: Succeeded
NOTE: Running task 1498 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata)
NOTE: recipe acl-2.3.1-r0: task do_install: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1499 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_configure)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1500 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_prepare_recipe_sysroot)
NOTE: recipe fts-1.2.7-r0: task do_packagedata: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_configure: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1501 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_create_spdx)
NOTE: recipe file-5.45-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-2.5.0-r0: task do_create_spdx: Started
NOTE: recipe libffi-3.4.4-r0: task do_configure: Succeeded
NOTE: recipe file-5.45-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1502 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_compile)
NOTE: Running task 1503 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_configure)
NOTE: recipe fts-1.2.7-r0: task do_packagedata: Succeeded
NOTE: recipe file-5.45-r0: task do_configure: Started
NOTE: recipe libffi-3.4.4-r0: task do_compile: Started
NOTE: recipe musl-locales-1.0+gitAUTOINC+5663f5bfd3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_create_spdx: Succeeded
NOTE: recipe make-4.4.1-r0: task do_compile: Succeeded
NOTE: Running task 1504 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_install)
NOTE: recipe libedit-20221030-3.1-r0: task do_compile: Succeeded
NOTE: recipe make-4.4.1-r0: task do_install: Started
NOTE: Running task 1505 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_install)
NOTE: recipe acl-2.3.1-r0: task do_install: Succeeded
NOTE: Running task 1506 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_install_ptest_base)
NOTE: recipe libedit-20221030-3.1-r0: task do_install: Started
NOTE: recipe acl-2.3.1-r0: task do_install_ptest_base: Started
NOTE: recipe acl-2.3.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1508 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package)
NOTE: recipe libffi-3.4.4-r0: task do_compile: Succeeded
NOTE: Running task 1509 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_install)
NOTE: recipe unzip-1_6.0-r5: task do_package: Succeeded
NOTE: Running task 1510 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata)
NOTE: recipe acl-2.3.1-r0: task do_package: Started
NOTE: recipe libffi-3.4.4-r0: task do_install: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_package: Succeeded
NOTE: Running task 1511 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_compile: Succeeded
NOTE: Running task 1512 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_compile_ptest_base)
NOTE: recipe libedit-20221030-3.1-r0: task do_install: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_compile_ptest_base: Started
NOTE: Running task 1513 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_populate_sysroot)
NOTE: Running task 1514 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_package)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1515 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_create_spdx)
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_package: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_create_spdx: Started
NOTE: recipe libffi-3.4.4-r0: task do_install: Succeeded
NOTE: recipe make-4.4.1-r0: task do_install: Succeeded
NOTE: Running task 1516 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot)
NOTE: Running task 1517 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_package)
NOTE: Running task 1518 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_package)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_compile: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_package: Started
NOTE: Running task 1519 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_compile_ptest_base)
NOTE: recipe make-4.4.1-r0: task do_package: Started
NOTE: recipe gdbm-1.23-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 1520 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_install)
NOTE: Running task 1521 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_collect_spdx_deps)
NOTE: recipe libseccomp-2.5.4-r0: task do_compile_ptest_base: Started
NOTE: recipe libgpg-error-1.47-r0: task do_configure: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_install: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1522 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_configure_ptest_base)
NOTE: recipe libnsl2-2.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_configure_ptest_base: Started
NOTE: recipe libgpg-error-1.47-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1523 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_compile)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package: Succeeded
NOTE: Running task 1524 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1525 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_install)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata: Succeeded
NOTE: Running task 1526 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx)
NOTE: recipe libseccomp-2.5.4-r0: task do_install: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx: Started
NOTE: recipe gdbm-1.23-r0: task do_install: Succeeded
NOTE: Running task 1527 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_install_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_install_ptest_base: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_install: Succeeded
NOTE: Running task 1528 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_install_ptest_base)
NOTE: recipe libffi-3.4.4-r0: task do_package: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1529 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata)
NOTE: recipe libedit-20221030-3.1-r0: task do_package: Succeeded
NOTE: Running task 1531 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_package)
NOTE: recipe libseccomp-2.5.4-r0: task do_install_ptest_base: Started
NOTE: Running task 1532 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1533 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_packagedata)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata: Started
NOTE: recipe perl-5.36.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.23-r0: task do_package: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata: Started
NOTE: recipe perl-5.36.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1534 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_configure)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1535 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_create_spdx)
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1536 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_create_spdx)
NOTE: recipe perl-5.36.1-r0: task do_configure: Started
NOTE: recipe acl-2.3.1-r0: task do_package: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_create_spdx: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package unihash changed to 8168f12b21c081a92a800ef58db0b398521107959698d36d8b6bdb96d0165797
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata became valid
NOTE: Running setscene task 641 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: recipe libedit-20221030-3.1-r0: task do_create_spdx: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_create_spdx: Succeeded
NOTE: recipe make-4.4.1-r0: task do_package: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_create_spdx: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_package unihash changed to 97046b27889b1ba37599d62ca8ba2e23dc335ea57c7d58fb711f0b4e9f7cc880
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata became valid
NOTE: Running setscene task 641 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1539 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_create_spdx)
NOTE: Running task 1540 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_rpm)
NOTE: recipe make-4.4.1-r0: task do_create_spdx: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1541 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_populate_sysroot)
NOTE: Running task 1542 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_package)
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_package: Started
NOTE: recipe make-4.4.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_configure: Succeeded
NOTE: Running task 1543 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_configure_ptest_base)
NOTE: recipe psmisc-23.6-r0: task do_configure: Succeeded
NOTE: Running task 1544 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_compile)
NOTE: recipe bash-5.2.15-r0: task do_configure_ptest_base: Started
NOTE: recipe psmisc-23.6-r0: task do_compile: Started
NOTE: recipe bash-5.2.15-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1545 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_compile)
NOTE: recipe libnsl2-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1546 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_compile)
NOTE: recipe bash-5.2.15-r0: task do_compile: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_compile: Started
NOTE: recipe psmisc-23.6-r0: task do_compile: Succeeded
NOTE: Running task 1547 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_install)
NOTE: recipe libnsl2-2.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1548 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_install)
NOTE: recipe psmisc-23.6-r0: task do_install: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_install: Started
NOTE: recipe gdbm-1.23-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_package unihash changed to 073e66c11086c5dbbd3c4dccec6e79404b029d988e5425fe1a0ebe2923c00dec
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata became valid
NOTE: Running setscene task 640 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_create_spdx_setscene)
NOTE: recipe gdbm-1.23-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 641 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_install: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: Running task 1549 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot)
NOTE: Running task 1550 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package)
NOTE: recipe libnsl2-2.0.0-r0: task do_package: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libpam-1.5.3-r0: task do_configure: Succeeded
NOTE: Running task 1553 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_configure_ptest_base)
NOTE: recipe libpam-1.5.3-r0: task do_configure_ptest_base: Started
NOTE: recipe libpam-1.5.3-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_install: Succeeded
NOTE: Running task 1554 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_compile)
NOTE: Running task 1555 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_package)
NOTE: recipe libpam-1.5.3-r0: task do_compile: Started
NOTE: recipe psmisc-23.6-r0: task do_package: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_compile: Succeeded
NOTE: Running task 1556 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_install)
NOTE: recipe zstd-1.5.5-r0: task do_install: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_compile: Succeeded
NOTE: Running task 1557 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_compile_ptest_base)
NOTE: recipe libgpg-error-1.47-r0: task do_compile_ptest_base: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_configure: Succeeded
NOTE: Running task 1558 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_compile)
NOTE: recipe libgpg-error-1.47-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1559 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_install)
NOTE: recipe libtasn1-4.19.0-r0: task do_compile: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_package: Succeeded
NOTE: Running task 1560 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata)
NOTE: recipe libgpg-error-1.47-r0: task do_install: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1561 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_create_spdx)
NOTE: recipe libnsl2-2.0.0-r0: task do_create_spdx: Started
NOTE: recipe bash-5.2.15-r0: task do_compile: Succeeded
NOTE: Running task 1562 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_compile_ptest_base)
NOTE: recipe bash-5.2.15-r0: task do_compile_ptest_base: Started
NOTE: recipe file-5.45-r0: task do_configure: Succeeded
NOTE: Running task 1563 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_compile)
NOTE: recipe libnsl2-2.0.0-r0: task do_create_spdx: Succeeded
NOTE: recipe file-5.45-r0: task do_compile: Started
NOTE: recipe sed-4.9-r0: task do_configure: Succeeded
NOTE: Running task 1564 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_configure_ptest_base)
NOTE: recipe sed-4.9-r0: task do_configure_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1565 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_compile)
NOTE: recipe libgpg-error-1.47-r0: task do_install: Succeeded
NOTE: recipe sed-4.9-r0: task do_compile: Started
NOTE: Running task 1566 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_install_ptest_base)
NOTE: recipe libgpg-error-1.47-r0: task do_install_ptest_base: Started
NOTE: recipe libgpg-error-1.47-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1567 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_populate_sysroot)
NOTE: Running task 1568 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_package)
NOTE: recipe libseccomp-2.5.4-r0: task do_package: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.47-r0: task do_package: Started
NOTE: Running task 1569 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_packagedata)
NOTE: recipe psmisc-23.6-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_package unihash changed to 29002f7feeb8c36e4ae8548457c95459a77c3cd9b905cee5d68de692ac5e168b
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata became valid
NOTE: Running setscene task 641 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata: Started
NOTE: recipe gmp-6.3.0-r0: task do_configure: Succeeded
NOTE: Running task 1570 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_compile)
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_compile: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe file-5.45-r0: task do_compile: Succeeded
NOTE: Running task 1572 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_install)
NOTE: recipe file-5.45-r0: task do_install: Started
NOTE: recipe file-5.45-r0: task do_install: Succeeded
NOTE: Running task 1573 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_populate_sysroot)
NOTE: Running task 1574 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_package)
NOTE: recipe file-5.45-r0: task do_populate_sysroot: Started
NOTE: recipe file-5.45-r0: task do_package: Started
NOTE: recipe file-5.45-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1575 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_install)
NOTE: recipe bash-5.2.15-r0: task do_install: Started
NOTE: recipe sed-4.9-r0: task do_compile: Succeeded
NOTE: Running task 1576 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_compile_ptest_base)
NOTE: recipe sed-4.9-r0: task do_compile_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1577 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_install)
NOTE: recipe sed-4.9-r0: task do_install: Started
NOTE: recipe libunistring-1.1-r0: task do_configure: Succeeded
NOTE: Running task 1578 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_compile)
NOTE: recipe libgpg-error-1.47-r0: task do_package: Succeeded
NOTE: Running task 1579 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata)
NOTE: recipe libunistring-1.1-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata: Started
NOTE: recipe file-5.45-r0: task do_package: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata: Succeeded
NOTE: Running task 1580 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_packagedata)
NOTE: recipe file-5.45-r0: task do_packagedata: Started
NOTE: recipe file-5.45-r0: task do_packagedata: Succeeded
NOTE: recipe sed-4.9-r0: task do_install: Succeeded
NOTE: Running task 1581 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_install_ptest_base)
NOTE: recipe sed-4.9-r0: task do_install_ptest_base: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_compile: Succeeded
NOTE: recipe sed-4.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1582 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_install)
NOTE: Running task 1583 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package)
NOTE: recipe libtasn1-4.19.0-r0: task do_install: Started
NOTE: recipe sed-4.9-r0: task do_package: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_install: Succeeded
NOTE: Running task 1584 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot)
NOTE: Running task 1585 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_package)
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_package: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_compile: Succeeded
NOTE: Running task 1586 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_install)
NOTE: recipe libtasn1-4.19.0-r0: task do_package: Succeeded
NOTE: Running task 1587 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata)
NOTE: recipe gmp-6.3.0-r0: task do_install: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_install: Succeeded
NOTE: Running task 1589 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1590 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_package)
NOTE: Running task 1591 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe bash-5.2.15-r0: task do_install: Succeeded
NOTE: recipe mpfr-4.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1592 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_install_ptest_base)
NOTE: recipe nettle-3.9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gmp-6.3.0-r0: task do_package: Started
NOTE: recipe mpfr-4.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1593 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_configure)
NOTE: recipe bash-5.2.15-r0: task do_install_ptest_base: Started
NOTE: recipe nettle-3.9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1594 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_configure)
NOTE: recipe mpfr-4.2.0-r0: task do_configure: Started
NOTE: recipe zstd-1.5.5-r0: task do_install: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_configure: Started
NOTE: Running task 1595 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_populate_sysroot)
NOTE: Running task 1596 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_package)
NOTE: recipe zstd-1.5.5-r0: task do_package: Started
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot: Started
NOTE: recipe sed-4.9-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package unihash changed to e4970b815d94859f5da3d6dfd0ff5240fe84f2a5e24f72e6bbff881f9afe949a
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata became valid
NOTE: Running setscene task 641 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1597 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libarchive-3.6.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libarchive-3.6.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1599 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_configure)
NOTE: recipe libarchive-3.6.2-r0: task do_configure: Started
NOTE: recipe zstd-1.5.5-r0: task do_package: Succeeded
NOTE: Running task 1600 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_packagedata)
NOTE: recipe gmp-6.3.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_package unihash changed to 3f398cda606c25b41d1f23c8fa5a68e1764d26a22e7380ec9ce0dc05402a4b97
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata became valid
NOTE: Running setscene task 639 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_packagedata: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe zstd-1.5.5-r0: task do_packagedata: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1602 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_configure_ptest_base)
NOTE: recipe nettle-3.9.1-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.9.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1603 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_compile)
NOTE: recipe nettle-3.9.1-r0: task do_compile: Started
NOTE: recipe bash-5.2.15-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1604 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package)
NOTE: recipe bash-5.2.15-r0: task do_package: Started
NOTE: recipe libpam-1.5.3-r0: task do_compile: Succeeded
NOTE: Running task 1605 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_compile_ptest_base)
NOTE: recipe libpam-1.5.3-r0: task do_compile_ptest_base: Started
NOTE: recipe libpam-1.5.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1606 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_install)
NOTE: recipe libpam-1.5.3-r0: task do_install: Started
NOTE: recipe nettle-3.9.1-r0: task do_compile: Succeeded
NOTE: Running task 1607 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_compile_ptest_base)
NOTE: recipe libpam-1.5.3-r0: task do_install: Succeeded
NOTE: Running task 1608 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_install_ptest_base)
NOTE: recipe nettle-3.9.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libpam-1.5.3-r0: task do_install_ptest_base: Started
NOTE: recipe bash-5.2.15-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package unihash changed to 4b4c3217aef62582f9a0433fe0ca70bf669672387147714fa0f76185db57ed90
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_create_spdx became valid
NOTE: Running setscene task 639 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_create_spdx_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1609 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot)
NOTE: Running task 1610 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_package)
NOTE: recipe bash-5.2.15-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot: Started
NOTE: recipe libpam-1.5.3-r0: task do_package: Started
NOTE: recipe bash-5.2.15-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 641 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot unihash changed to ad32f25a273d2771e5cf8d892bafd1998f0b8136bbbe592cb27b8e4a206b539a
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot became valid
NOTE: Running setscene task 632 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 641 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_populate_sysroot_setscene)
NOTE: Running task 1613 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe nettle-3.9.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1614 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_install)
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nettle-3.9.1-r0: task do_install: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1615 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1616 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-linux-2.39.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1617 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_configure)
NOTE: recipe shadow-4.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-2.69-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-2.39.1-r0: task do_configure: Started
NOTE: recipe libcap-2.69-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1618 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_configure)
NOTE: recipe shadow-4.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1619 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_configure)
NOTE: recipe libcap-2.69-r0: task do_configure: Started
NOTE: recipe shadow-4.13-r0: task do_configure: Started
NOTE: recipe libcap-2.69-r0: task do_configure: Succeeded
NOTE: Running task 1620 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_compile)
NOTE: recipe nettle-3.9.1-r0: task do_install: Succeeded
NOTE: recipe libcap-2.69-r0: task do_compile: Started
NOTE: Running task 1621 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_install_ptest_base)
NOTE: recipe nettle-3.9.1-r0: task do_install_ptest_base: Started
NOTE: recipe mpfr-4.2.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1622 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_compile)
NOTE: recipe mpfr-4.2.0-r0: task do_compile: Started
NOTE: recipe nettle-3.9.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1623 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_populate_sysroot)
NOTE: Running task 1624 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_package)
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.9.1-r0: task do_package: Started
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mpfr-4.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1625 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_install)
NOTE: recipe libcap-2.69-r0: task do_compile: Succeeded
NOTE: Running task 1626 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_install)
NOTE: recipe mpfr-4.2.0-r0: task do_install: Started
NOTE: recipe libcap-2.69-r0: task do_install: Started
NOTE: recipe mpfr-4.2.0-r0: task do_install: Succeeded
NOTE: Running task 1627 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_populate_sysroot)
NOTE: Running task 1628 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_package)
NOTE: recipe mpfr-4.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe mpfr-4.2.0-r0: task do_package: Started
NOTE: recipe mpfr-4.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1629 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmpc-1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-2.69-r0: task do_install: Succeeded
NOTE: Running task 1631 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1632 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.10.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmpc-1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1633 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_configure)
NOTE: recipe libmpc-1.3.1-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1634 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_configure)
NOTE: recipe coreutils-9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1635 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_configure)
NOTE: recipe libgcrypt-1.10.2-r0: task do_configure: Started
NOTE: recipe coreutils-9.3-r0: task do_configure: Started
NOTE: recipe mpfr-4.2.0-r0: task do_package: Succeeded
NOTE: Running task 1636 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_packagedata)
NOTE: recipe mpfr-4.2.0-r0: task do_packagedata: Started
NOTE: recipe libarchive-3.6.2-r0: task do_configure: Succeeded
NOTE: Running task 1637 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_compile)
NOTE: recipe libarchive-3.6.2-r0: task do_compile: Started
NOTE: recipe mpfr-4.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_package unihash changed to c567088ce7fe3fb3dfad4a1ecfce465ccbbd143a4aabb48838a806f19bf514bc
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_packagedata became valid
NOTE: Running setscene task 632 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 635 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 638 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_compile: Succeeded
NOTE: Running task 1638 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_install)
NOTE: recipe sqlite3-3_3.42.0-r0: task do_install: Started
NOTE: recipe nettle-3.9.1-r0: task do_package: Succeeded
NOTE: Running task 1639 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata)
NOTE: recipe nettle-3.9.1-r0: task do_packagedata: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1641 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_package)
NOTE: Running task 1642 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_create_spdx)
NOTE: recipe sqlite3-3_3.42.0-r0: task do_install: Succeeded
NOTE: Running task 1643 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_populate_sysroot)
NOTE: Running task 1644 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_package)
NOTE: recipe libpam-1.5.3-r0: task do_create_spdx: Started
NOTE: recipe util-linux-2.39.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libcap-2.69-r0: task do_package: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_package: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1645 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-3.11.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libarchive-3.6.2-r0: task do_compile: Succeeded
NOTE: Running task 1646 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_install)
NOTE: recipe python3-3.11.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1647 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_configure)
NOTE: recipe libarchive-3.6.2-r0: task do_install: Started
NOTE: recipe python3-3.11.4-r0: task do_configure: Started
NOTE: recipe libpam-1.5.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 1648 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_collect_spdx_deps)
NOTE: recipe shadow-4.13-r0: task do_collect_spdx_deps: Started
NOTE: recipe libarchive-3.6.2-r0: task do_install: Succeeded
NOTE: Running task 1649 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_populate_sysroot)
NOTE: Running task 1650 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_package)
NOTE: recipe shadow-4.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot: Started
NOTE: recipe libarchive-3.6.2-r0: task do_package: Started
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libcap-2.69-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_package unihash changed to 4e40bfb063d40fc0e8036adcaf5db1831a22b6a6d23996d40926c7aee741977c
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata became valid
NOTE: Running setscene task 638 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.42.0-r0: task do_package: Succeeded
NOTE: Running task 1651 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_packagedata)
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1653 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_create_spdx)
NOTE: recipe sqlite3-3_3.42.0-r0: task do_create_spdx: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1654 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_collect_spdx_deps)
NOTE: recipe shadow-4.13-r0: task do_configure: Succeeded
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_package became valid
NOTE: Running setscene task 641 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_package_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_configure: Succeeded
NOTE: Running task 1655 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_compile)
NOTE: recipe python3-3.11.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe shadow-4.13-r0: task do_package_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_compile: Started
NOTE: recipe python3-3.11.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shadow-4.13-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1661 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1662 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_create_spdx)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.13-r0: task do_create_spdx: Started
NOTE: recipe libmpc-1.3.1-r0: task do_compile: Succeeded
NOTE: Running task 1663 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_install)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1664 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_configure)
NOTE: recipe libarchive-3.6.2-r0: task do_package: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_install: Started
NOTE: Running task 1665 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_packagedata)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_configure: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_configure: Succeeded
NOTE: Running task 1666 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_compile)
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_compile: Started
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_compile: Succeeded
NOTE: Running task 1667 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_install)
NOTE: recipe libmpc-1.3.1-r0: task do_install: Succeeded
NOTE: Running task 1668 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_populate_sysroot)
NOTE: Running task 1669 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_package)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_install: Started
NOTE: recipe libmpc-1.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe libmpc-1.3.1-r0: task do_package: Started
NOTE: recipe shadow-4.13-r0: task do_create_spdx: Succeeded
NOTE: Running task 1670 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_collect_spdx_deps)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_install: Succeeded
NOTE: Running task 1671 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_collect_spdx_deps: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_package: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1672 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gcc-13.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcc-13.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1673 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_configure)
NOTE: recipe gcc-13.2.0-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1674 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_configure_ptest_base)
NOTE: recipe libgcrypt-1.10.2-r0: task do_configure_ptest_base: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1675 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_compile)
NOTE: recipe libgcrypt-1.10.2-r0: task do_compile: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package unihash changed to d7cc9da2cacd5737df81deae219aafe5c773f42c91266070bbb43121e768803b
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_create_spdx became valid
NOTE: Running setscene task 639 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_create_spdx_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_package: Succeeded
NOTE: Running task 1676 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 641 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_packagedata_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1679 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_package_write_rpm: Started
NOTE: recipe gcc-13.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1680 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_compile)
NOTE: recipe gcc-13.2.0-r0: task do_compile: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm unihash changed to 450a00263b1085ca8b7f493621b6b5c9379af3bde620f28550011aac55ac8856
NOTE: recipe perl-5.36.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1681 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_configure_ptest_base)
NOTE: recipe perl-5.36.1-r0: task do_configure_ptest_base: Started
NOTE: recipe perl-5.36.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1682 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_compile)
NOTE: recipe perl-5.36.1-r0: task do_compile: Started
NOTE: recipe util-linux-2.39.1-r0: task do_configure: Succeeded
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_package became valid
NOTE: Setscene tasks completed
NOTE: recipe libgcrypt-1.10.2-r0: task do_compile: Succeeded
NOTE: Running task 1690 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_compile_ptest_base)
NOTE: recipe libgcrypt-1.10.2-r0: task do_compile_ptest_base: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1691 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_install)
NOTE: recipe libgcrypt-1.10.2-r0: task do_install: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_install: Succeeded
NOTE: Running task 1692 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_install_ptest_base)
NOTE: recipe libgcrypt-1.10.2-r0: task do_install_ptest_base: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1693 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_populate_sysroot)
NOTE: Running task 1694 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_package)
NOTE: recipe libgcrypt-1.10.2-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_package: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_compile: Succeeded
NOTE: Running task 1695 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_install)
NOTE: recipe libunistring-1.1-r0: task do_install: Started
NOTE: recipe libunistring-1.1-r0: task do_install: Succeeded
NOTE: Running task 1696 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot)
NOTE: Running task 1697 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_package)
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot: Started
NOTE: recipe libunistring-1.1-r0: task do_package: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1698 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1699 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_configure)
NOTE: recipe libidn2-2.3.4-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_package: Succeeded
NOTE: Running task 1700 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_packagedata)
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_package: Succeeded
NOTE: Running task 1701 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata)
NOTE: recipe libunistring-1.1-r0: task do_packagedata: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_configure: Succeeded
NOTE: Running task 1702 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_configure_ptest_base)
NOTE: recipe python3-3.11.4-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-3.11.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1703 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_compile)
NOTE: recipe python3-3.11.4-r0: task do_compile: Started
NOTE: recipe coreutils-9.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1704 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_configure_ptest_base)
NOTE: recipe coreutils-9.3-r0: task do_configure_ptest_base: Started
NOTE: recipe coreutils-9.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1705 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_compile)
NOTE: recipe coreutils-9.3-r0: task do_compile: Started
NOTE: recipe python3-3.11.4-r0: task do_compile: Succeeded
NOTE: Running task 1706 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_compile_ptest_base)
NOTE: recipe python3-3.11.4-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-3.11.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1707 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_install)
NOTE: recipe python3-3.11.4-r0: task do_install: Started
NOTE: recipe libidn2-2.3.4-r0: task do_configure: Succeeded
NOTE: Running task 1708 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_compile)
NOTE: recipe libidn2-2.3.4-r0: task do_compile: Started
NOTE: recipe coreutils-9.3-r0: task do_compile: Succeeded
NOTE: Running task 1709 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_compile_ptest_base)
NOTE: recipe coreutils-9.3-r0: task do_compile_ptest_base: Started
NOTE: recipe coreutils-9.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1710 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_install)
NOTE: recipe coreutils-9.3-r0: task do_install: Started
NOTE: recipe libidn2-2.3.4-r0: task do_compile: Succeeded
NOTE: Running task 1711 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_install)
NOTE: recipe libidn2-2.3.4-r0: task do_install: Started
NOTE: recipe libidn2-2.3.4-r0: task do_install: Succeeded
NOTE: Running task 1712 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot)
NOTE: Running task 1713 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_package)
NOTE: recipe coreutils-9.3-r0: task do_install: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot: Started
NOTE: Running task 1714 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_install_ptest_base)
NOTE: recipe libidn2-2.3.4-r0: task do_package: Started
NOTE: recipe coreutils-9.3-r0: task do_install_ptest_base: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1715 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1716 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-8.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-8.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1717 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_configure)
NOTE: recipe gnutls-3.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1718 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_configure)
NOTE: recipe curl-8.2.1-r0: task do_configure: Started
NOTE: recipe gnutls-3.8.0-r0: task do_configure: Started
NOTE: recipe coreutils-9.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1719 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_package)
NOTE: recipe coreutils-9.3-r0: task do_package: Started
NOTE: recipe libidn2-2.3.4-r0: task do_package: Succeeded
NOTE: Running task 1720 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata: Succeeded
NOTE: recipe perl-5.36.1-r0: task do_compile: Succeeded
NOTE: Running task 1721 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_compile_ptest_base)
NOTE: recipe perl-5.36.1-r0: task do_compile_ptest_base: Started
NOTE: recipe perl-5.36.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1722 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_install)
NOTE: recipe perl-5.36.1-r0: task do_install: Started
NOTE: recipe coreutils-9.3-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_package unihash changed to ccfdc6398f88d21ffb1d8619356488bc3a354965bd47a7163a38b1ae972c0ce6
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_packagedata became valid
NOTE: Running setscene task 641 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.3-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe curl-8.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1724 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_configure_ptest_base)
NOTE: recipe curl-8.2.1-r0: task do_configure_ptest_base: Started
NOTE: recipe curl-8.2.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1725 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_compile)
NOTE: recipe curl-8.2.1-r0: task do_compile: Started
NOTE: recipe curl-8.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1726 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_compile_ptest_base)
NOTE: recipe curl-8.2.1-r0: task do_compile_ptest_base: Started
NOTE: recipe curl-8.2.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1727 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_install)
NOTE: recipe curl-8.2.1-r0: task do_install: Started
NOTE: recipe python3-3.11.4-r0: task do_install: Succeeded
NOTE: Running task 1728 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_install_ptest_base)
NOTE: recipe python3-3.11.4-r0: task do_install_ptest_base: Started
NOTE: recipe python3-3.11.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1729 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_populate_sysroot)
NOTE: Running task 1730 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_package)
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot: Started
NOTE: recipe python3-3.11.4-r0: task do_package: Started
NOTE: recipe curl-8.2.1-r0: task do_install: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1731 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_install_ptest_base)
NOTE: Running task 1732 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxml2-2.11.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-8.2.1-r0: task do_install_ptest_base: Started
NOTE: recipe libxml2-2.11.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1733 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_configure)
NOTE: recipe libxml2-2.11.5-r0: task do_configure: Started
NOTE: recipe curl-8.2.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1734 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_populate_sysroot)
NOTE: Running task 1735 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_package)
NOTE: recipe curl-8.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe curl-8.2.1-r0: task do_package: Started
NOTE: recipe curl-8.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe perl-5.36.1-r0: task do_install: Succeeded
NOTE: Running task 1736 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_install_ptest_base)
NOTE: recipe perl-5.36.1-r0: task do_install_ptest_base: Started
NOTE: recipe libxml2-2.11.5-r0: task do_configure: Succeeded
NOTE: Running task 1737 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_configure_ptest_base)
NOTE: recipe libxml2-2.11.5-r0: task do_configure_ptest_base: Started
NOTE: recipe libxml2-2.11.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1738 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_compile)
NOTE: recipe libxml2-2.11.5-r0: task do_compile: Started
NOTE: recipe curl-8.2.1-r0: task do_package: Succeeded
NOTE: Running task 1739 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_packagedata)
NOTE: recipe curl-8.2.1-r0: task do_packagedata: Started
NOTE: recipe curl-8.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe perl-5.36.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1740 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_package)
NOTE: recipe perl-5.36.1-r0: task do_package: Started
NOTE: recipe gnutls-3.8.0-r0: task do_configure: Succeeded
NOTE: Running task 1741 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_configure_ptest_base)
NOTE: recipe gnutls-3.8.0-r0: task do_configure_ptest_base: Started
NOTE: recipe gnutls-3.8.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1742 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_compile)
NOTE: recipe gnutls-3.8.0-r0: task do_compile: Started
NOTE: recipe python3-3.11.4-r0: task do_package: Succeeded
NOTE: Running task 1743 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_packagedata)
NOTE: recipe python3-3.11.4-r0: task do_packagedata: Started
NOTE: recipe python3-3.11.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1744 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_create_spdx)
NOTE: recipe python3-3.11.4-r0: task do_create_spdx: Started
NOTE: recipe python3-3.11.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 1745 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_collect_spdx_deps)
NOTE: recipe libxml2-2.11.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxml2-2.11.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_compile: Succeeded
NOTE: Running task 1746 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_compile_ptest_base)
NOTE: recipe libxml2-2.11.5-r0: task do_compile_ptest_base: Started
NOTE: recipe libxml2-2.11.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1747 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_install)
NOTE: recipe libxml2-2.11.5-r0: task do_install: Started
NOTE: recipe libxml2-2.11.5-r0: task do_install: Succeeded
NOTE: Running task 1748 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_install_ptest_base)
NOTE: recipe libxml2-2.11.5-r0: task do_install_ptest_base: Started
NOTE: recipe libxml2-2.11.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1749 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_package)
NOTE: Running task 1750 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_populate_sysroot)
NOTE: recipe libxml2-2.11.5-r0: task do_package: Started
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_compile: Succeeded
NOTE: Running task 1751 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_compile_ptest_base)
NOTE: recipe gnutls-3.8.0-r0: task do_compile_ptest_base: Started
NOTE: recipe gnutls-3.8.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1752 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_install)
NOTE: recipe gnutls-3.8.0-r0: task do_install: Started
NOTE: recipe gnutls-3.8.0-r0: task do_install: Succeeded
NOTE: Running task 1753 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_install_ptest_base)
NOTE: recipe gnutls-3.8.0-r0: task do_install_ptest_base: Started
NOTE: recipe libxml2-2.11.5-r0: task do_package: Succeeded
NOTE: Running task 1754 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_packagedata)
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata: Started
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1755 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_create_spdx)
NOTE: Running task 1756 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_package_write_rpm)
NOTE: Running task 1757 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_package_qa)
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx: Started
NOTE: recipe libxml2-2.11.5-r0: task do_package_write_rpm: Started
NOTE: recipe libxml2-2.11.5-r0: task do_package_qa: Started
NOTE: recipe gnutls-3.8.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1758 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_populate_sysroot)
NOTE: Running task 1759 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_package)
NOTE: recipe gnutls-3.8.0-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.8.0-r0: task do_package: Started
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1760 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_create_runtime_spdx)
NOTE: Running task 1761 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxml2-2.11.5-r0: task do_create_runtime_spdx: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1762 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_configure)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_configure: Started
NOTE: recipe libxml2-2.11.5-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_package_qa: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe perl-5.36.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_package unihash changed to f9807cd0f5cd8936acb7ec7dc95e0cce0ec042975bec8c59ecf550ea26e323d6
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_packagedata became valid
NOTE: Running setscene task 641 of 641 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_packagedata_setscene)
NOTE: recipe perl-5.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.0-r0: task do_package: Succeeded
NOTE: Running task 1763 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_packagedata)
NOTE: recipe perl-5.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1765 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package_write_rpm)
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata: Started
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm: Started
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_configure: Succeeded
NOTE: Running task 1766 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_compile)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_compile: Started
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package_write_rpm unihash changed to 73a42f482c5da7618f118635b4e758510d479c1ca5b22e1dd48697622c9b3b83
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_compile: Succeeded
NOTE: Running task 1767 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_install)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_install: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_install: Succeeded
NOTE: Running task 1768 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_populate_sysroot)
NOTE: Running task 1769 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_package)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_populate_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_package: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1770 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.189-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.189-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1771 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_configure)
NOTE: recipe elfutils-0.189-r0: task do_configure: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_package: Succeeded
NOTE: Running task 1772 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_packagedata)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_configure: Succeeded
NOTE: Running task 1773 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_configure_ptest_base)
NOTE: recipe elfutils-0.189-r0: task do_configure_ptest_base: Started
NOTE: recipe elfutils-0.189-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1774 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_compile)
NOTE: recipe elfutils-0.189-r0: task do_compile: Started
NOTE: recipe elfutils-0.189-r0: task do_compile: Succeeded
NOTE: Running task 1775 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_compile_ptest_base)
NOTE: recipe elfutils-0.189-r0: task do_compile_ptest_base: Started
NOTE: recipe gcc-13.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1776 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_install)
NOTE: recipe gcc-13.2.0-r0: task do_install: Started
NOTE: recipe elfutils-0.189-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1777 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_install)
NOTE: recipe elfutils-0.189-r0: task do_install: Started
NOTE: recipe elfutils-0.189-r0: task do_install: Succeeded
NOTE: Running task 1778 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_install_ptest_base)
NOTE: recipe elfutils-0.189-r0: task do_install_ptest_base: Started
NOTE: recipe elfutils-0.189-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1779 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_populate_sysroot)
NOTE: Running task 1780 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_package)
NOTE: recipe elfutils-0.189-r0: task do_populate_sysroot: Started
NOTE: recipe elfutils-0.189-r0: task do_package: Started
NOTE: recipe elfutils-0.189-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1781 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-2.41-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.41-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1782 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_configure)
NOTE: recipe binutils-2.41-r0: task do_configure: Started
NOTE: recipe gcc-13.2.0-r0: task do_install: Succeeded
NOTE: Running task 1783 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_package)
NOTE: recipe gcc-13.2.0-r0: task do_package: Started
NOTE: recipe binutils-2.41-r0: task do_configure: Succeeded
NOTE: Running task 1784 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_compile)
NOTE: recipe binutils-2.41-r0: task do_compile: Started
NOTE: recipe elfutils-0.189-r0: task do_package: Succeeded
NOTE: Running task 1785 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_packagedata)
NOTE: recipe elfutils-0.189-r0: task do_packagedata: Started
NOTE: recipe elfutils-0.189-r0: task do_packagedata: Succeeded
NOTE: recipe gcc-13.2.0-r0: task do_package: Succeeded
NOTE: Running task 1786 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_packagedata)
NOTE: recipe gcc-13.2.0-r0: task do_packagedata: Started
NOTE: recipe gcc-13.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe binutils-2.41-r0: task do_compile: Succeeded
NOTE: Running task 1787 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_install)
NOTE: recipe binutils-2.41-r0: task do_install: Started
NOTE: recipe binutils-2.41-r0: task do_install: Succeeded
NOTE: Running task 1788 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_package)
NOTE: recipe binutils-2.41-r0: task do_package: Started
NOTE: recipe binutils-2.41-r0: task do_package: Succeeded
NOTE: Running task 1789 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_packagedata)
NOTE: recipe binutils-2.41-r0: task do_packagedata: Started
NOTE: recipe binutils-2.41-r0: task do_packagedata: Succeeded
NOTE: Running task 1790 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_package_write_rpm)
NOTE: recipe python3-3.11.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-3.11.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1791 of 1791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_build)
NOTE: Tasks Summary: Attempted 1791 tasks of which 1184 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 16 ERROR messages, returning a non-zero exit code.
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-src went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-dbg went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcrypto went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libssl went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-conf went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-engines went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-misc went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-ossl-module-legacy went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-ptest went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-staticdev went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-dev went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-doc went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-locale went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-bin went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2765862905246186234==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1805 targets, 70 skipped, 0 masked, 0 errors.
Removing 2 recipes from the ppc7400 sysroot...done.
Removing 2 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c64c70a6515ba7be97650b88b9505a30a0bd23ef"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 169 Local 38 Mirrors 0 Missed 131 Current 460 (22% match, 79% complete)
Removing 28 stale sstate objects for arch ppc7400...done.
Removing 13 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 474 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 478 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 493 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 513 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 518 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: Running setscene task 585 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 588 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_create_spdx_setscene)
NOTE: Running setscene task 589 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_create_spdx_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_create_spdx_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 604 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_create_spdx_setscene)
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 608 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_create_spdx_setscene)
NOTE: Running setscene task 610 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 613 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 614 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_packagedata_setscene)
NOTE: Running task 827 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_recipe_qa)
NOTE: Running task 829 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_recipe_qa)
NOTE: Running task 869 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_recipe_qa)
NOTE: recipe base-passwd-3.6.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 915 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_recipe_qa)
NOTE: recipe libxcrypt-4.4.36-r0: task do_create_spdx_setscene: Started
NOTE: Running task 952 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_recipe_qa)
NOTE: Running task 999 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_recipe_qa)
NOTE: Running task 1000 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_recipe_qa)
NOTE: Running task 1001 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_recipe_qa)
NOTE: recipe zlib-1.2.13-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1022 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_recipe_qa)
NOTE: Running task 1041 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_recipe_qa)
NOTE: Running task 1044 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_recipe_qa)
NOTE: Running task 1045 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_recipe_qa)
NOTE: Running task 1046 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_recipe_qa)
NOTE: recipe ncurses-6.4-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1130 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_recipe_qa)
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_recipe_qa: Started
NOTE: Running task 1184 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_package)
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa: Started
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_recipe_qa: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_recipe_qa: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_recipe_qa: Started
NOTE: recipe gnutls-3.8.0-r0: task do_recipe_qa: Started
NOTE: recipe file-5.45-r0: task do_recipe_qa: Started
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa: Started
NOTE: recipe libarchive-3.6.2-r0: task do_recipe_qa: Started
NOTE: recipe zlib-1.2.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_recipe_qa: Started
NOTE: recipe mpfr-4.2.0-r0: task do_recipe_qa: Started
NOTE: recipe ncurses-6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_recipe_qa: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_recipe_qa: Succeeded
NOTE: recipe file-5.45-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mpfr-4.2.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 623 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_package_setscene)
NOTE: Running task 1198 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_fetch)
NOTE: Running task 1199 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_fetch)
NOTE: Running task 1211 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_fetch)
NOTE: Running task 1217 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1218 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_fetch)
NOTE: Running task 1225 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_fetch)
NOTE: Running task 1231 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_fetch)
NOTE: Running task 1232 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_fetch)
NOTE: Running task 1233 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_fetch)
NOTE: Running task 1234 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_fetch)
NOTE: Running task 1235 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_fetch)
NOTE: Running task 1237 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_fetch)
NOTE: Running task 1238 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_fetch)
NOTE: Running task 1239 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_fetch)
NOTE: Running task 1251 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_fetch)
NOTE: Running task 1267 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_recipe_qa)
NOTE: Running task 1296 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_package)
NOTE: Running task 1318 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_package)
NOTE: Running task 1338 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_recipe_qa)
NOTE: Running task 1339 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_recipe_qa)
NOTE: Running task 1381 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package)
NOTE: recipe libgpg-error-1.47-r0: task do_fetch: Started
NOTE: recipe nettle-3.9.1-r0: task do_fetch: Started
NOTE: recipe libunistring-1.1-r0: task do_fetch: Started
NOTE: Running task 1395 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_recipe_qa)
NOTE: Running task 1400 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_collect_spdx_deps)
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Started
NOTE: recipe gmp-6.3.0-r0: task do_package: Started
NOTE: Running task 1408 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libunistring-1.1-r0: task do_fetch: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.47-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpfr-4.2.0-r0: task do_fetch: Started
NOTE: recipe libmpc-1.3.1-r0: task do_recipe_qa: Started
NOTE: recipe curl-8.2.1-r0: task do_fetch: Started
NOTE: recipe gnutls-3.8.0-r0: task do_fetch: Started
NOTE: recipe libxml2-2.11.5-r0: task do_fetch: Started
NOTE: recipe file-5.45-r0: task do_fetch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Started
NOTE: recipe elfutils-0.189-r0: task do_fetch: Started
NOTE: Running task 1426 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_unpack)
NOTE: Running task 1427 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_unpack)
NOTE: Running task 1428 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_fetch: Succeeded
NOTE: recipe mpfr-4.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_fetch: Succeeded
NOTE: Running task 1429 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1430 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_unpack)
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Succeeded
NOTE: Running task 1431 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1432 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_unpack)
NOTE: Running task 1433 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_unpack)
NOTE: Running task 1434 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_unpack)
NOTE: Running task 1435 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.8.0-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_fetch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_recipe_qa: Started
NOTE: Running task 1436 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_unpack)
NOTE: Running task 1437 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_unpack)
NOTE: Running task 1438 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_unpack)
NOTE: Running task 1439 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-2.41-r0: task do_recipe_qa: Started
NOTE: Running task 1440 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_unpack)
NOTE: Running task 1441 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_unpack)
NOTE: Running task 1442 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe file-5.45-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_package_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_fetch: Succeeded
NOTE: Running task 1446 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_unpack)
NOTE: recipe gcc-13.2.0-r0: task do_recipe_qa: Started
NOTE: Running task 1447 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_unpack)
NOTE: Running task 1448 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1452 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_package)
NOTE: recipe sed-4.9-r0: task do_package: Started
NOTE: Running task 1453 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_package)
NOTE: recipe libpam-1.5.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe make-4.4.1-r0: task do_package: Started
NOTE: Running task 1456 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_collect_spdx_deps)
NOTE: recipe libgpg-error-1.47-r0: task do_unpack: Started
NOTE: recipe nettle-3.9.1-r0: task do_unpack: Started
NOTE: Running task 1457 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_unpack)
NOTE: Running task 1458 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_collect_spdx_deps)
NOTE: recipe glibc-locale-2.37-r1: task do_package: Started
NOTE: Running task 1459 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_collect_spdx_deps)
NOTE: recipe gcc-13.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunistring-1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1462 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_package_write_rpm)
NOTE: recipe nettle-3.9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Started
NOTE: recipe curl-8.2.1-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_unpack: Started
NOTE: recipe libunistring-1.1-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.47-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libarchive-3.6.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpfr-4.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmpc-1.3.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_unpack: Started
NOTE: recipe libxml2-2.11.5-r0: task do_unpack: Started
NOTE: recipe mpfr-4.2.0-r0: task do_unpack: Started
NOTE: recipe file-5.45-r0: task do_unpack: Started
NOTE: Running task 1463 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_fetch)
NOTE: recipe unzip-1_6.0-r5: task do_recipe_qa: Succeeded
NOTE: recipe file-5.45-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1464 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: recipe binutils-2.41-r0: task do_recipe_qa: Succeeded
NOTE: recipe make-4.4.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe gcc-13.2.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_unpack: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Succeeded
NOTE: Running task 1465 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_patch)
NOTE: Running task 1466 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_patch)
NOTE: recipe bash-5.2.15-r0: task do_collect_spdx_deps: Started
NOTE: recipe glibc-locale-2.37-r1: task do_collect_spdx_deps: Started
NOTE: recipe psmisc-23.6-r0: task do_package: Started
NOTE: Running task 1467 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_patch)
NOTE: Running task 1468 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_fetch)
NOTE: Running noexec task 1469 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_fetch)
NOTE: recipe libmpc-1.3.1-r0: task do_fetch: Started
NOTE: recipe perl-5.36.1-r0: task do_package: Started
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Started
NOTE: recipe libmpc-1.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 1470 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_unpack)
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Succeeded
NOTE: recipe gcc-13.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_patch: Started
NOTE: recipe libgcc-13.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libgpg-error-1.47-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_patch: Started
NOTE: Running task 1471 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_patch)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_patch: Started
NOTE: recipe binutils-2.41-r0: task do_fetch: Started
NOTE: recipe libunistring-1.1-r0: task do_unpack: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Succeeded
NOTE: Running task 1472 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_patch)
NOTE: recipe bash-5.2.15-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1473 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_patch)
NOTE: Running task 1474 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_unpack)
NOTE: Running task 1475 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1476 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_patch)
NOTE: Running task 1477 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_create_spdx)
NOTE: recipe mpfr-4.2.0-r0: task do_unpack: Succeeded
NOTE: recipe binutils-2.41-r0: task do_fetch: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_unpack: Started
NOTE: Running task 1478 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_unpack)
NOTE: recipe mpfr-4.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1479 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_patch)
NOTE: recipe nettle-3.9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Started
NOTE: recipe libunistring-1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_patch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Started
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Started
NOTE: recipe libpam-1.5.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.45-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.47-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1480 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_configure)
NOTE: Running task 1481 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_deploy_source_date_epoch)
NOTE: recipe libmpc-1.3.1-r0: task do_unpack: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_patch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_create_spdx: Started
NOTE: Running task 1482 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_patch)
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Succeeded
NOTE: recipe mpfr-4.2.0-r0: task do_patch: Started
NOTE: recipe binutils-2.41-r0: task do_unpack: Started
NOTE: Running task 1483 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libunistring-1.1-r0: task do_patch: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1484 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1485 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_patch)
NOTE: recipe mpfr-4.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1486 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmpc-1.3.1-r0: task do_patch: Started
NOTE: recipe libpam-1.5.3-r0: task do_configure: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpfr-4.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_patch: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_unpack: Succeeded
NOTE: Running task 1487 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1488 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_patch)
NOTE: recipe file-5.45-r0: task do_unpack: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_patch: Succeeded
NOTE: Running task 1489 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_patch)
NOTE: recipe libmpc-1.3.1-r0: task do_patch: Succeeded
NOTE: Running task 1490 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxml2-2.11.5-r0: task do_unpack: Succeeded
NOTE: Running task 1491 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_deploy_source_date_epoch)
NOTE: Running task 1492 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_patch)
NOTE: Running task 1493 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libtasn1-4.19.0-r0: task do_patch: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_patch: Succeeded
NOTE: Running task 1494 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1495 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_deploy_source_date_epoch)
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Succeeded
NOTE: Running task 1496 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_patch)
NOTE: recipe libgcrypt-1.10.2-r0: task do_patch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.45-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmpc-1.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgpg-error-1.47-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxml2-2.11.5-r0: task do_patch: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.45-r0: task do_patch: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1497 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_deploy_source_date_epoch)
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_patch: Started
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpfr-4.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1498 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_configure)
NOTE: Running task 1499 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_configure)
NOTE: recipe file-5.45-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 1500 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_patch)
NOTE: recipe libxml2-2.11.5-r0: task do_patch: Succeeded
NOTE: Running task 1501 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1502 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_populate_lic)
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1503 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_configure)
NOTE: recipe libmpc-1.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpfr-4.2.0-r0: task do_configure: Started
NOTE: recipe libunistring-1.1-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.47-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1504 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_configure)
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1505 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_configure)
NOTE: Running task 1506 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_configure)
NOTE: recipe curl-8.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_patch: Started
NOTE: recipe libxml2-2.11.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxml2-2.11.5-r0: task do_populate_lic: Started
NOTE: recipe libarchive-3.6.2-r0: task do_configure: Started
NOTE: recipe nettle-3.9.1-r0: task do_configure: Started
NOTE: recipe file-5.45-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_configure: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_configure: Started
NOTE: Running task 1507 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_configure)
NOTE: recipe elfutils-0.189-r0: task do_unpack: Succeeded
NOTE: Running task 1508 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_patch)
NOTE: recipe make-4.4.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_populate_lic unihash changed to c992c6d62e164464a570a932ee49dcaf25c935e5b2c0ed8062819281a47cbf7d
NOTE: recipe file-5.45-r0: task do_configure: Started
NOTE: recipe glibc-locale-2.37-r1: task do_collect_spdx_deps: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_patch: Started
NOTE: recipe libxml2-2.11.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_patch: Succeeded
NOTE: Running task 1509 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_deploy_source_date_epoch)
NOTE: recipe gnutls-3.8.0-r0: task do_patch: Succeeded
NOTE: Running task 1510 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcrypt-1.10.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_patch: Succeeded
NOTE: Running task 1511 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_deploy_source_date_epoch)
NOTE: recipe elfutils-0.189-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe elfutils-0.189-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_create_spdx: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_patch: Succeeded
NOTE: Running task 1512 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1513 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_configure)
NOTE: recipe unzip-1_6.0-r5: task do_configure: Started
NOTE: recipe libgcc-13.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_configure: Succeeded
NOTE: Running task 1514 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_compile)
NOTE: recipe unzip-1_6.0-r5: task do_compile: Started
NOTE: recipe make-4.4.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_package unihash changed to 39e5ce5fa3772848cac34964d4b0fb4a80621bc5321125f4bd52d5232ff0179e
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata became valid
NOTE: Running setscene task 623 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_package unihash changed to aa3019142a9a2fc1432b74366a4444e46efa060671c846414293a7e446ba282e
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata became valid
NOTE: Running setscene task 621 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe psmisc-23.6-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_package unihash changed to ae1dcbce731e30ef05210d35a054d250f0377d142f837e8d7a74543cb14ceb85
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata became valid
NOTE: Running setscene task 623 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata_setscene)
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.41-r0: task do_unpack: Succeeded
NOTE: Running task 1516 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_create_spdx)
NOTE: Running task 1517 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_patch)
NOTE: Running task 1518 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_rpm)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_create_spdx: Started
NOTE: recipe binutils-2.41-r0: task do_patch: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm: Started
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_create_spdx: Succeeded
NOTE: recipe binutils-2.41-r0: task do_patch: Succeeded
NOTE: Running task 1521 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_deploy_source_date_epoch)
NOTE: recipe binutils-2.41-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe binutils-2.41-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_configure: Succeeded
NOTE: Running task 1522 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_configure_ptest_base)
NOTE: recipe nettle-3.9.1-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.9.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1523 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_compile)
NOTE: recipe nettle-3.9.1-r0: task do_compile: Started
NOTE: recipe sed-4.9-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package unihash changed to 4c8c9b6afb464026f53db273ef1ec0e12798e5a28b7bf56a49103b695c65c836
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata became valid
NOTE: Running setscene task 623 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 624 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 625 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 626 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/openssl/3.1.1/temp/log.do_packagedata_setscene.3742326
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 627 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_package_setscene)
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_package_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 629 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1567 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1569 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_packagedata)
NOTE: recipe libxml2-2.11.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.1.1-r0: task do_packagedata: Started
NOTE: recipe nettle-3.9.1-r0: task do_compile: Succeeded
NOTE: Running task 1571 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_compile_ptest_base)
NOTE: recipe nettle-3.9.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libgpg-error-1.47-r0: task do_configure: Succeeded
NOTE: recipe file-5.45-r0: task do_configure: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1572 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_configure_ptest_base)
NOTE: Running task 1578 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_collect_spdx_deps)
NOTE: Running task 1579 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_compile)
NOTE: recipe libgpg-error-1.47-r0: task do_configure_ptest_base: Started
NOTE: recipe file-5.45-r0: task do_compile: Started
NOTE: recipe libxml2-2.11.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgpg-error-1.47-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1580 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_compile)
NOTE: recipe libgpg-error-1.47-r0: task do_compile: Started
NOTE: recipe libxml2-2.11.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_compile: Succeeded
NOTE: Running task 1581 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_configure)
NOTE: Running task 1582 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_install)
NOTE: recipe libxml2-2.11.5-r0: task do_configure: Started
NOTE: recipe unzip-1_6.0-r5: task do_install: Started
NOTE: recipe unzip-1_6.0-r5: task do_install: Succeeded
NOTE: Running task 1583 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package)
NOTE: recipe unzip-1_6.0-r5: task do_package: Started
NOTE: recipe nettle-3.9.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1584 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_install)
NOTE: recipe nettle-3.9.1-r0: task do_install: Started
NOTE: recipe file-5.45-r0: task do_compile: Succeeded
NOTE: Running task 1585 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_install)
NOTE: recipe file-5.45-r0: task do_install: Started
NOTE: recipe unzip-1_6.0-r5: task do_package: Succeeded
NOTE: Running task 1586 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata)
NOTE: recipe nettle-3.9.1-r0: task do_install: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Started
NOTE: Running task 1587 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_install_ptest_base)
NOTE: recipe nettle-3.9.1-r0: task do_install_ptest_base: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Succeeded
NOTE: recipe file-5.45-r0: task do_install: Succeeded
NOTE: Running task 1588 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_populate_sysroot)
NOTE: Running task 1589 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_package)
NOTE: recipe file-5.45-r0: task do_populate_sysroot: Started
NOTE: recipe file-5.45-r0: task do_package: Started
NOTE: recipe mpfr-4.2.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1590 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_compile)
NOTE: recipe mpfr-4.2.0-r0: task do_compile: Started
NOTE: recipe nettle-3.9.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1591 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_populate_sysroot)
NOTE: Running task 1592 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_package)
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.9.1-r0: task do_package: Started
NOTE: recipe file-5.45-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe file-5.45-r0: task do_package: Succeeded
NOTE: Running task 1593 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_packagedata)
NOTE: recipe file-5.45-r0: task do_packagedata: Started
NOTE: recipe file-5.45-r0: task do_packagedata: Succeeded
NOTE: recipe mpfr-4.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1594 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_install)
NOTE: recipe mpfr-4.2.0-r0: task do_install: Started
NOTE: recipe mpfr-4.2.0-r0: task do_install: Succeeded
NOTE: Running task 1595 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_populate_sysroot)
NOTE: Running task 1596 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_package)
NOTE: recipe mpfr-4.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe mpfr-4.2.0-r0: task do_package: Started
NOTE: recipe mpfr-4.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1597 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmpc-1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmpc-1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1598 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_configure)
NOTE: recipe libmpc-1.3.1-r0: task do_configure: Started
NOTE: recipe libpam-1.5.3-r0: task do_configure: Succeeded
NOTE: Running task 1599 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_configure_ptest_base)
NOTE: recipe libpam-1.5.3-r0: task do_configure_ptest_base: Started
NOTE: recipe libpam-1.5.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1600 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_compile)
NOTE: recipe libpam-1.5.3-r0: task do_compile: Started
NOTE: recipe mpfr-4.2.0-r0: task do_package: Succeeded
NOTE: Running task 1601 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_packagedata)
NOTE: recipe mpfr-4.2.0-r0: task do_packagedata: Started
NOTE: recipe libxml2-2.11.5-r0: task do_configure: Succeeded
NOTE: Running task 1602 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_configure_ptest_base)
NOTE: recipe libxml2-2.11.5-r0: task do_configure_ptest_base: Started
NOTE: recipe mpfr-4.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1603 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_compile)
NOTE: recipe libxml2-2.11.5-r0: task do_compile: Started
NOTE: recipe nettle-3.9.1-r0: task do_package: Succeeded
NOTE: Running task 1604 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata)
NOTE: recipe nettle-3.9.1-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.47-r0: task do_compile: Succeeded
NOTE: Running task 1605 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_compile_ptest_base)
NOTE: recipe libtasn1-4.19.0-r0: task do_configure: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1606 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_compile)
NOTE: recipe libgpg-error-1.47-r0: task do_compile_ptest_base: Started
NOTE: recipe libgpg-error-1.47-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1607 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_install)
NOTE: recipe libtasn1-4.19.0-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.47-r0: task do_install: Started
NOTE: recipe libgpg-error-1.47-r0: task do_install: Succeeded
NOTE: Running task 1608 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_install_ptest_base)
NOTE: recipe libgpg-error-1.47-r0: task do_install_ptest_base: Started
NOTE: recipe libgpg-error-1.47-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1609 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_populate_sysroot)
NOTE: Running task 1610 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_package)
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.47-r0: task do_package: Started
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_configure: Succeeded
NOTE: Running task 1611 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_compile)
NOTE: recipe libarchive-3.6.2-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.47-r0: task do_package: Succeeded
NOTE: Running task 1612 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata)
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata: Started
NOTE: recipe libmpc-1.3.1-r0: task do_configure: Succeeded
NOTE: Running task 1613 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_compile)
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_compile: Started
NOTE: recipe libarchive-3.6.2-r0: task do_compile: Succeeded
NOTE: Running task 1614 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_install)
NOTE: recipe libarchive-3.6.2-r0: task do_install: Started
NOTE: recipe libarchive-3.6.2-r0: task do_install: Succeeded
NOTE: Running task 1615 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_populate_sysroot)
NOTE: Running task 1616 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_package)
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot: Started
NOTE: recipe libarchive-3.6.2-r0: task do_package: Started
NOTE: recipe libmpc-1.3.1-r0: task do_compile: Succeeded
NOTE: Running task 1617 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_install)
NOTE: recipe libtasn1-4.19.0-r0: task do_compile: Succeeded
NOTE: Running task 1618 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_install)
NOTE: recipe libmpc-1.3.1-r0: task do_install: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_install: Started
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_configure: Succeeded
NOTE: Running task 1619 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_compile)
NOTE: recipe libunistring-1.1-r0: task do_compile: Started
NOTE: recipe libmpc-1.3.1-r0: task do_install: Succeeded
NOTE: Running task 1620 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_populate_sysroot)
NOTE: Running task 1621 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_package)
NOTE: recipe libmpc-1.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe libmpc-1.3.1-r0: task do_package: Started
NOTE: recipe libmpc-1.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1622 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtasn1-4.19.0-r0: task do_install: Succeeded
NOTE: Running task 1623 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot)
NOTE: Running task 1624 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_package)
NOTE: recipe gcc-13.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_package: Started
NOTE: recipe gcc-13.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1625 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_configure)
NOTE: recipe gcc-13.2.0-r0: task do_configure: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_package: Succeeded
NOTE: Running task 1626 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_packagedata)
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata: Started
NOTE: recipe libmpc-1.3.1-r0: task do_package: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1627 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_package: Succeeded
NOTE: Running task 1628 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata: Succeeded
NOTE: recipe gcc-13.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1629 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_compile)
NOTE: recipe gcc-13.2.0-r0: task do_compile: Started
NOTE: recipe libxml2-2.11.5-r0: task do_compile: Succeeded
NOTE: Running task 1630 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_compile_ptest_base)
NOTE: recipe libxml2-2.11.5-r0: task do_compile_ptest_base: Started
NOTE: recipe libxml2-2.11.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1631 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_install)
NOTE: recipe libxml2-2.11.5-r0: task do_install: Started
NOTE: recipe libxml2-2.11.5-r0: task do_install: Succeeded
NOTE: Running task 1632 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_install_ptest_base)
NOTE: recipe libxml2-2.11.5-r0: task do_install_ptest_base: Started
NOTE: recipe libpam-1.5.3-r0: task do_compile: Succeeded
NOTE: Running task 1633 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_compile_ptest_base)
NOTE: recipe libpam-1.5.3-r0: task do_compile_ptest_base: Started
NOTE: recipe libpam-1.5.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1634 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_install)
NOTE: recipe libpam-1.5.3-r0: task do_install: Started
NOTE: recipe libpam-1.5.3-r0: task do_install: Succeeded
NOTE: Running task 1635 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_install_ptest_base)
NOTE: recipe libpam-1.5.3-r0: task do_install_ptest_base: Started
NOTE: recipe libpam-1.5.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1636 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot)
NOTE: Running task 1637 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_package)
NOTE: recipe libpam-1.5.3-r0: task do_package: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot unihash changed to f1fb9e8f575cceab546055d8d69cd8cb93a6cdaf9cef2af0988bc3e323594eb7
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_populate_sysroot became valid
NOTE: Running setscene task 620 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 629 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1650 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libgcrypt-1.10.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1667 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_configure)
NOTE: recipe libgcrypt-1.10.2-r0: task do_configure: Started
NOTE: recipe libpam-1.5.3-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_package unihash changed to 4bfb70252dc33964975e51296aa653ee0b16cc071a29885c8f12d8091bcee247
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_package became valid
NOTE: Running setscene task 618 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 621 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 622 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.39.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 627 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_package_setscene)
NOTE: recipe shadow-4.13-r0: task do_package_setscene: Started
NOTE: recipe util-linux-2.39.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 629 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1671 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package)
NOTE: Running task 1674 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_package)
NOTE: Running task 1675 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_create_spdx)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_package: Started
NOTE: recipe libpam-1.5.3-r0: task do_create_spdx: Started
NOTE: recipe coreutils-9.3-r0: task do_package: Started
NOTE: recipe libxml2-2.11.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1678 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_package)
NOTE: Running task 1679 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_populate_sysroot)
NOTE: recipe libxml2-2.11.5-r0: task do_package: Started
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1680 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_configure_ptest_base)
NOTE: recipe libpam-1.5.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 1681 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_collect_spdx_deps)
NOTE: recipe libgcrypt-1.10.2-r0: task do_configure_ptest_base: Started
NOTE: recipe shadow-4.13-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1682 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_compile)
NOTE: recipe shadow-4.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1683 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_create_spdx)
NOTE: recipe libgcrypt-1.10.2-r0: task do_compile: Started
NOTE: recipe shadow-4.13-r0: task do_create_spdx: Started
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package unihash changed to 10acef0cf5823557a6d3e5a53fd5931ec4b357f7248132960962df05742db1d4
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata became valid
NOTE: Running setscene task 629 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1685 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_package_write_rpm: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_package_write_rpm: Succeeded
NOTE: recipe shadow-4.13-r0: task do_create_spdx: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm unihash changed to 7eb1180df2fa024a7a1c7ee7c019875503594e7e971f26d3459f8748ed369ada
NOTE: Running task 1686 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_collect_spdx_deps)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_collect_spdx_deps: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1687 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_create_spdx)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_create_spdx: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_create_spdx: Succeeded
NOTE: recipe perl-5.36.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_package unihash changed to 478784f7815e51c1bd3d11813e4ece4be291822bf9747567527d5f8ea2131515
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_packagedata became valid
NOTE: Running setscene task 629 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_packagedata_setscene)
NOTE: recipe perl-5.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_compile: Succeeded
NOTE: Running task 1688 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_compile_ptest_base)
NOTE: recipe libgcrypt-1.10.2-r0: task do_compile_ptest_base: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1689 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_install)
NOTE: recipe libgcrypt-1.10.2-r0: task do_install: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_install: Succeeded
NOTE: Running task 1690 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_install_ptest_base)
NOTE: recipe libgcrypt-1.10.2-r0: task do_install_ptest_base: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1691 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_populate_sysroot)
NOTE: Running task 1692 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_package)
NOTE: recipe libgcrypt-1.10.2-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_package: Started
NOTE: recipe libunistring-1.1-r0: task do_compile: Succeeded
NOTE: Running task 1693 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_install)
NOTE: recipe libunistring-1.1-r0: task do_install: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe perl-5.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libunistring-1.1-r0: task do_install: Succeeded
NOTE: Running task 1695 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot)
NOTE: Running task 1696 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_package)
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot: Started
NOTE: recipe libunistring-1.1-r0: task do_package: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1697 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1698 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_configure)
NOTE: recipe libidn2-2.3.4-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_package: Succeeded
NOTE: Running task 1699 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_packagedata)
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_package: Succeeded
NOTE: Running task 1700 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata)
NOTE: recipe libunistring-1.1-r0: task do_packagedata: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata: Succeeded
NOTE: recipe coreutils-9.3-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_package unihash changed to 90eb572e35e85721b1111145b6fd9a47ca7a6ffc03c2d73cdab25a6f1e1bbe7e
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_packagedata became valid
NOTE: Running setscene task 629 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.3-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libxml2-2.11.5-r0: task do_package: Succeeded
NOTE: Running task 1702 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_packagedata)
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata: Started
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1703 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_create_spdx)
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx: Started
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_configure: Succeeded
NOTE: Running task 1704 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_compile)
NOTE: recipe libidn2-2.3.4-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.4-r0: task do_compile: Succeeded
NOTE: Running task 1705 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_install)
NOTE: recipe libidn2-2.3.4-r0: task do_install: Started
NOTE: recipe libidn2-2.3.4-r0: task do_install: Succeeded
NOTE: Running task 1706 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot)
NOTE: Running task 1707 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_package)
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe libidn2-2.3.4-r0: task do_package: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1708 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1709 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-8.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-8.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1710 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_configure)
NOTE: recipe curl-8.2.1-r0: task do_configure: Started
NOTE: recipe gnutls-3.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1711 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_configure)
NOTE: recipe gnutls-3.8.0-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.4-r0: task do_package: Succeeded
NOTE: Running task 1712 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1713 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_configure_ptest_base)
NOTE: recipe curl-8.2.1-r0: task do_configure_ptest_base: Started
NOTE: recipe curl-8.2.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1714 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_compile)
NOTE: recipe curl-8.2.1-r0: task do_compile: Started
NOTE: recipe curl-8.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1715 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_compile_ptest_base)
NOTE: recipe curl-8.2.1-r0: task do_compile_ptest_base: Started
NOTE: recipe curl-8.2.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1716 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_install)
NOTE: recipe curl-8.2.1-r0: task do_install: Started
NOTE: recipe curl-8.2.1-r0: task do_install: Succeeded
NOTE: Running task 1717 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_install_ptest_base)
NOTE: recipe curl-8.2.1-r0: task do_install_ptest_base: Started
NOTE: recipe curl-8.2.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1718 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_populate_sysroot)
NOTE: Running task 1719 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_package)
NOTE: recipe curl-8.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe curl-8.2.1-r0: task do_package: Started
NOTE: recipe curl-8.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_configure: Succeeded
NOTE: Running task 1720 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_configure_ptest_base)
NOTE: recipe gnutls-3.8.0-r0: task do_configure_ptest_base: Started
NOTE: recipe gnutls-3.8.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1721 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_compile)
NOTE: recipe gnutls-3.8.0-r0: task do_compile: Started
NOTE: recipe curl-8.2.1-r0: task do_package: Succeeded
NOTE: Running task 1722 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_packagedata)
NOTE: recipe curl-8.2.1-r0: task do_packagedata: Started
NOTE: recipe curl-8.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe glibc-locale-2.37-r1: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_package unihash changed to fc24f2095e476d8243a10b9dc1b9ab17b6199f7ff0a019e6d92c21f486e5c2c0
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_packagedata became valid
NOTE: Running setscene task 629 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_packagedata_setscene)
NOTE: recipe glibc-locale-2.37-r1: task do_packagedata_setscene: Started
NOTE: recipe glibc-locale-2.37-r1: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1724 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_create_spdx)
NOTE: Running task 1725 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package_write_rpm)
NOTE: Running task 1726 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_package_write_rpm)
NOTE: Running task 1727 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_package_write_rpm)
NOTE: Running task 1728 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_package_qa)
NOTE: recipe glibc-locale-2.37-r1: task do_create_spdx: Started
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm: Started
NOTE: recipe libxml2-2.11.5-r0: task do_package_write_rpm: Started
NOTE: recipe glibc-locale-2.37-r1: task do_package_write_rpm: Started
NOTE: recipe libxml2-2.11.5-r0: task do_package_qa: Started
NOTE: recipe gnutls-3.8.0-r0: task do_compile: Succeeded
NOTE: Running task 1729 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_compile_ptest_base)
NOTE: recipe gnutls-3.8.0-r0: task do_compile_ptest_base: Started
NOTE: recipe gnutls-3.8.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1730 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_install)
NOTE: recipe gnutls-3.8.0-r0: task do_install: Started
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package_write_rpm unihash changed to 7ad5843a911ac6c65e310eedbe1803f63a03674d13f95803c99ad7fcc581a6a2
NOTE: recipe gnutls-3.8.0-r0: task do_install: Succeeded
NOTE: Running task 1731 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_install_ptest_base)
NOTE: recipe gnutls-3.8.0-r0: task do_install_ptest_base: Started
NOTE: recipe libxml2-2.11.5-r0: task do_package_qa: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glibc-locale-2.37-r1: task do_create_spdx: Succeeded
NOTE: Running task 1732 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_create_runtime_spdx)
NOTE: recipe libxml2-2.11.5-r0: task do_create_runtime_spdx: Started
NOTE: recipe libxml2-2.11.5-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1733 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_populate_sysroot)
NOTE: Running task 1734 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_package)
NOTE: recipe gnutls-3.8.0-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.8.0-r0: task do_package: Started
NOTE: recipe gnutls-3.8.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1735 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1736 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_configure)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_configure: Started
NOTE: recipe gnutls-3.8.0-r0: task do_package: Succeeded
NOTE: Running task 1737 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_packagedata)
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_configure: Succeeded
NOTE: Running task 1738 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_compile)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_compile: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_compile: Succeeded
NOTE: Running task 1739 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_install)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_install: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_install: Succeeded
NOTE: Running task 1740 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_populate_sysroot)
NOTE: Running task 1741 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_package)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_populate_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_package: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1742 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.189-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.189-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1743 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_configure)
NOTE: recipe elfutils-0.189-r0: task do_configure: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_package: Succeeded
NOTE: Running task 1744 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_packagedata)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_configure: Succeeded
NOTE: Running task 1745 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_configure_ptest_base)
NOTE: recipe elfutils-0.189-r0: task do_configure_ptest_base: Started
NOTE: recipe elfutils-0.189-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1746 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_compile)
NOTE: recipe elfutils-0.189-r0: task do_compile: Started
NOTE: recipe elfutils-0.189-r0: task do_compile: Succeeded
NOTE: Running task 1747 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_compile_ptest_base)
NOTE: recipe elfutils-0.189-r0: task do_compile_ptest_base: Started
NOTE: recipe glibc-locale-2.37-r1: task do_package_write_rpm: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1748 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_install)
NOTE: recipe elfutils-0.189-r0: task do_install: Started
NOTE: recipe elfutils-0.189-r0: task do_install: Succeeded
NOTE: Running task 1749 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_install_ptest_base)
NOTE: recipe elfutils-0.189-r0: task do_install_ptest_base: Started
NOTE: recipe elfutils-0.189-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1750 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_populate_sysroot)
NOTE: Running task 1751 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_package)
NOTE: recipe elfutils-0.189-r0: task do_populate_sysroot: Started
NOTE: recipe elfutils-0.189-r0: task do_package: Started
NOTE: recipe elfutils-0.189-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1752 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-2.41-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.41-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1753 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_configure)
NOTE: recipe binutils-2.41-r0: task do_configure: Started
NOTE: recipe binutils-2.41-r0: task do_configure: Succeeded
NOTE: Running task 1754 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_compile)
NOTE: recipe binutils-2.41-r0: task do_compile: Started
NOTE: recipe gcc-13.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1755 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_install)
NOTE: recipe gcc-13.2.0-r0: task do_install: Started
NOTE: recipe elfutils-0.189-r0: task do_package: Succeeded
NOTE: Running task 1756 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_packagedata)
NOTE: recipe elfutils-0.189-r0: task do_packagedata: Started
NOTE: recipe elfutils-0.189-r0: task do_packagedata: Succeeded
NOTE: recipe gcc-13.2.0-r0: task do_install: Succeeded
NOTE: Running task 1757 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_package)
NOTE: recipe gcc-13.2.0-r0: task do_package: Started
NOTE: recipe gcc-13.2.0-r0: task do_package: Succeeded
NOTE: Running task 1758 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_packagedata)
NOTE: recipe gcc-13.2.0-r0: task do_packagedata: Started
NOTE: recipe gcc-13.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe binutils-2.41-r0: task do_compile: Succeeded
NOTE: Running task 1759 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_install)
NOTE: recipe binutils-2.41-r0: task do_install: Started
NOTE: recipe binutils-2.41-r0: task do_install: Succeeded
NOTE: Running task 1760 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_package)
NOTE: recipe binutils-2.41-r0: task do_package: Started
NOTE: recipe binutils-2.41-r0: task do_package: Succeeded
NOTE: Running task 1761 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_packagedata)
NOTE: recipe binutils-2.41-r0: task do_packagedata: Started
NOTE: recipe binutils-2.41-r0: task do_packagedata: Succeeded
NOTE: Running task 1762 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_package_write_rpm)
NOTE: recipe python3-3.11.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-3.11.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1763 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_build)
NOTE: Tasks Summary: Attempted 1763 tasks of which 1488 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 16 ERROR messages, returning a non-zero exit code.
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-src went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-dbg went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcrypto went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libssl went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-conf went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-engines went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-misc went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-ossl-module-legacy went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-ptest went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-staticdev went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-dev went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-doc went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-locale went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-bin went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2765862905246186234==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libxml2: PKGV changed from 2.11.4 [default] to 2.11.5 [default]
packages/core2-32-poky-linux/libxml2: SRC_URI changed from "https://download.gnome.org/sources//libxml2/2.11/libxml2-2.11.4.tar.xz;name=archive http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=libxml2-2.11.4;name=testtar file://run-ptest file://install-tests.patch" to "https://download.gnome.org/sources//libxml2/2.11/libxml2-2.11.5.tar.xz;name=archive http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=libxml2-2.11.5;name=testtar file://run-ptest file://install-tests.patch"
packages/core2-32-poky-linux/libxml2: PV changed from "2.11.4" to "2.11.5"
packages/core2-32-poky-linux/libxml2/libxml2-dbg: PKGSIZE changed from 6354380 to 6354472 (+0%)
packages/core2-32-poky-linux/libxml2/libxml2-dbg: PKGV changed from 2.11.4 [default] to 2.11.5 [default]
packages/core2-32-poky-linux/libxml2/libxml2-dbg: FILELIST: removed "/usr/lib/.debug/libxml2.so.2.11.4", added "/usr/lib/.debug/libxml2.so.2.11.5"
packages/core2-32-poky-linux/libxml2/libxml2-dbg: PV changed from "2.11.4" to "2.11.5"
packages/core2-32-poky-linux/libxml2/libxml2-dev: PKGV changed from 2.11.4 [default] to 2.11.5 [default]
packages/core2-32-poky-linux/libxml2/libxml2-dev: PV changed from "2.11.4" to "2.11.5"
packages/core2-32-poky-linux/libxml2/libxml2-doc: PKGV changed from 2.11.4 [default] to 2.11.5 [default]
packages/core2-32-poky-linux/libxml2/libxml2-doc: PV changed from "2.11.4" to "2.11.5"
packages/core2-32-poky-linux/libxml2/libxml2-locale: PKGV changed from 2.11.4 [default] to 2.11.5 [default]
packages/core2-32-poky-linux/libxml2/libxml2-locale: PV changed from "2.11.4" to "2.11.5"
packages/core2-32-poky-linux/libxml2/libxml2-ptest: PKGV changed from 2.11.4 [default] to 2.11.5 [default]
packages/core2-32-poky-linux/libxml2/libxml2-ptest: PV changed from "2.11.4" to "2.11.5"
packages/core2-32-poky-linux/libxml2/libxml2-python: PKGV changed from 2.11.4 [default] to 2.11.5 [default]
packages/core2-32-poky-linux/libxml2/libxml2-python: PV changed from "2.11.4" to "2.11.5"
packages/core2-32-poky-linux/libxml2/libxml2-src: PKGSIZE changed from 7845637 to 7846177 (+0%)
packages/core2-32-poky-linux/libxml2/libxml2-src: PKGV changed from 2.11.4 [default] to 2.11.5 [default]
packages/core2-32-poky-linux/libxml2/libxml2-src: PV changed from "2.11.4" to "2.11.5"
packages/core2-32-poky-linux/libxml2/libxml2-staticdev: PKGV changed from 2.11.4 [default] to 2.11.5 [default]
packages/core2-32-poky-linux/libxml2/libxml2-staticdev: PV changed from "2.11.4" to "2.11.5"
packages/core2-32-poky-linux/libxml2/libxml2-utils: PKGV changed from 2.11.4 [default] to 2.11.5 [default]
packages/core2-32-poky-linux/libxml2/libxml2-utils: PV changed from "2.11.4" to "2.11.5"
packages/core2-32-poky-linux/libxml2/libxml2: PKGV changed from 2.11.4 [default] to 2.11.5 [default]
packages/core2-32-poky-linux/libxml2/libxml2: FILELIST: removed "/usr/lib/libxml2.so.2.11.4", added "/usr/lib/libxml2.so.2.11.5"
packages/core2-32-poky-linux/libxml2/libxml2: PV changed from "2.11.4" to "2.11.5"
Changes to packages/core2-32-poky-linux/libxml2 (sysroot):
  /usr/lib/libxml2.so.2 changed symlink target from libxml2.so.2.11.4 to libxml2.so.2.11.5
  /usr/lib/libxml2.so changed symlink target from libxml2.so.2.11.4 to libxml2.so.2.11.5
  /usr/lib/libxml2.so.2.11.4 moved to /usr/lib/libxml2.so.2.11.5
Changes to packages/x86_64-linux/libxml2-native (sysroot):
  /usr/lib/libxml2.so.2 changed symlink target from libxml2.so.2.11.4 to libxml2.so.2.11.5
  /usr/lib/libxml2.so changed symlink target from libxml2.so.2.11.4 to libxml2.so.2.11.5
  /usr/lib/libxml2.so.2.11.4 moved to /usr/lib/libxml2.so.2.11.5

--===============2765862905246186234==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1805 targets, 64 skipped, 0 masked, 0 errors.
Removing 2 recipes from the mips32r2 sysroot...done.
Removing 2 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c64c70a6515ba7be97650b88b9505a30a0bd23ef"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 174 Local 38 Mirrors 0 Missed 136 Current 455 (21% match, 78% complete)
Removing 13 stale sstate objects for arch qemumips...done.
Removing 28 stale sstate objects for arch mips32r2...done.
NOTE: Executing Tasks
NOTE: Running setscene task 469 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 473 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 488 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 508 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 513 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: Running setscene task 585 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 588 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_create_spdx_setscene)
NOTE: Running setscene task 589 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_create_spdx_setscene)
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_create_spdx_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 604 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_create_spdx_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 741 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_recipe_qa)
NOTE: Running task 742 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_recipe_qa)
NOTE: Running task 743 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_recipe_qa)
NOTE: Running task 766 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_recipe_qa)
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 803 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_recipe_qa)
NOTE: recipe attr-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 808 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_recipe_qa)
NOTE: Running task 815 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_recipe_qa)
NOTE: Running task 816 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_recipe_qa)
NOTE: Running task 827 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_recipe_qa)
NOTE: Running task 840 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_recipe_qa)
NOTE: Running task 850 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_recipe_qa)
NOTE: Running task 853 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_recipe_qa)
NOTE: Running task 854 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_recipe_qa)
NOTE: Running task 855 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_recipe_qa)
NOTE: Running task 915 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_recipe_qa)
NOTE: Running task 966 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_recipe_qa)
NOTE: recipe base-passwd-3.6.1-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1011 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_recipe_qa)
NOTE: Running task 1012 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_recipe_qa)
NOTE: recipe python3-3.11.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 608 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_create_spdx_setscene)
NOTE: Running setscene task 610 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 613 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 614 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_recipe_qa: Started
NOTE: recipe libgpg-error-1.47-r0: task do_recipe_qa: Started
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa: Started
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa: Started
NOTE: recipe file-5.45-r0: task do_recipe_qa: Started
NOTE: Running task 1236 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_package)
NOTE: recipe curl-8.2.1-r0: task do_recipe_qa: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_recipe_qa: Started
NOTE: recipe gnutls-3.8.0-r0: task do_recipe_qa: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_recipe_qa: Started
NOTE: recipe libarchive-3.6.2-r0: task do_recipe_qa: Started
NOTE: recipe elfutils-0.189-r0: task do_recipe_qa: Started
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa: Started
NOTE: recipe mpfr-4.2.0-r0: task do_recipe_qa: Started
NOTE: recipe libmpc-1.3.1-r0: task do_recipe_qa: Started
NOTE: recipe unzip-1_6.0-r5: task do_recipe_qa: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_create_spdx_setscene: Started
NOTE: recipe binutils-2.41-r0: task do_recipe_qa: Started
NOTE: recipe zlib-1.2.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1239 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_package)
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_recipe_qa: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_recipe_qa: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe file-5.45-r0: task do_recipe_qa: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe mpfr-4.2.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1241 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_fetch)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_recipe_qa: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.36-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_recipe_qa: Succeeded
NOTE: recipe binutils-2.41-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1255 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_fetch)
NOTE: Running task 1256 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_fetch)
NOTE: Running task 1268 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_fetch)
NOTE: Running task 1274 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1275 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_fetch)
NOTE: Running task 1282 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_fetch)
NOTE: Running task 1288 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_fetch)
NOTE: Running task 1289 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_fetch)
NOTE: Running task 1290 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_fetch)
NOTE: Running task 1291 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_fetch)
NOTE: Running task 1294 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_fetch)
NOTE: Running task 1296 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_fetch)
NOTE: Running task 1297 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_fetch)
NOTE: Running task 1298 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_fetch)
NOTE: Running task 1316 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_fetch)
NOTE: Running task 1325 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_fetch)
NOTE: Running task 1336 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_package)
NOTE: Running task 1349 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: Running task 1350 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_fetch)
NOTE: Running task 1373 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package)
NOTE: Running task 1385 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_recipe_qa)
NOTE: Running task 1390 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_collect_spdx_deps)
NOTE: Running task 1394 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_deploy_source_date_epoch)
NOTE: recipe nettle-3.9.1-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.47-r0: task do_fetch: Started
NOTE: Running task 1422 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_package)
NOTE: Running task 1423 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_package)
NOTE: recipe libunistring-1.1-r0: task do_fetch: Started
NOTE: recipe gmp-6.3.0-r0: task do_package: Started
NOTE: Running task 1426 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_collect_spdx_deps)
NOTE: Running task 1427 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_collect_spdx_deps)
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Started
NOTE: recipe gnutls-3.8.0-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_fetch: Started
NOTE: recipe libxml2-2.11.5-r0: task do_fetch: Started
NOTE: recipe file-5.45-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_fetch: Started
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Started
NOTE: recipe nettle-3.9.1-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Started
NOTE: Running task 1428 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_collect_spdx_deps)
NOTE: recipe curl-8.2.1-r0: task do_fetch: Started
NOTE: recipe elfutils-0.189-r0: task do_fetch: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Succeeded
NOTE: Running task 1431 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_package_write_rpm)
NOTE: recipe libxml2-2.11.5-r0: task do_fetch: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_fetch: Started
NOTE: recipe libpam-1.5.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.47-r0: task do_fetch: Succeeded
NOTE: Running task 1432 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_unpack)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Succeeded
NOTE: recipe mpfr-4.2.0-r0: task do_fetch: Started
NOTE: recipe mpfr-4.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1433 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_unpack)
NOTE: Running task 1434 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-2.41-r0: task do_fetch: Started
NOTE: recipe make-4.4.1-r0: task do_package: Started
NOTE: Running task 1435 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 1436 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_unpack)
NOTE: Running task 1437 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_unpack)
NOTE: Running task 1438 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe sed-4.9-r0: task do_package: Started
NOTE: Running task 1439 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.189-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe gcc-13.2.0-r0: task do_recipe_qa: Started
NOTE: recipe gcc-13.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_fetch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Succeeded
NOTE: Running task 1440 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_unpack)
NOTE: Running task 1441 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_unpack)
NOTE: Running task 1442 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_unpack)
NOTE: Running task 1443 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_unpack)
NOTE: recipe libgcrypt-1.10.2-r0: task do_fetch: Succeeded
NOTE: Running task 1444 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_unpack)
NOTE: Running task 1445 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-8.2.1-r0: task do_fetch: Succeeded
NOTE: recipe file-5.45-r0: task do_fetch: Succeeded
NOTE: Running task 1446 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_unpack)
NOTE: recipe make-4.4.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe psmisc-23.6-r0: task do_package: Started
NOTE: Running task 1447 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_unpack)
NOTE: Running task 1448 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-2.41-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1449 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_unpack)
NOTE: Running task 1450 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_unpack)
NOTE: Running task 1451 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_prepare_recipe_sysroot)
NOTE: recipe glibc-locale-2.37-r1: task do_collect_spdx_deps: Started
NOTE: Running task 1452 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_unpack)
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_collect_spdx_deps: Started
NOTE: Running setscene task 623 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_package_setscene)
NOTE: Running task 1453 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_unpack)
NOTE: Running task 1454 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libunistring-1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glibc-locale-2.37-r1: task do_package: Started
NOTE: Running task 1455 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_unpack)
NOTE: Running task 1456 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_unpack)
NOTE: Running task 1457 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_unpack)
NOTE: recipe libunistring-1.1-r0: task do_unpack: Started
NOTE: recipe nettle-3.9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nettle-3.9.1-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.47-r0: task do_unpack: Started
NOTE: Running task 1458 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe perl-5.36.1-r0: task do_package: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Started
NOTE: recipe libxml2-2.11.5-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.47-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_unpack: Started
NOTE: recipe gnutls-3.8.0-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Started
NOTE: recipe file-5.45-r0: task do_unpack: Started
NOTE: recipe libgcc-13.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe elfutils-0.189-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-5.2.15-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_unpack: Started
NOTE: recipe mpfr-4.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.45-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmpc-1.3.1-r0: task do_unpack: Started
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Started
NOTE: Running task 1459 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_create_spdx)
NOTE: recipe mpfr-4.2.0-r0: task do_unpack: Started
NOTE: recipe curl-8.2.1-r0: task do_unpack: Started
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcc-13.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe binutils-2.41-r0: task do_unpack: Started
NOTE: recipe gcc-13.2.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 1460 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_patch)
NOTE: Running task 1461 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_patch)
NOTE: Running noexec task 1462 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_fetch)
NOTE: recipe nettle-3.9.1-r0: task do_unpack: Succeeded
NOTE: Running task 1463 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_patch)
NOTE: recipe bash-5.2.15-r0: task do_create_spdx: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_unpack: Succeeded
NOTE: Running task 1464 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_patch)
NOTE: recipe glibc-locale-2.37-r1: task do_collect_spdx_deps: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_patch: Started
NOTE: recipe python3-3.11.4-r0: task do_package_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mpfr-4.2.0-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.47-r0: task do_unpack: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_patch: Started
NOTE: Running task 1465 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_configure)
NOTE: recipe libunistring-1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1466 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_patch)
NOTE: recipe nettle-3.9.1-r0: task do_patch: Started
NOTE: recipe nettle-3.9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 1467 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_patch)
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Succeeded
NOTE: Running task 1468 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_patch)
NOTE: recipe mpfr-4.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1469 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_patch)
NOTE: recipe libgpg-error-1.47-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1470 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_patch)
NOTE: recipe mpfr-4.2.0-r0: task do_patch: Started
NOTE: recipe libpam-1.5.3-r0: task do_configure: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_patch: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_patch: Started
NOTE: Running task 1471 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_deploy_source_date_epoch)
NOTE: recipe libunistring-1.1-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Started
NOTE: recipe libmpc-1.3.1-r0: task do_patch: Succeeded
NOTE: recipe mpfr-4.2.0-r0: task do_patch: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1472 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Started
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_patch: Succeeded
NOTE: Running task 1473 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_patch)
NOTE: recipe file-5.45-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1474 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1475 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.45-r0: task do_unpack: Succeeded
NOTE: Running task 1476 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_patch)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Succeeded
NOTE: recipe mpfr-4.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-8.2.1-r0: task do_unpack: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_unpack: Succeeded
NOTE: Running task 1477 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe unzip-1_6.0-r5: task do_patch: Started
NOTE: Running task 1478 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_patch)
NOTE: recipe file-5.45-r0: task do_patch: Started
NOTE: Running task 1479 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_patch)
NOTE: recipe libgcrypt-1.10.2-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_patch: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_unpack: Succeeded
NOTE: recipe file-5.45-r0: task do_patch: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_patch: Started
NOTE: Running task 1480 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_patch)
NOTE: Running task 1481 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_patch)
NOTE: Running task 1482 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-8.2.1-r0: task do_patch: Started
NOTE: Running task 1483 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_deploy_source_date_epoch)
NOTE: recipe libseccomp-2.5.4-r0: task do_patch: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_patch: Succeeded
NOTE: Running task 1484 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_deploy_source_date_epoch)
NOTE: recipe mpfr-4.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1485 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcrypt-1.10.2-r0: task do_patch: Started
NOTE: recipe libxml2-2.11.5-r0: task do_patch: Started
NOTE: recipe file-5.45-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 1486 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_configure)
NOTE: recipe libmpc-1.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_patch: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Succeeded
NOTE: Running task 1487 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_patch)
NOTE: Running task 1488 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_deploy_source_date_epoch)
NOTE: Running task 1489 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_configure)
NOTE: recipe nettle-3.9.1-r0: task do_patch: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1490 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-8.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1491 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_deploy_source_date_epoch)
NOTE: recipe mpfr-4.2.0-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_configure: Started
NOTE: recipe gnutls-3.8.0-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.47-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxml2-2.11.5-r0: task do_patch: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe elfutils-0.189-r0: task do_unpack: Succeeded
NOTE: Running task 1492 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_deploy_source_date_epoch)
NOTE: recipe make-4.4.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1493 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_populate_lic)
NOTE: Running task 1494 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_patch)
NOTE: recipe file-5.45-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1495 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_configure)
NOTE: recipe libxml2-2.11.5-r0: task do_populate_lic: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-8.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_patch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1496 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_configure)
NOTE: recipe file-5.45-r0: task do_configure: Started
NOTE: Running task 1497 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_configure)
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1498 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_configure)
NOTE: recipe libgpg-error-1.47-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_configure: Started
NOTE: recipe nettle-3.9.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1499 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_configure)
NOTE: recipe libseccomp-2.5.4-r0: task do_configure: Started
NOTE: recipe libxml2-2.11.5-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_populate_lic unihash changed to c992c6d62e164464a570a932ee49dcaf25c935e5b2c0ed8062819281a47cbf7d
NOTE: Running task 1500 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_configure)
NOTE: recipe libarchive-3.6.2-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.47-r0: task do_configure: Started
NOTE: recipe libxml2-2.11.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_configure: Started
NOTE: recipe gnutls-3.8.0-r0: task do_patch: Succeeded
NOTE: Running task 1501 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcrypt-1.10.2-r0: task do_patch: Succeeded
NOTE: Running task 1502 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_deploy_source_date_epoch)
NOTE: recipe gnutls-3.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_patch: Succeeded
NOTE: Running task 1503 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_deploy_source_date_epoch)
NOTE: recipe elfutils-0.189-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe elfutils-0.189-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe binutils-2.41-r0: task do_unpack: Succeeded
NOTE: Running task 1504 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_patch)
NOTE: recipe binutils-2.41-r0: task do_patch: Started
NOTE: recipe bash-5.2.15-r0: task do_create_spdx: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_patch: Succeeded
NOTE: Running task 1505 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe make-4.4.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_package unihash changed to 01aee38484be3ba8c50b69d44fd3fd38f1042ac59b2fa71a1cf8da504fa31a7a
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata became valid
NOTE: Running setscene task 623 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1506 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_configure)
NOTE: recipe gmp-6.3.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_package unihash changed to d34d4d5c20d17fe6cbf7ee80b1842dbb6b8142e33a61af7272ce144b4a279908
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata became valid
NOTE: Running setscene task 621 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_configure: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_configure: Succeeded
NOTE: Running task 1507 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_compile)
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1509 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_create_spdx)
NOTE: Running task 1510 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_rpm)
NOTE: recipe psmisc-23.6-r0: task do_package: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_compile: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_package unihash changed to 486d1c02fbdf4e7d1c24395ecf90e27fd117441ceb069c7d9e441b5a13912140
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata became valid
NOTE: Running setscene task 623 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata_setscene)
NOTE: recipe make-4.4.1-r0: task do_create_spdx: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm: Started
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.41-r0: task do_patch: Succeeded
NOTE: Running task 1512 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_deploy_source_date_epoch)
NOTE: recipe binutils-2.41-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.41-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe make-4.4.1-r0: task do_create_spdx: Succeeded
NOTE: recipe sed-4.9-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package unihash changed to edc77278ab4b277cf80e41f9ad6de3028df958039cb1a57482d7078c607e873c
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata became valid
NOTE: Running setscene task 623 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 624 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 625 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 626 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_configure: Succeeded
NOTE: Running task 1519 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_configure_ptest_base)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/openssl/3.1.1/temp/log.do_packagedata_setscene.2067722
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 627 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_package_setscene)
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.9.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1537 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_compile)
NOTE: recipe openssl-3.1.1-r0: task do_package_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_compile: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_configure: Succeeded
NOTE: Running task 1538 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_configure_ptest_base)
NOTE: recipe libseccomp-2.5.4-r0: task do_configure_ptest_base: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1539 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_compile)
NOTE: recipe libseccomp-2.5.4-r0: task do_compile: Started
NOTE: recipe openssl-3.1.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 629 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_compile: Succeeded
NOTE: Running task 1540 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_install)
NOTE: recipe openssl-3.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_install: Started
NOTE: recipe openssl-3.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1562 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1564 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_packagedata)
NOTE: recipe openssl-3.1.1-r0: task do_packagedata: Started
NOTE: recipe libxml2-2.11.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_compile: Succeeded
NOTE: Running task 1566 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_compile_ptest_base)
NOTE: recipe nettle-3.9.1-r0: task do_compile: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_compile_ptest_base: Started
NOTE: Running task 1567 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_compile_ptest_base)
NOTE: recipe unzip-1_6.0-r5: task do_install: Succeeded
NOTE: Running task 1568 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package)
NOTE: recipe nettle-3.9.1-r0: task do_compile_ptest_base: Started
NOTE: recipe openssl-3.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1574 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_collect_spdx_deps)
NOTE: recipe unzip-1_6.0-r5: task do_package: Started
NOTE: recipe libxml2-2.11.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxml2-2.11.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1575 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_configure)
NOTE: recipe libxml2-2.11.5-r0: task do_configure: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1576 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_install)
NOTE: recipe libseccomp-2.5.4-r0: task do_install: Started
NOTE: recipe nettle-3.9.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1577 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_install)
NOTE: recipe nettle-3.9.1-r0: task do_install: Started
NOTE: recipe file-5.45-r0: task do_configure: Succeeded
NOTE: Running task 1578 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_compile)
NOTE: recipe file-5.45-r0: task do_compile: Started
NOTE: recipe unzip-1_6.0-r5: task do_package: Succeeded
NOTE: Running task 1579 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_install: Succeeded
NOTE: Running task 1580 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_install_ptest_base)
NOTE: recipe nettle-3.9.1-r0: task do_install: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_install_ptest_base: Started
NOTE: Running task 1581 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_install_ptest_base)
NOTE: recipe mpfr-4.2.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1582 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_compile)
NOTE: recipe nettle-3.9.1-r0: task do_install_ptest_base: Started
NOTE: recipe mpfr-4.2.0-r0: task do_compile: Started
NOTE: recipe nettle-3.9.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1583 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_populate_sysroot)
NOTE: Running task 1584 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_package)
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.9.1-r0: task do_package: Started
NOTE: recipe file-5.45-r0: task do_compile: Succeeded
NOTE: Running task 1585 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_install)
NOTE: recipe file-5.45-r0: task do_install: Started
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_configure: Succeeded
NOTE: Running task 1586 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_configure_ptest_base)
NOTE: recipe libgpg-error-1.47-r0: task do_configure_ptest_base: Started
NOTE: recipe libgpg-error-1.47-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1587 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_compile)
NOTE: recipe libgpg-error-1.47-r0: task do_compile: Started
NOTE: recipe file-5.45-r0: task do_install: Succeeded
NOTE: Running task 1588 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_populate_sysroot)
NOTE: Running task 1589 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_package)
NOTE: recipe libseccomp-2.5.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1590 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_populate_sysroot)
NOTE: Running task 1591 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_package)
NOTE: recipe file-5.45-r0: task do_populate_sysroot: Started
NOTE: recipe file-5.45-r0: task do_package: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_package: Started
NOTE: recipe mpfr-4.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1592 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_install)
NOTE: recipe mpfr-4.2.0-r0: task do_install: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe file-5.45-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mpfr-4.2.0-r0: task do_install: Succeeded
NOTE: Running task 1593 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_populate_sysroot)
NOTE: Running task 1594 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_package)
NOTE: recipe mpfr-4.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe mpfr-4.2.0-r0: task do_package: Started
NOTE: recipe mpfr-4.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1595 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmpc-1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmpc-1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1596 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_configure)
NOTE: recipe libmpc-1.3.1-r0: task do_configure: Started
NOTE: recipe file-5.45-r0: task do_package: Succeeded
NOTE: Running task 1597 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_packagedata)
NOTE: recipe file-5.45-r0: task do_packagedata: Started
NOTE: recipe file-5.45-r0: task do_packagedata: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_configure: Succeeded
NOTE: Running task 1598 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_configure_ptest_base)
NOTE: recipe mpfr-4.2.0-r0: task do_package: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_configure_ptest_base: Started
NOTE: Running task 1599 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_packagedata)
NOTE: recipe libpam-1.5.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1600 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_compile)
NOTE: recipe mpfr-4.2.0-r0: task do_packagedata: Started
NOTE: recipe libpam-1.5.3-r0: task do_compile: Started
NOTE: recipe mpfr-4.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_configure: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_configure: Succeeded
NOTE: Running task 1601 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_compile)
NOTE: Running task 1602 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_configure_ptest_base)
NOTE: recipe libtasn1-4.19.0-r0: task do_compile: Started
NOTE: recipe libxml2-2.11.5-r0: task do_configure_ptest_base: Started
NOTE: recipe libxml2-2.11.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1603 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_compile)
NOTE: recipe nettle-3.9.1-r0: task do_package: Succeeded
NOTE: Running task 1604 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata)
NOTE: recipe libxml2-2.11.5-r0: task do_compile: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_package: Succeeded
NOTE: Running task 1605 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_packagedata)
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_compile: Succeeded
NOTE: Running task 1606 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_compile_ptest_base)
NOTE: recipe libgpg-error-1.47-r0: task do_compile_ptest_base: Started
NOTE: recipe libgpg-error-1.47-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1607 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_install)
NOTE: recipe libgpg-error-1.47-r0: task do_install: Started
NOTE: recipe libarchive-3.6.2-r0: task do_configure: Succeeded
NOTE: Running task 1608 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_compile)
NOTE: recipe libarchive-3.6.2-r0: task do_compile: Started
NOTE: recipe libmpc-1.3.1-r0: task do_configure: Succeeded
NOTE: Running task 1609 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_compile)
NOTE: recipe libmpc-1.3.1-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.47-r0: task do_install: Succeeded
NOTE: Running task 1610 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_install_ptest_base)
NOTE: recipe libgpg-error-1.47-r0: task do_install_ptest_base: Started
NOTE: recipe libgpg-error-1.47-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1611 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_populate_sysroot)
NOTE: Running task 1612 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_package)
NOTE: recipe libgpg-error-1.47-r0: task do_package: Started
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot: Started
NOTE: recipe libmpc-1.3.1-r0: task do_compile: Succeeded
NOTE: Running task 1613 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_install)
NOTE: recipe libmpc-1.3.1-r0: task do_install: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_compile: Succeeded
NOTE: Running task 1614 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_install)
NOTE: recipe libtasn1-4.19.0-r0: task do_install: Started
NOTE: recipe libarchive-3.6.2-r0: task do_compile: Succeeded
NOTE: Running task 1615 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_install)
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_install: Started
NOTE: recipe libmpc-1.3.1-r0: task do_install: Succeeded
NOTE: Running task 1616 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_populate_sysroot)
NOTE: Running task 1617 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_package)
NOTE: recipe libmpc-1.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe libmpc-1.3.1-r0: task do_package: Started
NOTE: recipe libarchive-3.6.2-r0: task do_install: Succeeded
NOTE: Running task 1618 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_populate_sysroot)
NOTE: Running task 1619 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_package)
NOTE: recipe libarchive-3.6.2-r0: task do_package: Started
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot: Started
NOTE: recipe libmpc-1.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1620 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gcc-13.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcc-13.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1621 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_configure)
NOTE: recipe libtasn1-4.19.0-r0: task do_install: Succeeded
NOTE: recipe gcc-13.2.0-r0: task do_configure: Started
NOTE: Running task 1622 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot)
NOTE: Running task 1623 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_package)
NOTE: recipe libtasn1-4.19.0-r0: task do_package: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot: Started
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_configure: Succeeded
NOTE: Running task 1624 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_compile)
NOTE: recipe libmpc-1.3.1-r0: task do_package: Succeeded
NOTE: Running task 1625 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata)
NOTE: recipe libunistring-1.1-r0: task do_compile: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.47-r0: task do_package: Succeeded
NOTE: Running task 1626 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata)
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_package: Succeeded
NOTE: Running task 1627 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata: Started
NOTE: recipe libarchive-3.6.2-r0: task do_package: Succeeded
NOTE: Running task 1628 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_packagedata)
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_compile: Succeeded
NOTE: Running task 1629 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_compile_ptest_base)
NOTE: recipe libxml2-2.11.5-r0: task do_compile_ptest_base: Started
NOTE: recipe libxml2-2.11.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1630 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_install)
NOTE: recipe libxml2-2.11.5-r0: task do_install: Started
NOTE: recipe gcc-13.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1631 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_compile)
NOTE: recipe gcc-13.2.0-r0: task do_compile: Started
NOTE: recipe libxml2-2.11.5-r0: task do_install: Succeeded
NOTE: Running task 1632 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_install_ptest_base)
NOTE: recipe libxml2-2.11.5-r0: task do_install_ptest_base: Started
NOTE: recipe libpam-1.5.3-r0: task do_compile: Succeeded
NOTE: Running task 1633 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_compile_ptest_base)
NOTE: recipe libpam-1.5.3-r0: task do_compile_ptest_base: Started
NOTE: recipe libpam-1.5.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1634 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_install)
NOTE: recipe libpam-1.5.3-r0: task do_install: Started
NOTE: recipe libpam-1.5.3-r0: task do_install: Succeeded
NOTE: Running task 1635 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_install_ptest_base)
NOTE: recipe libpam-1.5.3-r0: task do_install_ptest_base: Started
NOTE: recipe libpam-1.5.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1636 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot)
NOTE: Running task 1637 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_package)
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot: Started
NOTE: recipe libpam-1.5.3-r0: task do_package: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot unihash changed to b0b24f3307681bf62438ae1df5730d86338c5e8180cb4c474d5481fb76341a58
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot became valid
NOTE: Running setscene task 620 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 629 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1650 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libgcrypt-1.10.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1667 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_configure)
NOTE: recipe libgcrypt-1.10.2-r0: task do_configure: Started
NOTE: recipe libpam-1.5.3-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_package unihash changed to 043553a05aa621559a4f02bfa17440bdcf79702ec07825377df6649a3b11932e
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_package became valid
NOTE: Running setscene task 618 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 621 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 622 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 627 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_package_setscene)
NOTE: recipe shadow-4.13-r0: task do_package_setscene: Started
NOTE: recipe util-linux-2.39.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 629 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1671 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package)
NOTE: Running task 1674 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_package)
NOTE: Running task 1675 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_create_spdx)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_package: Started
NOTE: recipe libpam-1.5.3-r0: task do_create_spdx: Started
NOTE: recipe coreutils-9.3-r0: task do_package: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1678 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_configure_ptest_base)
NOTE: recipe libgcrypt-1.10.2-r0: task do_configure_ptest_base: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1679 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_compile)
NOTE: recipe libpam-1.5.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 1680 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_collect_spdx_deps)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package unihash changed to dfaebc9e422cf7a2e657da2f19cb542845bd8b6c5f8f111b7f0b1dc28188a9d2
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata became valid
NOTE: recipe libgcrypt-1.10.2-r0: task do_compile: Started
NOTE: Running setscene task 629 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.13-r0: task do_collect_spdx_deps: Started
NOTE: recipe shadow-4.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1681 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_create_spdx)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_create_spdx: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1683 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_package_write_rpm: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm unihash changed to 36f50fadee8bd1f5e4a5404b54e300fd0d20ccfefaa3605c9c8eae1a063ccf8f
NOTE: recipe shadow-4.13-r0: task do_create_spdx: Succeeded
NOTE: Running task 1684 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_collect_spdx_deps)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_collect_spdx_deps: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1685 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_create_spdx)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_create_spdx: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_create_spdx: Succeeded
NOTE: recipe perl-5.36.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_package unihash changed to ed8a43091134652b1a75e91b7554650c346617f5f77dd707e19369efeab435d9
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_packagedata became valid
NOTE: Running setscene task 629 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_packagedata_setscene)
NOTE: recipe perl-5.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1686 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_package)
NOTE: Running task 1687 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_populate_sysroot)
NOTE: recipe libxml2-2.11.5-r0: task do_package: Started
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_compile: Succeeded
NOTE: Running task 1688 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_install)
NOTE: recipe libunistring-1.1-r0: task do_install: Started
NOTE: recipe libunistring-1.1-r0: task do_install: Succeeded
NOTE: Running task 1689 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot)
NOTE: Running task 1690 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_package)
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot: Started
NOTE: recipe libunistring-1.1-r0: task do_package: Started
NOTE: recipe perl-5.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1692 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1693 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_configure)
NOTE: recipe libidn2-2.3.4-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_compile: Succeeded
NOTE: Running task 1694 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_compile_ptest_base)
NOTE: recipe libgcrypt-1.10.2-r0: task do_compile_ptest_base: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1695 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_install)
NOTE: recipe libgcrypt-1.10.2-r0: task do_install: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_install: Succeeded
NOTE: Running task 1696 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_install_ptest_base)
NOTE: recipe libgcrypt-1.10.2-r0: task do_install_ptest_base: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1697 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_populate_sysroot)
NOTE: Running task 1698 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_package)
NOTE: recipe libgcrypt-1.10.2-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_package: Started
NOTE: recipe libunistring-1.1-r0: task do_package: Succeeded
NOTE: Running task 1699 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata)
NOTE: recipe libunistring-1.1-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_packagedata: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_package: Succeeded
NOTE: Running task 1700 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_packagedata)
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata: Succeeded
NOTE: recipe coreutils-9.3-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_package unihash changed to 02c83339446abd5bc84e3fceb05d8e154f4dba7ba47909053b8496b20bdcad60
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_packagedata became valid
NOTE: Running setscene task 629 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.3-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libxml2-2.11.5-r0: task do_package: Succeeded
NOTE: Running task 1702 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_packagedata)
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata: Started
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1703 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_create_spdx)
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx: Started
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_configure: Succeeded
NOTE: Running task 1704 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_compile)
NOTE: recipe libidn2-2.3.4-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.4-r0: task do_compile: Succeeded
NOTE: Running task 1705 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_install)
NOTE: recipe libidn2-2.3.4-r0: task do_install: Started
NOTE: recipe libidn2-2.3.4-r0: task do_install: Succeeded
NOTE: Running task 1706 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot)
NOTE: Running task 1707 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_package)
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe libidn2-2.3.4-r0: task do_package: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1708 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1709 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-8.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-8.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1710 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_configure)
NOTE: recipe gnutls-3.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-8.2.1-r0: task do_configure: Started
NOTE: recipe gnutls-3.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1711 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_configure)
NOTE: recipe gnutls-3.8.0-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.4-r0: task do_package: Succeeded
NOTE: Running task 1712 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1713 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_configure_ptest_base)
NOTE: recipe curl-8.2.1-r0: task do_configure_ptest_base: Started
NOTE: recipe curl-8.2.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1714 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_compile)
NOTE: recipe curl-8.2.1-r0: task do_compile: Started
NOTE: recipe curl-8.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1715 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_compile_ptest_base)
NOTE: recipe curl-8.2.1-r0: task do_compile_ptest_base: Started
NOTE: recipe curl-8.2.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1716 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_install)
NOTE: recipe curl-8.2.1-r0: task do_install: Started
NOTE: recipe curl-8.2.1-r0: task do_install: Succeeded
NOTE: Running task 1717 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_install_ptest_base)
NOTE: recipe curl-8.2.1-r0: task do_install_ptest_base: Started
NOTE: recipe curl-8.2.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1718 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_populate_sysroot)
NOTE: Running task 1719 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_package)
NOTE: recipe curl-8.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe curl-8.2.1-r0: task do_package: Started
NOTE: recipe curl-8.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glibc-locale-2.37-r1: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_package unihash changed to 65bbc074a232940175f737bb32d7ef907fed348fb403ee8056840405a3ede870
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_packagedata became valid
NOTE: recipe gnutls-3.8.0-r0: task do_configure: Succeeded
NOTE: Running setscene task 629 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_packagedata_setscene)
NOTE: Running task 1720 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_configure_ptest_base)
NOTE: recipe glibc-locale-2.37-r1: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.0-r0: task do_configure_ptest_base: Started
NOTE: recipe gnutls-3.8.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1721 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_compile)
NOTE: recipe gnutls-3.8.0-r0: task do_compile: Started
NOTE: recipe curl-8.2.1-r0: task do_package: Succeeded
NOTE: Running task 1722 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_packagedata)
NOTE: recipe curl-8.2.1-r0: task do_packagedata: Started
NOTE: recipe curl-8.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe glibc-locale-2.37-r1: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1724 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_create_spdx)
NOTE: Running task 1725 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package_write_rpm)
NOTE: Running task 1726 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_package_write_rpm)
NOTE: Running task 1727 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_package_write_rpm)
NOTE: Running task 1728 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_package_qa)
NOTE: recipe glibc-locale-2.37-r1: task do_create_spdx: Started
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm: Started
NOTE: recipe glibc-locale-2.37-r1: task do_package_write_rpm: Started
NOTE: recipe libxml2-2.11.5-r0: task do_package_qa: Started
NOTE: recipe libxml2-2.11.5-r0: task do_package_write_rpm: Started
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package_write_rpm unihash changed to 65b1b697a31a1da090e6d5fb3525723907fd8f840296c2d7094dccf52415cbd2
NOTE: recipe libxml2-2.11.5-r0: task do_package_qa: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_compile: Succeeded
NOTE: Running task 1729 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_compile_ptest_base)
NOTE: recipe gnutls-3.8.0-r0: task do_compile_ptest_base: Started
NOTE: recipe gnutls-3.8.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1730 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_install)
NOTE: recipe gnutls-3.8.0-r0: task do_install: Started
NOTE: recipe libxml2-2.11.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_install: Succeeded
NOTE: Running task 1731 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_install_ptest_base)
NOTE: recipe gnutls-3.8.0-r0: task do_install_ptest_base: Started
NOTE: recipe glibc-locale-2.37-r1: task do_create_spdx: Succeeded
NOTE: Running task 1732 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_create_runtime_spdx)
NOTE: recipe libxml2-2.11.5-r0: task do_create_runtime_spdx: Started
NOTE: recipe libxml2-2.11.5-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1733 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_populate_sysroot)
NOTE: Running task 1734 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_package)
NOTE: recipe gnutls-3.8.0-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.8.0-r0: task do_package: Started
NOTE: recipe gnutls-3.8.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1735 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1736 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_configure)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_configure: Started
NOTE: recipe gnutls-3.8.0-r0: task do_package: Succeeded
NOTE: Running task 1737 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_packagedata)
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_configure: Succeeded
NOTE: Running task 1738 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_compile)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_compile: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_compile: Succeeded
NOTE: Running task 1739 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_install)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_install: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_install: Succeeded
NOTE: Running task 1740 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_populate_sysroot)
NOTE: Running task 1741 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_package)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_populate_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_package: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1742 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.189-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.189-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1743 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_configure)
NOTE: recipe elfutils-0.189-r0: task do_configure: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_package: Succeeded
NOTE: Running task 1744 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_packagedata)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_configure: Succeeded
NOTE: Running task 1745 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_configure_ptest_base)
NOTE: recipe elfutils-0.189-r0: task do_configure_ptest_base: Started
NOTE: recipe elfutils-0.189-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1746 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_compile)
NOTE: recipe elfutils-0.189-r0: task do_compile: Started
NOTE: recipe elfutils-0.189-r0: task do_compile: Succeeded
NOTE: Running task 1747 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_compile_ptest_base)
NOTE: recipe elfutils-0.189-r0: task do_compile_ptest_base: Started
NOTE: recipe elfutils-0.189-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1748 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_install)
NOTE: recipe elfutils-0.189-r0: task do_install: Started
NOTE: recipe elfutils-0.189-r0: task do_install: Succeeded
NOTE: Running task 1749 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_install_ptest_base)
NOTE: recipe elfutils-0.189-r0: task do_install_ptest_base: Started
NOTE: recipe elfutils-0.189-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1750 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_populate_sysroot)
NOTE: Running task 1751 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_package)
NOTE: recipe elfutils-0.189-r0: task do_populate_sysroot: Started
NOTE: recipe elfutils-0.189-r0: task do_package: Started
NOTE: recipe elfutils-0.189-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1752 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-2.41-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.41-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1753 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_configure)
NOTE: recipe binutils-2.41-r0: task do_configure: Started
NOTE: recipe binutils-2.41-r0: task do_configure: Succeeded
NOTE: Running task 1754 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_compile)
NOTE: recipe binutils-2.41-r0: task do_compile: Started
NOTE: recipe elfutils-0.189-r0: task do_package: Succeeded
NOTE: Running task 1755 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_packagedata)
NOTE: recipe elfutils-0.189-r0: task do_packagedata: Started
NOTE: recipe elfutils-0.189-r0: task do_packagedata: Succeeded
NOTE: recipe gcc-13.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1756 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_install)
NOTE: recipe gcc-13.2.0-r0: task do_install: Started
NOTE: recipe gcc-13.2.0-r0: task do_install: Succeeded
NOTE: Running task 1757 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_package)
NOTE: recipe gcc-13.2.0-r0: task do_package: Started
NOTE: recipe gcc-13.2.0-r0: task do_package: Succeeded
NOTE: Running task 1758 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_packagedata)
NOTE: recipe gcc-13.2.0-r0: task do_packagedata: Started
NOTE: recipe gcc-13.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe binutils-2.41-r0: task do_compile: Succeeded
NOTE: Running task 1759 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_install)
NOTE: recipe binutils-2.41-r0: task do_install: Started
NOTE: recipe glibc-locale-2.37-r1: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.41-r0: task do_install: Succeeded
NOTE: Running task 1760 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_package)
NOTE: recipe binutils-2.41-r0: task do_package: Started
NOTE: recipe binutils-2.41-r0: task do_package: Succeeded
NOTE: Running task 1761 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_packagedata)
NOTE: recipe binutils-2.41-r0: task do_packagedata: Started
NOTE: recipe binutils-2.41-r0: task do_packagedata: Succeeded
NOTE: Running task 1762 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_package_write_rpm)
NOTE: recipe python3-3.11.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-3.11.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1763 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_build)
NOTE: Tasks Summary: Attempted 1763 tasks of which 1473 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 6 seconds

Summary: There were 16 ERROR messages, returning a non-zero exit code.
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-src went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-dbg went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcrypto went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libssl went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-conf went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-engines went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-misc went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-ossl-module-legacy went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-ptest went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-staticdev went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-dev went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-doc went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-locale went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-bin went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2765862905246186234==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxml2-upgrade-2.11.4-2.11.5.patch"

RnJvbSAzNzhkYzAxMzBlZWVhNTI0NDQ0YjVlMjdlNWZmMjlkMzBiMWQ4ZTA0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTYgQXVnIDIwMjMgMDI6MTU6MzggKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ4bWwyOiB1cGdyYWRlIDIuMTEuNCAtPiAyLjExLjUKCi0tLQogLi4uL2xpYnhtbC97bGlieG1s
Ml8yLjExLjQuYmIgPT4gbGlieG1sMl8yLjExLjUuYmJ9ICAgICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWNvcmUvbGlieG1sL3tsaWJ4bWwyXzIuMTEuNC5iYiA9PiBsaWJ4bWwyXzIuMTEuNS5i
Yn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9saWJ4bWwvbGlieG1sMl8y
LjExLjQuYmIgYi9tZXRhL3JlY2lwZXMtY29yZS9saWJ4bWwvbGlieG1sMl8yLjExLjUuYmIKc2lt
aWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvcmUvbGlieG1sL2xp
YnhtbDJfMi4xMS40LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS9saWJ4bWwvbGlieG1s
Ml8yLjExLjUuYmIKaW5kZXggY2JmMjA1MDRmOC4uNGNmNmRkMDlhOSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWNvcmUvbGlieG1sL2xpYnhtbDJfMi4xMS40LmJiCisrKyBiL21ldGEvcmVjaXBl
cy1jb3JlL2xpYnhtbC9saWJ4bWwyXzIuMTEuNS5iYgpAQCAtMTgsNyArMTgsNyBAQCBTUkNfVVJJ
ICs9ICJodHRwOi8vd3d3LnczLm9yZy9YTUwvVGVzdC94bWx0czIwMTMwOTIzLnRhcjtzdWJkaXI9
JHtCUH07bmFtZT10ZXN0dAogICAgICAgICAgICBmaWxlOi8vaW5zdGFsbC10ZXN0cy5wYXRjaCBc
CiAgICAgICAgICAgICIKIAotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiNzM3ZTFkN2Y4
YWIzZjEzOTcyOWNhMTNhMjQ5NGZkMTdiZjMwZGRiNGI3YTQyN2NmMzM2MjUyY2FiNTdmNTdmNyIK
K1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjM3MjdiMDc4YzM2MGVjNjlmYTg2OWRlMTRi
ZDZmNzVkN2VlOGQzNjk4N2IwNzFlNjkyOGQ0NzIwYTI4ZGYzYTYiCiBTUkNfVVJJW3Rlc3R0YXIu
c2hhMjU2c3VtXSA9ICJjNmIyZDQyZWU1MGI4YjIzNmU3MTFhOTdkNjhlNmM0YjVjOGQ4M2U2OWEy
YmU0NzIyMzc5ZjA4NzAyZWE3MjczIgogCiBCSU5DT05GSUcgPSAiJHtiaW5kaXJ9L3htbDItY29u
ZmlnIgotLSAKMi4zOS4yCgo=

--===============2765862905246186234==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1805 targets, 54 skipped, 0 masked, 0 errors.
Removing 2 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 2 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c64c70a6515ba7be97650b88b9505a30a0bd23ef"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 169 Local 38 Mirrors 0 Missed 131 Current 460 (22% match, 79% complete)
Removing 28 stale sstate objects for arch cortexa15t2hf-neon...done.
Removing 13 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 474 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 478 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 493 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 513 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 518 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: Running setscene task 585 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 588 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_create_spdx_setscene)
NOTE: Running setscene task 589 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_create_spdx_setscene)
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_create_spdx_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 741 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_recipe_qa)
NOTE: Running task 742 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_recipe_qa)
NOTE: Running task 769 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_recipe_qa)
NOTE: Running task 802 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_recipe_qa)
NOTE: Running task 810 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_recipe_qa)
NOTE: Running task 819 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_recipe_qa)
NOTE: Running task 820 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_recipe_qa)
NOTE: Running task 821 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_recipe_qa)
NOTE: Running task 832 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_recipe_qa)
NOTE: Running task 840 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_recipe_qa)
NOTE: Running task 843 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_recipe_qa)
NOTE: Running task 844 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_recipe_qa)
NOTE: Running task 845 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_recipe_qa)
NOTE: Running task 902 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_recipe_qa)
NOTE: recipe libgcc-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 604 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_create_spdx_setscene)
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 954 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_recipe_qa)
NOTE: Running task 1000 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_recipe_qa)
NOTE: Running task 1002 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_recipe_qa)
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1030 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_recipe_qa)
NOTE: Running task 1037 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_deploy_source_date_epoch)
NOTE: recipe cracklib-2.9.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa: Started
NOTE: recipe libgpg-error-1.47-r0: task do_recipe_qa: Started
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa: Started
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_recipe_qa: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_recipe_qa: Started
NOTE: recipe file-5.45-r0: task do_recipe_qa: Started
NOTE: recipe libarchive-3.6.2-r0: task do_recipe_qa: Started
NOTE: recipe curl-8.2.1-r0: task do_recipe_qa: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa: Started
NOTE: recipe gnutls-3.8.0-r0: task do_recipe_qa: Started
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa: Started
NOTE: recipe elfutils-0.189-r0: task do_recipe_qa: Started
NOTE: recipe mpfr-4.2.0-r0: task do_recipe_qa: Started
NOTE: recipe libmpc-1.3.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-3.11.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 608 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_create_spdx_setscene)
NOTE: Running setscene task 610 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 613 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 614 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_recipe_qa: Started
NOTE: recipe gcc-13.2.0-r0: task do_recipe_qa: Started
NOTE: recipe gcc-13.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe binutils-2.41-r0: task do_recipe_qa: Started
NOTE: Running task 1275 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_package)
NOTE: recipe libxcrypt-4.4.36-r0: task do_create_spdx_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1278 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_package)
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_recipe_qa: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1279 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_fetch)
NOTE: recipe elfutils-0.189-r0: task do_recipe_qa: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_recipe_qa: Succeeded
NOTE: recipe file-5.45-r0: task do_recipe_qa: Succeeded
NOTE: recipe mpfr-4.2.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe gcc-13.2.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_recipe_qa: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxcrypt-4.4.36-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe binutils-2.41-r0: task do_recipe_qa: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-13.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 623 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_package_setscene)
NOTE: Running task 1293 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_fetch)
NOTE: Running task 1294 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_fetch)
NOTE: Running task 1306 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_fetch)
NOTE: Running task 1312 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1313 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_fetch)
NOTE: Running task 1325 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_fetch)
NOTE: Running task 1326 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_fetch)
NOTE: Running task 1327 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_fetch)
NOTE: Running task 1328 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_fetch)
NOTE: Running task 1332 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_fetch)
NOTE: Running task 1334 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_fetch)
NOTE: Running task 1335 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_fetch)
NOTE: Running task 1336 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_fetch)
NOTE: Running task 1354 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_fetch)
NOTE: Running task 1363 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_fetch)
NOTE: Running task 1375 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_package)
NOTE: Running task 1387 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_fetch)
NOTE: Running task 1388 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: Running task 1411 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package)
NOTE: Running noexec task 1420 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_fetch)
NOTE: Running task 1421 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_collect_spdx_deps)
NOTE: Running task 1436 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_package)
NOTE: Running task 1437 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_package)
NOTE: recipe curl-8.2.1-r0: task do_fetch: Started
NOTE: recipe libunistring-1.1-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.47-r0: task do_fetch: Started
NOTE: recipe file-5.45-r0: task do_fetch: Started
NOTE: recipe gmp-6.3.0-r0: task do_package: Started
NOTE: Running task 1440 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_collect_spdx_deps)
NOTE: recipe nettle-3.9.1-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Started
NOTE: recipe libmpc-1.3.1-r0: task do_fetch: Started
NOTE: Running task 1441 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_collect_spdx_deps)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_fetch: Started
NOTE: recipe libpam-1.5.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_fetch: Started
NOTE: recipe gnutls-3.8.0-r0: task do_fetch: Started
NOTE: recipe mpfr-4.2.0-r0: task do_fetch: Started
NOTE: recipe make-4.4.1-r0: task do_package: Started
NOTE: Running task 1442 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_collect_spdx_deps)
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Started
NOTE: recipe libunistring-1.1-r0: task do_fetch: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_fetch: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_fetch: Started
NOTE: Running task 1445 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_package_write_rpm)
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Succeeded
NOTE: recipe binutils-2.41-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe mpfr-4.2.0-r0: task do_fetch: Succeeded
NOTE: recipe sed-4.9-r0: task do_package: Started
NOTE: recipe psmisc-23.6-r0: task do_package: Started
NOTE: Running task 1446 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_unpack)
NOTE: Running task 1447 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_unpack)
NOTE: Running task 1448 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpam-1.5.3-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1449 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.10.2-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_fetch: Succeeded
NOTE: recipe binutils-2.41-r0: task do_fetch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Succeeded
NOTE: Running task 1450 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_unpack)
NOTE: Running task 1451 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_unpack)
NOTE: Running task 1452 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1453 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_unpack)
NOTE: Running task 1454 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_unpack)
NOTE: Running task 1455 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_unpack)
NOTE: Running task 1456 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_unpack)
NOTE: Running task 1457 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1458 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_unpack)
NOTE: Running task 1459 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_unpack)
NOTE: Running task 1460 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_unpack)
NOTE: Running task 1461 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_unpack)
NOTE: Running task 1462 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1463 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_unpack)
NOTE: Running task 1464 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe file-5.45-r0: task do_fetch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_collect_spdx_deps: Started
NOTE: recipe glibc-locale-2.37-r1: task do_collect_spdx_deps: Started
NOTE: Running task 1465 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_unpack)
NOTE: Running task 1466 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_unpack)
NOTE: Running task 1467 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_unpack)
NOTE: Running task 1468 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe make-4.4.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe perl-5.36.1-r0: task do_package: Started
NOTE: Running task 1469 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_unpack)
NOTE: Running task 1470 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_prepare_recipe_sysroot)
NOTE: recipe nettle-3.9.1-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.47-r0: task do_unpack: Started
NOTE: recipe libunistring-1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-8.2.1-r0: task do_unpack: Started
NOTE: recipe nettle-3.9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Started
NOTE: recipe libunistring-1.1-r0: task do_unpack: Started
NOTE: recipe gnutls-3.8.0-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.47-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_unpack: Started
NOTE: recipe glibc-locale-2.37-r1: task do_package: Started
NOTE: recipe libgcc-13.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_unpack: Started
NOTE: recipe mpfr-4.2.0-r0: task do_unpack: Started
NOTE: recipe libxml2-2.11.5-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Started
NOTE: recipe elfutils-0.189-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpfr-4.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Started
NOTE: recipe libmpc-1.3.1-r0: task do_unpack: Started
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.41-r0: task do_unpack: Started
NOTE: recipe file-5.45-r0: task do_unpack: Started
NOTE: recipe file-5.45-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.11.4-r0: task do_package_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Succeeded
NOTE: Running task 1471 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_create_spdx)
NOTE: recipe nettle-3.9.1-r0: task do_unpack: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 1472 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_patch)
NOTE: recipe glibc-locale-2.37-r1: task do_collect_spdx_deps: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 1473 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_patch)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_unpack: Succeeded
NOTE: Running task 1474 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_patch)
NOTE: Running task 1475 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_patch)
NOTE: recipe libgpg-error-1.47-r0: task do_unpack: Succeeded
NOTE: Running task 1476 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_patch)
NOTE: recipe libunistring-1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1477 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_patch)
NOTE: Running task 1478 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_patch)
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_patch: Started
NOTE: recipe nettle-3.9.1-r0: task do_patch: Started
NOTE: recipe bash-5.2.15-r0: task do_create_spdx: Started
NOTE: Running task 1479 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_patch)
NOTE: recipe mpfr-4.2.0-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Started
NOTE: recipe libmpc-1.3.1-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_patch: Started
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1480 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_patch)
NOTE: recipe libunistring-1.1-r0: task do_patch: Started
NOTE: recipe mpfr-4.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.47-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe file-5.45-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Started
NOTE: recipe libunistring-1.1-r0: task do_patch: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_patch: Succeeded
NOTE: Running task 1481 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-8.2.1-r0: task do_unpack: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_patch: Succeeded
NOTE: Running task 1482 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe mpfr-4.2.0-r0: task do_patch: Started
NOTE: Running task 1483 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_deploy_source_date_epoch)
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Succeeded
NOTE: Running task 1484 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_deploy_source_date_epoch)
NOTE: Running task 1485 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_patch)
NOTE: recipe libpam-1.5.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1486 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_patch)
NOTE: recipe libpam-1.5.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1487 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_configure)
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_unpack: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-8.2.1-r0: task do_patch: Started
NOTE: recipe libxml2-2.11.5-r0: task do_unpack: Succeeded
NOTE: Running task 1488 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_patch)
NOTE: recipe mpfr-4.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1489 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_patch)
NOTE: Running task 1490 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe unzip-1_6.0-r5: task do_patch: Started
NOTE: recipe curl-8.2.1-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_configure: Started
NOTE: Running task 1491 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcrypt-1.10.2-r0: task do_patch: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_patch: Started
NOTE: recipe file-5.45-r0: task do_unpack: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_unpack: Succeeded
NOTE: recipe mpfr-4.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1492 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_patch)
NOTE: Running task 1493 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_patch)
NOTE: recipe curl-8.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_patch: Started
NOTE: Running task 1494 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libmpc-1.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe file-5.45-r0: task do_patch: Started
NOTE: recipe elfutils-0.189-r0: task do_unpack: Succeeded
NOTE: Running task 1495 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_configure)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1496 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_patch)
NOTE: recipe libgpg-error-1.47-r0: task do_patch: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_patch: Succeeded
NOTE: Running task 1497 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.45-r0: task do_patch: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe make-4.4.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_patch: Succeeded
NOTE: Running task 1498 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1499 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_deploy_source_date_epoch)
NOTE: recipe elfutils-0.189-r0: task do_patch: Started
NOTE: Running task 1500 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libunistring-1.1-r0: task do_configure: Started
NOTE: recipe libxml2-2.11.5-r0: task do_patch: Succeeded
NOTE: recipe mpfr-4.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1501 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1502 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_populate_lic)
NOTE: recipe curl-8.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nettle-3.9.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.45-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1503 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_configure)
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxml2-2.11.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxml2-2.11.5-r0: task do_populate_lic: Started
NOTE: recipe mpfr-4.2.0-r0: task do_configure: Started
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1504 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_configure)
NOTE: recipe libgpg-error-1.47-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_populate_lic: Succeeded
NOTE: recipe file-5.45-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_populate_lic unihash changed to c992c6d62e164464a570a932ee49dcaf25c935e5b2c0ed8062819281a47cbf7d
NOTE: Running task 1505 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_configure)
NOTE: recipe nettle-3.9.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1506 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_configure)
NOTE: recipe libarchive-3.6.2-r0: task do_configure: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1507 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_configure)
NOTE: Running task 1508 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_configure)
NOTE: recipe libxml2-2.11.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_configure: Started
NOTE: recipe file-5.45-r0: task do_configure: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_configure: Started
NOTE: recipe nettle-3.9.1-r0: task do_configure: Started
NOTE: recipe gnutls-3.8.0-r0: task do_patch: Succeeded
NOTE: Running task 1509 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gnutls-3.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_patch: Succeeded
NOTE: Running task 1510 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcrypt-1.10.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe binutils-2.41-r0: task do_unpack: Succeeded
NOTE: Running task 1511 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_patch)
NOTE: recipe binutils-2.41-r0: task do_patch: Started
NOTE: recipe elfutils-0.189-r0: task do_patch: Succeeded
NOTE: Running task 1512 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_deploy_source_date_epoch)
NOTE: recipe elfutils-0.189-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe elfutils-0.189-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_create_spdx: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe make-4.4.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_package unihash changed to e3dd8c0b3cbd2eb8df1ddeb80afb61d3d7ee60cc8f76596d596fb0ccb041f3f0
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata became valid
NOTE: Running setscene task 623 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_package unihash changed to c7fb0e47c102517ed76847f1cc61b28b1ee494c9841f902b95ccd32c8b913678
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata became valid
NOTE: Running setscene task 621 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe psmisc-23.6-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_package unihash changed to b85e99040cd6f9bac13c7622f16d4eb693c6189129337ad4f648439b804805f8
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata became valid
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 623 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata_setscene)
NOTE: Running task 1515 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_create_spdx)
NOTE: Running task 1516 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_rpm)
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_create_spdx: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm: Started
NOTE: recipe binutils-2.41-r0: task do_patch: Succeeded
NOTE: Running task 1517 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_deploy_source_date_epoch)
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.41-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe binutils-2.41-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_patch: Succeeded
NOTE: Running task 1519 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1520 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_configure)
NOTE: recipe unzip-1_6.0-r5: task do_configure: Started
NOTE: recipe unzip-1_6.0-r5: task do_configure: Succeeded
NOTE: recipe make-4.4.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 1521 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_compile)
NOTE: recipe unzip-1_6.0-r5: task do_compile: Started
NOTE: recipe sed-4.9-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package unihash changed to 867c0c92009b6f883bb4411b0f3b9c3f9623a62cc35722afae804c1f591f2214
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata became valid
NOTE: Running setscene task 623 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 624 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 625 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 626 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssl/3.1.1/temp/log.do_packagedata_setscene.3915201
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 627 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_package_setscene)
NOTE: recipe openssl-3.1.1-r0: task do_package_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_configure: Succeeded
NOTE: Running task 1544 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_configure_ptest_base)
NOTE: recipe nettle-3.9.1-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.9.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1545 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_compile)
NOTE: recipe nettle-3.9.1-r0: task do_compile: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 629 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1567 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1569 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_packagedata)
NOTE: recipe openssl-3.1.1-r0: task do_packagedata: Started
NOTE: recipe libxml2-2.11.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1576 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_collect_spdx_deps)
NOTE: recipe libxml2-2.11.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxml2-2.11.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1577 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_configure)
NOTE: recipe unzip-1_6.0-r5: task do_compile: Succeeded
NOTE: Running task 1578 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_install)
NOTE: recipe libxml2-2.11.5-r0: task do_configure: Started
NOTE: recipe unzip-1_6.0-r5: task do_install: Started
NOTE: recipe unzip-1_6.0-r5: task do_install: Succeeded
NOTE: Running task 1579 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package)
NOTE: recipe unzip-1_6.0-r5: task do_package: Started
NOTE: recipe nettle-3.9.1-r0: task do_compile: Succeeded
NOTE: Running task 1580 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_compile_ptest_base)
NOTE: recipe nettle-3.9.1-r0: task do_compile_ptest_base: Started
NOTE: recipe file-5.45-r0: task do_configure: Succeeded
NOTE: Running task 1581 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_compile)
NOTE: recipe file-5.45-r0: task do_compile: Started
NOTE: recipe nettle-3.9.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1582 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_install)
NOTE: recipe nettle-3.9.1-r0: task do_install: Started
NOTE: recipe unzip-1_6.0-r5: task do_package: Succeeded
NOTE: Running task 1583 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata)
NOTE: recipe file-5.45-r0: task do_compile: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Started
NOTE: Running task 1584 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_install)
NOTE: recipe file-5.45-r0: task do_install: Started
NOTE: recipe mpfr-4.2.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1585 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_compile)
NOTE: recipe mpfr-4.2.0-r0: task do_compile: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_configure: Succeeded
NOTE: Running task 1586 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_configure_ptest_base)
NOTE: recipe nettle-3.9.1-r0: task do_install: Succeeded
NOTE: Running task 1587 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_install_ptest_base)
NOTE: recipe libgpg-error-1.47-r0: task do_configure_ptest_base: Started
NOTE: recipe libgpg-error-1.47-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1588 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_compile)
NOTE: recipe nettle-3.9.1-r0: task do_install_ptest_base: Started
NOTE: recipe libgpg-error-1.47-r0: task do_compile: Started
NOTE: recipe file-5.45-r0: task do_install: Succeeded
NOTE: Running task 1589 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_populate_sysroot)
NOTE: Running task 1590 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_package)
NOTE: recipe file-5.45-r0: task do_populate_sysroot: Started
NOTE: recipe file-5.45-r0: task do_package: Started
NOTE: recipe nettle-3.9.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1591 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_populate_sysroot)
NOTE: Running task 1592 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_package)
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.9.1-r0: task do_package: Started
NOTE: recipe file-5.45-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mpfr-4.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1593 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_install)
NOTE: recipe mpfr-4.2.0-r0: task do_install: Started
NOTE: recipe file-5.45-r0: task do_package: Succeeded
NOTE: Running task 1594 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_packagedata)
NOTE: recipe mpfr-4.2.0-r0: task do_install: Succeeded
NOTE: recipe file-5.45-r0: task do_packagedata: Started
NOTE: Running task 1595 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_populate_sysroot)
NOTE: Running task 1596 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_package)
NOTE: recipe mpfr-4.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe mpfr-4.2.0-r0: task do_package: Started
NOTE: recipe file-5.45-r0: task do_packagedata: Succeeded
NOTE: recipe mpfr-4.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1597 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmpc-1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmpc-1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1598 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_configure)
NOTE: recipe libmpc-1.3.1-r0: task do_configure: Started
NOTE: recipe mpfr-4.2.0-r0: task do_package: Succeeded
NOTE: Running task 1599 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_packagedata)
NOTE: recipe mpfr-4.2.0-r0: task do_packagedata: Started
NOTE: recipe mpfr-4.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_configure: Succeeded
NOTE: Running task 1600 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_configure_ptest_base)
NOTE: recipe libpam-1.5.3-r0: task do_configure_ptest_base: Started
NOTE: recipe libpam-1.5.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1601 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_compile)
NOTE: recipe libpam-1.5.3-r0: task do_compile: Started
NOTE: recipe nettle-3.9.1-r0: task do_package: Succeeded
NOTE: Running task 1602 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata)
NOTE: recipe nettle-3.9.1-r0: task do_packagedata: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_configure: Succeeded
NOTE: Running task 1603 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_configure_ptest_base)
NOTE: recipe libxml2-2.11.5-r0: task do_configure_ptest_base: Started
NOTE: recipe libxml2-2.11.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1604 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_compile)
NOTE: recipe libxml2-2.11.5-r0: task do_compile: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_configure: Succeeded
NOTE: Running task 1605 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_compile)
NOTE: recipe libtasn1-4.19.0-r0: task do_compile: Started
NOTE: recipe libmpc-1.3.1-r0: task do_configure: Succeeded
NOTE: Running task 1606 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_compile)
NOTE: recipe libmpc-1.3.1-r0: task do_compile: Started
NOTE: recipe libarchive-3.6.2-r0: task do_configure: Succeeded
NOTE: Running task 1607 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_compile)
NOTE: recipe libunistring-1.1-r0: task do_configure: Succeeded
NOTE: Running task 1608 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_compile)
NOTE: recipe libarchive-3.6.2-r0: task do_compile: Started
NOTE: recipe libunistring-1.1-r0: task do_compile: Started
NOTE: recipe libmpc-1.3.1-r0: task do_compile: Succeeded
NOTE: Running task 1609 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_install)
NOTE: recipe libtasn1-4.19.0-r0: task do_compile: Succeeded
NOTE: Running task 1610 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_install)
NOTE: recipe libmpc-1.3.1-r0: task do_install: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_install: Started
NOTE: recipe libmpc-1.3.1-r0: task do_install: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_compile: Succeeded
NOTE: Running task 1611 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_populate_sysroot)
NOTE: Running task 1612 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_package)
NOTE: Running task 1613 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_compile_ptest_base)
NOTE: recipe libmpc-1.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.47-r0: task do_compile_ptest_base: Started
NOTE: recipe libgpg-error-1.47-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_package: Started
NOTE: Running task 1614 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_install)
NOTE: recipe libgpg-error-1.47-r0: task do_install: Started
NOTE: recipe libmpc-1.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1615 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gcc-13.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcc-13.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1616 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_configure)
NOTE: recipe gcc-13.2.0-r0: task do_configure: Started
NOTE: recipe libarchive-3.6.2-r0: task do_compile: Succeeded
NOTE: Running task 1617 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_install)
NOTE: recipe libarchive-3.6.2-r0: task do_install: Started
NOTE: recipe libarchive-3.6.2-r0: task do_install: Succeeded
NOTE: Running task 1618 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_populate_sysroot)
NOTE: Running task 1619 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_package)
NOTE: recipe libtasn1-4.19.0-r0: task do_install: Succeeded
NOTE: Running task 1620 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot)
NOTE: Running task 1621 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_package)
NOTE: recipe libarchive-3.6.2-r0: task do_package: Started
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_package: Started
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_package: Succeeded
NOTE: Running task 1622 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata)
NOTE: recipe libxml2-2.11.5-r0: task do_compile: Succeeded
NOTE: Running task 1623 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_compile_ptest_base)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata: Started
NOTE: recipe libxml2-2.11.5-r0: task do_compile_ptest_base: Started
NOTE: recipe libxml2-2.11.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1624 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_install)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_install: Succeeded
NOTE: Running task 1625 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_install_ptest_base)
NOTE: recipe libxml2-2.11.5-r0: task do_install: Started
NOTE: recipe libgpg-error-1.47-r0: task do_install_ptest_base: Started
NOTE: recipe libgpg-error-1.47-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1626 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_populate_sysroot)
NOTE: Running task 1627 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_package)
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.47-r0: task do_package: Started
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_package: Succeeded
NOTE: Running task 1628 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_package: Succeeded
NOTE: Running task 1629 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_packagedata)
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata: Started
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_install: Succeeded
NOTE: Running task 1630 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_install_ptest_base)
NOTE: recipe libxml2-2.11.5-r0: task do_install_ptest_base: Started
NOTE: recipe gcc-13.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1631 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_compile)
NOTE: recipe gcc-13.2.0-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.47-r0: task do_package: Succeeded
NOTE: Running task 1632 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata)
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_compile: Succeeded
NOTE: Running task 1633 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_compile_ptest_base)
NOTE: recipe libpam-1.5.3-r0: task do_compile_ptest_base: Started
NOTE: recipe libpam-1.5.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1634 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_install)
NOTE: recipe libpam-1.5.3-r0: task do_install: Started
NOTE: recipe libxml2-2.11.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1635 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_package)
NOTE: Running task 1636 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_populate_sysroot)
NOTE: recipe libxml2-2.11.5-r0: task do_package: Started
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_install: Succeeded
NOTE: Running task 1637 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_install_ptest_base)
NOTE: recipe libpam-1.5.3-r0: task do_install_ptest_base: Started
NOTE: recipe libpam-1.5.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1638 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot)
NOTE: Running task 1639 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_package)
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot: Started
NOTE: recipe libpam-1.5.3-r0: task do_package: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot unihash changed to 6e7b58d6f0eb96e4d8b48ac236be9d049165d008849622660554c30dd134484c
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot became valid
NOTE: Running setscene task 620 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 629 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1652 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.10.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1669 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_configure)
NOTE: recipe libgcrypt-1.10.2-r0: task do_configure: Started
NOTE: recipe perl-5.36.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_package unihash changed to 14d3b6288cb6c3ad8f08069205d578b335efa8598508a0f6f93824fb4e6d22a4
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_packagedata became valid
NOTE: Running setscene task 629 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_packagedata_setscene)
NOTE: recipe perl-5.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libpam-1.5.3-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_package unihash changed to 9a5614c669b129e8db7bedcf0c8abaad792050233400bababa3cbf53a13ed3a9
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_package became valid
NOTE: Running setscene task 618 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 621 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 622 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 627 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_package_setscene)
NOTE: recipe shadow-4.13-r0: task do_package_setscene: Started
NOTE: recipe util-linux-2.39.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_package: Succeeded
NOTE: Running task 1671 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_packagedata)
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata: Started
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1672 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_create_spdx)
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx: Started
NOTE: recipe libunistring-1.1-r0: task do_compile: Succeeded
NOTE: Running task 1673 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_install)
NOTE: recipe libunistring-1.1-r0: task do_install: Started
NOTE: recipe shadow-4.13-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 629 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_install: Succeeded
NOTE: Running task 1674 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot)
NOTE: Running task 1675 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_package)
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot: Started
NOTE: recipe libunistring-1.1-r0: task do_package: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1679 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package)
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 1682 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_package)
NOTE: Running task 1683 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_create_spdx)
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1686 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_package: Started
NOTE: recipe libpam-1.5.3-r0: task do_create_spdx: Started
NOTE: recipe coreutils-9.3-r0: task do_package: Started
NOTE: recipe libidn2-2.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1687 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_configure)
NOTE: recipe libidn2-2.3.4-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1688 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_configure_ptest_base)
NOTE: recipe libgcrypt-1.10.2-r0: task do_configure_ptest_base: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1689 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_compile)
NOTE: recipe libgcrypt-1.10.2-r0: task do_compile: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package unihash changed to bea438badf39fd40dfc08bb27e0ce5d3b6a8c4c39e1178e1e77329666a89ffaa
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata became valid
NOTE: Running setscene task 629 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1691 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_package_write_rpm: Started
NOTE: recipe libunistring-1.1-r0: task do_package: Succeeded
NOTE: Running task 1692 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata)
NOTE: recipe libunistring-1.1-r0: task do_packagedata: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm unihash changed to 93d526b6393c79c84e0c4f4ebb0593ee15cc579149bff430164e14b5a2c0bf6c
NOTE: recipe libunistring-1.1-r0: task do_packagedata: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 1693 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_collect_spdx_deps)
NOTE: recipe shadow-4.13-r0: task do_collect_spdx_deps: Started
NOTE: recipe shadow-4.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1694 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_create_spdx)
NOTE: recipe shadow-4.13-r0: task do_create_spdx: Started
NOTE: recipe shadow-4.13-r0: task do_create_spdx: Succeeded
NOTE: Running task 1695 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_collect_spdx_deps)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_collect_spdx_deps: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1696 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_create_spdx)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_create_spdx: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_create_spdx: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_compile: Succeeded
NOTE: Running task 1697 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_compile_ptest_base)
NOTE: recipe libgcrypt-1.10.2-r0: task do_compile_ptest_base: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1698 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_install)
NOTE: recipe libgcrypt-1.10.2-r0: task do_install: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_install: Succeeded
NOTE: Running task 1699 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_install_ptest_base)
NOTE: recipe libgcrypt-1.10.2-r0: task do_install_ptest_base: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1700 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_populate_sysroot)
NOTE: Running task 1701 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_package)
NOTE: recipe libgcrypt-1.10.2-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_package: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_package: Succeeded
NOTE: Running task 1702 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_packagedata)
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata: Succeeded
NOTE: recipe coreutils-9.3-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_package unihash changed to c874a25b62e451552a34cb87634f07e2c198fc4dfd651012d1910db6582fd203
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_packagedata became valid
NOTE: Running setscene task 629 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.3-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libidn2-2.3.4-r0: task do_configure: Succeeded
NOTE: Running task 1704 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_compile)
NOTE: recipe libidn2-2.3.4-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.4-r0: task do_compile: Succeeded
NOTE: Running task 1705 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_install)
NOTE: recipe libidn2-2.3.4-r0: task do_install: Started
NOTE: recipe libidn2-2.3.4-r0: task do_install: Succeeded
NOTE: Running task 1706 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot)
NOTE: Running task 1707 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_package)
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe libidn2-2.3.4-r0: task do_package: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1708 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1709 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-8.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-8.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1710 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_configure)
NOTE: recipe gnutls-3.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_configure: Started
NOTE: Running task 1711 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_configure)
NOTE: recipe gnutls-3.8.0-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.4-r0: task do_package: Succeeded
NOTE: Running task 1712 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1713 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_configure_ptest_base)
NOTE: recipe curl-8.2.1-r0: task do_configure_ptest_base: Started
NOTE: recipe curl-8.2.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1714 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_compile)
NOTE: recipe curl-8.2.1-r0: task do_compile: Started
NOTE: recipe glibc-locale-2.37-r1: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_package unihash changed to 7e2aeaf35c56e1e564c9d685c25e48536e9606bb5b07618b88ba74ff659a42f6
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_packagedata became valid
NOTE: Running setscene task 629 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_packagedata_setscene)
NOTE: recipe glibc-locale-2.37-r1: task do_packagedata_setscene: Started
NOTE: recipe curl-8.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1715 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_compile_ptest_base)
NOTE: recipe curl-8.2.1-r0: task do_compile_ptest_base: Started
NOTE: recipe curl-8.2.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1716 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_install)
NOTE: recipe curl-8.2.1-r0: task do_install: Started
NOTE: recipe curl-8.2.1-r0: task do_install: Succeeded
NOTE: Running task 1717 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_install_ptest_base)
NOTE: recipe curl-8.2.1-r0: task do_install_ptest_base: Started
NOTE: recipe curl-8.2.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1718 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_populate_sysroot)
NOTE: Running task 1719 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_package)
NOTE: recipe curl-8.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe curl-8.2.1-r0: task do_package: Started
NOTE: recipe curl-8.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glibc-locale-2.37-r1: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1721 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_create_spdx)
NOTE: Running task 1722 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package_write_rpm)
NOTE: Running task 1723 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_package_write_rpm)
NOTE: Running task 1724 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_package_write_rpm)
NOTE: Running task 1725 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_package_qa)
NOTE: recipe glibc-locale-2.37-r1: task do_create_spdx: Started
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm: Started
NOTE: recipe glibc-locale-2.37-r1: task do_package_write_rpm: Started
NOTE: recipe libxml2-2.11.5-r0: task do_package_write_rpm: Started
NOTE: recipe libxml2-2.11.5-r0: task do_package_qa: Started
NOTE: recipe curl-8.2.1-r0: task do_package: Succeeded
NOTE: Running task 1726 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_packagedata)
NOTE: recipe curl-8.2.1-r0: task do_packagedata: Started
NOTE: recipe curl-8.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_package_qa: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package_write_rpm unihash changed to d02fb8b189ea5f9b1441f40380619413703527998694f6d29f4a7be8a84b5994
NOTE: recipe gnutls-3.8.0-r0: task do_configure: Succeeded
NOTE: Running task 1727 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_configure_ptest_base)
NOTE: recipe gnutls-3.8.0-r0: task do_configure_ptest_base: Started
NOTE: recipe gnutls-3.8.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1728 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_compile)
NOTE: recipe gnutls-3.8.0-r0: task do_compile: Started
NOTE: recipe libxml2-2.11.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_compile: Succeeded
NOTE: Running task 1729 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_compile_ptest_base)
NOTE: recipe gnutls-3.8.0-r0: task do_compile_ptest_base: Started
NOTE: recipe gnutls-3.8.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1730 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_install)
NOTE: recipe gnutls-3.8.0-r0: task do_install: Started
NOTE: recipe glibc-locale-2.37-r1: task do_create_spdx: Succeeded
NOTE: Running task 1731 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_create_runtime_spdx)
NOTE: recipe libxml2-2.11.5-r0: task do_create_runtime_spdx: Started
NOTE: recipe libxml2-2.11.5-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_install: Succeeded
NOTE: Running task 1732 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_install_ptest_base)
NOTE: recipe gnutls-3.8.0-r0: task do_install_ptest_base: Started
NOTE: recipe gnutls-3.8.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1733 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_populate_sysroot)
NOTE: Running task 1734 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_package)
NOTE: recipe gnutls-3.8.0-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.8.0-r0: task do_package: Started
NOTE: recipe gnutls-3.8.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1735 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1736 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_configure)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_configure: Started
NOTE: recipe gnutls-3.8.0-r0: task do_package: Succeeded
NOTE: Running task 1737 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_packagedata)
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_configure: Succeeded
NOTE: Running task 1738 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_compile)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_compile: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_compile: Succeeded
NOTE: Running task 1739 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_install)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_install: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_install: Succeeded
NOTE: Running task 1740 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_populate_sysroot)
NOTE: Running task 1741 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_package)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_populate_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_package: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1742 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.189-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.189-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1743 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_configure)
NOTE: recipe elfutils-0.189-r0: task do_configure: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_package: Succeeded
NOTE: Running task 1744 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_packagedata)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata: Succeeded
NOTE: recipe gcc-13.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1745 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_install)
NOTE: recipe gcc-13.2.0-r0: task do_install: Started
NOTE: recipe elfutils-0.189-r0: task do_configure: Succeeded
NOTE: Running task 1746 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_configure_ptest_base)
NOTE: recipe elfutils-0.189-r0: task do_configure_ptest_base: Started
NOTE: recipe elfutils-0.189-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1747 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_compile)
NOTE: recipe elfutils-0.189-r0: task do_compile: Started
NOTE: recipe gcc-13.2.0-r0: task do_install: Succeeded
NOTE: Running task 1748 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_package)
NOTE: recipe gcc-13.2.0-r0: task do_package: Started
NOTE: recipe elfutils-0.189-r0: task do_compile: Succeeded
NOTE: Running task 1749 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_compile_ptest_base)
NOTE: recipe elfutils-0.189-r0: task do_compile_ptest_base: Started
NOTE: recipe gcc-13.2.0-r0: task do_package: Succeeded
NOTE: Running task 1750 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_packagedata)
NOTE: recipe gcc-13.2.0-r0: task do_packagedata: Started
NOTE: recipe elfutils-0.189-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1751 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_install)
NOTE: recipe elfutils-0.189-r0: task do_install: Started
NOTE: recipe gcc-13.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_install: Succeeded
NOTE: Running task 1752 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_install_ptest_base)
NOTE: recipe elfutils-0.189-r0: task do_install_ptest_base: Started
NOTE: recipe elfutils-0.189-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1753 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_populate_sysroot)
NOTE: Running task 1754 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_package)
NOTE: recipe elfutils-0.189-r0: task do_populate_sysroot: Started
NOTE: recipe elfutils-0.189-r0: task do_package: Started
NOTE: recipe elfutils-0.189-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1755 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-2.41-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.41-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1756 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_configure)
NOTE: recipe binutils-2.41-r0: task do_configure: Started
NOTE: recipe binutils-2.41-r0: task do_configure: Succeeded
NOTE: Running task 1757 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_compile)
NOTE: recipe binutils-2.41-r0: task do_compile: Started
NOTE: recipe elfutils-0.189-r0: task do_package: Succeeded
NOTE: Running task 1758 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_packagedata)
NOTE: recipe elfutils-0.189-r0: task do_packagedata: Started
NOTE: recipe elfutils-0.189-r0: task do_packagedata: Succeeded
NOTE: recipe binutils-2.41-r0: task do_compile: Succeeded
NOTE: Running task 1759 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_install)
NOTE: recipe binutils-2.41-r0: task do_install: Started
NOTE: recipe glibc-locale-2.37-r1: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.41-r0: task do_install: Succeeded
NOTE: Running task 1760 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_package)
NOTE: recipe binutils-2.41-r0: task do_package: Started
NOTE: recipe binutils-2.41-r0: task do_package: Succeeded
NOTE: Running task 1761 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_packagedata)
NOTE: recipe binutils-2.41-r0: task do_packagedata: Started
NOTE: recipe binutils-2.41-r0: task do_packagedata: Succeeded
NOTE: Running task 1762 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_package_write_rpm)
NOTE: recipe python3-3.11.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-3.11.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1763 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_build)
NOTE: Tasks Summary: Attempted 1763 tasks of which 1488 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 6 seconds

Summary: There were 16 ERROR messages, returning a non-zero exit code.
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-src went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-dbg went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcrypto went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libssl went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-conf went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-engines went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-misc went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-ossl-module-legacy went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-ptest went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-staticdev went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-dev went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-doc went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-locale went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-bin went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2765862905246186234==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1807 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1805 targets, 37 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c64c70a6515ba7be97650b88b9505a30a0bd23ef"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 159 Local 28 Mirrors 0 Missed 131 Current 470 (17% match, 79% complete)
Removing 22 stale sstate objects for arch core2-64...done.
Removing 13 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 486 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 501 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 520 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 525 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 764 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_recipe_qa)
NOTE: Running task 765 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_recipe_qa)
NOTE: Running task 810 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_recipe_qa)
NOTE: Running task 849 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_recipe_qa)
NOTE: Running task 867 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_recipe_qa)
NOTE: Running task 880 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_recipe_qa)
NOTE: Running task 881 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_recipe_qa)
NOTE: Running task 882 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_recipe_qa)
NOTE: Running task 897 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_recipe_qa)
NOTE: Running task 912 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_recipe_qa)
NOTE: Running task 915 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_recipe_qa)
NOTE: Running task 916 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_recipe_qa)
NOTE: Running task 917 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_recipe_qa)
NOTE: Running task 987 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_recipe_qa)
NOTE: recipe python3-3.11.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1042 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_recipe_qa)
NOTE: Running task 1095 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_recipe_qa)
NOTE: Running setscene task 615 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa: Started
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa: Started
NOTE: Running task 1190 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa: Started
NOTE: recipe libgpg-error-1.47-r0: task do_recipe_qa: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_recipe_qa: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_recipe_qa: Started
NOTE: recipe file-5.45-r0: task do_recipe_qa: Started
NOTE: recipe curl-8.2.1-r0: task do_recipe_qa: Started
NOTE: recipe gnutls-3.8.0-r0: task do_recipe_qa: Started
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa: Started
NOTE: recipe elfutils-0.189-r0: task do_recipe_qa: Started
NOTE: recipe mpfr-4.2.0-r0: task do_recipe_qa: Started
NOTE: Running task 1304 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_package)
NOTE: recipe libmpc-1.3.1-r0: task do_recipe_qa: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa: Started
NOTE: recipe libarchive-3.6.2-r0: task do_recipe_qa: Started
NOTE: recipe unzip-1_6.0-r5: task do_recipe_qa: Started
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1307 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_package)
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe file-5.45-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1308 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_fetch)
NOTE: recipe libgcrypt-1.10.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_recipe_qa: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_recipe_qa: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_recipe_qa: Succeeded
NOTE: recipe mpfr-4.2.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1310 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_fetch)
NOTE: Running task 1311 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_fetch)
NOTE: Running task 1312 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_fetch)
NOTE: Running task 1316 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_package)
NOTE: Running task 1317 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_fetch)
NOTE: Running task 1318 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_fetch)
NOTE: Running task 1319 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_fetch)
NOTE: Running task 1320 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_fetch)
NOTE: Running task 1331 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_recipe_qa)
NOTE: Running task 1341 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_fetch)
NOTE: recipe libmpc-1.3.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1342 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_fetch)
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1377 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package)
NOTE: recipe curl-8.2.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_recipe_qa: Succeeded
NOTE: Running task 1378 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_fetch)
NOTE: Running task 1389 of 1763 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_collect_spdx_deps)
NOTE: Running task 1390 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_fetch)
NOTE: Running task 1391 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_fetch)
NOTE: Running task 1394 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_recipe_qa)
NOTE: Running task 1403 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1429 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_package)
NOTE: Running task 1430 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_fetch)
NOTE: Running task 1431 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_package)
NOTE: recipe gmp-6.3.0-r0: task do_package: Started
NOTE: Running task 1432 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: recipe libarchive-3.6.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1435 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_collect_spdx_deps)
NOTE: Running task 1437 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_collect_spdx_deps)
NOTE: Running task 1441 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_package_write_rpm)
NOTE: recipe make-4.4.1-r0: task do_package: Started
NOTE: Running task 1442 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_fetch)
NOTE: recipe glibc-locale-2.37-r1: task do_package: Started
NOTE: recipe sed-4.9-r0: task do_package: Started
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 623 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_package_setscene)
NOTE: Running task 1443 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_configure)
NOTE: recipe libgcrypt-1.10.2-r0: task do_fetch: Started
NOTE: recipe file-5.45-r0: task do_fetch: Started
NOTE: recipe nettle-3.9.1-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Started
NOTE: recipe libunistring-1.1-r0: task do_fetch: Started
NOTE: recipe mpfr-4.2.0-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.47-r0: task do_fetch: Started
NOTE: recipe elfutils-0.189-r0: task do_fetch: Started
NOTE: recipe binutils-2.41-r0: task do_recipe_qa: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_fetch: Started
NOTE: recipe libunistring-1.1-r0: task do_fetch: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_fetch: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.47-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_fetch: Succeeded
NOTE: recipe mpfr-4.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_fetch: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_fetch: Started
NOTE: recipe gnutls-3.8.0-r0: task do_fetch: Succeeded
NOTE: recipe gcc-13.2.0-r0: task do_recipe_qa: Started
NOTE: recipe file-5.45-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_fetch: Started
NOTE: recipe libmpc-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe gcc-13.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Started
NOTE: recipe libxml2-native-2.11.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxml2-2.11.5-r0: task do_fetch: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_fetch: Started
NOTE: Running task 1444 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_unpack)
NOTE: recipe make-4.4.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe glibc-locale-2.37-r1: task do_collect_spdx_deps: Started
NOTE: Running task 1445 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_unpack)
NOTE: Running task 1446 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxml2-native-2.11.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1447 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-8.2.1-r0: task do_fetch: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_package: Started
NOTE: Running task 1448 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_unpack)
NOTE: Running task 1449 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_unpack)
NOTE: Running task 1450 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1451 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_unpack)
NOTE: Running task 1452 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_unpack)
NOTE: Running task 1453 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_unpack)
NOTE: Running task 1454 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Started
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Succeeded
NOTE: Running task 1455 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_unpack)
NOTE: Running task 1456 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_unpack)
NOTE: Running task 1457 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_unpack)
NOTE: Running task 1458 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_unpack)
NOTE: Running task 1459 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_unpack)
NOTE: Running task 1460 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1461 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_unpack)
NOTE: Running task 1462 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe perl-5.36.1-r0: task do_package: Started
NOTE: recipe libgcc-13.2.0-r0: task do_package_write_rpm: Started
NOTE: Running task 1463 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_unpack)
NOTE: Running task 1464 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_unpack)
NOTE: Running task 1465 of 1763 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_create_spdx)
NOTE: Running task 1466 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gcc-13.2.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_configure: Started
NOTE: recipe libunistring-1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.41-r0: task do_recipe_qa: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_unpack: Started
NOTE: recipe nettle-3.9.1-r0: task do_unpack: Started
NOTE: recipe nettle-3.9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1467 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_unpack)
NOTE: Running task 1468 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgpg-error-1.47-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.1-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Started
NOTE: Running task 1469 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_fetch)
NOTE: Running noexec task 1470 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_fetch)
NOTE: recipe libgcrypt-1.10.2-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.8.0-r0: task do_unpack: Started
NOTE: recipe libxml2-2.11.5-r0: task do_unpack: Started
NOTE: recipe file-5.45-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Started
NOTE: recipe curl-8.2.1-r0: task do_unpack: Started
NOTE: recipe elfutils-0.189-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_unpack: Started
NOTE: recipe file-5.45-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpfr-4.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Started
NOTE: recipe libmpc-1.3.1-r0: task do_unpack: Started
NOTE: recipe gcc-13.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpfr-4.2.0-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxml2-native-2.11.5-r0: task do_create_spdx: Started
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Started
NOTE: recipe binutils-2.41-r0: task do_fetch: Started
NOTE: recipe nettle-3.9.1-r0: task do_unpack: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 1471 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_patch)
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_unpack: Succeeded
NOTE: Running task 1472 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_patch)
NOTE: Running task 1473 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_patch)
NOTE: Running task 1474 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_patch)
NOTE: recipe binutils-2.41-r0: task do_fetch: Succeeded
NOTE: Running task 1475 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_patch)
NOTE: recipe python3-3.11.4-r0: task do_package_setscene: Started
NOTE: Running task 1476 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_unpack)
NOTE: recipe libunistring-1.1-r0: task do_unpack: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_unpack: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_patch: Started
NOTE: Running task 1477 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_patch)
NOTE: recipe nettle-3.9.1-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Started
NOTE: Running task 1478 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_patch)
NOTE: recipe nettle-3.9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_patch: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_patch: Started
NOTE: recipe binutils-2.41-r0: task do_unpack: Started
NOTE: recipe file-5.45-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_patch: Started
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1479 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_patch)
NOTE: recipe libmpc-1.3.1-r0: task do_patch: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_patch: Started
NOTE: Running task 1480 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxml2-native-2.11.5-r0: task do_create_spdx: Succeeded
NOTE: recipe mpfr-4.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_patch: Succeeded
NOTE: Running task 1481 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1482 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-8.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1483 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_patch)
NOTE: Running task 1484 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_collect_spdx_deps)
NOTE: recipe libarchive-3.6.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_patch: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Started
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1485 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_deploy_source_date_epoch)
NOTE: Running task 1486 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_patch)
NOTE: recipe mpfr-4.2.0-r0: task do_unpack: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1487 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_patch)
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxml2-2.11.5-r0: task do_unpack: Succeeded
NOTE: Running task 1488 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_patch)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_unpack: Succeeded
NOTE: Running task 1489 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_patch)
NOTE: recipe nettle-3.9.1-r0: task do_patch: Succeeded
NOTE: recipe file-5.45-r0: task do_unpack: Succeeded
NOTE: Running task 1490 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_patch)
NOTE: Running task 1491 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-8.2.1-r0: task do_patch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Succeeded
NOTE: Running task 1492 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxml2-2.11.5-r0: task do_patch: Started
NOTE: recipe file-5.45-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_patch: Started
NOTE: recipe mpfr-4.2.0-r0: task do_patch: Started
NOTE: recipe nettle-3.9.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe unzip-1_6.0-r5: task do_patch: Started
NOTE: recipe gnutls-3.8.0-r0: task do_unpack: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_patch: Succeeded
NOTE: Running task 1493 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_patch)
NOTE: recipe curl-8.2.1-r0: task do_patch: Succeeded
NOTE: Running task 1494 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgpg-error-1.47-r0: task do_patch: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe file-5.45-r0: task do_patch: Succeeded
NOTE: Running task 1495 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe mpfr-4.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1496 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_deploy_source_date_epoch)
NOTE: Running task 1497 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_deploy_source_date_epoch)
NOTE: recipe libpam-1.5.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1498 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_configure)
NOTE: Running task 1499 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.8.0-r0: task do_patch: Started
NOTE: recipe libxml2-2.11.5-r0: task do_patch: Succeeded
NOTE: recipe file-5.45-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1500 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1501 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_populate_lic)
NOTE: recipe libunistring-1.1-r0: task do_configure: Started
NOTE: recipe curl-8.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgpg-error-1.47-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpfr-4.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nettle-3.9.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1502 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_configure)
NOTE: recipe glibc-locale-2.37-r1: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_populate_lic: Started
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_unpack: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1503 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_configure)
NOTE: Running task 1504 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_patch)
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_configure: Started
NOTE: recipe make-4.4.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1505 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_configure)
NOTE: recipe curl-8.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe file-5.45-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.47-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1506 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_configure)
NOTE: recipe libxml2-2.11.5-r0: task do_populate_lic: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_patch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_populate_lic unihash changed to c992c6d62e164464a570a932ee49dcaf25c935e5b2c0ed8062819281a47cbf7d
NOTE: Running task 1507 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_configure)
NOTE: recipe mpfr-4.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1508 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_configure)
NOTE: recipe libtasn1-4.19.0-r0: task do_configure: Started
NOTE: recipe file-5.45-r0: task do_configure: Started
NOTE: recipe libxml2-2.11.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpfr-4.2.0-r0: task do_configure: Started
NOTE: recipe gnutls-3.8.0-r0: task do_patch: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_configure: Started
NOTE: Running task 1509 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gnutls-3.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_patch: Succeeded
NOTE: Running task 1510 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcrypt-1.10.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_patch: Succeeded
NOTE: Running task 1511 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_deploy_source_date_epoch)
NOTE: recipe elfutils-0.189-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe elfutils-0.189-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe binutils-2.41-r0: task do_unpack: Succeeded
NOTE: Running task 1512 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_patch)
NOTE: recipe binutils-2.41-r0: task do_patch: Started
NOTE: recipe make-4.4.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_package unihash changed to d9393d8eaad453688078eaa27eae9513a36a819b9d0cff416e7b5759c7eccb12
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata became valid
NOTE: Running setscene task 623 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_patch: Succeeded
NOTE: Running task 1513 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gmp-6.3.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_package unihash changed to f030e0a4340767bd22b647fe81703a60eb6a7a1fc4b9a6bf6661f9026a76d3ba
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata became valid
NOTE: recipe psmisc-23.6-r0: task do_package: Succeeded
NOTE: Running setscene task 621 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_package unihash changed to 7f5e1e74a0763b6a3515dc2d31898f776b073022291c861ffc66e20672181157
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata became valid
NOTE: Running setscene task 623 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1514 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_configure)
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1517 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_create_spdx)
NOTE: Running task 1518 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_rpm)
NOTE: recipe unzip-1_6.0-r5: task do_configure: Started
NOTE: recipe make-4.4.1-r0: task do_create_spdx: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm: Started
NOTE: recipe unzip-1_6.0-r5: task do_configure: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1519 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_compile)
NOTE: recipe unzip-1_6.0-r5: task do_compile: Started
NOTE: recipe binutils-2.41-r0: task do_patch: Succeeded
NOTE: Running task 1521 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_deploy_source_date_epoch)
NOTE: recipe binutils-2.41-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcc-13.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.41-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe make-4.4.1-r0: task do_create_spdx: Succeeded
NOTE: recipe sed-4.9-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package unihash changed to 27c334d55c3dbe03bffb7d9f6cc0869da1578941f9c5163359d242a050045dc8
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata became valid
NOTE: Running setscene task 623 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 624 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 625 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 626 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/openssl/3.1.1/temp/log.do_packagedata_setscene.865172
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 627 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_package_setscene)
NOTE: recipe openssl-3.1.1-r0: task do_package_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_configure: Succeeded
NOTE: Running task 1544 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_configure_ptest_base)
NOTE: recipe nettle-3.9.1-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.9.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1545 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_compile)
NOTE: recipe nettle-3.9.1-r0: task do_compile: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_compile: Succeeded
NOTE: Running task 1546 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_install)
NOTE: recipe unzip-1_6.0-r5: task do_install: Started
NOTE: recipe openssl-3.1.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 629 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_install: Succeeded
NOTE: Running task 1547 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package)
NOTE: recipe openssl-3.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package: Started
NOTE: recipe openssl-3.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1569 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1571 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_packagedata)
NOTE: recipe libxml2-2.11.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.1.1-r0: task do_packagedata: Started
NOTE: recipe openssl-3.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1578 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_collect_spdx_deps)
NOTE: recipe libxml2-2.11.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxml2-2.11.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1579 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_configure)
NOTE: recipe libxml2-2.11.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_configure: Started
NOTE: recipe nettle-3.9.1-r0: task do_compile: Succeeded
NOTE: Running task 1580 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_compile_ptest_base)
NOTE: recipe nettle-3.9.1-r0: task do_compile_ptest_base: Started
NOTE: recipe file-5.45-r0: task do_configure: Succeeded
NOTE: Running task 1581 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_compile)
NOTE: recipe file-5.45-r0: task do_compile: Started
NOTE: recipe unzip-1_6.0-r5: task do_package: Succeeded
NOTE: Running task 1582 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Started
NOTE: recipe nettle-3.9.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1583 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_install)
NOTE: recipe nettle-3.9.1-r0: task do_install: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Succeeded
NOTE: recipe file-5.45-r0: task do_compile: Succeeded
NOTE: Running task 1584 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_install)
NOTE: recipe file-5.45-r0: task do_install: Started
NOTE: recipe nettle-3.9.1-r0: task do_install: Succeeded
NOTE: Running task 1585 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_install_ptest_base)
NOTE: recipe nettle-3.9.1-r0: task do_install_ptest_base: Started
NOTE: recipe mpfr-4.2.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1586 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_compile)
NOTE: recipe mpfr-4.2.0-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.47-r0: task do_configure: Succeeded
NOTE: Running task 1587 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_configure_ptest_base)
NOTE: recipe libgpg-error-1.47-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.9.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe file-5.45-r0: task do_install: Succeeded
NOTE: Running task 1588 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_populate_sysroot)
NOTE: Running task 1589 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_compile)
NOTE: Running task 1590 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_package)
NOTE: Running task 1591 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_populate_sysroot)
NOTE: Running task 1592 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_package)
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.9.1-r0: task do_package: Started
NOTE: recipe libgpg-error-1.47-r0: task do_compile: Started
NOTE: recipe file-5.45-r0: task do_package: Started
NOTE: recipe file-5.45-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe file-5.45-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mpfr-4.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1593 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_install)
NOTE: recipe mpfr-4.2.0-r0: task do_install: Started
NOTE: recipe file-5.45-r0: task do_package: Succeeded
NOTE: Running task 1594 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_packagedata)
NOTE: recipe file-5.45-r0: task do_packagedata: Started
NOTE: recipe file-5.45-r0: task do_packagedata: Succeeded
NOTE: recipe mpfr-4.2.0-r0: task do_install: Succeeded
NOTE: Running task 1595 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_populate_sysroot)
NOTE: Running task 1596 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_package)
NOTE: recipe mpfr-4.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe mpfr-4.2.0-r0: task do_package: Started
NOTE: recipe mpfr-4.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1597 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmpc-1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmpc-1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1598 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_configure)
NOTE: recipe libmpc-1.3.1-r0: task do_configure: Started
NOTE: recipe mpfr-4.2.0-r0: task do_package: Succeeded
NOTE: Running task 1599 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_packagedata)
NOTE: recipe mpfr-4.2.0-r0: task do_packagedata: Started
NOTE: recipe mpfr-4.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_configure: Succeeded
NOTE: Running task 1600 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_configure_ptest_base)
NOTE: recipe libpam-1.5.3-r0: task do_configure_ptest_base: Started
NOTE: recipe libpam-1.5.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1601 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_compile)
NOTE: recipe libpam-1.5.3-r0: task do_compile: Started
NOTE: recipe libxml2-2.11.5-r0: task do_configure: Succeeded
NOTE: Running task 1602 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_configure_ptest_base)
NOTE: recipe libxml2-2.11.5-r0: task do_configure_ptest_base: Started
NOTE: recipe libxml2-2.11.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1603 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_compile)
NOTE: recipe libxml2-2.11.5-r0: task do_compile: Started
NOTE: recipe nettle-3.9.1-r0: task do_package: Succeeded
NOTE: Running task 1604 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata)
NOTE: recipe nettle-3.9.1-r0: task do_packagedata: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_configure: Succeeded
NOTE: Running task 1605 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_compile)
NOTE: recipe nettle-3.9.1-r0: task do_packagedata: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.47-r0: task do_compile: Succeeded
NOTE: Running task 1606 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_compile_ptest_base)
NOTE: recipe libgpg-error-1.47-r0: task do_compile_ptest_base: Started
NOTE: recipe libgpg-error-1.47-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1607 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_install)
NOTE: recipe libgpg-error-1.47-r0: task do_install: Started
NOTE: recipe libarchive-3.6.2-r0: task do_configure: Succeeded
NOTE: Running task 1608 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_compile)
NOTE: recipe libarchive-3.6.2-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.47-r0: task do_install: Succeeded
NOTE: Running task 1609 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_install_ptest_base)
NOTE: recipe libgpg-error-1.47-r0: task do_install_ptest_base: Started
NOTE: recipe libgpg-error-1.47-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1610 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_populate_sysroot)
NOTE: Running task 1611 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_package)
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.47-r0: task do_package: Started
NOTE: recipe libmpc-1.3.1-r0: task do_configure: Succeeded
NOTE: Running task 1612 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_compile)
NOTE: recipe libmpc-1.3.1-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_compile: Succeeded
NOTE: Running task 1613 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_install)
NOTE: recipe libtasn1-4.19.0-r0: task do_compile: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_install: Started
NOTE: Running task 1614 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_install)
NOTE: recipe libtasn1-4.19.0-r0: task do_install: Started
NOTE: recipe libarchive-3.6.2-r0: task do_compile: Succeeded
NOTE: Running task 1615 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_install)
NOTE: recipe libmpc-1.3.1-r0: task do_install: Succeeded
NOTE: Running task 1616 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_populate_sysroot)
NOTE: Running task 1617 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_package)
NOTE: recipe libarchive-3.6.2-r0: task do_install: Started
NOTE: recipe libmpc-1.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe libmpc-1.3.1-r0: task do_package: Started
NOTE: recipe libmpc-1.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1618 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gcc-13.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libarchive-3.6.2-r0: task do_install: Succeeded
NOTE: Running task 1619 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_populate_sysroot)
NOTE: Running task 1620 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_package)
NOTE: recipe gcc-13.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1621 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_configure)
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot: Started
NOTE: recipe libarchive-3.6.2-r0: task do_package: Started
NOTE: recipe gcc-13.2.0-r0: task do_configure: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_install: Succeeded
NOTE: Running task 1622 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot)
NOTE: Running task 1623 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_package)
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_package: Started
NOTE: recipe libgpg-error-1.47-r0: task do_package: Succeeded
NOTE: Running task 1624 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata)
NOTE: recipe libunistring-1.1-r0: task do_configure: Succeeded
NOTE: Running task 1625 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_compile)
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata: Started
NOTE: recipe libunistring-1.1-r0: task do_compile: Started
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_package: Succeeded
NOTE: Running task 1626 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_package: Succeeded
NOTE: Running task 1627 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_compile: Succeeded
NOTE: Running task 1628 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_compile_ptest_base)
NOTE: recipe libxml2-2.11.5-r0: task do_compile_ptest_base: Started
NOTE: recipe libxml2-2.11.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1629 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_install)
NOTE: recipe libarchive-3.6.2-r0: task do_package: Succeeded
NOTE: Running task 1630 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_packagedata)
NOTE: recipe libxml2-2.11.5-r0: task do_install: Started
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata: Started
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata: Succeeded
NOTE: recipe gcc-13.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1631 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_compile)
NOTE: recipe gcc-13.2.0-r0: task do_compile: Started
NOTE: recipe libxml2-2.11.5-r0: task do_install: Succeeded
NOTE: Running task 1632 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_install_ptest_base)
NOTE: recipe libxml2-2.11.5-r0: task do_install_ptest_base: Started
NOTE: recipe libpam-1.5.3-r0: task do_compile: Succeeded
NOTE: Running task 1633 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_compile_ptest_base)
NOTE: recipe libpam-1.5.3-r0: task do_compile_ptest_base: Started
NOTE: recipe libpam-1.5.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1634 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_install)
NOTE: recipe libpam-1.5.3-r0: task do_install: Started
NOTE: recipe libxml2-2.11.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1635 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_package)
NOTE: Running task 1636 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_populate_sysroot)
NOTE: recipe libxml2-2.11.5-r0: task do_package: Started
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_install: Succeeded
NOTE: Running task 1637 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_install_ptest_base)
NOTE: recipe libpam-1.5.3-r0: task do_install_ptest_base: Started
NOTE: recipe libpam-1.5.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1638 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot)
NOTE: Running task 1639 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_package)
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot: Started
NOTE: recipe libpam-1.5.3-r0: task do_package: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot unihash changed to 998ddecaa0d4055481c0b898347b57a495bad178ab7b2d18bc5edad681566e4f
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_populate_sysroot became valid
NOTE: Running setscene task 620 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 629 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1661 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.10.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1669 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_configure)
NOTE: recipe libgcrypt-1.10.2-r0: task do_configure: Started
NOTE: recipe libpam-1.5.3-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_package unihash changed to cbffbab925594b2a81319c42978d7fcd38040b857304902ccfdfaac20b5977bd
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_packagedata became valid
NOTE: Running setscene task 618 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 621 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 622 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 627 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_package_setscene)
NOTE: recipe shadow-4.13-r0: task do_package_setscene: Started
NOTE: recipe util-linux-2.39.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 629 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1673 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package)
NOTE: Running task 1676 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_package)
NOTE: Running task 1677 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_create_spdx)
NOTE: recipe libpam-1.5.3-r0: task do_create_spdx: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_package: Started
NOTE: recipe coreutils-9.3-r0: task do_package: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_configure: Succeeded
NOTE: Running task 1680 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_configure_ptest_base)
NOTE: recipe libgcrypt-1.10.2-r0: task do_configure_ptest_base: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1681 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_compile)
NOTE: recipe libgcrypt-1.10.2-r0: task do_compile: Started
NOTE: recipe perl-5.36.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_package unihash changed to f0f97b4d9c7fc7890a3c2d25271091e7da2b80b75183bb3864321501f6071bc7
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_packagedata became valid
NOTE: Running setscene task 629 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_packagedata_setscene)
NOTE: recipe perl-5.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package unihash changed to f61666bc2ec515f9029e1c48e21edcba3a369547877459cf155ce51f8c03c1a0
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata became valid
NOTE: Running setscene task 627 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_package: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 629 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running task 1682 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_packagedata)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1684 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_package_write_rpm: Started
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1685 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_create_spdx)
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm unihash changed to 4678c2a5f3d5df1e137134459defa1d3d09e7bfe25c4e10b03712155068f31c7
NOTE: recipe libpam-1.5.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 1686 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_collect_spdx_deps)
NOTE: recipe shadow-4.13-r0: task do_collect_spdx_deps: Started
NOTE: recipe shadow-4.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1687 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_create_spdx)
NOTE: recipe shadow-4.13-r0: task do_create_spdx: Started
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx: Succeeded
NOTE: recipe perl-5.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe shadow-4.13-r0: task do_create_spdx: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_compile: Succeeded
NOTE: Running task 1691 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_install)
NOTE: recipe libunistring-1.1-r0: task do_install: Started
NOTE: recipe libunistring-1.1-r0: task do_install: Succeeded
NOTE: Running task 1692 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot)
NOTE: Running task 1693 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_package)
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot: Started
NOTE: recipe libunistring-1.1-r0: task do_package: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_compile: Succeeded
NOTE: Running task 1694 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_compile_ptest_base)
NOTE: recipe libgcrypt-1.10.2-r0: task do_compile_ptest_base: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1695 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_install)
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1696 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.10.2-r0: task do_install: Started
NOTE: recipe libidn2-2.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1697 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_configure)
NOTE: recipe libidn2-2.3.4-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_install: Succeeded
NOTE: Running task 1698 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_install_ptest_base)
NOTE: recipe libgcrypt-1.10.2-r0: task do_install_ptest_base: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1699 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_populate_sysroot)
NOTE: Running task 1700 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_package)
NOTE: recipe libgcrypt-1.10.2-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_package: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_package: Succeeded
NOTE: Running task 1701 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata)
NOTE: recipe libunistring-1.1-r0: task do_packagedata: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_package: Succeeded
NOTE: Running task 1702 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_packagedata)
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata: Succeeded
NOTE: recipe coreutils-9.3-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_package unihash changed to 3c3b945ae5cbf5bb71903f1495980a3380dfd07f364cf843b51b2cfb54de25e3
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_packagedata became valid
NOTE: Running setscene task 629 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.3-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libidn2-2.3.4-r0: task do_configure: Succeeded
NOTE: Running task 1704 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_compile)
NOTE: recipe libidn2-2.3.4-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.4-r0: task do_compile: Succeeded
NOTE: Running task 1705 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_install)
NOTE: recipe libidn2-2.3.4-r0: task do_install: Started
NOTE: recipe libidn2-2.3.4-r0: task do_install: Succeeded
NOTE: Running task 1706 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot)
NOTE: Running task 1707 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_package)
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe libidn2-2.3.4-r0: task do_package: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1708 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1709 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-8.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-8.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1710 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_configure)
NOTE: recipe curl-8.2.1-r0: task do_configure: Started
NOTE: recipe gnutls-3.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1711 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_configure)
NOTE: recipe gnutls-3.8.0-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.4-r0: task do_package: Succeeded
NOTE: Running task 1712 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1713 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_configure_ptest_base)
NOTE: recipe curl-8.2.1-r0: task do_configure_ptest_base: Started
NOTE: recipe curl-8.2.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1714 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_compile)
NOTE: recipe curl-8.2.1-r0: task do_compile: Started
NOTE: recipe curl-8.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1715 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_compile_ptest_base)
NOTE: recipe curl-8.2.1-r0: task do_compile_ptest_base: Started
NOTE: recipe curl-8.2.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1716 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_install)
NOTE: recipe curl-8.2.1-r0: task do_install: Started
NOTE: recipe glibc-locale-2.37-r1: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_package unihash changed to 6e646fe0aa1c7b6fdee19ed2f7aea5ee023b6f0ff78d978959f028f751890d0e
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_packagedata became valid
NOTE: Running setscene task 629 of 629 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_packagedata_setscene)
NOTE: recipe glibc-locale-2.37-r1: task do_packagedata_setscene: Started
NOTE: recipe curl-8.2.1-r0: task do_install: Succeeded
NOTE: Running task 1717 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_install_ptest_base)
NOTE: recipe curl-8.2.1-r0: task do_install_ptest_base: Started
NOTE: recipe curl-8.2.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1718 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_populate_sysroot)
NOTE: Running task 1719 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_package)
NOTE: recipe curl-8.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe curl-8.2.1-r0: task do_package: Started
NOTE: recipe curl-8.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_package: Succeeded
NOTE: Running task 1720 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_packagedata)
NOTE: recipe curl-8.2.1-r0: task do_packagedata: Started
NOTE: recipe curl-8.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe glibc-locale-2.37-r1: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1722 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_create_spdx)
NOTE: Running task 1723 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package_write_rpm)
NOTE: Running task 1724 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_package_write_rpm)
NOTE: Running task 1725 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_package_write_rpm)
NOTE: Running task 1726 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_package_qa)
NOTE: recipe glibc-locale-2.37-r1: task do_create_spdx: Started
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm: Started
NOTE: recipe glibc-locale-2.37-r1: task do_package_write_rpm: Started
NOTE: recipe libxml2-2.11.5-r0: task do_package_write_rpm: Started
NOTE: recipe libxml2-2.11.5-r0: task do_package_qa: Started
NOTE: recipe gnutls-3.8.0-r0: task do_configure: Succeeded
NOTE: Running task 1727 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_configure_ptest_base)
NOTE: recipe gnutls-3.8.0-r0: task do_configure_ptest_base: Started
NOTE: recipe gnutls-3.8.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1728 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_compile)
NOTE: recipe gnutls-3.8.0-r0: task do_compile: Started
NOTE: recipe libxml2-2.11.5-r0: task do_package_qa: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package_write_rpm unihash changed to 42663043abcd1f199afedff6d58dfdda66cee1620888d6fbdd432723250efc6a
NOTE: recipe libxml2-2.11.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_compile: Succeeded
NOTE: Running task 1729 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_compile_ptest_base)
NOTE: recipe gnutls-3.8.0-r0: task do_compile_ptest_base: Started
NOTE: recipe gnutls-3.8.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1730 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_install)
NOTE: recipe gnutls-3.8.0-r0: task do_install: Started
NOTE: recipe glibc-locale-2.37-r1: task do_create_spdx: Succeeded
NOTE: Running task 1731 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_create_runtime_spdx)
NOTE: recipe libxml2-2.11.5-r0: task do_create_runtime_spdx: Started
NOTE: recipe gnutls-3.8.0-r0: task do_install: Succeeded
NOTE: Running task 1732 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_install_ptest_base)
NOTE: recipe gnutls-3.8.0-r0: task do_install_ptest_base: Started
NOTE: recipe libxml2-2.11.5-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1733 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_populate_sysroot)
NOTE: Running task 1734 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_package)
NOTE: recipe gnutls-3.8.0-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.8.0-r0: task do_package: Started
NOTE: recipe gnutls-3.8.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1735 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1736 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_configure)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_configure: Started
NOTE: recipe gnutls-3.8.0-r0: task do_package: Succeeded
NOTE: Running task 1737 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_packagedata)
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata: Succeeded
NOTE: recipe gcc-13.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1738 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_install)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_configure: Succeeded
NOTE: Running task 1739 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_compile)
NOTE: recipe gcc-13.2.0-r0: task do_install: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_compile: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_compile: Succeeded
NOTE: Running task 1740 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_install)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_install: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_install: Succeeded
NOTE: Running task 1741 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_populate_sysroot)
NOTE: Running task 1742 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_package)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_populate_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_package: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1743 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.189-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.189-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1744 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_configure)
NOTE: recipe elfutils-0.189-r0: task do_configure: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_package: Succeeded
NOTE: Running task 1745 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_packagedata)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata: Succeeded
NOTE: recipe gcc-13.2.0-r0: task do_install: Succeeded
NOTE: Running task 1746 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_package)
NOTE: recipe gcc-13.2.0-r0: task do_package: Started
NOTE: recipe elfutils-0.189-r0: task do_configure: Succeeded
NOTE: Running task 1747 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_configure_ptest_base)
NOTE: recipe elfutils-0.189-r0: task do_configure_ptest_base: Started
NOTE: recipe elfutils-0.189-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1748 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_compile)
NOTE: recipe elfutils-0.189-r0: task do_compile: Started
NOTE: recipe gcc-13.2.0-r0: task do_package: Succeeded
NOTE: Running task 1749 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_packagedata)
NOTE: recipe gcc-13.2.0-r0: task do_packagedata: Started
NOTE: recipe gcc-13.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_compile: Succeeded
NOTE: Running task 1750 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_compile_ptest_base)
NOTE: recipe elfutils-0.189-r0: task do_compile_ptest_base: Started
NOTE: recipe elfutils-0.189-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1751 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_install)
NOTE: recipe elfutils-0.189-r0: task do_install: Started
NOTE: recipe elfutils-0.189-r0: task do_install: Succeeded
NOTE: Running task 1752 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_install_ptest_base)
NOTE: recipe elfutils-0.189-r0: task do_install_ptest_base: Started
NOTE: recipe elfutils-0.189-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1753 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_populate_sysroot)
NOTE: Running task 1754 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_package)
NOTE: recipe elfutils-0.189-r0: task do_populate_sysroot: Started
NOTE: recipe elfutils-0.189-r0: task do_package: Started
NOTE: recipe elfutils-0.189-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1755 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-2.41-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.41-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1756 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_configure)
NOTE: recipe binutils-2.41-r0: task do_configure: Started
NOTE: recipe binutils-2.41-r0: task do_configure: Succeeded
NOTE: Running task 1757 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_compile)
NOTE: recipe binutils-2.41-r0: task do_compile: Started
NOTE: recipe elfutils-0.189-r0: task do_package: Succeeded
NOTE: Running task 1758 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_packagedata)
NOTE: recipe elfutils-0.189-r0: task do_packagedata: Started
NOTE: recipe elfutils-0.189-r0: task do_packagedata: Succeeded
NOTE: recipe binutils-2.41-r0: task do_compile: Succeeded
NOTE: Running task 1759 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_install)
NOTE: recipe binutils-2.41-r0: task do_install: Started
NOTE: recipe glibc-locale-2.37-r1: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.41-r0: task do_install: Succeeded
NOTE: Running task 1760 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_package)
NOTE: recipe binutils-2.41-r0: task do_package: Started
NOTE: recipe binutils-2.41-r0: task do_package: Succeeded
NOTE: Running task 1761 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_packagedata)
NOTE: recipe binutils-2.41-r0: task do_packagedata: Started
NOTE: recipe binutils-2.41-r0: task do_packagedata: Succeeded
NOTE: Running task 1762 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_package_write_rpm)
NOTE: recipe python3-3.11.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-3.11.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1763 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_build)
NOTE: Tasks Summary: Attempted 1763 tasks of which 1490 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 14 seconds

Summary: There were 16 ERROR messages, returning a non-zero exit code.
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-src went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-dbg went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcrypto went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libssl went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-conf went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-engines went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-misc went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-ossl-module-legacy went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-ptest went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-staticdev went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-dev went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-doc went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-locale went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-bin went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package openssl went backwards which would break package feeds (from 0:3.1.2-r0 to 0:3.1.1-r0) [version-going-backwards]
ERROR: openssl-3.1.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2765862905246186234==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libxml2/libxml2: FILELIST: removed "/usr/lib/libxml2.so.2.11.4", added "/usr/lib/libxml2.so.2.11.5"
Changes to packages/core2-32-poky-linux/libxml2 (sysroot):
  /usr/lib/libxml2.so.2 changed symlink target from libxml2.so.2.11.4 to libxml2.so.2.11.5
  /usr/lib/libxml2.so changed symlink target from libxml2.so.2.11.4 to libxml2.so.2.11.5
  /usr/lib/libxml2.so.2.11.4 moved to /usr/lib/libxml2.so.2.11.5
Changes to packages/x86_64-linux/libxml2-native (sysroot):
  /usr/lib/libxml2.so.2 changed symlink target from libxml2.so.2.11.4 to libxml2.so.2.11.5
  /usr/lib/libxml2.so changed symlink target from libxml2.so.2.11.4 to libxml2.so.2.11.5
  /usr/lib/libxml2.so.2.11.4 moved to /usr/lib/libxml2.so.2.11.5

--===============2765862905246186234==--

