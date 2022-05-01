Return-Path: <auh@yoctoproject.org>
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37081C38A06
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 19:49:12 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.2279.1651434542222957443
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 May 2022 12:49:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ntVXdwLa;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 01010180812b5868-e7178034-fc42-4a70-b6e9-e8d0b616730e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1651434543;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=eLnQh2VV5B59LDD63nda48jNDyYstIgNC/q2LbsPDU0=;
	b=ntVXdwLa4/s7mH0LP4X7tGVWpsqtczmtF9RdZcU7AV0IgVhkT3z/FXflliDECYNk
	CfLZ9itSFD1naDjt9P7jwkxxQ4EtcGUmANflz5nFzW5RaFPqQchvpgKnxHQFEWPDeyT
	mNLYmjFquNJztS0J+I5o69nAi/TL4QQlnQPOoxMQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1651434543;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=eLnQh2VV5B59LDD63nda48jNDyYstIgNC/q2LbsPDU0=;
	b=gMglqVWWxeJquu/WSuTqEddgRUb4uxCNydUu9hXtU2ChuSD9KTpUvRcK8/qNB6hW
	SDqPOLpm8jboR7RmWylEFh5MZGK8lbZx2EibGr8OOiPRQdBCruejerjWz2P/jAEg0vK
	rpUAjEe3QZXC5BKnO8en9EldW14/DuEO2ahSaLZY=
Content-Type: multipart/mixed; boundary="===============3111540461775897567=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] epiphany: upgrading to 42.2 SUCCEEDED
Message-ID: 
 <01010180812b5868-e7178034-fc42-4a70-b6e9-e8d0b616730e-000000@us-west-2.amazonses.com>
Date: Sun, 1 May 2022 19:49:03 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 May 2022 19:49:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165125

--===============3111540461775897567==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *epiphany* to *42.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-epiphany-upgrade-42.0-42.2.patch
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
--===============3111540461775897567==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1643 targets, 50 skipped, 0 masked, 0 errors.
Removing 127 recipes from the core2-32 sysroot...done.
Removing 130 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-ed8181b2f5a2b54f8551c847a8333441988f2cd3"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ed8181b2f5a2b54f8551c847a8333441988f2cd3"
workspace            = "master:9e556960421c8bbe8851d9810352a5b4bd3b50df"

Initialising tasks...done.
Sstate summary: Wanted 530 Local 334 Mirrors 0 Missed 196 Current 329 (63% match, 77% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 330 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 332 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 335 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 340 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 343 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 381 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 398 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 423 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 438 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 485 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 512 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 513 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 514 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 517 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 520 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_71.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 522 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 524 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_71.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 531 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 532 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 541 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-71.1-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-71.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.7.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/vala/0.56.0-r0/temp/log.do_packagedata_setscene.2810157
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata_setscene: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 553 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_package_setscene)
NOTE: recipe libarchive-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 554 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-71.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.56.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-71.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe coreutils-9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 560 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 561 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 564 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 565 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 566 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 571 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 572 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 573 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 574 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 575 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 576 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 577 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 578 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 579 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 585 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.64.bb:do_packagedata_setscene)
NOTE: Running setscene task 586 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.64.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 588 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 589 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 590 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 591 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 593 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 594 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 761 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_fetch)
NOTE: Running task 823 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: Running task 826 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_fetch)
NOTE: Running task 837 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_fetch)
NOTE: Running task 838 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_fetch)
NOTE: Running task 839 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_fetch)
NOTE: Running task 840 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_fetch)
NOTE: Running task 925 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_fetch)
NOTE: Running task 940 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: Running task 941 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_write_config)
NOTE: Running task 943 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_write_config)
NOTE: Running task 944 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_write_config)
NOTE: Running task 945 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_write_config)
NOTE: Running task 946 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_fetch)
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 983 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_fetch)
NOTE: Running task 991 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_fetch)
NOTE: Running task 993 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_fetch)
NOTE: Running task 994 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_fetch)
NOTE: Running task 1002 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_fetch)
NOTE: Running task 1003 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_fetch)
NOTE: Running task 1005 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_fetch)
NOTE: Running task 1006 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_write_config)
NOTE: Running task 1007 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_fetch)
NOTE: Running task 1008 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_fetch)
NOTE: Running task 1014 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_fetch)
NOTE: Running task 1019 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_write_config)
NOTE: Running task 1020 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 1027 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_fetch)
NOTE: Running task 1034 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_write_config)
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1045 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_write_config)
NOTE: Running task 1048 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_fetch)
NOTE: Running task 1077 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_write_config)
NOTE: recipe mesa-2_22.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.64-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_22.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.64-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.45-r0: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_fetch: Started
NOTE: recipe zstd-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-4.2.0-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-4.2.0-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.50.6-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.64-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_write_config: Started
NOTE: Running task 1082 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_unpack)
NOTE: recipe pango-1.50.6-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_write_config: Started
NOTE: Running task 1083 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_unpack)
NOTE: recipe zstd-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_write_config: Started
NOTE: Running task 1084 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: recipe fontconfig-2.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.50.6-r0: task do_write_config: Started
NOTE: Running task 1085 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_unpack)
NOTE: Running task 1086 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_unpack)
NOTE: Running setscene task 607 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 608 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1091 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_unpack)
NOTE: Running task 1092 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_unpack)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Started
NOTE: Running task 1093 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_write_config)
NOTE: Running task 1094 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_fetch)
NOTE: Running task 1102 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_fetch)
NOTE: Running task 1107 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_write_config)
NOTE: Running task 1110 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_write_config)
NOTE: Running task 1111 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 1112 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_unpack)
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_fetch: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_fetch: Started
NOTE: recipe atk-2.38.0-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.44.0-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_fetch: Started
NOTE: Running task 1118 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_fetch)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.64-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Succeeded
NOTE: recipe harfbuzz-4.2.0-r0: task do_write_config: Succeeded
NOTE: recipe pango-1.50.6-r0: task do_write_config: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_fetch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_fetch: Started
NOTE: recipe atk-2.38.0-r0: task do_write_config: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_write_config: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-core-2.44.0-r0: task do_fetch: Succeeded
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_write_config: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_fetch: Succeeded
NOTE: recipe gtk+3-3.24.33-r0: task do_fetch: Started
NOTE: recipe libwpe-1.12.0-r0: task do_fetch: Started
NOTE: Running setscene task 614 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: Running task 1125 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_unpack)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_write_config: Started
NOTE: recipe at-spi2-core-2.44.0-r0: task do_write_config: Started
NOTE: recipe libgpg-error-1.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_22.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_write_config: Succeeded
NOTE: Running task 1126 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_unpack)
NOTE: recipe libgpg-error-1.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk+3-3.24.33-r0: task do_fetch: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_write_config: Succeeded
NOTE: Running setscene task 620 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 622 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 623 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 624 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_unpack: Started
NOTE: Running task 1134 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_unpack: Started
NOTE: Running task 1137 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_unpack)
NOTE: Running task 1139 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_unpack)
NOTE: recipe mesa-2_22.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1142 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_unpack)
NOTE: Running setscene task 628 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.110.bb:do_packagedata_setscene)
NOTE: Running setscene task 629 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.110.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 631 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 632 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 633 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 634 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 635 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 636 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_unpack: Started
NOTE: Running setscene task 637 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 638 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 639 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 640 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running task 1157 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_unpack)
NOTE: Running task 1158 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_unpack)
NOTE: Running task 1162 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_write_config: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_write_config: Succeeded
NOTE: recipe freetype-2.12.0-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.12.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_write_config: Started
NOTE: Running task 1163 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_unpack)
NOTE: Running task 1165 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_unpack: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_unpack: Started
NOTE: recipe pango-1.50.6-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_fetch: Started
NOTE: Running task 1166 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: recipe libtasn1-4.18.0-r0: task do_fetch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Started
NOTE: Running task 1167 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_unpack)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_unpack: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_unpack: Started
NOTE: Running task 1171 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1203 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_patch)
NOTE: recipe libepoxy-1.5.9-r0: task do_write_config: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_write_config: Started
NOTE: recipe atk-2.38.0-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: Running task 1204 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_unpack)
NOTE: Running task 1206 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_fetch)
NOTE: Running task 1207 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_fetch)
NOTE: Running task 1208 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_fetch)
NOTE: Running task 1209 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 1210 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: Running task 1211 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_fetch)
NOTE: recipe libxft-1_2.3.4-r0: task do_unpack: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_unpack: Started
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 644 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running task 1216 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_unpack)
NOTE: Running task 1220 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: Running task 1239 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_fetch)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_fetch: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1240 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_patch)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.110-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libdrm-2.4.110-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.12.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.12.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_write_config: Succeeded
NOTE: Running setscene task 646 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata_setscene)
NOTE: Running task 1241 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_unpack: Started
NOTE: recipe wayland-1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1242 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_unpack)
NOTE: Running setscene task 648 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot_setscene)
NOTE: Running task 1247 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_fetch)
NOTE: recipe libxi-1_1.8-r0: task do_unpack: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1248 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_patch)
NOTE: Running task 1249 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_fetch)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_unpack: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Started
NOTE: Running task 1250 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_fetch)
NOTE: recipe atk-2.38.0-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk+3-3.24.33-r0: task do_unpack: Started
NOTE: recipe libwpe-1.12.0-r0: task do_unpack: Started
NOTE: recipe json-glib-1.6.6-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_patch: Started
NOTE: Running task 1259 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_patch)
NOTE: Running task 1260 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_patch)
NOTE: Running task 1263 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_fetch)
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.11-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: recipe libxv-1.0.11-r0: task do_fetch: Started
NOTE: Running task 1264 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: recipe orc-0.4.32-r0: task do_fetch: Started
NOTE: Running task 1265 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_patch)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_unpack: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1266 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_patch)
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1267 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_patch)
NOTE: recipe aspell-0.60.8-r0: task do_fetch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: Running task 1268 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_patch)
NOTE: Running setscene task 651 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_patch: Started
NOTE: Running setscene task 654 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1277 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_fetch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Succeeded
NOTE: Running task 1278 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_fetch)
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Started
NOTE: Running task 1279 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_fetch)
NOTE: Running task 1280 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_fetch)
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_unpack: Started
NOTE: Running setscene task 656 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.110-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.8-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.110-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_unpack: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_unpack: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 660 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 661 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 663 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 664 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 666 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 667 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 1315 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1320 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1321 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_patch)
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_fetch: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Started
NOTE: recipe libxslt-1.1.35-r0: task do_fetch: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 671 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 672 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 675 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1331 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_patch)
NOTE: Running task 1332 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_patch)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_unpack: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1333 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_patch)
NOTE: Running task 1334 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: recipe atk-2.38.0-r0: task do_patch: Started
NOTE: recipe libxslt-1.1.35-r0: task do_fetch: Succeeded
NOTE: Running task 1335 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_patch)
NOTE: Running task 1336 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_patch)
NOTE: recipe libsecret-0.20.5-r0: task do_fetch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_patch: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_patch: Started
NOTE: recipe vala-0.56.0-r0: task do_package_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_unpack: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_unpack: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_patch: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.11-r0: task do_patch: Started
NOTE: Running task 1341 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_patch)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_patch: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1342 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_generate_toolchain_file)
NOTE: Running task 1343 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1344 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1345 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_patch)
NOTE: Running task 1346 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_patch)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1347 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1348 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libnotify-0.7.9-r0: task do_fetch: Started
NOTE: recipe enchant2-2.3.3-r0: task do_fetch: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_fetch: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1349 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: recipe fribidi-1.0.11-r0: task do_patch: Succeeded
NOTE: Running task 1350 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_unpack)
NOTE: Running task 1351 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_unpack)
NOTE: Running task 1352 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_unpack)
NOTE: Running task 1353 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_fetch: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_fetch: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Succeeded
NOTE: Running task 1354 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: Running task 1355 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_unpack)
NOTE: Running task 1356 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_fetch)
NOTE: Running task 1357 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_fetch)
NOTE: recipe libnotify-0.7.9-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.6-r0: task do_unpack: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1371 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_deploy_source_date_epoch)
NOTE: Running task 1380 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_unpack)
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_patch: Succeeded
NOTE: recipe p11-kit-0.24.1-r0: task do_fetch: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: Running task 1385 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_unpack)
NOTE: Running task 1386 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: Running task 1387 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Started
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1388 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_patch)
NOTE: Running task 1389 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.9-r0: task do_patch: Started
NOTE: Running task 1390 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxml2-2.9.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Started
NOTE: Running task 1391 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libwpe-1.12.0-r0: task do_patch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.44.0-r0: task do_patch: Succeeded
NOTE: Running task 1392 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1393 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_patch)
NOTE: Running task 1394 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_unpack)
NOTE: Running task 1395 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_unpack)
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1396 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_unpack)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_generate_toolchain_file: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1401 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 683 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_patch: Started
NOTE: Running setscene task 684 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_patch: Started
NOTE: Running task 1406 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_patch)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1407 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1408 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_unpack)
NOTE: Running task 1409 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_unpack)
NOTE: Running task 1410 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1411 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_generate_toolchain_file)
NOTE: recipe libxv-1.0.11-r0: task do_unpack: Started
NOTE: recipe orc-0.4.32-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: Running task 1412 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe expat-2.4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_unpack: Started
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_fetch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Started
NOTE: recipe webkitgtk-2.36.0-r0: task do_fetch: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: Running task 1413 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.11-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 689 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_packagedata_setscene)
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_patch: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: recipe webkitgtk-2.36.0-r0: task do_fetch: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 692 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 694 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: Running task 1430 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxml2-2.9.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.50.6-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 697 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_patch: Started
NOTE: Running task 1440 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Succeeded
NOTE: Running task 1441 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1447 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_fetch)
NOTE: Running task 1448 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_fetch)
NOTE: Running task 1449 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_fetch)
NOTE: Running task 1451 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_unpack)
NOTE: Running task 1471 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_unpack)
NOTE: Running task 1473 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe libtasn1-4.18.0-r0: task do_patch: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_unpack: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 1474 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1475 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1476 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_write_config)
NOTE: recipe orc-0.4.32-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_unpack: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_unpack: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe enchant2-2.3.3-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.44.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1477 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_patch)
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Started
NOTE: Running task 1478 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_patch)
NOTE: recipe aspell-0.60.8-r0: task do_unpack: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwpe-1.12.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_unpack: Started
NOTE: Running task 1479 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1480 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_patch)
NOTE: recipe libsecret-0.20.5-r0: task do_unpack: Succeeded
NOTE: Running task 1481 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libwpe-1.12.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1492 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_patch: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_unpack: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1523 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_deploy_source_date_epoch)
NOTE: recipe atk-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1524 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_patch)
NOTE: Running task 1529 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_unpack: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_unpack: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1559 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_write_config)
NOTE: Running task 1565 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_fetch)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_unpack: Succeeded
NOTE: recipe pango-1.50.6-r0: task do_patch: Succeeded
NOTE: recipe gcr-3.40.0-r0: task do_fetch: Started
NOTE: Running task 1566 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_patch)
NOTE: recipe libdazzle-3.44.0-r0: task do_fetch: Started
NOTE: recipe python3-3.10.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 1567 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1568 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_patch)
NOTE: recipe json-glib-1.6.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcr-3.40.0-r0: task do_fetch: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_fetch: Succeeded
NOTE: recipe webkitgtk-2.36.0-r0: task do_unpack: Started
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_unpack: Started
NOTE: Running task 1594 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libhandy-1.5.0-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1595 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_patch)
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1597 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_unpack)
NOTE: recipe libxv-1.0.11-r0: task do_patch: Started
NOTE: recipe python3-3.10.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1598 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_patch)
NOTE: Running task 1599 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_unpack)
NOTE: recipe vala-0.56.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 700 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.5.bb:do_packagedata_setscene)
NOTE: recipe libhandy-1.5.0-r0: task do_fetch: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_write_config: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_patch: Started
NOTE: Running task 1615 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_unpack)
NOTE: Running setscene task 701 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 702 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_patch: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1638 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: Running task 1639 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: Running task 1643 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_write_config)
NOTE: Running task 1644 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_write_config)
NOTE: Running task 1645 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_write_config)
NOTE: Running task 1646 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_write_config)
NOTE: Running task 1647 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_write_config)
NOTE: Running task 1691 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_write_config)
NOTE: recipe p11-kit-0.24.1-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe enchant2-2.3.3-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.44.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_patch: Succeeded
NOTE: Running task 1719 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_patch)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_write_config: Succeeded
NOTE: Running task 1734 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_write_config)
NOTE: Running task 1735 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_write_config)
NOTE: Running task 1736 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_write_config)
NOTE: recipe libxslt-1.1.35-r0: task do_unpack: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_patch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_write_config: Started
NOTE: recipe epiphany-42.2-r0: task do_fetch: Started
NOTE: Running setscene task 704 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.5.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_patch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Succeeded
NOTE: recipe epiphany-42.2-r0: task do_fetch: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_patch: Started
NOTE: recipe libwpe-1.12.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_patch: Succeeded
NOTE: recipe pango-1.50.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_patch: Succeeded
NOTE: Running task 1781 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_patch)
NOTE: Running task 1782 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_deploy_source_date_epoch)
NOTE: Running task 1783 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_deploy_source_date_epoch)
NOTE: Running task 1784 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1785 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_unpack)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_patch: Started
NOTE: recipe libx11-1_1.7.5-r0: task do_packagedata_setscene: Started
NOTE: Running task 1796 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1797 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_deploy_source_date_epoch)
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_unpack: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_unpack: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_write_config: Succeeded
NOTE: recipe libhandy-1.5.0-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcr-3.40.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: Running task 1825 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_patch)
NOTE: recipe enchant2-2.3.3-r0: task do_patch: Succeeded
NOTE: Running task 1826 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_patch)
NOTE: Running task 1830 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_write_config)
NOTE: recipe libnotify-0.7.9-r0: task do_patch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1853 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_patch)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1863 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_patch: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_write_config: Started
NOTE: Running task 1864 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_patch: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_write_config: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_write_config: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_write_config: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: Running task 1878 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_write_config: Started
NOTE: Running task 1879 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe aspell-0.60.8-r0: task do_patch: Succeeded
NOTE: recipe p11-kit-0.24.1-r0: task do_patch: Started
NOTE: Running task 1880 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_write_config: Started
NOTE: recipe libhandy-1.5.0-r0: task do_write_config: Started
NOTE: recipe libx11-1_1.7.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1881 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1882 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe gcr-3.40.0-r0: task do_write_config: Started
NOTE: recipe libxslt-1.1.35-r0: task do_patch: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_write_config: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_write_config: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_write_config: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_write_config: Succeeded
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_write_config: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_unpack: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_write_config: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libx11-1_1.7.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe epiphany-42.2-r0: task do_unpack: Started
NOTE: Running task 1883 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_patch)
NOTE: recipe libsecret-0.20.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 708 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 709 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe libdazzle-3.44.0-r0: task do_write_config: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_patch: Succeeded
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_patch: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_patch: Started
NOTE: recipe libhandy-1.5.0-r0: task do_write_config: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_patch: Started
NOTE: recipe gcr-3.40.0-r0: task do_write_config: Succeeded
NOTE: recipe p11-kit-0.24.1-r0: task do_patch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe pango-1.50.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1884 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_deploy_source_date_epoch)
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: recipe epiphany-42.2-r0: task do_write_config: Started
NOTE: recipe enchant2-2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1885 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_deploy_source_date_epoch)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1886 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1887 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcr-3.40.0-r0: task do_unpack: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-3.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_patch: Succeeded
NOTE: recipe libhandy-1.5.0-r0: task do_unpack: Succeeded
NOTE: recipe harfbuzz-4.2.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 711 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 712 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 713 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 714 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 715 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 716 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_packagedata_setscene)
NOTE: Running task 1888 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_patch)
NOTE: Running task 1889 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: Running task 1890 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1891 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.7.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe epiphany-42.2-r0: task do_write_config: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe aspell-0.60.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-3.10.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 717 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_patch: Started
NOTE: recipe libxslt-1.1.35-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 718 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 720 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 721 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 723 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 724 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 725 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 726 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1900 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_patch: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1901 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_deploy_source_date_epoch)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.38.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe enchant2-2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libhandy-1.5.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_patch: Succeeded
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1902 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_deploy_source_date_epoch)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcr-3.40.0-r0: task do_patch: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.38.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe aspell-0.60.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libxslt-1.1.35-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sqlite3-3_3.38.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe p11-kit-0.24.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 730 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 731 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 732 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 733 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libhandy-1.5.0-r0: task do_patch: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 736 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
NOTE: Running task 1907 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-4.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcr-3.40.0-r0: task do_patch: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 741 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_package_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe epiphany-42.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 744 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 746 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 747 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 749 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 750 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1932 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_patch)
NOTE: Running task 1933 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_deploy_source_date_epoch)
NOTE: recipe sqlite3-3_3.38.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libhandy-1.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_package_setscene: Started
NOTE: recipe epiphany-42.2-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1938 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcr-3.40.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 758 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 759 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libhandy-1.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk+3-3.24.33-r0: task do_unpack: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running setscene task 765 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 766 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2021.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 1955 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_patch)
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcr-3.40.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe epiphany-42.2-r0: task do_patch: Succeeded
NOTE: Running task 1960 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1961 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_populate_lic)
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2021.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk+3-3.24.33-r0: task do_patch: Started
NOTE: recipe epiphany-42.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe epiphany-42.2-r0: task do_populate_lic: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe epiphany-42.2-r0: task do_populate_lic: Succeeded
NOTE: recipe gtk+3-3.24.33-r0: task do_patch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_populate_lic unihash changed to 5419e8ff66bfb975b34bd8fdc3be70664192c37a631990aa8d59b0ff4744a987
NOTE: Running task 1971 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_deploy_source_date_epoch)
NOTE: recipe epiphany-42.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk+3-3.24.33-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk+3-3.24.33-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 772 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 773 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 774 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 775 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 776 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 777 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 778 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_sysroot_setscene)
NOTE: recipe webkitgtk-2.36.0-r0: task do_unpack: Succeeded
NOTE: Running task 1973 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_patch)
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe webkitgtk-2.36.0-r0: task do_patch: Started
NOTE: recipe util-linux-2.37.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.37.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1974 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 782 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.37.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 783 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe webkitgtk-2.36.0-r0: task do_patch: Succeeded
NOTE: Running task 1987 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_generate_toolchain_file)
NOTE: Running task 1988 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 701b84400be6a894e12bc5efd8b8edbe811b8cdb6d9a3630f443403b418837a4
NOTE: recipe webkitgtk-2.36.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe webkitgtk-2.36.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe webkitgtk-2.36.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe webkitgtk-2.36.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-2.37.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 788 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 789 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 790 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 791 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 793 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 794 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 795 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 796 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 797 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 798 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 807 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 808 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 812 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 813 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 814 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 815 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 820 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 821 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 822 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 825 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.3.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 827 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-11.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-11.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 830 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.3.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-11.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 832 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-11.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-11.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-11.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 834 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+7a43f6fea9-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-11.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 835 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+7a43f6fea9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+7a43f6fea9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 838 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 839 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 840 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+7a43f6fea9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 841 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 842 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 851 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-11.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-11.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 854 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 855 of 859 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2485 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2509 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2510 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2526 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2527 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2528 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 2557 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2562 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2569 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2570 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2599 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-4.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2600 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2609 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe fribidi-1.0.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2616 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2618 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2645 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2650 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe atk-2.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2654 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2656 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2657 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2658 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2659 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2663 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2665 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2666 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe json-glib-1.6.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2667 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2668 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxv-1.0.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2674 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe aspell-0.60.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.0-r0: task do_packagedata: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe orc-0.4.32-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2723 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 0317d5775628c1dd2aefc61245d36eeabb8acaec29f8c546443c3829e208e9b7
NOTE: recipe libsecret-0.20.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxslt-1.1.35-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_configure: Started
NOTE: Running task 2734 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_configure)
NOTE: recipe libxft-1_2.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2735 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_configure)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2736 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_configure)
NOTE: Running task 2737 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2738 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_configure)
NOTE: recipe libxi-1_1.8-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_configure: Started
NOTE: Running task 2739 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_configure)
NOTE: Running task 2740 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_configure)
NOTE: recipe libxft-1_2.3.4-r0: task do_configure: Started
NOTE: Running task 2741 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_configure)
NOTE: recipe aspell-0.60.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vala-0.56.0-r0: task do_packagedata: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: Running task 2742 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_configure)
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2743 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_configure)
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2744 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_configure: Started
NOTE: Running task 2745 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_configure)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_configure: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_configure: Started
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Started
NOTE: Running task 2746 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_configure)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2747 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_configure)
NOTE: recipe atk-2.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2748 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_configure)
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe orc-0.4.32-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2749 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe json-glib-1.6.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2750 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_configure)
NOTE: recipe libtasn1-4.18.0-r0: task do_configure: Started
NOTE: Running task 2751 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_configure)
NOTE: recipe harfbuzz-4.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2752 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_configure)
NOTE: Running task 2753 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_configure)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_configure: Started
NOTE: Running task 2754 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_configure)
NOTE: Running task 2755 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_configure)
NOTE: recipe atk-2.38.0-r0: task do_configure: Started
NOTE: Running task 2756 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_configure)
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_configure: Started
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Started
NOTE: recipe json-glib-1.6.6-r0: task do_configure: Started
NOTE: recipe libsecret-0.20.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2757 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_configure)
NOTE: recipe harfbuzz-4.2.0-r0: task do_configure: Started
NOTE: Running task 2758 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_configure)
NOTE: recipe orc-0.4.32-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Started
NOTE: recipe libxslt-1.1.35-r0: task do_configure: Started
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_configure: Started
NOTE: recipe libsecret-0.20.5-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_configure: Succeeded
NOTE: Running task 2759 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_configure: Succeeded
NOTE: Running task 2760 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_compile)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.11-r0: task do_configure: Succeeded
NOTE: Running task 2761 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_compile)
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Succeeded
NOTE: Running task 2762 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe fribidi-1.0.11-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Started
NOTE: recipe orc-0.4.32-r0: task do_configure: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_compile: Succeeded
NOTE: Running task 2763 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_compile)
NOTE: Running task 2764 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_install)
NOTE: recipe orc-0.4.32-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_configure: Succeeded
NOTE: Running task 2765 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_compile)
NOTE: recipe atk-2.38.0-r0: task do_configure: Succeeded
NOTE: Running task 2766 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_compile)
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_configure: Succeeded
NOTE: Running task 2767 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_compile)
NOTE: recipe libepoxy-1.5.9-r0: task do_compile: Started
NOTE: recipe atk-2.38.0-r0: task do_compile: Started
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_compile: Started
NOTE: recipe json-glib-1.6.6-r0: task do_configure: Succeeded
NOTE: Running task 2768 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_configure_ptest_base)
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_compile: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_configure_ptest_base: Started
NOTE: Running task 2769 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_install)
NOTE: recipe json-glib-1.6.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2770 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_compile)
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_install: Started
NOTE: recipe json-glib-1.6.6-r0: task do_compile: Started
NOTE: recipe libsecret-0.20.5-r0: task do_configure: Succeeded
NOTE: Running task 2771 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_compile)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_install: Succeeded
NOTE: Running task 2772 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_populate_sysroot)
NOTE: Running task 2773 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_package)
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Succeeded
NOTE: Running task 2774 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe libsecret-0.20.5-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_populate_sysroot: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Started
NOTE: recipe fribidi-1.0.11-r0: task do_compile: Succeeded
NOTE: Running task 2775 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 2776 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_compile: Succeeded
NOTE: Running task 2777 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_install)
NOTE: recipe fribidi-1.0.11-r0: task do_install: Started
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_install: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: Running task 2778 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_package)
NOTE: Running task 2779 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_populate_sysroot)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_install: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_populate_sysroot: Started
NOTE: recipe orc-0.4.32-r0: task do_compile: Succeeded
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_package: Started
NOTE: Running task 2780 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2781 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_install)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_install: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_install: Started
NOTE: Running task 2782 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_populate_sysroot)
NOTE: Running task 2783 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_package: Started
NOTE: recipe fribidi-1.0.11-r0: task do_install: Succeeded
NOTE: Running task 2784 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_populate_sysroot)
NOTE: Running task 2785 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_package)
NOTE: recipe harfbuzz-4.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2786 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_compile)
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.11-r0: task do_package: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 2787 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2788 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_configure)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_install: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_configure: Started
NOTE: Running task 2789 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_populate_sysroot)
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Succeeded
NOTE: Running task 2790 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_package)
NOTE: Running task 2791 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: Running task 2792 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 2793 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_configure: Succeeded
NOTE: Running task 2794 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: Running task 2795 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_configure_ptest_base)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_configure_ptest_base: Started
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2796 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_compile)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2797 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_package: Succeeded
NOTE: Running task 2798 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_packagedata)
NOTE: recipe fribidi-1.0.11-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2799 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_package: Succeeded
NOTE: Running task 2800 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_packagedata)
NOTE: recipe fribidi-1.0.11-r0: task do_packagedata: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_compile: Succeeded
NOTE: Running task 2801 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata: Started
NOTE: recipe atk-2.38.0-r0: task do_install: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2802 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_compile)
NOTE: recipe orc-0.4.32-r0: task do_package: Succeeded
NOTE: Running task 2803 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_packagedata)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_packagedata: Started
NOTE: recipe json-glib-1.6.6-r0: task do_compile: Succeeded
NOTE: Running task 2804 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_compile_ptest_base)
NOTE: recipe orc-0.4.32-r0: task do_packagedata: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_package: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_install: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_compile_ptest_base: Started
NOTE: Running task 2805 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_packagedata)
NOTE: Running task 2806 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_populate_sysroot)
NOTE: recipe json-glib-1.6.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2807 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_package)
NOTE: Running task 2808 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_install)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_packagedata: Started
NOTE: recipe atk-2.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_package: Started
NOTE: recipe json-glib-1.6.6-r0: task do_install: Started
NOTE: Running task 2809 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_package: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_packagedata: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: Running task 2810 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_packagedata)
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_packagedata: Started
NOTE: recipe libsecret-0.20.5-r0: task do_compile: Succeeded
NOTE: Running task 2811 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_install)
NOTE: recipe libsecret-0.20.5-r0: task do_install: Started
NOTE: recipe json-glib-1.6.6-r0: task do_install: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2812 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_install_ptest_base)
NOTE: Running task 2813 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_install)
NOTE: recipe json-glib-1.6.6-r0: task do_install_ptest_base: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_install: Started
NOTE: recipe json-glib-1.6.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2814 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_populate_sysroot)
NOTE: Running task 2815 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_package)
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_packagedata: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot: Started
NOTE: Running task 2816 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_package_write_rpm)
NOTE: recipe json-glib-1.6.6-r0: task do_package: Started
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_package_write_rpm: Started
NOTE: recipe libsecret-0.20.5-r0: task do_install: Succeeded
NOTE: Running task 2817 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_populate_sysroot)
NOTE: Running task 2818 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_package)
NOTE: recipe libsecret-0.20.5-r0: task do_populate_sysroot: Started
NOTE: recipe libsecret-0.20.5-r0: task do_package: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_install: Succeeded
NOTE: Running task 2819 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_populate_sysroot)
NOTE: Running task 2820 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_package)
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_package: Started
NOTE: recipe libsecret-0.20.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_configure: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Succeeded
NOTE: Running task 2821 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_configure_ptest_base)
NOTE: Running task 2822 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_compile)
NOTE: recipe libwebp-1.2.2-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_configure_ptest_base: Started
NOTE: recipe aspell-0.60.8-r0: task do_configure: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2823 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_compile)
NOTE: Running task 2824 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 2825 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.4-r0: task do_configure: Succeeded
NOTE: Running task 2826 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: Running task 2827 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_compile)
NOTE: recipe aspell-0.60.8-r0: task do_compile: Started
NOTE: recipe libwpe-1.12.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_compile: Started
NOTE: recipe libxslt-1.1.35-r0: task do_configure: Succeeded
NOTE: Running task 2828 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Succeeded
NOTE: Running task 2829 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_compile)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_configure: Succeeded
NOTE: Running task 2830 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_compile)
NOTE: Running task 2831 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_compile)
NOTE: recipe libxslt-1.1.35-r0: task do_compile: Started
NOTE: recipe libxv-1.0.11-r0: task do_configure: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_configure: Succeeded
NOTE: Running task 2832 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Started
NOTE: Running task 2833 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_compile: Started
NOTE: recipe libxv-1.0.11-r0: task do_compile: Started
NOTE: recipe libxi-1_1.8-r0: task do_compile: Started
NOTE: recipe libwpe-1.12.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2834 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_configure)
NOTE: recipe libwpe-1.12.0-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Succeeded
NOTE: Running task 2835 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 2836 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_compile: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: Running task 2837 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_install)
NOTE: recipe libxv-1.0.11-r0: task do_compile: Succeeded
NOTE: Running task 2838 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Succeeded
NOTE: Running task 2839 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_install)
NOTE: recipe libxft-1_2.3.4-r0: task do_install: Started
NOTE: recipe libxv-1.0.11-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2840 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_install)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Started
NOTE: recipe libwpe-1.12.0-r0: task do_configure: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_compile: Succeeded
NOTE: Running task 2841 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_install)
NOTE: Running task 2842 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_compile)
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_install: Succeeded
NOTE: Running task 2843 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_package_write_rpm)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 2844 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_populate_sysroot)
NOTE: Running task 2845 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_package)
NOTE: recipe libwpe-1.12.0-r0: task do_compile: Started
NOTE: Running task 2846 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot)
NOTE: recipe libxi-1_1.8-r0: task do_install: Started
NOTE: Running task 2847 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 2848 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package)
NOTE: recipe libxv-1.0.11-r0: task do_install: Succeeded
NOTE: Running task 2849 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libxft-1_2.3.4-r0: task do_populate_sysroot: Started
NOTE: Running task 2850 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_populate_sysroot)
NOTE: Running task 2851 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_package_write_rpm: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_compile: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot: Started
NOTE: Running task 2852 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_install)
NOTE: recipe libxv-1.0.11-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2853 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 2854 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_package)
NOTE: recipe libepoxy-1.5.9-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_package: Succeeded
NOTE: Running task 2855 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_packagedata)
NOTE: recipe libwpe-1.12.0-r0: task do_compile: Succeeded
NOTE: Running task 2856 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_install)
NOTE: recipe libxi-1_1.8-r0: task do_install: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_packagedata: Started
NOTE: recipe libwpe-1.12.0-r0: task do_install: Started
NOTE: Running task 2857 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_populate_sysroot)
NOTE: Running task 2858 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2859 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2860 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.8-r0: task do_package: Started
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_install: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_install: Succeeded
NOTE: Running task 2861 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_populate_sysroot)
NOTE: Running task 2862 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_populate_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2863 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_package)
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2864 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: Running task 2865 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: Running task 2866 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_package)
NOTE: recipe libwpe-1.12.0-r0: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_populate_sysroot: Started
NOTE: recipe libwpe-1.12.0-r0: task do_package: Started
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2867 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2868 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_configure)
NOTE: recipe libxslt-1.1.35-r0: task do_compile: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Started
NOTE: Running task 2869 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_install)
NOTE: recipe libepoxy-1.5.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2870 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxslt-1.1.35-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Succeeded
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_package: Succeeded
NOTE: Running task 2871 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata)
NOTE: Running task 2872 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_packagedata)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxv-1.0.11-r0: task do_package: Succeeded
NOTE: Running task 2873 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Started
NOTE: recipe libsecret-0.20.5-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 2874 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libxv-1.0.11-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_package: Succeeded
NOTE: Running task 2875 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2876 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2877 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_compile)
NOTE: recipe atk-2.38.0-r0: task do_package: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_packagedata: Succeeded
NOTE: Running task 2878 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Started
NOTE: Running task 2879 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_compile)
NOTE: recipe libxft-1_2.3.4-r0: task do_packagedata: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_packagedata: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_packagedata: Started
NOTE: recipe json-glib-1.6.6-r0: task do_package: Succeeded
NOTE: Running task 2880 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_compile: Started
NOTE: Running task 2881 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_packagedata)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_configure: Started
NOTE: recipe libxi-1_1.8-r0: task do_package: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata: Started
NOTE: Running task 2882 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_packagedata)
NOTE: recipe libxslt-1.1.35-r0: task do_install: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_package: Succeeded
NOTE: Running task 2883 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_populate_sysroot)
NOTE: Running task 2884 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_package)
NOTE: Running task 2885 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_packagedata)
NOTE: recipe libxi-1_1.8-r0: task do_packagedata: Started
NOTE: recipe libwpe-1.12.0-r0: task do_package: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_populate_sysroot: Started
NOTE: Running task 2886 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.9-r0: task do_packagedata: Started
NOTE: recipe libxslt-1.1.35-r0: task do_package: Started
NOTE: recipe libwpe-1.12.0-r0: task do_packagedata: Started
NOTE: recipe aspell-0.60.8-r0: task do_compile: Succeeded
NOTE: Running task 2887 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_install)
NOTE: recipe libxi-1_1.8-r0: task do_packagedata: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_packagedata: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_packagedata: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2888 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_install)
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Started
NOTE: recipe libwebp-1.2.2-r0: task do_compile: Succeeded
NOTE: Running task 2889 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_install)
NOTE: recipe aspell-0.60.8-r0: task do_install: Succeeded
NOTE: Running task 2890 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_populate_sysroot)
NOTE: Running task 2891 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_package)
NOTE: recipe libwebp-1.2.2-r0: task do_install: Started
NOTE: recipe aspell-0.60.8-r0: task do_populate_sysroot: Started
NOTE: recipe aspell-0.60.8-r0: task do_package: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_configure: Succeeded
NOTE: Running task 2892 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_compile)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_compile: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_compile: Succeeded
NOTE: Running task 2893 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_compile_ptest_base)
NOTE: Running task 2894 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_populate_sysroot)
NOTE: recipe aspell-0.60.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2895 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_package)
NOTE: Running task 2896 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_compile_ptest_base: Started
NOTE: recipe enchant2-2.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2897 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_install)
NOTE: recipe libwebp-1.2.2-r0: task do_install: Succeeded
NOTE: Running task 2898 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_populate_sysroot)
NOTE: Running task 2899 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_install: Started
NOTE: recipe enchant2-2.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_populate_sysroot: Started
NOTE: Running task 2900 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_configure)
NOTE: recipe libwebp-1.2.2-r0: task do_package: Started
NOTE: recipe enchant2-2.3.3-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_package: Succeeded
NOTE: Running task 2901 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_packagedata)
NOTE: recipe libxslt-1.1.35-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.2.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_compile: Succeeded
NOTE: Running task 2902 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_install)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_compile: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_packagedata: Succeeded
NOTE: Running task 2903 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_compile_ptest_base)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2904 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_install)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_install: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_install: Succeeded
NOTE: Running task 2905 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_populate_sysroot)
NOTE: Running task 2906 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_install: Succeeded
NOTE: Running task 2907 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_install_ptest_base)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_populate_sysroot: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_install_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2908 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_populate_sysroot)
NOTE: Running task 2909 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_package: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2910 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_compile)
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_install: Succeeded
NOTE: Running task 2911 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_install_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2912 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2913 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_populate_sysroot)
NOTE: Running task 2914 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_package)
NOTE: recipe libwebp-1.2.2-r0: task do_package: Succeeded
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_populate_sysroot: Started
NOTE: Running task 2915 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_packagedata)
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Succeeded
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_package: Started
NOTE: recipe libpsl-0.21.1-r0: task do_compile: Succeeded
NOTE: Running task 2916 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_install)
NOTE: Running task 2917 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_packagedata)
NOTE: recipe libwebp-1.2.2-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe libpsl-0.21.1-r0: task do_install: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_compile: Succeeded
NOTE: Running task 2918 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_install)
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 2919 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe libtasn1-4.18.0-r0: task do_configure: Succeeded
NOTE: Running task 2920 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_compile)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_install: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe libwebp-1.2.2-r0: task do_packagedata: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_compile: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2921 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_configure)
NOTE: recipe aspell-0.60.8-r0: task do_package: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_install: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_configure: Started
NOTE: Running task 2922 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_populate_sysroot)
NOTE: Running task 2923 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_package)
NOTE: Running task 2924 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_populate_sysroot: Started
NOTE: recipe aspell-0.60.8-r0: task do_packagedata: Started
NOTE: recipe libpsl-0.21.1-r0: task do_package: Started
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Succeeded
NOTE: Running task 2925 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_install)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_package: Succeeded
NOTE: Running task 2926 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_packagedata)
NOTE: recipe libtheora-1.1.1-r1: task do_install: Started
NOTE: recipe libpsl-0.21.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2927 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_packagedata: Started
NOTE: recipe aspell-0.60.8-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_install: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2928 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_populate_sysroot)
NOTE: Running task 2929 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 2930 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_package: Started
NOTE: recipe libtheora-1.1.1-r1: task do_install: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2931 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 2932 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2933 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_configure)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.1-r0: task do_package: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 2934 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_packagedata)
NOTE: recipe libpsl-0.21.1-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 2935 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 2936 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe libpsl-0.21.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 2937 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_compile)
NOTE: recipe libnotify-0.7.9-r0: task do_configure: Succeeded
NOTE: Running task 2938 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_compile)
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Started
NOTE: recipe libnotify-0.7.9-r0: task do_compile: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 2939 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Succeeded
NOTE: Running task 2940 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 2941 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 2942 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package)
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_package: Succeeded
NOTE: Running task 2943 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_packagedata: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_configure: Succeeded
NOTE: Running task 2944 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_compile)
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2945 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_compile: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: recipe at-spi2-core-2.44.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2946 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_packagedata: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-core-2.44.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2947 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_configure)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 2948 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_compile: Succeeded
NOTE: Running task 2949 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_install)
NOTE: recipe libtasn1-4.18.0-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_compile: Succeeded
NOTE: Running task 2950 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_install)
NOTE: recipe libnotify-0.7.9-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_package: Succeeded
NOTE: Running task 2951 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_packagedata: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_install: Succeeded
NOTE: Running task 2952 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_populate_sysroot)
NOTE: Running task 2953 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_package)
NOTE: recipe libtasn1-4.18.0-r0: task do_populate_sysroot: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_package: Started
NOTE: recipe libnotify-0.7.9-r0: task do_install: Succeeded
NOTE: Running task 2954 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_populate_sysroot)
NOTE: recipe libnotify-0.7.9-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.44.0-r0: task do_configure: Succeeded
NOTE: Running task 2955 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_compile)
NOTE: recipe libtasn1-4.18.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2956 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_compile: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_packagedata: Succeeded
NOTE: Running task 2957 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_package)
NOTE: recipe libnotify-0.7.9-r0: task do_package: Started
NOTE: recipe libnotify-0.7.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe p11-kit-0.24.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2958 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_configure)
NOTE: recipe p11-kit-0.24.1-r0: task do_configure: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_package: Succeeded
NOTE: Running task 2959 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_package: Succeeded
NOTE: Running task 2960 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_packagedata)
NOTE: recipe libtasn1-4.18.0-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_packagedata: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_packagedata: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_package: Succeeded
NOTE: Running task 2961 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_packagedata)
NOTE: recipe libnotify-0.7.9-r0: task do_packagedata: Started
NOTE: recipe libnotify-0.7.9-r0: task do_packagedata: Succeeded
NOTE: recipe p11-kit-0.24.1-r0: task do_configure: Succeeded
NOTE: Running task 2962 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_compile)
NOTE: recipe p11-kit-0.24.1-r0: task do_compile: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_compile: Succeeded
NOTE: Running task 2963 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_install)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.44.0-r0: task do_compile: Succeeded
NOTE: Running task 2964 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_install)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_install: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_install: Succeeded
NOTE: Running task 2965 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_populate_sysroot)
NOTE: Running task 2966 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_package)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_populate_sysroot: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.44.0-r0: task do_install: Succeeded
NOTE: Running task 2967 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_populate_sysroot)
NOTE: Running task 2968 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_package)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.44.0-r0: task do_package: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.44.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2969 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2970 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_configure)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Succeeded
NOTE: Running task 2971 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_compile)
NOTE: recipe harfbuzz-4.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2972 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_install)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_install: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_package: Succeeded
NOTE: Running task 2973 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_packagedata)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Succeeded
NOTE: Running task 2974 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_install)
NOTE: recipe harfbuzz-4.2.0-r0: task do_install: Succeeded
NOTE: Running task 2975 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_populate_sysroot)
NOTE: Running task 2976 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_package)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.44.0-r0: task do_package: Succeeded
NOTE: Running task 2977 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_packagedata)
NOTE: recipe harfbuzz-4.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.44.0-r0: task do_packagedata: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Succeeded
NOTE: Running task 2978 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_populate_sysroot)
NOTE: recipe harfbuzz-4.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2979 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.44.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2980 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package)
NOTE: recipe pango-1.50.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pango-1.50.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2981 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_configure)
NOTE: recipe pango-1.50.6-r0: task do_configure: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Succeeded
NOTE: Running task 2982 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_packagedata)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Succeeded
NOTE: recipe harfbuzz-4.2.0-r0: task do_package: Succeeded
NOTE: Running task 2983 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_packagedata)
NOTE: recipe harfbuzz-4.2.0-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_configure: Succeeded
NOTE: Running task 2984 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_compile)
NOTE: recipe enchant2-2.3.3-r0: task do_compile: Started
NOTE: recipe pango-1.50.6-r0: task do_configure: Succeeded
NOTE: Running task 2985 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_configure_ptest_base)
NOTE: recipe pango-1.50.6-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.50.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2986 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_compile)
NOTE: recipe pango-1.50.6-r0: task do_compile: Started
NOTE: recipe enchant2-2.3.3-r0: task do_compile: Succeeded
NOTE: Running task 2987 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_install)
NOTE: recipe enchant2-2.3.3-r0: task do_install: Started
NOTE: recipe enchant2-2.3.3-r0: task do_install: Succeeded
NOTE: Running task 2988 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_populate_sysroot)
NOTE: Running task 2989 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_package)
NOTE: recipe enchant2-2.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe enchant2-2.3.3-r0: task do_package: Started
NOTE: recipe enchant2-2.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_package: Succeeded
NOTE: Running task 2990 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_packagedata)
NOTE: recipe enchant2-2.3.3-r0: task do_packagedata: Started
NOTE: recipe enchant2-2.3.3-r0: task do_packagedata: Succeeded
NOTE: recipe p11-kit-0.24.1-r0: task do_compile: Succeeded
NOTE: Running task 2991 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_install)
NOTE: recipe p11-kit-0.24.1-r0: task do_install: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_install: Succeeded
NOTE: Running task 2992 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_populate_sysroot)
NOTE: Running task 2993 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_package)
NOTE: recipe p11-kit-0.24.1-r0: task do_populate_sysroot: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_package: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pango-1.50.6-r0: task do_compile: Succeeded
NOTE: Running task 2994 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_compile_ptest_base)
NOTE: recipe pango-1.50.6-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.50.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2995 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_install)
NOTE: recipe pango-1.50.6-r0: task do_install: Started
NOTE: recipe pango-1.50.6-r0: task do_install: Succeeded
NOTE: Running task 2996 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_install_ptest_base)
NOTE: recipe p11-kit-0.24.1-r0: task do_package: Succeeded
NOTE: recipe pango-1.50.6-r0: task do_install_ptest_base: Started
NOTE: Running task 2997 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_packagedata)
NOTE: recipe pango-1.50.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2998 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_populate_sysroot)
NOTE: recipe p11-kit-0.24.1-r0: task do_packagedata: Started
NOTE: Running task 2999 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_package)
NOTE: recipe pango-1.50.6-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.50.6-r0: task do_package: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_packagedata: Succeeded
NOTE: recipe pango-1.50.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3000 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3001 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.33-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3002 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.33-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3003 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_configure)
NOTE: recipe gtk+3-3.24.33-r0: task do_configure: Started
NOTE: recipe pango-1.50.6-r0: task do_package: Succeeded
NOTE: Running task 3004 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_packagedata)
NOTE: recipe pango-1.50.6-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.6-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_configure: Succeeded
NOTE: Running task 3005 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.33-r0: task do_configure: Succeeded
NOTE: Running task 3006 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_compile)
NOTE: recipe gtk+3-3.24.33-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_compile: Succeeded
NOTE: Running task 3007 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_install: Succeeded
NOTE: Running task 3008 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_populate_sysroot)
NOTE: Running task 3009 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_package: Succeeded
NOTE: Running task 3010 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_packagedata: Succeeded
NOTE: recipe gtk+3-3.24.33-r0: task do_compile: Succeeded
NOTE: Running task 3011 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_install)
NOTE: recipe gtk+3-3.24.33-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.33-r0: task do_install: Succeeded
NOTE: Running task 3012 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_populate_sysroot)
NOTE: Running task 3013 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_package)
NOTE: recipe gtk+3-3.24.33-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.33-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.33-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3014 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3015 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3016 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3017 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe webkitgtk-2.36.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libhandy-1.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcr-3.40.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libhandy-1.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3022 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_configure)
NOTE: recipe libdazzle-3.44.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3023 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_configure)
NOTE: recipe webkitgtk-2.36.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3024 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_configure)
NOTE: recipe libhandy-1.5.0-r0: task do_configure: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_configure: Started
NOTE: recipe webkitgtk-2.36.0-r0: task do_configure: Started
NOTE: recipe gcr-3.40.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3025 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_configure)
NOTE: recipe gcr-3.40.0-r0: task do_configure: Started
NOTE: recipe libhandy-1.5.0-r0: task do_configure: Succeeded
NOTE: Running task 3026 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_compile)
NOTE: recipe libhandy-1.5.0-r0: task do_compile: Started
NOTE: recipe gcr-3.40.0-r0: task do_configure: Succeeded
NOTE: Running task 3027 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_compile)
NOTE: recipe libdazzle-3.44.0-r0: task do_configure: Succeeded
NOTE: Running task 3028 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_compile)
NOTE: recipe gcr-3.40.0-r0: task do_compile: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.33-r0: task do_package: Succeeded
NOTE: Running task 3029 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.33-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.33-r0: task do_packagedata: Succeeded
NOTE: recipe libhandy-1.5.0-r0: task do_compile: Succeeded
NOTE: Running task 3033 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_install)
NOTE: recipe libhandy-1.5.0-r0: task do_install: Started
NOTE: recipe libhandy-1.5.0-r0: task do_install: Succeeded
NOTE: Running task 3034 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_populate_sysroot)
NOTE: Running task 3035 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_package)
NOTE: recipe libhandy-1.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe libhandy-1.5.0-r0: task do_package: Started
NOTE: recipe libhandy-1.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_compile: Succeeded
NOTE: Running task 3036 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_install)
NOTE: recipe libdazzle-3.44.0-r0: task do_install: Started
NOTE: recipe gcr-3.40.0-r0: task do_compile: Succeeded
NOTE: Running task 3037 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_install)
NOTE: recipe libdazzle-3.44.0-r0: task do_install: Succeeded
NOTE: recipe gcr-3.40.0-r0: task do_install: Started
NOTE: Running task 3038 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_populate_sysroot)
NOTE: Running task 3039 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_package)
NOTE: recipe libdazzle-3.44.0-r0: task do_populate_sysroot: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_package: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libhandy-1.5.0-r0: task do_package: Succeeded
NOTE: Running task 3040 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_packagedata)
NOTE: recipe libhandy-1.5.0-r0: task do_packagedata: Started
NOTE: recipe gcr-3.40.0-r0: task do_install: Succeeded
NOTE: Running task 3041 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_populate_sysroot)
NOTE: Running task 3042 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_package)
NOTE: recipe gcr-3.40.0-r0: task do_populate_sysroot: Started
NOTE: recipe gcr-3.40.0-r0: task do_package: Started
NOTE: recipe libhandy-1.5.0-r0: task do_packagedata: Succeeded
NOTE: recipe gcr-3.40.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_package: Succeeded
NOTE: Running task 3043 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_packagedata)
NOTE: recipe libdazzle-3.44.0-r0: task do_packagedata: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_packagedata: Succeeded
NOTE: recipe webkitgtk-2.36.0-r0: task do_configure: Succeeded
NOTE: Running task 3044 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_compile)
NOTE: recipe webkitgtk-2.36.0-r0: task do_compile: Started
NOTE: recipe gcr-3.40.0-r0: task do_package: Succeeded
NOTE: Running task 3045 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_packagedata)
NOTE: recipe gcr-3.40.0-r0: task do_packagedata: Started
NOTE: recipe gcr-3.40.0-r0: task do_packagedata: Succeeded
Bitbake still alive (no events for 600s). Active tasks:
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_compile
NOTE: recipe webkitgtk-2.36.0-r0: task do_compile: Succeeded
NOTE: Running task 3046 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_install)
NOTE: recipe webkitgtk-2.36.0-r0: task do_install: Started
NOTE: recipe webkitgtk-2.36.0-r0: task do_install: Succeeded
NOTE: Running task 3047 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_populate_sysroot)
NOTE: Running task 3048 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_package)
NOTE: recipe webkitgtk-2.36.0-r0: task do_populate_sysroot: Started
NOTE: recipe webkitgtk-2.36.0-r0: task do_package: Started
NOTE: recipe webkitgtk-2.36.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3049 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe epiphany-42.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe epiphany-42.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3050 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_configure)
NOTE: recipe epiphany-42.2-r0: task do_configure: Started
NOTE: recipe epiphany-42.2-r0: task do_configure: Succeeded
NOTE: Running task 3051 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_compile)
NOTE: recipe epiphany-42.2-r0: task do_compile: Started
NOTE: recipe epiphany-42.2-r0: task do_compile: Succeeded
NOTE: Running task 3052 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_install)
NOTE: recipe epiphany-42.2-r0: task do_install: Started
NOTE: recipe epiphany-42.2-r0: task do_install: Succeeded
NOTE: Running task 3053 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_populate_sysroot)
NOTE: recipe epiphany-42.2-r0: task do_populate_sysroot: Started
NOTE: recipe epiphany-42.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe webkitgtk-2.36.0-r0: task do_package: Succeeded
NOTE: Running task 3054 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_packagedata)
NOTE: recipe webkitgtk-2.36.0-r0: task do_packagedata: Started
NOTE: recipe webkitgtk-2.36.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3055 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_package)
NOTE: recipe epiphany-42.2-r0: task do_package: Started
NOTE: recipe epiphany-42.2-r0: task do_package: Succeeded
NOTE: Running task 3056 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_packagedata)
NOTE: recipe epiphany-42.2-r0: task do_packagedata: Started
NOTE: recipe epiphany-42.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3057 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_package_write_rpm)
NOTE: Running task 3058 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_package_qa)
NOTE: recipe epiphany-42.2-r0: task do_package_write_rpm: Started
NOTE: recipe epiphany-42.2-r0: task do_package_qa: Started
NOTE: recipe epiphany-42.2-r0: task do_package_qa: Succeeded
NOTE: recipe epiphany-42.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3059 of 3059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_build)
NOTE: Tasks Summary: Attempted 3059 tasks of which 2485 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: vala-0.56.0-r0 do_packagedata_setscene: QA Issue: Package version for package vala-src went backwards which would break package feeds (from 0:0.56.1-r0 to 0:0.56.0-r0) [version-going-backwards]
ERROR: vala-0.56.0-r0 do_packagedata_setscene: QA Issue: Package version for package vala-dbg went backwards which would break package feeds (from 0:0.56.1-r0 to 0:0.56.0-r0) [version-going-backwards]
ERROR: vala-0.56.0-r0 do_packagedata_setscene: QA Issue: Package version for package vala-staticdev went backwards which would break package feeds (from 0:0.56.1-r0 to 0:0.56.0-r0) [version-going-backwards]
ERROR: vala-0.56.0-r0 do_packagedata_setscene: QA Issue: Package version for package vala-dev went backwards which would break package feeds (from 0:0.56.1-r0 to 0:0.56.0-r0) [version-going-backwards]
ERROR: vala-0.56.0-r0 do_packagedata_setscene: QA Issue: Package version for package vala-doc went backwards which would break package feeds (from 0:0.56.1-r0 to 0:0.56.0-r0) [version-going-backwards]
ERROR: vala-0.56.0-r0 do_packagedata_setscene: QA Issue: Package version for package vala-locale went backwards which would break package feeds (from 0:0.56.1-r0 to 0:0.56.0-r0) [version-going-backwards]
ERROR: vala-0.56.0-r0 do_packagedata_setscene: QA Issue: Package version for package vala went backwards which would break package feeds (from 0:0.56.1-r0 to 0:0.56.0-r0) [version-going-backwards]
ERROR: vala-0.56.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3111540461775897567==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1642 targets, 53 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-ed8181b2f5a2b54f8551c847a8333441988f2cd3"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ed8181b2f5a2b54f8551c847a8333441988f2cd3"
workspace            = "master:9e556960421c8bbe8851d9810352a5b4bd3b50df"

