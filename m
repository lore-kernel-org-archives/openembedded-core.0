Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CE96C35280
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:53 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web08.11723.1650052686960367887
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 12:58:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=3PZWzULB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 010101802ecde0e1-6c8cc319-9c82-490f-8530-9d2fd3c27b3e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1650052686;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2A3bW9Fe0jPoZW6hU2XMfg4xN1yXMyyhnzvq6yc8j1I=;
	b=3PZWzULBz3ubrCKggXSaFTU75nw1LwehJszgcISfhImtogqdhhl0K2stHzligXcB
	eIy+P0AJ3Q1gIiVXPC/MRhO/FCNeRrGwDEFvK52jQZoSvDjasBjYJiu+jPN+eGTuhM4
	tIcCLH1379aoBN30iXPpFjr4YEsHUGaDUiKlpEtI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1650052686;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2A3bW9Fe0jPoZW6hU2XMfg4xN1yXMyyhnzvq6yc8j1I=;
	b=djfWs7HmXNYwX+jmqJDZqnE2z/WlTFxg4Lt1W/PwYMkMFbcpcVA0pMXiqfjnTZVY
	On98QYtnuMUMsE2i7qc16ONrFc88ZqSFFKgTjxYecNSqM8JVyo1x1/dU6hsBzoGRXNF
	gVAq1FycSjdNP2rXGsQAXrDnIJjpcbH/Yt2E2YO8=
Content-Type: multipart/mixed; boundary="===============8730193171207790668=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] util-linux: upgrading to 2.38 FAILED
Message-ID: 
 <010101802ecde0e1-6c8cc319-9c82-490f-8530-9d2fd3c27b3e-000000@us-west-2.amazonses.com>
Date: Fri, 15 Apr 2022 19:58:06 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164441

--===============8730193171207790668==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *util-linux* to *2.38* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-util-linux-upgrade-2.37.4-2.38.patch
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
--===============8730193171207790668==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1640 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (880 cached, 2 parsed). 1640 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a6fcefce7b0eb86bf30d3000337681ebe2f133de"
workspace            = "master:81b4d8bc6bdc47a731a1f7ed741d7336559a1348"