Initialising tasks...done.
Sstate summary: Wanted 212 Local 24 Mirrors 0 Missed 188 Current 665 (11% match, 78% complete)
Removing 1 stale sstate objects for arch cortexa15t2hf-neon...done.
Removing 4 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 689 of 877 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_41.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 695 of 877 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 719 of 877 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 760 of 877 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 839 of 877 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 840 of 877 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.9.0.bb:do_packagedata_setscene)
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe adwaita-icon-theme-41.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.0-r0: task do_packagedata_setscene: Started
NOTE: recipe iso-codes-4.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe adwaita-icon-theme-41.0-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/vala/0.56.0-r0/temp/log.do_packagedata_setscene.1765700
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 875 of 877 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_package_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe iso-codes-4.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1398 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_fetch)
NOTE: Running task 1440 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1540 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: Running task 1547 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_fetch)
NOTE: Running task 1569 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_fetch)
NOTE: Running task 1575 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_fetch)
NOTE: Running task 1576 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_fetch)
NOTE: Running task 1582 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_fetch)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 1724 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_unpack)
NOTE: Running task 1760 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1763 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_fetch)
NOTE: Running task 1778 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: Running task 1780 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_write_config)
NOTE: Running task 1791 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_write_config)
NOTE: Running task 1792 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_write_config)
NOTE: Running task 1793 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_write_config)
NOTE: Running task 1794 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_fetch)
NOTE: Running task 1855 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_fetch)
NOTE: Running task 1870 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_fetch)
NOTE: Running task 1884 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_fetch)
NOTE: Running task 1885 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_fetch)
NOTE: Running task 1887 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_fetch)
NOTE: Running task 1892 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_write_config)
NOTE: Running task 1894 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_fetch)
NOTE: Running task 1895 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_fetch)
NOTE: Running task 1906 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_fetch)
NOTE: Running task 1910 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_write_config)
NOTE: Running task 1911 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 1918 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe vala-0.56.0-r0: task do_package_setscene: Started
NOTE: Running task 1965 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_fetch)
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-4.2.0-r0: task do_fetch: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_fetch: Started
NOTE: Running task 1997 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_write_config)
NOTE: recipe fribidi-1.0.11-r0: task do_fetch: Succeeded
NOTE: Running task 2006 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_write_config)
NOTE: Running task 2008 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_fetch)
NOTE: Running task 2015 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_fetch)
NOTE: recipe pango-1.50.6-r0: task do_fetch: Started
NOTE: Running task 2031 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_write_config)
NOTE: Running task 2038 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_write_config)
NOTE: Running task 2042 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 2043 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_fetch)
NOTE: recipe pango-1.50.6-r0: task do_fetch: Succeeded
NOTE: Running task 2060 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: Running task 2061 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_unpack)
NOTE: Running task 2062 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_unpack)
NOTE: Running task 2063 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_unpack)
NOTE: Running task 2064 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_unpack)
NOTE: Running task 2065 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2066 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2067 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_unpack: Started
NOTE: Running task 2068 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_unpack)
NOTE: Running task 2069 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.8-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_fetch: Started
NOTE: recipe atk-2.38.0-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.8-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_write_config: Started
NOTE: recipe fribidi-1.0.11-r0: task do_write_config: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe pango-1.50.6-r0: task do_write_config: Started
NOTE: recipe atk-2.38.0-r0: task do_fetch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.44.0-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Started
NOTE: recipe libwpe-1.12.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_write_config: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_fetch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Succeeded
NOTE: Running task 2088 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_unpack)
NOTE: recipe json-glib-1.6.6-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.44.0-r0: task do_fetch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe gtk+3-3.24.33-r0: task do_fetch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Succeeded
NOTE: Running task 2089 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_unpack)
NOTE: Running task 2090 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_fetch: Started
NOTE: recipe atk-2.38.0-r0: task do_write_config: Started
NOTE: recipe json-glib-1.6.6-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.44.0-r0: task do_write_config: Started
NOTE: Running task 2091 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe fribidi-1.0.11-r0: task do_write_config: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_write_config: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-4.2.0-r0: task do_write_config: Succeeded
NOTE: recipe gtk+3-3.24.33-r0: task do_fetch: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_write_config: Started
NOTE: recipe pango-1.50.6-r0: task do_write_config: Succeeded
NOTE: Running task 2092 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_patch)
NOTE: Running task 2093 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_write_config: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_write_config: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_fetch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.11-r0: task do_unpack: Started
NOTE: Running task 2094 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_unpack)
NOTE: Running task 2095 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_unpack)
NOTE: Running task 2096 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_unpack)
NOTE: Running task 2097 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.44.0-r0: task do_write_config: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe atk-2.38.0-r0: task do_write_config: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_write_config: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_unpack: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_unpack: Started
NOTE: Running task 2098 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_unpack)
NOTE: Running task 2099 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_unpack)
NOTE: Running task 2100 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_unpack)
NOTE: Running task 2101 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_unpack)
NOTE: Running task 2102 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: Running task 2103 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_unpack)
NOTE: Running task 2104 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe json-glib-1.6.6-r0: task do_write_config: Succeeded
NOTE: recipe harfbuzz-4.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2105 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_unpack)
NOTE: Running task 2106 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.50.6-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 2107 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.8-r0: task do_unpack: Started
NOTE: Running task 2108 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_patch)
NOTE: Running task 2109 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_unpack: Started
NOTE: recipe atk-2.38.0-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_patch: Started
NOTE: Running task 2110 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2111 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_unpack)
NOTE: Running task 2112 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_unpack)
NOTE: Running task 2119 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Started
NOTE: Running task 2120 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_fetch)
NOTE: Running task 2121 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_fetch)
NOTE: Running task 2122 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: Running task 2123 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_fetch)
NOTE: Running task 2124 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_fetch)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_unpack: Started
NOTE: Running task 2135 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Started
NOTE: Running task 2136 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_unpack)
NOTE: Running task 2154 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_fetch)
NOTE: Running task 2155 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2156 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_fetch)
NOTE: Running task 2157 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_fetch)
NOTE: Running task 2158 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_fetch)
NOTE: Running task 2159 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_fetch)
NOTE: Running task 2160 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_fetch)
NOTE: Running task 2161 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_fetch)
NOTE: Running task 2162 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_fetch)
NOTE: recipe fribidi-1.0.11-r0: task do_unpack: Succeeded
NOTE: Running task 2190 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_fetch)
NOTE: recipe atk-2.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2193 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_fetch)
NOTE: Running task 2194 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2195 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_patch)
NOTE: recipe libxi-1_1.8-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.33-r0: task do_unpack: Started
NOTE: recipe libwpe-1.12.0-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_unpack: Succeeded
NOTE: recipe vala-0.56.0-r0: task do_package_setscene: Succeeded
NOTE: Running task 2196 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_patch)
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_patch: Started
NOTE: Running task 2197 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_patch)
NOTE: recipe json-glib-1.6.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.44.0-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: Setscene tasks completed
NOTE: Running task 2198 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_patch)
NOTE: recipe libtasn1-4.18.0-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_fetch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: Running task 2199 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: recipe orc-0.4.32-r0: task do_fetch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Succeeded
NOTE: Running task 2200 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_patch)
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: recipe libxv-1.0.11-r0: task do_fetch: Started
NOTE: Running task 2201 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_fetch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_fetch: Started
NOTE: Running task 2203 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_patch)
NOTE: Running task 2204 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_patch)
NOTE: recipe libepoxy-1.5.9-r0: task do_unpack: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_fetch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_unpack: Started
NOTE: Running task 2207 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libwpe-1.12.0-r0: task do_unpack: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_fetch: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_fetch: Started
NOTE: recipe libxslt-1.1.35-r0: task do_fetch: Started
NOTE: recipe libnotify-0.7.9-r0: task do_fetch: Started
NOTE: Running task 2208 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_patch)
NOTE: recipe p11-kit-0.24.1-r0: task do_fetch: Started
NOTE: Running task 2209 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Started
NOTE: Running task 2212 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_patch)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_fetch: Succeeded
NOTE: Running task 2217 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_patch: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_fetch: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_fetch: Started
NOTE: Running task 2218 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_unpack)
NOTE: recipe enchant2-2.3.3-r0: task do_fetch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Started
NOTE: Running task 2219 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_unpack)
NOTE: Running task 2220 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: Running task 2221 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_unpack)
NOTE: Running task 2222 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_unpack)
NOTE: Running task 2226 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_fetch: Started
NOTE: recipe webkitgtk-2.36.0-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_unpack: Succeeded
NOTE: recipe p11-kit-0.24.1-r0: task do_fetch: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_fetch: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_fetch: Succeeded
NOTE: Running task 2227 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_generate_toolchain_file)
NOTE: Running task 2228 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe webkitgtk-2.36.0-r0: task do_fetch: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_patch: Started
NOTE: Running task 2229 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe json-glib-1.6.6-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_fetch: Succeeded
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.11-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Started
NOTE: Running task 2233 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_fetch: Succeeded
NOTE: Running task 2234 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_patch)
NOTE: Running task 2245 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_patch)
NOTE: recipe atk-2.38.0-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: Running task 2254 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_unpack)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Started
NOTE: Running task 2255 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_unpack)
NOTE: Running task 2256 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_unpack)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Started
NOTE: Running task 2257 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: Running task 2258 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_unpack)
NOTE: recipe fribidi-1.0.11-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Started
NOTE: Running task 2259 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_unpack)
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: Running task 2260 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_unpack)
NOTE: Running task 2261 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_unpack)
NOTE: recipe fribidi-1.0.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2262 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_unpack)
NOTE: recipe libepoxy-1.5.9-r0: task do_patch: Started
NOTE: recipe libwpe-1.12.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running task 2263 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_deploy_source_date_epoch)
NOTE: Running task 2264 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_unpack)
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe orc-0.4.32-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_unpack: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_patch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: recipe aspell-0.60.8-r0: task do_unpack: Started
NOTE: recipe libwpe-1.12.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxv-1.0.11-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_unpack: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_unpack: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_patch: Succeeded
NOTE: Running task 2265 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2266 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.50.6-r0: task do_unpack: Succeeded
NOTE: Running task 2267 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_patch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Succeeded
NOTE: Running task 2268 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2269 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2270 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_patch)
NOTE: Running task 2280 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_fetch)
NOTE: recipe libxft-1_2.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_patch: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 2281 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_patch)
NOTE: recipe libtasn1-4.18.0-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2282 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2283 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_generate_toolchain_file)
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: Running task 2284 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.44.0-r0: task do_patch: Succeeded
NOTE: Running task 2285 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_fetch)
NOTE: recipe json-glib-1.6.6-r0: task do_patch: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_unpack: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_unpack: Started
NOTE: recipe libxslt-1.1.35-r0: task do_unpack: Started
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe libnotify-0.7.9-r0: task do_unpack: Started
NOTE: recipe libxv-1.0.11-r0: task do_unpack: Succeeded
NOTE: Running task 2286 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2287 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2288 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2289 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_fetch)
NOTE: recipe enchant2-2.3.3-r0: task do_unpack: Started
NOTE: recipe libsecret-0.20.5-r0: task do_unpack: Started
NOTE: Running task 2290 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.11-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2291 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_patch)
NOTE: Running task 2293 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_unpack)
NOTE: recipe orc-0.4.32-r0: task do_unpack: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Started
NOTE: Running task 2294 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_patch)
NOTE: recipe libxi-1_1.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: Running task 2295 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_patch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_patch: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_patch: Started
NOTE: recipe enchant2-2.3.3-r0: task do_unpack: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: Running task 2315 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_unpack)
NOTE: Running task 2318 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe gcr-3.40.0-r0: task do_fetch: Started
NOTE: recipe pango-1.50.6-r0: task do_patch: Started
NOTE: recipe libwpe-1.12.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwpe-1.12.0-r0: task do_generate_toolchain_file: Started
NOTE: Running task 2319 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_patch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2320 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_unpack: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_unpack: Succeeded
NOTE: recipe gcr-3.40.0-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Succeeded
NOTE: recipe libhandy-1.5.0-r0: task do_fetch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-core-2.44.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2321 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_patch)
NOTE: Running task 2322 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_patch)
NOTE: Running task 2323 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnotify-0.7.9-r0: task do_unpack: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_patch: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_fetch: Started
NOTE: Running task 2324 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_patch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Started
NOTE: recipe libxv-1.0.11-r0: task do_patch: Started
NOTE: recipe webkitgtk-2.36.0-r0: task do_unpack: Started
NOTE: recipe libhandy-1.5.0-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_patch: Started
NOTE: Running task 2325 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_patch)
NOTE: recipe p11-kit-0.24.1-r0: task do_unpack: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_fetch: Succeeded
NOTE: Running task 2326 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2327 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_patch)
NOTE: recipe libwpe-1.12.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2328 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_patch: Started
NOTE: Running task 2329 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_patch)
NOTE: Running task 2330 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_write_config)
NOTE: Running task 2331 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 22db8996b954ad500e98bde8eb5d8f3f9ee45325e3d6ebc87a67531882ff9085
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe enchant2-2.3.3-r0: task do_patch: Started
NOTE: recipe atk-2.38.0-r0: task do_patch: Succeeded
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_unpack: Started
NOTE: Running task 2376 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: Running task 2377 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_patch)
NOTE: Running task 2394 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.50.6-r0: task do_patch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_patch: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_patch: Started
NOTE: recipe libxslt-1.1.35-r0: task do_unpack: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_patch: Started
NOTE: Running task 2416 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2421 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_write_config)
NOTE: Running task 2422 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_deploy_source_date_epoch)
NOTE: Running task 2423 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Succeeded
NOTE: Running task 2424 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe json-glib-1.6.6-r0: task do_patch: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2425 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_patch)
NOTE: Running task 2426 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Started
NOTE: Running task 2427 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2428 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_configure)
NOTE: recipe libnotify-0.7.9-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_patch: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2429 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2430 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_deploy_source_date_epoch)
NOTE: Running task 2431 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.9-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_patch: Succeeded
NOTE: recipe p11-kit-0.24.1-r0: task do_patch: Started
NOTE: Running task 2433 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libwpe-1.12.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_patch: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_write_config: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-4.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2434 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_configure)
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: recipe at-spi2-core-2.44.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2435 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_configure)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_patch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_patch: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_patch: Succeeded
NOTE: Running task 2436 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 2437 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2438 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_unpack)
NOTE: Running task 2439 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_unpack)
NOTE: Running task 2440 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_unpack)
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.50.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2441 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_configure)
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_write_config: Started
NOTE: recipe orc-0.4.32-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2442 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 2447 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_packagedata)
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_unpack: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_patch: Started
NOTE: Running task 2451 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_fetch)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_write_config: Succeeded
NOTE: Running task 2469 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe libtasn1-4.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe p11-kit-0.24.1-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2470 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxv-1.0.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2501 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_patch)
NOTE: recipe fribidi-1.0.11-r0: task do_configure: Started
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe aspell-0.60.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2502 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_patch)
NOTE: Running task 2509 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_write_config)
NOTE: Running task 2510 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2511 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_write_config)
NOTE: Running task 2512 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_deploy_source_date_epoch)
NOTE: recipe orc-0.4.32-r0: task do_write_config: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2513 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_prepare_recipe_sysroot)
NOTE: recipe json-glib-1.6.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_configure: Started
NOTE: recipe libxslt-1.1.35-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_configure: Started
NOTE: Running task 2514 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_write_config)
NOTE: Running task 2515 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 2516 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2517 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_write_config)
NOTE: Running task 2518 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_write_config)
NOTE: Running task 2519 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2520 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2521 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2522 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libtasn1-4.18.0-r0: task do_patch: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2523 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 2524 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gcr-3.40.0-r0: task do_unpack: Started
NOTE: recipe libhandy-1.5.0-r0: task do_unpack: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Started
NOTE: Running task 2525 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_patch: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.56.0-r0: task do_packagedata: Started
NOTE: recipe epiphany-42.2-r0: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2526 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2527 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_configure)
NOTE: recipe epiphany-42.2-r0: task do_fetch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_patch: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_write_config: Started
NOTE: Running task 2528 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_configure)
NOTE: recipe p11-kit-0.24.1-r0: task do_write_config: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxslt-1.1.35-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2529 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe atk-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-4.2.0-r0: task do_unpack: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_write_config: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnotify-0.7.9-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2530 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2531 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.50.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2532 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_write_config: Started
NOTE: recipe libsecret-0.20.5-r0: task do_write_config: Started
NOTE: recipe enchant2-2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_patch: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2533 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_patch)
NOTE: Running task 2534 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_configure)
NOTE: recipe libdazzle-3.44.0-r0: task do_unpack: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_write_config: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_write_config: Succeeded
NOTE: Running task 2535 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_patch)
NOTE: recipe libtasn1-4.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnotify-0.7.9-r0: task do_write_config: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2542 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe json-glib-1.6.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2543 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_configure)
NOTE: recipe libsecret-0.20.5-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_write_config: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcr-3.40.0-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2544 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_configure)
NOTE: recipe libhandy-1.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 2545 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_configure)
NOTE: Running task 2546 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_configure)
NOTE: recipe aspell-0.60.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2547 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_patch)
NOTE: Running task 2548 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_patch)
NOTE: Running task 2549 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_configure)
NOTE: recipe orc-0.4.32-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe p11-kit-0.24.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_patch: Succeeded
NOTE: Running task 2550 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_configure)
NOTE: recipe libwpe-1.12.0-r0: task do_configure: Started
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.0-r0: task do_packagedata: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: Running task 2551 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libsecret-0.20.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_patch: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_patch: Started
NOTE: recipe atk-2.38.0-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Started
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2589 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2590 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_write_config)
NOTE: Running task 2591 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdazzle-3.44.0-r0: task do_patch: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2592 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_configure)
NOTE: recipe libepoxy-1.5.9-r0: task do_configure: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_configure: Started
NOTE: Running task 2593 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe harfbuzz-4.2.0-r0: task do_patch: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_configure: Started
NOTE: Running task 2594 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_configure)
NOTE: recipe libxslt-1.1.35-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_configure: Started
NOTE: Running task 2595 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2596 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_configure)
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gcr-3.40.0-r0: task do_patch: Started
NOTE: recipe orc-0.4.32-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libhandy-1.5.0-r0: task do_patch: Started
NOTE: Running task 2597 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_configure)
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2600 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_unpack)
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_write_config: Started
NOTE: Running task 2621 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_configure)
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: Running task 2644 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_write_config)
NOTE: Running task 2645 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_write_config)
NOTE: Running task 2646 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_write_config)
NOTE: Running task 2647 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_configure: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2732 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_write_config)
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Started
NOTE: recipe libxslt-1.1.35-r0: task do_configure: Started
NOTE: Running task 2814 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_configure)
NOTE: recipe epiphany-42.2-r0: task do_unpack: Started
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Started
NOTE: recipe libhandy-1.5.0-r0: task do_patch: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_write_config: Started
NOTE: recipe gcr-3.40.0-r0: task do_write_config: Started
NOTE: Running task 2816 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libdazzle-3.44.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcr-3.40.0-r0: task do_patch: Succeeded
NOTE: recipe libhandy-1.5.0-r0: task do_write_config: Started
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2817 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe epiphany-42.2-r0: task do_write_config: Started
NOTE: recipe libsecret-0.20.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_write_config: Succeeded
NOTE: Running task 2818 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_configure)
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Started
NOTE: recipe gcr-3.40.0-r0: task do_write_config: Succeeded
NOTE: recipe libhandy-1.5.0-r0: task do_write_config: Succeeded
NOTE: recipe libhandy-1.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe epiphany-42.2-r0: task do_write_config: Succeeded
NOTE: recipe harfbuzz-4.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2819 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_configure)
NOTE: recipe gcr-3.40.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 221777e03b432750d81a3353ee12bea75da31230352399fa97384f965b4130c2
NOTE: recipe libsecret-0.20.5-r0: task do_configure: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-4.2.0-r0: task do_configure: Started
NOTE: recipe libhandy-1.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk+3-3.24.33-r0: task do_unpack: Succeeded
NOTE: Running task 2826 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_patch)
NOTE: recipe gcr-3.40.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2827 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_configure)
NOTE: recipe gtk+3-3.24.33-r0: task do_patch: Started
NOTE: recipe epiphany-42.2-r0: task do_unpack: Succeeded
NOTE: Running task 2828 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_patch)
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_configure: Started
NOTE: recipe epiphany-42.2-r0: task do_patch: Started
NOTE: recipe libwpe-1.12.0-r0: task do_configure: Succeeded
NOTE: Running task 2829 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_compile)
NOTE: recipe gtk+3-3.24.33-r0: task do_patch: Succeeded
NOTE: Running task 2830 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_deploy_source_date_epoch)
NOTE: recipe libwpe-1.12.0-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.33-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe epiphany-42.2-r0: task do_patch: Succeeded
NOTE: Running task 2831 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2832 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_populate_lic)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_configure: Succeeded
NOTE: Running task 2833 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_compile)
NOTE: recipe epiphany-42.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe epiphany-42.2-r0: task do_populate_lic: Started
NOTE: recipe gtk+3-3.24.33-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_compile: Started
NOTE: recipe epiphany-42.2-r0: task do_populate_lic: Succeeded
NOTE: recipe epiphany-42.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_populate_lic unihash changed to 5419e8ff66bfb975b34bd8fdc3be70664192c37a631990aa8d59b0ff4744a987
NOTE: recipe webkitgtk-2.36.0-r0: task do_unpack: Succeeded
NOTE: Running task 2834 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_patch)
NOTE: recipe fribidi-1.0.11-r0: task do_configure: Succeeded
NOTE: recipe webkitgtk-2.36.0-r0: task do_patch: Started
NOTE: Running task 2835 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_compile)
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Succeeded
NOTE: Running task 2836 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe fribidi-1.0.11-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Started
NOTE: recipe libwpe-1.12.0-r0: task do_compile: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_configure: Succeeded
NOTE: Running task 2837 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_install)
NOTE: Running task 2838 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_compile)
NOTE: recipe orc-0.4.32-r0: task do_compile: Started
NOTE: recipe libwpe-1.12.0-r0: task do_install: Started
NOTE: recipe atk-2.38.0-r0: task do_configure: Succeeded
NOTE: Running task 2839 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_compile)
NOTE: recipe libwpe-1.12.0-r0: task do_install: Succeeded
NOTE: Running task 2840 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_populate_sysroot)
NOTE: Running task 2841 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_package)
NOTE: recipe atk-2.38.0-r0: task do_compile: Started
NOTE: recipe libwpe-1.12.0-r0: task do_populate_sysroot: Started
NOTE: recipe libwpe-1.12.0-r0: task do_package: Started
NOTE: recipe webkitgtk-2.36.0-r0: task do_patch: Succeeded
NOTE: Running task 2842 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_generate_toolchain_file)
NOTE: Running task 2843 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.9-r0: task do_configure: Succeeded
NOTE: Running task 2844 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_compile)
NOTE: recipe webkitgtk-2.36.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe webkitgtk-2.36.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_configure: Succeeded
NOTE: Running task 2845 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_compile)
NOTE: recipe libepoxy-1.5.9-r0: task do_compile: Started
NOTE: recipe webkitgtk-2.36.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_configure: Succeeded
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_compile: Started
NOTE: Running task 2846 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_configure_ptest_base)
NOTE: recipe webkitgtk-2.36.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_configure_ptest_base: Started
NOTE: recipe libwpe-1.12.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2847 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_compile)
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_compile: Succeeded
NOTE: Running task 2848 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_install)
NOTE: recipe json-glib-1.6.6-r0: task do_compile: Started
NOTE: recipe libsecret-0.20.5-r0: task do_configure: Succeeded
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_install: Started
NOTE: Running task 2849 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_compile)
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Succeeded
NOTE: Running task 2850 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe libsecret-0.20.5-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Started
NOTE: recipe fribidi-1.0.11-r0: task do_compile: Succeeded
NOTE: Running task 2851 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_install)
NOTE: recipe fribidi-1.0.11-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 2852 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_compile: Succeeded
NOTE: Running task 2853 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_install: Succeeded
NOTE: Running task 2854 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_package)
NOTE: Running task 2855 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_populate_sysroot)
NOTE: recipe orc-0.4.32-r0: task do_compile: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_install: Started
NOTE: Running task 2856 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_install)
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_package: Started
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_populate_sysroot: Started
NOTE: recipe orc-0.4.32-r0: task do_install: Started
NOTE: recipe fribidi-1.0.11-r0: task do_install: Succeeded
NOTE: Running task 2857 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_populate_sysroot)
NOTE: Running task 2858 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_install: Succeeded
NOTE: Running task 2859 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_populate_sysroot)
NOTE: Running task 2860 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_package)
NOTE: recipe fribidi-1.0.11-r0: task do_populate_sysroot: Started
NOTE: recipe libwpe-1.12.0-r0: task do_package: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_package: Started
NOTE: Running task 2861 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_package: Started
NOTE: recipe libwpe-1.12.0-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 2862 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_install: Succeeded
NOTE: Running task 2863 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: Running task 2864 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: recipe fribidi-1.0.11-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2865 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_populate_sysroot)
NOTE: Running task 2866 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_package)
NOTE: recipe libwpe-1.12.0-r0: task do_packagedata: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Started
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Started
NOTE: recipe orc-0.4.32-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 2867 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: Running task 2868 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: recipe harfbuzz-4.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2869 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_compile: Started
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2870 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_package: Succeeded
NOTE: Running task 2871 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_packagedata)
NOTE: recipe atk-2.38.0-r0: task do_compile: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_packagedata: Started
NOTE: Running task 2872 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2873 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_configure)
NOTE: recipe atk-2.38.0-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_configure: Succeeded
NOTE: Running task 2874 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_configure_ptest_base)
NOTE: recipe fribidi-1.0.11-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2875 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_compile)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_compile: Started
NOTE: recipe atk-2.38.0-r0: task do_install: Succeeded
NOTE: Running task 2876 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_populate_sysroot)
NOTE: Running task 2877 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_package)
NOTE: recipe atk-2.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_package: Succeeded
NOTE: Running task 2878 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_packagedata)
NOTE: recipe atk-2.38.0-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata: Started
NOTE: recipe orc-0.4.32-r0: task do_package: Succeeded
NOTE: Running task 2879 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_compile: Succeeded
NOTE: Running task 2880 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2881 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_compile_ptest_base)
NOTE: recipe orc-0.4.32-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe json-glib-1.6.6-r0: task do_compile_ptest_base: Started
NOTE: recipe atk-2.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2882 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_install)
NOTE: recipe json-glib-1.6.6-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_packagedata: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_install: Succeeded
NOTE: Running task 2883 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_install_ptest_base)
NOTE: recipe libsecret-0.20.5-r0: task do_compile: Succeeded
NOTE: Running task 2884 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_install)
NOTE: recipe json-glib-1.6.6-r0: task do_install_ptest_base: Started
NOTE: recipe libsecret-0.20.5-r0: task do_install: Started
NOTE: recipe json-glib-1.6.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2885 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_populate_sysroot)
NOTE: Running task 2886 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_package)
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot: Started
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_package: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_package: Started
NOTE: Running task 2887 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_packagedata)
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_packagedata: Started
NOTE: recipe libsecret-0.20.5-r0: task do_install: Succeeded
NOTE: Running task 2888 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_populate_sysroot)
NOTE: Running task 2889 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_package)
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_populate_sysroot: Started
NOTE: recipe libsecret-0.20.5-r0: task do_package: Started
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2890 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_package_write_rpm)
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_package_write_rpm: Started
NOTE: recipe libsecret-0.20.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_configure: Succeeded
NOTE: Running task 2891 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2892 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_configure: Succeeded
NOTE: Running task 2893 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_compile)
NOTE: recipe libxft-1_2.3.4-r0: task do_compile: Started
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Succeeded
NOTE: Running task 2894 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_configure: Succeeded
NOTE: Running task 2895 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe libwebp-1.2.2-r0: task do_compile: Started
NOTE: Running task 2896 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe aspell-0.60.8-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Succeeded
NOTE: Running task 2897 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_compile)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_configure: Succeeded
NOTE: Running task 2898 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_compile)
NOTE: recipe libxv-1.0.11-r0: task do_configure: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Started
NOTE: Running task 2899 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_compile)
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2900 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_compile)
NOTE: Running task 2901 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe libxv-1.0.11-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.8-r0: task do_configure: Succeeded
NOTE: Running task 2902 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_compile)
NOTE: recipe libxft-1_2.3.4-r0: task do_compile: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_compile: Started
NOTE: Running task 2903 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_install)
NOTE: recipe libxft-1_2.3.4-r0: task do_install: Started
NOTE: recipe atk-2.38.0-r0: task do_package: Succeeded
NOTE: Running task 2904 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 2905 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe atk-2.38.0-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2906 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_install)
NOTE: Running task 2907 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_package_write_rpm)
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_package_write_rpm: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_install: Succeeded
NOTE: Running task 2908 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_populate_sysroot)
NOTE: Running task 2909 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_package)
NOTE: recipe libxv-1.0.11-r0: task do_compile: Succeeded
NOTE: Running task 2910 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_install)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_populate_sysroot: Started
NOTE: Running task 2911 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_install)
NOTE: recipe libxslt-1.1.35-r0: task do_configure: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_package: Started
NOTE: Running task 2912 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_compile)
NOTE: recipe libxv-1.0.11-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Started
NOTE: Running task 2913 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot)
NOTE: Running task 2914 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package)
NOTE: recipe libxslt-1.1.35-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_compile: Succeeded
NOTE: Running task 2915 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 2916 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Started
NOTE: Running task 2917 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe atk-2.38.0-r0: task do_packagedata: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe libxi-1_1.8-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_install: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2918 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_populate_sysroot)
NOTE: Running task 2919 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_package)
NOTE: Running task 2920 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 2921 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_package)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot: Started
NOTE: recipe libxv-1.0.11-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2922 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2923 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.8-r0: task do_install: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2924 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_populate_sysroot)
NOTE: Running task 2925 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_package)
NOTE: Running task 2926 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2927 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe libxi-1_1.8-r0: task do_package: Started
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_package: Succeeded
NOTE: Running task 2928 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_packagedata)
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_package: Succeeded
NOTE: Running task 2929 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_compile)
NOTE: Running task 2930 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_packagedata)
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Started
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata: Started
NOTE: recipe libsecret-0.20.5-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2931 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2932 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_compile)
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_package: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_compile: Started
NOTE: Running task 2933 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_packagedata)
NOTE: Running task 2934 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_packagedata: Started
NOTE: Running task 2935 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2936 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Started
NOTE: recipe libsecret-0.20.5-r0: task do_packagedata: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_packagedata: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_compile: Succeeded
NOTE: Running task 2937 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_install)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_package: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2938 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata)
NOTE: Running task 2939 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.9-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe libxv-1.0.11-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_packagedata: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2940 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_install)
NOTE: recipe libxi-1_1.8-r0: task do_package: Succeeded
NOTE: Running task 2941 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.9-r0: task do_install: Succeeded
NOTE: Running task 2942 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_populate_sysroot)
NOTE: recipe libxslt-1.1.35-r0: task do_compile: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_compile: Succeeded
NOTE: Running task 2943 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_package)
NOTE: Running task 2944 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_compile_ptest_base)
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Started
NOTE: Running task 2945 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_install)
NOTE: recipe libxi-1_1.8-r0: task do_packagedata: Started
NOTE: recipe aspell-0.60.8-r0: task do_compile: Succeeded
NOTE: Running task 2946 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_install)
NOTE: recipe libepoxy-1.5.9-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_compile_ptest_base: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_package: Started
NOTE: recipe libxslt-1.1.35-r0: task do_install: Started
NOTE: recipe aspell-0.60.8-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2947 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_install)
NOTE: recipe libxi-1_1.8-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_install: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2948 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 2949 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_package)
NOTE: recipe libepoxy-1.5.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2950 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxslt-1.1.35-r0: task do_install: Succeeded
NOTE: Running task 2951 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_populate_sysroot)
NOTE: Running task 2952 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_package)
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_install: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_populate_sysroot: Started
NOTE: Running task 2953 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_populate_sysroot)
NOTE: Running task 2954 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_package)
NOTE: recipe libxslt-1.1.35-r0: task do_package: Started
NOTE: recipe aspell-0.60.8-r0: task do_populate_sysroot: Started
NOTE: recipe aspell-0.60.8-r0: task do_package: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2955 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_configure)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_configure: Started
NOTE: recipe libxslt-1.1.35-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_install: Succeeded
NOTE: Running task 2956 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_install_ptest_base)
NOTE: recipe aspell-0.60.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2957 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_compile: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2958 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_package: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_compile: Succeeded
NOTE: Running task 2959 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_populate_sysroot)
NOTE: Running task 2960 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_package)
NOTE: Running task 2961 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_packagedata)
NOTE: Running task 2962 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_install)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_populate_sysroot: Started
NOTE: Running task 2963 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_install)
NOTE: recipe libepoxy-1.5.9-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_package: Started
NOTE: recipe libwebp-1.2.2-r0: task do_install: Started
NOTE: recipe enchant2-2.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2964 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_configure)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_install: Started
NOTE: recipe enchant2-2.3.3-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2965 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnotify-0.7.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.2.2-r0: task do_install: Succeeded
NOTE: Running task 2966 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_populate_sysroot)
NOTE: Running task 2967 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_package)
NOTE: recipe libwebp-1.2.2-r0: task do_package: Started
NOTE: recipe libwebp-1.2.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_package: Succeeded
NOTE: Running task 2968 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_packagedata)
NOTE: Running task 2969 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_install: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_configure: Succeeded
NOTE: Running task 2970 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_install_ptest_base)
NOTE: Running task 2971 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_compile)
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe libpsl-0.21.1-r0: task do_compile: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_packagedata: Started
NOTE: Running task 2972 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_install)
NOTE: recipe libwebp-1.2.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_install_ptest_base: Started
NOTE: recipe libpsl-0.21.1-r0: task do_install: Started
NOTE: recipe libnotify-0.7.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2973 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_configure)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2974 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_populate_sysroot)
NOTE: Running task 2975 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_package)
NOTE: recipe libnotify-0.7.9-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_package: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: Running task 2976 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_compile)
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Started
NOTE: recipe libpsl-0.21.1-r0: task do_install: Succeeded
NOTE: Running task 2977 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_populate_sysroot)
NOTE: Running task 2978 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_package)
NOTE: recipe libtasn1-4.18.0-r0: task do_configure: Succeeded
NOTE: Running task 2979 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_compile)
NOTE: recipe libpsl-0.21.1-r0: task do_package: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_compile: Started
NOTE: recipe libpsl-0.21.1-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_compile: Succeeded
NOTE: Running task 2980 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_install)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_install: Started
NOTE: recipe libpsl-0.21.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2981 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe aspell-0.60.8-r0: task do_package: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 2982 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_compile: Succeeded
NOTE: Running task 2983 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_packagedata)
NOTE: Running task 2984 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_install)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe aspell-0.60.8-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_install: Started
NOTE: recipe libwebp-1.2.2-r0: task do_package: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_install: Succeeded
NOTE: Running task 2985 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_populate_sysroot)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2986 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_package)
NOTE: Running task 2987 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_configure)
NOTE: Running task 2988 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_packagedata)
NOTE: recipe libpsl-0.21.1-r0: task do_package: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_populate_sysroot: Started
NOTE: Running task 2989 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_packagedata)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_package: Started
NOTE: recipe libwebp-1.2.2-r0: task do_packagedata: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.1-r0: task do_packagedata: Started
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Succeeded
NOTE: Running task 2990 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_install)
NOTE: recipe libnotify-0.7.9-r0: task do_configure: Succeeded
NOTE: Running task 2991 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_compile)
NOTE: recipe aspell-0.60.8-r0: task do_packagedata: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_install: Started
NOTE: recipe libwebp-1.2.2-r0: task do_packagedata: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_compile: Started
NOTE: recipe libpsl-0.21.1-r0: task do_packagedata: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_install: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_install: Succeeded
NOTE: Running task 2992 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 2993 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package)
NOTE: Running task 2994 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_populate_sysroot)
NOTE: Running task 2995 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_package)
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 2996 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 2997 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 2998 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_package: Succeeded
NOTE: Running task 2999 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_packagedata)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_configure: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_package: Succeeded
NOTE: Running task 3000 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_compile)
NOTE: Running task 3001 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_compile: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Started
NOTE: Running task 3002 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_compile)
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_package: Succeeded
NOTE: Running task 3003 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 3004 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_install)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 3005 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 3006 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package)
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 3007 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_package: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_compile: Succeeded
NOTE: Running task 3008 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3009 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_packagedata)
NOTE: Running task 3010 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.44.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_compile: Succeeded
NOTE: Running task 3011 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_install)
NOTE: recipe libtasn1-4.18.0-r0: task do_install: Started
NOTE: recipe libnotify-0.7.9-r0: task do_install: Succeeded
NOTE: Running task 3012 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_populate_sysroot)
NOTE: recipe libnotify-0.7.9-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-core-2.44.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3013 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_configure)
NOTE: Running task 3014 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_package)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_package: Started
NOTE: Running task 3015 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe libnotify-0.7.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_install: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3016 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_populate_sysroot)
NOTE: Running task 3017 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_package)
NOTE: recipe libtasn1-4.18.0-r0: task do_populate_sysroot: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3018 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe p11-kit-0.24.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3019 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_configure)
NOTE: recipe p11-kit-0.24.1-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_package: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_package: Succeeded
NOTE: Running task 3020 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_packagedata)
NOTE: Running task 3021 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_packagedata)
NOTE: recipe libtasn1-4.18.0-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_packagedata: Started
NOTE: recipe libnotify-0.7.9-r0: task do_package: Succeeded
NOTE: Running task 3022 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_packagedata)
NOTE: recipe libnotify-0.7.9-r0: task do_packagedata: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_packagedata: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_packagedata: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_compile: Succeeded
NOTE: Running task 3023 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_install)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_configure: Succeeded
NOTE: Running task 3024 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_compile)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.44.0-r0: task do_compile: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_install: Succeeded
NOTE: Running task 3025 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_populate_sysroot)
NOTE: Running task 3026 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_package)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_package: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_populate_sysroot: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe p11-kit-0.24.1-r0: task do_configure: Succeeded
NOTE: Running task 3027 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_compile)
NOTE: recipe p11-kit-0.24.1-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.44.0-r0: task do_compile: Succeeded
NOTE: Running task 3028 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_install)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_install: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_package: Succeeded
NOTE: Running task 3029 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_install: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_packagedata: Started
NOTE: Running task 3030 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_populate_sysroot)
NOTE: Running task 3031 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_package)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.44.0-r0: task do_package: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-core-2.44.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3032 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3033 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_install)
NOTE: recipe harfbuzz-4.2.0-r0: task do_install: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3034 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_configure)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_install: Succeeded
NOTE: Running task 3035 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_populate_sysroot)
NOTE: Running task 3036 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_package)
NOTE: recipe harfbuzz-4.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_package: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3037 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Succeeded
NOTE: Running task 3038 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_compile)
NOTE: recipe pango-1.50.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3039 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_configure)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Started
NOTE: recipe pango-1.50.6-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.44.0-r0: task do_package: Succeeded
NOTE: Running task 3040 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_packagedata)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Succeeded
NOTE: Running task 3041 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_install)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.44.0-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Succeeded
NOTE: Running task 3042 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_populate_sysroot)
NOTE: Running task 3043 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_package: Succeeded
NOTE: Running task 3044 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_packagedata)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe harfbuzz-4.2.0-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Succeeded
NOTE: Running task 3045 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_packagedata)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.6-r0: task do_configure: Succeeded
NOTE: Running task 3046 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_configure_ptest_base)
NOTE: recipe pango-1.50.6-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.50.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3047 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_compile)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Succeeded
NOTE: recipe pango-1.50.6-r0: task do_compile: Started
NOTE: recipe enchant2-2.3.3-r0: task do_configure: Succeeded
NOTE: Running task 3048 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_compile)
NOTE: recipe enchant2-2.3.3-r0: task do_compile: Started
NOTE: recipe enchant2-2.3.3-r0: task do_compile: Succeeded
NOTE: Running task 3049 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_install)
NOTE: recipe enchant2-2.3.3-r0: task do_install: Started
NOTE: recipe enchant2-2.3.3-r0: task do_install: Succeeded
NOTE: Running task 3050 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_populate_sysroot)
NOTE: Running task 3051 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_package)
NOTE: recipe enchant2-2.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe enchant2-2.3.3-r0: task do_package: Started
NOTE: recipe enchant2-2.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_package: Succeeded
NOTE: Running task 3052 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_packagedata)
NOTE: recipe enchant2-2.3.3-r0: task do_packagedata: Started
NOTE: recipe enchant2-2.3.3-r0: task do_packagedata: Succeeded
NOTE: recipe p11-kit-0.24.1-r0: task do_compile: Succeeded
NOTE: Running task 3053 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_install)
NOTE: recipe p11-kit-0.24.1-r0: task do_install: Started
NOTE: recipe pango-1.50.6-r0: task do_compile: Succeeded
NOTE: Running task 3054 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_compile_ptest_base)
NOTE: recipe pango-1.50.6-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.50.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3055 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_install)
NOTE: recipe p11-kit-0.24.1-r0: task do_install: Succeeded
NOTE: Running task 3056 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_populate_sysroot)
NOTE: Running task 3057 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_package)
NOTE: recipe pango-1.50.6-r0: task do_install: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_populate_sysroot: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_package: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pango-1.50.6-r0: task do_install: Succeeded
NOTE: Running task 3058 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_install_ptest_base)
NOTE: recipe pango-1.50.6-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.50.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3059 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_populate_sysroot)
NOTE: Running task 3060 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_package)
NOTE: recipe pango-1.50.6-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.50.6-r0: task do_package: Started
NOTE: recipe pango-1.50.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3061 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3062 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.33-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3063 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.33-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3064 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_configure)
NOTE: recipe gtk+3-3.24.33-r0: task do_configure: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_package: Succeeded
NOTE: Running task 3065 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_packagedata)
NOTE: recipe p11-kit-0.24.1-r0: task do_packagedata: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_packagedata: Succeeded
NOTE: recipe pango-1.50.6-r0: task do_package: Succeeded
NOTE: Running task 3066 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_packagedata)
NOTE: recipe pango-1.50.6-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.6-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_configure: Succeeded
NOTE: Running task 3067 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_compile: Succeeded
NOTE: Running task 3068 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_install: Succeeded
NOTE: Running task 3069 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_populate_sysroot)
NOTE: Running task 3070 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.33-r0: task do_configure: Succeeded
NOTE: Running task 3071 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_compile)
NOTE: recipe gtk+3-3.24.33-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_package: Succeeded
NOTE: Running task 3072 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_packagedata: Succeeded
NOTE: recipe gtk+3-3.24.33-r0: task do_compile: Succeeded
NOTE: Running task 3073 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_install)
NOTE: recipe gtk+3-3.24.33-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.33-r0: task do_install: Succeeded
NOTE: Running task 3074 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_populate_sysroot)
NOTE: Running task 3075 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_package)
NOTE: recipe gtk+3-3.24.33-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.33-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.33-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3076 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3077 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3078 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3079 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gcr-3.40.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libhandy-1.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe webkitgtk-2.36.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libhandy-1.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3084 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_configure)
NOTE: recipe libdazzle-3.44.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3085 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_configure)
NOTE: recipe libhandy-1.5.0-r0: task do_configure: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_configure: Started
NOTE: recipe webkitgtk-2.36.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3086 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_configure)
NOTE: recipe gcr-3.40.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3087 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_configure)
NOTE: recipe webkitgtk-2.36.0-r0: task do_configure: Started
NOTE: recipe gcr-3.40.0-r0: task do_configure: Started
NOTE: recipe libhandy-1.5.0-r0: task do_configure: Succeeded
NOTE: Running task 3088 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_compile)
NOTE: recipe libhandy-1.5.0-r0: task do_compile: Started
NOTE: recipe gcr-3.40.0-r0: task do_configure: Succeeded
NOTE: Running task 3089 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_compile)
NOTE: recipe libdazzle-3.44.0-r0: task do_configure: Succeeded
NOTE: Running task 3090 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_compile)
NOTE: recipe gcr-3.40.0-r0: task do_compile: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.33-r0: task do_package: Succeeded
NOTE: Running task 3091 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.33-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.33-r0: task do_packagedata: Succeeded
NOTE: recipe libhandy-1.5.0-r0: task do_compile: Succeeded
NOTE: Running task 3095 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_install)
NOTE: recipe libhandy-1.5.0-r0: task do_install: Started
NOTE: recipe libhandy-1.5.0-r0: task do_install: Succeeded
NOTE: Running task 3096 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_populate_sysroot)
NOTE: Running task 3097 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_package)
NOTE: recipe libhandy-1.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe libhandy-1.5.0-r0: task do_package: Started
NOTE: recipe libhandy-1.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_compile: Succeeded
NOTE: Running task 3098 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_install)
NOTE: recipe libdazzle-3.44.0-r0: task do_install: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_install: Succeeded
NOTE: Running task 3099 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_populate_sysroot)
NOTE: Running task 3100 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_package)
NOTE: recipe libdazzle-3.44.0-r0: task do_populate_sysroot: Started
NOTE: recipe gcr-3.40.0-r0: task do_compile: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_package: Started
NOTE: Running task 3101 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_install)
NOTE: recipe gcr-3.40.0-r0: task do_install: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gcr-3.40.0-r0: task do_install: Succeeded
NOTE: Running task 3102 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_populate_sysroot)
NOTE: Running task 3103 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_package)
NOTE: recipe gcr-3.40.0-r0: task do_populate_sysroot: Started
NOTE: recipe gcr-3.40.0-r0: task do_package: Started
NOTE: recipe libhandy-1.5.0-r0: task do_package: Succeeded
NOTE: Running task 3104 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_packagedata)
NOTE: recipe libhandy-1.5.0-r0: task do_packagedata: Started
NOTE: recipe gcr-3.40.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libhandy-1.5.0-r0: task do_packagedata: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_package: Succeeded
NOTE: Running task 3105 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_packagedata)
NOTE: recipe libdazzle-3.44.0-r0: task do_packagedata: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_packagedata: Succeeded
NOTE: recipe gcr-3.40.0-r0: task do_package: Succeeded
NOTE: Running task 3106 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_packagedata)
NOTE: recipe gcr-3.40.0-r0: task do_packagedata: Started
NOTE: recipe gcr-3.40.0-r0: task do_packagedata: Succeeded
NOTE: recipe webkitgtk-2.36.0-r0: task do_configure: Succeeded
NOTE: Running task 3107 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_compile)
NOTE: recipe webkitgtk-2.36.0-r0: task do_compile: Started
Bitbake still alive (no events for 600s). Active tasks:
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_compile
NOTE: recipe webkitgtk-2.36.0-r0: task do_compile: Succeeded
NOTE: Running task 3108 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_install)
NOTE: recipe webkitgtk-2.36.0-r0: task do_install: Started
NOTE: recipe webkitgtk-2.36.0-r0: task do_install: Succeeded
NOTE: Running task 3109 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_populate_sysroot)
NOTE: Running task 3110 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_package)
NOTE: recipe webkitgtk-2.36.0-r0: task do_populate_sysroot: Started
NOTE: recipe webkitgtk-2.36.0-r0: task do_package: Started
NOTE: recipe webkitgtk-2.36.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3111 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe epiphany-42.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe epiphany-42.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3112 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_configure)
NOTE: recipe epiphany-42.2-r0: task do_configure: Started
NOTE: recipe epiphany-42.2-r0: task do_configure: Succeeded
NOTE: Running task 3113 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_compile)
NOTE: recipe epiphany-42.2-r0: task do_compile: Started
NOTE: recipe epiphany-42.2-r0: task do_compile: Succeeded
NOTE: Running task 3114 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_install)
NOTE: recipe epiphany-42.2-r0: task do_install: Started
NOTE: recipe epiphany-42.2-r0: task do_install: Succeeded
NOTE: Running task 3115 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_populate_sysroot)
NOTE: recipe epiphany-42.2-r0: task do_populate_sysroot: Started
NOTE: recipe epiphany-42.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe webkitgtk-2.36.0-r0: task do_package: Succeeded
NOTE: Running task 3116 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_packagedata)
NOTE: recipe webkitgtk-2.36.0-r0: task do_packagedata: Started
NOTE: recipe webkitgtk-2.36.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3117 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_package)
NOTE: recipe epiphany-42.2-r0: task do_package: Started
NOTE: recipe epiphany-42.2-r0: task do_package: Succeeded
NOTE: Running task 3118 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_packagedata)
NOTE: recipe epiphany-42.2-r0: task do_packagedata: Started
NOTE: recipe epiphany-42.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3119 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_package_write_rpm)
NOTE: Running task 3120 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_package_qa)
NOTE: recipe epiphany-42.2-r0: task do_package_write_rpm: Started
NOTE: recipe epiphany-42.2-r0: task do_package_qa: Started
NOTE: recipe epiphany-42.2-r0: task do_package_qa: Succeeded
NOTE: recipe epiphany-42.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3121 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_build)
NOTE: Tasks Summary: Attempted 3121 tasks of which 2577 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: vala-0.56.0-r0 do_packagedata_setscene: QA Issue: Package version for package vala-src went backwards which would break package feeds (from 0:0.56.1-r0 to 0:0.56.0-r0) [version-going-backwards]
ERROR: vala-0.56.0-r0 do_packagedata_setscene: QA Issue: Package version for package vala-dbg went backwards which would break package feeds (from 0:0.56.1-r0 to 0:0.56.0-r0) [version-going-backwards]
ERROR: vala-0.56.0-r0 do_packagedata_setscene: QA Issue: Package version for package vala-staticdev went backwards which would break package feeds (from 0:0.56.1-r0 to 0:0.56.0-r0) [version-going-backwards]
ERROR: vala-0.56.0-r0 do_packagedata_setscene: QA Issue: Package version for package vala-dev went backwards which would break package feeds (from 0:0.56.1-r0 to 0:0.56.0-r0) [version-going-backwards]
ERROR: vala-0.56.0-r0 do_packagedata_setscene: QA Issue: Package version for package vala-doc went backwards which would break package feeds (from 0:0.56.1-r0 to 0:0.56.0-r0) [version-going-backwards]
ERROR: vala-0.56.0-r0 do_packagedata_setscene: QA Issue: Package version for package vala-locale went backwards which would break package feeds (from 0:0.56.1-r0 to 0:0.56.0-r0) [version-going-backwards]
ERROR: vala-0.56.0-r0 do_packagedata_setscene: QA Issue: Package version for package vala went backwards which would break package feeds (from 0:0.56.1-r0 to 0:0.56.0-r0) [version-going-backwards]
ERROR: vala-0.56.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3111540461775897567==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/epiphany/epiphany-dbg: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-dbg: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-dbg: PKGSIZE changed from 4269800 to 4269152 (-0%)
packages/core2-32-poky-linux/epiphany/epiphany-dev: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-dev: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-doc: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-doc: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-af: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-af: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-am: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-am: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-an: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-an: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ar: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ar: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-as: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-as: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ast: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ast: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-az: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-az: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-be+latin: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-be+latin: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-be: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-be: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-bg: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-bg: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-bn-in: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-bn-in: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-bn: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-bn: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-br: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-br: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-bs: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-bs: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ca+valencia: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ca+valencia: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ca: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ca: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ckb: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ckb: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-cs: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-cs: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-cy: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-cy: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-da: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-da: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-de: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-de: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-dz: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-dz: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-el: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-el: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-el: PKGSIZE changed from 117336 to 117611 (+0%)
packages/core2-32-poky-linux/epiphany/epiphany-locale-en+shaw: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-en+shaw: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-en-ca: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-en-ca: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-en-gb: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-en-gb: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-en-gb: PKGSIZE changed from 78764 to 79896 (+1%)
packages/core2-32-poky-linux/epiphany/epiphany-locale-eo: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-eo: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-es: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-es: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-et: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-et: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-eu: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-eu: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-eu: PKGSIZE changed from 84879 to 84683 (-0%)
packages/core2-32-poky-linux/epiphany/epiphany-locale-fa: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-fa: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-fi: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-fi: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-fr: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-fr: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-fur: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-fur: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-fy: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-fy: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ga: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ga: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-gl: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-gl: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-gu: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-gu: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-gv: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-gv: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-he: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-he: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-hi: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-hi: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-hr: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-hr: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-hr: PKGSIZE changed from 83586 to 83406 (-0%)
packages/core2-32-poky-linux/epiphany/epiphany-locale-hu: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-hu: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-hy: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-hy: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-id: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-id: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ig: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ig: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-is: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-is: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-it: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-it: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ja: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ja: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ka: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ka: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-kk: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-kk: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-km: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-km: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-kn: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-kn: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ko: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ko: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ku: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ku: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-li: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-li: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-lt: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-lt: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-lv: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-lv: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-mai: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-mai: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-mg: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-mg: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-mi: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-mi: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-mk: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-mk: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ml: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ml: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-mn: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-mn: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-mr: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-mr: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ms: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ms: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-nb: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-nb: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-nds: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-nds: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ne: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ne: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-nl: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-nl: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-nl: PKGSIZE changed from 84402 to 85531 (+1%)
packages/core2-32-poky-linux/epiphany/epiphany-locale-nn: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-nn: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-oc: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-oc: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-or: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-or: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-pa: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-pa: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-pl: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-pl: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ps: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ps: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-pt-br: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-pt-br: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-pt: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-pt: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-pt: PKGSIZE changed from 85276 to 85466 (+0%)
packages/core2-32-poky-linux/epiphany/epiphany-locale-ro: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ro: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ru: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ru: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-rw: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-rw: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-si: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-si: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-sk: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-sk: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-sl: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-sl: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-sq: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-sq: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-sr+latin: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-sr+latin: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-sr: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-sr: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-sv: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-sv: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ta: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ta: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-te: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-te: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-tg: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-tg: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-th: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-th: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-tk: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-tk: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-tr: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-tr: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-tr: PKGSIZE changed from 85091 to 84886 (-0%)
packages/core2-32-poky-linux/epiphany/epiphany-locale-ug: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ug: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-uk: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-uk: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-uz+cyrillic: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-uz+cyrillic: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-uz: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-uz: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-vi: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-vi: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-wa: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-wa: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-yo: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-yo: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-zh-cn: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-zh-cn: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-zh-hk: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-zh-hk: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-zh-tw: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-locale-zh-tw: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-src: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-src: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany-src: PKGSIZE changed from 26613661 to 26612666 (-0%)
packages/core2-32-poky-linux/epiphany/epiphany-staticdev: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany-staticdev: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany/epiphany: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany/epiphany: PKGSIZE changed from 5665609 to 5665998 (+0%)
packages/core2-32-poky-linux/epiphany: PV changed from "42.0" to "42.2"
packages/core2-32-poky-linux/epiphany: PKGV changed from 42.0 [default] to 42.2 [default]
packages/core2-32-poky-linux/epiphany: SRC_URI changed from "https://download.gnome.org/sources//epiphany/42/epiphany-42.0.tar.xz;name=archive file://0002-help-meson.build-disable-the-use-of-yelp.patch file://migrator.patch file://distributor.patch" to "https://download.gnome.org/sources//epiphany/42/epiphany-42.2.tar.xz;name=archive file://0002-help-meson.build-disable-the-use-of-yelp.patch file://migrator.patch file://distributor.patch"

--===============3111540461775897567==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1642 targets, 63 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-ed8181b2f5a2b54f8551c847a8333441988f2cd3"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ed8181b2f5a2b54f8551c847a8333441988f2cd3"
workspace            = "master:9e556960421c8bbe8851d9810352a5b4bd3b50df"

Initialising tasks...done.
Sstate summary: Wanted 208 Local 24 Mirrors 0 Missed 184 Current 659 (11% match, 78% complete)
Removing 4 stale sstate objects for arch qemumips...done.
Removing 1 stale sstate objects for arch mips32r2...done.
NOTE: Executing Tasks
NOTE: Running setscene task 683 of 867 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_41.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 689 of 867 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 713 of 867 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 752 of 867 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 829 of 867 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 830 of 867 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.9.0.bb:do_packagedata_setscene)
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe adwaita-icon-theme-41.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe iso-codes-4.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: recipe adwaita-icon-theme-41.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/vala/0.56.0-r0/temp/log.do_packagedata_setscene.2114317
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 866 of 867 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_package_setscene)
NOTE: recipe vala-0.56.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe iso-codes-4.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1390 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_fetch)
NOTE: Running task 1430 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1530 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: Running task 1537 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_fetch)
NOTE: Running task 1559 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_fetch)
NOTE: Running task 1565 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_fetch)
NOTE: Running task 1566 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_fetch)
NOTE: Running task 1572 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_fetch)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 1749 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_fetch)
NOTE: Running task 1760 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_unpack)
NOTE: Running task 1761 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1766 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: Running task 1768 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_write_config)
NOTE: Running task 1779 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_write_config)
NOTE: Running task 1780 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_write_config)
NOTE: Running task 1781 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_write_config)
NOTE: Running task 1782 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_fetch)
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Started
NOTE: Running task 1843 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_fetch)
NOTE: recipe libxft-1_2.3.4-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.11-r0: task do_fetch: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_fetch: Started
NOTE: Running task 1858 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_fetch)
NOTE: Running task 1872 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_fetch)
NOTE: Running task 1873 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_fetch)
NOTE: Running task 1875 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_fetch)
NOTE: Running task 1880 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_write_config)
NOTE: Running task 1882 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_fetch)
NOTE: Running task 1883 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_fetch)
NOTE: Running task 1895 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_fetch)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_fetch: Succeeded
NOTE: Running task 1898 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_write_config)
NOTE: Running task 1899 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: recipe harfbuzz-4.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_fetch: Succeeded
NOTE: Running task 1906 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_fetch)
NOTE: recipe fribidi-1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 1953 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_fetch)
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.50.6-r0: task do_fetch: Started
NOTE: recipe vala-0.56.0-r0: task do_package_setscene: Started
NOTE: recipe pango-1.50.6-r0: task do_fetch: Succeeded
NOTE: Running task 1971 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_unpack)
NOTE: Running task 1972 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: Running task 1973 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_unpack)
NOTE: Running task 1974 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_unpack)
NOTE: Running task 1975 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_unpack)
NOTE: Running task 1976 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_unpack)
NOTE: Running task 1977 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.8-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_unpack: Started
NOTE: Running task 1978 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_write_config: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_write_config: Started
NOTE: recipe fribidi-1.0.11-r0: task do_write_config: Started
NOTE: recipe pango-1.50.6-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_fetch: Started
NOTE: Running task 1979 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_fetch: Succeeded
NOTE: Running task 1980 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.8-r0: task do_fetch: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_fetch: Started
NOTE: recipe atk-2.38.0-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.44.0-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.44.0-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_fetch: Started
NOTE: Running task 1981 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_unpack)
NOTE: Running task 1982 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_unpack)
NOTE: recipe libepoxy-1.5.9-r0: task do_fetch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Started
NOTE: Running task 1983 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_unpack)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_write_config: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Succeeded
NOTE: Running task 1984 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe json-glib-1.6.6-r0: task do_fetch: Started
NOTE: recipe atk-2.38.0-r0: task do_write_config: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_write_config: Succeeded
NOTE: recipe harfbuzz-4.2.0-r0: task do_write_config: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_write_config: Succeeded
NOTE: recipe pango-1.50.6-r0: task do_write_config: Succeeded
NOTE: Running task 1985 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.33-r0: task do_fetch: Started
NOTE: recipe libwpe-1.12.0-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_unpack: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_fetch: Succeeded
NOTE: Running task 1986 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_unpack)
NOTE: Running task 1987 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_unpack)
NOTE: Running task 1988 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_unpack)
NOTE: Running task 1989 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.33-r0: task do_fetch: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_unpack: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_unpack: Started
NOTE: Running task 1990 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_patch)
NOTE: Running task 1991 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_unpack)
NOTE: Running task 1992 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_unpack)
NOTE: recipe libxft-1_2.3.4-r0: task do_unpack: Started
NOTE: Running task 1993 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_unpack)
NOTE: Running task 1994 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_write_config: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 1995 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_unpack)
NOTE: recipe atk-2.38.0-r0: task do_write_config: Succeeded
NOTE: recipe pango-1.50.6-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2008 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_unpack)
NOTE: Running task 2011 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_write_config)
NOTE: recipe harfbuzz-4.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2020 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_write_config)
NOTE: Running task 2021 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.4-r0: task do_unpack: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2023 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_fetch)
NOTE: Running task 2024 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_unpack)
NOTE: Running task 2026 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_patch)
NOTE: Running task 2029 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.8-r0: task do_unpack: Started
NOTE: recipe atk-2.38.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_unpack: Started
NOTE: Running task 2033 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_fetch)
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.44.0-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Started
NOTE: recipe atk-2.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Started
NOTE: Running task 2049 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_write_config)
NOTE: Running task 2050 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe json-glib-1.6.6-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Started
NOTE: Running task 2059 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_write_config)
NOTE: recipe libxi-1_1.8-r0: task do_unpack: Succeeded
NOTE: Running task 2060 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_unpack: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 2061 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_patch)
NOTE: Running task 2063 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2064 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 2065 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_patch)
NOTE: Running task 2066 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.9-r0: task do_write_config: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_patch: Started
NOTE: Running task 2067 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_patch)
NOTE: recipe fribidi-1.0.11-r0: task do_unpack: Succeeded
NOTE: recipe gtk+3-3.24.33-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.44.0-r0: task do_write_config: Started
NOTE: recipe libwpe-1.12.0-r0: task do_unpack: Started
NOTE: Running task 2095 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_patch)
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.0-r0: task do_package_setscene: Succeeded
NOTE: Running task 2109 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: recipe libtasn1-4.18.0-r0: task do_fetch: Started
NOTE: Running task 2110 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe libepoxy-1.5.9-r0: task do_unpack: Succeeded
NOTE: Running task 2111 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_patch)
NOTE: Running task 2112 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Setscene tasks completed
NOTE: recipe libtasn1-4.18.0-r0: task do_fetch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: Running task 2114 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_patch)
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.44.0-r0: task do_write_config: Succeeded
NOTE: Running task 2115 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_generate_toolchain_file)
NOTE: Running task 2116 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2117 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_patch)
NOTE: recipe json-glib-1.6.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: Running task 2118 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_patch)
NOTE: Running task 2119 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_patch)
NOTE: Running task 2120 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: Running task 2123 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_unpack)
NOTE: Running task 2124 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_unpack)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_fetch: Started
NOTE: Running task 2130 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_fetch)
NOTE: Running task 2131 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_fetch)
NOTE: Running task 2132 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: Running task 2133 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 2134 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_fetch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_write_config: Started
NOTE: recipe libxi-1_1.8-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 2159 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_fetch)
NOTE: Running task 2160 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: Running task 2161 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_fetch)
NOTE: Running task 2162 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_fetch)
NOTE: Running task 2163 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_fetch)
NOTE: Running task 2164 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_fetch)
NOTE: Running task 2165 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_fetch)
NOTE: Running task 2166 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_fetch)
NOTE: Running task 2167 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_fetch)
NOTE: Running task 2168 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_fetch)
NOTE: recipe fribidi-1.0.11-r0: task do_patch: Started
NOTE: recipe libwpe-1.12.0-r0: task do_unpack: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_fetch: Succeeded
NOTE: Running task 2184 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_patch)
NOTE: Running task 2185 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_unpack)
NOTE: recipe json-glib-1.6.6-r0: task do_unpack: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_write_config: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Started
NOTE: Running task 2199 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_fetch)
NOTE: Running task 2202 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running task 2203 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_patch)
NOTE: Running task 2207 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_generate_toolchain_file: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_patch: Succeeded
NOTE: Running task 2208 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.9-r0: task do_patch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Started
NOTE: recipe aspell-0.60.8-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Succeeded
NOTE: Running task 2209 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_deploy_source_date_epoch)
NOTE: recipe libxv-1.0.11-r0: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_fetch: Started
NOTE: recipe pango-1.50.6-r0: task do_unpack: Succeeded
NOTE: Running task 2210 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_fetch: Succeeded
NOTE: recipe p11-kit-0.24.1-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: Running task 2211 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_patch)
NOTE: Running task 2212 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_patch)
NOTE: Running task 2213 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_fetch: Succeeded
NOTE: Running task 2214 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_unpack)
NOTE: Running task 2215 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: Running task 2216 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_unpack)
NOTE: Running task 2220 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.8-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_fetch: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_unpack: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Succeeded
NOTE: recipe p11-kit-0.24.1-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_patch: Succeeded
NOTE: Running task 2221 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 2222 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_fetch: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_fetch: Started
NOTE: recipe enchant2-2.3.3-r0: task do_fetch: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_fetch: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_unpack: Started
NOTE: recipe webkitgtk-2.36.0-r0: task do_fetch: Started
NOTE: Running task 2223 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_patch)
NOTE: recipe libtasn1-4.18.0-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_fetch: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 2224 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxft-1_2.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_fetch: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_patch: Started
NOTE: Running task 2225 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2228 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_patch)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_patch: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_fetch: Succeeded
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_fetch: Started
NOTE: Running task 2243 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_unpack)
NOTE: Running task 2244 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_unpack)
NOTE: recipe webkitgtk-2.36.0-r0: task do_fetch: Succeeded
NOTE: Running task 2245 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_unpack)
NOTE: Running task 2246 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libwpe-1.12.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_fetch: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_patch: Started
NOTE: Running task 2247 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_unpack)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2248 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2249 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_unpack)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2250 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_unpack)
NOTE: Running task 2251 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_unpack)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_patch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2252 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: recipe fribidi-1.0.11-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2253 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_unpack)
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_patch: Started
NOTE: Running task 2254 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_generate_toolchain_file)
NOTE: Running task 2255 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pango-1.50.6-r0: task do_patch: Started
NOTE: recipe libxv-1.0.11-r0: task do_unpack: Started
NOTE: recipe aspell-0.60.8-r0: task do_unpack: Started
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2256 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2257 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: Running task 2258 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_unpack)
NOTE: Running task 2268 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_fetch)
NOTE: recipe libxi-1_1.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2269 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_fetch)
NOTE: Running task 2270 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_fetch)
NOTE: Running task 2272 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_unpack)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_patch: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2292 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_unpack)
NOTE: Running task 2295 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_write_config)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_patch: Started
NOTE: Running task 2296 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libxv-1.0.11-r0: task do_unpack: Succeeded
NOTE: recipe p11-kit-0.24.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_unpack: Started
NOTE: recipe atk-2.38.0-r0: task do_patch: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_unpack: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to adc99ef3803769c431eb1fe143d0d4d2272069a430faf47bb88e42d021c57eca
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe enchant2-2.3.3-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_unpack: Started
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.44.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnotify-0.7.9-r0: task do_unpack: Started
NOTE: Running task 2310 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_patch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: Running task 2311 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2312 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_patch)
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Started
NOTE: Running task 2313 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe atk-2.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_unpack: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_unpack: Started
NOTE: Running task 2314 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_patch)
NOTE: Running task 2329 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_patch)
NOTE: recipe libxslt-1.1.35-r0: task do_unpack: Started
NOTE: recipe pango-1.50.6-r0: task do_patch: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libwpe-1.12.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe enchant2-2.3.3-r0: task do_unpack: Succeeded
NOTE: Running task 2362 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_configure: Started
NOTE: Running task 2378 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe libdazzle-3.44.0-r0: task do_fetch: Started
NOTE: Running task 2379 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_patch)
NOTE: Running task 2391 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libhandy-1.5.0-r0: task do_fetch: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_fetch: Succeeded
NOTE: recipe gcr-3.40.0-r0: task do_fetch: Started
NOTE: Running task 2392 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe webkitgtk-2.36.0-r0: task do_unpack: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_write_config: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Succeeded
NOTE: recipe gcr-3.40.0-r0: task do_fetch: Succeeded
NOTE: Running task 2393 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe libwpe-1.12.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2394 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_unpack: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2396 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_unpack)
NOTE: Running task 2401 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_packagedata)
NOTE: recipe libnotify-0.7.9-r0: task do_unpack: Succeeded
NOTE: recipe libhandy-1.5.0-r0: task do_fetch: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_patch: Started
NOTE: recipe libxv-1.0.11-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2402 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: Running task 2403 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_patch)
NOTE: Running task 2404 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_patch)
NOTE: Running task 2405 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_patch)
NOTE: recipe json-glib-1.6.6-r0: task do_patch: Succeeded
NOTE: Running task 2406 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_unpack)
NOTE: Running task 2407 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_unpack)
NOTE: Running task 2411 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_fetch)
NOTE: Running task 2458 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_write_config)
NOTE: Running task 2459 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_write_config)
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Started
NOTE: Running task 2460 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_configure)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_unpack: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_unpack: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_write_config: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_patch: Started
NOTE: Running task 2461 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_deploy_source_date_epoch)
NOTE: recipe json-glib-1.6.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_patch: Started
NOTE: Running task 2462 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_configure)
NOTE: recipe p11-kit-0.24.1-r0: task do_unpack: Succeeded
NOTE: recipe pango-1.50.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2463 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_deploy_source_date_epoch)
NOTE: recipe libxv-1.0.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2464 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_patch)
NOTE: Running task 2465 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 2466 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_patch)
NOTE: Running task 2467 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_patch)
NOTE: Running task 2468 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_write_config)
NOTE: Running task 2469 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_write_config)
NOTE: Running task 2470 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2471 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_configure)
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-core-2.44.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2472 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: Running task 2473 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_deploy_source_date_epoch)
NOTE: recipe aspell-0.60.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe libwpe-1.12.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_patch: Succeeded
NOTE: recipe vala-0.56.0-r0: task do_packagedata: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_patch: Started
NOTE: Running task 2474 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_configure)
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Started
NOTE: recipe gcr-3.40.0-r0: task do_unpack: Started
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_unpack: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 2475 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_patch)
NOTE: Running task 2476 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_deploy_source_date_epoch)
NOTE: recipe libdazzle-3.44.0-r0: task do_unpack: Started
NOTE: Running task 2477 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_write_config)
NOTE: recipe libtasn1-4.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2478 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe libnotify-0.7.9-r0: task do_patch: Started
NOTE: recipe enchant2-2.3.3-r0: task do_patch: Succeeded
NOTE: recipe libhandy-1.5.0-r0: task do_unpack: Started
NOTE: recipe epiphany-42.2-r0: task do_fetch: Started
NOTE: Running task 2479 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_patch)
NOTE: Running task 2480 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe p11-kit-0.24.1-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_write_config: Started
NOTE: recipe fribidi-1.0.11-r0: task do_configure: Started
NOTE: Running task 2481 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxslt-1.1.35-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_patch: Succeeded
NOTE: recipe epiphany-42.2-r0: task do_fetch: Succeeded
NOTE: Running task 2482 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe atk-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2483 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_patch)
NOTE: Running task 2484 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.8-r0: task do_configure: Started
NOTE: recipe json-glib-1.6.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_patch: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_patch: Succeeded
NOTE: Running task 2485 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_configure)
NOTE: Running task 2486 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_configure)
NOTE: recipe p11-kit-0.24.1-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_unpack: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_patch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_write_config: Started
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_write_config: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_patch: Succeeded
NOTE: Running task 2487 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libsecret-0.20.5-r0: task do_patch: Started
NOTE: Running task 2488 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2489 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_deploy_source_date_epoch)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_configure: Started
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2490 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_write_config: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_write_config: Started
NOTE: recipe pango-1.50.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Succeeded
NOTE: Running task 2491 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_patch)
NOTE: recipe libdazzle-3.44.0-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2492 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Started
NOTE: Running task 2493 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_patch: Started
NOTE: Running task 2494 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_deploy_source_date_epoch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_write_config: Succeeded
NOTE: recipe harfbuzz-4.2.0-r0: task do_unpack: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: Running task 2495 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe libnotify-0.7.9-r0: task do_write_config: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_write_config: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe p11-kit-0.24.1-r0: task do_patch: Succeeded
NOTE: Running task 2496 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_configure)
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Started
NOTE: Running task 2497 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_patch)
NOTE: Running task 2498 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_patch)
NOTE: Running task 2499 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_deploy_source_date_epoch)
NOTE: recipe aspell-0.60.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gcr-3.40.0-r0: task do_unpack: Succeeded
NOTE: Running task 2500 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_patch: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libhandy-1.5.0-r0: task do_unpack: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxslt-1.1.35-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe enchant2-2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsecret-0.20.5-r0: task do_write_config: Succeeded
NOTE: Running task 2501 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_patch)
NOTE: Running task 2502 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2503 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2504 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_patch)
NOTE: recipe json-glib-1.6.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_patch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxv-1.0.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2521 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe atk-2.38.0-r0: task do_configure: Started
NOTE: recipe libnotify-0.7.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxslt-1.1.35-r0: task do_patch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: recipe vala-0.56.0-r0: task do_packagedata: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2522 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2523 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_configure)
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_patch: Started
NOTE: Running task 2524 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2525 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_deploy_source_date_epoch)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_configure: Started
NOTE: Running task 2553 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libdazzle-3.44.0-r0: task do_patch: Started
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2554 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2555 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_write_config)
NOTE: Running task 2556 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-4.2.0-r0: task do_patch: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: Running task 2557 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_configure)
NOTE: recipe libsecret-0.20.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcr-3.40.0-r0: task do_patch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2560 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_unpack)
NOTE: recipe libdazzle-3.44.0-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libhandy-1.5.0-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_configure: Started
NOTE: Running task 2603 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_write_config)
NOTE: Running task 2604 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_write_config)
NOTE: Running task 2605 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2606 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_write_config)
NOTE: recipe enchant2-2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-4.2.0-r0: task do_patch: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2663 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2692 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_write_config)
NOTE: recipe json-glib-1.6.6-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe aspell-0.60.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2775 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_configure)
NOTE: Running task 2776 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_configure)
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_write_config: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2777 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_configure)
NOTE: recipe libxv-1.0.11-r0: task do_configure: Started
NOTE: recipe epiphany-42.2-r0: task do_unpack: Started
NOTE: Running task 2778 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: Running task 2779 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_configure)
NOTE: recipe libhandy-1.5.0-r0: task do_write_config: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_write_config: Started
NOTE: recipe gcr-3.40.0-r0: task do_write_config: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcr-3.40.0-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_patch: Succeeded
NOTE: recipe epiphany-42.2-r0: task do_write_config: Started
NOTE: recipe libxslt-1.1.35-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_write_config: Succeeded
NOTE: recipe p11-kit-0.24.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2780 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libhandy-1.5.0-r0: task do_patch: Succeeded
NOTE: Running task 2781 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libtasn1-4.18.0-r0: task do_configure: Started
NOTE: recipe libsecret-0.20.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2782 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcr-3.40.0-r0: task do_write_config: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_write_config: Succeeded
NOTE: recipe libhandy-1.5.0-r0: task do_write_config: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Started
NOTE: Running task 2783 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: Running task 2784 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_configure)
NOTE: recipe epiphany-42.2-r0: task do_write_config: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2785 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_configure)
NOTE: recipe libxslt-1.1.35-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcr-3.40.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2786 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_configure)
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Started
NOTE: recipe libhandy-1.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_configure: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-4.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2787 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_configure)
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Started
NOTE: recipe libxslt-1.1.35-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_configure: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Running task 2788 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcr-3.40.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 4f672850dad29842ce5ccb8318ecf7cb5c099e33eefd97dfd516e6119a48cb96
NOTE: Running task 2789 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_compile)
NOTE: recipe libhandy-1.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-4.2.0-r0: task do_configure: Started
NOTE: recipe epiphany-42.2-r0: task do_unpack: Succeeded
NOTE: recipe gtk+3-3.24.33-r0: task do_unpack: Succeeded
NOTE: Running task 2796 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_patch)
NOTE: Running task 2797 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_patch)
NOTE: recipe libsecret-0.20.5-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_compile: Started
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2798 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_configure)
NOTE: recipe epiphany-42.2-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.33-r0: task do_patch: Started
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_configure: Started
NOTE: recipe libwpe-1.12.0-r0: task do_configure: Succeeded
NOTE: Running task 2799 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_compile)
NOTE: recipe libwpe-1.12.0-r0: task do_compile: Started
NOTE: recipe epiphany-42.2-r0: task do_patch: Succeeded
NOTE: Running task 2800 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2801 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_populate_lic)
NOTE: recipe gtk+3-3.24.33-r0: task do_patch: Succeeded
NOTE: Running task 2802 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_deploy_source_date_epoch)
NOTE: recipe epiphany-42.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk+3-3.24.33-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe epiphany-42.2-r0: task do_populate_lic: Started
NOTE: recipe epiphany-42.2-r0: task do_populate_lic: Succeeded
NOTE: recipe gtk+3-3.24.33-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe epiphany-42.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_populate_lic unihash changed to 5419e8ff66bfb975b34bd8fdc3be70664192c37a631990aa8d59b0ff4744a987
NOTE: recipe webkitgtk-2.36.0-r0: task do_unpack: Succeeded
NOTE: Running task 2803 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_patch)
NOTE: recipe webkitgtk-2.36.0-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.11-r0: task do_configure: Succeeded
NOTE: Running task 2804 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_compile)
NOTE: recipe libwpe-1.12.0-r0: task do_compile: Succeeded
NOTE: Running task 2805 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_install)
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_compile: Started
NOTE: Running task 2806 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_configure: Succeeded
NOTE: Running task 2807 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_compile)
NOTE: recipe libwpe-1.12.0-r0: task do_install: Started
NOTE: recipe atk-2.38.0-r0: task do_configure: Succeeded
NOTE: Running task 2808 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_compile)
NOTE: recipe webkitgtk-2.36.0-r0: task do_patch: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_compile: Started
NOTE: Running task 2809 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_generate_toolchain_file)
NOTE: Running task 2810 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_deploy_source_date_epoch)
NOTE: recipe atk-2.38.0-r0: task do_compile: Started
NOTE: recipe webkitgtk-2.36.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe webkitgtk-2.36.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libwpe-1.12.0-r0: task do_install: Succeeded
NOTE: recipe webkitgtk-2.36.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2811 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_populate_sysroot)
NOTE: Running task 2812 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_package)
NOTE: recipe webkitgtk-2.36.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_populate_sysroot: Started
NOTE: recipe libwpe-1.12.0-r0: task do_package: Started
NOTE: recipe json-glib-1.6.6-r0: task do_configure: Succeeded
NOTE: Running task 2813 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_configure_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_configure_ptest_base: Started
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_configure: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2814 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_compile)
NOTE: Running task 2815 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_compile)
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_compile: Started
NOTE: recipe libwpe-1.12.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_compile: Started
NOTE: recipe libsecret-0.20.5-r0: task do_configure: Succeeded
NOTE: Running task 2816 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 2817 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe libsecret-0.20.5-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_compile: Succeeded
NOTE: Running task 2818 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_compile: Succeeded
NOTE: Running task 2819 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_install)
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Succeeded
NOTE: Running task 2820 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe fribidi-1.0.11-r0: task do_compile: Succeeded
NOTE: Running task 2821 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_install)
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_install: Succeeded
NOTE: Running task 2822 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_populate_sysroot)
NOTE: Running task 2823 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_package)
NOTE: recipe fribidi-1.0.11-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_package: Started
NOTE: Running task 2824 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_install: Succeeded
NOTE: Running task 2825 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_package)
NOTE: Running task 2826 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_populate_sysroot)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_populate_sysroot: Started
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_package: Started
NOTE: Running task 2827 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: Running task 2828 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: recipe fribidi-1.0.11-r0: task do_install: Succeeded
NOTE: Running task 2829 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_populate_sysroot)
NOTE: Running task 2830 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_package)
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe fribidi-1.0.11-r0: task do_populate_sysroot: Started
NOTE: recipe libwpe-1.12.0-r0: task do_package: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_package: Started
NOTE: Running task 2831 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_packagedata)
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2832 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe harfbuzz-4.2.0-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2833 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: Running task 2834 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_configure: Succeeded
NOTE: Running task 2835 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_configure_ptest_base)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_configure_ptest_base: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2836 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe atk-2.38.0-r0: task do_compile: Succeeded
NOTE: Running task 2837 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_compile)
NOTE: Running task 2838 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_compile: Started
NOTE: recipe atk-2.38.0-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_package: Succeeded
NOTE: Running task 2839 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_configure)
NOTE: Running task 2840 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.11-r0: task do_package: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata: Started
NOTE: Running task 2841 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_install: Succeeded
NOTE: Running task 2842 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe fribidi-1.0.11-r0: task do_packagedata: Started
NOTE: Running task 2843 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_populate_sysroot)
NOTE: Running task 2844 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_package)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe atk-2.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe atk-2.38.0-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_packagedata: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_compile: Succeeded
NOTE: Running task 2845 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_compile_ptest_base)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_compile_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2846 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_install)
NOTE: recipe atk-2.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_install: Started
NOTE: recipe libsecret-0.20.5-r0: task do_compile: Succeeded
NOTE: Running task 2847 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_install)
NOTE: recipe libsecret-0.20.5-r0: task do_install: Started
NOTE: recipe json-glib-1.6.6-r0: task do_install: Succeeded
NOTE: Running task 2848 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_install_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_install_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2849 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_populate_sysroot)
NOTE: Running task 2850 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_package)
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot: Started
NOTE: recipe json-glib-1.6.6-r0: task do_package: Started
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_package: Succeeded
NOTE: Running task 2851 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_packagedata)
NOTE: recipe libsecret-0.20.5-r0: task do_install: Succeeded
NOTE: Running task 2852 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_populate_sysroot)
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_packagedata: Started
NOTE: Running task 2853 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_package)
NOTE: recipe libsecret-0.20.5-r0: task do_populate_sysroot: Started
NOTE: recipe libsecret-0.20.5-r0: task do_package: Started
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2854 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_package_write_rpm)
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_configure: Succeeded
NOTE: Running task 2855 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_configure_ptest_base)
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Succeeded
NOTE: Running task 2856 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_configure_ptest_base: Started
NOTE: recipe aspell-0.60.8-r0: task do_configure: Succeeded
NOTE: Running task 2857 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_compile: Started
NOTE: Running task 2858 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_compile)
NOTE: recipe aspell-0.60.8-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_configure: Succeeded
NOTE: Running task 2859 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_compile)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Succeeded
NOTE: Running task 2860 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.4-r0: task do_configure: Succeeded
NOTE: Running task 2861 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_compile)
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_compile: Started
NOTE: recipe libxi-1_1.8-r0: task do_configure: Succeeded
NOTE: Running task 2862 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_compile)
NOTE: recipe libxi-1_1.8-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Succeeded
NOTE: Running task 2863 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_compile)
NOTE: Running task 2864 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_compile)
NOTE: recipe atk-2.38.0-r0: task do_package: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Started
NOTE: Running task 2865 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Started
NOTE: recipe libxv-1.0.11-r0: task do_configure: Succeeded
NOTE: Running task 2866 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_compile)
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2867 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_package_write_rpm)
NOTE: recipe atk-2.38.0-r0: task do_packagedata: Started
NOTE: recipe libxv-1.0.11-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_package_write_rpm: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_compile: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_configure: Succeeded
NOTE: Running task 2868 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_install)
NOTE: Running task 2869 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 2870 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe libxslt-1.1.35-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Succeeded
NOTE: Running task 2871 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2872 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_install)
NOTE: recipe libxi-1_1.8-r0: task do_compile: Succeeded
NOTE: Running task 2873 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_install)
NOTE: recipe libxft-1_2.3.4-r0: task do_install: Succeeded
NOTE: Running task 2874 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_populate_sysroot)
NOTE: Running task 2875 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_package)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Started
NOTE: recipe atk-2.38.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxv-1.0.11-r0: task do_compile: Succeeded
NOTE: Running task 2876 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_install)
NOTE: recipe libxft-1_2.3.4-r0: task do_package: Started
NOTE: recipe libxv-1.0.11-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Succeeded
NOTE: Running task 2877 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot)
NOTE: Running task 2878 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 2879 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Started
NOTE: Running task 2880 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 2881 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_package)
NOTE: recipe libxi-1_1.8-r0: task do_install: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: Running task 2882 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_populate_sysroot)
NOTE: Running task 2883 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_package)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.8-r0: task do_package: Started
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot: Started
NOTE: recipe libxv-1.0.11-r0: task do_install: Succeeded
NOTE: Running task 2884 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_populate_sysroot)
NOTE: Running task 2885 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_package)
NOTE: recipe libsecret-0.20.5-r0: task do_package: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Succeeded
NOTE: Running task 2886 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_packagedata)
NOTE: Running task 2887 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_compile)
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_package: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_packagedata: Started
NOTE: Running task 2888 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_compile: Started
NOTE: Running task 2889 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 2890 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Started
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2891 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe json-glib-1.6.6-r0: task do_package: Succeeded
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2892 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_packagedata)
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2893 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_configure)
NOTE: recipe libsecret-0.20.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2894 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2895 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Started
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2896 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2897 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_compile: Succeeded
NOTE: Running task 2898 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Succeeded
NOTE: Running task 2899 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.4-r0: task do_package: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_install: Started
NOTE: Running task 2900 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_package: Succeeded
NOTE: Running task 2901 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata)
NOTE: Running task 2902 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_packagedata)
NOTE: recipe libxslt-1.1.35-r0: task do_compile: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2903 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_install)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Started
NOTE: Running task 2904 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.8-r0: task do_package: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Started
NOTE: recipe libxslt-1.1.35-r0: task do_install: Started
NOTE: Running task 2905 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.4-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_compile: Succeeded
NOTE: Running task 2906 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_compile_ptest_base)
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_packagedata: Started
NOTE: Running task 2907 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_compile_ptest_base: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2908 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_install: Started
NOTE: recipe libxi-1_1.8-r0: task do_packagedata: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2909 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_populate_sysroot)
NOTE: recipe aspell-0.60.8-r0: task do_install: Succeeded
NOTE: Running task 2910 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_package)
NOTE: Running task 2911 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_populate_sysroot)
NOTE: recipe libwebp-1.2.2-r0: task do_compile: Succeeded
NOTE: Running task 2912 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_package)
NOTE: Running task 2913 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_install)
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Started
NOTE: recipe aspell-0.60.8-r0: task do_populate_sysroot: Started
NOTE: recipe aspell-0.60.8-r0: task do_package: Started
NOTE: recipe libwebp-1.2.2-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_compile: Succeeded
NOTE: Running task 2914 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_compile_ptest_base)
NOTE: recipe libepoxy-1.5.9-r0: task do_compile: Succeeded
NOTE: Running task 2915 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_install)
NOTE: recipe libxslt-1.1.35-r0: task do_install: Succeeded
NOTE: Running task 2916 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_populate_sysroot)
NOTE: Running task 2917 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_package)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2918 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_install)
NOTE: recipe libxslt-1.1.35-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_install: Started
NOTE: recipe libxslt-1.1.35-r0: task do_package: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_install: Started
NOTE: recipe aspell-0.60.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2919 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe enchant2-2.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxslt-1.1.35-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_install: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2920 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_configure)
NOTE: Running task 2921 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_populate_sysroot)
NOTE: Running task 2922 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_package)
NOTE: recipe libepoxy-1.5.9-r0: task do_install: Succeeded
NOTE: Running task 2923 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_populate_sysroot)
NOTE: Running task 2924 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_package)
NOTE: recipe enchant2-2.3.3-r0: task do_configure: Started
NOTE: recipe libwebp-1.2.2-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.2.2-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_install: Succeeded
NOTE: Running task 2925 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_install_ptest_base)
NOTE: recipe libepoxy-1.5.9-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_install_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2926 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_populate_sysroot)
NOTE: Running task 2927 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_package)
NOTE: recipe libwebp-1.2.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2928 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_install: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2929 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_install_ptest_base)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2930 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_populate_sysroot)
NOTE: Running task 2931 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2932 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_package: Started
NOTE: recipe libnotify-0.7.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2933 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_configure)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_package: Succeeded
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2934 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_packagedata)
NOTE: Running task 2935 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_packagedata)
NOTE: recipe libpsl-0.21.1-r0: task do_compile: Succeeded
NOTE: Running task 2936 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_install)
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe libxslt-1.1.35-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_package: Succeeded
NOTE: Running task 2937 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_packagedata)
NOTE: recipe libpsl-0.21.1-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_packagedata: Started
NOTE: recipe libnotify-0.7.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2938 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_configure)
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_packagedata: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_packagedata: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_install: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_package: Succeeded
NOTE: Running task 2939 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_populate_sysroot)
NOTE: Running task 2940 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_package)
NOTE: Running task 2941 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_packagedata)
NOTE: recipe libpsl-0.21.1-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.2.2-r0: task do_packagedata: Started
NOTE: recipe libpsl-0.21.1-r0: task do_package: Started
NOTE: recipe libwebp-1.2.2-r0: task do_packagedata: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2942 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe aspell-0.60.8-r0: task do_package: Succeeded
NOTE: Running task 2943 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_packagedata)
NOTE: recipe libtasn1-4.18.0-r0: task do_configure: Succeeded
NOTE: Running task 2944 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_compile)
NOTE: recipe aspell-0.60.8-r0: task do_packagedata: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_compile: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2945 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_configure)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_configure: Succeeded
NOTE: Running task 2946 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_compile)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_compile: Succeeded
NOTE: Running task 2947 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_configure: Started
NOTE: Running task 2948 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_compile)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_compile: Started
NOTE: recipe aspell-0.60.8-r0: task do_packagedata: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_install: Started
NOTE: recipe libpsl-0.21.1-r0: task do_package: Succeeded
NOTE: Running task 2949 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_packagedata)
NOTE: recipe libpsl-0.21.1-r0: task do_packagedata: Started
NOTE: recipe libnotify-0.7.9-r0: task do_configure: Succeeded
NOTE: Running task 2950 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_compile)
NOTE: recipe libnotify-0.7.9-r0: task do_compile: Started
NOTE: recipe libpsl-0.21.1-r0: task do_packagedata: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_compile: Succeeded
NOTE: Running task 2951 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_install)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_install: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 2952 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: Running task 2953 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_populate_sysroot)
NOTE: Running task 2954 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_package)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_install: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Succeeded
NOTE: Running task 2955 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_install)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_install: Succeeded
NOTE: Running task 2956 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_populate_sysroot)
NOTE: Running task 2957 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_package)
NOTE: recipe libtheora-1.1.1-r1: task do_install: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_populate_sysroot: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_package: Started
NOTE: recipe libtheora-1.1.1-r1: task do_install: Succeeded
NOTE: Running task 2958 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 2959 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_configure: Succeeded
NOTE: Running task 2960 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_compile)
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_package: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_compile: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 2961 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 2962 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 2963 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 2964 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 2965 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 2966 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 2967 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package)
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_package: Succeeded
NOTE: Running task 2968 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_packagedata)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_package: Succeeded
NOTE: Running task 2969 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_packagedata)
NOTE: recipe libnotify-0.7.9-r0: task do_compile: Succeeded
NOTE: Running task 2970 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_install)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_packagedata: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Succeeded
NOTE: Running task 2971 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_packagedata: Started
NOTE: Running task 2972 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Started
NOTE: recipe libnotify-0.7.9-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.44.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_packagedata: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_packagedata: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_package: Succeeded
NOTE: Running task 2973 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_packagedata: Started
NOTE: recipe libnotify-0.7.9-r0: task do_install: Succeeded
NOTE: Running task 2974 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_populate_sysroot)
NOTE: recipe libtasn1-4.18.0-r0: task do_compile: Succeeded
NOTE: Running task 2975 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_install)
NOTE: recipe libnotify-0.7.9-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.44.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2976 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_configure)
NOTE: recipe libtasn1-4.18.0-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.44.0-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 2977 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe libnotify-0.7.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 2978 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_packagedata: Succeeded
NOTE: Running task 2979 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_install: Succeeded
NOTE: Running task 2980 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_populate_sysroot)
NOTE: Running task 2981 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_package)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_package: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_populate_sysroot: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_package: Started
NOTE: Running task 2982 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_packagedata: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2983 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe p11-kit-0.24.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_packagedata: Succeeded
NOTE: recipe p11-kit-0.24.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2984 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_configure)
NOTE: recipe p11-kit-0.24.1-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_package: Succeeded
NOTE: Running task 2985 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_packagedata)
NOTE: recipe libtasn1-4.18.0-r0: task do_packagedata: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_packagedata: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_package: Succeeded
NOTE: Running task 2986 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_packagedata)
NOTE: recipe libnotify-0.7.9-r0: task do_packagedata: Started
NOTE: recipe libnotify-0.7.9-r0: task do_packagedata: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_compile: Succeeded
NOTE: Running task 2987 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_install)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_configure: Succeeded
NOTE: Running task 2988 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_compile)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_compile: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_install: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_install: Succeeded
NOTE: Running task 2989 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_populate_sysroot)
NOTE: Running task 2990 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_package)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_package: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_populate_sysroot: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe p11-kit-0.24.1-r0: task do_configure: Succeeded
NOTE: Running task 2991 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_compile)
NOTE: recipe p11-kit-0.24.1-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.44.0-r0: task do_compile: Succeeded
NOTE: Running task 2992 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_install)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.44.0-r0: task do_install: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_package: Succeeded
NOTE: Running task 2993 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_populate_sysroot)
NOTE: Running task 2994 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_package)
NOTE: Running task 2995 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.44.0-r0: task do_package: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.44.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2996 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2997 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_configure)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Succeeded
NOTE: Running task 2998 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_compile)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2999 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_install)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_package: Succeeded
NOTE: Running task 3000 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_packagedata)
NOTE: recipe harfbuzz-4.2.0-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.44.0-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Succeeded
NOTE: Running task 3001 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_install)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.44.0-r0: task do_packagedata: Succeeded
NOTE: recipe harfbuzz-4.2.0-r0: task do_install: Succeeded
NOTE: Running task 3002 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_populate_sysroot)
NOTE: Running task 3003 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_package)
NOTE: recipe harfbuzz-4.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_package: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Succeeded
NOTE: Running task 3004 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_populate_sysroot)
NOTE: Running task 3005 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3006 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pango-1.50.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.50.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3007 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_configure)
NOTE: recipe pango-1.50.6-r0: task do_configure: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Succeeded
NOTE: Running task 3008 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_packagedata)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Succeeded
NOTE: recipe harfbuzz-4.2.0-r0: task do_package: Succeeded
NOTE: Running task 3009 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_packagedata)
NOTE: recipe harfbuzz-4.2.0-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_configure: Succeeded
NOTE: Running task 3010 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_compile)
NOTE: recipe enchant2-2.3.3-r0: task do_compile: Started
NOTE: recipe pango-1.50.6-r0: task do_configure: Succeeded
NOTE: Running task 3011 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_configure_ptest_base)
NOTE: recipe pango-1.50.6-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.50.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3012 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_compile)
NOTE: recipe pango-1.50.6-r0: task do_compile: Started
NOTE: recipe enchant2-2.3.3-r0: task do_compile: Succeeded
NOTE: Running task 3013 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_install)
NOTE: recipe enchant2-2.3.3-r0: task do_install: Started
NOTE: recipe enchant2-2.3.3-r0: task do_install: Succeeded
NOTE: Running task 3014 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_populate_sysroot)
NOTE: Running task 3015 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_package)
NOTE: recipe enchant2-2.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe enchant2-2.3.3-r0: task do_package: Started
NOTE: recipe enchant2-2.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_package: Succeeded
NOTE: Running task 3016 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_packagedata)
NOTE: recipe enchant2-2.3.3-r0: task do_packagedata: Started
NOTE: recipe enchant2-2.3.3-r0: task do_packagedata: Succeeded
NOTE: recipe pango-1.50.6-r0: task do_compile: Succeeded
NOTE: Running task 3017 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_compile_ptest_base)
NOTE: recipe pango-1.50.6-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.50.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3018 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_install)
NOTE: recipe pango-1.50.6-r0: task do_install: Started
NOTE: recipe pango-1.50.6-r0: task do_install: Succeeded
NOTE: Running task 3019 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_install_ptest_base)
NOTE: recipe pango-1.50.6-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.50.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3020 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_populate_sysroot)
NOTE: Running task 3021 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_package)
NOTE: recipe pango-1.50.6-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.50.6-r0: task do_package: Started
NOTE: recipe pango-1.50.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3022 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3023 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.33-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3024 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.33-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3025 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_configure)
NOTE: recipe gtk+3-3.24.33-r0: task do_configure: Started
NOTE: recipe pango-1.50.6-r0: task do_package: Succeeded
NOTE: Running task 3026 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_packagedata)
NOTE: recipe pango-1.50.6-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.6-r0: task do_packagedata: Succeeded
NOTE: recipe p11-kit-0.24.1-r0: task do_compile: Succeeded
NOTE: Running task 3027 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_install)
NOTE: recipe p11-kit-0.24.1-r0: task do_install: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_install: Succeeded
NOTE: Running task 3028 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_populate_sysroot)
NOTE: Running task 3029 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_package)
NOTE: recipe p11-kit-0.24.1-r0: task do_populate_sysroot: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_package: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_configure: Succeeded
NOTE: Running task 3030 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_compile: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_package: Succeeded
NOTE: Running task 3031 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_packagedata)
NOTE: recipe p11-kit-0.24.1-r0: task do_packagedata: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_compile: Succeeded
NOTE: Running task 3032 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_install: Succeeded
NOTE: Running task 3033 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_populate_sysroot)
NOTE: Running task 3034 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.33-r0: task do_configure: Succeeded
NOTE: Running task 3035 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_compile)
NOTE: recipe gtk+3-3.24.33-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_package: Succeeded
NOTE: Running task 3036 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_packagedata: Succeeded
NOTE: recipe gtk+3-3.24.33-r0: task do_compile: Succeeded
NOTE: Running task 3037 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_install)
NOTE: recipe gtk+3-3.24.33-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.33-r0: task do_install: Succeeded
NOTE: Running task 3038 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_populate_sysroot)
NOTE: Running task 3039 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_package)
NOTE: recipe gtk+3-3.24.33-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.33-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.33-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3040 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3041 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3042 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3043 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libhandy-1.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcr-3.40.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe webkitgtk-2.36.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3048 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_configure)
NOTE: recipe libhandy-1.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3049 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_configure)
NOTE: recipe libdazzle-3.44.0-r0: task do_configure: Started
NOTE: recipe libhandy-1.5.0-r0: task do_configure: Started
NOTE: recipe gcr-3.40.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3050 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_configure)
NOTE: recipe webkitgtk-2.36.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3051 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_configure)
NOTE: recipe gcr-3.40.0-r0: task do_configure: Started
NOTE: recipe webkitgtk-2.36.0-r0: task do_configure: Started
NOTE: recipe libhandy-1.5.0-r0: task do_configure: Succeeded
NOTE: Running task 3052 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_compile)
NOTE: recipe libhandy-1.5.0-r0: task do_compile: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_configure: Succeeded
NOTE: Running task 3053 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_compile)
NOTE: recipe gcr-3.40.0-r0: task do_configure: Succeeded
NOTE: Running task 3054 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_compile)
NOTE: recipe libdazzle-3.44.0-r0: task do_compile: Started
NOTE: recipe gcr-3.40.0-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.33-r0: task do_package: Succeeded
NOTE: Running task 3055 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.33-r0: task do_packagedata: Started
NOTE: recipe libhandy-1.5.0-r0: task do_compile: Succeeded
NOTE: Running task 3056 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_install)
NOTE: recipe gtk+3-3.24.33-r0: task do_packagedata: Succeeded
NOTE: recipe libhandy-1.5.0-r0: task do_install: Started
NOTE: recipe libhandy-1.5.0-r0: task do_install: Succeeded
NOTE: Running task 3060 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_populate_sysroot)
NOTE: Running task 3061 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_package)
NOTE: recipe libhandy-1.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe libhandy-1.5.0-r0: task do_package: Started
NOTE: recipe libhandy-1.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_compile: Succeeded
NOTE: Running task 3062 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_install)
NOTE: recipe libdazzle-3.44.0-r0: task do_install: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_install: Succeeded
NOTE: Running task 3063 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_populate_sysroot)
NOTE: Running task 3064 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_package)
NOTE: recipe libdazzle-3.44.0-r0: task do_populate_sysroot: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_package: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gcr-3.40.0-r0: task do_compile: Succeeded
NOTE: Running task 3065 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_install)
NOTE: recipe gcr-3.40.0-r0: task do_install: Started
NOTE: recipe libhandy-1.5.0-r0: task do_package: Succeeded
NOTE: Running task 3066 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_packagedata)
NOTE: recipe libhandy-1.5.0-r0: task do_packagedata: Started
NOTE: recipe gcr-3.40.0-r0: task do_install: Succeeded
NOTE: Running task 3067 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_populate_sysroot)
NOTE: Running task 3068 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_package)
NOTE: recipe gcr-3.40.0-r0: task do_populate_sysroot: Started
NOTE: recipe gcr-3.40.0-r0: task do_package: Started
NOTE: recipe libhandy-1.5.0-r0: task do_packagedata: Succeeded
NOTE: recipe gcr-3.40.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_package: Succeeded
NOTE: Running task 3069 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_packagedata)
NOTE: recipe libdazzle-3.44.0-r0: task do_packagedata: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_packagedata: Succeeded
NOTE: recipe gcr-3.40.0-r0: task do_package: Succeeded
NOTE: Running task 3070 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_packagedata)
NOTE: recipe gcr-3.40.0-r0: task do_packagedata: Started
NOTE: recipe gcr-3.40.0-r0: task do_packagedata: Succeeded
NOTE: recipe webkitgtk-2.36.0-r0: task do_configure: Succeeded
NOTE: Running task 3071 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_compile)
NOTE: recipe webkitgtk-2.36.0-r0: task do_compile: Started
Bitbake still alive (no events for 600s). Active tasks:
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_compile
NOTE: recipe webkitgtk-2.36.0-r0: task do_compile: Succeeded
NOTE: Running task 3072 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_install)
NOTE: recipe webkitgtk-2.36.0-r0: task do_install: Started
NOTE: recipe webkitgtk-2.36.0-r0: task do_install: Succeeded
NOTE: Running task 3073 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_populate_sysroot)
NOTE: Running task 3074 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_package)
NOTE: recipe webkitgtk-2.36.0-r0: task do_populate_sysroot: Started
NOTE: recipe webkitgtk-2.36.0-r0: task do_package: Started
NOTE: recipe webkitgtk-2.36.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3075 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe epiphany-42.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe epiphany-42.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3076 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_configure)
NOTE: recipe epiphany-42.2-r0: task do_configure: Started
NOTE: recipe epiphany-42.2-r0: task do_configure: Succeeded
NOTE: Running task 3077 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_compile)
NOTE: recipe epiphany-42.2-r0: task do_compile: Started
NOTE: recipe epiphany-42.2-r0: task do_compile: Succeeded
NOTE: Running task 3078 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_install)
NOTE: recipe epiphany-42.2-r0: task do_install: Started
NOTE: recipe epiphany-42.2-r0: task do_install: Succeeded
NOTE: Running task 3079 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_populate_sysroot)
NOTE: recipe epiphany-42.2-r0: task do_populate_sysroot: Started
NOTE: recipe epiphany-42.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe webkitgtk-2.36.0-r0: task do_package: Succeeded
NOTE: Running task 3080 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_packagedata)
NOTE: recipe webkitgtk-2.36.0-r0: task do_packagedata: Started
NOTE: recipe webkitgtk-2.36.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3081 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_package)
NOTE: recipe epiphany-42.2-r0: task do_package: Started
NOTE: recipe epiphany-42.2-r0: task do_package: Succeeded
NOTE: Running task 3082 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_packagedata)
NOTE: recipe epiphany-42.2-r0: task do_packagedata: Started
NOTE: recipe epiphany-42.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3083 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_package_write_rpm)
NOTE: Running task 3084 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_package_qa)
NOTE: recipe epiphany-42.2-r0: task do_package_write_rpm: Started
NOTE: recipe epiphany-42.2-r0: task do_package_qa: Started
NOTE: recipe epiphany-42.2-r0: task do_package_qa: Succeeded
NOTE: recipe epiphany-42.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3085 of 3085 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_build)
NOTE: Tasks Summary: Attempted 3085 tasks of which 2553 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: vala-0.56.0-r0 do_packagedata_setscene: QA Issue: Package version for package vala-src went backwards which would break package feeds (from 0:0.56.1-r0 to 0:0.56.0-r0) [version-going-backwards]
ERROR: vala-0.56.0-r0 do_packagedata_setscene: QA Issue: Package version for package vala-dbg went backwards which would break package feeds (from 0:0.56.1-r0 to 0:0.56.0-r0) [version-going-backwards]
ERROR: vala-0.56.0-r0 do_packagedata_setscene: QA Issue: Package version for package vala-staticdev went backwards which would break package feeds (from 0:0.56.1-r0 to 0:0.56.0-r0) [version-going-backwards]
ERROR: vala-0.56.0-r0 do_packagedata_setscene: QA Issue: Package version for package vala-dev went backwards which would break package feeds (from 0:0.56.1-r0 to 0:0.56.0-r0) [version-going-backwards]
ERROR: vala-0.56.0-r0 do_packagedata_setscene: QA Issue: Package version for package vala-doc went backwards which would break package feeds (from 0:0.56.1-r0 to 0:0.56.0-r0) [version-going-backwards]
ERROR: vala-0.56.0-r0 do_packagedata_setscene: QA Issue: Package version for package vala-locale went backwards which would break package feeds (from 0:0.56.1-r0 to 0:0.56.0-r0) [version-going-backwards]
ERROR: vala-0.56.0-r0 do_packagedata_setscene: QA Issue: Package version for package vala went backwards which would break package feeds (from 0:0.56.1-r0 to 0:0.56.0-r0) [version-going-backwards]
ERROR: vala-0.56.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3111540461775897567==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1642 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-ed8181b2f5a2b54f8551c847a8333441988f2cd3"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ed8181b2f5a2b54f8551c847a8333441988f2cd3"
workspace            = "master:9e556960421c8bbe8851d9810352a5b4bd3b50df"