Initialising tasks...done.
Sstate summary: Wanted 321 Local 61 Mirrors 0 Missed 260 Current 244 (19% match, 53% complete)
Removing 23 stale sstate objects for arch x86_64...done.
Removing 4 stale sstate objects for arch allarch...done.
Removing 69 stale sstate objects for arch core2-32...done.
Removing 94 stale sstate objects for arch qemux86...done.
NOTE: Executing Tasks
NOTE: Running setscene task 269 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 270 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 277 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 294 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 308 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 311 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 314 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 316 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 326 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.35.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 329 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 334 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 337 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 342 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 351 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 360 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 367 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 372 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 375 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 380 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 389 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 393 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 394 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 397 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 398 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 400 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 401 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 405 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 409 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 414 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 417 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 431 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 434 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 438 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 441 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 444 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 447 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 450 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 461 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 474 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.28.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 477 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 480 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 490 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 491 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 496 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 499 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 500 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 503 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 512 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 518 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 521 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 522 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 525 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 534 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.2.bb:do_gcc_stash_builddir_setscene)
NOTE: Running setscene task 537 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 539 of 565 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gawk-5.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.11.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.20.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.34.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe diffutils-3.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-9.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-locale-2.35-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.4.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.9.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 193 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_patch)
NOTE: recipe systemd-1_250.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2021.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcrypt-4.4.28-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.10.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.63-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cracklib-2.9.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.1.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.0.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe diffutils-3.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe coreutils-9.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.38.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libseccomp-2.5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gawk-5.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glibc-locale-2.35-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.11.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe psmisc-23.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-11.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe expat-2.4.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 252 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.35.bb:do_patch)
NOTE: recipe libxml2-2.9.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-1_250.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.16-r0: task do_patch: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.63-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.28-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.10.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-native-1_2.72.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cracklib-2.9.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.38.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libseccomp-2.5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 287 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_fetch)
NOTE: Running task 309 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_fetch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe psmisc-23.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 319 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 320 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_fetch)
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 321 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_fetch)
NOTE: Running task 322 of 1995 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.4.bb:do_fetch)
NOTE: Running task 363 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_fetch)
NOTE: recipe glib-2.0-native-1_2.72.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 392 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_fetch)
NOTE: Running task 393 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_fetch)
NOTE: Running task 404 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.28.bb:do_fetch)
NOTE: Running task 410 of 1995 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_fetch)
NOTE: recipe glibc-2.35-r0: task do_patch: Started
NOTE: Running task 425 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.4.bb:do_fetch)
NOTE: Running task 426 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_fetch)
NOTE: Running task 427 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_fetch)
NOTE: Running task 428 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_fetch)
NOTE: Running task 429 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_fetch)
NOTE: Running task 430 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_fetch)
NOTE: Running task 431 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_fetch)
NOTE: recipe opkg-utils-0.5.0-r0: task do_fetch: Started
NOTE: recipe zlib-1.2.11-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 511 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_fetch)
NOTE: Running task 513 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_fetch)
NOTE: Running task 514 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: Running noexec task 535 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_configure)
NOTE: recipe openssl-3.0.2-r0: task do_fetch: Started
NOTE: Running noexec task 536 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_compile)
NOTE: Running task 537 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_install)
NOTE: recipe zlib-1.2.11-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_fetch: Started
NOTE: Running task 538 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_unpack)
NOTE: recipe openssl-3.0.2-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_fetch: Succeeded
NOTE: Running task 539 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_unpack)
NOTE: recipe flex-2.6.4-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-native-2.37.4-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_fetch: Started
NOTE: recipe libxcrypt-4.4.28-r0: task do_fetch: Started
NOTE: Running task 557 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_unpack)
WARNING: util-linux-libuuid-native-2.37.4-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.37.4.tar.xz
Cleaning and trying again.
WARNING: util-linux-libuuid-native-2.37.4-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.37.4.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.37.4.tar.xz_bad-checksum_634e6916ad913366c3536b6468e7844769549b99a7b2bf80314de78ab5655b83
NOTE: recipe libtirpc-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-3_3.38.2-r0: task do_fetch: Started
NOTE: recipe flex-2.6.4-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_fetch: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_fetch: Started
NOTE: recipe readline-8.1.2-r0: task do_fetch: Started
NOTE: recipe xz-5.2.5-r0: task do_fetch: Started
NOTE: Running task 558 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe perl-5.34.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 559 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_unpack)
NOTE: Running task 560 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_unpack)
NOTE: Running task 561 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_unpack)
NOTE: recipe libxcrypt-4.4.28-r0: task do_fetch: Succeeded
NOTE: Running setscene task 564 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.1.2-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-3_3.38.2-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_fetch: Started
NOTE: recipe cracklib-2.9.7-r0: task do_fetch: Started
NOTE: Running task 570 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.28.bb:do_unpack)
NOTE: Running task 571 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_unpack)
NOTE: Running task 572 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_unpack)
NOTE: Running task 573 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_unpack)
NOTE: recipe attr-2.5.1-r0: task do_fetch: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-native-2.38-r0: task do_fetch: Started
NOTE: recipe libpam-1.5.2-r0: task do_fetch: Started
NOTE: recipe ncurses-6.3-r0: task do_fetch: Succeeded
NOTE: Running task 600 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_fetch)
NOTE: Running task 602 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_unpack)
NOTE: Running task 612 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_fetch)
NOTE: Running task 624 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_unpack)
NOTE: recipe attr-2.5.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.10.4-r0: task do_fetch: Started
NOTE: Running task 635 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_unpack)
NOTE: recipe util-linux-native-2.38-r0: task do_fetch: Succeeded
NOTE: Running task 640 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_fetch)
NOTE: Running task 641 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_fetch)
NOTE: Running task 642 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_fetch)
NOTE: Running task 643 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_fetch)
NOTE: Running task 645 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_fetch)
NOTE: Running task 647 of 1995 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_fetch)
NOTE: Running task 650 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_fetch)
NOTE: Running task 665 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_fetch)
NOTE: Running task 680 of 1995 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_write_config)
NOTE: Running task 689 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_fetch)
NOTE: Running task 690 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_fetch)
NOTE: Running task 703 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_fetch)
NOTE: recipe linux-libc-headers-5.16-r0: task do_install: Started
NOTE: recipe cracklib-2.9.7-r0: task do_fetch: Succeeded
NOTE: Running task 706 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_write_config)
NOTE: Running task 712 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_fetch)
NOTE: Running task 715 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_fetch)
NOTE: Running task 724 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_write_config)
NOTE: Running task 725 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_fetch)
NOTE: Running task 731 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_fetch)
NOTE: Running task 732 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_fetch)
NOTE: Running task 733 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_fetch)
NOTE: recipe libpam-1.5.2-r0: task do_fetch: Succeeded
NOTE: Running task 734 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_fetch)
NOTE: Running task 739 of 1995 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_unpack)
NOTE: Running task 745 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_fetch)
NOTE: Running task 746 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_fetch)
NOTE: Running task 748 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_fetch)
NOTE: Running task 751 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_fetch)
NOTE: Running task 752 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_fetch)
NOTE: Running task 755 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_fetch)
NOTE: Running task 756 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 758 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_fetch)
NOTE: Running task 759 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_unpack)
NOTE: Running task 760 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_unpack)
NOTE: recipe python3-3.10.4-r0: task do_fetch: Succeeded
NOTE: Running task 761 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_unpack)
NOTE: recipe xz-5.2.5-r0: task do_fetch: Succeeded
NOTE: Running task 762 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_unpack)
WARNING: util-linux-libuuid-native-2.37.4-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.37.4.tar.xz
Cleaning and trying again.
WARNING: util-linux-libuuid-native-2.37.4-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.37.4.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.37.4.tar.xz_bad-checksum_634e6916ad913366c3536b6468e7844769549b99a7b2bf80314de78ab5655b83
WARNING: util-linux-libuuid-native-2.37.4-r0 do_fetch: Checksum failure encountered with download of https://cdn.kernel.org/pub/linux/utils/util-linux/v2.37/util-linux-2.37.4.tar.xz - will attempt other sources if available
NOTE: recipe glibc-2.35-r0: task do_patch: Succeeded
NOTE: Running task 764 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_fetch)
NOTE: recipe opkg-utils-0.5.0-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe flex-2.6.4-r0: task do_unpack: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_unpack: Started
NOTE: recipe perl-5.34.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.38.2-r0: task do_unpack: Started
NOTE: recipe expat-2.4.7-r0: task do_fetch: Started
NOTE: recipe zlib-1.2.11-r0: task do_unpack: Started
NOTE: recipe openssl-3.0.2-r0: task do_unpack: Started
NOTE: recipe gdbm-1.23-r0: task do_unpack: Started
NOTE: recipe libxcrypt-4.4.28-r0: task do_unpack: Started
NOTE: recipe libffi-3.4.2-r0: task do_unpack: Started
NOTE: recipe readline-8.1.2-r0: task do_unpack: Started
NOTE: recipe libxml2-2.9.13-r0: task do_fetch: Started
NOTE: recipe ncurses-6.3-r0: task do_unpack: Started
NOTE: recipe acl-2.3.1-r0: task do_fetch: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_fetch: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_unpack: Started
NOTE: recipe attr-2.5.1-r0: task do_unpack: Started
NOTE: Running task 765 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_unpack)
NOTE: recipe libxml2-2.9.13-r0: task do_fetch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Started
NOTE: recipe acl-2.3.1-r0: task do_fetch: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_fetch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_fetch: Started
NOTE: Running task 766 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_patch)
NOTE: recipe xorgproto-2021.5-r0: task do_fetch: Started
NOTE: recipe util-linux-2.38-r0: task do_fetch: Started
NOTE: Running task 767 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_unpack)
NOTE: Running task 768 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_unpack)
NOTE: recipe util-macros-1_1.19.3-r0: task do_fetch: Started
NOTE: recipe libcap-2.63-r0: task do_fetch: Started
NOTE: recipe wayland-1.20.0-r0: task do_write_config: Started
NOTE: recipe zstd-1.5.2-r0: task do_fetch: Started
NOTE: Running task 769 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_unpack)
NOTE: recipe libseccomp-2.5.3-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_fetch: Succeeded
NOTE: recipe perl-5.34.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_fetch: Started
NOTE: recipe libffi-3.4.2-r0: task do_unpack: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_fetch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_fetch: Succeeded
NOTE: Running task 770 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_patch)
NOTE: recipe libcap-2.63-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_unpack: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_fetch: Started
NOTE: recipe util-linux-2.38-r0: task do_fetch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Started
NOTE: recipe xorgproto-2021.5-r0: task do_write_config: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.38.2-r0: task do_unpack: Succeeded
NOTE: Running task 771 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_patch)
NOTE: recipe wayland-1.20.0-r0: task do_fetch: Succeeded
NOTE: recipe libseccomp-2.5.3-r0: task do_fetch: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_fetch: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_fetch: Started
NOTE: Running task 772 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_patch)
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_fetch: Succeeded
NOTE: Running task 773 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_patch)
NOTE: recipe flex-2.6.4-r0: task do_unpack: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-native-1_2.72.0-r0: task do_fetch: Started
NOTE: Running task 774 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_unpack)
NOTE: recipe initscripts-1.0-r155: task do_fetch: Started
NOTE: Running task 775 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_unpack)
NOTE: Running task 776 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_unpack)
NOTE: Running task 777 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_unpack)
NOTE: recipe xcb-proto-1.14.1-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_fetch: Started
NOTE: Running task 778 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_unpack)
NOTE: recipe wayland-1.20.0-r0: task do_write_config: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_fetch: Succeeded
NOTE: Running task 779 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_unpack)
NOTE: Running task 780 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_unpack)
NOTE: Running task 781 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.1.bb:do_fetch)
NOTE: Running task 782 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_unpack)
NOTE: recipe zstd-1.5.2-r0: task do_fetch: Succeeded
NOTE: Running task 783 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_patch)
NOTE: Running task 784 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_patch)
NOTE: recipe base-passwd-3.5.29-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 785 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_unpack)
NOTE: recipe libtirpc-1.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 793 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_unpack)
NOTE: recipe libnsl2-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-native-1_2.72.0-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.11.1-r0: task do_fetch: Started
NOTE: Running task 796 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_unpack)
NOTE: Running task 798 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_fetch: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_fetch: Started
NOTE: Running task 799 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_unpack)
NOTE: Running task 800 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.0.bb:do_fetch)
NOTE: recipe kmod-29-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
WARNING: util-linux-libuuid-native-2.37.4-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.37.4.tar.xz
Cleaning and trying again.
WARNING: util-linux-libuuid-native-2.37.4-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.37.4.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.37.4.tar.xz_bad-checksum_634e6916ad913366c3536b6468e7844769549b99a7b2bf80314de78ab5655b83
NOTE: recipe sed-4.8-r0: task do_fetch: Started
NOTE: Running task 804 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_patch)
NOTE: recipe cracklib-2.9.7-r0: task do_unpack: Started
NOTE: recipe glib-2.0-native-1_2.72.0-r0: task do_write_config: Started
NOTE: Running task 805 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_patch)
NOTE: recipe libpam-1.5.2-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r155: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-native-2.37.4-r0: task do_fetch: Failed
NOTE: recipe zlib-1.2.11-r0: task do_unpack: Succeeded
NOTE: recipe libxcrypt-4.4.28-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_write_config: Succeeded
NOTE: Running task 806 of 1995 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_unpack)
NOTE: recipe bash-5.1.16-r0: task do_fetch: Succeeded
NOTE: recipe sed-4.8-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.11.1-r0: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-native-2.38-r0: task do_unpack: Started
NOTE: recipe xz-5.2.5-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_unpack: Started
NOTE: recipe acl-2.3.1-r0: task do_unpack: Started
NOTE: recipe gdbm-1.23-r0: task do_patch: Started
NOTE: recipe glib-2.0-native-1_2.72.0-r0: task do_write_config: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_unpack: Started
NOTE: recipe python3-3.10.4-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.38.2-r0: task do_patch: Started
NOTE: recipe gmp-6.2.1-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_unpack: Started
NOTE: recipe libffi-3.4.2-r0: task do_patch: Started
NOTE: recipe xorgproto-2021.5-r0: task do_unpack: Started
NOTE: recipe libcap-2.63-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Started
NOTE: recipe xz-5.2.5-r0: task do_unpack: Succeeded
NOTE: recipe libseccomp-2.5.3-r0: task do_unpack: Started
NOTE: recipe acl-2.3.1-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-2.38-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_unpack: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_patch: Started
NOTE: recipe flex-2.6.4-r0: task do_patch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_unpack: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_patch: Started
NOTE: recipe libpcre-8.45-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.2-r0: task do_unpack: Started
NOTE: recipe wayland-1.20.0-r0: task do_unpack: Started
NOTE: recipe perl-5.34.1-r0: task do_fetch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_unpack: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_patch: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_unpack: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_patch: Started
NOTE: recipe cracklib-2.9.7-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.38.2-r0: task do_patch: Succeeded
NOTE: recipe perl-5.34.1-r0: task do_fetch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_patch: Succeeded
WARNING: util-linux-libuuid-2.37.4-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.37.4.tar.xz
Cleaning and trying again.
WARNING: util-linux-libuuid-2.37.4-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.37.4.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.37.4.tar.xz_bad-checksum_634e6916ad913366c3536b6468e7844769549b99a7b2bf80314de78ab5655b83
NOTE: recipe coreutils-9.0-r0: task do_fetch: Started
NOTE: recipe kmod-29-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_unpack: Succeeded
WARNING: util-linux-libuuid-2.37.4-r0 do_fetch: Checksum failure encountered with download of https://cdn.kernel.org/pub/linux/utils/util-linux/v2.37/util-linux-2.37.4.tar.xz - will attempt other sources if available
NOTE: recipe base-passwd-3.5.29-r0: task do_unpack: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_unpack: Succeeded
NOTE: recipe coreutils-9.0-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_patch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_patch: Succeeded
NOTE: recipe libseccomp-2.5.3-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-native-1_2.72.0-r0: task do_unpack: Started
NOTE: recipe libpam-1.5.2-r0: task do_unpack: Succeeded
NOTE: recipe libcap-2.63-r0: task do_unpack: Succeeded
NOTE: recipe gcc-cross-i686-11.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_patch: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_unpack: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_unpack: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_unpack: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_unpack: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_patch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_unpack: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_patch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_unpack: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_unpack: Succeeded
WARNING: util-linux-libuuid-2.37.4-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.37.4.tar.xz
Cleaning and trying again.
WARNING: util-linux-libuuid-2.37.4-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.37.4.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.37.4.tar.xz_bad-checksum_634e6916ad913366c3536b6468e7844769549b99a7b2bf80314de78ab5655b83
NOTE: recipe util-linux-native-2.38-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_fetch: Failed
NOTE: recipe glib-2.0-native-1_2.72.0-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-2.38-r0: task do_unpack: Succeeded
NOTE: recipe linux-libc-headers-5.16-r0: task do_install: Succeeded
NOTE: recipe python3-3.10.4-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 806 tasks of which 700 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 2 tasks failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.4.bb:do_fetch
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.4.bb:do_fetch
Summary: There were 12 WARNING messages.
Summary: There were 4 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: util-linux-libuuid-native-2.37.4-r0 do_fetch: Checksum failure fetching https://cdn.kernel.org/pub/linux/utils/util-linux/v2.37/util-linux-2.37.4.tar.xz
ERROR: util-linux-libuuid-native-2.37.4-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.37.4.tar.xz\' has sha256 checksum \'634e6916ad913366c3536b6468e7844769549b99a7b2bf80314de78ab5655b83\' when \'6d111cbe4d55b336db2f1fbeffbc65b89908704c01136371d32aa9bec373eb64\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "634e6916ad913366c3536b6468e7844769549b99a7b2bf80314de78ab5655b83"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://cdn.kernel.org/pub/linux/utils/util-linux/v2.37/util-linux-2.37.4.tar.xz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/util-linux-libuuid-native/2.37.4-r0/temp/log.do_fetch.1835408
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.4.bb:do_fetch) failed with exit code '1'
ERROR: util-linux-libuuid-2.37.4-r0 do_fetch: Checksum failure fetching https://cdn.kernel.org/pub/linux/utils/util-linux/v2.37/util-linux-2.37.4.tar.xz
ERROR: util-linux-libuuid-2.37.4-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.37.4.tar.xz\' has sha256 checksum \'634e6916ad913366c3536b6468e7844769549b99a7b2bf80314de78ab5655b83\' when \'6d111cbe4d55b336db2f1fbeffbc65b89908704c01136371d32aa9bec373eb64\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "634e6916ad913366c3536b6468e7844769549b99a7b2bf80314de78ab5655b83"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://cdn.kernel.org/pub/linux/utils/util-linux/v2.37/util-linux-2.37.4.tar.xz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/util-linux-libuuid/2.37.4-r0/temp/log.do_fetch.1835535
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.4.bb:do_fetch) failed with exit code '1'

--===============8730193171207790668==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-util-linux-upgrade-2.37.4-2.38.patch"

From 97fa41e96a4590cecc5a1bed7e230fc18626f5fe Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Apr 2022 06:50:09 +0000
Subject: [PATCH] util-linux: upgrade 2.37.4 -> 2.38

---
 meta/recipes-core/util-linux/util-linux.inc                     | 2 +-
 .../util-linux/{util-linux_2.37.4.bb => util-linux_2.38.bb}     | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/util-linux/{util-linux_2.37.4.bb => util-linux_2.38.bb} (100%)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 982ec669a2..c9bddfb7a6 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -37,4 +37,4 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "634e6916ad913366c3536b6468e7844769549b99a7b2bf80314de78ab5655b83"
+SRC_URI[sha256sum] = "6d111cbe4d55b336db2f1fbeffbc65b89908704c01136371d32aa9bec373eb64"
diff --git a/meta/recipes-core/util-linux/util-linux_2.37.4.bb b/meta/recipes-core/util-linux/util-linux_2.38.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux_2.37.4.bb
rename to meta/recipes-core/util-linux/util-linux_2.38.bb
-- 
2.27.0


--===============8730193171207790668==--