Initialising tasks...done.
Sstate summary: Wanted 212 Local 24 Mirrors 0 Missed 188 Current 665 (11% match, 78% complete)
Removing 1 stale sstate objects for arch ppc7400...done.
Removing 4 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 689 of 877 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_41.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 695 of 877 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 719 of 877 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 760 of 877 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 839 of 877 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 840 of 877 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.9.0.bb:do_packagedata_setscene)
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe adwaita-icon-theme-41.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe iso-codes-4.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe adwaita-icon-theme-41.0-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/vala/0.56.0-r0/temp/log.do_packagedata_setscene.2461629
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 875 of 877 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_package_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe iso-codes-4.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1398 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_fetch)
NOTE: Running task 1440 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1540 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: Running task 1547 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_fetch)
NOTE: Running task 1569 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_fetch)
NOTE: Running task 1575 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_fetch)
NOTE: Running task 1576 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_fetch)
NOTE: Running task 1582 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_fetch)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 1736 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_unpack)
NOTE: Running task 1760 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1763 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_fetch)
NOTE: Running task 1778 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: Running task 1780 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_write_config)
NOTE: Running task 1791 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_write_config)
NOTE: Running task 1792 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_write_config)
NOTE: Running task 1793 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_write_config)
NOTE: Running task 1794 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_fetch)
NOTE: recipe vala-0.56.0-r0: task do_package_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.11-r0: task do_fetch: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_fetch: Started
NOTE: Running task 1855 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_fetch)
NOTE: recipe libxft-1_2.3.4-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.50.6-r0: task do_fetch: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1870 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_fetch)
NOTE: Running task 1884 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_fetch)
NOTE: Running task 1885 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_unpack)
NOTE: Running task 1886 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.6-r0: task do_fetch: Succeeded
NOTE: Running task 1887 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: Running task 1888 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_unpack)
NOTE: Running task 1889 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_unpack)
NOTE: Running task 1890 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_unpack)
NOTE: Running task 1891 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.8-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.8-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_write_config: Started
NOTE: recipe fribidi-1.0.11-r0: task do_write_config: Started
NOTE: Running task 1892 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_write_config: Started
NOTE: Running task 1893 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.6-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_fetch: Started
NOTE: Running task 1894 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe atk-2.38.0-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_unpack: Started
NOTE: Running task 1895 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_unpack)
NOTE: Running task 1896 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Succeeded
NOTE: recipe harfbuzz-4.2.0-r0: task do_write_config: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_write_config: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_fetch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.44.0-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 1897 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_unpack)
NOTE: Running task 1898 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-core-2.44.0-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1899 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_fetch)
NOTE: Running task 1901 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_fetch)
NOTE: Running task 1906 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_write_config)
NOTE: Running task 1907 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Started
NOTE: recipe pango-1.50.6-r0: task do_write_config: Succeeded
NOTE: recipe harfbuzz-4.2.0-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.11-r0: task do_unpack: Started
NOTE: Running task 1908 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_patch)
NOTE: Running task 1910 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_unpack)
NOTE: Running task 1911 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_fetch)
NOTE: Running task 1912 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_fetch)
NOTE: Running task 1923 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_fetch)
NOTE: Running task 1927 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_unpack)
NOTE: Running task 1928 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_write_config)
NOTE: Running task 1929 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_unpack: Started
NOTE: recipe pango-1.50.6-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1930 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 1937 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_fetch)
NOTE: recipe libxft-1_2.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 1984 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_fetch)
NOTE: recipe harfbuzz-4.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.8-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2010 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_patch)
NOTE: recipe atk-2.38.0-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Started
NOTE: Running task 2017 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_write_config)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_fetch: Started
NOTE: Running task 2026 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_write_config)
NOTE: Running task 2027 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_fetch)
NOTE: Running task 2035 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_fetch)
NOTE: Running task 2051 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_write_config)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_write_config: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_patch: Started
NOTE: Running task 2058 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_write_config)
NOTE: Running task 2062 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_unpack)
NOTE: Running task 2063 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2064 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_unpack)
NOTE: Running task 2065 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_write_config: Started
NOTE: recipe at-spi2-core-2.44.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2066 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_fetch)
NOTE: Running task 2067 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 2089 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_unpack)
NOTE: Running task 2090 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2108 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Succeeded
NOTE: Running task 2109 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libxi-1_1.8-r0: task do_unpack: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_fetch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_fetch: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_write_config: Started
NOTE: recipe libwpe-1.12.0-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-core-2.44.0-r0: task do_write_config: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_patch: Started
NOTE: Running task 2112 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_unpack)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Started
NOTE: Running task 2113 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_patch)
NOTE: Running task 2114 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_fetch)
NOTE: Running task 2115 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 2116 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_fetch)
NOTE: Running task 2117 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_fetch)
NOTE: Running task 2118 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: Running task 2119 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_fetch)
NOTE: recipe vala-0.56.0-r0: task do_package_setscene: Succeeded
NOTE: Running task 2147 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_fetch)
NOTE: Running task 2148 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_fetch)
NOTE: Running task 2149 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_fetch)
NOTE: Running task 2150 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_fetch)
NOTE: Running task 2151 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_fetch)
NOTE: Running task 2152 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_fetch)
NOTE: Running task 2153 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_fetch)
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_fetch: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_fetch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Started
NOTE: Running task 2154 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_patch)
NOTE: Running task 2155 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_unpack)
NOTE: recipe gtk+3-3.24.33-r0: task do_fetch: Started
NOTE: recipe gtk+3-3.24.33-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.44.0-r0: task do_write_config: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_write_config: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_write_config: Started
NOTE: recipe json-glib-1.6.6-r0: task do_write_config: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2157 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: recipe libepoxy-1.5.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.11-r0: task do_unpack: Succeeded
NOTE: Running task 2158 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_patch)
NOTE: recipe atk-2.38.0-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Succeeded
NOTE: Running task 2159 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_patch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_unpack: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_fetch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 2160 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_unpack)
NOTE: Running task 2163 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_unpack)
NOTE: Running task 2164 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running task 2165 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: Running task 2166 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_patch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: Running task 2167 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: Running task 2168 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_unpack)
NOTE: Running task 2169 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_unpack)
NOTE: Running task 2175 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_unpack)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_fetch: Started
NOTE: recipe libxv-1.0.11-r0: task do_fetch: Started
NOTE: Running task 2176 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: recipe aspell-0.60.8-r0: task do_fetch: Started
NOTE: Running task 2177 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_patch)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: Running task 2178 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_fetch)
NOTE: Running task 2179 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_fetch)
NOTE: recipe aspell-0.60.8-r0: task do_fetch: Succeeded
NOTE: Running task 2208 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: Running task 2209 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_fetch)
NOTE: Running task 2212 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_fetch)
NOTE: Running task 2214 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe libxv-1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_fetch: Started
NOTE: Running task 2215 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: Running task 2216 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_unpack)
NOTE: recipe orc-0.4.32-r0: task do_fetch: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_fetch: Started
NOTE: recipe libxslt-1.1.35-r0: task do_fetch: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_fetch: Started
NOTE: recipe enchant2-2.3.3-r0: task do_fetch: Started
NOTE: recipe enchant2-2.3.3-r0: task do_fetch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_fetch: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_fetch: Started
NOTE: recipe libnotify-0.7.9-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_patch: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_unpack: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_fetch: Succeeded
NOTE: Running task 2217 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_unpack)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Started
NOTE: Running task 2218 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_unpack)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe atk-2.38.0-r0: task do_patch: Started
NOTE: Running task 2219 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_patch)
NOTE: recipe libsecret-0.20.5-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_patch: Started
NOTE: recipe libwpe-1.12.0-r0: task do_unpack: Started
NOTE: Running task 2220 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_generate_toolchain_file)
NOTE: Running task 2221 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2222 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_patch)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_unpack: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_patch: Succeeded
NOTE: recipe gtk+3-3.24.33-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_patch: Succeeded
NOTE: Running task 2223 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_patch)
NOTE: Running task 2224 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_unpack)
NOTE: Running task 2225 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Started
NOTE: Running task 2226 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_patch)
NOTE: recipe pango-1.50.6-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.44.0-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_unpack: Started
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Started
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Started
NOTE: Running task 2227 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe p11-kit-0.24.1-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_patch: Succeeded
NOTE: Running task 2228 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_unpack: Started
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: Running task 2234 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2235 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_patch)
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Succeeded
NOTE: Running task 2239 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_deploy_source_date_epoch)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe p11-kit-0.24.1-r0: task do_fetch: Succeeded
NOTE: recipe webkitgtk-2.36.0-r0: task do_fetch: Started
NOTE: recipe libwpe-1.12.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2245 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_fetch: Started
NOTE: Running task 2246 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_patch)
NOTE: Running task 2247 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: recipe webkitgtk-2.36.0-r0: task do_fetch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_unpack: Started
NOTE: recipe orc-0.4.32-r0: task do_unpack: Started
NOTE: Running task 2258 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_unpack)
NOTE: Running task 2259 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_unpack)
NOTE: Running task 2260 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_unpack)
NOTE: Running task 2261 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_unpack)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_unpack: Started
NOTE: Running task 2262 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_unpack)
NOTE: Running task 2263 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_unpack)
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_fetch: Succeeded
NOTE: Running task 2264 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_unpack)
NOTE: Running task 2265 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_unpack)
NOTE: Running task 2266 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_unpack)
NOTE: recipe libwpe-1.12.0-r0: task do_unpack: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_unpack: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_generate_toolchain_file: Started
NOTE: Running task 2270 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_patch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Started
NOTE: recipe libxv-1.0.11-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2272 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_patch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2277 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_fetch)
NOTE: Running task 2279 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_fetch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_patch: Started
NOTE: recipe libxi-1_1.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-core-2.44.0-r0: task do_patch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2280 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: Running task 2281 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_fetch)
NOTE: recipe fribidi-1.0.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_unpack: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2282 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: recipe pango-1.50.6-r0: task do_patch: Started
NOTE: recipe libxslt-1.1.35-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2283 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe enchant2-2.3.3-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_patch: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_unpack: Started
NOTE: Running task 2285 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_unpack)
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Started
NOTE: recipe aspell-0.60.8-r0: task do_unpack: Succeeded
NOTE: Running task 2300 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2301 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2307 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_unpack)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to cb21232c5a28826a835c7b82a0929a680de568bfa22b4e8f2902c7990c647f3e
NOTE: recipe orc-0.4.32-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_unpack: Started
NOTE: recipe libsecret-0.20.5-r0: task do_unpack: Started
NOTE: recipe libnotify-0.7.9-r0: task do_unpack: Started
NOTE: recipe libwpe-1.12.0-r0: task do_patch: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_unpack: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: Running task 2321 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_patch)
NOTE: recipe p11-kit-0.24.1-r0: task do_unpack: Started
NOTE: Running task 2322 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_patch)
NOTE: Running task 2323 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_patch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Succeeded
NOTE: Running task 2326 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_write_config)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_patch: Started
NOTE: Running task 2327 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_unpack: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe libhandy-1.5.0-r0: task do_fetch: Started
NOTE: Running task 2328 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2329 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: Running task 2330 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdazzle-3.44.0-r0: task do_fetch: Succeeded
NOTE: recipe gcr-3.40.0-r0: task do_fetch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 2331 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2332 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_patch)
NOTE: recipe libhandy-1.5.0-r0: task do_fetch: Succeeded
NOTE: recipe gcr-3.40.0-r0: task do_fetch: Succeeded
NOTE: Running task 2333 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_patch)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_patch: Started
NOTE: recipe webkitgtk-2.36.0-r0: task do_unpack: Started
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_patch: Started
NOTE: recipe aspell-0.60.8-r0: task do_patch: Started
NOTE: Running task 2373 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_patch)
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: recipe pango-1.50.6-r0: task do_patch: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_patch: Started
NOTE: Running task 2390 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_patch)
NOTE: Running task 2405 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_configure)
NOTE: recipe atk-2.38.0-r0: task do_patch: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_unpack: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_write_config: Started
NOTE: Running task 2406 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2407 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: Running task 2408 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe libxft-1_2.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2409 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2410 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_patch)
NOTE: Running task 2411 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 2415 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe fribidi-1.0.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_patch: Started
NOTE: Running task 2416 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_patch)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: Running task 2417 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_configure)
NOTE: recipe libxi-1_1.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2418 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_configure)
NOTE: recipe enchant2-2.3.3-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_patch: Succeeded
NOTE: Running task 2419 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_configure)
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_unpack: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_write_config: Succeeded
NOTE: Running task 2420 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_patch)
NOTE: Running task 2421 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_patch)
NOTE: Running task 2422 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 2423 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_write_config)
NOTE: Running task 2424 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_deploy_source_date_epoch)
NOTE: recipe harfbuzz-4.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_patch: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_patch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_configure: Started
NOTE: Running task 2425 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2426 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_patch)
NOTE: Running task 2427 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.9-r0: task do_patch: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_unpack: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: Running task 2428 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_deploy_source_date_epoch)
NOTE: Running task 2429 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pango-1.50.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2430 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe atk-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2431 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_deploy_source_date_epoch)
NOTE: recipe libsecret-0.20.5-r0: task do_patch: Started
NOTE: Running task 2432 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_patch)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_patch: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_configure: Started
NOTE: Running task 2433 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_unpack)
NOTE: Running task 2435 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_unpack)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_patch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_patch: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_patch: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_configure: Started
NOTE: Running task 2436 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_patch)
NOTE: Running task 2437 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_unpack)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: Running task 2438 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 2439 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_configure: Started
NOTE: Running task 2444 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_patch: Started
NOTE: Running task 2445 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_configure)
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Started
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2449 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_fetch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_patch: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_patch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe orc-0.4.32-r0: task do_write_config: Started
NOTE: recipe orc-0.4.32-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_patch: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxv-1.0.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2472 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_configure)
NOTE: recipe libwpe-1.12.0-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_unpack: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxslt-1.1.35-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2499 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_generate_toolchain_file)
NOTE: Running task 2500 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2506 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_patch)
NOTE: Running task 2507 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtasn1-4.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libhandy-1.5.0-r0: task do_unpack: Started
NOTE: recipe json-glib-1.6.6-r0: task do_patch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_unpack: Started
NOTE: Running task 2508 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_write_config)
NOTE: Running task 2509 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2510 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2511 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe json-glib-1.6.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_write_config: Succeeded
NOTE: Running task 2512 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2513 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe gcr-3.40.0-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe aspell-0.60.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_patch: Succeeded
NOTE: Running task 2514 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_patch: Started
NOTE: recipe vala-0.56.0-r0: task do_packagedata: Started
NOTE: Running task 2515 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_write_config)
NOTE: Running task 2516 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_write_config)
NOTE: Running task 2517 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2518 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxslt-1.1.35-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe p11-kit-0.24.1-r0: task do_patch: Succeeded
NOTE: recipe epiphany-42.2-r0: task do_fetch: Started
NOTE: Running task 2519 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2520 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.50.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2521 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_deploy_source_date_epoch)
NOTE: Running task 2522 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_write_config)
NOTE: Running task 2523 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_deploy_source_date_epoch)
NOTE: recipe epiphany-42.2-r0: task do_fetch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Started
NOTE: recipe atk-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2524 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_patch: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_patch: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2525 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxslt-1.1.35-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2526 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_configure)
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_patch: Started
NOTE: Running task 2527 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2528 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe enchant2-2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2529 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_write_config)
NOTE: Running task 2530 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2548 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe harfbuzz-4.2.0-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: Running task 2549 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_unpack: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_patch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2562 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_patch)
NOTE: recipe json-glib-1.6.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2577 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_write_config: Started
NOTE: recipe libsecret-0.20.5-r0: task do_write_config: Started
NOTE: recipe libsecret-0.20.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2578 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_write_config: Succeeded
NOTE: Running task 2579 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_patch)
NOTE: recipe libsecret-0.20.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxslt-1.1.35-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnotify-0.7.9-r0: task do_write_config: Started
NOTE: Running task 2580 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_write_config)
NOTE: Running task 2581 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2584 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_unpack)
NOTE: recipe libepoxy-1.5.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libhandy-1.5.0-r0: task do_unpack: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Started
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcr-3.40.0-r0: task do_unpack: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_write_config: Succeeded
NOTE: Running task 2618 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_write_config: Succeeded
NOTE: Running task 2619 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_configure)
NOTE: recipe libtasn1-4.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe atk-2.38.0-r0: task do_configure: Started
NOTE: recipe libnotify-0.7.9-r0: task do_write_config: Succeeded
NOTE: Running task 2620 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_patch)
NOTE: Running task 2621 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_patch)
NOTE: recipe libxv-1.0.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_write_config: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: Running task 2622 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_configure)
NOTE: recipe libwpe-1.12.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2630 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_write_config)
NOTE: Running task 2633 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_write_config)
NOTE: Running task 2634 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_write_config)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe orc-0.4.32-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vala-0.56.0-r0: task do_packagedata: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2677 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_configure)
NOTE: recipe harfbuzz-4.2.0-r0: task do_patch: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_patch: Started
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_write_config: Started
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2699 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_configure)
NOTE: recipe p11-kit-0.24.1-r0: task do_write_config: Succeeded
NOTE: recipe epiphany-42.2-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_patch: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2700 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libsecret-0.20.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_configure: Started
NOTE: Running task 2720 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libdazzle-3.44.0-r0: task do_patch: Succeeded
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_write_config: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_configure: Started
NOTE: Running task 2721 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_configure)
NOTE: recipe harfbuzz-4.2.0-r0: task do_patch: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_configure: Started
NOTE: recipe libhandy-1.5.0-r0: task do_patch: Started
NOTE: Running task 2722 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2725 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_write_config)
NOTE: Running task 2726 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxslt-1.1.35-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcr-3.40.0-r0: task do_patch: Started
NOTE: recipe libhandy-1.5.0-r0: task do_write_config: Started
NOTE: recipe libnotify-0.7.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_write_config: Started
NOTE: recipe gcr-3.40.0-r0: task do_write_config: Started
NOTE: Running task 2773 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_configure)
NOTE: Running task 2774 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_configure)
NOTE: Running task 2775 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_configure)
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_configure: Started
NOTE: recipe orc-0.4.32-r0: task do_configure: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe p11-kit-0.24.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2812 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_configure)
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libhandy-1.5.0-r0: task do_write_config: Succeeded
NOTE: recipe gcr-3.40.0-r0: task do_write_config: Succeeded
NOTE: Running task 2813 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_configure)
NOTE: recipe epiphany-42.2-r0: task do_write_config: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_configure: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2814 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_configure)
NOTE: Running task 2815 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_configure)
NOTE: recipe libxslt-1.1.35-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Started
NOTE: recipe libhandy-1.5.0-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_configure: Started
NOTE: recipe epiphany-42.2-r0: task do_write_config: Succeeded
NOTE: Running task 2816 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libtasn1-4.18.0-r0: task do_configure: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_configure: Started
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Started
NOTE: recipe gcr-3.40.0-r0: task do_patch: Succeeded
NOTE: Running task 2817 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Started
NOTE: recipe libhandy-1.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-4.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcr-3.40.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2818 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 383898a484d5745ad8dfc12903788320e353f730bca51d01c97a5e5c0c4bdc03
NOTE: recipe libsecret-0.20.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libhandy-1.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2825 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_configure)
NOTE: recipe harfbuzz-4.2.0-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_configure: Succeeded
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2826 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_compile)
NOTE: Running task 2827 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_configure)
NOTE: recipe gcr-3.40.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe epiphany-42.2-r0: task do_unpack: Succeeded
NOTE: Running task 2828 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_patch)
NOTE: recipe libsecret-0.20.5-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_compile: Started
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_configure: Started
NOTE: recipe epiphany-42.2-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.33-r0: task do_unpack: Succeeded
NOTE: Running task 2829 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_patch)
NOTE: recipe gtk+3-3.24.33-r0: task do_patch: Started
NOTE: recipe libwpe-1.12.0-r0: task do_configure: Succeeded
NOTE: Running task 2830 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_compile)
NOTE: recipe epiphany-42.2-r0: task do_patch: Succeeded
NOTE: Running task 2831 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2832 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_populate_lic)
NOTE: recipe libwpe-1.12.0-r0: task do_compile: Started
NOTE: recipe epiphany-42.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe epiphany-42.2-r0: task do_populate_lic: Started
NOTE: recipe gtk+3-3.24.33-r0: task do_patch: Succeeded
NOTE: Running task 2833 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_deploy_source_date_epoch)
NOTE: recipe epiphany-42.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe epiphany-42.2-r0: task do_populate_lic: Succeeded
NOTE: recipe webkitgtk-2.36.0-r0: task do_unpack: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_populate_lic unihash changed to 5419e8ff66bfb975b34bd8fdc3be70664192c37a631990aa8d59b0ff4744a987
NOTE: Running task 2834 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_patch)
NOTE: recipe gtk+3-3.24.33-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe webkitgtk-2.36.0-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.11-r0: task do_configure: Succeeded
NOTE: Running task 2835 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_compile)
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Succeeded
NOTE: Running task 2836 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe gtk+3-3.24.33-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Started
NOTE: recipe orc-0.4.32-r0: task do_configure: Succeeded
NOTE: Running task 2837 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_compile)
NOTE: recipe libepoxy-1.5.9-r0: task do_configure: Succeeded
NOTE: Running task 2838 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_compile)
NOTE: recipe orc-0.4.32-r0: task do_compile: Started
NOTE: recipe libwpe-1.12.0-r0: task do_compile: Succeeded
NOTE: recipe webkitgtk-2.36.0-r0: task do_patch: Succeeded
NOTE: Running task 2839 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_install)
NOTE: Running task 2840 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_generate_toolchain_file)
NOTE: Running task 2841 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.9-r0: task do_compile: Started
NOTE: recipe atk-2.38.0-r0: task do_configure: Succeeded
NOTE: Running task 2842 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_compile)
NOTE: recipe webkitgtk-2.36.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe webkitgtk-2.36.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwpe-1.12.0-r0: task do_install: Started
NOTE: recipe webkitgtk-2.36.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_compile: Started
NOTE: recipe webkitgtk-2.36.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_configure: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_install: Succeeded
NOTE: Running task 2843 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_compile)
NOTE: Running task 2844 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_populate_sysroot)
NOTE: Running task 2845 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_package)
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_compile: Started
NOTE: recipe libwpe-1.12.0-r0: task do_populate_sysroot: Started
NOTE: recipe libwpe-1.12.0-r0: task do_package: Started
NOTE: recipe json-glib-1.6.6-r0: task do_configure: Succeeded
NOTE: Running task 2846 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_configure_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_configure_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2847 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_compile)
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_compile: Succeeded
NOTE: Running task 2848 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_install)
NOTE: recipe json-glib-1.6.6-r0: task do_compile: Started
NOTE: recipe libwpe-1.12.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_configure: Succeeded
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_install: Started
NOTE: Running task 2849 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_compile)
NOTE: recipe libsecret-0.20.5-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Succeeded
NOTE: Running task 2850 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 2851 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_compile: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_compile: Succeeded
NOTE: Running task 2852 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_install)
NOTE: Running task 2853 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.11-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_install: Started
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_install: Succeeded
NOTE: Running task 2854 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_package)
NOTE: Running task 2855 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_populate_sysroot)
NOTE: recipe orc-0.4.32-r0: task do_compile: Succeeded
NOTE: Running task 2856 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_install)
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_populate_sysroot: Started
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_install: Succeeded
NOTE: Running task 2857 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_populate_sysroot)
NOTE: Running task 2858 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_package)
NOTE: recipe orc-0.4.32-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_package: Started
NOTE: recipe fribidi-1.0.11-r0: task do_install: Succeeded
NOTE: Running task 2859 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_populate_sysroot)
NOTE: Running task 2860 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_package)
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.11-r0: task do_package: Started
NOTE: recipe libwpe-1.12.0-r0: task do_package: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 2861 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: Running task 2862 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_install: Succeeded
NOTE: Running task 2863 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_populate_sysroot)
NOTE: Running task 2864 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_package)
NOTE: recipe libwpe-1.12.0-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2865 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_compile)
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot: Started
NOTE: recipe orc-0.4.32-r0: task do_package: Started
NOTE: recipe fribidi-1.0.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe harfbuzz-4.2.0-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Succeeded
NOTE: Running task 2866 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: Running task 2867 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: recipe libwpe-1.12.0-r0: task do_packagedata: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Started
NOTE: Running task 2868 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Started
NOTE: Running task 2869 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2870 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_configure: Succeeded
NOTE: Running task 2871 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2872 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_compile)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_compile: Started
NOTE: recipe atk-2.38.0-r0: task do_compile: Succeeded
NOTE: Running task 2873 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_install)
NOTE: recipe atk-2.38.0-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2874 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.11-r0: task do_package: Succeeded
NOTE: Running task 2875 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_packagedata)
NOTE: recipe fribidi-1.0.11-r0: task do_packagedata: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_package: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_install: Succeeded
NOTE: Running task 2876 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_packagedata)
NOTE: Running task 2877 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_populate_sysroot)
NOTE: Running task 2878 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata: Started
NOTE: recipe atk-2.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe atk-2.38.0-r0: task do_package: Started
NOTE: recipe fribidi-1.0.11-r0: task do_packagedata: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_package: Succeeded
NOTE: Running task 2879 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_packagedata)
NOTE: recipe orc-0.4.32-r0: task do_packagedata: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_compile: Succeeded
NOTE: Running task 2880 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_compile_ptest_base)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 2881 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe json-glib-1.6.6-r0: task do_compile_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: Running task 2882 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_install)
NOTE: recipe atk-2.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_install: Started
NOTE: recipe orc-0.4.32-r0: task do_packagedata: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_install: Succeeded
NOTE: Running task 2883 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_install_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_install_ptest_base: Started
NOTE: recipe libsecret-0.20.5-r0: task do_compile: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2884 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_install)
NOTE: Running task 2885 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_populate_sysroot)
NOTE: Running task 2886 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_package)
NOTE: recipe libsecret-0.20.5-r0: task do_install: Started
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot: Started
NOTE: recipe json-glib-1.6.6-r0: task do_package: Started
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_package: Succeeded
NOTE: Running task 2887 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_packagedata)
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_packagedata: Started
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_install: Succeeded
NOTE: Running task 2888 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_populate_sysroot)
NOTE: Running task 2889 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_package)
NOTE: recipe libsecret-0.20.5-r0: task do_populate_sysroot: Started
NOTE: recipe libsecret-0.20.5-r0: task do_package: Started
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2890 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_package_write_rpm)
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_package_write_rpm: Started
NOTE: recipe libsecret-0.20.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_configure: Succeeded
NOTE: Running task 2891 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2892 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_compile: Started
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Succeeded
NOTE: Running task 2893 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_compile)
NOTE: recipe libxft-1_2.3.4-r0: task do_configure: Succeeded
NOTE: Running task 2894 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_compile)
NOTE: recipe libwebp-1.2.2-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_compile: Started
NOTE: recipe aspell-0.60.8-r0: task do_configure: Succeeded
NOTE: Running task 2895 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_compile)
NOTE: recipe aspell-0.60.8-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2896 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Succeeded
NOTE: Running task 2897 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_compile: Succeeded
NOTE: Running task 2898 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_install)
NOTE: recipe libxi-1_1.8-r0: task do_configure: Succeeded
NOTE: Running task 2899 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_compile)
NOTE: recipe libxft-1_2.3.4-r0: task do_install: Started
NOTE: recipe libxi-1_1.8-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Succeeded
NOTE: Running task 2900 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2901 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_package_write_rpm)
NOTE: recipe atk-2.38.0-r0: task do_package: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_install: Succeeded
NOTE: Running task 2902 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_install)
NOTE: Running task 2903 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_packagedata)
NOTE: Running task 2904 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_populate_sysroot)
NOTE: Running task 2905 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_package)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_package_write_rpm: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Started
NOTE: recipe atk-2.38.0-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_configure: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_package: Started
NOTE: recipe libxv-1.0.11-r0: task do_configure: Succeeded
NOTE: Running task 2906 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_install)
NOTE: Running task 2907 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_compile)
NOTE: Running task 2908 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_compile)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Started
NOTE: Running task 2909 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe libxslt-1.1.35-r0: task do_configure: Succeeded
NOTE: Running task 2910 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe libxslt-1.1.35-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2911 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 2912 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_package)
NOTE: recipe libxft-1_2.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: Running task 2913 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot)
NOTE: Running task 2914 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Started
NOTE: recipe libxi-1_1.8-r0: task do_compile: Succeeded
NOTE: Running task 2915 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_install)
NOTE: recipe atk-2.38.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_compile: Succeeded
NOTE: Running task 2916 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_install)
NOTE: recipe libxi-1_1.8-r0: task do_install: Started
NOTE: recipe libxv-1.0.11-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 2917 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_compile: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2918 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_install)
NOTE: Running task 2919 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_install: Started
NOTE: recipe libxi-1_1.8-r0: task do_install: Succeeded
NOTE: Running task 2920 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_populate_sysroot)
NOTE: Running task 2921 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_package)
NOTE: recipe libxv-1.0.11-r0: task do_install: Succeeded
NOTE: Running task 2922 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_populate_sysroot)
NOTE: Running task 2923 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_package)
NOTE: recipe libxi-1_1.8-r0: task do_package: Started
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot: Started
NOTE: recipe libxv-1.0.11-r0: task do_package: Started
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 2924 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 2925 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_install: Succeeded
NOTE: Running task 2926 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_populate_sysroot)
NOTE: Running task 2927 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_package)
NOTE: recipe libsecret-0.20.5-r0: task do_package: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_package: Succeeded
NOTE: Running task 2928 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.9-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_package: Started
NOTE: Running task 2929 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_packagedata)
NOTE: recipe libsecret-0.20.5-r0: task do_packagedata: Started
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2930 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2931 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Succeeded
NOTE: Running task 2932 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_package: Succeeded
NOTE: Running task 2933 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_compile: Started
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2934 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: Running task 2935 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2936 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2937 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: recipe libsecret-0.20.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe aspell-0.60.8-r0: task do_compile: Succeeded
NOTE: Running task 2938 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_install)
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Succeeded
NOTE: Running task 2939 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata)
NOTE: recipe aspell-0.60.8-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2940 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2941 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_configure)
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_compile: Succeeded
NOTE: Running task 2942 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_compile_ptest_base)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_compile: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_compile_ptest_base: Started
NOTE: Running task 2943 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_install)
NOTE: recipe libxv-1.0.11-r0: task do_package: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2944 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_install)
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2945 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2946 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_install)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_install: Started
NOTE: Running task 2947 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_configure)
NOTE: recipe libxv-1.0.11-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_install: Started
NOTE: recipe libxi-1_1.8-r0: task do_package: Succeeded
NOTE: Running task 2948 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 2949 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libxi-1_1.8-r0: task do_packagedata: Started
NOTE: recipe libxv-1.0.11-r0: task do_packagedata: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_package: Succeeded
NOTE: Running task 2950 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.9-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.8-r0: task do_packagedata: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_install: Succeeded
NOTE: Running task 2951 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_populate_sysroot)
NOTE: Running task 2952 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_package: Started
NOTE: Running task 2953 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 2954 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_package)
NOTE: recipe libepoxy-1.5.9-r0: task do_packagedata: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Started
NOTE: recipe libxslt-1.1.35-r0: task do_install: Succeeded
NOTE: Running task 2955 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_compile: Succeeded
NOTE: Running task 2956 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_package)
NOTE: Running task 2957 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_compile_ptest_base)
NOTE: recipe libxslt-1.1.35-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libxslt-1.1.35-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2958 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2959 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_install)
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_compile: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2960 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_install)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_install: Started
NOTE: recipe libwebp-1.2.2-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_install: Succeeded
NOTE: Running task 2961 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_install_ptest_base)
NOTE: recipe libxslt-1.1.35-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_install_ptest_base: Started
NOTE: recipe enchant2-2.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2962 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2963 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_populate_sysroot)
NOTE: recipe enchant2-2.3.3-r0: task do_configure: Started
NOTE: Running task 2964 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_package: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_configure: Succeeded
NOTE: Running task 2965 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_compile)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_compile: Started
NOTE: recipe libwebp-1.2.2-r0: task do_install: Succeeded
NOTE: Running task 2966 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_populate_sysroot)
NOTE: Running task 2967 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_package: Started
NOTE: recipe libwebp-1.2.2-r0: task do_populate_sysroot: Started
NOTE: Running task 2968 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnotify-0.7.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_install: Succeeded
NOTE: Running task 2969 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_install_ptest_base)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_install_ptest_base: Started
NOTE: recipe libwebp-1.2.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2970 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_populate_sysroot)
NOTE: Running task 2971 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_package)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_package: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_compile: Succeeded
NOTE: Running task 2972 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_install)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_install: Started
NOTE: recipe libnotify-0.7.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2973 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_configure)
NOTE: recipe libnotify-0.7.9-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_package: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2974 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_packagedata)
NOTE: Running task 2975 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_packagedata)
NOTE: recipe libxslt-1.1.35-r0: task do_packagedata: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_install: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Started
NOTE: Running task 2976 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_populate_sysroot)
NOTE: Running task 2977 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_package)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_populate_sysroot: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_package: Started
NOTE: recipe libxslt-1.1.35-r0: task do_packagedata: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_compile: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2978 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_install)
NOTE: recipe libpsl-0.21.1-r0: task do_install: Started
NOTE: recipe libwebp-1.2.2-r0: task do_package: Succeeded
NOTE: Running task 2979 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_packagedata)
NOTE: recipe libwebp-1.2.2-r0: task do_packagedata: Started
NOTE: recipe aspell-0.60.8-r0: task do_package: Succeeded
NOTE: Running task 2980 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_packagedata)
NOTE: recipe aspell-0.60.8-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.2.2-r0: task do_packagedata: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_configure: Succeeded
NOTE: Running task 2981 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_compile)
NOTE: recipe libpsl-0.21.1-r0: task do_install: Succeeded
NOTE: Running task 2982 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_populate_sysroot)
NOTE: Running task 2983 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_package)
NOTE: recipe libtasn1-4.18.0-r0: task do_compile: Started
NOTE: recipe libpsl-0.21.1-r0: task do_package: Started
NOTE: recipe libpsl-0.21.1-r0: task do_populate_sysroot: Started
NOTE: recipe aspell-0.60.8-r0: task do_packagedata: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: Running task 2984 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_compile)
NOTE: recipe libnotify-0.7.9-r0: task do_configure: Succeeded
NOTE: Running task 2985 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_compile)
NOTE: recipe libpsl-0.21.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Started
NOTE: Running task 2986 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnotify-0.7.9-r0: task do_compile: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_package: Succeeded
NOTE: Running task 2987 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_packagedata)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2988 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_configure)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_compile: Succeeded
NOTE: Running task 2989 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_install)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_configure: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_install: Started
NOTE: recipe libpsl-0.21.1-r0: task do_package: Succeeded
NOTE: Running task 2990 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_packagedata)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_packagedata: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 2991 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe libpsl-0.21.1-r0: task do_packagedata: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Succeeded
NOTE: Running task 2992 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_install)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_install: Succeeded
NOTE: Running task 2993 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_populate_sysroot)
NOTE: Running task 2994 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_package)
NOTE: recipe libtheora-1.1.1-r1: task do_install: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_package: Started
NOTE: recipe libtheora-1.1.1-r1: task do_install: Succeeded
NOTE: Running task 2995 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 2996 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 2997 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_configure: Succeeded
NOTE: Running task 2998 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_compile)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_compile: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 2999 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 3000 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 3001 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_compile: Succeeded
NOTE: Running task 3002 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 3003 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_install)
NOTE: recipe libnotify-0.7.9-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Succeeded
NOTE: Running task 3004 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_package: Succeeded
NOTE: Running task 3005 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_packagedata)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 3006 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 3007 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_package: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Started
NOTE: Running task 3008 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_packagedata)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_install: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_packagedata: Started
NOTE: Running task 3009 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_populate_sysroot)
NOTE: recipe libnotify-0.7.9-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3010 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-core-2.44.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_packagedata: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 3011 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_package)
NOTE: Running task 3012 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe libnotify-0.7.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_compile: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe libnotify-0.7.9-r0: task do_package: Started
NOTE: Running task 3013 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_install)
NOTE: recipe libtasn1-4.18.0-r0: task do_install: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-core-2.44.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3014 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_configure)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 3015 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_package: Succeeded
NOTE: Running task 3016 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_packagedata)
NOTE: recipe libtasn1-4.18.0-r0: task do_install: Succeeded
NOTE: Running task 3017 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_populate_sysroot)
NOTE: Running task 3018 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_package)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_populate_sysroot: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_package: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3019 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_packagedata: Succeeded
NOTE: recipe p11-kit-0.24.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3020 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_configure)
NOTE: recipe p11-kit-0.24.1-r0: task do_configure: Started
NOTE: recipe libnotify-0.7.9-r0: task do_package: Succeeded
NOTE: Running task 3021 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_packagedata)
NOTE: recipe libnotify-0.7.9-r0: task do_packagedata: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_package: Succeeded
NOTE: Running task 3022 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_packagedata)
NOTE: recipe libnotify-0.7.9-r0: task do_packagedata: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_packagedata: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_packagedata: Succeeded
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe at-spi2-core-2.44.0-r0: task do_configure: Succeeded
NOTE: Running task 3023 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_compile)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_compile: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_compile: Succeeded
NOTE: Running task 3024 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_install)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_install: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_install: Succeeded
NOTE: Running task 3025 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_populate_sysroot)
NOTE: Running task 3026 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_package)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_populate_sysroot: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_package: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_configure: Succeeded
NOTE: Running task 3027 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_compile)
NOTE: recipe p11-kit-0.24.1-r0: task do_compile: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.44.0-r0: task do_compile: Succeeded
NOTE: Running task 3028 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_install)
NOTE: recipe harfbuzz-4.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3029 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_install)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_install: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.44.0-r0: task do_install: Succeeded
NOTE: Running task 3030 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_populate_sysroot)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_package: Succeeded
NOTE: Running task 3031 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_package)
NOTE: Running task 3032 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_populate_sysroot: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_install: Succeeded
NOTE: recipe at-spi2-core-2.44.0-r0: task do_package: Started
NOTE: Running task 3033 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_populate_sysroot)
NOTE: Running task 3034 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_package)
NOTE: recipe harfbuzz-4.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.44.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3035 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3036 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3037 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_configure)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Started
NOTE: recipe pango-1.50.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3038 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_configure)
NOTE: recipe pango-1.50.6-r0: task do_configure: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Succeeded
NOTE: Running task 3039 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_compile)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_package: Succeeded
NOTE: Running task 3040 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_packagedata)
NOTE: recipe harfbuzz-4.2.0-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Succeeded
NOTE: Running task 3041 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_install)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_package: Succeeded
NOTE: Running task 3042 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_packagedata)
NOTE: recipe harfbuzz-4.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.44.0-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.44.0-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Succeeded
NOTE: Running task 3043 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_populate_sysroot)
NOTE: Running task 3044 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pango-1.50.6-r0: task do_configure: Succeeded
NOTE: Running task 3045 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_configure_ptest_base)
NOTE: recipe pango-1.50.6-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.50.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3046 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_compile)
NOTE: recipe pango-1.50.6-r0: task do_compile: Started
NOTE: recipe enchant2-2.3.3-r0: task do_configure: Succeeded
NOTE: Running task 3047 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_compile)
NOTE: recipe enchant2-2.3.3-r0: task do_compile: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Succeeded
NOTE: Running task 3048 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_packagedata)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_compile: Succeeded
NOTE: Running task 3049 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_install)
NOTE: recipe enchant2-2.3.3-r0: task do_install: Started
NOTE: recipe enchant2-2.3.3-r0: task do_install: Succeeded
NOTE: Running task 3050 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_populate_sysroot)
NOTE: Running task 3051 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_package)
NOTE: recipe enchant2-2.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe enchant2-2.3.3-r0: task do_package: Started
NOTE: recipe enchant2-2.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_package: Succeeded
NOTE: Running task 3052 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_packagedata)
NOTE: recipe enchant2-2.3.3-r0: task do_packagedata: Started
NOTE: recipe enchant2-2.3.3-r0: task do_packagedata: Succeeded
NOTE: recipe p11-kit-0.24.1-r0: task do_compile: Succeeded
NOTE: Running task 3053 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_install)
NOTE: recipe pango-1.50.6-r0: task do_compile: Succeeded
NOTE: Running task 3054 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_compile_ptest_base)
NOTE: recipe p11-kit-0.24.1-r0: task do_install: Started
NOTE: recipe pango-1.50.6-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.50.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3055 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_install)
NOTE: recipe pango-1.50.6-r0: task do_install: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_install: Succeeded
NOTE: Running task 3056 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_populate_sysroot)
NOTE: Running task 3057 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_package)
NOTE: recipe p11-kit-0.24.1-r0: task do_populate_sysroot: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_package: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pango-1.50.6-r0: task do_install: Succeeded
NOTE: Running task 3058 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_install_ptest_base)
NOTE: recipe pango-1.50.6-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.50.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3059 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_populate_sysroot)
NOTE: Running task 3060 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_package)
NOTE: recipe pango-1.50.6-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.50.6-r0: task do_package: Started
NOTE: recipe pango-1.50.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3061 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3062 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.33-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3063 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.33-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3064 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_configure)
NOTE: recipe gtk+3-3.24.33-r0: task do_configure: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_package: Succeeded
NOTE: Running task 3065 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_packagedata)
NOTE: recipe p11-kit-0.24.1-r0: task do_packagedata: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_packagedata: Succeeded
NOTE: recipe pango-1.50.6-r0: task do_package: Succeeded
NOTE: Running task 3066 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_packagedata)
NOTE: recipe pango-1.50.6-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.6-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_configure: Succeeded
NOTE: Running task 3067 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_compile: Succeeded
NOTE: Running task 3068 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_install: Succeeded
NOTE: Running task 3069 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_populate_sysroot)
NOTE: Running task 3070 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.33-r0: task do_configure: Succeeded
NOTE: Running task 3071 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_compile)
NOTE: recipe gtk+3-3.24.33-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_package: Succeeded
NOTE: Running task 3072 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_packagedata: Succeeded
NOTE: recipe gtk+3-3.24.33-r0: task do_compile: Succeeded
NOTE: Running task 3073 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_install)
NOTE: recipe gtk+3-3.24.33-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.33-r0: task do_install: Succeeded
NOTE: Running task 3074 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_populate_sysroot)
NOTE: Running task 3075 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_package)
NOTE: recipe gtk+3-3.24.33-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.33-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.33-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3076 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3077 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3078 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3079 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libhandy-1.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe webkitgtk-2.36.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcr-3.40.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libhandy-1.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3084 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_configure)
NOTE: recipe libdazzle-3.44.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3085 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_configure)
NOTE: recipe libhandy-1.5.0-r0: task do_configure: Started
NOTE: recipe webkitgtk-2.36.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3086 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_configure)
NOTE: recipe libdazzle-3.44.0-r0: task do_configure: Started
NOTE: recipe webkitgtk-2.36.0-r0: task do_configure: Started
NOTE: recipe gcr-3.40.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3087 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_configure)
NOTE: recipe gcr-3.40.0-r0: task do_configure: Started
NOTE: recipe libhandy-1.5.0-r0: task do_configure: Succeeded
NOTE: Running task 3088 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_compile)
NOTE: recipe libhandy-1.5.0-r0: task do_compile: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_configure: Succeeded
NOTE: Running task 3089 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_compile)
NOTE: recipe gcr-3.40.0-r0: task do_configure: Succeeded
NOTE: Running task 3090 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_compile)
NOTE: recipe libdazzle-3.44.0-r0: task do_compile: Started
NOTE: recipe gcr-3.40.0-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.33-r0: task do_package: Succeeded
NOTE: Running task 3091 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.33-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.33-r0: task do_packagedata: Succeeded
NOTE: recipe libhandy-1.5.0-r0: task do_compile: Succeeded
NOTE: Running task 3095 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_install)
NOTE: recipe libhandy-1.5.0-r0: task do_install: Started
NOTE: recipe libhandy-1.5.0-r0: task do_install: Succeeded
NOTE: Running task 3096 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_populate_sysroot)
NOTE: Running task 3097 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_package)
NOTE: recipe libhandy-1.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe libhandy-1.5.0-r0: task do_package: Started
NOTE: recipe libhandy-1.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_compile: Succeeded
NOTE: Running task 3098 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_install)
NOTE: recipe libdazzle-3.44.0-r0: task do_install: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_install: Succeeded
NOTE: Running task 3099 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_populate_sysroot)
NOTE: Running task 3100 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_package)
NOTE: recipe libdazzle-3.44.0-r0: task do_populate_sysroot: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_package: Started
NOTE: recipe gcr-3.40.0-r0: task do_compile: Succeeded
NOTE: Running task 3101 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_install)
NOTE: recipe gcr-3.40.0-r0: task do_install: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libhandy-1.5.0-r0: task do_package: Succeeded
NOTE: Running task 3102 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_packagedata)
NOTE: recipe gcr-3.40.0-r0: task do_install: Succeeded
NOTE: Running task 3103 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_populate_sysroot)
NOTE: Running task 3104 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_package)
NOTE: recipe libhandy-1.5.0-r0: task do_packagedata: Started
NOTE: recipe gcr-3.40.0-r0: task do_populate_sysroot: Started
NOTE: recipe gcr-3.40.0-r0: task do_package: Started
NOTE: recipe libhandy-1.5.0-r0: task do_packagedata: Succeeded
NOTE: recipe gcr-3.40.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_package: Succeeded
NOTE: Running task 3105 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_packagedata)
NOTE: recipe libdazzle-3.44.0-r0: task do_packagedata: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_packagedata: Succeeded
NOTE: recipe webkitgtk-2.36.0-r0: task do_configure: Succeeded
NOTE: Running task 3106 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_compile)
NOTE: recipe gcr-3.40.0-r0: task do_package: Succeeded
NOTE: Running task 3107 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_packagedata)
NOTE: recipe webkitgtk-2.36.0-r0: task do_compile: Started
NOTE: recipe gcr-3.40.0-r0: task do_packagedata: Started
NOTE: recipe gcr-3.40.0-r0: task do_packagedata: Succeeded
Bitbake still alive (no events for 600s). Active tasks:
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_compile
NOTE: recipe webkitgtk-2.36.0-r0: task do_compile: Succeeded
NOTE: Running task 3108 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_install)
NOTE: recipe webkitgtk-2.36.0-r0: task do_install: Started
NOTE: recipe webkitgtk-2.36.0-r0: task do_install: Succeeded
NOTE: Running task 3109 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_populate_sysroot)
NOTE: Running task 3110 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_package)
NOTE: recipe webkitgtk-2.36.0-r0: task do_populate_sysroot: Started
NOTE: recipe webkitgtk-2.36.0-r0: task do_package: Started
NOTE: recipe webkitgtk-2.36.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3111 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe epiphany-42.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe epiphany-42.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3112 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_configure)
NOTE: recipe epiphany-42.2-r0: task do_configure: Started
NOTE: recipe epiphany-42.2-r0: task do_configure: Succeeded
NOTE: Running task 3113 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_compile)
NOTE: recipe epiphany-42.2-r0: task do_compile: Started
NOTE: recipe epiphany-42.2-r0: task do_compile: Succeeded
NOTE: Running task 3114 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_install)
NOTE: recipe epiphany-42.2-r0: task do_install: Started
NOTE: recipe epiphany-42.2-r0: task do_install: Succeeded
NOTE: Running task 3115 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_populate_sysroot)
NOTE: recipe epiphany-42.2-r0: task do_populate_sysroot: Started
NOTE: recipe epiphany-42.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe webkitgtk-2.36.0-r0: task do_package: Succeeded
NOTE: Running task 3116 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_packagedata)
NOTE: recipe webkitgtk-2.36.0-r0: task do_packagedata: Started
NOTE: recipe webkitgtk-2.36.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3117 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_package)
NOTE: recipe epiphany-42.2-r0: task do_package: Started
NOTE: recipe epiphany-42.2-r0: task do_package: Succeeded
NOTE: Running task 3118 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_packagedata)
NOTE: recipe epiphany-42.2-r0: task do_packagedata: Started
NOTE: recipe epiphany-42.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3119 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_package_write_rpm)
NOTE: Running task 3120 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_package_qa)
NOTE: recipe epiphany-42.2-r0: task do_package_write_rpm: Started
NOTE: recipe epiphany-42.2-r0: task do_package_qa: Started
NOTE: recipe epiphany-42.2-r0: task do_package_qa: Succeeded
NOTE: recipe epiphany-42.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3121 of 3121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_build)
NOTE: Tasks Summary: Attempted 3121 tasks of which 2577 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: vala-0.56.0-r0 do_packagedata_setscene: QA Issue: Package version for package vala-src went backwards which would break package feeds (from 0:0.56.1-r0 to 0:0.56.0-r0) [version-going-backwards]
ERROR: vala-0.56.0-r0 do_packagedata_setscene: QA Issue: Package version for package vala-dbg went backwards which would break package feeds (from 0:0.56.1-r0 to 0:0.56.0-r0) [version-going-backwards]
ERROR: vala-0.56.0-r0 do_packagedata_setscene: QA Issue: Package version for package vala-staticdev went backwards which would break package feeds (from 0:0.56.1-r0 to 0:0.56.0-r0) [version-going-backwards]
ERROR: vala-0.56.0-r0 do_packagedata_setscene: QA Issue: Package version for package vala-dev went backwards which would break package feeds (from 0:0.56.1-r0 to 0:0.56.0-r0) [version-going-backwards]
ERROR: vala-0.56.0-r0 do_packagedata_setscene: QA Issue: Package version for package vala-doc went backwards which would break package feeds (from 0:0.56.1-r0 to 0:0.56.0-r0) [version-going-backwards]
ERROR: vala-0.56.0-r0 do_packagedata_setscene: QA Issue: Package version for package vala-locale went backwards which would break package feeds (from 0:0.56.1-r0 to 0:0.56.0-r0) [version-going-backwards]
ERROR: vala-0.56.0-r0 do_packagedata_setscene: QA Issue: Package version for package vala went backwards which would break package feeds (from 0:0.56.1-r0 to 0:0.56.0-r0) [version-going-backwards]
ERROR: vala-0.56.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3111540461775897567==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-epiphany-upgrade-42.0-42.2.patch"

From c80295975da9906a4aa133f8c208398f46aba77b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 May 2022 14:03:15 +0000
Subject: [PATCH] epiphany: upgrade 42.0 -> 42.2

---
 .../epiphany/{epiphany_42.0.bb => epiphany_42.2.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/epiphany/{epiphany_42.0.bb => epiphany_42.2.bb} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_42.0.bb b/meta/recipes-gnome/epiphany/epiphany_42.2.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_42.0.bb
rename to meta/recipes-gnome/epiphany/epiphany_42.2.bb
index 1cf731c7d6..dc1b34ac92 100644
--- a/meta/recipes-gnome/epiphany/epiphany_42.0.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_42.2.bb
@@ -28,7 +28,7 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GN
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "3dbfa8c00e45b7f44e1824d01f0febe83707b5fb9330c261173f68b7f03cd5e3"
+SRC_URI[archive.sha256sum] = "92c02cf886d10d2ccff5de658e1a420eab31d20bb50e746d430e9535b485192d"
 
 PACKAGECONFIG_SOUP ?= "soup2"
 PACKAGECONFIG ??= "${PACKAGECONFIG_SOUP}"
-- 
2.27.0


--===============3111540461775897567==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1642 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (883 cached, 1 parsed). 1642 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-ed8181b2f5a2b54f8551c847a8333441988f2cd3"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ed8181b2f5a2b54f8551c847a8333441988f2cd3"
workspace            = "master:9e556960421c8bbe8851d9810352a5b4bd3b50df"

Initialising tasks...done.
Sstate summary: Wanted 214 Local 26 Mirrors 0 Missed 188 Current 667 (12% match, 78% complete)
Removing 1 stale sstate objects for arch core2-64...done.
Removing 4 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 691 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_41.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 716 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 742 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 781 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 782 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.9.0.bb:do_package_write_rpm_setscene)
NOTE: recipe iso-codes-4.9.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe adwaita-icon-theme-41.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe vala-0.56.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: recipe adwaita-icon-theme-41.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 813 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_41.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 821 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_packagedata_setscene)
NOTE: recipe iso-codes-4.9.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 874 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.9.0.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/vala/0.56.0-r0/temp/log.do_packagedata_setscene.1415750
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 880 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_package_setscene)
NOTE: recipe vala-0.56.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe adwaita-icon-theme-41.0-r0: task do_packagedata_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe iso-codes-4.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe adwaita-icon-theme-41.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iso-codes-4.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1398 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_fetch)
NOTE: Running task 1441 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1542 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: Running task 1549 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_fetch)
NOTE: Running task 1571 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_fetch)
NOTE: Running task 1577 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_fetch)
NOTE: Running task 1578 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_fetch)
NOTE: Running task 1584 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_fetch)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 1718 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_unpack)
NOTE: Running task 1778 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1781 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_fetch)
NOTE: Running task 1796 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: Running task 1798 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_write_config)
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Started
NOTE: Running task 1809 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_write_config)
NOTE: Running task 1810 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_write_config)
NOTE: Running task 1811 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_write_config)
NOTE: Running task 1812 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_fetch)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_fetch: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.11-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe vala-0.56.0-r0: task do_package_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.50.6-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-4.2.0-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_fetch: Succeeded
NOTE: Running task 1873 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_fetch)
NOTE: Running task 1883 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: Running task 1884 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_unpack)
NOTE: Running task 1885 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.6-r0: task do_fetch: Succeeded
NOTE: Running task 1886 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_unpack)
NOTE: Running task 1887 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_unpack)
NOTE: Running task 1888 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_unpack)
NOTE: Running task 1889 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.8-r0: task do_fetch: Started
NOTE: Running task 1890 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Started
NOTE: recipe libxi-1_1.8-r0: task do_fetch: Succeeded
NOTE: Running task 1891 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-4.2.0-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_write_config: Started
NOTE: recipe fribidi-1.0.11-r0: task do_write_config: Started
NOTE: recipe pango-1.50.6-r0: task do_write_config: Started
NOTE: Running task 1892 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_fetch: Started
NOTE: Running task 1893 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_unpack)
NOTE: Running task 1899 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_fetch)
NOTE: Running task 1905 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_fetch: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_unpack: Started
NOTE: Running task 1914 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_fetch)
NOTE: Running task 1915 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_fetch)
NOTE: Running task 1917 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_fetch)
NOTE: Running task 1922 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_write_config)
NOTE: Running task 1924 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_fetch)
NOTE: Running task 1925 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_fetch)
NOTE: Running task 1937 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_fetch)
NOTE: Running task 1940 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_write_config)
NOTE: Running task 1941 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Succeeded
NOTE: Running task 1948 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_fetch)
NOTE: recipe atk-2.38.0-r0: task do_fetch: Succeeded
NOTE: Running task 1985 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_write_config: Succeeded
NOTE: recipe harfbuzz-4.2.0-r0: task do_write_config: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_unpack: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_unpack: Started
NOTE: Running task 1986 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_unpack)
NOTE: recipe pango-1.50.6-r0: task do_write_config: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_unpack: Started
NOTE: recipe pango-1.50.6-r0: task do_unpack: Started
NOTE: Running task 1987 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_patch)
NOTE: Running task 1988 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-4.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1989 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.8-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Started
NOTE: Running task 2000 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_fetch)
NOTE: recipe libxi-1_1.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.44.0-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_fetch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 2029 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_unpack)
NOTE: recipe libepoxy-1.5.9-r0: task do_fetch: Succeeded
NOTE: Running task 2033 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_write_config)
NOTE: Running task 2042 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_write_config)
NOTE: Running task 2043 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_fetch)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_fetch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 2051 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_fetch)
NOTE: Running task 2067 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_write_config)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_write_config: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Started
NOTE: Running task 2069 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_patch)
NOTE: Running task 2070 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_unpack)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_fetch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_fetch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: Running task 2071 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Succeeded
NOTE: Running task 2072 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_unpack)
NOTE: Running task 2073 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_unpack)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_unpack: Started
NOTE: recipe atk-2.38.0-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_patch: Started
NOTE: Running task 2074 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_unpack)
NOTE: Running task 2075 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_unpack)
NOTE: recipe atk-2.38.0-r0: task do_write_config: Started
NOTE: recipe gtk+3-3.24.33-r0: task do_fetch: Started
NOTE: Running task 2076 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_unpack)
NOTE: Running task 2077 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2078 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_write_config: Succeeded
NOTE: recipe gtk+3-3.24.33-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe atk-2.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2079 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.8-r0: task do_unpack: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_write_config: Started
NOTE: Running task 2080 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_patch)
NOTE: Running task 2081 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_unpack)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_write_config: Started
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Started
NOTE: Running task 2089 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe libwpe-1.12.0-r0: task do_fetch: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_fetch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_patch: Started
NOTE: Running task 2090 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe atk-2.38.0-r0: task do_write_config: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_fetch: Succeeded
NOTE: Running task 2091 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_unpack)
NOTE: Running task 2092 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_write_config)
NOTE: Running task 2093 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_unpack: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Started
NOTE: Running task 2095 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 2096 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_fetch)
NOTE: Running task 2097 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe fribidi-1.0.11-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.44.0-r0: task do_write_config: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_write_config: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Started
NOTE: recipe vala-0.56.0-r0: task do_package_setscene: Succeeded
NOTE: Running task 2098 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.44.0-r0: task do_unpack: Started
NOTE: Running task 2099 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_patch)
NOTE: Running task 2100 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: Running task 2101 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_patch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_unpack: Started
NOTE: Setscene tasks completed
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2106 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_unpack)
NOTE: Running task 2109 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_unpack)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.8-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.33-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe libwpe-1.12.0-r0: task do_unpack: Started
NOTE: Running task 2152 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 2153 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_fetch)
NOTE: Running task 2154 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: Running task 2155 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_fetch)
NOTE: Running task 2156 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_fetch)
NOTE: Running task 2157 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_fetch)
NOTE: Running task 2185 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_fetch)
NOTE: Running task 2186 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_fetch)
NOTE: Running task 2187 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_fetch)
NOTE: Running task 2188 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_fetch)
NOTE: Running task 2189 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_fetch)
NOTE: Running task 2190 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_fetch)
NOTE: Running task 2191 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_fetch)
NOTE: Running task 2192 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_fetch)
NOTE: Running task 2193 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_fetch)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running task 2222 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_fetch)
NOTE: Running task 2225 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_fetch)
NOTE: recipe libepoxy-1.5.9-r0: task do_unpack: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.11-r0: task do_patch: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: Running task 2226 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_patch)
NOTE: recipe json-glib-1.6.6-r0: task do_write_config: Started
NOTE: recipe atk-2.38.0-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Started
NOTE: Running task 2227 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_patch)
NOTE: Running task 2228 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_patch)
NOTE: Running task 2229 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_patch)
NOTE: Running task 2230 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_unpack: Started
NOTE: Running task 2231 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_generate_toolchain_file)
NOTE: Running task 2232 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe json-glib-1.6.6-r0: task do_write_config: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_fetch: Started
NOTE: Running task 2233 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_patch)
NOTE: Running task 2234 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: recipe libwpe-1.12.0-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_fetch: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.11-r0: task do_patch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: recipe orc-0.4.32-r0: task do_fetch: Started
NOTE: Running task 2235 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_patch)
NOTE: Running task 2236 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_unpack)
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_fetch: Started
NOTE: recipe libnotify-0.7.9-r0: task do_fetch: Started
NOTE: Running task 2238 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe orc-0.4.32-r0: task do_fetch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_fetch: Started
NOTE: recipe libsecret-0.20.5-r0: task do_fetch: Started
NOTE: recipe enchant2-2.3.3-r0: task do_fetch: Started
NOTE: Running task 2239 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.50.6-r0: task do_unpack: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_unpack: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_fetch: Succeeded
NOTE: Running task 2240 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: recipe libxslt-1.1.35-r0: task do_fetch: Started
NOTE: Running task 2241 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_unpack)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_fetch: Started
NOTE: Running task 2242 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: Running task 2243 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_unpack)
NOTE: Running task 2244 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_unpack)
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.8-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_fetch: Succeeded
NOTE: Running task 2245 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_unpack)
NOTE: recipe libsecret-0.20.5-r0: task do_fetch: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_fetch: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Started
NOTE: Running task 2246 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_patch)
NOTE: recipe libxi-1_1.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_patch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_unpack: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_fetch: Succeeded
NOTE: recipe webkitgtk-2.36.0-r0: task do_fetch: Started
NOTE: Running task 2247 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_patch)
NOTE: Running task 2248 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe p11-kit-0.24.1-r0: task do_fetch: Started
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_unpack: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: Running task 2249 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2250 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 2251 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_patch)
NOTE: recipe webkitgtk-2.36.0-r0: task do_fetch: Succeeded
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_fetch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_generate_toolchain_file: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2252 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_fetch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: Running task 2253 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_patch)
NOTE: Running task 2254 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_patch)
NOTE: recipe libwpe-1.12.0-r0: task do_patch: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: Running task 2260 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe at-spi2-core-2.44.0-r0: task do_patch: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_unpack: Started
NOTE: recipe libxv-1.0.11-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_unpack: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: Running task 2279 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_unpack)
NOTE: Running task 2280 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_unpack)
NOTE: Running task 2281 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_unpack)
NOTE: Running task 2282 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 2283 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_unpack)
NOTE: Running task 2284 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_unpack)
NOTE: Running task 2285 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_unpack)
NOTE: Running task 2286 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_unpack)
NOTE: Running task 2287 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_unpack)
NOTE: Running task 2288 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_unpack)
NOTE: Running task 2289 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2290 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_patch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_unpack: Started
NOTE: Running task 2299 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_fetch)
NOTE: Running task 2300 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_fetch)
NOTE: Running task 2302 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_fetch)
NOTE: Running task 2303 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2305 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_unpack)
NOTE: Running task 2306 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: Running task 2325 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_generate_toolchain_file)
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pango-1.50.6-r0: task do_patch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_patch: Started
NOTE: recipe libwpe-1.12.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2326 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2328 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_unpack)
NOTE: recipe libxi-1_1.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_patch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to ea93135e6bc8e63cc54852e198d3eabbf225aea3faf287903bdd2c4fb2e8da5b
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-core-2.44.0-r0: task do_patch: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_patch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_unpack: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnotify-0.7.9-r0: task do_unpack: Started
NOTE: recipe enchant2-2.3.3-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_unpack: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_unpack: Started
NOTE: recipe libsecret-0.20.5-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe orc-0.4.32-r0: task do_unpack: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_unpack: Started
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Started
NOTE: Running task 2342 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2343 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2344 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_patch)
NOTE: Running task 2345 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_patch)
NOTE: Running task 2348 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2349 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_configure)
NOTE: recipe p11-kit-0.24.1-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2350 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_patch)
NOTE: Running task 2351 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_patch)
NOTE: recipe libhandy-1.5.0-r0: task do_fetch: Started
NOTE: Running task 2352 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_write_config)
NOTE: recipe atk-2.38.0-r0: task do_patch: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe pango-1.50.6-r0: task do_patch: Succeeded
NOTE: Running task 2353 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2354 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_patch)
NOTE: recipe libdazzle-3.44.0-r0: task do_fetch: Started
NOTE: recipe gcr-3.40.0-r0: task do_fetch: Started
NOTE: recipe webkitgtk-2.36.0-r0: task do_unpack: Started
NOTE: recipe libwpe-1.12.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe atk-2.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: Running task 2355 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_configure)
NOTE: recipe libhandy-1.5.0-r0: task do_fetch: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_fetch: Succeeded
NOTE: Running task 2356 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_patch)
NOTE: Running task 2364 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe gcr-3.40.0-r0: task do_fetch: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2371 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Succeeded
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 2396 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_patch)
NOTE: recipe libnotify-0.7.9-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2405 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_patch)
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.44.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxv-1.0.11-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2424 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_patch)
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Started
NOTE: Running task 2434 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe json-glib-1.6.6-r0: task do_patch: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2435 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: Running task 2436 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_patch)
NOTE: Running task 2437 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2438 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_patch)
NOTE: recipe libxft-1_2.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_configure: Started
NOTE: Running task 2439 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: Running task 2440 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe json-glib-1.6.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_patch: Succeeded
NOTE: Running task 2441 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_configure)
NOTE: recipe orc-0.4.32-r0: task do_patch: Started
NOTE: recipe aspell-0.60.8-r0: task do_patch: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_write_config: Started
NOTE: recipe atk-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_patch: Started
NOTE: Running task 2442 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_configure)
NOTE: recipe fribidi-1.0.11-r0: task do_configure: Started
NOTE: recipe enchant2-2.3.3-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: Running task 2443 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2444 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_write_config)
NOTE: Running task 2445 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe pango-1.50.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2446 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2447 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: Running task 2448 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_unpack)
NOTE: Running task 2449 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_unpack)
NOTE: Running task 2451 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_unpack)
NOTE: recipe libtasn1-4.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_unpack: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_patch: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_patch: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_patch: Started
NOTE: Running task 2452 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 2453 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_write_config: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2454 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_configure)
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsecret-0.20.5-r0: task do_patch: Started
NOTE: Running task 2455 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_patch)
NOTE: Running task 2456 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_patch)
NOTE: recipe libxv-1.0.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2457 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe enchant2-2.3.3-r0: task do_patch: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_configure: Started
NOTE: recipe libxslt-1.1.35-r0: task do_unpack: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2458 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2459 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_deploy_source_date_epoch)
NOTE: recipe libnotify-0.7.9-r0: task do_patch: Succeeded
NOTE: Running task 2460 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_patch)
NOTE: Running task 2461 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_deploy_source_date_epoch)
NOTE: recipe libtasn1-4.18.0-r0: task do_patch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_patch: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_patch: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe orc-0.4.32-r0: task do_write_config: Started
NOTE: recipe orc-0.4.32-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2466 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_patch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_patch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2470 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_fetch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2481 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Started
NOTE: Running task 2488 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2489 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libdazzle-3.44.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_unpack: Succeeded
NOTE: recipe libhandy-1.5.0-r0: task do_unpack: Started
NOTE: recipe gcr-3.40.0-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: Running task 2490 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Started
NOTE: recipe atk-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2491 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_patch)
NOTE: recipe orc-0.4.32-r0: task do_write_config: Succeeded
NOTE: Running task 2492 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2493 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: recipe p11-kit-0.24.1-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Started
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2531 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_write_config)
NOTE: Running task 2532 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 2533 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_configure)
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_patch: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxslt-1.1.35-r0: task do_patch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pango-1.50.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2534 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2535 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_write_config)
NOTE: Running task 2536 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_write_config)
NOTE: Running task 2537 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2538 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Succeeded
NOTE: Running task 2539 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.0-r0: task do_packagedata: Started
NOTE: Running task 2540 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_deploy_source_date_epoch)
NOTE: recipe epiphany-42.2-r0: task do_fetch: Started
NOTE: Running task 2541 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_patch: Succeeded
NOTE: Running task 2542 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe epiphany-42.2-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2543 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2544 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2545 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_write_config)
NOTE: Running task 2546 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2547 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe libxslt-1.1.35-r0: task do_patch: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_unpack: Succeeded
NOTE: Running task 2548 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_patch: Started
NOTE: recipe libwpe-1.12.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe p11-kit-0.24.1-r0: task do_patch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnotify-0.7.9-r0: task do_write_config: Started
NOTE: recipe libnotify-0.7.9-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2549 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_patch)
NOTE: Running task 2550 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 2551 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_configure)
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_unpack: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_configure: Started
NOTE: Running task 2552 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2553 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_write_config)
NOTE: Running task 2554 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2598 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2599 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_write_config)
NOTE: recipe libsecret-0.20.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2600 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libhandy-1.5.0-r0: task do_unpack: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_write_config: Started
NOTE: recipe libsecret-0.20.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe aspell-0.60.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_write_config: Started
NOTE: Running task 2601 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_patch)
NOTE: Running task 2602 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_patch)
NOTE: recipe gcr-3.40.0-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxslt-1.1.35-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnotify-0.7.9-r0: task do_write_config: Succeeded
NOTE: Running task 2604 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_configure)
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2605 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_patch)
NOTE: Running task 2607 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_unpack)
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_write_config: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_write_config: Succeeded
NOTE: Running task 2632 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_configure)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2649 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_write_config)
NOTE: recipe libsecret-0.20.5-r0: task do_write_config: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2650 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_write_config)
NOTE: recipe json-glib-1.6.6-r0: task do_configure: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_patch: Started
NOTE: recipe libxslt-1.1.35-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_write_config: Succeeded
NOTE: Running task 2653 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_write_config)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_configure: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe orc-0.4.32-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe p11-kit-0.24.1-r0: task do_write_config: Started
NOTE: Running task 2680 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_configure)
NOTE: recipe p11-kit-0.24.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2681 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_configure)
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2682 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_configure)
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_write_config: Started
NOTE: recipe vala-0.56.0-r0: task do_packagedata: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_patch: Succeeded
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_patch: Started
NOTE: Running task 2683 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: Running task 2684 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_configure)
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libhandy-1.5.0-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_configure: Started
NOTE: Running task 2685 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_patch: Succeeded
NOTE: recipe epiphany-42.2-r0: task do_unpack: Started
NOTE: Running task 2686 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2703 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_deploy_source_date_epoch)
NOTE: recipe p11-kit-0.24.1-r0: task do_write_config: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_configure: Started
NOTE: recipe libsecret-0.20.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcr-3.40.0-r0: task do_patch: Started
NOTE: recipe enchant2-2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_write_config: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2746 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_write_config)
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_write_config: Succeeded
NOTE: recipe libhandy-1.5.0-r0: task do_write_config: Started
NOTE: Running task 2788 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gcr-3.40.0-r0: task do_write_config: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: Running task 2830 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_configure)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_configure: Started
NOTE: recipe orc-0.4.32-r0: task do_configure: Started
NOTE: Running task 2831 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_configure)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_configure: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_write_config: Succeeded
NOTE: recipe libhandy-1.5.0-r0: task do_write_config: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_configure: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_configure: Started
NOTE: recipe libxslt-1.1.35-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcr-3.40.0-r0: task do_write_config: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe p11-kit-0.24.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2832 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_configure)
NOTE: recipe epiphany-42.2-r0: task do_write_config: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libhandy-1.5.0-r0: task do_patch: Succeeded
NOTE: recipe gcr-3.40.0-r0: task do_patch: Succeeded
NOTE: Running task 2833 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2834 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_configure)
NOTE: Running task 2835 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_deploy_source_date_epoch)
NOTE: recipe epiphany-42.2-r0: task do_write_config: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_configure: Started
NOTE: recipe libhandy-1.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Started
NOTE: recipe gcr-3.40.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: recipe harfbuzz-4.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to e12ef1466cb841b8170ebe21bf855a1d72ab36d5c6b2197eb65f7498b9c23a64
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_configure: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2842 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_configure)
NOTE: Running task 2843 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_compile)
NOTE: recipe libsecret-0.20.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2844 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_configure)
NOTE: recipe libhandy-1.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe harfbuzz-4.2.0-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_compile: Started
NOTE: Running task 2845 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_configure)
NOTE: recipe gcr-3.40.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe epiphany-42.2-r0: task do_unpack: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_configure: Started
NOTE: Running task 2846 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_patch)
NOTE: recipe gtk+3-3.24.33-r0: task do_unpack: Succeeded
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_configure: Started
NOTE: recipe epiphany-42.2-r0: task do_patch: Started
NOTE: Running task 2847 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_patch)
NOTE: recipe gtk+3-3.24.33-r0: task do_patch: Started
NOTE: recipe libwpe-1.12.0-r0: task do_configure: Succeeded
NOTE: Running task 2848 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_compile)
NOTE: recipe libwpe-1.12.0-r0: task do_compile: Started
NOTE: recipe epiphany-42.2-r0: task do_patch: Succeeded
NOTE: Running task 2849 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2850 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_populate_lic)
NOTE: recipe gtk+3-3.24.33-r0: task do_patch: Succeeded
NOTE: Running task 2851 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_deploy_source_date_epoch)
NOTE: recipe epiphany-42.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe epiphany-42.2-r0: task do_populate_lic: Started
NOTE: recipe gtk+3-3.24.33-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe webkitgtk-2.36.0-r0: task do_unpack: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_configure: Succeeded
NOTE: recipe epiphany-42.2-r0: task do_populate_lic: Succeeded
NOTE: Running task 2852 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_patch)
NOTE: Running task 2853 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_compile)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_populate_lic unihash changed to 5419e8ff66bfb975b34bd8fdc3be70664192c37a631990aa8d59b0ff4744a987
NOTE: recipe epiphany-42.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Succeeded
NOTE: recipe gtk+3-3.24.33-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2854 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe fribidi-1.0.11-r0: task do_compile: Started
NOTE: recipe webkitgtk-2.36.0-r0: task do_patch: Started
NOTE: recipe libwpe-1.12.0-r0: task do_compile: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Started
NOTE: Running task 2855 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_install)
NOTE: recipe orc-0.4.32-r0: task do_configure: Succeeded
NOTE: Running task 2856 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_compile)
NOTE: recipe libwpe-1.12.0-r0: task do_install: Started
NOTE: recipe orc-0.4.32-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_configure: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_configure: Succeeded
NOTE: Running task 2857 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_compile)
NOTE: Running task 2858 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_compile)
NOTE: recipe libepoxy-1.5.9-r0: task do_compile: Started
NOTE: recipe webkitgtk-2.36.0-r0: task do_patch: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_install: Succeeded
NOTE: Running task 2859 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_generate_toolchain_file)
NOTE: Running task 2860 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_deploy_source_date_epoch)
NOTE: recipe atk-2.38.0-r0: task do_compile: Started
NOTE: Running task 2861 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_populate_sysroot)
NOTE: Running task 2862 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_package)
NOTE: recipe webkitgtk-2.36.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe webkitgtk-2.36.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwpe-1.12.0-r0: task do_populate_sysroot: Started
NOTE: recipe webkitgtk-2.36.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_package: Started
NOTE: recipe webkitgtk-2.36.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_configure: Succeeded
NOTE: Running task 2863 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_configure_ptest_base)
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_configure: Succeeded
NOTE: Running task 2864 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_compile)
NOTE: recipe libwpe-1.12.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_configure_ptest_base: Started
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_compile: Started
NOTE: recipe json-glib-1.6.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2865 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_compile)
NOTE: recipe json-glib-1.6.6-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Succeeded
NOTE: Running task 2866 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_compile: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 2867 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_install)
NOTE: Running task 2868 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Started
NOTE: recipe fribidi-1.0.11-r0: task do_compile: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_install: Started
NOTE: Running task 2869 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_install)
NOTE: recipe orc-0.4.32-r0: task do_compile: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_configure: Succeeded
NOTE: Running task 2870 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_install)
NOTE: Running task 2871 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_compile)
NOTE: recipe fribidi-1.0.11-r0: task do_install: Started
NOTE: recipe libsecret-0.20.5-r0: task do_compile: Started
NOTE: recipe orc-0.4.32-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_install: Succeeded
NOTE: Running task 2872 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: Running task 2873 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_populate_sysroot)
NOTE: Running task 2874 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_package)
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_install: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_populate_sysroot: Started
NOTE: Running task 2875 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_package)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe fribidi-1.0.11-r0: task do_package: Started
NOTE: Running task 2876 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_populate_sysroot)
NOTE: recipe orc-0.4.32-r0: task do_install: Succeeded
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_package: Started
NOTE: Running task 2877 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_populate_sysroot)
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_populate_sysroot: Started
NOTE: Running task 2878 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_package)
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot: Started
NOTE: recipe libwpe-1.12.0-r0: task do_package: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 2879 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_packagedata)
NOTE: Running task 2880 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: Running task 2881 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: recipe fribidi-1.0.11-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2882 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: Running task 2883 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: recipe libwpe-1.12.0-r0: task do_packagedata: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_packagedata: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_compile: Succeeded
NOTE: Running task 2884 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_install)
NOTE: recipe harfbuzz-4.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2885 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_install: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_configure: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_install: Succeeded
NOTE: Running task 2886 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_configure_ptest_base)
NOTE: Running task 2887 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_populate_sysroot)
NOTE: Running task 2888 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2889 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_compile)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.11-r0: task do_package: Succeeded
NOTE: Running task 2890 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_packagedata)
NOTE: recipe fribidi-1.0.11-r0: task do_packagedata: Started
NOTE: recipe atk-2.38.0-r0: task do_compile: Succeeded
NOTE: Running task 2891 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_install)
NOTE: recipe atk-2.38.0-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_packagedata: Succeeded
NOTE: Running task 2892 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe orc-0.4.32-r0: task do_package: Succeeded
NOTE: Running task 2893 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_packagedata)
NOTE: recipe atk-2.38.0-r0: task do_install: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_packagedata: Started
NOTE: Running task 2894 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_populate_sysroot)
NOTE: recipe json-glib-1.6.6-r0: task do_compile: Succeeded
NOTE: Running task 2895 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_package)
NOTE: Running task 2896 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_compile_ptest_base)
NOTE: recipe atk-2.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe atk-2.38.0-r0: task do_package: Started
NOTE: recipe json-glib-1.6.6-r0: task do_compile_ptest_base: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 2897 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe json-glib-1.6.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2898 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2899 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_configure)
NOTE: recipe orc-0.4.32-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_configure: Started
NOTE: recipe json-glib-1.6.6-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_package: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_install: Succeeded
NOTE: Running task 2900 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_install_ptest_base)
NOTE: Running task 2901 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata: Started
NOTE: recipe json-glib-1.6.6-r0: task do_install_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2902 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_populate_sysroot)
NOTE: Running task 2903 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_package)
NOTE: recipe libsecret-0.20.5-r0: task do_compile: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot: Started
NOTE: Running task 2904 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_install)
NOTE: recipe json-glib-1.6.6-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_install: Started
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_package: Succeeded
NOTE: Running task 2905 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_packagedata)
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_packagedata: Started
NOTE: recipe libsecret-0.20.5-r0: task do_install: Succeeded
NOTE: Running task 2906 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_populate_sysroot)
NOTE: Running task 2907 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_package)
NOTE: recipe libsecret-0.20.5-r0: task do_populate_sysroot: Started
NOTE: recipe libsecret-0.20.5-r0: task do_package: Started
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2908 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_package_write_rpm)
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_package_write_rpm: Started
NOTE: recipe libsecret-0.20.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Succeeded
NOTE: Running task 2909 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_compile)
NOTE: recipe aspell-0.60.8-r0: task do_configure: Succeeded
NOTE: Running task 2910 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_compile)
NOTE: recipe libwebp-1.2.2-r0: task do_compile: Started
NOTE: recipe aspell-0.60.8-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 2911 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe libxft-1_2.3.4-r0: task do_configure: Succeeded
NOTE: Running task 2912 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_configure: Succeeded
NOTE: Running task 2913 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_configure_ptest_base)
NOTE: recipe libxft-1_2.3.4-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Succeeded
NOTE: Running task 2914 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2915 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_compile: Started
NOTE: recipe libxv-1.0.11-r0: task do_configure: Succeeded
NOTE: Running task 2916 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_compile)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_configure: Succeeded
NOTE: Running task 2917 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_compile)
NOTE: recipe libxv-1.0.11-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_compile: Started
NOTE: Running task 2918 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_package_write_rpm)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 2919 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe libxslt-1.1.35-r0: task do_configure: Succeeded
NOTE: Running task 2920 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_compile)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_package_write_rpm: Started
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_compile: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_compile: Started
NOTE: Running task 2921 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_install)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2922 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_compile)
NOTE: recipe libxft-1_2.3.4-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Succeeded
NOTE: Running task 2923 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_compile)
NOTE: recipe libxi-1_1.8-r0: task do_configure: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Started
NOTE: Running task 2924 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_compile)
NOTE: recipe libxft-1_2.3.4-r0: task do_install: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_compile: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_compile: Started
NOTE: Running task 2925 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_install)
NOTE: Running task 2926 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_populate_sysroot)
NOTE: Running task 2927 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 2928 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 2929 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libxft-1_2.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxv-1.0.11-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2930 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Succeeded
NOTE: Running task 2931 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_install)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_compile: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_install: Succeeded
NOTE: Running task 2932 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2933 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Started
NOTE: Running task 2934 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_install)
NOTE: Running task 2935 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_populate_sysroot)
NOTE: Running task 2936 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_package)
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_install: Started
NOTE: recipe libxv-1.0.11-r0: task do_package: Started
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2937 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2938 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Succeeded
NOTE: Running task 2939 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 2940 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot)
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: Running task 2941 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package)
NOTE: Running task 2942 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe libxi-1_1.8-r0: task do_compile: Succeeded
NOTE: Running task 2943 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_install)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Started
NOTE: recipe libxi-1_1.8-r0: task do_install: Started
NOTE: recipe atk-2.38.0-r0: task do_package: Succeeded
NOTE: Running task 2944 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.9-r0: task do_install: Succeeded
NOTE: Running task 2945 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_populate_sysroot)
NOTE: Running task 2946 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_package)
NOTE: recipe atk-2.38.0-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_install: Succeeded
NOTE: Running task 2947 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_populate_sysroot)
NOTE: Running task 2948 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_package)
NOTE: recipe libsecret-0.20.5-r0: task do_package: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2949 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_packagedata)
NOTE: Running task 2950 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_compile)
NOTE: recipe libxi-1_1.8-r0: task do_package: Started
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot: Started
NOTE: recipe libsecret-0.20.5-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Started
NOTE: recipe json-glib-1.6.6-r0: task do_package: Succeeded
NOTE: Running task 2951 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2952 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe aspell-0.60.8-r0: task do_compile: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata: Started
NOTE: Running task 2953 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_install)
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_package: Succeeded
NOTE: Running task 2954 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe atk-2.38.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2955 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_packagedata)
NOTE: recipe aspell-0.60.8-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_packagedata: Started
NOTE: recipe libxv-1.0.11-r0: task do_package: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_compile: Succeeded
NOTE: Running task 2956 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_packagedata)
NOTE: recipe libsecret-0.20.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2957 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_install)
NOTE: recipe gsettings-desktop-schemas-42.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_packagedata: Started
NOTE: recipe libxslt-1.1.35-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_packagedata: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2958 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_configure)
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_packagedata: Succeeded
NOTE: Running task 2959 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2960 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_configure: Started
NOTE: Running task 2961 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Succeeded
NOTE: Running task 2962 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_compile)
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_compile: Started
NOTE: Running task 2963 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_package: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Started
NOTE: recipe aspell-0.60.8-r0: task do_install: Succeeded
NOTE: Running task 2964 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_packagedata)
NOTE: Running task 2965 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_populate_sysroot)
NOTE: Running task 2966 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_package)
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2967 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_install)
NOTE: recipe libepoxy-1.5.9-r0: task do_packagedata: Started
NOTE: recipe aspell-0.60.8-r0: task do_populate_sysroot: Started
NOTE: recipe aspell-0.60.8-r0: task do_package: Started
NOTE: recipe libxslt-1.1.35-r0: task do_install: Succeeded
NOTE: Running task 2968 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_populate_sysroot)
NOTE: Running task 2969 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_package)
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Started
NOTE: recipe libxslt-1.1.35-r0: task do_package: Started
NOTE: recipe libxslt-1.1.35-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_packagedata: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_package: Succeeded
NOTE: Running task 2970 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_packagedata)
NOTE: recipe libxi-1_1.8-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.2.2-r0: task do_compile: Succeeded
NOTE: Running task 2971 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_install)
NOTE: recipe aspell-0.60.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2972 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxslt-1.1.35-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_install: Started
NOTE: recipe enchant2-2.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2973 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 2974 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_package)
NOTE: recipe libxi-1_1.8-r0: task do_packagedata: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Started
NOTE: recipe enchant2-2.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2975 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_configure)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_compile: Succeeded
NOTE: Running task 2976 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_compile_ptest_base)
NOTE: recipe enchant2-2.3.3-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2977 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_compile: Succeeded
NOTE: Running task 2978 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_install: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_configure: Succeeded
NOTE: Running task 2979 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_compile)
NOTE: recipe libwebp-1.2.2-r0: task do_install: Succeeded
NOTE: Running task 2980 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_populate_sysroot)
NOTE: Running task 2981 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_compile_ptest_base: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_populate_sysroot: Started
NOTE: Running task 2982 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_install)
NOTE: recipe libwebp-1.2.2-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_install: Started
NOTE: recipe libwebp-1.2.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_compile: Succeeded
NOTE: Running task 2983 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_install)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_install: Succeeded
NOTE: Running task 2984 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_install_ptest_base)
NOTE: recipe libxslt-1.1.35-r0: task do_package: Succeeded
NOTE: Running task 2985 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_packagedata)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_install_ptest_base: Started
NOTE: recipe libxslt-1.1.35-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2986 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_populate_sysroot)
NOTE: Running task 2987 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_package)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_package: Started
NOTE: recipe libxslt-1.1.35-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_install: Succeeded
NOTE: Running task 2988 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_install_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_install_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2989 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_populate_sysroot)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_install: Succeeded
NOTE: Running task 2990 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_package)
NOTE: Running task 2991 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_populate_sysroot)
NOTE: Running task 2992 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_package)
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2993 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_packagedata)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_populate_sysroot: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_package: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: Running task 2994 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_compile)
NOTE: recipe libwebp-1.2.2-r0: task do_package: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Started
NOTE: Running task 2995 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_packagedata)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_configure: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_packagedata: Started
NOTE: Running task 2996 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_compile)
NOTE: recipe libtasn1-4.18.0-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2997 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe aspell-0.60.8-r0: task do_package: Succeeded
NOTE: Running task 2998 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_packagedata)
NOTE: recipe libwebp-1.2.2-r0: task do_packagedata: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe aspell-0.60.8-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_compile: Succeeded
NOTE: Running task 2999 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_install)
NOTE: recipe aspell-0.60.8-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_install: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 3000 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe libpsl-0.21.1-r0: task do_compile: Succeeded
NOTE: Running task 3001 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_install)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe libpsl-0.21.1-r0: task do_install: Started
NOTE: recipe libnotify-0.7.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3002 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_configure)
NOTE: recipe libnotify-0.7.9-r0: task do_configure: Started
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Succeeded
NOTE: Running task 3003 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_install)
NOTE: recipe libpsl-0.21.1-r0: task do_install: Succeeded
NOTE: Running task 3004 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_populate_sysroot)
NOTE: Running task 3005 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_package)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_package: Succeeded
NOTE: Running task 3006 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_install: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_install: Started
NOTE: recipe libpsl-0.21.1-r0: task do_populate_sysroot: Started
NOTE: Running task 3007 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_populate_sysroot)
NOTE: Running task 3008 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_package)
NOTE: recipe libpsl-0.21.1-r0: task do_package: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_package: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_packagedata: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_install: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3009 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 3010 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package)
NOTE: Running task 3011 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 3012 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3013 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_configure)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.1-r0: task do_package: Succeeded
NOTE: Running task 3014 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 3015 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 3016 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe libpsl-0.21.1-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe libpsl-0.21.1-r0: task do_packagedata: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_configure: Succeeded
NOTE: Running task 3017 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_compile: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Succeeded
NOTE: Running task 3018 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_package: Succeeded
NOTE: Running task 3019 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 3020 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_compile)
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_configure: Succeeded
NOTE: Running task 3021 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: Running task 3022 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_compile: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 3023 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_compile: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 3024 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_install)
NOTE: Running task 3025 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 3026 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package)
NOTE: recipe libtasn1-4.18.0-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3027 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_install: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_package: Succeeded
NOTE: Running task 3028 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_populate_sysroot)
NOTE: Running task 3029 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_package)
NOTE: Running task 3030 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_packagedata)
NOTE: recipe libnotify-0.7.9-r0: task do_compile: Succeeded
NOTE: Running task 3031 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_install)
NOTE: recipe libtasn1-4.18.0-r0: task do_populate_sysroot: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_packagedata: Started
NOTE: recipe libnotify-0.7.9-r0: task do_install: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3032 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3033 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_configure)
NOTE: recipe p11-kit-0.24.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.44.0-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 3034 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata)
NOTE: recipe libnotify-0.7.9-r0: task do_install: Succeeded
NOTE: Running task 3035 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_populate_sysroot)
NOTE: recipe p11-kit-0.24.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_package: Succeeded
NOTE: Running task 3036 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_packagedata: Succeeded
NOTE: Running task 3037 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_packagedata)
NOTE: Running task 3038 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_package)
NOTE: recipe libnotify-0.7.9-r0: task do_populate_sysroot: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_packagedata: Started
NOTE: recipe libnotify-0.7.9-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_package: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3039 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_packagedata)
NOTE: recipe libtasn1-4.18.0-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_packagedata: Succeeded
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_packagedata: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_package: Succeeded
NOTE: Running task 3040 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_packagedata)
NOTE: recipe libnotify-0.7.9-r0: task do_packagedata: Started
NOTE: recipe libnotify-0.7.9-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-core-2.44.0-r0: task do_configure: Succeeded
NOTE: Running task 3041 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_compile)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_compile: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_compile: Succeeded
NOTE: Running task 3042 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_install)
NOTE: recipe p11-kit-0.24.1-r0: task do_configure: Succeeded
NOTE: Running task 3043 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_compile)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_install: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_compile: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_install: Succeeded
NOTE: Running task 3044 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_populate_sysroot)
NOTE: Running task 3045 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_package)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_populate_sysroot: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_package: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.44.0-r0: task do_compile: Succeeded
NOTE: Running task 3046 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_install)
NOTE: recipe harfbuzz-4.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3047 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_install)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_install: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.44.0-r0: task do_install: Succeeded
NOTE: Running task 3048 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_populate_sysroot)
NOTE: Running task 3049 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_package)
NOTE: recipe harfbuzz-4.2.0-r0: task do_install: Succeeded
NOTE: Running task 3050 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_populate_sysroot)
NOTE: Running task 3051 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_package)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.44.0-r0: task do_package: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_package: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_package: Succeeded
NOTE: Running task 3052 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3053 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3054 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3055 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_configure)
NOTE: recipe pango-1.50.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3056 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_configure)
NOTE: recipe pango-1.50.6-r0: task do_configure: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Succeeded
NOTE: Running task 3057 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_compile)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_package: Succeeded
NOTE: Running task 3058 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_packagedata)
NOTE: recipe harfbuzz-4.2.0-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-core-2.44.0-r0: task do_package: Succeeded
NOTE: Running task 3059 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_packagedata)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Succeeded
NOTE: Running task 3060 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_install)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.44.0-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Succeeded
NOTE: Running task 3061 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_populate_sysroot)
NOTE: Running task 3062 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Started
NOTE: recipe pango-1.50.6-r0: task do_configure: Succeeded
NOTE: Running task 3063 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_configure_ptest_base)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pango-1.50.6-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.50.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3064 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_compile)
NOTE: recipe pango-1.50.6-r0: task do_compile: Started
NOTE: recipe enchant2-2.3.3-r0: task do_configure: Succeeded
NOTE: Running task 3065 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_compile)
NOTE: recipe enchant2-2.3.3-r0: task do_compile: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Succeeded
NOTE: Running task 3066 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_packagedata)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_compile: Succeeded
NOTE: Running task 3067 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_install)
NOTE: recipe enchant2-2.3.3-r0: task do_install: Started
NOTE: recipe enchant2-2.3.3-r0: task do_install: Succeeded
NOTE: Running task 3068 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_populate_sysroot)
NOTE: Running task 3069 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_package)
NOTE: recipe enchant2-2.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe enchant2-2.3.3-r0: task do_package: Started
NOTE: recipe enchant2-2.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_package: Succeeded
NOTE: Running task 3070 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_packagedata)
NOTE: recipe enchant2-2.3.3-r0: task do_packagedata: Started
NOTE: recipe enchant2-2.3.3-r0: task do_packagedata: Succeeded
NOTE: recipe p11-kit-0.24.1-r0: task do_compile: Succeeded
NOTE: Running task 3071 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_install)
NOTE: recipe p11-kit-0.24.1-r0: task do_install: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_install: Succeeded
NOTE: Running task 3072 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_populate_sysroot)
NOTE: Running task 3073 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_package)
NOTE: recipe p11-kit-0.24.1-r0: task do_populate_sysroot: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_package: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pango-1.50.6-r0: task do_compile: Succeeded
NOTE: Running task 3074 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_compile_ptest_base)
NOTE: recipe pango-1.50.6-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.50.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3075 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_install)
NOTE: recipe pango-1.50.6-r0: task do_install: Started
NOTE: recipe pango-1.50.6-r0: task do_install: Succeeded
NOTE: Running task 3076 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_install_ptest_base)
NOTE: recipe pango-1.50.6-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.50.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3077 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_populate_sysroot)
NOTE: Running task 3078 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_package)
NOTE: recipe pango-1.50.6-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.50.6-r0: task do_package: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_package: Succeeded
NOTE: Running task 3079 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb:do_packagedata)
NOTE: recipe p11-kit-0.24.1-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3080 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3081 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.33-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe p11-kit-0.24.1-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3082 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.33-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3083 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_configure)
NOTE: recipe gtk+3-3.24.33-r0: task do_configure: Started
NOTE: recipe pango-1.50.6-r0: task do_package: Succeeded
NOTE: Running task 3084 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.6.bb:do_packagedata)
NOTE: recipe pango-1.50.6-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.6-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_configure: Succeeded
NOTE: Running task 3085 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_compile: Succeeded
NOTE: Running task 3086 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_install: Succeeded
NOTE: Running task 3087 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_populate_sysroot)
NOTE: Running task 3088 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.33-r0: task do_configure: Succeeded
NOTE: Running task 3089 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_compile)
NOTE: recipe gtk+3-3.24.33-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_package: Succeeded
NOTE: Running task 3090 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_packagedata: Succeeded
NOTE: recipe gtk+3-3.24.33-r0: task do_compile: Succeeded
NOTE: Running task 3091 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_install)
NOTE: recipe gtk+3-3.24.33-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.33-r0: task do_install: Succeeded
NOTE: Running task 3092 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_populate_sysroot)
NOTE: Running task 3093 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_package)
NOTE: recipe gtk+3-3.24.33-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.33-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.33-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3094 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3095 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3096 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3097 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libhandy-1.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe webkitgtk-2.36.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcr-3.40.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libhandy-1.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3102 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_configure)
NOTE: recipe libdazzle-3.44.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3103 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_configure)
NOTE: recipe libhandy-1.5.0-r0: task do_configure: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_configure: Started
NOTE: recipe webkitgtk-2.36.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3104 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_configure)
NOTE: recipe webkitgtk-2.36.0-r0: task do_configure: Started
NOTE: recipe gcr-3.40.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3105 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_configure)
NOTE: recipe gcr-3.40.0-r0: task do_configure: Started
NOTE: recipe libhandy-1.5.0-r0: task do_configure: Succeeded
NOTE: Running task 3106 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_compile)
NOTE: recipe libhandy-1.5.0-r0: task do_compile: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_configure: Succeeded
NOTE: Running task 3107 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_compile)
NOTE: recipe gcr-3.40.0-r0: task do_configure: Succeeded
NOTE: Running task 3108 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_compile)
NOTE: recipe libdazzle-3.44.0-r0: task do_compile: Started
NOTE: recipe gcr-3.40.0-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.33-r0: task do_package: Succeeded
NOTE: Running task 3109 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.33-r0: task do_packagedata: Started
NOTE: recipe libhandy-1.5.0-r0: task do_compile: Succeeded
NOTE: Running task 3110 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_install)
NOTE: recipe gtk+3-3.24.33-r0: task do_packagedata: Succeeded
NOTE: recipe libhandy-1.5.0-r0: task do_install: Started
NOTE: recipe libhandy-1.5.0-r0: task do_install: Succeeded
NOTE: Running task 3114 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_populate_sysroot)
NOTE: Running task 3115 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_package)
NOTE: recipe libhandy-1.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe libhandy-1.5.0-r0: task do_package: Started
NOTE: recipe libhandy-1.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_compile: Succeeded
NOTE: Running task 3116 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_install)
NOTE: recipe libdazzle-3.44.0-r0: task do_install: Started
NOTE: recipe gcr-3.40.0-r0: task do_compile: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_install: Succeeded
NOTE: Running task 3117 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_install)
NOTE: Running task 3118 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_populate_sysroot)
NOTE: Running task 3119 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_package)
NOTE: recipe libdazzle-3.44.0-r0: task do_populate_sysroot: Started
NOTE: recipe gcr-3.40.0-r0: task do_install: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_package: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libhandy-1.5.0-r0: task do_package: Succeeded
NOTE: Running task 3120 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb:do_packagedata)
NOTE: recipe gcr-3.40.0-r0: task do_install: Succeeded
NOTE: Running task 3121 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_populate_sysroot)
NOTE: Running task 3122 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_package)
NOTE: recipe libhandy-1.5.0-r0: task do_packagedata: Started
NOTE: recipe gcr-3.40.0-r0: task do_populate_sysroot: Started
NOTE: recipe gcr-3.40.0-r0: task do_package: Started
NOTE: recipe libhandy-1.5.0-r0: task do_packagedata: Succeeded
NOTE: recipe gcr-3.40.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_package: Succeeded
NOTE: Running task 3123 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_packagedata)
NOTE: recipe libdazzle-3.44.0-r0: task do_packagedata: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_packagedata: Succeeded
NOTE: recipe gcr-3.40.0-r0: task do_package: Succeeded
NOTE: Running task 3124 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_packagedata)
NOTE: recipe gcr-3.40.0-r0: task do_packagedata: Started
NOTE: recipe gcr-3.40.0-r0: task do_packagedata: Succeeded
NOTE: recipe webkitgtk-2.36.0-r0: task do_configure: Succeeded
NOTE: Running task 3125 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_compile)
NOTE: recipe webkitgtk-2.36.0-r0: task do_compile: Started
Bitbake still alive (no events for 600s). Active tasks:
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_compile
Bitbake still alive (no events for 1200s). Active tasks:
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_compile
NOTE: recipe webkitgtk-2.36.0-r0: task do_compile: Succeeded
NOTE: Running task 3126 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_install)
NOTE: recipe webkitgtk-2.36.0-r0: task do_install: Started
NOTE: recipe webkitgtk-2.36.0-r0: task do_install: Succeeded
NOTE: Running task 3127 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_populate_sysroot)
NOTE: Running task 3128 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_package)
NOTE: recipe webkitgtk-2.36.0-r0: task do_populate_sysroot: Started
NOTE: recipe webkitgtk-2.36.0-r0: task do_package: Started
NOTE: recipe webkitgtk-2.36.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3129 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe epiphany-42.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe epiphany-42.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3130 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_configure)
NOTE: recipe epiphany-42.2-r0: task do_configure: Started
NOTE: recipe epiphany-42.2-r0: task do_configure: Succeeded
NOTE: Running task 3131 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_compile)
NOTE: recipe epiphany-42.2-r0: task do_compile: Started
NOTE: recipe epiphany-42.2-r0: task do_compile: Succeeded
NOTE: Running task 3132 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_install)
NOTE: recipe epiphany-42.2-r0: task do_install: Started
NOTE: recipe epiphany-42.2-r0: task do_install: Succeeded
NOTE: Running task 3133 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_populate_sysroot)
NOTE: recipe epiphany-42.2-r0: task do_populate_sysroot: Started
NOTE: recipe epiphany-42.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe webkitgtk-2.36.0-r0: task do_package: Succeeded
NOTE: Running task 3134 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb:do_packagedata)
NOTE: recipe webkitgtk-2.36.0-r0: task do_packagedata: Started
NOTE: recipe webkitgtk-2.36.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3135 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_package)
NOTE: recipe epiphany-42.2-r0: task do_package: Started
NOTE: recipe epiphany-42.2-r0: task do_package: Succeeded
NOTE: Running task 3136 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_packagedata)
NOTE: recipe epiphany-42.2-r0: task do_packagedata: Started
NOTE: recipe epiphany-42.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3137 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_package_write_rpm)
NOTE: Running task 3138 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_package_qa)
NOTE: recipe epiphany-42.2-r0: task do_package_write_rpm: Started
NOTE: recipe epiphany-42.2-r0: task do_package_qa: Started
NOTE: recipe epiphany-42.2-r0: task do_package_qa: Succeeded
NOTE: recipe epiphany-42.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3139 of 3139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_42.2.bb:do_build)
NOTE: Tasks Summary: Attempted 3139 tasks of which 2595 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: vala-0.56.0-r0 do_packagedata_setscene: QA Issue: Package version for package vala-src went backwards which would break package feeds (from 0:0.56.1-r0 to 0:0.56.0-r0) [version-going-backwards]
ERROR: vala-0.56.0-r0 do_packagedata_setscene: QA Issue: Package version for package vala-dbg went backwards which would break package feeds (from 0:0.56.1-r0 to 0:0.56.0-r0) [version-going-backwards]
ERROR: vala-0.56.0-r0 do_packagedata_setscene: QA Issue: Package version for package vala-staticdev went backwards which would break package feeds (from 0:0.56.1-r0 to 0:0.56.0-r0) [version-going-backwards]
ERROR: vala-0.56.0-r0 do_packagedata_setscene: QA Issue: Package version for package vala-dev went backwards which would break package feeds (from 0:0.56.1-r0 to 0:0.56.0-r0) [version-going-backwards]
ERROR: vala-0.56.0-r0 do_packagedata_setscene: QA Issue: Package version for package vala-doc went backwards which would break package feeds (from 0:0.56.1-r0 to 0:0.56.0-r0) [version-going-backwards]
ERROR: vala-0.56.0-r0 do_packagedata_setscene: QA Issue: Package version for package vala-locale went backwards which would break package feeds (from 0:0.56.1-r0 to 0:0.56.0-r0) [version-going-backwards]
ERROR: vala-0.56.0-r0 do_packagedata_setscene: QA Issue: Package version for package vala went backwards which would break package feeds (from 0:0.56.1-r0 to 0:0.56.0-r0) [version-going-backwards]
ERROR: vala-0.56.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3111540461775897567==--

